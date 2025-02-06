Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C53207
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 02:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738807359; cv=fail; b=VKPPO+0GfCoX9gjwQkk2St0ODbpAvhpbVhxQie27knWr7hY0Eo+eZYfxoV52xBAM8S803batvu0Qzg2PnhSGwiBqnjvEpaL6uo5xvBStKWRcxb3f1pSEgk25JkVmV9NLTqZ90Bjjbrn/Ev9E8wrDFkvOag3XX/15HrWc2+B7tFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738807359; c=relaxed/simple;
	bh=et2ldabVYXUhUh9JqzHD41jeGwmv6R991qsFt1exW70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NAxQS+OtUN+ZCxHA2SsrM4JPdZv0TngFa3TS90BOtLgh4llC3I9QCgvUOdU2BbxDWppXXe709t+DTAiHPUbLcKk65wn7SbTN6BcEIpKv1yNostg7N//ETROziQEDnFor1+kaKPzYiyAUOLfgR9+XwtIMGAiViGDfKZ9gCgoAXag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e/ny2Mt0; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e/ny2Mt0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlL3lvBHa1JhfNOljAp/uIDN3/X5I7Az0K66PPh4PXSytWtW8RY6cGct1GcQYGZSh9xbPvMZZ0lSAlYZLEurQh4StVbtoAcrtgwDOx6pxEUpZZAoUe1AmiiCCCzwDzsVWE8D6DYaAQ5l9+/At4le8QhHZlkTezT9xG02Ya4ZP++ULpLayBl77ftuH9SnoiJDEyVRp/DucpeKKoxI3CNTFw9oSFZtCUEz16N8u9seU5bhLz1055ZIKTaidurA4SHkDC13qw+oRCwPGn3+EUBY3Cvnz42BDmls0ynQSFyDxxA7XMBrCDEQTvtgE133DO/qL45DYjQfhRXFUlYOd9jUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIn3F/+Munzo+8qxmLmhx55iSRsz9x0MmCRDoK+eO+I=;
 b=GgPA8A9dxxxnZ0Zo5qzbB8M4yiBFgF347KI/Wb+2RrHy/HPxi8uzdEKsY2jtrkT0CHCCGWTEQ6Xcn4RThYvXyBNEdqtFsEuXmxg74nPk4lZ7brMzlVewq0DC2rGFqzZeaTs3L5Wt0AWv9gDaKaSM5UovdLacCo6+eVDcplwC5XBu6QIYxGpvfrddNeweLqEYSbuTBleSD5fFC3sot8+ROY2EEtui8IzEk514f5sS3zZvdPRYMG7MA2SwYEKsxMiXwZahbVd2Piykmjq4A1EeO9cXj3kPF4IIvdgzGVdoEqBfcX5iXCGdRA5t8+JTOZiFmEnBZruVw5eGDLxzOShhZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIn3F/+Munzo+8qxmLmhx55iSRsz9x0MmCRDoK+eO+I=;
 b=e/ny2Mt0aLzq1pEjcX8FYip7QyDjBuAQcsapaCyiRcM8++OsWmWuqhk9WmrSl5mSrCJxLjQ2bJ953ZJeG6fsuELW+NfNC9IDxZbvdMuxfeEnGQmxnNzHmDMstQ3MA8ab9MpZBKcvaD+ab692HRzA5OaXqEGjSQ2AKRMDZPIIJjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Thu, 6 Feb
 2025 02:02:34 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%5]) with mapi id 15.20.8398.020; Thu, 6 Feb 2025
 02:02:34 +0000
Date: Wed, 5 Feb 2025 21:02:27 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] linux/bits.h: Squash unsigned comparison warning for
 GENMASK
Message-ID: <20250206020227.GA322224@yaz-khff2.amd.com>
References: <20250204-fix-genmask-warn-v1-1-626de7a30090@amd.com>
 <Z6KF8UBsQ4NmR9KS@thinkpad>
 <20250205170651.GA56382@yaz-khff2.amd.com>
 <Z6PRRXgYYEoMbjsp@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6PRRXgYYEoMbjsp@thinkpad>
X-ClientProxiedBy: BN0PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:408:eb::35) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d279f1-eb0c-479b-47e2-08dd46525269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Um5KVXg1TTNEYTQ3T0t2NWQzYWppMzZNbVVFYlBoSXJQQXFYTFp3RDRNNTk5?=
 =?utf-8?B?K3R4cHlpY2ZIYzRNUWJ2cmJhd1dsT2lIQkNyRm5mWENJTW9OMkhLaXprWThr?=
 =?utf-8?B?MmpGY0VTS3pXaHo4NU1hbyt6N3ZycGxSbHlCeDROckNpbmhvWk1zOS96QWxU?=
 =?utf-8?B?UEVsM2dxVWF6ekpHblVlR0huUzhhMk1CbVE5bW9wR2ErK3lZK1NwWEZWaXJz?=
 =?utf-8?B?dllIYm9vSUQvT25FWEY1MjdXRVFXVTBOTEJrQS9vQVE4SFpOSkpFY0dNNXZh?=
 =?utf-8?B?ek4zM2ZzV1kvM296NG9HeVhBVktYWFdkY3lPaHFOZXBJRm1yZFhWeWk5VXM1?=
 =?utf-8?B?TGxqZ0cyd1NPekFXMk5ZTXVBV1BGcjFKdWpZRjhYY2JrNjB3Ny9PV0QrOTVB?=
 =?utf-8?B?cHdaRHVSR1RUWUEybHo5TkJCRG5QUU53UWo5QkRUbC8waFRMZHdLSTlNMllX?=
 =?utf-8?B?UEJFNEJINHdubVZXdjdFU1p4V2Ntemg2dWlxWHVybDZmS3VDY3F2aWpsUlZ5?=
 =?utf-8?B?RWxBcTlZY1FaREd5a3JmQVlEUFFTUE15Qm11NVBtZmVta3NBRnF5Qk9XRTVo?=
 =?utf-8?B?emQrUHNlalpMRktjenl5MFRZVk1FVG12NzY5eGozL1U4ZGd0U2haeENUazlV?=
 =?utf-8?B?UEhScXhwRlUramlNYmxIWk0xdUc4UElDaXNDSGNmTU9yeFROSy9LRnRZazlB?=
 =?utf-8?B?d1VPQTRPQkZHcENTRUN5a0FWMHVrQ3F1VkgvYXhFRFk4M1hySGM5RGsyZUZN?=
 =?utf-8?B?UGY0YWdDRTVkcTdLVW0wbGtyRHUrWUpKY1UvWFg0TDBTOWwrakVSZ0tndEtk?=
 =?utf-8?B?L3NiWEtZTm1GSGFYQXEyNVkwSlJiNWxoN1k1d3pMOWZtaTIrVGh0WXBCQTFT?=
 =?utf-8?B?TnE4UFlFZVorbmRPbkE2bFJ3cnFwTUpnT0w3SWxHV0YybURlK2swSUVuWVVo?=
 =?utf-8?B?S2hCTEFSYWpyTzFVSnRQZkxSVUdNVEdNNEJRU3l5SW9hKzEwSUpUT0lhMFdO?=
 =?utf-8?B?WTk5ZXhPQkFLYXdKVUV2VHVoK3g2QnhaYURNME9ONmJMZTY3U0tTbWZ5c01z?=
 =?utf-8?B?eHlqcS94RmhwUGlYOVczVXUyY1BTNmdVaEd2TEhRaGltSEtaTlNrMVRaU1Ns?=
 =?utf-8?B?T1dxajZTK3FXRUd2OHRzdlhLV0U0S0pyZVVKOW1jc0cwT3lEY3lIOE0yZjBK?=
 =?utf-8?B?ZWJLWTl0SktmMUNYZ3hmNXZqb0dCMDRKdE1ybTJ5QjFHWEU1ZWpBQ2N3N1BS?=
 =?utf-8?B?M2R4M2Fza2QrVFB6UUdWOHhBRllkcHJKVE9wcWJIQ0VoOE9sbzlBdTAxbDdj?=
 =?utf-8?B?NUpVTW9iVktRWTAwUnFkVHI4QnhGNnNZUm5TTlJwM1hWajdZMkF2MjRTejNC?=
 =?utf-8?B?QkxhUGFFaG9KeXVEWnk5KzBRQkdXT0ptQ1NKSzVXU1FWcTh6VStUOXRGRkto?=
 =?utf-8?B?ck1pdVhTZXN0dDBSTHVLdGpKS25lQmFucWsyMTAvTWw2Z3NYb2g5Nnp2dWdL?=
 =?utf-8?B?MS9BR3BVVkVGcWRxR3R5YU5rdzBhbU9UdUNYVE1BQXpab3poWGVHSEMzWms0?=
 =?utf-8?B?NDZCQU52eTdoQlR4ZUlQN3o2dXFWMlpZVDcvWFhnWGFYVitQQ1haQ0FLSmgw?=
 =?utf-8?B?WUhCeit0amJTalUyQXB3REFyRlU3NjdpRWFneFRHdjFqelIrS3NndGZHZUNX?=
 =?utf-8?B?ZUtjTHV3SnhMSmc0VGNsaEZFUzhmQVZJMzhoQ2xJcCthMTlGV0tZcUxOc1k4?=
 =?utf-8?B?c2UvVjJDYWJLOHhIR1dHTzdYSTNrQldmdk5IN3F0d2xOOWx1WFdMcXIrb3Nl?=
 =?utf-8?B?UURZLzRQWDhiUklBQU43cFZnQ1hQQnFUK2VxREJOWTJwVDNGNXVsM2I2UVlB?=
 =?utf-8?Q?KXXtVe1u2ea2B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk1aYUlWOGQ5SU9sUE1McU5oS0crUVVxdUZHVDROT3hzWDFycDVZMnUrYVl3?=
 =?utf-8?B?OW9HZXJrR2xuVzIwZUpFYUFqVURYdXhucUVJSnZScjFVU1hacmRQTlFERlJo?=
 =?utf-8?B?TlZNOGthYlR6MWxqV2g3L0FqQWtLOTR0RVNQdEd6Nk1aMDBvbzFZZ2hQcTIx?=
 =?utf-8?B?bXd0R2Z2Q3p5UlIycm0yVFhTL1RoMS84NStwaXlsZVVTUEltQ0RqQytPS21k?=
 =?utf-8?B?WFdzY2F1dG8rWXZQMFZoc20zRDZLVW50UUJMZXM2aVBycWdIck9VQnc3SFdy?=
 =?utf-8?B?VG83d21BL1hiMVJMTlFOMHBaQjJEYXBpZUZLZnMzVWFhcm5lUGdHM0dZaEt2?=
 =?utf-8?B?d1R5ZS90eGoyVE1vbXJnTmNmV2sza3BuU2pDczFDdjVCSnhwOGZ5QXdhRnpC?=
 =?utf-8?B?V1ZzeU9NNlZycTdGQXNOSk12cG5DblQ3T2ZOelJGOFFsbXJmeEZseGQvL2Nv?=
 =?utf-8?B?VXN1VWZqbDFUTW5saklpQ2tXNU5YOTA2LzY1WUNHMlZlUmZ1SVYxaVdtMFJ4?=
 =?utf-8?B?R3hqTHB5dVlaL2R2SlZQbVJob0ZrVlh2VG5qMWJUSW5ZRnkxTmJuS3dTM3l1?=
 =?utf-8?B?TkFLWVhWWVR3YkZabHp6WUxXYURYeGtKdUkzWVAvNS92UWRaWWxOOU15dVRU?=
 =?utf-8?B?bVYreGtKcXhoaWNGTUdFbHhSZHgwZUxSSHZtQ1o5ZWZXS0tQcHEyOUxBZXVC?=
 =?utf-8?B?L2tGeVJGczN0RnVocVFXSDBVbndwWGc0cGx5VUplQnFnc0VWUGxlSHNxTXZJ?=
 =?utf-8?B?VEI5anhtQUJ1TGpVYThlbXVNQ2ZieTJyMjVSZzlBSkRxSXRrME5HZ2VWL1Ny?=
 =?utf-8?B?emN3LzJyWDhxc21UdEk5L00vcjh5K3ZQMFhKQnBIaGZjZHBVY0FRZW9CRit2?=
 =?utf-8?B?TkkybXlEUkttSmZ5ekhybi8weGFUVmVyN2V1U3BwVHpSY1BFdTUydXBoUmY4?=
 =?utf-8?B?UFp6azA4UDZFWVpJbGE3Vy82ME94QklrVkgyaUNnRFhiUGtoNkpCVHRoWVhB?=
 =?utf-8?B?Rm0vVWw1UkFsWnoxNCtNZW43Z0krVnI4eVlhSzcvNWNSWnNINWVtbEtFajll?=
 =?utf-8?B?czB6Wmp1UEo1S2Z3b2Nod1FCdzRSMTB6V3FJdlVOSkpkbnFnZnoxUG1na25F?=
 =?utf-8?B?d1pBczNBbVpRUHl3M2J6LzN2UDdNYW1hVU9oSXdXeDU4THFleE1hRVdHWnBv?=
 =?utf-8?B?NDVubUhyTmJ4VHZjdlR2QzBTTWc3ZmNudUhadnVQaUFEQlVZZXNLZFR1dXRa?=
 =?utf-8?B?Q29JZi9OVTVrWUx3Y1JLUkpXVDN2Q3hBbXlFYjBLL0RHd1piVkZPcU9KSmVu?=
 =?utf-8?B?SFZGeHltQTl0ajNweFlZbUF2dE95S2U5SEpxVHkxOSt6T3kwN2p5VUM4NVJx?=
 =?utf-8?B?eHU4aU9icDk1UU53amluMDVuUnYxUmxJZkFuQW1rd2ZuL1lMRXNMeExuNHJq?=
 =?utf-8?B?QTlKcWM2RmMrdk5WbHpnYXF0aW8zcTErZlE2N0FYZXRqWldYVFpqV3c1UVhr?=
 =?utf-8?B?Y2ZQZFpGTk1rblliYXBHclBvaXhSM2RKeC84Z001blBhMS84R3RZSUo5NDRJ?=
 =?utf-8?B?aVVsWDFmM1FTbWxnOW0xbG15OVVnenVCdmc0MjR2UVdKcWtmQ253U2V1emRa?=
 =?utf-8?B?bmhhZldsYjZVZEFTSG90dlRqZDhrTEpaalY5QW9Wek5iY0dhREJxK05OY2x4?=
 =?utf-8?B?eGE1WndBY0hiVlFXbHdwZEY2eFhIYkJJNlpTTmtadEZhTjRMWDZydlM3bzEy?=
 =?utf-8?B?SjFUNCtZR0l5MlBHVjFJN1FPOFBwei9sY0RFNnRCa1J6SkUzdzZDSExteGlk?=
 =?utf-8?B?eVFEcFdxcUZ0OEVOMEJWdDMrRU85Rmh6RTdTQzlWUVBwcHlJLzhwYTFWYWdL?=
 =?utf-8?B?MkxXQzg4Mml3T0JjeG1DVDcvWHl2TnF6bHZVRWsvbEpXM09VN1VJVW1LbGRy?=
 =?utf-8?B?VkpxSXY0S2lIRHF0c2djY0VZdGlmUmRTTjRtdW1KcW0rbFdWOWw3cmdxYXlX?=
 =?utf-8?B?bW9HZUVTR2VlQkhuajR1Q2JZa0NNOG8rbGJGR1cvSjhyODVRYWJKMGI5TUxn?=
 =?utf-8?B?eStjc1hBNTVHTnl1U3pxZFBYRmJNeEVCTmZScGwvSEpBK1BGSUhIRlpYY3NC?=
 =?utf-8?Q?d88/VmTStbWAJE6pb/lK6SLEZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d279f1-eb0c-479b-47e2-08dd46525269
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 02:02:34.2778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpnU1TyyLDqc/ABI0c8QJcEDXadNnYpNnT3UODTP5RwIHZIlynQgFTdHx51gKt2Zk1E9MKBUfXxPxhBy+c9+hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784

On Wed, Feb 05, 2025 at 03:59:49PM -0500, Yury Norov wrote:
> On Wed, Feb 05, 2025 at 12:06:51PM -0500, Yazen Ghannam wrote:
> > On Tue, Feb 04, 2025 at 04:26:20PM -0500, Yury Norov wrote:
> > > On Tue, Feb 04, 2025 at 05:13:16PM +0000, Yazen Ghannam wrote:
> > > > Cast inputs to 'long' to avoid the following 'type-limits' warning:
> > > >   warning: comparison of unsigned expression in ‘< 0’ is always false
> > > > 
> > > > The 'long' type can hold +/- 2G which far exceeds valid inputs for the
> > > > GENMASK helpers (current max use is 128 bits).
> > > > 
> > > > Idea is similar to implementation in __is_nonneg().
> > > > 
> > > > Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > > > ---
> > > > Note to maintainers:
> > > > I found some previous discussions on this topic in the mailing list
> > > > archives. The upstream code has changed a bit since then, and this
> > > > proposed solution seems fairly simple when based on the latest code.
> > > > 
> > > > I figured I'd look at something outside my normal focus areas. I
> > > > apologize for the noise if this solution is too naive or incomplete.
> > > > 
> > > > Thanks!
> > > 
> > > Hi Yazen,
> > > 
> > > Wtype-limits is enabled in W=2 only, see scripts/Makefile.extrawarn.
> > > We normally shouldn't see this type of warnings even when compiling
> > > with W=1, at all. 
> > > 
> > > We have quite a lot callers in kernel already that do GENMASK(xxx, 0)
> > > 
> > >   yury:linux$ git grep GENMASK | grep 0\) | wc -l
> > >   13788
> > > 
> > > And nobody complained so far. 
> > 
> > Right, this is with W=2.
>  
> > I focus mostly on x86 MCE, and I was doing some extra checking.
> > 
> > > 
> > > Still, I tried to compile a small userspace app that calls
> > > __GENMASK(10,0), and found no warnings with Wall, Wextra and
> > > Wtype-limits enabled.
> > 
> > The warning comes from the GENMASK_INPUT_CHECK(). Using __GENMASK()
> > would bypass this, correct?
> 
> Yeah.. I actually tried GENMASK(). This is my code. (I have to pull
> more macros because I run it against Ubuntu 6.8.0-52-generic kernel)
> 
>   $ cat tst.c
>   #include <linux/const.h>
>   #include <stdio.h>
>   
>   #define false 0
>   #define __is_constexpr(x) \
>           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
>   #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
>   #define const_true(x) __builtin_choose_expr(__is_constexpr(x), x, false)
>   
>   #define __BITS_PER_LONG (64)
>   #define __GENMASK(h, l) \
>           (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
>            (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
>   
>   #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
>   #define GENMASK(h, l) (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>   
>   int main()
>   {
>   	printf("%lx\n", GENMASK(10,0));
>   	return 0;
>   }
>   $ gcc -Wall -Wextra -Wtype-limits tst.c ; ./a.out
>   7ff
>   $ gcc --version
>   gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
>   Copyright (C) 2023 Free Software Foundation, Inc.
>   This is free software; see the source for copying conditions.  There is NO
>   warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> >> Can you share more about your compiler, compilation command and config?
> > 
> > Compilers with warning: GCC 13 and 14
> > Compilation command:    make W=2 arch/x86/kernel/cpu/mce/
> > Config:                 make defconfig (on x86_64)
> > 
> > I don't see the same warnings with LLVM/clang. The '-Wextra' flag does
> > not include '-Wtype-limits' (at least on clang 18 and 19). But I still
> > don't see the same warning when I add it.
> 
> This looks like a specific compiler issue. Nothing to fix on kernel
> side, but you may want to file a bug in GCC.
> 

I'm able to reproduce the issue with your test code by using a variable
for the 'h' parameter. I assume many of the warnings around the kernel
may fall into this case, i.e. 'h' is 'unsigned' variable and 'l' is '0'.

From the GCC docs:
Warn if a comparison is always true or always false due to the limited
range of the data type, but do not warn for constant expressions.

So it seems the warning only applies to non-constant expression, hence
the need for the 'h' parameter to be a unsigned variable to trip the
warning.

My changes to your tst.c:

	int main(void)
	{
	        unsigned int TEST;
	
	        printf("%lx\n", GENMASK(TEST,0));
	        return 0;
	}

When compiling and keeping the intermediate files, I see the following
for the __is_constexpr() macro:

(sizeof(int) == sizeof(*(8 ? ((void *)((long)((0) > (TEST)) * 0l)) : (int *)8))), (0) > (TEST), 0)))

The "(0) > (TEST)" check seems to be the issue in that "TEST" is
'unsigned int'. So it seems that the GCC warning is correct, AFAICT.

Clang generates the same code, but doesn't complain. So I'm inclined to
think something is different with its checking. It does catch a simple
case like "if (0 > TEST)", so maybe there's something that gets applied
differently through the macros.

Maybe Clang immediately fails the __builtin_choose_expr() check when it
sees that any part of the 'const_exp' is a variable. And it short
circuits its warning checks. If so, then this could be a limitation in
GCC. Of course, this is just conjecture from me.

We could ignore the warning or do more complex type checking. Though a
simple fix is to reverse the conditional. Please see the patch below.

In any case, this was an interesting topic. :)

Thanks,
Yazen

From 00e95116ef5a971e53e49b732839edd5d0887545 Mon Sep 17 00:00:00 2001
From: Yazen Ghannam <yazen.ghannam@amd.com>
Date: Mon, 3 Feb 2025 18:44:33 +0000
Subject: [PATCH] linux/bits.h: Squash unsigned comparison warning for GENMASK
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Invert conditionals to avoid the following 'type-limits' warning:
  warning: comparison of unsigned expression in ‘< 0’ is always false

The warning is enabled with W=2 and is present on GCC.

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 include/linux/bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index 61a75d3f294b..45f70fb56ac3 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -21,7 +21,7 @@
 #if !defined(__ASSEMBLY__)
 #include <linux/build_bug.h>
 #include <linux/compiler.h>
-#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
+#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true(!((l) < (h))))
 #else
 /*
  * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
-- 
2.43.0

