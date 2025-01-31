Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5B91C2DB0
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738326806; cv=fail; b=Zcjn7iYFJWDDvmKopenrZficzi9CAEjgA1SVtbXaZir2ts1iLR8KpB3pWJlp3hMmcwPeDLeDXGrqtgixs7XetfzDQ6P5NDzL6s+6Qyb6lVLbzIijlqkKlNGs/ofYLRcEJTfQef4UA39UW0DApGRTOK3t13fYXXSeYNxxAe09WLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738326806; c=relaxed/simple;
	bh=m15AGyjdxdwqHGuiJ2hzJC4RmUa5g1LnLrtutUiGeLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hqqonXp2Yqb4TVcE/pldNINiaRbSdTLfWXAeWFseeDoex8MylDdUkOui+yaehjsKJ6aIoRAAdEkvY0MK6Y1i1SgPpivwz0R8nwncHICcGm6q4n9RnOWOvwVA+iG1Kya89BMuCQf/1WbCYAvanx1fbwVULWQkaHJTbLi1PXe/Vb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mBpgyeIV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X5Ah4Akk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mBpgyeIV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X5Ah4Akk"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VCLx3P018069;
	Fri, 31 Jan 2025 12:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=z+S1cLR+rykprtF2ipqo24V542W7qoTANuajrfG6dMg=; b=
	mBpgyeIVeJvPHAj5MHcCCcoJO1ZhGxYOjIuGmfsATyQiKGC7o930YXWRbgWgrnqV
	Lo/QfVA9pOLjBC9rP5CGKh7ZkI9rq36ZSENTLf0/T8dxU5OPp2WfNAzt5/HWcD/M
	/DJVxRuqt7ysf+MFX3VpZUpXeAXeJvxmY0WiYyskqL6C9Ee8lWn6ICLJgzsIJ9a0
	3rfHXM3OV8LgLOlp8RXP/TS35kmsEdsM03XVc0ZaV5K0M4mLnJSbQQemHNSKQ5In
	OtrtnObn6mfKDCs4U7ZXDYyjQ61vEEM/rkb2K8vOL0oPQzjO4cARvmicX2XyiO1o
	5pbvg7JMk/ax/SoE3ArxVQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gxf2r0k2-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:33:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VAGYwR004118;
	Fri, 31 Jan 2025 12:32:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gfe4vqy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:32:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdK5II6KBytX9TO8LPuNrL4ymDNZ5pFb9yZC8h3Ptdm8c1XdWqPmFzmBjD9W4NnvCV21jZ/PW6mJMSrigAOSLqggYTKybrULlUWz6W+WRntdkgRJGH7l1Ter3b9Iuw3ZpA8SVQEUu8Kdkps0A1HaqunZdJoje0SMhc0ynq6a59bM3k67/RzI58gzgGgNf/8qoG2aRgjgiTlZmESTV95i8LjoHS0LAV7RVJDCftFqz514hGbAEEs3zudlB2zN42G5gs4OBfqY17KjzC+eYlyL7oWrJ/3wFMV4AKJlEm+u1f5E4E7adiRLi9kXMmATczkd/NUxvLVR/tSJWELwUtydgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+S1cLR+rykprtF2ipqo24V542W7qoTANuajrfG6dMg=;
 b=F7P+dZfnwQFDju+J7bq6mGEN6bsGhtoCrKTvQ+JHfXMNW4c11OhrZY2Ds0Qf+G1ZCSqFnZngd8zEFnIHX7ETs4XLDLdCuX2d8pEeI392/1paHnLeq4Z2xd9hvDRdZgiyNgnRkigi74vMYQyRRNM9uTFVWBGXLEdVqGiPjXLuHqKwL8E2NGiKDwUPW8RPwyIohgbP44mmUYNuOqgecq4QuveUfcnitoOsdf6SN+X3zKSOUDfWGv7RTn/S9CV6+Jt8koKSpt5Gb5AHYA7gaChV+H7eeNODG6GioLMTAl92dLMPYGWK2YuWchMci/6eNEU/pg1Qne9a79Y6eZH7/jmFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+S1cLR+rykprtF2ipqo24V542W7qoTANuajrfG6dMg=;
 b=X5Ah4Akk3PnIkPoZqKqgprK3yStl4ojGShgZzkZH3DEHQzyqiQrOL4FjZjgybfck2vd5zMwcy39bP+kIdQoY9+jfcMjeZc1EGib+8oYCbyhCCgeg3+TyUv3Jkg4Gevy+8BNt7xbivuuiJRlazg9/PGtJlQnLPOXCcfW/wTfLuRA=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH3PR10MB7741.namprd10.prod.outlook.com (2603:10b6:610:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 12:32:10 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 12:32:10 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] mm: eliminate adj_start parameter from commit_merge()
Date: Fri, 31 Jan 2025 12:31:51 +0000
Message-ID: <bcec0cd980b373a5eb02236cb033034ce1effe42.1738326519.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738326519.git.lorenzo.stoakes@oracle.com>
References: <cover.1738326519.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::30) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH3PR10MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 483d057b-1e74-4503-a93b-08dd41f34819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b5GZdexUSvRt24kUE6o2ER6UUp4GD6ie04Ahp6G4Ad3UDjb6fVPhHKcHmTMr?=
 =?us-ascii?Q?LGRWW+obtk+XEDNIKSACYVOxvZtTR8e1ZpJDWJIr0C9h76y2xu/XblJ+Cpun?=
 =?us-ascii?Q?+wv0XiLKlD8Ml0hPJMleHeEWAJGNkYsmKe/0P8ZdxQMGfJUmVBcd8loC7yoK?=
 =?us-ascii?Q?3r3rENpkHEGmfyVqfb1aPy5K+C296ZcqgOVfrPmfVxCT/MFjdyYo3ceqPSL1?=
 =?us-ascii?Q?r4/3JBIB/L8ImXnXsV1TPNqy7CjRHA2Htj5oLIBuOEN7vjMSs6r0PhUWOXgH?=
 =?us-ascii?Q?44NygeRHrEYRoPOHMUHM7baPI8XX4wjjHGUjfS8D4WuQMozZwMPt/uLFz5lp?=
 =?us-ascii?Q?lgLkG0KzLZ8mPZish4Tx4bwYjEceeCl03Pg2Tt6IL2V688V+FT3itlGMDQJb?=
 =?us-ascii?Q?zYZGXI1AQJLYmNyis/hgoETos1qY9xRXmhNJMorafhRCT2rRD0hUMN2WpWUD?=
 =?us-ascii?Q?ajUVUvtClwv77+u1iNtfUDLosZj7GjWgp/n7Zx1iLYPbSXU7zwpYtRn4j4bD?=
 =?us-ascii?Q?MWFQfFNDu2vLlR7H7ytuWc2vVOo5ZSAeBvxXlaXChuf11hPOapU4QCY8DRbZ?=
 =?us-ascii?Q?EJwjNeTaanHypyv2PBta0ONFnHlz/zufanO32FVApfB0W7dZgDLdMIq61Nzc?=
 =?us-ascii?Q?q6tbszGbwTXOzpn1Y5tjjzmf5klN/0YvdTMhhrVC3nIhlfXrfifqdFXwHA9b?=
 =?us-ascii?Q?HNsrQfioQ/c80mmqVRBWwJMVUCE1hVzZcBfD+vcsJYY9Y7yPZ7LH4HoK2Rie?=
 =?us-ascii?Q?hSx/UOu55fZzx0j0iVfupUcnbUv92OGTOxm0Sj9YmX/X4/mj5/JUBvTrXTad?=
 =?us-ascii?Q?wc4Umph7S2DHvBCdO0YCmNzdZ12hAxDVLwU6cSw3+7A3F0xQIunBExswgQaN?=
 =?us-ascii?Q?3t0LNgFZzNR8wlSam6Uhq1oSre+s0hm04LXgNIbOd6AO1YzdasTY6DG6wQDi?=
 =?us-ascii?Q?pZuQjHvA8j4x+zuZdRWM9R78Kl9891HuE2JA+jHf+UD0AOGNEcFykpbzEZ7h?=
 =?us-ascii?Q?VZzbrwNQ0YHVO9Ohls2C+e8NJ/yTtnSyCi0WJxzvvb4TKaA+dJnpeBt5tFtl?=
 =?us-ascii?Q?ma6DHHreSUH99oNotvQGAcfUsBAZXZGvsroZIIWPEB7PYMSNC3Pp3AaFu9ZL?=
 =?us-ascii?Q?giV4DsMWD6MrjgeiApug8s9oKIbU/md9CZePFaivy4/0WsZqROas6Np/ginL?=
 =?us-ascii?Q?Qb+WUjr+DAWCY1Xcks7SY3PRKTmgqhYSMQKVq4SpV7ZkGJXllHXjVM1Bh5HC?=
 =?us-ascii?Q?9ix2H3b42T4ePhD+qc1z4Ive2vS1Aa24Hd5OxeqXvSLoY0ewRCH+g4pGXjhB?=
 =?us-ascii?Q?Xy2D35p4PBXQYTtQ5YJVvN7Q9Mw63Z2FZWJ/ESQZa2jQoy/o2NMo9NGHppB3?=
 =?us-ascii?Q?drSHrV8RNcNd6s6wiHAYPWp5TZ7c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YqpjoQH3kNRdlSR/vCTYTvSIlr1JKSag/9lZ5d1KeYIIL8ZZTy1n1MZlJ7ZF?=
 =?us-ascii?Q?rqJGIvPrxyG3ifeZuyMGg1jeDtu8V1qHFlUbffe49A+g0GzJsoKuSwIHyu/9?=
 =?us-ascii?Q?jpNEFrSh3j+Vlk23zEC7Ba45wXd0PA49cxns2j07X9cU32UvjGrCSgnCBas7?=
 =?us-ascii?Q?kGYKpp5SJ45O+dydOChKBDhThjiF22CqiZ33/vcIVPgfaB2+KSTXLlxIK8lX?=
 =?us-ascii?Q?SJcLBH9/IkFUC9aIwW9h7I2uSyn4CZToNDKvZxkLDoKSNAA7hp+EB+3AxdUZ?=
 =?us-ascii?Q?7uVqkUhZqyQ4rHuE2kHnXCPwfrA0MnjIa0uVoPZ/nawSiew93Bvf7+0/+YmE?=
 =?us-ascii?Q?AAV2J9GJuJxsW84SrFjlfEC/vLc5MYVffEaDbAn9LI++vgPYiBaJoJAZDhzv?=
 =?us-ascii?Q?lKOa7uRkQvMRPTnJge4PDhJ6enfergZZJvTALQUW6KAgHoJDgxoJCwKigFwe?=
 =?us-ascii?Q?ElL7ZxY6iyC79kbwFi9j/OOEVXAXy6raS6Moay1tDP/3AsxN47Ld7R9lRJFA?=
 =?us-ascii?Q?CZ4kq6sPeXpAjCZirsHVd/TXI3hfrM1chi+S/GBbCw5dl9zk+bqcJxgwvEDA?=
 =?us-ascii?Q?0De9bw1Ny+bJjrs6zRxnh/R1rdb9096NK8U1jYNp0EgkNkBykAiEJXfOpk/O?=
 =?us-ascii?Q?vYkKmMggn29G0USrY7jSvGSG1oq2jqgINmotWqt5rHOeEANbFVWTs35EaA3G?=
 =?us-ascii?Q?yWzS1125ry2/QcHlZ57QUXIdqegBH3KZx9kdbmiOenoyg2ly+6QLiJqDU12b?=
 =?us-ascii?Q?TuPQD4wqCxydJFe4RqvsnIgWFc71XEirDE7bN+nBkDkycTN+Lo0jfgYSsTzz?=
 =?us-ascii?Q?MYAwME5i2b6nu7uyuvllYH+OZvdqYgXFU5KbTvyKsbMofvTh7B2JdR5txWBG?=
 =?us-ascii?Q?LGnOuSjkjODOs8ecL3dBhlT0Ts7JtInzL06eccnXhtZj6tV4eGsLnMbP8uo5?=
 =?us-ascii?Q?QBwYfm9U7ZEXGkTyiDOMUEeF+yv1ZuAT2CDmxochv06rTj8rbtz3y+vnN2V2?=
 =?us-ascii?Q?x7xruVkN/UzHgjlZWdxcd6FhlQXuBH7pcridTi7cxZVFNXKDo1a5S/Y2nbZs?=
 =?us-ascii?Q?qqheljtuLHnsLYtNCMcQ0ckfQSeQU/4m8s4txZ8K/L+2N0MUtjmsfcMfNTJO?=
 =?us-ascii?Q?r8tObi6ST2o34ip1u3nrvJLK9+6dwu5Ofq3hZMNttziQidzuesG9kCbx08sp?=
 =?us-ascii?Q?2vVfaEIwOcQRAO0DWVbUuJ5Zrdm0xT8dDQBcM6yAiq87VCgVWI5FPrrG0Zk9?=
 =?us-ascii?Q?20zG/FhR/9xu2c4V6KdTGH6DXh49k4d2OpoLpudP7xCIrI7yMz6FrYzA4LvM?=
 =?us-ascii?Q?/5yxEOmi0VG+TdG7jJsnZ+RPbUIG9A25NvQiagN7IyzIwl94eKt9r9J3gehV?=
 =?us-ascii?Q?ZHO4cKjsvRdCtdp92Hpu/ydR18stqjUqxGkrE+K4xO758gkCRHrgjorAWtJx?=
 =?us-ascii?Q?zKQQKkOjysInJzOh9t9xtUz0KmbTVxvn6LcgVHS3pdmV4Y0NA77JGlzCxVZX?=
 =?us-ascii?Q?iBbvuejsHDez3nyGk9U94Qu6heRUcNZnna4xpk2p+RixdDlbLGQTCsaIDM2E?=
 =?us-ascii?Q?4yh6r8Klx784AnamS+IwkX0HrFYpHPUycWmly6w3czzt2NtSS4SGKoll+3nO?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EskvSMMsP8hPoX/qgIPH6sem9BRcmLi+YA63+d/3K4oq+ChHwhkgD4kqLtcWTe/LVgNs4BBrKi0PxcAANN+HFj5eq0lx/7POqUIhR4rWY7leHxSDdGRcmmMGk2l/1vZVmYit7G0C07S+RkFX1SH06gVRVTKInQOqa6YHVSIhVK4qTdWuSmg53i9/ghSzuBbcQaIsWcA/3RuL0qt1D3j0M34ESeeQPLupy1SPPsDWmsrd9k2Ktytzdcvplc0cPnwGqtm4ckIZGoZCitRYQQvobUTPccm2s4VxT2rOgkAb3r326FnvLtVZuOmIrG+nc/ByH3WqmNPf/Yz1aZo0M8+Bb+4xZd4sY3x23bqHLmBeVA0MoYT8gRVDzDMvX5bRvUtV3+PK35QvoxF6TaXL/zWp+9n17pw93KW28F2YeC/yITojoz2HAZbxhapOmYiCoo9jxFTwxwmkWJjlVpjvKP+qAP0DC7tZlCgyB0pIT4evaQTrhfcjmTG/SdvBZ5zdQDB7bQ2MKsO8TkIas9u8VbEunzHjiW7pRqFHV8B2tZRui9WS+gaTiaXIM1qn4Ep6RZa5nL3He+F4u1QE/VavUAxKJAENgyhQxUXJ2IJbPf70JUA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483d057b-1e74-4503-a93b-08dd41f34819
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 12:32:10.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhzeqBOO2HQIP3QQsFtbrpAgEU1GVkLINRsM2O+hB3KesJuh/+lGeNxQE6UJ2raUvz8Sg090Y2Z8ZLISO4X7fkHF+ZmSHcWIQKKAdCDMJiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310095
X-Proofpoint-GUID: U3_Wapqv64IokQm-sV8xIWLp98NMyN1C
X-Proofpoint-ORIG-GUID: U3_Wapqv64IokQm-sV8xIWLp98NMyN1C

Introduce internal vmg->__adjust_middle_start and vmg->__adjust_next_start
merge flags, enabling us to indicate to commit_merge() that we are
performing a merge which either spans only part of vmg->middle, or part of
vmg->next respectively.

In the former instance, we change the start of vmg->middle to match the
attributes of vmg->prev, without spanning all of vmg->middle.

This implies that vmg->prev->vm_end and vmg->middle->vm_start are both
increased to form the new merged VMA (vmg->prev) and the new subsequent VMA
(vmg->middle).

In the latter case, we change the end of vmg->middle to match the
attributes of vmg->next, without spanning all of vmg->next.

This implies that vmg->middle->vm_end and vmg->next->vm_start are both
decreased to form the new merged VMA (vmg->next) and the new prior VMA
(vmg->middle).

Since we now have a stable set of prev, middle, next VMAs threaded through
vmg and with these flags set know what is happening, we can perform
the calculation in commit_merge() instead.

This allows us to drop the confusing adj_start parameter and instead pass
semantic information to commit_merge().

In the latter case the -(middle->vm_end - start) calculation becomes
-(middle->vm-end - vmg->end), however this is correct as vmg->end is set to
the start parameter.

This is because in this case (rather confusingly), we manipulate
vmg->middle, but ultimately return vmg->next, whose range will be correctly
specified. At this point vmg->start, end is the new range for the prior VMA
rather than the merged one.

This patch has no change in functional behaviour.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/debug.c              |  8 +++++--
 mm/vma.c                | 50 ++++++++++++++++++++++++-----------------
 mm/vma.h                | 10 +++++++++
 tools/testing/vma/vma.c |  2 ++
 4 files changed, 48 insertions(+), 22 deletions(-)

diff --git a/mm/debug.c b/mm/debug.c
index 60c6f1134383..e1282b85a877 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -267,7 +267,9 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 		"uffd_ctx %px\n"
 		"anon_name %px\n"
 		"state %x\n"
-		"just_expand %d __remove_middle %d __remove_next %d\n",
+		"just_expand %d\n"
+		"__adjust_middle_start %d __adjust_next_start %d\n"
+		"__remove_middle %d __remove_next %d\n",
 		vmg, vmg->mm, vmg->pgoff,
 		vmg->vmi, vmg->vmi ? vma_iter_addr(vmg->vmi) : 0,
 		vmg->vmi ? vma_iter_end(vmg->vmi) : 0,
@@ -281,7 +283,9 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 #endif
 		vmg->anon_name,
 		(int)vmg->state,
-		vmg->just_expand, vmg->__remove_middle, vmg->__remove_next);
+		vmg->just_expand,
+		vmg->__adjust_middle_start, vmg->__adjust_next_start,
+		vmg->__remove_middle, vmg->__remove_next);
 
 	if (vmg->mm) {
 		pr_warn("vmg %px mm:\n", vmg);
diff --git a/mm/vma.c b/mm/vma.c
index 206e3523cf38..3fe264200b79 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -632,29 +632,44 @@ void validate_mm(struct mm_struct *mm)
  *
  * On success, returns the merged VMA. Otherwise returns NULL.
  */
-static struct vm_area_struct *commit_merge(struct vma_merge_struct *vmg,
-		long adj_start)
+static struct vm_area_struct *commit_merge(struct vma_merge_struct *vmg)
 {
-	struct vma_prepare vp;
 	struct vm_area_struct *remove = NULL;
 	struct vm_area_struct *remove2 = NULL;
+	struct vma_prepare vp;
 	struct vm_area_struct *adjust = NULL;
+	long adj_start;
+	bool merge_target;
+
 	/*
-	 * In all cases but that of merge right, shrink next, we write
-	 * vmg->target to the maple tree and return this as the merged VMA.
+	 * If modifying an existing VMA and we don't remove vmg->middle, then we
+	 * shrink the adjacent VMA.
 	 */
-	bool merge_target = adj_start >= 0;
+	if (vmg->__adjust_middle_start) {
+		adjust = vmg->middle;
+		/* The POSITIVE value by which we offset vmg->middle->vm_start. */
+		adj_start = vmg->end - vmg->middle->vm_start;
+		merge_target = true;
+	} else if (vmg->__adjust_next_start) {
+		adjust = vmg->next;
+		/* The NEGATIVE value by which we offset vmg->next->vm_start. */
+		adj_start = -(vmg->middle->vm_end - vmg->end);
+		/*
+		 * In all cases but this - merge right, shrink next - we write
+		 * vmg->target to the maple tree and return this as the merged VMA.
+		 */
+		merge_target = false;
+	} else {
+		adjust = NULL;
+		adj_start = 0;
+		merge_target = true;
+	}
 
 	if (vmg->__remove_middle)
 		remove = vmg->middle;
 	if (vmg->__remove_next)
 		remove2 = vmg->next;
 
-	if (adj_start > 0)
-		adjust = vmg->middle;
-	else if (adj_start < 0)
-		adjust = vmg->next;
-
 	init_multi_vma_prep(&vp, vmg->target, adjust, remove, remove2);
 
 	VM_WARN_ON(vp.anon_vma && adjust && adjust->anon_vma &&
@@ -738,7 +753,6 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	bool left_side = middle && start == middle->vm_start;
 	bool right_side = middle && end == middle->vm_end;
 	int err = 0;
-	long adj_start = 0;
 	bool merge_left, merge_right, merge_both;
 
 	mmap_assert_write_locked(vmg->mm);
@@ -858,11 +872,8 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		vmg->start = prev->vm_start;
 		vmg->pgoff = prev->vm_pgoff;
 
-		/*
-		 * We both expand prev and shrink middle.
-		 */
 		if (!vmg->__remove_middle)
-			adj_start = vmg->end - middle->vm_start;
+			vmg->__adjust_middle_start = true;
 
 		err = dup_anon_vma(prev, middle, &anon_dup);
 	} else { /* merge_right */
@@ -891,12 +902,11 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 			 * IMPORTANT: This is the ONLY case where the final
 			 * merged VMA is NOT vmg->target, but rather vmg->next.
 			 */
+			vmg->__adjust_next_start = true;
 			vmg->target = middle;
 			vmg->start = middle->vm_start;
 			vmg->end = start;
 			vmg->pgoff = middle->vm_pgoff;
-
-			adj_start = -(middle->vm_end - start);
 		}
 
 		err = dup_anon_vma(next, middle, &anon_dup);
@@ -905,7 +915,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	if (err)
 		goto abort;
 
-	res = commit_merge(vmg, adj_start);
+	res = commit_merge(vmg);
 	if (!res) {
 		if (anon_dup)
 			unlink_anon_vmas(anon_dup);
@@ -1079,7 +1089,7 @@ int vma_expand(struct vma_merge_struct *vmg)
 	if (remove_next)
 		vmg->__remove_next = true;
 
-	if (!commit_merge(vmg, 0))
+	if (!commit_merge(vmg))
 		goto nomem;
 
 	return 0;
diff --git a/mm/vma.h b/mm/vma.h
index 7935681a2db8..e18487797fa4 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -120,6 +120,16 @@ struct vma_merge_struct {
 
 	/* Internal flags set during merge process: */
 
+	/*
+	 * Internal flag indicating the merge increases vmg->middle->vm_start
+	 * (and thereby, vmg->prev->vm_end).
+	 */
+	bool __adjust_middle_start :1;
+	/*
+	 * Internal flag indicating the merge decreases vmg->next->vm_start
+	 * (and thereby, vmg->middle->vm_end).
+	 */
+	bool __adjust_next_start :1;
 	/*
 	 * Internal flag used during the merge operation to indicate we will
 	 * remove vmg->middle.
diff --git a/tools/testing/vma/vma.c b/tools/testing/vma/vma.c
index 7728498b2f7e..c7ffa71841ca 100644
--- a/tools/testing/vma/vma.c
+++ b/tools/testing/vma/vma.c
@@ -159,6 +159,8 @@ static void vmg_set_range(struct vma_merge_struct *vmg, unsigned long start,
 	vmg->just_expand = false;
 	vmg->__remove_middle = false;
 	vmg->__remove_next = false;
+	vmg->__adjust_middle_start = false;
+	vmg->__adjust_next_start = false;
 }
 
 /*
-- 
2.48.1

