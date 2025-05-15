Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934DD42A82;
	Thu, 15 May 2025 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747322427; cv=fail; b=TXjS8d9x99Dj7qSKjeOFNdMiicQrvCqxIJzraqlk5KQWVpsQVFZ8pkUvPxXwo2PZBBEjDA+mcFiwI8L8bUiBWYH4bNGH/PybJREGze8K4/jVO/oZDhApWyhEhxcAb5hVoqQCJdzTI1JvBnuYsfeEfM7AWmxqCQZKIj5tKcllG8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747322427; c=relaxed/simple;
	bh=Y6guaNYPNAOi78r5p6xWK2Y/HsmD0LD3NoaOgUswSXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i7EYQ+Q5IZrKDZpy12d3udIp+bxwPjlZS2+04gyRakXW6tKTD4zzYlw+vK2Qleeti8FXad7RSf+X1uKDV1WG/Sva5NHGTlrL04jclZ82XniQu/quGTw3HwYIwaIwcPpcQzpl/FnkbpCLrlIpx70JY1fKrP9r9AhXzrXg7bd5PKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NWXTQXxI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mG6kfU6e; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NWXTQXxI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mG6kfU6e"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1n88007270;
	Thu, 15 May 2025 15:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Y6guaNYPNAOi78r5p6
	xWK2Y/HsmD0LD3NoaOgUswSXk=; b=NWXTQXxImkyOqP+d5duYLlARtr6CTdlmw/
	Z14AZj7DxUdHzUo5Ya2QF6n7PxSJi6pp3bPTq8dO0KRB9M7hcDIaCqfbY89JWSBz
	HrVl3imbmP+P47BmKmVTa4p0cEWGtBud/yqr121xvtIkYrbtxlsWZnQ3h1zemVKS
	asOztOp6tm22PGcBks+Lqa+M80avBTV29jYHP716huT7V/FRo3NMDqgVVAsmeTG8
	0qQ1wdClb7op2XefIMOJjiao95128oT3N/6GmCXfxW4sLL6U1KXsa8Wq+94QNhQL
	ysjKdQ4/PWoP9u78qTRUoMHeN2VqCFIErTxdeaF0qvSRUmFSsQ9g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ms7bu62d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:18:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FFITgd026728;
	Thu, 15 May 2025 15:18:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbt9fey2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:18:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mte9Tae3n5G2MbFH1dn63pEkhuBGJjA8tf3vzlcRbGtw7/6aDLepFbhmnR+V98lLZ4HeF+jGKelkdG/fX4xO4LEWtqccVth+QVRuEj9e513DlOf1EoMMf9rzwMMhKEDGnDcOGBIWlAnUA29tJB6iMYrhWa6rLv/y/c7G67CMP2RxtvZIaHMji2ZqVKlOXQUOlqwZsfj1wWhsfppO82pn/OomBhqsZEvERSyvBYHgF07gqxi2LoXHXs9gZGEX7E0ZfBnFrcr5n9BgsVw5YDm6KxKELTzcgVimRJWCVjNTrnBYZ6Kc0DYhyevk3z2iBtgwN2Bx0o4TIYKp1H5SW4zGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6guaNYPNAOi78r5p6xWK2Y/HsmD0LD3NoaOgUswSXk=;
 b=HIpQrEiDNnoXSxxPFfIf+Fu9FCeTZtbEivkpWHbmGNjzEToA2tFGoLuh5+OVxpR0HLZIg+hYTBBkFYhMSY++D3WLY5rW9MHX2UURN7OvsaVKlNAa2zjy9d6N0DHelPwndU4dlo9QqTHiQ+X571pYqa4zGNz6qJnPZUfiVN8LCdLfc9Qx9bHSODo4T4VVGr21sr74fKrt2lRBFzsIP3y4Dxs/zWgxI3Q1liBAMIl+A/GukS9p2dm1+1MWn47/0VvzgbGrvOg0GAcQXJbVH0EovQEXVPIhv6aEKwA8WR3O3AUBH4nZwDVMeITgdQCm9QJIYDF59miL5pErzk9Xj5tthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6guaNYPNAOi78r5p6xWK2Y/HsmD0LD3NoaOgUswSXk=;
 b=mG6kfU6ePTe/d8nL/zPbF06aKSVlYAXqKrP9k72WBsmdV0zv61/2HqZxFTC1zuGuv36wmDlItsB3yXhpssHG15tXxT8JknJ+IEF+wywlIR57VTLDLZOR9L5vRY0ZSliKynaWfHng9CACaiIfyGakl4ZdS0IZ8Dw5fJYzc9UL4wM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4634.namprd10.prod.outlook.com (2603:10b6:806:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 15 May
 2025 15:18:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 15:18:42 +0000
Date: Thu, 15 May 2025 16:18:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <fdc3bd2c-8321-402f-8ac1-ad0098c73318@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
 <47603579-4d42-4617-8386-6656341c8d56@gmail.com>
 <51aa0ced-e736-4eb5-a376-75dcb30469be@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51aa0ced-e736-4eb5-a376-75dcb30469be@redhat.com>
X-ClientProxiedBy: LO4P265CA0284.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: d34f7f32-ef68-4694-4d19-08dd93c3c705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yxA8gBlmHSly9y8Rsqq42ll4IOI3OHraYjG2Y0AlXR2ztnzEET3ow0OCGXse?=
 =?us-ascii?Q?QBQsVatK+gWeQzhQJChrVwRS8TyP9xmsSfM9ULUhCXMNNTNiFkIKef7HbapY?=
 =?us-ascii?Q?/wAK0lJzAMZiYMQxKVS6zK0aJf/EYDRsmO/Nbr+iRJJO+laM3GcBz51QFdSr?=
 =?us-ascii?Q?0MrmBynQVQVbv4dde7wEEQGVZBoqHLW026JjHfzit5aEZW/z6MW226JCe18V?=
 =?us-ascii?Q?mavU3woke/5tQ6k7RDhAlPZ1YPytfyHS/VCSHgGfW6TodMtEc1V46yJq1lJB?=
 =?us-ascii?Q?4Rrqulf/Ov553+9l7ljSisfhnEEhjnyUL85hYOfeEtcDbBYUcMmJgBvfqYq0?=
 =?us-ascii?Q?U+heqUFiVYLXf7JlvI8qcsBmBUqnDjjnD5RB93Jq3zfzDJowbz7SrMAXMXAn?=
 =?us-ascii?Q?IzGSRbke4nj/zpKbNJO6guM5d7LLTWSTzNZd6EJ62Jtk+FGFi/MX1Ey1/Fzl?=
 =?us-ascii?Q?0wgsxNqkHxttAcA/STL3PywTyzS/vC15IFojv/mvtbehdDLWRmRAyvzKDtu4?=
 =?us-ascii?Q?Z5zSbQO1c9tcaDwedozxHNSc4mq+Y/88mCIrjcxx+pIjNDoEp3Mk0P6HXCny?=
 =?us-ascii?Q?ovGqQc4y7/mO4M1Rc1Pbo+9PVPGJ2+QWM/U4spz4SdD3UAyvHbWUE6Z1Fbvt?=
 =?us-ascii?Q?Wtk63cQTgEQUhuzhB/Tl9AFB4xNACCN4PcpnqIxai3OcF1worqlCeroyeJ+A?=
 =?us-ascii?Q?8nN+8Vy+QZha9xas0YuLkA6lz0LA4dy+RQVmoGIHQW88vYHb8XOql8IIqmQj?=
 =?us-ascii?Q?CqB4tT+jZy0+6WrAiTng64o4G/UmEEPfRPJt2qdjNrKVnycVVnb01NO0YI8a?=
 =?us-ascii?Q?P185UgW8yZsrg1npU9qiWO4xfblIRSWVZm/IpuatjZZrjJaDgPzGUJ7K23w4?=
 =?us-ascii?Q?jKcWvCU3qYRFgW5D39riq0TdhmMWsmuQ15fSzWSyfOGQIeLLaLyj68xi5XAN?=
 =?us-ascii?Q?vYW3IFbSxi7a5IRA/c9+Z7qkJjTyXDHyAOp1WJu9y3jNCaKAMvDtm2+wlvyb?=
 =?us-ascii?Q?XowABZwlqTmjmGRgROzZjW9hFSmO7dXTr8OtWFesJ10Wf5T8r4fhSyIUWbMg?=
 =?us-ascii?Q?JWXCzUrO/SlnMc11ZzOMp9758115dFSPwqq+hwgOELCW38XNudbQ+JfiFB6g?=
 =?us-ascii?Q?mDCJUbpC2vs0D6usGZoM44+FijTunZ+qaFg1HzcdYlxNP3Ia6y6HQVgrs6lp?=
 =?us-ascii?Q?J1fcNG9Lq2ZpJfxH7Mf3fCE4zLYacuF6v6w0KiaMbHlEkEv7sksNaD9nbXZS?=
 =?us-ascii?Q?Hvd62TUvWpqqlyz3lyP736DMiwozZRBG7Zj8K1jfbO/eLdk698Jv0YDvTp2d?=
 =?us-ascii?Q?i2P03Wq0CrAeak/O7GI0ldSU3jkrOueNXRjy7FacggxO3MV8poaO5PGEDeSU?=
 =?us-ascii?Q?L7S7HwDZ99SOoZFaoRGpBNyBXTyb/TAJ3eL/ovv+KEX9YaHetfXIXCww7+uZ?=
 =?us-ascii?Q?IiLh8je4DKM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yq8lUmdPymNBVj492Nc6t52Oail78xrnA8pt1pKfH1XjXQLMksAxknCxVfR1?=
 =?us-ascii?Q?dx90RmbBqrBw1FQMxKE0SQpXcVBHKFMYbewbCRFfwepDLgfxJoG55Dhb7MWk?=
 =?us-ascii?Q?nRNJLTIUbstTtZe/XCtzSsFWxs2XsgrVX5AghHI7fiIYBpOuPVuQUoBGXyat?=
 =?us-ascii?Q?VUM0QbX2gtPk9DGs3WFjmmQ1L0+/ROVV6Qhyu7p1Q3z/vg46jfNdqC4mrzL4?=
 =?us-ascii?Q?m0yCLX3vAW+SvRl9uiJUgwMfMAGpCYOZBzg/0AzQo07NzcACgfhvc0xB0JGm?=
 =?us-ascii?Q?CTQRwNt9uClc/X0Zlwy0KIQ034wL9JHf+43LXVrWYc5VCv34X7O0TI6z7Ea6?=
 =?us-ascii?Q?+QsgQYIX7S9z5EOs949TPd3nKBq1U1m9s6kHKCwdwGAVgM+rmPdzDRA2Naat?=
 =?us-ascii?Q?tR0sWEuhHZyx6vzfFnnAV5A+LJ+CZy5J+EoJEUKu8YVNG7+CuyfbzdbGofGj?=
 =?us-ascii?Q?yHkTbl2Tr5Eyba+9gQBCj+Yj3rG+e0u/xVmQMpEQzjTSZ1vbGLIddZ2YT0kX?=
 =?us-ascii?Q?wAHraHy/h0dDJjs5J1FVddm9iYaW0vZQ1fkNbjoRdSSpbQpxCoeRvXN3YMog?=
 =?us-ascii?Q?svytSVfQ85INzLbj7nuyHhoC5uwlM93MhV+9mQMd2Wk08DL33ywRZYeUL0As?=
 =?us-ascii?Q?Khb1j+ElKusxh3cLZ7bFTuDg7T2jiDqo+dm0kHIzOY1z7fs+f2juSOi/6UWY?=
 =?us-ascii?Q?VhhsojvSbFeJVe6eBdtiQYIAIn8EnlFQ++uZuwp0quFVII14KZQY5aYJBZ9s?=
 =?us-ascii?Q?b6kNg529HtYB6z94eADvEi+Zb9l03plH2ti7v/RXDiXBu05sk3MG8ax+/rvO?=
 =?us-ascii?Q?GGtRYzRqWva3AjouGmma+HSLCGNXifkZFCZZCGBRuZOEcdGdnVkQ7XlXzQfm?=
 =?us-ascii?Q?fhcWScuvoLE6zXmzrouNtJfQWAX37tzo9rP3+iEb/jHyBKTyUN7EceI0ueZE?=
 =?us-ascii?Q?+EdN+o+rvt05Nf5eE6nmb2iAz1cOmDlBPfL9SQ6c+rnKpFc4vRoPHFXpi4a2?=
 =?us-ascii?Q?tnSzUpZ5UTlJB8VrLoA1++m1A6X2rOiKV5q63zT/XEdKIj/jtu0WNGdjFqIm?=
 =?us-ascii?Q?VGMGtSJCvRQ154l+MXNL9m4o55xjpsqPJYmivJD5HvhbXuIEtDQb3auqQAXt?=
 =?us-ascii?Q?7E7TgwO2BOuNI5K+jZs+CRK4TJNEVaJ49W7O7xAh+M9X/ac+G3blPHYGhaFy?=
 =?us-ascii?Q?oPcfv7rhv9BT9T4WOfdNT9SCZRgC75W9q65iWbYBSBo1W/7gPBOs8bNHnI7b?=
 =?us-ascii?Q?w/J6u1yFejcWfawBl+bg/HBVPiXwVFUNswRosqRKek0grGzXIPIEBGeZFCvE?=
 =?us-ascii?Q?tEWUoeC3bEWAkCFmwDGjqX9LAqjR/NFapY153NZ+d8H6BH/0167Gb1+kmo35?=
 =?us-ascii?Q?pRdUxroBDxuhzqwlosS/yQZMJCVXQ5q5Hio7wgGkf0j1UI/VcZ133JRYPC/i?=
 =?us-ascii?Q?5rV9NoitcYz8DnIsB7qD1pHeOfNqRitPthT85nWZyHHgtoqRMDoMgD9CwsZz?=
 =?us-ascii?Q?id+74r+/+rEJS6ZTKRbIPK0fmId4Mcn4wUcn/ZdxxL4WIscXcnAdNMpVv54a?=
 =?us-ascii?Q?Q42486ZRhZUFSAnx8GgbBmqkJjZN+eCFIFZZyTq3aTZJtWmVrxmbH/vmgOr2?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CfvOe518USMtqkN9GV7q83xwHLUTm2ZiRd6CxRrtNibQtGozjQdJmcBKPOiDiA2reC0oFG9IjZeD7a24wIgHtCLfcS4Yq0M5P87rE9mn1xsbgsIHmUfe360KXdGni9v4TuPE6E4VVDUhAtsmzKwS79eKatdGsc80Gue7vuTfrjwwgigxaxOBO8frWxYedbPfWACCKu89DjmMV9/uPYjREPMQhi29eVjBEGo+/F/TUKy+X9ljGyuR9+NlVUxcpnmnS05L3FlOu1+zhp5UA+FrYe2w7lmxpngsSBnkUEqc38o9A/n4ecqusQ1uMcEbClOYJajpL5We4ckqQwvweiHFxYiPpxQpl6i75Vx3NWSE1FxnQDBNuAkrVcbzVdDw6Pyop8H7V71Y8iWzdW4sQY19nCSepVWtwHbLu5P56mx0DVcQOj+v0UtbYtb/sHO0lrju5nlKDkWZ40Hjdkr/qpGYvdaXFhc5QcBBFEgeue71xu4xWuxt80vlPW6V1vHDkEb6WqJIaY5ALE2UtfoOfvI18/xGJX04ehkyI1Ns7Jngst/8v1tcxygpXpVI89GcO7eW26OLEiNpuvvp08l1kdHZWMVn/9UqKLDk5YKf+MjChfQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34f7f32-ef68-4694-4d19-08dd93c3c705
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:18:42.4726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKtSlq56Yt/ysbxB8+99MT8NSSRL8yO1BX1VAXi+C9NcWNl0aBlVbHmd6hg9qXTAQD0VkdPIx758Kr7/p1ekPHeqMw+CfWOMk0BP8gZ/ejE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4634
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150152
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1MSBTYWx0ZWRfXxoS+yElA7zOs P+CECJ7ggu1O5k+CLGZH0xCX7vZL7Z94Ccd63qP9ODCXNVAvy7v6Cm4xYZyP0zaSnwTqMx+KL6v gC594qTtZ/hGFJT0HMZCqfLInN/fCAJLckN2/JTQcB2MAjEBCnAzYynWePyiMYmHsjSAIzPBKrl
 qZM5xjZLnsTanHCFdJeXswTL3vYHI6mNGslGZ4Mf6XmD5HC4zesqCUM4667MHdeVmtU3tovBO32 hrg6PO11lHp8+zTqZOK6StpryJ4mM/3r9x8mkhujBmWpvvpyHLiTFtbCyLrAoirY+RbNdG/Wp4y qeW+2QqQr8GTHAdu+8jRDn0k/QSSsukc73AAlran3SuaN50XIEqV/+zkXPBSHtPwmkywjVp3udp
 fIiDnfG7XTQ+apo+qf3G7fI4lipQYQ3WE+JtBEq1rRQU5L65ooG0eSJIrElla90HIuEDQNxH
X-Proofpoint-ORIG-GUID: p00TAXYDt2fIepZPtXUH6qPJkyv0RPAU
X-Proofpoint-GUID: p00TAXYDt2fIepZPtXUH6qPJkyv0RPAU
X-Authority-Analysis: v=2.4 cv=P846hjAu c=1 sm=1 tr=0 ts=682605d5 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=Rexdl0gVkyr3oLZOuxwA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14694

On Thu, May 15, 2025 at 04:58:48PM +0200, David Hildenbrand wrote:
> On 15.05.25 16:56, Usama Arif wrote:
> >
> >
> > On 15/05/2025 15:44, David Hildenbrand wrote:
> > > On 15.05.25 16:40, Lorenzo Stoakes wrote:
> > > > Overall I feel this series should _DEFINITELY_ be an RFC. This is pretty
> > > > outlandish stuff and needs discussion.
> > > >
> > > > You're basically making it so /sys/kernel/mm/transparent_hugepage/enabled =
> > > > never is completely ignored and overridden.
> > >
> > > I thought I made it very clear during earlier discussions that never means never.
> > >
> >
> > Yes never means never
>
> Good, likely worth stating that clearly that there are no overrides (I did
> not look into the series yet, I was only responding to Lorenzo's concerns)
> :)

Yes, never is enforced after all (phew).

But we are setting VM_HUGEPAGE anyway... but at any rate, discussion is
ongoing of course...

>
> --
> Cheers,
>
> David / dhildenb
>
