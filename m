Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2135.outbound.protection.outlook.com [40.107.102.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8019A202F67;
	Fri, 11 Apr 2025 07:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357658; cv=fail; b=qMEbTUZEvjSMtEGZ8aWuCmfKWDAOMlP+sdLr5/t198FLg8znaqQVmwd1KqRLktLBovO9pBlbNmGE+oBsj81v6uh9dagnWELRcUg5cckxFIqClGORhtVlvbiPVeezlzIf1TgiBBA62kxj+1YXJs/9Dvot0C3AFq2oUVq7VVGoVZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357658; c=relaxed/simple;
	bh=xJ6+9sSrp1P0VAx1EBAVvLDYNJA84UFHeAKcf3fm5FA=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=DhkYLQVePw4eLsqqPU1Pr/OfTc2N9qSU3a6KSdO974y8bp2Mx0n22bBjATpCi8+0v/KYlmBxwoWqP9+LsP9duKq1qK4X7+w7aLWb2PgW/Qyc3RfyQyaWD7lESqdwsrKo4o210VvQwszhUrbff5oP+Kqqvn3PgOgDXE20WbDJ2Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=kRrztl+P; arc=fail smtp.client-ip=40.107.102.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="kRrztl+P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyicsA/a5YFss3/wROzNd7csipzCB/LARMHacouyKK8eIc2HyqwMB18kov+982PNHzDQ0RvmkgMNtbk2TsYahsx8Wy+FHKkdNUNmZ3bSlnuynn8i0DiK3uS4gIyNgch0SGVdEoLTWnq3TpXChQCHysrkfBk5gT3cykbq45sBdSXtM8C3TCl+WUEeoBAvQAMhkamykUwIuXNKWNNYO4NUWfDZUQHbMLin4pdxIvDHj6rrpq7w790NqUKZlKYQww+1SahcUinzZtkRf/E51afEdK9ioahiuAhP/LFvYQp8nm8T91G6YAzGotKebr95gcP9rhIUhFLAnxLQMi8h8Qpo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjD1OO33htcyIy56P1hWEUievqSJG7gvD9llgkhJ/vw=;
 b=bMZw8BwGSHCPOFUoKU9l1JDrt0HAhmk2D34rptfcPNVKwuUs4n3AZe0TFoJVzn5nSILoKsNJaXifvTpGPfpwaEjSQ3gaTKinI0zNPL0dlBNEqFeo0HUTQgNCQRJLlntIRhwzUJ7M1mdO06YQCwQEnn6U4NmaPAuwsSOFVJAlFbUmSqPj9nT5ztPahz/Cb8gXuER7v/nvgM3FfK+JGmvAS3ek5NSodf1YzbIIlg7EwN8DCpXmHn/pr1fUfZAQsl4GsE8nmuJGP+QR5H/lw211dBjFRvQBrE2Z8lroWI6JLtbrJnJh1YfcTV3ZH8eXmpKPnsOU35L1lrnkMmQqsz0qEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjD1OO33htcyIy56P1hWEUievqSJG7gvD9llgkhJ/vw=;
 b=kRrztl+PJkWk+LcVvkdBKbx1/OWMLu2NKX17zZTESTsHtnMYGg7ZxtFt0DcRftPC/PSgc9TMhLubZjO9k92y5kZ77hvX0rbCq+8aHGCEfYlg8HDBNgUGsCNLLjhx5vuaBimq0KC55uhmXT1rkUM/zft3GQHa95VBEjE0NZN7LG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from PH0PR14MB4360.namprd14.prod.outlook.com (2603:10b6:510:26::18)
 by MN2PR14MB4191.namprd14.prod.outlook.com (2603:10b6:208:19a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 07:47:32 +0000
Received: from PH0PR14MB4360.namprd14.prod.outlook.com
 ([fe80::f91d:52ba:8284:3e02]) by PH0PR14MB4360.namprd14.prod.outlook.com
 ([fe80::f91d:52ba:8284:3e02%6]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 07:47:32 +0000
From: Chance Yang <chance.yang@kneron.us>
Date: Fri, 11 Apr 2025 15:47:08 +0800
Subject: [PATCH v2] usb: common: usb-conn-gpio: use a unique name for usb
 connector device
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-work-next-v2-1-40beb82df5a9@kneron.us>
X-B4-Tracking: v=1; b=H4sIAPvI+GcC/23Myw6CMBCF4Vchs7aGKZeCK9/DsNB2kIakJVOsG
 NJ3t7J2+Z+cfDsEYksBLsUOTNEG610OeSpAT3f3JGFNbpClbMoaUbw9z8LRtgrToVKdMm01Ssj
 /hWm022HdhtyTDavnz0FH/K3/lIgCRV/p+tE3RK3G6+yIvTu/AgwppS8MEK52ogAAAA==
X-Change-ID: 20250411-work-next-d817787d63f2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 morgan.chang@kneron.us, Chance Yang <chance.yang@kneron.us>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3075; i=chance.yang@kneron.us;
 h=from:subject:message-id; bh=xJ6+9sSrp1P0VAx1EBAVvLDYNJA84UFHeAKcf3fm5FA=;
 b=owGbwMvMwCVmsuR+7eedxj8YT6slMaT/OCn48JjTtXwLY+sEuTq1N3d1vprZ7+AwC2bkMsy4t
 upIwe+kjlIWBjEuBlkxRZbP2Ur7vVua59260rMfZg4rE8gQBi5OAZiIeCDD/4LERT3ukTMXbzs/
 902LRMfGSkVJo923Hy0u++lWamDcIsPwV8KllP+M/LSZGTPz94SZHWCJna6xdve8u2oqZ0/bLFu
 nzgwA
X-Developer-Key: i=chance.yang@kneron.us; a=openpgp;
 fpr=F36B22BF4B84839EDAD48CBF34A4DF7DF3B933F8
X-ClientProxiedBy: TP0P295CA0006.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::6)
 To PH0PR14MB4360.namprd14.prod.outlook.com (2603:10b6:510:26::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR14MB4360:EE_|MN2PR14MB4191:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b031bb-c6de-4992-74e0-08dd78cd1e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|80162021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkUxcmhldFBsVXBIZGxzQW4ra2xoWDFGMitJdVZvUnU5MGpWQ3JjN3JzNUhw?=
 =?utf-8?B?bnEyT0wvc3NobWZ0ZklqdWM5K1JGbnNyZXN2U2ZKVE5GZXBTVWdiK0xUQ1da?=
 =?utf-8?B?blFqOGJyalFOdTUrblNxblZxSmVqUEIwY01zVm5ydUFPTExaRCtOUFo0RHQ1?=
 =?utf-8?B?ZTJaaTNBdExhRFhhL2VTWExWNWxlZzgrM0F6NEFLbEp2NGg4VU1GZGpUZkNI?=
 =?utf-8?B?SHhKVFlPNFg2TTdvajJoSGRteXBXWjU0c0tZVG9PMXBQU0JZaUdraHJwUEQw?=
 =?utf-8?B?aWowaWk3bmhkL3J1eTBJcE9XMWlkUlBubjZ6dy9FL3pFOWMycEg3OEk1TkFH?=
 =?utf-8?B?ZXRZUXJZdGh5S21hTEtPeDdnWjdTMWc5NVVOY2V0ZlM5UGZlVkt0bFhmem51?=
 =?utf-8?B?M0hSTXdGbVh4MUxPZkkvcW9KbDNMK3BoWTkzU0YwRmtPb1pTS0hYaHVNcWo0?=
 =?utf-8?B?VG5MdHkzUnFkOG84UTVvK3FxQi9tWitta0hqNXp0bWJsZUxJejdZKzVFbzJM?=
 =?utf-8?B?Y2NqVUlpZGxJZVNRVUZJKzQ0ZW1mTTBYU0M1QmtsTlZ6djhjS3hIVitGeDJq?=
 =?utf-8?B?d3NidTZBQUg3MStZOWdrRzFMSUEyWVpEVGFoZWxlUm9xZlFzWEpxR1dMdHVE?=
 =?utf-8?B?Z2xaQm12c1N6bmZHL3AyZDZlTlVrdGlGblQ0N2lqNVBndEozcCtjd1BzMEpE?=
 =?utf-8?B?UWFUb3JXdjVCUU42bUNIWGpCM21mUS9lMzRQR0REMWFrR3NkMWpZcCs4U3Fs?=
 =?utf-8?B?WjFoeEZ6enBPOS9yNnFHNHdSdTFXZ2kzN2dENU55VWw1ZWJzbE1zN1ppV0dw?=
 =?utf-8?B?OTk4eEgxMHBZTnEzWWI5bm56eWM1TkhEMHJBTm9zaTBwODJlWEU4a2tUazVz?=
 =?utf-8?B?cWpTNTIxRlNnNkorejZzbmZLTTdzV1NDSU1xakNITEdKMUUzS1dGMVBDWXlW?=
 =?utf-8?B?QlEwZzhMd0VobWNhWEQ4WlBzZ3h1djIxTVZnYVl4QmhYQ0gzQXRYcHZhT2Qw?=
 =?utf-8?B?ZVk5WjVNSkJuM3BNcTVhQjc3a1ZTejhvUC9EbVRNaGd4bmdQQk5ZSVdTM1hI?=
 =?utf-8?B?TE5URGI2NUI2Q1k5aHg4Q0l6VzhmUnpKOUtlN3ZLTldiOHJ3TzZvZXZoaTZ0?=
 =?utf-8?B?bWpMUGd0WFhpUk1nQjVINGdEM3BUSTEzTjF6YjAwNG5JSFErTDdHOStiaGlP?=
 =?utf-8?B?YXdhK1l3b1duMjNxK1l1bGFUZHRtdDlvbmtHU0l1Q2l2Nnp2ZkRXWXRweDhu?=
 =?utf-8?B?YnhacFdYSWhDOEpjbzhYNDBiNzhEQlNmREpwTzI3VjZNdjNGWDJ3dEtWWXpm?=
 =?utf-8?B?RnorSnkzODN3dFhycHdwWWJvRUdKZlltRUcvTkVtTXZWR3NHNWpSOUE4MmR5?=
 =?utf-8?B?UVYrNDVVbHJORmRPS2IyZ1FncGZWLzJMYjExK0xqbkpsYStQRTJQOXRkT3pJ?=
 =?utf-8?B?bUl5azBMK3lBTFhIb29xcXVaalBETSttcGFWWTlVTCtnNGxwT2ZDUlpTanFE?=
 =?utf-8?B?ZU5wT204VjhBVnEzcm5NUWR2dkh1V3hWYnQwSk9VRkczcjFBSG1LZ2o4SzIx?=
 =?utf-8?B?SUdGNDQzZlBzR1I0WmxkV1U2RUhwTGdKVTJOZ0NSdW1MRzl2K3Z6MTZLNGl1?=
 =?utf-8?B?QXZ4NnVTZ0Z3YmdUWTNSa21nUjdkUlJ5a2w4MWdKajZKMkduSThicVhBcEkw?=
 =?utf-8?B?aHYxN01ockczTzl0azRSSUpzQlJva2NOUTNzMVdIMURWOGhtckRjUFBoWWhp?=
 =?utf-8?B?aThzR0pOVUpWU09GMlpPZmxaSnNQOWRqbnFiQnk4Rmh6Wk80ZWk2bVNXWnBE?=
 =?utf-8?B?QWhCZVlxQlhXVHczK28vREN0NWNWQTJVbEorMGRRZWRqZU1jYlU1VDZmV3RW?=
 =?utf-8?B?cEZFWStDTG5nZTNBZE9rdXh1OTBkUnpGZUNVNUR0WXlNQzVZSXRuRDRyU3RP?=
 =?utf-8?B?NUxOUU1Zdy9SL3NSbXlFVC9jVG94RVBvTTdZdS9Ma3NHckJ4cm9YbG82SHNn?=
 =?utf-8?B?cnl4S3VMT0prQ1FPZGEzTUNzT3IraDJyZ0RkQUNObE83Z3FtbnhyMGo0RHp3?=
 =?utf-8?Q?pLQv8X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR14MB4360.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(80162021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU93U2NXNnY1dndxU2p6ZjRZSUFDc0dENThUZkRhbHNpQm1RVWVwYVVsWXRR?=
 =?utf-8?B?ajhEQ1pqZHhtT1RwV0s1OEhEaHFncTlrZW9qQ0FPbHlvcEJvRHNHK0dOOGF2?=
 =?utf-8?B?WXNreTc3UnpXR25wZlZ2NGZJa1pVTllhdVgxcys0NDBlL2w4WVJPbWZkMDNJ?=
 =?utf-8?B?TC81OGU4K3AxaWlCRzZPR2RSaW1uZTBlbmlyR3M3aEx5QVVEeWxJaStNYVBT?=
 =?utf-8?B?ZnhTYlpoS0YwYXhvSWNOVTBrK0ZELzgyK3BqV2dqY1Q4T3ZjTjQ5RHlteTJw?=
 =?utf-8?B?N0ZHWUZxM2kzbGVLS2cxTElCNzE5Qy9Cb09SaFBPS3B1OHRjakYwSk04QUlL?=
 =?utf-8?B?dGxxdUpuVURmQ3k0cHAvNndXSEtIVVhuOG4rWHJQRWZTbTg0WkJWcFBtWDZZ?=
 =?utf-8?B?cHl6UHZ2S2ozYXc5SjI3czBEdzhZMXEvZWtXUnhoTUFSMEZLNkZlUWw2Tktp?=
 =?utf-8?B?ZnlHaGRRNms5NDY1Z2lZazdrQVFtSWxYam5GNEdTUE5JMCtSaUZ0aDJVSUcz?=
 =?utf-8?B?ZUdVcitwODJpZVJoNnNEa2tOL3UxQ1g3cG0yS1NvbEZib3dCcUN0MWZZOWhP?=
 =?utf-8?B?cHQzL1dZb0J5VE9ubVVpSjVhdlZXNUNuTnVNaEpiTkpKOFg0MDRsRGhQWlVw?=
 =?utf-8?B?U1pZRld0cHlteDNJYzJnL2x2ZEl1d2x5OW1rQ2JMRWhiMndxeUk4MEZZWGdr?=
 =?utf-8?B?RFJoR3lCNTR2MjZKNkszTUtLYmxTQ3VPZXpVdHduZXJaTXdBNkZ6OW9xLzFG?=
 =?utf-8?B?MGYzOEl6MkJHa3VHZWxkTHpkY0lXbEFSRzRjNEJlS3lCZW1BbWdnb0ZaZWRT?=
 =?utf-8?B?ZVgrYlVjSHUvTGZsaVdmZmxIc2pxQ1VuUWNFejV1aEV5Y0U0VWsxZktVai9B?=
 =?utf-8?B?QTJpS3lwMnlxTVJLNWVZWUVTWGZXREdQNThIMG5BRWtwbVNzbTloZ2NuVUhh?=
 =?utf-8?B?ZlFCUTM1QWVEeGJQelVrVDRISytCNmQyTmMzOVhqNllrSDhnZHprYWFGUlBJ?=
 =?utf-8?B?enBxQkpKL2dYV3hwcHBGOFJteGtQaENFQmlIbFZKTGUxVUVBNjFxV1hHaTRO?=
 =?utf-8?B?RmVvTDR6dXVkTms5dStDM3F2TVBVWFFSUnYwV2ZBMm5kUzNNN3BuSWZVNXhs?=
 =?utf-8?B?bEVUUnpSS1FxMWlKSlorWHFlR2ZraFcyR0RKb3l0VFpkWGs0NEw5QUtrUXVm?=
 =?utf-8?B?N05mRnJpYmVMWnU3elZXQWp4bGpwWHRaWVM2eWRKQ1JJVTBkeW5PTWNlQ0FJ?=
 =?utf-8?B?U0l3QXZWd3M0dDl2WjUrUnhHTmcweTNCenByNTlTVURlemthSE5yYlBGdEpz?=
 =?utf-8?B?Znd2ZEtWM2kzc0hERmhGTkNSanUycTlBQWdhNnY1M2Z0T3ViNnZYakFSMkpY?=
 =?utf-8?B?RTlSd0dxRFRiN2dxWUViYmgzOXkxMHlBSkp1V3lubC9Yb1hDNXZNdkJJZ1lW?=
 =?utf-8?B?QjZ5NnVzd2RMZnRFM2Q5M3hhOENzNDVmcHNkSVBNQ2xJYVNIdWNZRThiOFBl?=
 =?utf-8?B?UDcxWW9jQklOZ1ppY28xZE1GUlV2YXJURGtnb3R0cndHZ1dKY3o0bk04ME9M?=
 =?utf-8?B?OWo5U3kxY2tlZVFabmh0RERoUXppQVFITHFWdmdpRFM1YVJtakNUTjg1SGdL?=
 =?utf-8?B?R05uRTdpRGtPZHN1Y1ZYWktJN0lxaHdXalVrazl1STBGeElCTzZaYzc3d3NX?=
 =?utf-8?B?bTU2c2p0ODU1T0c5eGdTT0dHVkNBeVNMUTdmT0diRFBMOGtLSDg2Nm16dTNH?=
 =?utf-8?B?cm9Xc1NXdCs4U3dURXRwSlF5Z2lzclUzYVdIYWdDSnlNV2s1eit0V2xNcWVj?=
 =?utf-8?B?VFZ6TEpZM1N0YW85NmMrYStLbmIzMUlqOGMwTy9xNGVZQTNKSzNuaUNsYUNP?=
 =?utf-8?B?TVNLVVdlSUc3QzVQd2J0Ly9VNDUyclhLVUJVWXE2ZUNkTmtXakxEQ2lHYTNo?=
 =?utf-8?B?NUVWOHhsdlBuYmJEakxyUktwMENqWkhLU1RYNktZRkxHQ2ZaT01qRlVtK3U4?=
 =?utf-8?B?Z2QrQVBLYyt2Zmd0YzJmWjl1WHd3NnZBVm12K2RiblloNytTRStHOFhibnFI?=
 =?utf-8?B?RGxFVGpLWXI1SUZKOTNDeDMxU2NSMjBHQkozbnJoQmdpNTI4allxOEZEVjNX?=
 =?utf-8?Q?UbZW5HCZ4w7MQXbf6m8fi0vk6?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b031bb-c6de-4992-74e0-08dd78cd1e12
X-MS-Exchange-CrossTenant-AuthSource: PH0PR14MB4360.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 07:47:32.6053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQXBBrx/jgrKtvF2F8Um0ywnEof21YmB7zUEH0Qe4HN+JyIQz9TpOypqQaJHLfR5fDU3TK9ifM8eLs/hVfoS7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR14MB4191

The current implementation of the usb-conn-gpio driver uses a fixed
"usb-charger" name for all USB connector devices. This causes conflicts
in the power supply subsystem when multiple USB connectors are present,
as duplicate names are not allowed.

Use IDA to manage unique IDs for naming usb connectors (e.g.,
usb-charger-0, usb-charger-1).

Fixes: 880287910b189 ("usb: common: usb-conn-gpio: fix NULL pointer dereference of charger")
Signed-off-by: Chance Yang <chance.yang@kneron.us>
---
Changes in v2:
- Replaced atomic_t with IDA for unique ID management
- Link to v1: https://lore.kernel.org/r/20250411-work-next-v1-1-93c4b95ee6c1@kneron.us
---
 drivers/usb/common/usb-conn-gpio.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 1e36be2a28fd5ca5e1495b7923e4d3e25d7cedef..421c3af38e06975259f4a1792aa3b3708a192d59 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -21,6 +21,9 @@
 #include <linux/regulator/consumer.h>
 #include <linux/string_choices.h>
 #include <linux/usb/role.h>
+#include <linux/idr.h>
+
+static DEFINE_IDA(usb_conn_ida);
 
 #define USB_GPIO_DEB_MS		20	/* ms */
 #define USB_GPIO_DEB_US		((USB_GPIO_DEB_MS) * 1000)	/* us */
@@ -30,6 +33,7 @@
 
 struct usb_conn_info {
 	struct device *dev;
+	int conn_id; /* store the IDA-allocated ID */
 	struct usb_role_switch *role_sw;
 	enum usb_role last_role;
 	struct regulator *vbus;
@@ -161,7 +165,17 @@ static int usb_conn_psy_register(struct usb_conn_info *info)
 		.fwnode = dev_fwnode(dev),
 	};
 
-	desc->name = "usb-charger";
+	info->conn_id = ida_alloc(&usb_conn_ida, GFP_KERNEL);
+	if (info->conn_id < 0)
+		return info->conn_id;
+
+	desc->name = devm_kasprintf(dev, GFP_KERNEL, "usb-charger-%d",
+				    info->conn_id);
+	if (!desc->name) {
+		ida_free(&usb_conn_ida, info->conn_id);
+		return -ENOMEM;
+	}
+
 	desc->properties = usb_charger_properties;
 	desc->num_properties = ARRAY_SIZE(usb_charger_properties);
 	desc->get_property = usb_charger_get_property;
@@ -169,8 +183,10 @@ static int usb_conn_psy_register(struct usb_conn_info *info)
 	cfg.drv_data = info;
 
 	info->charger = devm_power_supply_register(dev, desc, &cfg);
-	if (IS_ERR(info->charger))
-		dev_err(dev, "Unable to register charger\n");
+	if (IS_ERR(info->charger)) {
+		dev_err(dev, "Unable to register charger %d\n", info->conn_id);
+		ida_free(&usb_conn_ida, info->conn_id);
+	}
 
 	return PTR_ERR_OR_ZERO(info->charger);
 }
@@ -278,6 +294,9 @@ static void usb_conn_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&info->dw_det);
 
+	if (info->charger)
+		ida_free(&usb_conn_ida, info->conn_id);
+
 	if (info->last_role == USB_ROLE_HOST && info->vbus)
 		regulator_disable(info->vbus);
 

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250411-work-next-d817787d63f2

Best regards,
-- 
Chance Yang <chance.yang@kneron.us>

