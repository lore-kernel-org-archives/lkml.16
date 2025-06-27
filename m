Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151461B6CE4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049614; cv=fail; b=XQcZJOTzsQPNEIt38LK1SQ1xN95tsRRx+046AL+v58NA84JMZu+TQ5dzGBL6FJ1hAHDmHN0/WmsGsjZeI2aT1JH3VVhdwOhvA8VAR8HLXjsQfoJmlm5qKoi4L+ltn94kJ6R62YeliCwxGrKwcq3n/BmH4x5hX2gA7qQBfIXR0Ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049614; c=relaxed/simple;
	bh=bbMLmP9xCcTC0i9q1IPdWIn/rRELg6yPdolMjNK5iRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A7lmnVUT5bTodqbLAS/AVLk7j9a6lhq7iXZ24nutppc2+Oz0t1BK5tpn/6LepZeGqobpWjXk46FudNbyCYnWN2Rjw1DDsFYYNqoGH1DikaphpNW1n94JOlh5HdEyyZna5A3lDEwMvVyR3DUPuWOji0PzWRnrmKHQLhFIpGiF2lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MsmM8X7h; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PD1DSjNg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MsmM8X7h";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PD1DSjNg"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RHfcs6019453;
	Fri, 27 Jun 2025 18:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=aBgQSjnoC36vvTP2Y6
	jgqcEs5XMKV/h1M8xGUajm1dk=; b=MsmM8X7hxu4QOmfV1/Ff3as5ukrI3RYxdt
	cCppI8mJ1WIyiUdr1RibApsLsS9JT9KOdL0irt1gPPJ+nd3KO/WqAwgxVyXng/W4
	A2Mq5cevqDsBbgpxU6iuFpagjTQ7sXPxheIE1vR6UZudtng8kYHbBEc/S0/FJg4Z
	lJfcJVf3v/a7b9d1fwgUQyeVECUX9zO80/QlGLxoGgnVR7DGAlYb5ZMugbnJ/tPR
	w44Tiicvb9tiwCzInLGHVHl4fQBa66l6bm3Xp2bthCYQeMTi+aXdZxR8OgR2uSYT
	H6F8GRaM5Xp3O+VV8Yy6IOIjXjMib4u+Q2bxLQuqECqj2+GfOnNA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8n4bdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 18:39:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55RHWSLC019329;
	Fri, 27 Jun 2025 18:39:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkv7aja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 18:39:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/sYm6Lt0UYzetv8Ew1c27HcTuPIF75MhwE1XcqYFeDKkqOxMTckkCj7XYFb9V+wNWvfAcIoaqgh7at2f1Q3TQCRLPupmplzDqdyPpAKoTIoCPpUHzA6bLHwKEabpycmQJmLOL63+35ClvRA0EBVbz5Cvdy7zWh0N5KeSp85dvLKPN0vTI2kZ/kndbDmfflTcBAKTQv2ZizhHfDl3CXit+PbqAtH8eaToDlsYZRCARVueH1EyhwvmHUgyYiY2VPIhJM8zqAOrFTqgOuwL2ld5ooNT9luENyDFIeuq0Dn+vRT0XISca8ehEDuxMUT4x/IPXb5rAF/ts01KVn8zbc69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBgQSjnoC36vvTP2Y6jgqcEs5XMKV/h1M8xGUajm1dk=;
 b=tkznPIbkztBG153qd1yRNQC05NeQwkZgPpDdH1jyF1Drpip0AqVdXZIwvwkt29vbAP6sKL9X4fs2A6SnhuRu+zYbQjvCSWjG8CJNuDvInRgs8PJbz0G28Y9gX4DUIofCqN1uHP9SlJ26t2sWAIJJNibo/1LmRJgvuWKjY9412wVj8lQq5aFUrlCOM82UloCd9eIrPjeZsiavw2qZ2V9FMLsCcsx9ua9eaUny9fCCeT1Bl5t8vDYp5fAcT6PXX+VF4P884w0ME3EZG0Ev3ZjuTCFgEMTF88QCUwWJVGhnqOU8ThRJOwkZxkCCSk5Mall0WuawrcOQ6T231hz3zK0gHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBgQSjnoC36vvTP2Y6jgqcEs5XMKV/h1M8xGUajm1dk=;
 b=PD1DSjNgluYc0ncLdD0B+oZh7vHvkDycVrs9rDb0SET5h0jGQRPOAYfftJsl5PPzHxNJcdOTWquDjt1HQ5Azu+aukpg6DT/xeu1Tv87QlEi1ktbzZ+VA1fNK4iOU2riU5DUonmvQiqUP+ZBTH+6K7hmmVD7stC8WSuaHc9iUyfc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS4PPFF6170ED89.namprd10.prod.outlook.com (2603:10b6:f:fc00::d5a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 18:39:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 18:39:23 +0000
Date: Fri, 27 Jun 2025 19:39:21 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 2/4] mm: smaller folio_pte_batch() improvements
Message-ID: <8f08ae90-8062-433d-9798-19a23de35167@lucifer.local>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-3-david@redhat.com>
 <ea03a9a8-6e2d-4576-b15b-cf8fca1ebcfe@lucifer.local>
 <72f26f80-38ff-4686-a9c4-26071d6fd4df@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72f26f80-38ff-4686-a9c4-26071d6fd4df@redhat.com>
X-ClientProxiedBy: LO4P123CA0354.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS4PPFF6170ED89:EE_
X-MS-Office365-Filtering-Correlation-Id: faa561e3-20e2-4d53-427d-08ddb5a9ef87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fKpn0IKOTZNRq/CyHhmqHCpzI9ZkSAfUYRqdM5URRQFj5pHfja5MJ/lZRrvH?=
 =?us-ascii?Q?Ya+G9wffPWQzOw0jZhavfeAlWaR0sFjM7mvvd2lap+69MUOhzxuINMb40LTa?=
 =?us-ascii?Q?43HfUf8Mv9qyCz/ecVq71JTue81/euumt+HpL1OFg9YOc5jrSthPN08krEIU?=
 =?us-ascii?Q?qN5RouFYUgFBIzj81DZiG9nabStV8Vyq43M0/LTTOhPJIy8Oj7XXv0XLwiQk?=
 =?us-ascii?Q?Io/qHyWZygYhjD8icLb958q7yK9A9gvGmWvgnKU7KloHVRUNbQmFFT7C3tLi?=
 =?us-ascii?Q?pB7ax9vUG5AiUn/sWIfymIlv5RY2Uf078/OCDbGkx8U7phTaGD52dA3yWYtI?=
 =?us-ascii?Q?ANjoyTCTLWr5bLcwE/W/+DRFE09CBTn80PwSp9TXMYXpwppambQsDYlTtHsY?=
 =?us-ascii?Q?4nF9Gj76NmOZZbNUvGvhI0iMvitvOt36BxpGDbzkTWeqPfN4MOo/OfG8wZIh?=
 =?us-ascii?Q?ijjK5Y+v/8zBuVelpMptoTrav2fnetUPyxPZKkvonEE6rTzrt1y7BAc8wTHx?=
 =?us-ascii?Q?d0YuFMeUaomnuXU+ElXFQGp9y6El1qMPdrZ1pu/Y87du3998rjvc5y4v3Je9?=
 =?us-ascii?Q?oDVUxJ7j6YAsEbE+fhofkfelk7erhQEUP6uaABNRRTGifGqimO2NL7CN7UK1?=
 =?us-ascii?Q?5Pc91L3mSHvJTmp+g9dee5G0YdFvLYH11YIN+IB8m2eLK9ChiRnppTCAEcXj?=
 =?us-ascii?Q?KCWAo3Mqyyc+BeyiOX0aD7HCT+JJad6n5DQhyMK9U0QvC81VRqTe7Rr4Ab61?=
 =?us-ascii?Q?X8pq0Ba5zsd6vYT57o/uCQhLkwRVjamoLwfB0Yk7gZbfqQr3N3+5dEcqZBeQ?=
 =?us-ascii?Q?PAImcde4J/csUbNCHwCn7zDchofxB0ycRPAchSCP1djjjlQjBuUlSSaVtbeD?=
 =?us-ascii?Q?SMiIGVWKQpuvIJ59g/7zdWzMMZ7UCJS1dDFMxPz7EmqNUcI7o9d2rQ6KQryk?=
 =?us-ascii?Q?/dzCd2E30Wg9gj+GkzsayfIir97Hq2ZO8bsHBYGYrtCvukj8iwFptIK1XgKx?=
 =?us-ascii?Q?59FT404rHQ1bktODdgy73FYuhcbESeZLz+XOnOi7rK4xHWY1PJUIkDPHh+X1?=
 =?us-ascii?Q?eAp65UNvsslGgRJjiLXhodzvR1K3idRdF6SCNttC/pMvZwx/CO+MQwlTGT3k?=
 =?us-ascii?Q?x80JbQOyiTn8I6HNgdvsGMc2OD1dR9woi/PHYYjfzCGj3tIZbWlLfX7CwPSp?=
 =?us-ascii?Q?W88N7XSpKvRqf5oJqlnpch+A0wOM/UBIteG4ogdGVCCR5ZrJK/Pp+BZD2WSz?=
 =?us-ascii?Q?0C3zQrZliu7QEDUb4B5WGgMPqt79v4os9irm5/rH8LuWW2kIb0d55hK/Zh25?=
 =?us-ascii?Q?P8M7xCfD0l/L35701AVN3jFTrI21+PzFN1d5/fRX5dOJ4KOIIg3HwvE5h0vc?=
 =?us-ascii?Q?sp9BKDICmG6B71W+7fzVjit6L8djHIu9RWXWOJgY2Z/v3J+dNQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lz9So4g1tzZ2W+RfaLnOyUWJhkb5SCQMazwpx72DyXHo1Zv6+UdTo/G0vMsk?=
 =?us-ascii?Q?ko4tv1MIc6ss+8uyNwD4fnAz6vuO7eDJe2Mp0r5urV7lYc9KKdohtM+vEAXR?=
 =?us-ascii?Q?O/kc3xP6d2+m6Mctti6aBo/FBHeESz8ptf+3No/CNbC/2+VoyLRYhTo3G92a?=
 =?us-ascii?Q?kjYH6QXQTiLvSp7aI1jL2BO8mq+skxXs+DcNX5fZLigf0FMZ8qCL/eYQpCNA?=
 =?us-ascii?Q?hoJAnpr1IpArZfJfqv2yUhw7CFfKdPN5Io/Fr7QNTv/9xE2SDuRu4uRWFxBm?=
 =?us-ascii?Q?9egsPTO3/N/nh9htbRQdsN0JBLJzBt9XkpkvEDf7+UAY2omG+bVh0sYuW5Ge?=
 =?us-ascii?Q?zhcKp3zzsIw0N7UF2+ju/fqTwGDMblt3L4kaCf8liqQeZ9eWPciNT+Lj0ez5?=
 =?us-ascii?Q?txMSg/jxWpZaE5+OXYOJso6c98FyW7Oa17mMye0CAUxZEgrO+xw6IB/wFGx2?=
 =?us-ascii?Q?krY4CIcoFr429YjB2tF6VEjKWxe1J27Z9Qad1lgtz0dEouuYYPBbcZgKfkkd?=
 =?us-ascii?Q?MuJLsxdjaBM4HuoBrzFfdUN49CADGIlAgaAz4L1aY6GFs6UpVRvajB4cb9E/?=
 =?us-ascii?Q?7E8idnVhh69pAHD71vqyZuCVqvcYnETd0QNBMY7x7hqrC1Q1joDtnhHHvEtF?=
 =?us-ascii?Q?T8UVFGAsePN8INAXkYcYn9BeOoq1yLBmzfYrH9fQi20sPSA2QQiHou+cdeGj?=
 =?us-ascii?Q?vrxw18QpL5ybEVV6/FfNAiFL9KznipuUQQ0buQy/62NpQwTqciYRwofDi3QF?=
 =?us-ascii?Q?UPAU0Gidt/5KV21HWbJwwVV7osQY5X6nrsd4Af+WX6s4nKFzbJeTvkAA1SDY?=
 =?us-ascii?Q?He7ScTeRZHzjLYJ8g9ELnaZUGnBDQGbB3WBQvCTKpiE1r/uQGZxGf5VRVTOW?=
 =?us-ascii?Q?RB0SLBmaocuXMx7H1SvjQ/uahmTcTobLUILoSJddDCFrFIHIemZKyTXHiN2v?=
 =?us-ascii?Q?DZ3RJMJRMw99ELOq2GOnwcr7+FwVnSQ3vqP3LwuKAmf3SdmnCxHS53LfEkTE?=
 =?us-ascii?Q?17Ku9UXsbCKJ+661RbsDOob+arCJz7yZhYADNFOH/WdsKQ+8KHCnBh3o6R1u?=
 =?us-ascii?Q?Tg9uBzjRQSm4oNvaqtFAKsTmWfvRPhdZHla5OwsDdb/jwp8IRExPtLyjOdTn?=
 =?us-ascii?Q?gp6a/TYwniOJug5dmvFs5GBICc+hiMjvv4hnKYwV4AC6djlIV2H7bGbO/61F?=
 =?us-ascii?Q?pa+mgCS4lSnbghnkPgpEk6DPVqdy0pcAe/OOs/buwNeWd4nXb/LEToEKFdWp?=
 =?us-ascii?Q?TM8tm2WSFcwwMe8PWXiP6Dt2pADGzxv8OmYHxy73f8/aG2U/IKioOcxE4Ymj?=
 =?us-ascii?Q?Ki/mwzxoBMCPX14fMbJvT05TboqZtkNho6X3fRTUxVJNrOTxIixIu2E/i34k?=
 =?us-ascii?Q?WBr1DcBy8JrgzKYqJAB9MDG4ptZAex8mmieqlReMyCwoN/qFHG+6G2AZiQts?=
 =?us-ascii?Q?FRc1T75eXab1MUsNZv5Z7u97YgBgeBB3Lh7o5A67sxYQejSTAnAjI+2F3xnx?=
 =?us-ascii?Q?OVaDXyst303rT8+snCBdidKqw33uk2Ft3rt2X/2XlZJ98ULYlR7QQiljcUIw?=
 =?us-ascii?Q?L8wWxOgyckjRsu8BkGKxQrjOcfjcD/UCxklzrZmRnGMnw8Jl3BktrJushGsl?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uCvKV3UBkyDZlKJ0jmzGU9Z5YrNu/G9sbd+NNj+OKRwSghT8WpVTW+rALdoPJBInLx90SLzuZJ7bzpuLUy+lo4nqjqMZ9JcAVVGbzM82WA9NtPbMNchFKN3+8UiMxdMuBVdP92+qrZatYrp/qp1pogh6P9U+Hz2GzkmegqtgBSr0XuohkC681lTV9x07WLw9cen31ZiVD5AqBZuEK9j6LriPPVQP+TN4F8jX44Hne9LEFFaPGrwHuONRRZaYya4TDwSiA34yHXHQqV2czsHqal49ydkUdRR2giob8CT6KgW4Cxvo63ibwe7tp5KQAf+YMdcEgqtYP9MAM9s4pY/JtGTQTjJyTp8piaLUC9bTFQI0cTE+HK0LZa7KAuPzH8E8KKG5F3f25lRWwEugz0GSj32nZfQul2BGV+KzqZodhQwZZOFnLLdn+tW7AzE7wJeUtNmkmH5D5BU5C+k6X/R8wTqhK8MmXWm+9jJoR32trU2Hq303iAMq94A6W5JLlLKDh8VOwEmLnOnnG5NzThZobiKlxuqN03vgxsZUqXOCwhiHId0Xq6OZZ5XjY2sbiq/K2RYr84xGvKl+0M68EtWjchZ17FKBevUe7B+lJBPirio=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa561e3-20e2-4d53-427d-08ddb5a9ef87
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 18:39:23.0179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /AcR1GadiXIZQsYgUZE3JZ9V/MD2Lm03lBk7OPqnpQiyuFsPkL4gbj54tlAdZaljUObXvT/UKKiN9YjBhpZ3aXKtJOUr3MFHCqKsokEtdMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFF6170ED89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506270151
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685ee560 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=Gz25_tz7uM6TWf2blZ0A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13216
X-Proofpoint-ORIG-GUID: J9x-yZLQ7z0U2eNPIVfibdVdzDX1SbDT
X-Proofpoint-GUID: J9x-yZLQ7z0U2eNPIVfibdVdzDX1SbDT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE1MCBTYWx0ZWRfX0ZLsppJb49rk nZAT5dTFW6u2jPMqtTou/vmHAVeiwjPN+Tcu7GNvBtG2Gwakuel2H+lw7AX6MJzHFZO9WjMhsn1 B6EZa87OZtGijFqHBqBm1rDr0g32NYikiKIckn2Ve1UVlSIJ71sWaquVujzPZWQd02MxsVIlav7
 7/izRqvyu4KrX6RflVLijBhGa6TrYkgul+MAZ/JCaljlKAFR0hKHlC04oP7ma2tXVCeEVQkxzF4 sU/C9nSmDAx5DbfwB10eejzJigrPiqJa9ml1nSuAM6fLp8KYEPhemqilriuP9VQJNwFkHh5SF9K 3eaonNwbSa0Qkj2UToVsMCIt9QnXen3eS0qn/J9cOFXCvZhSIIKst1vPTS06IPRwr6kffyJ0uCK
 s8ZITQGtO7KHysQ/kNI6nlpMvoR1w2th31vNK5RMQOO4kSZKS5Gevq0DluU7DvBS3dQDqB5U

On Fri, Jun 27, 2025 at 07:02:16PM +0200, David Hildenbrand wrote:
> On 27.06.25 18:51, Lorenzo Stoakes wrote:
> > On Fri, Jun 27, 2025 at 01:55:08PM +0200, David Hildenbrand wrote:
> > > Let's clean up a bit:
> > >
> > > (1) No need for start_ptep vs. ptep anymore, we can simply use ptep
> > >
> > > (2) Let's switch to "unsigned int" for everything
> > >
> > > (3) We can simplify the code by leaving the pte unchanged after the
> > >      pte_same() check.
> > >
> > > (4) Clarify that we should never exceed a single VMA; it indicates a
> > >      problem in the caller.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: David Hildenbrand <david@redhat.com>

Given below, LGTM:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> > > -static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
> > > -		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
> > > +static inline unsigned int folio_pte_batch(struct folio *folio, unsigned long addr,
> >
> > Do we need to worry about propagating this type change?
> >
> > mremap_folio_pte_batch() and zap_present_ptes() return the value as an int for example.
> >
> > I mean I doubt we're going to be seeing an overflow here :) but maybe worth
> > propagating this everywhere.
>
> Yeah, I'm planning on cleaning some of that stuff separately. As you say,
> this shouldn't cause harm.
>
> Really, it could only cause harm if someone would be doing
>
> "- folio_pte_batch()" and then assigning it to a "long".

Right yeah.

>
> >
> > > +		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
> > >   		bool *any_writable, bool *any_young, bool *any_dirty)
> > >   {
> > > -	pte_t expected_pte, *ptep;
> > > -	bool writable, young, dirty;
> > > -	int nr, cur_nr;
> > > +	unsigned int nr, cur_nr;
> > > +	pte_t expected_pte;
> > >
> > >   	if (any_writable)
> > >   		*any_writable = false;
> > > @@ -267,29 +267,22 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
> > >   	max_nr = min_t(unsigned long, max_nr,
> > >   		       folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
> > >
> > > -	nr = pte_batch_hint(start_ptep, pte);
> > > +	nr = pte_batch_hint(ptep, pte);
> > >   	expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
> > > -	ptep = start_ptep + nr;
> > > +	ptep = ptep + nr;
> > >
> > >   	while (nr < max_nr) {
> > >   		pte = ptep_get(ptep);
> > > -		if (any_writable)
> > > -			writable = !!pte_write(pte);
> > > -		if (any_young)
> > > -			young = !!pte_young(pte);
> > > -		if (any_dirty)
> > > -			dirty = !!pte_dirty(pte);
> > > -		pte = __pte_batch_clear_ignored(pte, flags);
> > >
> > > -		if (!pte_same(pte, expected_pte))
> > > +		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
> >
> > Doing this here will change the output of any_writable, any_young:
> >
> > static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
> > {
> > 	...
> > 	return pte_wrprotect(pte_mkold(pte));
> > }
> >
> > So we probably need to get these values earlier?
>
>
> Note that __pte_batch_clear_ignored() leaves the pte unchanged, and only
> returns the modified pte. (like pte_mkold() and friends).
>
> So what we read through ptep_get() is still what we have after the
> pte_same() check.

Yeah you're right, sorry, these are just chaging the value that is returned for
comparison against expected_pte.

Then LGTM!
