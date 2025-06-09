Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6FA25C807
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475733; cv=fail; b=hZuaePYUwBpCHMbtFdr8zhB4Lt995AdkH3d4RRgrxYo/JgowyM8NDQPhEgXwvsfX1JtCgEvP+qYx4zrhPPduUwX0+9YV7t/GeB0c/bKxR4ODQTM+/YVqMfnQSlZRrhs+F72KGjj3kutZ7F9qaF3u+QhaMe0nLagvtf+aj4Tfe2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475733; c=relaxed/simple;
	bh=hunkGkzn8jGQiP6IwOMPt9qX2vGtIpVGx0TJtFhT19U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j+iP7wCbgp9qAgHI/6xhhivUoTrJF+KX2+oGCqvUVMwHUbRwKSjsKatml5uNHd+hHYpo/KAfL1ldEWYKngCfvXPySAY9sWdicUgxY+NKHoN5GrDGdLf2vE/+NRaifJC9lBwLglDKLmuIc4f6P4LPOF+wQpOM7wF9gH2jQ4ccRkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GJCoY2WE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JjS0F8GW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GJCoY2WE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JjS0F8GW"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593fdBO008027;
	Mon, 9 Jun 2025 13:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ksWfpg7lQRSHxsVym2gvB5kLBlDxWkIXwh7YGY7y9ks=; b=
	GJCoY2WEBqkmgon9pyxoDKLk7HXSaFopYvmpEapPrMFyrXu8oaIXtB3IDdKisp2C
	yIaZchB89VS23OxmVgtYQ2y3U2FlTA8ERhdIG7uE2PaP9LMNHKayCZGE6jFMpr9F
	W1vDzNqyCe1ooR+7jz3giznFO/5dWVvZzQF2lAQtIayZovIg++bPI94TvdvFcvoZ
	uVqYg7KgKsYy6tYOPx2Vgen9Bu6hKd2MjNQXj7LelCgnZAVSliVPGJE/Setvbbfo
	1tqNsYz/MSEqyK6i0nAZxZRKCPtR378tkm+SrTJGATH/o7ry2k9DfkfeNQopwq3l
	bWqzUpAqSG9RMCwwynHdBw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14a4k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559BtHk6003301;
	Mon, 9 Jun 2025 13:27:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv7ee8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a82pK1GVRaSnjp7ak7nzqzibwNge54rBhdPElsaZ1loLQSIc4LKjkRl4BHhFWi8j/Su6BNDUbUXVOO81Be6nmcp1Er+DnReL4h3TkUNdWsb7wLTCh5GdFfp9YQH5GUgI7pg3pY16S/ti/hAf6wVafi0hdPMUVQZb3cPDfJBgCnApy2skuw0JKIr1gUgOOWtZbS3iPUGlJZBzm1oVDpHZqM7eEtPBRm16sWHsdgEQ9/JVOdMqiOyD0yOlH2Io5hdM61ZCYvbMXcefT+xFsbi1ekbm+0irDpPS6EAK/9xDNkeKj5DoNONGq6QIHcfQDowXK43UrKKaR4KE/GRMyHllZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksWfpg7lQRSHxsVym2gvB5kLBlDxWkIXwh7YGY7y9ks=;
 b=DoGqD3lUkGNJWX6QW3R6pGaoLexswVSwQ6KPFSK9o6ck57waixZrfRplndIZ0dmTl27XhUCv4EI0/MsYdwcJqsKYkNqLiOE/Mg+BoeNTq3oMuvze9oWzOFnmEgrliasLMCrDG/bc8jIatXgC6K28nFKjcg4CMgKvL+BnjN4dGGHcHL/1bQ3Pr3Mc34IypGpA4i8PzXN4teJjEUgSzItb6n6b9lKnF692TJS1LrYZ+S1EBcEB8eLIWCFXj9MtzD/WaiFMfkH+ThUM1tvkE2wAX3GjXdTob85pVSpJw4jTC1VRP9jgrPqU1PoeUTIPq/LjhBCUx3ugq59qcGHE7SwruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksWfpg7lQRSHxsVym2gvB5kLBlDxWkIXwh7YGY7y9ks=;
 b=JjS0F8GWEZf0uRfKv56DB+nLnGeAuYjTv1cNGp2t8IwgE/ud4pkHr4WOj0moCotcJGwERW8y6KMzbEGqR+svEBh+ONg1CjMVI2Aq4NP1yO1hlTzx5l+JHBtvnBW71MMYJANdKmkHbT9Amld/uwqvFO+KW6X+0KbsfE8/RJDiqrY=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS0PR10MB7953.namprd10.prod.outlook.com (2603:10b6:8:1a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Mon, 9 Jun
 2025 13:27:18 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:27:16 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] tools/testing/selftests: have CoW self test use MREMAP_RELOCATE_ANON
Date: Mon,  9 Jun 2025 14:26:43 +0100
Message-ID: <0cbe373c1d14270f5fcaf3ba8734d50d761796c0.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::16) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS0PR10MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b9fcd4-a55c-4597-a583-08dda7595a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZCHuLcSO7IkaHra26SEENt5L4ICSCNwR37X6FyHK21rSZQOD/PLyMiCx6PuU?=
 =?us-ascii?Q?Bndmzpb+WrnUSECfXbA7gtGyCXh6PhBm1aLvi5gOTnhd6O9PLVBnTrSiGRdN?=
 =?us-ascii?Q?+Cz7jnNDEOPUEKi8cv1xMeonBi/VAId5mZCdyk70sK6lbzAKV8Wy47XVJqfQ?=
 =?us-ascii?Q?2Wr41mmNfsJFzhSWvDe54b4fqNfdSckruH7kcHYxLnaxQ/phy37os+S9YGBs?=
 =?us-ascii?Q?3fUWIIsCphl2w7kCQa/Ju+howB7SYugiw3gT2TfpihGlYDLn1lC01hAOWwvY?=
 =?us-ascii?Q?39Yh0H6C1VBbW6WMywiMWoHhQtmJK9TbbbQztrZHDgZUcIwq/0o3mbw8mUvn?=
 =?us-ascii?Q?ToZAAQs3xukpstItbjxJf3/uAt+58bQkLh6wMyFSGQvObYSV+42/nGf7ye2s?=
 =?us-ascii?Q?PMFG69R0hNv7ZHITdHh4jBpSoMZWUkspqJN/Wvy4Wf7akOTqyWRTKnAFTzF+?=
 =?us-ascii?Q?0ss4ZzjsGaTyBrFlBaoruA1NvEgW4bmfSyEVrUBaN8FzN69gIw0mg6dOgAKO?=
 =?us-ascii?Q?+Dv8NLRyTKmEmW4sZZdaNBKlzb028C2oWu3C9PCv78RAMYr0ShEUdzX33rGP?=
 =?us-ascii?Q?N/9TkjtqnP/YXXIBiTOZX0rVY7g3VLrMkTA9qoHTdio1J7Vm0OgXO1EC01Ly?=
 =?us-ascii?Q?SdsLTa3Gtc4v0jjHbEZFtbKVmd9exq2o3gmKe93ayXP1KOL51KN/JGCCfCsM?=
 =?us-ascii?Q?GmK2t23KM+pkWPYBgYys/u+rMnQRraaXCcduRiLGXSk3HAdrYzn4bijxdhEO?=
 =?us-ascii?Q?fvIfkgVBK/NMu5LPs7Dl/YeyNDxLUJsGOXiaHKFzL5yUVl7E4CqnlvyJcCpg?=
 =?us-ascii?Q?IeJdCMXZ/h8yynEMZSHYUU6+5/qyAc06/E5jaihdjJH5zuhE5Z+n6fcumTJF?=
 =?us-ascii?Q?ZK867rAm9B6b9et5On8V/0/+Z9BwpCMmTI7TdLXWWEHobH6mUN0W5/kDio6A?=
 =?us-ascii?Q?XkbHRjeNUaEda1+KOceDI95ETCluxE6ischQ3yoa6LKt9lj6rfncbHpAahLK?=
 =?us-ascii?Q?EIWgXHPOixxGH4980ihHQX071cqoF3yysq5F+vYrIJKcn54N4QTFmEMtuaDL?=
 =?us-ascii?Q?5x09r89xAV6QyUSXiqN6zEFSh02AgPtwhqvR+bN0G8bKlw1wK8SLWx+nNh3m?=
 =?us-ascii?Q?7l08eGjN/2jWKhfYCMpCBFVxREgcwWMZol0iYnvKAVVcKW75wg5TWG3dGXvy?=
 =?us-ascii?Q?XbXCsVygxBcG78BEXS5266bGqVqaxAbL01/6tR1XojBfZ3dhAnrORnnjEug5?=
 =?us-ascii?Q?EkSjjMol87k8SI6sglb7PvNL0ACgZc2morrrhXehOVTWo3NBumEnFXKWsYwQ?=
 =?us-ascii?Q?3ZyCEWF+qOZMe9k9MOr8eH1MsxZkTJrnACL0af8LvsVoQpHtz2/C1ChirxK0?=
 =?us-ascii?Q?ru2ZZg6ciokD/HiQu5tloNnAdwiGIoQgp6kkvEkw04IeUJERJJXBSzKXDqgo?=
 =?us-ascii?Q?q0vy+I0HQAw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yH+Edo9JlNMdYEPerHtExjv8lNq0CBDllX2safzdd0KGXV1xXy8t5n2kbuOe?=
 =?us-ascii?Q?gQqt78BPpSR4qpz0vXaYEs9dVaAXuiLPvHaN/kHJ5Mo9a5G0PU6d1h/s6eD5?=
 =?us-ascii?Q?CBdc42yz24t7v9G/TUVVB4l3+eWnJ07zzZlrV4NbMeBGT/fBNaEAURpoLzse?=
 =?us-ascii?Q?sNRDDimN5BCs+c/61zmziFwK0kBMc3qUndW9nieiev4WAOQ2diqAKtE/TiFA?=
 =?us-ascii?Q?+XjfdGW2CdU4ZvrFOksd5M/pIgFnyGonhkHxzPt0J47WxWwe1cuTv6LuwoRg?=
 =?us-ascii?Q?JSS3ZS5k6NVGH2IlMdpZX6x+xmKyJAwHz7LIqhBVYVn9mx7fcShgLPpIDTeb?=
 =?us-ascii?Q?6YDSstiXEt6lSNida8+LBbWk0AIiODHgkTA6MomxhWTzMVztCivuqflONiJX?=
 =?us-ascii?Q?N0ugkSrcW7gNaGygt3JsyH36a7wLEUya/JjWC4LnC7RKf2va+YrARYx4WPf/?=
 =?us-ascii?Q?ssCAdJwOZQ6w7AiTKkFxerFw2lvY4kQ7QiUCNRkCiWKH0wvYQC6GIffSNiSN?=
 =?us-ascii?Q?VtMuQfwmSusWnfAiWUoJ8feW8CoFfAVfFJ9oUHPchi9ITpxn/PrcrnDieJxF?=
 =?us-ascii?Q?vCE6nuMJ9rJPD2CHJJH3xN6fp8/+beiJToDzFc1Zm/K5D7XfCTItmxW+1VcO?=
 =?us-ascii?Q?g5vaNjkpUXIrskzWfSexR6aDbCXx4HFFRTeNh0RDgwinzMmQivz1NwDgi11C?=
 =?us-ascii?Q?/CdDHNtIzAL3eVnSERuXkCBmjlDF/HaRRvh8GUfL6/83P7iMEDPW2IC+ebRx?=
 =?us-ascii?Q?3tc7Npa4t0QzHRepFixXAA4DBMj14fU5jLT/yKMMtAYouLddoz28XJ4j5dkb?=
 =?us-ascii?Q?x1pnjgnpdojuNE522anUPQ7Vd9PBq96P+0aKuKuMcvsuiiSRC7qO937Uc4yS?=
 =?us-ascii?Q?x+///euF1V33nIUZbPszqS6YpHrLVQ/4H3UEhwpe/8Eitpgeumk1Pqxn3O3N?=
 =?us-ascii?Q?TGNzHXQUY9fxjEWGza9iBx2wkgqJX5/5QZnSSQO2ecu7W0rdhph/9vzSEkZB?=
 =?us-ascii?Q?JxjDkOEWr+0vjAo/VrNeZHrcjgeDbGiHwMbIJkRiiQOtRY+5o0CB5XsRA+nm?=
 =?us-ascii?Q?flx/sJ0xshLdbUXaLJIhxbL6GdulCgvr81b/JNS430MJbHYwdmCfMfDDLcqk?=
 =?us-ascii?Q?O+7kbW0U7EHrPGCzpiFFacBoN46l1HpRCuZ0+s/oow/wHhziseG99lJTKp4v?=
 =?us-ascii?Q?Zm5rCkklwcLTQM+HF8ddoER0mo2xKaeRrWbDI8FMHfuYWsDczahslHrelB5H?=
 =?us-ascii?Q?ZRkuw1JInMgS5rNwxzu20o+nF0oDzW9Erikn4Y6wyt3KQL7SXE8tYJ9HpYcZ?=
 =?us-ascii?Q?S5n+r7OPBViCmBDpurTqSQt/buHsl/0BsqQdR8JRbWd4cNGtUEp1Gqsrefe9?=
 =?us-ascii?Q?87AyPhSclKmDBrvSl35UbgN0vvZaKY1kTdMngSJyW7FalOcOyeh/ddDH/YdG?=
 =?us-ascii?Q?PcPNeD2jZInK3ROxGLjrNVbdLn0hqBS8LrTTXZXyRCnJkUrHxdxaq0hl8jZy?=
 =?us-ascii?Q?M3GAdP2Hy7bnli6JO23KdfugLZYcG6cCfVLec8J19dHRULWoXCNHAp5Riixw?=
 =?us-ascii?Q?4ch6peh1O02lwVNnYdQw59t8D9PskV++/RM5CMp/YI6MKxJujn/jbGVpNkhP?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T1UArsQI07qYkGCAKAWWAkqnsBHhXtgHqd5m57jF0J+9KnVKDsUPTKz2IcqAkcS3b9tfDGoznZR+fr4ZwvGsa4zN/x8sbhmjqSJ1p9/1IrccpVnXfJiSCDfMK/CGRyKA0Ectv4M70tkTWqz8HrGTQo6PHhubiR9T+KtgXZMM2saORn1GVd6sXfQsyubP/b02avKt68OU2PLpBhwKS9ND5lqzobLKjR3kCeWc9J6J2akUFEMCuy62XA7JFOrARWMoysgvNu8DhaWj9GWb232Bz4JgbSKfEh1T2H1T1sS8gu8h0EyYlHDYEGJswfpKVcTRLyrZKW+ENnuBJljrb92kGzeH6DtANW7pEQTIK9DYXD3WLDfj2ktqNkq8ZGNnR7kLd/Qtp3F3RLjSz/gvX3l8IDIRQnLiptJAavBlPhxX7gA1canVsbnv6w5TYN1zQu0UJrwQJbOyWzqVCyaQVxt3+g0ztuVuNk94yRF8xrcCBVTbBxpbdIl5Lh/jG2pIYhGAhUdxbRz+/oNuylcmAmsCne4Q5Zssd5IcqUzuh5ZxDoOPzVP862z+CsgdSTgDVMPqhbMFTtgMpcY0LWklm7UDguwL3CuGbr5NJuEHz5YADkw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b9fcd4-a55c-4597-a583-08dda7595a5a
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:27:16.7189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: so26PojYYWMPXg0AvqX2cJCp1tw9O2HZH1ftHDZ9IR9v8b9KlhNtNEESyz5AoLEW49CmrM7/LhUNAhsJGT5b+CyZQDwoZkZ8gbR0gQNhJhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7953
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090098
X-Proofpoint-GUID: NtuPRQWSXDl8wmgWBwLDylmfYaepR8KT
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6846e13d b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=JUZvRre7zh5LkbeaQN0A:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfXyUErld8svNo8 S3to+Q0Qax0ucwb1pIglX7A1LnUXx+46AOLILp4InPhwyKwlwlt6DxH9c3qJzvzH/7JFHsXIjN+ TakTLkWDOekBRYPEMpzpHCbYPJ1tG7XGOxbPOXRwapoV7Faz5THMQpUhwJIwvgx35NK2aZrMFwS
 VIbPzcQYQ43JN21ORP4F3mmXgVHM0dx+vC1/F/oyY0kWvfhqWEdfczegfnMfXFgOmcgoguXi0Cg GTIQZqDMRgEDPIc8cSk9IRqxBCwtPHzlB5n4SG7KWUXzNcIhDb++EZe1WBY3wML8/VDYnjPSl/N Xka01HIsJiEqZU1tYnbmk5KJBzwXv/NA0Iig9SzdVF3kQ0SKELvXO1PdDj91GA8Xb6WjnCtecFC
 agbea+OtNTY5WXZxe9NlaRgQpMzWGkheYZ3B+jQhcLeEMeU6vfdn7LNcsvHrxBl0duw/Tp50
X-Proofpoint-ORIG-GUID: NtuPRQWSXDl8wmgWBwLDylmfYaepR8KT

It is useful to have the CoW self-test invoke MREMAP_RELOCATE_ANON on
partial THP mappings, as this triggers folio split code paths and asserts
that this behaves correctly.

Add an additional set of tests to explicitly do so.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/cow.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index dbbcc5eb3dce..c483bfd4269e 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -845,13 +845,14 @@ enum thp_run {
 	THP_RUN_SINGLE_PTE,
 	THP_RUN_SINGLE_PTE_SWAPOUT,
 	THP_RUN_PARTIAL_MREMAP,
+	THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON,
 	THP_RUN_PARTIAL_SHARED,
 };
 
 static void do_run_with_thp(test_fn fn, enum thp_run thp_run, size_t thpsize)
 {
 	char *mem, *mmap_mem, *tmp, *mremap_mem = MAP_FAILED;
-	size_t size, mmap_size, mremap_size;
+	size_t size, mmap_size, mremap_size, mremap_flags;
 	int ret;
 
 	/* For alignment purposes, we need twice the thp size. */
@@ -927,6 +928,7 @@ static void do_run_with_thp(test_fn fn, enum thp_run thp_run, size_t thpsize)
 		size = pagesize;
 		break;
 	case THP_RUN_PARTIAL_MREMAP:
+	case THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON:
 		/*
 		 * Remap half of the THP. We need some new memory location
 		 * for that.
@@ -939,8 +941,13 @@ static void do_run_with_thp(test_fn fn, enum thp_run thp_run, size_t thpsize)
 			log_test_result(KSFT_FAIL);
 			goto munmap;
 		}
-		tmp = mremap(mem + mremap_size, mremap_size, mremap_size,
-			     MREMAP_MAYMOVE | MREMAP_FIXED, mremap_mem);
+
+		mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
+		if (thp_run == THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON)
+			mremap_flags |= MREMAP_RELOCATE_ANON;
+
+		tmp = sys_mremap(mem + mremap_size, mremap_size, mremap_size,
+				 mremap_flags, mremap_mem);
 		if (tmp != mremap_mem) {
 			ksft_perror("mremap() failed");
 			log_test_result(KSFT_FAIL);
@@ -1052,6 +1059,13 @@ static void run_with_partial_mremap_thp(test_fn fn, const char *desc, size_t siz
 	do_run_with_thp(fn, THP_RUN_PARTIAL_MREMAP, size);
 }
 
+static void run_with_partial_mremap_relocate_anon_thp(test_fn fn, const char *desc, size_t size)
+{
+	ksft_print_msg("[RUN] %s ... with partially mremap(MREMAP_RELOCATE_ANON)'ed THP (%zu kB)\n",
+		desc, size / 1024);
+	do_run_with_thp(fn, THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON, size);
+}
+
 static void run_with_partial_shared_thp(test_fn fn, const char *desc, size_t size)
 {
 	log_test_start("%s ... with partially shared THP (%zu kB)",
@@ -1247,6 +1261,7 @@ static void run_anon_test_case(struct test_case const *test_case)
 		run_with_single_pte_of_thp(test_case->fn, test_case->desc, size);
 		run_with_single_pte_of_thp_swap(test_case->fn, test_case->desc, size);
 		run_with_partial_mremap_thp(test_case->fn, test_case->desc, size);
+		run_with_partial_mremap_relocate_anon_thp(test_case->fn, test_case->desc, size);
 		run_with_partial_shared_thp(test_case->fn, test_case->desc, size);
 
 		thp_pop_settings();
@@ -1270,7 +1285,7 @@ static int tests_per_anon_test_case(void)
 {
 	int tests = 2 + nr_hugetlbsizes;
 
-	tests += 6 * nr_thpsizes;
+	tests += 7 * nr_thpsizes;
 	if (pmdsize)
 		tests += 2;
 	return tests;
-- 
2.49.0

