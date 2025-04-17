Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F002135D1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879830; cv=fail; b=ub+q/Qr3l66vGMGT4X5OK3SK5S4ssefHVDrg20PCIoRi9D0WVKVwlAREQtaX3Yq7OhlME1qFVNdEwMPdjUA8PkOl3YxbsHj5jbZtEiTagqYJbIYuKHJD5DYHHDkJD9W/Ho0kCcpcWgzuDnRETr/6eQXvFbuXEyy0LMXBXY1DPTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879830; c=relaxed/simple;
	bh=misB9Lc7n+hl45jHEPWDOlkdVEqC9dQbttUeyq4rXE4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=t2jf6fZwa1+8q3ld6VQd+Rmu4Ofz0ysPOfogQXbz5cG5MxT4jwTU5CtxVyRhrQ9C1vBlKvbd9dz8lUN4JCdMQqV+afChHbjGcsrsgypzdInlOmfhEoXvWSsSQl9M6bOZVoF8k4MTEbq09vs3+fSHvGMBqz8vsA3OKMv+ShEx244=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I9O6H4ry; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VkEYvZjr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I9O6H4ry";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VkEYvZjr"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H8C3TS004124;
	Thu, 17 Apr 2025 08:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=w2DzFj5a3gXBnh/E
	28GV1v+rYw0WAX9NE3dXfW23zEU=; b=I9O6H4ryy9YThReMMUbSD8tqIakLX4W+
	rM51uTA/mZaYq7xFDIvLHKScso2/Vf0FvmiJHziMvQhBhdccPmmgqi5Ayk8coZhf
	JJyd2icNurrUa4hVyvfHubBhzlNQ7+FXNXjEodkjnVoFXqKm1VU0wKt98xJurPD1
	doxvGQvXo4VybsA4Jwomvpi2idkSES3ZZUcJRkz2PhZ5QDI5a4wb623rNeRFq91q
	V5jjrbTrJkE70xkJrBythZFmp4kqpe2veLmewBrIMe9UV6+3ytjMq9EHHoULX9ga
	GpCPHRXVZ8G3+hz+0xQ21DD90yFsf7qsvpdEM2QL7RZN7c0sX+LS9w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4616uf65d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 08:50:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53H8WvV8038885;
	Thu, 17 Apr 2025 08:50:17 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010004.outbound.protection.outlook.com [40.93.10.4])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4u7xw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 08:50:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFHZ4uNZMXanM4o8skWZbIvaieNf33mQVXtyMQeJQpR1Kz1f91QNNXrr2LDmwhP7B6JByp1QII3bWOombRKQ+pjmYN79DrDcq/tfWGOBl1QGh33iOPmao3jNeK8e4QHYf8pz+3Ea3ssWhguuKvWy/jGB7k7uhRg2/wniyHDRUKADjOdoL3fxXLnYVtNKqYig+0JZ10arejD4KeBPjxBOGvjWwnq7KtJsJ2wFdPR18OM4Z/6ghf4Ijk+gd4+KdKILmTiumtp5SGNGE4ofCzSlM0ciA3wMYn3bGsHJ+TBTRCoJ7aWgDvf31BPs+ALb4awUJChmK93otZodchy50oEj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2DzFj5a3gXBnh/E28GV1v+rYw0WAX9NE3dXfW23zEU=;
 b=ooVFu4wdI5nd+g87AQYWwptIlII+oU6BZMOotXQBV/X7dCNbnuMXvRXLpyLSg/7bBSydzm1eZSHgUTXrYjuiHZffwGsLMPZfDQPq9yMOzKbnGckTDP5sLKjmlD0MDImwqb2jUPmMbwu4iDvg6X3D+S8eeeNx5VjVmCQHqOBbDC2JRKgty9RlhWiERMfYZxpEPjqT2wtvn9/vQlGHu5WXvC8vDGiYDnCDtOvCp5L2IcTAuiD6jk3iBNWGPWko+3oQz5F1RfShGYYMrGy5nYNMdKUqy01Fe11Zc40xg23AJfm70x7I66cdsvXE4mnvHdmvd3CEgJht4LgICcUsOcDfhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2DzFj5a3gXBnh/E28GV1v+rYw0WAX9NE3dXfW23zEU=;
 b=VkEYvZjrSP0AhFezEndWQ3MtLBGmY3E9w3Rhbs4MytKXvjnkMNM3tEZKCkrzXCW+8Bd3vp2xusQeyyemEIxfc9G5lAydF1bHx6//BZn6Symj8+ikIX9xnYaL/najzH0PQc2sy94I4hg5xLnMon+xUARJZN1CNnUNlXpM1PuilHk=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by CH3PR10MB7185.namprd10.prod.outlook.com (2603:10b6:610:129::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 08:50:14 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90%6]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 08:50:14 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH] MAINTAINERS: add reverse mapping section
Date: Thu, 17 Apr 2025 09:49:04 +0100
Message-ID: <20250417084904.16806-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|CH3PR10MB7185:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee748b6-867e-4d4d-6f5b-08dd7d8cdea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+wnu2J+d3KMwE2LC6uhbkXd5VKQ3ksOaPXvMsgG5WT+RCYbGeU9ux+XbybPQ?=
 =?us-ascii?Q?lQ1zJsHUl0rlmZhV4gZDEU92aJe91Xuok5ouK8inhPwdqAoijQ4sjb1zjcBX?=
 =?us-ascii?Q?nr0/R0fg2KmXh1vwQUZZqeJ1J/E55S1CExwH06IU3OY5tGP3JqVUXO7rghae?=
 =?us-ascii?Q?GlAEQj1ogv76FZpiE2GSw9NsvhXeMA0JpWfVNxqrd6CyG7QEUCTY1vIeyJFM?=
 =?us-ascii?Q?fAZ0/kfLOI+U3/4spZw/e8W9bUau8vT1RqSehzEs2CQWXCtmZJYal5MT7apW?=
 =?us-ascii?Q?ik0F0hWAqXJCTkNSthI0VYGmvepeqq8yBbyboa1YK5itgbf4OxQDZcvcIj0o?=
 =?us-ascii?Q?Fiqe9WLN3t5rv8LfFZKc8JToHkmimkPGbXXWepW4I6RSrWHb8nC6foOQo847?=
 =?us-ascii?Q?v6h+aDnxLfow7oUzLnR6gbkfGCcd8ohu1hlGu63C3Xfuwr3P96r/fis4nR3J?=
 =?us-ascii?Q?fbNx/l6WrnE4Fk3yNIjgUYSMIu+6wius1faAIfh3zrqi13hpe6Bk58Fuj1Jh?=
 =?us-ascii?Q?ejIfLPSrjFEqHWvjf5Ifbs2hnntxQB/nR4PlnCJSJD/MatqZFDyPj9hg8ulL?=
 =?us-ascii?Q?XkqcHqf0A3Dj5xfF+iNTQ3kour1V8tNKta5AfmEgM11cdcf9IZ4y5EMXtEac?=
 =?us-ascii?Q?fp3Ng6OWE7gZFWxw0pc57X840q2A3tn5Lc7e9jlsfswt3qbQtA3uOZAccnB/?=
 =?us-ascii?Q?xbRkGdNznkUSQvzUKasR/K0vObR7fRX3zV1nrAhkTuV/BHnT7Aa0wegUmL4m?=
 =?us-ascii?Q?FR/SxzPt7KW3NbbmmABsJX22E9QMAT+E4xdkt7t17yMeye8pjkBXdvK0F1cU?=
 =?us-ascii?Q?e3nN6JDyf7rkK1rN/rK2KLlatrCfU+piUdnhQ0A3tN0D0FM7moP1Wo0vqk7M?=
 =?us-ascii?Q?am7tstQsSUDYVijqx+wiIpjZKypG7kS+VI+Zkwbm16NtJ+K0CDWncTuBlCGw?=
 =?us-ascii?Q?VajDp4AZElYWR8JzJV7VN0yhD18JBaYtCUBGaHfGGSRYR+eyzqZnFxpCYafA?=
 =?us-ascii?Q?AUb6/gJau5W0uJLeyB7eMJj9n1P51fbG2X7QZpOGVsnH4dg8x+XVTR2EW9c2?=
 =?us-ascii?Q?eDejl+LC0Dc1BBwXKQ9mQol/aBZ50rQRVsH7kN0pPJA4sxku0A6Y03Baup4G?=
 =?us-ascii?Q?UZrd1dJtCFENsREqM2RMk50+LZx5GvXKnRvqASLLC7MFi1Z4Fl/JlNnT7Qns?=
 =?us-ascii?Q?MrHlvPrHiMJu+SU7aThsjw/w6nbjfcMd5UpqPOBKAfw2V29r2iOJ2mnQYTVf?=
 =?us-ascii?Q?pDsyWtipYmS3OqNtV/eBly36I2UGmjzcZXvoGRxST+3QodlqU3NZfekQvQRX?=
 =?us-ascii?Q?wwNPO9UFG/8l8yOxfTTEyPmDFHIcCdlwRYpxFoV/3kTSkvM81liHvNsf/0oi?=
 =?us-ascii?Q?+RQUvXC/Nq9NmRIHCoWi9WvsDnvepjZ9ucYfwEWhaECnzIjCPdvMhkE1zuyT?=
 =?us-ascii?Q?yQ2NEj+PNhk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB8215.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mouhVKatsQ6GjI3n58UxGocYvMJZe7GgZF0v6S+0R1ZsAtgSjW2b7bxGATDc?=
 =?us-ascii?Q?SC7FX6lK/F9ESByn7oh8x/hg6J4pBxrOHwqp4vKYflJqGzuIuenW8QIish+W?=
 =?us-ascii?Q?ricHLEWWmwE4yW96rK8cdGOYtoziyehoFVaJgCahsj7PQMH2UZw7ktOrXGtc?=
 =?us-ascii?Q?kO/hTK9/LUz32GQg64bGxi3vK4HkM9XI3HlwqU85j9pcrDFrQBw8F5tK5Chs?=
 =?us-ascii?Q?pu6gkdYUfN/SOXSabQcV8DuiPTGCq+80YpJbnAM/bQGmQ6B0onWCS7+u6yqo?=
 =?us-ascii?Q?ef+gYFR77sMtQM+gH9hM31Au3rqIYkIEeW9hKXh33ApiYdjVHqXItGJLJHkH?=
 =?us-ascii?Q?qGQobzeZBvgObRWbMnWB8bFUDfwcWSi7SNpm0UVhjh6RVkXezDcqh+JKKLA+?=
 =?us-ascii?Q?y0xCNy/gVf4NyENh9J23kICtfzAWpP5LFqxuCw4a/rUDTJYU4HdMo75zSfoI?=
 =?us-ascii?Q?YB+azcjKND5UtU82wYP5UiNLpQvPNZ1BEyZuxx7sajRE4w61Nnb4Zwrdx08o?=
 =?us-ascii?Q?BhKYEJgQQ/izjMtklzU1750gJBYow7jZi4gk/EGUJG6XtLbP8izdZek0bs0D?=
 =?us-ascii?Q?1O1QgafQc5PWN8m7RMThi2xb6sJKXNASZQbLtlzHkw8aNZUl5f2D+RycgINe?=
 =?us-ascii?Q?qCmXwzlmc4wFtPZQ+zd5fYbRvolDcSad1m3RAlIT/+VcTrKlrk6QXFDxDqsm?=
 =?us-ascii?Q?OGOv4U7AM2XhquruII/BnP1RSqTdCTSpc7I3FHM7BhBR1DDQ2m5+L3VEiJny?=
 =?us-ascii?Q?YPIjGz1SsoyJ8UBL5qXSn4lHjZfeWFlbDQ5wpDAhDD6S6uVC8B8RfmzDqtUr?=
 =?us-ascii?Q?7WLYLzTois8J5VsGF0y+jXFxA7v5JA33IAW5j8RFStcN9afMPtR1TSmISANQ?=
 =?us-ascii?Q?5Y8N1d28onE9freJUUHocCP4GQYRb1RpeAL3/ttRsAY249Ycw2PlOhy3y+Ex?=
 =?us-ascii?Q?V1p2mqJN/s3RblVDqUZbc+XezOLkVSwISGzQxHe0nShHmplfuj+d0IHc9Ejl?=
 =?us-ascii?Q?yMq68qgUqTf1Q9fzCo/WAnlhm7W0A5m7pkBaspNQLvrufnBA1nnXDaOeZSWI?=
 =?us-ascii?Q?yC8vNgl0vuBWVgzazjODlC6c3XuFJ+BQA9BKwPs3BGkcm9NHoqzdXygMlv3g?=
 =?us-ascii?Q?3O7DZtVmW3Gqe8uIfMjfsQEcEEHsyKWAw1h+Iw7sCSukNwbkM+1d4Zs8d+WB?=
 =?us-ascii?Q?JH4U0HTC7hP3k3Db5obYSwf3GPn09HVkZDpLMc+hzLFxPFgC0/yCl8aTdQvB?=
 =?us-ascii?Q?5eVQBRDoVkVLLsl3EXwtFmWHyUc8kv3qDLbL/4ChwvMR6m188sstvcmI7Zqm?=
 =?us-ascii?Q?6F6xwQOhf99WbDabDarlDgAHXIpHxoySBqJS/lP2vKgvXhEFgjlYL3b4Q2rY?=
 =?us-ascii?Q?UkSUcrCvLoPGf9ENsxTDyavbYKNZgU9FQCq5QKuqopm/MqHIgG82uzTQqKwB?=
 =?us-ascii?Q?wGqtcuB4OWx3EgvwsR+MLlfDF4A7R63xNgeF3ON+UFJMXdr+G5dCC80KpW1A?=
 =?us-ascii?Q?dezCI1VpqffaJzryYBy4ExSC0oSX5fSkBCUvHDx/ix6VWV2gPN3VUtJvAY9E?=
 =?us-ascii?Q?NuMjj3VaJ40XUTY1AtwLNhiSV8XzKqic2dP/O6uJ0V4oybQqlm98APVDpvbp?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VbB0UBBJX8iwe2A5XdS0OMs7Uyj99lRjMwslJurA4sZhjNR9WtJCVjeD+UzSYFe8TGxpDKZ/hg0yjmlAv0R2bGd7chnq7ow3sw4GKb0NF0tM5stKviiiAbei0mvd1cYiUN7x4QFJQeEy0Qamf1VktTnJRv3Lr47hMvRPKuBenUjXRNdAekXRupJ/7uXs1PXOSrmTVJjU2aGWedKAZsfuXxTD4MOtTFEXNikiIgpFLKZUR77PB9FbqZuEcDxcFm2ckjGkuPwQo4uHqMB46DUWCsKR/YbiErj1lVNIE1JVPWNFR5S2L3ITcIFaXrDgbiMQ/WcX/At53zUiTqIOQo++ld6Ok9CLrcRkdiyWIv4fo5KeBVvSrWrerCLfw1a8pRO3dCPXlaJiBB6y0uwpn7nOJczLYm3N2Afjp9G+jNDfT5wZtsj2P/LgOvLIkSTYN1S6K/4MWk2kFauupbAp3OsLCPj0u38vFl0duGMkzmk4ApxFRbMUou3TKFWnNj+sr2IdzYU1pvSWoCyKi6ZtAGgxXOAM0bocuNQxhfRE5zpFv/bmQZ/AFoLZ77RyDx379I9OWdBNn4A3qxbaIGR8VSPzjzkf/P4G8sP9caFCV423oJo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee748b6-867e-4d4d-6f5b-08dd7d8cdea0
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:50:14.4407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GarENm0GCz/FrC6q+2pxqf9iPGrzTtWiVXHM5EhGsrr8HQCs9B7ByTNa4sbWYJ83V/gQ4Mpt5c3kkWjcacjOmC3Up2ZuFjgHvb0hOMibQRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7185
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504170068
X-Proofpoint-GUID: ljwUvFYm4K8k9jtzQwylvFVlHlVmwRgP
X-Proofpoint-ORIG-GUID: ljwUvFYm4K8k9jtzQwylvFVlHlVmwRgP

Separate out the reverse mapping part of memory management and assign
appropriate maintainers and reviewers.

David has long been invovled in work with the reverse mapping and continues
to do so, so is well suited to maintain this area of the kernel.

I have a lot of experience working with the anonymous reverse mapping and
continue to work in this area, and also have good knowledge of the walking
code and code related to VMAs.

This helps people identify who to ask for help, and also additionally makes
life easier in review.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d834514a047..4f6d09c3fd9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15499,7 +15499,6 @@ F:	include/linux/mm_*.h
 F:	include/linux/mmzone.h
 F:	include/linux/mmu_notifier.h
 F:	include/linux/pagewalk.h
-F:	include/linux/rmap.h
 F:	include/trace/events/ksm.h
 F:	mm/
 F:	tools/mm/
@@ -15539,6 +15538,18 @@ F:	mm/page_alloc.c
 F:	include/linux/gfp.h
 F:	include/linux/compaction.h

+MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@redhat.com>
+M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+R:	Liam R. Howlett <Liam.Howlett@oracle.com>
+R:	Vlastimil Babka <vbabka@suse.cz>
+R:	Harry Yoo <harry.yoo@oracle.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	include/linux/rmap.h
+F:	mm/rmap.c
+
 MEMORY MANAGEMENT - SECRETMEM
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Mike Rapoport <rppt@kernel.org>
--
2.49.0
