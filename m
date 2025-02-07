Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022083.outbound.protection.outlook.com [52.101.43.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D5F175D5D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951850; cv=fail; b=r0p2UbKhxoVtDLuqeka09ERuxnz9l+xjcD0/nHr7shngpbvG7fRVeJP2gmOZcLhghCVBEF8eB/f7z26PVDv3wzZGB9FdcDDDn3MSAPhBZ0ikZkCZOaLPwBt1wRj977Lw4N4eDYlJTZJ2ZZPI3aIEE6MuReGXpDWH+o2bpKvcECw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951850; c=relaxed/simple;
	bh=rPupZVRUSGeAk9EZ5e80NQCf/Y3xVQrF44Le6drFyL8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sc12E0UbotNx1qjytUG19Ewumx49nT+i3FLdgs78h+kbXISL9qHsqsaEXq28/5+e33OP4yebC3JXl93jfVXKJPzQcxOt0PoTwYhJrZh/F9dVpM9ELCu+QW4BCZy4I+w0g38hjHRByYY3Cd0KLOEihLkBBhP47c3+Jme5kkoejWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=FEmrA5F8; arc=fail smtp.client-ip=52.101.43.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="FEmrA5F8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiVqv+SM1C/HfTDsbvjHj2yvhui8KlOXUu0qldp1cvAehE3neneFAjFw/raF0DqrSnSe5aalfVSAUXgz56CuGjLH/UUPfMNmBDMb5oe3d6feigSMQDI5oG+r+NhkLxKSXfe7jzdFyLG/pgCsq3gkGmqOh/Ve/4y4d6ZmoIuhnT3CC5p+6SqOIaJtNaK0u+UbytTRkgSHyB0KgGa1Q1AxSKBNHxmryqOm0RV3NV5tqN9vgzOY9iWfm5PBREaAJeDefz5PWBfO7k0FBHB6zppzkgo1fXwwXc2/cN2iMY9txpo96bTmeFgjE8jjiVFoGo/1lEWbppR06kgPEaq8t0AhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D55CnIQl5DW/GMiiOdV8oqNLfgHdkKzQroHHrH/IvIo=;
 b=y7cf8KBqOPSYQi0HTh11toVPlrCmxunrL4i44SbY47xo2HlA6EUVqKmvllI/QOmt7EFisSRbogLm+tLVTi63Mktf7felcTuBnPPcuvXyJadWxIxGfYvOel7Mu+Q18M5l1cBmH5xCAVhnzdNbmfbljKjnd5cZZC650iEcEXrgeVWOjI6UL4PXFTsWCrCVNUMORPfRSptRPoGJ2HzgfIshEaXG0YH2o1NklFDr/r3Xn0/rYPSv8IMz9FPI0VjAtkaswkBIRhWz6rCp3OrwCqoMV6wBosJVvcxSyO7u/uIGBGldD0v/4pBu78rECW9IL2RPG/0/YYd83qyG9Od3AJ3dCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D55CnIQl5DW/GMiiOdV8oqNLfgHdkKzQroHHrH/IvIo=;
 b=FEmrA5F8GAA/J5hYn2hKrlRUeAgOxyEIv3/EHC6BicP5GuQAo2Q2EZAZrkW3g4ZYZF9SVdd1DGyEnDjVRMSmj9XXemQOww2rFomTPgdn5cFyEDlJvt0KsGZPcG+mfOzuuxSt3W5r7hpO3TgdDKcrdUBXcb5fGMXvqIzP5oikZpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH7PR01MB8494.prod.exchangelabs.com (2603:10b6:510:2e8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.7; Fri, 7 Feb 2025 18:10:41 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%5]) with mapi id 15.20.8445.005; Fri, 7 Feb 2025
 18:10:41 +0000
Message-ID: <eb5896c7-c269-42a8-8fa9-e5e7c23812c4@os.amperecomputing.com>
Date: Fri, 7 Feb 2025 10:10:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] /dev/zero: make private mapping full anonymous mapping
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 willy@infradead.org, liushixin2@huawei.com, akpm@linux-foundation.org,
 linux-mm@kvack.org
References: <202501281038.617c6b60-lkp@intel.com>
 <01b5c112-480f-40dd-892f-5eb7c53e2f68@os.amperecomputing.com>
 <Z6RshwXCWhAGoMOK@xsang-OptiPlex-9020>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <Z6RshwXCWhAGoMOK@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR18CA0009.namprd18.prod.outlook.com
 (2603:10b6:930:5::24) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH7PR01MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d120b8-0dd0-44f5-59d6-08dd47a2bb48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFQ5Yy9jM2VML3NUSnppeVBCYnVrS3NGeEFNVTExNTRCdUp2THQvVTdPYkhP?=
 =?utf-8?B?a29lWWs1YmtmaXVONko0MzlLVG5yclhiRlFUVm9RMXVDc1RHODIzdnZDcTVJ?=
 =?utf-8?B?UUxvbnZ1TjRrdis1N01oS1M5enlKOXhkR3p6SDR6eDhKT2pXTFhSMk1tZXo4?=
 =?utf-8?B?bEpMK2ZzczBqZkNEek9GcTlYR1M0Y0tQeUwzaXdPRThaZ0J2NzArbHdvSU96?=
 =?utf-8?B?WGlsRzFTOWJIbFRwc2xIejdBUFJ2T2RvTXVjOGZaMWVITVZMZ3duTzY1M0ZY?=
 =?utf-8?B?aDErYVFzcnAxOU0zVGU1M1JlWjhOdnM0THUyWVUrcE5zU21DSnU1V3lUWnJ3?=
 =?utf-8?B?eVpNaysrZERLRC85TkovajNhZE5BT2xKVXhWeGN0NFR4dGtZbEptTFdJR0Nj?=
 =?utf-8?B?M3BLTWkyZndqZ2lOVy9qU1hPWjFqVENsUzA2RWpEZjRwbXNGbGoyamJ3L2Yx?=
 =?utf-8?B?OXdVYlJOM2ZaaWVlWU16WFh3STRKNzR6bXRabVZQMEltR2twTzFDbDAxd09r?=
 =?utf-8?B?blF0T1A5TkJocURrWnI0RXFFQTFyTjlGQm1HQ1F1S2ZqTjh5MjFSK05BZnNn?=
 =?utf-8?B?Q1g0N3FYc1JMVDJGdEdxRWsxdlc0L2lPNUxsc2swM0c2WHpIQkRpMDBvUHI4?=
 =?utf-8?B?S1pROHlTZm50R0xEQm05bDBhanJlVTQwQjR1dzZqQnVGTnZreERrRUtucDRR?=
 =?utf-8?B?cERUNlFvYnY2RUdxUTdkZ21HcnZwZGI0eGx1OWJQWVJhOWxGbWNwaG5RczMv?=
 =?utf-8?B?TC8xdDJwbjdkamVCV3BxWXVIeE5yMTcySE8xVitqRVhOOFFSMkVsQjZyWk5n?=
 =?utf-8?B?dTQ1bVY0VHhFMkQ5SDR3b2dmbTdpNHBHb1FuWkFBRm5iQk5ENW51N3Y1c2Ur?=
 =?utf-8?B?bnBBekNydTAvREdxdFBYcGVKR2tDNURLcWVtWCt6N005QTFBZnJ6T09YUk13?=
 =?utf-8?B?L3ErQ3hsRVpCempNdFhFL1NnRWdhR21GNk9lUmhiSDA2Y3o4NTRnK3BGWStV?=
 =?utf-8?B?OTVWcWNEZjR3VVBOUXJ6bXJ0OFY1QzhJbzB3Q0F4ME9EU0MxdW85NjlqZk5J?=
 =?utf-8?B?cHFWVlByY3RIbnlLbFRRcDFQNUYxeHllaGUvdXM3bENOYWdKaUx6aTlMR2d1?=
 =?utf-8?B?S2ozMlE2cjd6NExNNmhvVHhjK3dXdGd4NnZ1NGtVMUgva2VQczRWbFZaaVc5?=
 =?utf-8?B?ck1CQU5DT1lTaTFjMXFMS0ZaKzlnaWRkaU1DcTVZbC9IVlJkM0k1YkpWNkJp?=
 =?utf-8?B?QUNQV2ROL2FmRk1KaVdrMDl1MWlNUC80MXJEK3NkRFk5MTVNNkRnc1BUZndS?=
 =?utf-8?B?S05kK012cWRGeDFwSUJwVHNWWiswQmtHbFlkOEJaTFlrdXk5UXBDUExIWW1E?=
 =?utf-8?B?d28yRUR4R2p2cVFEVmkwUkpTL3ltTTBpM2J0VjBhR2JaMUx2MEZBM2ZGMzRU?=
 =?utf-8?B?M0QxVmxCakFOdTZ3Q3BnejFkbkpjRFRrOXhzUmI2SUhIUHlGUy8rZnluWGhZ?=
 =?utf-8?B?WGtMS0ZsY2Rwc3ArNm5Bc0tUZThKL0VQVjJ2bmE0VExzRjNkelRFK25NbDFm?=
 =?utf-8?B?K1VNZzdvZ1FYVUFUWmxVbHl6Mkw3VG1YcVBsZlZXdXhSWkFOdzVRWDJ2NW0z?=
 =?utf-8?B?TGIyWDV0UjFMckJsL2pyZEcxMUtZL3IrcFptUnFLNVZla1graU5UazVDRm43?=
 =?utf-8?B?TTlrOGhBNHRuSlJwZ3QzTjYvM0Q2ZWRKa1FTN0EzNkdibVltUTdOZlQxYWlJ?=
 =?utf-8?B?cThRZGxtejJsLzc2WmE1eXVETy9BdDBrcmJrMTVkRkg4VnZkdWJ2SjFDQTlq?=
 =?utf-8?B?Y3VTQmlFSjNoeEFaamhDdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmlvQzFsaktzTjNjREYwMmFGQ3RHNGpvcDU0NUo0ZGY1Y3M1N2llWFdacUJR?=
 =?utf-8?B?YVl0bmpnU1dTTFBlZUxjTWxCTGRSWFRQTlFLcm1PenExY3o0U0J3N0Yvc3hT?=
 =?utf-8?B?aTBVaDRLS052NE42TDcwdmRoem5mb0VyWldQemdaN3Q4eW5NQmNCWUJWYnVR?=
 =?utf-8?B?cGVZU1E1WHRIcEJXelg2cmFnaXE5b0JwMFMrcFhSTXNwNTUxUktOeDAwa1ha?=
 =?utf-8?B?OHhUWkVNTUNmUkRCeWRwR25BekJjR1NVZmExT0c5dXNmdnpkMWF6T2IzSmVi?=
 =?utf-8?B?QzRnTHVKSnBuNnNzaW1kVUd2Rk5TSlRSanNTSlRsRWkwYmVOUWI3aHB5V1ho?=
 =?utf-8?B?enBLcTRtd2luOEdodkxsSjFSTDJVU3pSUUJsZ0lhVVhPUTBzblhMZFV4bWh0?=
 =?utf-8?B?MnhoaXRNR1ZUZWV2cGsrb3dhS3Z1azhiSWpNREQ2L1NHc0M5bG01UzlaWWRQ?=
 =?utf-8?B?ZXM4K0pDVENlQlpFb1JUc01vNk1CWVFQZVljZklac0xtZDlGbnBLWlN2d3FF?=
 =?utf-8?B?ODRxL09mcE5WaXk4Wkk4R1RCMFBJbEIycWFuS2Q1RWh6cTRVSHJQNGlzaXA3?=
 =?utf-8?B?TW1Uc0h3UGRsV3l6Ny80WjdOUk96OTEzYlRVa3ZJUEp4Y2NpUGc0eEdCanNq?=
 =?utf-8?B?KzQwN05wcVVYdTREYVJRNHJsMklsSjJWdHROZ1UvZWRYNUhRenZsNkhsWjVs?=
 =?utf-8?B?WWpVVTRoZ1RmZzB5TGpsbkRaQTBGcGpZaXBaNDJMdDdFWHprczFiejIzcitw?=
 =?utf-8?B?YW9BdlRNVlRIL29OZkhyTW9BL2FvZkI5ajFXVmpDS0VlWnJyVkgyZTBCUmRr?=
 =?utf-8?B?WUtndklhdUw0b3pSYXE4Z0dkNUt1Wm1BejFudTJWSUlVSW1oTTNIMVdaQmdQ?=
 =?utf-8?B?bTNRNjBDQXhkajdnU2pIMW9mNjBYWlRpcGpiM01VZUViZ2l0dW5Sdnp3VmNR?=
 =?utf-8?B?STVXSzNXbzIwQjVrZkRwWUM2eWxTbVdZUGRqZ2ZUTGU5Q2w3REs1bkw2M1BN?=
 =?utf-8?B?MXNxWFd3NjNXZERseTl1YTR3RDFDczg3RWd0Y1JMUDAreE5EekN0UU1TVTR4?=
 =?utf-8?B?Q0ZONzZ2QXNZdmZtVG5HMXYxNmVXUVoxaEZkczR5eHcwU2pyUE81NGxIOVg3?=
 =?utf-8?B?Rys0a1BaVDJDeXg3TWJ2R2I3UG5lYXlZcGpUTDRDZHlHMVcvSno4MGV5aUxx?=
 =?utf-8?B?Tkh1UFpVTXRRb3ZHVTRnb0tvdnJ3MmQ1Z0RXRnJRNzJwbHBjVWE3ekREVHBO?=
 =?utf-8?B?Yi9MbXJyVndzNytSckc4WVhkNjZPMGY5MUZocDR4SHpFZ3loeE40TWFzM0hr?=
 =?utf-8?B?VEx3RUN0N0FibVNwMW9pOU1qSWsyMHBXQ1lwN2h6TjNoUmNhZHArRG5ycE04?=
 =?utf-8?B?TUZ6UWFvNGh0cGZKMzI4U08wSDhWUDVQeWZWTG5TaUJNTkt4VnBYQy9wdEFl?=
 =?utf-8?B?RlpQRXpEUnFzaHR4dDhiUnVHOGhwZTBWdFg4bHdGZ05jeUhlZ3VMTU5oUGpS?=
 =?utf-8?B?dlBUY0d5VUdMOW1PVUVWUGRBUUFZd3VNM0UveG9DVUVwR3oxSHkwT2FXc1VI?=
 =?utf-8?B?bkF4bkdCaEQ4NjdNdXZjTkVIRTB0c1J1MXNrRHl1cGtTL3hXeHpjMVBoOEFv?=
 =?utf-8?B?RnpSZXA3eVVXdDUxYlpyU0lvd2NYZHNLRVZ3VkNOQlpHOSt1NHlGMzRnOFI5?=
 =?utf-8?B?N0xaMHBSakVicWdJaVdaYW11bUg3VXZsZHlzczdmYXl2Y2d3Y0hQMG9aRS9W?=
 =?utf-8?B?WDZZQkdlR3hScVpNL2lPODBTV1F5U2twazgydzViMnZNZ0VyeEdpeDhPQTVo?=
 =?utf-8?B?NVZFSmEzYkNOMTI5V3pRcmZDQmxhUmRHbnBEeENPcTBkMDR2Vnc3MVVNY0dX?=
 =?utf-8?B?UDV3MVpGY2hNN2k4clM3L1g1Rm1JRzI4TzFmK3V4N0g2SmtCbjZxZ2h4YXh6?=
 =?utf-8?B?NVZQa1libnd4aDBtVlR6clUwNlA3YlA0SEg0Nk1oYkROZ2dtMUs1U3JiMExY?=
 =?utf-8?B?czdUbTFJVFF3NGVSWkpaNEFsSUlNRmdsS0I5TjdaWmJ5SUFzKzZrZ1VVOWZG?=
 =?utf-8?B?b0JUWHVObTNsQkZKZC9Cd1lCQmpYRDV2WlJHbFo0aGtCT1NCek1RRCsrdXpO?=
 =?utf-8?B?SHIzWFU3dHVvemVLNFJVWE85anZ6NjhuS0MyOS9idktwRlNUVlJFWnB0ZkJL?=
 =?utf-8?Q?TR3sMuZFXAb4VS5SSca3gv8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d120b8-0dd0-44f5-59d6-08dd47a2bb48
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 18:10:41.0993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IFshDPCBPXrkg9IkiZXQtVPlt7ZujXDUTFLeQSYTFo62mX5t2pXmKmc8lU8xgMEhvAqb0SC+Olsi1KMP5LtkCvi3pX/GMNE5jdROsxh9HI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB8494




On 2/6/25 12:02 AM, Oliver Sang wrote:
> hi, Yang Shi,
>
> On Fri, Jan 31, 2025 at 10:38:03AM -0800, Yang Shi wrote:
>>
>>
>> On 1/27/25 7:14 PM, kernel test robot wrote:
>>> hi, All,
>>>
>>> we don't have enough knowledge to understand fully the discussion for this
>>> patch, we saw "NACK" but there were more discussions later.
>>> so below report is just FYI what we observed in our tests. thanks
>> Thanks for the report. It was nack'ed because of the change to smaps/maps
>> files in proc.
>>
>>> Hello,
>>>
>>> kernel test robot noticed a 858.5% improvement of vm-scalability.throughput on:
>>>
>>>
>>> commit: 7143ee2391f1ea15e6791e129870473543634de2 ("[PATCH] /dev/zero: make private mapping full anonymous mapping")
>>> url: https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/dev-zero-make-private-mapping-full-anonymous-mapping/20250114-063339
>>> base: https://git.kernel.org/cgit/linux/kernel/git/gregkh/char-misc.git a68d3cbfade64392507302f3a920113b60dc811f
>>> patch link: https://lore.kernel.org/all/20250113223033.4054534-1-yang@os.amperecomputing.com/
>>> patch subject: [PATCH] /dev/zero: make private mapping full anonymous mapping
>>>
>>> testcase: vm-scalability
>>> config: x86_64-rhel-9.4
>>> compiler: gcc-12
>>> test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
>>> parameters:
>>>
>>> 	runtime: 300s
>>> 	test: small-allocs
>> It seems this benchmark allocates huge amount of small areas (each area is
>> as big as 40K) by mmap'ing /dev/zero.
>>
>> This patch makes /dev/zero mapping a full anonymous mapping, so the later
>> vma_link_file() is actually skipped, which needs acquire file rmap lock then
>> insert the mapping into file rmap tree. The below profiling also showed
>> this.
>> Quoted here so that we don't have to scroll down:
>>
>>>        95.60           -95.2        0.42 ±113%  perf-profile.children.cycles-pp.__mmap
>>>        94.14           -93.6        0.54 ±106%  perf-profile.children.cycles-pp.__mmap_new_vma
>>>        93.79           -93.6        0.21 ±171%  perf-profile.children.cycles-pp.vma_link_file
>>>        93.40           -93.4        0.00        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
>>>        93.33           -93.3        0.00        perf-profile.children.cycles-pp.rwsem_optimistic_spin
>>>        93.44           -93.2        0.24 ±178%  perf-profile.children.cycles-pp.down_write
>>>        94.55           -93.1        1.40 ± 51%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
>>>        94.25           -93.0        1.30 ± 59%  perf-profile.children.cycles-pp.__mmap_region
>>>        92.91           -92.9        0.00        perf-profile.children.cycles-pp.osq_lock
>>>        94.45           -92.7        1.72 ± 34%  perf-profile.children.cycles-pp.do_mmap
>>>        94.46           -92.6        1.83 ± 31%  perf-profile.children.cycles-pp.vm_mmap_pgoff
>> It significantly speed up mmap for this benchmark and the rmap lock
>> contention is reduced significantly for both multi-processes and
>> multi-threads.
>>
>> The benchmark itself may exaggerate the improvement, but it may really speed
>> up some real life workloads. For example, multiple applications which may
>> allocate anonymous mapping by mmap'ing /dev/zero, then they may have
>> contention on /dev/zero's rmap lock.
>>
>> It doesn't make too much sense to link /dev/zero anonymous vmas to the file
>> rmap tree. So the below patch should be able to speed up the benchmark too.
> sorry for late and thanks a lot for information!
>
>> Oliver, can you please give this patch a try?
> it seems this is an alternative patch?

Yes

> since we applied your "/dev/zero: make private mapping full anonymous mapping"
> patch upon a68d3cbfad like below:
>
> * 7143ee2391f1e /dev/zero: make private mapping full anonymous mapping
> * a68d3cbfade64 memstick: core: fix kernel-doc notation
>
> so I applied below patch also upon a68d3cbfad.
>
> we saw big improvement but not that big.
>
> =========================================================================================
> compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
>    gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/lkp-cpl-4sp2/small-allocs/vm-scalability
>
> commit:
>    a68d3cbfad ("memstick: core: fix kernel-doc notation")
>    52ec85cb99  <--- your patch
>
>
> a68d3cbfade64392 52ec85cb99e9b31dc304eae965a
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>    14364828 ±  4%    +410.6%   73349239 ±  3%  vm-scalability.throughput
>
> full comparison as below [1] just FYI.

Thanks for the update. I stared at the profiling report for a whole day, 
but I didn't figure out where that 400% lost. I just saw the number of 
page faults was fewer. And it seems like the reduction of page faults 
match the 400% loss. So I did more trace and profiling.

The test case did the below stuff in a tight loop:
   mmap 40K memory from /dev/zero (read only)
   read the area

So two major factors to the performance: mmap and page fault. The 
alternative patch did reduce the overhead of mmap to the same level as 
the original patch.

The further perf profiling showed the cost of page fault is higher than 
the original patch. But the profiling of page fault was interesting:

-   44.87%     0.01%  usemem [kernel.kallsyms]                   [k] 
do_translation_fault
    - 44.86% do_translation_fault
       - 44.83% do_page_fault
          - 44.53% handle_mm_fault
               9.04% __handle_mm_fault

Page fault consumed 40% of cpu time in handle_mm_fault, but 
__handle_mm_fault just consumed 9%, I expected it should be the major 
consumer.

So I annotated handle_mm_fault, then found the most time was consumed by 
lru_gen_enter_fault() -> vma_has_recency() (my kernel has multi-gen LRU 
enabled):

       │     if (vma->vm_file && (vma->vm_file->f_mode & FMODE_NOREUSE))
        │     ↓ cbz     x1, b4
   0.00 │       ldr     w0, [x1, #12]
  99.59 │       eor     x0, x0, #0x800000
   0.00 │       ubfx    w0, w0, #23, #1
        │     current->in_lru_fault = vma_has_recency(vma);
   0.00 │ b4:   ldrh    w1, [x2, #1992]
   0.01 │       bfi     w1, w0, #5, #1
   0.00 │       strh    w1, [x2, #1992]


vma_has_recency() read vma->vm_file->f_mode if vma->vm_file is not NULL. 
But that load took a long time. So I inspected struct file and saw:

struct file {
     file_ref_t            f_ref;
     spinlock_t            f_lock;
     fmode_t                f_mode;
     const struct file_operations    *f_op;
     ...
}

The f_mode is in the same cache line with f_ref (my kernel does NOT have 
spin lock debug enabled). The test case mmap /dev/zero in a tight loop, 
so the refcount is modified (fget/fput) very frequently, this resulted 
in somehow false sharing.

So I tried the below patch on top of the alternative patch:

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index f9157a0c42a5..ba11dc0b1c7c 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -608,6 +608,9 @@ static inline bool vma_has_recency(struct 
vm_area_struct *vma)
         if (vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ))
                 return false;

+       if (vma_is_anonymous(vma))
+               return true;
+
         if (vma->vm_file && (vma->vm_file->f_mode & FMODE_NOREUSE))
                 return false;

This made the profiling of page fault look normal:

                         - 1.90% do_translation_fault
                            - 1.87% do_page_fault
                               - 1.49% handle_mm_fault
                                  - 1.36% __handle_mm_fault

Please try this in your test.

But AFAICT I have never seen performance issue reported due to the false 
sharing of refcount and other fields in struct file. This benchmark 
stressed this quite badly.

>
>>
>> diff --git a/mm/vma.c b/mm/vma.c
>> index bb2119e5a0d0..1092222c40ae 100644
>> --- a/mm/vma.c
>> +++ b/mm/vma.c
>> @@ -1633,6 +1633,9 @@ static void unlink_file_vma_batch_process(struct
>> unlink_vma_file_batch *vb)
>>   void unlink_file_vma_batch_add(struct unlink_vma_file_batch *vb,
>>                                 struct vm_area_struct *vma)
>>   {
>> +       if (vma_is_anonymous(vma))
>> +               return;
>> +
>>          if (vma->vm_file == NULL)
>>                  return;
>>
>> @@ -1658,6 +1661,9 @@ void unlink_file_vma(struct vm_area_struct *vma)
>>   {
>>          struct file *file = vma->vm_file;
>>
>> +       if (vma_is_anonymous(vma))
>> +               return;
>> +
>>          if (file) {
>>                  struct address_space *mapping = file->f_mapping;
>>
>> @@ -1672,6 +1678,9 @@ void vma_link_file(struct vm_area_struct *vma)
>>          struct file *file = vma->vm_file;
>>          struct address_space *mapping;
>>
>> +       if (vma_is_anonymous(vma))
>> +               return;
>> +
>>          if (file) {
>>                  mapping = file->f_mapping;
>>                  i_mmap_lock_write(mapping);
>>
>>
>> Because /dev/zero's private mapping is an anonymous mapping with valid
>> vm_file, so we need to bail out early if the vma is anonymous even though it
>> has vm_file. IMHO, making /dev/zero private mapping a full anonymous mapping
>> looks more clean.
>>
> [1]
> =========================================================================================
> compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
>    gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/lkp-cpl-4sp2/small-allocs/vm-scalability
>
> commit:
>    a68d3cbfad ("memstick: core: fix kernel-doc notation")
>    52ec85cb99  <--- your patch
>
>
> a68d3cbfade64392 52ec85cb99e9b31dc304eae965a
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>   5.262e+09 ±  3%     -45.0%  2.896e+09 ±  6%  cpuidle..time
>     7924008 ±  3%     -79.3%    1643339 ± 11%  cpuidle..usage
>     1871164 ±  4%     -22.4%    1452554 ± 12%  numa-numastat.node3.local_node
>     1952164 ±  3%     -20.1%    1560294 ± 12%  numa-numastat.node3.numa_hit
>      399.52           -68.2%     126.86        uptime.boot
>       14507           -15.7%      12232        uptime.idle
>        6.99 ±  3%    +147.9%      17.34 ±  4%  vmstat.cpu.id
>        1.71          +473.6%       9.79 ±  2%  vmstat.cpu.us
>       34204 ±  5%     -72.9%       9272 ±  7%  vmstat.system.cs
>      266575           -21.2%     210191        vmstat.system.in
>        3408 ±  5%     -99.8%       8.38 ± 48%  perf-c2c.DRAM.local
>       18076 ±  3%     -99.8%      32.25 ± 27%  perf-c2c.DRAM.remote
>        8082 ±  5%     -99.8%      15.50 ± 64%  perf-c2c.HITM.local
>        6544 ±  6%     -99.8%      13.62 ± 51%  perf-c2c.HITM.remote
>       14627 ±  4%     -99.8%      29.12 ± 53%  perf-c2c.HITM.total
>        6.49 ±  3%      +8.8       15.24 ±  5%  mpstat.cpu.all.idle%
>        0.63            -0.3        0.32 ±  4%  mpstat.cpu.all.irq%
>        0.03 ±  2%      +0.2        0.26 ±  2%  mpstat.cpu.all.soft%
>       91.17           -17.0       74.15        mpstat.cpu.all.sys%
>        1.68 ±  2%      +8.3       10.03 ±  2%  mpstat.cpu.all.usr%
>      337.33           -97.4%       8.88 ± 75%  mpstat.max_utilization.seconds
>      352.76           -77.3%      79.95 ±  2%  time.elapsed_time
>      352.76           -77.3%      79.95 ±  2%  time.elapsed_time.max
>      225965 ±  7%     -16.0%     189844 ±  6%  time.involuntary_context_switches
>   9.592e+08 ±  4%     +11.9%  1.074e+09        time.minor_page_faults
>       20852            -8.8%      19012        time.percent_of_cpu_this_job_got
>       72302           -81.4%      13425 ±  3%  time.system_time
>        1260 ±  3%     +41.0%       1777        time.user_time
>     5393707 ±  5%     -98.4%      86880 ± 17%  time.voluntary_context_switches
>     1609925           -50.3%     800493        meminfo.Active
>     1609925           -50.3%     800493        meminfo.Active(anon)
>      160837 ± 33%     -63.9%      58119 ± 13%  meminfo.AnonHugePages
>     4435665           -18.5%    3614714        meminfo.Cached
>     1775547           -43.8%     998415        meminfo.Committed_AS
>      148539           -43.7%      83699 ±  4%  meminfo.Mapped
>     4245538 ±  4%     -20.9%    3356561        meminfo.PageTables
>    14166291 ±  4%      -9.6%   12806082        meminfo.SUnreclaim
>      929777           -88.2%     109274 ±  3%  meminfo.Shmem
>    14315492 ±  4%      -9.6%   12947821        meminfo.Slab
>       64129 ±  4%    +418.9%     332751 ±  3%  vm-scalability.median
>       45.40 ±  5%   +1961.8        2007 ±  8%  vm-scalability.stddev%
>    14364828 ±  4%    +410.6%   73349239 ±  3%  vm-scalability.throughput
>      352.76           -77.3%      79.95 ±  2%  vm-scalability.time.elapsed_time
>      352.76           -77.3%      79.95 ±  2%  vm-scalability.time.elapsed_time.max
>      225965 ±  7%     -16.0%     189844 ±  6%  vm-scalability.time.involuntary_context_switches
>   9.592e+08 ±  4%     +11.9%  1.074e+09        vm-scalability.time.minor_page_faults
>       20852            -8.8%      19012        vm-scalability.time.percent_of_cpu_this_job_got
>       72302           -81.4%      13425 ±  3%  vm-scalability.time.system_time
>        1260 ±  3%     +41.0%       1777        vm-scalability.time.user_time
>     5393707 ±  5%     -98.4%      86880 ± 17%  vm-scalability.time.voluntary_context_switches
>   4.316e+09 ±  4%     +11.9%  4.832e+09        vm-scalability.workload
>      265763 ±  4%     -20.5%     211398 ±  4%  numa-vmstat.node0.nr_page_table_pages
>       31364 ±106%     -85.0%       4690 ±169%  numa-vmstat.node0.nr_shmem
>       12205 ± 67%     -74.1%       3161 ±199%  numa-vmstat.node1.nr_mapped
>      265546 ±  4%     -21.8%     207742 ±  4%  numa-vmstat.node1.nr_page_table_pages
>       44052 ± 71%     -86.0%       6163 ±161%  numa-vmstat.node1.nr_shmem
>      885590 ±  4%      -9.9%     797649 ±  4%  numa-vmstat.node1.nr_slab_unreclaimable
>      264589 ±  4%     -21.2%     208598 ±  4%  numa-vmstat.node2.nr_page_table_pages
>      881598 ±  4%     -10.0%     793829 ±  4%  numa-vmstat.node2.nr_slab_unreclaimable
>      192683 ± 30%     -61.0%      75078 ± 70%  numa-vmstat.node3.nr_active_anon
>      286819 ±108%     -93.0%      19993 ± 39%  numa-vmstat.node3.nr_file_pages
>       13124 ± 49%     -92.3%       1006 ± 57%  numa-vmstat.node3.nr_mapped
>      264499 ±  4%     -22.1%     206135 ±  2%  numa-vmstat.node3.nr_page_table_pages
>      139810 ± 14%     -90.5%      13229 ± 89%  numa-vmstat.node3.nr_shmem
>      880199 ±  4%     -11.8%     776210 ±  5%  numa-vmstat.node3.nr_slab_unreclaimable
>      192683 ± 30%     -61.0%      75077 ± 70%  numa-vmstat.node3.nr_zone_active_anon
>     1951359 ±  3%     -20.1%    1558936 ± 12%  numa-vmstat.node3.numa_hit
>     1870359 ±  4%     -22.4%    1451195 ± 12%  numa-vmstat.node3.numa_local
>      402515           -50.3%     200150        proc-vmstat.nr_active_anon
>      170568            +1.9%     173746        proc-vmstat.nr_anon_pages
>     4257257            +0.9%    4296664        proc-vmstat.nr_dirty_background_threshold
>     8524925            +0.9%    8603835        proc-vmstat.nr_dirty_threshold
>     1109246           -18.5%     903959        proc-vmstat.nr_file_pages
>    42815276            +0.9%   43210344        proc-vmstat.nr_free_pages
>       37525           -43.6%      21164 ±  4%  proc-vmstat.nr_mapped
>     1059932 ±  4%     -21.1%     836810        proc-vmstat.nr_page_table_pages
>      232507           -88.2%      27341 ±  3%  proc-vmstat.nr_shmem
>       37297            -5.0%      35436        proc-vmstat.nr_slab_reclaimable
>     3537843 ±  4%      -9.8%    3192506        proc-vmstat.nr_slab_unreclaimable
>      402515           -50.3%     200150        proc-vmstat.nr_zone_active_anon
>       61931 ±  8%     -83.8%      10023 ± 45%  proc-vmstat.numa_hint_faults
>       15755 ± 21%     -87.1%       2039 ± 97%  proc-vmstat.numa_hint_faults_local
>     6916516 ±  3%      -7.1%    6425430        proc-vmstat.numa_hit
>     6568542 ±  3%      -7.5%    6077764        proc-vmstat.numa_local
>      293942 ±  3%     -69.6%      89435 ± 49%  proc-vmstat.numa_pte_updates
>   9.608e+08 ±  4%     +11.8%  1.074e+09        proc-vmstat.pgfault
>       55981 ±  2%     -63.1%      20641 ±  2%  proc-vmstat.pgreuse
>     1063552 ±  4%     -20.3%     847673 ±  4%  numa-meminfo.node0.PageTables
>     3565610 ±  4%      -8.0%    3279375 ±  3%  numa-meminfo.node0.SUnreclaim
>      125455 ±106%     -85.2%      18620 ±168%  numa-meminfo.node0.Shmem
>     3592377 ±  4%      -7.1%    3336072 ±  4%  numa-meminfo.node0.Slab
>       48482 ± 67%     -74.3%      12475 ±199%  numa-meminfo.node1.Mapped
>     1062709 ±  4%     -21.7%     831966 ±  4%  numa-meminfo.node1.PageTables
>     3543793 ±  4%     -10.0%    3189589 ±  4%  numa-meminfo.node1.SUnreclaim
>      176171 ± 71%     -86.0%      24677 ±161%  numa-meminfo.node1.Shmem
>     3593431 ±  4%     -10.4%    3220352 ±  4%  numa-meminfo.node1.Slab
>     1058901 ±  4%     -21.3%     833124 ±  4%  numa-meminfo.node2.PageTables
>     3527862 ±  4%     -10.2%    3168666 ±  5%  numa-meminfo.node2.SUnreclaim
>     3565750 ±  4%     -10.3%    3200248 ±  5%  numa-meminfo.node2.Slab
>      770405 ± 30%     -61.0%     300435 ± 70%  numa-meminfo.node3.Active
>      770405 ± 30%     -61.0%     300435 ± 70%  numa-meminfo.node3.Active(anon)
>     1146977 ±108%     -93.0%      80110 ± 40%  numa-meminfo.node3.FilePages
>       52663 ± 47%     -91.6%       4397 ± 56%  numa-meminfo.node3.Mapped
>     6368902 ± 20%     -21.2%    5021246 ±  2%  numa-meminfo.node3.MemUsed
>     1058539 ±  4%     -22.2%     823061 ±  3%  numa-meminfo.node3.PageTables
>     3522496 ±  4%     -12.1%    3096728 ±  6%  numa-meminfo.node3.SUnreclaim
>      558943 ± 14%     -90.5%      53054 ± 89%  numa-meminfo.node3.Shmem
>     3557392 ±  4%     -12.3%    3119454 ±  6%  numa-meminfo.node3.Slab
>        0.82 ±  4%     -39.7%       0.50 ± 12%  perf-stat.i.MPKI
>   2.714e+10 ±  2%    +185.7%  7.755e+10 ±  6%  perf-stat.i.branch-instructions
>        0.11 ±  3%      +0.1        0.20 ±  5%  perf-stat.i.branch-miss-rate%
>    24932893          +156.6%   63980942 ±  5%  perf-stat.i.branch-misses
>       64.93           -10.1       54.87 ±  2%  perf-stat.i.cache-miss-rate%
>       34508 ±  4%     -61.4%      13315 ± 10%  perf-stat.i.context-switches
>        7.67           -63.7%       2.79 ±  6%  perf-stat.i.cpi
>      224605           +10.8%     248972 ±  4%  perf-stat.i.cpu-clock
>      696.35 ±  2%     -57.4%     296.79 ±  3%  perf-stat.i.cpu-migrations
>   1.102e+11          +128.5%  2.518e+11 ±  6%  perf-stat.i.instructions
>        0.14          +198.2%       0.42 ±  5%  perf-stat.i.ipc
>       24.25 ±  3%    +375.8%     115.36 ±  3%  perf-stat.i.metric.K/sec
>     2722043 ±  3%    +439.7%   14690226 ±  6%  perf-stat.i.minor-faults
>     2722043 ±  3%    +439.7%   14690226 ±  6%  perf-stat.i.page-faults
>      224605           +10.8%     248972 ±  4%  perf-stat.i.task-clock
>        0.81 ±  3%     -52.5%       0.39 ± 14%  perf-stat.overall.MPKI
>        0.09            -0.0        0.08 ±  2%  perf-stat.overall.branch-miss-rate%
>       64.81            -6.4       58.40        perf-stat.overall.cache-miss-rate%
>        7.24           -56.3%       3.17 ±  3%  perf-stat.overall.cpi
>        0.14          +129.0%       0.32 ±  3%  perf-stat.overall.ipc
>        9012 ±  2%     -57.5%       3827        perf-stat.overall.path-length
>   2.701e+10 ±  2%    +159.6%  7.012e+10 ±  2%  perf-stat.ps.branch-instructions
>    24708939          +119.2%   54173035        perf-stat.ps.branch-misses
>       34266 ±  5%     -73.9%       8949 ±  7%  perf-stat.ps.context-switches
>   7.941e+11            -9.1%  7.219e+11        perf-stat.ps.cpu-cycles
>      693.54 ±  2%     -68.6%     217.73 ±  5%  perf-stat.ps.cpu-migrations
>   1.097e+11          +108.1%  2.282e+11 ±  2%  perf-stat.ps.instructions
>     2710577 ±  3%    +388.7%   13246535 ±  2%  perf-stat.ps.minor-faults
>     2710577 ±  3%    +388.7%   13246536 ±  2%  perf-stat.ps.page-faults
>   3.886e+13 ±  2%     -52.4%  1.849e+13        perf-stat.total.instructions
>    64052898 ±  5%     -96.2%    2460331 ±166%  sched_debug.cfs_rq:/.avg_vruntime.avg
>    95701822 ±  7%     -85.1%   14268127 ±116%  sched_debug.cfs_rq:/.avg_vruntime.max
>    43098762 ±  6%     -96.0%    1715136 ±173%  sched_debug.cfs_rq:/.avg_vruntime.min
>     9223270 ±  9%     -84.2%    1457904 ±122%  sched_debug.cfs_rq:/.avg_vruntime.stddev
>        0.78 ±  2%     -77.0%       0.18 ±130%  sched_debug.cfs_rq:/.h_nr_running.avg
>    43049468 ± 22%     -89.3%    4590302 ±180%  sched_debug.cfs_rq:/.left_deadline.max
>     3836405 ± 37%     -85.6%     550773 ±176%  sched_debug.cfs_rq:/.left_deadline.stddev
>    43049467 ± 22%     -89.3%    4590279 ±180%  sched_debug.cfs_rq:/.left_vruntime.max
>     3836405 ± 37%     -85.6%     550772 ±176%  sched_debug.cfs_rq:/.left_vruntime.stddev
>    64052901 ±  5%     -96.2%    2460341 ±166%  sched_debug.cfs_rq:/.min_vruntime.avg
>    95701822 ±  7%     -85.1%   14268127 ±116%  sched_debug.cfs_rq:/.min_vruntime.max
>    43098762 ±  6%     -96.0%    1715136 ±173%  sched_debug.cfs_rq:/.min_vruntime.min
>     9223270 ±  9%     -84.2%    1457902 ±122%  sched_debug.cfs_rq:/.min_vruntime.stddev
>        0.77 ±  2%     -77.4%       0.17 ±128%  sched_debug.cfs_rq:/.nr_running.avg
>        1.61 ± 24%    +396.0%       7.96 ± 62%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
>       86.69          +424.4%     454.62 ± 24%  sched_debug.cfs_rq:/.removed.runnable_avg.max
>       11.14 ± 13%    +409.8%      56.79 ± 35%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
>        1.61 ± 24%    +396.0%       7.96 ± 62%  sched_debug.cfs_rq:/.removed.util_avg.avg
>       86.69          +424.4%     454.62 ± 24%  sched_debug.cfs_rq:/.removed.util_avg.max
>       11.14 ± 13%    +409.8%      56.79 ± 35%  sched_debug.cfs_rq:/.removed.util_avg.stddev
>    43049467 ± 22%     -89.3%    4590282 ±180%  sched_debug.cfs_rq:/.right_vruntime.max
>     3836405 ± 37%     -85.6%     550772 ±176%  sched_debug.cfs_rq:/.right_vruntime.stddev
>      286633 ± 43%    +262.3%    1038592 ± 36%  sched_debug.cfs_rq:/.runnable_avg.avg
>    34728895 ± 30%    +349.2%   1.56e+08 ± 26%  sched_debug.cfs_rq:/.runnable_avg.max
>     2845573 ± 30%    +325.9%   12119045 ± 26%  sched_debug.cfs_rq:/.runnable_avg.stddev
>      769.03           -69.9%     231.86 ± 84%  sched_debug.cfs_rq:/.util_avg.avg
>        1621 ±  5%     -31.5%       1111 ±  8%  sched_debug.cfs_rq:/.util_avg.max
>      724.17 ±  2%     -89.6%      75.66 ±147%  sched_debug.cfs_rq:/.util_est.avg
>        1360 ± 15%     -39.2%     826.88 ± 37%  sched_debug.cfs_rq:/.util_est.max
>      766944 ±  3%     +18.1%     905901        sched_debug.cpu.avg_idle.avg
>      321459 ±  2%     -35.6%     207172 ± 10%  sched_debug.cpu.avg_idle.stddev
>      195573           -72.7%      53401 ± 24%  sched_debug.cpu.clock.avg
>      195596           -72.7%      53442 ± 24%  sched_debug.cpu.clock.max
>      195548           -72.7%      53352 ± 24%  sched_debug.cpu.clock.min
>      194424           -72.6%      53229 ± 24%  sched_debug.cpu.clock_task.avg
>      194608           -72.6%      53383 ± 24%  sched_debug.cpu.clock_task.max
>      181834           -77.5%      40964 ± 31%  sched_debug.cpu.clock_task.min
>        4241 ±  2%     -80.6%     821.65 ±142%  sched_debug.cpu.curr->pid.avg
>        9799 ±  2%     -55.4%       4365 ± 17%  sched_debug.cpu.curr->pid.max
>        1365 ± 10%     -48.0%     709.44 ±  5%  sched_debug.cpu.curr->pid.stddev
>      537665 ±  4%     +31.2%     705318 ± 14%  sched_debug.cpu.max_idle_balance_cost.max
>        3119 ± 56%    +579.1%      21184 ± 39%  sched_debug.cpu.max_idle_balance_cost.stddev
>        0.78 ±  2%     -76.3%       0.18 ±135%  sched_debug.cpu.nr_running.avg
>       25773 ±  5%     -96.1%       1007 ± 41%  sched_debug.cpu.nr_switches.avg
>       48669 ± 10%     -76.5%      11448 ± 13%  sched_debug.cpu.nr_switches.max
>       19006 ±  7%     -98.6%     258.81 ± 64%  sched_debug.cpu.nr_switches.min
>        4142 ±  8%     -66.3%       1396 ± 17%  sched_debug.cpu.nr_switches.stddev
>        0.07 ± 23%     -92.9%       0.01 ± 41%  sched_debug.cpu.nr_uninterruptible.avg
>      240.19 ± 16%     -82.1%      42.94 ± 41%  sched_debug.cpu.nr_uninterruptible.max
>      -77.92           -88.1%      -9.25        sched_debug.cpu.nr_uninterruptible.min
>       37.87 ±  5%     -85.8%       5.36 ± 13%  sched_debug.cpu.nr_uninterruptible.stddev
>      195549           -72.7%      53356 ± 24%  sched_debug.cpu_clk
>      194699           -73.0%      52506 ± 25%  sched_debug.ktime
>        0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
>        0.17          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.max
>        0.01          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.stddev
>      196368           -72.4%      54191 ± 24%  sched_debug.sched_clk
>        0.17 ±142%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
>        0.19 ± 34%     -51.3%       0.09 ± 37%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>        0.14 ± 55%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
>        0.14 ± 73%     -82.5%       0.03 ±168%  perf-sched.sch_delay.avg.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
>        0.11 ± 59%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
>        0.04 ±132%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
>        0.02 ± 31%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>        0.00 ±223%  +51950.0%       0.26 ±212%  perf-sched.sch_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
>        0.25 ± 59%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
>        0.12 ±145%     -99.1%       0.00 ±141%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
>        0.25 ± 41%     -81.6%       0.05 ± 69%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
>        0.11 ± 59%     -87.1%       0.01 ±198%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
>        0.40 ± 50%     -97.8%       0.01 ± 30%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        2.25 ±138%     -99.6%       0.01 ±  7%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>        0.32 ±104%     -97.3%       0.01 ± 38%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
>        0.01 ± 12%     -34.9%       0.01 ± 18%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
>        0.01 ± 20%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>        0.19 ±185%     -95.6%       0.01 ± 44%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>        0.07 ± 20%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>        0.26 ± 17%     -98.8%       0.00 ± 10%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>        0.03 ± 51%     -69.7%       0.01 ± 67%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>        0.01 ± 55%    +721.9%       0.10 ± 29%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        0.01 ±128%     -83.6%       0.00 ± 20%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
>        0.06 ± 31%   +1921.5%       1.23 ±165%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        1.00 ±151%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
>       25.45 ± 94%     -98.6%       0.36 ± 61%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>        4.56 ± 67%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
>        3.55 ± 97%     -98.9%       0.04 ±189%  perf-sched.sch_delay.max.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
>        3.16 ± 78%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
>        0.30 ±159%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
>        0.03 ± 86%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>        0.00 ±223%  +3.2e+06%      15.79 ±259%  perf-sched.sch_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
>        3.09 ± 45%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
>        3.51 ± 21%     -86.1%       0.49 ± 72%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
>        3.59 ± 11%     -92.0%       0.29 ±165%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
>        1.60 ± 69%     -95.7%       0.07 ±243%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
>        0.81 ± 43%     -98.5%       0.01 ± 43%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        1.02 ± 88%     -98.1%       0.02 ± 47%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
>        9.68 ± 32%     -92.2%       0.76 ± 72%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>       12.26 ±109%     -92.9%       0.87 ±101%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        0.03 ±106%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>       37.84 ± 47%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>        4.68 ± 36%     -99.8%       0.01 ± 65%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>        0.36 ±186%     -96.3%       0.01 ± 90%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
>       97903 ±  4%     -38.3%      60433 ± 29%  perf-sched.total_wait_and_delay.count.ms
>        3.97 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>      302.41 ±  5%     -27.4%     219.54 ± 14%  perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
>        1.48 ±  6%     -90.9%       0.14 ± 79%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>      327.16 ±  9%     -46.6%     174.81 ± 24%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>      369.37 ±  2%     -75.3%      91.05 ± 35%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>        0.96 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>      187.66          +120.6%     413.97 ± 14%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        1831 ±  9%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>        6.17 ± 45%     -79.7%       1.25 ±142%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       40.50 ±  8%    +245.7%     140.00 ± 23%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>       13.17 ±  2%    +624.4%      95.38 ± 19%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       73021 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>       11323 ±  3%     -75.9%       2725 ± 28%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        1887 ± 45%     -96.1%      73.88 ± 78%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        1238           -34.5%     811.25 ± 13%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       35.19 ± 57%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>       20.79 ± 19%     -95.9%       0.84 ± 93%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>        1240 ± 20%     -14.4%       1062 ± 10%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>      500.34           +31.2%     656.38 ± 39%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       58.83 ± 39%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>        1237 ± 34%    +151.7%       3114 ± 25%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       49.27 ±119%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.shmem_alloc_folio
>       58.17 ±187%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
>        3.78 ±  5%     -97.6%       0.09 ± 37%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>        2.99 ±  4%     +15.4%       3.45 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>        3.92 ±  5%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
>        4.71 ±  8%     -99.5%       0.02 ±170%  perf-sched.wait_time.avg.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
>        1.67 ± 20%     -92.7%       0.12 ± 30%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
>        2.10 ± 27%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
>        0.01 ± 44%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
>        1.67 ± 21%     -94.3%       0.10 ± 35%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>        0.04 ±133%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>        2.30 ± 14%     -95.5%       0.10 ± 42%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
>        2.00 ± 74%   +2917.4%      60.44 ± 33%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>       29.19 ±  5%     -38.5%      17.96 ± 28%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
>        0.37 ± 30%   +5524.5%      20.95 ± 30%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      302.40 ±  5%     -27.4%     219.53 ± 14%  perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
>        1.40 ±  6%     -92.7%       0.10 ± 18%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>        0.72 ±220%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>      326.84 ±  9%     -46.6%     174.54 ± 24%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>      369.18 ±  2%     -75.3%      91.04 ± 35%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>        0.89 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>      187.58          +120.6%     413.77 ± 14%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        2.36 ± 29%   +1759.6%      43.80 ± 33%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        0.01 ±156%     -97.9%       0.00 ±264%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
>      340.69 ±135%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.shmem_alloc_folio
>      535.09 ±128%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
>       22.04 ± 32%     -98.4%       0.36 ± 61%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>       13.57 ± 17%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
>       13.54 ± 10%     -99.7%       0.04 ±189%  perf-sched.wait_time.max.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
>       10.17 ± 19%     -95.2%       0.49 ± 56%  perf-sched.wait_time.max.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
>       11.35 ± 25%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
>        0.01 ± 32%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
>       10.62 ±  9%     -96.5%       0.38 ± 72%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>        0.20 ±199%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>       14.42 ± 22%     -96.6%       0.49 ± 72%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
>        4.00 ± 74%  +19182.5%     772.23 ± 40%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>       10.75 ± 98%   +6512.2%     710.88 ± 56%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       15.80 ±  8%     -95.2%       0.76 ± 72%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>       11.64 ± 61%     -98.9%       0.13 ±132%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
>        2.94 ±213%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>        1240 ± 20%     -14.3%       1062 ± 10%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>      500.11           +31.2%     656.37 ± 39%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       32.65 ± 33%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>        1237 ± 34%    +151.6%       3113 ± 25%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       95.59           -95.6        0.00        perf-profile.calltrace.cycles-pp.__mmap
>       95.54           -95.5        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
>       95.54           -95.5        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__mmap
>       94.54           -94.5        0.00        perf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
>       94.46           -94.0        0.41 ±138%  perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
>       94.14           -93.7        0.40 ±136%  perf-profile.calltrace.cycles-pp.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff
>       93.79           -93.5        0.31 ±134%  perf-profile.calltrace.cycles-pp.vma_link_file.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff
>       93.40           -93.4        0.00        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.vma_link_file.__mmap_new_vma.__mmap_region
>       93.33           -93.3        0.00        perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.vma_link_file.__mmap_new_vma
>       93.44           -93.3        0.14 ±264%  perf-profile.calltrace.cycles-pp.down_write.vma_link_file.__mmap_new_vma.__mmap_region.do_mmap
>       94.45           -93.0        1.42 ± 60%  perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       94.25           -92.9        1.33 ± 61%  perf-profile.calltrace.cycles-pp.__mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>       92.89           -92.9        0.00        perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.vma_link_file
>        0.00            +1.1        1.09 ± 33%  perf-profile.calltrace.cycles-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
>        0.00            +1.4        1.37 ± 49%  perf-profile.calltrace.cycles-pp.setlocale
>        0.00            +1.6        1.64 ± 47%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry
>        0.00            +1.6        1.64 ± 47%  perf-profile.calltrace.cycles-pp.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt
>        0.00            +1.6        1.65 ± 43%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +1.8        1.76 ± 44%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +1.9        1.93 ± 26%  perf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
>        0.00            +2.2        2.16 ± 44%  perf-profile.calltrace.cycles-pp.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
>        0.00            +2.2        2.23 ± 33%  perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +2.4        2.37 ± 36%  perf-profile.calltrace.cycles-pp.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
>        0.00            +2.5        2.48 ± 32%  perf-profile.calltrace.cycles-pp.get_cpu_sleep_time_us.get_idle_time.uptime_proc_show.seq_read_iter.vfs_read
>        0.00            +2.5        2.50 ± 45%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
>        0.00            +2.5        2.54 ± 47%  perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
>        0.00            +2.5        2.54 ± 47%  perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
>        0.00            +2.6        2.62 ± 35%  perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
>        0.00            +2.6        2.62 ± 35%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
>        0.00            +2.6        2.62 ± 35%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._Fork
>        0.00            +2.6        2.62 ± 35%  perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
>        0.00            +2.7        2.68 ± 35%  perf-profile.calltrace.cycles-pp.get_idle_time.uptime_proc_show.seq_read_iter.vfs_read.ksys_read
>        0.00            +2.8        2.77 ± 33%  perf-profile.calltrace.cycles-pp.uptime_proc_show.seq_read_iter.vfs_read.ksys_read.do_syscall_64
>        0.00            +2.8        2.82 ± 32%  perf-profile.calltrace.cycles-pp._Fork
>        0.00            +2.8        2.84 ± 45%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
>        0.00            +2.8        2.84 ± 45%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
>        0.00            +2.9        2.89 ± 39%  perf-profile.calltrace.cycles-pp.event_function_call.perf_event_release_kernel.perf_release.__fput.task_work_run
>        0.00            +2.9        2.89 ± 39%  perf-profile.calltrace.cycles-pp.smp_call_function_single.event_function_call.perf_event_release_kernel.perf_release.__fput
>        0.00            +3.1        3.10 ± 64%  perf-profile.calltrace.cycles-pp.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +3.1        3.10 ± 64%  perf-profile.calltrace.cycles-pp.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64
>        0.00            +3.1        3.13 ± 33%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
>        0.00            +3.2        3.18 ± 37%  perf-profile.calltrace.cycles-pp.seq_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +3.2        3.20 ± 28%  perf-profile.calltrace.cycles-pp.mutex_unlock.sw_perf_event_destroy._free_event.perf_event_release_kernel.perf_release
>        0.00            +3.2        3.24 ± 39%  perf-profile.calltrace.cycles-pp.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +3.2        3.24 ± 36%  perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +3.2        3.24 ± 36%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
>        0.00            +3.2        3.24 ± 36%  perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +3.2        3.24 ± 36%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +3.8        3.85 ± 39%  perf-profile.calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
>        0.00            +3.8        3.85 ± 39%  perf-profile.calltrace.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
>        0.00            +3.8        3.85 ± 39%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
>        0.00            +3.8        3.85 ± 39%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
>        0.00            +3.8        3.85 ± 39%  perf-profile.calltrace.cycles-pp.execve
>        0.00            +4.0        4.04 ± 43%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +4.0        4.04 ± 43%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
>        0.00            +4.1        4.10 ± 30%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
>        0.00            +4.2        4.18 ± 31%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
>        0.00            +4.2        4.18 ± 31%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
>        0.00            +4.2        4.20 ± 28%  perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
>        0.00            +4.2        4.25 ± 65%  perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
>        0.00            +4.3        4.27 ± 26%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
>        0.00            +4.3        4.30 ± 22%  perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.get_signal
>        0.00            +4.3        4.30 ± 22%  perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
>        0.00            +4.5        4.46 ± 59%  perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +4.6        4.57 ± 58%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write.writen
>        0.00            +4.7        4.68 ± 55%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write.writen.record__pushfn
>        0.00            +4.7        4.68 ± 55%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write.writen.record__pushfn.perf_mmap__push
>        0.00            +4.7        4.68 ± 55%  perf-profile.calltrace.cycles-pp.record__pushfn.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record
>        0.00            +4.7        4.68 ± 55%  perf-profile.calltrace.cycles-pp.write.writen.record__pushfn.perf_mmap__push.record__mmap_read_evlist
>        0.00            +4.7        4.68 ± 55%  perf-profile.calltrace.cycles-pp.writen.record__pushfn.perf_mmap__push.record__mmap_read_evlist.__cmd_record
>        0.00            +4.9        4.90 ± 57%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>        0.00            +4.9        4.92 ± 26%  perf-profile.calltrace.cycles-pp.sw_perf_event_destroy._free_event.perf_event_release_kernel.perf_release.__fput
>        0.00            +5.0        4.99 ±100%  perf-profile.calltrace.cycles-pp.__intel_pmu_enable_all.perf_rotate_context.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt
>        0.00            +5.0        4.99 ±100%  perf-profile.calltrace.cycles-pp.perf_rotate_context.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
>        0.00            +5.1        5.08 ±102%  perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>        0.00            +5.1        5.14 ± 28%  perf-profile.calltrace.cycles-pp.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record.run_builtin
>        0.00            +5.1        5.14 ± 28%  perf-profile.calltrace.cycles-pp.record__mmap_read_evlist.__cmd_record.cmd_record.run_builtin.handle_internal_command
>        0.00            +5.4        5.43 ± 25%  perf-profile.calltrace.cycles-pp._free_event.perf_event_release_kernel.perf_release.__fput.task_work_run
>        0.00            +5.8        5.82 ± 94%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry
>        0.00            +5.8        5.82 ± 94%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt
>        0.00            +6.1        6.07 ± 90%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>        0.00            +6.6        6.62 ± 24%  perf-profile.calltrace.cycles-pp.__cmd_record.cmd_record.run_builtin.handle_internal_command.main
>        0.00            +6.6        6.62 ± 24%  perf-profile.calltrace.cycles-pp.cmd_record.run_builtin.handle_internal_command.main
>        0.00            +6.8        6.76 ± 18%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
>        0.00            +7.6        7.56 ± 76%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
>        0.00            +8.0        8.03 ± 27%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>        0.00            +8.0        8.03 ± 27%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>        0.00            +8.0        8.05 ± 68%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
>        0.00            +8.1        8.13 ± 28%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>        0.00            +8.1        8.13 ± 28%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
>        0.00            +8.1        8.13 ± 28%  perf-profile.calltrace.cycles-pp.read
>        0.00            +9.1        9.05 ± 35%  perf-profile.calltrace.cycles-pp.handle_internal_command.main
>        0.00            +9.1        9.05 ± 35%  perf-profile.calltrace.cycles-pp.main
>        0.00            +9.1        9.05 ± 35%  perf-profile.calltrace.cycles-pp.run_builtin.handle_internal_command.main
>        0.00            +9.3        9.26 ± 30%  perf-profile.calltrace.cycles-pp.perf_event_release_kernel.perf_release.__fput.task_work_run.do_exit
>        0.00            +9.3        9.26 ± 30%  perf-profile.calltrace.cycles-pp.perf_release.__fput.task_work_run.do_exit.do_group_exit
>        0.00           +10.1       10.14 ± 28%  perf-profile.calltrace.cycles-pp.__fput.task_work_run.do_exit.do_group_exit.get_signal
>        0.00           +10.2       10.23 ± 27%  perf-profile.calltrace.cycles-pp.task_work_run.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
>        0.00           +11.0       10.98 ± 55%  perf-profile.calltrace.cycles-pp.asm_sysvec_reschedule_ipi.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
>        0.00           +20.6       20.64 ± 30%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00           +20.6       20.64 ± 30%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>        1.21 ±  3%     +36.6       37.80 ± 12%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
>        1.21 ±  3%     +36.6       37.80 ± 12%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>        1.22 ±  3%     +36.8       38.00 ± 13%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>        1.22 ±  3%     +36.9       38.10 ± 13%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
>        1.22 ±  3%     +36.9       38.10 ± 13%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
>        1.21 ±  3%     +37.2       38.43 ± 11%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
>        1.21 ±  3%     +37.2       38.43 ± 11%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
>        1.21 ±  3%     +37.3       38.54 ± 12%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
>        1.22 ±  3%     +37.6       38.84 ± 12%  perf-profile.calltrace.cycles-pp.common_startup_64
>        2.19 ±  3%     +53.9       56.10 ± 19%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
>       95.60           -95.2        0.41 ±138%  perf-profile.children.cycles-pp.__mmap
>       94.14           -93.7        0.49 ±130%  perf-profile.children.cycles-pp.__mmap_new_vma
>       93.79           -93.5        0.31 ±134%  perf-profile.children.cycles-pp.vma_link_file
>       93.40           -93.4        0.00        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
>       93.33           -93.3        0.00        perf-profile.children.cycles-pp.rwsem_optimistic_spin
>       94.55           -93.1        1.42 ± 60%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
>       92.91           -92.9        0.00        perf-profile.children.cycles-pp.osq_lock
>       93.44           -92.7        0.75 ±109%  perf-profile.children.cycles-pp.down_write
>       94.46           -92.6        1.84 ± 34%  perf-profile.children.cycles-pp.vm_mmap_pgoff
>       94.45           -92.6        1.84 ± 34%  perf-profile.children.cycles-pp.do_mmap
>       94.25           -92.6        1.66 ± 37%  perf-profile.children.cycles-pp.__mmap_region
>       95.58           -44.8       50.78 ± 11%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
>       95.58           -44.8       50.78 ± 11%  perf-profile.children.cycles-pp.do_syscall_64
>        0.00            +1.1        1.09 ± 33%  perf-profile.children.cycles-pp.dup_mmap
>        0.00            +1.4        1.37 ± 49%  perf-profile.children.cycles-pp.setlocale
>        0.00            +1.9        1.93 ± 26%  perf-profile.children.cycles-pp.dup_mm
>        0.03 ± 70%      +2.0        1.99 ± 36%  perf-profile.children.cycles-pp.handle_softirqs
>        0.00            +2.0        1.99 ± 36%  perf-profile.children.cycles-pp.__irq_exit_rcu
>        0.00            +2.0        2.02 ± 38%  perf-profile.children.cycles-pp.folios_put_refs
>        0.00            +2.1        2.06 ± 52%  perf-profile.children.cycles-pp._raw_spin_lock
>        0.00            +2.2        2.16 ± 44%  perf-profile.children.cycles-pp.do_pte_missing
>        0.00            +2.2        2.21 ± 68%  perf-profile.children.cycles-pp.link_path_walk
>        0.00            +2.2        2.23 ± 33%  perf-profile.children.cycles-pp.copy_process
>        0.00            +2.3        2.30 ± 40%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
>        0.00            +2.3        2.30 ± 40%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
>        0.00            +2.3        2.34 ± 46%  perf-profile.children.cycles-pp.walk_component
>        0.00            +2.4        2.37 ± 36%  perf-profile.children.cycles-pp.zap_present_ptes
>        0.00            +2.5        2.48 ± 32%  perf-profile.children.cycles-pp.get_cpu_sleep_time_us
>        0.00            +2.6        2.62 ± 35%  perf-profile.children.cycles-pp.__do_sys_clone
>        0.00            +2.6        2.62 ± 35%  perf-profile.children.cycles-pp.kernel_clone
>        0.00            +2.7        2.68 ± 35%  perf-profile.children.cycles-pp.get_idle_time
>        0.00            +2.8        2.77 ± 33%  perf-profile.children.cycles-pp.uptime_proc_show
>        0.00            +2.9        2.91 ± 32%  perf-profile.children.cycles-pp._Fork
>        0.00            +3.1        3.10 ± 64%  perf-profile.children.cycles-pp.proc_reg_read_iter
>        0.00            +3.2        3.24 ± 39%  perf-profile.children.cycles-pp.bprm_execve
>        0.00            +3.2        3.24 ± 36%  perf-profile.children.cycles-pp.__x64_sys_exit_group
>        0.00            +3.2        3.24 ± 36%  perf-profile.children.cycles-pp.x64_sys_call
>        0.00            +3.8        3.85 ± 39%  perf-profile.children.cycles-pp.__x64_sys_execve
>        0.00            +3.8        3.85 ± 39%  perf-profile.children.cycles-pp.do_execveat_common
>        0.00            +3.8        3.85 ± 39%  perf-profile.children.cycles-pp.execve
>        0.00            +4.0        3.99 ± 38%  perf-profile.children.cycles-pp.mutex_unlock
>        0.00            +4.2        4.19 ± 31%  perf-profile.children.cycles-pp.zap_pte_range
>        0.00            +4.2        4.25 ± 65%  perf-profile.children.cycles-pp.generic_perform_write
>        0.00            +4.3        4.29 ± 29%  perf-profile.children.cycles-pp.unmap_page_range
>        0.00            +4.3        4.29 ± 29%  perf-profile.children.cycles-pp.zap_pmd_range
>        0.00            +4.3        4.31 ± 51%  perf-profile.children.cycles-pp.do_filp_open
>        0.00            +4.3        4.31 ± 51%  perf-profile.children.cycles-pp.path_openat
>        0.19 ± 23%      +4.4        4.60 ± 26%  perf-profile.children.cycles-pp.__handle_mm_fault
>        0.00            +4.5        4.46 ± 59%  perf-profile.children.cycles-pp.shmem_file_write_iter
>        0.00            +4.5        4.55 ± 24%  perf-profile.children.cycles-pp.event_function_call
>        0.00            +4.5        4.55 ± 24%  perf-profile.children.cycles-pp.smp_call_function_single
>        0.00            +4.6        4.58 ± 30%  perf-profile.children.cycles-pp.unmap_vmas
>        0.51 ±  6%      +4.6        5.14 ± 24%  perf-profile.children.cycles-pp.handle_mm_fault
>        0.00            +4.7        4.68 ± 55%  perf-profile.children.cycles-pp.record__pushfn
>        0.00            +4.7        4.68 ± 55%  perf-profile.children.cycles-pp.writen
>        0.00            +4.8        4.80 ± 48%  perf-profile.children.cycles-pp.do_sys_openat2
>        0.77 ±  3%      +4.8        5.59 ± 21%  perf-profile.children.cycles-pp.exc_page_fault
>        0.76 ±  3%      +4.8        5.59 ± 21%  perf-profile.children.cycles-pp.do_user_addr_fault
>        0.00            +4.9        4.90 ± 57%  perf-profile.children.cycles-pp.ksys_write
>        0.00            +4.9        4.90 ± 57%  perf-profile.children.cycles-pp.vfs_write
>        0.00            +4.9        4.90 ± 48%  perf-profile.children.cycles-pp.__x64_sys_openat
>        0.00            +4.9        4.92 ± 26%  perf-profile.children.cycles-pp.sw_perf_event_destroy
>        0.00            +5.0        4.99 ±100%  perf-profile.children.cycles-pp.perf_rotate_context
>        0.00            +5.0        5.01 ± 54%  perf-profile.children.cycles-pp.write
>        0.00            +5.1        5.09 ±102%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
>        0.00            +5.4        5.43 ± 25%  perf-profile.children.cycles-pp._free_event
>        1.18            +5.6        6.78 ± 20%  perf-profile.children.cycles-pp.asm_exc_page_fault
>        0.46            +5.6        6.07 ± 90%  perf-profile.children.cycles-pp.__hrtimer_run_queues
>        0.00            +5.7        5.75 ± 39%  perf-profile.children.cycles-pp.perf_mmap__push
>        0.00            +5.7        5.75 ± 39%  perf-profile.children.cycles-pp.record__mmap_read_evlist
>        0.53            +5.8        6.28 ± 89%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
>        0.53            +5.8        6.28 ± 89%  perf-profile.children.cycles-pp.hrtimer_interrupt
>        0.00            +6.6        6.65 ± 77%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
>        0.00            +6.8        6.85 ± 20%  perf-profile.children.cycles-pp.exit_mm
>        0.58 ±  2%      +7.6        8.14 ± 75%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
>        0.00            +7.7        7.67 ± 23%  perf-profile.children.cycles-pp.exit_mmap
>        0.00            +7.7        7.67 ± 30%  perf-profile.children.cycles-pp.seq_read_iter
>        0.00            +7.7        7.72 ± 80%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
>        0.00            +7.8        7.75 ± 23%  perf-profile.children.cycles-pp.__mmput
>        0.00            +8.0        8.03 ± 27%  perf-profile.children.cycles-pp.ksys_read
>        0.00            +8.0        8.03 ± 27%  perf-profile.children.cycles-pp.vfs_read
>        0.00            +8.1        8.13 ± 28%  perf-profile.children.cycles-pp.read
>        0.02 ±141%      +9.0        9.05 ± 35%  perf-profile.children.cycles-pp.__cmd_record
>        0.02 ±141%      +9.0        9.05 ± 35%  perf-profile.children.cycles-pp.cmd_record
>        0.02 ±141%      +9.0        9.05 ± 35%  perf-profile.children.cycles-pp.handle_internal_command
>        0.02 ±141%      +9.0        9.05 ± 35%  perf-profile.children.cycles-pp.main
>        0.02 ±141%      +9.0        9.05 ± 35%  perf-profile.children.cycles-pp.run_builtin
>        0.00            +9.3        9.26 ± 30%  perf-profile.children.cycles-pp.perf_event_release_kernel
>        0.00            +9.3        9.26 ± 30%  perf-profile.children.cycles-pp.perf_release
>        1.02 ±  4%      +9.3       10.33 ± 27%  perf-profile.children.cycles-pp.task_work_run
>        0.00           +11.0       11.05 ± 28%  perf-profile.children.cycles-pp.__fput
>        0.00           +15.8       15.85 ± 25%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
>        0.00           +15.8       15.85 ± 25%  perf-profile.children.cycles-pp.get_signal
>        0.00           +19.1       19.09 ± 19%  perf-profile.children.cycles-pp.do_exit
>        0.00           +19.1       19.09 ± 19%  perf-profile.children.cycles-pp.do_group_exit
>        1.70 ±  2%     +30.7       32.41 ± 21%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
>        1.22 ±  3%     +36.9       38.10 ± 13%  perf-profile.children.cycles-pp.start_secondary
>        1.21 ±  3%     +37.2       38.43 ± 11%  perf-profile.children.cycles-pp.acpi_idle_do_entry
>        1.21 ±  3%     +37.2       38.43 ± 11%  perf-profile.children.cycles-pp.acpi_idle_enter
>        1.21 ±  3%     +37.2       38.43 ± 11%  perf-profile.children.cycles-pp.acpi_safe_halt
>        1.22 ±  3%     +37.3       38.54 ± 12%  perf-profile.children.cycles-pp.cpuidle_idle_call
>        1.21 ±  3%     +37.3       38.54 ± 12%  perf-profile.children.cycles-pp.cpuidle_enter
>        1.21 ±  3%     +37.3       38.54 ± 12%  perf-profile.children.cycles-pp.cpuidle_enter_state
>        1.22 ±  3%     +37.6       38.84 ± 12%  perf-profile.children.cycles-pp.common_startup_64
>        1.22 ±  3%     +37.6       38.84 ± 12%  perf-profile.children.cycles-pp.cpu_startup_entry
>        1.22 ±  3%     +37.6       38.84 ± 12%  perf-profile.children.cycles-pp.do_idle
>       92.37           -92.4        0.00        perf-profile.self.cycles-pp.osq_lock
>        0.00            +2.1        2.06 ± 52%  perf-profile.self.cycles-pp._raw_spin_lock
>        0.00            +2.6        2.61 ± 36%  perf-profile.self.cycles-pp.smp_call_function_single
>        0.00            +3.7        3.68 ± 37%  perf-profile.self.cycles-pp.mutex_unlock
>        0.00            +6.6        6.65 ± 77%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
>        1.19 ±  3%     +29.2       30.38 ± 15%  perf-profile.self.cycles-pp.acpi_safe_halt
>
>

