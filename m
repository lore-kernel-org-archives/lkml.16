Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D79B18A6D2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770730; cv=fail; b=ZrW3bITdtBbaEbmqfadJa22P2lDdQFvEWlkVMfaUymeTDdPi0cvdhteVveUVx2Ju4xg1WxZOjHWPMpNYl1iR4oqEnJxOLHFJ7EGs3ifn8KZK8LBJdtZiDxuIgMnFlx0scHbsiVH3jKwI3bE+VaOdMigs6/LR93yOFHva+Y5i/bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770730; c=relaxed/simple;
	bh=CUdABEPcORjr9axxlVvcwwK183iZ/1k9URBqNqBQNrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cEv0HoPm8WkV1Igh37zXTaQK6e2VaHKBgj88FxbeGtAb7CQWxUmslCEIYyirs1/cuulHu5o/0IQBJKnxb81CsXVamZrpDmRn6Jxe7WPVl56vlqw9IbeEKCfE0VGxmcRVWoM8+EvNnOEAKApperJn3d7pjpYuj4RJMP4auynAUv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NsEX2RQj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kKtl2SiR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NsEX2RQj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kKtl2SiR"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515DRT63028831;
	Wed, 5 Feb 2025 15:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=rQQiymbesDzyEjdUCi/SmvMxFhuAGSMazy34yud2nj4=; b=
	NsEX2RQjnh8D3TECmZDp60ARUif58wiFFQpm4CIy8YWaNY83uRnSqU0tYheG1cWU
	fH5tJORR6Vfxs9j8wnKS6uLZN4vdIL7nFLSN9kCYtQr3xI8AjWilGpbFhvEXWT1F
	auVUyPhXhdgmM8Fd05V5X250jlDcMHHpKRNvOB9K6PZZMtTlBiJrMuNWBGRZhxne
	hppB/h323WN0m6vYjdBmd56HieOw7+i8CtJS9SmraEYlJApv4cj7fk55N/BXoD0y
	r2ern9Znza2mVoe8HyCfwF+wWPqZIOukozwz6bPYR+vlihLrPQwZGs/1PRGOzJHj
	fxU2QRH9+OAN97tc01XRxA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhbtfgp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 15:51:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515EfUhE027775;
	Wed, 5 Feb 2025 15:51:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p4jj6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 15:51:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CO5n+toF3Ns0RhiQDM3csMbKv0URdd0LMoSd54PWO4OtfIU9TUTRw0LGtibYPSNbBDb5YE6UtqNkRCSZ1WnWRBOYDoCPctBf/m0MO4R72vlmKvM/XB8csJJM0MTxeQPZiZ8PtMWXJlkB+xqj4L8obgS4v+KmofYcQXfRsoLKf3ql2r7g7p1/WJZTY8/sK166HkpHZh1nSBd5GTh6oIY0g22MVy/IwhqFIIUzKTd0oQDvVlEeskyXC8dkBp1TFYAiF67Tr7gh3T0Nqf1HJUwjkeatffuAD71gw6RhoOEtkvOekx9MWykPrRtnzH/Bx0u+QFEpI/naIHeEH8jsGX1U7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQQiymbesDzyEjdUCi/SmvMxFhuAGSMazy34yud2nj4=;
 b=eGCAVZ1zmLEtRkB4OxIwBQ6/5J0Y0cNNpb06VUZAtO3Eov7wgIE0r+XBQL7dS0tC8sTU8ey3y5QMb9tckbB/g9vZ64nnBz1KWz4f2+D8iMMIhfitAyHp2A8edg1nA6GN9GgcRWBt0Cm35dknLHvhZggERC0CS4NTV2PrQajS/y1F3k3mSl7bpyPTK0l8HS+K6Krml7pAKLbdRbccI+gxe849PERpMaaSrL2c4pDWWaDW+CFuUmutyI8ejSEKlKA7GB3afaVY7KoujoYlU0bDLDtyy6M3IS9z0Sk9QWwRUHyQ3RRKxchh9vKxfwionLFLnkjjXw5PCLev5Ag+S1IFNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQQiymbesDzyEjdUCi/SmvMxFhuAGSMazy34yud2nj4=;
 b=kKtl2SiRhmlh8H7tqRhSoxjb0XXGZsewj2+77bio0+gbDK9hA2jm2Kx01ol/T8gpG+nFhfiZMWRxXXzctwJbbWHaxC5hGCL2ofiTMdNpGjdwn4lWwJi1QfBrllOH17lrQCBsuKfTSZzO1uZiu5+nrkeOQV0RExOfaQZyklW4lAI=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB7152.namprd10.prod.outlook.com (2603:10b6:8:f1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.10; Wed, 5 Feb 2025 15:51:51 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 15:51:51 +0000
Date: Wed, 5 Feb 2025 15:51:48 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Marco Elver <elver@google.com>
Cc: Jann Horn <jannh@google.com>,
        syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>,
        Liam.Howlett@oracle.com, akpm@linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup /
 try_to_migrate_one
Message-ID: <097c6249-e86e-42c9-9f43-bb9f8a865ce4@lucifer.local>
References: <67a34e60.050a0220.50516.0040.GAE@google.com>
 <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
 <13bb4bbf-92e7-4c45-a3a8-a52312015f92@lucifer.local>
 <CANpmjNNeXjtatBD6Lrz2-1jiqLkpcuk0Ra-6uJKzz3=y86qVuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANpmjNNeXjtatBD6Lrz2-1jiqLkpcuk0Ra-6uJKzz3=y86qVuA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0459.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::14) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc17e89-a1f2-4ff0-d744-08dd45fd018d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YThNb0N0TENKaGRWY1ZUSDg2Z1h2Y1k5blQ4akV6YW5tSXlFRUNUUlFIVUlO?=
 =?utf-8?B?SnFIU2R2N1FpeUlESDVIWm5KRFJvUmRLNjBTT1d2TDF0eGhvblArNHUvRnFr?=
 =?utf-8?B?NGhuWkU3TkFkdVZ5aWlic2hRNmhzejFBMTlGaytIdzRCTDJuT1lRSXZRSkRj?=
 =?utf-8?B?ZzNGOWQ3MkdhcWlta0xzdTJmV3lKUzljVGhHbkxDS3hkWHhkcm4zdU9pclhk?=
 =?utf-8?B?VW0xdi9hTUJ6YU1PTDMva28rcCtrcFAvTndyMUJHQlhIVFpOT3Z4WVJscy9l?=
 =?utf-8?B?aVhYaHRQbWtSL0NjZ0RvanVVYWxSanBlYVEvZE5lNGFKbUVOUHZaSmJ3VDB0?=
 =?utf-8?B?MDJkR2JHekZSdnVjTzQ0MHppOHBkR1NXR3EvSTRhbFN5aDgyMkpzMldYZ21G?=
 =?utf-8?B?L09USFhQQkZOL1lzNXNvdnZuS3gyUTNsZC8rOHpEMGpWdzY3VXgrazU3eG41?=
 =?utf-8?B?dEphaXRGajUyV3Q3b3pZSUdtU3cwazUwM0txcCtJemZwVW0zM3Q0VEhuc0JP?=
 =?utf-8?B?RG95VE1PQmxQNStCRVZuSkRhblMybitMNGZJTHRaY0Q4RFg2RndEQm92UlRJ?=
 =?utf-8?B?eU82L1VTdmY4S3RyamJXUVNLelhibk9OMHNPL0Y2NStNdFV3Qjc0dGpzc04r?=
 =?utf-8?B?dVpSRFltTytURnA4RmFobkRDdGJlTXlEM3NLM0tCUm5FanFoTnhxZjU0R1c2?=
 =?utf-8?B?eVgxWGQxUmpLbDgrYXVGZUJVS2ZVUU1ERGxpcGtlazFUTllVYVhOREFpZzJv?=
 =?utf-8?B?S1l2bVhNamJkV3JpRHVkSyt3VjJRL090b1lrSzFoNitDaFY4eG02WmhLZmkz?=
 =?utf-8?B?ajRqYjIyTmRCeXU1SzdHamphdlNyTWdmRVdnRk9WVy9Ja2lETWN6OGhTV3NL?=
 =?utf-8?B?alZpeng4WVR4ZkNLcTJKTHRmMzNNZktzU01BRnFVMXk3MHkra3lqaGRmQStq?=
 =?utf-8?B?YVdYZTVGaklrQlVlYW1xd0ZOZE1YdHVJMDJnUDNXTEJXTnZ0N3diUDA3bDBQ?=
 =?utf-8?B?QjZwbWhFV2laby9pcFhVekpWdG5FKzIveTdRMTk2eDRtV3kralNadlVLOG1v?=
 =?utf-8?B?Y2x2OFhiaUxLWEhMRWsrTjFUSkZaOFNHZVd6eEVEVVlFTEo1RXVhaWdET3BS?=
 =?utf-8?B?alVaVnhtUVVEUnpYY2YxL3pUSHRVSEt4NStGVFUxN1FvS1djcG1YSm1ORUpx?=
 =?utf-8?B?dCsxNE04eFFpdnpPd1VKVmhIYlNKU1FwUEwzVGxwckt4R2R6bStRMzk4dUF0?=
 =?utf-8?B?ZEZpcU5pQkpNbHg2UzlGT1NzbWdkakowNUFBMzA2dk9RNzZTY2hWUnJMWFY3?=
 =?utf-8?B?WC9wWWRHODJMSldCU0Y2eXhNTUs5cW9hNm5rRGJvcUZuUDd4eUZDZUVvTlpP?=
 =?utf-8?B?bWlQOHNOVUt0OE0xbzhRaHkzK1hyWXJVMFFXRG10NkRwVHZPTXdXcEdlQkVw?=
 =?utf-8?B?cUNhOXBwTjFjRjdEM2JIcGxnN3BQVFVpNmJOK3g1T1pOTGd2R3ZtV2JTYnBn?=
 =?utf-8?B?Y2FTUjBVZW9hK2NuZnNUQjF4Zm5mRWFaa0JiTExOc3NPVHJ5WHQrVWFIWSs2?=
 =?utf-8?B?aEhDTG9RTjNrSGhnUGpwTGVHaDVIVkhXbEVSdm1IRk1hQVY5TW1KSmF2Yi9r?=
 =?utf-8?B?bHl3R3c5M2V3ZUFkM1ZQRVhNQmFYTzBNeFFaY3FGdlU0bmdORFU3MTEyUWNm?=
 =?utf-8?B?bGhIT1lIRCthS2NIVmxNQUxHWWhFc2U5R1VPQmt2Q0xkS1V6ZEU1WHNFUWNL?=
 =?utf-8?B?SDFnN081aVBFY040TUlYcGF5bE1RZkt6c25rQ2pvSmR1MWMrSkozOE5GcGhM?=
 =?utf-8?B?T2xPU2NwWE1KRStSaWc5UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVBCMWY4TTd2NkVUZ0Z5RlJZTWc1RDg4U1UxTVoxSU16OUUzVTkxM0plTjBO?=
 =?utf-8?B?SmhNSUZaTTdsN0ZpKzc5d0VkRnNaMFpwWFgxV2NRdXJZZVdPZ2xEWUYwdEZx?=
 =?utf-8?B?SzhVc0pqZnMvbEFtdjZSdTN2Y3BBWUhvY3JOd0R2ZEpMdDQ0b2hhY202MFNC?=
 =?utf-8?B?RW53dUZlN3JOY0N6b3dRbXRDZEpqQUt6d0FVaU5Gd0FwL0xDUndYZjd2V3Ft?=
 =?utf-8?B?bndkWEl6a3RyRVpZa3ZOZWZUTHJQUmNEZzhVM2NYWFZQQXBwZHJMSllpRTB2?=
 =?utf-8?B?YTVrdmljSVdaK0NnTGxvWHRHekxPSEQ2QlE1Rmo5VFFtMFJoVlR0amRUci9B?=
 =?utf-8?B?aldTeVR0V1VTUFBZSXVrY1N5YkQrYTZTVStiR2toZFpmaWw1N3k4SnAyalRw?=
 =?utf-8?B?Q3dYb1JFUmxrNVNNKy9HUGx3MlBTT2lLVk9jTmhVaHpDZ1JFb3N6S2pTb0N4?=
 =?utf-8?B?dSsyc2IwOSt6QzNvT2V5UDdWNzhFeXlCSFdOb2c2T2h0c25TcDk0Rks0bS9Y?=
 =?utf-8?B?QjRuTHpoTW1nRVJOVHV3dS9KbnVOWFBUaW5JdWRpNDF3VmlJQi9uKzBhL3ZD?=
 =?utf-8?B?SVM1anNFQ1YxYUFhN3BSOVkwOGpTMGdrNnA2UmcxZW1FNVczaGl4K2dUZk9J?=
 =?utf-8?B?WE12MGxQNVhIQm1xOStPdm1KcDlLMlgxajhqdnV5ZkxHdXFFNVc2SXZORHJa?=
 =?utf-8?B?MG5wQkkxdjZQOThPTTRRT09BN0hWOHNlbFNmOEo1SWVjNFVhSERkUW8zTUE2?=
 =?utf-8?B?MVVkSzl1WG5zbVZrelFTZ2pHZlkxU2cvRUEwbTlrUmNCNzlicFkrOW1DZGk4?=
 =?utf-8?B?dlVYUnIrbEphZCtmTzVhSGtMbzJkRmZTNndONmNST29HOFp2K1d6YnJuc2FV?=
 =?utf-8?B?K2JyVUdpVWtSMWNLdlhQK1dCb29IWitZQlN1RFFkMUk4N2pqWnFwOE5vYzla?=
 =?utf-8?B?Q1MxcjVJbkpwTWFLY1BNRXprMjZvYmVnTzhqSGJreUV3RUZDSHZQbDZ3TWVR?=
 =?utf-8?B?VlpyZEY5dU5sUUdGMzFQZ0FMNEtOT1BKNWM0OURrUGRYck1kWE9xbzQ5ZkhH?=
 =?utf-8?B?ZDJudXFQUVRzZ0FXeUhxQ21jNWxJSmVyZUVmNEQ0NnlUaGtMbXNkNHNjOXVY?=
 =?utf-8?B?RGt6RlBjNlVITVBkUjkyc0N2bjEwNUQ0dlZCZjZWbUdwb1U0RXAvYzB2Rkkw?=
 =?utf-8?B?Qm1xc1NWMS9naEpoVVBRVm5zRHkxa2VtaUhpd2tjdk1xOHVwOXZvWkEzMnlI?=
 =?utf-8?B?QjBnL3hUNlczZE92VmV6RWFOWFc0Y0E4MzhsS2dwV2c0TlFLQkZWbjN3eG5H?=
 =?utf-8?B?RWwwRStSbWlGT2w0UnpHMVlzTEJ2QlBMczNIalJzSjZNUDNmdmF6TXhtQ1lZ?=
 =?utf-8?B?dkNqbWNGSmtjMnFhYk1NSDdITWM2cEpreDJ6a2dpaDJEZ0dra1BqK2E3TFl5?=
 =?utf-8?B?cEhxdksvUmNRRWVGZ3JuUTZKYWtKUjI3d1Z5OVNoOENXNk5mbTY3VHVoQWFH?=
 =?utf-8?B?VnY4Y2MrQlNmV0I4L0xuVDhQL1N4SHFXbytLcmZyVHhuSEV6ZlJBT05jak9W?=
 =?utf-8?B?a01XTWFLMnVvK3Jrb2J0MFFFeHdSVTBoS0ZZM3V0QnN2NFB1emdHcEhJbkxk?=
 =?utf-8?B?YzNWcXQvVHFORFY0NXBFVGhhZXIralVaZzJBQXlSZXpHUDRBaEQ3Y05jNkl4?=
 =?utf-8?B?THdiV1o3MEhVVDd1TGVuWC9YWitrY21oRGJ5Zk5sYWc4RUVaR1d1dGNPdlJx?=
 =?utf-8?B?RkJKaUNnRElIWkZJVTFldFU0NThwZ09ibGF2NllTbnhmYmlzUVhxYnlKbmxw?=
 =?utf-8?B?djlqUURtU2ZLWXdzU0ZhRHMyY0tPTmdEMk1qR1NsVHBzVGJVL3FLUnd1aHgz?=
 =?utf-8?B?RkRkODZMb2NtVS81aWpqMFRyQThuSVRQN0VuK1pvc3BST25ldGhPaVdYbHpI?=
 =?utf-8?B?eTVRQW54VEtyRm1pdmR1bks4Wkd5OEhLZ2UyV3NkTnhZcFVmMmFScGNjM2w2?=
 =?utf-8?B?d3BVMUxxWGlVMTM1bUF4eVFYV2R2WFdkQVpDRmVMYi9mV1VucGNvTitCUEQy?=
 =?utf-8?B?ZzVNR29GWjIwZFZWYUxGdFE2UUZCR2JFU2JZMGZVd1haK3pDYkR0RmNrMVJG?=
 =?utf-8?B?ZzV4MVRoNDJmbHRzWTFvL2dCaDRBclE5UlhNS3NLYVRwc09CTGlvVWlMd1Rs?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/gI5vrhZ0bo+BBzGRZP9iQ6elVPKLj2XVv90+rWa5hVLWCdJM7AMsvvjdR/4mG4/pivZghbYmDgiwT5Ii23QRD+eVjt62Yz6R7D2DAd93mTTRqvbLf3vHr64rqsQsv4LnH6tSQLS7rfQqMHk9BV5Yx6QYlPer2JxjanBckTewyxYpV8d1ISziitlkjFt4Sm8804QKew9ge6C+v8LH7yUVU3eYTF4a8idPM1ppsHy7HwYpKoj51ypUKeonirIAxWsVePWNa7jEyWx5H4+D9R3uI3VAYD4J4Vc5UW+TB2ALGUq99ubNfrb2m5cyR81oAb9/hPLEEiwojJh4vROAr7jOm8a4U61ThTGI8Ajbc6NGjJ/vSuwK9jZb5O8Xqs92HdRXtpGD30Re1YzYGMP8hqHZ9KK/9OIrYH8zOJjyxAOw/zZsddqD3vxghpnz1kKADJmha2fQkSZGG4esnpWkICTpcWBkYNfW9RlRqBcTgXE2RfULTNInEZL2Xmc/a/vQT0oY/O+52VRyCJp1WEiMFk/SLy1SIbIT+o7yIUCqNUz0UzXLYe/DOKydYgW0CrTn+SrqVe1EPn0BbDubd1kghzgT6NlypT8BugGXSrV5a3ICsk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc17e89-a1f2-4ff0-d744-08dd45fd018d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 15:51:51.2791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdHJ3mBi4VaumIdXdiOWdvP5oooNlK3xsrd+7EELcdFoZ98JV6KM/TOjm6P8QdkfF5h9b3ikIertEqF+zN8V/EYEP6GxfGwx50A8MFU331Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7152
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050122
X-Proofpoint-GUID: PLSnGu8_A72ItMU_uHPjTpJMDpJhPWMi
X-Proofpoint-ORIG-GUID: PLSnGu8_A72ItMU_uHPjTpJMDpJhPWMi

On Wed, Feb 05, 2025 at 04:46:40PM +0100, Marco Elver wrote:
> On Wed, 5 Feb 2025 at 16:11, 'Lorenzo Stoakes' via syzkaller-bugs
> <syzkaller-bugs@googlegroups.com> wrote:
> >
> > On Wed, Feb 05, 2025 at 04:00:06PM +0100, Jann Horn wrote:
> > > On Wed, Feb 5, 2025 at 12:41 PM syzbot
> > > <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com> wrote:
> > > > syzbot found the following issue on:
> > > >
> > > > HEAD commit:    d009de7d5428 Merge tag 'livepatching-for-6.14-rc2' of git:..
> > > > git tree:       upstream
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=12b678a4580000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=9e757e3762bd630b
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=c2e5712cbb14c95d4847
> > > > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> > > >
> > > > Unfortunately, I don't have any reproducer for this issue yet.
> > > >
> > > > Downloadable assets:
> > > > disk image: https://storage.googleapis.com/syzbot-assets/9235000a1b88/disk-d009de7d.raw.xz
> > > > vmlinux: https://storage.googleapis.com/syzbot-assets/098ef82f8ab3/vmlinux-d009de7d.xz
> > > > kernel image: https://storage.googleapis.com/syzbot-assets/4f51f5eb5782/bzImage-d009de7d.xz
> > > >
> > > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > > Reported-by: syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com
> > > >
> > > > ==================================================================
> > > > BUG: KCSAN: data-race in mprotect_fixup / try_to_migrate_one
> [...]
> > I hate that we have these landmines waiting for us. Be good to find a way
> > to explicitly annotate this, or at least comment somehow.
> >
> > But agreed, probably adding a READ_ONCE()/WRITE_ONCE() is appropriate at
> > least for the proximate thing.
> >
> > It's a wonder these things don't trigger more, except you need probably
> > very precise timing to do it...
>
> They do trigger, but we don't send all of them to LKML.
> When we first introduced KCSAN, the notion of "data race" was still
> poorly understood. At the time we decided to pre-review a number of
> them (but our time to do so has been going down :-/), or let willing
> maintainers deal with them directly. A number of articles followed,

We very much appreciate your efforts :)

We are definitely willing to see these in mm, and as you can see from the
discussion here, the interaction between the rmap locks and other locks is
complicated (see also the docs I wrote on them at [0]).

So it'd be really good to pick up on these kinds of races. Obviously if there
are spurious reports, better to filter those out, and again, your efforts at
doing so and enabling this are hugely appreicated!

[0]:https://origin.kernel.org/doc/html/latest/mm/process_addrs.html

> such as:
>  - https://lwn.net/Articles/816850/
>  - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model/Documentation/access-marking.txt
>

Thanks :)

> And I think much of the community has indeed been "Calibrating your
> fear of big bad optimizing compilers"
> [https://lwn.net/Articles/799218/]. :-)

I personally appreciate all the help I can get in calbirating said fear :P

>
> If you want to see more reports (you can try to search for ones
> relevant to you):
> https://syzkaller.appspot.com/upstream?manager=ci2-upstream-kcsan-gce
> (see "moderation")

Thanks!
