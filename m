Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696A6CA64
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306064; cv=fail; b=ZQpYSUZ8kMPw+7SjGw7y4fdUtntpayho6Q5faLnZUSD8INgo3SZc3MczgI7Ed4wlEZzoQfsinbP3aUcqWOWnKqQvcb0DVqPgYBTe5bfEM4v1EHyk23edFASsUq3l9GmEkdpiV+2+2P4JFzlPmNSPL62KK3VPatRNCNLQ1T+d6IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306064; c=relaxed/simple;
	bh=WVpfbEY0Q8afx+kPk5rx9htrjhEawULtpsZPEyJmbzs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=scO+ntFolFYUumDCKeXeGs8oavPTkr4s3h5O4q4ZEHVmoiIr4J5gCiqHAsMW0R6eqU5K/dZAHXvu0M0kH8sFI59DCELuCHL9I8IJtOW544dP4icEDapRN1ddbwZI9+w88i5cL2km1J7+m/HlbeWAWNgOog0k8p+OmL9RZcbBVd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t/NVl1YG; arc=fail smtp.client-ip=40.107.100.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t/NVl1YG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDXTdmwZj8N83pqQfyhlPyBLKsQBSyiO1P5snSMtVHw8KfxZ5AeIny5kU4JdTe2e3otgQZn6iI22tjEAwHwOjbav0Jj7IxpMFsu/xoI9ChMbrK9CH8QFso2cSXAjByfY3sBhYMV0BZzTh4bOngVXKcCUBcZRGulJS5HlLkAtlWsFh8xTIgySQczg3ruS1yHK/YiSTqti1DG8NI7qROybHcpD5/DPWlMe83q8YtlpcK4kHSnxqB9A0MEt0D3YA+dOtocTxKPAP8UR3xDyogdyZoKodIvCLa4+rz38tVEeJm0Qu+jKvGJnJnvQrKiGh3oVltfoT7vrj3jBekHl5TiOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMUA84ZeqHeg0EUPvs2AoBZ6wEWxWLTNmaR385W8k80=;
 b=MYm88nehKzK5vg9rhuWOfrFZVPGB2aPxBVw5s+5v/k6ZY0shRB4g6IE9d7oQTohZQYeL1XM+NJgKHr84QVrU82Sh4JhIZKGTn3pv/KXuOv2M+10tRbUqfK8fBI61vXC7Zy7cPRh8MQ5g5G9LjZ9bnXV8Q4n/tMMXxG4SJQRdIfV8QcvxAs6327OAcUsQ+1Q4KapVWu+jghQjz7KlyHjMPss8IvzGSMnQC5UF1NpXKd1UgLhs1Z36kFMT9MV0xYikZMe3Ld23KO/9JlDSZCNpRUG/8YX0wx3up8uChNxrDZGENjYgNabjnrrCY3Cf5vEQN4cJTaYh/tSC+wqMurriWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMUA84ZeqHeg0EUPvs2AoBZ6wEWxWLTNmaR385W8k80=;
 b=t/NVl1YGq342nYZEYTpS21prXpFnEK7b0JlMg1IXFUvpjrhl5axpIBUJnQEaDbBxnSo4LZQhoskn46pYkXlpf55S96SqYtqZoYU1vIYrxI4SHxn88AfWeD6y07jScx3LQopR/nwznq4qzL3U0xSLxYDihBPNbmoWkzUjZpGQZHy78CHDLvMfySODVlDUYMJof+m20o7JQyitaDgveW89jWHcKqR8mZ4I9rYjdubqKsk8wyy9LwwZZwOVE4HfHs9r5nA0A3ijmkpRImVuEVK4pJItBYLzHgwm8KQY7dfZ8u/VYFQdTmhJyMqVKLalpTzxY+d0fx5e2Muv31HlnibzrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 07:14:16 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 07:14:16 +0000
Message-ID: <ad725f4b-6e45-42e4-ba6d-919534bc99a4@nvidia.com>
Date: Tue, 22 Apr 2025 17:14:11 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: AMD GPU driver load hitting BUG_ON in sync_global_pgds_l5()
To: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, luto@kernel.org,
 peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, nikunj@amd.com, kees@kernel.org,
 alexander.deucher@amd.com
References: <bae920c0-a0ff-4d85-a37a-6b8518c0ac41@amd.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <bae920c0-a0ff-4d85-a37a-6b8518c0ac41@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN0PR12MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: 189d8f38-57fd-4cbc-fa2e-08dd816d4ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmdBRHZjWTQ4bFh6UkVXUWVSTlFXcVNFVjArVERvWWJlaUZoR2hKb05Rd1Zi?=
 =?utf-8?B?b05iUEoraG9rTWNpQlczY3ZmamVyZ3UxcFpNTGcvVzdndVJsTlZGMkpyTTht?=
 =?utf-8?B?NVExd0I3NmJMR1ltMzdoVHV5Z0Fvb1pLRU1xUnlUZ1R5U21pL29UWDRrSDJB?=
 =?utf-8?B?b0FsRE9oMk9xWTkzV3RkazRvMmtLSUpXS0V4TzQ2dnM2Y2hVSDdsVFFOMDh3?=
 =?utf-8?B?ekFaM1oraG1pMnFJcnJlRzJyVm5LYyt3WVhaTVRtSkJOa1NRaXVDZTZ4T0hk?=
 =?utf-8?B?djVXV285ODNpK1ZRSWNodXRtbzNwL0FDdHFmUEJaa1l2NEZLSGx6NEJaRENR?=
 =?utf-8?B?Z08va1IrT3AwTGoyUkNLS2EvTFJpdyt2Mmo3Qk84TTB2TExyd0xZNjhKY09T?=
 =?utf-8?B?Lzh6RXlIOFV4cklhRVBLRUNlN3g2Z2dESDFxQnJCeHFrd1kxYjhmdUVENGln?=
 =?utf-8?B?bVMxZDA0Vmd1cjNIL2dTc0ZrZmNsOFVkMnpkZ2RzbVpQR0o1MnFoMEpsQTJx?=
 =?utf-8?B?eGxTbVVDcTlEN2wwUUdVYXlhVnMyT2c1K2R0MG9UbGwxb2pidDZlQW4xemhk?=
 =?utf-8?B?OUh4M1pZYXJtTDZ1eGc3TFFVUTlLdElBdGVPRXR4YXJqY0tlV1YraDFMK3lE?=
 =?utf-8?B?MVQrK25DSUl6VEtDdnc2UHM5VTZwaGM4QVVJMUduL2dDRFdvOXh1alk5dDY5?=
 =?utf-8?B?VnJ2djFJc2FzcnlyQ1VSNzFKeW1yZXIxQTZhQi9wMUZqMUpwQ2NiWHhpbS90?=
 =?utf-8?B?TUJadnMwVi9WczFsemo5N1Y2VGZ4THBvTjNKUjNuNyt0VG9sTktBOHZuZndR?=
 =?utf-8?B?L2lDZTdyd0hHUFRTWEg3RHdodURFQUFsdDQ4NjY2d2tkWFN4Q05SbWpncTJQ?=
 =?utf-8?B?b0Rxa2l6cUNtRmRjZUpiSU1xaWJUVWsxY3ZKeEVPMExESitlQ1o4SnNNVmNZ?=
 =?utf-8?B?MzlJZSthREcxZ3RNOXBiMkV1MVZUNUdGcWxZZElmRldmNWdhaUlIT2JJa3ZO?=
 =?utf-8?B?eTk1ZkU1VTZ6blFqYXF0V0hmY3d2Yk5TdjU2eG9CVDRVekRXTlNHeDVLOU9z?=
 =?utf-8?B?Nnc5ZUIyMWtRM3R1SWJmTlo5TFRHc09Pb0w1Z29EZGZkUTNFbkljL0thTnVs?=
 =?utf-8?B?YlNoZVE1blp1WkIvdUZjRVk2N05Udmd2ZnFMb2E1Yk5qd0Y0OCtPTTJDUWhy?=
 =?utf-8?B?clhpdlRBaFJaNklBNTFuay8zRlVxZEdFQVlKNkp4NjhiVm15VENjOWY2WUhP?=
 =?utf-8?B?eVFsVklYb2Q4RjNIZjJRTnRzNWxYdnZuYXBHL29xalY0YmdFblhVbnJxVUZD?=
 =?utf-8?B?WGVIajlaT1ovbGdWajZqcW5mVDdGTUxmY2RpaU5tNXVtMTZSTnNFN2ZRd2Zv?=
 =?utf-8?B?ZTdhMDI2OGo5UXQvajNGK0ZUeVB5UXdtRlpWSzBzZFZIMytoWUxkUmQ2dHZN?=
 =?utf-8?B?aSt4UkZsZnhKSUdGNThVdGdjSGpORVpjMjlnOW1WRWI1Zm9xRjVCUTJucUhJ?=
 =?utf-8?B?d0FEVGE5enhYdmdYZE43L093MERWWHRHaGo5OHgyeFRoZ1BtUGoxUVRqUHlj?=
 =?utf-8?B?OTk3ZTVUd0JPYVlZQ21Sc0ZMcG5lemk4YXBUdmluRHVscHlhVmdBcjhpT1hJ?=
 =?utf-8?B?TnlmTnFOaHc3bklLYkM5Y0VVMVJ5WUJtN20xcmFOUWJDMVRWZEpnS0tPdU5E?=
 =?utf-8?B?WFd6TGhDUkRqeHI3TjFzZTlWTnZwTE5kWjh6QzY4ajNTaUxFRHpMWUhUb0Jl?=
 =?utf-8?B?NldxcFdkUXZlanJWY1Juc3pEeVU3aGFVc0tvVnptSHQxRTh5a1g3VXd4TDlC?=
 =?utf-8?B?Tk9WTE15MmNucjB4dWh3OWNLb3ZQb3QwR3BZK2lZc3RmSXRiQ2JuK1I3bjZZ?=
 =?utf-8?B?QnZJTzdEYy9HblNqTmdlcFlwSUduNW81dldsNnVnUUpsNDVXS1k1cjlFODcr?=
 =?utf-8?Q?OaHZy6z8nvk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUJtNU53eXErYVdjYzl5eUFoaWZVV0k4Qyt2ME55QlBrOTlwQTFKaFUrUElN?=
 =?utf-8?B?aGk0ZXNuYS9ycEFOL24zZFZHRlVJbG1VQ2RuekJMajI3aGRERmdmc3ZVQzRp?=
 =?utf-8?B?c0tOVjZhUDVBVWxOWFFwTVQraXcyT2t2Q3FrdGwyenpGM2lYS01xM3Uybll2?=
 =?utf-8?B?VXY4UDBDWllza2Vzd1ArOFZvbEg3NWNWWWNsSlFoRzFyYS8xMWZndTRTVmVM?=
 =?utf-8?B?Q0xNUGFCb2NDVXRYNE82TXFYRVpLQk5rMmtsOG1aUS9YcjJvQU5BTDlwMkJs?=
 =?utf-8?B?N2UvNDVxWWQ2UlIrRitKS2lxcUNCZnNiY0JYVENnNzc5cUxHbTJ0SFRsZWt0?=
 =?utf-8?B?a3hVdDhVWWZPT3liNElyalZQR3NRVmpzT0NXOTBId203VHpoUUxkVHVudFFo?=
 =?utf-8?B?ak5sdTNUWWFXeVlJY2ZKaldLTGg2dW9WR0xvVjRvUy9YUTNuWGRuRlB6ajFm?=
 =?utf-8?B?SGljM0VjSUFWeDkzNlBRUThJc3dBYmxSWFhxSDBYNDJTc1pCZFQzbUdYdldW?=
 =?utf-8?B?dm5udDlFbjQyM1VmNjV3MnlIYTBkUnorTWNBb3lFOGxBM3g4RzI2Mm5vSGY5?=
 =?utf-8?B?ZWNYVkd4YnFKZTJOSG84T0VWRmtLQU1sVVdVKy9IcXlaZnFzNjV5dmJTa281?=
 =?utf-8?B?YUtJaWgwS2ZTZ1NMSlA2bWVBL2NYTk1MbUtWV0hqZ2F1aXhpdk1LZFJqZkNE?=
 =?utf-8?B?K3dHbXNvVjZBYmZ0UmNqOXVNeW5UQ1dIYkE1SmdSYlJ3SjlLOFFjNnUvckZ5?=
 =?utf-8?B?Ly83KzN4ZXNkTXcrOGxocGpOMlhhdmh6TFZCRnFuOFYwcDN2TEZmdTBoRm5l?=
 =?utf-8?B?K1B3RndqNEtsQ05WbDNlZEZ2dGtUVzlnZVFvaE9YWnlqWXpVRDFZQnFneE15?=
 =?utf-8?B?SXhvQld0WkJWb09HRzR0a25sYlorY2g4SFpzNS9UcmVWSlR5NEJDZjQreHBw?=
 =?utf-8?B?VDYvMjZ0UVM5S0VIQUVRc2ptWnlkZjdMNjBSV1pnZWVsMTU2dXNnRkYxeEpG?=
 =?utf-8?B?OS9FYmRTU1dGTTAreUdnR05TbHZqS1VjOTVYa3oweTB6UkVXSnZDUll2UWpp?=
 =?utf-8?B?OE5QUkllaEE3RnRmUVdWR0J3alliZFlHWnFrZm5mNTk0YkUzVXh2RmFVenNk?=
 =?utf-8?B?V09WNXU5aXBIT2FpY1R2YkZWYk5nWnJpTnc5cFpVd3ZES2dUWGZMVkRJSXUw?=
 =?utf-8?B?TTlLN2FWc2VLTWUrQmNOSEFwcGxkcXZNVnJWWjZLZlh6aVRBZ1dxZ2Zaa1pO?=
 =?utf-8?B?eWt0R1NNU3JLNUk0V0ZvVWFWOFI1RjdGcXFpRGFRL0RjcEFtNVlNd3RIMWJa?=
 =?utf-8?B?eXpKOUtFeXE5QzFHRnZDRFBqZm5wYWFuVVZsMmhFY3NpZUNRd25aaitObW8w?=
 =?utf-8?B?NktkODIxU2V6ekJCU2ZwdGdxZU1WNU9rc1NCTWRHb2NIQTlGaTAyK0tKdm9V?=
 =?utf-8?B?SkVudllmZ1FjYS90S2FxZ3BObFhramdPWVJwMzlSK29IclJRYnB4RHJ1Zllz?=
 =?utf-8?B?NEY5Q3NSRGRaUEdkcTUzM3dHT0RaTWd5NTZIelJaaW44Y0ZpY3lJZU84TXU2?=
 =?utf-8?B?d3VPRHhLVWFkbDNrU2o2Smg4eXNhRytYbDZoWm1YQncyY1h0NmIzQTdaMG03?=
 =?utf-8?B?WVVBSm44bVR4QnNBSVYzS3BmNGRSWm1ZVHBpWHRCNEpFSzNmdUNyTXpMelk0?=
 =?utf-8?B?ZDViVFU3VW1TZEZlU3M4MWtoWU1idVRaaVB0bnJKNmY2bDQxRGdvRythU0tF?=
 =?utf-8?B?NWFFWTNUcDhYcjA1cXRRU2JXNGtjVENHa0NUQ21SUVVZL1Y0Y2hjbDlvVENU?=
 =?utf-8?B?WUJ1NDQ5enArTHZyWnEva0FmUFdQVzVvNTJFQ2sxeVo5Uy9YdXNsaFc0eS9I?=
 =?utf-8?B?WDZURTR0VFRxMGZTR3Boa040T1RMQVhEWmNtaHQ5UEZ6WkswVFRjbmxCN2lo?=
 =?utf-8?B?OUhmK3J2ZHpiNTFLeHY1cDJvcEgrR281ZXI1bGNXS0hKY0k0aVh0Vk5lOE95?=
 =?utf-8?B?SFY2M2ZxeDVkaUNuS3VmN1kwT0xjYWJLR3FnNzUySjExVFhTY2phZ3lMbE45?=
 =?utf-8?B?SC9rdDkzME90TFVwQW9YMFlHd29LN1BwU3htcE8ybC9Tb0JCUDNZdXhKT1ND?=
 =?utf-8?Q?mEQ3pwotZoKKYMqjOjpOvfBHu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189d8f38-57fd-4cbc-fa2e-08dd816d4ad2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:14:16.4435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B13CzdUp8tNEdUKa/XtA4y7q4ujYwW973Gki5tN+HQMkPnZanRKOHDpmwXnABBv0suC2fKxst7xQG7UmcVIYlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5716

On 4/22/25 16:34, Bharata B Rao wrote:
> Hi,
> 
> Nikunj and I have been debugging an issue seen during AMD GPU driver loading where we see the below failure:
> 
> -----------------------------------------
> kernel BUG at arch/x86/mm/init_64.c:173!
> invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 4 PID: 1222 Comm: modprobe Tainted: G            E      6.8.12+ #3
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-0-ga6ed6b70-prebuilt.qemu.org 04/01/2014
> RIP: 0010:sync_global_pgds+0x343/0x560
> Code: fb 66 9e 01 49 89 c0 48 89 f8 0f 1f 00 48 23 05 4b 92 9f 01 48 25 00 f0 ff ff 48 03 05 de 66 9e 01 4c 39 c0 0f 84 c8 fd ff ff <0f> 0b 49 8b 75 00 4c 89 ff e8 af 62 ff ff 90 e9 d3 fd ff ff 48 8b
> RSP: 0018:ff52bf8d40a7f4e8 EFLAGS: 00010206
> RAX: ff29cef78ad1a000 RBX: fffff1458477e080 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000010ad1a067
> RBP: ff52bf8d40a7f530 R08: ff29cef78a0d0000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ff29cef79bd8322c
> R13: ffffffffafc3c000 R14: 0000314480400000 R15: ff29cef79df82000
> FS:  00007e1c04bf8000(0000) GS:ff29cfe72ea00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007e7e161f2a50 CR3: 0000000112c9a004 CR4: 0000000000771ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  ? show_regs+0x72/0x90
>  ? die+0x38/0xb0
>  ? do_trap+0xe3/0x100
>  ? do_error_trap+0x75/0xb0
>  ? sync_global_pgds+0x343/0x560
>  ? exc_invalid_op+0x53/0x80
>  ? sync_global_pgds+0x343/0x560
>  ? asm_exc_invalid_op+0x1b/0x20
>  ? sync_global_pgds+0x343/0x560
>  ? sync_global_pgds+0x2d4/0x560
>  vmemmap_populate+0x73/0xd0
>  __populate_section_memmap+0x1fc/0x440
>  sparse_add_section+0x155/0x390
>  __add_pages+0xd1/0x190
>  add_pages+0x17/0x70
>  memremap_pages+0x471/0x6d0
>  devm_memremap_pages+0x23/0x70
>  kgd2kfd_init_zone_device+0x14a/0x270 [amdgpu]
>  amdgpu_device_init+0x3042/0x3150 [amdgpu]
>  ? do_pci_enable_device+0xcc/0x110
>  amdgpu_driver_load_kms+0x1a/0x1c0 [amdgpu]
>  amdgpu_pci_probe+0x1ba/0x610 [amdgpu]
>  ? _raw_spin_unlock_irqrestore+0x11/0x60
>  local_pci_probe+0x4b/0xb0
>  pci_device_probe+0xc8/0x290
>  really_probe+0x1d5/0x440
>  __driver_probe_device+0x8a/0x190
>  driver_probe_device+0x23/0xd0
>  __driver_attach+0x10f/0x220
>  ? __pfx___driver_attach+0x10/0x10
>  bus_for_each_dev+0x7d/0xe0
>  driver_attach+0x1e/0x30
>  bus_add_driver+0x14e/0x290
>  driver_register+0x64/0x140
>  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
>  __pci_register_driver+0x61/0x70
>  amdgpu_init+0x69/0xff0 [amdgpu]
>  do_one_initcall+0x49/0x330
>  ? kmalloc_trace+0x136/0x380
>  do_init_module+0x99/0x2b0
>  load_module+0x241e/0x24e0
>  init_module_from_file+0x9a/0x100
>  ? init_module_from_file+0x9a/0x100
>  idempotent_init_module+0x184/0x240
>  __x64_sys_finit_module+0x64/0xd0
>  x64_sys_call+0x1c4c/0x2660
>  do_syscall_64+0x80/0x170
>  ? ksys_mmap_pgoff+0x123/0x270
>  ? do_syscall_64+0x8c/0x170
>  ? syscall_exit_to_user_mode+0x83/0x260
>  ? do_syscall_64+0x8c/0x170
>  ? do_syscall_64+0x8c/0x170
>  ? exc_page_fault+0x95/0x1b0
>  entry_SYSCALL_64_after_hwframe+0x78/0x80
> RIP: 0033:0x7e1c0431e88d
> Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
> RSP: 002b:00007fffa97770b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> RAX: ffffffffffffffda RBX: 00006198887830f0 RCX: 00007e1c0431e88d
> RDX: 0000000000000000 RSI: 0000619887b43cd2 RDI: 000000000000000e
> RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000002
> R10: 000000000000000e R11: 0000000000000246 R12: 0000619887b43cd2
> R13: 0000619888783220 R14: 0000619888782600 R15: 000061988878d190
>  </TASK>
> -----------------------------------------
> 
> A KVM guest (with 5 level page table enabled) is started with 8 GPUs (AMD GPU driver gets loaded) and CoralGemm workload (matrix multiplication stress) is run inside the guest. The guest is turned off after the workload run completes.
> 
> This test(start guest, run workload, turn off guest) is repeated for hundreds of time and approximately once in 500 such runs or so, AMD GPU driver fails to load as it hits the above mentioned problem.
> 
> As part of GPU driver load, the GPU memory gets hotplugged. When struct page mappings are getting created for the newly coming-in pages in vmemmap, the newly created PGD is synced with the per-process page tables. However the kernel finds that a different mapping for that PGD already exists for one of the processes and hence throws up the above error.
> 
> The debug print from __add_pages() shows the pfn that is getting added and the number of pages like this:
> __add_pages pfn fffc010000 nr_pages 67043328 nid 0
> 
> Later in sync_global_pgds_l5(), the start and end addresses are coming out like this:
> start = 0x314480400000 end = 0x3144805fffff
> 
> These are essentially the addresses of struct page and such addresses for page pointers are unexpected. The start address was obtained from page_to_pfn() which for the sparsemem case is defined like this:
> 
> #define __pfn_to_page(pfn)      (vmemmap + (pfn))
> 
> When the problem is hit, vmemmap was found to have a value of 0xfffff14580000000. For the pfn value of 0xfffc010000,
> 
> start = 0xfffff14580000000(vmemmap) + 0xfffc010000(pfn) * 0x40(size of struct page) overflows (wraps around) and results in the start address of 0x314480400000.
> 
> This points to the problem of vmemmap_base selection by KASLR in kernel_randomize_memory(). Once in a while, due to randomization, vmemmap_base gets such a high value that when accommodating the hot-plugged pages, the address overflows resulting in invalid address that gets into problem later when syncing of PGDs.
> 
> The test ran for 1000 iterations when KASLR was disabled without hitting the issue.
> 
> At the outset, it appears that the selection of vmemmap_base doesn't seem to consider if there is going to be enough room of accommodating future hot plugged pages.
> 
> Also as per x86_64/mm.rst, for 5 level page table case, the range for vmemmap is ffd4000000000000 - ffd5ffffffffffff. Is it correct for vmemmap_base to start from a value which is outside the prescribed range as seen in this case?
> 
> Any pointers on how to correctly address this issue?
> 
> 

Could you please confirm if this is a new issue? Sounds like your hitting it on 6.8.12+?
I've never tested this on a system with 5 levels of page tables, but with 5 levels you get
52 bits of VA and you'll need to look at the KASLR logic (max_pfn + padding) to see where
your ranges are getting assigned.

I'd start by dumping the kaslr_regions array.

Balbir Singh

