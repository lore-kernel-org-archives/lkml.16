Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0968126C05
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 20:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745094643; cv=fail; b=llzbyL7QlYzUYAbR0CMhAVMXDEBWjCXr2szICXkR50ycn6d8ktTgRN9pqlD6I/6M+blfe9FNkrat/Wpe2OCl4PJ4yEMOiixPTBXSLkB9UXH+76Ozufkdnkzoz9An4NOJ+mXrLC+sqQE6jWMYgyEaO9JtlwDgZNtJpllw71r869E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745094643; c=relaxed/simple;
	bh=WD6jjm1mnrdyeDdzGM8fjPfZgngpOmv4zRAOCxT/ReE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Cs7NupBdp9uodwQ7mDAP79CbComi+wMmNui5M/0njl7g/yqbLv79vslsmPwnHCnUns59B9FGMtKDYxcVEn19lx+qChsNqSgID1CeA6sxC8Iz7VyPslHYEN+53Kfw+WhP2NtefSquOCxy57YqDoGz0faPKaI45I0hcz8eUmdV2uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TPbhiUix; arc=fail smtp.client-ip=40.107.96.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TPbhiUix"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3+OtbWg9VX26LkJoDd9/vxi07I40MaQ3EFAyiuGlr9wu5bF1qu7O2up1lE9t8Hfnx4otI7CxV/c3rFjh7uqDwqgIY/GDYDTT5iRtlf4daGLjpHzcqy7/DhL+19xnkTCZu84u3z78RkE7z0cfwoXB2f+ueps86ovkmkXtzSC600wS51UkWsnSWdnHhpXLhqE4MrUgP2yCgr9SYZiE04Wlawx/SdDJvVbprVJqA+07s1GMi0kGRMV43KghYSkUuL0RUZ1eyPjAmV+Z4P5qnsBcjUggSUWpUyn+UjItSV8WainIFeo/Ba4zzOwRBxx3STh+nPjpjbyVXo6vK6VJpF9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YF/hufS7XbkP+O8cenZIFS9bjGdyBTcZYv6AxsOC0Fw=;
 b=qGNeuHMdasp1iJW15qcUDtQScZjJZUA+oH9cHFxvk0/g23u4qzqCSO8/thRwSpCso6cd5gEnG4rJ1uJUSUdgRa1Ga735NpNbwzgufDDqzK4jdBaBuBnTkUGMlMPREr6SWSFK4UEoSGg3oW872PHQtUhFpHhNbcc/bpmwR4eor6OuSCow3uyDsagqJ10yDXPT7tf2SsVxjbCMetaISUcTLOjGnvH7ZWEGQD8NLYbxSMyba/KNoTZQdUzWWG2+U7gnbYUqUPuGOfDHROCtnG2kQtmGLNmT5TzIjvhdLe1wlQ5OjK4itZrPj9/8JrU0fiQ3jLfxEW8fY9tMCy0d+yICig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YF/hufS7XbkP+O8cenZIFS9bjGdyBTcZYv6AxsOC0Fw=;
 b=TPbhiUixJIRbhqyLkz8SU+1xR5IGYDVv0ZEeGHgx/+g1WH2eIOObkx8p/gtYeBrREVsdX5ZCJKqGb278NlHa33jAP7SyE9pbwG7E6OWFmx5LB/SDEz11h1NmWUfkmYFW5lk+CMojGhC1oZzcqRlNnW3yHUbBn8lGGWg7DfzkWDQwt9ppJF6TRQZO4u50LiNeBZKoG6ZerdO5shAcDENnavv+2J0uQJeOVVrGaRZGrLsyNpnmtIG3fsKKP77jG/YG1AaipTXDf9a0ZmjtBBGlkcCNVQaOwgrnrrryY4zqPu/UVVJCOdNMbYZ6xoGFl5QCfaIYEzvd39aD7l+X0TYu1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by BL1PR12MB5778.namprd12.prod.outlook.com (2603:10b6:208:391::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Sat, 19 Apr
 2025 20:30:36 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.022; Sat, 19 Apr 2025
 20:30:36 +0000
Date: Sat, 19 Apr 2025 22:30:33 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched_ext: Track currently locked rq
Message-ID: <aAQH6Q9tTmLvozyv@gpd3>
References: <20250419123536.154469-1-arighi@nvidia.com>
 <20250419123536.154469-2-arighi@nvidia.com>
 <aAPemAFUsJaF_C2X@slm.duckdns.org>
 <aAQDIIPOUAU-nB_F@gpd3>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAQDIIPOUAU-nB_F@gpd3>
X-ClientProxiedBy: ZR2P278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::11) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|BL1PR12MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9131a9-f1a4-4c7f-b61f-08dd7f810ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHh5VEwvWmZEbFNXN1hWUFlOQnNjdUg0Q1g3VlpaWmVtTkdYRThpV0tPd1Nw?=
 =?utf-8?B?VEpUSG9WNENuZ0RZdXNuNmgyT21DVEl5YkxDZmsyV2l6bEhicmpOSk51Tm1u?=
 =?utf-8?B?QmZDa2k2Z0U4em5iSFZDcTJ5bHpmQkFySnR0SUV5QjE0M2tGY01qS1ZhVmh3?=
 =?utf-8?B?YnpQN09mNTc5ekJOemRENFRabEVRNkxNREFYNVJacW5lNFhGOHkrQXduRS83?=
 =?utf-8?B?VFpONTA3bHZxS3AzSTR4aFR3cElUVXE4YkNtNm1xVXVBeDZGRHRtdkRDNDNZ?=
 =?utf-8?B?Ym9UNlRFeFUxYW5ZVmxaYnAwV1VKbXQ1UEczZmJBZHJXV05semRuR3pNWU90?=
 =?utf-8?B?YVpQRGpUYkVvcWsrUlY3NitjMmltNGRYZjg2U1pXYlp0a05SM1R4OVVwU1l5?=
 =?utf-8?B?WWxFYnd5ZGtkYjV0RWViNVhlRnBNeE9xenNSU0dqdEVveTNoNzJYTEVMb2g4?=
 =?utf-8?B?bGRCUFNYTE1DbkxWMjlvNEgxczlNSitidUl1YjExejFQSElzbm83Y0twNFlB?=
 =?utf-8?B?V1ZkazRNSnVYTlRPcWc2SGpTNHRWNVNpeTlqYVZiRTh1QzBLaUtscU02ZWpI?=
 =?utf-8?B?UmNJOTdRTi9lZEZqOHlvQUc4TzV2anpRT2s5Uk1mYkJ3YndNSU5nM2EyWktY?=
 =?utf-8?B?NHlQREVUVHFtS3kvallDNUVraVdKVEt2eEtibVBzWHdueUxsVDErcVFXZTRa?=
 =?utf-8?B?K0NsZ3JUYjZGYnhBWUd3MzZsNUlnU0R5Tkh4c1NhN0dIbFQzUmo1V2FkUmVG?=
 =?utf-8?B?RVNtY3cxUkRyS3cwTDRPWXNkK3hHS3g0MVVoUEl5YmN0eHl3dUtmSzVCMWtz?=
 =?utf-8?B?RkQrWUtneFBOcDI5dUxjSHEyMEpYOEpZa0J6SWVrTkY2bUN1UW1PWmZ5ZHVI?=
 =?utf-8?B?c0FSUGVDNmpVeHlMTG1BeG1Vc1JEcFRmblRXWnVGQlpJenFxcGNjYStXcjJm?=
 =?utf-8?B?UlhJeCtmMGRIbUZiTmp6WnphR0RXSkNyNi9WWWVLRnlsdXhnQ2YzQUtOUFhs?=
 =?utf-8?B?cHJOaFlQUFpUSXFaMmVzQUxxQ3hGcW1FOVpwR0J6aHY0QVFoN1VyL1RPSTRU?=
 =?utf-8?B?dXdLYmRESDc1L0hBaXdxUE1vcTRUS0QwT3ZCRHVOOXd5bTUwaTJTeGdTVkY3?=
 =?utf-8?B?eUQrRkxSZERpQ2k4cEo1aXVadjZSQ1EyRHZ5aWJDQWVQek5rYkFJZDVUK1Bl?=
 =?utf-8?B?Q1crdjY5Z3k3ZjVHM2RvRU5rcnRYY1pzYzlzcXh6ZGdzcEQzQ2Nla2RKNkNo?=
 =?utf-8?B?bm56d2hLdVJ1MFdlVkFPcXQycEhYZ3c0YVhPa1hmV3o1TmZDY2dYRWpLTEJL?=
 =?utf-8?B?S0tOUmpHZCt6VTNTYi9DcWN5L0lRVitqRlhJUDNmTUVuR0ZUTUZXTGZVNzA4?=
 =?utf-8?B?TG1EWjRiZUsxSExzT0R0Z1VWMDU3azA2VTVVZmlvdkJWemJMaEhydHBQWVNu?=
 =?utf-8?B?b0cySGJTNnJKRlNCTVBoeWVVc0NFTEJoZVJNSGIyOHlmRng4SHVGK05VYU9a?=
 =?utf-8?B?RCt5bWxINjV4d3daUWFwM0hUbkFiZ0hROUZDeE14eVFtT1M3VUN6NmFxam9Y?=
 =?utf-8?B?MHprdmo1YjdNcXV2eWRlTDBEeExIRnc0VUg3amluN1QwZzBIMXNmbWV2V2s1?=
 =?utf-8?B?Um5sbUZjMkExWndYN1hlKzVVbHl1OG9pRFIxZEJmdjlXT2VNVVQvUmYwZURa?=
 =?utf-8?B?dEIvSUlhWDBCWEE4cmVnYWhNOUFOUVA4K0N4OWg5SS9oUVpqMDYxdWw3ZzM3?=
 =?utf-8?B?aGI0c1NnSGZjRWN5azlGVUJDaENjaG9rT3NhRzd5U0g5YVdkeWZjWUw0ZDB4?=
 =?utf-8?B?T2tnR3NNWGlJM3VSOFAvOGJsUzYzWXBTWFUxOUxMeDl3S3NCQnNhUStIV3hj?=
 =?utf-8?B?NmhBbXVQRmFwOXBLZkswRE5mYXY0a3ozdlJmeFpSdzAydHpnNWYxOEM3WkFS?=
 =?utf-8?Q?NSnr+B01kJ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVBrZXJZZFpiSnVGdWRHTktadUptVXVFWWZZczlPeTdOT0tYRUNId1MxN3lK?=
 =?utf-8?B?Q2xHdW9HWmZZYXpSK1lxTzArUVkzdzBIK0tLRkI1WXVzdTBEakYvTlZaNTB6?=
 =?utf-8?B?aTQ1Q0xoMVprWk04NENYNDdZcjFsR2RRZ0NZdnZ4RVM1T05TL0szUGtYTCs5?=
 =?utf-8?B?UzhJM0J6eXlmck5STFhrU1A4aXhjcFhBcitjZk54cGNCQ1hLUWN5d2Y0T2hp?=
 =?utf-8?B?eXRIUFRpM1dFMmpwODNWVkowTWl1WVFWSG5ZVVlZRXR4a09UVmVQckV0UzYv?=
 =?utf-8?B?LzFHNkJhdStmT2t4NVlZMUNtclJHWTYxRFlDVUNWT01VUjgzL09Sc29tQmor?=
 =?utf-8?B?cjljRUJTRnN2M0VGQ01TWTZBRWNzTzJYTGpYS0FnVXhkRHlKek9zOGpRZ0VF?=
 =?utf-8?B?U2F0bDFsMlcraml2UDB0ZmNFMkJ4SVptY0FBdEpLdWJsSlFPcHdBbTArODJJ?=
 =?utf-8?B?SlNDb3pqL2g1Skp2K1huTXBESGFaeC9WQkZXZlY1a0hpU1lVV2hhSllIa3Za?=
 =?utf-8?B?S21MeEZubHRuYkpmZFpObUJsM1cvaktSTk1hTDdsMTAvSlFBUVNxZUdJQ1BE?=
 =?utf-8?B?YWt1QjVOZ0JJUGg1Vi9jQ3I1R0wwQ3Bnb21vNlpScUNCdld0ZWxQYzQzQ0pW?=
 =?utf-8?B?TllWUExpcDVRZnozZmJBVmlKdjVCLzBFSGRlUzd3ZlFJV2dWejRBeGU3cEsr?=
 =?utf-8?B?SXkyYVBSbjdXTG42T0ZrN2xZQTJiRGl1em1CMG56ZXZLY2VkZkYwUmJFd0s5?=
 =?utf-8?B?U215a1liK2VCbWhtdWpXUEVSOTRuSGEvUzJ0ZWFQUjFzTWhaWS8xUkVMSHMy?=
 =?utf-8?B?Wi9aejd1V0lwSGVKQ2VqTDJLcWxlckF5RnRKSW0wcFBNd3FUandPT2t6ZlpM?=
 =?utf-8?B?T3NibFd0dGljbWFYR3V6SmJCNllPeVduYms1dDZKYTkvV3BqYU9MTnZ3RXI3?=
 =?utf-8?B?VDJjWWxEczZtMFFiZTM4NFFxSUpYekJyTndlKzh3TGlCbmIvZFhsa2RIdDQy?=
 =?utf-8?B?NytnSU5pdzZGYkpVMTZ5T05VbmhZVTRwaVVqR09zbUI5S0VaUzhzbUpyRkla?=
 =?utf-8?B?K2tCOVlMSlAyeFBQZkh2c0NzMThWVC9OWThmcGErbUlBNVpHaUluWWprcjVa?=
 =?utf-8?B?YWtZcHdoN3ZRVzZ1YlV3bmUzOUx3ZWdTNmU1N3hHTnpBTUxSSXRJWUpXMU5R?=
 =?utf-8?B?djB3NDQzd3I4S2ZRSWxZTmdqZVIwelRGSGdJRXhLdnRWZzNTcVBHa3JTTFA2?=
 =?utf-8?B?b290eVJ0SXM1WlJTV2dTNS9CV1NINlFQeG5DRy9udytsdFN4QURHZytoUGMx?=
 =?utf-8?B?SmFDc0hhODB6bXdnZ3FwWllTUjhrM1l6M3JJZVAvNnVwOFFaZ2xxR1BKVUJk?=
 =?utf-8?B?am1xaDUwd1lNK1VXckZHenJRMTROYStDbDlVMUhnOS9qOU5kblRhQmtaOXl0?=
 =?utf-8?B?dHlSdndhbUs4WXEvRXFIRXZ6ZE5oRTJ4Z0MzcS83RTFkR2lmTlo4cGRMbmtL?=
 =?utf-8?B?czRvYzVuamxIdnFHK1JKY0tkUEN2N1FsYWF3dmtxVVJQRzkwb3NJbDZadlJE?=
 =?utf-8?B?SGlNOG1kUThoZ0ptQUdMWW5McWhmbmxqZ1VQTEJaMk5IaGlGWW0vVW1PdXFE?=
 =?utf-8?B?WGxNakVUZHVOMmdxMHkwRzBQbHl6Tmx5eWc2WGh2ZWlxZEZTeElwODUwY0tM?=
 =?utf-8?B?VmJ0eW9ZL0pUTGluK2VYckNTU3g2R2o3K3lUZm1lOEtHckpjN0t1azlJVEVQ?=
 =?utf-8?B?SDkrOElFN1ZnK2t4ajhMY3FZSXNNT2dpb0FHUlM4R3VtNUpuZ2lxODBzWXlq?=
 =?utf-8?B?UWhGL29HQVYvMmttb1BmWENUUlB4ZWxKM3BFLzJsMThjbjNKK3J2M2dzSDc4?=
 =?utf-8?B?KzNRMUFlb2oxdEdsWG5hQjZZVnlIVzhEQXA3djdGc0N0d0MrRGdERHg5UG55?=
 =?utf-8?B?ODB2eFRxV0dlMFJQN2dNa3pEWGYwOGpJdkpRdHB1Rk0vOG5ydkQ2RE1RT1U3?=
 =?utf-8?B?bjhHcjJGekRETW13R2s5QlZLMWtFaXNCa0x6anFDUlByV0pmK0lTMHZXaWt6?=
 =?utf-8?B?ZzFacG82SlFkd0Z5NWpWeCtCS3E0a3lqOFk2eEQ2SHhFQUpOdVB0TEJXNndh?=
 =?utf-8?Q?8/Qo0Zdlt+dPSDp9vJam9smEz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9131a9-f1a4-4c7f-b61f-08dd7f810ad7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2025 20:30:36.6712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmwJhEOY90Rg7EMzFnd3omoXIOcBW0RKhUmSBX25iIF4ilPrIrGdFq0Q0YeKzLu5bfrOnCxcg3A+MAJURmFesQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5778

On Sat, Apr 19, 2025 at 10:10:13PM +0200, Andrea Righi wrote:
> On Sat, Apr 19, 2025 at 07:34:16AM -1000, Tejun Heo wrote:
> > Hello, Andrea.
> > 
> > On Sat, Apr 19, 2025 at 02:24:30PM +0200, Andrea Righi wrote:
> > > @@ -149,6 +149,7 @@ struct sched_ext_entity {
> > >  	s32			selected_cpu;
> > >  	u32			kf_mask;	/* see scx_kf_mask above */
> > >  	struct task_struct	*kf_tasks[2];	/* see SCX_CALL_OP_TASK() */
> > > +	struct rq		*locked_rq;	/* currently locked rq */
> > 
> > Can this be a percpu variable? While rq is locked, current can't switch out
> > anyway and that way we don't have to increase the size of task. Note that
> > kf_tasks[] are different in that some ops may, at least theoretically,
> > sleep.
> 
> Yeah, I was debating between using a percpu variable or storing it in
> current. I went with current just to stay consistent with kf_tasks.
> 
> But you're right about not to increasing the size of the task, and as you
> pointed out, we can’t switch if the rq is locked, so a percpu variable
> should work. I’ll update that in v2.

Hm... actually thinking more about this, a problem with the percpu variable
is that, if no rq is locked, we could move to a different CPU and end up
reading the wrong rq_locked via scx_locked_rq(). I don't think we want to
preempt_disable/enable all the callbacks just to fix this... Maybe storing
in current is a safer choice?

Thanks,
-Andrea
