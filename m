Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E77156C6F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750182974; cv=fail; b=T6TDnwCmTIhaQ0hyM/LeCht2FdPtyK2fut6PaeNbQ57lV5ZKALlcubNRYGHk5PYE4/9jTsEMrNprOA/fHCmEf+N+bosHq5Ntes3pkZGNFJDaZMtyMEfxD725w13aajKQ2+OfacZ4qScYZb6E4L0WZVJsra1FIaztTo9d6rf34Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750182974; c=relaxed/simple;
	bh=pJzjEwlxN+J7tvRjMe6lLvsF98dA7BWpKaU9OQ7htfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PfuCQ/EBF+ofmmYmxxnHtfkqYEVZ9JcTzJGRiGT5Ghy6MgELVnmdSr1x4sJU2l+qWbV/5qXvJ7x9iI+Hisw7/PczzEGRYF0DajxJ1+giP6wUJaPO7HJ6mOVtyhXaRUmS05SuX2//KJnJMy6F6pyH9bAODEU3g5Y38t4pJtX4bck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qRKeB9zk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xFOuezLv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qRKeB9zk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xFOuezLv"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HHtcAa001300;
	Tue, 17 Jun 2025 17:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qRrbxtDCR4w/qtwNBI
	chcsug4mnhbx/bq9Ukv8jrFLE=; b=qRKeB9zkO6iMp2VDBIequRD7IeK+x7NEX4
	ZrpXZJ2tPjMwiJPA6thX4dtGQsC2K1lWC7azzbvKGYz9DaRh39AJxg9eDZZW4Ir1
	WfZ59jpTQX5IQk3ooisPjylpJVs/yuOsZfZRw9Dah395gEV2833TXuzD09a7MdyL
	7IwUl9p62xhv65bnozvGwDdS3oaa0Om0t7C0hVTEDWrpGAkJYg/oEQdAQ/ForIJ7
	38cOImdGAjZP6B9MQmVNfaFLYT/QyXkZtC2Gi84wD7IqscJwJK8hGxF30c0gWdEg
	ZIsw9LxXEApaEPPWQtvQ0eXuUMthy/AGhCwERwYZyOgC8PA6NqUw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd5xnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 17:55:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HHgP0C036299;
	Tue, 17 Jun 2025 17:55:54 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011006.outbound.protection.outlook.com [40.93.199.6])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhg2v2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 17:55:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBzjR0RyhIWRK5sezvARbEEvwUViH1o4SsBumOW+ZAxp1SFLeLln/6Xtfzfwgrb6uC/C4x0SB+D8lYhl9rBcrH48dT8/J/wHYVIksR5SmqA/OMOdS6JbIO5fyGyxmvi+WKbguAw/azBqM4yH/JtPAEzQkU1FyuxY08iyYW2WIth59nDfI0z5U17VzG8tlBFyg0nWjAaTYtTvj02PmSvAiJ+hnREED5hwqeQV8RJXkQ+R5gOnehLK+GG72VBemEBAsJ82efC0bFOzCGIe6RET1Sed5Mnd4Gg7rawm/MYyDx2CrpHb0rDOpPdUiAzWvn9cnLt0VAMQf8GZZWkuwW20/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRrbxtDCR4w/qtwNBIchcsug4mnhbx/bq9Ukv8jrFLE=;
 b=rXjhMdZrIoW6Q8ldBwquE1TxdoYo2lCZH6NqNpuAhnLX+NGOec4F57xXKfP4fFBJncKtI35/qeJ3kBgRZnWEFKi6X8hMLy/ccIQQyuzDM7h0JcP3z1ET1d8k5SLV7uUHRr6OtO45c9WxKDi7r2U+xt1hc3kf5udA5pSc5dSY5U8wFnLlXlyt6ZtG9XShFrveoWvu1NAfdlRWowG0fiPAJgO7jtNAudODYclKU4iCJljIknIKJZIgVwYxblym8bFAMT1pAtKSRYYGSx7Od/EbWeexm8zNfhJA55EhbGK1jXfNS2WDTISe+wvNYP/qJ4ux4BEzZ2tAtPjqnOcl2MeKAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRrbxtDCR4w/qtwNBIchcsug4mnhbx/bq9Ukv8jrFLE=;
 b=xFOuezLvcxkyrN8HNeixxEQR/qh4N6uRqZonBmWMNim/IPAnrTQuqnRXTl6oaOWcIxNbZmb1Di0AhwbD0SK1KlhV7bLhanuTNrJpocoqy8buE5KLWCpRA3j43yJs5Uy220CQ5AVQbxeUgr+XHXnahxJ6IoxNw4sSJpl6roNLtVU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7284.namprd10.prod.outlook.com (2603:10b6:610:131::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 17:55:52 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 17:55:51 +0000
Date: Tue, 17 Jun 2025 18:55:48 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add further core files to mm core
 section
Message-ID: <085b519e-ee7c-46dd-8c75-40f27bd3725c@lucifer.local>
References: <20250616203844.566056-1-lorenzo.stoakes@oracle.com>
 <727b5e89-89d7-4abf-a93c-8d6f2cb2c438@redhat.com>
 <35kubwcjkvyu34k7ejp2ykydtrbcl2gptcurs7rhqzi3cy3l5h@gcxndb7dfdgq>
 <c8d6c655-282c-41a7-9cae-a18e0cc5e15d@lucifer.local>
 <bfnbgxtvo4avlktnk6dmusns4iq4ksjvjmcuw6kqekpsrh324x@xulw3cq3uxih>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfnbgxtvo4avlktnk6dmusns4iq4ksjvjmcuw6kqekpsrh324x@xulw3cq3uxih>
X-ClientProxiedBy: LO4P123CA0381.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: e70eedde-185a-4d1b-bb2e-08ddadc83311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iBE756iugHFShjU9f1tRt8po+fKXmJoRUYI0wwkPwzn2c+pg3U9Hh/dyhZSp?=
 =?us-ascii?Q?D2vHNrfOXYO/U6abhzb3GKgdyEqS/nN7DNZwipUVH23kT3b4z9UNk/5370Ac?=
 =?us-ascii?Q?RQoNjmZV+3yxHEjp6GjaXE2IVVqBmOTFjlv4PDB71twuOtfmjuczb3I7YCpl?=
 =?us-ascii?Q?mPS0reYZpPZn9lsPPMcb9nK/qtXnlx1zCSrflG438EY3uwEmC0UhDHGd279p?=
 =?us-ascii?Q?veH6Rnm7XUUo+bQR6p40Fzdx5plt0Nrq+4tGWkhLfh6QwHBWgaZNxXnLfGN2?=
 =?us-ascii?Q?yICiLiIW7shxo8XAdLpIYRC4n4nhYglVWCv7pZDXaoTdibj0bAQIhHc9xdes?=
 =?us-ascii?Q?xkm70+JWBIfElyIsokgUimqj3z4ee/gkd21KX0BUa1pmJUV4DLQwfcnhwfnh?=
 =?us-ascii?Q?Dr5AYmOGdpVfHhUAMI/lq3ce4a1Nbmm3oi+BKci8Qu91lVkcW1anIegQMkkb?=
 =?us-ascii?Q?5aXNvijOxsHdlqwVWoffv0vn0i/Ec02Z0q6u6SxVllnkxQ1aMwbUDSWxfQnA?=
 =?us-ascii?Q?zJyOzZ8507HPxeay5AdT0it9rfPyaFXjVv/eDcoEJ3YHqv0x5xIxwRxbil+i?=
 =?us-ascii?Q?amPS+rq01xElbDYWOueJcJktsYkJPgcfjzz5mnCTfJcejuNQAKLyJ4P0cKNp?=
 =?us-ascii?Q?uMVNvMmuEtn1zxjHTT5PqMAxlbUTgBUKpvijxM80sqQhvahaLsb1X1LfUi9s?=
 =?us-ascii?Q?gG+AWlDRMWXUWGVKHHyaGntEPMjdod6ZlIRsyadb7KB0OYHTNIQKmXkvUzX2?=
 =?us-ascii?Q?AIn6Ts9EaJTnVzwALntD2bUOdIGcIosK4iq2S739VrVGnRGkO/Bl8QhKnfQf?=
 =?us-ascii?Q?CTkKaAkyAa5vlA+L3ltr/1LGsy1AcwtOhkxkDCYJEly8nqlxdeaGfmMcCWSh?=
 =?us-ascii?Q?lkV1kUdCvo87ro1JeRK2urUzLjeEsTAgp9zlNiURv84IOovoCGjxvbPca07O?=
 =?us-ascii?Q?V32ynXq3UTNX75HKTJ/BpcmWdxjupmmN6/ZUf0/hpjpGr07Y3Li0MVOOEu4M?=
 =?us-ascii?Q?Bk4pSXCfCYkuLw2AwOrPvPfwupdUmoNH8r+xN3P3UQnkYA/mGGCWKnUxGGPV?=
 =?us-ascii?Q?Ywh2K+ECt+ZS1dvWTxC2Fx6hzK847BSiOWZbblXO8+x2stVO2Z75jS/uTkYu?=
 =?us-ascii?Q?20PXrN8Imsn0cBVs1tHbUvXSxUUJ52+hLbTCG2LiKdRANyNTjPycXPORnV19?=
 =?us-ascii?Q?AUwyv6M3Av45gL5JQbUTtej5H3ihm3IKh1hs1F7GJHXn7WJ/8zkybaLFyqAS?=
 =?us-ascii?Q?tN1XlZmuWatHY18gOOKm9CX5PRVFIHELPL0xmOyZEsL+4MzySbZdA/4nVIYN?=
 =?us-ascii?Q?kLlNRCCsJsDGNN3/+4z3KtF5Rl3kEhA2B/h5mzF8Ch9s2zxVExSr7RDTm+FA?=
 =?us-ascii?Q?uEuGLu4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iDit9y0ns5aYM0Gtto+zcRRHtgAeUqxoFSbbtKgca86YS7CQGtz1kptAbE6O?=
 =?us-ascii?Q?tgFfy3on3rxX1koL/eYXfcyMaMEZoCTZkflR/T2BT1XpQD3sHb2V/Rz8ByTY?=
 =?us-ascii?Q?5tvHOXne8OzrslT1DQhMI0ZQgUe+XDkTebM+fWnywBRnCLfkMUgcGfdcMLIJ?=
 =?us-ascii?Q?O9uSZ44/PJKeoHJE4TM4niWzWaxLb8g8DuySfAw+HogTnXeO6qc+JVxkC5hx?=
 =?us-ascii?Q?5GR4LwigxKAb5qVeEezq/a2df4yXEZoP8zcQTga7teY5r0Jji0QnMal9x7b9?=
 =?us-ascii?Q?bbDJv6TseVyZSCxNbFsCz+SiFMhwKat1INnPx1aWf9nByr2/tP0zaLEfINVz?=
 =?us-ascii?Q?BBPwLtoIqInvfWGkQ9QSdDj32gBlLRr1I21msv+YF92FFN2F663JflSfpwd5?=
 =?us-ascii?Q?/ATYfX0XzWlwfTbTatTqxsHMEi9yckpM2WPgIvpb/ZsBUBb1tfmevXRm0WcM?=
 =?us-ascii?Q?PwU9VMid3ZAKJ+XRhdbLLGp+ERfHmIk6siroXEpqvF7Tm+Mb7fQo6a+ZUSGG?=
 =?us-ascii?Q?vdaOXHzj+nADwU1woFBib0zCesHDe6orL8soK+C300IQU0nQigfC8S2icOaE?=
 =?us-ascii?Q?3qUpwNLA3V0jzGUs0y8bZaQYZcFi1MuOga+GKaJ1H6H2LgIsdFiQsOI4EwU2?=
 =?us-ascii?Q?1Xj7O3Z497Hc3kWj1SOwQQMdo/4fG2CfXfNllfIy7Y2KSeLXLh41IkxqmnDQ?=
 =?us-ascii?Q?3Hzl/uIDpdIm8fVf77PWDj+iKMlY7epN+nnjKDMOgWh3/P4w2vM563Bl4eX4?=
 =?us-ascii?Q?T3m3wCIsoLd2Ar0SsgB9ruCw+6hmOsl3u9gbBJ0JWNOsJxxjb6Yo4XYBQjgA?=
 =?us-ascii?Q?9P1Mvg0i824zKDGxbs4TA40VdcdPZ3BIP+cwThXDdnWS53fms2hUVYiM0z7v?=
 =?us-ascii?Q?0y8NP8tYzd/iO8xA05ZFhVLW2ZrHqP2armBJBqzwgZT0rjTePj0qJq6Yvtg6?=
 =?us-ascii?Q?Gy1VE3RigHR4cq8vqt65DXynPE6wusnOil+6R9dC15so5iH9D2qJ6/LmUPsX?=
 =?us-ascii?Q?QkTBqmpO+y0ZDl7d7fRIVGJF/0QN2CIUiaUIL7GafFMDfHVyPwQX6Iy3Qi6U?=
 =?us-ascii?Q?WPsPJsUa6QO2uL8fwSf+pavGdv9qON//6vLRjwZ4fQNukON1jYlqmhSzAbVY?=
 =?us-ascii?Q?t8YdZq64U+YH8Sa/fR8uKQZUHZ60h2G4Eyvow75f1BQLhTZVH9aA3iMt44kM?=
 =?us-ascii?Q?DLVPo2l+OCOopQFwxAJo0u31Lu/SkSBOk9RrL7zuSKemGBEgG37Pp3+GiM1U?=
 =?us-ascii?Q?hGaSNOseoKrBdHaeuqcRLpd/rtmDIPWBH88w2vFwjVsvsBCsJJmOQTbtZeOE?=
 =?us-ascii?Q?QA8wlJKo0EWryoW0FgiZuzp2wvkLzwHLanJyjbutYfpBv6B2a/PXzyYvlJaq?=
 =?us-ascii?Q?HAkuDal3d6nvB+1sv4tsVC33ejKCMHh0Iwm2JKKeUKSHydPHMScecTgz6NNJ?=
 =?us-ascii?Q?vrVKNaH1nYz7aOr1/BUPVvAsBk44fWPglBdjR7UN5E1eUYaAN8d7j3+6oykU?=
 =?us-ascii?Q?N+4gBROKbJEihQK+ydjwunlgIKgYseiRbLJa9EBPqLJ0SSDDWmrv3qUf8RP4?=
 =?us-ascii?Q?OC4KBuYGxKTOAQX01RwrCTQNgkOjFTHDhjFAb4/knjVimfMxZo6R7FmSZMV4?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6qnrcdHfZtEfxvooh8kUd0Bob4c0Em9F4aOpj924OFwBTqS1bU2XrAXpIXLiiPDrrUO8EaSrLqKzPdA8B/hVue1cyyHu5NQcdYE4Kyfvn4KZsAAX/sZlSfhaypsfxzWy8xB/RGQ5RxE+RjThdQYTgcCzJ0neoQ2McHH6mJ5xaZKCvNIAEXIANWtEjWWVUTv6q+sTzn7+gnH16lEMEw0r04/keUzBZTOeYvbaJTY2T2irIK8XZq/HlB3ztDCd5IzzWKUHTqgJiZ6UYavZArx6ESjSkc1A3P7uazRHFsREDzD7roPWlkIcp1wO+FV3rOkRcTLS3ZRhmdBFHy3VfCKIx23qQzd5m7vsjYWKJZY+qUTOVu6BhzDRvksa1U26gksQVDOkoiszF4srFU5Z/Ukf/7SC5/2M8gBlW/hN6iZ3tCU/QZypjAkIs7Lrr8o18lRgzfx6sue1e8VzHgRUOJDTtWFjlObMBDJVDfWgEXrGuHKf7whi2VUxtAr9oKbV6w9kwSblRdbEvuornYyo+OoHH1GtdJ2Cbi388CAonVhk/MOQAjM16JSV6eXih7PnTrBLGHbPaZ+mUR0TWdw+3AXbuwreX6MzWm4MSHDVxGRVEH8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70eedde-185a-4d1b-bb2e-08ddadc83311
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:55:51.8990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdiz27aCg/+POSgSy3uXjhqWATnCBPcot3vQfY998XVMwq/9EYNlOGPbbMagztVlgn0vsyeq60aG5Msm7+Uqflo2+5asOPyG64I7Jmy30D4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7284
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170142
X-Proofpoint-GUID: YTGFIv-Q16UjTw0O2xcApWOiO3TtS1dY
X-Proofpoint-ORIG-GUID: YTGFIv-Q16UjTw0O2xcApWOiO3TtS1dY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE0MyBTYWx0ZWRfX9BOTsOTnvB4M /1cAweSBB365G+HuqRp6WFiYRzuy5iJ2fWIZFhTK7xp2lmsct1xPA0us6UCeOE8lv2mZkbnRIu6 9YelhIuyrOyiM0duy8uEUYbJpoFB1IAqH8O9vRoAgELAU2hp/6iflIIFYd0ijxV0dy24f0buVG4
 UyqazrO34CrLIF1Lu24lL5IKKws8SvLJlDpFbq0sDhcPXp4nNZHRuSiZGc6S5a31+HGtBnE6vyl y3j8DRg/aURazCVpS+jiDWus72F0xlIUTct+UQwCgDvAhvrMBA08ir7+LjV5/HP+HiSuQB7tDr4 IVPs+qtyy3Ypd/ckJ8V4Zi/UIKCeHXsmdtLlpOByjq0WoMCMvMHemaj2hzTaQWMI00rlJAW8WQF
 sqJWal8jiC/uqwL3WdpmXInrY/Mo99gC4gJoaqZcRaMI3Fl95k3dVaTwQ/3jR54V9LefJ7kH
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=6851ac2b b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=xwg7fweHdpqbpK5MwcAA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 cc=ntf awl=host:14714

On Tue, Jun 17, 2025 at 10:51:50AM -0700, Shakeel Butt wrote:
> On Tue, Jun 17, 2025 at 04:22:33PM +0100, Lorenzo Stoakes wrote:
> > On Mon, Jun 16, 2025 at 03:56:02PM -0700, Shakeel Butt wrote:
> > > On Mon, Jun 16, 2025 at 11:10:41PM +0200, David Hildenbrand wrote:
> > > > On 16.06.25 22:38, Lorenzo Stoakes wrote:
> > > > > There are a number of files which don't quite belong anywhere else, so
> > > > > place them in the core section. If we determine in future they belong
> > > > > elsewhere we can update incrementally but it is preferable that we assign
> > > > > each file to a section as best we can.
> > > > >
> > > > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > ---
> > > > > REVIEWERS - let me know if these seem appropriate, I'm eyeballing
> > > > > this. even if they are not quite best placed a 'best effort' is still
> > > > > worthwhile so we establish a place to put all mm files, we can always
> > > > > incrementally update these later.
> > > > >
> > > > >   MAINTAINERS | 28 ++++++++++++++++++++++++----
> > > > >   1 file changed, 24 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 4523a6409186..a61d56bd7aa4 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -15740,10 +15740,6 @@ F:	include/linux/memory_hotplug.h
> > > > >   F:	include/linux/memory-tiers.h
> > > > >   F:	include/linux/mempolicy.h
> > > > >   F:	include/linux/mempool.h
> > > > > -F:	include/linux/memremap.h
> > > > > -F:	include/linux/mmzone.h
> > > > > -F:	include/linux/mmu_notifier.h
> > > > > -F:	include/linux/pagewalk.h
> > > > >   F:	include/trace/events/ksm.h
> > > > >   F:	mm/
> > > > >   F:	tools/mm/
> > > >
> > > > Probably better to have some section than none ... was just briefly
> > > > wondering if "CORE" is the right section for some of that. Some of that
> > > > might be better of in a "MM MISC" section, maybe.
> > > >
> > > > > @@ -15764,16 +15760,40 @@ S:	Maintained
> > > > >   W:	http://www.linux-mm.org
> > > > >   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > > > >   F:	include/linux/memory.h
> > > > > +F:	include/linux/memremap.h
> > > > >   F:	include/linux/mm.h
> > > > >   F:	include/linux/mm_*.h
> > > > >   F:	include/linux/mmdebug.h
> > > > > +F:	include/linux/mmu_notifier.h
> > > > > +F:	include/linux/mmzone.h
> > > > >   F:	include/linux/pagewalk.h
> > > > >   F:	kernel/fork.c
> > > > >   F:	mm/Kconfig
> > > > >   F:	mm/debug.c
> > > > > +F:	mm/debug_page_ref.c
> > > > > +F:	mm/debug_vm_pgtable.c
> > > >
> > > > Wondering if there should be a MM DEBUG section. But then, no idea who in
> > > > their right mind would be willing to maintain that ;)
> > > >
> > > > > +F:	mm/folio-compat.c
> > > > > +F:	mm/highmem.c
> > > > >   F:	mm/init-mm.c
> > > > > +F:	mm/internal.h
> > > > > +F:	mm/interval_tree.c
> > > > > +F:	mm/io-mapping.c> +F:	mm/ioremap.c
> > > > > +F:	mm/list_lru.c
> > > >
> > > > Smells like reclaim/memcg.
> > >
> > > Shrinker might be more appropriate (along with the list_lru.h)
> >
> > Yeah I struggled with this one. It's a weird one, it's like a generic LRU
> > algorithm:
> >
> > zswap_lru_add()
> > binder_lru_freelist_add()
> > -> list_lru_add()
> >
> > Also called internally by list_lru_add_obj() which is used for dentry LRUs by a
> > number of filesystems
> >
> > But also by the working set code in workingset_update_node() :)
> >
> > So it's a bit all over the place.
> >
> > I wonder whether best for mm misc as a result?
>
> list_lru is the data structure / abstraction to interact with the
> shrinker. Kernel components which can consume large amount of kernel
> memory and has a way to drop some on memory pressure (e.g. some form of
> cache) register themselves with the shrinker and list_lru is used to
> store/link their internal objects which the shrinker can drop/reclaim
> during memory reclaim.

Ahhh you're right! Sorry, not very familiar with this code so going off a
fuzzy match as to what uses these functions etc.

So it seems then that include/linux/list_lru.h and mm/list_lru.c belong in
the shrinker section, ack will move over there when I tackle the rest of
this!

Cheers! :)
