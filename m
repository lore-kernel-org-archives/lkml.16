Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683ED2A8C1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750396269; cv=fail; b=qkxvU1qP4jPQ7WiYf/Vf1OU/rGkJ1uMVT0qQg+CBEiISAHhyA0SP6hXS8eaONezkEt2tsfjzUnXSNbExMtAfg4bvIDTnKZGhvNdtHjia3JxFJ5K8Bg5BJIDEHWkyFNXvdHx7iFz3mm8HqxQLGhMZLYWlPzo01ZBEVh79TVN8oqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750396269; c=relaxed/simple;
	bh=ZpanMgIdwsXc1LUpjYEVO/oV19InWjPtR+vpVEWZDQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=anCDuvhhBfUHI4gCjF9Kf+Y7PcbyjINKNpGHp9GwwtbNu8jYlS2gRnD6BHPnnYvsFbFgiwUN93Ebmf5tcSvlElGhUn10f4+f8XIK+BCAQHzfRk4UofONiRGfLeeaoKvRTniBhzBMaG5FFI5dkawbLoevrqOKJOduY2YLTZGRzxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=giqNFoCM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J0OCAsHO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="giqNFoCM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J0OCAsHO"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K2teae012115;
	Fri, 20 Jun 2025 05:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=A68HbbHBx839NjC1vC
	nLiJHpTjt1yBuPEGWi4eXIUhw=; b=giqNFoCMNnoFUkobIDVhj+n1uBqfmkvC4H
	0oxqd8QuKllxpLOan0iodHcVSQO1zZj9NH4tACQ+RBEs+xF2qzanki37Sfwv8ajp
	Be4jBOPHW41Frni3o4mtteW/ii71ptFkYwyZuVZKgvt1NIrLcbSYNC6Jyhzol+JA
	BW8b4BrybbD9+gr3REzMjNRkO1yulCHZLyOsTFh+gCzSEvCKTdyu1LWfIFNVdjS1
	jW5HOJXJE43jnu1I69F1HzHgIP8l73TG5tcSNVboad0RefLzgIayfoC38NMyV9NE
	Ww03oKfDluuF3ylplWq/kC4CorUWAgwEF7fzdHqly5Y5eFTryANA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914etye7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:10:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4qRrM009752;
	Fri, 20 Jun 2025 05:10:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhk1sud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:10:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZZAXt44pdJT79pRzC5m8+yWKOZARXhZPR7myD3VGb4MdSmUWM15i6jJ/UvY2sSip9KpQ0Sry7t5y3IQxGtNlfvasNRVU/1xQsau9VuBfzgDLuO0s2RLBWbh0buN4iWC7lgUp6DygG829G4YeVIidUQq3VPdZ4wMdOhslY0GCkLyAQwxfy8Pjkec5dsHPRTC9H3oSJTpfgCjxai5hdrNDbYL2EFxycarSBt/ExLZgrWdEkkyODeX273l8G7o6OSchqpdSciC7AzX7Y9C60AFTHpdR3uvmgjyqXENit+MhvJla390cS7MCP7WKVDrBNcm6ztkzijFcbNdtbr6W2VsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A68HbbHBx839NjC1vCnLiJHpTjt1yBuPEGWi4eXIUhw=;
 b=L2BzGNyUv9bGIORtjL47p98Y1nnvDkJgAyifsE7qQi8Zrv8y+LueaDvSUeKwQ0ruvI3lyyKesmNqV1NLZOfdUGSPLyKQVa5KWDIu/h6zcyD8tzntzPFW/HLKHH7Qd+wpj+rhKTmMLQOFYuveDykwc9lxKxtZ/TFF1EhatmjKYRs2Ap2yOD4zrHmRYAUY3gLiCNFHekZR2jkQd1zfbcyjcLSsFshDgkBvuIDG+FpPZ7z6o5zV4z12bGP0oUh6++hCvbJugieUdn+wTvSJ/RWUqaxxVMnzLEiUnqfAkM87eTCcrBr3xkmdpRHQkR1QXCyFAolLkbQidoVkVDJ/RrIQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A68HbbHBx839NjC1vCnLiJHpTjt1yBuPEGWi4eXIUhw=;
 b=J0OCAsHO761s/1F8x6l59Z9lmL23TCOAcJtZ/D8jaeUEEql8hDjcRwc3WnK4hsrJIgU3O5Y0yxu7mEmmpx3y2d5g0MMoSG8j3x15e57vP6z4hr1zz3x52WBoj/eIuYEJK7+m+2YM8dkNDQw6w8wJ/s8Y0w7Xwy+LWibth3n4f9k=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SJ0PR10MB4767.namprd10.prod.outlook.com (2603:10b6:a03:2d1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 20 Jun
 2025 05:10:36 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 05:10:36 +0000
Date: Fri, 20 Jun 2025 06:10:34 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH 1/5] mm/madvise: remove the visitor pattern and thread
 anon_vma state
Message-ID: <bb1bb862-7b48-4a90-9d96-9ad3da36b995@lucifer.local>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <4239e727b98763856b86cbd9eeaa0ba792eb2394.1750363557.git.lorenzo.stoakes@oracle.com>
 <85146A1C-767D-4761-A37D-3F2248F0C7E7@nvidia.com>
 <4729217e-9bf5-48c8-9f93-fd33b66c5bcd@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4729217e-9bf5-48c8-9f93-fd33b66c5bcd@linux.dev>
X-ClientProxiedBy: LO4P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::22) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SJ0PR10MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: 554d7cda-5a07-41e3-8177-08ddafb8cac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VuCuVDUdCThfQx4Kl5y7L+ZjYDzBxTDDXS+tZHPvI1HvhtDWbB35jsmU+0qu?=
 =?us-ascii?Q?FMFEhSuaQr3yiZkM2CrvMFeaeT6Pe67bK5kr1qd9nIkp5P/mSL6Fud4XF/wW?=
 =?us-ascii?Q?/tGw5zbW2WLDLSpTmebeqL7Yim8MVKZqNeccLApS1rX6nSH15Sk8sr1NbnJA?=
 =?us-ascii?Q?1yqyxVU12MCb+uecwBKVYoguW2NjY2SlM9kVc7DscVdtpczTOESXAEMwJev7?=
 =?us-ascii?Q?tDpd93yXWXao8rZsOWGYwAHGPJUQwYe0nB6R2qadNU65xDtbPnaARzKD3owD?=
 =?us-ascii?Q?nZpksIZVvhCWwvOHKROuxK2MOln8Nqzsx72eTr2ScKv35XLKNxE4sXRhdSIC?=
 =?us-ascii?Q?yQ7Px6ofVYMJw669Zy+Vc4BzFrXEXdyE+6/b4FdP/+//cReVDpF57eYiEn45?=
 =?us-ascii?Q?377vrSfygx0lgpSlp7kAcYu8yTqhz9ujXbvMap/X+znOmLvB/hELsJFvpURF?=
 =?us-ascii?Q?jbuInoprXRdfqiCR5I4Duasi0Z5+d/R1q5Y9jOuOFATGvCk949uELcIuhwVJ?=
 =?us-ascii?Q?pny7xjdStnRoLTIAQNLuT8qHaW0Ipo2qtwrjrfWsrydh5x5NbDCC31LaFZM+?=
 =?us-ascii?Q?c7lqYnFxa42Hx4QYCHIEBj/zZRCFB6IBcJalz1GFrF/RbET55V4CXSK28hcy?=
 =?us-ascii?Q?5hfauIdY6NC7kVd1s/Mdl5LGsouN1iqSK3iOP51H+4mvw+KBUsAc5x3/+vhQ?=
 =?us-ascii?Q?lxqvh0RHO7zjd74Lnz+QO10jvuLnzYz+LDJm2Q9FvDllS6HJyvEguGPtqz0y?=
 =?us-ascii?Q?XLqLZjiSFtinNtTY6glir1pa9JS41eL6CP+PjUFSo5NqNhBemJ/J5sS4y1Ih?=
 =?us-ascii?Q?59xU3nhC+J3qbFgEHDf5oI3MUN1ZhjkzF1wMSvJDEgx3DMFjKdtWzGV+L2kB?=
 =?us-ascii?Q?NI8A1a60/PqMubrsBMj+UZVOzoWQW0g+lMPgk0nmfT02PXe2BmaQ7IFM7vIA?=
 =?us-ascii?Q?6MW9bYRKWZkiDabh11yrJAaqAj4B3M5g8jcssBDU772SJuOPBgsK/A9/dKJr?=
 =?us-ascii?Q?P87FUZFXhKfP23ePoD5+HpoSbhGwNnXQGvkXRZcQzz+OhVxxcXi55LeSOKmN?=
 =?us-ascii?Q?IqkWrwA9G63gTT96BGfWG7fdeVSsK92pnPFLPcRPAckTg72j+Aeri3BT3Rfb?=
 =?us-ascii?Q?WVap065GHkFSK2NbqUZ6O62JleTtOXMu2U+ghSi1jz6osjzN9SI8uzEK6zd0?=
 =?us-ascii?Q?Da59gL22dYGLQ+wF4EHa7TtI0M0EDcKc8y1gJNc/GIOG6JmcMoi5kLMtviJk?=
 =?us-ascii?Q?KPMVBCEgL8pnUJlwoil9+WsMLlntCQZjBUIlb6JxjdObQhpBz4X46ORzZdQ2?=
 =?us-ascii?Q?JjPoiVQOkq/k3jHGkY+LnKwQg175pAkufsOfbBc7m6DkuEq+EzxS8somJ8Jv?=
 =?us-ascii?Q?4YR2Wi9OSNDFq4rgmL/mzVZn+5vgRWbTawY6zERRnNOEXdBieBria/btieGO?=
 =?us-ascii?Q?SPOe2Ls5Lag=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Q7/c8M+fPQlZkCSOJOglyvjoqQjIkRpdVFrfIsvapkeaouebQluYukhY4YZ?=
 =?us-ascii?Q?lNwoFjpH/xG6lgxorEkBT2ADK76BWLyAVNjgyPeMjW5s6g7Adj+4HGl0pEFb?=
 =?us-ascii?Q?C8GwWvlSzh4bRTd0H0wHZWx41ncht9Od+rOZzhR9bdiAI4CfVGkIxgj75yzB?=
 =?us-ascii?Q?1NFoMq67aBb0oHu5B5qBWpGqAd+pXXrNtLTyMuECTXOGuT30cZLBA/SHf97t?=
 =?us-ascii?Q?yrjWkqZpKqhA6fdrGBhREFJmtrOg+9M0SR+vLUb0rYqpHArGXis58p+8+MZc?=
 =?us-ascii?Q?JaU/MQKbZAi9WFdYvFrkosss0EJCf9pMjyA5/KxLrKwqUU+CugK1Fc04Svn7?=
 =?us-ascii?Q?JKsK+SfEoB0wZkLzYZ2KP5jEsM0KY8HM098y6ruVZWu8nlJEKIw0vGYHny3u?=
 =?us-ascii?Q?5fWSpF1lFHqXneY+t1hjJ+fVOSr3yNPGRs5zXzfIJjK1jwPcRfdyYUwVfj9W?=
 =?us-ascii?Q?NKHoxlIU8pq5DD4GHOdyPPffPh7jqey2zbLnoKWBULrNA95UoK7et6/4aPXD?=
 =?us-ascii?Q?4OLpToCx8P8aY7e8GzCglu2mqs8tJ/uRQhqlXUJFvZ5G2GMxIV4ihlzvRqKF?=
 =?us-ascii?Q?8AWXPSNJDcVJCE2t55MHJXYnib1MjL1WkYEynQg/7dVSnBVQtGFaLsKWyDZA?=
 =?us-ascii?Q?2d5hpCtGOcjweQNBsJidEfUty8cyeSAccEFFKkkOByxFQYYTvHshoPUyxJ1C?=
 =?us-ascii?Q?Ip1HvKHvyXaqslHJRQQiQspcLkqCKTcrxuCTmixjp63oOxUqAAPzEatGhUwJ?=
 =?us-ascii?Q?y5teuMNyh2ydb6EI7DSfFYSIRhq+amUdM4uR99VCAlQ3mmWEchdGpFAyL74H?=
 =?us-ascii?Q?DjHXBwAaupd/5TWNQPqhPoBHFFOQi9zeGSVbddgdaRH6z4qiysJEvqI1JxMo?=
 =?us-ascii?Q?cM1Xbk+G1g/Eg5eHpVUoA8g23yebeBX4r7aG8QddFKIik9qU0kgKawn/rJOH?=
 =?us-ascii?Q?j6B+/oqwAhqA+g/OI/0C1oV1VmnjOIaCHxpJ6eHNkj1OifUuMqihsusQ5WKX?=
 =?us-ascii?Q?6dFsBYi6yxbBZxJwKS5XXPqONOJ8ftA0bghjv4LiHomkd876dvEcAd1iqhAh?=
 =?us-ascii?Q?yBw0rxUZo1DFrveuwbPGjFlO2tYnjDSR5ZEcxn56/73ZF0MSfGs10mXgexLy?=
 =?us-ascii?Q?V8kJ8OW87lAZuOQ2tVC6m9aGpPj87P67VIG0r9Kez/eyhPrxMM+VXmAdr97Q?=
 =?us-ascii?Q?9/ykytTJ9S/vb3r6kMYsjHOj72FT0TRd/jvFOuQR4CvUsL5CCJIzjpSokTs9?=
 =?us-ascii?Q?R1ZXWKCwKBMHI/rApdrNULTxCXzBR63WfCezZt7H94MmJK92krel+n9FpJrT?=
 =?us-ascii?Q?LydLreDYdd73HDqe7uA4uwFUNmEsHp3ZDokzKTsirSPgs7vdcUBy6eWVevuf?=
 =?us-ascii?Q?vSLal9b3DjryqxBANSrLwVkzwzKQcrug3P/gzA9A6Tk3RRM3Jn2zIiDDsV79?=
 =?us-ascii?Q?fZafa6le0LQTLQMi1vlA4nLkJAcTJxr0QPQDH4FS4gp/r6rQ548AtdO0Q/qe?=
 =?us-ascii?Q?mahUSxgHpPXwUabF+E0sYU7a2G4Re/vI4snDQF6P3GRnvv06u79JFnH6wHid?=
 =?us-ascii?Q?6v+2CEW4+4Dh9H+3MGmE7nCd6/LxR2tyzYMNZ+YkGoF276Lzvf4jC9owaYW0?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/wxt0n3OglUWdgd/zuOWruT4tjnpeeeQCTXDmdCub9Nyn0ge1wnaZ6QPRlva41HNEmCgqMg9s59aA1qvL66Dn8QOPJ0RgoIJlvzhvYQg2tp+jTK0Yrbipg2I6U8IA3l+hr5itdQdLJMXqerfcMn12smARcbKXe/hnvcCAWgd0Im+3qTsya1e4OKGtYl00VMZhBAbyytjEGLe0IZhyQpTR34n93NHk4ApLrlsdKH2SScEKxfjOvWd/+Ij8AaEw1qLmNtA/isrc3g2CkIAFzGEkUVgaTHjFe6PFq/2MNDNVK/YanBVqPX0cOswPfq7M8YKMH+lLBNw/nfvccQIrDGrD3Q08XrSAQ+OGBi8FM2JSVFAwalzxx+o36MtAOPOBudgj7VE58W8hIajE5qZYc1NZdbKL/1LghLWhFkXcqXP+AVdWOfvIQzcP0Io+KyKqLHCFfly/SDm3WQOHhuJ75krsJb4ElvSYx5oUWHuvLstIAb33To/R3U8cfaA1ZCHWCvzsp9QomyHe+oQGrL8tZrSU3Bx9xDjkGYjjtkgEy7ZqesOYTcMK8SYE5GoDmx4IFnslzfL94f7gBh5AZaRha4U1pvPWqsQy1uJo9LcZ/8SX38=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554d7cda-5a07-41e3-8177-08ddafb8cac5
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 05:10:36.7791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1KIdWh+8jZEc3nx2XsqDn1bofujUs3s9dIUO6WWzLkj0fA5ukzJe5X3gF1Eor08pEUy6ZDDRAWTIX6Vc8RzIlkCntdweGZu0EEB2z282sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4767
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200037
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAzNyBTYWx0ZWRfX5wb1ZXgwH5IK DdS9I6FuaXfl1W49EMjSV8+b46Rmtkq8IDIWvXcVx6JzMuJxAgJLw/FkG193swKgHiGwnFs1sLy OZS+yE+Lg7MiCtUtOwNKcZ2IxcBwZ7iejDcICFfeniSydP+dZq9CH5hxaU3vTSY5ELfjC/Fxsdm
 LpkKKL3GaD72c96BAYo4avLCHaBVBkmCfIRFTHr5WkdCAaHw5MfBjYzVyp/E2dtXZxW1p11pG4O gGxgwCxgkc8dCDCCUXNp4ed/JZfHd4jmOPuD09ss6ha0iUUvcsVlEahrBrcBYDrw6Emj1EuoujC jxCP59IBzWCVyXyASJGAlJJTf+Cwx9TegIs9QA+54wsUGgaYXLPSJazXt4pIERn7goR764AB1Jw
 3g93vEtxidpZmSSE5pII6wLcwRyxnh+Hmn7SY0R1zQ8rxK60DzRgcAT82CraOyPnoNfb8UIW
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=6854ed4f b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=ocT83v2lZxK2ipuMs1IA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: cVFKs55syn9ZLw2pReur81-3Ikqj73HI
X-Proofpoint-ORIG-GUID: cVFKs55syn9ZLw2pReur81-3Ikqj73HI

On Fri, Jun 20, 2025 at 10:43:30AM +0800, Lance Yang wrote:
> Would this be clearer and more closely describe the code's logic?
>
> 		/* Reject naming for regular file-backed mappings. */

Yeah here's the fun of 'anonymous' being super unclear :) it's like the 'no
true Scotsman' fallacy in mm form... ;)

'Anonymous, no really really anonymous, not even file-backed' :P

it's a good point but I'd rather keep this as close to the original as
possible so it's just a code _move_. Perhaps we can update later but I
think the context makes clear what is meant here at least.

>
>
> > > +		/* Only anonymous mappings can be named */
> > > +		if (vma->vm_file && !vma_is_anon_shmem(vma))
> > > +			return -EBADF;
> > > +		break;
> > >   	}
>
>
> Thanks,
> Lance
>
