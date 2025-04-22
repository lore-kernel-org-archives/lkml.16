Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B354C1F4E59
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309409; cv=fail; b=oeSbbSPNva2dW5fY6wGcqlTNDO8qR8hwb6Dn4Fvjdi+Zw/JCwzoRRsgkEOaArC5JACmTIMZGyyAUyhM1oUSb58NLS/gUC7aIwrcgdrCfk7Agd6nfXOuOcd6Sp0AwDoy1iD+ddZScEN1JhT7wNvqcPJe4XqxVfqTM1tT7wSOBmG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309409; c=relaxed/simple;
	bh=LIrW8oQhnxPReUz7eCBlCePtERRn/t2/x5r4VoH8MLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sBY4xG+cMkF1Mp1Hi3PQfhm+kMpW764IiUc85QeiVtZbMMImvt1PjSY8Ue1AGwB0rlKAVL7qSP8dYwujoVKF39PVkqhIU40H/vy1ALQgQPQmoRAgaSIVZyPsVW7MboCjChgTI+pDcPGyCVXrbPv+H2ADJlJd/md8hde5+hjV//o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hGjF3Udz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R+zJ5n8O; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hGjF3Udz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R+zJ5n8O"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7Mxrv027888;
	Tue, 22 Apr 2025 08:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=5BYqEfa94ZofeZWm3vMwqabnouuNx2Qt8hfmCv3B/Js=; b=
	hGjF3Udz7U7+5QzSXwQ7IieM6IayJyiuJ/8W9oWv8/KAPxlwpNRAHayhOyn3/yKc
	ftJO2O79g5RaWTH2IR8yK/mqN1hv2nV3lcwpduTF9Q9lRJBFuJcd3xqzeAA6w9f6
	ocWCjgHM5CvB0ly4/rWjxVon+lGolkKhXPyHUSkf3Rse8DIPFj5eUHc07V/fpwHd
	S8qvmhzOaThwC/OdiFfv9iLpZxUaaCFNBTqepjT5QBIUzcmVoqt7llIm1XBC1QBa
	CzN5WtjlOFanYqsg8E4SS783H+alo/GI3REUzutJ02Ksfdg2pQ5P/r8uTxuY0rgX
	RwAYToIf8e45y2rG+/buMQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4644csux0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7GZ4r021147;
	Tue, 22 Apr 2025 08:09:50 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010006.outbound.protection.outlook.com [40.93.20.6])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429fhse0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2YFzHRFjpcsyH3jgApA60R/XkTwwQpAMspMWl1gok/LH8Uwln9p+4DkOBr4w5QTf7u4X25RdhztuMEEWssrXwUAenVHGGy/3zFd7+fezR46yxLuJu8Ji9jA/ywMV1lAEp7oOUGMmtvJng4A2fdNEAibOYNsCZ3nanadF1jR67BANTkeU1lTPSBvYIgG/cPcgOksrdupa47nnFFkp58yvzYt6OGIDat0Prt8rMmeRSeD8QFE1JRBHrDDAKVMZAfSa/pYBDqR0/MMV/eTkt4Ues7JKSilgjlrc3wUgAXJtU7k/tVZOkSFaRs2v+dnTAIg+LbQ2XIUDh0UsfdBn7txAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BYqEfa94ZofeZWm3vMwqabnouuNx2Qt8hfmCv3B/Js=;
 b=MTpocpOSKmomCtPEQ9m0pt9znUnn6KmOPQYD7KyvqMPn79BpBHqavPZOi9ZlS8X5mpJLHXwsDv3NLDkdxTSBlrQb1s1RVJ1IUhl5/z/AsdO+T1FDWkpRE0IOmoRHmzhyMsSBplMw9UbzpKc64qxEOrv1MiTC3OTbIn4wZWmCEnIBsuo3NtML7Qb+1tCL+jmYtcQpt3GTLI3rwsKT7fqqKpTrliOF8TIjLqysGAh6V0nhoqB97P4pcCcVvFTPuzU0W1zUEUnw5FJEPoEmtTvR6yA2w+xT8Rk13KKz5KBuE7zpQmkDJLVvtSEDHJP3uul7KEfOSHw/IH+JOQ+betbdcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BYqEfa94ZofeZWm3vMwqabnouuNx2Qt8hfmCv3B/Js=;
 b=R+zJ5n8OAQF7QNfEdRM/9MKEA7Jm+/TH7dH6zy8mbnWOC1VlExtAN2xFfz5pVPvnWpzNx7qGTPZIP+0M8xgC064HN7/kzkUy1GNc0LXTBVhM4tlv9ku/a2qjJS5rIL1mqz8DOPGMestTRI7fhB8i4EcNR6PveK+WBpUnnJYZkDE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4587.namprd10.prod.outlook.com (2603:10b6:806:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 08:09:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:09:46 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 01/10] mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
Date: Tue, 22 Apr 2025 09:09:20 +0100
Message-ID: <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0182.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 06771ede-8307-4977-e957-08dd81750b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oY5WLG9pVK5+vG/EPyXhUDNCzfiA7Y/EAOa5iBCggKae8fZloVy9KHB1WIan?=
 =?us-ascii?Q?AWxOBSWDl7GW41gGKIV1zAM9eF4pP8OnWpHkUKtk4rFKUBSXC+MvQYxvMkoj?=
 =?us-ascii?Q?zfLL3+BKx5ntoyDxrqfKIAZ6wVjc0inPNf3Q4a4AgIA6PVRg73DJO6PhtspF?=
 =?us-ascii?Q?GCkUFgYHya1jF/pJa8eqbxHfuOIzZzA3SAQXqeVIojmzKz1wCrLPndn7tkCN?=
 =?us-ascii?Q?JgoQGnmnZI8Zr1WY7i6ak+uYvRyOtCuBlCrFNgiOU5oa+Qy+IiMU+j0NPDNN?=
 =?us-ascii?Q?pC7PqQekAQRU1H664bAReAKpmbEvkK2wPtYPinxAVtFnTObQnHA2Nf1k5fNL?=
 =?us-ascii?Q?0cpm+KiRtVokNt3r2FD+xxcwypGZr5sJXui/3dy0WuiX3NHj1FcJQAZlxPCZ?=
 =?us-ascii?Q?U8V3PGKimDHVGno1YnLHP7GPQLEaBjwr2vWw6UZPW7DmzX0A9d/MFBRVOaRA?=
 =?us-ascii?Q?92ntO60Cd7mauHthCXMWI3RdUh8XhnW6SglWbYfpaNU3uy/AWodEH9iVgrmB?=
 =?us-ascii?Q?o7MHgXw6n0f6uNlkDcmbzHUqYkX5TTBA1NKGz4LUw8LL/vWHjKPK5X7gv3YX?=
 =?us-ascii?Q?y2im+wU76P2bGu3W0AyydjOBFDvx53ygYM7vZHRCYXD0MdbRMEiiTmTU8jcG?=
 =?us-ascii?Q?iVBzEswWhHTaPbNNLOHBPuunBlbB/DgWdqmOYxENZv6kYpvF+9zXGnrYPnbk?=
 =?us-ascii?Q?WOOHTaXAk/S0UapvPslPTOpfcSp5MSkrwWJJPViuq8sjB0OE9Pv7IUtmkYB3?=
 =?us-ascii?Q?IGphN8XXOJR0c5MySXmZ9XE4NmvoW92C4PNDkRhuwLWzjymcsEA8Ze7dBFDy?=
 =?us-ascii?Q?o0pj113M0LLByLXt+vcf5OAiAThN0KLco12xPf3xZW90J6QgninU64Jjcezh?=
 =?us-ascii?Q?WW3eo1688o72k0poGYuNIgyxin+C/RMrOBCv9ixGjOeUlBjfWbnIldyZDzp9?=
 =?us-ascii?Q?AxOBgl6BZR/4zlozQ6ms5kp5Ahq6OjDoB6t/oSs6y1HY6Oe1M7rfgBIQqB+S?=
 =?us-ascii?Q?QK+YTcj+amN3h7QdwCGgQE6ojwa1yKv3bcP491/MFqv8GO01y5GVCstNwJNk?=
 =?us-ascii?Q?WQMZ0DojUhDj7xcGS08khX7s8PrEmtqfX4eHkAlpb+/lQrQLqayc7pBI0Wta?=
 =?us-ascii?Q?KUPmvOo9wzF7q99dD4XBCsdqc9D67anvuMohTXGpgMbIj8JFogNx7poUPm/D?=
 =?us-ascii?Q?q59eZ93QXTfuR4xoJj9vOowKFmAk0vewBOLfsm8IZP0z4sstpBD4AGAx0//A?=
 =?us-ascii?Q?uv3EvcP97hFSNG3XblP2NGxB9tGR1xNhhRiiiBeutZQyXe7BRMn44q19EuNB?=
 =?us-ascii?Q?Qrbg0jO9MPaLuPp38slgBHXyFxLGx9Yz50eqWrPjDZJQ+oNB5RnzGCuTbKZ9?=
 =?us-ascii?Q?7jUyB5fE2nQJ1ktcySAVvDAipHf1lo7Qo11mLNoovY86I4Yf1MCpEyEiyNDN?=
 =?us-ascii?Q?bZz9iHtaeDc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?svCSWj8fpUQaTtQu3s+oEKAvx5sRqC4+UxDXzm5dY8rn1oDBgugHzHVWUK54?=
 =?us-ascii?Q?iHYh2IkIfCyrD2pL16Piw2wweqFoSiYSO39+DNx+nGeuJWRD4RzHlqCTzZep?=
 =?us-ascii?Q?8mR4Yjd9LjnaYE5zMPRflI/T7YotHMNBMCSSp83DqK0bgEfN03THqQhJ1tWW?=
 =?us-ascii?Q?wh+DoEwytIBLoqlohqGog3arp96vdxZ4yL4yFJLVniGCbYO5kBe6Iiv/BZ6j?=
 =?us-ascii?Q?fppIrFo0BX5hOhPLORngK8h93U+CpgU+cDlHZrAxyjwwbgnCJuVhoCYAxFds?=
 =?us-ascii?Q?MfDiI1d2nmmvL8AJ2Uvm1nL+dMOIX1sghk3tmOvjtJkOwAqKhcieUvhdS9OR?=
 =?us-ascii?Q?kQHhvFazmJ1di02sdJmbQ5uWdDfR1RvRjztr6qej4BT1iG817r+5PAWLHVBv?=
 =?us-ascii?Q?7rTmhzcr921Sxq+NSkBMECPK/hsAkTr/YSKzTERz71s4lJKUaO0QcVexpNaO?=
 =?us-ascii?Q?zB4PCJ8ysOfnMHiRH6ttI4EzdtPIbrGNAQFX6eg8rhiCNbu7jVbz0+AdgVjO?=
 =?us-ascii?Q?pMYrN+3hOJHzftuVas8HZzJ5v8rDkjm5m4xmJOj5WIQIHjb75kxkqfH6VSVb?=
 =?us-ascii?Q?B+u/lQ7pOJ5zincxplcJ+TLX5BNmO8BuewHoIf9BtbDuwHFMEDZ8ySKvEcXp?=
 =?us-ascii?Q?/NAqVucNXI+MZc4PrGpUatEJI5xzxaTcAS+M2b863gMY0c8JVWnlcv/5Rfhd?=
 =?us-ascii?Q?JrRs7A8usK2Qhlhdfa2OO7CTjYELP3S0z262vf3/YlaSC0BjeIvKz013fVM2?=
 =?us-ascii?Q?okvIckzGPjH2lt4Ga52INMjScPsao7dAHeUO4Nv4oenHdIfZ+uEq9eCa58sf?=
 =?us-ascii?Q?GsTUywihZBZOp9ZmenybYnZMJAauNLWc3BAiDXORZXQI8EBRTE+fPf+Gx4V0?=
 =?us-ascii?Q?D+72yqE/JzPI6kRBasVTWPoEfxEx3Y0RdvNE5DdR8XNY4qBgj0+ifGZgJWgH?=
 =?us-ascii?Q?wZy9eJZe7R6ufmsbO5TtdhZxwCJlOEe/bL5528/XGJV3uf+85tMGQp6ZUqx8?=
 =?us-ascii?Q?3lt4w6bFWXFhYXruFHUnO8/QGZTV3YnkCfMp7PBUG44IVqFbeyzBTaRqSJN/?=
 =?us-ascii?Q?qB/LlxYECTLQLxeBhMqQcrC9/v9Trk89iMyaMynuK8wU2EV8GmS2x2U8nXc/?=
 =?us-ascii?Q?pqnIOtU3/7vWAWMwZ9D0M0jeCOLUpyzggZuevPQ/U166UL8oQ+rqCYajVJdO?=
 =?us-ascii?Q?JAHwmWRqgOl/3RhVIjsyeegTkJ6NZw2wk1HYZk0lJmwj7Hxxb8BxeMlh44Ca?=
 =?us-ascii?Q?Z0PAanDx2bCiHyo+DGap/8HgOxaECdqVwwiHNQ/8Yh9NYLnxD6YZC4rRJNPP?=
 =?us-ascii?Q?IOb7vpoXbUNAgU7ETP84/1WRkgHXitUBXD/eKxXZdurvNzp6KUwAmqKxZStb?=
 =?us-ascii?Q?kC97eYFLg/GwcvFgakY0iNzdrs/rdJUagbuIab8fR6HU36DnvXLu7ugP3O1x?=
 =?us-ascii?Q?xuXDAiQFmrZST0RamPbSx8yxEQmpm/+3bBagur94iik65DzhAq71w2eEU0CO?=
 =?us-ascii?Q?9kWDFtEwQcPF5MZEDiQOeX2cpH0eDMVE2sW+rjMD5fyzirVMG89WBx1QuzC9?=
 =?us-ascii?Q?wsN3R2MOk7l+CAbuMU4AA0oPanPIeHpPYe4b7ORmqYNxR2bNJ9mv/zk5sMLZ?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WLS5fD+HOUSX25M+hvQGJM2pmJmvjUzkVw1HCx54i1rjpMlO74tt+hxqo3Apf6pp1OoMNM3RtCQD3UnCVj1E5HacDc+PszZPyxI6/L6enrKlkEwgoK2SN1s+4Tph8LLgwx9+SjRU28WMfYp7eqty9xOekHEWN3bXBeGD7ALnGWF2ODH8uf/warDmqNjLl1qI135C1zPeXc1ZMVQQMhHh2X0ndpju5kuEXFxv3zd4pRHxR5IWDt4Undmz5VogSosdDhi/1c5FogG8pAAjj9ugt2ngs6q7HthrqY0GbE6+7Nblx1GzSLF/oaWrhDHoX+5BETALSlZm7uvqbsBz6acWJlrIBYrIywV3ctsZt2r2V4VnaY4IrgvGCzxO7UwpmvYH6k+ouzmVnR5Y4kvH7x+l5pxAtnux7sG0lGnpOTvI0YZV4mX3rQU7hU4mSLvLGXVqp2XS2qYG6Pj2BYO36YTn1kPlQpfQCFqlubVQdGRpCYjj0VKtvWp5m18en2Saf+/bltwcUZ5gQUplnfLT5mlhetT0zfnZzzGS7HOZ+IvgUR+DmaiP663gk94KpDKVDbl3Jxwn+dWHH9sfnwVMv1VMWyK+ENVC+Ffj+Nu8t3Frer0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06771ede-8307-4977-e957-08dd81750b6f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:09:46.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rb5bW5ummKVipyVyFLQ5sX1Nqyr78FkY4U51wXR2lEY1ZGzB6SE8J9UAP+1AXWK9KeaJrXmkrZiTn7Sud9azdjMH+/49gldrmK8kncWt1d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220061
X-Proofpoint-ORIG-GUID: EJU-9Oz_w8rdqheJTDqZow3I6eHHjzGN
X-Proofpoint-GUID: EJU-9Oz_w8rdqheJTDqZow3I6eHHjzGN

When mremap() moves a mapping around in memory, it goes to great lengths to
avoid having to walk page tables as this is expensive and
time-consuming.

Rather, if the VMA was faulted (that is vma->anon_vma != NULL), the virtual
page offset stored in the VMA at vma->vm_pgoff will remain the same, as
well all the folio indexes pointed at the associated anon_vma object.

This means the VMA and page tables can simply be moved and this affects the
change (and if we can move page tables at a higher page table level, this
is even faster).

While this is efficient, it does lead to big problems with VMA merging - in
essence it causes faulted anonymous VMAs to not be mergeable under many
circumstances once moved.

This is limiting and leads to both a proliferation of unreclaimable,
unmovable kernel metadata (VMAs, anon_vma's, anon_vma_chain's) and has an
impact on further use of mremap(), which has a requirement that the VMA
moved (which can also be a partial range within a VMA) may span only a
single VMA.

This makes the mergeability or not of VMAs in effect a uAPI concern.

In some use cases, users may wish to accept the overhead of actually going
to the trouble of updating VMAs and folios to affect mremap() moves. Let's
provide them with the choice.

This patch add a new MREMAP_RELOCATE_ANON flag to do just that, which
attempts to perform such an operation. If it is unable to do so, it cleanly
falls back to the usual method.

It carefully takes the rmap locks such that at no time will a racing rmap
user encounter incorrect or missing VMAs.

It is also designed to interact cleanly with the existing mremap() error
fallback mechanism (inverting the remap should the page table move fail).

Also, if we could merge cleanly without such a change, we do so, avoiding
the overhead of the operation if it is not required.

In the instance that no merge may occur when the move is performed, we
still perform the folio and VMA updates to ensure that future mremap() or
mprotect() calls will result in merges.

In this implementation, we simply give up if we encounter large folios. A
subsequent commit will extend the functionality to allow for these cases.

We restrict this flag to purely anonymous memory only.

we separate out the vma_had_uncowed_parents() helper function for checking
in should_relocate_anon() and introduce a vma_had_uncowed_children()
function for the same purpose.

We carefully check for pinned folios in case a caller who holds a pin might
make assumptions about index, mapping fields which we are about to
manipulate.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/uapi/linux/mman.h        |   1 +
 mm/internal.h                    |   1 +
 mm/mremap.c                      | 410 +++++++++++++++++++++++++++++--
 mm/vma.c                         |  78 ++++--
 mm/vma.h                         |  28 ++-
 tools/testing/vma/vma.c          |   5 +-
 tools/testing/vma/vma_internal.h |  33 +++
 7 files changed, 512 insertions(+), 44 deletions(-)

diff --git a/include/uapi/linux/mman.h b/include/uapi/linux/mman.h
index e89d00528f2f..d0542f872e0c 100644
--- a/include/uapi/linux/mman.h
+++ b/include/uapi/linux/mman.h
@@ -9,6 +9,7 @@
 #define MREMAP_MAYMOVE		1
 #define MREMAP_FIXED		2
 #define MREMAP_DONTUNMAP	4
+#define MREMAP_RELOCATE_ANON	8
 
 #define OVERCOMMIT_GUESS		0
 #define OVERCOMMIT_ALWAYS		1
diff --git a/mm/internal.h b/mm/internal.h
index 838f840ded83..a08863169bec 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -46,6 +46,7 @@ struct folio_batch;
 struct pagetable_move_control {
 	struct vm_area_struct *old; /* Source VMA. */
 	struct vm_area_struct *new; /* Destination VMA. */
+	struct vm_area_struct *relocate_locked; /* VMA which is rmap locked. */
 	unsigned long old_addr; /* Address from which the move begins. */
 	unsigned long old_end; /* Exclusive address at which old range ends. */
 	unsigned long new_addr; /* Address to move page tables to. */
diff --git a/mm/mremap.c b/mm/mremap.c
index 7db9da609c84..1d915445026f 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -71,6 +71,15 @@ struct vma_remap_struct {
 	unsigned long charged;		/* If VM_ACCOUNT, # pages to account. */
 };
 
+/* Represents local PTE state. */
+struct pte_state {
+	unsigned long old_addr;
+	unsigned long new_addr;
+	unsigned long old_end;
+	pte_t *ptep;
+	spinlock_t *ptl;
+};
+
 static pud_t *get_old_pud(struct mm_struct *mm, unsigned long addr)
 {
 	pgd_t *pgd;
@@ -139,18 +148,50 @@ static pmd_t *alloc_new_pmd(struct mm_struct *mm, unsigned long addr)
 	return pmd;
 }
 
-static void take_rmap_locks(struct vm_area_struct *vma)
+/*
+ * Determine whether the old and new VMAs share the same anon_vma. If so, this
+ * has implications around locking and to avoid deadlock we need to tread
+ * carefully.
+ */
+static bool has_shared_anon_vma(struct pagetable_move_control *pmc)
+{
+	struct vm_area_struct *vma = pmc->old;
+	struct vm_area_struct *locked = pmc->relocate_locked;
+
+	if (!locked)
+		return false;
+
+	return vma->anon_vma->root == locked->anon_vma->root;
+}
+
+static void maybe_take_rmap_locks(struct pagetable_move_control *pmc)
 {
+	struct vm_area_struct *vma;
+	struct anon_vma *anon_vma;
+
+	if (!pmc->need_rmap_locks)
+		return;
+
+	vma = pmc->old;
+	anon_vma = vma->anon_vma;
 	if (vma->vm_file)
 		i_mmap_lock_write(vma->vm_file->f_mapping);
-	if (vma->anon_vma)
-		anon_vma_lock_write(vma->anon_vma);
+	if (anon_vma && !has_shared_anon_vma(pmc))
+		anon_vma_lock_write(anon_vma);
 }
 
-static void drop_rmap_locks(struct vm_area_struct *vma)
+static void maybe_drop_rmap_locks(struct pagetable_move_control *pmc)
 {
-	if (vma->anon_vma)
-		anon_vma_unlock_write(vma->anon_vma);
+	struct vm_area_struct *vma;
+	struct anon_vma *anon_vma;
+
+	if (!pmc->need_rmap_locks)
+		return;
+
+	vma = pmc->old;
+	anon_vma = vma->anon_vma;
+	if (anon_vma && !has_shared_anon_vma(pmc))
+		anon_vma_unlock_write(anon_vma);
 	if (vma->vm_file)
 		i_mmap_unlock_write(vma->vm_file->f_mapping);
 }
@@ -204,8 +245,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	 *   serialize access to individual ptes, but only rmap traversal
 	 *   order guarantees that we won't miss both the old and new ptes).
 	 */
-	if (pmc->need_rmap_locks)
-		take_rmap_locks(vma);
+	maybe_take_rmap_locks(pmc);
 
 	/*
 	 * We don't have to worry about the ordering of src and dst
@@ -278,8 +318,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	pte_unmap(new_pte - 1);
 	pte_unmap_unlock(old_pte - 1, old_ptl);
 out:
-	if (pmc->need_rmap_locks)
-		drop_rmap_locks(vma);
+	maybe_drop_rmap_locks(pmc);
 	return err;
 }
 
@@ -537,15 +576,14 @@ static __always_inline unsigned long get_extent(enum pgt_entry entry,
  * Should move_pgt_entry() acquire the rmap locks? This is either expressed in
  * the PMC, or overridden in the case of normal, larger page tables.
  */
-static bool should_take_rmap_locks(struct pagetable_move_control *pmc,
-				   enum pgt_entry entry)
+static bool should_take_rmap_locks(enum pgt_entry entry)
 {
 	switch (entry) {
 	case NORMAL_PMD:
 	case NORMAL_PUD:
 		return true;
 	default:
-		return pmc->need_rmap_locks;
+		return false;
 	}
 }
 
@@ -557,11 +595,15 @@ static bool move_pgt_entry(struct pagetable_move_control *pmc,
 			   enum pgt_entry entry, void *old_entry, void *new_entry)
 {
 	bool moved = false;
-	bool need_rmap_locks = should_take_rmap_locks(pmc, entry);
+	bool override_locks = false;
 
-	/* See comment in move_ptes() */
-	if (need_rmap_locks)
-		take_rmap_locks(pmc->old);
+	if (!pmc->need_rmap_locks && should_take_rmap_locks(entry)) {
+		override_locks = true;
+
+		pmc->need_rmap_locks = true;
+		/* See comment in move_ptes() */
+		maybe_take_rmap_locks(pmc);
+	}
 
 	switch (entry) {
 	case NORMAL_PMD:
@@ -585,8 +627,9 @@ static bool move_pgt_entry(struct pagetable_move_control *pmc,
 		break;
 	}
 
-	if (need_rmap_locks)
-		drop_rmap_locks(pmc->old);
+	maybe_drop_rmap_locks(pmc);
+	if (override_locks)
+		pmc->need_rmap_locks = false;
 
 	return moved;
 }
@@ -752,6 +795,209 @@ static unsigned long pmc_progress(struct pagetable_move_control *pmc)
 	return old_addr < orig_old_addr ? 0 : old_addr - orig_old_addr;
 }
 
+/*
+ * If the folio mapped at the specified pte entry can have its index and mapping
+ * relocated, then do so.
+ *
+ * Returns the number of pages we have traversed, or 0 if the operation failed.
+ */
+static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
+		struct pte_state *state, bool undo)
+{
+	struct folio *folio;
+	struct vm_area_struct *old, *new;
+	pgoff_t new_index;
+	pte_t pte;
+	unsigned long ret = 1;
+	unsigned long old_addr = state->old_addr;
+	unsigned long new_addr = state->new_addr;
+
+	old = pmc->old;
+	new = pmc->new;
+
+	pte = ptep_get(state->ptep);
+
+	/* Ensure we have truly got an anon folio. */
+	folio = vm_normal_folio(old, old_addr, pte);
+	if (!folio)
+		return ret;
+
+	folio_lock(folio);
+
+	/* No-op. */
+	if (!folio_test_anon(folio) || folio_test_ksm(folio))
+		goto out;
+
+	/*
+	 * This should never be the case as we have already checked to ensure
+	 * that the anon_vma is not forked, and we have just asserted that it is
+	 * anonymous.
+	 */
+	if (WARN_ON_ONCE(folio_maybe_mapped_shared(folio)))
+		goto out;
+	/* The above check should imply these. */
+	VM_WARN_ON_ONCE(folio_mapcount(folio) > folio_nr_pages(folio));
+	VM_WARN_ON_ONCE(!PageAnonExclusive(folio_page(folio, 0)));
+
+	/*
+	 * A pinned folio implies that it will be used for a duration longer
+	 * than that over which the mmap_lock is held, meaning that another part
+	 * of the kernel may be making use of this folio.
+	 *
+	 * Since we are about to manipulate index & mapping fields, we cannot
+	 * safely proceed because whatever has pinned this folio may then
+	 * incorrectly assume these do not change.
+	 */
+	if (folio_maybe_dma_pinned(folio))
+		goto out;
+
+	/*
+	 * This should not happen as we explicitly disallow this, but check
+	 * anyway.
+	 */
+	if (folio_test_large(folio)) {
+		ret = 0;
+		goto out;
+	}
+
+	if (!undo)
+		new_index = linear_page_index(new, new_addr);
+	else
+		new_index = linear_page_index(old, old_addr);
+
+	/*
+	 * The PTL should keep us safe from unmapping, and the fact the folio is
+	 * a PTE keeps the folio referenced.
+	 *
+	 * The mmap/VMA locks should keep us safe from fork and other processes.
+	 *
+	 * The rmap locks should keep us safe from anything happening to the
+	 * VMA/anon_vma.
+	 *
+	 * The folio lock should keep us safe from reclaim, migration, etc.
+	 */
+	folio_move_anon_rmap(folio, undo ? old : new);
+	WRITE_ONCE(folio->index, new_index);
+
+out:
+	folio_unlock(folio);
+	return ret;
+}
+
+static bool pte_done(struct pte_state *state)
+{
+	return state->old_addr >= state->old_end;
+}
+
+static void pte_next(struct pte_state *state, unsigned long nr_pages)
+{
+	state->old_addr += nr_pages * PAGE_SIZE;
+	state->new_addr += nr_pages * PAGE_SIZE;
+	state->ptep += nr_pages;
+}
+
+static bool relocate_anon_ptes(struct pagetable_move_control *pmc,
+		unsigned long extent, pmd_t *pmdp, bool undo)
+{
+	struct mm_struct *mm = current->mm;
+	struct pte_state state = {
+		.old_addr = pmc->old_addr,
+		.new_addr = pmc->new_addr,
+		.old_end = pmc->old_addr + extent,
+	};
+	pte_t *ptep_start;
+	bool ret;
+	unsigned long nr_pages;
+
+	ptep_start = pte_offset_map_lock(mm, pmdp, pmc->old_addr, &state.ptl);
+	/*
+	 * We prevent faults with mmap write lock, hold the rmap lock and should
+	 * not fail to obtain this lock. Just give up if we can't.
+	 */
+	if (!ptep_start)
+		return false;
+
+	state.ptep = ptep_start;
+	for (; !pte_done(&state); pte_next(&state, nr_pages)) {
+		pte_t pte = ptep_get(state.ptep);
+
+		if (pte_none(pte) || !pte_present(pte)) {
+			nr_pages = 1;
+			continue;
+		}
+
+		nr_pages = relocate_anon_pte(pmc, &state, undo);
+		if (!nr_pages) {
+			ret = false;
+			goto out;
+		}
+	}
+
+	ret = true;
+out:
+	pte_unmap_unlock(ptep_start, state.ptl);
+	return ret;
+}
+
+static bool __relocate_anon_folios(struct pagetable_move_control *pmc, bool undo)
+{
+	pud_t *pudp;
+	pmd_t *pmdp;
+	unsigned long extent;
+	struct mm_struct *mm = current->mm;
+
+	if (!pmc->len_in)
+		return true;
+
+	for (; !pmc_done(pmc); pmc_next(pmc, extent)) {
+		pmd_t pmd;
+		pud_t pud;
+
+		extent = get_extent(NORMAL_PUD, pmc);
+
+		pudp = get_old_pud(mm, pmc->old_addr);
+		if (!pudp)
+			continue;
+		pud = pudp_get(pudp);
+
+		if (pud_trans_huge(pud) || pud_devmap(pud))
+			return false;
+
+		extent = get_extent(NORMAL_PMD, pmc);
+		pmdp = get_old_pmd(mm, pmc->old_addr);
+		if (!pmdp)
+			continue;
+		pmd = pmdp_get(pmdp);
+
+		if (is_swap_pmd(pmd) || pmd_trans_huge(pmd) ||
+		    pmd_devmap(pmd))
+			return false;
+
+		if (pmd_none(pmd))
+			continue;
+
+		if (!relocate_anon_ptes(pmc, extent, pmdp, undo))
+			return false;
+	}
+
+	return true;
+}
+
+static bool relocate_anon_folios(struct pagetable_move_control *pmc, bool undo)
+{
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long new_addr = pmc->new_addr;
+	bool ret;
+
+	ret = __relocate_anon_folios(pmc, undo);
+
+	/* Reset state ready for retry. */
+	pmc->old_addr = old_addr;
+	pmc->new_addr = new_addr;
+
+	return ret;
+}
+
 unsigned long move_page_tables(struct pagetable_move_control *pmc)
 {
 	unsigned long extent;
@@ -1132,6 +1378,74 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
 	}
 }
 
+/*
+ * Should we attempt to relocate anonymous folios to the location that the VMA
+ * is being moved to by updating index and mapping fields accordingly?
+ */
+static bool should_relocate_anon(struct vma_remap_struct *vrm,
+	struct pagetable_move_control *pmc)
+{
+	struct vm_area_struct *old = vrm->vma;
+
+	/* Currently we only do this if requested. */
+	if (!(vrm->flags & MREMAP_RELOCATE_ANON))
+		return false;
+
+	/* We can't deal with special or hugetlb mappings. */
+	if (old->vm_flags & (VM_SPECIAL | VM_HUGETLB))
+		return false;
+
+	/* We only support anonymous mappings. */
+	if (!vma_is_anonymous(old))
+		return false;
+
+	/* If no folios are mapped, then no need to attempt this. */
+	if (!old->anon_vma)
+		return false;
+
+	/*
+	 * If the VMA is referenced by a parent process (i.e. is the child of a
+	 * fork) or exists in a process which has been forked, then the folio
+	 * may be non-exclusively mapped, and thus is non-relocatable.
+	 *
+	 * Note the uncowed children check is sufficient, because we hold the
+	 * mmap lock.
+	 */
+	if (vma_had_uncowed_parents(old) || vma_had_uncowed_children(old))
+		return false;
+
+	/* Otherwise, we're good to go! */
+	return true;
+}
+
+static void lock_new_anon_vma(struct vm_area_struct *new_vma)
+{
+	/*
+	 * We have a new VMA to reassign folios to. We take a lock on
+	 * its anon_vma so reclaim doesn't fail to unmap mappings.
+	 *
+	 * We have acquired a VMA write lock by now (in vma_link()), so
+	 * we do not have to worry about racing faults.
+	 *
+	 * NOTE: we do NOT need to acquire an rmap lock on the old VMA,
+	 * as forks require an mmap write lock, which we hold.
+	 */
+	anon_vma_lock_write(new_vma->anon_vma);
+
+	/*
+	 * lockdep is unable to differentiate between the anon_vma lock we take
+	 * in the old VMA and the one we are taking here in the new VMA.
+	 *
+	 * In each instance where the old VMA might have its anon_vma
+	 * lock taken, we explicitly check to ensure they are not one
+	 * and the same, avoiding deadlock.
+	 *
+	 * Express this to lockdep through a subclass.
+	 */
+	lock_set_subclass(&new_vma->anon_vma->root->rwsem.dep_map, 1,
+			  _THIS_IP_);
+}
+
 /*
  * Copy vrm->vma over to vrm->new_addr possibly adjusting size as part of the
  * process. Additionally handle an error occurring on moving of page tables,
@@ -1151,9 +1465,11 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 	struct vm_area_struct *new_vma;
 	int err = 0;
 	PAGETABLE_MOVE(pmc, NULL, NULL, vrm->addr, vrm->new_addr, vrm->old_len);
+	bool relocate_anon = should_relocate_anon(vrm, &pmc);
 
+again:
 	new_vma = copy_vma(&vma, vrm->new_addr, vrm->new_len, new_pgoff,
-			   &pmc.need_rmap_locks);
+			   &pmc.need_rmap_locks, &relocate_anon);
 	if (!new_vma) {
 		vrm_uncharge(vrm);
 		*new_vma_ptr = NULL;
@@ -1163,12 +1479,59 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 	pmc.old = vma;
 	pmc.new = new_vma;
 
+	if (relocate_anon) {
+		lock_new_anon_vma(new_vma);
+		pmc.relocate_locked = new_vma;
+
+		if (!relocate_anon_folios(&pmc, /* undo= */false)) {
+			unsigned long start = new_vma->vm_start;
+			unsigned long size = new_vma->vm_end - start;
+
+			/* Undo if fails. */
+			relocate_anon_folios(&pmc, /* undo= */true);
+			vrm_stat_account(vrm, vrm->new_len);
+
+			anon_vma_unlock_write(new_vma->anon_vma);
+			pmc.relocate_locked = NULL;
+
+			do_munmap(current->mm, start, size, NULL);
+			relocate_anon = false;
+			goto again;
+		}
+	}
+
 	moved_len = move_page_tables(&pmc);
 	if (moved_len < vrm->old_len)
 		err = -ENOMEM;
 	else if (vma->vm_ops && vma->vm_ops->mremap)
 		err = vma->vm_ops->mremap(new_vma);
 
+	if (unlikely(err && relocate_anon)) {
+		relocate_anon_folios(&pmc, /* undo= */true);
+		anon_vma_unlock_write(new_vma->anon_vma);
+		pmc.relocate_locked = NULL;
+	} else if (relocate_anon /* && !err */) {
+		unsigned long addr = vrm->new_addr;
+		unsigned long end = addr + vrm->new_len;
+		VMA_ITERATOR(vmi, vma->vm_mm, addr);
+		VMG_VMA_STATE(vmg, &vmi, NULL, new_vma, addr, end);
+		struct vm_area_struct *merged;
+
+		/*
+		 * Now we have successfully copied page tables and set up
+		 * folios, we can safely drop the anon_vma lock.
+		 */
+		anon_vma_unlock_write(new_vma->anon_vma);
+		pmc.relocate_locked = NULL;
+
+		/* Let's try merge again... */
+		vmg.prev = vma_prev(&vmi);
+		vma_next(&vmi);
+		merged = vma_merge_existing_range(&vmg);
+		if (merged)
+			new_vma = merged;
+	}
+
 	if (unlikely(err)) {
 		PAGETABLE_MOVE(pmc_revert, new_vma, vma, vrm->new_addr,
 			       vrm->addr, moved_len);
@@ -1486,7 +1849,8 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 	unsigned long flags = vrm->flags;
 
 	/* Ensure no unexpected flag values. */
-	if (flags & ~(MREMAP_FIXED | MREMAP_MAYMOVE | MREMAP_DONTUNMAP))
+	if (flags & ~(MREMAP_FIXED | MREMAP_MAYMOVE | MREMAP_DONTUNMAP |
+		      MREMAP_RELOCATE_ANON))
 		return -EINVAL;
 
 	/* Start address must be page-aligned. */
@@ -1501,6 +1865,10 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 	if (!PAGE_ALIGN(vrm->new_len))
 		return -EINVAL;
 
+	/* We can't relocate without allowing a move. */
+	if ((flags & MREMAP_RELOCATE_ANON) && !(flags & MREMAP_MAYMOVE))
+		return -EINVAL;
+
 	/* Remainder of checks are for cases with specific new_addr. */
 	if (!vrm_implies_new_addr(vrm))
 		return 0;
diff --git a/mm/vma.c b/mm/vma.c
index 8a6c5e835759..59a7a9273d53 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -57,22 +57,6 @@ struct mmap_state {
 		.state = VMA_MERGE_START,				\
 	}
 
-/*
- * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
- * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
- * would mean a wider range of folios sharing the root anon_vma lock, and thus
- * potential lock contention, we do not wish to encourage merging such that this
- * scales to a problem.
- */
-static bool vma_had_uncowed_parents(struct vm_area_struct *vma)
-{
-	/*
-	 * The list_is_singular() test is to avoid merging VMA cloned from
-	 * parents. This can improve scalability caused by anon_vma lock.
-	 */
-	return vma && vma->anon_vma && !list_is_singular(&vma->anon_vma_chain);
-}
-
 static inline bool is_mergeable_vma(struct vma_merge_struct *vmg, bool merge_next)
 {
 	struct vm_area_struct *vma = merge_next ? vmg->next : vmg->prev;
@@ -783,8 +767,7 @@ static bool can_merge_remove_vma(struct vm_area_struct *vma)
  * - The caller must hold a WRITE lock on the mm_struct->mmap_lock.
  * - vmi must be positioned within [@vmg->middle->vm_start, @vmg->middle->vm_end).
  */
-static __must_check struct vm_area_struct *vma_merge_existing_range(
-		struct vma_merge_struct *vmg)
+struct vm_area_struct *vma_merge_existing_range(struct vma_merge_struct *vmg)
 {
 	struct vm_area_struct *middle = vmg->middle;
 	struct vm_area_struct *prev = vmg->prev;
@@ -1799,7 +1782,7 @@ int vma_link(struct mm_struct *mm, struct vm_area_struct *vma)
  */
 struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	unsigned long addr, unsigned long len, pgoff_t pgoff,
-	bool *need_rmap_locks)
+	bool *need_rmap_locks, bool *relocate_anon)
 {
 	struct vm_area_struct *vma = *vmap;
 	unsigned long vma_start = vma->vm_start;
@@ -1825,7 +1808,19 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	vmg.middle = NULL; /* New VMA range. */
 	vmg.pgoff = pgoff;
 	vmg.next = vma_iter_next_rewind(&vmi, NULL);
+
 	new_vma = vma_merge_new_range(&vmg);
+	if (*relocate_anon) {
+		/*
+		 * If merge succeeds, no need to relocate. Otherwise, reset
+		 * pgoff for newly established VMA which we will relocate folios
+		 * to.
+		 */
+		if (new_vma)
+			*relocate_anon = false;
+		else
+			pgoff = addr >> PAGE_SHIFT;
+	}
 
 	if (new_vma) {
 		/*
@@ -1856,7 +1851,9 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 		vma_set_range(new_vma, addr, addr + len, pgoff);
 		if (vma_dup_policy(vma, new_vma))
 			goto out_free_vma;
-		if (anon_vma_clone(new_vma, vma))
+		if (*relocate_anon)
+			new_vma->anon_vma = NULL;
+		else if (anon_vma_clone(new_vma, vma))
 			goto out_free_mempol;
 		if (new_vma->vm_file)
 			get_file(new_vma->vm_file);
@@ -1864,6 +1861,21 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 			new_vma->vm_ops->open(new_vma);
 		if (vma_link(mm, new_vma))
 			goto out_vma_link;
+		/*
+		 * If we're attempting to relocate anonymous VMAs, we
+		 * don't want to reuse an anon_vma as set by
+		 * vm_area_dup(), or copy anon_vma_chain or anything
+		 * like this.
+		 */
+		if (*relocate_anon && __anon_vma_prepare(new_vma)) {
+			/*
+			 * We have already linked this VMA, so we must now unmap
+			 * it to unwind this. This is best effort.
+			 */
+			do_munmap(mm, addr, len, NULL);
+			return NULL;
+		}
+
 		*need_rmap_locks = false;
 	}
 	return new_vma;
@@ -3052,3 +3064,29 @@ int __vm_munmap(unsigned long start, size_t len, bool unlock)
 	userfaultfd_unmap_complete(mm, &uf);
 	return ret;
 }
+
+bool vma_had_uncowed_children(struct vm_area_struct *vma)
+{
+	struct anon_vma *anon_vma = vma ? vma->anon_vma : NULL;
+	bool ret;
+
+	if (!anon_vma)
+		return false;
+
+	/*
+	 * If we're mmap locked then there's no way for this count to change, as
+	 * any such change would require this lock not be held.
+	 */
+	if (rwsem_is_locked(&vma->vm_mm->mmap_lock))
+		return anon_vma->num_children > 1;
+
+	/*
+	 * Any change that would increase the number of children would be
+	 * prevented by a read lock.
+	 */
+	anon_vma_lock_read(anon_vma);
+	ret = anon_vma->num_children > 1;
+	anon_vma_unlock_read(anon_vma);
+
+	return ret;
+}
diff --git a/mm/vma.h b/mm/vma.h
index 149926e8a6d1..954bacedbb48 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -267,6 +267,9 @@ __must_check struct vm_area_struct
 __must_check struct vm_area_struct
 *vma_merge_new_range(struct vma_merge_struct *vmg);
 
+__must_check struct vm_area_struct
+*vma_merge_existing_range(struct vma_merge_struct *vmg);
+
 __must_check struct vm_area_struct
 *vma_merge_extend(struct vma_iterator *vmi,
 		  struct vm_area_struct *vma,
@@ -287,7 +290,7 @@ int vma_link(struct mm_struct *mm, struct vm_area_struct *vma);
 
 struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	unsigned long addr, unsigned long len, pgoff_t pgoff,
-	bool *need_rmap_locks);
+	bool *need_rmap_locks, bool *relocate_anon);
 
 struct anon_vma *find_mergeable_anon_vma(struct vm_area_struct *vma);
 
@@ -505,6 +508,29 @@ struct vm_area_struct *vma_iter_next_rewind(struct vma_iterator *vmi,
 	return next;
 }
 
+/*
+ * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
+ * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
+ * would mean a wider range of folios sharing the root anon_vma lock, and thus
+ * potential lock contention, we do not wish to encourage merging such that this
+ * scales to a problem.
+ */
+static inline bool vma_had_uncowed_parents(struct vm_area_struct *vma)
+{
+	/*
+	 * The list_is_singular() test is to avoid merging VMA cloned from
+	 * parents. This can improve scalability caused by anon_vma lock.
+	 */
+	return vma && vma->anon_vma && !list_is_singular(&vma->anon_vma_chain);
+}
+
+/*
+ * If, at any point, folios mapped by the VMA had unCoW'd mappings potentially
+ * present in child processes forked from this one, then the underlying mapped
+ * folios may be non-exclusively mapped.
+ */
+bool vma_had_uncowed_children(struct vm_area_struct *vma);
+
 #ifdef CONFIG_64BIT
 
 static inline bool vma_is_sealed(struct vm_area_struct *vma)
diff --git a/tools/testing/vma/vma.c b/tools/testing/vma/vma.c
index 7cfd6e31db10..3d19df8fa17b 100644
--- a/tools/testing/vma/vma.c
+++ b/tools/testing/vma/vma.c
@@ -1543,13 +1543,14 @@ static bool test_copy_vma(void)
 	unsigned long flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
 	struct mm_struct mm = {};
 	bool need_locks = false;
+	bool relocate_anon = false;
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vm_area_struct *vma, *vma_new, *vma_next;
 
 	/* Move backwards and do not merge. */
 
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, flags);
-	vma_new = copy_vma(&vma, 0, 0x2000, 0, &need_locks);
+	vma_new = copy_vma(&vma, 0, 0x2000, 0, &need_locks, &relocate_anon);
 	ASSERT_NE(vma_new, vma);
 	ASSERT_EQ(vma_new->vm_start, 0);
 	ASSERT_EQ(vma_new->vm_end, 0x2000);
@@ -1562,7 +1563,7 @@ static bool test_copy_vma(void)
 
 	vma = alloc_and_link_vma(&mm, 0, 0x2000, 0, flags);
 	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x8000, 6, flags);
-	vma_new = copy_vma(&vma, 0x4000, 0x2000, 4, &need_locks);
+	vma_new = copy_vma(&vma, 0x4000, 0x2000, 4, &need_locks, &relocate_anon);
 	vma_assert_attached(vma_new);
 
 	ASSERT_EQ(vma_new, vma_next);
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 572ab2cea763..3364cd9cabde 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -26,6 +26,7 @@
 #include <linux/mm.h>
 #include <linux/rbtree.h>
 #include <linux/refcount.h>
+#include <linux/rwsem.h>
 
 extern unsigned long stack_guard_gap;
 #ifdef CONFIG_MMU
@@ -172,6 +173,8 @@ struct anon_vma {
 	struct anon_vma *root;
 	struct rb_root_cached rb_root;
 
+	unsigned long num_children;
+
 	/* Test fields. */
 	bool was_cloned;
 	bool was_unlinked;
@@ -227,6 +230,8 @@ struct mm_struct {
 	unsigned long def_flags;
 
 	unsigned long flags; /* Must use atomic bitops to access */
+
+	struct rw_semaphore mmap_lock;
 };
 
 struct file {
@@ -1240,4 +1245,32 @@ static inline int mapping_map_writable(struct address_space *mapping)
 	return 0;
 }
 
+static int do_munmap(struct mm_struct *mm, unsigned long start, size_t len,
+		struct list_head *uf)
+{
+	(void)mm;
+	(void)start;
+	(void)len;
+	(void)uf;
+
+	return 0;
+}
+
+static inline int rwsem_is_locked(struct rw_semaphore *sem)
+{
+	(void)sem;
+
+	return 0;
+}
+
+static inline void anon_vma_lock_read(struct anon_vma *anon_vma)
+{
+	(void)anon_vma;
+}
+
+static inline void anon_vma_unlock_read(struct anon_vma *anon_vma)
+{
+	(void)anon_vma;
+}
+
 #endif	/* __MM_VMA_INTERNAL_H */
-- 
2.49.0

