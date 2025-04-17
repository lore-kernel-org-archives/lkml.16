Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24911865FA;
	Thu, 17 Apr 2025 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744921182; cv=fail; b=FlHq5p/HVUKeb5QLiLsY7QhpVPMKyymmH4hetelDejpO9RZ9zm5jjR4RcEipOCG8R3B/qtMQQ6PNhQC7PIKeF2Gz8KMrNOtdvuO5PG4O2iY8m4GKVeLp+kpom+FIzoMnu7dUutmqU8GE8uJrPUGvdfO8XAR5iKLnzgTEmgVSkAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744921182; c=relaxed/simple;
	bh=90uGuLwFB8+yNMxe5uVcUW1S+CPSnGAEQReXs/gu+fE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QZJ78B/bGEtAHx3nu45cOeaRQD/KfCuxzbGUJmbood3IipeEkvLwz8YVajnkPmoYUGKecA+crZhilbnJDSnq30ONi57auZhhPuBNG92PoXhxzNtyc3oQSp4expQKDAw/KsmevZiJcNezP9/qT7bdPO9CaKC9oG3tXPz706UQO84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C8eHAY7t; arc=fail smtp.client-ip=40.107.244.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C8eHAY7t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaVoUOXj4HsEJx6DOnOC0Ww5nfZ8DeU35nvD1QAd65Fn1k5TgfOdjcBJ1zK5DgAL4yu8DAQ164KLzhafHNE7weXOu8ffoX0/UtQd10YuxbIAKNZiQcjyhxvrjZ/39mF1qo5KwjGwR6JGef/0z/Vk3hlbx2L7+JZJIBHjRdKKApyYO1icnuan3RXXFaNEKjiMoi46saIcYxfU6TML6of1jFGCCVBkcUdub5ejsMVrnVySp0i4b/YjS4Iq2COsFBugBSQHgU5QWdiS6yAJy7fKvNSgnG/aE/Stbnp3z6uiTfLGx0KhhyZyRUBlY0dL6Sl5rj/mrR6jS0s7bl3ttvLHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hsAKHxsqPc/R3X+o7NAk/TLd0DTBZJewag4ICXeqK8=;
 b=JSi4ZSKCiB1uSSLb6pq1DZMzFrH/ocFwj7xi79ocI4WnkthLq1HBW2c8Y4ws0OtVatLdOibMRiCCRBKawi+FXE9u0W+GaOXn62up8xFzij77KgHqeOZ+YGFcpGkYsesurX86cLT6OhPU+sVZbnfTgbDN/1TSQWFIfbKCuQgkvycJfOCN18c0g5AVd66+8nN8HTU0ZWUTshJ2QkTu26Qsz1AdGsfsVov9L0cEXrFGcFW/G3sM7KcFYx8bjLjckJBKQoq3MPF9pvbNVbXCKWiLY3Snij8wDonwXXW+I14w47BuxSurDdZZPtb9Rv3sgUuSZXhVXoArcN3qyia0GpO/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hsAKHxsqPc/R3X+o7NAk/TLd0DTBZJewag4ICXeqK8=;
 b=C8eHAY7t5QOof/akreo5aDh4MPe7okb0d/lDrS3NGubiF0hPy7RToriXrBUYKQyYzvf5ag8q8rCJhM59ywnA7/GvCZ0SnqjBw07l98TTQu5iyI6LmRCWRtvTO5A4BCapBlQhMTI2YgzyV6dxVsbk6sir+DJHGY37HYtq+1WmdT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 20:19:38 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 20:19:38 +0000
Message-ID: <f761af28-8ce4-4f82-847a-844974116169@amd.com>
Date: Thu, 17 Apr 2025 15:19:34 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 20/26] x86/resctrl: Provide interface to update the
 event configurations
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <d18beb9ca31eb013405677792377542e609ea693.1743725907.git.babu.moger@amd.com>
 <7be35258-f913-4111-b5da-c4173615cf18@intel.com>
 <7423145d-7de7-4414-85be-b7325c01b437@amd.com>
 <fda6c46d-c01c-494f-a2ba-efbcb1f331b4@intel.com>
 <c3c54172-087e-4a53-bd66-7849402f4a55@amd.com>
 <2aff0d11-91c1-4a3e-92e0-0ae49c804549@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <2aff0d11-91c1-4a3e-92e0-0ae49c804549@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:805:de::20) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4b11ab-8751-4562-cd5b-08dd7ded2dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1ZuQkMvVGpyemoxdTFBekgxL0U3SWY3SVAvZFVCWWRZNjVtQm9CTHpKUTNi?=
 =?utf-8?B?TGZGbnEweTM3MWtnZG1rV0pjenAxMHErQ2Z0ZHVYNW4wd1hsd2MzaXo2MTYr?=
 =?utf-8?B?L2RmcUxHazBNcFpkblhZYzZjMUo3RTI1cGd1eDd2SkdxbkxnTUEwNjZzRWh6?=
 =?utf-8?B?eHFSbCtZUzlWd2xYOHZkZDliNnU0V09RTWwrcGpFbjVnWTV3c2tOTkZYTDZW?=
 =?utf-8?B?bXJ6MUtXMmpud2lLWGJEVTFEOWJWMnVESmt6Y0VOQnBVNytaWDV0TE16SjIv?=
 =?utf-8?B?Y0tQMjNOZEZDNmJHMnFHRXBBSjBmL0Zzd1luVFM0UG01NnBRK2UyWWNyWE5N?=
 =?utf-8?B?a3MvcjAvVU5FcnFMRWgyNm1tQVRwTkdOZVE3a21tZTB3aERNTVhSU1o2eXNS?=
 =?utf-8?B?R2FmOC82MkQxV0NmVzBBL1BsdnVaQlE4WU92ZWt5bVhYZXVOdnNlQlY5Lzl0?=
 =?utf-8?B?QmlmTk12Z2V5WE9yWXdXR1MyazJTUHd2cTNIWTR5Z3RLYlRlU0J2K2d6RjdU?=
 =?utf-8?B?anJoZC9ldUJvTjNyWEkyTEtIMnpKK21CN2JZYWhBaHFZVmJZUm9CSGdhY3lH?=
 =?utf-8?B?RFFTekxjUXhxb2UzeTFUeHMreE1oWnMwa3NXVEpzV2dxbnd3cHJIR2R6a1Bi?=
 =?utf-8?B?blRWRDdqTUdWMWZUdnljMkVNZDFwNVJIZVlrUzR5SktVazlHWTV0bDU3d0Jm?=
 =?utf-8?B?aGQyMXNKaVdtZkRuK1U2Z0hGT3VNcjVmUDA3TnNkYWZCblJQQWFGakFtRTR0?=
 =?utf-8?B?MVZNU0dDb0MrR1BPWXVaRytyV1hXQmF5MmFFWnVRYUFhVGJ0M0dBVDF2UEp2?=
 =?utf-8?B?TWpmUzZLR2M5VXZEMitnZ3o4eXNhMElmM0Y0WDhxZ2t0ZlZ4OGd0aGhaSTM0?=
 =?utf-8?B?WTYvWEp3T1gvZk5aa2hwaVQ2U0dGLzgyRkRWZU1sZWNVY05pZTRLWlA3b3FJ?=
 =?utf-8?B?cHBHdlNvWFVQUDVqbXk2dm4wOWl2TzJjY3dSYkpGZ2RacDhKN2l3amZrbjFJ?=
 =?utf-8?B?RGxYaDlnTFJWZnFPZm01bVZMaXlCUFFYMXp6bjZldVlMU0hHSHlSZ2cwM1c3?=
 =?utf-8?B?Z20xVDFBY25BU1RsN2FaSHlyRWdQYUVDQ2JPcVBoS2RXSUc5S2xFQ0QrTUp1?=
 =?utf-8?B?Uk5iMG5OejBXMW1jQ2xQM0lheXIwdWRYdm51OGg5SHpVNGw4Nkw5Q2V0OVVD?=
 =?utf-8?B?VWRhREJJZU4yZ3BBUkozVUlhOXZ3WlcyODJoOG83L0NyeG1Mb2xXK2k1bWt5?=
 =?utf-8?B?WnB6NXRwdDBkNG81bTFVbmRXOG11RmFNNzlhY2pXd0ZxN1RSWUljS054ellu?=
 =?utf-8?B?Yjc4QjlZYm5MYWE2UWJPK1lFcjVFdktEVXY1clFUd1JlRnhvY0MvL2tudFd1?=
 =?utf-8?B?YlQ1Zkd6YUgwdmtrSUhXZ083RlhUVGJSSUJxTHlkMWVuV2IwNk1vanM3WDhn?=
 =?utf-8?B?eGlzK2I1WkdhalIxazVWUGp1Tk5RQ1g5OXd3dG9JZCtZSDZPMEZWTEthaU96?=
 =?utf-8?B?REQrL3VEU2JzMEZCZU0xeUltd3pRdVRUUGpvOXNZSG5qSzdFb0w3WjlPM2hk?=
 =?utf-8?B?Z1V5Y2d2MWZ2MnY0SEdXaS9CMUFyR1VybnpUWTVMRUUyditqVGthNTJreWlr?=
 =?utf-8?B?eHhYNWpYc0Z0QlFYdXVnM202OHFLVDNERTRLbzd3TDNKSGFQN29mTHIwSkxT?=
 =?utf-8?B?OXVtYXNqQ3N5eGc1eUpEbWZkZ28zMlAxUmJqM1k2Vm9MeVRYZU54MmxPcUo0?=
 =?utf-8?B?SktZdkUvSTh4bHdyTkdDZThKZFNjUHdqVGdQeWJTUGk2bm1QU2haTFU5VzNu?=
 =?utf-8?B?SGJKUmpEWFVGOG5sQTZHK3V3UTlxeXBQYUptN3JSMFZWNy9naEFXSFBSd3Iy?=
 =?utf-8?B?RFo5L1IwN2FFSDlmdEZIZ2x2QTVJY3RGR1N3bnVZUStzUGtKdS9iUEJjR09p?=
 =?utf-8?Q?z5AVER3T47k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlRFclB6ZWJETmhIUjVsSXU0d2NjV212WWZ0N09aSTRVaS8wK2JQOEd1akx0?=
 =?utf-8?B?cGg0dW43YkVmR2ZXZUt1endRTFR1cEExOVc5djlKRVZ1SG53WXVTTnZqZzNs?=
 =?utf-8?B?UEx5c28xTnQ5R0ZINENReEs3cUQ4TDlrRlNNVjJiczVrVFl4U0NVQ2ZTSFhi?=
 =?utf-8?B?UnFTV2RjcmtFR0toVmk5MndqaVd3Z1czanRvSUZaQWRrTlZUTFNTeE5yb3BM?=
 =?utf-8?B?OHgwaHpuTHV6dm95K2V5SnNSbS9Rd2E1VUVtWC9FSUI1ZzR6dkd1RVg1SE1h?=
 =?utf-8?B?Y21OcTh3VmFUUjJ1YU5BVWVSbzFnYjdSbktTYy9zTm5pWEN5dTZacjc4SE45?=
 =?utf-8?B?UlA1bkdReFpEL1RiUXJPS2tlWXFPWm4vL3QrVGI5K1pqWjFOTlAyVVdHQ2cv?=
 =?utf-8?B?ZS9UNkxPeTZhUlk3OVFYRHJsdkpvOTI1VG53OXhqWkExR3JZc2dHQVJTeGlX?=
 =?utf-8?B?R1dPM2xDVitDTGJ0dEtrWTh3SFUxT3BPc1FRQmVmV0d6V1BxLzd1ZEtsYy9O?=
 =?utf-8?B?VDgvTXJsRUNveHQxeHdKQ0RNcEZlUlVUd09tYlpUbHVtNlhuZWpJWVFOa3Ni?=
 =?utf-8?B?WForaHpibm9DbTRiS09RYlA1V29OSmJXcW5HR1VqOTBEa3hRQjhIRTFDRjRE?=
 =?utf-8?B?L2o3WVByUHl6dTdQSUZHeDlrNktNVWgrYytOMnNPdW4wbDJFbERuU3ZuYU9v?=
 =?utf-8?B?SjZxaytONUcwaGxNMllGUnd5MEdrNnl0RVN0dHhacGdkZHNsY3VITXR3alF3?=
 =?utf-8?B?R3NqcUZaU3BURHM5U0xjRFg1N1dnVFBkcXY4Ri9BOGlCbFkyNVdONElLUkEx?=
 =?utf-8?B?MHk2VzhmL25lWU1zbEhUMWtkdDJ2RGszdU9adks2Yk5iSnN0NmtkZDkyREpJ?=
 =?utf-8?B?VzZjRVllVlN5YW5iK3ZEWE0vVDFIYk1MeE1DY2NzaVJuc3VNTG1jSWhtbzl1?=
 =?utf-8?B?S1VsSU5lWnRoYlNMVFZIQlAxdlFoUjBLK0hkNnY0QkJPS1BFQ1FXUU03Rkkz?=
 =?utf-8?B?MHJPRktMRzlFR0d2WU5JZnVGUG9aTHZGUmsxRTBoQUtMN3B2VnRMSVc4Tkpp?=
 =?utf-8?B?cFFkQUpsMVVhZ1N3eDNNK1ZpTGNJUWxKWmVnRmlyWlROd2JGR3lMWW1yT2Fq?=
 =?utf-8?B?aTdkeGxlK3hxNy93VDJtTk9pcG9WQXF6VHRvMEg0TnVwaE9RTDZDbHhVUmdD?=
 =?utf-8?B?T0Z6SnRrUmdMV2FlOXA4OTI5L1lPVlFrSlJRS25hSWIzYW1kWUlEakwxTWZw?=
 =?utf-8?B?SFpCdHhwcU9pZWtWNW9SOWh6a2JUelJ1eUFXV3pFTjlBeU9xZWNYNWNmd2N3?=
 =?utf-8?B?d05DN21nZncvelhHNXFKcDNFV2w5Yjd5emRFeExWUlpnVGxUbHBpUmFhaE1r?=
 =?utf-8?B?K1A5QkZxZk9vaEZJYm9wbU44ZmZUd1pqOUEvWlcwN3hZQ2lrRjJXTDJHcEkz?=
 =?utf-8?B?Ukk0MGxOWVJURFFwcWVvT3krVmxHcGlBUGdRNVliU2twbE5MYW1NMkMyaGti?=
 =?utf-8?B?UmlXY0ZUVzYwTWNKRmhvbkxCK2RnYnhpSjJiVC9MR3Q0WDF0aVRLTVF3WHp6?=
 =?utf-8?B?RXhKNGtmOTFxSE16aXI4RmhjSWZBUkNOS2RNOXJVaWNwbVRmMEVoRGt1Ym90?=
 =?utf-8?B?OTNTNk9Xek9tWG1nTkFWQlA5a0RMenlGZmU5TW0zZ2xqRGFwWVhYbU1TMi9k?=
 =?utf-8?B?SXhjU21vS2cyU0RZWTZrVjErdmkyOVFZeVIrcUJLbGhUdEVoaERMS2c2VEZD?=
 =?utf-8?B?RitlZjdhUHM1TEQ4bHl2MUU1SlhVSXV5MHJCcFh4cHhIcjZtQWluSEg1SExW?=
 =?utf-8?B?Rk5jNEpsRGdMajMyQ255WE4rQUx1TlZCQSswSjVXeVJLQmMxZ2hRV2p4M0NV?=
 =?utf-8?B?MTVHYmk4TFNna2ZHR1JLRWtSZ1E2NC9mNVdtK0VGdHEwbkdaUjVvdDRRTTRh?=
 =?utf-8?B?T01iS2syNFdKOFV2RTA5dXZmZzg0Y3ZFdnVmWkI2bStFUGlCNHgrRWRNU3Jy?=
 =?utf-8?B?ekYzUWRhQTdKbXd5ZzlrQTRSRllGV3c3NEtoNEtUanFtb09VRTNoK05JQTZr?=
 =?utf-8?B?ZmNjUFd6R1ZsbEdoQ2kvODI5Mjd4M1I0eUs4ZzhUdUZzTDhxL2psekZFTWhE?=
 =?utf-8?Q?SL5o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4b11ab-8751-4562-cd5b-08dd7ded2dc8
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 20:19:38.7332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLFwMyhuv/m9280rjf7sEGBSxogz8iVfEq+lmIRxxzPOj12u6PKfTAZUlhgeaRXk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415

Hi Reinette,

On 4/17/25 10:09, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/17/25 7:34 AM, Moger, Babu wrote:
>> On 4/16/25 13:52, Reinette Chatre wrote:
>>>
>>> Below is a start of trying to address this but I think more refinement is needed (other
>>> possible terms for "transactions" could perhaps be "data sources"? ... what do you think?):
>>>
>>> 	"The read/write event_filter file contains the configuration of the event
>>> 	 that reflects which transactions(?) are being counted by it."
>>>
>>
>> How about?
>>
>> "The read/write event_filter file contains the configuration of the event
>> that reflects which memory transactions are being counted by it."
>>
> 
> Looks good to me. Perhaps "being" can be dropped? Thank you.
> 

Sure.

-- 
Thanks
Babu Moger
