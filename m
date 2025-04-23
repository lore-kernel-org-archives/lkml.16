Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267C7182
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413051; cv=fail; b=BxV04lYNjLQT3HKFcf8U6cDn+z6/Kuq6gj1tw9pompx5LD37qgN5IGiw8XLNEVQ+qRqTi8Cy/0UvRKi1dhKjwZ9QcxEv33CyyO1dkDm5YyB4id8bV3RfM6bAGIhV2ATuD3U7RqYpyXyyQsySFjMUY50KxCNOOdBQYqZ5Z6vLpZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413051; c=relaxed/simple;
	bh=tJH2/St+HocN8YPiFTu+H3h8CYkZ/mq/i55Wl+/ws/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QpLWItrTdrqzoGkX6S53Yjq/4jp6Qq963jeedAKszhhFhCOTYkZalaS3a9uIVxtAqbl8WJsDisO7hj+ps1kRE4eyJ0/x5tDoAPlYnkc667evCG1+iwcHozelIpq/CCi2FG6QsNTjmOMoUdS49LODSEGAYJPpxPm4J20WmozjK2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lFpgjEXJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XaLO8QdR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lFpgjEXJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XaLO8QdR"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N8fmRX020713;
	Wed, 23 Apr 2025 12:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=jSHyIl0TaMpFUSUJM8
	r9yPwp+faOMa7xn5x8XdAnerE=; b=lFpgjEXJ7tOdNLiJ7vOmYzH3NKILYw/qqC
	5uaMMqvMTRn3EC1dVRpLyufP7Qy1X42U+28R7Rohw9byQ2WW0bLCmmpg3fI5UVAr
	Xzmqej4ZaHq1XhLzEtz5MSDAf/RqOZBcFicbWn+yAPD1UTHQgvRfmgHNf5szwG7O
	MhL7gzI3t5Rk45RoSB/84VfaQ80OOjoUlImzmOfiTV77/jUyLdoUWYk9mjUlzfSQ
	mr3XBBjtUd30nMvSldW5SbteDm5SLQeYTsQFdvTLIKibrPxiSSrwN4x6eTIeCL/V
	k246v2xRNFeOlSeDfxilejldwRshpYvUo2sXSJDa6T63m3gMYzcQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 466jhdh658-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 12:57:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBrFEJ025126;
	Wed, 23 Apr 2025 12:57:14 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012054.outbound.protection.outlook.com [40.93.20.54])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 466jbqkjv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 12:57:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ku/O+eQVUqBLifsb/j9ZOzSBPX2DLEIQT5aDrJ2LgBx6Huk5C9YkYy6puvqKDk+HuJRWAfX1/67u1l5E0DM3cPZCCBH74ymfx4U8gUdGeL2l5hZb7qEVhzdeCpERGxemPScR3yAPdNlEYMw55u7KT1nfnDIyWxowGFGxIZrluIwfcNmMuJ9EulWXCSsOWXfZqZIOPjfqGepnGb9tv5fdR1JYw59vYE8OWzTnGo4IFa81ghlqpi36bJxEXm+23XjHva8dwr7r3yxHMvjgoD5/Cartm1DxSXanldW7K2g2jem4zpfcFAG2oduSzd3U0Bh8AkYhwtt9mZTSfj7V3UZOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSHyIl0TaMpFUSUJM8r9yPwp+faOMa7xn5x8XdAnerE=;
 b=V+aOw1MDMQ+3efylIV8Ku7c/0iaQffD3UZmGEwNLVh5vQxw0aGmmMWU6hSm/oaHekydYM9mj4ZhX537tkEzD7fttDUeqbunA3Xis3AqBb/LrUvNN6JZwmcqcBxrazw9YhxOFpvcfzGQZUV1ZLl7w8+/I88Ix9F/I8JLMc3NnRpmAb2xvwI52EFc/QuUaej2k4XB8qcLyOlmoR/npQoWCmnA9GW1FnoxHB7LYD79D97LRIet9TAy6+xGe+rxN7PTX6WzseXK+X+QUrIFBDfw2C0knR5FBxYBZLG8ROORNoplW+6KxBEfDnXvQgEsgDlGApDr94gQ0FCdtmZ/av0G31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSHyIl0TaMpFUSUJM8r9yPwp+faOMa7xn5x8XdAnerE=;
 b=XaLO8QdRdXqekluVuD6W6ejf96dHi7NAoVWYl5NWIcZ750ORQ/Ob6jwlZjm31NfnPYsBfe0CZYPzVZxWhSmkAbZY7ynLFwOLCunFFmLhKfpRtULhosjO5STqvSXUJBRSxreqrbB2SqQCGtG3wO/CYJ4i2z3GKjlqhFvTlw5ebA8=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH0PR10MB5705.namprd10.prod.outlook.com (2603:10b6:510:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Wed, 23 Apr
 2025 12:57:11 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8655.031; Wed, 23 Apr 2025
 12:57:11 +0000
Date: Wed, 23 Apr 2025 08:57:08 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add core mm section
Message-ID: <e2a6m7tkhuyp7qv3zke7hf7dvdpmysxc2ulypfdujb4cq3jhve@qtxvwym5sbrh>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250423123042.59082-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423123042.59082-1-lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0226.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::19) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH0PR10MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1837e5-c414-4fcd-8f76-08dd82665cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?74Kc5P4hqLuSPe4kZxtmrsXAgE3T7MOJnz9SdEk3Rnm7WbVGO63yWB564p4F?=
 =?us-ascii?Q?x3oERId8jMsf8zf/ofS0WcQs8k3cyYV/+4kNHvRu8HlSTmrtj+6TIJzaGJm5?=
 =?us-ascii?Q?ma8rBchNMTB1z3nEidRzrk9Ov2tmkTEazQyBqnTGYcx1tA3n1Xt2+4jylmrh?=
 =?us-ascii?Q?NXskl/sEgcMy9cLVfXf6ifmkBSkaJpZY4xCL1Z8FDwXwvRM1HHeGe+a0PaUr?=
 =?us-ascii?Q?8uBemvtSYvpTGqXB/rbsRbQN4w+lt1WJTqkrnu1GZtEM+PELoMAv0of6Lf63?=
 =?us-ascii?Q?OWj0teF5eBvV1S4rPEPh70KKNT3aZieZ48wbI2R4eR6b0vOh74zXuxY/rywv?=
 =?us-ascii?Q?UUi1Xq4m1+FlAMf3BQcCLo3bde74I/fdSJT8Qxkwux1GPwzHegKOXDLbx/Ma?=
 =?us-ascii?Q?voEaMTw8BAvj8rr92TD78r8LFyjKQklT4Uhv+vDgVbJpAe7R/JaEK0j9rOIU?=
 =?us-ascii?Q?jM6Pvbzikl09VFpiVg6JW4ZJ/57ZmhOlyFL7qKmif877qH+gmQ9WFgOkqoPN?=
 =?us-ascii?Q?+uxIZZ4lLtYZg4ZCMEhQjQBmqzM3jlb5PD1klxtrYfEe/ZrGgEFJZHS6IEzM?=
 =?us-ascii?Q?NTpYjs/U5rsy4KqvWz2fvi0jerW0Yi/tYCtzsHW7lGSPQ00fNj2wl3fUWUeW?=
 =?us-ascii?Q?26RvDZ4U5TllAa0mLXGQRT3wPmfSVehxZaSK/NSDwZ/Z05H/X1GGic2Ns0Gv?=
 =?us-ascii?Q?RVrbC4aBb8JI9f4s8e0dtNKGiRjLJXWPs8e3EOfRkCiR92TA5wzZY8SfJ2CA?=
 =?us-ascii?Q?VFtm6t9m3YGVutKpNx110tI0qxDFRN08uRR0apJ0wKKzqYWFQWl7tYv0yLiR?=
 =?us-ascii?Q?YEkfQNgN2QkqFZ+ifbTIrFM4MyJ8Y9dvwA7N172nwMjMl4lGCAAbEnQMj7iw?=
 =?us-ascii?Q?9uSPRNouMDc18kkM6wzonrzy9qRc31k2wtPMmQZL4rgFTGCkXRVuNA/uxn85?=
 =?us-ascii?Q?myynxU0Btn7yNzS7w9SSyxSnQQF7DwYzGg/b61O+xorknlDnVORIH/6cTLGm?=
 =?us-ascii?Q?DXdnrMrjmwFnjKm07CNuMAcem02TYZyGfOAjLcrIceCCJVd9P077HkvKS9mR?=
 =?us-ascii?Q?KP9WALHhR+wkFlN3f1pZJFYQtf4eB7KtZvcOJOHw+ssjz7PlmGwIHonK29Vb?=
 =?us-ascii?Q?whqMedcF5WPcAibv44ISjpnSz0//Q4v3k5asA55IlyvhDtuBmc2128Zb5x/C?=
 =?us-ascii?Q?eLn9xMx5vZwqRyHZFfWZ+88lmBrqR1WSKf92rMWqWIdzmWo7kuV+wQ6iSGAa?=
 =?us-ascii?Q?7WBiuCjr89Ix4WM4W6Z6TDmzBs06KVZE6CYy9cJowDe6+pD+n0qcimjfHCqg?=
 =?us-ascii?Q?p30AlE9uJUkoC8yCirQUWNxddbUIyhZs3tChXFkWvvcN+dui5g1thJ1uYKo8?=
 =?us-ascii?Q?emhwKmA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?65Wkey4pV7bwt05cgOqco0kobqVXp9dCD/UiInB6HW20BAjSMhZABJ97YBxI?=
 =?us-ascii?Q?8rABcCByEYoZKdWSQXT2tgC+/Bgug//MNm9/GSxXLHz8C9FHklxq1EpRte0O?=
 =?us-ascii?Q?5DKfwpDZ1f7rs1Kobk7XdfdKtGF/dJfubgF3JQwgdgZ9maYydzsFSaoVRUlK?=
 =?us-ascii?Q?96Me67tAwdTwUV4DKeZNdOYc4K7VaiMzkzJWG503mgWgbxTg1vNwjzCUoAXq?=
 =?us-ascii?Q?UGGTvO8ZczNEgFGxIZ7uu8oeO8QkPKtwUrg7aie5Z2bs+8ev5ow2qjk+2aRJ?=
 =?us-ascii?Q?Je0RBP+Bo/Je3hGsm49+xi1WTSLqPaQqd5iZ7tAeYk9K21VFnMDC4iWgKISD?=
 =?us-ascii?Q?ajTpC1MNh/0RblSgyQ4TTtS4/l7okX3KiDEzooFdyfhFvPotJtflOc8gVjYH?=
 =?us-ascii?Q?0vWQhinG0zdjX1izXCoEvCBZC8/fOVrpAjCaU9cOsML4BU0TltTE5v8wRKEr?=
 =?us-ascii?Q?fKOhmpYxSxeTb5kMuGtiZqN/bQ1VoMiMOCMYry1ESHFCrd2WauyXRV/GI6rr?=
 =?us-ascii?Q?2W6Jv3oGQvlLrdTrNqtWbyBYcQXl2xMj2SO79C1nvT5FG2VnlAi108xUQgUa?=
 =?us-ascii?Q?bTTCtAV/cw5OQpZ9SolNfdb+RAd7W62GxFPQOZhMWb1R+rYU4fV+fn234PAS?=
 =?us-ascii?Q?31sRleEBZe41/+P56/svBTf1CmxajLU0l8w26O+/ShRY/DF44LvbfUbXx++W?=
 =?us-ascii?Q?fUWIe1BaBJZ19fRsJaB+sXbV4GMRB9UF3vyK00dNSLo49hzCsLDy01GaOs31?=
 =?us-ascii?Q?WRCgVNu0mwGuRGuT1qVEHkG0fzQ+1c6liSaltzwaGS7t5rIux39uz1jFRv2O?=
 =?us-ascii?Q?Dp01KfpxiUMHD5sNe2OsaDxZz+liagygVVUl55UaJNzu05eoIJ3rueerATtS?=
 =?us-ascii?Q?ZCqv/NlE2vLcL+RrMNn45SyzmuqqOMF3/5tPS91AVeSOk2oIDo8CBILFi6hJ?=
 =?us-ascii?Q?DfFPxaVCoPWcxBa2xsqhLcRVq4+MdVdxP8UpLxjYn0pOs3DH6TEuWm+E4EmE?=
 =?us-ascii?Q?enAmmPU0fA0Ue3CBKGW4zQwxcSVi4d7H6ThxQLukJrvSFW7LDgJo3l0FcKFF?=
 =?us-ascii?Q?GioxWOKV+AQiI+PQMmV7V5uWle6S3n5kKmizHc5faUf1sFz8eARzdDXX6gg+?=
 =?us-ascii?Q?lNt2h4yAL57tD2kFgNv5MroDESNKcktHEx6WS+uHaoToW1AH1eEz+hZ+l4Lf?=
 =?us-ascii?Q?0Bolua6q4i/zJowMl1lCNTvKLdD72OrI4PkcbiSRYU2VSK5l+hIbVayxbEgD?=
 =?us-ascii?Q?UCGhIyD0jJez9RkU8+kKF1pfrZ34HG0CKMn5OywrUoTHISFJmeoAX5zkdGWm?=
 =?us-ascii?Q?PTeHcWKSk9hC0+yRGsnVfLqix6fR37873ZfP1WGCIoFEqZjP19SJqfjC9GVt?=
 =?us-ascii?Q?01bbWX5r7SQ2vpeGuRKVRAMXQT9Akz6agicjvz5niXvTmP6Zv3vnA/SiZ7iv?=
 =?us-ascii?Q?zgn1oCMVC100IFypv0NyZrisfO7KxSS5mTnLXzt8IkcfDf7R77MYkBBEGTLD?=
 =?us-ascii?Q?llAK8arSHxYTRZ2JCToM7Rwd8hBQdjmDy9FoU1hAel8C4Y3SkkPc6dqx5F7m?=
 =?us-ascii?Q?Bpr+C5Z/kv9MgYx6oPzioFXSOkcfBT+dqwUHw1Dl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vHX/dKw+N9KL4pUf7r0YQkaQ4absc/uHHN8qf6FRbXrmaecgahhl13wiaSQdCuqh4mGrvKdJa3uzJaRu7WPURD3lOM+nRVZJuCfddtDRDqdRgEv88foxAN7VCdrBz2e8SSqx1hXIyzgcAQehR3UKYY9NNxkzNTMPfL8wal26ZBVqtXhZVyIzfo1i7ijq3Ut6Rk3mAw+/GUyy76nfLEKo+hNJe/FuPNsV00rdjqseQwNeIrdQMsrHepMh6yyR67JbZ8Ul7VTxdsk9VuJDY6seXqj+d0qQKZt3RcWexx42+UnWznioj2llcfjHsoyvK9jUE7aKOHzfd33bj80bwjNkFIZWfTlV681JXdbIio/Xxo+K8x37DEpFA/yR4BM0OZILE1Bzsgntuqm/PvA9I1w+gNUYg8MFJLvDFb44MIEWYCbWLULRGIY56fU9enZSXMdMqBsgFnyvHTqFKtZiusufQH1DhDF9gPZIqm65CRSuF2sXYwvwJx3gcIpxNw/VVZnnSE2itGa8xfAnz37tE2N13NGqvi+yoahs3/4Cgaz2ENqsfROs4WmvFQbMLAed4wkOiYKH6yhA+qZVDX7rvRRX4d9ZYHgEcEs493r5pkF/eb4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1837e5-c414-4fcd-8f76-08dd82665cf2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:57:11.5676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKZ5rLRwhP/UDZPoq/XkL+q/Z3Ts+qHHoYH87kKSSoG74F+YJrf149RRYq46R+W5y/mNf5AN7hilZN/P+AyGtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5705
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504230090
X-Proofpoint-ORIG-GUID: Y30J33Eq82R_OMKzv72iS-1OkVi5RTaL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5MCBTYWx0ZWRfX4tHvUWWgax0S xYgQ9re0DTq1f4Zay77507e8lKGDltKUyLB1IG7GnzPHMUlJ1feNW2nR3Qkq8YAtpL+Q6jKQL35 sxGGkynjBdnnHrN8xhiuwdVmx/5uvpihsr8vUw9k50L8MDqu4YnbzOUHjvQVVaBqJr0igxpg58A
 8opPfN5eyOufZgjgigvuut7fNUilItb5zAMf+fVctvaD4liJzVE7bRWLePZww1rp6NrymrNxDzD Ya0woAlLsQ/6ldIf3zo0R0iq2xUcOpzJLkasSghpGGsBodL37ViKQF2U10grdJHPJzfE7MScqpF N046ZvAByKNbah9QcfWEEkE4yjLtcTrIJMNscE0DcTdAarZ9T8MXu/vu3mq+sjdxerOBmQ66Qsr bIO44Hg3
X-Proofpoint-GUID: Y30J33Eq82R_OMKzv72iS-1OkVi5RTaL

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250423 08:30]:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> files - establish a 'core' memory management section establishing David as
> co-maintainer alongside Andrew (thanks David for volunteering!) along with
> a number of relevant reviewers.
> 
> We try to keep things as fine-grained as possible, so we place only
> obviously 'general' mm things here. For files which are specific to a
> particular part of mm, we prefer new entries.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Michal Hocko <mhocko@suse.com>

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  MAINTAINERS | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4015227645cc..632f2860f1cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15492,14 +15492,11 @@ F:	Documentation/mm/
>  F:	include/linux/gfp.h
>  F:	include/linux/gfp_types.h
>  F:	include/linux/memfd.h
> -F:	include/linux/memory.h
>  F:	include/linux/memory_hotplug.h
>  F:	include/linux/memory-tiers.h
>  F:	include/linux/mempolicy.h
>  F:	include/linux/mempool.h
>  F:	include/linux/memremap.h
> -F:	include/linux/mm.h
> -F:	include/linux/mm_*.h
>  F:	include/linux/mmzone.h
>  F:	include/linux/mmu_notifier.h
>  F:	include/linux/pagewalk.h
> @@ -15509,6 +15506,31 @@ F:	tools/mm/
>  F:	tools/testing/selftests/mm/
>  N:	include/linux/page[-_]*
> 
> +MEMORY MANAGEMENT - CORE
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +R:	Mike Rapoport <rppt@kernel.org>
> +R:	Suren Baghdasaryan <surenb@google.com>
> +R:	Michal Hocko <mhocko@suse.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/memory.h
> +F:	include/linux/mm.h
> +F:	include/linux/mm_*.h
> +F:	include/linux/mmdebug.h
> +F:	include/linux/pagewalk.h
> +F:	mm/Kconfig
> +F:	mm/debug.c
> +F:	mm/init-mm.c
> +F:	mm/memory.c
> +F:	mm/pagewalk.c
> +F:	mm/util.c
> +
>  MEMORY MANAGEMENT - EXECMEM
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0
