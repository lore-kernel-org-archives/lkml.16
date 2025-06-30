Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D194220AF98;
	Mon, 30 Jun 2025 19:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310409; cv=fail; b=DqRqE515hYyH0kCSOHeDIVUrEmAn+0cmJc7HjtBtxHRzf7nNkKWBGpuhzXK06pcd4jpGAWnOwgRJyvvp8FuP6B0A9Q8h+04U/NlmUspAQdyk0s5ozXbm6m8+zvXLkFm0f5pDlnfCEDa6SiqC4g3u12wcCJDXWirMoonJX1yAwyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310409; c=relaxed/simple;
	bh=OtR7jwIdhzDw2fI+9aS7FdMcVQ8sdr81P3YH8x/G7xw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aZgzkV8jbOH8l3RzpD7dKyhF9baabqAShuEoXjcNG4e1DKbVBwtadOgp+yEZ5D+zs6KIqzhAWJYDF5/9pQl9Re3B6k4uCrNzpikCZhuHIcYQiFoQnpxMaIhFXfxN+ga6GSWqPuO+mxxPUG3dj+3//QWKGH5IeJFHq5XcxAgsRrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=U7645Wi2; arc=fail smtp.client-ip=40.107.93.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="U7645Wi2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWPU7o1lY9nhtIIuiCKA61NBUxiwkw+QGFaa8JjsZtDC90CAcjxMVAvMs66oP3bmOWzXPm4XbX/J/2LtN3C1qE9a4TO0tF/RK30ZROLJ3xKukrlVR62UeBvxLQ4/9Ux6zwIcg7dmp4PJlkTfuOY8U+w0yZ7frAsA6kWAWdnUFqEH2gL/l35j7Ym9JRBHTFXeTMkZjOCE41CIVHbD/0CMsC1qiAssW3nLX1QpXv0d/pID1es1Wg3ktC+ELona+xoRkOv7DhI+p39s5aoma+glQtPeTa6C63HzC66e6ZHm7p82DOIZ1fpzVutT539eM7AlqFfPDuCHgmCISOGNbcTBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ENxtGNSsu+DZzA+EQv96cSN7WEupgJWwguhRuV4AHE=;
 b=wNjGEOzk+jxXCnFjIxUI61U7rUfwN4Kn0Lkyn5z063zD7KFpdCVhv4MQi504IUYJA0UBDobdf+TGAa578j/0OVuAdTqyPnTPpqW7OkkN5nbQ2ARMcVmj2g0G0o2/gwDTj0uIodvwyZ/1SRV3UxzLTxZECNkM/gVIMVUjaT5Rx7zFCuN960lipGHDwluXSV4vG6bQxElQ4hxLgSs1X69GFQyncD3DmcbOfS/T+nk20xnZO3FZHl5ctD9Z6zB8XYqoa1t1NoA4xKg+W14PLOpm7jYkCov4wL2Ret++2AGu61MZtaDsAwrJ8HQSrW8oXbdiJfmKaoRKB4RMIHCbUh69TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ENxtGNSsu+DZzA+EQv96cSN7WEupgJWwguhRuV4AHE=;
 b=U7645Wi2E6rfC4Dy+ixOUppmydzb8X8z+dPoqJlHAv9m+zQgiLgLQh8VYdLjYijkq5cAFEv4ho5u9QcK7CXgNEznbuBsm8ttYckKViUM65HAj1ShDj1FvlFK3ljxBeHJnq0rnS3Lt7/0G1B5WGLHBHyQ+t5u+hF4/bsF8uQlEWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MW4PR12MB5601.namprd12.prod.outlook.com (2603:10b6:303:168::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Mon, 30 Jun
 2025 19:06:43 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 19:06:43 +0000
Message-ID: <fc66675c-7230-4774-b3ba-617639197579@amd.com>
Date: Mon, 30 Jun 2025 14:06:38 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 24/32] fs/resctrl: Add event configuration directory
 under info/L3_MON/
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <612428100e6f4529294c3fead6850aaac303d82a.1749848715.git.babu.moger@amd.com>
 <d0123331-49e0-4948-991d-ea908785bff7@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <d0123331-49e0-4948-991d-ea908785bff7@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0047.namprd13.prod.outlook.com
 (2603:10b6:806:22::22) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MW4PR12MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: aacfbd9f-e45c-490b-19d1-08ddb809409b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmY3TGFCNmQ3TG1YSXFUK3d6QWIvRzFIbFJUWE9sZmZySnJrdzlpbHY3dkZm?=
 =?utf-8?B?R0JlMjZaa0dzcUhVam9FZjJBTlNlUWxKL3R2WVFnTUcwNHZDOFJPMExNQWVQ?=
 =?utf-8?B?ZWZDYkVUbERYYldVb2MyNjVpdTJKMjVFMTc5TXRBMFI1dDUxbEJVeFBMdnpl?=
 =?utf-8?B?MFB0OWwwMkFlT1FtNjdTMVNSUnlBRm5MYlZWZzF1R0JPQ2RVbTA2ZUpia1RM?=
 =?utf-8?B?WS91UlkrdkE3UHBoMXBsQWo2RzVkQzJtTVRkb1JjcDlFNUNmOTFEanJLWVpl?=
 =?utf-8?B?NmhRRzNHejVndEhHeFN3SDVBajBMdUhmYk9BRFBZeWFnQThLdEhZWWhnR21j?=
 =?utf-8?B?VVVpKzBMNzVta3grTnl4NUxHUnZOYlZwU2w4OHp5YUlnZ0FaUVp1MUY1Qy9o?=
 =?utf-8?B?OTUxVDVzTEdnSXh6TExaUjZNUFNSamxYOEFSamZ2SmZKSE9uNFFRZkxpQjY3?=
 =?utf-8?B?MHBFRzgrQ3I0aGlVNitJRHNFdjViNGY3clNMdFoyKzFSS3piQXpGS3NuWWJE?=
 =?utf-8?B?dXU3OTdkNHdFQVJ2dldEQUEwcmowOC9ZYjhoUlQ4RXhuTm5tcXhGeTFWaTRx?=
 =?utf-8?B?Ylh4RUE4cUJHNS9FMkQwYUpsUmgwNFFBMUZDdnZEd0hYVXRweEVpV1MrZTIy?=
 =?utf-8?B?NGdIVDRRcTUzTS9hNlZ1MWlNYytGQXBINThxZmk4WXlCZURkeVZhK1F1ODRZ?=
 =?utf-8?B?M0g3bGNqY0kvam53NS84TkZzTmp2WU5sODZiaU5DK2Y4Y1R2TWdCMDUvc3VN?=
 =?utf-8?B?YjVhVDlFWjRVQi9rSkFYMEowVGtEb0ZUeDVqQTNTdlpyVVpKdHdMN3g4VFFl?=
 =?utf-8?B?djdXYmpOYXNGQ2dJeEc3SXNJMGtsbVhUbkRVNFFDWmM3YzZyTDRYc3N4bXU0?=
 =?utf-8?B?QVphcW42T0UvWTVLV3ZLUHZtb24xeGFWQzBoLy9iaXU1OW5HTHdCWHFOL2JV?=
 =?utf-8?B?RDJkVXJwVVRIWXgyN0dneWFNUHFGVWZkWks3c3ZGamZrRUZiUlF1TkNFTGFC?=
 =?utf-8?B?OVgyMTJVaHFRbFNDOEw1VTMxWmZCajlmMlRTVDRMM2lpK3FsUmZUeGkwQ2N1?=
 =?utf-8?B?d083Rklia3hXeE9PMWlYeUdwRm5lWGxxd0Z1biswSHBwR3MyQWFEbzVrclBV?=
 =?utf-8?B?SzRaWk45clQyUnNQWXFURk5nN2JaenhyYThFd0pFV0I1R0ZqUkIxY1ZRa1FO?=
 =?utf-8?B?TC83TlVkY3ZFL2tBZUNvb2xmUGoxU0NwSEQzWXcwakRpZjBOREtsUUpvTHd1?=
 =?utf-8?B?ZHljcnI0YWtSSGQ5SGVLb0tRRXRWOGU3Nm5sOFQrdjRxNGhDUi9XdTVyckE1?=
 =?utf-8?B?bGFIL21QeEZjZnlFS1VKZndlbUJvRHhreWhTY2NRcXhmL3JwNk9sNGF2aHZs?=
 =?utf-8?B?R0F4R1VxMEFkMDlRZ2pLVEJ4emwycTZobXZhNXpCWFh3K3M5ZWFmTmxVNGgx?=
 =?utf-8?B?cU9sSCs5SHphZlZiV2ozcVJDU2tUaEdrT2VPZ28xYUdzWTNZVUZyWU1BZStV?=
 =?utf-8?B?ZEtBMHR1dlQ1bEN5ZjJHWVZsTWYxbEV4ZGRlOXYrbU1KRHlkTnhaU2dJRE14?=
 =?utf-8?B?N0x3TGtsS0hpVkdrT1gyek1qQXNmcVJycHZ2eDYybFlDWjNEaFE2T2cwZlpE?=
 =?utf-8?B?SDFuMUwzOCtXSmZFbXdMUVhYaW5tUko4Qjk4VE42S0NjeU5HdWFmUndCNWl2?=
 =?utf-8?B?VlQvbC9BSlNtekZLMWRBSzJwQXFIU3Jlbzh4ZllDeEhGU1VNUVUwSGZMc3g4?=
 =?utf-8?B?Z1dqNGFqN1BmNnVTVjBWWlUzRmtQSWFxT0phMWd3blJ6R1ZLaEhRc1E4M1p2?=
 =?utf-8?B?RjhyY3oybXllNGJIM1BNdzkvUWd3UHpFZTJVTEFqOXB2UHpTVTJzOXYxYWk4?=
 =?utf-8?B?Sm1KQ3NxcnlqTFNlcmRkUTJiWkJWYWJGd3BQS2huSE8wbWY1aEEvY3lsTDhy?=
 =?utf-8?Q?4FPkzMI07N0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2c4VjBaWEExNU1IK2NhQkgzUWNBTUdyc3pMMlZPNnhYNWFCVnUzR2ZSQ201?=
 =?utf-8?B?WlBnbmRUMHc5SkwyMU90Q3dZb1hGVitIOTdZMzhHL1RBc1ZuMS94UVZ6U0ho?=
 =?utf-8?B?QUg1OEdzdG44R0NvdmhwVUxrQnJvWUEwajNwL2NVc1pqaStmTmh3bzJYS2Nz?=
 =?utf-8?B?bW5yU2doTllvSThrZmpwYzFWNGw1cFdjZlVWdjcrMEI1THAzU3A5YWNaSGNT?=
 =?utf-8?B?bVMyMkpjM0pXY3NDa01DclZQRmxySUxUbzlIbVorM2VDc2M0ZS9mTWp2SG5P?=
 =?utf-8?B?dzVjeFNyUEdaRE96dTlkRmd6K0JwMlpvYzk5VlFrbkFSUVlWZXJ1Y2ZjcXlG?=
 =?utf-8?B?dUo0RXEzRWprbTBiUjgyT3ZRNDkwcDJqRHRaRGdKMCtNSUlIOGYweVBhTlB5?=
 =?utf-8?B?SHMzTDVHUkRlYkMvK0ZKWVJJYWFnTy9Xalh6bFFWeWhzUFZhSmtSNWp4KzNu?=
 =?utf-8?B?eHdwTm9GVTRQNXlEaUp6cFVVTlZiNDJJeU9xRlQzcG5GRlZmRnVxWkVKWWVW?=
 =?utf-8?B?Mmt4SEVWdzdlY0NMOHFPY1F1cExNZVhUck5oaU9Vc0prNnVxdW0rOGdtMTdG?=
 =?utf-8?B?R2ZFMWZ3b2gyVHMxV01DM0ovZ0t5Z1M2a2w3MHhuT0hXc1BrTFk5a1RaeVBa?=
 =?utf-8?B?d1dOdk5Zb3pLdnIyWUduL3RoQzFPNWlyQUh1RUl0TmpoWTA3U2FJNTVzbGJM?=
 =?utf-8?B?UVhTNGJpZE1TODRQVVYveU56NmoxL0tUdHE3RkJkNmtWREVqeVc3c0R1UlRM?=
 =?utf-8?B?NEtpTXlUWGtjaUpSZDZNbGZuQndyYjhFZVF1OUpBVHErRENxbmhTMkR3Z1RL?=
 =?utf-8?B?bjRRSzlmODVHSXhKV2J2Rjk3ZkdQZGpGZGJmYUlPU0ZkWVRGR20rN3VRZFdy?=
 =?utf-8?B?VUZOWWFCblUwYnRJTXA0b2xLUGhCZlQzSjV0c0ovbmNDdlZnS1lBTHRIcEJX?=
 =?utf-8?B?OFkyYTFvaFNWWDdqSHRxcXhTdUFob3RJQVVxS1hBb3pCdlhFL1RnSE1KY2Nx?=
 =?utf-8?B?b1kxT2hkWUk5VXQ1TjNwVVp3Tm4zbXNleFNMcUtaQXZDZ21KL0dkeUhleTN6?=
 =?utf-8?B?LzhKNmEvbnNoYXgrQzFueStoaUVSMmVuMUpxOEdNYXZiU1RrOEttWGEvQ1I4?=
 =?utf-8?B?VmVaazJ4K1BnUmYyUFgrQjN4WEFxU1lZc3dFTW05cjhqblZTeC9XU2pncEpI?=
 =?utf-8?B?K1hTNXoxNU1MQ2N1VnRURFY0ZlVIODFMN21rMDZuSzN4TkJNMUQ5ZlFNUThn?=
 =?utf-8?B?emV2Tml6M0srdmFnNU1zZGNUbnE0YU5CbFd0V2tEck12R0tSN0t0V05hWHZr?=
 =?utf-8?B?R20yWS8vWHgyenZEL1QxdGJEUklabjdGWXRCKzNDZWNubzJKNWVES0x5SFYx?=
 =?utf-8?B?d2RnbmpsNy8yS21jbDQ1TjhaaHVKWG11SnArSjJadUhTeXQwSW9uUjNIMWIr?=
 =?utf-8?B?ZWxJQUhPSVNrM2hyRXZrQ3BtR1VrOXFQcDgvZGJodm9UeGpiRTdnM25IbDJq?=
 =?utf-8?B?eTYvMGdscnpWOThCSHp2RFlNZG1XUXRKUHRyV0xaQjNESGpQUUl3WEpKY1hQ?=
 =?utf-8?B?TlYrVTIyaUo2L05yQWtrWC9PdVh0cGNHSmMzZkkxcEZRZ05JakFJbk1rT2py?=
 =?utf-8?B?cVp1QzJrSy9CWnFxMnIzMmh4Tk1rMENEd1pXMWRmNS9jbDBFeUppSmRLa0NW?=
 =?utf-8?B?NnB3dU5mTTBRQmZ3Q2pmRVBOT2FqWUFlT3ZlbFllSC9xMXNNUkpIRXlLNEdO?=
 =?utf-8?B?YTNkcldIYUU2a1F0SHIraVVIQ3h5bEpCYkl1aDBwT0hvU1RJSEt6MDJubG03?=
 =?utf-8?B?aEhlNWgyQ2JtQnpNdC9vbnpTZzhSK2drdVZBTkN2ZDVSQklyZFluMXVDMzE1?=
 =?utf-8?B?cHhpTlNCZmNTNE9YcE9BclBzbWNMaXpaSFQ3QTE3L2NDUVpmRzZGOHM0Q1Vs?=
 =?utf-8?B?QytRL0lGenN6UExBOHRtbXIyTmRUZ0FDVHRXSWdMWFM0T0JLWWM0bSt4a1d6?=
 =?utf-8?B?aUROSDNDdHpHRzYxeFkyRnBtN0ordTVoSENlTWp2TnB0SmEvU3h1Qk1tcFkr?=
 =?utf-8?B?d3hsMSt6TklvcWhJRHpzVHhnbXJFUXRSN0F6MUNzRFhzZjNlNTN3alJ2VzNS?=
 =?utf-8?Q?rQY0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aacfbd9f-e45c-490b-19d1-08ddb809409b
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 19:06:43.7285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yhpG8rP0sFQ22m1uydlsbtbpYNe7+jJSezJDnwOLeUOufOZDU7s7KfUTZgGtgsi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5601

Hi Reinette,

On 6/25/25 18:23, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> When assignable counters are supported the
>> /sys/fs/resctrl/info/L3_MON/event_configs directory contains a
>> sub-directory for each MBM event that can be assigned to a counter.
>> The MBM event sub-directory contains a file named "event_filter" that
>> is used to view and modify which memory transactions the MBM event is
>> configured with.
>>
>> Create the /sys/fs/resctrl/info/L3_MON/event_configs directory on resctrl
>> mount and pre-populate it with directories for the two existing MBM events:
>> mbm_total_bytes and mbm_local_bytes. Create the "event_filter" file within
>> each MBM event directory with the needed *show() that displays the memory
>> transactions with which the MBM event is configured.
>>
>> Example:
>> $ mount -t resctrl resctrl /sys/fs/resctrl
>> $ cd /sys/fs/resctrl/
>> $ cat info/L3_MON/event_configs/mbm_total_bytes/event_filter
>>   local_reads, remote_reads, local_non_temporal_writes,
>>   remote_non_temporal_writes, local_reads_slow_memory,
>>   remote_reads_slow_memory, dirty_victim_writes_all
>>
>> $ cat info/L3_MON/event_configs/mbm_local_bytes/event_filter
>>   local_reads, local_non_temporal_writes, local_reads_slow_memory
> 
> Please let these examples match what the patch does wrt spacing.

Sure.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  Documentation/filesystems/resctrl.rst | 32 +++++++++++
>>  fs/resctrl/internal.h                 |  2 +
>>  fs/resctrl/monitor.c                  |  1 +
>>  fs/resctrl/rdtgroup.c                 | 78 +++++++++++++++++++++++++++
>>  4 files changed, 113 insertions(+)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 18de335e1ff8..b1db1a53db2a 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -310,6 +310,38 @@ with the following files:
>>  	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>>  	  0=30;1=30
>>  
>> +"event_configs":
>> +	Directory that exists when "mbm_event" mode is supported. Contains
> 
> ""mbm_event" mode" -> ""mbm_event" counter assignment mode"

Sure.

> 
>> +	sub-directory for each MBM event that can be assigned to a counter.
>> +
>> +	Two MBM events are supported by default: mbm_local_bytes and mbm_total_bytes.
>> +	Each MBM event's sub-directory contains a file named "event_filter" that is
>> +	used to view and modify which memory transactions the MBM event is configured
>> +	with.
>> +
>> +	List of memory transaction types supported:
>> +
>> +	==========================  ========================================================
>> +	Name			    Description
>> +	==========================  ========================================================
>> +	dirty_victim_writes_all     Dirty Victims from the QOS domain to all types of memory
>> +	remote_reads_slow_memory    Reads to slow memory in the non-local NUMA domain
>> +	local_reads_slow_memory     Reads to slow memory in the local NUMA domain
>> +	remote_non_temporal_writes  Non-temporal writes to non-local NUMA domain
>> +	local_non_temporal_writes   Non-temporal writes to local NUMA domain
>> +	remote_reads                Reads to memory in the non-local NUMA domain
>> +	local_reads                 Reads to memory in the local NUMA domain
>> +	==========================  ========================================================
>> +
>> +	For example::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter
>> +	  local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
>> +	  local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
>> +	  local_reads, local_non_temporal_writes, local_reads_slow_memory
>> +
> 
> Please let these examples match what the patch does wrt spacing.

Sure.

> 
>>  "max_threshold_occupancy":
>>  		Read/write file provides the largest value (in
>>  		bytes) at which a previously used LLC_occupancy
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 84a136194d9a..ed0e3b695ad5 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -248,6 +248,8 @@ struct mbm_config_value {
>>  
>>  #define RFTYPE_DEBUG			BIT(10)
>>  
>> +#define RFTYPE_ASSIGN_CONFIG		BIT(11)
>> +
>>  #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
>>  
>>  #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index ef6ef58f180b..09a49029a800 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -956,6 +956,7 @@ int resctrl_mon_resource_init(void)
>>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>>  		resctrl_file_fflags_init("available_mbm_cntrs",
>>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>> +		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
>>  	}
>>  
>>  	return 0;
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 5fb6a9939e23..e2fa5e10c2dd 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1909,6 +1909,25 @@ static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
>>  	return ret;
>>  }
>>  
>> +static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v)
>> +{
>> +	struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
>> +	bool sep = false;
>> +	int i;
>> +
>> +	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
>> +		if (mevt->evt_cfg & mbm_config_values[i].val) {
>> +			if (sep)
>> +				seq_putc(seq, ',');
>> +			seq_printf(seq, "%s", mbm_config_values[i].name);
> 
> Taking a closer look I think we need to be more careful about how the
> code is organized. Ideally the monitoring related code and data should
> be located in fs/resctrl/monitor.c. Having event_filter_show() here is
> ok because of its use in res_common_files[]. Since it is monitoring related
> I expected its code/data to be in fs/resctrl/monitor.c, thus that
> mbm_config_values[] (mbm_transactions[]?) to be in fs/resctrl/monitor.c,
> (just like mon_event_all[]).

Sure. Moved mbm_transactions[] to monitor.c.

Defined it as extern in fs/resctrl/rdtgroup.c

extern struct mbm_transaction mbm_transactions[NUM_MBM_TRANSACTIONS];


> 
>> +			sep = true;
>> +		}
>> +	}
>> +	seq_putc(seq, '\n');
>> +
>> +	return 0;
>> +}
>> +
>>  /* rdtgroup information files for one cache resource. */
>>  static struct rftype res_common_files[] = {
>>  	{
>> @@ -2033,6 +2052,12 @@ static struct rftype res_common_files[] = {
>>  		.seq_show	= mbm_local_bytes_config_show,
>>  		.write		= mbm_local_bytes_config_write,
>>  	},
>> +	{
>> +		.name		= "event_filter",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= event_filter_show,
>> +	},
>>  	{
>>  		.name		= "mbm_assign_mode",
>>  		.mode		= 0444,
>> @@ -2315,6 +2340,53 @@ static int rdtgroup_mkdir_info_resdir(void *priv, char *name,
>>  	return ret;
>>  }
>>  
>> +static int resctrl_mkdir_counter_configs(struct rdt_resource *r, char *name)
> 
> This can now be named resctrl_mkdir_event_configs()?

Sure.

> 
> Also, I cannot see where the struct rdt_resource parameter is used. It should not
> be removed though, as mentioned earlier it should be used to ensure
> to check the mon_evt::rid values so that only events associated with resource
> are considered.

Added the check.

mevt->rid != r->rid

> 
>> +{
>> +	struct kernfs_node *l3_mon_kn, *kn_subdir, *kn_subdir2;
>> +	struct mon_evt *mevt;
>> +	int ret;
>> +
>> +	l3_mon_kn = kernfs_find_and_get(kn_info, name);
>> +	if (!l3_mon_kn)
>> +		return -ENOENT;
> 
> Needing to figure out this kn does not seem necessary. Can it not be
> provided via parameter instead?
> 
> For example, resctrl_mkdir_counter_configs() (rather resctrl_mkdir_event_configs())
> can be called from rdtgroup_mkdir_info_resdir(). I understand rdtgroup_mkdir_info_resdir()
> is also called for  struct resctrl_schema parameter but I think the fflags can be used
> to make the right decision. Something like:
> 
> 	rdtgroup_mkdir_info_resdir() {
> 		struct rdt_resource *r;
> 
> 		...
> 		if (fflags & RFTYPE_MON_INFO) {
> 			r = priv;
> 			if (r->mon.mbm_cntr_assignable) {
> 				ret = resctrl_mkdir_event_configs(kn_subdir, r);
> 				...
> 			}
> 		}
> 	}
> 
> What do you think?	

We can do that.  Need to test it. Hopefully its fine.
	
> 
>> +
>> +	kn_subdir = kernfs_create_dir(l3_mon_kn, "event_configs", l3_mon_kn->mode, NULL);
>> +	if (IS_ERR(kn_subdir)) {
>> +		kernfs_put(l3_mon_kn);
>> +		return PTR_ERR(kn_subdir);
>> +	}
>> +
>> +	ret = rdtgroup_kn_set_ugid(kn_subdir);
>> +	if (ret) {
>> +		kernfs_put(l3_mon_kn);
>> +		return ret;
>> +	}
>> +
>> +	for (mevt = &mon_event_all[0]; mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++) {
> 
> Here is a spot where the for_each_mon_event() should be used.

Sure.

> 
>> +		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
>> +			continue;
>> +
>> +		kn_subdir2 = kernfs_create_dir(kn_subdir, mevt->name, kn_subdir->mode, mevt);
>> +		if (IS_ERR(kn_subdir2)) {
>> +			ret = PTR_ERR(kn_subdir2);
>> +			goto out_config;
>> +		}
>> +
>> +		ret = rdtgroup_kn_set_ugid(kn_subdir2);
>> +		if (ret)
>> +			goto out_config;
>> +
>> +		ret = rdtgroup_add_files(kn_subdir2, RFTYPE_ASSIGN_CONFIG);
>> +		if (!ret)
>> +			kernfs_activate(kn_subdir);
>> +	}
>> +
>> +out_config:
>> +	kernfs_put(l3_mon_kn);
>> +
>> +	return ret;
>> +}
>> +
>>  static unsigned long fflags_from_resource(struct rdt_resource *r)
>>  {
>>  	switch (r->rid) {
>> @@ -2361,6 +2433,12 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
>>  		ret = rdtgroup_mkdir_info_resdir(r, name, fflags);
>>  		if (ret)
>>  			goto out_destroy;
>> +
>> +		if (r->mon.mbm_cntr_assignable) {
>> +			ret = resctrl_mkdir_counter_configs(r, name);
>> +			if (ret)
>> +				goto out_destroy;
>> +		}
>>  	}
>>  
>>  	ret = rdtgroup_kn_set_ugid(kn_info);
> 
> 
> Reinette
> 

-- 
Thanks
Babu Moger
