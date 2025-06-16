Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8702288C16
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099583; cv=fail; b=ePbyuZ5Q6S04PvwDskqL2EvAETLcoufbnzmmIHj1YLzb5Dj+/OR2W0nbYp9CkcVxtHkuHRGtxE4DF5cNzF33ByYPSUVJulYNsqUvgl0cBGcnzOSkKmmHhT39sR6Hl+M7o80TYRMoe16cP0A/frecHuihrxBJrxVuJ3KV4lZbNbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099583; c=relaxed/simple;
	bh=zbLtXVTa5F00BYyN/R3IjBpqADBrcSSI4RQA8EtaSmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tuZki6x4wNODGzBreuN4NPGyNffs/kdt6qKk2r4ZyiyCjL8h+7WAZugmfNJkZXUPdPplf39aR1nH3w5Z96k9NHkBDSaGGDx4B6zvRA1srPm/CcOiGPtjISmJ465uxI4tfy3NW1Y4MNkXmKX/1Uvwbz/XGrpRYI0hjqzYsY8SgZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JmWqCqKw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WhVQQIn8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JmWqCqKw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WhVQQIn8"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuURQ027737;
	Mon, 16 Jun 2025 18:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=a71gexdnTWfcXHEKlHkxbwscIZNvVpSfR9vrpTxjN5M=; b=
	JmWqCqKweMJ8pH+OLOjVo4H6LB0pLOoomfS8VPidByGIVbC5AVesYhxZ8H3YXBm+
	gxCU49nwSSxBA1+6e0V1GlJwtXEuh+E8l5gPzcuwyD35bP/adjiVLKgt5AZtrhG5
	d2/YFlNQEwdYrIH2h8prUfoh8D10hhzSnM8NTPyPn4z6Jb9g5cVFKAhE/X1deBjC
	O3/tjRXd6Iu4J1oyX1VUdo3/wY1iseDDcrvspmxK+rtd05durAtUWQvbd3SZU5Oi
	CF7T8KPN5QjV/htbUyIKZ8Q7JfSffaT5vl2IHu5jRALpxZeoeYlYYqWES8kHJh1P
	50k1vbxsaQAFhc8iZMwEOQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4791mxkhm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:45:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHUH10031645;
	Mon, 16 Jun 2025 18:45:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh81ydj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:45:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGNRGa6zap8eYYmnxI/p/cfiXBgsw/L3I95DdoXatAbvffZZ7qFS9rYGWAOkBKzFD/hfJ3ysHMJHUH0PoXIbiuwWtWVT/hOIfHY3JE350zU15SyhF5QIzGUebWLqiTOt+8suvgo3I7xhqtBCoEGV/uI+gW7CeRER+g6ViKDFTbBPKzwCKkLHYK4Zcgv5fX/FFstiMs4WglD6MZQiEXxoj4TK4reJWab2wZxTBoblmCmxOgq1I7+elZUE7ds9VXWrKwwKg7seXXU76SLaJudAAFBEPNIfj4QkaLsxygEAtHoZCN14kYPonfbTmT2WXdW50m4ZKYvv623w+KebLxWrVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a71gexdnTWfcXHEKlHkxbwscIZNvVpSfR9vrpTxjN5M=;
 b=TlT5OGPCtnMvnPCZTjEqmMCI7bABQmFW7yn6xR+cYFsjtsOAf17U3CXyRvZBvGLyohF7i/JSrD+Y/zD9w9ANtQrNP+R+rWDmI5NKFSgQ48Voga3i85MsOK1qZQynLjmvRcE3yksjQtDHoH8VFdc0NdROtO9u9J/HnqesZnic1JXq5ZkcFFlPS0a0sQjSEXZcW3lTJdjKeuPWZ7YQERFr+pvVAZ0cYircNYRG1UqzGKBAX73QIqysVq5KSwCHnUinTlgD/E97vViBtUglvfznZe9JDMJUfWx9SNtHFmq4MRCLhNaujbmuRY02kfFG0szxjvZ1d2gYEA2x+I6E1Fo89Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a71gexdnTWfcXHEKlHkxbwscIZNvVpSfR9vrpTxjN5M=;
 b=WhVQQIn8Nc4YASbvm+lGafZY1MbhJe8tc5J9gyir15ZywtNTeJg6MTkmCUqDeUZZ2ewCfuIdhTQ21ohL7g75yeKSxC4Y6hVIbohZnmH+eOze2YPAA4TppHuz4B+QtIiWR7UpLgXsSP8mcSJbX87PjX7FfBS7sxlsXtR1DiquVAs=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM4PR10MB6063.namprd10.prod.outlook.com (2603:10b6:8:b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Mon, 16 Jun
 2025 18:45:52 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 18:45:52 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Hailong Liu <hailong.liu@oppo.com>, zhangpeng.00@bytedance.com,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Subject: [PATCH 2/3] maple_tree: Fix MA_STATE_PREALLOC flag in mas_preallocate()
Date: Mon, 16 Jun 2025 14:45:20 -0400
Message-ID: <20250616184521.3382795-3-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
References: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::12) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM4PR10MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d46b344-d343-44f4-c23e-08ddad0604dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+La3rDNYudckyC2f+oTVYiwSZGDONBwbd/E6LnSs1Ww89eUdsll27wlbWXIu?=
 =?us-ascii?Q?ZwrLxHjZRaxCQVLlpEZ11jVoZw2HuGYvqYMGvJMmE6uKFAwtW71KDe9xf9Xa?=
 =?us-ascii?Q?8RHBtVdGdJNSGoQy4RUQlAaQJiI8HC+KCmBihOEsBi4TJdG8RnDArZ6cpnaT?=
 =?us-ascii?Q?N1wVDUdv4K0gLK2a4wIR3+VyGIOxuM/vgA+/HES7LpnaVdwCKa5M8xzATgi0?=
 =?us-ascii?Q?D49GAb19USt/AgB53Go7ccksLpfP7CGPE6HcpcKUqeC8sD2xf4qOt5NyYurG?=
 =?us-ascii?Q?5Nta8uMEnmrIGMdSiRGVAYhmbFldzzF5JRUdNRqUKjknp3PhapKY6xnowPLH?=
 =?us-ascii?Q?puqN7EbL6K6Sc6uK9tRe8noK5AlPBBrseXCmmfKY7dnSe2RL4AD428NLe2z2?=
 =?us-ascii?Q?XHO2nREtPTpi9/53RrE2fG7VQKucbOLMzq2424X8Ear7/oQ6NPEzVQEOHyc1?=
 =?us-ascii?Q?PKjuX5m+82jvAlwIiCVFbBGaiT2s49WaFHqR9/AvISBWgCx35V2CdWUmRi4u?=
 =?us-ascii?Q?y9QFMss1Hhv2j/siSNNeekaX5sHnVGD3LZzr2UJFV3/6bShYcsP8gjUKISOe?=
 =?us-ascii?Q?FhTltyFJpcJB5KjdlVQqjjR8wmE0+lcfCLk6u4vKnabRhuUTi3W55fshWP5m?=
 =?us-ascii?Q?0CpUumQelccjCs4kSv31B23G4qNqyn3IliTJxDXqdUK6UO+KElnZVtZGQiS/?=
 =?us-ascii?Q?SyEj54lomA8q4ikVdczGV/UDvalCWr/OouNisHhXNiEXIqyWoNo+I/VGQrGa?=
 =?us-ascii?Q?Bot/cK+cEibPNn+bQ/yCIASHkmQkRm9aVL3NQ8juCEYp13skjtakbH4F0w1f?=
 =?us-ascii?Q?LD6fwBQAj01ppzTRaKcS968VW1aor3M9Cl1DtKL1ue7yAIlPGMYzrZUn1MsL?=
 =?us-ascii?Q?vmvz5Hhg0BvoCdXWlFuQRGGTZO/O0f393tf0u3Pu0fKYLhZPTjXx0eaipsL6?=
 =?us-ascii?Q?IfW3S29wxN1EIfPw4AzeaG/aSa3CS3LNaW00+tYTKw2Fk8lu2BkQCiArBirn?=
 =?us-ascii?Q?EPrmqyN+onLoRd98pUmdS4K6cejzbVaN+i+OqNhWEu8czzAXjLhZ+g9M+ku6?=
 =?us-ascii?Q?M8UfB0XwHmnhN4L1xokvlo1cHpf8dJ8+y0Wp5UYSDpiQBxKGosBHKHJVwFh/?=
 =?us-ascii?Q?IzePRw1JyqLj/EXliz5ZT0cZnooc36FFDQ7dBBvBeGXKqR5lsRE129v5Qqn1?=
 =?us-ascii?Q?6O8DBPynK66p9X7DprbkpXesJUaJpmkGqZDWGxHsA6mJjut46/l89hxglUHk?=
 =?us-ascii?Q?wN3Jb+IXuLQtebBKQEdOitgWa8sLDswbQAU+Ht62Wj3aj94yM8UZZoN2eWy8?=
 =?us-ascii?Q?UbLTRiLTcRor4R+I3VpnR8x7HFSZcFryusdpbbdxK1vbaCeomvw7MXEKiBy6?=
 =?us-ascii?Q?ivHtniqjp55IwwGkCBnExEqqc6vUWxB4Fla/6EH5ST8RQUIR78Q1jt3Uzw3a?=
 =?us-ascii?Q?OTHIT+WS8S0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9EzM6f67+cgxvOhZFYdYTMts6HLTaIKTVMUdqX+wokfBVerd/PT81b0C93Ib?=
 =?us-ascii?Q?cxLBaLiwdk/ACRFtU0t6ezgk5KJrIRF2LqSgXH5m/HU1La8HeccuydpFCzjT?=
 =?us-ascii?Q?o3nnyrH8ZcpIB6LjufZWfuq7vTB3KN1kWZSRTWJn0E8kBmN45zy1+x/9kzKC?=
 =?us-ascii?Q?4c+YbVy+rSjRxhSoQbeH4H/+EVT4H3ZBIbpCm0GbEnKfF0ln/9WSB3obgMEd?=
 =?us-ascii?Q?iizwTMZWwG4hmdH/IAjeDhEyHnw7fYtW7ErMAd0DMNHy62zgtcLuYSlq33tw?=
 =?us-ascii?Q?8z/fk/7NTo1U15PLFaH9G9eBv3glvzurJwt79si6pR+UweCVFYiACHEywDz7?=
 =?us-ascii?Q?7eamkojDENh1M0rf71pBWYv8eWGr1aIZvds4vkTi+3vuyYxxhvEQzYPnf8jY?=
 =?us-ascii?Q?ffcVZuRMBrkc/G55/IXDBpy0iNIqHuFyZOA4HSzyLDTx2pCDFM/6idngC+6O?=
 =?us-ascii?Q?ZJ+UhuDo7gCp3QfKVyS2NpXxv4kufYn7Ko5ExsCNe567xf2HoYi9NzeEOMD4?=
 =?us-ascii?Q?Tx+wLbvzVA5Tm9QZB14itoU7gJXYnKNqRYRLamTWxV/S0SBlYabTDgAQ7rXj?=
 =?us-ascii?Q?QKsCWVqUNW7Cx976udqVp8OTxPGWCqr8St4E+KrGoLiKqiJPL6evF7kNSMd0?=
 =?us-ascii?Q?VcLp1c20EiosESu/dySPyZH6bBbwMctDWdiZLIkGlq2SLupD8c9xRkfRtwL2?=
 =?us-ascii?Q?nGK6nF92YgYh77RDk6d8yMsFOajGQmYGEk2hvJGKDlEDK2s0XuHYpdb4rxPf?=
 =?us-ascii?Q?YgvnnYs2g6hOKYDRqhotsKKvCf3MyS9dhv6ZMbk29Yjygx/DqSjKSvQl116v?=
 =?us-ascii?Q?fjG86Wav2LIA7rpAV7J+dqOksYEoSoIw/hGmOq4v2xlz8vmJAo95Efqj7W1p?=
 =?us-ascii?Q?PK8I6V9//VJ1mhu0rq8wjhm1YRRIeDajPoxRN8g1NQVZGvO9h2X9AAhfLN1Y?=
 =?us-ascii?Q?VgJvviH1OGgRPtLziN8JyX7zpQixB57+NnLkLBqlMDRlZ1jf30wkaaA8XUvi?=
 =?us-ascii?Q?zDH7H6XBPzZ4B+Q5Yxin+Se2Uc+4P81H8alaXo/uUnruhYqgfDcsSJYZ+ASb?=
 =?us-ascii?Q?KgUVC7qu7GDXZBUnxZroCqhT/EBq8FLbgdOiFw+HV/fYQpEW4rz8pgyegjCq?=
 =?us-ascii?Q?8VYUTF5QT6RU1ASm3++OVafyj3bQPV1ORTfn+SG+a8rJjXxGn0EU0DO0KRTE?=
 =?us-ascii?Q?6wzdnXKB+X+aL7l3rcMdW80lct5LGyRZgHkKR2dfqZy8LENBAUASTN913unj?=
 =?us-ascii?Q?1GrCTV7ecXVO/mYi0BUm76SGTfbhRTe0DhI+qARLSlwiXeQ+Wu4CpeFzSXju?=
 =?us-ascii?Q?5te6vkNf5TxaziiJQwsGD3qWATpgTjZMtKVs0Iq6ZwSYWwdsXwEMHLCqGNMx?=
 =?us-ascii?Q?wEi6HIReQVU4FOSVIQtgVHhTDX6kgdcx5IYtoae341CA9tP2EuOcDbwzAvkM?=
 =?us-ascii?Q?2Mk9q3hKLAvdcyOs5gsPYN92MMziGetq9wkhxIqVKpWjacSkV5adkAWz7EVP?=
 =?us-ascii?Q?1JTMKFbkv3P+hcTXPjteIGksUzXQq5rlQ8NuGulg6sLa6BgbdU1IQrc6FiKg?=
 =?us-ascii?Q?VLS62IfML7F4oeF94bZl6lvAOLEMIvr4et9DKV3k?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1AG8MUBLg185lvkshgVtlBwRgUZpFuCs+U/Bin8tw7FAKzjF76WlHQWGaKE+5fonrGIwUr6m3NDezuCxZDlRxS6wiQwu+4cwnKXLsZnuLFYcuCrsHKrJ+2w7i/aEI0qQ0ax+Jh4eAO61HQGxakoj0dOoh6/uHAcNtE3QqsCkwYTNENV3ZHPNUNUD1sbd280nX2UgPNchMVdfMAoaJvMm51zNioQYJe7zSoHJEaNv9QXb85X7lMrz4pgSRiLJyMnG1CVIO9nF64p9pgJzN/5EYiHlk3Bzc2DOX7XHKaM6i1AhChRQExDtbBlSk4WayUPtqZpRcjtJdAv/ykrn47WuSFFmC/t/e/r59+l91cKOBQoP8ov9wehLn9LbR40nCYeVy0fVWKF3vUbGmU3QYprozAzG4hCKOJaT1nS6g2QXciP6NHi56tfwg5Id51p76t/73L1H9QykIqmryVSVbkgL8AcKYAWRzUe3izZkxD9JsfvZF9NhbUW2yMjhEIYpFpN1uQ3lF+gQ+ToCaaOClZl0+NwaFnTdebtjDe3RpdIk2wwtU0FzwawJgCuN2zGKWkubeekaztk4uGNg9t8MPFytCPmV+JJTHW4GjHnXThekOFo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d46b344-d343-44f4-c23e-08ddad0604dc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:45:52.0943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXq9g+1ip2MYhGVBmG6G8xz8H53GBExl4cslgDZK8E9sapK2tMy8SGkLDVJBrhF4rfEseevuGQSqA7TdlvN9iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6063
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEyNyBTYWx0ZWRfX5wP7+dKKumnT 4Z2ji+5tkA3kl6o3f1GiDbQaU1//AtvzrWrVUwzDq4Pd2tOgFuFJtJ7eqgcLF8Wwh3CfuVXm1Sk B8QhLvbfeGTwUcUcEwWkxsA7Rp8lRzMj1UigbL5ZHVBuT18XIjGhN2xN5bEuVfNEwXdCyb/CDIB
 ei4QRzexIbPcoNLYwmmjXeshEQqFfgsFKHJTrC/G2dzQYsXBFBzXz4Eh7HoGOK0RwU37IwGUwTZ 9llkGPeH+KvQLh81+UGKJLxdWKeAcgaMBgk99oQupr4G4+DRlZq0DJbF+k9fMbtgyw7IfaHmPIn lrtrPB7uXxgl1zEcO81zRnB/85Q2LYDZCSICEofAQ5qL9CuigyHseCKg5W0G92IJ7dgmbgR0crV
 DUoMlXTubsQrl4Vza1TYIixCyKEt0FsWGd4YMOFir+pfOJiLng9UdvBkR6A4mPJkQYY3KVJG
X-Authority-Analysis: v=2.4 cv=HvR2G1TS c=1 sm=1 tr=0 ts=68506663 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=A2pY-5KRAAAA:8 a=yPCof4ZbAAAA:8 a=icsG72s9AAAA:8 a=1XWaLZrsAAAA:8 a=968KyxNXAAAA:8 a=JfrnYn6hAAAA:8 a=wTtCSAouwvD0ySbqfS4A:9
 a=T89tl0cgrjxRNoSN2Dv0:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: ZadZ7z6lKXDT-nh_RpiHCoWEaAZGiXf1
X-Proofpoint-ORIG-GUID: ZadZ7z6lKXDT-nh_RpiHCoWEaAZGiXf1

Temporarily clear the preallocation flag when explicitly requesting
allocations.  Pre-existing allocations are already counted against the
request through mas_node_count_gfp(), but the allocations will not
happen if the MA_STATE_PREALLOC flag is set.  This flag is meant to
avoid re-allocating in bulk allocation mode, and to detect issues with
preallocation calculations.

The MA_STATE_PREALLOC flag should also always be set on zero allocations
so that detection of underflow allocations will print a WARN_ON() during
consumption.

User visible effect of this flaw is a WARN_ON() followed by a null
pointer dereference when subsequent requests for larger number of nodes
is ignored, such as the vma merge retry in mmap_region() caused by
drivers altering the vma flags (which happens in v6.6, at least)

Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Reported-by: Hailong Liu <hailong.liu@oppo.com>
Fixes: 54a611b605901 ("Maple Tree: add new data structure")
Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com/
Link: https://lore.kernel.org/all/20250428184058.1416274-1-Liam.Howlett@oracle.com/
Link: https://lore.kernel.org/all/20250429014754.1479118-1-Liam.Howlett@oracle.com/
Cc: stable@kernel.org
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Hailong Liu <hailong.liu@oppo.com>
Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
Cc: Steve Kang <Steve.Kang@unisoc.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---
 lib/maple_tree.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 7144dbbc34813..54a09c26edf96 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5528,8 +5528,9 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
 	mas->store_type = mas_wr_store_type(&wr_mas);
 	request = mas_prealloc_calc(&wr_mas, entry);
 	if (!request)
-		return ret;
+		goto set_flag;
 
+	mas->mas_flags &= ~MA_STATE_PREALLOC;
 	mas_node_count_gfp(mas, request, gfp);
 	if (mas_is_err(mas)) {
 		mas_set_alloc_req(mas, 0);
@@ -5539,6 +5540,7 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
 		return ret;
 	}
 
+set_flag:
 	mas->mas_flags |= MA_STATE_PREALLOC;
 	return ret;
 }
-- 
2.47.2

