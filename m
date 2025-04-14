Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C0A28F4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744610895; cv=fail; b=IvoDVjXxA7Vw1yWnR4Hkx+SNc6LcUdfhwiTSg2pI7X7nseEOr4I3sWGOmo8V4RkYdp/RPDn6qB1Epk25mqojLGrzkr4DythDPcHlIbMkMddoI05Fva26dJ4FcMVJZUH8W4YzrDzNW0UqtLIfqNCbWQAulxBfg5KRz8d4KPtuxLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744610895; c=relaxed/simple;
	bh=Z06ggt/wQhSguvD9qeHtQ0H6NUOfmJ6CRslppiKNoYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ll5JVf0hHMMTRtmdgE9EqPQyi7qjDCvt6PW0wVHk8eNiVx3uDqvxMPwa+kHcHOSEMxdWSxfP5hh+RHpEjBaSBUxTkJBXi2KhWMjaGESk0DAqjBua0Y5lvM0yLm663QVZxTMz8iv9kYuGVw9Hv7wON3ltMCFaaAF3dKPEZn3ZWxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HuwvCD9X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oPEXvWHB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HuwvCD9X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oPEXvWHB"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E3NRmr023153;
	Mon, 14 Apr 2025 03:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=QS9jq8IqfRXva5KezIzWJiDSS2AnC/XV5bo2nTV5Tvo=; b=
	HuwvCD9XHblyct3eaf5GnHGIMgBvHJaDKfPk0TySlDakwYUlvkzwygOWjAh7tukC
	8fXULszVaMjq4znh7QdePFkuW1m7Bd3spk7+/1pqbI6kV2RJt/MHKeYy/0T+D37N
	mQMX5eMQsMuqaaod96LMtCkHtrKK/ejVYk5gEw+jsLgrnyfnUWfRvg62nnv2oKmQ
	x8cF3VQq1OLNP2UhCVjBicwJCcfw5NWhIwF9sfue3QIK01AN4kCftUYd1ye3n09a
	mFwV1NBq5YGbwMv/QJGi0nu+GQne7Y4EudIQXJWQGmAderkQ/IZp/Jk0o3e2FerW
	eJ0spCeDaYrNpT1G0Qo+7g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 460td3r0hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 03:46:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53E3bADw038784;
	Mon, 14 Apr 2025 03:46:18 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010002.outbound.protection.outlook.com [40.93.1.2])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4p6fw5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 03:46:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hj8Qw0PP9dUeGa7INdfx19Xwzwiq4ArwfxtSHXSyTT/yNJZjXH4hmxk74ERO/o5tkOiWZSVsB3ci95/kMWRW4oJxDkOmGpBwPB9Yu2YLSSEpOI3aqVJnmpsFDyLGMzRnaRo479fIUCHyPePT7grSo+xiOeOOIia9oyHLxc6ke0afx+ZGNx/jaZrLoR0bAE6Hg3T3L/WPdbsw3Plu1GEds7braFdBSClEFsTB18wkJte9Mli0CnvrVAofC1CWXgxmVbJjc3FSQhSFFzJlF6H6CGUs6BuGNGXGTn/49Q9cvpz9w0+gRk3oEa2F+KE24j8AHkNFXifwpzA9wK5eAao01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QS9jq8IqfRXva5KezIzWJiDSS2AnC/XV5bo2nTV5Tvo=;
 b=yCvBjA+Tf2SsZj4vSI1DVb6VfLUi3iKi6hBCeB+2xb5e/5+EhoEzfFx844PK5mlHumx97dFZqdUzjUpLWK3KNopae854nXFGTbgpvG1VDlRnhfPgidlnPseA2lF8UV8smu8xZCwIA9x/8+zjC0P/vpWPEhYxGtEQfLU9tcOMGyFdiUiTMitmE+/21/OttMjOQ/LudKE+cNskjFYZWmtz71BLQ10UwbKoHlbxz9DMRy5DM6V7wxReygxOmAWZqwH+21//WJfxErk1sYt9grAQJ3uk1bkaDptJqRlZ7eYQENPVwRVgZ0j2LkIcXZ1kGWN1iXrlt5k0H0/0jiRS9Wn6yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS9jq8IqfRXva5KezIzWJiDSS2AnC/XV5bo2nTV5Tvo=;
 b=oPEXvWHBf7o4U1zznlQSyTnpb1r+Lfqci/Hr18sOaWouCIzLU6UxLHivcSBmtl9kuGhQuV7r689xJWYyK31on3Kt8sFle1FSya+fiJXoZlfFoqpAslZ4HQy825FQKIxg/HvoFnUjdamIeSrSf4uJuRJG9LKg+7ZL+2R7E8RRSwM=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by DS4PPFDB583D803.namprd10.prod.outlook.com (2603:10b6:f:fc00::d50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 03:46:15 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:46:15 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
        rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
        jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
        ankur.a.arora@oracle.com
Subject: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
Date: Sun, 13 Apr 2025 20:46:07 -0700
Message-Id: <20250414034607.762653-5-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250414034607.762653-1-ankur.a.arora@oracle.com>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0340.namprd04.prod.outlook.com
 (2603:10b6:303:8a::15) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|DS4PPFDB583D803:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f12fac-2d80-43c8-e642-08dd7b06e878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YP2SOdURxkuTdWp1K0h/3iuOT1h+7RjbPvBMeHVnh8hVO+OEU0tbdSUtDXnn?=
 =?us-ascii?Q?qmrsFq1qFdwsCH11mabru5+ui21Cr+CmIUGJ79mPacX9Rw5EfMrOQ5NDsKCU?=
 =?us-ascii?Q?nvp0jpueAxdUHKEFUaWlw6DdimqkPUqln/8J1OriJeCFZb9IbPhBaYt5RkiN?=
 =?us-ascii?Q?UKG5gzmhcNwKVsV12KF4HRTbglMpSGOW0xNj+Yr4z1s6MqZBPrsph5om0wC8?=
 =?us-ascii?Q?Sy4lYIqhrQPV1MhlQg4d3JViy/Zd0T6aHybB26l9CP1HH5VA+uWuS8EOGwrL?=
 =?us-ascii?Q?MFjJNDtMEaHMYGUyjseQu3lvcDjSquaeRBjU9THPE/m3APIU2kdIJvo1x7HW?=
 =?us-ascii?Q?FpGXiUn4aIoou7iXs3cJrTltgTYuwtcjjA9U5Y3qXGncc5qzoDl3Ys0A6YKr?=
 =?us-ascii?Q?7nteko3KQVgQyXbJ2tYjWMnubbwAFSTQOwXAAS1/+e2lNb0kIOvNjk051klF?=
 =?us-ascii?Q?znnSTUjgOc2yjqYvxHTsv+RvwaQqcZLmGmyJZoiKHxJNjnNjTUT5xRf0S4CN?=
 =?us-ascii?Q?tec17SpiP9tqDxPAacgTLuFSjldKxlQpK/jcVspoYnExzc1Armyr9xmcHZ8m?=
 =?us-ascii?Q?POIPaaEw4jTcq6PVGlrYvOtO8+1zme9vqhITNgk4xjhaGMSTeg8ZS3AXq3ao?=
 =?us-ascii?Q?KdqunEzwobNVi7k3229uvCQbo55tlII/f+HaE5hNEouI06+0MwB9msnR5PIA?=
 =?us-ascii?Q?IPA22tvV4oZx8lIDQVi8XczYXRi5Xnz0IynahBVusiyZCkS1U4OLbA4c/b3k?=
 =?us-ascii?Q?xlz8UhbVif0lLWmm9PfAxa08qQAN72NQJjWz0EGvdQdman4e7sq9v9QkDWjw?=
 =?us-ascii?Q?5zEViwvw6Cggs7j1icO2Ll3SfeWLufa/ExBx9Xirhj3WDflBnOQ0/WD2jsCJ?=
 =?us-ascii?Q?HQXSvISlDV1MHRn/0p5yLYbEquS9x4yWPZrUORmitYwkDyauQlJHT0cyzrfi?=
 =?us-ascii?Q?Gni9A8nBTW7Hz8P4hrs99Ve7i4aKydhR11hBa6FvYoUxF4X2aknecbIdE7To?=
 =?us-ascii?Q?6jbj5ufQ6yahCcrMhbf09K9QJ6Jyb56rUywIH5lLuNYT/ydu2NZHIexGWDsw?=
 =?us-ascii?Q?1kISc4f7lRMb0EMTMeCz9Du+hXxSI4iblUo2YMfQR9Gh8vgYGjJDvRunA1ok?=
 =?us-ascii?Q?KJaJ46Dy7euaCs9oMzh9iw4j0brcjayQXp/PG+/ZKSIewPV96oE9xVwFwu27?=
 =?us-ascii?Q?eq81PGkfjfWirnx+3PNvFUHVhCs6kEuE+yEZJUx56502Rdef5U/8T0hRy+g9?=
 =?us-ascii?Q?7U3LU49Zg9ZnEEZP/HhVc8BmlpQbtOBEoh7eQGFs8bBZKaQ6RoweQF4IZcdK?=
 =?us-ascii?Q?TFU7jWH1HjtKztqd3xma2Grguk9NRPO4CbPi0neDYzz1U+iXtyRdQCblFua/?=
 =?us-ascii?Q?tvu/hqdBzaRda/4gI7JRQcanZxNKPhKyzDR6s9NoPaeh4r+zu3x+SJjAtQVa?=
 =?us-ascii?Q?9HqVIJwcelM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3/OkO2bHFRYajEHPHwI+KReLd85ayYYWDZwrGME4TGNwZVP0diVs+ZngEzbS?=
 =?us-ascii?Q?h+ee//yU+3BftitsHDkm5scT+TjXXSmo+bwzt3WypDrudLhqumx8HuhlYoem?=
 =?us-ascii?Q?dUchB/YEsDpxxrX2CIb/krOnI7LeqQRY16Rm4yccjfDapmY5aPhKLG9yToWb?=
 =?us-ascii?Q?4B+Qb2Yy2PkxbblzVav+3Sc9XqTzDwoH28etfZ8/wpuXQ2oofkYtwvzYnjnJ?=
 =?us-ascii?Q?9TLlf4OqieoN+Od7aoAZoVw+g0ogk7S3wC0iad1UJqMzDGsTf/I5cbBHmpR0?=
 =?us-ascii?Q?TA5zbrdMqBBfkqxpojqPaE/pKooLbSnZia06aiSZgwu8MUmTG5pR6fzwINfK?=
 =?us-ascii?Q?Uzdjy7ElFQ3tOxu5wG9uVTAouR3Iqqs23XBKxYnBLwHa4w4Yrv4QwiayMQ4Z?=
 =?us-ascii?Q?synB7RH9x8bvoD4vJY/ADj84aEeMGm1ajW2ywqt3bOSYtiJZzGk2H7pXYa3I?=
 =?us-ascii?Q?lnZ3EC/vXrm9HZLZBQCyGgz2kOm8uREddqTLeST0/XS8xiaS+c3qODc1Acz5?=
 =?us-ascii?Q?rlKMAms3mRHt/P1uWvGnQAOnPWsmL0xIL2v/1BOId9TCDOR5liiajhV8O1J8?=
 =?us-ascii?Q?ZgOMUDaxNnA3Hgcv9sFOg4OmzvlPXg16P8QeNECQv6wyBNMhLf/gr5Lu7wSw?=
 =?us-ascii?Q?J7TeiaNlLnxzicbCvchJpiUUu1/BTW+dnhjIi6LJyyYwBpQjX78PWD5n4b6r?=
 =?us-ascii?Q?u6Jr10yepRFM3wn0/Tl0K3xSshOHtW7RVfDEcB7R/gyj8p6teHkhVmWHrgr6?=
 =?us-ascii?Q?pW8OW5NWb3S/ciNr4qmRoj/W+C+vUx+OuMZ4rBdqCML3k/FxXSdyNmD4cENr?=
 =?us-ascii?Q?Sn/7yCuDItXpFZpOTXkyM5OLd/PyEJSNXJLuUdUsamXpbbq6AHAD81qzIny5?=
 =?us-ascii?Q?8g7aQitPYshIhJDfYwice3hom/4r3C1HJz/IvTLY7ZwYVoqSfODUn1T8QL83?=
 =?us-ascii?Q?AEHlzxxoJoHcGf+tmjCXm+rD/BLmH+y+7mJMMyFxJMMYIQQ0xmYGf7j6GGpa?=
 =?us-ascii?Q?w8Rw6BZjZUc6EZ2tzcdf9I0zoeiKW2wzMcjWbvAIbM4qiscOBH5x8eBhHfow?=
 =?us-ascii?Q?tPhH3ani3Fpe5s8zOVLuwdrMZZANfmw7OrHwPKE5TRNVOkOT807RPXBL7zSq?=
 =?us-ascii?Q?2nPMaH9aHdLMRaD2b75AeW6L1qql3EgX9wNir4vItxlserLovbkRZpS9g8xI?=
 =?us-ascii?Q?fzlcMDpH2XUfWYzibRSjMDJkVhWMHVMd5GtHB0RFFbmmRMSCJWaXrv+XeeIP?=
 =?us-ascii?Q?VyQyuupMhCrjutSzjmQRi0hgCchcy+KGhzcAEr+undoGge8U4h1759xFAHaQ?=
 =?us-ascii?Q?ICDZKFf4lz27CLbrm7rWeZrZRUZXmFZMszOt7Bg8D6Ke7NCMxYl1Nm/n9Cxw?=
 =?us-ascii?Q?2ConhBkS107vpkTvwzA55nfOj2oZXtTQMykDRon8X5xEUh2U3R27BBWyNv8q?=
 =?us-ascii?Q?6tJtcFTp8Kd5j+BkBW9pTQMmJI8KUchZ5OXOywut7mKUOipBTA8Qg3tcutnf?=
 =?us-ascii?Q?uWtaw0kAdE7B41cjvGrgCzE+SY2CTMp1lGpRJLMGsLa9uriYP94S6+OkgwQ+?=
 =?us-ascii?Q?qAX8uJ1o32bc1AgbjJTzQrai1OmUNW2y7D4RznESvQlLL8WK8DADO/rBynKr?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	P5di3D2gqRr7aE8lBMVuoV+774d4vN4tw8XZUTXniuuPDfOdAP5xd897/+7Z+Yp2MLm1054J8+xHPLmVhn8YpayqfTuOYeOi+o7I2D5S4NpKtuoGuxkQKhleFNWXnN7Zzb86TnB0m/Y8R2i0spFWARGk6Nityo3yaoU/4bObEKWxTvPBuPovTm1qcGxi1Ff26pxjV79svpptAzpr3EIhnHxLd+QO+pYHNcCKPQoE6YZQmlKE/1Cm84YCMwV+HZ5EFH/2/uNv9M+U994fZ9RZd/czbRGrgc/Zjwwl4JO/06+0NbDGo2zOUb1cft4IBiMDNi0TsMcf4A1aGDDGhSIjzb8YoMQuGNMFDEBZ1qKS4N0mBFU2Jjw7UWR6H6q7EcRVBhqf3LxasV7MfOo59jiURnDVDLxB3XayXzVvkki9OYccxl6Sm1vBVYPfw4I8SViFAa32ZmS8srJFDJBJ2EeXYTgWEhphyt0NHHq38yaUmDFElkeXV+8c4p3h9+RcZcysymdf7fp4/fI6jfB9lAx6qcs5GJrxcMnC42kYZI8xxh+owZX2KHd5Y4cSy4PRcSqE9JIKgdr59F8vtpnZqY3hwpeIE5HfYMTgJf01JVODa9Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f12fac-2d80-43c8-e642-08dd7b06e878
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:46:15.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ga1Ugbygf2JcPiBZu8+/sQ1s1BlYTsDqt2kOlONXXy7opZj4vr/QBsRSK8qofy1tXEynm+pk1JWCY8bq95ilgRDuLZSgrQGw9cqsOz3KfoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB583D803
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504140026
X-Proofpoint-GUID: x2w-Hq3N11mBrFJuEoemsPm3_9WYSaHj
X-Proofpoint-ORIG-GUID: x2w-Hq3N11mBrFJuEoemsPm3_9WYSaHj

clear_pages_rep(), clear_pages_erms() use string instructions to zero
memory. When operating on more than a single page, we can use these
more effectively by explicitly advertising the region-size to the
processor, which can use that as a hint to optimize the clearing
(ex. by eliding cacheline allocation.)

As a secondary benefit, string instructions are typically microcoded,
and working with larger regions helps amortize the cost of the decode.

When zeroing the 2MB page, maximize spatial locality by clearing in 
three sections: the faulting page and its immediate neighbourhood, the
left and the right regions, with the local neighbourhood cleared last.

Performance
==

Use mmap(MAP_HUGETLB) to demand fault a 64GB region on the local
NUMA node.

Milan (EPYC 7J13, boost=0, preempt=full|lazy):

                 mm/folio_zero_user    x86/folio_zero_user     change
                  (GB/s  +- stddev)      (GB/s  +- stddev)

  pg-sz=2MB       11.89  +- 0.78%        16.12  +-  0.12%    +  35.5%
  pg-sz=1GB       16.51  +- 0.54%        42.80  +-  3.48%    + 159.2%

Milan uses a threshold of LLC-size (~32MB) for eliding cacheline
allocation, so we see a dropoff in cacheline-allocations for pg-sz=1GB.

pg-sz=1GB:
  -  9,250,034,512      cycles                           #    2.418 GHz                         ( +-  0.43% )  (46.16%)
  -    544,878,976      instructions                     #    0.06  insn per cycle
  -  2,331,332,516      L1-dcache-loads                  #  609.471 M/sec                       ( +-  0.03% )  (46.16%)
  -  1,075,122,960      L1-dcache-load-misses            #   46.12% of all L1-dcache accesses   ( +-  0.01% )  (46.15%)

  +  3,688,681,006      cycles                           #    2.420 GHz                         ( +-  3.48% )  (46.01%)
  +     10,979,121      instructions                     #    0.00  insn per cycle
  +     31,829,258      L1-dcache-loads                  #   20.881 M/sec                       ( +-  4.92% )  (46.34%)
  +     13,677,295      L1-dcache-load-misses            #   42.97% of all L1-dcache accesses   ( +-  6.15% )  (46.32%)

That's not the case with pg-sz=2MB, where we also perform better but
the number of cacheline allocations remain the same.

It's not entirely clear why the performance for pg-sz=2MB improves. We
decode fewer instructions and the hardware prefetcher can do a better
job, but the perf stats for both of those aren't convincing enough to
the extent of ~30%.

pg-sz=2MB:
  - 13,110,306,584      cycles                           #    2.418 GHz                         ( +-  0.48% )  (46.13%)
  -    607,589,360      instructions                     #    0.05  insn per cycle
  -  2,416,130,434      L1-dcache-loads                  #  445.682 M/sec                       ( +-  0.08% )  (46.19%)
  -  1,080,187,594      L1-dcache-load-misses            #   44.71% of all L1-dcache accesses   ( +-  0.01% )  (46.18%)

  +  9,624,624,178      cycles                           #    2.418 GHz                         ( +-  0.01% )  (46.13%)
  +    277,336,691      instructions                     #    0.03  insn per cycle
  +  2,251,220,599      L1-dcache-loads                  #  565.624 M/sec                       ( +-  0.01% )  (46.20%)
  +  1,092,386,130      L1-dcache-load-misses            #   48.52% of all L1-dcache accesses   ( +-  0.02% )  (46.19%)

Icelakex (Platinum 8358, no_turbo=1, preempt=full|lazy):

                 mm/folio_zero_user    x86/folio_zero_user     change
                  (GB/s +- stddev)      (GB/s +- stddev)

  pg-sz=2MB       7.95  +- 0.30%        10.90 +- 0.26%       + 37.10%
  pg-sz=1GB       8.01  +- 0.24%        11.26 +- 0.48%       + 40.57%

For both page-sizes, Icelakex, behaves similarly to Milan pg-sz=2MB: we
see a drop in cycles but there's no drop in cacheline allocation.

Performance for preempt=none|voluntary remains unchanged.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/x86/mm/Makefile |  1 +
 arch/x86/mm/memory.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mm.h   |  1 +
 3 files changed, 62 insertions(+)
 create mode 100644 arch/x86/mm/memory.c

diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 32035d5be5a0..e61b4d331cdf 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_MMIOTRACE_TEST)	+= testmmiotrace.o
 obj-$(CONFIG_NUMA)		+= numa.o numa_$(BITS).o
 obj-$(CONFIG_AMD_NUMA)		+= amdtopology.o
 obj-$(CONFIG_ACPI_NUMA)		+= srat.o
+obj-$(CONFIG_PREEMPTION)	+= memory.o
 
 obj-$(CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)	+= pkeys.o
 obj-$(CONFIG_RANDOMIZE_MEMORY)			+= kaslr.o
diff --git a/arch/x86/mm/memory.c b/arch/x86/mm/memory.c
new file mode 100644
index 000000000000..99851c246fcc
--- /dev/null
+++ b/arch/x86/mm/memory.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/mm.h>
+#include <linux/range.h>
+#include <linux/minmax.h>
+
+#ifndef CONFIG_HIGHMEM
+/*
+ * folio_zero_user_preemptible(): multi-page clearing variant of folio_zero_user().
+ *
+ * Taking inspiration from the common code variant, we split the zeroing in
+ * three parts: left of the fault, right of the fault, and up to 5 pages
+ * in the immediate neighbourhood of the target page.
+ *
+ * Cleared in that order to keep cache lines of the target region hot.
+ *
+ * For gigantic pages, there is no expectation of cache locality so just do a
+ * straight zero.
+ */
+void folio_zero_user_preemptible(struct folio *folio, unsigned long addr_hint)
+{
+	unsigned long base_addr = ALIGN_DOWN(addr_hint, folio_size(folio));
+	const long fault_idx = (addr_hint - base_addr) / PAGE_SIZE;
+	const struct range pg = DEFINE_RANGE(0, folio_nr_pages(folio) - 1);
+	int width = 2; /* pages cleared last on either side */
+	struct range r[3];
+	int i;
+
+	if (folio_nr_pages(folio) > MAX_ORDER_NR_PAGES) {
+		clear_pages(page_address(folio_page(folio, 0)), folio_nr_pages(folio));
+		goto out;
+	}
+
+	/*
+	 * Faulting page and its immediate neighbourhood. Cleared at the end to
+	 * ensure it sticks around in the cache.
+	 */
+	r[2] = DEFINE_RANGE(clamp_t(s64, fault_idx - width, pg.start, pg.end),
+			    clamp_t(s64, fault_idx + width, pg.start, pg.end));
+
+	/* Region to the left of the fault */
+	r[1] = DEFINE_RANGE(pg.start,
+			    clamp_t(s64, r[2].start-1, pg.start-1, r[2].start));
+
+	/* Region to the right of the fault: always valid for the common fault_idx=0 case. */
+	r[0] = DEFINE_RANGE(clamp_t(s64, r[2].end+1, r[2].end, pg.end+1),
+			    pg.end);
+
+	for (i = 0; i <= 2; i++) {
+		int len = range_len(&r[i]);
+
+		if (len > 0)
+			clear_pages(page_address(folio_page(folio, r[i].start)), len);
+	}
+
+out:
+	/* Explicitly invoke cond_resched() to handle any live patching necessary. */
+	cond_resched();
+}
+
+#endif /* CONFIG_HIGHMEM */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index b7f13f087954..b57512da8173 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4114,6 +4114,7 @@ enum mf_action_page_type {
 };
 
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
+void folio_zero_user_preemptible(struct folio *fio, unsigned long addr_hint);
 void folio_zero_user(struct folio *folio, unsigned long addr_hint);
 int copy_user_large_folio(struct folio *dst, struct folio *src,
 			  unsigned long addr_hint,
-- 
2.31.1

