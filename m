Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C301E28C5CE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750149280; cv=fail; b=XhlGqqmOy8rF0hwMRryTyuTWxWSzbOHQlaq7Dmqoj2nFXT/NZb/EzmQoJ5VOfBpCb33sNcamR7Lygo5Ssd0jNLi7zQy2S3xMIEw0+oUUxR734nSOfW3nOdRqTMIWKE5qV+kPVffol5kjQIg6sS7sZGtbIRYuNT15zq0+NJD3PRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750149280; c=relaxed/simple;
	bh=YWnjQM5iAJsHZA9d2hcDjKCT/XaJfhVoxHzURROBoC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z6G65ehHZ53YwoNd1NTl/KNUsqbAAd0npipzXOeJjbqcRAehUq7FRzuVDG6YmqI0GTGrnpn/+KPhI7BJ1ttoDFDIQdfLCUO9QP3NfjsULv+hekbjjuWy1iZNnn4b5MLZwhMuO8yDIozza0T6RcIr1KQpAF/llFPzokgs8dD7CaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KWwq1cHF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jP8r2jwo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KWwq1cHF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jP8r2jwo"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7tXel023890;
	Tue, 17 Jun 2025 08:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=um+D96vr8aiwzCI/aZ
	Ym6mNv9ANP0+ZvxacXMo0kBsg=; b=KWwq1cHFH1TO3IoQFnnSsHS906Hk1shnv+
	nCkir2X/4aZTPzqCLcQPJ8j9Gmt/qNcKBCAqE7YIAncmNevcoFLY5mBPhvAPDmPW
	iZNhLUF9o4VHRWh2NU2WKVvfv7G5v+995+lbPcTIMueeYT6DwOd4+SRJDznkkgUK
	eRUAic9uS139glkz4Gc0Oq4LDIguh/+cDOE0Ej3aBHkdvjBzYX+wV8YZUN7AbyJn
	A93mDBoa9VJcRVvP12MyCMWLmGsJ4mqaif+QKWgYv/gFGEsMR4O6Lpqi9dFjXwHn
	+Mo5x8FfHCBLmkD4Xeq77gMzoR+IZiQkoL4H0YWHmccdYGwXciGA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn4711-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:34:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7f1BN000884;
	Tue, 17 Jun 2025 08:34:26 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8xwm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSYzgW2dvz9gAVTeiLs8LnxIHQmUf89D6PK6OTWG6A2o4pFa/8PuvHMlYtn7mW0ozps4oQgf8OW7nGyBFbSfx8MVeBfUzdHONC7cpGb8sLbS7uN5v3pKa6FA1SvcbpDv4nrjkPobty93tPLKDxPgHa5ssomcpkEc3d2OHELjJUIxa4fz4tgHyCu+txaC7Rar0qu2gmIdger4JQlG+hOGardChPg+195GLRhgaHufwjA4B9Wp7lkNdFMXSVPQHj85F7MtlWRFtP5HFHq3vFWaOnXAC/3meXq69KDEYifhWIgK4IH04J5+qcO6B6JsQppn0O9dhtiz2W9uCFLG61YYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=um+D96vr8aiwzCI/aZYm6mNv9ANP0+ZvxacXMo0kBsg=;
 b=d7Ui/OfVt+5FAJHas6j5rPEEPGWXvGjKtZRF7CLNTVqVafvR+aUAAnoKy1P5pL9LQ5tYNUpYDgRp3o5aosNWBMBp5S1BDtv90qCodgItsPGKTvGOrmH0lIm0N+NvCBhCXpsdLHimxGHCdByzPCq1rUXBbt9TYJ1y9SuHLp9xyLsVOUGxA16yHAfRcBC2q3u9HYzTSPGyExtBCknPbQ6EDCHZpg7NhuTne7AtlFODLoWQOlM5c0LsDo49aeYdPCqig/xAt5ktbkecPNtZpYBKv6SM3HBM3aYRTbSuzcoaNZf4L4LZoFW1LQ0ESjJTS1yF/4hjQs4hGNbFQvx60qSkXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=um+D96vr8aiwzCI/aZYm6mNv9ANP0+ZvxacXMo0kBsg=;
 b=jP8r2jwofrhPdVpjz3HOWmSqm1qjiT/rYxbvTOQgmyhKPasXZnRoo1Z7BwCT+Zy+GrbSGhUeEFD9mUTRZ0xYEuXDyx/ku9HZuSOlpRQvFJ4cG7siAbBHwtVv791cYcmEV6PBRmCKT/FiZzvmQL1ztqqNQZ5rIiGVuOqAhBmxR/Q=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4603.namprd10.prod.outlook.com (2603:10b6:806:119::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 08:34:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 08:34:23 +0000
Date: Tue, 17 Jun 2025 09:34:21 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
        21cnbao@gmail.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
Message-ID: <9e80cea5-fa78-46a2-b2bd-2f3846c24a34@lucifer.local>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
 <e61a7aea-a87a-441f-809c-10acdfb82df4@lucifer.local>
 <f0a867eb-c66d-476d-8391-f8a4e9968c75@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0a867eb-c66d-476d-8391-f8a4e9968c75@redhat.com>
X-ClientProxiedBy: LO4P123CA0561.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4603:EE_
X-MS-Office365-Filtering-Correlation-Id: f2387793-6d50-426b-87c1-08ddad79c366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j0SRFmgGYl82eW+ZqR+A6JuBcrvd8Soo7NUK6Fb548bGJXkYfBA9pLzETEiU?=
 =?us-ascii?Q?nTgne5XMoUVGKz7BoDJc33+kkAeIMCzgk99Lai/6dcZoJ/lNdrCJHz5Cq6cI?=
 =?us-ascii?Q?+KuiaKucwZxWYmsRpZV20sqUMKjMPTiQczC9wmOKgRsU/MVlijzVWnZkm6yj?=
 =?us-ascii?Q?CwJeJNDwWmIL5r+GgMjn8BBDliLWBzEb3GDocsgGlHlyBOagy7SLVE40YiLB?=
 =?us-ascii?Q?QPeK8g6SCbgIIwOGO70sCKcFIdbvtVFRM28LXESmhsIzD0I21c+haL9GGnhn?=
 =?us-ascii?Q?y1S74exmXcbj5Qg3gEMxQcSIzRGJuZJXzPQl9Due9dBwhRYPUVwn5dJXgC8x?=
 =?us-ascii?Q?93pIR6QdkTJAWH3OPvGyKLg9MT79nFsO+5zbeEC4hnAa0kuuLUE9YQPbLjRm?=
 =?us-ascii?Q?NkGXvtc0ZUIuqwANo+kUFB4RZsJmKg0vAPwjxJK7LGbwYYsbbuX1d6neDEMb?=
 =?us-ascii?Q?z2c87m7i5mrj8SnCinVB8HVtu9gK/ksMcvGhGoGEKZNxFpSYAcFh5Lm7S0db?=
 =?us-ascii?Q?a7cFUhIE8LefcVuCFVTE4cX7tb0PmLAty5aMpctAJStqVTdMlpsJ+j7esfpA?=
 =?us-ascii?Q?9TJycC9Uz11msZnUsBWU4fXmaZYM131HViiC8kxA4E562Xo16P0Pjvz2wQ9I?=
 =?us-ascii?Q?teae9yAf5iUfoXT+TDQzYrTzPmnnhGc9izZx9KnAKkxeZXhiAL+iEbTokkWp?=
 =?us-ascii?Q?pjWnb989PKIlbSjYk+zWeAGQDODc8fpN2NlyNJbJ+3v44FxIQp/HKbF+3mzy?=
 =?us-ascii?Q?xL6BjFzYgd2tiU6fMiqpkWc7F5VWJ7kJwMbzx/C5LUAKyjsIx0WsRExoOTlm?=
 =?us-ascii?Q?hJyFOJt3EpVUN24tBf6fwhIe1HnEn6SF52Z1YyjemMnNaP50jthS5qRRa/Pd?=
 =?us-ascii?Q?ph8RiAEK7lxcA6Fxv44GJ8T8Q/wnmK72GnCwsOmXJKSBKJtXGLaB/tt0NyGI?=
 =?us-ascii?Q?7TZnaXy2e0mjXb9f7PbPNuq29zLNQan13ROgkPofirxAiM0B5NXukpm6PAE0?=
 =?us-ascii?Q?5YWFTXzx9oF6I/5b70Fc6dC63ZvvSPiwDICdJH/sFv1HnAgEpIaE6FHnmqmC?=
 =?us-ascii?Q?2YLCxA+qOmKYm+jpYlZ1eS9wmYSP4zx3th6++wQWraPnMSA+zj0Sn/yUVQYv?=
 =?us-ascii?Q?KjfZKfLKBvP7F3dX3UaPsa1HYtzvEhdTGKNmmzOuxXpIwQIpqXxejMZ++yWp?=
 =?us-ascii?Q?IHRp1XF6GxQ76wSQp8mTPv7wBNLPy5YhJJAFg4LENBuKojmBNjj2vcVi7ZcI?=
 =?us-ascii?Q?0dA9URfj+Uh4LoAc2oZA9dSoj3y2BsM1tqTlRCgZNHCdAWGydCumBhQ8umd0?=
 =?us-ascii?Q?ceasIpkuKW8wOndJXofj5Zlzv6+TMa2i/TfdRL13tQbUFr34JDe+mX/V3dja?=
 =?us-ascii?Q?rwdgo0xOeD08JC29t1zLuvkwnoxaVR2wP6Q1/OI9TOFMcKH+NA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t9pbJag0vKrkmZQ5tT2PcY6DmjpoUJUO4ckwRUSxyRgLKD9VxYyVpMrT3HWp?=
 =?us-ascii?Q?xOrsyFH/IenMC/NDObOolO59QdR38iUTSRb66kJXKSH8IL7xMkR7IfDATech?=
 =?us-ascii?Q?1MXhh7QLyWNEwnjXrgTGWsYTeZOZwBc2BkSOa3F0QkfheATd4nvtNcsxhsQ/?=
 =?us-ascii?Q?69tDlg13388mRkF8GQLKChDi7K8hAVkh0P4YrSO1uvKxtHH4OGBX2TNj8iMg?=
 =?us-ascii?Q?i9uHKH3T8jupT6qpBOz5jHqnK+Z3BsXffczEmXbAqykvU1d7nuopnXk8IBeK?=
 =?us-ascii?Q?gVurjuIk7LdrlOfK411XKJdma9dqS5YqWGu43i280ulr73LfQRdimlMMV5pI?=
 =?us-ascii?Q?IM0WXS9MZmaf/jTQcGA1H4uFIJTNv/HP+7uArgJ7LZJ+Bs1UJDmwv+kGovEG?=
 =?us-ascii?Q?r8zo8kzRMTC/7ONgWzz7IAyyZiKR2Cj1pMdK0NEJsg5tW2TclV0j9qwyyAd3?=
 =?us-ascii?Q?NwOU08xb7mtrqfhITlt496fOPM+b2SzyyHw3fU/Z/qRnZ7QsdXfupcol38z7?=
 =?us-ascii?Q?X9vUwp9+VLjbr7e6pERBKPE9DqlYYEHIGDKyqD8UC/LX54hlW7CZXxZ3cXfo?=
 =?us-ascii?Q?J9ND3vQCd1xzb76uufuJWZ9Ni6aVB6+mWrhPvXmzlt3VsCjx4YQ+JSfu7noJ?=
 =?us-ascii?Q?3WMYZgwTnPM26sHuviA9opUA/eLxcHvnqXP6CmjW8ffkXT5K3rdi/yFYOCQk?=
 =?us-ascii?Q?/6jngPu7AbWP4dWWAuJ1WIGaL5XRFGcSpAeyxe7cUqrlm/l+PgXsX0ivgwQS?=
 =?us-ascii?Q?uo8893Rrj7GYJyho9t3brQ9aMMeoMimpSFd1aeDaxUTUkBmYvfRaevp5SeOb?=
 =?us-ascii?Q?pvfWm0VZ27hjpv75WWzvVe0TCaFC2WbmC2ApbOS8Fpnc/zLAIQNJ8nEZP78P?=
 =?us-ascii?Q?2yPGcUmDbv0/L8a7d2WOZ1/WPLz9BfFxT6gdo6puc+lkwnXAvKW8eNr+OwLi?=
 =?us-ascii?Q?8MvRZDtqg9VLLk7/y0clXZOi4HZ2tVGcyDCql81APUfu8vM7wOYyYXQ7nTi0?=
 =?us-ascii?Q?ScKL6EkwqX28zHfNXGp/G51Yzs/YnW9WD2rM1B1MUsGUo0GLWnSqO3YahPv/?=
 =?us-ascii?Q?xQaJ3lXD95ne2sJdL2zsEOHRulAMEi5MIVec7Nv1e1mlr+b38koVjKqgtIWS?=
 =?us-ascii?Q?eOweR9giYTddL/g8BeIMvAUnbgkKn/Z/8NMXr1I/5isL+BoCNUdWQE1TfBhT?=
 =?us-ascii?Q?N1UC1IRKCU+mIcqTDxHJTi5R2F8ReXLtOUk5f9IETz2dGXPgAndvL1dztGn8?=
 =?us-ascii?Q?hWbuiqS9BaaILLb9bDmaDYMSYi4o/KWnG450Lhlh7iL9l5qKl1lreHRCpWQa?=
 =?us-ascii?Q?gKAEvqbbka6scPXvRlK6ms4Epyqgz0JWYosCRuOgRCfqETYH0w+vfRA3/Cxv?=
 =?us-ascii?Q?x2L2pLaw7U0+IhpndRK6Sfo2qA6sa/3fP3T9CDEVB1Pt9oUOg4VFvRhHRJ9o?=
 =?us-ascii?Q?OaRss2EcbPti7OieklxQ4BMoh70WpgbRc6q7s2dW/zOMDlZPYAMOvpKIfbYT?=
 =?us-ascii?Q?yA7SO2PEDRx50mUgx7a3+cUn3/ixP6aKm4lE5oVoK7MWBWZyHKGmaoD5vjX8?=
 =?us-ascii?Q?W5M08bxvBA7R/j9Z6V9nasTpeBgFxQR5wyQCpjNzMSHwkxJtqfwXOrF3HstH?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EZMGf565r4ekNmdbWDJEc2nkaw2N6293hoh/iJqhMtsJ7X+m9tvm7atL5exOIDnXq22G5ykjjHNry4kEJhLQLuXfS4E52dZO3VfBGyp5BdNRaUlHgvCau1lJEdDzYMhdSKEVp+74a+2ixvtLNetyarlAD2p6gwKOYu+wQne4eVLepuNgbuhZltN5AV9VUQtKrga0j6k4Bi9DNS0R0XHt8TQlqrySQbQd/W4A9lUSGqDg0q11Tf8ZzhT0V3GSdhAQbwD4CIRotDzKbvuVw8V8EGKeqFMMJR42XIFee/Kya25LvUUsFrJKTypk8GcAxr8s44eNcKd4Hv1AKTQMPXpMIbIneYpXlexmEgfibzGMMmRir24E6XZpSyxAXXT7LRutjLoPD+6gwXz1WGfKzGHbIFEW9ydYLnTqlx4lTMf9xGJWkKN4mEdNsQOe34OwOHMuOZRRKv6SMKHrjifAKffOSlEvYIyL/qaCXygygxupFxzakvglZZW8yFpchkU6wE0LEK9ckG7oAbh11DEZ/6c6DnymUsErhrVKtDN/hQk+W5D7r0UcxohUg3w+R+/uCEBjQsKdpUtj/LDq4RaVZ4GVrkb0cYzuUUZZk4pWhunF2cY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2387793-6d50-426b-87c1-08ddad79c366
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:34:23.8048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZpcpydEYtIBftGF02KzccKO0GUrNaDd6AJ+DqAJklc3r/vbQRGWr7a1nMsPEWx5ZNcV/CwgC1EY5CPiu2McradsDDp6c6Isev/xbFOwn0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4603
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=772 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170068
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=68512893 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=pYXY5ZqeXmeVdQ6V-j0A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: wibZReKn-O3dp55fCiDiK9LkJ47GlvRP
X-Proofpoint-GUID: wibZReKn-O3dp55fCiDiK9LkJ47GlvRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA2OCBTYWx0ZWRfXy82UvjBSNs1K OkkQ1pEY8ey3JUPfCmKIW5wcNhGdW25TaGl+Pl7WvY4noqdrrCVYxntaH8MMMlW/7M2KgoZUaLF tZMJbS6+hkylLyGRMonjN7VGW0bRiEY/73dpSoT1cFaJdXm4/JNsMCtPLrY9tFx6Vw/qkZUMVxp
 nIxMyzMNh/q0v1PXQu8CAIoncsZ8LUCnzvLCJPqJKKfvZjhzE4lLB5fP7yaT3837RwV6YZ4R3h2 S53RaFNXfpUHDjS1iDUPOtIe42rPv0FL9vGOJBA06W9qRJEfo2MR0YseLDEOqw3aZX1bRtdMLoD twBqZNnIEWvrjyCiGaTu+7Fwwe1ZeDamO/OENpyakG2hBb7W0KJLe2QuJGIeC+x3GUSi4G8s6kq
 UBBZ/f0tQsMPE2UJBOgVqm+Y4IxL1Q2Ehmxg2x9hRhSrtw2u+UZU+ouYisFb2dsbAF9oL9mQ

On Tue, Jun 17, 2025 at 10:28:58AM +0200, David Hildenbrand wrote:
> On 17.06.25 10:21, Lorenzo Stoakes wrote:
> > On Tue, Jun 17, 2025 at 09:54:29AM +0200, David Hildenbrand wrote:
> > > On 17.06.25 04:05, Lance Yang wrote:
> > > > From: Lance Yang <lance.yang@linux.dev>
> > > >
> > > > The prev pointer was uninitialized, which could lead to undefined behavior
> > > > where its address is taken and passed to the visit() callback without being
> > > > assigned a value.
> > >
> > > So, we are passing the pointer value to visit(), which is not undefined
> > > behavior.
> > >
> > > The issue would be if anybody takes a look at the value stored at that
> > > pointer. Because, already passing an uninitialized value to a (non-inlined)
> > > function is undefined behavior according to C.
> > >
> > > In madvise_update_vma()->vma_modify_flags_name() we do exactly that,
> > > correct?
> >
> > Err the parameter there is struct vm_area_struct **prev...
> >
> > We deref to the prev ptr which is unassigned yes but the pointer to the pointer isn't...
> >
>
> struct vm_area_struct *prev;
>
> is uninitialized.
>
> We pass &prev -> prevp, which now points at something uninitialized.
>
> Doing "*prevp =" is fine, because we will initialize.
>
> Doing "= *prep" is not fine, because the value was not initialized.

Yep sorry pre-coffee.

>
> > >
> > > 	vma = vma_modify_flags_name(&vmi, *prev, ...
> > >
> > > We should use Fixes: then.
> >
> > So no we shouldn't...
> >
> > >
> > >
> > > Acked-by: David Hildenbrand <david@redhat.com>
> >
> > Sure? :)
>
> Unless I am missing something important, yes :)

This solution isn't correct as prev == NULL when prev != NULL is wholly
incorrect.

We need a better solution.

>
> --
> Cheers,
>
> David / dhildenb
>
