Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9565F171C9
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749278202; cv=fail; b=KcyXIrr3AfWsvntT1GL2KJay2njzPcho+e/Ondm82R6598mx0A/8QGXyXx8xjXfKqUtQD+fqBP/dIlCsd4/8mTWPHHaNDGG3wxalqV5bP8MiNrXxVtjMnBX56xXzR18yzoEjJJHIvYYPZQDzZv5fkLFZfleXgB9zUpY3ea6lJh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749278202; c=relaxed/simple;
	bh=bLt9tO1ABUddUo6Q3WmezWg23u3NPH5TSHcVFSyQV3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dRi1hO7HIEtQ6VF9jIBNuFj0ovg6qmaWFfs1+HdKIfqKOsEEejEWK6q/Pcqqx6lH2vrNQJ+TU4U+7p57wWsdh7lNBjqCTqJjusXwFmXTn5V/a2jTocldSc1yFqZLz4FMVGedTeTY05hJJ9TeKnfwJq/OyBM4VyrNNwYHvTbX/qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SPLG8IM0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kKkVOy8h; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SPLG8IM0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kKkVOy8h"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5576Yugn032117;
	Sat, 7 Jun 2025 06:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=nPIxVGKjz0+eWz8QUX
	E0yZqD3Cx49qVe9KldgcpRvWc=; b=SPLG8IM0k/4hLB5m473+R7vfdfN+NzTv3r
	GRYf6Jk5YYjiyTgLzERDC2aAHXAu0zNA0/HYhjR2BpPysR0dPo0mtxiIGZkYEALN
	1yM+yHS0obQquabuigbTfcyhGFPfrBMU1196K0kU74uTDk+ksVruoyU59rI8iCe2
	pJEi8kny1fony1PIsDwIGkOyaMgvtgObDWvqT1u0YB3wUiREqd+NeRPPnZd6f/8R
	kRQFFCsdOm2meqPPdgs8irWbCHHEXcRuzzhuvBu58sYlE1DPRDdv3Ph9cHVEX6bv
	AmeQf2tZ6k30aupuG/NetTu5f+11mad7klaTZMCW+16M/VyPp7LQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1v02qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 06:36:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5576Cr25020419;
	Sat, 7 Jun 2025 06:36:11 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011039.outbound.protection.outlook.com [52.101.62.39])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvc48r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 06:36:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRCZ5FLSD2irP9lV45GCXF3TERb81pe+6jXmQMkPHFzwGzle/uWTp54OeRVlmCm/vz5NIHuFNfjdQCZmvd5P80pmJELHCTX4tgJL3l4EoIhs4NU9UWJdeNC9QIO8jhhUeg912ZcXTBnAg7vJAw4b0DB7nSeVjcWOvfFH426vF3Od/udfad7VSn7SuRDxfVeUUCao9dTdtRlExN+MOsvA3n5IzA3ttiBIuLGgfaddspA5Do8ZkoqyUZLMV6mM2aWG+UYdHeUYH135tYn6W+li2VxhjfdzYkDs9OWSTqqnKqzW73Bd7S4jF4kbvUyN3gr5AJi2yzWhvxumL6We2ot0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPIxVGKjz0+eWz8QUXE0yZqD3Cx49qVe9KldgcpRvWc=;
 b=YvzvWuw/8EhAV0lqjx8S9GPixu8q0sSx74IV/rlv/bQsWKnMbfmetkDJ9jQOLH0R1LBXbGG7WtVw9XSlDWfisyIy6kLMSC2HD64pGHyNgabFVJ7iHxDRQTymmhCGxGRPVy3pQdS+xumPRSSEOnR5zB+lFuo9KhpPNgV/NpxcuSjBF6aa3DNCfTykeo4Ct0urCpnpiYxxeXrM9UlnkOz0FJKQKbxwtTMiJM4B4VSZmAJv3VYZQV5ugcXrQqm9TyCquz1yWIYPZ+bRxZCCX96cPbgcY/5di1lP2MUWO+p0aUDX4UTiHJQHmn8IH18MAC1HwGMHErEi0Z/NxJjhFJZsbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPIxVGKjz0+eWz8QUXE0yZqD3Cx49qVe9KldgcpRvWc=;
 b=kKkVOy8hFfesxuJE+jYKD4kjmUIgqQVjQDCHFQNRIBYakQq3E3mekt3TK8cHaDaKOYaj6dhzGSbYW72gRBietX7u9+//5ptLdCY5hWJYi5iiubE1DgYeeCFR14jaQ1s5l2+keKQ+hd58WGw+aJZ6o1wZoWobK6SPPgBYlm8qEsY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4794.namprd10.prod.outlook.com (2603:10b6:806:113::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Sat, 7 Jun
 2025 06:36:08 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Sat, 7 Jun 2025
 06:36:08 +0000
Date: Sat, 7 Jun 2025 07:36:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <6895af5a-ffc7-4d87-a88b-0ef3914e3572@lucifer.local>
References: <20250607004623.8896-1-21cnbao@gmail.com>
 <aEO6asiCu9oG1z8o@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEO6asiCu9oG1z8o@casper.infradead.org>
X-ClientProxiedBy: LO4P123CA0528.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4794:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ddbc8c-94b4-4001-504e-08dda58d9621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tqwMmM7QXDamK44Yg+7j/DHs+Kz2dF8sVxJAggI2kcjIkYtGGGEhCvB1A2kD?=
 =?us-ascii?Q?YzSZdvxhQzC0/N4e3LQSqXYjeKOrlnV06eoAabQIaLJ+GbhJ7K4sYz9iohDR?=
 =?us-ascii?Q?ROVRDR8dYDviFrVg1FRvdp7lZ464jQztgha4Soj+/qgEnXVSVwSZeW0KqiX4?=
 =?us-ascii?Q?ffkd1So8fZpUclo268NMLYNWRsvxkRlhgv2TN28FqxDcfVUuu4yUikcv2Ut2?=
 =?us-ascii?Q?dJzo+7Qh12j0FNxgQGAZGiz18vX+H36jXSWeyVmE0rL5JcwtCtVw2DYag9DC?=
 =?us-ascii?Q?p7rTokqMh1rlWJ36D+a/EI/s3Ak+2/fpAyfsQLSyiDpQQpttKxnZVnAahiSc?=
 =?us-ascii?Q?uV4rIzFlS9SgzEEh69uWLrf+1vGa/OO9oLg+cuWT3keQ8cbDtiwGP3vfgifz?=
 =?us-ascii?Q?xtSQssPwa1wm+HoYXfCPt9KBaVMtiwlO9kGkbtimAKgxswryrDeQy2oihjin?=
 =?us-ascii?Q?4cJNOI483o5vrKLX2pVZlNiY9a7oi8bRcQZXRSDlgL4v/j4x7qCCqKDB0peo?=
 =?us-ascii?Q?DppoND0bezM3qo698pvDNlsY+7vosQWxUwigrTwqNGd0tdcJ5Kt4uBxvGfgZ?=
 =?us-ascii?Q?Heu7G3Nv2D5wSqnYg4eImXNoG5S9IfUPS1xCsxhEv1lvGaU/wn5CC73VmoGx?=
 =?us-ascii?Q?Nmkixylh/tZGELlJVZxLPF32reHSLqjDPCOWMpX8AyKivazuBr3f90orrl7v?=
 =?us-ascii?Q?R8QzVq2smS5bG79elb7N34wgl+SQGQu8IPhMHRxlqOpr+nughniJfkUz6v/N?=
 =?us-ascii?Q?64qKJPSmCLpKbJzW3O8b5cOKS+OdAqCSwm51ab9efJkA7yDZ9zeBy0CEUjk2?=
 =?us-ascii?Q?lYKOLpwsvCujrQYfObdYcTOOalBX0VH4Ql5KMp4obm7CnBiVrGJyETf31YHK?=
 =?us-ascii?Q?UmZRNRxtqvRFGJKjJjms0kwXi+SSdoSLb91ptZhuM0W16rgdYfLtIYGWYJ56?=
 =?us-ascii?Q?5Rnq4OP16y6j8WS4ALFjdedZ62j4tLfeKVs4wTrTkF6jgp1FT7n4FXJ/4igO?=
 =?us-ascii?Q?iTyF51RvYM+PRoAKAKn4L4PJ8J9r8BaJPXnRUmDVBMrFUAnyGcgYXyGAJssz?=
 =?us-ascii?Q?pHAabySl004r6XrGVQtohoNVxhn4wkNSK/2xvx7tgPFXKfj4tW/GOjZhUVL/?=
 =?us-ascii?Q?QCuCCHLpelcrA3sBktiu1tuMD4fnfsU1uDtLqoz5B+jobiRKMgFbLmwjumHT?=
 =?us-ascii?Q?7QxbxSlWatS3/FzY0mPK8YCcHj8/uCQ3lr1I4swoNTbwkZZt1cJsWIS/i8OM?=
 =?us-ascii?Q?6S4DA0bPoNGmxDwhpLo7kZ7oAjfpLaXLcvfKYRLMiKtZHSKW4/j63xIoHpaj?=
 =?us-ascii?Q?p5Yf9M5i73A61jBhun8SMQl3JUZYJ5vNpZJ22IkDvgLWQJDuuvTEBiHPsB7j?=
 =?us-ascii?Q?XxhfwCxEvPfbIVh5WVk+D/BMM3DUc8DXlMI/ba2uVHxCaqVwNW/V4DpCHLf9?=
 =?us-ascii?Q?t5OccudpcIQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Whfq09MOvqODhWtlbHfv5YvqJIfBFj3X39cl6OAzOzte/igV9Ohr4ucZkpLJ?=
 =?us-ascii?Q?Pr8Qs59gTt+0bT6OC4tSgH55LuF6jYMNLM9WFwpX1g+Md/sEQgvEKR16s9TU?=
 =?us-ascii?Q?hi/PCx8zJ8bbMMuir7F9ebGGs0HmTeyf5+0N1312yM27cwWSBanCM6vj57M9?=
 =?us-ascii?Q?1vYRWOGi0AbEvaYhoMzeZTdMxAEELyOzG8Xi3E454IZ6l+oKzSbx9KYqnW7j?=
 =?us-ascii?Q?vrs7b56YEu1kV10v6jX5NNRxhcmqpehhnqqoIRmRzduQmJ01G4gjkcwdzOWb?=
 =?us-ascii?Q?LZMLxfGp/4Y/fpBYxspaDqZfI4FjcT0iH+pkD9DFV9uVZn5V+jgXE/6c/nss?=
 =?us-ascii?Q?jhwITtaqebcOnbD81dqg9ws2B7LcM/eGYuVw2c6CNv/W0ObjSR+NdaFkZ7Hh?=
 =?us-ascii?Q?P8uJPJMSwsSeQ0BM9LSbE8ELqZ6e6Elwr96bsJjbuBzLeiU13YClAf8pKn8W?=
 =?us-ascii?Q?cAslRyZq2C/Fhbb4jef+k4xg3iV9HmPrM9uj/uTBd89zJ65OK8VAVIBwTGSv?=
 =?us-ascii?Q?qSFLXcOvhZXFY2fr7MyP0XjRMbt3yhFrwiqM0TxS/J8DDFIuf4RcFZ9RZP8L?=
 =?us-ascii?Q?IK+5nLUPNDSrZE78YYtumqVvoz9VPinxUeT6pGOvXiP9o5y6dIClJkcFEsTP?=
 =?us-ascii?Q?gKjkzAQL9wM6IdHNxUIZIdhsrm/QtzmmQAB9jISpUdtsngv6R5CozUVi9F/z?=
 =?us-ascii?Q?cmvoCSD7IkEsp0oDrVrnoZPy3+YhwPQycHxauLH8KSqb41H7mctk3ecQTfc6?=
 =?us-ascii?Q?oYhzqF4U93i1fpXvwqOT+malxTevAzm+4W8ATtCL48Rk7w3lcTO6sLYaq/W2?=
 =?us-ascii?Q?P88f8W9VRAVf9+FNUVND9ohWX5c5Xa+OasFpSK3y7/56J6+9LP1fDYIyhmr7?=
 =?us-ascii?Q?cTprR8TjkjmELt5WMXPJME3e1gKBH1bayo8BYKHr1UT1X1cum7Jvuct5YAZs?=
 =?us-ascii?Q?RMhainjV+cBGvQ6ml0gYf64BXdHoH/mXTm7vd86d9bxdgWx7i4cd9uXJJ1N5?=
 =?us-ascii?Q?cjwptrufTDL0E+qCDJmSnCa/nOHgnyKvx6asolziPLUD7El+ANGDuw0qeXXF?=
 =?us-ascii?Q?E/f1u3R0ByB7rjaF5r558zlbMvS86mxuX4YJ4GcWixGTF/pdWJjFjqJ6h43z?=
 =?us-ascii?Q?COzbYWzFepRabK6GDLBJ//Y3/5WmuK/i2A77OTzlLwWXraGEFNx5dYoQgkBC?=
 =?us-ascii?Q?NoVXzrHH38PS3pfmG8fy8IDOFaxNTCsTR8ebYMPt5Vz/sadi9Ps1UagTKk8Y?=
 =?us-ascii?Q?NAoU3DGZv4IOHovLkp5omQyxE+XyvG6bkHbXUd1yqgF/IUmPWfqb2YUNwNbJ?=
 =?us-ascii?Q?D2e3MJJtBxV+lb+AO6I969dWOZYTfY0YrTQTLbxsu6orwhhLed231p+lMvhn?=
 =?us-ascii?Q?3f4VoIUQAD7J/MkaQwiAMWCcgW+YzLO5ec6P8fT20ybY8qVZTizf3igI7ez4?=
 =?us-ascii?Q?1LqGx4ZZAbh7UttYuSBYDxz2CSItGJ6cikcmyJ5iCh7Hqn0LB+A0xtdRVbTZ?=
 =?us-ascii?Q?hDBadZKKuZzvEWOqz0uN2/FHH3UZgeri57T2XbpZvUFj981dfZgoLUjK/cpP?=
 =?us-ascii?Q?Y7D1RoACzOfoJgSDiAmczLcDxzMUao4pJjl7QgmPtH+q/8KzgfPqQ/pnrsAg?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Jabn2jaivoU2Aifq4NzRuHSGI4DdwBWwDQlcFOeX68POxKxelM0nBFfdL4edTQX13LFhAAv04GH35GgMeA3QNb7aBAwEDcXRsVye1qHWuVNL4/LKOT0mjOsq+yY2i2Nf6l20BPK77S/JLesUJKOtP3BYC8ybicyB8IN+WDRE5Fw1EgRsmgMzocmuYuNcIXX2L63BhkXwpkH0ZNjApiPHiqmEu+eOnLX3QOBeTWgqeetJFlKUXKLZB08moGHH13B2rQH22UDp7AVGFdgikUogha5khXwgjYr6foWI6l+flKlESHvtswIYYC8M3V6FmBqhSKjLxORXrlw4ff9iYKAcR4rbMuBVXuFTAVzm8d4KsEgD8hF+b9oeil48615oT5dDc703pUUIx1i3QgHg60ycpP83brCFoMXNS1t5DYdpMz/GindZQKpBXcKtuzKjWkkqbi1UaZRQvJd2Bmwiuw9z+Y8wOuq9p/xcE7l6c5ZL9xBkfYxZrY/12sOkeDoqr62KZ9iKQ1HbYxWMfNlxBQFGx1VV6nkmS8DRJUoj2v1SRTIIboM5Be42onP9bTqnd/aT3XWzhovpTTrFLGznMmWl7BPcPCdSDZNwZq/Sjeo/ml8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ddbc8c-94b4-4001-504e-08dda58d9621
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:36:08.5220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zp6VlFVRttpParF4A5AsF1mduUiRooq+bs7s7cmc4WOo1xFtXmybHDNBoBYZHFbWb6S8lGIprlbbphMF8oQsNPEX41yNb/Ju2C3ix/Ck+PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4794
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=941
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070046
X-Proofpoint-GUID: aZlfGBQGdPaBQDthDNBoL38CrnCjfdwT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NiBTYWx0ZWRfX7JK9WyUvK4jd CNtYVtggtPqxSMzyX5zF8PBqCVe3394Tw/2cIVKUCEPaGNgc2MNQdXtXU4jVKIYt+DXxYxWnxGB FYvTjtb+utjmgJhGBeylpePGM8CX25Xcth/hu9TkSGTcXxgYAjFO8nF7xrGCRWgbCzC0Vj96Zv9
 sbLcKd5PTpvoECX4z1j8i1cWtRxVWhbLlWQYIOojN+v208b8YSQsNWC91aBySwl6v2zlQsJAy7V BIQWcjVw5vSECJJKxK/FpPxgHizXgFgbwFsCGoN+DUhctzXSz3maTgtmX2o/iA4qfQLgoTfarQQ zmc3iPLsdKZrgCaLjNedeaSAHagPCnJ+QQNWz77krggcDlBLVkTvEiWJFHYEjbIDg6fIlK0nPpb
 /qd4Orz16piWnABpWdxFkzwuZ7sKfO8QaoRz3ZYn+3NspXg1gDbuG82B5dpKDh1Jx01jvwyX
X-Proofpoint-ORIG-GUID: aZlfGBQGdPaBQDthDNBoL38CrnCjfdwT
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=6843dddb b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=urmlSDqxgO8ROu396-UA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207

On Sat, Jun 07, 2025 at 05:04:58AM +0100, Matthew Wilcox wrote:
> On Sat, Jun 07, 2025 at 12:46:23PM +1200, Barry Song wrote:
> > To simplify handling, the implementation falls back to the standard
> > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> > userfaultfd_remove().
>
> This feels too complex to me.  Why do we defer grabbing the vma lock
> so late, instead of grabbing it at the start like the fault handler does?
>

The VMA lock is at the granularity of VMAs, so we grab it at the point we look
at VMAs.

The other locks are at the granularity of the virtual address space so we grab
them then.

Doing anything else either results in horrible hacks where we have to grab a
VMA, stash it in some state somewhere and pick it up later (and hope we never
screw up with a dangling ptr etc.), or inserting horrible a horrible if () { /*
duplicated code */ } block.

In future we probably want to look at 'grabbing a bunch of VMAs by RCU', but it
felt prudent to implement this for a single VMA at a time.

Also doing it this way allows for us being able to neatly fall back to an mmap
read lock if a VMA lock could not be acquired for whatever reason.
