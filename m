Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C083D1D5170
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051404; cv=fail; b=i2vGhuAiblEvKJoR5kwF0ay1NUrWmfeA7LW8HIlW+7+9F+M1OSIFEOO3DQdS4EN+ZvwNoHOmIKdiD0J/MWOm4tg1eilCiGcq/r0/OWU/wjUiKWFkfSC0w4DuUzdaoHKCHNdpUKy1E9waV2MBjLIFRw++BKUkfFmbjg2xYjNsTjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051404; c=relaxed/simple;
	bh=8/CHcg0/hTJBTx+kT9mJAhZ6tENMvz/lpnfkzC4tMYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nrq9FjVU1F6iuIUAgglw1FJhu/NS/bSchuqo1GWvP7Zllcy4SAnirBvgl15kNkHlmmSr93vjSqwJC7b6YzyZ+HpdOC17qLMRxgUNG+bShl3duUMnYmAXvEOxc1AvILYZLZXoMjb+DMIangrGcFRitUqf0McAnvXmoSK1wsZJc9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jLHBEdlg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NGnB67Uf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jLHBEdlg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NGnB67Uf"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNcUMb016915;
	Mon, 16 Jun 2025 05:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KjietmktbsMhZBgvNSUEiDvNza5sYb9DSBoSut45yuk=; b=
	jLHBEdlglmTj0Yfdax/n5/1yd/IWTnTBSrN7+GzzenqXpvUiIEvYwUisYg9WRsiv
	ECHUEJJJP0W/cliRAMEdGX7twIaursE2rKuQZ2deGiDA23CzNd2kyfQYBP/G12ro
	tjZstqchGhfuv4BupDfOuurXbPMnj5uuxvCi3tkLbeyy3mly+C97jEZLWw+NgvIf
	08AxA0Qvfskmc9f1Zh8CVA7hJMokLSO+2R2dWLiM0QFSt1LXzEAIjGKn3N8nhBcT
	c9nWTpf5MjUZg5GJ3jCilYinDtBgtst0juaPJw/6lwQnjH19qRQ3CHHaFX22D8OW
	SYQZ3Bv9SC8+cqEhVWOF4Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914ehp53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G3A3eS034385;
	Mon, 16 Jun 2025 05:22:38 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh777be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhTJpexBXpqI+mj5TfuZ+iGZO16tCdhdkxgsB1gN0kkd6FWE16YrXvzTGrZc1WeYYASY9cuI8C0m7iiBJKpqCtReRGkhi3jNlGyuL9oAuk1Y5LiEQ6FbMp+PEHSoHMo5UJUMhodhwIbVvAnqiWnOkJrCbeHeBAS+Q3H01LbnVoefRm0zjVwX/LmCpabqhcRd3kLMzW3tsGT1zySxjb3FFrjGL2hZCPTpnVJRuacMb95XvKRYHr92ZFiYrtpw25E5gKS3G10FDZpAOrP5euz/5eXybjR2JmbmwApmYyykwiShTcmEVlsyyoQ5kN5wlHEHpSbWcF/infpBlyfivTJIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjietmktbsMhZBgvNSUEiDvNza5sYb9DSBoSut45yuk=;
 b=CPGgFfvmF9+C4IBVw/Zg/t+V2OlZd0trsmTv3HrGib7hHDlUe2LKHKkpiC9JDpsGrDWhFuhVjNjVYH7QyKAEnb0FSHLH5z7h7Gy7OPNlmF4dx9IW8ZQXJLEbNYOulk4n5VY9iEgiD2Lpr2+5boJ9GEX98ZWJ6lrwup/hQ2nEiBYHRAZYBNRX/dW31rfKlkhv0cBTq4BarzYZEVOMf/eGEcVAFeYtK3c91PWBIU+ZVZifWtTVq69dIBIkcQeaVuoIKGnzpI8iznOFBScvxSXW9vYDnGKn4gR22FD9KzoaXUat3ewmukIs9zHKQuzV6zwoGLfKpoa43tWT9VbQJ7VmnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjietmktbsMhZBgvNSUEiDvNza5sYb9DSBoSut45yuk=;
 b=NGnB67Uf33iJxxvKJ5nC/eVitXmUdFzWMTQhrC+haUPmFSg4bM9FQysZAy7M/0ypnu+ZbchX3F7b8PPfCEuMXMAiYbqW214V10ybORuuIOvZy6R55870RwqI1PxkaWfWwtUaZY0E9eswWmDll5zhG+1w8DCdkJjnI61AmN9WKmc=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA1PR10MB6389.namprd10.prod.outlook.com (2603:10b6:806:255::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:33 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:33 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 04/13] perf bench mem: Pull out init/fini logic
Date: Sun, 15 Jun 2025 22:22:14 -0700
Message-Id: <20250616052223.723982-5-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::34) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA1PR10MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 28afbe1b-b06e-4a4e-22ec-08ddac95cc73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Lj0QYddUfvdqf+1FHenuNfCAU4fCsJF/M+v29MPCrwGgDk+2mP3n8RaMjXr?=
 =?us-ascii?Q?aC1VE3pCspTxn3bEme44iyi5hbIfX0E3ELlMOvI5R7kI5F+WQQBpGjnUYbYo?=
 =?us-ascii?Q?1qDn/l040GCY3yG31N+xCJYcCR6P7I87VtZhmxuSt2VEMIT2Ye603et2Km+A?=
 =?us-ascii?Q?AxrPGGuGbZm82RvJ1+jOSIfNEMkLRvbtd7U0XYwaHvBDhuEsbbNUezIfGVBZ?=
 =?us-ascii?Q?wkY70QYkanNix58G4dzxhP4rbHlQNTjGlrndGKURlPSujeH+N0OPh+oCepfF?=
 =?us-ascii?Q?29lybpIhSJZqpU3m1zHZ9hVyJXeNdySeHpjWIAuPtOqU4C//Dvo6dT9dMSJC?=
 =?us-ascii?Q?b1hMySYB2h09WRy1h/5XjHKKrX6Vf+EYQrhzlMRw1jrGejX0i8oQppLjIUGs?=
 =?us-ascii?Q?Dkpxw4TB0AhN5KhG4ReuSar5A4gEWbZjcB9577Z14GzM+VpBoANaD1mT27UQ?=
 =?us-ascii?Q?dfaG9+H7Ttf53e+mnr35nxYr+o2bwshNSaKfJ+zAyXj3jXt2NYuwywKVf9iz?=
 =?us-ascii?Q?GrzvJwwUJCoNMKlJMV2oEkP+ne5wPJf0p4Cn4qZxGtNq9AFBIYbMFfOlDp9m?=
 =?us-ascii?Q?N42VIIZ5RaFVDzAXVqrfdjOz14NP7/CaAr5w2Fruu4SdkQlMfax0JoU59lC6?=
 =?us-ascii?Q?uafN+r6dL5ORp8swWq+rE25qgXXRjLCLwGbocsM+2hMLhIEXJ7x4UUahsaWu?=
 =?us-ascii?Q?qHgqgPU5OvEjhvvfk6+6s83WFPwt57MDioOTLCaO0kcBkhABpplxyEFiUSA1?=
 =?us-ascii?Q?6EJaq5gXnMuaEz5ujO4PvGGaCPCHdZT1F4qhgB1WLwamzoSvJff55GydQQXb?=
 =?us-ascii?Q?M42gkukUI32PAOACxKXHEriNS1R4F6QXPMmc1p10ns1Sdaji15mlvu1cVqB+?=
 =?us-ascii?Q?OnycAgES6tlI8zAEBhkjra1DX5tGFoK1tToVdpgVsvYG/NhT2ugojCQSzjv+?=
 =?us-ascii?Q?HAX2k0WERx8oWVQbE8yoGzyxHl6m0In52UhwNNCEehdADsWIYIa/l9RDe/ol?=
 =?us-ascii?Q?bwSXILJC0uO5tqiZmijCKRa2lH9KkcpBJTS6q7sWbQQ0fRxRN2hjwPXqTLAs?=
 =?us-ascii?Q?vGb+xEWMNz+Tg6Te69GJpBUb9GlCEs4ikI87R/P+J67SfhzzpdcjIwMphWVo?=
 =?us-ascii?Q?8hprL3kN9PPv/sjXIVvG6XjBM5XRlAIV65jgx7BlLgbsQkHeBVF2zJnzQ6SL?=
 =?us-ascii?Q?zlrbYp5ykGpsiXa7QlVN9B16JTwpWURkMoFA9c2Q6hZjntRc7kBTkkPoSGFC?=
 =?us-ascii?Q?6UeaAvfMvgyQv2+VDkS8DCJSujluIGi/Anzi+8B9ylzXY/bqNQdxTKrfWZSR?=
 =?us-ascii?Q?1UzUNK2EY95E7aVCLlJ9JyJChTmScp+lmFHnCWWJhjxTqbMXjp0XRz3RG0E8?=
 =?us-ascii?Q?U6BXs+lSf0OkaTzZEVXF9qCERhJaQYjkfzBzzYcbktw2e/Pu0oDIee/4ejSa?=
 =?us-ascii?Q?eHCxs0opaXibL/TBsIe1JKnnUG/UWKvT+N6/UsDjPwDtcqQOyRQg/sjkUhdS?=
 =?us-ascii?Q?wCGSE2BJ50vwGoxhB/V7rBRaMlqtPyo4oMLdM/oulNBSe5EvA1bmJKxzu4D3?=
 =?us-ascii?Q?vULoqVios0f8DJXXCcV5Qe/4mXuRz40wy1z8y7lfaonQtyg5siQRRL5mMEpf?=
 =?us-ascii?Q?JXkyQxNbjnU7elN+caHXXQ2DsosL+z4AfwDrTckDYDdJ8riPEN+qgKOEMFo+?=
 =?us-ascii?Q?EpJUYzK+Bd+OSSZcCCOOUTMgHrH1PLSgwx5RQd2FPGv49ppv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cNG9S51PjY1/dGi6ZCHkqSE69Husq+QS5MI6G/DJyPLOIoPG9og+/z+Dsp1T?=
 =?us-ascii?Q?pHeaRtR+GL8VWxQ4nJ0Kxho1XiBAf3hTkLJPKkNADdV6ZQK7fQiWthIYq7xE?=
 =?us-ascii?Q?ilwr415NSok7DcHkeDfVm1Y7htTNfL/QKqJJu4iV1HfBOBxga/lNmC3kdxFS?=
 =?us-ascii?Q?6F7lhXfFKGiJ5ODR3LSBlziAvo0ynbJjgsjmrpTNqw2NGZuuRVvt7ROH68Vu?=
 =?us-ascii?Q?iU1tAJNCQb2XWumqz9/cAPNyt66U402gsG7G6/Uojy141S9dVBOIFqrJDAyu?=
 =?us-ascii?Q?Q0jMugeUzSwCRHYWCaP04Bhdlc2RRtZ4vSVKFAFLDwhifTI+OswivVO5EPEB?=
 =?us-ascii?Q?5TH5BKVIXM8m9J9WTBRdzK+FT+PfzkmVqomN6wCTCCKYm104znb85U+HTDqO?=
 =?us-ascii?Q?PzDuL7SNedhBw5zzu7ABxw4WVUTZhTdF2luK9dsmSqH3tLd/J9VxUPwpTbAm?=
 =?us-ascii?Q?DSSnMSVeIcN+6uPn8gzQSD7Ag7Ii/uQdKJATYw11ijmtc54iAPNR8zFO+UBl?=
 =?us-ascii?Q?2M5Y0mHfSMBNdVb9rDeZP77vSG/4WKHP+QeipAVlFzlW5mNs1pnErYnZOutW?=
 =?us-ascii?Q?Z15fzh8oS+RQF4yuwOaWsDxp2gakZiCP+XRmxX2WQcTYpUhuKMSkBYwuiiyB?=
 =?us-ascii?Q?rvIGgH05mB58MI3bmapj1ERR9F7QteWaKwnXYQqLXSnl1whcXB93Y8xi3XHu?=
 =?us-ascii?Q?K89n3CE1pb6H7objQuB9VKm98dtAjojCMbOQ9XDhc8j9udYUp4Kkc4XKMPIH?=
 =?us-ascii?Q?ewEWH2Gc0lDYtCsyLJVq/9sHO8SrlRmjZrd/t/YTDkSt8hNLrXc8puf/PLzW?=
 =?us-ascii?Q?jxRPDDXElxD94BdGAxOiSWETAoogWHIFFOsBgRCGEuS1aBcRcbwBscWf6QRj?=
 =?us-ascii?Q?Obda+6XbT2bBCzvfVcTyVnAaSs2b+fjIi0WI7VZryrS4CvfFGi8mcNf/kpLG?=
 =?us-ascii?Q?J/5RYFXz9sp8imecUYfmzAEb2dTm4yhjJUVop74lwySUP/WY9z0vkKhEK7u5?=
 =?us-ascii?Q?i+sdoYpBNhqwzEW7w32zJ/DRWc1e9aKDQJRphHEUOGwAmBxWseDrFvqehcZb?=
 =?us-ascii?Q?shNUItnUDgQJXP//kTBHahn2MjG4K+1pcdvav2PvNC0BiocMH52mPPNiAxo6?=
 =?us-ascii?Q?BWEeXoAM8Rt6lNnesCfqCn1LCwxQ1J/vYc1mas4CUGwEzigMXeE94yoTKAEv?=
 =?us-ascii?Q?Kh+DbKArRDX27PAXHUHbasCTdo/08a1HztP7DEl+n5AyScpp22oUm8hIrSiE?=
 =?us-ascii?Q?LX+fm21MRKTSj4pTh1ohE4IeQFz56ewWyY5Sd86VsIdZKs1ZqaamkDTYqbK4?=
 =?us-ascii?Q?sGzPZnJ+MSSfttczQJwU6KncinoNMZiMaDmskisFyaAIdZAFMVp+LmI3YwXC?=
 =?us-ascii?Q?EXZqX3VqpOWSHG1nCLrGJ3iUaD0nDtSoUUKHsXvRht4LxT+J2jnPn7C9gX+y?=
 =?us-ascii?Q?wqVnZ94u/2LNRhdD9fgXgItbFVaUrrcnNz90dj59Sbw9nSsbvy9ZMHjq3C+P?=
 =?us-ascii?Q?y2/H1ok9WsoEcsN7Abbca9Rt0CvKtHAf8iAoOf2F3+t7gsLVW905mKKJdj0U?=
 =?us-ascii?Q?UP0qtVqR4l5GC64/dJvIDSSWPLg4vSE1xhvIb68n3aJfd4e7HgX+QtcqBem2?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r3TsxDeK0Afay/ol/pDw0RUKuA62Fr/ky7+7vy7PhSV25F2iAxFuhh6ZH4PkS42qlliLcLeCUS5hWZRMcn69bIgQjXTB/nqDBDIBEXPjTi3PlFLtsNBUubBt/2rHTpzsHBf1UINuzAwKfBaXuNrpEN0aMrluED3P3q6SNKmxlrO1HhJLbfhbkbf8z5ZblgF7Wu9ScRykZAp46AYb4wGnlYtDXFYJzWByNdrmhU2iX9z7YmNHUVpk5GuRwKUsjrYw2oAsUMNdP9s67K2US+N4cMZZwnhpJqsZ9KI8qAB0dRjuwJuCvW+i38VQlKiGT0eFhsVpI5D+gxXm/G6Ys11R2LHZ8fNca5tfTb5ivUUUPMce1mGUQZIJ/8LJJl0rxM3kRSzOMiWkmzW8j3kvzPJXLVD83+7w5mWWSgikgbfHhKhGXw0PtjOuYC4puLnxovwizgNel+NhmJYEPc3+EC+jZNKMu9zChObABk2oNpvk954Drc2v2ISIBMtfeB1CBj82wLkfOqbL1A75PV0d7GYbfaRT6J4qXqMEqXiddLQAilIClR0VEvDA9PjeHOR6UR5jDpDXdOqo2C40DHvopees3iwDBTf0I+3rLN2sbO0aWGk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28afbe1b-b06e-4a4e-22ec-08ddac95cc73
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:33.7636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dvGES9AZzaLKrAa2+Hqxh5TH8eaHaZa1q5lENX0JXYRY0dgHGN7J2GUM41RplaYLjBI2r0ZfidRXzCVIMPZZRsFcVgr8HSPl+jtzleIXlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6389
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfX10E2wUUCLd7t BeKnBxF0tUYvABdRjRLHczGbevMh/w4LuDaJHCVQC8bYE3wHPolNGYXDUU0YIPo4RhkR2iDKtxb k2CTCnCN4JdDxLKra4rOxyLsYu2xi54iApwkMt/xHgsMIPK1HalljeqeX3kpFpDjYrPBOOiVHiw
 4DV3w8ZKNKTH9KVt/z/ZP5WYxjKkXwnIYbvSJEaInjBL0OQFHPwgc7y1v/bXZ5+xO6HmXhvR30m o711AmC7WAMjLFGuKhq8Grehv4ir8RFTHr98cHfQ/VS5Lqn+cYMD+tSmeAu7EjOrelQkZW0q24F zmqEw2YvLc65CaPbWPRjgN5pg7JEWttE0KnT8A8lDoGcoRIM8G15te5Ppbyu9qIEzAeG/xnDu+o
 mXC6VJyyNNlQrooDJTjbOO/c+YPPzyOUMJMJLlbxshvL694jpUKCDMBCiMH9/z77fQMyq0jB
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=684faa1f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=TbKJQeBsitzCtKh9844A:9
X-Proofpoint-GUID: hBf01fPJl4BzSTJMqZmgwpUJ3YpiaOQW
X-Proofpoint-ORIG-GUID: hBf01fPJl4BzSTJMqZmgwpUJ3YpiaOQW

No functional change.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 tools/perf/bench/mem-functions.c             | 103 +++++++++++++------
 tools/perf/bench/mem-memcpy-arch.h           |   2 +-
 tools/perf/bench/mem-memcpy-x86-64-asm-def.h |   4 +
 tools/perf/bench/mem-memset-arch.h           |   2 +-
 tools/perf/bench/mem-memset-x86-64-asm-def.h |   4 +
 5 files changed, 81 insertions(+), 34 deletions(-)

diff --git a/tools/perf/bench/mem-functions.c b/tools/perf/bench/mem-functions.c
index fb17d36a6f6c..06d3ee6f5d69 100644
--- a/tools/perf/bench/mem-functions.c
+++ b/tools/perf/bench/mem-functions.c
@@ -62,15 +62,31 @@ struct bench_params {
 	unsigned int	nr_loops;
 };
 
+struct bench_mem_info {
+	const struct function *functions;
+	int (*do_op)(const struct function *r, struct bench_params *p,
+		     void *src, void *dst, union bench_clock *rt);
+	const char *const *usage;
+	bool alloc_src;
+};
+
+typedef bool (*mem_init_t)(struct bench_mem_info *, struct bench_params *,
+			   void **, void **);
+typedef void (*mem_fini_t)(struct bench_mem_info *, struct bench_params *,
+			   void **, void **);
 typedef void *(*memcpy_t)(void *, const void *, size_t);
 typedef void *(*memset_t)(void *, int, size_t);
 
 struct function {
 	const char *name;
 	const char *desc;
-	union {
-		memcpy_t memcpy;
-		memset_t memset;
+	struct {
+		mem_init_t init;
+		mem_fini_t fini;
+		union {
+			memcpy_t memcpy;
+			memset_t memset;
+		};
 	} fn;
 };
 
@@ -138,37 +154,24 @@ static double timeval2double(struct timeval *ts)
 			printf(" %14lf GB/sec\n", x / K / K / K);	\
 	} while (0)
 
-struct bench_mem_info {
-	const struct function *functions;
-	union bench_clock (*do_op)(const struct function *r, struct bench_params *p,
-				   void *src, void *dst);
-	const char *const *usage;
-	bool alloc_src;
-};
-
 static void __bench_mem_function(struct bench_mem_info *info, struct bench_params *p,
 				 int r_idx)
 {
 	const struct function *r = &info->functions[r_idx];
 	double result_bps = 0.0;
 	union bench_clock rt = { 0 };
-	void *src = NULL, *dst = zalloc(p->size);
+	void *src = NULL, *dst = NULL;
 
 	printf("# function '%s' (%s)\n", r->name, r->desc);
 
-	if (dst == NULL)
-		goto out_alloc_failed;
-
-	if (info->alloc_src) {
-		src = zalloc(p->size);
-		if (src == NULL)
-			goto out_alloc_failed;
-	}
+	if (r->fn.init && r->fn.init(info, p, &src, &dst))
+		goto out_init_failed;
 
 	if (bench_format == BENCH_FORMAT_DEFAULT)
 		printf("# Copying %s bytes ...\n\n", size_str);
 
-	rt = info->do_op(r, p, src, dst);
+	if (info->do_op(r, p, src, dst, &rt))
+		goto out_test_failed;
 
 	switch (bench_format) {
 	case BENCH_FORMAT_DEFAULT:
@@ -194,11 +197,11 @@ static void __bench_mem_function(struct bench_mem_info *info, struct bench_param
 		break;
 	}
 
+out_test_failed:
 out_free:
-	free(src);
-	free(dst);
+	if (r->fn.fini) r->fn.fini(info, p, &src, &dst);
 	return;
-out_alloc_failed:
+out_init_failed:
 	printf("# Memory allocation failed - maybe size (%s) is too large?\n", size_str);
 	goto out_free;
 }
@@ -264,8 +267,8 @@ static void memcpy_prefault(memcpy_t fn, size_t size, void *src, void *dst)
 	fn(dst, src, size);
 }
 
-static union bench_clock do_memcpy(const struct function *r, struct bench_params *p,
-				   void *src, void *dst)
+static int do_memcpy(const struct function *r, struct bench_params *p,
+		     void *src, void *dst, union bench_clock *rt)
 {
 	union bench_clock start, end;
 	memcpy_t fn = r->fn.memcpy;
@@ -277,16 +280,47 @@ static union bench_clock do_memcpy(const struct function *r, struct bench_params
 		fn(dst, src, p->size);
 	clock_get(&end);
 
-	return clock_diff(&start, &end);
+	*rt = clock_diff(&start, &end);
+
+	return 0;
+}
+
+static bool mem_alloc(struct bench_mem_info *info, struct bench_params *p,
+		      void **src, void **dst)
+{
+	bool failed;
+
+	*dst = zalloc(p->size);
+	failed = *dst == NULL;
+
+	if (info->alloc_src) {
+		*src = zalloc(p->size);
+		failed = failed || *src == NULL;
+	}
+
+	return failed;
+}
+
+static void mem_free(struct bench_mem_info *info __maybe_unused,
+		     struct bench_params *p __maybe_unused,
+		     void **src, void **dst)
+{
+	free(*dst);
+	free(*src);
+
+	*dst = *src = NULL;
 }
 
 struct function memcpy_functions[] = {
 	{ .name		= "default",
 	  .desc		= "Default memcpy() provided by glibc",
+	  .fn.init	= mem_alloc,
+	  .fn.fini	= mem_free,
 	  .fn.memcpy	= memcpy },
 
 #ifdef HAVE_ARCH_X86_64_SUPPORT
-# define MEMCPY_FN(_fn, _name, _desc) {.name = _name, .desc = _desc, .fn.memcpy = _fn},
+# define MEMCPY_FN(_fn, _init, _fini, _name, _desc)	\
+	{.name = _name, .desc = _desc, .fn.memcpy = _fn, .fn.init = _init, .fn.fini = _fini },
 # include "mem-memcpy-x86-64-asm-def.h"
 # undef MEMCPY_FN
 #endif
@@ -311,8 +345,8 @@ int bench_mem_memcpy(int argc, const char **argv)
 	return bench_mem_common(argc, argv, &info);
 }
 
-static union bench_clock do_memset(const struct function *r, struct bench_params *p,
-				   void *src __maybe_unused, void *dst)
+static int do_memset(const struct function *r, struct bench_params *p,
+		     void *src __maybe_unused, void *dst, union bench_clock *rt)
 {
 	union bench_clock start, end;
 	memset_t fn = r->fn.memset;
@@ -328,7 +362,9 @@ static union bench_clock do_memset(const struct function *r, struct bench_params
 		fn(dst, i, p->size);
 	clock_get(&end);
 
-	return clock_diff(&start, &end);
+	*rt = clock_diff(&start, &end);
+
+	return 0;
 }
 
 static const char * const bench_mem_memset_usage[] = {
@@ -339,10 +375,13 @@ static const char * const bench_mem_memset_usage[] = {
 static const struct function memset_functions[] = {
 	{ .name		= "default",
 	  .desc		= "Default memset() provided by glibc",
+	  .fn.init	= mem_alloc,
+	  .fn.fini	= mem_free,
 	  .fn.memset	= memset },
 
 #ifdef HAVE_ARCH_X86_64_SUPPORT
-# define MEMSET_FN(_fn, _name, _desc) { .name = _name, .desc = _desc, .fn.memset = _fn },
+# define MEMSET_FN(_fn, _init, _fini, _name, _desc) \
+	{.name = _name, .desc = _desc, .fn.memset = _fn, .fn.init = _init, .fn.fini = _fini },
 # include "mem-memset-x86-64-asm-def.h"
 # undef MEMSET_FN
 #endif
diff --git a/tools/perf/bench/mem-memcpy-arch.h b/tools/perf/bench/mem-memcpy-arch.h
index 5bcaec5601a8..852e48cfd8fe 100644
--- a/tools/perf/bench/mem-memcpy-arch.h
+++ b/tools/perf/bench/mem-memcpy-arch.h
@@ -2,7 +2,7 @@
 
 #ifdef HAVE_ARCH_X86_64_SUPPORT
 
-#define MEMCPY_FN(fn, name, desc)		\
+#define MEMCPY_FN(fn, init, fini, name, desc)		\
 	void *fn(void *, const void *, size_t);
 
 #include "mem-memcpy-x86-64-asm-def.h"
diff --git a/tools/perf/bench/mem-memcpy-x86-64-asm-def.h b/tools/perf/bench/mem-memcpy-x86-64-asm-def.h
index 6188e19d3129..f43038f4448b 100644
--- a/tools/perf/bench/mem-memcpy-x86-64-asm-def.h
+++ b/tools/perf/bench/mem-memcpy-x86-64-asm-def.h
@@ -1,9 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 MEMCPY_FN(memcpy_orig,
+	mem_alloc,
+	mem_free,
 	"x86-64-unrolled",
 	"unrolled memcpy() in arch/x86/lib/memcpy_64.S")
 
 MEMCPY_FN(__memcpy,
+	mem_alloc,
+	mem_free,
 	"x86-64-movsq",
 	"movsq-based memcpy() in arch/x86/lib/memcpy_64.S")
diff --git a/tools/perf/bench/mem-memset-arch.h b/tools/perf/bench/mem-memset-arch.h
index 53f45482663f..278c5da12d63 100644
--- a/tools/perf/bench/mem-memset-arch.h
+++ b/tools/perf/bench/mem-memset-arch.h
@@ -2,7 +2,7 @@
 
 #ifdef HAVE_ARCH_X86_64_SUPPORT
 
-#define MEMSET_FN(fn, name, desc)		\
+#define MEMSET_FN(fn, init, fini, name, desc)	\
 	void *fn(void *, int, size_t);
 
 #include "mem-memset-x86-64-asm-def.h"
diff --git a/tools/perf/bench/mem-memset-x86-64-asm-def.h b/tools/perf/bench/mem-memset-x86-64-asm-def.h
index 247c72fdfb9d..80ad1b7ea770 100644
--- a/tools/perf/bench/mem-memset-x86-64-asm-def.h
+++ b/tools/perf/bench/mem-memset-x86-64-asm-def.h
@@ -1,9 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 MEMSET_FN(memset_orig,
+	mem_alloc,
+	mem_free,
 	"x86-64-unrolled",
 	"unrolled memset() in arch/x86/lib/memset_64.S")
 
 MEMSET_FN(__memset,
+	mem_alloc,
+	mem_free,
 	"x86-64-stosq",
 	"movsq-based memset() in arch/x86/lib/memset_64.S")
-- 
2.31.1

