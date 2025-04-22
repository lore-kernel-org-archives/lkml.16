Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6E720103A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321345; cv=fail; b=aD4NmxrgDYyxxlPDMIm1uByrTfuBvb+WFPv++6FQZZMtvyfbWT66expYijmR/efhRa3BWd9r+QbzRSiezoiXXnSJfK4+CyHake+mKshH7v/Qll2zK0fm1sijTxn6m4XfpKB7KTmKuULtJ3tdgrVhUDslWfC8+gQaVS6WrK4yfg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321345; c=relaxed/simple;
	bh=oRwt3ErNoXRuB8y3IrZdm/iWTd60G5sWu1lCDLzlrsw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j+keOtnMZn/2YVHYBQd4LYS2+7LBe6uXgRCAb90v95XOP8di4FGi17pr2Gf2XbgwA+yfefUH3aN14OtT+LJKjoDvGKc0WCVdWVY5dZaJtqSAG7praA2rgultu7A3gzQX2k8lGw7FJrPNAW2AkVrSwm7oHwqaIbf6n7Dv8Wpqa5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b1lYm3cw; arc=fail smtp.client-ip=40.107.223.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b1lYm3cw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBNULV/ld6xup0WBahETC/36CjB1Uqg/6QS/qvnGKV1NJsGoGt9n7xgRDnWdezl0Sj0ZnP0x11XOp+J/1VbO5Gc4bYFFGwijxJ1xQYhv+crOk5muPMEg0Rp5GhP82Zu472Zdb2vYIucb7hEBkLUqoEszKWhZyGf52QHzcoN/TkJDkY29IC7EMDBBbMYGM8eEqXASGaG1wCDi04i6cccxdBzEC7LE1gvFtA7ZLhn1dDYMp431eMWf1rrA6/dbVbk4PjC/IIVV+tzTa9IO5/sZUzxrlXL9q7Sf5h1uG0oPHW1bZzqt3TkrRmKsRGbJbPVgweLZa5mUGNJv0RAhNcK9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCH5QZR33B9a8a+VrlDF3zcVZHlnc5LUXgSrEskeh4k=;
 b=lgI8RwwXupov+Op12TmTkqDA14ctRhtn3k380ChWwvOwlb8zZnSBLemUaJMrtcJvZFG+G4G6pLQtd1UnlQcHzQdnR52bFUi27My3F35w2prvNFQx9ANs0Sw5C4DFMKU+Z74zn5L2BgIqtRKXP5nfAC1teKz1G3qa+xScztSZfTyDQh3UUOzxi3qJDClI5jVMv0HmUXVUAOglzVsR/mmmPY/lVEs9nUnDv3q661kEL4Wyomsl0wxpfuCH6BJfnjf7yziq446sBDmeoDEOE/eVi5KCQtDGStN6R9cDn5KmsrKF9rGvpnJqf0o8wNHz2RradVPDTMDIC2Tl2yQd0p2FIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCH5QZR33B9a8a+VrlDF3zcVZHlnc5LUXgSrEskeh4k=;
 b=b1lYm3cwgpuIoB26SK5FZaWMLSpBorKPK2t9rlP2JvcBPCPJypXQicx2Y18hs12fdvNMEjeJPAbiaFyHIx03OHPY9qV5NidLZZo+EKsrUE2fRwz/XwOLsGqhbvH58NVBB2TKUHyB+7Jkh4xPZPM6s6zPT6A+7j16poRSc2RHTBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 22 Apr
 2025 11:28:59 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%7]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 11:28:59 +0000
Message-ID: <03495e46-234a-4c0d-bec7-f7325789a160@amd.com>
Date: Tue, 22 Apr 2025 16:58:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] mm: export folio_expected_refs for JFS migration
 handler
To: David Hildenbrand <david@redhat.com>, shaggy@kernel.org,
 akpm@linux-foundation.org
Cc: willy@infradead.org, wangkefeng.wang@huawei.com, jane.chu@oracle.com,
 ziy@nvidia.com, donettom@linux.ibm.com, apopple@nvidia.com,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
References: <20250417060630.197278-1-shivankg@amd.com>
 <20250417060630.197278-2-shivankg@amd.com>
 <75dc1299-8a83-4ce8-a715-cf1a8d43e0f9@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <75dc1299-8a83-4ce8-a715-cf1a8d43e0f9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::34) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|BY5PR12MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d17b2d-5d8f-48f2-bea1-08dd8190dfc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODBQRk5Dc052TGExekVmUGxNYTdOYzEwMTBnbjQxTGNOeCthSmVPaHBaaHJG?=
 =?utf-8?B?RnZUbXVpOVlScElvZ3RLNTVQKzl1NEw1SUlEeGdlUGpPbm96a05sTklhMFFv?=
 =?utf-8?B?TlgydnBpaFc3TmtrMFhvbDZ6MmZkQmJlNm82NmhYRUFRbG1JcmhSQ1REY2FI?=
 =?utf-8?B?RkRPY2lrRTVDVDVBNjZGOXd4SEc5Wkdqc2NncHE5OFA2eGlyL0UzbjdRWC94?=
 =?utf-8?B?UW9KZWdaYTh2SHhDWVg5ZlJra0JDbjkwVjQ5eUNUdC9Ydlpqb1hnaTdzcDc2?=
 =?utf-8?B?Uk9DOUpGNGpPaVRueDNaaVJRNHN5a1F0TmN3MUoxeTlaaDUweCtZNnNxclU3?=
 =?utf-8?B?aTdINlVIRy84cUplNERJZlYzaWRIa3A3SlpxQk44M0FuT09XTVFBNVI3WTQy?=
 =?utf-8?B?MDBVV1BIbC9JMVlyTGhxR0Z1ZmFGNDA5cENwWCt4c0NMVDZPbWFpZlMwWUNQ?=
 =?utf-8?B?TkRRRmc5cTIzajRQVkxHcnd1OFlRdnQ0M3V4NVA2V0YvUzYrWnpjT0x0M3lL?=
 =?utf-8?B?RzFjbkNVcWx1cVdxb3FkZHM2UG5QQTJKNVRXcDFlZ1lEZ3JWQjhHR24weWNa?=
 =?utf-8?B?RTBJS2R3bG00ZnJHTmsvZkw1QXNtMFV1M25wVGtBcWJxV1NpYjlFVkp6SVNa?=
 =?utf-8?B?YVp4SFNyK3RtUit4TmlFcHkxdkFqSGo5UklPaGl4NStyK1VIaCtxQVFmYmtu?=
 =?utf-8?B?UnBrVEE3ZXdvOEFzb3BYU2lRcjdBbFFnVEJTenVMRkI4MlEzTENXOElkc0JX?=
 =?utf-8?B?ZE9VQmtFTmtraGhXUkVLcEViWlpwTVhMUjlvR2twZlBETzdZUklHZGcvL3Jh?=
 =?utf-8?B?VGoyYnE5Mmp0YjlWbXFBVE95akxtR3dNSHFIU2xQeU5GemtmTWphRExHL3lr?=
 =?utf-8?B?OUc0ZCsrVS91L0Fma1BCZmRQaGJyK0xOd0JuRzF1NnBPY0ZaQTd1QXZwdXhw?=
 =?utf-8?B?STZKU2RUczJpeFV0QnRmc0hod1VkY2hsaklUWVdBSllDWTk1REVxM1ZPNnk4?=
 =?utf-8?B?QUpyanlqdnh0bVY1aDVWS1JwNjBua2x0RlE1NTBMalFqN3YwVkduNzM2UEpO?=
 =?utf-8?B?QnBHbDhYRE9hRU93aFpGanVaZkxtbEJjcWFzak9WeWIvMCtoNDdyMlJEOS9q?=
 =?utf-8?B?VWdJdHQ3bGlxV2tJL21IeDNBaDRqWEM0OS81TUhqOVh2OW1hd215VGxudi9R?=
 =?utf-8?B?S3ZFekpBTUl3RG5xMHhiYnp2T0s4QVN4d2ZUQ243T1FXQ1lscTBwU1NiWENC?=
 =?utf-8?B?UWE4aWpMSUVFc0l0aHpsdmZkU0JWR0RvaGpUSEsybjVRS2N3d3N4ckEwZ3hW?=
 =?utf-8?B?Y1hUTW9BYk8wYUVOWmJ6Mm0rbGJLbVpIYWo5RGNkcXBsQ0RZVkpHWDRLV1lV?=
 =?utf-8?B?QmVrbTh6SWlVWkZBelBnMjdFZzREcnlPa0ZtUzRucThORG56SEpOSExWZVZ2?=
 =?utf-8?B?UEJEbWVtZHgvYXJ3WFBPclVsOU1qaWxWVXdTOGc0cXFNMkFRQnZjS0pyRi9z?=
 =?utf-8?B?MkFYeUszM3grNy93RHdpMHcxMDJhbk42NHVjd1JmMVVIUVBTSXRlWTY3dWhT?=
 =?utf-8?B?ZU56dlY3WFdhWGhVMi8zZVNwUVhHR1M3YmZSQkN0WVpSbStucVJQOEduSDdI?=
 =?utf-8?B?YWNEdFZBeE9CcURqVk9HREdTcDRSN00vV1NuN3FqanRwbDJGZThFUmV5SFdS?=
 =?utf-8?B?ZE1TWnFhV1FwUnhJMjhESnJ1TGdvUitmVldCSkw1aDc3RkRMSW16WlAxOVFF?=
 =?utf-8?B?bEhGWHZUOVN6QmJaSVRMZTJsblBsYUM4YUZIb0xBOUtZMDlVUngzQ2ZXR1Zl?=
 =?utf-8?B?V3RJK2tISzFpYkdhSDBhWHNSQ255Ylg0MHBMeGZ6cXUrQmhnVVlKN3ZnU2lh?=
 =?utf-8?B?NHdQNWFVdUI4V29xUlZLWnhCZDZxRVFoZTA3SlB0d01BRkVFT0lDVGozRHZR?=
 =?utf-8?Q?RKaNzQm5qr4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVppQlNwZHhIMGVBdUswMUpZQlVBNUFUNGkrcklsOGdNSE5jcEplNm5OQ3Zj?=
 =?utf-8?B?bFlCeCtoWU9pckU5Yi9vdDRLTjJDM0pWYS9uY2NhcFdadmYydldXRDArb1Ev?=
 =?utf-8?B?dDR0M0RBTXYwMkNTMi9mYXNDZG5wRkc4ZTFDT2FLNldObllvMUhmSW5KbG9Z?=
 =?utf-8?B?RmZla3o2VC9BZ1pTVVR1R1YvQUJWTjlaNU13dURjSzYwT1B2TUJpbmZlVFZM?=
 =?utf-8?B?SzFRM05QOFlpK1hmdjU3dnN6ckVKcjZwa0xDZDVrY2x6b01kS1RZUnFmSTRZ?=
 =?utf-8?B?d0gyU1VsQzRWRXY3NmVPdjI4L1NIWnplRmZqd3JndncrclZuNXFIbEdic2w3?=
 =?utf-8?B?RjV3eW83NzVWcG5ZMGxqbXk0Tjl1cUd2bUZEZCtzMGFFblZ2dlplamtXL0cw?=
 =?utf-8?B?N0NaM21SL2tsanpHSmFqRStIU051bmFRNWk3b2VBQTdGSWJTZWNmZ0RiOVYz?=
 =?utf-8?B?cmwrbnR2OW0vQzdJUWp5d1FHdi94dS9Ic2xyVkI5eVc3OXpRUGtlZDY5bSsx?=
 =?utf-8?B?SW5zYzh6RE9MOStaQndBSUNncDBPWnE4N1NoUFRkaGR3blAwRUNLZkR4aVN4?=
 =?utf-8?B?STdiOXJ1RjdES2dhNWRjTFBKUTVERSs1REQrVVdla014dkFxVjlTSnR6aElR?=
 =?utf-8?B?N20rTUZYWnZha2lTcEsyb0JxU0Nac0dDUUhCT2pvaU9uYkVzUmpKNzQxSzRM?=
 =?utf-8?B?WGpOWUhlSWNDa25JQzdzMjk2Z0tYWURURklOUHgrQ2pYcFlCbDI1emY1UHMz?=
 =?utf-8?B?eFlWcnBlRnJYa2pYQnI5Rk01L2xrWWFCSWlzcmRIT0owbi9KUUFmdkwxL0dw?=
 =?utf-8?B?RGljMnl2OVRCQ0JNTFBVT3VqZ2FEbmp2OTRSVWxqc3Y5ZXFEYWkvVEtadTdj?=
 =?utf-8?B?S0xuRUpoc3Q4VGM4Y2RvUWxVNmovQVY5SStka2NtclMyeDYxeTN3OWk5Kytj?=
 =?utf-8?B?WXRGd3lJQkQzZWhUVmJwTlNlTTVzSFQvN0VBdW5uVkJCYjVqWHBUTHlNVHJi?=
 =?utf-8?B?TzI2RkM0U1ZGRW55VFBmTmVJVU1BOEJybHlIZkMwMmw2dUJ5Zml4cHY3VUVE?=
 =?utf-8?B?Zm5QaGhkUmNycW0vTWsrbW1KT1RpZndtam5nZjZFMzhuWVYwczNUTlhOaXFn?=
 =?utf-8?B?UjFWNjRaSTlqUzRYd0loMVFoNTY3R0hZcGVFUlBQSXJQREFmQzlTODRyN2FL?=
 =?utf-8?B?blk0RGFnMlE0VXM0MWE0NGRzaFNzanRtNHM1ejZSeHVzNkdGdWI4MzNyUDFX?=
 =?utf-8?B?RUFENUg4TTFxRHBuaHFDVURkZEwzd1ZIdmJIbzV0QzZwYWZPZnUvVzE2UmdO?=
 =?utf-8?B?MEVOUTRQTXBweVF6Z2taOGYrNUdFOTBhK3BWQzBQclgrUDRHcFVXZ3pYN3A4?=
 =?utf-8?B?VVNJcElpU2Q1TE01Z29ELzZ0YytKbWFzK1cvY1FXdVZIWGdSVXM4SmNWNDV5?=
 =?utf-8?B?SkgwRUZnU3pVY3VEejFsTXJ6MjBFN2FLMUxOOHEySVZPT0tDbjhIRWxuWmpV?=
 =?utf-8?B?SFRsVGxTOTJiT3BRQ21YbHQ2Tm5qdGFNZU4zVEJpdTYxNVBFWjY2N0dhTktR?=
 =?utf-8?B?T21MWExEQjZRTUN6QWZLOWwwSHFkUHdsS1dlVi8vMDNnRGJCYjB2Um1VRkNz?=
 =?utf-8?B?bG8rU1Nya21BT0hPeVdWWU42SGFhRnJhTVNqVnBqT0JiaTJQRkRTVEFpRzdj?=
 =?utf-8?B?SEZOVTFSMGt4MDB4bkhnRmw0ejd3Q0h5Z01zS1hJSFcvRytPd0ZGcWJ5RmpZ?=
 =?utf-8?B?R0tvNjcycG1YK3lDZk5KWU5kdzdYdklpL3M4NmxKaENiRVpkcExLdzFxV1RW?=
 =?utf-8?B?NjBxWFljaVFuWERCWmtRTW1selFBbWkySWdubElPRktwdmo5NjJTeU1kdjVn?=
 =?utf-8?B?T25yTjdWUjBCSUU4TDhTMjV0dWtYRDgzc3QrbUFQMTI4d1djWlViSER0NC8z?=
 =?utf-8?B?R3djYXNOSndqNTJ2bXl2MCtKMlRjZHZHWVlUME50VTd1NG42UU5Gb2hCemdY?=
 =?utf-8?B?WkpUOW5GVTV6NjBveHNlN3FUMkFJbWE5R2lETmtsRzBvaEwwSXFaTVUvT0lF?=
 =?utf-8?B?L1hLMHJmbTRvUGRxdHdONkdsYi9VdVJhaFZyU0dXS1dTRmlrdU5EWTkyT29X?=
 =?utf-8?Q?dwEAAQPDCk0ojo4fFXaQHR8D1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d17b2d-5d8f-48f2-bea1-08dd8190dfc2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 11:28:59.0543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXShVweiVWPJkZpDe1Dxfc1kw0nOOJ9Nxvd1CaJbW4LhDEnSMlZ49z5hCOWsBrn+n60hdE96XJhPwRsGulLCyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179



On 4/17/2025 2:10 PM, David Hildenbrand wrote:
> On 17.04.25 08:06, Shivank Garg wrote:
>> Export folio_expected_refs() to allow filesystem-specific migration
>> handlers like JFS metapage_migrate_folio to properly verify reference
>> counts before migration.
>>
>> Signed-off-by: Shivank Garg <shivankg@amd.com>
>> ---
>>   include/linux/migrate.h | 1 +
>>   mm/migrate.c            | 3 ++-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>> index aaa2114498d6..cb31c5b1eb6a 100644
>> --- a/include/linux/migrate.h
>> +++ b/include/linux/migrate.h
>> @@ -60,6 +60,7 @@ struct movable_operations {
>>   /* Defined in mm/debug.c: */
>>   extern const char *migrate_reason_names[MR_TYPES];
>>   +int folio_expected_refs(struct address_space *mapping, struct folio *folio);
>>   #ifdef CONFIG_MIGRATION
>>     void putback_movable_pages(struct list_head *l);
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index 6e2488e5dbe4..0f01b8a87dec 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -445,7 +445,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
>>   }
>>   #endif
>>   -static int folio_expected_refs(struct address_space *mapping,
>> +int folio_expected_refs(struct address_space *mapping,
>>           struct folio *folio)
>>   {
>>       int refs = 1;
>> @@ -458,6 +458,7 @@ static int folio_expected_refs(struct address_space *mapping,
>>         return refs;
>>   }
>> +EXPORT_SYMBOL_GPL(folio_expected_refs);
>>     /*
>>    * Replace the folio in the mapping.
> 
> Can we make that an inline function instead, and add some documentation?
> 
> This function is only suitable if we know the folio is unmapped from page tables (no references from page table mappings: !folio_mapped()).
> 
> So when exporting this function we either
> 
> a) Need a clearer name
> 
> b) Should generalize it to consider folio_mapcount() etc, and lookup the
>    mapping from the folio.
> 
> For your use case, a) might be easier. Maybe call  it something like "folio_migration_expected_refs" ?
> 

Thank you David for the review. I'll make it a static inline function in the header file
with proper documentation. I don't need to EXPORT it then, since it will be an inline function.

Best Regards,
Shivank
