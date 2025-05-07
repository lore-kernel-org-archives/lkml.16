Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07FD289E1B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630401; cv=fail; b=fD5e+8KkWas+6YVMMkyFBBhKGI/6WRfKvqpJAmYpQ9cUhO2KW7k9Y1X43dVI+T4vwtKbrmhSCiR2fqRLJuEh8nYjfXZHnH3Y3l2kS5aOiNvLDPF/LJYZvr8F5qgkkg50gc/v8kEzclfYJsAh9ZQvjt8TbdYcCZKpH9/KCbktuOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630401; c=relaxed/simple;
	bh=Ib1E7VX58F23Otj0XBV6xFnRGbMj7ltNOXIJSmFGlCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=erlI0ed2aosq006fS9gpCwd+Na59mxXcjXdyWq2LWTdI+wgNtvAifaA/2W8LG38RjYGYWW++5ibNMtOdr8fKuXmQbtF8Kqxt8m7g45vfvNuC7of5RB1CJK6MxqstBE/K9jIC/7h6xLRb7/2Fn4reTzdzPMdUbI3I/fjvv+eIadE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JQQbsiTH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iwKeX4iM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JQQbsiTH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iwKeX4iM"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547EjM7I010856;
	Wed, 7 May 2025 15:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=DO/EcubJKqvXny0zXm
	9UXMHEQfA99+5BFEUXQStZfU8=; b=JQQbsiTHGlFCCQJAyMg7Bp9NKGnlztYJY9
	YprCvxQntYaCJzupu4SstyJx/FN2TLZEi4RJ4a5iyAll26fSM3DsG+RVfEQ/5EH5
	89ZF4VQmoOnJlxRAMYUcEXn4Hh1Zlt31+y/UZXYJ91Q140dhnZNIdZIcGDk9lZ5u
	DRdObcOZ9/7qgjVaG0FZzd6rAfv+z5msrnP4pmX6S7/90AndHed4p70/zcssvXFO
	1t8HSRpxtIGZI5lL7obpvY58QIOYCksJccfjvdD37PY/Fic2Ex8jTPD5REvR2mv1
	2n8vKYDphfsoh61VGI8w+oaMkYw9R1hmjJJJtH30YrKBHnNjaOUw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46g9j5g324-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 15:06:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 547E371T007662;
	Wed, 7 May 2025 15:06:17 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012032.outbound.protection.outlook.com [40.93.1.32])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46fms947mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 15:06:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgu3RRTtc+QyUfr3yM7alNiPrfqBXi+C+j1UumGj1mM56QCXz3Pe2R8vv1oqPB5+5xu2Uo5yORo8KG9AN5H9/M825cFUUnQEpQA+UrjwYdOmMnCkvJpIktbcJjbPcUMAv3iFiBMdtzvr6nKXN+sPxbE3LQC5/QtUW6NEVFQrh+/or8T/sH4vRvjM7E8MmhwXKSmPZmPd1hhkGdR4ekUqDWIRG6zjUrNDHDM3Wdy/IH2WK7lcD61JxZfPbySCMzJZMCLVsJNww+ocAGuBgkx2J9Qn3y9BKRllRrK6zVm5P/eCYhJo9zGs4yepdGCkfWjQonQHqEkuxeidpwgCMvCRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO/EcubJKqvXny0zXm9UXMHEQfA99+5BFEUXQStZfU8=;
 b=KpFeGncynHOuxIY4UngFl9ImXmBF1AcQsGL5L5AN0dDdq42cDhqH37GLm2bgzS7rp2O2bp/S1u8YlaGJ9ykZRHxRmG+yYtCe04rBL0X0KgY8L23nNI/b+fC2Cnh6n5L2++sIfvpGNhCUZMwWF6dk05Rcs/BY7Jk86yKCqL3VO5yEQQaSlzC6+XyPSrq74b4iVbYeD/N/hkRj+qX5YuAVefSx4qW6eHkwXqvTIlkCLn4nuluoyH1bx3lcG/Xr5E63L8toDXZijsz4Sd/pQFjT5gHFCDWg7/OFLbg82vtIXcjcThup254HoEPQDb+mfOxcOng5NAomwH27X8/nHQYS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO/EcubJKqvXny0zXm9UXMHEQfA99+5BFEUXQStZfU8=;
 b=iwKeX4iMeGteNBb+8s+jQzDhr9i7Pq9kEQ+TS92kKSTFuCE9oYXdUNevElCmv0G5lpfFjbtEmXv9aknhX8KjNYUlMj5qSfhImsBVZvLdnE3it5O/S8BWXFlZ47R/teD8VzsnSBzbh8aT8eSTEM2/66rJ2iHx8iU27nY8YznVaFw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB6218.namprd10.prod.outlook.com (2603:10b6:208:3a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 15:06:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 15:06:07 +0000
Date: Wed, 7 May 2025 16:06:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        LKML <linux-kernel@vger.kernel.org>,
        David Hildenbrand <david@redhat.com>, Baoquan He <bhe@redhat.com>,
        Christoph Hellwig <hch@infradead.org>,
        Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as vmalloc co-maintainer
Message-ID: <08c24a55-ef7a-462f-9296-f3b0374d885a@lucifer.local>
References: <20250507150257.61485-1-urezki@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507150257.61485-1-urezki@gmail.com>
X-ClientProxiedBy: LNXP265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dce00b1-03f2-453d-1f4f-08dd8d78b1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?acYfViB7xhZtLr8h/CS6oH5Bz/LHHY74t53NncrDlA8TviKn2vLpsxdf01eK?=
 =?us-ascii?Q?VcEYVdPE/PcAi4VjeFnr7enpuSAt5Dbz/RwgxpXlom+tGOasMIEqzHpiazHm?=
 =?us-ascii?Q?8AuOuFxp2HVqLXDZK042EaUbiSkya+/cpn03LiScx3pGN8kpLK5qhQUbTetK?=
 =?us-ascii?Q?tLh/n0OXoKfWpHZ9VOb2TMPTZB+GxBQJl43v12J5UtPpaBIJ1bH92qNM8yzV?=
 =?us-ascii?Q?iX1dnAjwvf2ujlLPUa0aDxPTSC6jXYvEE7KveyUcJmpVGM5L+f/j+DkzFqss?=
 =?us-ascii?Q?v9cwVQJkYS13GY5PJBAsEkTopK1+y+Zgcbky3h17tZ5x6fknLUkptwo2uS+M?=
 =?us-ascii?Q?/yAm3/x+D7RatwW79qlKYj+kUio0Dw1Rsh/JeNTuFYwfMvK0tygzWSCBYriM?=
 =?us-ascii?Q?TYkvEPHySjQ9UohIiPUm4co6b12ThgmmUZgV1Mbt93xBzw7hcU3rGKnm+z6Y?=
 =?us-ascii?Q?V4jABq1AkyxZIZcuVsnAzoP0n2AWhBmSsKPLWEVZd4aZIU5RO1W9zyImNAZs?=
 =?us-ascii?Q?lNnjF6WAbn7v7xEoZoWSoLAA4rj5xs7/et2Ay2YSJpMWGUFc5ku4ny8zNHuL?=
 =?us-ascii?Q?UUG4v617rq90VLcGLGOYyZKV4lQmWuGmv+ByYv/6fEl4yE/uaoe+DbecftZN?=
 =?us-ascii?Q?+5o1275A5p8FcinRr9KBi33TAMmqYtv6Ousz0wIOLwV+jgDiKZ6iup525IRl?=
 =?us-ascii?Q?BOrf0Nr9G7quj45RUtmZ15oZa+tKHo5Kbx2PMeLZ8o9PSC8BhGQJf5a8JTND?=
 =?us-ascii?Q?jEnJG4xHpJEE27yIbXOvUpG09sgQQdOhh4gIZZb3sl/+k4ixvcWfUix8BwDj?=
 =?us-ascii?Q?dJMvGelDkUKpeUupncxh5YIAl864iMi9+f0+tyRbsjVL9K4VZIiqeNpVyZNZ?=
 =?us-ascii?Q?CtAz0mtPcR0/n81in0TN7CyzzATP0tpntLxzW5TPNv04cO9hIrPEgADKavlu?=
 =?us-ascii?Q?BSEcgtseLHABQlv+nffpN1KwULXV9BIsBD1PSwB6RAniTZG3nsoopQdWN4wJ?=
 =?us-ascii?Q?JhvGQL3bTp15dbIFAqoXsvJq74s2D+HYgXE84c8ubeDcY8KsMJDrrQWNCpTU?=
 =?us-ascii?Q?6TGbeFWrXGZZ2Qde0JdVSbVg0vy3H4XlgCwLNAjGCZXsnluTZWKkTr4lBwUT?=
 =?us-ascii?Q?9te2ReO/2y25EIRqE/AJe5XcmarqN8kUqMcmvSxc26CT5PZP2u5vWvN3yaaD?=
 =?us-ascii?Q?YMGEoKQ80o/JszL3dm3ye+6jukDNZjZAd21T5gjm4l2JhhbphYf14KNVlV44?=
 =?us-ascii?Q?QRfqJv0x/pSA36xJLZFbtAQLozkqcCaG9hMYOrnMchdE2OurfMWyozCcKf9J?=
 =?us-ascii?Q?KlfB+AkIseKWrnlHB+I7aI359TAtPMiXIr9FckWSVapwL2yexGZGDnzy2o1x?=
 =?us-ascii?Q?xZGfRCI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bvcro96JTIX5l/LNPhqYlDtH00htzdvZD/hAQvwQsr/raj/3mWyPBt7qCf/C?=
 =?us-ascii?Q?eLxEIkJ6NraxDdHLayormxbJ5ES0YJF+mnPOiKobUINNK1JsL7lPvB3awCVm?=
 =?us-ascii?Q?F6eoNlq0kzOjdGwd9ieRnx3ixt+NyktIL0jW/uGIGBuiChCcUzTGLofUZ0nt?=
 =?us-ascii?Q?Rqn+/TTAdmVzk1BKSEnipnwPeaQkj6bpghhFGLEOhiCwrB95D/f7uiCLcdXD?=
 =?us-ascii?Q?MjCC39z0q6ZB7xe1Wy4BCFE96BBQqYcZnuLrSxd8DMSUrgyToNwlG/qGLuu1?=
 =?us-ascii?Q?BMFud7Y7Zvm9aTu0iLqomnFKk2jy/3IQXblddxSfey/4xd4ftLWEA84PLpCZ?=
 =?us-ascii?Q?oP0czDtYHVQvRHpFZxcm5JRN2va3u/0jZ33utD4tjiK70TFfKz3i2eQV9JN0?=
 =?us-ascii?Q?Aj7EPf1hB28Y88SBTDG0VK9JIO7MSjdVnqo2mK7rHMTAeB5fn2LMQCeGqU3s?=
 =?us-ascii?Q?HrOzEl5Mb3/XUbtGCFzR3+GxA71Jkvj7/S9NYBbzn8Fh6nJRVHUgbiJTVGxs?=
 =?us-ascii?Q?wo3dRHyp2QJNNPQ0aLoysPBJHAWhzX47gm1+x56K8j/LgItIp6chUZ5GzDvV?=
 =?us-ascii?Q?3Tnwd3mK5RRj/CD1y4Qi3W+X19ybQQ5tDa8yAwOOeuwbomqa0wvzEcI2BO3t?=
 =?us-ascii?Q?kJGq3sOvgMZbMrIIbxKDydVBDsrJaC5IfYZiGiy+RfUGZKC3IaJYA5WWg8ly?=
 =?us-ascii?Q?ZAiwyr6o0caBWOsSfsceGss1D/ouQF9VNZ6MY6zUd1YVqYiX8yi2aObPHpAY?=
 =?us-ascii?Q?ABDGzopRR9wK9zAiKOw0Eq/09A1oYyEgFT9kqLqI4eL5n7hij7JgxsvAYXaE?=
 =?us-ascii?Q?f3GjgSgxTX3sBDhlpnFXXZwB/I+IlaQkSio1FjmIN7U2oQ/Ms7yMYZ6rYyI4?=
 =?us-ascii?Q?uoXwctw/0aPm7wX/hDEhanjOZ0Hp8ETp4PkXV4JELauiBLvyOcpXRJoYteX4?=
 =?us-ascii?Q?fup+MzRyVnMEiNn5UZswtXHMHM5IOX/634UuzgR2zB/G8PkLu5iJ1EMx9WZE?=
 =?us-ascii?Q?m984M8Khz7nYbrRz0u/iC/QA6jF5eqL7Pl5D6n/laePKrSU6Nd+CtavjpB7F?=
 =?us-ascii?Q?wMCsIPKqPayHAL+MHkbrhL7uMcTicEkLBFuo/eSULg3ANUQQTzl8h1wcINZn?=
 =?us-ascii?Q?qgCYwBjVYMwy1tqR88szHt/FC/4/8dNMOGptmtlDkUm0uT46ae28kw+jN+mm?=
 =?us-ascii?Q?g61qGD7bIey0ImCorul0vTeuWwnWLoKN3tP3cejXW4RJFJupPmseAMvbtVFi?=
 =?us-ascii?Q?odZArH33ylKsffMReEtLLKNl4hYqEtJU6YKrsRNuYN6tcNvFPYJ//k1tQp4c?=
 =?us-ascii?Q?ShMzHWUSYEZ94915Tu8hFfQ2vlsv5xh+mbuLb8CoNdUMOPTmy1D7/Rh+GWGO?=
 =?us-ascii?Q?cDCF35ZxY4lcIVj66KaefOEyH9MJQY2GnoOLT5M65Uc75frlRe8yeTUaGpDW?=
 =?us-ascii?Q?orGW3YdCrE/4YsavN7D+jzQZffb2P9SVYheU8GXVLZuVdzecU+ZGVNNXh/xd?=
 =?us-ascii?Q?Jck4040x0Kv633gnZz80BtryV0ORwLRxNaxOSA1SMh3bglGHFjnfMcuj8+6e?=
 =?us-ascii?Q?lIZPwuYPe+nxxTV9Sy6yBv751F8/Wig6QmMc4lrwY0oTdf9Uq1219smvhbl8?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WbjQDUAovE3/0qT286RkzO5YBUHs/y0GBGM8V2Q30R/2XRCTGNv1C76vXrSnl3A9vxAi8EZjq4YA2OI/JO6Z4Nf0D0xXWxAWfQxI0IovqUVefRDu2i2PofQ4yvJB/JNb+hdoF0Nr+A9Rvv4uIfJWXbKY7pAPsnmpzPXtgYQdEqBsNV35oovvJNQCMgbow0YbikU5dGMws3MilsGMXIdIMnL19C7sBd0TVA/tzyVKRWiq5sSEYFGyMI8HggGa2czszX89ObQm2HC8hiSqFV41HT62e5q7ggk+u5X6JI9L2kiW9KsRHZW0vm7lPr3zhxQ1Mxa5J7lDl9mTz7vc+Bg7572RBFWdmwEjeXtRDHxcNcqWNDqTdortZpodG1uO/WfvHJsUCg4o+zXVS7LFP1TXGDOj6KC0IPi3GQ4yvxf5sUvplNaqkspeXqJy7WNPXu4AO9t+yamMh5YAAVajozn6XK5Ex+yN5o1CXwahbwGXAyMyI4hBE+OnvX3lfsJssS5u/q3LKNA65sD9Ub4fXdH0KaNKSRXmoJipGQUmv4uHPH9zqujfjCVvDsezSHQ5iYHhS80GCMz5Vlnt5jirMQou+7PSQJb5SnQbbVn70yJh7V4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dce00b1-03f2-453d-1f4f-08dd8d78b1a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 15:06:07.3539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfDqXHOpfKIPjyIn128HURR3Ti9XyfWs1FY9XZg7Prc+Xa+mFtY+l39qDRciL16iLd1hluo/MsDM60yFY/RBg5YPv18+dF93HO3kkjTSjNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6218
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_04,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505070141
X-Proofpoint-ORIG-GUID: S2qFpWtsDpJNLgnRSV6-ZA45fDeBDQsJ
X-Proofpoint-GUID: S2qFpWtsDpJNLgnRSV6-ZA45fDeBDQsJ
X-Authority-Analysis: v=2.4 cv=OamYDgTY c=1 sm=1 tr=0 ts=681b76f2 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8 a=37rDS-QxAAAA:8 a=Wl4325gADSm9OP_MGdQA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:14694
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0MiBTYWx0ZWRfX6iPFplP4LQxV TIvZw40Kxgy0OJts9g3rAR3aXAjM6iX7ttTeFTz0elxh9swKghaCEK1EOTYoZJkrc0tYeJGUk9Q vuEBRJjq5y3zLkI4urWO97RrvkyQsz72AC1mpVmGaMS7ZJ7VYgvAomSw0Xv6jgLhKbbwZGv/Yh7
 DwuYtHwloWO5k4Mksc9FkANm+TOtA1H0buvhQGIiEBLHcmGrsCpG71P7ppRq5afqk22uPNfIVZz 7tjNUxzTNeHgIOzKWMZfm+IuRAzKxoou3dy4znb0k5IhoRIxFeRQ8/DCPiM+OkZ0U8lhrK8XjSt Myc24xFWx0JTNpT0j7PQrUoO69PWVLUl9PgDq5ZDZ4fBSxRl0MGlGpDzuR3WEoeGv/zelEYU37C
 Re22FdKNQhEUBDVqwISw9Q2FZs/DORAcdLx9F7CbOc6H6AWyxSKqIyPPwjs3qkQRavVlYVd+

On Wed, May 07, 2025 at 05:02:57PM +0200, Uladzislau Rezki (Sony) wrote:
> I have been working on the vmalloc code for several years,
> contributing to improvements and fixes. Add myself as
> co-maintainer ("M") alongside Andrew Morton.

Thanks for your great work there :)

>
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2c3be5f61314..0aa8db9d0fb52 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25983,7 +25983,7 @@ F:	tools/testing/vsock/
>
>  VMALLOC
>  M:	Andrew Morton <akpm@linux-foundation.org>
> -R:	Uladzislau Rezki <urezki@gmail.com>
> +M:	Uladzislau Rezki <urezki@gmail.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
> --
> 2.39.5
>
