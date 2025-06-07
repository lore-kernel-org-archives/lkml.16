Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686D91A8401
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749297350; cv=fail; b=XAlaMy2E6FfgX+cb0D4PoUVZscRccKi21NfxLD/LpQy07mmI6w5aRxlWChCm5lGzEW7MSqLdct0vyXd6zgn6oaI1Z1iOvvHk82EgMxxbg0j53m+O1WdR7KYT4esq7SUiBH8RNYuSbX4woAl84iPQjsGNeKxOtcMoWyLTh/ZVhFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749297350; c=relaxed/simple;
	bh=XlpORpw3SIKMHobaeviMcdJ+IQ6+al5/hV1y416hmlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jNCMJzp0lFgCcO2zDzNrHUZfTRuMqHXpMLwR0987ty/PwbOFWerK9of9CMmPZ4r74G+00t70KjLu3TtyOBjNvVhlyDu3d6ielsCSGVhqkwsrtrvtHU0u8hbc8X0E0oTcI7qcTg8sgs1/zsQNpxo6KHovPCo18BjgaBCqwegU8a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZUG59XfP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yMKlpZxv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZUG59XfP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yMKlpZxv"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5579RUDX016577;
	Sat, 7 Jun 2025 11:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=gpYevWfI1pvq2Kfx4Jmzy5EKRVni8soTeF0rYoi9LbY=; b=
	ZUG59XfPE1h5xd4LsyRxIvYIkioHCKza2AKb6jm+THd9oBoNYpmLtQ+DKlfOn2ME
	tWL1tsDf7aNpnL89nP0hwInj+b2q6jmzJi01tTPmrGYtNgACauFXjQzYiTFBbiVf
	0SJJ7OnrBs6GpjMJg7nwbEm6ezP/dYOkGVJVyaiw8Tg1onLXjyPeEXfCXRgWystl
	2Mi/0i98sVPgkldkh7N8EARAWYeyBM5D84EmdTcesHkAaVeVR7PcTxsDas32NcHd
	tjHftiM8jzwRElGxQB1795WTQd4x+ZDuCovNfVtg8l0qxTKnXQ9dmZMQGAYSThJ3
	MTXEzEATRcc8At/swTGswA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dywr6yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 11:55:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5576oDoQ007435;
	Sat, 7 Jun 2025 11:55:26 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv5rbdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 11:55:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNp92mlYXbtHNviU/IBBbgXt7F3CH0KSMC9g9TfztbSQMEKqVfvs0/IG9GNn6yRyL1fo+mO9IcM2vwKCUdgAgg0ZSNR0HpC3ZaKgB3qmBvz6+u4KVte3pKxeSqe2QjejcF9IpqFJNucN8CBEyQG7VoWJwKY3JVZiqtEpSTChLoQhy+IcQQ6DnSuPVyX8PL2tyHeuDdskIh0AGcWyucpLbnsDctGaYL6HFZg9jaZI9Np6phu442pv0nG5soDFo6Au65cwrV6lyylyo61W6/iLLUrpRie/CTjsuaVTIdrvndlioUPJy4VNHrkJBNLV8DxRXCVbNWj5ynsV7mWsNTroaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpYevWfI1pvq2Kfx4Jmzy5EKRVni8soTeF0rYoi9LbY=;
 b=FhvkR2pXE3CknVkhb79oquA1hLlZ6Npf4kFBG9rLs3aMnZawMFbpPsnaDnrMak2z3IYqEhxoKK6n/ArYzXc2pECCQUKaLKPOARODUh+v8+Lg7o0H/pBa02gOv7SYk6f1awYVFg9gme09RJYvlzqkmBgrj91Bu//7nGIPstngbNoOZJR5Pxy+bR2+zudfQiprr5U3Zw1eaL1jgTrc7DMN+76GIIjMkggxQboHKXSH4s3S77VLRC/BWZPU2PDBwO0wdxLZN0u9X6zReEGqj0XkQnWPycVykwcErH/Ycy0zOcxaDjoUpk4/Zt7YOH4m6ZN7vPN+cTud43SeSOXXew5lug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpYevWfI1pvq2Kfx4Jmzy5EKRVni8soTeF0rYoi9LbY=;
 b=yMKlpZxvNt3IsIo9MaQs3JKc1LVuSdsy/mZJyH2M5KnMvGMErxYteRIUInUjiQxZ+EqoTzrKx1T3+vbGbO98t5lPNzEuOiKJsRsc8d3gPUzonbNY4nTH3rjJXTNxwoemSjTiu6KqJkUZh/mbSWxLblSpF1vSYCuTc/21itrtrAE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO6PR10MB5634.namprd10.prod.outlook.com (2603:10b6:303:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Sat, 7 Jun
 2025 11:55:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Sat, 7 Jun 2025
 11:55:22 +0000
Date: Sat, 7 Jun 2025 12:55:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <998a069c-9be5-4a10-888c-ba8269eaa333@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
X-ClientProxiedBy: LO4P123CA0352.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO6PR10MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ca6f12-ed91-4eaf-c1fa-08dda5ba2e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEsxZlhEMjNNSnJxTnNUYi9VZTZRNmZJTUs4aWc0Yzdac2FaTkszN3EyaG9Y?=
 =?utf-8?B?cEZEKysydEwwQmNVTXNUMkFqT1BRQmVtL25tdTErbitSREtVeDRCQWMvd1pn?=
 =?utf-8?B?b1hyTzVXOHY3TnA5SHJWU3Fta2VzNFkwS1hzK21KclROUzJLYVRZUjd2ejZQ?=
 =?utf-8?B?MUlRS0tjZ21JSVo3Z3hDclRiK1hxb3JtUXNGVFgzb2xhMWUrbVE1NlNqZW9Y?=
 =?utf-8?B?SW9DejZUZTlTQ0liYnBGL3QyckMxMGtWNGFPVlppQmpzZDNPUWl3eGZ6WnR5?=
 =?utf-8?B?VEhIaVU3aUNOcEhtdGJ1ek5RZ2xNdHZuRlZWelVZQVlxU05aVVdXNzNBMTQv?=
 =?utf-8?B?cENKMTFYaFZUVENEZG1VeWNJamx1V0x4Ymd3bWxkTWp3WjYzZ1hwK1hoZXh4?=
 =?utf-8?B?bDdhb1pGRWM1eGMzKzRZZGY1U1JzdHF2eUdzbXluTGVlYmhLOHlQM1dmWU1J?=
 =?utf-8?B?T1poeEFJN3ZGQytJZWM2UmdEc2k0azNXQmxHdVZsZCtabHgyV2tjKzQwazBG?=
 =?utf-8?B?NkVmR1JROTZsWFFwNnJjTWFUSmdBY2pheUxLTDJ2MmRVZWp1cCtNR0pJK1BO?=
 =?utf-8?B?T2dRZlFuY21ycHpyb2FueWhkV3VmVDl4alh4b21STmxkMGRWZlpqeUZKOWsw?=
 =?utf-8?B?a0ljQktjRlQvWTFBcGpaMzFXTFV6WmdBZHk1K0RqakJKRGRRQ0xBWnJDMFhr?=
 =?utf-8?B?RzNrZU4wdEVNd2dSdEFoWkowSFpxaU1tZUN3bkdwZTg3M0hYY1B4dGVRcmdh?=
 =?utf-8?B?eVZsODJYdllOczJCNVNINjl0bmN2U2hBSUJBRUpvQll2NHYvNWY3MnowUEJa?=
 =?utf-8?B?NEJlMjFZRUhFL20xeWo4N0dsNE4ydytpbnZrN3VCTnZkMytQQUYrMHJqU0lT?=
 =?utf-8?B?OFZKY0IwVzFiWGdtclpTQ3pUVlNnYnJEVmdYb1NpOUtFVXpUcW1uYm5GMTY4?=
 =?utf-8?B?VEQrd0h0QWN3RExQN09tY0lyWGxKVjRtWUtUc1lvcjhLT093RDJINE1NaWlu?=
 =?utf-8?B?L1FSN1lZSnJseEtIWVNnMmNWQS9PTTBCMFZUSXJhY0l5MXI2aS8rdjNXVDZ4?=
 =?utf-8?B?UEh4L1VLZS94NElwZXBNUm5Ia2JxRjl4WXVJT2U0VXdPcE1CQTNOU0U4RWpz?=
 =?utf-8?B?eTdvV0hiSmsvTGszRWlmVmVOTXlYQUpvTGVJVmI5Ky8yb3pJTjdvVHZnSTlM?=
 =?utf-8?B?R2tWTmp1WjVpbGg2RldHZDBUT0d6ZXg0blk0K0RPcjVPV2UwaGtyUnZwWlUv?=
 =?utf-8?B?RThVSWJpSVJjZWZmRXY4Tkg5eTVUaXZteU9nNGgwNStYM2hnbUNvd1pHaTNs?=
 =?utf-8?B?WkVmSlM2eWttWXV4dkJlc2FweWFRNXkxZkh2ajZTWGdidFk2N3FId09ZTzNV?=
 =?utf-8?B?MFFHMVNMTkdNaTNiV1RnTXJUVk9KUDhyREZLYzgzTk9zQ3ZKZzE1MzFncmZU?=
 =?utf-8?B?YnlHYUl4amFXS3phWWE0WUloZHY4ell1blg5M2Q4S3VocTlkSXQ3clRKc2tp?=
 =?utf-8?B?RGVQM2xqWkp0WFRtYnJIMHAvVDhveWJQUGdWYzh1M0N2NHRVbE1PM1ZCUXV4?=
 =?utf-8?B?TmF1amgzdjFLMVVWb2cvTGMrSVQ4MXVuQWh5QU1rSWIveHBFRVNiS2oreXJS?=
 =?utf-8?B?Z0ZuaFp2U0FObVZmaHdMYTZDTENYbEY4MXdNU0ZFT2gxVzVZTzJXSHIvSlFo?=
 =?utf-8?B?UTRQaE0xY1FsVFk2NUpLa1JEZSsxSDR1ckZRKzRVNm1XUG5KV0ZudmJ0dzZt?=
 =?utf-8?B?WU5SSWN4eXdVcTYxS3M4aEg0Y1FTa0NSdmNiSFhNZmsyWmlINXNrWHhBeDQ2?=
 =?utf-8?B?ZHkwcVJLVlozdkROY2xGV0sydVN0amdnMXF6Y1BYeSsxNUg3b3BlRHV3NjZC?=
 =?utf-8?B?MW9jV3FVeWs2cmNUWkVBckl6ZGd0NzNUUzM3MGt2dWNBQVZUYnVibTJVNEJN?=
 =?utf-8?Q?6AG287X4Jqs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVBueHhiVTVtZWRYbzhBKzZWVElmSFlBekpjc3ovM3JJK3Zrcm1TcGpvWjBn?=
 =?utf-8?B?dGxEcVltYytLUEg3ZlVjc055V3RjKzdlRE40V09Galo2NUk3M2ZBRWxnRFBT?=
 =?utf-8?B?SU1ONWFHbVJnUEd3QWIxNW1ZT2F5S0Q3RlBvYUg2WlNOamJvN3F5MGdQSWtT?=
 =?utf-8?B?OSs5Y2lxQ0p3cGJiNWRVQ2ZZOGpjUnM5a2lMbXpFK2VDK0FSY0lYWjN5NWxu?=
 =?utf-8?B?cTFVZC93dEpwTXFsNENBWnlrT2FmWFkxVXhMQVMvRGwzcnFZYzBkZ1Mxd3lk?=
 =?utf-8?B?bzh3RVZNaGJkekkzUWNZUXY1Lzk3S3hRWFBNV05qRzRPL1IrenBWVHRpai9V?=
 =?utf-8?B?UktYM09QM0Y4ajVaamZNdlRIV2R2cGdmTmRSZWlOOFVqRkdjU3FqaTdRcUs2?=
 =?utf-8?B?bWk0V29LdzV4Z1Z5ZkJrWmFvMFh3TXFuNjUvTGZuU3Z6K3Y1dURrRnl6dWYy?=
 =?utf-8?B?NkNZQ0dhMTdCQlJEMi9WSlpkNG1nakpQMks1c09WTlYrTHpZb0ZHNy9tVnNH?=
 =?utf-8?B?b2l1N2dML1lxcHJJZzJESTlsNDlrNm1XMWtmek9WYjhBT2kwaXFZWDRQSElz?=
 =?utf-8?B?Y01XSzN2L3VQc1lBWGVCTzZBYWUrZW1oazFVaXU3dlplNHYvendYWFZZa3Nm?=
 =?utf-8?B?dStZOE5teG1SR2JkZjU3cWhzMEVsUnRhUzNJUzhTMUhUWERnOHRwNGViWTBi?=
 =?utf-8?B?a21ydTdxRVg2TFNock80ckdQaTQ3SURiNzNDbWFiT2VZUGNnT1RvcmZuVXEx?=
 =?utf-8?B?MHkyZ0tZc2xqZVFBbXVTaUJ4YkY5bk9RaGlyRTFXSHZaSmlxSVdKK2hYSTFo?=
 =?utf-8?B?eUVTS2ZPc1BpMVg0aEwrVnd6ekIxdldCVnhJd2RDdTNiajVhUjY3WVFOdUli?=
 =?utf-8?B?ZUpuK1M3WitRNURzakc4ZlE0M1Exbm5vME9wNXVRL2w0WGd6Y2tWUUNHWDVR?=
 =?utf-8?B?bERpMHBIclpjY0lzRkhjYlVRSGF3RnpDa1BCT2ZvOFNzRmk1eERzTGM4dGtz?=
 =?utf-8?B?MEFtWjFYRlp2WlE0TjhSMWZqUE5xWWJMRUpBR2lHZWNjTzBpbVU5Vkt0WHBE?=
 =?utf-8?B?dHFRVTQ4bFcvdFplYzZTTGVpOERoUFJobGhmUHpHZlcvRFN5ZVNGRHc2SWtT?=
 =?utf-8?B?RUJKL0NtbDZWcHZTMS9Mb2c0MG9HSXZtM3h1K205aDFoR3M2cVVBMDEvK0lL?=
 =?utf-8?B?TlBkVGVpQWlEMTNIQ3g4c2pyUWcwTllwOUNjbks5dUEyb1UybVYrRDhyR1Zs?=
 =?utf-8?B?N0FpRDN0VktkODd1VnFXazA1VS83cFZicUxkR0oxWENhZ2V0aW1GZkExY2Fx?=
 =?utf-8?B?Q3lzVEloMU9DTGVRZzdxaXZaalpRMkZ4SXFXS2JINHpLUmxmTEo5czl5a3pN?=
 =?utf-8?B?Qlc0eTJpb3A0Y2E1NHFqaUZhSHA3dmNBTHpydGI4d0pNSFJORzRvTEZFVFNV?=
 =?utf-8?B?M0JiVXRUYnBuZitCMFhxOXBJVGk5TDYyOU40KzJodGRkVUROSEtuQmJSbGdy?=
 =?utf-8?B?NDVHTi9iV01YZ1NaOXhjM0MwZUU4RDF3eGhKRWZNbnBNanNKcWwyNGowTlVq?=
 =?utf-8?B?LzlocGZ0dDdmaW5VWTdBd0gyYTRUM1hHWjllckQyajFpSzJJVHVpcFd3blEx?=
 =?utf-8?B?NUlOT3FUbW50cm9kYjJJUTlMdGpxQjRmS2FXVERCcnZjc3FmMkhROE9Rc2l1?=
 =?utf-8?B?Z2taN1NhOFNlUnloSmI5OE5VNkdaeW5OWXdYdldDblQ4THJmZTZYdHZTUkV2?=
 =?utf-8?B?RUFjM3MxdkcvNW1hR0JqUkFsRk84OTZSSTZiNElYVExOWUdBVkMzQzJrNUlX?=
 =?utf-8?B?TGRuRUlPQklWTVZPRVJhV3NaTHRZaHZveEIzYmJ0V0NFNkVFb3Nic1NYOVVm?=
 =?utf-8?B?VTRVRnRUU3BjQkNwWTljZUJoODFoM2FFZGJla01UVzFxcHJQaG1NZmNKbGtn?=
 =?utf-8?B?cndleVRlZTFzbHlqQnRmOFNtSkZHOXk1OWltTGRGY0NtdzdWWXpka0svOTNu?=
 =?utf-8?B?bWNzV3ZwN2k4SzR1aWtpdFBIeEw2c0VRZlhSVVVEcUUxQkJmWFYwSlFySFdt?=
 =?utf-8?B?cWZlRDVMc0NieWJ3cUlmaEgvY1BjM0JuQTJmUERrTjlFT3FuWVRTdE5oQndx?=
 =?utf-8?B?SmNLczZRZmVwZGhBMGI3UGF1YzhraU5lb3ZkdC9BQmF1RllPYm5LSWU1TGJy?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IqKa855EeBl6FEqGYlmB1Xdr+sqUT/pBsOyhiz12yRplY5sbi5KnvkWtUS1zTUUUm5KxGjSo1n/IYbAIq5X5thdmQt5m8BNwPsW8xNgvxT1gjKqGF8GLd4RaiyqyKJ7uzXc3dv8i0dCQ08D9AD12F+yNkdPLuJKuEz0aOmWKECw+XwY14dl7oXZA8yh+3MMZjGkGZIuA43VekGgaSJ0qIPL9sfy8j90jGNvH8ZM/S8cfiKvcznp6fdc0gm7GIh44PaON0FFQDudmrcnHW/zrAG6B4evosMqBGgLP6G7vXVXf1DmcFnUNsSxaaARnrIVxDy7KsruvY6m2KuzvTc97qNhKwPUgg6loFBv73OJ5Mp36zWHE5s825nfJEslP6sY4Lw7FRKT+nfZzqqBPz6wRJE0Fk8HQAnGIDQ/b6TQwS49CRhk6TKacem56jziRhejZOhNT376g89elm/5A8NYXXn28+YqbuUJXLMw15aCI2GIQQq6ErKjEwpeg0PcPIS2OVda/FUrEo346j2jpugkVqagROGxmtTwp2e/nNN6GwZGN8Y+Wofpckr9N2131mdWCFVYNv+50+rprGClzNyX4XPTcCXCmv/OHJmps+XHVW/A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ca6f12-ed91-4eaf-c1fa-08dda5ba2e91
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 11:55:22.5381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFEf+o28YoOaLOUJV4Imv7ds5CipOPtDSVt+bdxNL77O+k1nkq7uT8S43jgSxKHQ5rv3d0UkbujRFSJsT53sI6t0qJ0wDvzBIxQnqOtd3HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5634
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506070085
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=684428af cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Ikd4Dj_1AAAA:8 a=SRrdq9N9AAAA:8 a=3VIUYK0wnweDehpCAUEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: cKMGPhgvliSIQPrlmZR9vOMmssAmb-sz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA4NSBTYWx0ZWRfX1g3nM48NFtce 9I7DU5qKjwYj/4WOBtX84rSyAbgZIQRvScQmhn4fTsznGVbGCPqs2Ho14WYNtHYIhtwMcbaeOrs ZY2HqIyoKRofd6ZYYeKseJf/OFKf90jg1gNNFy9IVBqmRkUTrYctjGSE30l1gCaw3UiMFF38ubZ
 NwV/SxsHxkrokMxO+nGAM4Zdj27THwiBJmzNhqls/LCFZmCq4y5yJNGmR/P3mLz34j9opw+2/63 hTc0x9SyYQe2JJRKjpvYVzxF7COBn5KinQx1piLFCnHALke30shKKZysV9nNvjjw0fkXavtw6Ul rPQeFHDRuH94YxHHWfV4BaNLZCw7GLldJtdao+dzIjM3VOMMr/mdhXhUgo0ASOw+HyChyWsvkzN
 HuW5OsqsPrEkQTQTZhFZn3Ajycp9rfigHEVuo+VyoxfyCxQsQj1Kzjn7SCEho0NOQRjmLQDy
X-Proofpoint-GUID: cKMGPhgvliSIQPrlmZR9vOMmssAmb-sz

Not related to your patch at all, but man this whole thing (thp allowed orders)
needs significant improvement, it seems always perversely complicated for a
relatively simple operation.

Overall I LOVE what you're doing here, but I feel we can clarify things a
little while we're at it to make it clear exactly what we're doing.

This is a very important change so forgive my fiddling about here but I'm
hoping we can take the opportunity to make things a little simpler!

On Thu, Jun 05, 2025 at 04:00:58PM +0800, Baolin Wang wrote:
> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings, which
> means that even though we have disabled the Anon THP configuration, MADV_COLLAPSE
> will still attempt to collapse into a Anon THP. This violates the rule we have
> agreed upon: never means never.
>
> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".

I'm generally not sure it's worth talking only about MADV_COLLAPSE here when
you're changing what THP is permitted across the board, I may have missed some
discussion and forgive me if so, but what is special about MADV_COLLAPSE's use
of thp_vma_allowable_orders() that makes it ignore 'never's moreso than other
users?

>
> To address this issue, should check whether the Anon THP configuration is disabled
> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag is set.
>
> In summary, the current strategy is:
>
> 1. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == false
> (global THP settings are not enabled), it means mTHP of that orders are prohibited
> from being used, then madvise_collapse() is forbidden for that orders.
>
> 2. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == true
> (global THP settings are enabled), and inherit & orders == 0, it means mTHP of that
> orders are still prohibited from being used, thus madvise_collapse() is not allowed
> for that orders.

OK so it's already confusing that the global settings only impact 'inherit'
settings below, so they're not really global at all, but rather perhaps should
be called 'inherited'.

Maybe I need to submit a patch to rename thp_inherited_enabled(), or perhaps
that'd just add to the confusion :P

OK this is also not your fault just general commentary.

Anyway, I feel points 1 and 2 can more succinctly be summed up as below,
also there's no need to refer to the code, it's actually clearer I think to
refer to the underlying logic:

	If no hugepage modes are enabled for the desired orders, nor can we
	enable them by inheriting from a 'global' enabled setting - then it
	must be the case that all desired orders either specify or inherit
	'NEVER' - and we must abort.


>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  include/linux/huge_mm.h | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2f190c90192d..199ddc9f04a1 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>  				       unsigned long orders)
>  {
>  	/* Optimization to check if required orders are enabled early. */
> -	if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> -		unsigned long mask = READ_ONCE(huge_anon_orders_always);
> +	if (vma_is_anonymous(vma)) {
> +		unsigned long always = READ_ONCE(huge_anon_orders_always);
> +		unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> +		unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> +		unsigned long mask = always | madvise;
> +
> +		/*
> +		 * If the system-wide THP/mTHP sysfs settings are disabled,
> +		 * then we should never allow hugepages.
> +		 */
> +		if (!(mask & orders) && !(hugepage_global_enabled() && (inherit & orders)))
> +			return 0;
> +
> +		if (!(tva_flags & TVA_ENFORCE_SYSFS))
> +			goto skip;
>
> +		mask = always;
>  		if (vm_flags & VM_HUGEPAGE)
> -			mask |= READ_ONCE(huge_anon_orders_madvise);
> +			mask |= madvise;
>  		if (hugepage_global_always() ||
>  		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
> -			mask |= READ_ONCE(huge_anon_orders_inherit);
> +			mask |= inherit;
>
>  		orders &= mask;
>  		if (!orders)
>  			return 0;
>  	}
>
> +skip:
>  	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
>  }

I feel this is compressing a lot of logic in a way that took me several
readings to understand (hey I might not be the smartest cookie in the jar,
but we need to account for all levels of kernel developer ;)

I feel like we can make things a lot clearer here by separating out with a
helper function (means we can drop some indentation too), and also take
advantage of the fact that, if orders == 0, __thp_vma_allowable_orders()
exits with 0 early so no need for us to do so ourselves:

/* Strictly mask requested anonymous orders according to sysfs settings. */
static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
		unsigned long tva_flags, unsigned long orders)
{
	unsigned long always = READ_ONCE(huge_anon_orders_always);
	unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
	unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
	bool inherit_enabled = hugepage_global_enabled();
	bool has_madvise =  vm_flags & VM_HUGEPAGE;
	unsigned long mask = always | madvise;

	mask = always | madvise;
	if (inherit_enabled)
		mask |= inherit;

	/* All set to/inherit NEVER - never means never globally, abort. */
	if (!(mask & orders))
		return 0;

	/* Otherwise, we only enforce sysfs settings if asked. */
	if (!(tva_flags & TVA_ENFORCE_SYSFS))
		return orders;

	mask = always;
	if (has_madvise)
		mask |= madvise;
	if (hugepage_global_always() || (has_madvise && inherit_enabled))
		mask |= inherit;

	return orders & mask;
}

...

static inline
unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
				       unsigned long vm_flags,
				       unsigned long tva_flags,
				       unsigned long orders)
{
	if (vma_is_anonymous(vma))
		orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);

	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
}

>
> --
> 2.43.5
>
