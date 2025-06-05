Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174152C3242
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749114886; cv=fail; b=O4UnkY+Gm7/Uu9SpZ7nIjjHuj6wGxanIbuLjy2SCAWroQ74RW234cphObr270VIsyW4k+wkSkqs5gNIht2H8kWqt7WES60LjlubwHFlsvs7jJvkfJ0eOCEOwzL8krRNm8Tjw36aglb2hKdrydELVHmFiBIi26XQriba4D7Ie130=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749114886; c=relaxed/simple;
	bh=Oy9Rkjuw8VqBqlv1TQLWHp6t2tAjXSqssa7DT9LUl08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dL0YxEYRvM1RC0wigyVgBtdMjNr8RXiSwmc+J/u977hcgmYzgpJ6miIkmhYrCjBzquosbOocJq72lo2k1ioVt7UAASPWVgzoKxxxtVuGJIuqMDMToydGIOOAUEM9Fa/3KQ9uUnwPdbkA35ju2h4222ZMH5rT12v6QwaO378Mspo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mnshy6Bu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HdaSdzDq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mnshy6Bu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HdaSdzDq"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5554vL7q012515;
	Thu, 5 Jun 2025 09:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=P7+euMDdmMEmnQF/6N
	2dO456K185gPi43g33zKdLMRE=; b=mnshy6BuTEP0VD62f6IcpSxsbGPjh4ucT0
	JK9ehuD5K+5OZ+hmjdSsL9kEO2GYUM+jHW8yLrotKHbQRz+Vjx3nir8w0dodXTQz
	thq15/r/ohlD0jNYPQo4iCZyyNZU9M46eTO60CfmLlVHdM66hOC77aPKtI6BD129
	uC5QjK4ybmM/rkj084xo26nHNTXo3wlj4ADpWR1ly8EXflX6tRxthZrLpYP/798w
	N5aHGZLB963Te5KaMByIBYotrDmGYuG1W2pZO4ZkWbsgJ032b8CxwxsEp4U4XkkO
	HmKcCBa4gZk4xK3Dzmkn7M2QgvGb7rqMQQ7/5g46WH229xBDhCdw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j5u7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Jun 2025 09:14:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5557JFuQ040614;
	Thu, 5 Jun 2025 09:14:26 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazon11013053.outbound.protection.outlook.com [52.101.44.53])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7c31jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Jun 2025 09:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKVtjNbgTNfKFzzkfPIo1t6udRj0LD6ezBs0SY7t/oFFfHmnCT5UQgVi6B0Rt65aQ29HS5+AXFeP3Tq93CVPjlLCWfGZQBshs+6hDTw0bmfW3jksNWCKSTIl/+KQgoyhqr+HyROaFXt1TtovzhUDNslHncgGSqym5YKUG6khRvoKC3uCr4o29blhMCWUSlev6sVn6zam5qBVINnngb9gvG9CGhVOXZNJTw+MjsVADbZMzIBOBmD0Tse7eYAr0TnM3CBMoqR/VQjXkh97mcTk0icZrlbx2jUqqASW3U8lRTDWEs7xVSW42x8/VJF+Bb8anjwmH2pswbGOamAaiTshtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7+euMDdmMEmnQF/6N2dO456K185gPi43g33zKdLMRE=;
 b=yC+AG4czlHM08rRajSC7UGSQ5RkHrEfu9Jg5qoEaqIJVBBQikqtCGbeuc9W6mkjppWncbwF1eWVwqS7Vb3mQeqMH1lY39W/0QZnYTosdXmO/k8SS/AJU9xeCodImMMmetzX5crfXOYEhbvJbGqjOdWaYnlwigrbmEU0cDKOdLK2NVOq4cSTlf1hivXoYkn+SsJEkQEW2Pa9mvO0IQZB9ExA4/KwEsjKDybhwQISj/BS4hrhTZ56ZbFBSXvS82BZN7nCRdGDbdfJP4eXFQOUZaY2U+zysESS8JROvLwxuwMML/zuz+dKf2GcbF3V4A63vBaMFzU2EdQUCPDz4oVcCqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7+euMDdmMEmnQF/6N2dO456K185gPi43g33zKdLMRE=;
 b=HdaSdzDqkf5iUPvbkXBtUFG0LYVqN3SKfH3sKoHtVqcIdj4klswkzYHb1uHKVDQq39PZ/bG4pLFfapEEr7vj6MT0PYA3MkrkPBHS2neX/STlFEt1/uLDI4rtzfIP6iqK5USw9dJ75uNEvJ0nE+bRFq6sDwsqv74WUzYMUUGR7os=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by IA3PR10MB8273.namprd10.prod.outlook.com (2603:10b6:208:573::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 5 Jun
 2025 09:14:22 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8746.035; Thu, 5 Jun 2025
 09:14:22 +0000
Date: Thu, 5 Jun 2025 18:14:13 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>, Dev Jain <dev.jain@arm.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH v2] mm: madvise: use walk_page_range_vma() instead of
 walk_page_range()
Message-ID: <aEFf5Xw9V79j0W88@harry>
References: <20250605083144.43046-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605083144.43046-1-21cnbao@gmail.com>
X-ClientProxiedBy: SL2P216CA0092.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::7)
 To CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|IA3PR10MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: e19e97c3-115e-49f8-d980-08dda4115bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hORMMPlYT7uRIm51LBxTY5uPAs46r1GRftKp3JISojBHEgrTj/NrSTXrYYK6?=
 =?us-ascii?Q?WvS4V7wPk7OE3c7DvZDYZz/BDDy2TkerOcBF5n+hzXWAVlxO5zbPijKuJfVQ?=
 =?us-ascii?Q?WfzlAirf/cFE5ldoaMMocI2bVS9CRbdBoAX+pGR3ZzaVw/qyDAyt4Hv5zOmz?=
 =?us-ascii?Q?GvhHaSR8Lz2yWM6gwgiHkaujT9xQVy3wOUTHXzzaLmD2HC+nySUePZXcOMNo?=
 =?us-ascii?Q?DkAgz+J1+PljlZbyW7MaVLeLBNW9DqJ/D800ZRdzrp0e4wKsoNXYBnotuiTu?=
 =?us-ascii?Q?zUZFIJahpZLBtQWAV2cDUHdN7QPrqEIJTgkJQ4hM4HEkWc9HI6rQQo6qAtMi?=
 =?us-ascii?Q?OZjG5ClalL/jJY53r7f4o4YgiB19G9yhFiTgWNbBaR2Gk/FjCMTpLq1eP5dN?=
 =?us-ascii?Q?MhnFVIIoz8tGh/11TP6PAq4QJ1uBSpNJuyuCbfWusKkp/rESsgZtRs6E6DQp?=
 =?us-ascii?Q?V9DFhxI44U7hDkeFAGsvvhY9+rgD8P0NkgxXW5tMi/fU8reoomutUfqyxNHC?=
 =?us-ascii?Q?GyRORfJcBwf3y60MXdKppO/G6kI9Hv6Ha5WPxiHZ+hZ11yvh9Ays2SBcppC4?=
 =?us-ascii?Q?BcNLqNnnPFc/scgT79OhLRUwjwLI6A+e+YDV88uTlUAezsBnYEPWO4QFU9NG?=
 =?us-ascii?Q?+DL9ZYPIZXl9UqGZDA9GvkLDoe67wiaVq//5bqZBUyGREeuVYVwGmVT6bQaa?=
 =?us-ascii?Q?AWw1QLE+DL9IhLrhR45VnKp6QKJqrODwoP2RYYspr8xcY4rcSYZZCSv5j25n?=
 =?us-ascii?Q?M08/JmL+NfgkTlBCL8BnTdFnGeKlhWZspBsvdXZwzqp3WvcxZJK/4CcQjZJ+?=
 =?us-ascii?Q?YwmtW5D2Tw0S9Nua1Prz41VpxjMIzCpf1jr8KU0cH7vgz4ivvj1/jjHjgKrP?=
 =?us-ascii?Q?taOu10Bx9BeoM60Jeux/+6gix16tv4yKX06G4ShNfr3tcj5+AjqfAxRje9mx?=
 =?us-ascii?Q?G8uXZxWLqjvTFsDa4JteshusV/fewZFKgGSkCTMHWSNzUD7FkeSkeaHbo12b?=
 =?us-ascii?Q?gIXIPvfC/JQF+2lNOiYT8HVoCVKPdVU4FWWdPXomloqNo0z0ZKahw/g5axwA?=
 =?us-ascii?Q?jLEEZY1evPao83VMjeoq7uWgowDhDpYZ9Pu+n9hFI1m69zPv769NbgRyiWQa?=
 =?us-ascii?Q?zI4n40ZnTZKrW5hbTPqAQtBCtExOl6eMlduQ3jaDSKDmtOiGbIrM0SmIXEUi?=
 =?us-ascii?Q?Z+moTRTi2kcGhSdLf3+wEtJFHpCopB6CnjUKkBK8guOmEwVq5p3UcfcB19HZ?=
 =?us-ascii?Q?4dys4P2fY/ZoYnvmMhNp9wSSe/VMNKshN0k+gRA70A41bSWy/r54SbWRKiHj?=
 =?us-ascii?Q?019o4F/QpHKKI1gZWoISGQobO2XFlPUQ0X0gV7xR8DLeRXsJwdwm8pYoB+rk?=
 =?us-ascii?Q?X4+JFlrdboIiXl5UPvMMMU3ZsCLDYamDpkqyU10OJirbcN2we4kACbPya02q?=
 =?us-ascii?Q?p137lB8D0BU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YSvssiA2PiiHaN8wxmAlaSj+t/sRGnLUK60CLTjLm6R9aWKwSbf4BzbVgw0D?=
 =?us-ascii?Q?fn+JkwCo0aUVNfDBHxJ4zBRxUVDQnQRlo5nMJSrbww7scxmMhbpNcqikL1HS?=
 =?us-ascii?Q?ZSdQGUERrW1ST2DQepKmOW9e4GVSnf7tG348LqI1BbcxfzhvPq8G5/cweDKt?=
 =?us-ascii?Q?pxq6v5UPae5NSZQ6dt+oF/QpolEoq4vHivBcGmshoXPjS7bx5XF2XLwfykth?=
 =?us-ascii?Q?2n7osFWwJ2wPaPYvYsJH/DtRZuPR3x79IbmO252L/z+r+xpy9FlS+KPFwkft?=
 =?us-ascii?Q?JCV79RRRcYYQHYlnMjtHywhaYm56S2i5iUgJ0gl0f7v5VRc4uwL17/RO6fCF?=
 =?us-ascii?Q?CsuNhYbN8bGrkad1jWAUAkj4kbU48VtzuCq5pEvGZItdrCS+r+Bhre/xX86C?=
 =?us-ascii?Q?didkLgKMcQ4WcrG41qcocDrT83OINEnWheeDoxZxnYjHG6z6F7N1Q+B0HVnX?=
 =?us-ascii?Q?jPU4mvQzeXZYEsHcR5E77z+uIGfrV8NIMGp/V+mHa29VXd9NhUy/IsjomMyL?=
 =?us-ascii?Q?kfl7geGrCpGqQuvLT4Z/+liLEWtGgTJeF/495oW+fIolZNvfPclRDViX1UaV?=
 =?us-ascii?Q?I0aWHhAibZ8O3T8mfKCVVdpaalXFa/IiD6+qbLUYdeLaUswNg2KAMikWqo7c?=
 =?us-ascii?Q?POCi3JAEwiTvBAnZJIopteTNfCmagNwUW5Pbf0DssZyPw4AYsfVXGcldBCgz?=
 =?us-ascii?Q?7As97pZ/9rvHkyjVDCHR5lekTnoag/5l0Vhn6pts+u3FGbDQYGcpHw5POAKG?=
 =?us-ascii?Q?wD49ri638MGQUgDsZpEJwrGXLFvst5UN8Xal/CaZmDppSytB6Ovw39YkRHEC?=
 =?us-ascii?Q?kQk/XUlJmANa2Vg77KwdcBOhIQcZqTs54Ts4GJKtuGqv/iebgBBm77uhVsjf?=
 =?us-ascii?Q?o4IM2y45XkjWE+k9i4asq5o3OwQZFbUteigwzLIE2wFDKddXhNpShptrhOFn?=
 =?us-ascii?Q?uQSocntg+kcuCDW6yy9UtvT443Mry4jqrBQbVjnckODDFYTMQ8uTn99s9NVH?=
 =?us-ascii?Q?1yQ8Y7Nn3lK1RHRlwkJKoEYr4ygjoT0Glo4WyjtuH6K/aKjy8zUz441Jle2U?=
 =?us-ascii?Q?ME99zBeqEfz7SMQl1I6oZ5QkQ4M38Qk2WgnL3sjqagWh+JFbr679Pqa2EHyh?=
 =?us-ascii?Q?0k/6EsLlJ4/l2OBZsoe0sbmOBPQV2vdCQ/ivxKOwdSpKPzDe/lv6UecbrpmP?=
 =?us-ascii?Q?B57oUG8Ad6ic5xbZSkKxLtgca2HpoYN1T+i2hRz5w8xJl9e9GLZYEU340sXG?=
 =?us-ascii?Q?9tf4Nff+dC7XpR/+Hn3VhuSRYugAMHV0vR9HdfvLA4cf/mPsXPTgwNq5N+2C?=
 =?us-ascii?Q?3ArxOYmUR6wzTwWwBC3TnrOp75hXY0xm2oSqPV2vnSEcbbhT5I6eMMQiC+m7?=
 =?us-ascii?Q?x4j1X6x/cOnHxtaViLH2aTcd3QaCiyUv44lGBErlCdH+d+JwFPbmhGv2Kol3?=
 =?us-ascii?Q?zPy/E4LrK5SDlVPzxSeUQjIxwjV4P0dTzomObTnXPufiVN801YGy2OBWqBDd?=
 =?us-ascii?Q?DKHHJ5FWLCyj41iQFvjZm9abRNKLYBXRtgxhvaflaV42gRRAW2hFvKAeKiXu?=
 =?us-ascii?Q?nozqUy/QEJ0znKzfPEWJhfNcyid6QqmicSn/XX1t?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RAHUcUnrPyYUZpHgLflDu3Wf6KFfUmL99G+gDOTiTPTvW+NIvGAbrZL9ck9eZK9S8/3eG7x6QbhPcPaRTePhqGShxeQMZQ0K9crY7niFcIO/CSFgpoFHCkDEVGQQVHoyWttPGl97LDGrk5dvrOA/g+o05JeF28kyctZan0uHovDULSBt5/oApee7UUM4CsTCnn4aYBVRSl/D01p5Ii10/y+QifYeemIi3mRQan8xpltp/yvaBzl23qTSiPBKA9JWBV2+jvvcFUG2A6qB31dRdqYQxSJTkh1nHCFsIDMEjwGYlAKrhBy0/wTYPF42m9JT8461he1oE5hXL5wwIjj9jyq0USPUX4EOH7bYhfuEN9iFUuBHW2CZQYVleiUGsCk7CL+U1Qdd9OsaxlET55b2MYzmBHunMEJxot34vWYegy71zTgnGIewF3t5Km9h2Ep27VWxvbEgym/lkddgWI0Xp2mLvhmPAbFYJItAE6Z8kw3RdrLlfTcyEWU2U99BOrd/y2FfbTRKRiQXv1Ax4KDmpXJd2BhpH8yRMXc+i04JtlVrwtijXaNxIY8KSGi0zGZmcrzgWGoJB1SJamQNLsfwNPI50AvzfqjMyOz0NrKOOrA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19e97c3-115e-49f8-d980-08dda4115bbb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 09:14:22.1062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+6a1ZSa2UOHbuXLsRfBqM9b8rzR/wF6PhBaytrCU8FinDovUL0WAtDj4Yh/dxXI/mdn00CMGJX32hhh/zvk0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8273
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506050080
X-Proofpoint-GUID: zjVGkwVDw4XSosCUKUe1EAlX49_WjuSR
X-Proofpoint-ORIG-GUID: zjVGkwVDw4XSosCUKUe1EAlX49_WjuSR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA4MCBTYWx0ZWRfX8nwx0UBI0QU0 m7acBssORaHiewBBWmcBXCq1DXsyj6QmWEDz70B5wPOqtkoRLJBzJ9gp1NSzmEbfYAF/Fst0ksC YvPl7l+gZNipPZCVhrpMpMQo5tffr9H/A6K1aUWwVG5BnrWQAioxKQhFKKzmxwkCp38gU1DuAAx
 SAFDBairi058iwxG2UDYNhDq1reqMlCyR+ZkJ+NUiMuKmE0JVVCAel/SrInP3N/hKaQxishDJbO WvtCXEczubeVvE8sRmP9QVF2KakqS5Z5jhMnou9gTMEd1ryIkDNPNWAO6QQJuw5yIdbE8x2fAz3 gWFnSupRrObX4g9UvzIyO0sUEN8AfoMCqRl1Iz03nhT4LTDUzn4QcvMN64zA83dINPhBctfUTMv
 lP5MUHSX1H/h+SF3r/kW3EKCQRj12a8lQIg3THheACv9JH89KcxNhfvMCMUvP7NU+c5rz7H5
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=68415ff2 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=A2pY-5KRAAAA:8 a=7CQSdrXTAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=dFuSpcEOXWYjqvXh9jMA:9
 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13206

On Thu, Jun 05, 2025 at 08:31:44PM +1200, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> We've already found the VMA within madvise_walk_vmas() before calling
> specific madvise behavior functions like madvise_free_single_vma().
> So calling walk_page_range() and doing find_vma() again seems
> unnecessary. It also prevents potential optimizations in those madvise
> callbacks, particularly the use of dedicated per-VMA locking.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

Nice!

Looks good to me,
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

-- 
Cheers,
Harry / Hyeonggon

> ---
>  -v2:
>   * Also extend the modification to callbacks beyond
>     madvise_free_single_vma() since the code flow is
>     the same - Dev, Lorenzo
>  -rfc:
>   https://lore.kernel.org/linux-mm/20250603013154.5905-1-21cnbao@gmail.com/
> 
>  mm/madvise.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 5f7a66a1617e..56d9ca2557b9 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -282,7 +282,7 @@ static long madvise_willneed(struct vm_area_struct *vma,
>  	*prev = vma;
>  #ifdef CONFIG_SWAP
>  	if (!file) {
> -		walk_page_range(vma->vm_mm, start, end, &swapin_walk_ops, vma);
> +		walk_page_range_vma(vma, start, end, &swapin_walk_ops, vma);
>  		lru_add_drain(); /* Push any new pages onto the LRU now */
>  		return 0;
>  	}
> @@ -581,7 +581,7 @@ static void madvise_cold_page_range(struct mmu_gather *tlb,
>  	};
>  
>  	tlb_start_vma(tlb, vma);
> -	walk_page_range(vma->vm_mm, addr, end, &cold_walk_ops, &walk_private);
> +	walk_page_range_vma(vma, addr, end, &cold_walk_ops, &walk_private);
>  	tlb_end_vma(tlb, vma);
>  }
>  
> @@ -619,7 +619,7 @@ static void madvise_pageout_page_range(struct mmu_gather *tlb,
>  	};
>  
>  	tlb_start_vma(tlb, vma);
> -	walk_page_range(vma->vm_mm, addr, end, &cold_walk_ops, &walk_private);
> +	walk_page_range_vma(vma, addr, end, &cold_walk_ops, &walk_private);
>  	tlb_end_vma(tlb, vma);
>  }
>  
> @@ -825,7 +825,7 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
>  
>  	mmu_notifier_invalidate_range_start(&range);
>  	tlb_start_vma(tlb, vma);
> -	walk_page_range(vma->vm_mm, range.start, range.end,
> +	walk_page_range_vma(vma, range.start, range.end,
>  			&madvise_free_walk_ops, tlb);
>  	tlb_end_vma(tlb, vma);
>  	mmu_notifier_invalidate_range_end(&range);
> @@ -1160,7 +1160,7 @@ static long madvise_guard_install(struct vm_area_struct *vma,
>  		unsigned long nr_pages = 0;
>  
>  		/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
> -		err = walk_page_range_mm(vma->vm_mm, start, end,
> +		err = walk_page_range_vma(vma, start, end,
>  					 &guard_install_walk_ops, &nr_pages);
>  		if (err < 0)
>  			return err;
> @@ -1244,7 +1244,7 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
>  	if (!is_valid_guard_vma(vma, /* allow_locked = */true))
>  		return -EINVAL;
>  
> -	return walk_page_range(vma->vm_mm, start, end,
> +	return walk_page_range_vma(vma, start, end,
>  			       &guard_remove_walk_ops, NULL);
>  }
>  
> -- 
> 2.39.3 (Apple Git-146)
> 
> 
