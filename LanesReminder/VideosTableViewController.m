//
//  VideosTableViewController.m
//  LanesReminder
//
//  Created by Sanjeev_Bharti on 5/4/16.
//  Copyright © 2016 Sanjeev_Bharti. All rights reserved.
//

#import "VideosTableViewController.h"
#import "VideoTableViewCell.h"
#import "CoreDataManager.h"
#import "DateManager.h"

#import "Recording.h"


@interface VideosTableViewController ()

@end

@implementation VideosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // change the back button to cancel and add an event handler
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(handleBack:)];
    
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)handleBack:(id)sender {
    // pop to root view controller
    if (self.CompletionHandler) {
        self.CompletionHandler();
    }
    [self.navigationController popToRootViewControllerAnimated:NO];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:NO];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[CoreDataManager sharedManager] returnListOfRecordings] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[VideoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    }
    
    Recording *currentRecording = [[[CoreDataManager sharedManager] returnListOfRecordings] objectAtIndex:indexPath.row];
    cell.lblVideoName.text = currentRecording.name;
    cell.lblVideoSize.text = [NSString stringWithFormat:@"%@ MB",currentRecording.size];
    cell.lblVideoDuration.text = [NSString stringWithFormat:@"%@ Min",currentRecording.duration];
    
    cell.lblVideoCreated.text = [DateManager longDateTimeStringFromDate:currentRecording.dateCreated];
    cell.lblVideoModified.text = [DateManager longDateTimeStringFromDate:currentRecording.dateModified];

    cell.imgViewVideoThumnail.image = [UIImage imageWithData:currentRecording.recordedData];
    
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
