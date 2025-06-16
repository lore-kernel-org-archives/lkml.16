Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D41289375
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099446; cv=fail; b=gvjXtRdNjOVR3OaehlBNthBQNlAusz2x5a4EyLelDEXVRco/i6rn0nZt9Y7GhgDs11dBwxD3ReLtEeY6ymw7Vy3cWumTH8sKheo0FuFvQsw2QA4xMh6gcBIkFWXq8r+QJ+fVvWFU4f1IsxzPN/AARq35m40vNBKtivS2/0Xylf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099446; c=relaxed/simple;
	bh=JZZqVYt5YlSYoFt9R/kMQ+65Nu17KA9PfDUeexVHCIs=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=fl70JQkos5kDBugvbm0EXHUTyE5VDStKIDyy6ReEC36Jd5sk6U6y8P7jLZX/XoEpyJ3TxkUxGyFJ/g3Y8i2/eagfNv9PJdpbVnCJJWioyIXPBtGx15L3GcaWONGKMZamL5ae1hLDzHgglFiKkSMpN0mj8Flzl1+0Ql7kHsLH9oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qRfowVtp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eYdlUOcr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qRfowVtp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eYdlUOcr"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuWOm025024;
	Mon, 16 Jun 2025 18:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JZZqVYt5YlSYoFt9R/
	kMQ+65Nu17KA9PfDUeexVHCIs=; b=qRfowVtphl4zIdiUYH4alcoSHgLq0fHww9
	VaGjKdjL0mr0RXU2jlYElLJyvACvkfVqxuzrKVG0Q4Py1JO1SZvzmnsetdcTEIhi
	JunirvbXdyRsPXFSBm66gQmv5/lSbRHjio/G3FOsvAP4ageP5z4hLJ2h6LcumEqS
	K9FZOMbrSw8zrpYAz0WWZEN93oPvA6GfA8PGnDpQCwNdPTI+pp6SstexhK1Rj9w1
	JEJTEsnExWrm+LNscsMDf4IiXXmgQuVmH4t3Dj7ietZP50zLMXG5wrBZDb/F1HKx
	aFR9PzeD1aYX5aAF8c7H1CbyH5GBVy+SfUwtumnYIdU/RpZvhteA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd3gj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:43:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHgZEl000831;
	Mon, 16 Jun 2025 18:43:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh89xuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:43:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xe5e7m7U3SSEvk2YEHEf64xu46uJELdDXiYHISDXuccfhGZPPGLrLm95dX4tnlwdb+w5sCKn4pzCWAe7gTG3GnmddOteDbw+a4Fv8Qyx8EZZcnEawu69OGPHdWXiQV5uVhE7A8aDzdTEYye5JH8j6QhXrg8Ki7xLQVkzoviTyZVsM1de8odvw6ISmzvbuanhNYE06U3e9T8OlsdzuEtQbsbX4NgmbjbWhsXacfCpnIr/qdc/6l/0tuuQT/mm7nBbp15HSV2DDzkKHZC//Zw+AswdzwmKCzZi7UJG3w5k+LQWK/EL/4mmRclbXYPk/lFtndTsG5csZeqwH98/MQPSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZZqVYt5YlSYoFt9R/kMQ+65Nu17KA9PfDUeexVHCIs=;
 b=p4JpWWJ5cipDe7MmRiNk97F9lqz8H2lXMb3phlLQBdDnEFNYuLggJtj/oMmhYB6QqeRopdV1pSt/85282BE79+sJnj9p5C7om9lgP90eJvwe9CNQFoT7yMOG5QzOdHLnCppYdLX6F1HCKD8owBs9FL3O88ychkR+wKeAd2Y26jtc2X1uGRZAPZNcm/Wqa9zNC9mxNPGcDhIkcXE2qaHPil1+dnKpejX+qgMKavUPnr0AxxDNR7YldeN6+9xkMzvfL9DlPicswX1oDeUN0Ti4bYhpdyFwxYnLAj5WI3dy5WzVJvnV07Wxodt0/5hyOU+93lIbDztpqg8yWFLi8zbMmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZZqVYt5YlSYoFt9R/kMQ+65Nu17KA9PfDUeexVHCIs=;
 b=eYdlUOcrIBU6OOzypoiHGY00bqWZh80P2X6Vkm54U8MxlK3kN9JT0R/mqhUTiGE2d0WOwHYsolq7qE/Px9CE1WYbKqH61u9nlpwptLPsyqWZ017CH5QawB7D3biu/J1n4Aao5kzoDOShuxODowOFV7KNfO7Q64G0BaceZtk7K2A=
Received: from CO1SPR01MB0016.namprd10.prod.outlook.com
 (2603:10b6:303:15f::20) by SJ5PPF73A72B96A.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7a8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 18:43:34 +0000
Received: from CO1SPR01MB0016.namprd10.prod.outlook.com
 ([fe80::16ac:12c3:7112:db4f]) by CO1SPR01MB0016.namprd10.prod.outlook.com
 ([fe80::16ac:12c3:7112:db4f%4]) with mapi id 15.20.8722.027; Mon, 16 Jun 2025
 18:43:33 +0000
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
 <5d3e4538-9757-4d6e-bed1-900c9859d860@intel.com>
 <87o6uny25j.fsf@oracle.com>
 <ff048626-f9d3-4b15-8d75-63edf3774917@intel.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, akpm@linux-foundation.org,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v4 00/13] x86/mm: Add multi-page clearing
In-reply-to: <ff048626-f9d3-4b15-8d75-63edf3774917@intel.com>
Date: Mon, 16 Jun 2025 11:43:32 -0700
Message-ID: <87ikkvwmqz.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0178.namprd04.prod.outlook.com
 (2603:10b6:303:85::33) To CO1SPR01MB0016.namprd10.prod.outlook.com
 (2603:10b6:303:15f::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1SPR01MB0016:EE_|SJ5PPF73A72B96A:EE_
X-MS-Office365-Filtering-Correlation-Id: cd725c0c-a139-471e-0d07-08ddad05b282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zxwnWFxD8yxJ1/PJPwOu6Jy/YWeArDA+RxNVMZ5MjgB/nhJM7xhgr2ePp/al?=
 =?us-ascii?Q?auwHITIeEsyU/XiL/8M0TZqI5XdbvB6tBTy+IqU3CRyjlu9xR5gagMnXxKdy?=
 =?us-ascii?Q?gccql5sHv5oXpw0rsoARnTsg4vjn9Rmyhrlr+5bSkU1THfGpn4y1BtUVbIBo?=
 =?us-ascii?Q?qI6+ia/N2z50RCWm8B3R6svmZNtpqtGONGhiiOKiiGfIPntg6wmThWH8F4nB?=
 =?us-ascii?Q?RZv+D8RyEKddi4KAbqih8i0Y2TcQ09PXIJisx9UT5FJc5sPQvOGakycPdfor?=
 =?us-ascii?Q?XkST4Ip9ciC96iUn45xfvKzoQfSmSl01y3Q5Q9uBc327c/t6g/osy4fZUXMW?=
 =?us-ascii?Q?DR/6bWrgdN5q4/dP0cy/foZYaclj4tN7fOHOX9G9q4NKCHsbvW6gjfFq1DN+?=
 =?us-ascii?Q?mf4+sDkp08Hy4SuR31KaOrmYBG+RV8AqPWaJuc5AYNfUZNoi8suSzAA1wJSJ?=
 =?us-ascii?Q?Kl8lqty7HJeR7aYefjrJfw/+DzG5cKrpKvHl5YFSHp1kAP4jSWRgqrdD1Rdt?=
 =?us-ascii?Q?8w9ZW9i6FtGDT8NrOJtZdU/6nk91QweN0o/FQUoAB6xqqq9ObSxp4MNNVsjn?=
 =?us-ascii?Q?KdQBMHaGDjJcwUpaiZ6ODbcGZPM7z1BEIqsEbRu7hqwVenk5HMM6Zoycuup+?=
 =?us-ascii?Q?EtlWsrXG8arkpE4RvMNrDYyLwfHENlmWfStUiCOw07heoq4fjMBWZV2oaBY7?=
 =?us-ascii?Q?yUP4AUVB3qUyrW4VpWVO28BWwIv219LTJwHdONIrVFzbsm3UPny9Ma9rUbXZ?=
 =?us-ascii?Q?aDy84YiC5kcsrL7umsluqMW9LLpJhlQ6KkFOlmcGnmm7vXuupRFLTmLVUwb+?=
 =?us-ascii?Q?ObdErXggra7+7pjqjFXVkxyJoZ9VgTVuZhn591g8e9jAG6L5whLdyb1O7Sdl?=
 =?us-ascii?Q?NzU6SFb422FN65Ru+kOFe6QvBi6/rPACCjiTMHXV4LKuAkRldddKUlNnJJ0i?=
 =?us-ascii?Q?sOnOlE/l9t6Qu+4JjauQdIf+xqIBGZDsJxx+UiZJcYrVPYob4kigmVqQ1gcy?=
 =?us-ascii?Q?3WHJjykiDpBhqQ3O+AU9zCu31Q9Y5bPrJvDxv15mKxp91BR3CEJJGzuCv6R7?=
 =?us-ascii?Q?NhITaQwLTjyCNerPwfqaTM1v57IjDAVIbBqk7m0wn54zXSBejQrw1NDzqDOA?=
 =?us-ascii?Q?hlSQ8AMsB/E9dVrLSdVvgA3YLlgS7DpeLT3LaOXY2d9kunYjIHGoD7LfvbH/?=
 =?us-ascii?Q?e7fzvZ5XQAuk2orZoIxFRsfc1G3Pr5dTz/v8L+xJXMCG3if3umX3rQeuq+5k?=
 =?us-ascii?Q?Qmx4zRaXcXNvOTyyim9ZUSccl24kXd68KSA28RwOKIC1lsq9xHdtmgOTrq7P?=
 =?us-ascii?Q?8D6TEzXGY4HVMNUc2XQTzgMjJQQA7FpRsfaK9wb0P8bZpZ9NZzNlcckZ0lQP?=
 =?us-ascii?Q?G5KqCiBbLGmsV37fbiHc9uVCs7bTB2TKNbF8FTNen8+JWoQcYGCuQvX7zij/?=
 =?us-ascii?Q?po8LoACdfGo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1SPR01MB0016.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oICEPpXI1tOrup/V4u7Hf5wDLOpppIppYbxxw9jSbwm9pVncsDbwFXyCdCF0?=
 =?us-ascii?Q?NpfUFM7tOp+VfsQjQsSY5ZGKGD5EA+7tkeaSV4Wa04QWk4RhUBYiB9NYFZBH?=
 =?us-ascii?Q?0Fe8u88AUVC6D5Faky03wQ3/llEn9kmB8xvlELoSUomGaPxG2MFI8XP9f7p8?=
 =?us-ascii?Q?swKJSHvdaf2mMPpdIMl99D3r1hENgG0z/t2HUlUCxKxeP10uBMlP1ArA7+db?=
 =?us-ascii?Q?xbFlqIfak10GC0zzms4tZzB/G1x3ba4oQrdoBEQ9DlHktXkUepI+Bgk1W+Kz?=
 =?us-ascii?Q?RYZHdqXCqxx93jEMSEaan3X1ApAQXfmYUjlLdFOA67DJD1zNj/XvDzCWqwXO?=
 =?us-ascii?Q?ihTaVLb5bG9gpJKOpu0PHWEXOf6WSq56OnWjDFEDPoFDDi8cdDcoTBnRebKC?=
 =?us-ascii?Q?9kZuWdP/JAkoLxXEpWYIwYtmIIiU+ODbHAa3FOzeEv4tQP6xishXkg0MG6Nb?=
 =?us-ascii?Q?dsYdLBsdgip0IxNYjiw2aWuyOzu2iKu0duyFiN0bJHXIY23I5EyJP4JRBypI?=
 =?us-ascii?Q?PLcMawzA021nnAT2SBahbD3htLtldS+5pEMKl/W3ZHrQWDQQeNC84gipSp9Q?=
 =?us-ascii?Q?g+E12cu5I7okjqFWn84J6KXeDuf5VzPG4xJTMchuReBhyiGeAHl7jkFFdzIh?=
 =?us-ascii?Q?N0gByMn6VNNacQvhpeGUVSm1+R/Dth60NCrhBdYiHpUrn62Ezn6lnG7m+XE5?=
 =?us-ascii?Q?ybJ5cH24cfKR2IDaR0n08A+Rn8PYkm/tWLxu9CfmFjZPc30XyrdRZGklJWWZ?=
 =?us-ascii?Q?+3J7nOlY/adEHuL+w5gXA5LP8JKHNq5c/C2GW3caMiWq23c2hXmNLUtOmrvO?=
 =?us-ascii?Q?u63bhOYIcTrri6h5dN1/kQTusPNJtgaS9cr1tgV1zWz+iSA1MqVg7Zjje+ih?=
 =?us-ascii?Q?EOkaoDf0z9HmADpMiqNCL4q2CWbuFLl/1c7uiBFp9A/6m051iuKQd1gXMMSr?=
 =?us-ascii?Q?CjPzGTAr6tC0m5pO8RhlIHI0V6vE9h0hW3DRg+T0+xf+a609kcv46Bz2b5Oa?=
 =?us-ascii?Q?2x5ELkv77VZIFcoQbUr/j64w2OE/+2DqoFANOwZESN+IhIHHaSgpPwwFj0IM?=
 =?us-ascii?Q?yBNQjUGbTkbBS0bvewZBFmC/C8crz7mboEOn7tRLbI2KcFs0OPi+71lfjwGn?=
 =?us-ascii?Q?ysK5Y33Z35TaTiuCs+7ES7WHm3Z+gHKn7puTTNFLdiPvo23rRGtTz/SdWAWi?=
 =?us-ascii?Q?5U0AHXm7lEN4K/Lo6PiBMDkthIv/lE540LrHwdrEfQeb3Nj7WOd3kdjYOw7f?=
 =?us-ascii?Q?Td1czB6G41KpQuzGwDYgkDUCQxzTLIUUlM1eRkkyM9QawqvVd2xOVHCV8vjf?=
 =?us-ascii?Q?UDlN1TYgtFyywdOeu5GjmMeWPhVLw3zGfsOhTVfEtMhD1T7GgQepcQqDO45P?=
 =?us-ascii?Q?K1Kyf+PZVjfGAtGDMTLBSOJ4uA6i7iDBKfR7mqL1gC/gEkhWMcjoD9Nxd6sK?=
 =?us-ascii?Q?ZQS4+KKbIA3i4QQBjs0Lv1F+nkWBiHskS29KS98DVZJMH31o+tC37gywx6Bz?=
 =?us-ascii?Q?c6gLbJuVoW1Zu/1Xh+Ia66TuSL9l1j3d7yORAQ2GVDuXZkVEtGh4em05pjjJ?=
 =?us-ascii?Q?u3laFiiA3GzASVTAqZknFFKpr533+ahaNsi41EE5Z7bX+9E6wzWLBFEQ/TNZ?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HXB8jEoRDJcku8Y25cp2ejpqbifF9X1AJmEdSUMM9MuGt2ylwWghdh0M244KugQ/ZHZxih90pZdthaD+f533jEHK69RwP554jGwTnWFwDJKdqAZUOgzuPMp4ycGyqcBVWlYC2k+TiLg7wokzahQnrm9M0yTr3LHbPBtoUoG2o5CPKJRWLFiQ8YsnWbJY+8P5oE3fuSWdk9SuXlALNktjDOINK0FBSzkEkmDxrPXyu7Poal7Ktf9QLnG/ZULwW3bstjfIb5DRSbBaCdeIfpnLzA6rL/opPJ/1UslpT/feDxsfd8z4VE8Asa+Z60Gx8jBXZ6MHy0/dkON6NukenTUXYeLMkIPy4WGqiQXyvL+VMpSNjeuELE5Xykn2ksb75/+yTFlRykv1n4fHX3dZ9sJ03ve/C1hBuffimzhaC83mjovV7bCDYf3XSHxv9zkCAkqZgraDWOriw/fHsAH2dvwAIENXaN2EJWNjJm4gAxqKsH2Fl8KbnVGQypW44YsC/Ev1gUseYjwKlKAYGkiQfZRVqAMFLE71Xepou/b8a+vycobKq+TyNgO75BTw3gutG8yK2rtY5s3ILAA563jBt6VP6hG6XnyV1A21wIX0+dwrOks=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd725c0c-a139-471e-0d07-08ddad05b282
X-MS-Exchange-CrossTenant-AuthSource: CO1SPR01MB0016.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:43:33.9488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AO89hGyHoOPc2how0b2xn/ZMiI04WcBLSWunXw9zFZp0g2DSmbETtjn418kh8GutODs53DojuAUSFXAga7Fg6Y5RxsJxKv5zKXyUflfaog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF73A72B96A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=936 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160126
X-Proofpoint-GUID: 3V59EPugHNTj9NsOVMyPb-CvOciD1IuJ
X-Proofpoint-ORIG-GUID: 3V59EPugHNTj9NsOVMyPb-CvOciD1IuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEyNyBTYWx0ZWRfX12/2TbvcqMDU 0ixrjW7DZStiHrcRkYMtK2JarpzaTIirrrnN/tHwKFEj4FX9tHrB/5VHIFtincXzf6dIhjWZTDO 8BV0p7LEhT2qn/+2TMKuIbNDDrfybmdDpfEHu1YMJKDaSbYZ2L2X+ZpGWu5/r+Qa7XIMnFVMxU9
 CN4d8dSUEuVvaLZ/KrITrZZonhDMvgXeVxqx/BPB7sr02r7D4kQglbseL+TAxSAWvw7E4oRpO4Z BhirTD0BKoxFTVW+SjGrzPWXj9o+XOPFYjaR16FJ+kdQLDYjeBEt8sKdYpLNyDt+PnlupBt//9L vnpfE7Hy7uUyu3aV2koLfKTtIqRmElULqx2KK4MM3fJdPk4rWHao/1QcgYnW56REAZuwm277xrF
 cwtplbNkN962Q5jz/Pmz9rk1A/8ukc7uRS8vsOseQ8Y6Z9ud1eAxAehZ5c2RmrdNNfj27a7l
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=685065da b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=QyXUC8HyAAAA:8 a=BqZIxHJdbPAVdJXTA5MA:9 cc=ntf awl=host:13206


Dave Hansen <dave.hansen@intel.com> writes:

> On 6/16/25 11:25, Ankur Arora wrote:
>> I'm happy to try other tests if you have some in mind.
>
> I'd just want to make sure that the normal 4k clear_page() users aren't
> seeing anything weird.
>
> A good old kernel compile would be fine.

Makes sense. I can do that both with and without THP.

--
ankur
