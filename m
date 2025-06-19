Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCC722154B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750377141; cv=fail; b=Pqi3ookGM2y7oXS2Yb+QCZIlAO+Uq72m+uruyYsS0bhefF7U4UNh/XaJJ9TkD/e5oXzgJc7xPIWGBoYnwZdaOC3nQrppYcxYQEOarhdk6PTk31Z/7IY9KpzGWhMqOtVQANvQb3IiRE/NmicafFrp+k+5C34w/o8Zomp4/rFqyFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750377141; c=relaxed/simple;
	bh=kadmOFTTHvWqMDTk0Xz2nQrLuT8EwtB36t8Vi1LtAhk=;
	h=References:From:To:Cc:Subject:In-reply-to:Message-ID:Date:
	 Content-Type:MIME-Version; b=L6YLNoRFErh40V4wt1gh+5q/xTuAphzmiL44N97XwKZBA8FyURhfDaQGgX15yg4rsj8NJ+3wLN0+AtSnkTh28gVXVQyvq63DUYUTaz1Qspl0AInrsg3JTpGg5LRVwQOTsAoO4w7OUo0j/2NPDWHseFuwsq3/LQqQRptRVTweOBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kq25vg2d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pXtE7jU1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kq25vg2d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pXtE7jU1"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIggpF014161;
	Thu, 19 Jun 2025 23:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=kadmOFTTHvWqMDTk0X
	z2nQrLuT8EwtB36t8Vi1LtAhk=; b=kq25vg2dgqiJct30kE3CHgdzeXbiaXyrPd
	riS0ILb/Ve39w23DLaYWaCFRDAS6DHx3GNIsEyIbnQ07oBUBVt/lKpY3dtDS9oO8
	zGuAjtuaHAmnHKXjY0UmpvSO9p3gfqRcfitiPkUg1HgueHnK9WpkINGMNyDQ1ABh
	mYP1TNku0zWS6QeT+WF8bACo+xiULWInlcwIxzqB8/Hnl4pkws7joGjrj243EfK/
	zv0fuDlSyxrBqKXnoaGdCxih3USvMevfeHHP9EjyvAqQsnDrQhdd4VLNj8ylrDcf
	vSx6FCFqT6MJheaYI4Rlcm9O1UkkhNuppxdBPtTZ33yKAu9T+oYw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r9pxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 23:51:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JLrjhw009814;
	Thu, 19 Jun 2025 23:51:41 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhjuc9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 23:51:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m02WxVovuJIaN0SKMfYdYi/rUe77rfJzZJv7Dlzy3Ex9G/GiulDZtjpawijwz7w3SNlAGW1K/klrHJ8wzhK27R56b8M+VaZ2sim6wIY3XOVMnprzPYtB5DY5zOSYpB0efpYzvrVaz8upxInaR8KA/svCxcQhoYLsGKNCQCJxb1ar0R/GuoOA/6xfgiwswkAGkjQJR0WnJRQ1SX5JAvbSTjm+rJJLn8FWaxKVX2juP6trRinjw4A1fiqRK7ComNOHfZm2r6YcanzXE08s6mjl8xC/sSgQ/6/0LTDXLqa5w3uD6zafN9gvTcyJgMsxUrRveVQWH8S6fCrmrpUYXtwsTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kadmOFTTHvWqMDTk0Xz2nQrLuT8EwtB36t8Vi1LtAhk=;
 b=I5uxk++zmXWHpw4QXTQVzoOPPNjzv96eqENyOB+M0pQaQ+Yw8jK6Oo9OcPGqSfNfbaFCrkL6DctnfoRaFO3LxIwgg7cwZx01AqZKW/dvUuo8oYSWwLwnKQ9Xnx9mfkCwO5DiRvRgjcF53WriXSA8YBzQcs56Lhcq0aJ/b6EanLwhMAjQorbP7IV2ISVPg2rhM9f3ij60BMXDi3H8g/mx/DW/Zgs4PZmHObO494Mu7Htix/wbN3UpukL6SXpLLi2abU3hnUk8MMfNmK2r/JMNExhSVclLTR8d6c2qPKsaxRayQfHtBWuiS8n856Awo4YndxQEijW9IxgTDbh8KT9XNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kadmOFTTHvWqMDTk0Xz2nQrLuT8EwtB36t8Vi1LtAhk=;
 b=pXtE7jU1oiPON4Be8f+AzX6/4LluSvEp41mgg9VPcIOoL7kiSM9m82Zjza1Y4jKIHeSTqExmHnvDMV0kbk/XX1U9x6Gd1QXNImxeptA6adY2k6rKSciy84jU0f7sTGRNe9OVOT55w4Y8sXduUER7d564Hev7a/IC6seF3ERSSOc=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SJ2PR10MB7708.namprd10.prod.outlook.com (2603:10b6:a03:574::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 23:51:38 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Thu, 19 Jun 2025
 23:51:38 +0000
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
 <20250616052223.723982-14-ankur.a.arora@oracle.com>
 <1c0d3994-1397-4bc6-bb55-9c26acdcb477@intel.com>
 <877c1bwmki.fsf@oracle.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v4 13/13] x86/folio_zero_user: Add multi-page clearing
In-reply-to: <877c1bwmki.fsf@oracle.com>
Message-ID: <87h60bthmk.fsf@oracle.com>
Date: Thu, 19 Jun 2025 16:51:31 -0700
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:303:6b::18) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SJ2PR10MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a184c12-7bc5-4d17-21c7-08ddaf8c37e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DPdAsE9EZ6xE7ZBb/O+05ZgafYVFWzTzDC+Aw90orWZOrQvcxbTwM0+QCuSe?=
 =?us-ascii?Q?FO2ysvBFQCwhZ5TkRbcgrdHTZaAazDNHL1GrlqZZGemXSgjtnqMqWGyEtqHA?=
 =?us-ascii?Q?frzmKiDhcrZD/zA493MgbVml/GKx0gkdx8Fx5qF5gOoddXEaQGT5LrOQVogj?=
 =?us-ascii?Q?yedGLxBmrk9qH2IMXKORe+Ob46T62dQDnn7kCNB1Fy3YjZ350jqLdj3yB4gq?=
 =?us-ascii?Q?nhrGlLJNlAjM7ZJSAKE39F3Nv5FHnYrwD3kbZ40MU1kE1s9ppnSU9NWAVbGz?=
 =?us-ascii?Q?erKa5joO0+HTgMJT7TI3Cda19EQDa8CNDtd+fkjOF2jOWGAEHSC7OxXqnBdn?=
 =?us-ascii?Q?nIh3ySteWnbP9ZpD94G8fu5mchzfbW/49v9s0qp+ANT00QK+EyRfCb7eb09u?=
 =?us-ascii?Q?sNQRwpEJ/1MnMckJ2Thzh2qMHzFMlvZ0rEcoPzo26mve+J91kYUetb24r3Y6?=
 =?us-ascii?Q?WNvOU4/4AO0RWk8spZKE9mmHxeI8Ps6DfoL6Ym2GaZgNBTi2TftT7gMl1/so?=
 =?us-ascii?Q?zyy6YYdeqpO8neFqTA/c9t0vwJV+nvnBk+lQoTWAfq3fWyypLqqw0jrmOKjB?=
 =?us-ascii?Q?T7nwpD2jTnp8RNpNcJrbbJsPEX+8W1zqd/F7ta/F2zvWWr0If20BnMT2y835?=
 =?us-ascii?Q?CEW1oQw6XqzTymAhlKpW/48JG0vEiay1hNwofdj0h1qX6E+1bewXtbXsEhpD?=
 =?us-ascii?Q?4KKjiNFjx502yABSTH7SWU/6rKyBTDhrM2PkwauVai30K8Y3w493Cx8jIg/Z?=
 =?us-ascii?Q?Qk3LdFkESN5wcHN6AOjNzNVTFDTCSp5VtCvxLe7O2t2d4FAYv4MG57NEw5m+?=
 =?us-ascii?Q?dbNjSEEWrfhamGPTxgDqmKtOXPh4cP1gxs4n+GETYZtYbbv9Ls6rLOSxMwH9?=
 =?us-ascii?Q?YHh7HwX3lUbyHxgJuIUw4KWk0C3SDR3BmgClNKdZXa4u1DUejwMirYRmfu0Y?=
 =?us-ascii?Q?12F6Cl3KHrC4BYCufvytJFIoCQrIudTd18MYUhldGZ8udsiAlxSBkPdyFv0I?=
 =?us-ascii?Q?9FP5esFvfjI8PDYrSQ8cu9hz6NG/IP9B/l+XCK+WFR62UgGmQO1znmydQ8R5?=
 =?us-ascii?Q?Fv9n9tD/q9y6K4H+GcvZJCdZgRjcYV74CzvEaFpXni2DRLfOUQni0escQz3K?=
 =?us-ascii?Q?Eybhf36hdq+5Z8uXQl94erWDI/0OOskhQmKjAK29609OAEobi2TraBKanmVF?=
 =?us-ascii?Q?mAUq/nJRH8eD+w4tnbd3wdUQZPgDQI4hC6lPr6SU/RnXSubCfJOrEFtcWJfn?=
 =?us-ascii?Q?KELa18BVx5kzpUogLGaKSvyrbopehhEv2fhvhmgvfdrTbs0xRc0lp85dXVbw?=
 =?us-ascii?Q?G1uGzKUj85GnxaEQwQklP1wYmzrRxWV/BF6iXCapTQGZMiTZY/IKue/18j2/?=
 =?us-ascii?Q?RJzUuUlEBpyvn35pNSSjg3DL6YYT8GVLis15zsev3Ioztc69w5nsUADnAtyj?=
 =?us-ascii?Q?icujBwSh+Ps=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G8Y6+mTAnrVQvBvwFoEveZkp7Cnca+iC/CQ/rKRGDTwmbJb55CJTqojrM1LJ?=
 =?us-ascii?Q?enYRQleiCSnp96KXYDuAk7CL9+4ryB6eIlrRZrTEDZZELbxG+j3Lxa8KKb0O?=
 =?us-ascii?Q?4LXUANZvn85WkiZ5T2jzJwW+K471CKHyCmd6QyCiVhf31j1sS2/Nnz4Zbdoz?=
 =?us-ascii?Q?eCyuA9X/0ZmLwYH6+FLmLMXHZ50bYiWNrTqR1dHh1v0WpUciHJ3ZhQ00FCyj?=
 =?us-ascii?Q?/drlV0cS+OB+23oPc81stY9ZBkxmX9+5xsTzyYQic24Hr7XAWLy2AaDeVDrq?=
 =?us-ascii?Q?wsGpFzM/Ie7l08R7coCsSUihsfd0GJgJTVwmQbB/5IwPyOPFv6uLjhS7ZTkj?=
 =?us-ascii?Q?ky8m/sTdg9nHC9oe0lbP2WXOu12ItmKuTkCbrqZK/HvkI7nHND6DDHnaJ3b5?=
 =?us-ascii?Q?LKqxUNe8Gyt18+lZtUco8LB6xGs3zeprlt4KWJcyMk1htfj/YTXDkpV2aJEu?=
 =?us-ascii?Q?GauS9J9a8LMhjMbDBzlFgP7zWT7uCGGFp0mtisRK5MJInM6yDKDlNuyz542I?=
 =?us-ascii?Q?YDdE/pavpCWD+r+C1HiGPCl39VLk05DEsH4jT2pG72zqY0BKSLdrRNofvOJP?=
 =?us-ascii?Q?Rmg2vFTkS5Qp3Sr08JIhZrOKmZw3Y5RHeQfEOAy68sUTiTSILRBT2SVVnchx?=
 =?us-ascii?Q?fQDAsbsS8aBmpY43xVNr8k4vWn8WhQVq+9FLgQQLppuCg2AjgpSJRrudVQ9K?=
 =?us-ascii?Q?f2hohyLdLPz2JvjBTuPzufMbaOhnIXqX+/+gNbr+lYiiavExKGclkTuF2ARh?=
 =?us-ascii?Q?bRAK3YJPK3hXpGWc0cRbVdbRFjko8AKhmhDPSTOgQu43BYkPg+fePYeXDbH6?=
 =?us-ascii?Q?Ue+TpotfoYKe9LpChQcneqAtFu9ezMNJztIa6qdx4pMWJyXfGrkMd5rU6lGt?=
 =?us-ascii?Q?89mxwib/b7GBUss33s9ABQPO5/EU5stjvCllbtfNDQBoBbx17UlSF2lTy4qZ?=
 =?us-ascii?Q?oufdnRXJDc1AS7A9evc9UtNs4xqVDpqCB2xRKZEr26UH6YztwSOWhtuId6cB?=
 =?us-ascii?Q?hkMFgJFMkNkBcGs1XBDOOoGSxExx+VGUeMv9iSSMpnVg/2nr4/I5j1fpTYS0?=
 =?us-ascii?Q?OUzE9ZUysw1A2R9BEuLj+ubvpoQsIJzNNuoQLFK9LvYCHgHZJM7BsLROI2Jv?=
 =?us-ascii?Q?8cd9Y/cLzKZ8LJz/O9MCU4qgmmnL9o2mJIC3ahHxQeG1dq43axg+cyPYOMU/?=
 =?us-ascii?Q?mCrWecumMOQ/aFhBwTygmvsjZ9JFr9SvBo8RHVouUiUtg3AZ6wpzZsmULZvm?=
 =?us-ascii?Q?AD1BjpTXaGosEWrc1fy++O6b1kpS3XZEftWJMRAdjNcy6/0iemKuff8mc+jv?=
 =?us-ascii?Q?mHgjvNJ0v+5uSPcYqGGJ5R+inUSWK+sa9ukgC9FgVCFgK+2GCOp0UIWMT7Jh?=
 =?us-ascii?Q?Jw+epUtdEn/5880OZ2VWEqM7BDrM3iftxs64WUDSBiv3VepQDs3XUAbF7k2w?=
 =?us-ascii?Q?zXPiLd4VlcuxZefkepIb0azJ9PK9HLWLKbFAcKKENvKiuFsveh0VJviuQOz2?=
 =?us-ascii?Q?D8nLrORHwrYkE0OjX9+at361QXQZYd01fOxDlQaA6ypCylsA726zPmfvB+lw?=
 =?us-ascii?Q?0XJsAXZNLL1g9SoXG5tkcS/IFXDP2hT2dl6Ex1MvcNVub7FNPy3Q/iPUyd2X?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kw1sNEu6agMMnGllyIeUxf+56n2U/oUQLyvEDy+F1gpNsmaswx0osHFsgENquTRnrKNURfPrbPF22Bq6w/u5/4yWVVWdKHpA8G9++ytTvErIkY+IZZQ6qCd5QcFIBjaZ2mTLGvIoQp8ItVGTOH4zjw/HxoEKBCO3gF0+PnWBL6GfIiziiC+y1yTVue6H63YK9F5gFlB1Kbitt4emtYkw1ntMQhgmHdeULOa8U4YiLP5ktKDJguRWl6/ztjLbmMppkKyHRfdapLYZhNpuYku95FZJfdm1n6mtUb134FBBO2Rto5fovZ0jSRC1SMsJGyRMZjqw+H5XWmRgj1OGmdoa46gGMbihtR9jD/Ehuc0qOxwyXR0U7yeiuTh8SbhG927ft5ugInO5tFkRD+VjhGFUNy49pZ7YbbZAYCf6n6OijbN+bN+d6SZgCA9lwGg1KST0iT7ovpEbWqzmSbzj/gEVPALnBu38IsFQJcIHuIrPePKTL4Om03VBX3T4pqSHyYI1zW2O6Pfya9cT2MK4jaDxmEP8YGCg/v/cO1EFEBYD2Ya9yS6ljVBP0KhqUK+r/B0hdTTN2o7cRMeR2bGg9wTONPM1/JSqsqPUMw6K9+DiSgI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a184c12-7bc5-4d17-21c7-08ddaf8c37e0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 23:51:38.1252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bg8FkyzzgPdZUv7/7PNXutbYNk3CqvUKInHnqvNW/Adjw4NjZ04dBj9m23dVyCaQwWI/gz9sAQM/+ukOvLhgHPwY6MfyC4jL7hZa+YBTfQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7708
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190195
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE5NSBTYWx0ZWRfX2+qs6UvXkiwW M3MDxszD3K3DG+KyUVAX4EsM8RRE+piA7MtytLwSKsi599/ZbnjF1G3T51zkPlNAiSFYadO8v8Y taPG/yvgPMV0q3l2MJAcZTSXDlljNtr9MJ2C9jZHeOjqenOL6/PxDOYfmcMb5KssY/EwQnk2NG9
 3/fuF+fnqR6OvQR9suZLZr1/YCVS1Mw50dhMGqKnvK0l8bk24x68vyi15WqJEnTGg0BYZ8Mp+sF pjjmzjU04LDzaq91Rtdy8Bpft+723/Clpi/xhVsFS2NkItCCpx++peVsrkZ6Ut3gtVNDoLPBtzy pEpz7nfpPUCQlQuIayiErWV1QHsne3ogOU1JRiYJ6gc328Cy3yW3M94Lhw71Jmp7ZAc4fA0iKiY
 vzput4kpz/7YFBKI3fANRQG7/EwuNc0hhNkKb1qwJ8sGguOMNgbMt+m5HHDiyvAtkPK3EiTB
X-Proofpoint-GUID: 5UxcfScwbpVR740AcZTBVdn1ZL0ItlaP
X-Proofpoint-ORIG-GUID: 5UxcfScwbpVR740AcZTBVdn1ZL0ItlaP
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=6854a28e b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=QyXUC8HyAAAA:8 a=qYaQYdUA6xRwqV635LwA:9 cc=ntf awl=host:14714


Ankur Arora <ankur.a.arora@oracle.com> writes:

> Dave Hansen <dave.hansen@intel.com> writes:
>
>> On 6/15/25 22:22, Ankur Arora wrote:

[ ... ]

>> The second problem with where this ends up is that none of the code is
>> *actually* x86-specific. The only thing that x86 provides that's
>> interesting is a clear_pages() implementation that hands >PAGE_SIZE
>> units down to the CPUs.
>>
>> The result is ~100 lines of code that will compile and run functionally
>> on any architecture.
>
> True. The underlying assumption is that you can provide extent level
> information to string instructions which AFAIK only exists on x86.
>
>> To me, that's deserving of an ARCH_HAS_FOO bit that we can set on the
>> x86 side that then cajoles the core mm/ code to use the fancy new
>> clear_pages_resched() implementation.
>
> This seems straight-forward enough.
>
>> Because what are the arm64 guys going to do when their CPUs start doing
>> this? They're either going to copy-and-paste the x86 implementation or
>> they're going to go move the refactor the x86 implementation into common
>> code.
>
> These instructions have been around for an awfully long time. Are other
> architectures looking at adding similar instructions?

Just to answer my own question: arm64 with FEAT_MOPS (post v8.8) does
support operating on memory extents. (Both clearing and copying.)

> I think this is definitely worth if there are performance advantages on
> arm64 -- maybe just because of the reduced per-page overhead.
>
> Let me try this out on arm64.
>
>> My money is on the refactoring, because those arm64 guys do good work.
>> Could we save them the trouble, please?

I thought about this and this definitely makes sense to do. But, it
really suggests a larger set of refactors:

1. hugepage clearing via clear_pages() (this series)
2. hugepage copying via copy_pages()

Both of these are faster than the current per page approach on x86. And,
from some preliminary tests, at least no slower no arm64.
(My arm64 test machine does not have the FEAT_MOPS.)

With those two done we should be able to simplify the current
folio_zero_user(), copy_user_large_folio(), process_huge_page() which
is overcomplicated. Other archs that care about performance could
switch to the multiple page approach.

3. Simplify the logic around process_huge_page().

None of these pieces are overly complex. I think the only question is
how to stage it.

Ideally I would like to stage them sequentially and not send out a
single unwieldy series that touches mm and has performance implications
for multiple architectures.

Also would be good to get wider testing for each part.

What do you think? I guess this is also a question for Andrew.

--
ankur
