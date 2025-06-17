Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4FC2FA65C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750179190; cv=fail; b=bSsFVIWgtjqYfdTY176WddCMbm/X4Z5TXSoqloMOtrGtABRBocGb7FSRxrFcdgHAe1E13ZNHhL0x4oaoHO4zLlgGIIu2iSLNSG03OmSh3DPHhMM0nD5USMJnyLLYhhmfDNQEfCgEg40Zxt7YtJ5VZkh2eX0LEe7zWYlVPkQzPrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750179190; c=relaxed/simple;
	bh=ejSRMipWl7RGdmQsJ5L+BnKyYbtPs+WPchX9Y23Ae7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CZFAS80Q1JTY70diA31BRQKGTP4j3oXQgwJRSSD4JbHh6lDedNaLVwEDcqAJRTgVjhgiTQE0iZKtoYsYHtyC65hAiAotETR6WYIFJh4RY3+Lp6+1eT9zgHAmM20QJkSLVn0Su5xnUlrFMxIaZYDyNtzVpMU6kK4R7IlWVrFJis0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JqRWKX5A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZTvXQWIv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JqRWKX5A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZTvXQWIv"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEXDoM012796;
	Tue, 17 Jun 2025 16:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=h2p1FPvlcH+Q3UxM
	e9houw2r+oMicXa8nbOI+QeURHQ=; b=JqRWKX5Ai5cmM/z050zoFWzndK8kq5A0
	Jh2zYMiftkdEVgy0Gle0k/7/pQHSXLGPMKhyleEcXeH1+KbxzsbUZL5X+hhOv99z
	9CHFYD/r3hCYQkVOA2QgrWvIXX3QptLTxIKZw9RH3o/pcdwGZVH2R7pB40M044wT
	YyvxQE0w3p8mRK7TasI3gVaLiGSPbt86aAjDJ+Il8D75rD0xE49v9i+jF/amv0+5
	uyQxxKmQDl2KXOLtpPm3wCtx859q46xWcmLJ0hx6ZdIP/DmaZ6jUCfjmZZFOc3Ux
	k6jK/nSmWAOXfe62IyKyIpwibmiVXH1TTWK3a+fUsEoTn/1ZvhOreQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xs9jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 16:52:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HGV8Kt032810;
	Tue, 17 Jun 2025 16:52:36 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh9gasf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 16:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5wKajNJjIgvliVxDXV7oevedRuLDTqKn8icue8fDtuUXvIdhC596pCeJjaAwCtE281JAZdKgBUmXBGDauzs8n4OUB7y5oU8ej8v0/bpKYVALYhfnppN0EgIFRWrxSHyXs02fO8m6qFU4w+ytTtO6zAx12nmh6FENSVi6v+rhUfMZWUWrcJhDcTpSjWSoHKYl/jTZuDy1JQJ/iEycTEuJCNNsAk5rsXaunl/TXALXEeejgIuGFcuAYxH6g3YS74H4Zsc2qNB51GPe6H4GtJ/TU3BEkawjHXG70YrU5qrkn8xTig1l44v4k23iw5zYaH9xScp9ORccU2q4MAfMESvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2p1FPvlcH+Q3UxMe9houw2r+oMicXa8nbOI+QeURHQ=;
 b=kGu8J8euLVrXIzBDhmElE510b+/rZ7cDZmRiqIMx7Q+kjAUIh+gTA6+NaGiPJmvtVcO1mWQ8W62D3crkyTz1J0zna3RcmCJnI5hhA8uqC98bjH/xIS5zUhsQPO2p7et8cfrysCP0RJP+rH/gfco7X8o5+gg7wZ83A4ol5CCxGME7XzDmzQvQdSLRYs3M5mudbjcHDIruNe9KudOArbon/AX62w1J5UxfPBwdkcxAoMxattB1mRBhTU1K75Mm5JznZouoZwVSchPBdycfTcrsE9gK3t2ncF9kY0oxst1plxViHF6hD2qPfuwvBUP9qJuZNaeLh1fJWr4dTK1nL84Cyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2p1FPvlcH+Q3UxMe9houw2r+oMicXa8nbOI+QeURHQ=;
 b=ZTvXQWIvIfTJ2TqrOKDbyC5lEWpt1uGwkoFb90fZ9p5RINFBz1RCCHkMfJglLbLZ/2ySpLJ+vhO1UE/O2BkLnYUx7s5/3Kx/AahoY4OdvdrNVWuqKRYK39TQL0aofftWc8raNNlURFNKG0Mc+g22mIck8xyoBCldHCEza6Se/Rg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB5049.namprd10.prod.outlook.com (2603:10b6:610:c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 16:52:33 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 16:52:33 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH] MAINTAINERS: add stray rmap file to mm rmap section
Date: Tue, 17 Jun 2025 17:51:42 +0100
Message-ID: <20250617165142.173716-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0228.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::24) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: eb283088-efb9-4bc1-fd27-08ddadbf5b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xx9XcaEOuUDFEIyZhlrmU4McCHJcBWJDa88jEG1t4PlO5GVmAVOjySbLkWky?=
 =?us-ascii?Q?UmHQx0NGS15dP1qEhBEj6ij2JgQmwrKmcq8sB6x6i0lObXcmks2bK7BQ/O2u?=
 =?us-ascii?Q?23tdk/L1nnPDVLYQ6ZLPVuSpWepxJGfqH3eDYsPlCnTwbd1GhwN7IJE3IlQM?=
 =?us-ascii?Q?ld4p4GPCg0whpyZxJaCH6OAlCGPEHI3mGFiaGZD6d9gwFFSUEMBy+0tl0iiT?=
 =?us-ascii?Q?VqDtSN2iAWx/VdEFf1uxOyUA0PN1fw5t+3uj6zr1E4vfQHHNs3uqubunQmGV?=
 =?us-ascii?Q?mWp80of5pdS3F5QfJuBDfL00CiGCzEfqCYEKEJPfoq9NusVB0cuyEUAD0FyE?=
 =?us-ascii?Q?kzrbu6AGoJf4mDm8Hi15P89drN5Q3JCi9QHiLLnd+xiWtcsxU27SNUqKAX11?=
 =?us-ascii?Q?oEuD1iDTJwFp0399YQE98zBvarsfaPyG77m4yr0r1sswusVQSQ6CDQY9i38G?=
 =?us-ascii?Q?6cwc6nkbs3rknhGW3I4eOgqbRJhbY1fxKExHYzoMUm4oOPWZxMYi80Az3tF/?=
 =?us-ascii?Q?kE4anXsUkkkCSErAyrNBd04GII0fiqVC6cDwbfVB9UFbusFEY2C8oHT0DmCQ?=
 =?us-ascii?Q?/xMyMF6ARj5tj6Vnvbyf0u12g/GuLc4cP/i/5V0kkstviwN1NVc0Pj/fi6YR?=
 =?us-ascii?Q?lsFh4GAyUTooL/mA8u7JD5N6HW0SBk7+KDB9MSHouyk8v7tAmoIO9NOAxnrX?=
 =?us-ascii?Q?NYGmVMhi83qIWYlow6STyWyvqReija6bak1edArwZThl2SWPLUk1e1s0UXwH?=
 =?us-ascii?Q?zIA5aZ+UNc4MQ/upiWcpIz1LoF2NEhFsqBG/B23Fk/ZlHneJZm6y2KBITWVU?=
 =?us-ascii?Q?bVvzgUGF9RavSDjsaG8K7QfdO1Oo/183OEEMdCsORI6uGfVIExwh7NI98YpM?=
 =?us-ascii?Q?2BRQn+DhxtsSnbryNA0EKmeg1hNGLixFMq5/Q+ZmbdTDBMSKOsExJOECE4MZ?=
 =?us-ascii?Q?KA2xtaU1IXbo1RA75EsLc1MaAaZ6vT5XhA9zmYOVJWqKP6epPKydjzINMxEF?=
 =?us-ascii?Q?efXnoGAPmOQpdo6OOefEJv2yJinN6LXSgaGN3l215D4zDcO2KKFscffgWrIR?=
 =?us-ascii?Q?wRSrwEkma2MyHkA+Avrnjorgz+nkirBBxGcoD6LoyP3QY8JcmykKlUrYPm0l?=
 =?us-ascii?Q?MJnXaTn1GfmtEu4zALpyC24MO10kDgy3FYpPxCpyIefUlZScHLymqkuNr56P?=
 =?us-ascii?Q?HsUfZHPu6apnsMtd7wqwlOdRTI/OXnalYGKUUZni/7QDiBrBEHTAFVU6fp0J?=
 =?us-ascii?Q?gj6cUkuiSeir0nv7yJrbSVVCqeAESK3aIH9FjX8F3s3t+M8XSS48t2k/JnQq?=
 =?us-ascii?Q?Uevc9UbGMPFfSIJRlMQTIpOoZasoUwCUW37IyeI8We1J2NGNT2qWLuuBBO7c?=
 =?us-ascii?Q?d3IMe5piDvoUuP61baF1TGOBjLTGNuFeIDs7iIHt0SKW4XV7kOkbIwma3DU5?=
 =?us-ascii?Q?57ta1YA1FfQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k46C4ch0j59A5ENkdpy9BAWPdSX4foH++mJsiI5RB7DMWeogEqn6tK6871Xq?=
 =?us-ascii?Q?M3ztn08TVdUa5QCoMofEAaAJa4nyl3/6PSiWK6zdvdj7qzhamOzi6J9Jr/ns?=
 =?us-ascii?Q?/U8OZDn0ht9SwDpp7mP2fS3lTd4EgQ15Ue3bcv44vQaWI41B6RktjLbfbsMd?=
 =?us-ascii?Q?kTUCwTybO8CZ5Jwow7ITCONr40IzJK0vOsmU9nscmPQHPjb1H/bJIatvNzf6?=
 =?us-ascii?Q?vgW6Zzm5BOT7jVETm3d5jwBe7sA4ACqsynRg+G8PRIbOmTRx3EHq3llEbHV2?=
 =?us-ascii?Q?1psqwQJTrs4d7RnicC9QKXiWworTt7AumoLi8l8U9R983SiZl1E1nbkVBm9c?=
 =?us-ascii?Q?Xif+vyYk9721Azwtp4AH5CRHZ+T5keBsAuuKoFwzWb8HdpM5DbBs3m632ts3?=
 =?us-ascii?Q?akXjILEBtbmMIkVw5JxOyYAy9yfENrCCsjOHJgPozpHyGsSHpK3duC5FfADe?=
 =?us-ascii?Q?lIfHPYdHVBiCi3IDlqlKOLqZfTytHNfMf1lnLHFlBrbSBdfkOx2cC7DfXjbH?=
 =?us-ascii?Q?dS25iebnJQsiS01yrpTbOhnhGXGFBsuVII0kiTOkWPZ8AHDaZSy5vjyROYFe?=
 =?us-ascii?Q?QbbkMuBzLHNeltPsLzGCPd+hrscwCTdtgPVmSUAmJQV+jF1FCJZcV3wPqGAQ?=
 =?us-ascii?Q?nUWrIWg0qCuFrCuo+rV5yFZwgtKMiIUVfBnF/6iF3Cr8+9C/ykGoVF2pdfcx?=
 =?us-ascii?Q?vL/oOa94M89ZkiFCYccbRjwXLb6dwe3VcsIxcTD4tMDu171LdU3A8rKyWaoM?=
 =?us-ascii?Q?Z8E8Yp9UOn5YT1btqeciq895et3YkE1hA8AckspeT5IDWBF3Aq5B+oqCku1H?=
 =?us-ascii?Q?4UVv/wz4JzKIWQ0NAy7jWRlllWu/w3RahSpTpq2nkkeOPvNuBhmWIUAO0rFg?=
 =?us-ascii?Q?GtXIVBxzwaNfL8LkR23X2HIzSng4+1YkbQb/5SaZeOumhhyjsewFFCTi+hUO?=
 =?us-ascii?Q?R1GVwEu2qUERw74pLDeYidchqwYXuq3MCly3nWzFIfhCTUwCuu/GS6ziEQdX?=
 =?us-ascii?Q?rNKak0wi9MvdLhgsW8//rCTGU/tx6SLr6rpo5syNDyFUvXNW6U1SGJkEh68Y?=
 =?us-ascii?Q?MSfPFPx6YWPNWS/wwA3Jhzku81fEYqotJ833CS+IuEect/Ek1YvpPWFKctVL?=
 =?us-ascii?Q?by6cTagFhGv1CyMNcXtkLzuytk4RDWUZWgc4BHORbr4qqs6/ro3/IGPTuEYN?=
 =?us-ascii?Q?hx7ywGK2V0Sl5D7/01Txk25uAM4+kHgozZpFW2qjx4TKbZFd91Ah9q0QfFI/?=
 =?us-ascii?Q?9Kgqq8R+Uv0TQT41bo/M2XtIporIcnGWE5It2PccQmIIuhLP+DJRFYDX8968?=
 =?us-ascii?Q?3W5JsuXK6qlBfZjJM+69hJECbJ/29j6LRTPBQWnCF/9e5Vc7k7fOdv/djQMU?=
 =?us-ascii?Q?kbit/zeaWo9uPKmwuFSYMajgFU9aqJ5CJrUdlr4FAw2b3RyxP6d8yQIWmtTX?=
 =?us-ascii?Q?0hiSXabRRgOFexdforyKenqo4HpBAFIdAEn4V7HwrwQGVo21yAimSLLmyfJa?=
 =?us-ascii?Q?m2pjlDRcJC1Ylu8jkw9UV3bPBll1iQQIyI4dpTFHu/Mes4ycNdaxGEAEVVHN?=
 =?us-ascii?Q?uratzp3JolWw8vxPAQWovfLeuxKzro21WqlHgH2hsGfYeTDeDr6T0j6gsvw9?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e6Yn95x+A4BIM31UQFa+tglIkJzlQZ5EoAXu1tMgVKReTBnZFF8oQAVLBEvSfqZDPgYF2sWfWsMPaJyH6mmnf70F56OT+dCi1wLgaoOlZ52x2+kxW3gxP7u4ahI8LN/CR1+0k/3t3pNDPYjdlSuLjCGv4KmKz0EIbqlyXUwW9F5DDn7Mh9WkuWOzU8mW9j+YYyMgWaOxBGl1lQzkNNp8WtYcMZ32K4ocuTDkpj6s70t0INonBN9X9waoyBwPBiLwKS0aBEfn7ukqbYvVV1NxkCXTT61lweL9ZrkFvjnXhqPYd4NE1W+QZcOJ/Me/o8OzXpwjy3LbeuycibvbCkFWu0Z7Tsl3qqvsUXwZqMIlS9HiLDZO9Z/kZdA4eEJklJ+nh1f41QIRTOhYwQh7VyuQoGbcG1vhV+Kq2Y2cxVOmkthzYjkR7EeTwztifNMefpOfMW+X+0itREprkz3PNxn5v7ALqcrsZTKh5mjOsMIeqd1ZpAZ9v1AAaFYFKeNYcX2GHewQQd0cgiuVyxbDdXNkS49lrjLlBQxxCmNfIKSL3wgyR54Ak2tcG/R79v5BJRq+O+l669s+4DfkoPNVCvyiQ7DSXTETiol1STkYSbZN0YY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb283088-efb9-4bc1-fd27-08ddadbf5b34
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 16:52:33.8151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 282qY6/1GdVCnf0JO4Yf5pXmfTjgvXrGFPHtbp3GFPw38Cv57UMbbS/LIv0AI/QsKxBu8QQed1xH83fXFFRzvQ4noLg06jClwLRGlI42TXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5049
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170133
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEzMyBTYWx0ZWRfX0XQ/Gj+xJ5b6 vVEZc7FgSb8eOUGvq0ux12F1eWGDFi+HBugyE0D//imi908pmwDvshtQu2oN7tBi/3uXF8XzX2L qwFKPBdo1wV3So3VQigDFVAlDexnka14gw6l7vase0zl91YMczw4QrP9+QUunU17IucrNL0rC8U
 Dri3iJc5NgPeLq/IMbpL8iK8rk7G0omHKN1KM2oiHxZNSx5P+0D/IJjo70SMmNjImZ6nt7LPpOU hGe6+07vjY8oJN4BS2HESXKGmohkj7JO81cAlRLf8PkP0f4OIui8Qi/ZZT0uLeoICe8ehDn8A2k RxN4knoFaF03IXbSiZc0D00yyyTRMVqkwV+7DR/8aQiQnWdzW56Ztf3UHCTU5b+rTjfMuBLI2Cc
 bHxHDVcaGT93t38FJxIYebYvPAARGui2RxF9VyOFockVT5Q8y+IlxKeGjk1utSIpUXVcfSog
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=68519d54 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=37rDS-QxAAAA:8 a=KBXOH5pI_hOhAOLjNK8A:9 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-GUID: fqlGd_ERzPM-gkVJDnkQMWXlBUxglWAH
X-Proofpoint-ORIG-GUID: fqlGd_ERzPM-gkVJDnkQMWXlBUxglWAH

page_vma_mapped_walk() is used to traverse page tables from a VMA, used by
rmap logic once the reverse mapping has been traversed to the VMA level.

It is also used by other users (migration, damon, etc.) but is primarily
used by the reverse mapping and is a key part of its logic, so it seems
appropriate to place it here.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08045f9efadd..5010e91e8e75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15888,6 +15888,7 @@ R:	Harry Yoo <harry.yoo@oracle.com>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	include/linux/rmap.h
+F:	mm/page_vma_mapped.c
 F:	mm/rmap.c
 
 MEMORY MANAGEMENT - SECRETMEM
-- 
2.49.0

