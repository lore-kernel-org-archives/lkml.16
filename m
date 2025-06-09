Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BE778F4B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475720; cv=fail; b=oQR8f9St9x/wbUM1O9v6DenxL7Jr2fG3U3qcPCcAJ08mz6WFe6jb24fAnlu4rkasDgqWJ3i41n+cKherWIWeNjvPs0JGg5K7Fwodp9aXX9o4QLfpSwDKNgnHvZk3idceTUGc8ZaPUU1mkbRvlRU0evDFvMjYzNoEqLyRUKzqqPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475720; c=relaxed/simple;
	bh=pA6uCqNdmvz42Nym/glDOjpKrVg1N4rQSbF2iDP5TRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IftVNeA+oR+WZIL3P07FeYXKyJgkNQVgeXrE+Edb7zHPIvlJvOaDA7s7rnb6e18GxkdIoy/TNQRC+SOR2ivhUW5B6jnkjIQYme+TjtKBkuzmkm+5vumTJKQ1ovyAlWkWVAn2MGc9rMDPuKMmvcJ2gWR167kK/QlwhsKShOhgKuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m3rHWhsp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=d7dJdyvs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m3rHWhsp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="d7dJdyvs"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593ilJm017209;
	Mon, 9 Jun 2025 13:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=/t1Tj0yddP0fohLbotYs4lt9YOpNJsFpLPdcWZxKMy4=; b=
	m3rHWhsp4hyY5OwMk1tA8Zw/e3YZdlo0Pgm4QiZJcXWtfmKxrh3M9wbbbYMsQgjy
	ZQ1S8PPnCS0ZgfhH5WlZAAXv+ZH5U5CJAx3SPBPHwsBwewffrUVqGBiuhAbVCnxU
	feoUvBklwvMwPJCsGt36j7ja6KYQMwv2ZwcuM7AGlZ7Kts7XLl8eUTjn4jRWt1m4
	cwcY599S2Aqr2Wt3Jf/ebRCjUIa3L3SO9/W9C6TekVFpl8l6IUUZb3Vpqi7JyloH
	92zkvU7zVd38tux8QWYCKFFighlx7nA/MBdPJWHRrM0GsIMYtRpXYP3U+kFfZGBH
	5yJJZ5tXQsZS2FjsN498zQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74t55u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559BlXav032088;
	Mon, 9 Jun 2025 13:27:15 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv7ehyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwwlaQLigAp3ld0+dIYO3mzHCEP8OpW002GWvDcM/WN6F1G2ArfafUVpBbdASdUpew93Nce+2qn41w0uEFimxirE2EEPYAswQUg6uC358tf5sIvaIG76f8jDfa9gBdpgA36TmwhnQkaOFqy3gqZsiK+jKjC6heIHpxi2rO0Ov4TF4CUUqSWXJgpYTAL/8ZdFsVqTEuT1VOeGXtKzfBltF4i+klXN0XKOEL7Ja6GW493esyA8QvCcz2f7DY/AeaanuXCNwpsqVLnDsQbJHlbQDEi4coOKxmRqiyF5Jok8ROnbIy/XbTg0KZWmXFVrUmDrS87T/ofuhSUf8DQ220jy5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/t1Tj0yddP0fohLbotYs4lt9YOpNJsFpLPdcWZxKMy4=;
 b=E0hhw2APgl4HJW0P4HnOyHyC8WjwV/tPtS0/yWBd2smXeCV8xHYQLndp0HGsGZQ2FLfcQnKd5vbU86T/obt6MR+DF9oPTIPOeV8IB9WYVpLYvutPAOPXvBLcNn18EUt9tEznJLhVvF1m8li5VgOySwcfZO7V5QsTV7lYnverKF3TwO4IrrGg2lyS2IbYGCwmTpRGh+cOVSBaR1uayWNhz409i/VQkKWxt4RsVoBNYIZWKO/5TznWKKCje3Rfw+ewOW01Afs7QkgBIWbh8xv3i42bmDCe6nOTYVC5MxQySobmS7ylXxrwA+/XS6LaV1gRuEIp7tb4fABhXCrSJL8a9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/t1Tj0yddP0fohLbotYs4lt9YOpNJsFpLPdcWZxKMy4=;
 b=d7dJdyvs5XiyN3e/Xn3pzvUYAxRgbQgqBnvdwLgKhc9Orqf+Q0jpfQMuJ5KbBc0uZOsN2ehyTliC9Au+zbaVTM1OxHjPas+zsjOjKlqNrlxMSg7hoOg602xB7vixH6RdwTbuJBXPFh/QdABKyrgHHxvXNnHpoU/PXrUX0TruyLc=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DM3PR10MB7947.namprd10.prod.outlook.com (2603:10b6:0:40::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 13:27:12 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:27:12 +0000
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
Subject: [PATCH 07/11] tools/testing/selftests: add MREMAP_RELOCATE_ANON merge test cases
Date: Mon,  9 Jun 2025 14:26:41 +0100
Message-ID: <96242c962cd2da54b15d97aac8761bedb285459c.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::13) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DM3PR10MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9666cd-cba9-4ee7-ff4c-08dda75957b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NWigGtCCKqUPeWzoVe5NwRx2avpnhV1GCOYBd7W+I1qvN7se8betiRWXm+l8?=
 =?us-ascii?Q?5Ru+HU3J77L9kc7pgaY3wiI+ybFSAyWwKKtp+UJYoksffJQ/xAa0/LECCw6t?=
 =?us-ascii?Q?GS+/ozZ4YW/KeqDjnJH+ccfVK2R8v+HJjIctVY1lRhqF+obhnfrTfS/rsIMv?=
 =?us-ascii?Q?Wdmj502g8BSQgO7EMSf3lb6WOBXoCr/6Pb34rSi/cWWTzH+Q/8iQTGKC2rLI?=
 =?us-ascii?Q?7dZnfvjJSoHkp3TiRziwVRUiGK31NI/6Vj3HlusPWpQPpHB97v00R/qUakWq?=
 =?us-ascii?Q?oqepH6KiwhQ9A4yXTVrHe6BTmKQske0bUEebywDEKSrR83QN0A+oIGGN7qnQ?=
 =?us-ascii?Q?ld0x2yA/ejWbFbh6cyPaPcgzS6S8OR5H/QnsoF/XHo+Ssj9BHhgm4MuQaOPC?=
 =?us-ascii?Q?TB61A/MUATH99z4Fwpn8WufniNBgtjno21U8u0b5LN3UqA0iAf9DJdRqAHlX?=
 =?us-ascii?Q?vM9Y7LUr6tHc3PFtvJXu4QD5wnzHeD9MmaGowO4MAvrTtPKJHQt0l2rAKqTB?=
 =?us-ascii?Q?YksCm4ymZ+VcMvM6FnXeEZ15eCLs0kxlhHntdl1xcLOe7JbdlBa7j9i0UNA8?=
 =?us-ascii?Q?FWX2WMWCOvWc10B/ipMQLPALmrW8+V8NyC7vW1r6KS+4ac0j5Hqy1JHK1d/p?=
 =?us-ascii?Q?QoRif7dQSkcgR59w6+cqyO7dvhmC5EWaEeK1J7KVVVYpwnMkHjcDoXF87qwx?=
 =?us-ascii?Q?EimAK3hGUYPRB1Jmf5/evIrLunDYv+tL9OmaVpLb5EiC0qu6PO6YChV83jM7?=
 =?us-ascii?Q?VvQjnhTmacqXAJKBYTutqGoRgPoRzHW0pDhz5f+RjC+0hfJqR1whlXwcLGFW?=
 =?us-ascii?Q?MfIwhdxhWL7CziKEvKnumDxip0FtTKERn6aOjeudftQvVKrIXp94cAQnMwKd?=
 =?us-ascii?Q?10emOyLei78JOuJI5ROsWadpi390qhwbMOVdYxH6qqGlZcjk+ZllVU6e3QEs?=
 =?us-ascii?Q?ojpBeYJsLGJDGzTx0ckfK1o+7HXjxbB9VRlFtEdwmQBIJ9S4LfH31+1y0IU/?=
 =?us-ascii?Q?p5o0mrpnhKSUz1WMNSD05pYE5vTgteHGmEl4/A4sQx1gMR1CgGCk6g8fibpL?=
 =?us-ascii?Q?gmmSkYEgLEOte0rzinvWwUu1fV6rry/KgjX9X9MkGm4wKQl0CC/n/rWayZ1E?=
 =?us-ascii?Q?xzAf007BOD3KBDsk2cvjJEHpBoHUTjSrAwwA2JbcBgRxz1GhJvjgKbXXJJAO?=
 =?us-ascii?Q?6bK8+u+6QwbSsOeVbLocngOy2pctXZvcIqTvLrr7npdwZcV1TGQgLWG7JIxX?=
 =?us-ascii?Q?kaI5ClPEDntdIpiJi6oO7KsrSCCwiLRZfFEsh0zRqRJZxHoLGnQnLXk7Xt06?=
 =?us-ascii?Q?xZ7jJU3hPGTdoJpHaucI7I9bRlQBlbKw9QxYHm+1BmtkqfOeHRLppDJ4ztl2?=
 =?us-ascii?Q?ZUXilZyTCsqCYYJOF8u7+h/660raX/3oxDtvrFT0myhqB/N7ffwuenNwzSBl?=
 =?us-ascii?Q?VqMtGNyVH6g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jzAVGwzOk8WuGjM+ZppghmxVxaQPC7w8DhETGE4nVN1yXg2dccv+Xlr+x2g6?=
 =?us-ascii?Q?PmJGlH9DI0NTrT0NlwoTsnPRXEjumPCh0nJI2s7zIE9J0sx3AxiBMUcgfg9K?=
 =?us-ascii?Q?T2TW5pu7L7ZIcuWAPxSunO2LS22HbYvnfLYcNdnhRpLbEExRfp4C7u++ewAf?=
 =?us-ascii?Q?d8EWtvsgzRg35S+u2/on7TbdeWlqIDnfNAO7kRhWgjA2eU1Ax72pOlL0QCoo?=
 =?us-ascii?Q?/c9DjIIVMo0+VfT/QP9w9+BkNphsddqegqwi2WeWjbC1sMlHzUCq8GNCMGkK?=
 =?us-ascii?Q?S5l3ARPAQK7FQgb0G8JFHwBSONliPPsarPuXpZB2Lb8bogWEMTj45mdFXyLZ?=
 =?us-ascii?Q?cmcJIHOo8l8sh5wSMF/NTMLRzBTqo1ei3Xm/PTL+sR0SnEjSkhGS126dcHn+?=
 =?us-ascii?Q?xnQn2NVHfAkSRyoOd8k2VdGM97YBHBRvoMDKhnAlr7M3DO8NrcG7G5TiA6yp?=
 =?us-ascii?Q?gHuHQwH7hhi+p2FB3Gzm2Dm/+9o34f+2K2WiCwxhVuLpzJgNoEh/j7wxII5a?=
 =?us-ascii?Q?1aX1bIgMSAw0L7IN2AqtuzplQeRbfuwX08lx3OMF2Ip8vx52pvgYT4uACZHY?=
 =?us-ascii?Q?C3tVUAIPD2q21u35keEUcmYfOZBSDLszthQsG9K8696PEXHRpKMpTjK9Xg/j?=
 =?us-ascii?Q?LRorYiJuovumhLjar87Sw9szYVfhpHtgQOv3b+JL8aXy05w24C9Tssprnz3d?=
 =?us-ascii?Q?QJW1HCkkLBRa2DgT6MRjj6dTjTOYuQABk8zTdoTESm19yUJHZ/JqYcs7hobu?=
 =?us-ascii?Q?7pJ/BkJlNAodqDtuRogDziitdvoF66SMeO1UPwpvb9W30idY2Arso1z6lwqO?=
 =?us-ascii?Q?vR7iaOI3AlsiODdsh22SDOuHPjMc/q9Cz5OXW+XwYaan1lkeIBHQbqiES/qB?=
 =?us-ascii?Q?w5XItEE/OBb2IQxFys28fDwXzBVuvrNcz4kiDD4pq8qvN6Sbs+gDPr1ywPvN?=
 =?us-ascii?Q?A+lfX610DpYlzLXIh9BcgTBbFk3i2h/9yfSZdcKVKogC/Z51a0Xt4V+gq1FF?=
 =?us-ascii?Q?cYjyzO2Yu9z6DxnMy01x6JzmtaUTmuUYWPYTmDtOzkIwtiG+rfm3y0wNmlj0?=
 =?us-ascii?Q?7+XPT5cEaiyAgHjDZHCMmXaSyb2AvIStQgF+H11qeHGBpe/piAIhxUYI+Bbx?=
 =?us-ascii?Q?OkqKZuTXhj5HCWQ23XZYggw7zCvPR9t6P0/8MZsHGF3vEju75o2o0KhyKaSD?=
 =?us-ascii?Q?gglBIwKofTQc+cz3Tq5xa/z0USl1g146ZluYkd4iT4ykKEKEb4mqlCkkvhDE?=
 =?us-ascii?Q?6tIaGf738z7fOmg1JrCK7iY5pb6lKqvpvilQMpxYUMk+pknR+6OCuTTfeGwA?=
 =?us-ascii?Q?OLBJ0COBG4jBWmqKhaj69dGoVVdmL6xy+FtJbpUrKFFl3cX5Xceyf22g4R2S?=
 =?us-ascii?Q?u8WqRb1ON9BYlfjtH/698xto/fV5lYMRkFDxPpbl5ycsAZ8kg0mMiX/FC3wM?=
 =?us-ascii?Q?ExlvBJPeWCBa08xgmCR4prt6cjW3SxZQdQy++sXmHiSZuxySlhENINH4eJmo?=
 =?us-ascii?Q?YtNnoUrJ4n54UsGEphlQr+QLY2MyaNabwHi9Bo0QtgHTtXNS3cez3pYkGCtJ?=
 =?us-ascii?Q?mIzNhR5zPNMZhPiSeqlCabZltBTXDLBIfxTWD4afwSc0dYfAJ3sa9TZERsPi?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	62Dj3bj29BqiXIFb8n/S/DBGugdlSZoCQwRvt7MAWfGkJ+T6HYYjUppOtSkWs/U2qRS3IMoz32EhCIkNepcPrXMrTFMYU2Gk02laBVdZArCFEfPGEzrg4fSNNCdwD+jfpkgZf0+zGRZ7lBu+EymakgPgT3B9e+KtNKv0iCxkLH2l1bUPkRlrA+qutZvmFcQPd4MFKLwiCtJnzt4wVmNEGbXQtKqifWBeEY4Kuv2kGY0g61uCPX82w/IuydqayAnkuGMQpzReLWm5i5nWMtHc+TST96ytAJGWTHlRKtZJ+uUZrZ84kQPEtm8P4OTDbbUdugiKYbiMZC5FuEu2W3GbgyKeD5hJYAqsNB6B5vgJPMCHC64ftm5XIABzRstcjX54tudANjctCIKp6IUkq/4kJuAUkO+Z2JpIsvdG/zjggbYtCNd9m85fP/IyEqrNXmX6wt/rtMfzAyBbPpEM1x4mbURW/bnAit2AwbboYZWDZ8BPGz2lVKu+H3fjpf998m/nZZY77RHlDiNRXay58WVL52+noZW0Xr8vKGt1q+MbXt51uOH3RPEs8uZIf0NfQYXO+22JFJycQwy4GpJtkKpxsxxrQn7rL5G+DOCdtoebE2I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9666cd-cba9-4ee7-ff4c-08dda75957b6
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:27:12.3466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jn0gojGovvQto3wdV5NCf9yyAy556GRspv0csWM9JdVf19WublUcK29Qhqfez+nK/EZikzvD3M5VTs83lpn4tEC4fmMPBNP2rLWeUVswUNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7947
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090098
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=6846e134 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7Hmlt5ibIiRAvCtG0RYA:9
X-Proofpoint-ORIG-GUID: TuxpM16V07nD7OP6UatLu0AzagreJl9A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfXxN2UTTnvJ+rN HC+5ffH96ctcqjWQqG+30RPV6L932+vAAUriXNa+zK1hlkYTKXDv3np4vhf70xv6+vAdikCr+Sg M/lTbVsyORygthNYMl6C2WhL6mkZMrXh37kT+RbouyUP+wwRBx1UU7sPr+oc4ONKWjGo/e3Hv3k
 bNHgrRUkwPma6SInCMo4IpNGWPEBf1aL6Zaceua8vS7HG2RJqlTPy9s0qx5cgZk4Sv/ylyqiDkG o7EoiJ9H29L9avYHvnWXHW0DrKznuzO2P7XHEBmQCvsifKpg5Rgcs90PIin203FxnRsptWATNm1 NKmQYJJQQcSzctOxK/BwMKTOprKHPUetWQnS75/+ekzAdLjqOHym0zeov4H1zvhjq7+w7UD4d2X
 FerhUzfa40whUY4vyYxBwHYpgTvOjU9sB9rdIzWwMJNtnUBVLJPtKy9wqqdH4q/cWMySpy1C
X-Proofpoint-GUID: TuxpM16V07nD7OP6UatLu0AzagreJl9A

Add test cases to the mm self test asserting that the merge cases which the
newly introduced MREMAP[_MUST]_RELOCATE_ANON results in merges occurring as
expected, which otherwise without it would not succeed.

This extends the newly introduced VMA merge self tests for these cases and
exhaustively attempts each merge case, asserting expected behaviour.

We use the MREMAP_MUST_RELOCATE_ANON variant to ensure that, should the
anon relocate fail, we observe an error, as quietly demoting the move to
non-relocate anon would cause unusual test failures.

We carefully document each case to make clear what we are testing.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/merge.c | 730 +++++++++++++++++++++++++++++
 1 file changed, 730 insertions(+)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index b5c183403fe7..b658f2f3a94b 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -1168,4 +1168,734 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
 }
 
+TEST_F(merge, mremap_relocate_anon_faulted_after_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * | unfaulted |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 after ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * | unfaulted |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr         ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_before_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[12 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * | unfaulted |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 before ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  | unfaulted |
+	 * |-----------|-----------|
+	 *      ptr2        ptr
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &carveout[page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * | unfaulted |  faulted  | unfaulted |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_after_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr and ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 after ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr         ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_before_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[12 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr, ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 before ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr2        ptr
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &carveout[page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_faulted_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           | unfaulted |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  | unfaulted |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_unfaulted_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr2, ptr3:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2[0] = 'x';
+	ptr3[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * | unfaulted |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr2, ptr3:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+	ptr3[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge, but only the latter two VMAs:
+	 *
+	 * |-----------|-----------------------|
+	 * |  faulted  |        faulted        |
+	 * |-----------|-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_correctly_placed_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map one larger area:
+	 *
+	 * |-----------------------------------|
+	 * |            unfaulted              |
+	 * |-----------------------------------|
+	 */
+	ptr = mmap(&carveout[page_size], 15 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Unmap middle:
+	 *
+	 * |-----------|           |-----------|
+	 * |  faulted  |           |  faulted  |
+	 * |-----------|           |-----------|
+	 *
+	 * Now the faulted areas are compatible with each other (anon_vma the
+	 * same, vma->vm_pgoff equal to virtual page offset).
+	 */
+	ASSERT_EQ(munmap(&ptr[5 * page_size], 5 * page_size), 0);
+
+	/*
+	 * Map a new area, ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                               \       ptr2
+	 */
+	ptr2 = mmap(&carveout[20 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault it in:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                               \       ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Finally, move ptr2 into place, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_mprotect_faulted_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[12 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr2, mprotect() ptr2 read-only:
+	 *
+	 *      RW              RO
+	 * |-----------|  |-----------|
+	 * |  faulted  |  |  faulted  |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+	ASSERT_EQ(mprotect(ptr2, 5 * page_size, PROT_READ), 0);
+
+	/*
+	 * Move ptr2 next to ptr:
+	 *
+	 *      RW          RO
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr        ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/* No merge should happen. */
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 5 * page_size);
+
+	/*
+	 * Now mremap ptr2 RW:
+	 *
+	 *      RW          RW
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr        ptr2
+	 *
+	 * This should result in a merge:
+	 *
+	 *            RW
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 *            ptr
+	 */
+	ASSERT_EQ(mprotect(ptr2, 5 * page_size, PROT_READ | PROT_WRITE), 0);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
 TEST_HARNESS_MAIN
-- 
2.49.0

