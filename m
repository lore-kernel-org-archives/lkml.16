Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD02A230BEF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745350380; cv=fail; b=iwyAHL7KxxP4HxpisKDkwRGme06PVEN+QOfIupK3P1t/pq9CuPMQA86tmmE3s/9d6olFj0Q1DudjANuSo4ikkqB9PNldtIB6dJ8uyum2W2BkMV1Tkf332sRp4R4OipC44nAtnvvVGFVYVBmzubfzv4p8eH3qAoHm35SG08BXqYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745350380; c=relaxed/simple;
	bh=UZ/BrW86C5WAFt4eCl7pMRytg8zQEEbNkxvgz4wueLw=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=d0eDqHykXeusfvHxA3xYJdgwmKF4hzlJKzyKYN760a1t3p3Wv4mQ55ETcVrMm0jihwth4N1ncb9S0Df1Xar1gINB3ZCx6eRv4SRhS/GZ62IhcKtB8YvTx9qgpI4JXV4oIIi2shCmBe807OBgx3dck/xHwv5tLkYS9r3ok7Er7Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SmQAWxak; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s/RYoFGN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SmQAWxak";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s/RYoFGN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MFsoVQ007685;
	Tue, 22 Apr 2025 19:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=UZ/BrW86C5WAFt4eCl
	7pMRytg8zQEEbNkxvgz4wueLw=; b=SmQAWxakkHe7d3mlp3uimWb+pJ9sVYb5uZ
	ZKef5MHzPOHwDz3DMXC2akuvkjTtW4pU1W1vgKFDVvjvqIIABDOsZ5KLjcJEXpp8
	joQbpYCL5JIkensztiA38D7Zx3Ujkz9AVz/RGIqK/K3mwdD7PGaBCv19giu9Fc4D
	9i6DkC9RKN/HiO0CyjSp1Srq6kkG2VlLuJ4XjgE/mw+CdeLbEJ+VjNX6xBYJsRcU
	wCThVewj6hx3GSUIu4o4GfgxKm8dW8RujtBYseXcHP5DF91La7OCuTyYOcNzviou
	PJ8Yy6x/LQW98TrGOvTNRXmyN/wzQZiK/VtPHKTlZ+zPYbee9TtA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4644cswbur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 19:32:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53MJIRcJ021181;
	Tue, 22 Apr 2025 19:32:27 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012051.outbound.protection.outlook.com [40.93.20.51])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429gbmah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 19:32:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjH2g3JAHScdfcDex/eppMDNhIEnKKmj0KMqiHoHupP6f3lQF2dXKXmaCFuonTf7k56dDczE7dxGFTG3b5/Tv7zQPKl5u0nHAkwZcG8xOI8QX6tFOV3Nt+M9X6K5DRsE0+315QZclTlCGebAEs0OaTvW5xOZF9VrttAveimczHIx838/SzYwH4/WX/EoOSTUfusM1NMaVR3S2ZgNOBX4twTSgC3FsQ+XDiXlKNuiFG5RTpMiqP9ikxkCIKEVsrjrMtz9r0673XNnYIFu81JfPZfsO9iDUb7n38VUA5nwexuy5V60wNpDo/UASVaLNV4U54OK05PDwqkSD6OmK+BtRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZ/BrW86C5WAFt4eCl7pMRytg8zQEEbNkxvgz4wueLw=;
 b=bmXfCY1uuMQRZ9hw4et76hwvX9CWxnYYvJPCGlrlJeA6ruPOABSqgWvJ9VsWPkayQ6zcyVJ8lNOyLg5ju3ZVwZXvg2oIZEvWWpyC0Rqipk89J14Egpb33UCTpTekaTBYMGpnc5swNnwArX7aO+m5YB406tWdmFed4OqaT9rlDd4oLSUdkpqBd7Wr2i9GOj11j2OQ15QbJ8qTIBdqM0gdR48JWQnUU6n7c5zFo2NZjJsn2vt2YcxZOgdjTaxuaFuE5XFMwyhSBdWq2dC2qNZFGt8p5cSmey4nStlb30/GeDqy9/UAclxcxDffifei4WrF4tchpaRyDyxZ6gZzxjvv/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZ/BrW86C5WAFt4eCl7pMRytg8zQEEbNkxvgz4wueLw=;
 b=s/RYoFGNurpZukYHb4LiGknP0z/oNHc9gkqKIYk3tgJOnOnqrvX0yx7yOGCl98sm/IEWfLAdyPMrZj92uawIi03IyxCJoA+UGAuoy2ImO5sIgHfcw5JUqNYgDgUSekygO8ldZrM6qaWPfS8KJeqhIBrArSUvxRA2O8yY4qetM04=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by PH8PR10MB6456.namprd10.prod.outlook.com (2603:10b6:510:22c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 19:32:23 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 19:32:23 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <AC2C5344-E655-45BB-B90B-D63C4AC8F2F6@nvidia.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
        paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
        willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
        raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 0/4] mm/folio_zero_user: add multi-page clearing
In-reply-to: <AC2C5344-E655-45BB-B90B-D63C4AC8F2F6@nvidia.com>
Date: Tue, 22 Apr 2025 12:32:22 -0700
Message-ID: <87bjsoq9fd.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::13) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|PH8PR10MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: 895a49bf-e197-4932-455b-08dd81d46818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lMuY2QX1uA+LpkkqleT9rC77QGOdPZpG2fW/maNFEUb5d+tHoGA6B6O3+Skk?=
 =?us-ascii?Q?2sYQnyxvZh3+I5T2RTOWve+wMQcKRI218c5gjxl97q62amWGctq0dooUIPWx?=
 =?us-ascii?Q?C9sPwWB4e2zBGmQWvNvSB/BMfnzOYRmDJvKDIJT/ToRho4lOLqbBBDSIkF4z?=
 =?us-ascii?Q?JhImnuhM/S0GNOeTi5nAox7VML6Nmqz45uljH/GQQE2QWeIvvtUCWtC4qKB4?=
 =?us-ascii?Q?jzVUFh8M4Awuj7BG7bRrBqBd7zUrVTi5NYbhwG6vtqbcnecUFABuMN/kq1yi?=
 =?us-ascii?Q?RnwRnlwMpPxP+lPxkm48kLc5cqHbsADbP1g6bPWrqKnnig3lzfadcjgaMp/8?=
 =?us-ascii?Q?4IAi5UAlZzuDD2njZ9H57m6yyvrV0jxmp6X21iLXnkjihu6Fj5T2UKNwE0m+?=
 =?us-ascii?Q?yEHHgmHwlZf+phKuBeHR18FhTxTPyaD0x0gYZeGT4ax3HZqYFqqojjHhZLlJ?=
 =?us-ascii?Q?AW+nyAJsuxpxJW5mpUVCmCCTXD3+sJ89+JNrIffAeFM/C+fWp8Bl06N+Fsql?=
 =?us-ascii?Q?T/p0DqV939TUnCjbmfRXdXBf4cPmFrWrkCfeyw+5KLTmWEdzbDh/uI4w7yKu?=
 =?us-ascii?Q?Z9tQkhM+iUmad4bbOAJ0bYbMAk5TKLaHQXyCE2RXrFc/kqRcwq6n8vIy7n23?=
 =?us-ascii?Q?4ge2mdRDdoozzAbHSJPas+lI41p10ClX6GBUo5GB/27b9I3rvX5NMIizjpP/?=
 =?us-ascii?Q?8YSxPTA1BMCnbP+z5FuCilTtHcglo0evQQmBLeowH30jplQtyj+W0SWwQ3s3?=
 =?us-ascii?Q?ZuszwACCoZa5TJ3v7coGl2PZwbQ7d7yW5TOAJB15I4R3x3oQbBZYgoP2JfiE?=
 =?us-ascii?Q?zpxE9WiUTPmzz4gDN6pGUZ4Ux+t/DR65K0XdE/rnOmwAEaD5UwwXK+VtliC6?=
 =?us-ascii?Q?sG8Bt6aU987Crnn7kERmX5+VUb6hUurXdE3zZbLWLillfbNO1yHNbg9LRPAL?=
 =?us-ascii?Q?OHAb0A32ml7EZFQT0iYvwc5LlSiA2CDIkh+OXhXGdCqMVJ1P7xez648kkwAx?=
 =?us-ascii?Q?YCQomahywb+LYBaIS7zj68nISNFYIFjkFXXJrLqGNoVo+sEPCWRjUBtunj/J?=
 =?us-ascii?Q?XG5ip3Tg5zxK0l6mFhzo+WwCsPrK6hyLD1saq60CAKm2JkuS7nuKlhPuZ4zi?=
 =?us-ascii?Q?jSLtxavqAuvgOiH8AOK4CZF7sqiX3RCoq6O/SNqWcFbqgx4DZ8mAc70dw59G?=
 =?us-ascii?Q?N8/ESN1iJWlo9jDJdMDO58pwoMz9ksI64n31420i/DBs3GZCJADNdsIymwab?=
 =?us-ascii?Q?ZLCY0unPhPKHwnImBRWbaFZr4svKqPbyGcMqTskEThxkwg/3FaSRzXdkHdST?=
 =?us-ascii?Q?xUa2KgAwCZDmOQhJjWZDkhsUFzvOBPOyi3cwtZZy4445575mUhj8Qpku9NUv?=
 =?us-ascii?Q?6IFd2H9FuztYBQFi4a+alohQeX4kL3h37kJUTaIKPxQbpHJmUfkwQlqZrLzy?=
 =?us-ascii?Q?jVP1uCe8s7A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oEUU1etOVt6tS1q5Pg8bruk/MGqvjqCYAPpk8+aZFPSDQg/hgnIlzUY9DVCw?=
 =?us-ascii?Q?Up7Lxrzs8zek0jj/7HkpBTjtoDa2qVzGCqkmxJV3d+lfk3XJjeaQKqfZ8WXR?=
 =?us-ascii?Q?tjSx2r1kuPQzyr+ilArUNsOp1E8WOIsGlFtK5rfZ0RGmfUSxL8Cd9Ha3K0Bf?=
 =?us-ascii?Q?z5nehMqsIGK9vsqbFWC4MVnfCSJcn2eZO2N7+8NOPKjVXfJxyt1Vt72vwpI6?=
 =?us-ascii?Q?7hVOzdkr7C39QlD4+mnytXSd/tBl/FD/0YTvA6/o1VqcwoVTH+SqT2xvyRhM?=
 =?us-ascii?Q?mPFy1leANq8iDBNphTdTcPxERZaMg8LLPhLzhn9NUbBBNLpQT8Wt8KhoRQi/?=
 =?us-ascii?Q?xG16WdUqgv7gfzRbTeTpNXn/spkfq0+F6Zd8JmTRp3324pgCs7GxuvYBVQxK?=
 =?us-ascii?Q?rkE/x62j151OKBl0yb2WGswMPnGvbRxKp77OxFlSNp0vTzs+X69/YX5VYdM0?=
 =?us-ascii?Q?P5n27LWFhSlJLBBN7ZMKaU/Bgw76ML4Vm+crZOnsooH5W7OmuT2IgTXqRygb?=
 =?us-ascii?Q?miMNL76x/0NictY6ldIfaWuIjZEX1kSoh3PKXT4bekDvlkzo7qygmKbGAmk1?=
 =?us-ascii?Q?i+pAhxCKA3+vo0+4gtJ7jCdU9fVgJuPoZO6zKXBUU3ZHbFi7EPN9pSGiAPrY?=
 =?us-ascii?Q?+M0YAaYKG20tsIcBp4nBMSjmA5PGLa8A97ykKoThWHj+cAhmYIOohOtJQAhi?=
 =?us-ascii?Q?CokKCHGvDAdByXAfmojDedZ6G6xgWUP6XydXNjk5lz2vN4n+rvFIqeetBupn?=
 =?us-ascii?Q?EAtlJ6Z9TEPUnVybyvoRBySKFZnwsKCDfQDB+WZu0p/mKrkFBuDJLHUjmasX?=
 =?us-ascii?Q?yOhrZf2SNFuQc5gBENUErcwkglHl9WJxqQMwnxDkQ6T6Bm5klx64lVVfU3WB?=
 =?us-ascii?Q?0VRC+qs/Y1cp4OI//Ffdxqlu/m2bhHe7gBQR5NCV8AFbzDB7sinAm1NwqtbI?=
 =?us-ascii?Q?Q/bPKtA3ZeMrpTu2IIdDTtw8I8n0IJyWkcQT7BPDZZHfHu+iK9xXHgB4/kTh?=
 =?us-ascii?Q?rhvLxFtjwwMPOYmg1TS8zkaDfmk6bdUnquyXvtWA9dfD+SKjwuo7HFp2EjSs?=
 =?us-ascii?Q?Lh1AO+o2GF9Kly3CfeNjSvhxVKObCaDuCtbeBHdH4nV6vKPhsAZpuQnoIuwQ?=
 =?us-ascii?Q?CRQdP78lWy3DWrBYcj/1ElWtFoc9vxUcW6C3K+6LA8Xos6tfMwRVTWr80i90?=
 =?us-ascii?Q?uB5StfWVDkF2iddlZuccStxASnw+sHOooJ/bVtzaKWXhQEbqXz5MfcqVpu0h?=
 =?us-ascii?Q?Vrn88U7FW3A9eT6xovM1LKL7a6laW037GVArO/Zn7rI9Zd7+I1D2Y9go/6Lo?=
 =?us-ascii?Q?K1Niy+z/qeYlJqJpUYcBw+VSLJgX5pQyLpT0KiG8S6M0w+PTHcgeTciOI2XF?=
 =?us-ascii?Q?gpD5HK1dSGZt6YhwAVhwjtNhQ6wB6JBGcSdrrSM0g1wvBrS6RsRJAvWlQgIt?=
 =?us-ascii?Q?xdmOAWueQPYQoYFo41qDuWc8qK+iyirX6Ipp5pKHfH8R0eMr8QjvR3XcFkvt?=
 =?us-ascii?Q?J6yTWAMaDr2WFMtFkdPZysthEqpzrAo+4q17w3uFE5fTEtmYE19TVzRjDThz?=
 =?us-ascii?Q?VnKNgkKQoTSLVmCORaJNUWbnxi9VKRkPDCACJJcTWUeLKn0vzOTTogKX80qF?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F4ywQudZfg1aumGUJ9Z5kmlo63Xwx0YgQ6y3eQ9KdTn3h+M/6Or2ROwjhq+NAqKguK8aqf3gPAXCrBvvGNIg9SNnT1JXhK7JXxO2iww3lFWjU9cxGmORXat1Yu33UNjEz/PgPoR2BlURgdo/WJUAQ0ai23zKTFi5/MgJ9nKkLByv9n9pWslvw0h6JmLos+1NK/8mhhwKbypFLiROU8y1HE/auQmvr16Qp0xrTVyGKuIICgRRv3FSuWcqmHJ6HP6O9Va7Dhds5IStR5XErE1utYwLvWg4P1sP1Wt9PqfYCB6U6vkp90+8M8XTWZW9nZ1h0GkOSsdtxmlt5uN8MkumFRiTPfWYWSuOY3dqql1gMVy+CqUB6CrLJCbmxxat5MdmHiqx9ezDqr//g1/ofJtYIRk6QpaD65IB63t4Yz/DzTyNKpJrtZ8e8EtxZrj5hzIFo1DiJwMsMRNk/C+WOuksgCDSwzpzOT02WcNJq0B652g7yZsSu1UBeVZMsnRfYxQhnq0EIyFCb2hx1by9sc7QY6xRL9MhM8/gMYhd3+CbwgMlt9o52sSw7gkuq7KywcTHC3IpSYYBBdmBU+khX/FZqKR2OcliKvXlwbYM2KFuSbs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895a49bf-e197-4932-455b-08dd81d46818
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 19:32:23.7156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZkqHT6Wwn4DXaVXveIBBkFnMuv/O0d7Gr2OsyPtNTX7C+VTnkh1pcoo2fWBkzsWECYHhIBnf0LTVRaJ6K0prXzdEMujgTB0m39hU8Gqu04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6456
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_09,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220146
X-Proofpoint-ORIG-GUID: CMsKf5vI8r9fYHhKqDfxgH67_mmGXi8B
X-Proofpoint-GUID: CMsKf5vI8r9fYHhKqDfxgH67_mmGXi8B


Zi Yan <ziy@nvidia.com> writes:

> On 13 Apr 2025, at 23:46, Ankur Arora wrote:
>
>> This series adds multi-page clearing for hugepages. It is a rework
>> of [1] which took a detour through PREEMPT_LAZY [2].
>>
>> Why multi-page clearing?: multi-page clearing improves upon the
>> current page-at-a-time approach by providing the processor with a
>> hint as to the real region size. A processor could use this hint to,
>> for instance, elide cacheline allocation when clearing a large
>> region.
>>
>> This optimization in particular is done by REP; STOS on AMD Zen
>> where regions larger than L3-size use non-temporal stores.
>>
>> This results in significantly better performance.
>
> Do you have init_on_alloc=1 in your kernel?
> With that, pages coming from buddy allocator are zeroed
> in post_alloc_hook() by kernel_init_pages(), which is a for loop
> of clear_highpage_kasan_tagged(), a wrap of clear_page().
> And folio_zero_user() is not used.
>
> At least Debian, Fedora, and Ubuntu by default have
> CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y, which means init_on_alloc=1.
>
> Maybe kernel_init_pages() should get your optimization as well,
> unless you only target hugetlb pages.

Thanks for the suggestion. I do plan to look for other places where
we could be zeroing contiguous regions.

Often the problem is that even if the underlying region is contiguous,
it isn't so under CONFIG_HIGHMEM. For instance,
clear_highpage_kasan_tagged() does a kmap/kunmap_local_page() around the
clearing. This breaks the contiguous region into multiple 4K pages even
when CONFIG_HIGHMEM is not defined.

I wonder if we need a clear_highpages() kind of abstraction which lets
HIGHMEM and non-HIGHMEM go their separate ways.

--
ankur
