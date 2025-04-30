Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF42F2B9A9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023897; cv=fail; b=E82vjPmwvL7nr3WQRkMRb80YgbldJ9OE3PHV6A6tcwaFZeNWop/AWnZkg1Ao22kT1eM8RGtAGA04FUQVmMS7LiwslfgR3Aa6bwdvkgaggwtwxlbiyYY/zgqNihroAO+CCan9qKwssWxl58WW2zA0iL46p3wyBcp/PZxgI7jNw68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023897; c=relaxed/simple;
	bh=mazQ8wgrybQPWvVydQhQm4y6YQv0n1TUP+zA7Qao0wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IjuiLwm1EpMLFDUNQkjP+5ksPfC7WwilqG+SUeyJJabXgf2rOk/NCC5xhIILO1Ms08W4eW6qRr7YQk3tPPhk4Z613AdsC3BIqLcdi043OwajRaBk1Nqufob2NBk8OyYpYZlCoPZxD0JoJqK/dWDijq9UEdKVaCzdoy5pmF4zovY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Iy504/uC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wu02XjrA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Iy504/uC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wu02XjrA"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UDafjg020638;
	Wed, 30 Apr 2025 14:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=BRzgdFJ7nT00q6F1ii
	YjvVifXXNuafim3yF8ubX9ANE=; b=Iy504/uCldegUA6SviAQ7IOa0c8TJEqvd7
	RaUHUNmbWsU2rxjBu9FeO27cZbHDwfbZ6vhCIkbDkwO2erqBy53NiwqTVwQA1Qvt
	2+GF2fC/gmbfqIgmEYof91XuMCL+mStUE8KtRAzQdD2jza7SuO2HjjTlYgzfmYNz
	f7wjrumYz2+kMXVWOQqfK9aq+0t8cdyyzllkvezcNhyFvudedd2++IDh+bG2S2A4
	s+x4yK1l+xE+/CQkdSPUD3PazZ+5L0G95nht0Hz2BmKGl3pRFJM2zH4ZzuL8B9k2
	+NrtQc6hRt+V9JbjYVwQcBNXvx4BgDIlp5+vTXeSpOUQ0r4XriJA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ukhb0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 14:37:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53UDfNBJ013889;
	Wed, 30 Apr 2025 14:37:43 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazlp17010002.outbound.protection.outlook.com [40.93.11.2])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxbds72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 14:37:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7Esq9UNT97bdYYYzIiL2D0kzcpZ7MzyTWM7hMIZPbJ1WQU1ToG7aGj7le6HrxUrovl4Hqwn4LOKPY57OJ4t4OCaebomuWOIVAbuXh3OKTMGoK/YhVll1Ou/1g0qoNKCfQ34pSIRuX9n2XS44DNnH2t9FCI7p11DHr1lOoAVkmBKhOEpAuJgiAe0G+6VUjcB2HkSiMiAX0KSPojC2MhqMnQlCPtTHjyu8v60Bk+weS03NEeJTowLW80366cRrlGQ/retrkOox4RztVNePc/05Tz1kG4VaM406suabEGrTN6SDD31ezGKVcOn7dPwIkZz4Lpe0VoQiSpcJFTX/i5R8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRzgdFJ7nT00q6F1iiYjvVifXXNuafim3yF8ubX9ANE=;
 b=KV5jlYHVqHLRqG465Pb9GdodBjS3YwWxGJJacyStiVm/2a06SHdBT9vuhoBfLGu+p1cIhi/5MnY9+QybXFTQtYsFOOvXHN5A80gQ+CJMsAKWvQsroV2j7JHNYl6mLF2HN75L2PnemSr1XAmoBms77pvYBFr97iuowp2v8NCmsOGQBHyLLmO+q9elN77TavUgfPI52zeKUSBX5O2Ty1Zz8gYTUAQaTCBFPpqW3fxUKhlGOZzeDIjNtWSgT96lJVPm70BwQhSf5wkR+Z2G6okyTqgonn8daOoQtJXfd6cYLujsXePldFFj6QlsZ23YP6XJi0nrOGu3wA3ghl7DsM71sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRzgdFJ7nT00q6F1iiYjvVifXXNuafim3yF8ubX9ANE=;
 b=wu02XjrAf7Uj6U7HG7Wux2WmdPLzuceHPNr8ZkZnqg7xTrre7HadZgoovJh+6x089HRZ6I0Cw3pvB5oXRHuMLW8LopadtRendBZCRXohRTojZl+7SXlZIC5+CAPmQDzswcv6LmR3Ln1hCQx+nZxq8m/vgJQgC/hDz5QnU6Cr9n4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB6809.namprd10.prod.outlook.com (2603:10b6:610:141::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 14:37:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 14:37:39 +0000
Date: Wed, 30 Apr 2025 15:37:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, namit@vmware.com,
        hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <ec68b9ac-5d89-4048-a680-788525870e15@lucifer.local>
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
 <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
 <f52746e9-f57a-4e65-af48-f5de3c5887c6@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f52746e9-f57a-4e65-af48-f5de3c5887c6@arm.com>
X-ClientProxiedBy: LO0P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce2bfe3-4396-4b24-ba05-08dd87f48ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X7TjqUJj2QZRFi2jg29/deoYECcmpTpkYMWB8W8MDbiq6YmC4/2/89Dqcj/K?=
 =?us-ascii?Q?Rna7sVSH9809R535lv1KmsBXLUywhHiwqPSLYFNydnXIXhtpyJqw9lZfRz6F?=
 =?us-ascii?Q?Rvv6oVx/rIGIlpBvbuYH40CTcwRTt8SGJTh3BuKuKPVRJKF3iG1kSUk+os1i?=
 =?us-ascii?Q?q4PM8CMF3EWHafEPIT54K780eCPaCIYzMxsAl0YIv19lVCyy7KwVyhLSEHc/?=
 =?us-ascii?Q?vj9LXOe8fIOW983Sh9VSf5ERNRFTndh8osQww/72w3qdrTnFpBXesgV2/P1k?=
 =?us-ascii?Q?MAsVq04bBhhB2aarlyjPgIq7vXCAOo1JtVj9iRZTI2MM3yKR70u0TA64Te8Y?=
 =?us-ascii?Q?wJw3HEqN+ob1/FbDFAvmqRx6YZ41KlDmgDrSvEsLr2Gw+HLgdoJcvzSmmDkD?=
 =?us-ascii?Q?kgt2CMYR79WF4AIJWcAmBfGgXoAxmYIdWHZMddYWl5WTFrwuN5HQiYswjr1v?=
 =?us-ascii?Q?45lvwUsKpHgLJLo30waaaUkrpu3ouQbA2LzHJrDFdgpnHoHPE2SV9BeNgZ7N?=
 =?us-ascii?Q?BCoBfKTAHCi9tl2RxhTdtTdgwcHk78uHiCsBJa3kQoe/ySNZdH1O3pz6oYUn?=
 =?us-ascii?Q?faOsne+o9sri30OOYKV4QOj7yX4VArWRLXT03i0jPKlkeoVelCtrnbpt3g49?=
 =?us-ascii?Q?glLn+khKCxgv6cIL64AIQP+LQme57A6VNgQKV0PFK4Gj1WpGLcE6/GXs4Kix?=
 =?us-ascii?Q?vHTRRN45kGLClOxkFH3HnexxzLqtmdNIsNy18zEuuWuhns6W3fzbT7+U55Iv?=
 =?us-ascii?Q?HTnHBP67uKLHgCg9zcwMOuvMzJxzGHJHTW13z9+A7cEb3bAtlxbpHiQBvN//?=
 =?us-ascii?Q?bxOVcSek1BcPcuB8/ylRIX1+sVLGtLqFSiuOc4MxIaFnYvhXjJUX11JUmP+d?=
 =?us-ascii?Q?+3zIEDY42PRvZ+qOd6OnTK6kWwC5KGHbfPYUesi4o3/ztJUjD4dzVSOz5M0m?=
 =?us-ascii?Q?N9hRBaLesyALTQWBg1SqWZCOdJdqDFGCczOlkZE9vHvgfY1E7zwNdys97e9N?=
 =?us-ascii?Q?fZ2WLiqPIL2dli59woPttN/B+AxH9k5uu3PX94is+BAuqhgZfSKOJxhl2FyV?=
 =?us-ascii?Q?9g63IRTsUi6EUFDM/Ucc+vYEkRDWrt8OPwUQjFwfA85FC11DFzxDkDFuMVrw?=
 =?us-ascii?Q?p+2R5pEopsWbWdEW//FaCssMuxOgzgdN6BMWhhqshgf4s26QIbdfFzMH8Koo?=
 =?us-ascii?Q?83BHeRWypRdLwHETSOZszTFfpXMclfsMZ6a7g7tLAqvyE6cdbPUe8ume5rPk?=
 =?us-ascii?Q?nr8gFW+g1gUcFUIATa0OmNwCP6zf0cChfePK00wsk9Siv3PSM5cg4DWwcY1L?=
 =?us-ascii?Q?vNfSANyduPfxwqH55p7JzKEQ/LTDuY+lcLzioJAs0RON1ayLJLUOk4qTu6rO?=
 =?us-ascii?Q?fzRQEjDM4S5vt5jlj8eqaYu/NX2kiUe+ZKZLXOfB3eNBIJcpn9p5ND1RUvfj?=
 =?us-ascii?Q?1riCvSWqZIw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vnUocI4YzSg0CmnH7FZNm1oCwp6b84X+wmRrLnapGAiRVvQ2UstTaszRdBEh?=
 =?us-ascii?Q?ZPEZgNBxQ2luJiv8i5AKYh3yRVdn34YdzLyzl9n7U+5nMUoXtxsEgrHxB57W?=
 =?us-ascii?Q?c10o36H8ehzVBrDheBaM/jNgLcJrPIL+8JbhMbruC7yaOD0DcYxF0vXqp1nx?=
 =?us-ascii?Q?bB0R+JjVmvpQ9cfVO3bC9TZ73oPIVU4HkujmMhJzje6roopyUPYeI9La19eE?=
 =?us-ascii?Q?e0HxKNlrnwx+upRStJ3ML4JhTBL4pXSTpqIWz/OMg7hi6drTcH2aiJtLH8Ni?=
 =?us-ascii?Q?c3xD7o68aNn13MkObBn9Tq4dN5Z1hun64bABq88xnN+K29dDaqKn3ky8uhP6?=
 =?us-ascii?Q?aE/F9QxJZDntu5iafjAs8j3jNEPMvYZDW7my0/yV48mM2zL0bPZdgaHqj2VC?=
 =?us-ascii?Q?ND8N/Yf9Mzw1QltduwSwnxlO9gBS5vEebcf79W+17mfXdtpjv5O1fd1JmHve?=
 =?us-ascii?Q?3v+b1INyBllMZjcEE08ACgL34aklj9QjYVOgUykdhOalYljJfOYq1e5neA6O?=
 =?us-ascii?Q?O899zarKvsh8+TsJBYPkwssAt2eUtfq4htSYwLNlqHrBvtinKs+9BXiRijXr?=
 =?us-ascii?Q?5gjJ3BJwe7/OplK3jCoct+C1Coridgr+oOGkD2sH0+N1NI3YLC69duIvBXYb?=
 =?us-ascii?Q?ycNstG3gf+hdis3LUezgSXz3fhKTl0RdVf8g+CFVFUMzIf178Bwrc2PGpCOs?=
 =?us-ascii?Q?bTUUODHqZwXjIItOf2M8e77pWjQEi2Sfazyj++KFt+gkGx9iddQUksRtG6bE?=
 =?us-ascii?Q?KIuXlSc5bB7dyYHpiuUIU0xjxqWWDvN8V1IsC5hn+mqDIyWnwjFPruWQqMuA?=
 =?us-ascii?Q?aVBdf193SpqMfrUloPi+qT8azic56jc7pK5DX7J/luQqaVi1EBksdtjNBF3K?=
 =?us-ascii?Q?JS68DfNB0N6hFhS1aa2f6yPGNJiAILhfZWAkcV86oHr5WZ/KGhkgazv64Kul?=
 =?us-ascii?Q?Zo2KHLEs4o5T6tjjC7vaAIY/2wVNxWL8qHyo0hcKT6+ow6mdD/iuFX6tEcWZ?=
 =?us-ascii?Q?UrLIGT7t0h8B+P+U2dhMyCev8jrSapPu2VKRPHUeIfyGhCFsbvdLdmjNt31q?=
 =?us-ascii?Q?rKIwrnCZiKMHTcp5TYJoYLO4nmP1mXYyAmt8rGEe0Hi2XbT472B/0vD8+LX4?=
 =?us-ascii?Q?L3qQEoz+mX3nDPqeCC530pprh76jKfSi+4gcJSjEEuEfpNZ6IqCDiIlng8Gi?=
 =?us-ascii?Q?H/4C3AKBtF7BKRZ6wuVVImqVMHn+L2PS6AklDZKH+8nbQIZE6bmE4Sf0l8dw?=
 =?us-ascii?Q?WWN7BN6krWJxeC9DEjbGsRhzPwP5J3vboYQQUkzWgX/NM94FX5P8Y/6lOYS8?=
 =?us-ascii?Q?H/eAtm79PgZf1V9IRt2xmgvle0zXHS68CpJoN16MjdAvP3arfw6QMMyq5Opc?=
 =?us-ascii?Q?YurirwPigDbRkSnGnhd2Js5AkO7HpUHmleD8cvcxfKUQtCSYBaOXuafKSGJi?=
 =?us-ascii?Q?kw8NARAeDCYbAthoBiqMH3AVZC4upv0IDAWTC0J1VH57f+Rv7Huj8zy8mBQ8?=
 =?us-ascii?Q?ErfE+1qhOSoNgUY1Ywf6z7xs4jpjqRDwhtvRpM7J+8ZXiJcfyrTOs57U0spL?=
 =?us-ascii?Q?meQh74dPXFSQ4RJ+KLokGIhHHuGvqzBfYu8iSQtvVreFJ+qjUy288pE/1HV5?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZBJ2Sfx9EIGbWNsvpAy0u1/aHtQgHWw/oeXeNF6PeT8uhOSyBJM2wGN0/aD92SKkst2YVdOw/zFm9d8WcHFdRVjc9mzUwGwmlpm1o9xvDhmoSi3EBaKhN7PPzAtBQRU6o48cDUEuAh4rlbO8gLfzcCEUCmvhBlL7CAfdbaGXdOZ0SnEtC8tlYwAkUdi2hoWB1InFz8zYGdrX+5Y/MxrAUwLXYzvFAgWCot7rAlowFJ9QyITNI9panEsLDC5W/8goZlDKPYbK16XjJrQOYBk/lGqJQ/98Lql9QPJD2/Qo0AtrX6GBlAyJVfbIG5Xlrk3Jpk5v6wnaHHwbOApGeBitUkVZKaXfmOZG/vLePqhPA9nQoCRbZKCysLYVErWpuX+o5Ih9Dl2o3Tr9C766Sj94ofpKo+ICBixUDEph0LOrvikwHNL2T8gwCn6AIjlENs8Sh+MxsoTkQh5HIV3L3iCAtJXnGSJsgPUaUf2vh8X2E6QsTPL4eSI61lWp3DTmqgvZt64CS3Do00QQ0KEGyzaTlEBNrk51x074HqUzQsJqCwxbBbf5fNtYRJOe6UzkQbV4kIddXhYqAmRh+2XTIMEluazbBaaNeEB02S2IaYbvafE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce2bfe3-4396-4b24-ba05-08dd87f48ecc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 14:37:39.4832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meAHh7CyHsC9KcK7FYtb0icMlmdolJVA3aNfahparYbCIZT0GZkmzJWVNFsC6aEcVlIP/DXHbVQjVumEIMoZlqyi9JKYpDAKJMXSxKGiXys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6809
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504300103
X-Authority-Analysis: v=2.4 cv=MIZgmNZl c=1 sm=1 tr=0 ts=681235b8 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=jqMWM6XrBOpAZaROMVcA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: b8KBfItfPMs62VIOF4vSfkvKeTKb_OAC
X-Proofpoint-ORIG-GUID: b8KBfItfPMs62VIOF4vSfkvKeTKb_OAC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEwNCBTYWx0ZWRfX00RKzmBP1qKx Hk1gOJBqRVueZbBvgCAGB7J1LZMYLeObEJHAyp/80nfl+cKsMyaXZaMUFIFMj38d3vsj05nO9lb YBSs5xo07edxZM6oM0c1DK/WPsV4ZK+tML+pKC/7rhn9oqahc66e0B35mXtDjn/w+pWTAs+r/a8
 Vv+rUL9yPnHaUl3QtFGVmFe60V98/m5jISmbdAgNoYW7+QgzmlOpyJMpEMF9m4RQqRs02c2qJzS W4SKcNzu1wMWSqVy2Y+J4hCzp9i6doVkPHDRG7Ktz0sF/Ql/9xe/Z+7RAbtiyqomgXCkT5+6saz Q4Hrc7jBNGwxTHgFrgX4D/TAqFHq59c/ZnW4r1PW7//StlvK6Wvh5O5yENivV57yHPUVj9hmQcY
 T3n1cJ+6x568DjP2gH9Mqg60PjLjWKvJYfSApoMkUfLg2Ibv1WV8V800TqPFxBSer5gjlZnZ

On Wed, Apr 30, 2025 at 11:55:12AM +0530, Dev Jain wrote:
>
>
> On 29/04/25 7:22 pm, Lorenzo Stoakes wrote:
> > On Tue, Apr 29, 2025 at 10:53:32AM +0530, Dev Jain wrote:
> > > Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
> > > Architecture can override these helpers.
> > >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 38 insertions(+)
> > >
> > > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > > index b50447ef1c92..ed287289335f 100644
> > > --- a/include/linux/pgtable.h
> > > +++ b/include/linux/pgtable.h
> > > @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
> > >   }
> > >   #endif
> > >
> > > +/* See the comment for ptep_modify_prot_start */
> >
> > I feel like you really should add a little more here, perhaps point out
> > that it's batched etc.
>
> Sure. I couldn't easily figure out a way to write the documentation nicely,
> I'll do it this time.

Thanks! Though see the discussion with Ryan also.

>
> >
> > > +#ifndef modify_prot_start_ptes
> > > +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> > > +		unsigned long addr, pte_t *ptep, unsigned int nr)
> >
> > This name is a bit confusing, it's not any ptes, it's those pte entries
> > belonging to a large folio capped to the PTE table right that you are
> > batching right?
>
> yes, but I am just following the convention. See wrprotect_ptes(), etc. I
> don't have a strong preference anyways.
>
> >
> > Perhaps modify_prot_start_large_folio() ? Or something with 'batched' in
> > the name?
>
> How about modify_prot_start_batched_ptes()?

I like this :) Ryan - that work for you, or do you feel _batched_ should be
dropped here?

>
> >
> > We definitely need to mention in comment or name or _somewhere_ the intent
> > and motivation for this.
> >
> > > +{
> > > +	pte_t pte, tmp_pte;
> > > +
> >
> > are we not validating what 'nr' is? Even with debug asserts? I'm not sure I
> > love this interface, where you require the user to know the number of
> > remaining PTE entries in a PTE table.
>
> Shall I write in the comments that the range is supposed to be within a PTE
> table?

Yeah that'd be helpful I think thanks!

>
> >
> > > +	pte = ptep_modify_prot_start(vma, addr, ptep);
> > > +	while (--nr) {
> >
> > This loop is a bit horrible. It seems needlessly confusing and you're in
> > _dire_ need of comments to explain what's going on.
>
> Again, following the pattern of get_and_clear_full_ptes :)

Yeah, see discussion with Ryan :>)

> >
> > So my understanding is, you have the user figure out:
> >
> > nr = min(nr_pte_entries_in_pte, nr_pgs_in_folio)
> >
> > Then, you want to return the pte entry belonging to the start of the large
> > folio batch, but you want to adjust that pte value to propagate dirty and
> > young page table flags if any page table entries within the range contain
> > those page table flags, having called ptep_modify_prot_start() on all of
> > them?
> >
> > This is quite a bit to a. put in a header like this and b. not
> > comment/explain.
> >
> > So maybe something like:
> >
> > pte = ptep_modify_prot_start(vma, addr, ptep);
> >
> > /* Iterate through large folio tail PTEs. */
> > for (pg = 1; pg < nr; pg++) {
> > 	pte_t inner_pte;
> >
> > 	ptep++;
> > 	addr += PAGE_SIZE;
> >
> > 	inner_pte = ptep_modify_prot_start(vma, addr, ptep);
> >
> > 	/* We must propagate A/D state from tail PTEs. */
> > 	if (pte_dirty(inner_pte))
> > 		pte = pte_mkdirty(pte);
> > 	if (pte_young(inner_pte))
> > 		pte = pte_mkyoung(pte);
> > }
> >
> > Would work better?
>
> No preference, I'll do this then.

Thanks!

>
> >
> >
> >
> > > +		ptep++;
> > > +		addr += PAGE_SIZE;
> > > +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> >
> >
> >
> > > +		if (pte_dirty(tmp_pte))
> > > +			pte = pte_mkdirty(pte);
> > > +		if (pte_young(tmp_pte))
> > > +			pte = pte_mkyoung(pte);
> >
> > Why are you propagating these?
>
> Because the a/d bits are per-folio; and, this will help us batch around
> can_change_pte_writable (return pte_dirty(pte)) and, batch around
> pte_needs_flush() for parisc.

Understood, thanks!

>
> >
> > > +	}
> > > +	return pte;
> > > +}
> > > +#endif
> > > +
> > > +/* See the comment for ptep_modify_prot_commit */
> >
> > Same comments as above, needs more meat on the bones!
> >
> > > +#ifndef modify_prot_commit_ptes
> > > +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> >
> > Again need to reference large folio, batched or something relevant here,
> > 'ptes' is super vague.
> >
> > > +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> >
> > Nit, but you put 'p' suffix on ptep but not on 'old_pte'?
>
> Because ptep is a pointer, and old_pte isn't.

Oops :P :) sorry, this is me being a little 'slow' here... I missed that. Carry
on then :P

>
> >
> > I'm even more concerned about the 'nr' API here now.
> >
> > So this is now a user-calculated:
> >
> > min3(large_folio_pages, number of pte entries left in ptep,
> > 	number of pte entries left in old_pte)
> >
> > It really feels like something that should be calculated here, or at least
> > be broken out more clearly.
> >
> > You definitely _at the very least_ need to document it in a comment.
> >
> > > +{
> > > +	for (;;) {
> > > +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> > > +		if (--nr == 0)
> > > +			break;
> >
> > Why are you doing an infinite loop here with a break like this? Again feels
> > needlessly confusing.
>
> Following wrprotect_ptes().
> I agree that this is confusing, which is why I thought why it was done in
> the first place :) but I just followed what already is.
> I'll change this to a simple for loop if that is your inclination.

No, I guess let's keep it as-is, Ryan pointed out there are perf considerations
here. This one is a lot less egregious.

>
> >
> > I think it's ok to duplicate this single line for the sake of clarity,
> > also.
> >
> > Which gives us:
> >
> > unsigned long pg;
> >
> > ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> > for (pg = 1; pg < nr; pg++) {
> > 	ptep++;
> > 	addr += PAGE_SIZE;
> > 	old_pte = pte_next_pfn(old_pte);
> > 	pte = pte_next_pfn(pte);
> >
> > 	ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> > }
> >
> > There are alternative approaches, but I think doing an infinite loop that
> > breaks and especially the confusing 'if (--foo) break;' stuff is much
> > harder to parse than a super simple ranged loop.
> >
> > > +		ptep++;
> > > +		addr += PAGE_SIZE;
> > > +		old_pte = pte_next_pfn(old_pte);
> > > +		pte = pte_next_pfn(pte);
> > > +	}
> > > +}
> > > +#endif
> > > +
> > >   /*
> > >    * On some architectures hardware does not set page access bit when accessing
> > >    * memory page, it is responsibility of software setting this bit. It brings
> > > --
> > > 2.30.2
> > >
>

Thanks, Lorenzo
