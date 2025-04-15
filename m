Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360B4296173
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722681; cv=fail; b=e+hQ/lpN9hTAE0Bya7A7zlKBbKn3eacfz2bkccANHaGuDZgr5X5VYQE7V9oAPZNuFuf110V3vQmMbCQS7qnL55QfMu0IonlRpG3OM+PbXfkirwdxsWDSuiUZiPKYJ/LsKJno43eXD8Zlj+Dis6B/YOh+pWbbT0r8nqxgApya67E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722681; c=relaxed/simple;
	bh=uqnwUXTdb9sioV+NtWgQlIaUPnKasWmIuLsuAejQ8JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ot8DmwJH4RWy/O+Muo5HPe46BaSd4zw9Z6jHT3ypZmqrzE4OORIpkrCgklfr1TxUGx0PbG9OU7fUuVYYRxwZBbiS5XPc0vTX5RZLB/7LVeRzVxRd57uTIvS1hVCO519NB8TKVP2RB9ZGvwmZ1R8qAsy3QYeLBBQyrwSfDoKtPCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Up/9VgE6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RtBV2JDY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Up/9VgE6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RtBV2JDY"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F6gCNE010285;
	Tue, 15 Apr 2025 13:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=P/kCt4AmDQpwtw5uGG/HlVIV4+29lXNP4SeXu3Ayw7Q=; b=
	Up/9VgE69UCLo+VRSFHK8JxeVL+eYUFYITlE8ndAGYsDcxXvT9lGx2XBns8nd3RD
	q30/NiEAxH1y6zFHjfV4DqEHAt8+4VOErDQzrMLTnl2qJbzjpMQDoMtmye9DrhPT
	EIphRQLbzXH+fZ56quQ6vklwpWg3IQNzOemur39rd31/dhZa1DbpHS9nr5hwku83
	1AyXwuUEIZJxU7kez8copS8QYnCs3lBCQ01sWp+keN+j4Hin54SW4U2xsHod+Wfk
	/WvduWJN2iC1EqwsTNucGX+bQ+IhcC9JkCb3RlW3J0qTbNcNErtUGoSfy+NKxFna
	NoXWQCA3FbqyITaiTRrtdw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619441f9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 13:11:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FCmtcc009177;
	Tue, 15 Apr 2025 13:11:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3j0npp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 13:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNkXhGvZ8XBVzMSl5OZwzmQ6jm2JChgD1EG5Bk6/2hRJwJ65HAp1cY/qnhtJzikUUupS7T7vHCZwfeYQRMqahKwJv21Xdv3WJL0xkROOOaRUeGJPqxRqO8zwhosJLnvXjCovy9mOhPIqc6NKZg8SZxMVOGAj8nqR2I7uXw3HBiHENqNahQYkr/bgfPWmaYqNdIy07hVlRRF51E1ykoqauEn5VbfAWMxzWRPUhwmQZF75QXB/Kyy/MpwhIYb+1HQkmB6oiqysredkxcqqyc59y79u3aRN9RvS3tkrmilxV5l86GWJMghHoGXJGBFidtMYnnOHnmNs5CNxdz0R2phNKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/kCt4AmDQpwtw5uGG/HlVIV4+29lXNP4SeXu3Ayw7Q=;
 b=Ei/j+kMY4teNug0OxUQef73L4z0KjQlZ5sjXP9N1jaTCf4oU+adv9IpVytYf3obea6EABQSX5eZr/NAk2E1ZuTD6QfITVAxbDdmq1c8O128ol6dFHG4rkfp4Hw/bE4wHJ+Vu4YVyvshmqeqnTomeX9pY5Sf0wJt+w3v2oRouen1U84eetFf+6fDhRxUnS8kZmtnbsXtI8Xgl5IMJJbT08Oo46ngM5sujSLMVZT/E377TpHKQwn2daJUvLK3cF3/4KFTG4rFJkVLj4omMBTcvGn3FscP2VSC8NOj3SyNs1L+nhT0plCMeQFIgGGfgHagxPkT3DJeN3xEWJkE7WTU6sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/kCt4AmDQpwtw5uGG/HlVIV4+29lXNP4SeXu3Ayw7Q=;
 b=RtBV2JDYs1Uo7PwCGnTPtDeDHdk/wl/exuOeWw5sS6CqsfNkcqo0GnrZjOrYsHxeHLRmF3n9WV8hs1NkRGVzsPgE7nLcsycmDfQu8lSld4DTaSXlwocJA5ZaRdGTUPDChMLZFNq2Ap6salaRbqh+rS5L/TLU+CjgRr84qSVb9vo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6567.namprd10.prod.outlook.com (2603:10b6:806:2bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 13:10:59 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 13:10:59 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH 2/2] MAINTAINERS: add section for locking of mm's and VMAs
Date: Tue, 15 Apr 2025 14:10:46 +0100
Message-ID: <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0519.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a30cbd-f0c7-44ab-b0bc-08dd7c1ef6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3KpYvV4iIGp8RmaO0pNKn5T7gL5Qjhe6TxRVaqDdgFx/KLbITYCyVLbBbyM+?=
 =?us-ascii?Q?9ot7iQJ0h4SwKCGhAS1RwzPn4pscF3MButX+yQBDx2rP1D4V4ntbTqLGs1fL?=
 =?us-ascii?Q?E7ZeYoN7xiVElwydKz0pbj5GdcqaBIVvgnhP2RofrNLiGD2ooQMLR7/s0Frs?=
 =?us-ascii?Q?8hKhH0XFX6Zl0jm8aOnxh50TlA9Xx4AhYqc5+xa7zMi3nM4kzxURvpToama5?=
 =?us-ascii?Q?bBqgNOf9fmeWL2cyL96Gqxzp6aQrPqdAUFr/FiSKKQBa4dILS/oCthZLdcGi?=
 =?us-ascii?Q?BenBmabZec7aUM5SALIkWn2EYhqPlxuyL4ukK+pasFS0Fts2C+HbADw1UaPs?=
 =?us-ascii?Q?5XOe4rEfnii4ZWgFKDdmvUeZrfwGq5bjdaoV8AuWYTiArladOJiXgsogO6CF?=
 =?us-ascii?Q?I5NpMznqg8UXeruSah9E2pO4KH+jq9TpwrikyVoTNsoEf49iG6Jtx4VyZGTj?=
 =?us-ascii?Q?Ano4USOoCwFQI3P3Ah748A/0g/6hbMi4XVj+HqtQKf4rg7vDyAzEmFLvdlt+?=
 =?us-ascii?Q?L1rd+5c+wGiv1nXGgSEEMl+IfEEoyiQKHPsE2VILxMbe4vF0z4Ht4KVMu27l?=
 =?us-ascii?Q?zPhbmlJ4BOlLr8I6XqGkr9sA/cCqI8spjHmYmx+zNNR4Mzu7LEbO3Cl1qNKD?=
 =?us-ascii?Q?niub987aiM0hu5XLYmjTdr7T4/Xm1vDbGbY38txEvKEdCEuvUXrUAWR119VQ?=
 =?us-ascii?Q?2RGv99yalhY7cUA1efdDG7y/hLKMNkeIEtHN9Gf6Je6FFRfvOq/3ZNU6MUss?=
 =?us-ascii?Q?ktat2/icRgQpJICenGJ9P3CoDrgOa790KZeTehFjvf7iSsW14uCrAra8Pr+1?=
 =?us-ascii?Q?rg96dsPSyiXA/p0QcNWqBptTx8hCoOt6cU/cTxqc5hSdyB5DvzKtYt68pZvs?=
 =?us-ascii?Q?gkxoQ7JxPwV3TKic8WWpQktSkO58USnO5nQJs9w1jcGpChhumd3jy2D+ioQK?=
 =?us-ascii?Q?9IL/EkMgak/+cDQQ7O6IBMYLGu4mn9i2FDV9S+XQ4fRg8vf5KnABPsHzhOcB?=
 =?us-ascii?Q?0o8iR7PoN8DfeuTWCiPxOkIfvNavtLKiQg4iyikCGkAJs4DQFhhy9CXh9F9I?=
 =?us-ascii?Q?Fq/dh+mtzrWGRjIbrCBPoutAqvAk/b1eos8S8+OtFPk0YPHP4z2Yep+TUa6s?=
 =?us-ascii?Q?hfi8WlUaT00dMigwx47Sz0kQ/xCCbfSNXDvAfZW3eU6mi4efciRVYAaBrekB?=
 =?us-ascii?Q?5HpdYfV0VoIZO1AByv4YJYTryW5fKqBxaf/yRTe8GHFaLdsUFDuYxKOkcHoA?=
 =?us-ascii?Q?hsHce3hn5p0J8037NBEBD0zhUeMfiSOUVQ8DvMvbC16vDwrjTqe/kU0UBjVK?=
 =?us-ascii?Q?1hdwKusoP3i68EfZoUBzPrLMk1IRUsWHIQDvrN4tn1mZ4IAdk/L/OaLXk+T0?=
 =?us-ascii?Q?F9vDG5I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UAb1EWRWH14sVA50owIizt+ye5k4AITkZKXAdd9PMfPFbZFBFEGOy38YOGHp?=
 =?us-ascii?Q?N9tbyXvR3obJTsMNVBz6/93uUZl3uLI7COwJUzza7p/reTTe9ILIqPih6+1X?=
 =?us-ascii?Q?BW4sLehtQcYAtyDqAeANYKrS0X0yyURJXotd39WRKPPiH2Atk1UqFbo2Erin?=
 =?us-ascii?Q?jnyizJagZnM6p/CbRHmzB+PN4HgBjQenOCT0ln883CKxvDK9R3eOIlFSSmdv?=
 =?us-ascii?Q?MbCG+mOIuKmDXlS1euH0jiSg6gDV/BVrG8rjxYUA/+4doD7qoD+s+i7klsMx?=
 =?us-ascii?Q?veUqWXBQ1AFeKXEs/krPzbd1P9P1gh1cVNXIdGDsUpz6q+0WNS2AABT2btLF?=
 =?us-ascii?Q?8oY4b6SuZg+X6pkwCdyJuxFeniclT9JeTzC1TdBDjx8KXNp7ZClOOKjlTonq?=
 =?us-ascii?Q?8KdI0Xl7y5uT8TobYaOLjoxiqHghB35aRCwCeF54TXaEVHROEdDF0SCHUx9i?=
 =?us-ascii?Q?+MFw3CekrW5KdWQwpY8X/QMwC38bMruQohmvN5JlNWWAJQEhWeJXZgMDKPba?=
 =?us-ascii?Q?ZpkILh6QvETesytsKOFwJwZEqTjlDfTvBJzIB0FOwMah995jaoE0s9AERMqq?=
 =?us-ascii?Q?TADpvHe4IvbBTYwcrrYETCcfieHg6jE9padCICuBe5Z2wAtmvxJ2De3BnhrA?=
 =?us-ascii?Q?MKj7ldeCmw4TS94UCirNdEFDjCdvsiZ76OjmFDq5gKzE2PwInc65Eop/58nO?=
 =?us-ascii?Q?APwPnlPAgGmGaMpc+H+7Q6fCKwmcckBYC9ijWj8nn0Ze2TXIsKqglNW70ZDX?=
 =?us-ascii?Q?R8Mfk+cc888xDu7/bGYBQ3Y/o95odOBBPfsDKXcV5nOChhJIRA9lszhLkjS0?=
 =?us-ascii?Q?6G+mUqQqX+6T0XSEnLCy3FT6ntvGwOJnFPZmlfzkdm82Z+oCtGpxS77qJH8k?=
 =?us-ascii?Q?sNIKiQFM/1V08FFc5RTpaoYDO8LWc4odRHd+uJzmOneOA9WcS3zix5KzwWR8?=
 =?us-ascii?Q?4tQqQWQAvs3Q5TlDYi9L7qMy50iWBp4TIizyxdWctiqd6lXBarpxf/zbVlh+?=
 =?us-ascii?Q?CfNsI4FBLx8HsBCnZ/pMZSILjypLxrTuPpWTdP0XfpQn7KOPxul1HuQOR4Lr?=
 =?us-ascii?Q?Ft8CUdifKGz2XZfDAjFmYTNBF/tXx3H7FKEJbETeiT6rCdGgA6uwu59YOvVe?=
 =?us-ascii?Q?F+cjb1lM43ke0Y7ZFAnXgMNg1g/cpL+lx2VTmQu8YiUSGTRgcKA2oFdH3DCW?=
 =?us-ascii?Q?rQm2ncyTVfJ05ukpT5LLmX+yji0Jh4jkU3FTZSfewWn+q3fvGGQDkiNf+LgH?=
 =?us-ascii?Q?27jl5tMyZ4vMHZ69AExw35oL3/X9NvTMUg+UM/nKSCQ/u4QVAAGG6Jl6CDCi?=
 =?us-ascii?Q?cjKDPn1Qsacnb2qxruVy/TTSB3OVJDiFJ2gcQEhSwaWq4BJVSSJpDXxtAIsJ?=
 =?us-ascii?Q?CcaK9fRmSot/N5zeYgDTAsVl8xB4FB45DYFcIca9q28XTmQAKnyhrsDJZ8Ph?=
 =?us-ascii?Q?4C6QEwqQ14Y1FPkHGR3BjCa2izbeZYCsN0KddPr5wWUjwCLtYeAyk2JgFzLE?=
 =?us-ascii?Q?mF1UuES7S6tGAgT9dz+PPKo09CfThP/jW8onSYK1Sc9zpZLVJs+g9ZgcQEc8?=
 =?us-ascii?Q?fRo/Lsw8hqu8RUgBVoWIyHZ3i0+cFWTyrIQN+ALJJqN0/9qVq3aFqN4OxdIt?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WeB5rXQ0y8JdpT9uFQmoIRnfuMH6JJhqZ9c2ZnHkyx2UdAE1n5cwK3ui+a/C/pkcdVMqaOsOJvjkTX05UuFUv7JRTpEKJKKDJSFLH2DzjmKD2NfVCpm5zXG7XW0lXcCMlMZ+bKvZwe0XA8hTA9eT0HjCTVVdwzeioCKzrMVBTeww+aEbV5KjOcjN+ioH3wpRFTQpMCsVHdQwh60UHHXUe+5ghsCeh9MyqzBdkJchd45ndoMXpBZgRaUu0Mb7ZEpdBseBAj8Euac7yEia4cFYNOYXc7PWcHDksbwl6Qjr6a0GuE+yW7KwikVwO+Gm3tV3ntvoILK5IqXZIVh6lYqDsz2DLxIADQAEOlMgILL2RXOO0iTnDWKrCysafp7+jt1BmPfo1d+vJQnRqVdDpzC0HZr4x4VIi8UMyHaltaBCIh3O6Uu1dgrpoIrcRDn3ZHT6jiyvrmjWnfKSiuqkfeovg8xTZC4vPgbczsg/LD4wLu1Tpok+iyESQ4McpvYKtC+vbWVzaKINn7LMvdhN+AxvEMDgPedWrVDeTDjn+1GCC6hQ9tqjtPTH2haZdErlaoI9xs4id4V2SrVd+SfFHojBbeP9O8wgY2K+5nRlt4f6XQ4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a30cbd-f0c7-44ab-b0bc-08dd7c1ef6f0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:10:59.1178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+uje0n7gVnc11Q0eJ4LTfdThnNwYDh2WpK21d0H4/KT8Qm4DckdlNws3L/bagihsitFfpgwCP/8iT1L4c00weq+2LEwO/ARc43tW/vktNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6567
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504150093
X-Proofpoint-GUID: HNLu-kCbPeCTYmHiNJMToqwLFEyBZsa5
X-Proofpoint-ORIG-GUID: HNLu-kCbPeCTYmHiNJMToqwLFEyBZsa5

We place this under memory mapping as related to memory mapping
abstractions in the form of mm_struct and vm_area_struct (VMA). Now we have
separated out mmap/vma locking logic into the mmap_lock.c and mmap_lock.h
files, so this should encapsulate the majority of the mm locking logic in
the kernel.

Suren is best placed to maintain this logic as the core architect of VMA
locking as a whole.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d834514a047..ce55676a16a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15595,6 +15595,21 @@ F:	mm/vma_internal.h
 F:	tools/testing/selftests/mm/merge.c
 F:	tools/testing/vma/
 
+MEMORY MAPPING - LOCKING
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	Suren Baghdasaryan <surenb@google.com>
+R:	Liam R. Howlett <Liam.Howlett@oracle.com>
+R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+R:	Vlastimil Babka <vbabka@suse.cz>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	Documentation/mm/process_addrs.rst
+F:	include/linux/mmap_lock.h
+F:	include/trace/events/mmap_lock.h
+F:	mm/mmap_lock.c
+
 MEMORY MAPPING - MADVISE (MEMORY ADVICE)
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Liam R. Howlett <Liam.Howlett@oracle.com>
-- 
2.49.0

