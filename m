Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E302E1E2602
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051409; cv=fail; b=MCnt4Pun7DTkG3Y5kdfLht5EMsJtKrqaCbfObBeJMKC/07a29fzQEJVpZnrxlpXBPUKxLg2SxUKaUmPnviyewXRq4U02OhYoE1URDsCpcSyoXU5JUBzdRB2VUVwBSFgV2Vnwsn115mkcye7Sw6d2amZFUm9Jhqe8kSvH5G7m5Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051409; c=relaxed/simple;
	bh=KNwnABtUbj85DCMDJV0SX/5ozR4ewjgSkJzVrk2M/TI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pd5gfQ+R71ZHr5JCpnUgQ7DVQ4UD39FkR4F75WI2vosCFJmsV4cDsrUD10W14e66Z2N9OrDpE5zkl2WEaBMnQd1pdwIAJ4QqkEOdx8erEDjjxZpG81A6Aon1bSpeO/nOiyN7oYHmwROmxSbYrmQU3rlfLy7c2zW0fA80C+hwFgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A7I/IKKt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aLP8Iyzo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A7I/IKKt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aLP8Iyzo"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G00tGq013882;
	Mon, 16 Jun 2025 05:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ax8oqAQbuxYFo57boBKNyk+LvNmQt71tCdZ6bJbFdXc=; b=
	A7I/IKKtppRnFMtJtcjlWPbwE8nKj0Am3l5dVgbYqs4abpYqa/wgVcYCnIDC2AN8
	Gm2CgpQOtEICgzp3pTIYyRX2MmSYOkKYnC9lmf9NtyGDR8iblscuss0gwKeCSrtf
	gZA9fmVJupIggMBhnwM2bqYhJg2owRy6F67W1pCKjqHeAl9QxAs06KP5AnjPoY8l
	aRJe04Gfu/Yv3U1pKQnPuD75bH0KzjII/hQtCrj1l/8hSNaX1qqx9NkCfUXKiCQ2
	bI34QiZmN9QEdNjhClleLITeCo7PyGzEFYwSFyf4+4Pl+tzuFmy7iJU05meM2Fid
	ax9+rIiD0YrQhc34c9zVmg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r0v1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:23:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G4HOri036277;
	Mon, 16 Jun 2025 05:22:50 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013024.outbound.protection.outlook.com [40.107.201.24])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhdxwe4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPkP/UtfiPtLJIhSmaNlaT7PQUSocrZHgmYtVNNFgjfNyLGDtL+gGOWdCHTBk9iLkoptbsJqX7EA95wccXD4wnbDVc5Rbxe64wDR5ALaGnI7Kz1PkKSiAO/iX4bnOJRRFGsHbkLcSjDCloMKN7vbZInbI8XRzEVa3FDTaQ6cEaRMYIhbilU94wAYi6KykaY+pc1uePivIq/MKLJpGNGUsgCOxxGOjfnwO/O8bfE/HuQnkBg4ZP3UPVs54SqT/+GYN4wKq3F2RCVjGHWjvwtyMKuh53qgKIGeV9vu3fHfwkdRBcttgwhzn5EKeVIt/kkwEGGnmBBYngk6p6wn8jajyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ax8oqAQbuxYFo57boBKNyk+LvNmQt71tCdZ6bJbFdXc=;
 b=K4MDz4jS8T64HLxHEaLqzQOaVG1KV2qIhSjlRPad2oSlzOUkZaNx16jdft7x1CSTxQPe0rm8b6+pzU2ed1g3SH6aN5va6BBHd8ZLbqXPp2S7zaZbp58kHVHomNUir5vNXOiCIxtySL2wwxWfsbm5VHFUQ0Cp+ELskMamOGYUUbY93vgq1s5Hf/O8GlO8gRxadYoLd7jVHEjdQaCOdEcrl+Jos+T3gcihUJVlEHmptJAqg/yZqcd0kavImF4940omt3gNWqAF2zYSknj5OiCUW7VrovuOBDudbNED6mK6hg6sCQNQyyww4CqYfzvQA3DS4LHWPuG1WQVpWrq/eUW37A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ax8oqAQbuxYFo57boBKNyk+LvNmQt71tCdZ6bJbFdXc=;
 b=aLP8IyzoIz13hXqwo1R8ntRVfkMtcuDgl9oCAKvQ7RyLj6xywBfJ/YjRNKq7vo3dOWTJBSqN5Tj8O2cnPC+83LNMLPJxT8z0IRy7tdco3aRMNeKeiyRxASwYUYx9DihGwqsm801HeojGExroL1SFOoCEadvJVa42gMewVrL3PJM=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by BN0PR10MB4903.namprd10.prod.outlook.com (2603:10b6:408:122::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:48 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:48 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 11/13] x86/clear_page: Introduce clear_pages()
Date: Sun, 15 Jun 2025 22:22:21 -0700
Message-Id: <20250616052223.723982-12-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0125.namprd04.prod.outlook.com
 (2603:10b6:303:84::10) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|BN0PR10MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: e32860fc-639e-45db-22e9-08ddac95d51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wM7b0S6MMm8pE+8kShrp6v/d4XHhVM8ynFMQShUu7KBDdeBgMaF3GOWpZH8H?=
 =?us-ascii?Q?okIi3J4z2lSXOdlJHH5TbhSG08TVxBeciXZoGPyqoyflkw3vr7K8mcGokB63?=
 =?us-ascii?Q?Sz6HtbBjXDn0r44D9mNfwwx9+xEUv66bJOitwbAdyJwlTEzdMiXOOzhcz4E5?=
 =?us-ascii?Q?oM9eHP2aTtl93sGRuL0As+Kj69bdfkajYF24hBjPmfoFVHJKDjO2LKGg8HYt?=
 =?us-ascii?Q?gvN7aZNdeV4GgoXUNcMozsmJxeauRzRSECffg7sL4pKq4iFa7U4lxiGZAF0k?=
 =?us-ascii?Q?zJSca6bnFzeUFnme0qyJyP348/FzzxUdGFjJH4Z4julFWRJYg6WdDVqk0rFc?=
 =?us-ascii?Q?NPwaibbfJhPp8Pn/8CUK413VbTPaCp5AZ5tl1RNeMjhUmHXbOqAUTb0zMadL?=
 =?us-ascii?Q?dbs+St/fq7BXPmXxIRoph6m6b4BfXDnvakWMzNIE6wLT6jNptQR7Jh90SEGO?=
 =?us-ascii?Q?x06uvv/nzQtw5sOQc+K8MEJMKJI2YKDhIO7/qEl4sdiKn8FWbJci+CcDKWSx?=
 =?us-ascii?Q?1w3Gn1KexCuTfMXReAqo+FNnmp8rAtLycHAWkL3p3FITvSy1UpiGlWjiYHRL?=
 =?us-ascii?Q?PsaMtICRiX+i8n2iPjqlWiDwbCdpK8RlRKzp9poyXwk7QqkDB4KDFmOMQOPn?=
 =?us-ascii?Q?zKewv+/F3H+VA0A43idnhlehCvmD0ei0jeDybfND8R1RN9KJnuZrJFt+dKR1?=
 =?us-ascii?Q?16VA1BWdXGsOmbgGPFRkf+9r9U9WBTBeSuZ6O5xVlak4ihiI3eLyOUkFrJQY?=
 =?us-ascii?Q?1LOXaG3LlwvTOzPhUHZyihrY6LghZdycj0EaeYeOqcG2cvptp3mBQRSF4YLB?=
 =?us-ascii?Q?2x33KkrOa3QMyV2VBMcjwMoCHpUSSLIf7Ti27GNkOyalXO4s5SORIYn2+MjT?=
 =?us-ascii?Q?0fwCVrVKVup3RN2vqr32DX4STENeM+Ceub5kvFPDG5m3yW2en/JRrVTVsCh8?=
 =?us-ascii?Q?6R0TrpYIirAgxCtmLDxbBBirli3w5QS39hUyaata9UAVJqMARM+VHHvcVZ3L?=
 =?us-ascii?Q?C6CUlASwdAD+th/4p5J89SfLgKwgzrjPBLA/Jhk+odjxtEVs4QKjp9uUPnpm?=
 =?us-ascii?Q?RGIeK21UydTDk4giBIrKGFV1yRRr+QRbWJgSoYaJ39SH9urCK85X17pBNpQR?=
 =?us-ascii?Q?FXSjl7NVwKsXrN6d9tcodGk5TADLdbUVF04tdR+34Nah7B/Bga+QQzU3u4hh?=
 =?us-ascii?Q?MIEiJUBMp7WULtaIvR0vFg+fpuYln3DZvgMn/gex7zoXix6oRF2FyveVaWe5?=
 =?us-ascii?Q?CulgiOksBGgU6p9SLtbHYYOm3zrBGAV3vFfFvk3p9kkTsCYAlJoLecbsWF/m?=
 =?us-ascii?Q?Uevh+X/MqYYwGI5AHKqsiIQBU7RFxXg+Zco8wUbXHx4Sx2oOHeHZDVNqYnxY?=
 =?us-ascii?Q?zV8Djns4fiIU0pj0DUa3cXc2LgqPX3B5NFXMSOoe4m4TIpJ0+w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qCoJ8tONddh/9kdRiQKg7WRl3v9Bt3JhhroMlrVWy7zwAWTcR/xdkcd9pOOJ?=
 =?us-ascii?Q?FZk/nhLkPIOFBsV3PUVwDHuHwqun5eyj/eKGMgK/HWceAY2ilRmkP8uFxVfK?=
 =?us-ascii?Q?2wh9ymiBXAX4XczT4xbAHj0gnntriQER0gGoX9WaIxwbqEtJJryoG3nqEGKU?=
 =?us-ascii?Q?WPkRbQccutQd/i6DemuO2oncoDtAcxDpx7vcQa5nFF1ssadF4uQ71OM1e6pv?=
 =?us-ascii?Q?8Y6hYENQCDs/zw2n7OwHlrP9l80tqwev6FH8BFIB1T9p6zkVZHOlKeI0Ez1X?=
 =?us-ascii?Q?C/BlR07Y8pascf0GFWltiT++/pms1sWuvMmVcD607PmnUwdwU+/PJkZM6zF+?=
 =?us-ascii?Q?Y4Ffpvw3bct/vgkzKMC6mNXpD1mDNXnfeCLdsPOhlBNkDH1czEc78KCDPue+?=
 =?us-ascii?Q?V6T8JTqZlist5ULiPPA6UiIBVZxkGN+ull+sOyvPQkN8egKeR8txCt3SeFfn?=
 =?us-ascii?Q?q+g4ZumdHpVF1xRYG61BGhlPwyHptEj4oSFzt0zgQSn0dN+VmXs4duzpKGsQ?=
 =?us-ascii?Q?alFH0v0viGSgg1aZ5VuK/L4WLpec/vKA2/VeJcnlExioSRmPp79VL29sw+L1?=
 =?us-ascii?Q?VCJ/vlP8VSwvR9IlaLa6RvK0hmXycaoyHq1/xpBIQmCWBEvZqli4F5qVnwAO?=
 =?us-ascii?Q?M9VlmJBGZaYthIRCUxHJCySSty6CfFJXhZYrrGAVoc8SXI4IqI/xl/BbVuXz?=
 =?us-ascii?Q?4fslFzjT0ucSgkgZa6BigIFHLm92p6Y+ZnE6xWZjlgAHtxiAGqoE/u6cZzYl?=
 =?us-ascii?Q?cbm3/P4slY8hw3m0m5PFKGpPXq/Pc4PEHWuUXdFVxeQSjtLzI5DbT1CUDztS?=
 =?us-ascii?Q?MBbsRdi1P/EcLfi9CsWsRCvESHOYfn+6I6Ma5EgPbnDgHdPB7QoFatYvqfOy?=
 =?us-ascii?Q?BW1AUX0i/ZGMNuvfBYfXVGWqH4jbf9YKz1fd44+GEjOs4BulIYBO4HKZuXX+?=
 =?us-ascii?Q?4+Eq9vvn4pSVbrNx8W6fi2PN4c14qZ7z+aJqsRK7RP6kVu3nNfL8ndBUaxMA?=
 =?us-ascii?Q?sI9t/qBFQ9Wwrl1D7EMmS+Ehy75AnYhpYcD+ci25cgIxxoSrUsP7sm3pkASx?=
 =?us-ascii?Q?OJ8ipBWjpng9walqUPZSvzIICLbTtbCqOevY5GLAh7TW46gZLz8yR8cGSaLr?=
 =?us-ascii?Q?nilKssZxVjrdqDtGOUPl6XriFBrqOWBZmg8XjKwl27gCJKb8Az3ysWa3j7ut?=
 =?us-ascii?Q?jRoz2yItxVWj0DCvwfyo9ToCZAa/N0k4LBBzAWyJeN22Sxum7u9yZHQXilqk?=
 =?us-ascii?Q?QWV28M77gCxyj2Yzj8FSCjPtx29lTOJBJyI+GYtWi0dCR+2T7vTJHSanMY7Z?=
 =?us-ascii?Q?WDi4tQUVQkAImUtBTz8T+kbu64EkGhfKcHdTnjVjN+XkJ2kRzzMkencLQMcU?=
 =?us-ascii?Q?9jM88+enmkLtiX3eTvWyRRNsyN3N+sPQ3osnbkEXOCOfoDyDV19fp/Fr8Riu?=
 =?us-ascii?Q?BKHBf5QfeB3Vexy7Q+mao5KNMDp6eQmPP2xb0i/JW2tGbUrTKI6VVBg6AeJe?=
 =?us-ascii?Q?mzw0E1z6QQ0FpNld+DDn07zObrr+RFrmdQAmaG3YYFQAWPuxzzfo8Dppv02q?=
 =?us-ascii?Q?6Fi26JPT3NIyBqEkCk7d/vhp4DpE74xHsXg3ZNHiM9SvIFhoHWlNeNqQvcUB?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bXAXAOMPstpyDpeDzqLfSz1avMEJc2uNx+ZKn1I6dF9mwyiJHJUsV0OqYz28Og4H2ZUF4hNgmJTWQ5VxPQiHJJIbqOGesJ8Knrw7E4HatCE6lHfMREi64F7fzVgtMiNVpwXAX1yUiZXUoLtL5z9tPmPOhS+0O2jXIMZzxtZ1ri8pIL2gkLOOZa5kqX35hzilO/Jj/QEcNYWXBCduANkrdp2xR9O488wCE8z0nSm2BAZuWHLJS1GEwSLzFJrEWV4Yw4YwHrLsZbW3ptA90Y3NFA9BcOUSvkpA9MiFyo9nrOp0Mcu+uDNn/uJ7kfvHOLmnqmiKev00ME2MBo8UXnfMcL0hm4XgMvoyHnhxAAyXl8JPOAWd7iKAvtCcbQfOWI43hscIyblU/cKG3kYZm6O4rWNUXjf1hAwR2OWkdnOnKdLvJnT9pmRFx+t2NQNnITJORkS4YN7yKknh2HBZgKUSCKz6p/aYXOICxg50mrULWrogTgKJCY+Fl8K8rpWRInHtfF2swqgbXgQ7lepf6AtwUc35iqx8A2vd6bL8K/27nx7vc7gHoJhv4MgkddNBWxbaWMDyZ14W8rKCrmaO0qQla7TN7DNUNZTlBVLcFnmUGUg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32860fc-639e-45db-22e9-08ddac95d51d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:48.3255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eomAZY1FTMg4396MRUDvX+qyUrQfC1J3OpxEhVKE9BfmU9pH6P7nt606icSkEVhs80j0N2TUResaxSkQusFZcxfzx1k/Yop0XtncHDOJJfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4903
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzNCBTYWx0ZWRfX4QfYYXAS8NLX yjz71cjW2l5hDlIesNoRVKPwJuhOGfNVRDu5YesiNUuSSBwZEe1fYgVyBO/1sMY+N7c7PVAaJ/t c9eua6a3nYP6gDjA/PRMH7I/pqc+soeFzuBLfD30ANXv03y59ZZ123uFYXCSL7DkBCfBC/BZ5IL
 vFjSCldriYQZp8STNv3IfNC0V9spCpfr+c5ijQGXY8lOZq/0EC0NyM2Lov3+tjyK6f4FzSqVyb+ /AntD6kZocK/exm1MAv+TuB0Wfog6K8qujnHgZZVuB/xzT3XMm+Gkovvq8fi3ZlPeBOqOwVzZgk pVy5WXx60zo0Mv5a4saAezUW9maBsvhVTa6sKgwhy8LamtkDfNjfS1opePBWYSrTJIUi4AZP8Ff
 NJa/gyhdPmLHJgIVOwmrNZMKXBHY0zB9Vx04uYws9mWW7Hg857Q9I7vSIdrZv+o92Y/GoIq+
X-Proofpoint-GUID: yFvLRZGDbArqlCQ66EXZcU-LoJ1IMfN_
X-Proofpoint-ORIG-GUID: yFvLRZGDbArqlCQ66EXZcU-LoJ1IMfN_
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=684faa39 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=M8a9pf4_m8jl-BS7tPkA:9 cc=ntf awl=host:14714

Performance when clearing with string instructions (x86-64-stosq and
similar) can vary significantly based on the chunk-size used.

  $ perf bench mem memset -k 4KB -s 4GB -f x86-64-stosq
  # Running 'mem/memset' benchmark:
  # function 'x86-64-stosq' (movsq-based memset() in arch/x86/lib/memset_64.S)
  # Copying 4GB bytes ...

      13.748208 GB/sec

  $ perf bench mem memset -k 2MB -s 4GB -f x86-64-stosq
  # Running 'mem/memset' benchmark:
  # function 'x86-64-stosq' (movsq-based memset() in
  # arch/x86/lib/memset_64.S)
  # Copying 4GB bytes ...

      15.067900 GB/sec

  $ perf bench mem memset -k 1GB -s 4GB -f x86-64-stosq
  # Running 'mem/memset' benchmark:
  # function 'x86-64-stosq' (movsq-based memset() in arch/x86/lib/memset_64.S)
  # Copying 4GB bytes ...

      38.104311 GB/sec

(Both on AMD Milan.)

With a change in chunk-size of 4KB to 1GB, we see the performance go
from 13.7 GB/sec to 38.1 GB/sec. For a chunk-size of 2MB the change isn't
quite as drastic but it is worth adding a multi-page variant.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/x86/include/asm/page_32.h | 18 ++++++++++++++++--
 arch/x86/include/asm/page_64.h | 25 +++++++++++++++++++------
 2 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/page_32.h b/arch/x86/include/asm/page_32.h
index 0c623706cb7e..66e84b4b8a0f 100644
--- a/arch/x86/include/asm/page_32.h
+++ b/arch/x86/include/asm/page_32.h
@@ -17,9 +17,23 @@ extern unsigned long __phys_addr(unsigned long);
 
 #include <linux/string.h>
 
-static inline void clear_page(void *page)
+/*
+ * clear_pages() - clear kernel page range.
+ * @addr: page aligned pointer
+ * @npages: number of pages
+ *
+ * Assumes that (@addr, +@npage) references a kernel region.
+ * Does absolutely no exception handling.
+ */
+static inline void clear_pages(void *addr, u64 npages)
 {
-	memset(page, 0, PAGE_SIZE);
+	for (u64 i = 0; i < npages; i++)
+		memset(addr + i * PAGE_SIZE, 0, PAGE_SIZE);
+}
+
+static inline void clear_page(void *addr)
+{
+	clear_pages(addr, 1);
 }
 
 static inline void copy_page(void *to, void *from)
diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index 596333bd0c73..1b8be71fd45c 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -42,22 +42,35 @@ extern unsigned long __phys_addr_symbol(unsigned long);
 
 void memzero_page_aligned_unrolled(void *addr, u64 len);
 
-static inline void clear_page(void *page)
+/*
+ * clear_pages() - clear kernel page range.
+ * @addr: page aligned pointer
+ * @npages: number of pages
+ *
+ * Assumes that (@addr, +@npage) references a kernel region.
+ * Does absolutely no exception handling.
+ */
+static inline void clear_pages(void *addr, u64 npages)
 {
-	u64 len = PAGE_SIZE;
+	u64 len = npages * PAGE_SIZE;
 	/*
-	 * Clean up KMSAN metadata for the page being cleared. The assembly call
-	 * below clobbers @page, so we perform unpoisoning before it.
+	 * Clean up KMSAN metadata for the pages being cleared. The assembly call
+	 * below clobbers @addr, so we perform unpoisoning before it.
 	 */
-	kmsan_unpoison_memory(page, len);
+	kmsan_unpoison_memory(addr, len);
 	asm volatile(ALTERNATIVE_2("call memzero_page_aligned_unrolled",
 				   "shrq $3, %%rcx; rep stosq", X86_FEATURE_REP_GOOD,
 				   "rep stosb", X86_FEATURE_ERMS)
-			: "+c" (len), "+D" (page), ASM_CALL_CONSTRAINT
+			: "+c" (len), "+D" (addr), ASM_CALL_CONSTRAINT
 			: "a" (0)
 			: "cc", "memory");
 }
 
+static inline void clear_page(void *addr)
+{
+	clear_pages(addr, 1);
+}
+
 void copy_page(void *to, void *from);
 KCFI_REFERENCE(copy_page);
 
-- 
2.31.1

