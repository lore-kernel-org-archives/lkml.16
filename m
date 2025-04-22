Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6084BB666
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349770; cv=fail; b=OIipdst745auHusMbqGz0htKkI4rPZuC+Q+iGvqcHzmgXjXr+vu8vmjYn0zggSChTRFGO+PGEB4wXKdIIRak6J/wAIr5bzhU5vOBsB6JMGz2B0qrAJ+S25aenQkOdjHPWP7SE+4fU1lhgG6R38RpQzHWIyo2XweXQu+LxA47VwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349770; c=relaxed/simple;
	bh=lZ6Bx9Kl/E0XRGGR8ziff1q427xABKl9AIgpqz/E6Sc=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=BpMVlAC0FoPfduE3JlmYIjfHhhptlEgofqwz3cN9U6AFvcpcPRzuZOI2d2b4VnKBtl/lawB+E46Ga+jKsnoaO8q8fW58MyDQdJOsR1tFeu8RmKbNnrrn0wB4s+fE6mIWcnZa8wmBBU84VcV8EO3ufXsGaQ+Rfur9EXMqDFyeLWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o1Xnfh6I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JcQaRqog; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o1Xnfh6I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JcQaRqog"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MFswbG005327;
	Tue, 22 Apr 2025 19:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=+Z1rA0XQc83QNCOD1x
	BHsiUXTgYQ3I6Dr8lyhYMuhHM=; b=o1Xnfh6IhaAve4p73ki/gyKzQriHuoJBOU
	r6ylf/mXHAHCK70MoL8cfUoUDf1G3CXC6wdi5BwIn/FHwv8aeHj/1Puxj6+2VfDo
	YdNSZK/dcF5uvnlJYZTv4UYN3VWRYe8AevHY9OQ/r6a8yCsT8dmNTBtpD6rUZYlN
	56zv+A9escgsYvkQozM0b3bLHRZ9I8ecYq/QF38WvH1wwDgu3DQ0LjtDnXzTQzuQ
	FsbSNwbAeref1Y5guzgkkR6igVa7jUwghF8C8w314cvV604mPRBeMb+ARNevPIBW
	Bo7NXOAsCkmjtugNXCslM2e1ETZt7W6HkE4EC7ezXBrN7ezwQj+Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4642radd94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 19:22:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53MJLWC0005771;
	Tue, 22 Apr 2025 19:22:10 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013060.outbound.protection.outlook.com [40.93.20.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 465dek1krt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 19:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMpVx1nOiPXzrHtxJWb2yhqlCa6D4HthQy8tgbHICSITyX/XqptVzq0XcK7XdpyX9Ec9Y5roSGKFQ6SsVSx/qqv5IxkF+IYXKAlkguATT1A81ygJVXHNSO6y/vR+7Xf5oFczv1rl7relMVp6KqdxqDUPtoQvHer+ruzBiSjBifBcyo1Toe6zzGdMr5zKm4u5aB/Ki39zNvbzke5RNDU5woRLqdO6U5aIHVMBBh/VT9DCFRO01hE73QFTXmRlOvn3UwFZSWcC8vW01gLpMWHR5K77dtMzBTRcPdnn8QEz4Mval/bt+/pp1K5vJG03vFkBav342xhzDKUeerXneglYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Z1rA0XQc83QNCOD1xBHsiUXTgYQ3I6Dr8lyhYMuhHM=;
 b=DQON8liKtt0tAukUrnp2caRPIbbkcjTx+R1HXWsamtoZ7KzliGdOWfwNLMKPYYTR/7+HinW48MWr47yxD1LjP3VNcM4TquUTbyJKqw4hyzIZVhHTQ63mUqx1ZX/FiKD0YqZGhRwYXnKt9Q0rCERUCZEq7S3UeB4BNw2hqe8AYgrpvoPdhi8gDC3v+GQtXrcPTTEwI7hnH6BR0bQ2MqfK6d3hpYxU4dKkFnjnZlUOmrsi666v99JGiVkq4pFjqvSU/hrUBydmB9WHzzqHcDZlgfKXt/SDIUZ4nn2jyjo5232tqU1dsxsAnjzWvTubpp52mdAp2lKw/2fnsRnyDDWDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z1rA0XQc83QNCOD1xBHsiUXTgYQ3I6Dr8lyhYMuhHM=;
 b=JcQaRqogeGwiIbbQ/ajf2DvEkuuw83rGqC2LzoenKh4F5BPATVKO3kXUv8I6gfHvU31tlRjofHm4tJVD6oIT5/7CZnVbVxRWLCn5ILa9IZ6vtTPnqz74jOqQIRgJ/L2YWh7NA/psSW10rj3Cx7qOclpvxt1rnpHpKul9Mep0HQA=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by LV8PR10MB7870.namprd10.prod.outlook.com (2603:10b6:408:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 19:22:07 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 19:22:07 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <0d6ba41c-0c90-4130-896a-26eabbd5bd24@amd.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
        paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
        willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v3 0/4] mm/folio_zero_user: add multi-page clearing
In-reply-to: <0d6ba41c-0c90-4130-896a-26eabbd5bd24@amd.com>
Date: Tue, 22 Apr 2025 12:22:06 -0700
Message-ID: <87jz7cq9wh.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:303:b6::10) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|LV8PR10MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d786802-a52b-417f-f1a5-08dd81d2f8b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0ARCYdFA6Gx5hIfGU5yHwwwaVhV+wudB3yjnkR35hzF2qTZOnPvyU+cJ9cA8?=
 =?us-ascii?Q?JwAK58oZ27rjgbvvDRvip93PIOrXnUMm+yRuwVzcL17Ez2Q0CZ+kLMfc5Hd9?=
 =?us-ascii?Q?4urcqrUYOTR9A/N4YQ9rR16tJSH7J7J/iCm0h7fWXheFbpUqMrlC99+M5Lfl?=
 =?us-ascii?Q?Tjrwehr7G9mUZ12jA/BolbCESmfvWfc8XqB9316Q7QBbOtC6M50/a/qbCEYp?=
 =?us-ascii?Q?pOIsWc+i5Nqs08jnHhDAuO/4h7OUiEwxvhvFrKq0bsN7iSJ3CuQ9FkgzKVtN?=
 =?us-ascii?Q?ETuHGyG5dffRivqKpxR3xrY8r2zNbxELV1SNXbcWXctJ+JqDwIFoFhPDxmz8?=
 =?us-ascii?Q?odKlZuQoZCzqo0SMIkrJI9NIkomin9TMBLvW3n3XRIrYWGZNtVZdITnaQOaI?=
 =?us-ascii?Q?UZjotO5WlK7p0kp+bsVWzGfBRizecaqFAGOczLcw1Jw3T3EWAJJqkKHCGYaA?=
 =?us-ascii?Q?yYgqkSmF2Y5UYfMsyczldtCHYZTcOEhCZnzo+baLO5J7WbQLfmw6NENZbCHz?=
 =?us-ascii?Q?9ItBsSgoTQOuyLDdDbr4K2B+XLRPwaSYfbD29nLeFVWuRVqNyk6eguYX4AsQ?=
 =?us-ascii?Q?DfiMzzgLTfsBidVFLHXz/cboOYz2N2EKuWf2ZiemSdVxkp2uqSC9pYz6AIq4?=
 =?us-ascii?Q?WWuGQeNzxuwRYnNrZYAJ3gvH4FAwqbMMFgyc7WRs6VXfioxIv3++CK/cqTXY?=
 =?us-ascii?Q?IpdOvWLB4aThYJ+g+RjT0lM4oXkHQuLfPZjw5f+GGJ2A6e6CtTL44j0aB3dA?=
 =?us-ascii?Q?KpGN11NUe6qg1OhKigSUqMZnlhara8J88fiwEGNurJzY1dwnlVrN2hppcjc1?=
 =?us-ascii?Q?RS4y410sRubzKIlVP1aa+KfAMLprxn8vIm758MAc9XLB5wPqy/Zfna74KixJ?=
 =?us-ascii?Q?fEcuJc1Ng35tG/YVQaJXk7VYQEQcplcm260GeMIvnUe4E1v//85OlOX7Ictj?=
 =?us-ascii?Q?Vvojyo7GWxdbDb2bIxd4pTOqUT1k9uuzyHCpXYBb/ayFk4pNZ8DYsNfqdpAK?=
 =?us-ascii?Q?e0UQ+jVxGYkAS9ZCriFdZ4KK0dO/f2nTCFpHI/IJPobTZQbo8WbXvSsGOTWI?=
 =?us-ascii?Q?VvkP0D+wZt/DAmq6e/qhGu6MH/gbE3sqELRMcurFyF6MqfKFkG1v59U1rLto?=
 =?us-ascii?Q?gKugTsGJjrZ+Sz31KE+ILrMvvLrBgYCYHoECZmUBN/XzOISWv9JUey48Fw8h?=
 =?us-ascii?Q?y1JD1u2z8LQP7nuIhx/YGgViHffx+7hcpjrADcpwkehqd/dLDhX8mAufoySb?=
 =?us-ascii?Q?I9S1C9rsy/BGBKwOgpTJGtjr7Z4IYuEDrDXa2YRsVFPN77B+1pb4PpLprPDa?=
 =?us-ascii?Q?XrtH9OIkWre4JduxLp7SpmARYhpqW00eI13DxOZ7GOaUkK7lmG6tYKx0duNf?=
 =?us-ascii?Q?USEAWKcJjoWdF3XSk1t0pjQxJYwcaPnjq/lba86UY4ysKphwVlglHnHNrA7E?=
 =?us-ascii?Q?tqzOM4SrQ2A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aI+D+5nzjiJw8QLEZDY5P8YRG7pkl/zv4//9NnKHGcSlwouu9VnKR4veZgCC?=
 =?us-ascii?Q?NvbvG5Bh4H+GUYo7H8nTeZUKLGjTLCi1uGWzVINNil+ZIMo53x2h5Xb+k78m?=
 =?us-ascii?Q?tLbfI2Ymb9J1NupqtVH7GsY1CDMA6iJxIuOvpum6t8C4nbpFUYEyzqYlgSEu?=
 =?us-ascii?Q?bv3uNh0E2KHoha5mThq/FH1IA0ycJ3aj7QFB5XlKXHLBJ0zudidsr4VTbU4h?=
 =?us-ascii?Q?tjPRePdlJ6KdDHrdN4VYBTpF54jYTSnu8S6CG3k5RQu7b/++YOl1vUTD/Y8P?=
 =?us-ascii?Q?Oaljp3xe7x/9aEW+v+6MdR0R6KFw7lZ3zdDKpOhSiajW6pvWgp97xoMAq+N8?=
 =?us-ascii?Q?TZkDvQERx5ySvLxaMDCdlnUq+p6xU8nwTk2DOdAZBZXLWh1tSVtcWYCPXnE1?=
 =?us-ascii?Q?LPDEdvrr4FB3vYqP6D9qlU6LNhywGUpqhUNg+AJQxUhd60ZroLjpDhH1PCTQ?=
 =?us-ascii?Q?RWaSfVPzI/WSa3pPD2IJXmO6cE22mxkaZlOT/6tWwzsvw1PfQu9PxsMHDU8S?=
 =?us-ascii?Q?fN3+IXWN9ti7+Mu48PSOKltNMeXbtpZSQn21WBSseTxcnJ0rFfpISS8i141u?=
 =?us-ascii?Q?B5SFIgHltxF/5PKKAGa+4onmj5rWGJ0cH5Hcw5J2HlLWxUNmHHsyvZSTKzW5?=
 =?us-ascii?Q?AOFDQGPGkc8o1xkafTRS0ZE4NYI4UscdwWxTNpIDY7wWSDvaZb6txrp7PbPJ?=
 =?us-ascii?Q?dI7M7hh5hrxf0KpwvXHvYjNKWyu2LJDcU9wpZujbZN7+bZDXggagEBt8Elbp?=
 =?us-ascii?Q?a4I4wRWKBQe+Jij9xltL1nU+mwccPclOcFoHRhY2fJcRb95ZJ4YeVOU6fYTj?=
 =?us-ascii?Q?G2dFeWCVMvYWQjREhUMO9vVBIgVTjHjxosydNfe9lnxNOPZQs/dTXTqU+LxD?=
 =?us-ascii?Q?Am73aa/joF8OeMpV/iuf5p4JBnaDbCiiC57tHSlI86p1b9q1RDPqVb7kkqya?=
 =?us-ascii?Q?mOLBUHw1XtSbj42m73YJumrnk0WPt+O0u9xSMyt8Zk1INb5nodMqw8BhQGxE?=
 =?us-ascii?Q?SZgAJpgh135wPNETnS+/5fChORSV3iWwSZf7v3l4nNpjnhJZbya5DCLPfgoC?=
 =?us-ascii?Q?OkVCEDigJViJD05xgnblyX3TJkYxVG/OSpiCYL4hNh/oP2jVIhNa2HrMBg5t?=
 =?us-ascii?Q?N5T5nf00jzMVocRLygKnpiT7yF1wOFwO8GrWBpohiZMjoJe0Lntax9iqtGZ8?=
 =?us-ascii?Q?nsmi5ydtamHRrPSBklBzuuAa2ghdUTHuoMKaBqpFNy0q2Q81tg9IEghimrRv?=
 =?us-ascii?Q?WMgl7AbwYPiUX0TerbfME6o0RUBz30NKt8iVnnGtRTJ3Yt7lJoQznGvp/Kl8?=
 =?us-ascii?Q?GT441AiyoVf58097rgctPPfkC6Oth3LAH8xwfWyHyVoyfkxTJQn5CYT6tDFC?=
 =?us-ascii?Q?eoYs+UKKWZIjd1FB3vZAlbjGZLm07AFDDTNtmFO5wNOG3nqwyU7BNFQVpWqu?=
 =?us-ascii?Q?QW4CM8iNO0PPvzFrwL3EdjJNSwPCffR9jYbxQq1cb54avDng6927v32TIElL?=
 =?us-ascii?Q?Ej8cBKOft2oej8Y3iIh3gQm9Z2P9fWwBBO3W3CizlhoEBbFVCLfntmoEk7mW?=
 =?us-ascii?Q?xapFHQDTBRj35X2hOs68XbsBMpMELAuxHF6iIsjZL7s9LLXRMDQZaZYKNChh?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VDtahvOQjpum2iQly90WcRgSsM0HnE7WN8J5SOM5mEx85C3Kx1zDx5xF8NIWvId1IamSpACy3m9T4536ynIKHY+YpwCw0cl6Z/fZDPlWpYWtZPCNRGQU8TyUMCOkeiNAczRVW3nh7JjC1hIBpaSHGe9fNB8UAzIzDzr6iTzfwkQem3o4EOB1CM7Vtwc9VZtcfz5ER9z9Zr/8gyyzFPew8+YczSFJ1vD4adcErNRIbCHkn9bOknXWlkD1dOiIipi5G975oCiYZ2nGE7bVtOWybJnBmbCYoviur1EF7qyxKrCfF0uyCid3MB1aMolxg0j7Zt/nJkQXJ/NjBplX7c+1gzhbkDvRlU86I9TIrtmXi/ETwgELKJdSSUdmGolHC4LPY6WpzbG4w3GojegpJ1aqXuZCq8I9JeKFz7pLTZL7Cr81w73fhMrL7vopoBRSEmwYoPuYqx39xNw1EWdG69M6VK5gDd2d7TdEAGIWbD4VcIgzWASqBQiz/PsmjNPvDQVH58+uEHOAh+mTE2d0KVpEjBVHQLShzzMlsvhSUJ9mYs7UbQrG4VqJ7+GBkkbPf2JqIum4fXDyGsgTVJM5xxvx5pDBQDqgDcPxoh8rWSFsvgQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d786802-a52b-417f-f1a5-08dd81d2f8b5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 19:22:07.3692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvu8h+GshYsMZinC63p0J9BrtVQxZ6CcgAawz14nAiBhBF7FHryFH+cv3xtGxoUL1Dlv9SeNxAG5WRI9qY6Vae9F/BBVgBo+qhEDfxuKnAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7870
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_09,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220145
X-Proofpoint-ORIG-GUID: iI1MPi_-V9DtXFVEUpWvclqr7jxhlpzq
X-Proofpoint-GUID: iI1MPi_-V9DtXFVEUpWvclqr7jxhlpzq


Raghavendra K T <raghavendra.kt@amd.com> writes:

> On 4/14/2025 9:16 AM, Ankur Arora wrote:
>> This series adds multi-page clearing for hugepages. It is a rework
>> of [1] which took a detour through PREEMPT_LAZY [2].
>> Why multi-page clearing?: multi-page clearing improves upon the
>> current page-at-a-time approach by providing the processor with a
>> hint as to the real region size. A processor could use this hint to,
>> for instance, elide cacheline allocation when clearing a large
>> region.
>> This optimization in particular is done by REP; STOS on AMD Zen
>> where regions larger than L3-size use non-temporal stores.
>> This results in significantly better performance.
>> We also see performance improvement for cases where this optimization is
>> unavailable (pg-sz=2MB on AMD, and pg-sz=2MB|1GB on Intel) because
>> REP; STOS is typically microcoded which can now be amortized over
>> larger regions and the hint allows the hardware prefetcher to do a
>> better job.
>> Milan (EPYC 7J13, boost=0, preempt=full|lazy):
>>                   mm/folio_zero_user    x86/folio_zero_user     change
>>                    (GB/s  +- stddev)      (GB/s  +- stddev)
>>    pg-sz=1GB       16.51  +- 0.54%        42.80  +-  3.48%    + 159.2%
>>    pg-sz=2MB       11.89  +- 0.78%        16.12  +-  0.12%    +  35.5%
>> Icelakex (Platinum 8358, no_turbo=1, preempt=full|lazy):
>>                   mm/folio_zero_user    x86/folio_zero_user     change
>>                    (GB/s +- stddev)      (GB/s +- stddev)
>>    pg-sz=1GB       8.01  +- 0.24%        11.26 +- 0.48%       + 40.57%
>>    pg-sz=2MB       7.95  +- 0.30%        10.90 +- 0.26%       + 37.10%
>>
> [...]
>
> Hello Ankur,
>
> Thank you for the patches. Was able to test briefly w/ lazy preempt
> mode.

Thanks for testing.

> (I do understand that, there could be lot of churn based on Ingo,
> Mateusz and others' comments)
> But here it goes:
>
> SUT: AMD EPYC 9B24 (Genoa) preempt=lazy
>
> metric = time taken in sec (lower is better). total SIZE=64GB
>                  mm/folio_zero_user    x86/folio_zero_user     change
>   pg-sz=1GB       2.47044  +-  0.38%    1.060877  +-  0.07%    57.06
>   pg-sz=2MB       5.098403 +-  0.01%    2.52015   +-  0.36%    50.57


Just to translate it into the same units I was using above:

                  mm/folio_zero_user        x86/folio_zero_user
   pg-sz=1GB       25.91 GBps +-  0.38%    60.37 GBps +-  0.07%
   pg-sz=2MB       12.57 GBps +-  0.01%    25.39 GBps +-  0.36%

That's a decent improvement over Milan. Btw, are you using boost=1?

Also, any idea why the huge delta in the mm/folio_zero_user 2MB, 1GB
cases? Both of these are doing 4k page at a time, so the huge delta
is a little head scratching.

There's a gap on Milan as well but it is much smaller.

Thanks
Ankur

> More details (1G example run):
>
> base kernel    =   6.14 (preempt = lazy)
>
> mm/folio_zero_user
> Performance counter stats for 'numactl -m 0 -N 0 map_hugetlb_1G' (10 runs):
>
>           2,476.47 msec task-clock                       #    1.002 CPUs
>          utilized            ( +-  0.39% )
>                  5      context-switches                 #    2.025 /sec ( +- 29.70% )
>                  2      cpu-migrations                   #    0.810 /sec ( +- 21.15% )
>                202      page-faults                      #   81.806 /sec ( +-  0.18% )
>      7,348,664,233      cycles                           #    2.976 GHz  ( +-  0.38% )  (38.39%)
>        878,805,326      stalled-cycles-frontend          #   11.99% frontend cycles idle     ( +-  0.74% )  (38.43%)
>        339,023,729      instructions                     #    0.05 insn per
>       cycle
>                                                   #    2.53  stalled cycles per
>                                                       insn  ( +-  0.08% )
>                                                       (38.47%)
>         88,579,915      branches                         #   35.873 M/sec
>        ( +-  0.06% )  (38.51%)
>         17,369,776      branch-misses                    #   19.55% of all
>        branches          ( +-  0.04% )  (38.55%)
>      2,261,339,695      L1-dcache-loads                  #  915.795 M/sec
>     ( +-  0.06% )  (38.56%)
>      1,073,880,164      L1-dcache-load-misses            #   47.48% of all
>     L1-dcache accesses  ( +-  0.05% )  (38.56%)
>          511,231,988      L1-icache-loads                  #  207.038 M/sec
>         ( +-  0.25% )  (38.52%)
>            128,533      L1-icache-load-misses            #    0.02% of all
>           L1-icache accesses  ( +-  0.40% )  (38.48%)
>             38,134      dTLB-loads                       #   15.443 K/sec
>            ( +-  4.22% )  (38.44%)
>             33,992      dTLB-load-misses                 #  114.39% of all dTLB
>            cache accesses  ( +-  9.42% )  (38.40%)
>                156      iTLB-loads                       #   63.177 /sec
>               ( +- 13.34% )  (38.36%)
>                156      iTLB-load-misses                 #  102.50% of all iTLB
>               cache accesses  ( +- 25.98% )  (38.36%)
>
>            2.47044 +- 0.00949 seconds time elapsed  ( +-  0.38% )
>
> x86/folio_zero_user
>           1,056.72 msec task-clock                       #    0.996 CPUs
>          utilized            ( +-  0.07% )
>                 10      context-switches                 #    9.436 /sec
>                ( +-  3.59% )
>                  3      cpu-migrations                   #    2.831 /sec
>                 ( +- 11.33% )
>                200      page-faults                      #  188.718 /sec
>               ( +-  0.15% )
>      3,146,571,264      cycles                           #    2.969 GHz
>      ( +-  0.07% )  (38.35%)
>         17,226,261      stalled-cycles-frontend          #    0.55% frontend
>        cycles idle     ( +-  4.12% )  (38.44%)
>         14,130,553      instructions                     #    0.00 insn per
>        cycle
>                                                   #    1.39  stalled cycles per
>                                                       insn  ( +-  1.59% )
>                                                       (38.53%)
>          3,578,614      branches                         #    3.377 M/sec
>         ( +-  1.54% )  (38.62%)
>            415,807      branch-misses                    #   12.45% of all
>           branches          ( +-  1.17% )  (38.62%)
>         22,208,699      L1-dcache-loads                  #   20.956 M/sec
>        ( +-  5.27% )  (38.60%)
>          7,312,684      L1-dcache-load-misses            #   27.79% of all
>         L1-dcache accesses  ( +-  8.46% )  (38.51%)
>            4,032,315      L1-icache-loads                  #    3.805 M/sec
>           ( +-  1.29% )  (38.48%)
>             15,094      L1-icache-load-misses            #    0.38% of all
>            L1-icache accesses  ( +-  1.14% )  (38.39%)
>             14,365      dTLB-loads                       #   13.555 K/sec
>            ( +-  7.23% )  (38.38%)
>              9,477      dTLB-load-misses                 #   65.36% of all dTLB
>             cache accesses  ( +- 12.05% )  (38.38%)
>                 18      iTLB-loads                       #   16.985 /sec
>                ( +- 34.84% )  (38.38%)
>                 67      iTLB-load-misses                 #  158.39% of all iTLB
>                cache accesses  ( +- 48.32% )  (38.32%)
>
>           1.060877 +- 0.000766 seconds time elapsed  ( +-  0.07% )
>
> Thanks and Regards
> - Raghu


--
ankur
