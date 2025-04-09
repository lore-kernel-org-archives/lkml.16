Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9571B1FC8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744175868; cv=fail; b=ATROSAzxTOtnrEkigc5q6K9Q4du0U3Bi+57VM0iscaRF5GL2J0Htpj9HtkTbV7/yOpez3hpSgsFevVQyLVrkDSYtyNQHHIafjtTeEab/9c4lz/k8xK6DOMCXbOrqJ9dKFbuLjaoAz2o8pfbms87X9iHWKu1bfJA58v/tGENy7c0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744175868; c=relaxed/simple;
	bh=L2IiQgRjG7OmFC/k3s1RsoJphBkrorouXkd+UV8g9Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UGsWwXe02NfPeKGETuEYOFsKGqajwq1ryh6IjJ5rqFMMlOQf8TPOtvy2lDijQX6Y83baOpUBKbGcaExAEWfPBc/vtqwqj1kpwcH6r2tq7zCMGq2Hak7dIkgPh8Vi5U8bw4fEXrAHo7KBdakmZQJcU/Urvvmgbbx5gqavMT/12e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cllgJa5y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Rt/sZuIK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cllgJa5y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Rt/sZuIK"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538L9r2n019437;
	Wed, 9 Apr 2025 05:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=AaIV2JXadzSze6LI4/IJ8AftGG2IBXm47WZ4TO2dmsA=; b=
	cllgJa5y39nrRgYZQF+RpE0srGDd25Q1RYXcISanb91J20gKBBEdgGoqVfAMMZiI
	42bJNu8oszxe0iwQ+HSDt3Is+t8EVbBINRxPqlnOtmBXgTMpWQLy3zSkgAjYu9GM
	GP6TDT/mnUSLbmwcMI65Cb3//rH6iELzd4cT+oPc20A15JNNR7FoSIgfohzXV8Y0
	eflPp0tvyu/nk4m+Ej3C1yr0djtAI29hlLmZ0krGA44R+5rUzzEen81KbY0X1xVf
	6lGBcgQg/sMukUa5UKkwgGGRC4QngCUtkVux+bP7sK7HOaxDkMfGFKCfn2nkk2TN
	MwZuehX5E2FZfYH0YoYh1A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tu41eb49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 05:17:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5393sfIx001428;
	Wed, 9 Apr 2025 05:17:27 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011031.outbound.protection.outlook.com [40.93.13.31])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45ttya9y13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 05:17:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alMnRkExg27s0TlYnRvtPBeSTTvPFDSyV/wouZUa216AW7J9AcYujSAeNVSREBInT5GnanqKfIkO4fgfMY37MqZTtiDr9Wxnks21nlt9vumOMz90+oRQXjKaJ7C5FvRYDNzN2dgCs0T5kCwOA2wvgiyhqhMRa6Vuq/gpPKE8oxlPWhNlzc8Dxz9PipJZih0f8QAHH75AuLiOLBdnAZUh8EDnQTCXNUtkf8xXn5GQkPq5+LWskFiNn8lHk9FX8Q3b1A6Kf6W//kyvH7/RUr66wppCZKDd0gPZfZl3/jqwmXpGWQfJQdUAj1o33eHWMggu2jjIsnk0UBrltRJdf2jVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaIV2JXadzSze6LI4/IJ8AftGG2IBXm47WZ4TO2dmsA=;
 b=Csh57aXJITf8YKtrfwmWzWEGE1nTw7phNxAfXefQN8hrOwWfZVN6moiSirfzuhclvBlY6TR4mS5q3QCULSgEcOrGGhobgO1K22/XELF8+FG3g3zg7ZZvhfYsJIyomfxq/Knjm+Vf6zyHx4jo2mD5U3nOhllUAl9loZhs5Xx45KOOhk++Q++QFtDF/7nfOCETKvatJbAQC5B/LYKoqSEXy7gCvzbUei1MBEB+aZJfNq7AfzPZpdslu5YB5tG42CtWMXXO2G2mIBtLpa/HFinOwdYOiZUy33IbGUbsRPBHsMsfGSPMjXjyT66aq9i8RytEpdspEYa4LUsnnzZti/9WBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaIV2JXadzSze6LI4/IJ8AftGG2IBXm47WZ4TO2dmsA=;
 b=Rt/sZuIKUe3hqHl8oUV1kQLqQ9y+fDZIz2Uc7wyNaVo29Sp3lkedy46txIwEe7xL1kWlTjunb5x5BN4BajfcAH7ixSXOiHYnG6otfQyNypT5AgXX9R0C7SKSHwM46DHh1Y9cclu2MehpXybt7JoaJRswEvGReQNTNQzUu0kAooU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPFC322FD87E.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 05:17:24 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 05:17:24 +0000
Date: Wed, 9 Apr 2025 06:17:21 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add memory advice section
Message-ID: <4c085979-0f6c-463d-86c4-456634a1bb89@lucifer.local>
References: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
 <CAG48ez1duuiePx2pFnTuQK8WEEdKGM4AYCYjDb0XLpJBzNT1=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez1duuiePx2pFnTuQK8WEEdKGM4AYCYjDb0XLpJBzNT1=A@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPFC322FD87E:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9aa17e-d60a-47d7-897f-08dd7725cfb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YS9jc05EYzRhaXhLTU1nZlZWRjg2cFpHdEN0UldlaWt3UGs0TkJNTy9zbWZW?=
 =?utf-8?B?OW92Y3NWdDVMRHlvUUFKcDg4OGR6SldNTVVVT3dGWE03YnYvUWo0UXd0NDF5?=
 =?utf-8?B?d2xFd0dOSGhjYXdKSmdtRVFmRUlvQldrZXlFZmh1dm1ERjQyU3pBemd0WkhR?=
 =?utf-8?B?YUF0cHlSMlI0bGY4MTdUeHUzNTNyNEdTdWFrR1pKbFpPeTBWOXJBYktnRlIz?=
 =?utf-8?B?NG9LNW5VWTB1dEVkam9xRjZQWWxSU25tLzluUmQ0VjhoaGM1d0VzNXZQM2ln?=
 =?utf-8?B?R3ZGdmlhS25rVlNyNFFYSmNGOEZQM2xJZ2g5RE5WdzkxWDAzQlZ0VkxBY2RU?=
 =?utf-8?B?UVhoMkZ5Sys0R3AzbTR2OWNma2FHKy9kOWhnZXdmTEMzcTJ4Y0dSZEhwSCtp?=
 =?utf-8?B?VnZsVjhvRkF1SytHdFAwYnA4MFkyT1plSFNpRTNCUnBUanNoVDFaRXFkNmxB?=
 =?utf-8?B?OGg3MENkWlo3cU5sMnZBQ0RnZXpVMG92aFFTZ3B3MHUwMGFiTXBuZ0gzRVNn?=
 =?utf-8?B?bDE4ZGIzNGFNRmFQblFCRTVrOWlwWiswYlJTK0lON3dUQmlGRXBFQkZuNWdH?=
 =?utf-8?B?bEdkaDZraW1nVnFpY2RQSXpSKy9oZmg0VDdGRjV6dFNLY0xMNlM3MTNmbjRD?=
 =?utf-8?B?NkJ3clhLTW8raURZTkxxeE45Q1JjUGdRR3pPN0cyQ2ZZS3d2SktjYlNzWW95?=
 =?utf-8?B?TWVLU0U1OTFGakxieWpmdGdpT0s5UW43RDVRYXhPNjlvZkxLSFk0SjdsQ0x6?=
 =?utf-8?B?cjByZVJyL2NyZTlFN3drY0ZBbUEyTkhpS0NTSERaY2dvN29MeHB4UWRKSkRR?=
 =?utf-8?B?MkpGNXRHMFR1RU9xUEV2ckU1ZCt6Z2szb0V4UEl2UmdVTy91c0NGb21rS05S?=
 =?utf-8?B?cmJyeDl2RGlkbDRyQnlaVXFaWThObGZ0SjJXWmwrQ3R5UTdaTnV6UzdzT3dy?=
 =?utf-8?B?ZVp1dEEyQWgwSFlRN3l2R0pveHFlTDVTZUFlNEZvQjU0NGFRejJBWFRPVTVm?=
 =?utf-8?B?WlZXTVBPVlRsZnVRK0tPQkVqVEpJWm5MZ0RlekJTMjVPU0N5R3JoaUhERnFT?=
 =?utf-8?B?N203TWxBaHUvd1g3M2RJeWc1NCszT2hiWWZ0UFF0ZHExNTFiNi9rZlB5aTBH?=
 =?utf-8?B?QUNrc2V2YW4vVEt6bHpjbmtNYmd3Z2pTMFRpeW8yU0FMZFFsbGhaSUVwYmpI?=
 =?utf-8?B?M25YaHJiUTIvRzJGdDNxNGVJVUQvdTJFYmhhTmpNVU4vWDhBSFhsU3dZV2RU?=
 =?utf-8?B?dFpGYmhJS2ZXYWtlZ0J0ZkY5SXhnYVJibHA2SUxiU3RkTGtGUUlJNEdBUUpK?=
 =?utf-8?B?ck5maERxWFRQeDZpSTJRdHBhdVNDbmQxMCtWNmR6SHBLa29DWm9ZVy9hOGox?=
 =?utf-8?B?Z0xudGw0SEF3c2doN2kwbWNYdTdpQ1dOaEZ4Yzl3NHFiRGw4enNDeU5DSGtl?=
 =?utf-8?B?VjNSc2xmRzRjNWpJQlpyM1BUV1R1SEM3Vmc3WTVab0lraWhrK2orUVhoY3V5?=
 =?utf-8?B?aGo3WlY2Sndma2dOQXdzRXR0aVpaalpNNXZ6ekFwd1RNcEpZTHhlSjNGaE4z?=
 =?utf-8?B?UFdXemdNcEtsQ1Z5d1RnZS9RRXJNM0Ewb2F0SnBQRnNDN0MzTzA4Nk9sa0o5?=
 =?utf-8?B?cUw3R3FmZ1U0KzU1dXZtcWNLdHZYcFlGSUxMTlJpMGRXMmk3K1VSOHdJL0tm?=
 =?utf-8?B?VFYzcHRJZUthVXV4M2IzQUwxUlFOUjdwL1MwOVh0NmZmenFzakJOQmVXNHV1?=
 =?utf-8?B?TGFITm1GYWd4NGtWbHNZM25YZ2hQbzAremF2bHhmMTZsRGo2TGNpVWk3YjNU?=
 =?utf-8?Q?YD5c9/BdHqScVM1jFC//2ckyKTgKCyVYybyHM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFB1b3R0QkN4bERqNEp2RDU4SUlTWXdzMjZZT0dxNXdCd2hHTjNpQ1VBYS9M?=
 =?utf-8?B?SFFYdzd4TGU5QmFXOGE1bExpQURvb3puZXpyZFdXMENiNWlNNzVlVmllV0ZC?=
 =?utf-8?B?cXByN005SVNkN1N3QlEyUDM3OGhMZHVLNXBEQmlMR3JOdEZ4MHJYNGdQQm4z?=
 =?utf-8?B?NHBRbUtMdEdIRkt3eVlQcFdXeXFhZDVOSjRscUFXZ2pzMDI1bitjZnI4dVA3?=
 =?utf-8?B?bU92RkMxUzR2d3B6d25haURVckp5a3cxRmZ6Q0wvd2VYcytsZVhCNWN3c3FR?=
 =?utf-8?B?WmhlTDJsZ3NySGRZVURBdUpUQzJBcEhjVjNmSUFUY3MyWm9LRVhJUnp4WDgv?=
 =?utf-8?B?ZmRlaHpKenJXV25ESnI0L3V1S1o2blJ3M0Y2UHZpTllWbXYrSGVuSlQ3M2RP?=
 =?utf-8?B?UlNqS1h3M05KMVdjQ3FCeEpJYnY3K2VvdkdGVXlLazlPU0lhOUI5cVhwS1VB?=
 =?utf-8?B?YU96Wnc3OGFrRGVMa1Z1a3h3UklwOFI5V2U0OE5HUWsxTkVxcWlobXBtWFF0?=
 =?utf-8?B?MVBrSkZCUGhhR3MreDFxRmdqSUZDN0lGNVZoc2ZLZDU0d0NndjQyNVNJaGNt?=
 =?utf-8?B?cDFJZkw1NFpxRVQzUnJ0RkZCR25TNnNuVnFOQmFNcUtiQXVhc0d4ZkZwU1hK?=
 =?utf-8?B?TUxndmR1MjRSejVkZEpXVjhZQkZjS0pXdC83TmJpZ1d0RXh5azBJU0d1S0cw?=
 =?utf-8?B?SE9rODYyYjRLYlVDZCt1NEJhRU1KOW9NUlZsVlJLbk9Yb2FZNE83Q3ZYSEh2?=
 =?utf-8?B?Umttb2RhSHZaZk05RGVTd3RORnJTVDVjRGN4Sk9mcTVDeVBjRXdhdzB0Zi9Z?=
 =?utf-8?B?L3hwN2MrS0I3bGFGSXU5MFNvNEhmakx3TXZIWlNxdEtwVFBuNmxRbWFvaFFP?=
 =?utf-8?B?Q3dSRlBQbGhDY3MrcDdlK282Vnh1SVd3VTJTMTRONi82Y2tOMGlrYmpHUys4?=
 =?utf-8?B?WVBjZjZhZTNXaWk4eElHaEJ1alZndGUrZDlISHZXcE9IMVhBZWE5NUJCeFFT?=
 =?utf-8?B?b002MVlkSklkTWNYV2RFdTR2VUxsTDk2THNSSGhCOXRsVWJ5eVdZKzZqWHJV?=
 =?utf-8?B?TFJsYzNQb2tYazRJQ2tWVDNiblNxOWU5SGRkZUwvV0VJUngrd0MzTXF3VUF6?=
 =?utf-8?B?N0RuclBydFhpeEdrT1dJNWlac2Mwc21VN1BCeFZyL3JkWVZ4cDNuckVXN1Jv?=
 =?utf-8?B?SXo1cWRyb01ydmFyYmNQUnp0ZkY5L1VUU0hhdi9mZFpONVViOGxSUXBSZGho?=
 =?utf-8?B?MThnNDRGaFVMQU94NVNUYXROWDJQOSttV2E0d0tjZ3ZKVVRKaUxheG4wWEQz?=
 =?utf-8?B?UkNhbnlRWVBHWjZ6K2xWaE4zVkFnVnEvZ1hvRnpGZFJTMDFDMFIwM3ZqdXRW?=
 =?utf-8?B?NDZ4aGZxTGNZOEpnbGhYLzhoWG04SXgydFpjVXZoZXl2K25lem41bkZ1TE02?=
 =?utf-8?B?c1B6a0VWSUhweTBUdHR4cllrOUsrS0tLL2FmY053LzlBM3BuNE1ZUjBHMXZG?=
 =?utf-8?B?cExCUVpma29lZ2MxaHhzQklYTlJnVUNXdkpGQitRaEdhUHl1YnlUWWd4bWR1?=
 =?utf-8?B?MmNtSGh6TTNraGNEdWwwMnhGdng5UzdtUk9oUDhLdDdhSGl2aUx6M09PV2o5?=
 =?utf-8?B?bkhKbmRxNHNtYndUUzlOb1Z0Y3YrenpPRVZZTVFrYnFLSCs2T3l6dmJScnBz?=
 =?utf-8?B?ZjRyaUhmMm5jakZkSFVTVUxrQnFtbXVkMmMzZzNUS1kyNnVQZG1JMUNTZml4?=
 =?utf-8?B?bS9qQjVZUWpTcGtqZGk2ZGxpOFJTeFpjRENrazVEVEQrRFZTUEtBK0V5T0RG?=
 =?utf-8?B?SWtCSFlBZWZHa1ozYzk3bXR1UVUzeG95WUpRRnVtUGdzWEVCeWRmOWpoekhL?=
 =?utf-8?B?UEEyWENuc0taakIvcGtjbVBHQ1NpUHcxN2NiMTRrYTJ1SG5aZmlKc2pKemJ2?=
 =?utf-8?B?V1c2MTliU2Q3K2h1ZzlUREFJKzM2RE5jSm8wUVNISlV5SFQ3NzJvRXZFS0Fl?=
 =?utf-8?B?UnhBVnZMZXFzWXpTVm9mMDJIWGczMGNxZUxGTHdpc0I0Z3orVUJiVGJ3MEMw?=
 =?utf-8?B?Rkc4c3hFRmxXcEx3Q2lKb3h3VFNhQmMzaG9IUnBKZ1ZPeTErejFXSEovQ3Fr?=
 =?utf-8?B?dDY0cURjZDl6dys1SUJEMWV3RGtPV0VrK1YrMHlmZVRhcm5NWmM2Y1NVVEdn?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/8sOMsDaomJ4ryfoAC44Cu5/xVzKK6lEYNsiPtD6lgWJfFm0G2dS2WWXyjZdHsmYi8bID7zMtBuvIwImxyVva2JChhpqv6FDn7V45qz7P6KIeUeJOV4i0brzCnBIynGAyx2csk8KGYqI8jW3Lk0hP7fVoOc78KlUgMmW0qPqWE/Tzoq7v0A+3oCtgR1fqlqjj0I5dFAh7/hVhNN3jOc6J+ZL/4tut0BoYIaJcZduPsI6/QuKO/XODLOGqBEOEKToKIpq0Irsv/2+BJNw0OWmisgi/ExfouLlAbmOHG6y/ksKALa3aCCPsZAWWn8Iika+xr30IjRpCVAMQuZ34IgsFwYi1oBXuscsoP5WGvWJHoM1zmARDClUts0Si4WaQE6EFm2oJSxQCkZNpKotqAwcTCoJEfHZh9sEWwskbTdeq8n13CEzqdyXKgtQwa6oY9kyt1LAZpPpv0pSJWWQ9uQEix/k37XLT9KXEoswxArNo93t+ZRHHo40u8i89NUy78+9s8hHFjN/YDV6fVkqDcYL53yagABthCRYl+hWJ8XZs/zSpXXiK/Te1TsY1+PAXtPCzqFPBI7WCaw5EPWSK7GcHiyl08dMFBpFQsLWevuNjLA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9aa17e-d60a-47d7-897f-08dd7725cfb6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 05:17:23.9691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/8tzsw1M0XgBQaYXxm+HG7dVj5DRChfbA4JuUTPR7RfGgFvcjtAPdAxsZNGdybwdDk9veCF7EPH9auHT0ZcnCWfsO5mLZwi24enxpjT64Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC322FD87E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=886
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504090019
X-Proofpoint-ORIG-GUID: g4N-CW2BbUno2AT3BVWT2SvVpSs_TsqP
X-Proofpoint-GUID: g4N-CW2BbUno2AT3BVWT2SvVpSs_TsqP

On Tue, Apr 08, 2025 at 08:56:30PM +0200, Jann Horn wrote:
> On Tue, Apr 8, 2025 at 6:11 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > The madvise code straddles both VMA and page table manipulation. As a
> > result, separate it out into its own section and add maintainers/reviewers
> > as appropriate.
> >
> > We additionally include the mman-common.h file as this contains the shared
> > madvise flags and it is important we maintain this alongside madvise.c.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Acked-by: Jann Horn <jannh@google.com>

Thanks!

>
> > +MEMORY MAPPING - MEMORY ADVICE
> > +M:     Andrew Morton <akpm@linux-foundation.org>
> > +M:     Liam R. Howlett <Liam.Howlett@oracle.com>
> > +M:     Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > +M:     David Hildenbrand <david@redhat.com>
> > +R:     Vlastimil Babka <vbabka@suse.cz>
> > +R:     Jann Horn <jannh@google.com>
> > +S:     Maintained
> > +W:     http://www.linux-mm.org
> > +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > +F:     include/uapi/asm-generic/mman-common.h
> > +F:     mm/madvise.c
>
> Is it intentional that this one, unlike "MEMORY MAPPING", has no
> explicit "L: linux-mm@kvack.org" and relies on the inheritance from
> the overall "MEMORY MANAGEMENT" entry for that?

No, was a mistake, have asked Andrew to fix in a fixpatch! Good
spot... whoops!
