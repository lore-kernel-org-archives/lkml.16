Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDE32C3251
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 05:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749014559; cv=fail; b=P0Bc6tiNHPM3Mi6EMAY386Nh/nGGksyOn2/mg6Dm4SsNUzPj1Tuv6wKC1ANiPR4GPKPWvrgJzWTXgfdGHKfXue6BBevz1t9/xKybIWeLIZwdCB6NvuV8KWOMWN3wub0yTmxcamubdGu0BnzxueyaDq5pmBqbTMhYyUKcZ2TELjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749014559; c=relaxed/simple;
	bh=HCMp04REx1W05qrDEMBjCz4K1doPFFzTxZ1soDnotoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dFZt3hojltfNoPfiiJPo4XgwuX6ME1Cf+CLMjzf2LN+AAmOEeoR4zVFKIIRsUAcFTejqlf6zIE/qnOaYV01uJvVH5yM+cAfkWEB3wyGp0A84hH+/y1RQZQfngVm0IPQ5vZtcR166rufSpffwcqHQv6kMbToz2zu9qObIVYAdUVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iNLqKRaY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BssBHNvo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iNLqKRaY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BssBHNvo"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553MN2ij032734;
	Wed, 4 Jun 2025 05:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=TqqRBkJH+ShQF0Ti2PNwGQlzLrnv32WZEGPvZjnHAbg=; b=
	iNLqKRaYj3JcrlcUmqptoFmhtUZhlXB8s+UKHv2k0rpPVp2US/gmsF6horvF2QyI
	wfrCH2RB4VC5eF/T+wJ4pDzxXJdvTbkDWHRKd1Lhw9FfsoOqS3Ej8TuNZ2qpe+2r
	lnpJTKwvNpVOQf/Hphe7ZwzQR2ZIXaJ+4ggj59Fdfglejr1LEswl29k66PIVWToz
	E5QFqxy+Y5kPkgWuZUQW7shPWmJ4EzoOpghMSPdlBZn1LYDIZiIjj1QN7fyvsePA
	sDEEVOY7kECsDNtqtiVz92ILJR7eeVJEeBubONPC6DbG8iyh55MRHB1E8wG2eI/9
	PEt4+gxPzv5+uLnGNxo1og==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8du8ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 05:22:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5543sg1e033829;
	Wed, 4 Jun 2025 05:22:24 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7aa17h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 05:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/b7gW0hcfTnP/PsgLfMCF0exmJrHV52OSPVD7YxkfvVqAcVj9CvgaySlKX/nYswx+RVloZ5zsQutP6Zv+FStE7TtfYjG6FuHLJuh7Q9BV/5nUOf1Cyvyh77sgdAaPfqT0GjY/szoPOzPuTC87L5WKCaceTIMcXjEDTQMdUP02Q/xpaVyyPPh0V+CKTSYu9suBOV08qee1oc9VrVdanfnpnm6cixm4VbKzqqu+aCKc7SqvFNAzKXsPCJ8am+L+d3lkgsyNAlZdbDZtINCRwrxzcj/aI9340dABjEPwSUaW8YYXk2VoZUYioAE3Wlt8X2yGPsqcfoZ/IUnfP6208Zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqqRBkJH+ShQF0Ti2PNwGQlzLrnv32WZEGPvZjnHAbg=;
 b=rTTPF0/1BhMknLlCqsz81Xlq0yJTok1np9y2cX81SCrYsifQ1+LVFL5NrTPhqxSOwJrGFaie0+16RwPk94cldLxSNsBjVpjFOSwy3bIJJ63GoyJdH8gx4w55AI7V3MEJCzGkh7hb0XZp/v1Ouy2+warINVSksqxjFUfarUKl1ve+UtgEWpIgJ8AplyfYJFQ4UbN4XoJKc3dHhiJLlz+jl/EhNDacQAD81LcHFVgf1ykHFesroKCxh/gatB6nO49ACUyabnXYEFpeJtYpSR61I+1Ny9aqRHmqRXPtpLlhNUTMF9XHxaUoP+fR/OEKjP22yXbktlONyvhx9d7oQ/CDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqqRBkJH+ShQF0Ti2PNwGQlzLrnv32WZEGPvZjnHAbg=;
 b=BssBHNvoZgKI6yHYuXYVkaIsIVT8jBxzcL/mQTxgYcB0eKlUHgGwQojnjyn8+/Lt8ixhw+ALJR/sIlVvg2Soiw8XmZsBYzApEvBJkMzeuMGGFTpjONLyberNv3Pr/vqZZUSJh1VsClrvUG849ISVtsm/q8NtfODUldqiPryRcGw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN6PR10MB8095.namprd10.prod.outlook.com (2603:10b6:208:4ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Wed, 4 Jun
 2025 05:22:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 05:22:22 +0000
Date: Wed, 4 Jun 2025 06:22:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <799f064f-8ca6-441d-81f4-94781bf5465a@lucifer.local>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local>
 <CAJuCfpEaG8WuGboxgc6xB6s5==Lx8QT=UwzgNXJNxDH0-KMqzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpEaG8WuGboxgc6xB6s5==Lx8QT=UwzgNXJNxDH0-KMqzg@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN6PR10MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b05330-25ec-4c2b-4d1b-08dda327c864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WU1qc2I3cUZzVitIQlZYcVZaYmhITDRqMnVVUkI1Y1F0SjdPQm0xV1JjbElk?=
 =?utf-8?B?YzdMSy8rWlVXcHZRVWhDOTJpVjhtM0d4dWhQZVRuZzJJckFadERwQXdyOUV4?=
 =?utf-8?B?ekIvZjlUeXMvdlIzM1VuQlpWUEtXb280WFZrRFBrVkxxWFFMbjR4SEtyN0o3?=
 =?utf-8?B?UG9tUU5CTEpSakRCMk85Sy8vRkNqN3FHMjNSdXg1UzJsSUtTOTRWSitDemYy?=
 =?utf-8?B?YUxjZnhablhKWEF1UE81MytaTlJOTVhHM1JUUHJ2TUo3ZjdqRWxBUDMwOXdV?=
 =?utf-8?B?T2Y4bitqWUt4M05HdDdXNzB6a3RzMGhBVzNJR2IwTTZRWTR6YVVKb3ZxSHMx?=
 =?utf-8?B?a1BMUk84a2oxZ3E0aHpYaXZlbTVFUnhscDFvU0hLNmRoN1YrYWZ1bzRaTjF6?=
 =?utf-8?B?b2lnZ1k1cWcxQ3VuUlpvdnlRWDdiTnFpNEVlS1hSMGFKcUI5cTFiOTRVeDlF?=
 =?utf-8?B?VmR3R3JwMWJMdEFpcnl3WDIwWkFTYVlJMW81Q3JGdjlwUkwzaGZ0cVhySkZV?=
 =?utf-8?B?NStaUVduZmZSZ0lRVE1iUVlUY213SEVBTWdjcHA5UXpzd2NnS0xUVkVobVBH?=
 =?utf-8?B?a1c0SnpValVVcjNhb3J5bks2UzYxSzhJQ0QzK1NBQmd0VzRXMHJqbE5nL25x?=
 =?utf-8?B?cEhQR1FmcjNWN01NZXpMWlZ3eE1Cem9vd1ZMVC9raW8rZjJCWnJHa29Renc5?=
 =?utf-8?B?dVpWMzZMblhSOWtBTDdoUEc4ZXNhZlV3K0F6ZUN5QVUvR2ZyUm4vcmdJOE5F?=
 =?utf-8?B?RisrZjYxUnNnckE4UlQxeURqcXJHM0loQzhDLzh3U1ZRRm92S2pqUWVaZHVT?=
 =?utf-8?B?TWNHa0FvdU5td2l4SDExVzBTUzNtYXNSQWMrVWdUTUI0aXhCRXQ4cFhvdlow?=
 =?utf-8?B?V2s1cDBYVUdzOHIzbHRkbTFVeUZrSCtTc1c2d3RxaGtJY3VRRDZXZU5FQ1R2?=
 =?utf-8?B?ZndwUFZZWVJiNGN6aWNYNjlsMHY1K25UbGZ3NkhMc3B5U2l3NlRTQytDSlhE?=
 =?utf-8?B?ZGU3SEFoTElKaWh1SXNUWnlxWlk3eXhSMHhtQUIrSTV0emVVRkRISUhNSjkx?=
 =?utf-8?B?MUVTRVgrYnRBMmwwQlJsUWs5dFFza2FPVTRrMDRNc3hkSTF6YlJxMitwOEtG?=
 =?utf-8?B?UzF6bG9nSjJTMzBxSVpvanhQdUZUeFlLQnFGdExtMHN3ZU1sL08rZzZUR2Ey?=
 =?utf-8?B?cURQMGUwZWlSY2RvQm1sRFpERjdLUmJWdDJPby9LRE94c3lCOFlBL1lqV09U?=
 =?utf-8?B?UVU2RDNWeTZsVyt3cVZraU1KQlJQUkUzYnlnQllhRkJMU215S21Edm13Zi9i?=
 =?utf-8?B?Nk0weCtubFhlSjdKeklRTmFDVkYxQlJ4emhyTmY0T2NaTHIrQzNmeFc4RW1L?=
 =?utf-8?B?V3NKRlFjbTBLOFJUME1HMi9tZ2VuY0NJamRHTzBmMVg0Uk5KZGl4UVptSGRi?=
 =?utf-8?B?M1pzc2doSlFJZEE5U2tLamdKRkI5TGJKN0UwUzF1N1ZldXRZSGh4Rm54d29P?=
 =?utf-8?B?WXJjOUFRTnZzS1BOMWZCMy9LeExybW81MFVrM1dSc21tME5kYmw5Qk9KeWVL?=
 =?utf-8?B?elRiTjlGZkxzNzdxc1FNc1FaNGp2Qjg0N0Y0M0pnZVRLc0ZmRWpHQ2FLTytQ?=
 =?utf-8?B?S1pqUmtnTnhzb2pvOTY2S29QTVAwRnhuWHkyRXpsQ2tzOVZrdXBPQmk3NmhD?=
 =?utf-8?B?SUsvNkZpckxmbC91M052WVBoS0gzdU5kVHNxN1NScGVaQkt3UDBhZzVNS04r?=
 =?utf-8?B?aGFhejhrUGtSY3QzeVlQckMvOEFFc1M5TTZwL0FRb3VFSXZycWRhL3h2Yk9r?=
 =?utf-8?B?aTBKVXpOR0RYOTdTMWUydFgydWFIeXM5WDNpMzZTMTNVN1AwS1lwWkpTSlFx?=
 =?utf-8?B?TkZLeVdFUnVCVHVXRlk3cVVqK1czcnF3cE1ZRjVuZE52NWgybzluYXg3ODU2?=
 =?utf-8?Q?GNnQg5FJcLE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk85YzdpeHBpalNtSW5wcXZ4U2tNb3JwRDlWNnlxUzhTWkx3akpUWm1pUUww?=
 =?utf-8?B?UW45SW9IN1crbWdHQjRPNkFRZSs3K0I2UXVPZXJRdHZvVVVBaEZydGgvcjAv?=
 =?utf-8?B?K0pqS1JzTWVteU9xVGR5NEVabFNVWUgrNHZyM1NnREx2b1V4UEI5SWRBVitp?=
 =?utf-8?B?UEd0cHRURHU0ck14Uk4zeUpFY2VVejRwY3ZvalhxanpaS29wa040Z0c2V0lm?=
 =?utf-8?B?RTRyR0xrZFV5eGJPbnhUeXJEODdwZ2pNbVZGcFB1bVJzdXloZjRiUzFLVHY0?=
 =?utf-8?B?UDZhaG1RUU1KbFEzRmtNZUZuYUpmeVQyRnhIUUlVcml6MlJZK0Jva0xnTXh4?=
 =?utf-8?B?VFFDT0EzN0tQZXZORFZmYlV2NE5sQzBTcUR3VEl3c0FnOUlwWE5IbzNDVkJu?=
 =?utf-8?B?bjhCOE1HVlowUkVkL2VBaE14UnN1TkNPY2pZcDhZYVJUeFJrTWxzTkc4TUsr?=
 =?utf-8?B?VC9hTXgzTnFBSTgrc3pDaU1EK3A3dHhWNXdxalEzdERlODU5U29xZ1hMYU45?=
 =?utf-8?B?bWxtUER5a2RsNzF6SzJBd1M2aEx2dGNCOUxadXg0TllseGJHNkRuVlBYcDMw?=
 =?utf-8?B?OG93dVI4K2twRytmWmFQRHRURTcvenkzN2lBQUFJQStzUzQxMEJvMTdMSUxR?=
 =?utf-8?B?NHUzMVh1dHFwSVp3U0FrOTZJRm5tUU0xTXc5THJJVlRGYWVnc2w3cE1oamxX?=
 =?utf-8?B?T21nWkFCU25RejFCMEJMNy8xanhMbEd1bDk4T0RZYTN0ZThYSEl6cy82SEdT?=
 =?utf-8?B?UEVaeUFLY2ovcytDZVlwNFdHanI1ejBMNzdrOGp1WUp0bk03YlF5YXJKV0Nn?=
 =?utf-8?B?ZGJKcXhEeHdzZEdMUGZINHV6dnk1R3BtT3FRaVNzd2pMa3NEZjY3TGxxOTJI?=
 =?utf-8?B?M2VnV1ZoWlFoMDBTV2dENU0xNGZJVUMvTmwxWjhLbUVidktueHI3NlRzUEox?=
 =?utf-8?B?NWpVN0RSQUZ2SWdyeU5VWW1BYk1LdWgrd3NUc0NZWkowQmpJVnpMU0VnL3Q5?=
 =?utf-8?B?N0JIdUtYVjR5enJqT0NkZFVWeEtRWDNDcWRCa0ZOQ1U5NDZwdDcwc0VTWUNM?=
 =?utf-8?B?S01IczFPeFhkdXUyOVZQOHZNQUUxeTZlNFNvREVIeXY0YXcwc04vYjVMN3pi?=
 =?utf-8?B?dnZlRDAvVFJOSDU4Ymc3bmx0RG4zV2YzWHdlSkpXUFlicWFEQjlxRE5EUkhZ?=
 =?utf-8?B?bGcwdnA5TTc1eHB5VjhUR3Q2ZG5GK0dUdGFRajBGc1VCN2VtdlZLYjVTZWlD?=
 =?utf-8?B?cEFPWDhMV2dPM3NYdlpscytLakw1Tll3dE83N3E1cGFCWVJZaERqR0FabHZu?=
 =?utf-8?B?WWhrbmwyZG9IQjhpNXBIb2R4QVpiNkxkZjRIczZtVWNVeTNyU3JhT3lHNm5u?=
 =?utf-8?B?K3dOL0xNUnphTWp2emxjWDFWa1JNTkZRc1VGSmFweXdWb2ppbit2N2dWeU1D?=
 =?utf-8?B?ZmRiRWQ5WjRKNDNSZDhVTjlDWGtqejhtWHVBdlNvMUtpelVrY2s2SjVtU1ZH?=
 =?utf-8?B?cWhiVFNBSXBNSDBQT3BFSjUyb21JbkRHSE5GSVRDYXVCWkxHVjJNbGIvRW9B?=
 =?utf-8?B?Y3BCdytDMU5KMGdWL0Zyc2hmRXdVM1YvRXdGTmJCb2xUb0JHTHNhdFNKelpl?=
 =?utf-8?B?RlRFNGhYVGdzcWhVNmVhdXhaTmtVL2pRMzlINStoL1RTSUVjc2VFRjhZYUtk?=
 =?utf-8?B?UGNtMEVUc1UrdHNYdmxvVll6bTI0UXdlb0ZLWG1sb2FhNEc3Y0UrY010NnJo?=
 =?utf-8?B?TTd1bGo4SFFrZEFxWGlMOURxcVlnNnU4R0ZDbERDb0V5TEVRdW5XdUtWSWZO?=
 =?utf-8?B?WlFLWlV5VFV4bldtSzYzYnVjRDJabmNuekN2VThKK2hVUU5JZDhnbXdhcmFN?=
 =?utf-8?B?WG1mQ05FQjhLWWRTNDFJVGE3dGRpOTQvT3pZNE9IUGVoa28rMlZJZGU4VXJL?=
 =?utf-8?B?Ulk1Z3MwQTVONlVJRXoyRjVMbTdzSmk0U01YNEtoakgvNVJqZGdzK0s2dWZn?=
 =?utf-8?B?dUQyR2d6Z3RDV0ZXWEdmUm5JUXdONUdWVmJHNHNvK1pxUmNkMlJaWUdiNDZI?=
 =?utf-8?B?S3BPemRhQ1orakNmajhGdzRLNWdsdXVmSWUzNjB4RXRIbDNTVDdmNG9lYm1j?=
 =?utf-8?B?eTMzeUY0RWVseFlSNDZsTGNGNnZ2WGVBYndvQTQzM3JuN05ndmYxSk5jaDRQ?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yUxpH+AamBSzRBWiPe+7Kud0SUpK6wAbE0pagbnUMyGKYgthfkUX7F3HX781faPKqqE4WP4yO6s311tNv7yQ1qUPA8Yy00v8sh76LGVN7gdW/koUqZ9+fFxhao/QDMjg4ERAUBmj1HqhdaKA1COVmEge49S40dZCmUBJGLpSdUHGwcx2W5g5NIqxyL8GVx4V+OB5+ORzRYNCDHJMV5qEpEEdD5F5JbQn27zx49urSSXmWPHMKgNkYA7MOBhwORpNMAm29d3oTYTGgML/U+fxjmgidT46HYZNty/t8/lOe5k4T/JhFMLecj63m2gumKrWAfifT8tBMFQTt67L+TGk11BYUZO3gdWgKLhq8950aG307PgLo5zOMCU0GIWGLpaXIp/nLJ7bVcChV2vbMGmzK71DQyVDxTPZQixiUJ9/NGQ/ArkVuN3WJ7g6taLS+s7bSRU/VqspXMouZhf/gphVYvu6I1HemkirNxyMyyKLNEmbk3kHXL7LQ3LI2KjmfY4Kf27feWHfdtUeqPBoJXTlVrwgwokZL26dRzuICAlgMps6UlzCRw+3J4VccE8WwCwM3Rf3JQOjXVh5Yd4d025oLJs7euCSes6r5xWR4YzGy+0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b05330-25ec-4c2b-4d1b-08dda327c864
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 05:22:21.9611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZ9WISCkJjRdU540NQTJpaJgvKOxwO5vEwgNyOvQrX23fLxwpB3C22B2/lLqnlVGqANRPsfmlwRKV/gthLv/RzjLFefW9J52Q570K/SEz98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8095
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506040043
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=683fd810 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tEpbn0Aerwh7KVHqv78A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA0MyBTYWx0ZWRfX3vSehMRdbE60 ZiD+gVeFngaGJ6zjnCMvNrcTW10k4oMiz58aW8qRmpErhv8qXXVOsjuVPXSQQC0eiSN3VQMRFa1 ggqnxQDS1E6OVnNXaCe+/uxydCC3nWvfCdQcQnd52tq7gXtLdJEvq2bV9f8Z0zgLVLPjEzES4ZG
 dhMeCouCK3UCCO+jXUdxTwSB6BJXqyHjel33tiJ+81t9h2GXD7HOaAH/riFVQmTTRF2hO7EeA8f NEcJn3WyCa+RFSBfZqwO0a4XuncDMYn/dM2T6pGjwYl4XaYOfXvk4myYsspeeB622FwadWZOClG onCmaeXuoVzdMEY1Z9VoURUdvjaOsIjvrx0zc8N2wE7uncLo3cAPQSenBfDDS4U3Eg7RK52/cST
 pgHUdJnXD1D+rYRa+ATGusKAWHY1kihDbzWrv9KSEnd4PlsJLuIIA9psRz/yXAWP4+JkeCub
X-Proofpoint-ORIG-GUID: Vy-1WVYW2RUz53BRWRIBwi1RIiHu6XoN
X-Proofpoint-GUID: Vy-1WVYW2RUz53BRWRIBwi1RIiHu6XoN

These notes are for Barry to adapt according to his needs for this series,
but FWIW agreed on both counts! :)

On Tue, Jun 03, 2025 at 01:17:10PM -0700, Suren Baghdasaryan wrote:
> On Tue, Jun 3, 2025 at 11:43 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > Hi Barry,
> >
> > As promised, I enclose a patch to give a sense of how I think we might
> > thread state through this operation.
> >
> > There's a todo on the untagged stuff so you can figure that out. This is
> > based on the v1 so it might not encompass everything you addressed in the
> > v2.
> >
> > Passing in madv_behavior to madvise_walk_vmas() twice kinda sucks, I
> > _despise_ the void *arg function ptr stuff there added just for the anon
> > vma name stuff (ughhh) so might be the only sensible way of threading
> > state.
> >
> > I don't need any attribution, so please use this patch as you see
> > fit/adapt/delete/do whatever with it, just an easier way for me to show the
> > idea!
> >
> > I did some very basic testing and it seems to work, but nothing deeper.
> >
> > Cheers, Lorenzo
> >
> > ----8<----
> > From ff4ba0115cb31a0630b6f8c02c68f11b3fb71f7a Mon Sep 17 00:00:00 2001
> > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Date: Tue, 3 Jun 2025 18:22:55 +0100
> > Subject: [PATCH] mm/madvise: support VMA read locks for MADV_DONTNEED[_LOCKED]
> >
> > Refactor the madvise() code to retain state about the locking mode utilised
> > for traversing VMAs.
> >
> > Then use this mechanism to permit VMA locking to be done later in the
> > madvise() logic and also to allow altering of the locking mode to permit
> > falling back to an mmap read lock if required.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  mm/madvise.c | 174 +++++++++++++++++++++++++++++++++++++--------------
> >  1 file changed, 127 insertions(+), 47 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 5f7a66a1617e..a3a6d73d0bd5 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -48,38 +48,19 @@ struct madvise_walk_private {
> >         bool pageout;
> >  };
> >
> > +enum madvise_lock_mode {
> > +       MADVISE_NO_LOCK,
> > +       MADVISE_MMAP_READ_LOCK,
> > +       MADVISE_MMAP_WRITE_LOCK,
> > +       MADVISE_VMA_READ_LOCK,
> > +};
> > +
> >  struct madvise_behavior {
> >         int behavior;
> >         struct mmu_gather *tlb;
> > +       enum madvise_lock_mode lock_mode;
> >  };
> >
> > -/*
> > - * Any behaviour which results in changes to the vma->vm_flags needs to
> > - * take mmap_lock for writing. Others, which simply traverse vmas, need
> > - * to only take it for reading.
> > - */
> > -static int madvise_need_mmap_write(int behavior)
> > -{
> > -       switch (behavior) {
> > -       case MADV_REMOVE:
> > -       case MADV_WILLNEED:
> > -       case MADV_DONTNEED:
> > -       case MADV_DONTNEED_LOCKED:
> > -       case MADV_COLD:
> > -       case MADV_PAGEOUT:
> > -       case MADV_FREE:
> > -       case MADV_POPULATE_READ:
> > -       case MADV_POPULATE_WRITE:
> > -       case MADV_COLLAPSE:
> > -       case MADV_GUARD_INSTALL:
> > -       case MADV_GUARD_REMOVE:
> > -               return 0;
> > -       default:
> > -               /* be safe, default to 1. list exceptions explicitly */
> > -               return 1;
> > -       }
> > -}
> > -
> >  #ifdef CONFIG_ANON_VMA_NAME
> >  struct anon_vma_name *anon_vma_name_alloc(const char *name)
> >  {
> > @@ -1486,6 +1467,43 @@ static bool process_madvise_remote_valid(int behavior)
> >         }
> >  }
> >
> > +/*
> > + * Try to acquire a VMA read lock if possible.
> > + *
> > + * We only support this lock over a single VMA, which the input range must
> > + * span.either partially or fully.
> > + *
> > + * This function always returns with an appropriate lock held. If a VMA read
> > + * lock could be acquired, we return the locked VMA.
> > + *
> > + * If a VMA read lock could not be acquired, we return NULL and expect caller to
>
> Worth mentioning that the function itself will fall back to taking
> mmap_read_lock in such a case.
>
> > + * fallback to mmap lock behaviour.
> > + */
> > +static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
> > +               struct madvise_behavior *madv_behavior,
> > +               unsigned long start, unsigned long end)
> > +{
> > +       struct vm_area_struct *vma;
> > +
> > +       if (!madv_behavior || madv_behavior->lock_mode != MADVISE_VMA_READ_LOCK)
>
> nit: I think it would be better to do this check before calling
> try_vma_read_lock(). IMHO it does not make sense to call
> try_vma_read_lock() when lock_mode != MADVISE_VMA_READ_LOCK. It also
> makes reading this function easier. The first time I looked at it and
> saw "return NULL" in one place that takes mmap_read_lock() and another
> place which returns the same NULL but does not take mmap_lock really
> confused me.
>
> > +               return NULL;
> > +
> > +       vma = lock_vma_under_rcu(mm, start);
> > +       if (!vma)
> > +               goto take_mmap_read_lock;
> > +       /* We must span only a single VMA, uffd unsupported. */
> > +       if (end > vma->vm_end || userfaultfd_armed(vma)) {
>
> vma->vm_end is not inclusive, so the above condition I think should be
> (end >= vma->vm_end || ...)
>
> > +               vma_end_read(vma);
> > +               goto take_mmap_read_lock;
> > +       }
> > +       return vma;
> > +
> > +take_mmap_read_lock:
> > +       mmap_read_lock(mm);
> > +       madv_behavior->lock_mode = MADVISE_MMAP_READ_LOCK;
> > +       return NULL;
> > +}
> > +
> >  /*
> >   * Walk the vmas in range [start,end), and call the visit function on each one.
> >   * The visit function will get start and end parameters that cover the overlap
> > @@ -1496,7 +1514,8 @@ static bool process_madvise_remote_valid(int behavior)
> >   */
> >  static
> >  int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> > -                     unsigned long end, void *arg,
> > +                     unsigned long end, struct madvise_behavior *madv_behavior,
> > +                     void *arg,
> >                       int (*visit)(struct vm_area_struct *vma,
> >                                    struct vm_area_struct **prev, unsigned long start,
> >                                    unsigned long end, void *arg))
> > @@ -1505,6 +1524,15 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> >         struct vm_area_struct *prev;
> >         unsigned long tmp;
> >         int unmapped_error = 0;
> > +       int error;
> > +
> > +       /* If VMA read lock supported, we apply advice to a single VMA only. */
> > +       vma = try_vma_read_lock(mm, madv_behavior, start, end);
> > +       if (vma) {
> > +               error = visit(vma, &prev, start, end, arg);
> > +               vma_end_read(vma);
> > +               return error;
> > +       }
> >
> >         /*
> >          * If the interval [start,end) covers some unmapped address
> > @@ -1516,8 +1544,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> >                 prev = vma;
> >
> >         for (;;) {
> > -               int error;
> > -
> >                 /* Still start < end. */
> >                 if (!vma)
> >                         return -ENOMEM;
> > @@ -1598,34 +1624,86 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> >         if (end == start)
> >                 return 0;
> >
> > -       return madvise_walk_vmas(mm, start, end, anon_name,
> > +       return madvise_walk_vmas(mm, start, end, anon_name, NULL,
> >                                  madvise_vma_anon_name);
> >  }
> >  #endif /* CONFIG_ANON_VMA_NAME */
> >
> > -static int madvise_lock(struct mm_struct *mm, int behavior)
> > +
> > +/*
> > + * Any behaviour which results in changes to the vma->vm_flags needs to
> > + * take mmap_lock for writing. Others, which simply traverse vmas, need
> > + * to only take it for reading.
> > + */
> > +static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavior)
> >  {
> > +       int behavior = madv_behavior->behavior;
> > +
> >         if (is_memory_failure(behavior))
> > -               return 0;
> > +               return MADVISE_NO_LOCK;
> >
> > -       if (madvise_need_mmap_write(behavior)) {
> > +       switch (behavior) {
> > +       case MADV_REMOVE:
> > +       case MADV_WILLNEED:
> > +       case MADV_COLD:
> > +       case MADV_PAGEOUT:
> > +       case MADV_FREE:
> > +       case MADV_POPULATE_READ:
> > +       case MADV_POPULATE_WRITE:
> > +       case MADV_COLLAPSE:
> > +       case MADV_GUARD_INSTALL:
> > +       case MADV_GUARD_REMOVE:
> > +               return MADVISE_MMAP_READ_LOCK;
> > +       case MADV_DONTNEED:
> > +       case MADV_DONTNEED_LOCKED:
> > +               return MADVISE_VMA_READ_LOCK;
> > +       default:
> > +               return MADVISE_MMAP_WRITE_LOCK;
> > +       }
> > +}
> > +
> > +static int madvise_lock(struct mm_struct *mm,
> > +               struct madvise_behavior *madv_behavior)
> > +{
> > +       enum madvise_lock_mode lock_mode = get_lock_mode(madv_behavior);
> > +
> > +       switch (lock_mode) {
> > +       case MADVISE_NO_LOCK:
> > +               break;
> > +       case MADVISE_MMAP_WRITE_LOCK:
> >                 if (mmap_write_lock_killable(mm))
> >                         return -EINTR;
> > -       } else {
> > +               break;
> > +       case MADVISE_MMAP_READ_LOCK:
> >                 mmap_read_lock(mm);
> > +               break;
> > +       case MADVISE_VMA_READ_LOCK:
> > +               /* We will acquire the lock per-VMA in madvise_walk_vmas(). */
> > +               break;
> >         }
> > +
> > +       madv_behavior->lock_mode = lock_mode;
> >         return 0;
> >  }
> >
> > -static void madvise_unlock(struct mm_struct *mm, int behavior)
> > +static void madvise_unlock(struct mm_struct *mm,
> > +               struct madvise_behavior *madv_behavior)
> >  {
> > -       if (is_memory_failure(behavior))
> > +       switch (madv_behavior->lock_mode) {
> > +       case  MADVISE_NO_LOCK:
> >                 return;
> > -
> > -       if (madvise_need_mmap_write(behavior))
> > +       case MADVISE_MMAP_WRITE_LOCK:
> >                 mmap_write_unlock(mm);
> > -       else
> > +               break;
> > +       case MADVISE_MMAP_READ_LOCK:
> >                 mmap_read_unlock(mm);
> > +               break;
> > +       case MADVISE_VMA_READ_LOCK:
> > +               /* We will drop the lock per-VMA in madvise_walk_vmas(). */
> > +               break;
> > +       }
> > +
> > +       madv_behavior->lock_mode = MADVISE_NO_LOCK;
> >  }
> >
> >  static bool madvise_batch_tlb_flush(int behavior)
> > @@ -1721,6 +1799,8 @@ static int madvise_do_behavior(struct mm_struct *mm,
> >
> >         if (is_memory_failure(behavior))
> >                 return madvise_inject_error(behavior, start, start + len_in);
> > +
> > +       // TODO: handle untagged stuff here...
> >         start = untagged_addr(start); //untagged_addr_remote(mm, start);
> >         end = start + PAGE_ALIGN(len_in);
> >
> > @@ -1729,7 +1809,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
> >                 error = madvise_populate(mm, start, end, behavior);
> >         else
> >                 error = madvise_walk_vmas(mm, start, end, madv_behavior,
> > -                                         madvise_vma_behavior);
> > +                                         madv_behavior, madvise_vma_behavior);
> >         blk_finish_plug(&plug);
> >         return error;
> >  }
> > @@ -1817,13 +1897,13 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
> >
> >         if (madvise_should_skip(start, len_in, behavior, &error))
> >                 return error;
> > -       error = madvise_lock(mm, behavior);
> > +       error = madvise_lock(mm, &madv_behavior);
> >         if (error)
> >                 return error;
> >         madvise_init_tlb(&madv_behavior, mm);
> >         error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
> >         madvise_finish_tlb(&madv_behavior);
> > -       madvise_unlock(mm, behavior);
> > +       madvise_unlock(mm, &madv_behavior);
> >
> >         return error;
> >  }
> > @@ -1847,7 +1927,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> >
> >         total_len = iov_iter_count(iter);
> >
> > -       ret = madvise_lock(mm, behavior);
> > +       ret = madvise_lock(mm, &madv_behavior);
> >         if (ret)
> >                 return ret;
> >         madvise_init_tlb(&madv_behavior, mm);
> > @@ -1880,8 +1960,8 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> >
> >                         /* Drop and reacquire lock to unwind race. */
> >                         madvise_finish_tlb(&madv_behavior);
> > -                       madvise_unlock(mm, behavior);
> > -                       ret = madvise_lock(mm, behavior);
> > +                       madvise_unlock(mm, &madv_behavior);
> > +                       ret = madvise_lock(mm, &madv_behavior);
> >                         if (ret)
> >                                 goto out;
> >                         madvise_init_tlb(&madv_behavior, mm);
> > @@ -1892,7 +1972,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> >                 iov_iter_advance(iter, iter_iov_len(iter));
> >         }
> >         madvise_finish_tlb(&madv_behavior);
> > -       madvise_unlock(mm, behavior);
> > +       madvise_unlock(mm, &madv_behavior);
> >
> >  out:
> >         ret = (total_len - iov_iter_count(iter)) ? : ret;
> > --
> > 2.49.0
