Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E643514B945
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744604434; cv=fail; b=axINS7o7LgGX3+jNN3fpv41poKcy1ATy8ForyVM5jsjk3t1mrX3PNDJzz7RcEmx/OsRt7OLawdniqa0AWMt2vpmHqXHrAC8OmDoi12M0dg6QgfmNqvd5d00rG8zzJ14yhPqqzEH+NCngEQajxhRxju96wOjNIOAugBO5KywYPKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744604434; c=relaxed/simple;
	bh=DTYYWXsBZgbyTRcxISdcfG84AvxH0MzRb65RgqF5tsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gpjIII+JsBX1mraBAkPvFpIHjnXANv+w61yRQUl6elvjJDw1FiNqo2Y5UcoNuA3HafgXHUNJ4av65BrlAsC5MeZbMG2HnHqf8mSO4SvrMMaZxcgdvyxB3Q975hh5bviIhwSB6qahcDPuR402yQ5K8Gpbn9kzEQEyuJdxbb+Rtzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cJ+48OTb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vZ9cUUFx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cJ+48OTb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vZ9cUUFx"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E3bnSB007627;
	Mon, 14 Apr 2025 03:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=u9P3VpLIvdp+NSb70dIKhiVvV1dVwGDeX3t3RWLaGjs=; b=
	cJ+48OTbBWbtocjQ+mWKg2lWXX2UzDzZzSQi6a6Hqe9n3/doQPCEaBY5EHUBYwOR
	++cT4bEj3UbXXdSWlBAmxOm2gp1P+HhqsifwSjMdnBsB2vnTq59zHwCxsbo+b7jE
	vaMu05dm1jyb56CXH1e67J8EjEAtt70yY1ndHdGm2++DymiXQWZiMU5OKbnjgXyI
	AlwPSSsv+VZCsQUttzx1m0cwWFkPFplGvX/ar85fmcZ1KgCHayA3kjBHKoB3iHiE
	Wv96N1EA+np6FR8+xf9TrsR2BzRzFBhSNqPLvqgmnPiuiihXwDCcf4ypucwqLUWL
	llDFu4CXNC23ZiJZJp+BMA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 460tm28079-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 03:46:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53E3bADv038784;
	Mon, 14 Apr 2025 03:46:17 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010002.outbound.protection.outlook.com [40.93.1.2])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4p6fw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 03:46:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/hV5lD5nb9KfzWOkE1J4SuyOkwyYyG8zPvYgMeLA4JGFuw3nRcADsTL/wV7vCEwXYLFwN95LPcWqn+bhlJQlAKZInu6McmtI/VYAYsRtYUVujvv7BOQgNQ1xd0DWd9MNRYLefH++TriKQOSWe7IRFGzolGXZHwxZEOSv8GzG+eHb7UzSKKfXt42tVp1qop7buoowybXCzQ7AK3wAx3pYpCXIp0J/qKP/RMUUSm4qccgKPEpeAYOBWX/GsB7HeFIWA27wbnF7C6vcerPPlp7H84Gixqo4D3h9Kl3GceBR3oT73UboNqAbV1hZt4gfrp+tAmLpIThkBbwZFutZRZBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9P3VpLIvdp+NSb70dIKhiVvV1dVwGDeX3t3RWLaGjs=;
 b=tu9XXATBZyWtjb5uPKRjvIJweqiwXm+CrlEcoI8dcZggES9QG5AK8S+nTZ8lCEfxqoa+jiuiSofhsgrTsfN36wVivwtitlLd4lyEKbNF21jNK9R4L6XL7PxODMg/NayxmvZBXtMbtg0U1O/6xvdkMR6y+GViT+Wsvn9CGJ5cGt73swNYIAxBYdGnYBI7tSO4jC69QzV/kn0s1CE04sh8+e1mxAWKFbW++3/JRwAOTHJqCeSFrnt1N7RZvrqlC0PU6acNwZuWYVqrTzkJnuSig9aIlI8AZCapB8RN2Ld1utx/WW5X2wIEFQPABPiX+ORhrsqnCkv+zUl26U+qdk23GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9P3VpLIvdp+NSb70dIKhiVvV1dVwGDeX3t3RWLaGjs=;
 b=vZ9cUUFxtoPR2vj4NvUhr/rtkc/UelCi1SlyormO3sKtGx2gR6z50hRI/vyw5ul1Shv0/jttlIUULWfv29OYPS5A1M6nGjRBE09VSS/8H2bIWHv6UyRmPvgfqD8Il8PwEKdo7nB+1bSSIz83X1//f+EJ7t8U8TBZ6E4JsXpB85g=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by DS4PPFDB583D803.namprd10.prod.outlook.com (2603:10b6:f:fc00::d50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 03:46:14 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:46:14 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
        rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
        jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
        ankur.a.arora@oracle.com
Subject: [PATCH v3 3/4] huge_page: allow arch override for folio_zero_user()
Date: Sun, 13 Apr 2025 20:46:06 -0700
Message-Id: <20250414034607.762653-4-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250414034607.762653-1-ankur.a.arora@oracle.com>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0360.namprd04.prod.outlook.com
 (2603:10b6:303:8a::35) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|DS4PPFDB583D803:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3fd167-6a40-4b0c-1e11-08dd7b06e7f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s5au/PX662NJWAMp2e9APYavoAzfzZB4foB5+U6xDCe1YCa3sngr6UgRNnhM?=
 =?us-ascii?Q?dqI0KzyegPNjvh5NbSU+i8nJZskF54O3tXmewJels5A4dFwHC2gy/JFbpqOA?=
 =?us-ascii?Q?zEOrgvBLL2i6GLwXBO7mj7XPGcCxsAsmPEV2BQtGrNEft7rMYIhAkhJPLxZq?=
 =?us-ascii?Q?AEXbBpL0I6Yg4ePvIBpTShVL9kXCEgWLclY88qaja9ER8GHa2MgZSjjAt+9Y?=
 =?us-ascii?Q?1WpheKsC3AKH3qz8FG+Jcb2A+6vwucQ9uczWg6G5uekgQPqYngs9WyNkDViL?=
 =?us-ascii?Q?2Q4d9ZNjnrvt/sI7ZtuGSqZz75xk+LXuL9NSvYrhN5DDPWvS7OGpUGBdvbfa?=
 =?us-ascii?Q?BBH4RX2IwV2fE1Etk+TLr5ac1wntMmEhAwsYyKAmkkFNwGpkDozqq8rrPink?=
 =?us-ascii?Q?EaITeUNETvEYd56kNIXe/ZuEImHH5Ndq9FSSsXJDjUJCyLAcU7rNc6J/JqbE?=
 =?us-ascii?Q?9hUbcRFyTaey11bnBAa0kJL2Ot3BPyRboAMneLZLptPY3EBxeTC3eeJCxxZo?=
 =?us-ascii?Q?mYMAdNyUO1+WaLDptNvjxa4elLv/wlIRNft0cYJSUzFpu1qYaeJ2AFaBmHcc?=
 =?us-ascii?Q?SK4YlKZklTATJpCw6kDEsqn2s+yj9ghUibD3AOZuLRp+vNC17VGBaZUuZ1XM?=
 =?us-ascii?Q?dT2deAHgBK2n8EJdwEwIIsHD+qSQEmgBpGWXjSJyRaGR2mf/O5qew3+Pp/3L?=
 =?us-ascii?Q?EMh3CEAmkmZDs+cGGnLVZBl3hBY92PS8upvlg9WHoEQxgPv7ZqQbJAa5J6KR?=
 =?us-ascii?Q?8SH9GLhAKY1Je4jLx+ehyMkDtk9BudQBCGAz78Lt0T4WdeM8E20WW2JGL6xW?=
 =?us-ascii?Q?dVZ+tYLKPKDJ5nA7xJClRyfy6bo5rrmWla6LxoT2WC8coxoqIGSkqy6yPGdA?=
 =?us-ascii?Q?PhiyeeMEX+CWjd4a6DN0RdqFx9sk5gFjGht4dBazuqb1LHI3XGUKOlANzLdb?=
 =?us-ascii?Q?28yRPxhqbkUDdkGoZKsbJijTMmfo68Yy4Ht0r5puHG5KrFutH8JihKDXrlKM?=
 =?us-ascii?Q?sepNh6zjVjWoK40njn268dxzPMQ6113FjQo/PB5lt72XzwV6Sb9NQuMUNkoO?=
 =?us-ascii?Q?lw92VoVT6J2feWSlBfG7CX8ZOSfrmEcPUrFHk3/RdRWsC/2GE93xQiXUVwoS?=
 =?us-ascii?Q?SrtHWKVG6buRfAUzhp0RAHCzfS2pndRn1gu0Ilmpd/j/E8z7b2V+mSiQcDpk?=
 =?us-ascii?Q?A17GCTx8J8wh7anxRqruowC/r4Zi3yew7CjqU+Z74BpxhQK4FHNI9GmtrYuH?=
 =?us-ascii?Q?BgNOSS7NVESDe6y5ji1r5AxoR28Wz2i6WPhY+81gMY7fdGswiuX44B9VmBJ5?=
 =?us-ascii?Q?wpzPY99iwR3YlS6qNC4tzaBJ8oeZqQYnnCgdD4+wNN39u6TLQLv67eCvIYR5?=
 =?us-ascii?Q?FDiBqzTjzV1raKNI3GxoOs+pST9cRCKoyRf7Ye/LX7ubWTSWDl+94KYWDPXy?=
 =?us-ascii?Q?zXKR67VOgDU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QMUDcZdUwgCup14Ej7pnU36bgHMFUNZzdHpfOZpQlRiWD8Jvb0TRJoB3Ke0z?=
 =?us-ascii?Q?R/5tapaNHmZIrDYRqWuf94DmnX4T7m8wi4MShtMeoP07bWr0eEh/PjT07oWy?=
 =?us-ascii?Q?ZbctuS1ZSkmkNIRuAhOZRcpxI1nLaWwKZrq6ocQLEI9QeE9YlOyMqyd/8ffQ?=
 =?us-ascii?Q?NKaF9gjWd4kz8RtPK2PvjHxSw4YODoHE+H0hd3J69397dO3Vm5ymJK91H4l/?=
 =?us-ascii?Q?X6vvMZrIvBTIFG8jLRXF+cC4fmgice6YctCQf3QZHe61txGx462ukxQHQzSH?=
 =?us-ascii?Q?Om8p4eF+c+oVJhD8xA9eYSz6yjhlhkuItosX+EZwc6QF8WhUqhjrBwPlHMy4?=
 =?us-ascii?Q?0ngPA0bsDIwYJbGgmrXyK9p4JXTIOT1MQ7dyQM2UDOsFadQiF4hp5t4a9gRI?=
 =?us-ascii?Q?yMPZud5zWAmCc0NqpYD6i5GmxTqJdGrOiGvxIcPY5BMvmVdboUxO/mnQZkvq?=
 =?us-ascii?Q?uXr74d8C5txBDyUhIX/gbOjXr6SZtG/Dtl4mtWV6NGMH+Fai7n6wSq8fFjYi?=
 =?us-ascii?Q?rMGf0/7t5Am9pRq/jEn3BZlk+2wQqLwShtcWHsV95U7gXXBQnKJckvHFHfa5?=
 =?us-ascii?Q?BC3sZO3bBYVKePYmW/5fllxDMaAsbP7KALMULHwKlFPBbeciD72RmAGft1xa?=
 =?us-ascii?Q?mGyxqFB/CTPAXWywU+qmqaDgC7cz5Or5NSj+vVQgk/AQVfpu5nz9fFFiJO9F?=
 =?us-ascii?Q?YsWSckwDk0lZiB/zmTqDKWMZZ+G5sS4qWwFJYXrZPqYUW7fqSgTReFR/Zq7J?=
 =?us-ascii?Q?gg0h+9c1JVybD8aUbJ4gi+Sfe5BKowf1iI83TCuaQ1HRSststeKgLlTdco9b?=
 =?us-ascii?Q?awGK/uaKbVLkD3t2NLhZ4E86WDgPEBW7mi5zi09S/PzLqRa5e+GnGSbwzuUB?=
 =?us-ascii?Q?xOCkhe2GPbnk5CgrvRfWFQFp6z09TI9NJprYu6v+ZneitF3ixX/LaIl7h2Q2?=
 =?us-ascii?Q?xoZRPeGkGYMjyn0ovuDMkEeHyiBRTZZ/7pO7xd1jy0T8HqqHPy5bhDMifvyM?=
 =?us-ascii?Q?BB4IR+VXdcTpvu7lveW8AB68xIt8FmN97c1uPPgNg711p1HgqinUNfOOo6Uy?=
 =?us-ascii?Q?BABaJHgjCZHT60r1n5WmNmFvoWaXoG5ex97o2PWErlymsgEZB5JpZFdy8o34?=
 =?us-ascii?Q?6QICB+qwESu/Y+MAcvnZDIrvVoTN+FFwTNZY2v9Y1/45FEag4cbsXUhjAi9A?=
 =?us-ascii?Q?vYzlr1dngN8wsovVzZ/6Kq0vajolUqlVJEILdPTe8YSgCnjUQWo7kxJlj0lW?=
 =?us-ascii?Q?JLMc7J206f7rulx9T3kFpxdyYvyklH10qweS5GNdpsFMSYfF7J2+t8h9Oiiy?=
 =?us-ascii?Q?YKJKiQdNXMolGzHjpmjcI7xc4BAC08TcDGGmOBsDoMg2HmzuqnYclBzvqdcw?=
 =?us-ascii?Q?MLVOOzl9/EtdkeyOP/rdtKC8+CGIvt60WpQjDGJOOdNom+RmMuBZSu+L6MMK?=
 =?us-ascii?Q?YVAQIQxjZpj1jktuzfOBI/2hxVxXQO3NOr7WRydu0DNqAueSaDJs+BXzKSeM?=
 =?us-ascii?Q?2srU8c3Wws8LhoQo563bPPbQu/3YJzl3lneq2SvvZtWgFfdn3QjAORibDYgA?=
 =?us-ascii?Q?XdgdLdEqvwgsLX1Cc2WWrBLUCXQyEy/SPxnCUvhKbpVelCztilfyiK4BRNvF?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t+dRBiyBM8Q870hwtlLyjXueWRR7o8NK9Vuj3Hr6BQ2vyUojWLfxVAnUvXnugNIJUGNrEkga8prodaFdNtu9M/qKpweDqeY8M9VZ3bwdJ72WKMbf+hML04CXRY3BdoqItAxbTQqIuILLybFmcJrhWATkM7MZiOHvJkUAQoXyJHGJA/iNLRsign7ABzsMlXQtRoYWYe2iRsbDS3HXoXcm0W5lXGs5keWLOrkUkPF1QSYSvXzuuLCSM0jbMeFDCGifZ2Il/xa/+kbHg4tdctdZyj70xvxlgfsgELDSAxw5K6gE+4gnW6qzv0493gMUoxH7XXsPGEZpucHG1OINIiHFGJXEJ87yESDwpWkRHApf2WP7aD6D4xVNuWunCM3wbU3oMGsCEwuvYc7JCIdEla3lDkH0VHD8MdcP7+SH4CGc52/kOwssqWNexUFrrShqEMla8DD3OlJ+6SFjM00+4VsQt6PqROvbznND7z/OQe5/LEPizpU9ZGjxJ0/DRwYOhkCWrAy7qZURdCG5rjvFHvoVQHEF9bDpLSE64G3nNyB3DK5Y9QqUuNsG1pQCr8vRjKQPub1nmxJp8VCVJFvufHgjCCXnqOq/goJWZO04zirTcrQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3fd167-6a40-4b0c-1e11-08dd7b06e7f0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:46:14.8770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bU4gXNVzG/GowSFa7H1OFHyXbgeuIP9Eghq7rrdFPHYJS3fLdcakeuneCMGESPRQTDEpZjezCeSJyIRvGJNs9+yY2SR0w06Zz5Kp5zcg5d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB583D803
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504140026
X-Proofpoint-ORIG-GUID: RudJO8jlJ9QWLlvv5h5ga7DrfUtBWKCO
X-Proofpoint-GUID: RudJO8jlJ9QWLlvv5h5ga7DrfUtBWKCO

folio_zero_user() is constrained to operate in a page-at-a-time fashion
because it needs to handle the CONFIG_HIGHMEM case. Additionally,
cooperative preemption models (none, voluntary) need regular
invocations of cond_resched() which limits the chunk size when zeroing.

Move the page-at-a-time handling to __folio_zero_user(). And allow an
architecture specific override. Note that when running under
CONFIG_PREEMPT_DYNAMIC, we could switch between cooperative and
preemptible models at runtime, falling back to __folio_zero_user() in
the first case.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 mm/memory.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 2d8c265fc7d6..ac6a19d7bdf4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7235,6 +7235,32 @@ static int clear_subpage(unsigned long addr, int idx, void *arg)
 	return 0;
 }
 
+/*
+ * __folio_zero_user - page-at-a-time zeroing.
+ *
+ * Handle cases where we have nothing better available. This could be
+ * for a few reasons:
+ *
+ *   - the architecture does not support multi-page zeroing (no override
+ *     for folio_zero_user_preemptible()): because there might be no
+ *     optimized zeroing primitive, or because CONFIG_HIGHMEM is supported.
+ *
+ *   - !preempt_model_preemptible(): need to call cond_resched()
+ *     periodically to provide reasonable latency.
+ */
+static void __folio_zero_user(struct folio *folio, unsigned long addr_hint)
+{
+	unsigned int nr_pages = folio_nr_pages(folio);
+
+	if (unlikely(nr_pages > MAX_ORDER_NR_PAGES))
+		clear_gigantic_page(folio, addr_hint, nr_pages);
+	else
+		process_huge_page(addr_hint, nr_pages, clear_subpage, folio);
+}
+
+void __weak folio_zero_user_preemptible(struct folio *, unsigned long)
+	__alias(__folio_zero_user);
+
 /**
  * folio_zero_user - Zero a folio which will be mapped to userspace.
  * @folio: The folio to zero.
@@ -7242,12 +7268,14 @@ static int clear_subpage(unsigned long addr, int idx, void *arg)
  */
 void folio_zero_user(struct folio *folio, unsigned long addr_hint)
 {
-	unsigned int nr_pages = folio_nr_pages(folio);
-
-	if (unlikely(nr_pages > MAX_ORDER_NR_PAGES))
-		clear_gigantic_page(folio, addr_hint, nr_pages);
+	/*
+	 * Use the arch optimized version if we are preemptible and can
+	 * do zeroing of extended extents without worrying about latency.
+	 */
+	if (preempt_model_preemptible())
+		folio_zero_user_preemptible(folio, addr_hint);
 	else
-		process_huge_page(addr_hint, nr_pages, clear_subpage, folio);
+		__folio_zero_user(folio, addr_hint);
 }
 
 static int copy_user_gigantic_page(struct folio *dst, struct folio *src,
-- 
2.31.1

