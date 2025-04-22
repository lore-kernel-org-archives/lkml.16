Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF202550A4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309418; cv=fail; b=g/EaccG6Zc7mwwIEM9CZYijD3fC//C2G6EDfkpOtpDb7RTTy6r04FHGAp4P7Iwps2zklII/vmEni+AvHqJbw/8Fvn7BsB0+WtvUDYnMRh8H1Ik2RSbyMdw+gzLfjyByVlIuF+cM8B8wK2jpFvkuwMhgKspJLvY3kXFPrGNRExVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309418; c=relaxed/simple;
	bh=pPI1vmYeUYrc5+YozPFLzNI5agegrnsYCWVDOXPURqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=acdrf5kXHsVGtomX2d8y10/X+GMka0zPC5N4qiXBk6w+MIRKShAI3c1DBgaWlxhzhGeQ7rVwQRZtyo055efcn3/YFw07vbcnMdhBXxErDNIOTEj34yNpn/8CLfPwbrvfxy/DdPtmMbph7rtYL3uY8+PxDTDzsr2CieDtUwQzsl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fPjnal6O; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Negb915Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fPjnal6O";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Negb915Q"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7Mw7N025390;
	Tue, 22 Apr 2025 08:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=55AlPUUE8TEbDwrhF3KgcH9bxqg16uTOTWsEfqmFR6s=; b=
	fPjnal6OWrIxRC78jO7mdfgy8Uc2zYREVVgvxtkQUKzMxoa60p5Wm7aDD9iNL2Dg
	UaYrhsG0P8qU8N1rOG/52vifpMCkBaK3iccaWxQb25ZpMOu+pqKCC/tggJOroICj
	Bo45YR1efLzdlYhf6zwg1DD7GZcr9LrE8bvtxCBo2r+IhLvh/TgDwAVn0cGPUpYa
	MlumkcW/K3H4G8CJEv05hEyJBuV4MhfMAsOdsPhEyzQ7SeXhKWQiC8KdbfdDo/XC
	k1vLy0dKuy11YG+lr/ZO+QZ1xxeEFiGF3i035cFlrK/g93Ep6hPxcYOrDn4tj4lq
	TMPik/bfboxxuNpDiTLzUg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4642m1uyyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:10:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6Y260021184;
	Tue, 22 Apr 2025 08:10:05 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012014.outbound.protection.outlook.com [40.93.14.14])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429fhsr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:10:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6pqpq8nzcIC81HLQaDKdcGI5dSZ+KPaUkuOsBipNFzPEUKYMFeaxC4W3IK8hA0DpdPvDZBfvYY9VW8BAW862PWA7X5RGXO+kJJdMchcZAXWIDXWfdcLtTO8w6y6PQRn1MNK/nlkv8KdpiumWQmagnZ6sh6GpNrFAtAOSKAUK7pNaiPWR7yz6yX9xULQQERfUfeGw3GOte9JhZr24/sHV92TayGLILr3RpWC/0qoqQjcTzqVeeVaT8IXUvi8wGwMkgjdhpYgJxA0aLUAFWBikCyu9otNnXJieXeHtiTSKbLGYeUazdwIz7+eACDDmTU74ANOs5nXaDpyS3fLqfSH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55AlPUUE8TEbDwrhF3KgcH9bxqg16uTOTWsEfqmFR6s=;
 b=vi7BbkuhxLabBobqHOIH4NSJolNjlpT0yGGMmldT6B5VnKfDc8U/lKpT+ozv8h5GYxb4Y5gPIlzPxMQXQbMFxtrPkK6V4BXLMQkucSCPdcsATcoCSwYXVzH+eXNhJHIAgwi6fEO0rRMhZssIONUIuUHHGR+IUMdf0ScMEbMonOyw0IudlTxMUeZnWF7kbNsejv37DSdzu+ryMH9hDx1SRWlNMBVcGAClPssBxVWORZtmIYmLoUjOAT4WtRtFmX4ylIaNHZakI1HW3Hu6LbC82/t9yS5cXR+aejNInIQKbYsp39UrUQBKCwwLUENRnEXdNe/D2rbkNgUglyb3+rCu0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55AlPUUE8TEbDwrhF3KgcH9bxqg16uTOTWsEfqmFR6s=;
 b=Negb915QYYWKoxiBnZyMIvBvL7xTfcu87Z76buQ6PhxamZaxmP1CxsAokWYcY4MtrPMlAzUCyTepgsOJCOY/5fuzrSgix5bfSWGmGKGhYgDxU2S8n/fMK0XCzqMlFBWaeTmfAWvrf33LDbq0Kk6rHdfBo/e6CIb7GX2VApna4gU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4587.namprd10.prod.outlook.com (2603:10b6:806:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 08:10:03 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:10:03 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 08/10] tools/testing/selftests: expand mremap() tests for MREMAP_RELOCATE_ANON
Date: Tue, 22 Apr 2025 09:09:27 +0100
Message-ID: <94b2f296e8d5eb5fd8a0d0c210c4241a1d15d404.1745307301.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0685.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: e95605ca-df2d-49f4-3c78-08dd817515b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zK/onAx6nItfIhrm7mQeUmfBnAmXyzP8NDE7ujc6dE8ucLDcuBE91qDF3pOO?=
 =?us-ascii?Q?RfFRB4zXlqtDJqjbDP/uH/onOY6mV1G6XbZ0VAlYHM0Y/MoQsKMcpsdGDE41?=
 =?us-ascii?Q?NbiW5iXpVx32KrtPAKl14eFo5p6knquc027haDzbmatBxejlXXNcpiHLdatB?=
 =?us-ascii?Q?mSbXmZhyepBI7dohgR1lAL93zPFxOfkwWk1oW3q5ahN2QhuYOyMMlrx1mXAy?=
 =?us-ascii?Q?uz9BetLRL+DvZ5I70j5pNN8aPqL0ovTMruxQwo2+IBjBzyJPMW9Vi9STop4J?=
 =?us-ascii?Q?VPCcy0d0NDQDSSRYV2q8GP4R/Hhozt6IEZ7wO5cBLwr7vmNANpBxzhOD40qA?=
 =?us-ascii?Q?1twfXN/2pDyRrcdCqxibbDXNJnM0+Ki3xpHFkSDtag/txfjY6bsV2xQP/q1+?=
 =?us-ascii?Q?MYLSnlJau7LYUq2+vxxY6RoNKBmyz8b3oS5GGLt71GOa0KaQBETVkBVdXoH9?=
 =?us-ascii?Q?3EdDRMu09QBEWzKKrf2+wY2AFjRz+3IMbsI32I+6L8kWt9zkBYjG7CWNjHSR?=
 =?us-ascii?Q?EmV35xmyTO7M3fUnrGlft5FyPyJyH8d1YO5bRDL+C6wg1XzBbB9WATzUB7Rk?=
 =?us-ascii?Q?z9RMcAWFeZADoxuxo7liDcFx3nCRTTQcYTf8F+IWO5QioMMDHrB+ed9gJuAe?=
 =?us-ascii?Q?Orb8ao/+qXQvyogDzOY+lOZpfxXRDBYGuPlyES3isarWuzquPiUiCezjmRUV?=
 =?us-ascii?Q?R+/uEzs4Azx1EaqoaZnE7wxV5HZ+8IIs8C1hhadvyymjYc9bv6QQMkxuyaG4?=
 =?us-ascii?Q?rwZRC+Ns+TEuMz2WfQvgpIvJV1zTMNRFKv7y6rtbhodbLlLjYI6urMsJI0kV?=
 =?us-ascii?Q?pmO6eRGHZZFaO7uxvfg03eFDieP5Hgf8yC6vUoXs5ItaF++7A/5JOu+RKGHH?=
 =?us-ascii?Q?M+kL7ffpcexUMXGBkJp9tagKeD4+5zbdgV4iWmgZtQn/aMfajU8RtMsqVkez?=
 =?us-ascii?Q?BM4pKy5Sia66xZAU8IgJumGZtxEZlSmd+hWyCBM9uXTKuMzROfv9wI0towqY?=
 =?us-ascii?Q?2W0enZYJgcDDwUNC7tP/1etcrTOjey0Pmj7R9/7TLMWdwiH1FYd0Mu1TMCeX?=
 =?us-ascii?Q?W66XdRy/sgsCjUC2IvzBCG8CmbxsBsy815T2JSXeLdLGzkn6uD5lv102ro7J?=
 =?us-ascii?Q?Ua+aVJnhDEGW1k61Lq0ujfOO4PReiDktXi943eGivS7iS0PyRYwz7nBzFOn0?=
 =?us-ascii?Q?9wz9Wx2fRjeNbYo1+1N87QqTkqIFRlZqTckkz9IHpZWxzTDVLRIyaaM9fSmL?=
 =?us-ascii?Q?h8b8XGOSPzR3n73GJQ7ee1rjh9ywFia/yl5k3wHU5X3ZOyym3uorx+gjAI9m?=
 =?us-ascii?Q?REw//mapNuM/8Y7gcKVWFV764NhI24Acnv2IwWMUcRC3Z8j1a6Y9e+aWB4yZ?=
 =?us-ascii?Q?uHj9qc0NL9cdnGMxvkvJZAaW1X9nvqrp/7V5pr3brEuU9+0Po7GkgcITp6y8?=
 =?us-ascii?Q?DbpnamdWhXQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1vPwWRxRdszvUInU9siIw69o21AcUwvkzTARy8up4hZ/36Isl3bUNnN6qClQ?=
 =?us-ascii?Q?7NHlmY4DD4xqvQaaVEzY8nhU3z4wk7R0DV97X2YrGmUT0ucvidUBKFfSKyoI?=
 =?us-ascii?Q?+xmpH5NXk59Q3B4LmbnZkaaM3tyP8S8zNHIBwmbQLagulAjAgwFKtqeZQhPV?=
 =?us-ascii?Q?G05H2PrSIgpZS0LtfXbSkNFHmqHVF+tuTbEpcDifuSZFsIgWO/5PFTbWvP94?=
 =?us-ascii?Q?Ws1mhTsrRnGon7U6+0h2+75h0UvtByOHyeItXaVaKycspis1rgedtlznMwzb?=
 =?us-ascii?Q?zblrrkRA+PdQcLEVWRESzFt+BUR4A+oU/8k+cEoYM5Xq7gYnEFH1Xyr3sBbv?=
 =?us-ascii?Q?TfI3Jm7KhJx2RNLf83bH6A9cBokl77bRA4ok7oJQpRfVZk4zZBDWQDDZbQhz?=
 =?us-ascii?Q?fO5D2xk+0hdnZtdZh1PJfst6OyEYqq6BzhIB54pdwr8+x9MDdEz3gqfXMKTY?=
 =?us-ascii?Q?el5crcBEKT26ZQq7AjMtpZZI8It9R3xmWBM5v/au/uSg9ODzbMUmnX5ZoSr4?=
 =?us-ascii?Q?yN2FnWEtZRZeBsELkpoqWElM909IxE4Dc3gyexBWnQl+dCsesuwehJRYgA9r?=
 =?us-ascii?Q?fx+rDznwDgJNxDp2zm/pebB2tJnQgBaUpBwpfg6c68tLuGVwSmJQsMNVIYmA?=
 =?us-ascii?Q?bHA+NOWbnHsKmjjpaSn+H3cKA9kyenad6K6yPO6KHv/jBP/t3O0vnF0cjLPT?=
 =?us-ascii?Q?VJf9pIWrUe4Y49vVL4UNhr6fr62GNo1gTAkWc8Fu+UXPrT1t1v3vDvweukhU?=
 =?us-ascii?Q?tLFExMTsBPYqkF6m7nmKcTO+jm5mln8PPaHUd1Ce1oGMSmN1yCe1uiO9QodX?=
 =?us-ascii?Q?BmOTlLBlocI33rRUiDehR39GNNPqhTg0S7hpXrZLeE/edS/0J5Zt+Nw18hTe?=
 =?us-ascii?Q?j9cVD6t4IGG2BUbjyEoR5nZZF4VB1F0vr6xF0YzlG8rXNvPmHIyx9+0vPWay?=
 =?us-ascii?Q?gUQsuzu6r1ApOZvwpct4vQHzpjECsL4Joe5IvhHSLG0XWwomp36/ybQiGwLj?=
 =?us-ascii?Q?skanEWSsXwzPZHvxxF6tUw2/5OVqb6v/Kw1Xj6VUAbxl4CFUvdmh3pCMjWPI?=
 =?us-ascii?Q?60rs2pHE2+kuPVQblmLBK0ht4nJ+W1ThJHUbxn13n1C6gFWM4ruDClK367jT?=
 =?us-ascii?Q?55gu1x0dx8Mmu2riaQri80/ej/YYFzb0GpJGR1h2G56NQfyCXqKUC7c5LKsi?=
 =?us-ascii?Q?l5iCUi/CGAVRErT2Er+T2QZu7lQVTmicyU3ZWiF+TLgQCuzt1yiSO6LpL9rj?=
 =?us-ascii?Q?qF0CMGeazmA+3+vhyxAgSifQPTJJCEOz3xL9pav29v2bd8Gijd8xNkPgSulb?=
 =?us-ascii?Q?+85DcwFWO7/6Dgg+dJidBrCeTR5kISw9i1u8ij3eelod4QJ1ULTRHvoLHY32?=
 =?us-ascii?Q?W9j9jbvd/eX7KABQyiCUGOAUve2RqHucvK6Xb3Nz8CzxcWx3Bnblh25va93j?=
 =?us-ascii?Q?VQCr7CWP59o44t9p6d2PwgdjWt7qgWERtp5wQXaaCQgoWNlI7JQKTmigfiOS?=
 =?us-ascii?Q?f+gH0VSKWdJK9PYUnRaEMRZczGU1UzPeaYsvyF2ES26C4TlIhI7U98g9MLJ2?=
 =?us-ascii?Q?7B9ralXwGlVQ8rr0+OHUXMjhiUnTmwX6PDTIWdBAsvR1xfEvyCNgS2i4ImiV?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E6pkLr/sBEVWz89tsl04eze5F2YbX2AWLhHzl+4Na/6Akqk8OYuM0rweEFPiCIhp2Z7dVS+rkcZ8tGh/BnGr7bE2Aa9mrcDDSDoNyjjf/NzikzJaHVDacGQb1dmBPoyodxWBOMY2a5nXo18MIEjnz7I2O0TEC5I2AgmDcs3uLkJhT7NY9XJMTOifbbQrsl30qNnDWzKsX5J5iRXX+yq1nhgCcJfqVFs3hMFGlZ3if8mhgFBMXNV23mNYqgYwLN5BPo14jNh7N8j1IfvgVHcGol37OYosw7xPS7umkLK6h8K7+k/uU86t7ENtJxgqXyEDWD35+RMY4zmqudmiLTrXd3lv6ANt3BfPSvyYwZRXD+ufq2KtVoagWpnzc1Z+sF0xjpSSaPfSL7lTL5PN9PpJPoCOLdCK6o/pG8VNNUxAfDiDHDGBS6JUA4N5XB3/IR569cjogmTjf7QzT/kauoTofiDn0bw8K5hdVWxrDAk5OwNlmC23xlK3K3X6M+fIHSmXNd12T5p+mUcu4P0PFudxdBZKdLY3V4SMuabi3YTaAt8BTgIowqsc6lJg4sb7aFijkzHB4SJ/DC1trgACdTxiB1/MKJXDCZl9vnWjpURJ0n4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95605ca-df2d-49f4-3c78-08dd817515b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:10:03.2900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIfW58DkZ96+9TCZbdmT0w4EscAUxGc/Ds+QyTGgTQpgnLN71hGvpKAbX2KuBgkCvxbzGebVQ5cmcqz4RIdl4rDtyfegwqPDXz4dkGk1sBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220061
X-Proofpoint-ORIG-GUID: 4Ah5wgNJMe2HMF0Oa3N5Jp-wkYWbhkD4
X-Proofpoint-GUID: 4Ah5wgNJMe2HMF0Oa3N5Jp-wkYWbhkD4

Adjust every relevant test (that is, one that moves memory) to also perform
the same test using MREMAP_MUST_RELOCATE_ANON to assert that it is behaving
as expected.

In order to avoid glibc not being up-to-date, also move to using the
mremap() system call direct, and import the linux/mman.h header, which will
use the tool linux header wrappers, to get the latest mremap defines.

Also take careful precaution in the instance where we might unexpectedly
fail the 'mremap move within range' test due to large folios mapped outside
of the range we are relocating.

In these instances, if we test with MREMAP_MUST_RELOCATE_ANON, we ensure
the folios in question are not huge. If testing with MREMAP_RELOCATE_ANON
we do not - this asserts that this correctly falls back to non-relocate
anon behaviour.

In cases where MREMAP_MUST_RELOCATE_ANON is used, we attempt to immediately
trigger reclaim to also assert that the rmap state is uncorrupted.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/mremap_test.c | 262 +++++++++++++++--------
 1 file changed, 168 insertions(+), 94 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index bb84476a177f..5d6ff0d1da7d 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -8,11 +8,13 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
+#include <linux/mman.h>
 #include <sys/mman.h>
 #include <time.h>
 #include <stdbool.h>
 
 #include "../kselftest.h"
+#include "vm_util.h"
 
 #define EXPECT_SUCCESS 0
 #define EXPECT_FAILURE 1
@@ -34,6 +36,7 @@ struct config {
 	unsigned long long dest_alignment;
 	unsigned long long region_size;
 	int overlapping;
+	bool use_relocate_anon;
 	unsigned int dest_preamble_size;
 };
 
@@ -60,7 +63,8 @@ enum {
 #define PTE page_size
 
 #define MAKE_TEST(source_align, destination_align, size,	\
-		  overlaps, should_fail, test_name)		\
+		  overlaps, use_relocate_anon, should_fail,	\
+		  test_name)					\
 (struct test){							\
 	.name = test_name,					\
 	.config = {						\
@@ -68,6 +72,7 @@ enum {
 		.dest_alignment = destination_align,		\
 		.region_size = size,				\
 		.overlapping = overlaps,			\
+		.use_relocate_anon = use_relocate_anon,		\
 	},							\
 	.expect_failure = should_fail				\
 }
@@ -184,6 +189,12 @@ static void *get_source_mapping(struct config c)
 	unsigned long long addr = 0ULL;
 	void *src_addr = NULL;
 	unsigned long long mmap_min_addr;
+	int mmap_flags = MAP_FIXED_NOREPLACE | MAP_ANONYMOUS;
+
+	if (c.use_relocate_anon)
+		mmap_flags |= MAP_PRIVATE;
+	else
+		mmap_flags |= MAP_SHARED;
 
 	mmap_min_addr = get_mmap_min_addr();
 	/*
@@ -198,8 +209,7 @@ static void *get_source_mapping(struct config c)
 		goto retry;
 
 	src_addr = mmap((void *) addr, c.region_size, PROT_READ | PROT_WRITE,
-					MAP_FIXED_NOREPLACE | MAP_ANONYMOUS | MAP_SHARED,
-					-1, 0);
+					mmap_flags, -1, 0);
 	if (src_addr == MAP_FAILED) {
 		if (errno == EPERM || errno == EEXIST)
 			goto retry;
@@ -251,7 +261,7 @@ static void mremap_expand_merge(FILE *maps_fp, unsigned long page_size)
 	}
 
 	munmap(start + page_size, page_size);
-	remap = mremap(start, page_size, 2 * page_size, 0);
+	remap = sys_mremap(start, page_size, 2 * page_size, 0, 0);
 	if (remap == MAP_FAILED) {
 		ksft_print_msg("mremap failed: %s\n", strerror(errno));
 		munmap(start, page_size);
@@ -292,7 +302,8 @@ static void mremap_expand_merge_offset(FILE *maps_fp, unsigned long page_size)
 
 	/* Unmap final page to ensure we have space to expand. */
 	munmap(start + 2 * page_size, page_size);
-	remap = mremap(start + page_size, page_size, 2 * page_size, 0);
+
+	remap = sys_mremap(start + page_size, page_size, 2 * page_size, 0, 0);
 	if (remap == MAP_FAILED) {
 		ksft_print_msg("mremap failed: %s\n", strerror(errno));
 		munmap(start, 2 * page_size);
@@ -324,20 +335,35 @@ static void mremap_expand_merge_offset(FILE *maps_fp, unsigned long page_size)
  *
  * |DDDDddddSSSSssss|
  */
-static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
+static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr,
+				     char *test_suffix, int extra_flags)
 {
 	char *test_name = "mremap mremap move within range";
 	void *src, *dest;
 	unsigned int i, success = 1;
-
 	size_t size = SIZE_MB(20);
 	void *ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	int mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
+
 	if (ptr == MAP_FAILED) {
 		perror("mmap");
 		success = 0;
 		goto out;
 	}
+
+	/*
+	 * If THP is enabled, we may end up spanning a range which has large
+	 * folios not enclosed within the mapping, which will disallow the
+	 * relocate.
+	 *
+	 * In this case, disallow huge pages in the range.
+	 */
+	if (extra_flags & MREMAP_MUST_RELOCATE_ANON)
+		madvise(ptr, size, MADV_NOHUGEPAGE);
+
+	mremap_flags |= extra_flags;
+
 	memset(ptr, 0, size);
 
 	src = ptr + SIZE_MB(6);
@@ -348,8 +374,8 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 
 	dest = src - SIZE_MB(2);
 
-	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
-						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
+	void *new_ptr = sys_mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
+				   mremap_flags, dest + SIZE_MB(1));
 	if (new_ptr == MAP_FAILED) {
 		perror("mremap");
 		success = 0;
@@ -375,9 +401,9 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 		perror("munmap");
 
 	if (success)
-		ksft_test_result_pass("%s\n", test_name);
+		ksft_test_result_pass("%s%s\n", test_name, test_suffix);
 	else
-		ksft_test_result_fail("%s\n", test_name);
+		ksft_test_result_fail("%s%s\n", test_name, test_suffix);
 }
 
 /* Returns the time taken for the remap on success else returns -1. */
@@ -390,6 +416,10 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 	long long  start_ns, end_ns, align_mask, ret, offset;
 	unsigned long long threshold;
 	unsigned long num_chunks;
+	int mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
+
+	if (c.use_relocate_anon)
+		mremap_flags |= MREMAP_MUST_RELOCATE_ANON;
 
 	if (threshold_mb == VALIDATION_NO_THRESHOLD)
 		threshold = c.region_size;
@@ -431,10 +461,15 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 	}
 
 	if (c.dest_preamble_size) {
+		int mmap_flags = MAP_FIXED_NOREPLACE | MAP_ANONYMOUS;
+
+		if (c.use_relocate_anon)
+			mmap_flags |= MAP_PRIVATE;
+		else
+			mmap_flags |= MAP_SHARED;
+
 		dest_preamble_addr = mmap((void *) addr - c.dest_preamble_size, c.dest_preamble_size,
-					  PROT_READ | PROT_WRITE,
-					  MAP_FIXED_NOREPLACE | MAP_ANONYMOUS | MAP_SHARED,
-							-1, 0);
+					  PROT_READ | PROT_WRITE, mmap_flags, -1, 0);
 		if (dest_preamble_addr == MAP_FAILED) {
 			ksft_print_msg("Failed to map dest preamble region: %s\n",
 					strerror(errno));
@@ -447,8 +482,8 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 	}
 
 	clock_gettime(CLOCK_MONOTONIC, &t_start);
-	dest_addr = mremap(src_addr, c.region_size, c.region_size,
-					  MREMAP_MAYMOVE|MREMAP_FIXED, (char *) addr);
+	dest_addr = sys_mremap(src_addr, c.region_size, c.region_size,
+			       mremap_flags, (char *) addr);
 	clock_gettime(CLOCK_MONOTONIC, &t_end);
 
 	if (dest_addr == MAP_FAILED) {
@@ -549,6 +584,10 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
  * subsequent tests. So we clean up mappings after each test.
  */
 clean_up_dest:
+	/* Trigger reclaim to assert that adjusted rmap state is valid. */
+	if (c.use_relocate_anon)
+		madvise(dest_addr, c.region_size, MADV_PAGEOUT);
+
 	munmap(dest_addr, c.region_size);
 clean_up_dest_preamble:
 	if (c.dest_preamble_size && dest_preamble_addr)
@@ -565,16 +604,19 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
  * down address landed on a mapping that maybe does not exist.
  */
 static void mremap_move_1mb_from_start(unsigned int pattern_seed,
-				       char *rand_addr)
+				       char *rand_addr, char *test_suffix,
+				       int extra_flags)
 {
 	char *test_name = "mremap move 1mb from start at 1MB+256KB aligned src";
 	void *src = NULL, *dest = NULL;
 	unsigned int i, success = 1;
-
+	int mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
 	/* Config to reuse get_source_mapping() to do an aligned mmap. */
 	struct config c = {
 		.src_alignment = SIZE_MB(1) + SIZE_KB(256),
-		.region_size = SIZE_MB(6)
+		.region_size = SIZE_MB(6),
+		.use_relocate_anon = extra_flags & (MREMAP_RELOCATE_ANON |
+						    MREMAP_MUST_RELOCATE_ANON),
 	};
 
 	src = get_source_mapping(c);
@@ -583,6 +625,12 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 		goto out;
 	}
 
+	/* See comment in mremap_move_within_range(). */
+	if (extra_flags & MREMAP_MUST_RELOCATE_ANON)
+		madvise(src, c.region_size, MADV_NOHUGEPAGE);
+
+	mremap_flags |= extra_flags;
+
 	c.src_alignment = SIZE_MB(1) + SIZE_KB(256);
 	dest = get_source_mapping(c);
 	if (!dest) {
@@ -599,8 +647,8 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 	 */
 	munmap(dest, SIZE_MB(1));
 
-	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
-						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
+	void *new_ptr = sys_mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
+				   mremap_flags, dest + SIZE_MB(1));
 	if (new_ptr == MAP_FAILED) {
 		perror("mremap");
 		success = 0;
@@ -629,9 +677,10 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 		perror("munmap dest");
 
 	if (success)
-		ksft_test_result_pass("%s\n", test_name);
+		ksft_test_result_pass("%s%s\n", test_name, test_suffix);
+
 	else
-		ksft_test_result_fail("%s\n", test_name);
+		ksft_test_result_fail("%s%s\n", test_name, test_suffix);
 }
 
 static void run_mremap_test_case(struct test test_case, int *failures,
@@ -640,13 +689,17 @@ static void run_mremap_test_case(struct test test_case, int *failures,
 {
 	long long remap_time = remap_region(test_case.config, threshold_mb,
 					    rand_addr);
+	char *relocate_anon_suffix = " [MREMAP_MUST_RELOCATE_ANON]";
+	struct config *c = &test_case.config;
 
 	if (remap_time < 0) {
 		if (test_case.expect_failure)
-			ksft_test_result_xfail("%s\n\tExpected mremap failure\n",
-					      test_case.name);
+			ksft_test_result_xfail("%s%s\n\tExpected mremap failure\n",
+					       test_case.name,
+					       c->use_relocate_anon ? relocate_anon_suffix : "");
 		else {
-			ksft_test_result_fail("%s\n", test_case.name);
+			ksft_test_result_fail("%s%s\n", test_case.name,
+					      c->use_relocate_anon ? relocate_anon_suffix : "");
 			*failures += 1;
 		}
 	} else {
@@ -656,10 +709,13 @@ static void run_mremap_test_case(struct test test_case, int *failures,
 		 */
 		if (threshold_mb == VALIDATION_NO_THRESHOLD ||
 		    test_case.config.region_size <= threshold_mb * _1MB)
-			ksft_test_result_pass("%s\n\tmremap time: %12lldns\n",
-					      test_case.name, remap_time);
+			ksft_test_result_pass("%s%s\n\tmremap time: %12lldns\n",
+					      test_case.name,
+					      c->use_relocate_anon ? relocate_anon_suffix : "",
+					      remap_time);
 		else
-			ksft_test_result_pass("%s\n", test_case.name);
+			ksft_test_result_pass("%s%s\n", test_case.name,
+					      c->use_relocate_anon ? relocate_anon_suffix : "");
 	}
 }
 
@@ -703,8 +759,8 @@ static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
 	return 0;
 }
 
-#define MAX_TEST 15
-#define MAX_PERF_TEST 3
+#define MAX_TEST 30
+#define MAX_PERF_TEST 6
 int main(int argc, char **argv)
 {
 	int failures = 0;
@@ -721,12 +777,15 @@ int main(int argc, char **argv)
 	char *rand_addr;
 	size_t rand_size;
 	int num_expand_tests = 2;
-	int num_misc_tests = 2;
+	int num_misc_tests = 6;
 	struct test test_cases[MAX_TEST] = {};
 	struct test perf_test_cases[MAX_PERF_TEST];
 	int page_size;
 	time_t t;
 	FILE *maps_fp;
+	bool use_relocate_anon = false;
+	struct test *test_case = test_cases;
+	struct test *perf_test_case = perf_test_cases;
 
 	pattern_seed = (unsigned int) time(&t);
 
@@ -763,66 +822,71 @@ int main(int argc, char **argv)
 
 	page_size = sysconf(_SC_PAGESIZE);
 
-	/* Expected mremap failures */
-	test_cases[0] =	MAKE_TEST(page_size, page_size, page_size,
-				  OVERLAPPING, EXPECT_FAILURE,
-				  "mremap - Source and Destination Regions Overlapping");
-
-	test_cases[1] = MAKE_TEST(page_size, page_size/4, page_size,
-				  NON_OVERLAPPING, EXPECT_FAILURE,
-				  "mremap - Destination Address Misaligned (1KB-aligned)");
-	test_cases[2] = MAKE_TEST(page_size/4, page_size, page_size,
-				  NON_OVERLAPPING, EXPECT_FAILURE,
-				  "mremap - Source Address Misaligned (1KB-aligned)");
-
-	/* Src addr PTE aligned */
-	test_cases[3] = MAKE_TEST(PTE, PTE, PTE * 2,
-				  NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "8KB mremap - Source PTE-aligned, Destination PTE-aligned");
-
-	/* Src addr 1MB aligned */
-	test_cases[4] = MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "2MB mremap - Source 1MB-aligned, Destination PTE-aligned");
-	test_cases[5] = MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
-
-	/* Src addr PMD aligned */
-	test_cases[6] = MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "4MB mremap - Source PMD-aligned, Destination PTE-aligned");
-	test_cases[7] =	MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "4MB mremap - Source PMD-aligned, Destination 1MB-aligned");
-	test_cases[8] = MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "4MB mremap - Source PMD-aligned, Destination PMD-aligned");
-
-	/* Src addr PUD aligned */
-	test_cases[9] = MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "2GB mremap - Source PUD-aligned, Destination PTE-aligned");
-	test_cases[10] = MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				   "2GB mremap - Source PUD-aligned, Destination 1MB-aligned");
-	test_cases[11] = MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				   "2GB mremap - Source PUD-aligned, Destination PMD-aligned");
-	test_cases[12] = MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				   "2GB mremap - Source PUD-aligned, Destination PUD-aligned");
-
-	/* Src and Dest addr 1MB aligned. 5MB mremap. */
-	test_cases[13] = MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "5MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
-
-	/* Src and Dest addr 1MB aligned. 5MB mremap. */
-	test_cases[14] = MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "5MB mremap - Source 1MB-aligned, Dest 1MB-aligned with 40MB Preamble");
-	test_cases[14].config.dest_preamble_size = 10 * _4MB;
-
-	perf_test_cases[0] =  MAKE_TEST(page_size, page_size, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-					"1GB mremap - Source PTE-aligned, Destination PTE-aligned");
-	/*
-	 * mremap 1GB region - Page table level aligned time
-	 * comparison.
-	 */
-	perf_test_cases[1] = MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				       "1GB mremap - Source PMD-aligned, Destination PMD-aligned");
-	perf_test_cases[2] = MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				       "1GB mremap - Source PUD-aligned, Destination PUD-aligned");
+	do {
+		/* Expected mremap failures */
+		*test_case++ =	MAKE_TEST(page_size, page_size, page_size,
+					  OVERLAPPING, use_relocate_anon, EXPECT_FAILURE,
+					  "mremap - Source and Destination Regions Overlapping");
+
+		*test_case++ =	MAKE_TEST(page_size, page_size/4, page_size,
+					  NON_OVERLAPPING, use_relocate_anon, EXPECT_FAILURE,
+					  "mremap - Destination Address Misaligned (1KB-aligned)");
+		*test_case++ =	MAKE_TEST(page_size/4, page_size, page_size,
+					  NON_OVERLAPPING, use_relocate_anon, EXPECT_FAILURE,
+					  "mremap - Source Address Misaligned (1KB-aligned)");
+
+		/* Src addr PTE aligned */
+		*test_case++ =	MAKE_TEST(PTE, PTE, PTE * 2,
+					  NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "8KB mremap - Source PTE-aligned, Destination PTE-aligned");
+
+		/* Src addr 1MB aligned */
+		*test_case++ =	MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "2MB mremap - Source 1MB-aligned, Destination PTE-aligned");
+		*test_case++ =	MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
+
+		/* Src addr PMD aligned */
+		*test_case++ =	MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "4MB mremap - Source PMD-aligned, Destination PTE-aligned");
+		*test_case++ =	MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "4MB mremap - Source PMD-aligned, Destination 1MB-aligned");
+		*test_case++ =	MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "4MB mremap - Source PMD-aligned, Destination PMD-aligned");
+
+		/* Src addr PUD aligned */
+		*test_case++ =	MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "2GB mremap - Source PUD-aligned, Destination PTE-aligned");
+		*test_case++ =	MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "2GB mremap - Source PUD-aligned, Destination 1MB-aligned");
+		*test_case++ =	MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "2GB mremap - Source PUD-aligned, Destination PMD-aligned");
+		*test_case++ =	MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "2GB mremap - Source PUD-aligned, Destination PUD-aligned");
+
+		/* Src and Dest addr 1MB aligned. 5MB mremap. */
+		*test_case++ =	MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "5MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
+
+		/* Src and Dest addr 1MB aligned. 5MB mremap. */
+		*test_case =	MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "5MB mremap - Source 1MB-aligned, Dest 1MB-aligned with 40MB Preamble");
+		test_case++->config.dest_preamble_size = 10 * _4MB;
+
+		*perf_test_case++ =	 MAKE_TEST(page_size, page_size, _1GB, NON_OVERLAPPING,
+						   use_relocate_anon, EXPECT_SUCCESS,
+						"1GB mremap - Source PTE-aligned, Destination PTE-aligned");
+		/*
+		 * mremap 1GB region - Page table level aligned time
+		 * comparison.
+		 */
+		*perf_test_case++ =	MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					       "1GB mremap - Source PMD-aligned, Destination PMD-aligned");
+		*perf_test_case++ =	MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					       "1GB mremap - Source PUD-aligned, Destination PUD-aligned");
+
+		use_relocate_anon = !use_relocate_anon;
+	} while (use_relocate_anon);
 
 	run_perf_tests =  (threshold_mb == VALIDATION_NO_THRESHOLD) ||
 				(threshold_mb * _1MB >= _1GB);
@@ -846,8 +910,18 @@ int main(int argc, char **argv)
 
 	fclose(maps_fp);
 
-	mremap_move_within_range(pattern_seed, rand_addr);
-	mremap_move_1mb_from_start(pattern_seed, rand_addr);
+	mremap_move_within_range(pattern_seed, rand_addr,
+				 "", 0);
+	mremap_move_within_range(pattern_seed, rand_addr,
+				 "[MREMAP_RELOCATE_ANON]", MREMAP_RELOCATE_ANON);
+	mremap_move_within_range(pattern_seed, rand_addr,
+				 "[MREMAP_MUST_RELOCATE_ANON]", MREMAP_MUST_RELOCATE_ANON);
+	mremap_move_1mb_from_start(pattern_seed, rand_addr,
+				   "", 0);
+	mremap_move_1mb_from_start(pattern_seed, rand_addr,
+				   "[MREMAP_RELOCATE_ANON]", MREMAP_RELOCATE_ANON);
+	mremap_move_1mb_from_start(pattern_seed, rand_addr,
+				   "[MREMAP_MUST_RELOCATE_ANON]", MREMAP_MUST_RELOCATE_ANON);
 
 	if (run_perf_tests) {
 		ksft_print_msg("\n%s\n",
-- 
2.49.0

