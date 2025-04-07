Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D9822F151
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021708; cv=fail; b=E2hBFIGkxRGs/s74KEFn9GyBkjRC4jIgtDQa5HmBQaYkN8m3fb32NsecIm+usgz/8mMQMLkOkgEp2+TypqIOfM/FvnA5GtaWj/e90anHmKlm8+tpihKpnImOIP5VbV1q+Kc8HPRisDeJhK250Z9XREIjaJjWbiY2iufC33mSe3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021708; c=relaxed/simple;
	bh=kK0//ALBKe95BR/xcFVbZjosB7edmc425bNwFvZEU8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rb+rygY2Kb6ihdhOLs9YOBrgP3ZkU13QoNfiJkfecYZ5Z1Szb8AsjlGK3H0mmRsFgAbrpjZhYkKX5y9qBMiFGHxnugNJyN/xfVtgqgDWFb2T6RpNpt2LrTUWUc9A3BXF23jH+tjxtsU1BHkVWrFLioZ6X/NEWy+B45HXymLVl/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mEDbJajO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jDJg03SZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mEDbJajO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jDJg03SZ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5376Y0Qi027548;
	Mon, 7 Apr 2025 10:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Dj3lOnWE59g/rCUxdMOdjJ4U2G/KSvggbWJgTxYiM2M=; b=
	mEDbJajOhEiSucLWp8GO4WX65PoPdK2vZzQgCZDskttH8PIQJ8Vz46vb63XL+jpB
	TT4X+vU5iSnDLriIATPEWeXWlD/GxyWcUBan8DCQfzuem3rdv542Sc6y9UmjGBG/
	ido4hlXv3THhMkkyGmiJX3I+ydgikp5E52Hfyc05QC062aMfn7b2KzdPSdpfunQv
	4rf51GKzbufkGnjygBf9YtupM+Ihq8RIhupUox3j1MIykqo7qETmbsiPnvlNukqs
	Xy1k6qLhP7Y9h4+tWzF6Qq8E3EIAHNNNNLC1O0rNYW3SAZgqLr4sBGF5H8XdgP/j
	/1me/CGskcorxWaUZeIOKw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45ttxct8km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 10:28:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5379KUHB022634;
	Mon, 7 Apr 2025 10:28:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty8b3y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 10:28:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwxs8jcvjf0IMBVWZJjpyN7ULDJAAtppUNoJypiw0kA3LpPfUnEULCNtbEzKfXnADSkenFhvcOFB0RXMscPeV31mHaQ3H2i00gmOI19esWg3KfODAfgKmoIguqaIEs5sz48yWs5qnA6bu8cIluPcAm/Qo1kFpEHo6wCuYJo0/KfvDowRGibLZBvcXqGBjF/fRePCdHJ9BWi5IvDh5zOzsA0vW7zTyYlrYwN+2yaoKnE2RazfRGGzIJbLEX7jP2tRA0VJXMDMGFryzo/Ogt7VQYkX4DozF5rAvtRaBTiZIRKIFkbfwzUglbcJHcQpUIZGP3tfN596XJut0qJFsacdow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj3lOnWE59g/rCUxdMOdjJ4U2G/KSvggbWJgTxYiM2M=;
 b=B/2TQXgKTkof2Iep9+Vb2xRyj81MOfwE6v+2CH3tRTN62nH6xiz4JB9sw7/BQrf7RL7dFQEkU0NNUipOoUdrucFjnH+lKA8kgXHifiPYwUwskHw0+uITtTlTKljzfV4Knqj5pWlrK+Jt7XpQPiqP47G6OTFDZRKxDqM8W1+BR5PouhI08YhAc/uKePl2R/QEjD11zoCgmuO929PZx40+A4Ul67NVpENeEmfvFkARQ7o2yqadPj4mfjZMmo58rC1np88zr480tgGswHTosmIiJ9J8d+5Vgs4fkg+uVLSRICfynQA+qmnZPFPlVk5DRdk+CdBYMUToXXgA1Dlhkau9tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj3lOnWE59g/rCUxdMOdjJ4U2G/KSvggbWJgTxYiM2M=;
 b=jDJg03SZOJ0sdeKw5jEwAXNAhySkEiRq0GwP6Q0Ql5DUWs33vMekymA+BJuJjm2wQzHerUYv6TC3KxmkZvZizJB3ahn+9JyY31vkKLimfAh/sACvTl7Z5JtAhAswfHrwDdKzDtzDa7YlRFdMF/MhxHlyiC4kWEiC5LCzxC/7ib4=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH7PR10MB5698.namprd10.prod.outlook.com (2603:10b6:510:126::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 10:28:06 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8606.027; Mon, 7 Apr 2025
 10:28:06 +0000
Date: Mon, 7 Apr 2025 11:28:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Aleksandr Nogikh <nogikh@google.com>
Cc: syzbot <syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com>,
        Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] general protection fault in mremap
Message-ID: <6efd1c14-2253-4b7d-a647-dce471ffff6f@lucifer.local>
References: <67f1c7df.050a0220.0a13.0256.GAE@google.com>
 <07a22812-4f5b-44e2-a4ce-ad0537934041@lucifer.local>
 <CANp29Y7TnFB9eTEDoG5gjoeEkv7mt4GXNYDRz7xnaOhGfcg84A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANp29Y7TnFB9eTEDoG5gjoeEkv7mt4GXNYDRz7xnaOhGfcg84A@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::8) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH7PR10MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: 1569c8ec-fd90-4a80-8263-08dd75bee28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rjh1bktCMiswVzduL3p6Yi9Udkk0RlNoYWJkR3BuUkFlZ1hkRjNQZ2xTS205?=
 =?utf-8?B?dHNjRFFTcklrU3V2VDdqY1B4UnFsbC9sQmVXSmFxK1d4WURyMDREaklkd3A0?=
 =?utf-8?B?dXVPYnluMmVIWmVqSllzSjJ5S1dBMUJqMHd4aVp0QVNCbWl6WHVGRlZsajFx?=
 =?utf-8?B?aStlWUN0OUs3RjZEQTA5MWw2Y0lUOS9haU5lS1BaTzk1c09OVU56RFBWeEZ1?=
 =?utf-8?B?Ym94YmFvaGs1cm12ZzMrdStaSXFJUjRrSzR6UzRIWnZZekN6Vm9XRjJDVHVP?=
 =?utf-8?B?MUE3SGIrOTUwamkxUjQvWVFIZG1CSXM0SCtVU3lPQmhDODN4QW1PK3I4TjRq?=
 =?utf-8?B?eVlNR1ZaaCtUbEl6ZHRYYnpsSEhnTWxBRitBOU1FTnFVUGwxZncxMGY3dXJ6?=
 =?utf-8?B?UWZJYThmSkxZVVQ2R3dxQnl2MU5XMjh6dFhTWFpoRGhDTWt4Y1NyOE5rQit1?=
 =?utf-8?B?bHltQTVQNFUyb3ZLalpOVkQ1bmRoU09RL3E2aXUybGVoeXBuZUtHUDNUa0pJ?=
 =?utf-8?B?WVZ4bXpwMS8yS0h0Z3BEaHlkOFJtQk8xN0plVXoyRGo2WWFDcGZIeU5KZmpT?=
 =?utf-8?B?RlMzOTZLTTBKWDdYOEt1bGJ5K1lzNk9HSWJvMGtsK0srZDU5VzhScERjQ2Zo?=
 =?utf-8?B?dlpWdVFicFFHSDZTRXdlTVZCb2QxZ1JsR1ArcFU1TThENFg2RDNmQ05yMFQy?=
 =?utf-8?B?M1VYQTFtaXFjY3h4TmlZakY1YUdKZVRCVWxNN0hXWlBmZHZXL09OTllJTDFZ?=
 =?utf-8?B?TXlkL0hZdjJjQjdGUXlDSXlDR0xJSi84QTY5S0NEa2RpeGtBWGhyWkpGbksz?=
 =?utf-8?B?VHdac0x0d3RCMzRPRkV3TUk4aHNpcU45RE5VbkhGZVEydmZjS2swZWtWTG5q?=
 =?utf-8?B?Y0tQR21vQzhndnc1QjJ5WXpyT3lwTld3K05OSXBUVnVGWlBSVG1WSmVoZTRq?=
 =?utf-8?B?RE0xTlVYM0ZHbEpkYjNKZEpyMXJ4ZXZ1eng2Q0NPQzBCTjE3K0lTZlN5cmhZ?=
 =?utf-8?B?VEsrTVZvTUFJU2dGaWR2NVcvTlJBQlFmVU03TkFsbC85SHhyN1J5UTRSTy9h?=
 =?utf-8?B?Q0tYaElPTGFKOUJjRFhhK1JDMDlwWGoxdTExbTA0S1d4TXV5QlZHWnhNRHNK?=
 =?utf-8?B?M0dMYWE2U3hmdkgxRHp2eVJQZW80a3RxMEpxeEFJSHNzazlIdWh4RCtQdWwv?=
 =?utf-8?B?R1RodUZBZzRsTVpEZjQ3d25lQUlMbXdINC82THNoUTNnaVRHdkhFS0tWcmpB?=
 =?utf-8?B?dVFIaENsdXlzYXhuZHVobGVBV1RKa0RscDIwcVlhRVQrNTRZeXVIKzJHVXRZ?=
 =?utf-8?B?WXBuVGRINTFvTFFydVA3R2tROUUxYjIyank1RmxtTVJpL1NoQVpVcVl5TjFl?=
 =?utf-8?B?NFRibDhmSnhJS2lzN21mYlBEdkJUd3VpWDRHL2ZvUmduRzEvK09LQndlVnZP?=
 =?utf-8?B?TTVVNWwxQ3NVYyt6VHBJTTV2bWxob3ZzWVB0MW5ockxWbko4UzlDVEROOWg1?=
 =?utf-8?B?cVlIb2pVUHl6MzVsNVR3WW5JKzlCUDF0NmQ3MXdkaFZzVlBMY3FiZWVvY1l3?=
 =?utf-8?B?c3AvQWpGczlQQW9mdklZVHRMOGllb29NK1N4Q1JrcXQ0YWl4M2dKNWhuMys2?=
 =?utf-8?B?em9QcUxZM1IxcGxzVmNuNUFyTE5sS1Z5N28xamdPaklnVmEvYzMxbk16OUdv?=
 =?utf-8?B?YThNMWR1WmUzbndLN3Nra1dISWFJeDdQdXp3Yk5uUXdtbG5mNm9neUlacXg1?=
 =?utf-8?B?VjdXWkFONElhTjhIZForTlg2dmI4ZzFSRzlGVCtUL2w1RGEzN29Tak44Nmw4?=
 =?utf-8?B?QTg2MktmMGl3MlVDSWlMdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2l2WkoxTlV1OVRWdVJ4WGZybEl4aDd2U2NmbVM2TlVrcHViS2F0RTNkTUxa?=
 =?utf-8?B?MEZ5OHFhUEpCMzU1UGR0ckpXaHhCRnp5VzFmOFhqSWVaaUdqYnBVMFlYYXFr?=
 =?utf-8?B?a0xlM0FLQmprUjRhRlk3YmFOOUl0QWFIbC9KUUJiKzliOWQwaEwrajNVYS9s?=
 =?utf-8?B?Um1oOTFSSGU2blpmamFMYjUrYzRCS3drd3dhY3BwVFZLYmplUkY0ekN1Zm1H?=
 =?utf-8?B?OVhNNk0xOWt0SzlER24rZzVIYWlFZFM2QkdnOHZDS3IycVlKSU9naDZ2NkV6?=
 =?utf-8?B?L2o3c3Y1WlBrc0J0cXl0TmI1ZWt4ZGIxeVpyNENTYjVUakNmdmVXbFRNOHVQ?=
 =?utf-8?B?UjJUblpDVm9sRCs3VHFmV0p5WWxXK3VwamJMbWtZUFhEenpNVFNmZFY4NUVC?=
 =?utf-8?B?dUZ0UXRRNG5SVmN6bHc1WTdjRE9hN2p0cWRSK2twQ3NhbUZzaWV2WHpGVWwy?=
 =?utf-8?B?dGxhWFZEQnZ0MnB4YnFDQW5OSm5ObmF2Q0ViT3kxOFF5TnEyN0U4RDg5bGdY?=
 =?utf-8?B?cHBzZDByNGRLVGJaRmx2OVY0cTY2Ulg1UitoZDRFc2xWOElNRTVoeGxsTkY0?=
 =?utf-8?B?elhRTlUzeGdJbHJOdElwZTNLYTdRQlRzMUhJa1d5Y3AvOXVBUWN5dWVOZXA0?=
 =?utf-8?B?L2hJWkhTbEw0eUg2dzk0UG9VQ0NtWlNQNG5IV05TSFZraFExQzBDVDgvM2J3?=
 =?utf-8?B?V2RlSGw5QUVnUlZGTS96U3IyWkxRaTE1MW5zOXpYSmJGQSt4NWJkUjA5bkhB?=
 =?utf-8?B?bVVGb2tKUTZHS2ZUWHpERzBkRThDY2dvT0JYMTYzNjR1MHZWSjRMRE40dW1P?=
 =?utf-8?B?a1B0WVoxYStNNkNOYWlRa2JiU281MDZlaXExN0xRS3pNTUFCN2VLeEc0UTV4?=
 =?utf-8?B?M3FmRHRhWENTNENpNEIwV1pmaE4xVUxnVXl0N2xmemlLMUdtTEhLYlBvQkVX?=
 =?utf-8?B?Q0hHTkkwOFVsUUpZM1o4VGsxdUkzYlBOczdLM1NScW96Q3dkRUZvUnJGZXRw?=
 =?utf-8?B?bVhFZEdwRThCbDlpYi9vUmtjNjZmK2N2QUoyMHpUYkNoQmxwQ0RSZkRIcXFv?=
 =?utf-8?B?clJ5WXlDVWg2eWgxYWgwMmxoMisxOU1FelkySTRId3dMdldUVlhzcnJSYTJC?=
 =?utf-8?B?SnZQYW9PWWR1STdiWFp5S1pkVXNPK1JjMjR5QU9LZzEvT0xrK2dDQ2puWW1B?=
 =?utf-8?B?eFZhMjFxNUR1bnp2aGJPbUloZEZ0L0phK2p0OEVSYWlSdTU1bmFrOFI1MkYz?=
 =?utf-8?B?b1paRUhNdjdSNEd3S00ra3RxaFBZcjJwNGV5dnlGcGlWY21VOW9BWVYyeks5?=
 =?utf-8?B?Qkk3Y3I5YzRTYUwvR0xLb0xoRytpZWp4MG1vM0FYeFIzWElkenlFaFNjMVZ1?=
 =?utf-8?B?UU5qa09vd1J2T25aVDJLTVZBeVV3SjZrK2REZk5kYlp0RWZ5TVNsTFpkQUdR?=
 =?utf-8?B?Vmk0b0dFTlVxcjcvcnAyTTZrSzhjV0pDakNKSzg0emM2aWJoM29HTWNRWTEv?=
 =?utf-8?B?UjJ0QzhPV05naVNOS2FpaU1tdENDSHU4M3N4dU5pdC9vWDJWN1pKdi9velJQ?=
 =?utf-8?B?aTlBd0dPakEzV1puR1E0UVV1R2tzM0d1RnVCR0lwYU54YmM2dmZPTGFCTHdw?=
 =?utf-8?B?L1l4SU9nMzkwdnRlbFp3UTI1SUVzZElRKzE4Y3FJby9IY1ZpY2lrNTJ3cG13?=
 =?utf-8?B?WWtNc3JzRkpMK2E1cU5PWmd2Um1jRUhHVTJ6L0o4cllNZzA0cld2V1ZES1Zp?=
 =?utf-8?B?VVRxazd0US9VZi9lVTM0N0dxalNqY014RUhaMEladnlDVEgwZUZYelA4Vnp6?=
 =?utf-8?B?Nmh5UTR5aHEzMjhYZVlwOFhGNHlBQ04rWTdCYkVJbEd6YW1MZlNNZXA4Vysw?=
 =?utf-8?B?Z05MY1dCdEl0T25kMS80WE9rZVlPTjNpMCtLZTY4L2MrbjVaTjNhZk5zRHBj?=
 =?utf-8?B?dW1xWU1VVVlGVndJNXdtaWE4TlNES2Y5TURnbEl5eXZYQTVZWmwydWVtUDRU?=
 =?utf-8?B?UWlpbnczU3FySkNiMzBEZDh5TVNHZE9BNVVLWUhZT096cFNxcmdEV1FiSVR4?=
 =?utf-8?B?Y0ZVV2VHNkxhWTg5blNhejkxZmdSZEVsTXFoTFBDb2xaUGJpb0Q5Y1B5dUJF?=
 =?utf-8?B?cEpkOXZtT1R1ZFNub3BqZkN1endFUWx3ZUIwZG1veDE4K1hqVVkxZTF0VS9I?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SahnrxvX/aR9Js7q53g7w0E7L+8gmXiX3+a1fCTKKLhXDBSc2I6IIZk3GN0wKf56gmIzAZM+7t+NEkvjCSsGNOeSwBMQHAiVxWvZxEBKANUAZUFIgwRWBlGWcxrlOHxmvXosHGnNGFdJ6GosVdz2pdkC1RXM4oCuwddlwgn5iPERoZHlM1GuH74w5UjAlKSEcMqSY3KGR8ZfSInPSgxnH1q95ecuTsLMb3TRtinDJxVekLGdNQm4hy75a2xyU1/XFJGvDE23hSzeonj358h7PFg2OYTHF1DD+P52I+71ae5HGiI/zc2EgDhhqtzC+1ha/yK37/9HJFw8iXnvuvq9qBqljELSli5qXHr0gY7Fxv5ryTDnJxhXhrDT5yYy2Klk9RahTR3vCtUW/YT/HepJRzB8rD9R5tS7cUdRxnpVSIVL4Qoevh5vACkaoyyferdqKEoEzQ68mq32COJL1Nc2UPsnfVKwBZDBdLNY6rIriIx3OzFlykXKVHvCL6ePXHxg9CGJf3cHPL9693frNZIlMMImsarTcd5uAAE2BbCAbBqfjYF1owHADm7+GNLwP9tNhyIbIf/ebepzEB+46O8nWNqtm335kQMos4p669EnwI4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1569c8ec-fd90-4a80-8263-08dd75bee28e
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:28:06.2530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gj9alG2AR5LcU+bBh4Jl9Y+0/fdQVEgJtlHrjAv3JqBPupzg+dxgriCEdz8cWvqlJk2n9t9D8QaUdrEjxgL+CMRkpfZegaEF8u24h+AmTcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5698
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504070075
X-Proofpoint-GUID: MucvFs5lcap7tlgk2-MriICeWaX9rHLa
X-Proofpoint-ORIG-GUID: MucvFs5lcap7tlgk2-MriICeWaX9rHLa

On Mon, Apr 07, 2025 at 12:13:19PM +0200, Aleksandr Nogikh wrote:
> Hi Lorenzo,
>
> Thanks for looking at the report!
>
> On Mon, Apr 7, 2025 at 12:09 PM 'Lorenzo Stoakes' via syzkaller-bugs
> <syzkaller-bugs@googlegroups.com> wrote:
> >
> > I did actually try to mark this fixed, but apparently syz fix doesn't work or
> > doesn't prevent other syzbots from duplicating reports.
>
> This part is not very clear - why would #syz fix: title not work well here?

Sorry for not being clear. What I mean is that I already did this on
another thread with the same, duplicate, report - and then received this
one afterwards.

This suggests to me that this does nothing, or does nothing useful at least
if other bots will just keep on reporting the same thing.

I appreciate that recognising that it is the same issue might not be
trivial, but obviously it's not a hugely great use of my time to repeatedly
chase this stuff up when the fix is already upstream and I've already
-manually- confirmed it works.

My patience with it was somewhat eroded from my experience of telling
syzbot in the previous thread [0] to re-test, twice, and it failing to do
so due to broken presumably VM images, leading to me having to manually
test the same fix I already tested and fixed a while ago etc. etc.

[0]: https://lore.kernel.org/all/bee2d5f5-db93-42f1-829e-3fd250649ca8@lucifer.local/

We do very much appreciate syzbot reports, don't get me wrong here, but I
do also have to partition my time somewhat :)

So I'm afraid I can't promise to always do syz fix updates on this basis.

Cheers, Lorenzo

>
> >
> > Anyway, this is fixed in commit 36eed5400805 ("mm/mremap: do not set
> > vrm->vma NULL immediately prior to checking it"), was fixed a long time
> > ago, as soon as reported, and it's been a matter of waiting for this to
> > land in Linus's tree.
> >
> > This is now fixed, upstream, and this report is - as a result - redundant.
> >
> > Thanks, Lorenzo
>
> --
> Aleksandr
>
> >
> > On Sat, Apr 05, 2025 at 05:16:31PM -0700, syzbot wrote:
> > > Hello,
> > >
> > > syzbot found the following issue on:
> > >
> > > HEAD commit:    a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of git://gi..
> > > git tree:       upstream
> > > console+strace: https://syzkaller.appspot.com/x/log.txt?x=11ab27cf980000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=adffebefc9feb9d6
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=5250c4727db03e3436cc
> > > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1693d404580000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178ac94c580000
> > >
> > > Downloadable assets:
> > > disk image: https://storage.googleapis.com/syzbot-assets/8ecd2318067e/disk-a2cc6ff5.raw.xz
> > > vmlinux: https://storage.googleapis.com/syzbot-assets/05691b82062c/vmlinux-a2cc6ff5.xz
> > > kernel image: https://storage.googleapis.com/syzbot-assets/4698994e99d4/bzImage-a2cc6ff5.xz
> > >
> > > The issue was bisected to:
> > >
> > > commit d5c8aec0542e2d79b64de9089b88fabdebe05c1e
> > > Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Date:   Mon Mar 10 20:50:37 2025 +0000
> > >
> > >     mm/mremap: initial refactor of move_vma()
> > >
> > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11ff2a74580000
> > > final oops:     https://syzkaller.appspot.com/x/report.txt?x=13ff2a74580000
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=15ff2a74580000
> > >
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com
> > > Fixes: d5c8aec0542e ("mm/mremap: initial refactor of move_vma()")
> > >
> > > Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > > RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> > > RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
> > > RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
> > > RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
> > > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
> > > R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
> > >  </TASK>
> > > Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN NOPTI
> > > KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
> > > CPU: 0 UID: 0 PID: 5820 Comm: syz-executor115 Not tainted 6.14.0-syzkaller-12966-ga2cc6ff5ec8f #0 PREEMPT(full)
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> > > RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> > > RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> > > RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> > > RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> > > RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> > > RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> > > Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 85 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> > > RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> > > RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
> > > RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
> > > RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
> > > R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
> > > R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
> > > FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
> > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > Call Trace:
> > >  <TASK>
> > >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> > >  do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
> > >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > > RIP: 0033:0x7f46ffb182e9
> > > Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > > RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> > > RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
> > > RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
> > > RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
> > > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
> > > R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
> > >  </TASK>
> > > Modules linked in:
> > > ---[ end trace 0000000000000000 ]---
> > > RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> > > RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> > > RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> > > RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> > > RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> > > RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> > > Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 85 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> > > RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> > > RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
> > > RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
> > > RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
> > > R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
> > > R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
> > > FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
> > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > ----------------
> > > Code disassembly (best guess):
> > >    0: 48 83 c4 28             add    $0x28,%rsp
> > >    4: c3                      ret
> > >    5: e8 17 1a 00 00          call   0x1a21
> > >    a: 0f 1f 80 00 00 00 00    nopl   0x0(%rax)
> > >   11: 48 89 f8                mov    %rdi,%rax
> > >   14: 48 89 f7                mov    %rsi,%rdi
> > >   17: 48 89 d6                mov    %rdx,%rsi
> > >   1a: 48 89 ca                mov    %rcx,%rdx
> > >   1d: 4d 89 c2                mov    %r8,%r10
> > >   20: 4d 89 c8                mov    %r9,%r8
> > >   23: 4c 8b 4c 24 08          mov    0x8(%rsp),%r9
> > >   28: 0f 05                   syscall
> > > * 2a: 48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax <-- trapping instruction
> > >   30: 73 01                   jae    0x33
> > >   32: c3                      ret
> > >   33: 48 c7 c1 b8 ff ff ff    mov    $0xffffffffffffffb8,%rcx
> > >   3a: f7 d8                   neg    %eax
> > >   3c: 64 89 01                mov    %eax,%fs:(%rcx)
> > >   3f: 48                      rex.W
> > >
> > >
> > > ---
> > > This report is generated by a bot. It may contain errors.
> > > See https://goo.gl/tpsmEJ for more information about syzbot.
> > > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > >
> > > syzbot will keep track of this issue. See:
> > > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> > >
> > > If the report is already addressed, let syzbot know by replying with:
> > > #syz fix: exact-commit-title
> > >
> > > If you want syzbot to run the reproducer, reply with:
> > > #syz test: git://repo/address.git branch-or-commit-hash
> > > If you attach or paste a git patch, syzbot will apply it before testing.
> > >
> > > If you want to overwrite report's subsystems, reply with:
> > > #syz set subsystems: new-subsystem
> > > (See the list of subsystem names on the web dashboard)
> > >
> > > If the report is a duplicate of another one, reply with:
> > > #syz dup: exact-subject-of-another-report
> > >
> > > If you want to undo deduplication, reply with:
> > > #syz undup
> >
> > --
>
