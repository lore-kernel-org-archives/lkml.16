Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEC343ABC
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346290; cv=fail; b=gneVsfLRBSXz2lVaGX/JmqFA+KZJSZNA2xhibdHxzcoAPFuHzti10tk6+4DLvJUT5FOIRLZ4owqgroJsc9x/Ys6wYyIoeOeK12Xv4NzglekCW5miLlup/wetGbwtYJyYQFZ5OS67h5xv2RgARI6FJ/kk44/ndXQ+CUrqqZsGm6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346290; c=relaxed/simple;
	bh=mtriOIgjp/zKo1WEz+KHrMZTCNhuDziRHnQLji8MFRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jOGh3c/bOL87qWn0dFj0stF6XVaVO7hwwZLlGw/3nWICFLpmePqTnsd/8YIznI55gQmka4m7YLuDuSEAFq7ndIlJ95b3btqtLHUqztWBk0+QazjOEvsw2kYkSUkjn54Rnxl5sEalHQRRRvIuIK+SEPh1FEeg2xnoCtM18Eb5MT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gB2Hfb1t; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IUPrf5/f; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gB2Hfb1t";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IUPrf5/f"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R69ZS8001726;
	Tue, 27 May 2025 11:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6scYIB/DxdrJB17cFU
	Y03Jut9RnRvSxOU/XOfzHTQCc=; b=gB2Hfb1txjYsmoaOwIF0AxIvJsQKk/pRrV
	fsHdu7Cn2KwdB+Xjg3oFbbtFBNYYGJHVBIfZKuF0p67RTv1FTLD8D/8yh7X6XlsB
	uWBodPvGvTIOq2E/fKTKH7aP6i6rJ7QAymYnvo2OvU1Ucss7lEvPMUFGbCHDgi2C
	ATckLLcdMByTNNY+8vXgtZy4eQdd1R0UM44QjBuI42PF3hzcBtZTXIWRrS0MZlhG
	pvP9+odjvorNzfIUaPVkJgBOz9o1r62IYMFxYQiQ83nS1alHms3W0M7+CJHfTNC7
	4u1e/yNLfNQykCR+xwK692S8zztu6biyelvr5ACOw/u5ylMQQ3QQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v0g2b26s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 11:44:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RB0lD7021143;
	Tue, 27 May 2025 11:44:17 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010053.outbound.protection.outlook.com [52.101.193.53])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jf8q4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 11:44:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzi/7QocGPaGbwdk3DVd8JF+RTLbw7YvKo6QgZmWRdM3jedyooYqTCbILf/UDdwLND2RCRtzvLu7U7W3hl8187OKyu6XWXkxajtOvd9RIgZxTM+VUxUkllMhSHmxF4P/zZRlA/mFHKwro6RtXzsrW+binVpwdYUNwRqXohkFKLSJlM9rEhKWhkDFE8wKk/trwkaV9/FZunccOLwJCRYLmsrteW7eU8SrURDPG6UBUl7c3wRhm+PBU27OEn81HXVUsL0qkQc2DedPEzpE/fOnaaxlqTRE0DiWqJs52m2cre7RwTpTtnkh8QGO+Vx/5ntWTFmnLd6u1pcBwoLBjLmWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6scYIB/DxdrJB17cFUY03Jut9RnRvSxOU/XOfzHTQCc=;
 b=LnTPJ83KMAvA36FeK8FJPSJ1LqIpQ4oj9fNukZn7Qkc8YwHGkDfBhsZH8WcY2RHwmEPXq5mhfS58QRIiPRO4TpllFUQuvbPfx9kLn+uRMW6b1lfSM7z8ZkauUGcczt+5G+YSToaVjrNlhI2+VjAJ3Etosbf3Rw+oNmLGQmQ/h8UszVyJdfQCXRKtr8uKynsc60MeD2OCK/J0MLagr1EArhISnYNwZtkJPYKbLXIJ1kBQlDQ04JdjbXkInPBxEenxmSuFVpfK3eUknaYdaJGHVGmgQP8LpeBUKMulmAk0YEcxAk49yID25vOqfDf7aRFQiEysDTlB2eU2RBvt4Qb9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6scYIB/DxdrJB17cFUY03Jut9RnRvSxOU/XOfzHTQCc=;
 b=IUPrf5/fmBPyxMzNE0li3ifpGZp99BuB9a9+TTJlOhTOgxRUhZHObtmqW45dbQNsj6Tf9a3fFDMWwwJyqDgW6eHHWx5N/x2CZLhQvTeKAKf4m1yNhbbrkPGfmevOokA9kdKdth7Vb2HkYbmJxCenwT/Oam6cMFcn2k8LtE24lAA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS4PPF072D269AC.namprd10.prod.outlook.com (2603:10b6:f:fc00::d05) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.39; Tue, 27 May
 2025 11:44:15 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 11:44:14 +0000
Date: Tue, 27 May 2025 12:44:11 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Pu Lehui <pulehui@huaweicloud.com>,
        mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
        akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        pulehui@huawei.com
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Message-ID: <32edded8-bf8f-4bb8-864e-46b11db8db31@lucifer.local>
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <b84f00c8-966c-46f2-8afe-d09465153217@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b84f00c8-966c-46f2-8afe-d09465153217@lucifer.local>
X-ClientProxiedBy: LO6P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS4PPF072D269AC:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef63c82-f3f9-4b55-da9f-08dd9d13ce5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kGpBtJ6M5oR+FcmjIlSAF6kuT4CLmAdnzNvmEb0TT1xeNgYMJg1fJEEFMdmS?=
 =?us-ascii?Q?u5tddzhgZUjMhlkwIm/uef4IYPovm7G6D0eAQHQQjuIG162GKEV3T54SlurL?=
 =?us-ascii?Q?XXUdKDC6ghDQiyInJerVsfocOkLtToqN01IOtgC3kyw4jbK1+JcvUnKHWrWq?=
 =?us-ascii?Q?CrhlhTkeh7OayEwTBnBbF/tELvWPjPZQw3RX8+QEDbhXpQzNa+CiAEFQ1pnW?=
 =?us-ascii?Q?BITAKHlbyKOkGu1Kb9Gzb53wSfUJOt806Fvvr5FHszQA9qajcugEgwIcRB0h?=
 =?us-ascii?Q?fUUvdUaAPnxtnz7yLo/Ty7Cojwvdwct/5aANeVaD3XPuKt8FZH6A+p7rLcsT?=
 =?us-ascii?Q?oFtnn+9NvZWNibhSJCAffjBUC1jecH2Ep4K79x2xsKmvywa5LGXGwUMM3o3D?=
 =?us-ascii?Q?1oH0sxbcZ25qzRM4KGTK1ISefnj3laHNZ8GBQWt8BKbngQV90gYHn9liudaK?=
 =?us-ascii?Q?gLtVmSkHEigzlGMjvQ0UGYJaSUG5IPsn5Zw4PFdhyIlIM2NdJflLNwENDqyd?=
 =?us-ascii?Q?KJVZvaaDJdpNw7nUc+hAS3aJXuM/708K0gP3+cTW1Xr7XuCdX/9b4UwfMNFd?=
 =?us-ascii?Q?6zdmvTQ4RbKPddNqvvpMNAyrPOaUhaROgvC7pEll2R499ajT2zjFrgUh+ukp?=
 =?us-ascii?Q?GUFPBMAtuP464PR3pDTw3okBvxTNqdEtZ+4vyo6qnTUhMbNgNox33eZSq1V0?=
 =?us-ascii?Q?LDrDNNC1a2YS4EsxMkHgKvJzUFhBtI4PDxaRasPLqhWth5A37rO/B3IDyQ9R?=
 =?us-ascii?Q?z0ETqkPC31iT45vtrcsZ/mcc3dcpGX38I2i1NOXhbIRF11gQCVYTu+Ewb4PT?=
 =?us-ascii?Q?ZezEriW6qyMCCYrb3xLWmNuo2Qj9yJt21SugzqbL5Jsk3KEoRINeBEiJJiRx?=
 =?us-ascii?Q?3nSHLJM5IWag2ryWjs5l2bpm4deDqcswfea9kvpy046fDwPtH4gJgY8QnfHz?=
 =?us-ascii?Q?m9CC05brcbiVV++OJ5Nzawo2wXW6hOT8yaQugYIlyBAyOqvXuWln49enpAfO?=
 =?us-ascii?Q?4Ax1IdM4jhR8qX4Bc/LgKwtitx+pUnkMEBT18Sq1ZW28xN5BlPrYcRTMgoco?=
 =?us-ascii?Q?IpLnbPIrWRKaMbxBY0jhAMhqWApQ/dsNT5ZfrgtQbA/yc7LM5Ii6vWyChyJ/?=
 =?us-ascii?Q?iFduAhOWKUivqbv+KkG1CZ3l+SWSH0bn2w892/g1Ttm75ztAoaMjs/o3UpQ1?=
 =?us-ascii?Q?E0+Q11yjwl9KTLCu04RsdVUtvEsqiN35TjYQPHyPQpOHddJHixZoACMlAwTn?=
 =?us-ascii?Q?PPX3cvvKrUu9VhgX/XrvykvV6EAqqw/S6xtXdVAOJUHFDsg6QXbWJoHF4T/H?=
 =?us-ascii?Q?zm3sTDANG1hupjjoUUDu2CoSkdYlPA3zcTD+i7IzC7dsZvYZAna45lypFipX?=
 =?us-ascii?Q?ZQbBKWGjkMp7GQaoGMtqbjjkesAr0qL0K9gj5xTMdFWQQk1OK4SqtCwV8sFG?=
 =?us-ascii?Q?/8wczDK7Rc0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i+TQpRmZbPwc3AMlmc+yTN3dbxPALjiD0C0i30t+8LtvhVC9VixwRDXVqUNK?=
 =?us-ascii?Q?dZbuYVVeGHh01tt+5v2dJl89ggVMtK49wSl4G778ID1KlrFa7iuj/ySmKNEr?=
 =?us-ascii?Q?fmvnqn5+mNsU9QZHFwK7hyJGtegkk9jd3FzpI3OKx92ucbmOb19qOyb7mpd4?=
 =?us-ascii?Q?QhT2B3T2l8WNuhKeBejMcKkv88h1NbRyecsjMgA/Y8x3uRP8WChfgFGtpM9S?=
 =?us-ascii?Q?Fa1vCt1RPc93t4yBZutlg7JjS086r7CaXvwROei0xs3r6csSuYpyF50MVc18?=
 =?us-ascii?Q?0m18DGZCsGH8IWJRMLlfBC8Hno4sHJ5e06EFeeEYf6W+UwYmwAakevuES2kO?=
 =?us-ascii?Q?hprNiaTxuiUXtGI7uI/zeU5E+4qWGuFqcXjjfgeB62mFAHzoMFsLCW42j1fA?=
 =?us-ascii?Q?SLCcdSNchuJWdqjlUHj5w7gOQSsHLcxUtxx5iR8ZEQ1M2dJi7wJEfaiLkhfE?=
 =?us-ascii?Q?IqEUDZjotkvjMd/azRwxWt3YJK4vkwK1z20nsjTrf3vYW8YPEqlB1PaFjKDv?=
 =?us-ascii?Q?IsSUnRnPAVfqgrVtNbmC7RCbblEp9SAiXap8oyZfSbEazwnx2/yvyHVZ1mqi?=
 =?us-ascii?Q?l4mCiTQ/2K35gEAFIFL57Uq/bXEWA8J6p7JyLj8Fj496nMaSYg7u2riAIHCY?=
 =?us-ascii?Q?szsNAP4IWM0koAZXWEFIqbAM0A1N1WTlM7M/NDGgtIezWx4MLFM7y1Nkys8g?=
 =?us-ascii?Q?xwow23SlM4bfHj3xKkzLMlyv0MfNkfQhQMwpVaTG2Beqa/lwTjjXsdUbFAyU?=
 =?us-ascii?Q?Ih0YEmFVWepERs89JA40cPp6jL8vLL+LbK2foKlVbQpFyusDYTSHNishZ1zN?=
 =?us-ascii?Q?kdGJLNMRGCk92HwnyNQDj6wwNAKOdTAxXorYEenoQDdUTRFgpuyP1DIdYYss?=
 =?us-ascii?Q?gGVvOZIqJBKx5lA26DjelhwhvQEDra7dQsKANDcEAj6F5T0SfRXS4odbNNlh?=
 =?us-ascii?Q?+2l5rgdTVHdkx7JlRByJcbDn/wgnfy46kKIc21mjPaNVDhClEi3pK28i9T79?=
 =?us-ascii?Q?KPadhCymWYVGyO08apHCxD2YDsW5B/Tn3EjaSdFaVFHSWRCcqwbDZxd7Z4TK?=
 =?us-ascii?Q?Se5dfDOi1IzPHpdW3ajCmdsHUirDCH3d0qCOUaVPhQN7IzqsLV+hNKZxnL2v?=
 =?us-ascii?Q?CUCNNJfrs+KdyILiE1iqqL4k/hwMLsPzq0iLB3Kag0bK7AcrZV8BohW/ofs8?=
 =?us-ascii?Q?4pLq5BtPC9RApxaOPNYT4qgA/n7VvQu9FmaMHEwzWHSw62/RxjSYqm688VJf?=
 =?us-ascii?Q?yvXMC5LGxxLfBTB7m+INWxMFjF9LfYZD2/wEW4Ywfz10BWSitmX48/wA1zSZ?=
 =?us-ascii?Q?ZbV4QC4Jt05vmNjzQ2z5bvW1ny0GLippIS9UDF/phBwEai45GLOhZ26pHuOg?=
 =?us-ascii?Q?849dVqTcSrAW+lMXnKe/wnr0U9eJCirEuO19q5MwfjUrdZvevcQGaPh5yaZK?=
 =?us-ascii?Q?tQh/SZ599xoeRFGHv67sIjxH1dZSyhizQtvrJKGxVXTsG4h7y9ydOMFz33Nm?=
 =?us-ascii?Q?kCJdXGSHh06dAYW67k2b5Al7UEotYTG6Tzq//e46xFn5nGFJAPP/CtknRDWj?=
 =?us-ascii?Q?C5zQeTNM/L9/OV9wVAPW2ignuTRtx6hLsHpUDqFLAIOTK/9nIdyZc9ke7CKQ?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ERYsOf5aFfyK/y9wsb8YkHBHmji/vpn0BBAYRLV8VFNhj07T6ypDuY1hlBNl16XeMhElZpNAVicJj8+KZaCZPzSUb9Rpm9qwBX8YhKyAcxHTDczYJXi1Mn7+vTvU5cabWefcGq3+loME0HaasygZIsxpoNkhJUjLdVn4YJNil3QQfJs2jrUqpgWzedF6dNX/ayqYNYI38e+wn+eG0NuuWs44czJD3aIE754JVqfRvxYqDjbXKxyzCdpIu0X1QYIeIkmgrTMyVycZjgtJdvvT/RroTps+XY6bFwSJJbg+KVZHb4dNFRb4wk0KhL4qE3wvPrW64IhpeVzZTh3fs27tTdiUL4cH2FBC6E8y2DCBPn2pxYp24Lfpa1wZvDGf/P6eCeTYw2F8qXm1dQGfTh+rxgU19LDC5zr1dr5c5aALCeI/93gnOSngJ8HvP6G63LcNjrnV1tRiFlsl7+fskotuEp1Yw16dJ0ifszmH9fsldfLlQAzyXbyZvZq1XE8OweqGDODTbu3JcZM/IGASbqslu2Dx9LWKmxtbvYGXFZxw/UvUFhgNXo/70ZJxlftLRzyzn34CBZO+2eY3U3WxzY/wmhPoHHobnHfbMbMtd7glBpI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef63c82-f3f9-4b55-da9f-08dd9d13ce5e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 11:44:14.9603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wiza9Riq20Hn8FaZRaoWLo//vSLtyvkgoSP51HJEkRsC1B8fdddEw39R6J9ZEpBY58ybN14rwF+azebcaeN/4l1A4ogGV9dDSzYYENqqVgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF072D269AC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270096
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5NiBTYWx0ZWRfXyw+xZsOVAIN9 gelvnb2BMQDx3DOWZXUmJLsYdMMUhGkPx+2hbK5fqYuK6aHDYGlkQYxxWp4xFZbLmWS4wjljZai MoyckaIn7Nl+GCet3/GqOqDi0vMOVPV8YdzXqPN/tbWvRc3M/elJxlFPxrva/y5hNQz4vewysLd
 K5GOAThwsz09DHkV60NtbV0D1TmCTl7YwYtF15CGspinhEkj7Uy4xK+4bSsTAhyGZVjUafLKLCh krcGEpK/OyFevyadrAfL5Osjlpb8D3WYz/tqT24n6xkfBbnMZebQEfN1qyHN4Xxl9VpdTxIj1ZH yeAHk/Q0QwFjXDe1dfh1i9SU1QlkLilKAhCHXsY1PnDznzjE4lGWR9P62//JVVNj3m7K/NLp7MG
 SYGCH253BlXYP4sxw5xahUoFlIgpfnJMSlSIoh2KANzCXCz+7+p5sq0xzzSUx2kS989ubkL0
X-Authority-Analysis: v=2.4 cv=NJLV+16g c=1 sm=1 tr=0 ts=6835a591 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=InAHNVwbodE7Bj8LneEA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: NfvSeVwsbWkyrIYdQBx9D2z99QjLpqk1
X-Proofpoint-GUID: NfvSeVwsbWkyrIYdQBx9D2z99QjLpqk1

On Tue, May 27, 2025 at 12:42:38PM +0100, Lorenzo Stoakes wrote:
> On Mon, May 26, 2025 at 08:46:07PM +0200, David Hildenbrand wrote:
> > On 26.05.25 17:48, Oleg Nesterov wrote:
> > > Hi Lehui,
> > >
> > > As I said, I don't understand mm/, so can't comment, but...
> > >
> > > On 05/26, Pu Lehui wrote:
> > > >
> > > > To make things simpler, perhaps we could try post-processing, that is:
> > > >
> > > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > > index 83e359754961..46a757fd26dc 100644
> > > > --- a/mm/mremap.c
> > > > +++ b/mm/mremap.c
> > > > @@ -240,6 +240,11 @@ static int move_ptes(struct pagetable_move_control
> > > > *pmc,
> > > >                  if (pte_none(ptep_get(old_pte)))
> > > >                          continue;
> > > >
> > > > +               /* skip move pte when expanded range has uprobe */
> > > > +               if (unlikely(pte_present(*new_pte) &&
> > > > +                            vma_has_uprobes(pmc->new, new_addr, new_addr +
> > > > PAGE_SIZE)))
>
> This feels like a horrible hack, note that we also move page tables at higher
> page table levels _anyway_ so this would be broken by that (unless uprobes split
> huge mappings).
>
> If it's uprobe code that's putting the new PTE in place, then this is
> just... yeah. I'm with David's suggestion of just disallowing this scenario, I
> really dislike the idea that we're ok with an invalid condition being ok, only
> to cover off this one specific case.

CORRECTION: Oleg's suggestion :P Sorry Oleg, misread...

>
>
> > > > +                       continue;
> > > > +
> > >
> > > I was thinking about
> > >
> > > 	WARN_ON(!pte_none(*new_pte))
> > >
> > > at the start of the main loop.
> > >
> > > Obviously not to fix the problem, but rather to make it more explicit.
> >
> > Yeah, WARN_ON_ONCE().
> >
> > We really should fix the code to not install uprobes into the area we are
> > moving.
> >
> > Likely, the correct fix will be to pass the range as well to uprobe_mmap(),
> > and passing that range to build_probe_list().
> >
> > Only when growing using mremap(), we want to call it on the extended range
> > only.
>
> We might be able to implement a simpler version of the proposed patch though
> which might avoid us needing to do something like this.
>
> Having a look...
>
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >
>
