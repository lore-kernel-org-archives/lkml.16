Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEDF14D29B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750106125; cv=fail; b=lBGXel9IqHtWz1XECSViK4mMPX+vw9+1pgFq7Rm2dVblBWVWGDpB9DCRkMvamDzRn58KPG7CH+gDztCdEz8gz/bwqxg5bvPOIrKCTXINmu7gRaEj05VvgOFULgSLpI4S/DzaHcM+6DlyglkOH0Htp4DvHK12vZILIdHTxZjUPSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750106125; c=relaxed/simple;
	bh=Y1fK+9vc4aLbilctjMe+pUQ3rZDyeMyMhNdcHKW0TFM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZRSkj6HjfRa5fFXNGgvwb1InvAGSrdQ9A8/aUzvTPkDQHPT8e/EYQXE7b4mkZO3COpvZAG+XG03zWTWEWVUH1iIX7p8pxj+FnxCTirCk+zUiZXv7WVw6f2Rc9TOFEQVA+MI/oSyFyu/LgJoMJOCvBMSuw4oQ6jpnLhqsmV1Ame8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dZ1LEs4t; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FI1Fter6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dZ1LEs4t";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FI1Fter6"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuS1n017345;
	Mon, 16 Jun 2025 20:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=WJPf+shV8OHy4kld
	xYX+Vs0XNAUV3AB2171FGG43Znw=; b=dZ1LEs4t3mcMwO00Lm09fSQOswWp7XLc
	HrIKIYWX6PU/ujPuyf2E90p9+KQgLnOgT+kEAV/zjUzTPdQ7hjBnSjczkLY8bW+8
	2zZNFjJZRCv0cm8YFFaUMbSlwTEC0YfYp2zQ/KKKGcNR1XcxG/J4wSKMJ+b5K+Y9
	UQivFAH/KDpTCl+47u9DAiHtWLTu706LWuiInGrKA2Lie1KTkg6JKB987qO2qDza
	o5Q00vjRWjbJKfTVPtoNZVGqYHK9bGYU0Z3zGH0js4bKrQhmideIIssSacSkwxlg
	9BAbyubV2Phd3A4F8MqItPvVFQWgOsiYYFwWsw8jP+G5KKQU6hNEAg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914eku25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 20:35:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GK39uD031670;
	Mon, 16 Jun 2025 20:35:12 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011017.outbound.protection.outlook.com [52.101.57.17])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh85gy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 20:35:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cvl5HejXeP86bYZ8vMeMI5s7Fh3VhDLTQ7T+hp0wI0LMiQqKZbgiP57XDP22R+48T6ZMUQXfKKnx7lYpz3URBfpSmbVa1nJUVd+yak+zS/VjYO7hmP+1VKBclR1Giu/3sKFy+o8RgdG7nzc1LlMYuJMqsNb9l06WjE8wwtmdynv/zyvl36iENIFTJLRd5N+XJ/XIhl1cQP3QYCeuq2rcIxrVAVe1PbDg4ZB1S3HGeMCih03iw1GIgIQvwDCXQcsuApTu78y40JgPUO0DmixvdEuBgIN9KWN0lvkXw+GGf6Wy4sdq5dRhmFaUn8dF4b32eZyrN5faAjhHDHKSy+n7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJPf+shV8OHy4kldxYX+Vs0XNAUV3AB2171FGG43Znw=;
 b=OGMGsaWh4LHgKZtCtZSF+lzTchl5JzPvahJBpygm60DDnkxPgwNQH6GeX/3kKBEsJvwrnUUbS4LhQ+mPaAVyTMHTaCL+iRgJPCrRaLBXYkp79Pkb7gJtp1/Jt7pmtkjrARDGyf1lksSqIJJSPn3GAQJGK9BzioEm/4JBMJYCQCu4sPPsj4AKBVRV8f0X8IhJDDJIVS5/JCTyukgU5E7UWjNuE3TgiE3fLX976nlhKRAT+PuhesvDzLg213OJE7CwEAoFVrXzGrwrgzFVW84XyRzdFERurDrFySz4/HbGlPVwuHm6UGr34FrHFFURXElCk6p6/1RyTH8GUCuvy+Jgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJPf+shV8OHy4kldxYX+Vs0XNAUV3AB2171FGG43Znw=;
 b=FI1Fter6zysNlmxoroihInprHdDdfAbDZ6JjscWYY6gigdySV77ef2Q1PyTcZt4cg9KcUZbNmRU2o1k+X3OkC8udyIIcEC4ht8PFZZw6Im+CjJzVv0KEgikQb1Slbel32edCLeX/t7ld1nHZJlQB4YZN9ELhLOqkEHvwSGok0zc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7612.namprd10.prod.outlook.com (2603:10b6:610:17b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 20:35:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 20:35:07 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>
Subject: [PATCH] MAINTAINERS: add additional mmap-related files to mmap section
Date: Mon, 16 Jun 2025 21:35:03 +0100
Message-ID: <20250616203503.565448-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0263.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::35) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 005b1490-0095-491e-8ef4-08ddad154821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AB4O95aPH9pRk7dpPVa0ADPIIXkBEtJVY6JGnF0VRZi10oqv5uoLmm10eJ52?=
 =?us-ascii?Q?U4Sp4VmqPtNjQX+2T7UUnwa9lda+BVCMEJ8FVctVkCCJuW/pjD+z8ruuAM1s?=
 =?us-ascii?Q?TMxfGa1HjV5NwTrIfJ5prZycWZ1v0tk8L26bltwQRQm9YZ//kts4fbGqlxKe?=
 =?us-ascii?Q?vyEND1fWBhNG4cTGlVawWhp1FSqQRyibmJD15YT4oaFsc48c6Mek8v0JDfuS?=
 =?us-ascii?Q?T3esLhvy5FuP7fZs3p1T6m23qgNpz86Jeik3yNjsgpZ1bUYi/hnFQ0N4Qeda?=
 =?us-ascii?Q?5d0UPaYlrYQHm1g0EVkREhadtqpEis0dyxqqo30zbQwK3aiTm6ELEOFiXuRU?=
 =?us-ascii?Q?bLLi59gHunGMTAKaDNrL4oClY1X2hz8fXi+G2Bao1WWPYJ/zkcPfJiKzrsGn?=
 =?us-ascii?Q?lG4RdXEVSIr8UFolrzs58KyIq/GLLdgogmmvclDpbFP5XxDWUcA06RUeUywA?=
 =?us-ascii?Q?qrOR5LyD9YuMq0rsUR2KpSvo/9scrCDTEr75WN/J2rsL4HJNnc/I6XkSGy8h?=
 =?us-ascii?Q?puqxXV3e8AdReAlubKzzXCwSKK6Y8SQ1PipNFZ7Ug5COj3mWCyEtmePLhWuU?=
 =?us-ascii?Q?24Iwkilgfmg7lC4bDQgIywTHI+k3WV10hrTGQjaNxdgop1Jc56JKyaNZUrv9?=
 =?us-ascii?Q?mOSmHoysNl+mrXhD1kEr1KvLxdo46AzlsEbf/evZBP7LgSEXfRnGLQJeE8o1?=
 =?us-ascii?Q?tPfzHlmr3XdkTsZM99x3TbFRMyPA+/IVwe2AzExrI1xOUabmtWXpB8tueUVt?=
 =?us-ascii?Q?ipPwOdo25p8Kg62zn8VLI0WSkxuM0pV3KM2wX2sUINmBgi/OA29SvGFSY16/?=
 =?us-ascii?Q?uzR3hd2Od3sCHCFnuPGtcmxXp8mtzeylJ0FKaZ1+SfDg/W2DR5zeIhDV9CiT?=
 =?us-ascii?Q?+l0AcqRW3ir2IYQGycwIt+wjPxPOUvfZOTZhaUOz/5RmR2fIMprktIJ95Lbp?=
 =?us-ascii?Q?oL++GGypex02Uy4vXMGk71wxIeArvbjeGo9BoUJjF5ENucV6qhj7eTUIf++j?=
 =?us-ascii?Q?bcWKNLFBROWlhHnn19XqKksjcVbdnnQPftji3MunB7+JjeS4VoPzX8GdlBfm?=
 =?us-ascii?Q?RLwDKotOrWtZDqeleDAwz/OPTvkgmKimcWyFp2J0Pg5W89y+0jSpfPlApo83?=
 =?us-ascii?Q?wdxrXmdq38SuIywEv83Wc+MPV8K4frwKkvcNwYOzJ2rcFqgMeym5nW71/61j?=
 =?us-ascii?Q?/drPaTvRtjm7JbP4cJKUL3a9O3lZ88GZo1CatCenyR7bg5eKy6R5qycDifdf?=
 =?us-ascii?Q?QebrVVWdRuf0SO3lzg3BDVZOfK8vEbVY7myDHRkxtYQtVD7diFofam+j4BRz?=
 =?us-ascii?Q?q6JGiWO4lv5ChAfagVqKrnPLNkWDvPYcz2q+9CuBe1QYVRL/GHmMuCas+Alt?=
 =?us-ascii?Q?xQcuFa4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eslwb0W/gdDbBpIf1wzvZbOIk4UVT685YAoCzFdn35bnypfBN1AwdBBoRAQZ?=
 =?us-ascii?Q?jvUY7tq+g/QQL5i9x1FACUCzQHW6/RQ8AmgbxVacwhXheNrn0iaX/La5Y3qb?=
 =?us-ascii?Q?xt9Rcp+WmDvdhjffYl0xiLnILKirh+8dPioaFaf3kodkUkYz50/3xk8P/qTt?=
 =?us-ascii?Q?E1EcZ7uzJiU4sHTQBH/N1WrpfdDtyD3hdzZ/cxrDz9hhl99gdcSpXGWR/e5f?=
 =?us-ascii?Q?yhUVq4MMuLQqspwpCpMf5zJsC2a9JMM40ySRXlUYKr0XSCD20bw9nF6gpmR6?=
 =?us-ascii?Q?qnVRTotTR5SBGam1psyxynfwcEml5vpvMHrV3MM2A+3JVBDxFMb/5pVGp3Wk?=
 =?us-ascii?Q?6vhAhX4aTPnTgc9WAo4GQC7T4jMuP0Pz2N7eepjyMV3RLV1iqX4uYmFZu6EC?=
 =?us-ascii?Q?R5H3Tpu3RCxrCO0QyTR4IxeCe/Q2W/LTlh7s/h5Ird0tm0FT8dNqMaDFqG/q?=
 =?us-ascii?Q?EpCxHaudheTau4M9jxInPE8v6/dTFKW3SUTqqFc6UcgApKiQdkNpesEsa4+j?=
 =?us-ascii?Q?SnwFzkOIZVtbA0RapzXEpVbNR8NKlmBFdZqfWDUpXp5Wwj10PhMOx2frnszu?=
 =?us-ascii?Q?Bm2GlAQ7XZmRYbO1b521YwLmzLrj7tEbys5TAQoI2+h/luDOFXp+PTr+HxUh?=
 =?us-ascii?Q?G/Cbp3ROQvTmr5iu3zg9ETZk2H2eK2ZwGRdZKlApBwsA0is6/xbd74Htru3j?=
 =?us-ascii?Q?31N4q7TESWyn12FVGEXy2jDB/0kMAKrTNMpEDUJgo2BrFmUhoO8g804yta0C?=
 =?us-ascii?Q?ryQHgSX7OYQKI3VKx7OvlIK8NcwMwWUkTOuKASL5Pjf6Ym94ljkAMXkrvCD/?=
 =?us-ascii?Q?VY5iMoqRwDupKUTlxrR0LIyRskloa0qiAN2ts3LFpdUL9iWA8uQ3lRdpX40F?=
 =?us-ascii?Q?epKjGNST7NVyf9OCiACcbDYoTGibbOU6Lbxqq9QQWYbwx/wAe4MUeAmTqCp8?=
 =?us-ascii?Q?GYLLMrHBk1kK16AgwZARq/np7ZTxlslgc5T8ZAkMM+fLsK1VylsRfDu6XGiX?=
 =?us-ascii?Q?gDw5ICC4vQSaIFEPAV9wutC1PRhQ/+xZ6S15Ughwt9CBituB/au1bUs/C2nw?=
 =?us-ascii?Q?ZoGCfZbfS/mictwv5vBwjTZA3peGGvtw9sfN6QX1Jr/OnJjtae9aRfs1X/ej?=
 =?us-ascii?Q?nClA7AwVQZF2avM0SB2IlAn2IkE/AVKmLssjtga7QtcfdjDkc04KvJyfTpUE?=
 =?us-ascii?Q?ezyztGlE3tM4IK4q6f/MuDb1iVqc3xMeR6oGh+5FxZHP1sypKmRM8cmeLpSh?=
 =?us-ascii?Q?9LhKzHlsxnPd+BTEyN3Z7kUrjmQ3vOvIlw+b82bpISxM5oHVAjRtoAWq7rJk?=
 =?us-ascii?Q?oUDQTRfH5lHSlD8DaLjpQ1EviVXKXOInDCpppsXcGKWEEU6TW7DvvW96m7PY?=
 =?us-ascii?Q?O4M+auQ/Y5fizD2ocZ338wmvRY8fYxWujxHE8HeQXxfJiEkficEzCwcFvMAd?=
 =?us-ascii?Q?/vRJcBbA1Mc6ycXWqR4HFQsdoVF9AbETXcMNFTgdxFfLUjT9FF2fjals6hJN?=
 =?us-ascii?Q?sbcveHoH7dVjrctN7PRrnKcPo7fSU/+8uqVbCaGoY6KTBSoZxhtdx8oX5lw9?=
 =?us-ascii?Q?y4PL2g562RAPjRnVnWZBKROygOMDOlA7tjkZEcQcC8IIr0gE7obKnj7lslt7?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R6FfEj9dylYmigibljH0RK6ejR7TuPBcICpnnOErs/PM4iMdYPu4QnUKVzEtiqQlfxk2STWn/hpdxS+DkiXEV6+2zo8yrf0RA8IHWdOSvQJWnOz1ovuZJZNIAQqcvYR+QCiQWpTkF/mxqNXPEoK04hsaj6xjYULLswH9eq1HvwmC4n2DNR9rpowLrm8dqXKbXjoi4ZbrgxCd+7Ai+JYs46xV0Va6+ZXURLljRHBXImaa/IHydrnWDQLGlY+Yp3m8wb6pcFhZ0eQwE3YzUNJXwvxQtGZlwkT46U1KXMn61aR2WSsJKK4ka51Uhzvmn2vCKNBS+izSpKJwhayVLCri494Pu+e7vU2kPqY1m95o7cTNmNyB84Vht4dCrVLpJCEMoUC3zQxlPeiJI/TNn7ThV/OM/eTlRAH9k0TSL9YnD9jse5tRbU8pqMYqhPQevlwh0XjZiTMYc+qFk5Cus2JqWmvWYQX9jS4CeUjUaF7BA1KvE1QaZ45/W2fDTqO1NpMzoKfmBPEqhSEpkbKWqNNC3GcevYOlp909bOgsUTivSUjcBnuXtfONTIkQqksajUhjyp/OGiOdOlKuQJrRWUV38OhPLwt6l4j/44NfYZaMCIo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005b1490-0095-491e-8ef4-08ddad154821
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 20:35:07.3406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQ+y+ajxLceD+Y9w0sipzElP4v9z11YymExzXSjm7+w9oKL8ZruCHKjDf+jKoGK5pQ+Xwavbib6tLU6Y6Bp2t+jiKrXNYmLU7VeIOjvsssY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7612
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160143
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE0MyBTYWx0ZWRfX2CB9Bzyiex3T xHAB4mjNXi3mDzAImF3dHNsMD0FgKaN2ygZmSTI4ueb5njVpOpLdBLITWfeFlkscs2mpP07zBDz IS+2+N04URAmqHbA2cAQNjuDHEauT4fl3wRMHZ75jZQMtZ61vGmtdvf3e64X/wAEjkamfbfMogb
 umJhtJfI1OdxZc/6oaBV7GyV7Ul+CYXYK4Yd6ihI56JOXTR/ktPmCNAiJtkckDO3YVVZXGej8YB PjUiiqlY71+yI1thvQJjh6nBQF09lPjgRoyWMU3+cuKoB65DKXfpXV+nw4yEIGuRyppGN7CpJH0 KgQ+0VIFgy9lc/pQWB+zhh9aYlDmwVPF+bz2UFgWq85xMePP/DOUdOLwP/E61l/X1F9cWd77foR
 1crs2OmxsSzfzre+vz0wF99R9TOhZaIrdnu73K3ynpaLznZz8B1XF48oysLtFfrJ0ljrcsJR
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=68508001 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=37rDS-QxAAAA:8 a=VwQbUJbxAAAA:8 a=pDkhpGToOeGCpMLHgTEA:9 a=gK44uIRsrOYWoX5St5dO:22 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-GUID: UVxNSb7t5b6P1VLH8UzYt1hJC3-wZkch
X-Proofpoint-ORIG-GUID: UVxNSb7t5b6P1VLH8UzYt1hJC3-wZkch

msync and nommu are directly related to memory mapping, memfd and mincore
are less so but are roughly speaking operating on virtual memory mappings
from the point of view of the user so this seems the most appropriate place
for them.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4523a6409186..a5d1ff923a62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15735,7 +15735,6 @@ F:	Documentation/admin-guide/mm/
 F:	Documentation/mm/
 F:	include/linux/gfp.h
 F:	include/linux/gfp_types.h
-F:	include/linux/memfd.h
 F:	include/linux/memory_hotplug.h
 F:	include/linux/memory-tiers.h
 F:	include/linux/mempolicy.h
@@ -15974,12 +15973,17 @@ L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	include/linux/memfd.h
 F:	include/trace/events/mmap.h
+F:	mm/memfd.c
+F:	mm/mincore.c
 F:	mm/mlock.c
 F:	mm/mmap.c
 F:	mm/mprotect.c
 F:	mm/mremap.c
 F:	mm/mseal.c
+F:	mm/msync.c
+F:	mm/nommu.c
 F:	mm/vma.c
 F:	mm/vma.h
 F:	mm/vma_exec.c
-- 
2.49.0

