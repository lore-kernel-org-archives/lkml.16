Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C15E296173
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722673; cv=fail; b=L+3x4BNjm3OwU8XuYo7MHc2lxEdlEBArYrHcoCTg4YsFOzOB16j0XeE4HE/1mV88tnyAYwYphU0XcTtMBgwE5SM+lv5RfHSYxrhgCxznJlFBnjXK/TDxAUI5ZWSF58JQaWMmjoIyEnwnJCXxfFiQzZUSvZpnWl1T2DPclEZQPH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722673; c=relaxed/simple;
	bh=6U+l0h3FemzTYuustGiokEcveUgVDUUuPSfl+En4gGA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=V+1T4rw445j+Fig0UC7Wl6/4KvQVO5d8V5mu+mva27U96XbwA/Ttm6iHZOYEdJUnpLmiScVZnG5/rklFo/9CsffTD4STzQeVb0FwEJLOJH8QaQ+FsE3oJOY0nHil4VmIWiLVGr4jyTKEX/WY7h1jEe768W7iJH01jbL/cyyodeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I219uctY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oBBipTOs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I219uctY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oBBipTOs"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F6g1q6021804;
	Tue, 15 Apr 2025 13:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=JTPSra3oC/C4oPNB
	+Zl4Ui3USTzU7xUZHYoKzH6GpDs=; b=I219uctYief7wW5WtFqc90oeCuMB5B9F
	x1ewzPGiq2L3fy59iPrRYvS3CifkLWMdH6PEwy1mwKM41xcfFLqS/YJvKWPLxJh4
	aXKxW82QWnfe7JMLK4Y6KY3iRX6uB3g/avjWzsOXK9u0Xm0BjuNMRtHUqRVG+NjE
	N0qjIrEzi9OQfTUgfTBAcK13jvLhEL0nxJGqETZ7ohGP3OEZhn+HN+5YZ8AUYZIq
	5r+D+Oc76A7vNWiHax1peK9Xuj4G5AOua+G8hAKTkulfjM0zk+pCxM8Uvp6GzOip
	g8rl92AwbjVPsIECi33mJ5EAR8tVtpKq4I2oRuNVp75m6EDOjtMSEA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4616uf1tpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 13:10:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FD9mRm039168;
	Tue, 15 Apr 2025 13:10:55 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4r9tyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 13:10:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVdHyy4thzIxU3CVs/lRm9feag0hutl8UW+CK+vsImjLUn+DS3uffAwBvgzdnzaofLiF9DIugjuo03oJTX2fuV2uQksrLnQ2kzq9FdGsSHPqCiR0fLlB9lvgUm/R02beg6bvmrFL6jUYd/Pmo/ErxUcZd1kFfY/BzOyta1Qkv9sTkNdMfqz2ajOHZN5pmIXa5W+PR4AKixrCTfaSZiWm+Tu61zOHOrMwxgKSn4rYf3qTIkO7ecIY8zA6KZFxP7iE9Qg0lWlfWA6ecy3t5PLCwCK8DngGYVoHg8gWyGtOTwi1kVKBXswrMQwR5IUQUEGPqshzDFPdEyKUefK4+lYzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTPSra3oC/C4oPNB+Zl4Ui3USTzU7xUZHYoKzH6GpDs=;
 b=MCsqIaYddpdWW9tQ7F2tN0KwDEgO+QrEziQI+RCDPLNAyhT7YJhicMP62u36158F7QjNrrrZfbwpU1g+CRG30RshEfMxmxVu+2oBBdQfgyebmle6l2k2a8ZG7bv53nVHDqoSSMGzpu2P1YOtuVoInTbw3jou627jFnxTwmEuyAbXo2w1/nDcOq7B4Gg8AdAtvQcmxuwC5z+bJTkoiky8//Klm0cik6blCGHkMQ9s9pbsFzCbsa+gST1tBUHXL8UwwgvNQlYwrNdJKz9cw/5nCzbt+Z9E1qbCJKGOq7cS7bkOUySEeQWMphhUSS7qTIw+ut/Wh/kQAN9t7B6qWSDnUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTPSra3oC/C4oPNB+Zl4Ui3USTzU7xUZHYoKzH6GpDs=;
 b=oBBipTOswY5XqpPIHAKtIIor5j4fS+rz9U8uGqdrKWbaBEP++zELjwIwPdViNmnxDELANzm+oG7U4w+We10/ALhVngM7Dr44S+/fs8TAi7FqW+Zfo0TykTLT/KQRDnMog1dW+4xFnmEE6wqfl5rQJSjyO74wnP6pmlP/ASw/8y0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6567.namprd10.prod.outlook.com (2603:10b6:806:2bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 13:10:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 13:10:53 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH 0/2] separate out mmap_lock/VMA locking and update MAINTAINERS
Date: Tue, 15 Apr 2025 14:10:44 +0100
Message-ID: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0513.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5e3522-7543-41b0-488b-08dd7c1ef38e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XOblYo6QxEuBflitoA2GcxYXKRV4Rz1j07eyMIYAgRhT26R4vmyVQr2a14Mg?=
 =?us-ascii?Q?/CTz+D7DTS2ujOKcLiTzUSaHYSMsk0vRjabUwyMSGMfxp9b5BI/uWKblH/Cm?=
 =?us-ascii?Q?xxvR5OthfXuEh3LSyImXLNYJf0TmVaD2+4aI95QNm+JkXyaGFKWFPo0Xv1Rr?=
 =?us-ascii?Q?KTYcXPIVybWHvu7o/Aq6dDKpyGJJobBg5JKzeeGCi/Nk1r5LiJHWiP5BC20c?=
 =?us-ascii?Q?T1BvzF09t9DSm+iXav7H5xfReEi3VVYfBAlBwKDHBMso/5foH0YzMGtHUDib?=
 =?us-ascii?Q?EA1L1qAnnvXCyiCydOOsKgqRDtKajsXMbSLqyXW0bbdWHXyh75ipGieAbp/k?=
 =?us-ascii?Q?63j1g4DDXvLz73NSM3w9jUZhiYIh68CwYArLQftdTlihQHOore0aiONjYdi3?=
 =?us-ascii?Q?o9cATPacsAS1heesaZilYLZoKpMLgMErVCSb2fhj7IDnB7rrXXohblqhJYJt?=
 =?us-ascii?Q?IHXg/A52A0/YW6vH+9NoisZfw6MLP0w0+v/nezXsQALiJletT6WqsoH0xAKY?=
 =?us-ascii?Q?2i1ELubNPQ3vOiAk6HdHBEPDJe0OF6ZWglkvDaF/zNItix4SahXVw71Vz/7r?=
 =?us-ascii?Q?yiVmdyvSQ+KzSZuREcnJOuLr5rZfbsDsrZTKiZ3bf7luhvMbNiZofzu9ZzGW?=
 =?us-ascii?Q?j+DVnMxBfu+llgU/dpwt8+C4kCGI+B1p4teh39+zTjnnmyLPc+RPT5YG6ftv?=
 =?us-ascii?Q?GidW3+ws/1eHCQ9CGD9d8DOvQD7smg1JreJgZggo4qh2vua9sGrVMLsRUSF5?=
 =?us-ascii?Q?B5BblyANkD3Aa6l+veMhng4wJF+0Gbc7lgu+bQ8s6JCHriJYYR5lpqyxa+YT?=
 =?us-ascii?Q?mR0adSEULDh8B4j9AGMmPsyqIUhkVTCGkd9zudNzbI3jS6zjZtDpKATUUjBZ?=
 =?us-ascii?Q?QYqNwabqJnkg2YIFBK16O9cr1etv5fNtsRCJzNrgzWEPsirfq4l3nVLHFpj4?=
 =?us-ascii?Q?z/wqPUVyQB2zEwqYHAETHVPXqtL2GQZiK6E3vat689jzDWUlXQvvFCo3I7IP?=
 =?us-ascii?Q?9oEDmY9puBuWqlljWoHx3D608heXxlfZC8ehCLcftuyFDWpyrWE9/63OWUdm?=
 =?us-ascii?Q?PpbTvZqET0QHraQ/tGwE3UVA/iJB5iDWjeTPmu+5u8haxby6ukjg3r0R/1uf?=
 =?us-ascii?Q?Gq7YdTCmLGtlWy6TST3DbtniX+QYbqp1iMS39/bRz9+lNoKrClxFe7eFaWqB?=
 =?us-ascii?Q?zWrUr4y626gGjmesFC60MsIsuXRMA4PCn3m5SSmWjb8us8ZVzbNROekC/YXf?=
 =?us-ascii?Q?KlA6V7Lv+rnyvyb8rEkiI8NCWdc7owWNISMSBa06Jv5TDVT9ZeiLnYm7dOXd?=
 =?us-ascii?Q?iAqiaCETaqdZui1QTD9RewufQjJpsXmiap7/wqVWv3uFUDLPHYSYSC6t/RQ6?=
 =?us-ascii?Q?wP70+dCQHEZNec3iu4AtOYY91fTsfeG0JQtl9NF1vhqidSVrRcTGfTCvzXdY?=
 =?us-ascii?Q?knky2shwR6I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fr0KY7fXsuohxHAZcfQmiPPk3wzNcKLHtJJunns+P2LEpJdKRG+pyvFFGZOE?=
 =?us-ascii?Q?CrCbsASFuS3nyTsbK6awQr8DxRO8wn9G9JHk8GTt0j29e/bmJPY9OiGZ3vsP?=
 =?us-ascii?Q?jcfqzNkhFVMw1IJvfrV7jH8UzSWoVVCfnsrqLiaq+V0m3IXIudkWhynr2DF7?=
 =?us-ascii?Q?YqfaQ8DgCbu2SpCW+FDJfoozcDoXsaq3b8cbMU/ZhEI/n57NVdCfa8VPVr/2?=
 =?us-ascii?Q?shnNeE1I9WaVjav9kfl/LdmfEAR0GTRupQXHLsQ25gexsc4TQ49p4nepT7gp?=
 =?us-ascii?Q?T9ADSj/mRDPGjOHXPxv+266EeUeDcb+1ivPoS6d437tGWlWA6RmoYh9rA+D9?=
 =?us-ascii?Q?F4l2rKuYKq96ieWXyZrL/D7Lg3W3IL/SOCQ/7gpiTV1IFgROnQFBtgq6S2pE?=
 =?us-ascii?Q?+Nb5zCPwat6V4MXW42xtiPPqZFD11Bz/GsdC+KL9y5FPmt67slUeOFBIc3GB?=
 =?us-ascii?Q?T4lDlS00W5Hp1p/f+P97FbmgMLxHqjy/IfyGDnE+0gztW8oYsxV7g7sH3tT6?=
 =?us-ascii?Q?rxnxKgdjcJ/sS4vrhVFgEO5QJZ8K2IOQNTZuOqfNbNLhIuOHBxKLhCwgUq+Q?=
 =?us-ascii?Q?jAdpxiselM4GlhBbRFG4OjubKmGv7ay9n2rRjk8LIcY4bSCcuuTg3j0At6/G?=
 =?us-ascii?Q?TPuPDyQ54l4bAHk+v/hsfx/eP2Xwpex7jsA2ot5sa1ldHW3HCrf+X3HsR4YD?=
 =?us-ascii?Q?+9Bg981D91EnXCjcKxhXnrb8FUyeJdaugKXPe5Tiuz2/+6ZP9bzXx9RsF6ZN?=
 =?us-ascii?Q?hqwVnD38TIq64pvZE8U7By/CLMLw5ofEigFMhctl50Zqd9sIB+QDYzfxVIRu?=
 =?us-ascii?Q?jzjPYlto0RU1pGzt/9uZ4GFxciCkTEDQ24KviX9V5noNriKb8oipbvziMB49?=
 =?us-ascii?Q?RrtXbC5V2XQwrqE5kKrZ4VMZWAO5BKdRXYbMSgXEjg8dSPXZrVtNb8cdxZk6?=
 =?us-ascii?Q?+CfGdKjTq7KJZU/RmGncTQKOdu9/E9k4z8GC5dMDod2k27gDQmpNON5JpAcX?=
 =?us-ascii?Q?pcIPtnFyBETxDzYh+GsGPD/0jiPSfa+t6ycXer378iEvQajEMReI9eNd4m2A?=
 =?us-ascii?Q?C+pMOVK8tLIVQv0z06Aq3Sk1QUXI2qydX36apVbdiI84f9lEtKARdDQAR+ZF?=
 =?us-ascii?Q?2fuHIe9X1uKlttdZl9FfBT3w8JLrxCVie2G+b8A3mEQv6ZsjcZ+ZkpZmUt4j?=
 =?us-ascii?Q?5eesKLK4/yC28iZUQD6vkv/L2q7fHo9Cdi0c+06Sv4XGsygeNEuRe0mVqosF?=
 =?us-ascii?Q?xQVYbFiZwPzkJQzAWg1Lgj+WxjwP5QZUxnSu1cPKIhLenYmxy9ZKVwHYfDHk?=
 =?us-ascii?Q?f/udb5VGedaA71FXpc4LuFbnQ5JX52eehxqYchFxiwz95Dv6dAJ5+NDyN/Gn?=
 =?us-ascii?Q?cCxFj+i0MVjjWdjT3K0USjZ1iix51fHu2aCVnNfFpiqipX9veysclYvyRX2f?=
 =?us-ascii?Q?zExlTF5K2+CHMn/FTPenWB/03jg4+UAZwO1/LamMlIPmllT9eyls0KnjCD0G?=
 =?us-ascii?Q?ZNkXjxm7Hpb5jjqQCki6CnnY54SHEGPiyJ/ZpALEOgZ5M+l2+IclJWcZsIFB?=
 =?us-ascii?Q?izOP2FxTjCnl7M9FNtOjsJjaMb8+4GF77gDDLM7s/m9GSS1xRW/T+7Tq5BE8?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1R0VtCK4uEjGw+i9RbU0qL0/BdRhC7rm3/l/moLd4A/6fnIyRCCUQDguJCfghPY1LovLv34VvRkdVHE7fJt2V/piGNIJFnCBKIxXTu7KK0usCsflPShe5sxTEwbqRBXT6O1RO0zmSWIg8O4ECLHusdluatjSPdKeqXtUF6C1ShxsFiZnshcCDnfelhxDGk4ZY6D8av/dBeDx3cyiALZISS37ava0TaTdSlN7VSkSAPiWARGMm9V+dxJPhkXwVEH+Dydc9NeRvsdStcXi1JJiSldHyfcQUdPfn3ohgIEDi4B1uVk7aks6Cxy4Eft97G11bCYfGerM5SIu+KZfPdHRLY1+iR5c14khZgBPjT2k6IUdrBOZIgt6Jrqge9l6m7XWJmCsVAxIhxHdkqNAwUzFgQSrE4ussaQwI9lwbIXpqpXACfODDn62TagZvDQalbD+fVStFCPkO3JeWs5bqvA1imXecgvqt+lcEhCcm70zv3aRIsdX01gzjagdo6snJxnaZekZws/Eoj5wqQyLpMONaRQve72QkVeo2uXVkhWI82cOiAGxxiNe3vK1BUATnaKzQdCy8MzyqEx/U9eUJI4s9Pu8MuiX6oWnF+UqkMuGP9g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5e3522-7543-41b0-488b-08dd7c1ef38e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:10:53.4363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bq3VAUMlVjhvHADPUxfKSg38eJnUC8aUbn2v5fwdIk50j4cx0DL1ndBzIghSFReGN/f8q9G+oPgtKFnAmWya6QaBoA2dOsajA3g4UdlSnxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6567
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=733
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504150093
X-Proofpoint-GUID: Q47VzJTCcj2uaUoCMjVbihikVSjNONtk
X-Proofpoint-ORIG-GUID: Q47VzJTCcj2uaUoCMjVbihikVSjNONtk

Separate out mmap_lock and VMA locking logic from include/linux/mm.h and
mm/memory.c and place it in the existing mm/mmap.lock.c and
include/linux/mmap_lock.h files.

This both provides separation of concerns and allows us to correctly assign
maintainership based on file contents.

We then go on to add an entry to MAINTAINERS adding the appropriate people
as maintainers and reviewers of this code.

This was first raised in the patch adding tracing files to the MEMORY
MAPPING in [0], kindly pointed out by SJ in [1]. This series implements the
suggested changes.

[0]: https://lore.kernel.org/all/20250411173328.8172-1-Liam.Howlett@oracle.com/
[1]: https://lore.kernel.org/all/20250411174734.51719-1-sj@kernel.org/

Lorenzo Stoakes (2):
  mm: move mmap/vma locking logic into specific files
  MAINTAINERS: add section for locking of mm's and VMAs

 MAINTAINERS               |  15 +++
 include/linux/mm.h        | 231 +---------------------------------
 include/linux/mmap_lock.h | 227 +++++++++++++++++++++++++++++++++
 mm/memory.c               | 252 -------------------------------------
 mm/mmap_lock.c            | 255 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 501 insertions(+), 479 deletions(-)
 create mode 100644 include/linux/vma.h

--
2.49.0
