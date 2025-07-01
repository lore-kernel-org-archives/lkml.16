Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD1275110
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380188; cv=fail; b=pSj+UFAB9meSqhIIaYbmcCc1QH0lnmqgq5XjkvsZh7uRyskDC5zdCPRX2Cnd5IWMhaf+HvwfBZoa0xZuNn3ODFsw88kmArFZ8ZtQb66UlcS8v+rqv/fUJexyBXkYPGtKd+5XPXKkXLQRam+JtuUL5j6hCIYbfDheDUc+3rRtcJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380188; c=relaxed/simple;
	bh=1FjQSCQQkUjcGmNfwr+UdL01ay2+24tRBQB3liorP5M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZtwqxRAG+Os+ZyfhW0c/JZzsf1Cnk9P1lirlaeIT/gwmM2DBQeaiBK+8LdRGqbuJJFKZYCWkCvuNr/l7A/dfrER6kxvsfOFsh6KREDOvjyyQQChK4v5QKDoqu0x4NBQ3Y/T/r9GuAfCEozv8dxpcsNIep8+is/FHzDI3e0zIzIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vM7si8qx; arc=fail smtp.client-ip=40.107.94.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vM7si8qx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkcynwLT83wSBq/J3RgUm6wykBKLFCevIpDj1FWvGrzT70Y6JNAlfVYH05FUw/voFVIyq2hrq4taGgVbVZ1Uxvm9G711ZcsyKvnVxparjW1eEVCA+LBLBGFXVOmVc0QmjzfgTCPBOspGZbIRr+fV41Uv2elouAffKpy7oBEjME94/ABjcnP4Cv/F+ZQkF4hIuUcwM89IA+h7z71zU6rciFd2gC6rO+c6Wkf49yY9UAMvnMqRPw4EbQ4GQcwPUM/vkS66pcMa4DnzhAWHhIb8uFdhSC+ejC33+clMSm+orkmrzM0qMj5cFBhT224vTAJrbWuCCztpETNmCIlriyNZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWVcb6rMu1pYk5st/AwN/p7wcHltbxk8HyXBzEq2rr0=;
 b=rKedNdOVDquRT1Vj7ds+YGGqYjeqGcRJDyC/rL/j0+hbn/cPAvKC3fZs9quHmR8XUmq5402r6H4lA/8Py25QkwjeWMEAwK8U0amY9b0faqbN2klu5gcJdBg4P+mBkfVEtae1Jqkj2S7D1Xk2u8tIENRw8nI4QtvFx2fZWe3+K8fIwg5/Euc6m00xxuAZhb228h4zOPDmxfTcYA0V122HNdLkL2HTbCGJCa6BCsuTof8JCjmjJtsDqLdqW4swQRiI8WOz99PvYHCE9EsVL2LWqrt6TBJiX37eqg4A+j6K9B76Mi2glawGHtvv94i60ZD/C3F1htPcCjTWH4nlZu96Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWVcb6rMu1pYk5st/AwN/p7wcHltbxk8HyXBzEq2rr0=;
 b=vM7si8qxhQeeVxmdStGysYj7Xao8XA7y+r6tIWPAu3tpSwPkbXJfvuLwizVXN8pI/dPIjm1FsHUfYTBmv/FwJiyo97fEAsaj+cWtz1VNdzE146B/gcM0UGQVDcMAxN3QDExX2xpu3tVGVvLtUNYDQm8XhcmND91U8y0oUc/fg74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14)
 by SJ2PR12MB8133.namprd12.prod.outlook.com (2603:10b6:a03:4af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 1 Jul
 2025 14:29:44 +0000
Received: from CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::9e02:c4dd:e87b:5a74]) by CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::9e02:c4dd:e87b:5a74%4]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 14:29:44 +0000
Message-ID: <11731a97-31e8-4685-d063-e72a519a7d5e@amd.com>
Date: Tue, 1 Jul 2025 19:59:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] cdx: make cdx_bus_type constant
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
Cc: Nikhil Agarwal <nikhil.agarwal@amd.com>
References: <2025070150-resize-ninetieth-31f1@gregkh>
Content-Language: en-US
From: "Gupta, Nipun" <nipun.gupta@amd.com>
In-Reply-To: <2025070150-resize-ninetieth-31f1@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::8) To CH3PR12MB9193.namprd12.prod.outlook.com
 (2603:10b6:610:195::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9193:EE_|SJ2PR12MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a98e80d-3ba1-409b-12cc-08ddb8abb8b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmlsUGZzWVJPRW1iSjNJazZhS0ZOcG83L2h5TzlOMzJOS3MyY0V2RTJGOE5y?=
 =?utf-8?B?QjZhQWVzNVlYbTQxZVplRndyMmVBQWtzVUZhRTFPcjRqVFhoalhZZkMrSzdB?=
 =?utf-8?B?b0NsTnpBMkFuRSs1YzlpM3lCd1lSMnkwa0djQXZyaXlIWTZ2K3dOZjBkK2lT?=
 =?utf-8?B?cThpQndXbDZSWlFpSEgzdXJ0Nzl5blF2Zm5wZDlFTVRMRU9pTmlGMjcvSUlw?=
 =?utf-8?B?dkR2NjYxOEo0NEVSUUlVZW9QK29tRW12UlNkUTJkMTBNZEEvNGdMaXNEemR3?=
 =?utf-8?B?c1RYS3RLR1FzV2lSYzd2SUJzMDl3S0pvK0xPUVY1WXh1NzllV0JENFZmR1Vt?=
 =?utf-8?B?SWMweUd5QWhFc1p6QjcvVWJyemdLeEtOWVBBQzlTNUxrQjd5VmpMYXIreDY5?=
 =?utf-8?B?OEJxN29JOENiaytiUW0vd2JSbjZ3cFQwcFlQRGlMUWEzdnA3VmYyZ29abUJ4?=
 =?utf-8?B?Nk1GWHAzR1JTQzJVdGo1QXYrWW5mVEtEUHpidEE5eUtYSTFCQW9BZjRqdjd0?=
 =?utf-8?B?dUV1WUtmSVNsL0NpTy9OYUhBYkI5UGswaTlMWFlaZnp3d0x0c3BuWjUrNzNj?=
 =?utf-8?B?UithamN5SEFqcHRLazdodFRrNFBlQUV6VG1ZbTN0QlhDTEFaVXNjbjFHc2w0?=
 =?utf-8?B?a0RtaTlTblhtaXYweWJ0UE5XNkd0VitEQ1doNGtmNWtBZkVJeVg5KzdjQnAw?=
 =?utf-8?B?RWxvRTdTakdwZVorNmJ4QjlHeHhpSGlmY2NoRWdZWHlvVGJjVzJ0QXYwdWlS?=
 =?utf-8?B?bkdsUzNCT2ErK01Yd2ZCa0NxUys4UW5hRjJsNGdQZGVoUjMydmEvN3V4cEZP?=
 =?utf-8?B?bnhpK0kzSlBIcnVUekpxbmNrc0ZiZFh3RFU3em50UW4wRk1EenhxMjRGTGNC?=
 =?utf-8?B?a0dJVUxTWVArd2VnTGh4Rmk3b01adnplUUpyNzJLSWJwV2hsSmN2S0ZiYlg2?=
 =?utf-8?B?OVZReE4zM20rRHQwTmwvZVk2Rk1sVGdtYmx3QVZTaHVEZW5qMXlVb1NOYVFD?=
 =?utf-8?B?K3lVSitGeWRGQ0VYUFd2U1JlS2RXYkxrVXNmSngrWUhJSUdaNVVZYXJCRDBw?=
 =?utf-8?B?UVV3Qk9QcWp2aUhCY0dnbUlJamJTb0FuVzQwclVldzE2OTVkdUVraEQ5b2Y4?=
 =?utf-8?B?M2tLOUQ5MU1KUG9xNFF5WWxJTDRLU3dtTTZpeUY3eEZmTFhzRkFMYWZiZVIv?=
 =?utf-8?B?UkRIOUIxQUpXM0cyejlvNmEvUHA1S0JVMGEzck5PamNVcTM4UXI1aUtqS2ox?=
 =?utf-8?B?L0dQYjZBSHBYV2wrRnc1d20yNU9WaUtxamhmSGQ4MXplSzdvcGxJb2tpUE8z?=
 =?utf-8?B?WkpXV2ZPRDRObmJzNWZCZ3MvVFFJbVNsdkJrNCtjMzFaUTladTdJTCtTQUZa?=
 =?utf-8?B?RHdmQy9MMHovcms3S1dpZGQyQWlYNmV6RkhpNEVnb3hVN0FsTzFSUGM1SU1w?=
 =?utf-8?B?NjJhcTcveHhjYnJpMUZ1eFUxQnR4SnhIMGpOWC8wK3NKTVhZRkRUSy9ROWYr?=
 =?utf-8?B?eGtQcFhZZnFORXI2WVlNNjZpck5vT2NyREloTXdXVCtLT3VObk9QVElRRXlr?=
 =?utf-8?B?cUIwek5iOFNqWXhRaDhwWDFLQlZFZFd6TUZFMWVWd1A4Sk5ROGYwT2MvWEdh?=
 =?utf-8?B?RDZlY1RhTzZuTERPelcrcHRvL3pVdGNHSW9RMnN3MzJST1VBUEw2VU9Kdm91?=
 =?utf-8?B?a0ZRbjc2OWdZNEtwWHNKUm91aTNmY01OVFloM0k4b2tJTUhoM3huWmtVZWUv?=
 =?utf-8?B?bldkQWFtbytRUlBhVlJkMGNTSVNhQUkydGg0b2dmbTU3d0xGSjZOdUtYZDI1?=
 =?utf-8?B?YTRyanErM3ZyM1E4QmtvUmJLNG5yT01BR1ZleFFCcmZZNjY3QTZJVllWTWJl?=
 =?utf-8?B?d3o0MG9rdGJvV2hqY09ta1AvT3NZVFdNTTNoS0ZwOXN0V0hUT1NvdjdYMnVo?=
 =?utf-8?Q?wogaB0m6GNc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9193.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aThIakQ0cmRRQWFGU2ZCTWJNQ1Z2L2p0aDRSQTBHaXZOVkNHR0l2NWJXNDly?=
 =?utf-8?B?S0c2Rk1XMjZTZkdKYnFvazd3bW03UEpvb3poN0I1Q0hocFkwcUtRdVFCZ3BU?=
 =?utf-8?B?eFcxSFBYZkxTOEVFbzhSVXhyUUhBRVM5NyswSFM5cVB4WXQvYUgyTzJ5R1BY?=
 =?utf-8?B?dnVzdzkwMS9VMTJ5UDJYS29VM0dPeFdNTlpISUloelppV1JXWmR1ZzFXaVl4?=
 =?utf-8?B?bTVOTThxeVI0czdRWUVVZ1h3bE5YS3kzUEYxazBZVko3eklBY2hQOFpzTzBS?=
 =?utf-8?B?NlFXNlRwa3pNQ0J4UEM3alVCNng3eTFUNjQvRWk1VE55aWd4SUt3MWpFUUpK?=
 =?utf-8?B?QklDaWVQOWJ6ZlQzS2g0ZkZ4dG9rRnJOWVN2a0VYZ0VCOUxHUFF1N2hXM01y?=
 =?utf-8?B?UmRRblVJalMxYWEwbVAwdVM3WFpNbitnQ1VhQUZzU3ZndUI3RjM3a2ZxNCs1?=
 =?utf-8?B?c2FiVXZMVDZZMzZ2akZQbmx3RTBseHJCVzd1SGhrNy93ZkMyb3VBd3EvTVBK?=
 =?utf-8?B?UTBITXRnci9PUFJnR3JyV1V6RnViU3RmSGRsT25ocEZDNElOWFZnRnFjNHdy?=
 =?utf-8?B?Ri84YUlqM0NxcEcvb05YQ2lsMGQrYVlQU3ZIbmVCYzlYMmZOZDZ3WjNOUmdS?=
 =?utf-8?B?UnpyT0dnS3puRTB4Um4yUlVsN1hQUVY3YTd1dEtkcmJ2eFVIcytmeUE1TXVX?=
 =?utf-8?B?SGVyWEpWZnRkaW9ZM2VNOGJoZEtaVWt0SXNZQlNJNXBhSmx2OVd1NytvSEhX?=
 =?utf-8?B?WEthWEM1OGRDN3gvRGVtYjdoT2hmeVFlVzdZQ2JKTVVPSFF1QzJNRFEzQTQ3?=
 =?utf-8?B?bEpMS0VGVGVRZzBlbkh0MTRucG5Rc2d2R0JiZStiVkJRU040QTZEV0pKRDIz?=
 =?utf-8?B?cXVmMGFzQXNzUzV2ZXcrQjk3V0pNQXBMUFFsZ0kvc1VUekNOSzErSGlob0Mw?=
 =?utf-8?B?dFBkZWovSjFNSmxVS2F2RW5nejdET3JHTHNNQ2pydUV2T1FxRlB1K0RUOHow?=
 =?utf-8?B?UEN0bFU1ODRVbWFxRFFtRUs4ZUFpeDZzdnlXcGo4cHFSV1VnTm1nWDRVeUo3?=
 =?utf-8?B?bjBnelorQ01la2J5dzV3bEFEeVFWdnBoTDNPVGlUbllUTWg4eUROR1EvTFp4?=
 =?utf-8?B?a2R0SkFQczVEUkJHNU1taXcvMVBEaGVIdUJ1QXE1Z2h5ajg2YlN2RDZuQlNi?=
 =?utf-8?B?QnJEV1pnbXlJaUtSS1g0UlFYK282OVpKZDlOdmRCUDdMdUZ0b0ZrdlJrNE5V?=
 =?utf-8?B?NFBXbXNybGtTcXFyZzJDb2JtdkN0NFhFVG9uL0hUNlExcnBMWDhBZ3k1TWpB?=
 =?utf-8?B?QUdYQU9MRTQ0TFNGSjBZQUxpNkhvT3VsSklCZW1hNmEySDl3c1dzRzdSUXBs?=
 =?utf-8?B?TkF5R1ZNdVh1SW91UU94SndiWFhBOEtqT3NrZlRob0lYZUgrU0dacllYNEVU?=
 =?utf-8?B?MmdXUXJVdlZsUFQ2WmtTTlJrVy9rUU9CL01wTDZJdkQ5dC9UTE1CSGFqL0tU?=
 =?utf-8?B?NlBnaEE2NWh0RkdNWEtxWXVKT1F2Tml2blhoUzVHS092MzNrMVR1NHF3RzZW?=
 =?utf-8?B?bWZjY3NjNnlmeXdVQVZaUkVDV2czNENaeEZhQmlRdUROVU9XVjdJS0g0UjJD?=
 =?utf-8?B?bmVIVkk1dEpmV3NEbExwSDM5NllMWUwvTnpwd1dkR1lCZ0J2Q2NKMmgyU2pF?=
 =?utf-8?B?UjVRZDFnNXZZZ1MyY0RBbTVEcEgwek1OV01BeVgyb1Y1d201OXRUSUFWQzVq?=
 =?utf-8?B?ZnIzZUJzRWd5alY3cnBKbVpLTXFFNFNwejUzSFA2YmFYeFZOK3VYY3kzMEcw?=
 =?utf-8?B?Z013bXlYTTBJcGF2U1o4YUZqTG9kZ2JsMGNBTmpyb1RnNUJZTlRBbHRnV2cy?=
 =?utf-8?B?WDZ0U1Mzdnp2eUsvVjBoV2p4ZCtUeHo1SENXNm9EeW5lN3k4Rm9RMWdTSE42?=
 =?utf-8?B?VXlFam5jYjIxRUhWcmVRMjJKaXRMR2NjNEo3Z0xGUTIzNEhvcE5pMG1CRXdP?=
 =?utf-8?B?R2ROMlpGbk03Q1p0T2JYOVQ2d3BDTlA1WHIwSEVvL0h0SVIwMklCL0VPSkxV?=
 =?utf-8?B?YVRTU0JnaktWdTJuaWFPZjYvRFNCUGx2d1g0SG85ZVQvUXR5U1RVb0tFblZQ?=
 =?utf-8?Q?0H0YrnPfoYkmAYfcTDE0pf6Wy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a98e80d-3ba1-409b-12cc-08ddb8abb8b2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 14:29:43.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1YR46YsDUVZcGehzawQW/ClNI+yHQE2va+ymRRAYNyO/lexv9ug2JYBtV2l58Lq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8133



On 01-07-2025 16:44, Greg Kroah-Hartman wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the cdx_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Nipun Gupta <nipun.gupta@amd.com>
> Cc: Nikhil Agarwal <nikhil.agarwal@amd.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Nipun Gupta <nipun.gupta@amd.com>
