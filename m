Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B98578F4B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475677; cv=fail; b=BID8etDtc4IkbZJmOt8APG8PGhN5k/rGKvjJnD+TslMuS5XStOuzgb6FEhEBevLIzOWHlAdtFrOet5uwSkWHV5J/FrirGd6wn9wXoqczPSQHQ092pw+OV3zoMYZmFrAw1JBboS37GHERknLdCdUAs+ywM9EnyNJeKlqNr1kcKNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475677; c=relaxed/simple;
	bh=eHgic6/XtNGtI/2F8gdjYPu+S3X5lPnp1a3Q4nEmR9s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GgJKrCy4/smgSpRmt7ToBPomJetgYLSHWhGzZTdGhuMt6x4A0EMAOzXQasEZ+84nA6pWLiGL4QkOQ0PPLm3pYE30PiHLSrJ5R6BIF50426xkGSaRkAWKxw9+oElrl5PMf/RUBaAz1JcNjtGUOP+7LYf5nUNvAyk2XD2YAdrxFmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TOEBJSDC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XTF5NTOx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TOEBJSDC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XTF5NTOx"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593frFF010703;
	Mon, 9 Jun 2025 13:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=QgeI6GWArLczxRrD
	Q6gdwJac4t7JGAgHXkw24kgHioI=; b=TOEBJSDCJuf313jI0NZQz+0vVxeDgC29
	cciyI0iIEJrpzQ/7kXbBE87ddmv3QgUB8oTMC9M+8gqAOdOUedx1+JwRi2r1h2w2
	/IZ2kUoW9P7mWT+JZPd89Bllja+FCcNYnUbU8rijkBZlRmBkZoCU76nV4NFmJffg
	1XdIt1yPx0GDCFEDZGfRpqXf9B9SvYBg476dWfMAe0v7rLhhrKu5UEHl5MinTGSn
	/Tiffbak34C/fC0btjY57AcwiUP058JW63VVxTC/GHePIenYimERtHQnTkZplzhT
	Dhrp2MAsa+qr80fiK4BaTPxyp6YF6Rqm1XWYKhf2fOTNAmxAHLO/Bg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbea4v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559C04Vn031954;
	Mon, 9 Jun 2025 13:27:01 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv7ehpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiS2o0806JI/Yyx/OYYiJoSzncC5z/GUosQ/QrxVFPXskBsCA2ahysuq9pfJ84uUVp4QV/kMONnO5AXX44vp5mm/4IrbUCLtSJBMCctLm8Qu6qrsqagczVyiKVI2r2JlXDS0H+se8FL6hmUtjMJaBI7zwnNl/qz+cUu1lPwvdnPW0F67lN4yBs5FBHVBAZz39lzbcZn6sKz3wpGxnsV4wtBVry3gjgjM5LRfmNIuDXsmC2uGiBt+Dt63Z2DwvCOlk3Lg7iHmA2NA9QLlUBBDozBiSTwkngme74lUnoQRq9Ft3HW6o0pe+od8xUHqQubIJMj0WDq5KQLmqCrWFD9B/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgeI6GWArLczxRrDQ6gdwJac4t7JGAgHXkw24kgHioI=;
 b=fpKRTAjiE8+ASJpmN4SjjGBQfNMdLetzsKVRpgOwznEN96nMP3XHoOosUD54+5NP5fVFy0WqNRBXKo3bU+h1PpJnR/nJ2EY44VkwXZVtMJIyre+QNoBdC73UNuByQ1vLlIxxvGGKB+yG3EGBwderO3IZ1DhlrJqcaV66uiq9eXOx9RdDGo4OB6hoV23cFFiv+sdplpkhQt7/ZoXkQqyYDN3w5yvetqGQXkhTspd10A6dNkb/LdUDe9/xqa0fmB5AqPbZjtbOwDI+6YvarQMCo89etZrmS5KniikImB35KcgKV6tjogvlJiqluK+qjnaZLk1c1GQj925J+LvtsPBu7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgeI6GWArLczxRrDQ6gdwJac4t7JGAgHXkw24kgHioI=;
 b=XTF5NTOxqrwfgwCvzZGUAvoGM4uQrIb1qKYURiZFM6eBR2yvl2IL6NfY0LcNwTarKkplfinXy3sVpFLkdX8jYNpNxDv49+/3u2hJTi7G4mTnLMcwpWwwbgTmoMenLWFkowxvKJbMNiYaQRuLq9eKMWBW79gYe2NWUVCWkDvgA2I=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DM3PR10MB7947.namprd10.prod.outlook.com (2603:10b6:0:40::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 13:26:58 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:26:58 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
Date: Mon,  9 Jun 2025 14:26:34 +0100
Message-ID: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0648.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::19) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DM3PR10MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d01fe99-8791-4802-3ed7-08dda7594f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CwZiM3YFekYkBelfikAjNHUiY8ajMHrkpBq6wvec7PYiyOkNv5Ibu2xEJhWm?=
 =?us-ascii?Q?w60wtE46FaMqF76QeDhXkdcEVcb074ZSE0OfdGetU2MVkufgLxcV/NKnED/3?=
 =?us-ascii?Q?NxMRgyl3p2MFrWCh6JyMiVtMZ9jA/5P6pDw7su5xjjnV2QkTTMB8rjvQFlXy?=
 =?us-ascii?Q?/96pj7D09/FElLm0Qa++6LWcSWTd7gNpYs9ALPa6XXMsAHMk45s0xhiRlsAG?=
 =?us-ascii?Q?xq6cHh94Vq6KVYemfMB5jGBzHzEpBQGgY9tgsP8RPeC9MGdDEfu0UOBtRLNv?=
 =?us-ascii?Q?PsZnFAopW3ynu9QTt74yxmyDc8OoPs4I1jJjY27wO/6Tk0JXJZXrC2Brwkq5?=
 =?us-ascii?Q?MdmGHNlS8RPMyi1bCPOpu2UOJD/OSd6lWtrztwjc1Cc9UIa5XIqOo2VB9MOk?=
 =?us-ascii?Q?HqJ+QueSjRfNhuM59SJzxe8y8nOewuM+nwrlMAzPQOoaXuvOtfXuQnRN8rdz?=
 =?us-ascii?Q?DAGUgwgm3zbrtBUAydGtSGAYn5UvEIY/FmD/Sj40oPhTiBzSnW+uMHFxL3V6?=
 =?us-ascii?Q?qu+NYE7z3Fx6oKNjmC5jJaeUcBOCH/iTburGg5vJisKldE3VqfRntr42M5vz?=
 =?us-ascii?Q?PkLZVnjH5uXr0B1j1HUHKFeIe8mP2zaBCloL91s5G0JLXVXQIDDmxJFOc2bC?=
 =?us-ascii?Q?3xGzdi8CS1IRnnpFkG/zAflzbrsAgGfCcqQkas+YZP8g3dtMdUFJLIHmIwNR?=
 =?us-ascii?Q?27pEuhr4bzWkhObjTherRZ1Cl9PaQidCSW4o+DeRI1ojjCQHMALgZ2vUP/fb?=
 =?us-ascii?Q?z+8r3LdbXj1PS4WBWCOygzEkF7tNOCs9GD0/LW4SGPkhOaDqtc73K7oeiRr1?=
 =?us-ascii?Q?oZsJOS2kLAukOZTLwf+5IZP0ZPQYw/NuoWNgFNbnFY1FpGrKM+3vGhbAYhjC?=
 =?us-ascii?Q?ll03U5akkmAHmAxJTvakoVXWOUuY244SPo51EhPuDDmP21tcR03cva1U9uQe?=
 =?us-ascii?Q?yDLEH+uQTPORol9YvvTyaxCtmtLijJxe9QTCD00+GT0FKhVKSLsTkSgMkQER?=
 =?us-ascii?Q?AO1iHboQPMhMceuZdcpF7AnYicpHMdO3Hc7bxGvRslvqdR9YW+ZoKfRjYzHw?=
 =?us-ascii?Q?7hizVZjAu5AAiTsByZPJikkbmDFzN6/Zc6nb8DkBZqeFOmn3n1nYktbyvfRi?=
 =?us-ascii?Q?+NuEzEakDjpmgk9ASCZeEYJDu8IPIsyEDQ37tq39phrua0IDdUJm++ti1Fvd?=
 =?us-ascii?Q?FkJzPN29JVjdd9veV/IW55JdG5SGEg3O7SiMFj/LdLkqqGVeGYKyozeq0UYM?=
 =?us-ascii?Q?CVwD/cr25f/jMko1yeJ/YNwkrSQhfYeSFbFgLy0E8D16aI1QDF4Jf0iFS3Wd?=
 =?us-ascii?Q?2BBOIwW87RJevR7fzdJKoC/DPUjtX390chakhVJ3ORik8TLdvfVGDxCUf9On?=
 =?us-ascii?Q?T+jlGVXvpwdOhVjixnzt6WJTdARFe3qRMmCKjaUsfDFpBTE7nxE0YpfDA0Og?=
 =?us-ascii?Q?hghuyTkXWh0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1OY6d6rrqHXUVNcT2BZH9K6MauLlpQHBBQHcYxWypWlcqcjAFRFHtGhqiFpb?=
 =?us-ascii?Q?XVNdS61K1rJE/e0li72u5dlwLi9KKwRZMEO2xPejUMxu/bmrX4qzgD9v84Nc?=
 =?us-ascii?Q?cJBACg3vkstTu+5QQ/nVOKFkLuiA0/pJFit3zlBo5p+QNq7Bp8MDVVizsQi3?=
 =?us-ascii?Q?ca4nUJbaRwh9ps5f1ybtOV8uiPSuaM3O7TejbGrxPcVx1T44PhP1+yosGgRM?=
 =?us-ascii?Q?g/YrEqWsIHocQcxROxS7q7+P8H5IWCdD5iYzDq2BsVUhBiZtJMj+D8S1MmWO?=
 =?us-ascii?Q?z4MmpLL2jv4B9KGSyYmpVQxkcJ8EC6MtpFRyorgAfCtpeR7B0mzPrmtswlKd?=
 =?us-ascii?Q?XW6XfQhNBYHCsiTFw4RWvl0Cbjo9vHwK9Mnp2X2J9Ee50jBYd8R/tqrxcTEW?=
 =?us-ascii?Q?09AUl4g6kCgnYIYv95KXjggkvoIMreGjTPbnk47DE3MWBhrAkEFVOPNTSCRY?=
 =?us-ascii?Q?vEepsKgPpAX3Yu0/HbS5w3CjqVszYxWe2nWGe49qUjPyrK0ud4jKxsrVYFLU?=
 =?us-ascii?Q?0Fw+hDilWRY7TvEP4FWWcIFb75EEiOOGQk6MISBSyzNp1CNrXJfsFDAqIqhS?=
 =?us-ascii?Q?aepsgUz1wuW9SwLLqu/O01QAirVCLvPAdlv7deS7+W3fgRK18GJ63gCXdzTn?=
 =?us-ascii?Q?nWbmL/MD0PuZWurFVXjC6hAzc3a6+VVoY1IbkbGXyKAzVLlLgzeuqd34ldFV?=
 =?us-ascii?Q?WNAsnNsGUXUkOQ6KMbMPD1vgvJkxSoKKD+9hDcoZmDX/yXyOrASqVaNzu7EK?=
 =?us-ascii?Q?yaU6Q60ys0P0J71MMWAM8VkZkGEofM6lVx5D0DDYASK8qPdcYeWMq6BNnsrO?=
 =?us-ascii?Q?v5Oe5i883Y4tTTOlirveyhgE7r5MFXDrsNFQIsBfmmt2XMTfEBKKt8m9QpWD?=
 =?us-ascii?Q?csLkk71LKoHy9Ar+n7ZeuDMpIwbUhxPxI79Yp/Gy4MyrLHJ8TaBEX2vMveD5?=
 =?us-ascii?Q?WVS6MYGrjG3QO6ekSQ1gmg+PJrAQojwMNiSGxxLK9n6pS2pxPpNeOzA3IsQK?=
 =?us-ascii?Q?BOfJ+ynx5Y/I/mchAj6wxQnyi6usmb9jRY/HTLd5utykBN0oSVHAe4QoRi6s?=
 =?us-ascii?Q?tyFdS66xNvA55wIxiTAhdXUlW7Bd4aKj8xTB/GFn2SY2WT2p0jOZCb2P+9kf?=
 =?us-ascii?Q?VmgauDEzk0094fVC1xEIjnay2AYglEC6WUY9sSNe6jAhun4xrQYCBWOQP+lL?=
 =?us-ascii?Q?bUgYSPfg7tK0TUqY/fetNlQDqF6WHDmTNna37VBgnZmaFe0jWiJ4wovnq+cp?=
 =?us-ascii?Q?rgqoa61eLbxcT2EVXH/qJJpPRR/mRH77GGNReIOitWAQ2tynmql+H9SCvMca?=
 =?us-ascii?Q?dAEyqfRrLz+/vu9G6nv8MzxET6RPdqMtl2dFkjJsoR87knrSrVJ70YNI5Zj6?=
 =?us-ascii?Q?siV6bXe1/Dic8hmaLlzI+aPzKAXDq5sYyGeQzNAsAmkebd/xQ6R0Jrd6bMQS?=
 =?us-ascii?Q?uQ1Aqt+Mvw0zvzYAYnHg24CSEIsl/kmRBsjxEOfHJt3Ca6uBuYPmjc0Ac1V7?=
 =?us-ascii?Q?PypCnGKd5Hg5m0RdwN3gtUuhES5lfx95lC7QM5uG9NJJo67Bf5664JhwFdL1?=
 =?us-ascii?Q?JMqRKOMV71CNcw15hljUw110jceTHNo+cAw10dRfbuhMfehQxSNjOWtxw1eM?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZTgFHi+wuWugYSIZLj2vaXYB3iaoKWVLECu214mrqlDHFGwfpW1ORCAF0D/+2sob64G8Mx+YHsN+E5GejsBPpvnJ7662AlE01snl8amM8bLR45mRhxeZ8/2Bcz67d6C+pBHsmY6/UGNGguCSKDKV9ccxMkXGsjNkCmFCCdEoc4u3i/qCZyTKlr7HaDW15JPpVIHX4dH7zniGO5Z9s2+PeXCKv7yDL4rKh+aVGQjXDcz8FVCLIm6/jHOJtEArIccVfl8EoGF5NLczbjVc6COKz+XS6M0CDMlm5A40KzoSFa/Gdr+ycJNtbKJm4PpX7da5F+A03f3mo23KT2hNjnivLME1wxaTB0EURBu79U4pknhTFCdOVADHiw63BCo8TYS0LeXEWTT9fwQTxovAiVB1X/gftj1OGOwqj86fBRX9S6eMIDgKroHRjBdLZ46NIdBpRV76Zm9h4FCSbbsowFXSlmteZzouAE5OfKX7gsT40YSy1Ym8jcU8Vrbf5LzdWatXc2CLD7qTaOPQBDZepIovMOGFEpzjIk3f0C+BdREVQKBcBpNqqT6x+oPfpd0QgpcNWH/WAC4fspn5EPBaE13GE4L6RlUcMiHguJ0/5UDELuk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d01fe99-8791-4802-3ed7-08dda7594f92
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:26:58.7035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OglH4i9ZMgFQhMABsMYCp5KP6fmNXIUr3hxtaeVxRanSoTyOivlpaNZVlqUzVzDWV/0pP3r47aIYyiGoNSEDArfTZYsNrf8+ekg8i0OH+W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7947
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090098
X-Proofpoint-GUID: 1BBoiZ6DlYxow7Gougcpep9pRxNyRzdo
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=6846e126 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=uwbSGSRiVLllLH1Rpe0A:9
X-Proofpoint-ORIG-GUID: 1BBoiZ6DlYxow7Gougcpep9pRxNyRzdo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfXztNZHr8vL3kb T1QhKcGfhMIZYKeJMEqmtcbwrCP1KIq7/c0OYz6tF96/lxDEIJz77vlc2cotUvbavFNEaJY2LWX 4tp/OcB2qvEVnxf18/DS3jkY5bL0cYTu9Rhwg0r+grf6JFmcAF6l3gNhMX+F/OMysydWHGBbd77
 dXR9uRLuo+d3Gf03NGvjUjgh9xcSBpU1ZG6oTRniOwJJskRzxa4XcySrs23u3L5mZqmOTHE5q8q B2kAseXSSNgzC+yqaNo3+goxYiuNcxQ+I5ClQOUmfrn30UkUzuLAqyRTIGJdSfHhy4dQHz/e7EY hnyfg1GlT1Ed19kIfdDivawixcZe/E9a+Lu3eNKlgdiPLepT3nnYRtFTFmqWwfO6bxsqpDuvzBg
 ictKJA4gwX0LkFkYu/aRhDbRUqffFysn1W8N5jJSujmR4stTupdIIMoNbJbQ0F6Po9N+WCTj

A long standing issue with VMA merging of anonymous VMAs is the requirement
to maintain both vma->vm_pgoff and anon_vma compatibility between merge
candidates.

For anonymous mappings, vma->vm_pgoff (and consequently, folio->index)
refer to virtual page offsets, that is, va >> PAGE_SHIFT.

However upon mremap() of an anonymous mapping that has been faulted (that
is, where vma->anon_vma != NULL), we would then need to walk page tables to
be able to access let alone manipulate folio->index, mapping fields to
permit an update of this virtual page offset.

Therefore in these instances, we do not do so, instead retaining the
virtual page offset the VMA was first faulted in at as it's vma->vm_pgoff
field, and of course consequently folio->index.

On each occasion we use linear_page_index() to determine the appropriate
offset, cleverly offset the vma->vm_pgoff field by the difference between
the virtual address and actual VMA start.

Doing so in effect fragments the virtual address space, meaning that we are
no longer able to merge these VMAs with adjacent ones that could, at least
theoretically, be merged.

This also creates a difference in behaviour, often surprising to users,
between mappings which are faulted and those which are not - as for the
latter we adjust vma->vm_pgoff upon mremap() to aid mergeability.

This is problematic firstly because this proliferates kernel allocations
that are pure memory pressure - unreclaimable and unmovable -
i.e. vm_area_struct, anon_vma, anon_vma_chain objects that need not exist.

Secondly, mremap() exhibits an implicit uAPI in that it does not permit
remaps which span multiple VMAs (though it does permit remaps that
constitute a part of a single VMA).

This means that a user must concern themselves with whether merges succeed
or not should they wish to use mremap() in such a way which causes multiple
mremap() calls to be performed upon mappings.

This series provides users with an option to accept the overhead of
actually updating the VMA and underlying folios via the
MREMAP_RELOCATE_ANON flag.

If MREMAP_RELOCATE_ANON is specified, but an ordinary merge would result in
the mremap() succeeding, then no attempt is made at relocation of folios as
this is not required.

Even if no merge is possible upon moving of the region, vma->vm_pgoff and
folio->index fields are appropriately updated in order that subsequent
mremap() or mprotect() calls will succeed in merging.

This flag falls back to the ordinary means of mremap() should the operation
not be feasible. It also transparently undoes the operation, carefully
holding rmap locks such that no racing rmap operation encounters incorrect
or missing VMAs.

In addition, the MREMAP_MUST_RELOCATE_ANON flag is supplied in case the
user needs to know whether or not the operation succeeded - this flag is
identical to MREMAP_RELOCATE_ANON, only if the operation cannot succeed,
the mremap() fails with -EFAULT.

Note that no-op mremap() operations (such as an unpopulated range, or a
merge that would trivially succeed already) will succeed under
MREMAP_MUST_RELOCATE_ANON.

mremap() already walks page tables, so it isn't an order of magntitude
increase in workload, but constitutes the need to walk to page table leaf
level and manipulate folios.

The operations all succeed under THP and in general are compatible with
underlying large folios of any size. In fact, the larger the folio, the
more efficient the operation is.

Performance testing indicate that time taken using MREMAP_RELOCATE_ANON is
on the same order of magnitude of ordinary mremap() operations, with both
exhibiting time to the proportion of the mapping which is populated.

Of course, mremap() operations that are entirely aligned are significantly
faster as they need only move a VMA and a smaller number of higher order
page tables, but this is unavoidable.

Previous efforts in this area
=============================

An approach addressing this issue was previously suggested by Jakub Matena
in a series posted a few years ago in [0] (and discussed in a masters
thesis).

However this was a more general effort which attempted to always make
anonymous mappings more mergeable, and therefore was not quite ready for
the upstream limelight. In addition, large folio work which has occurred
since requires us to carefully consider and account for this.

This series is more conservative and targeted (one must specific a flag to
get this behaviour) and additionally goes to great efforts to handle large
folios and account all of the nitty gritty locking concerns that might
arise in current kernel code.

Thanks goes out to Jakub for his efforts however, and hopefully this effort
to take a slightly different approach to the same problem is pleasing to
him regardless :)

[0]:https://lore.kernel.org/all/20220311174602.288010-1-matenajakub@gmail.com/

Use-cases
=========

* ZGC is a concurrent GC shipped with OpenJDK. A prototype is being worked
  upon which makes use of extensive mremap() operations to perform
  defragmentation of objects, taking advantage of the plentiful available
  virtual address space in a 64-bit system.

  In instances where one VMA is faulted in and another not, merging is not
  possible, which leads to significant, unreclaimable, kernel metadata
  overhead and contention on the vm.max_map_count limit.

  This series eliminates the issue entirely.
* It was indicated that Android similarly moves memory around and
  encounters the very same issues as ZGC.
* SUSE indicate they have encountered similar issues as pertains to an
  internal client.

Past approaches
===============

In discussions at LSF/MM/BPF It was suggested that we could make this an
madvise() operation, however at this point it will be too late to correctly
perform the merge, requiring an unmap/remap which would be egregious.

It was further suggested that we simply defer the operation to the point at
which an mremap() is attempted on multiple immediately adjacent VMAs (that
is - to allow VMA fragmentation up until the point where it might cause
perceptible issues with uAPI).

This is problematic in that in the first instance - you accrue
fragmentation, and only if you were to try to move the fragmented objects
again would you resolve it.

Additionally you would not be able to handle the mprotect() case, and you'd
have the same issue as the madvise() approach in that you'd need to
essentially re-map each VMA.

Additionally it would become non-trivial to correctly merge the VMAs - if
there were more than 3, we would need to invent a new merging mechanism
specifically for this, hold locks carefully over each to avoid them
disappearing from beneath us and introduce a great deal of non-optional
complexity.

While imperfect, the mremap flag approach seems the least invasive most
workable solution (until further rework of the anon_vma mechanism can be
achieved!)

Testing
=======

* Significantly expanded self-tests, all of which are passing.
* Explicit testing of forked cases including anon_vma reuse, all passing
  correctly.
* Ran all self tests with MREMAP_RELOCATE_ANON forced on for all anonymous
  mremap()'s.
* Ran heavy workloads with MREMAP_RELOCATE_ANON forced on on real hardware
  (kernel compilation, etc.)
* Ran stress-ng --mremap 32 for an hour with MREMAP_RELOCATE_ANON forced on
  on real hardware.

Series History
==============

Non-RFC:
* Rebased on mm-new and fixed merge conflicts, re-confirmed building and
  all tests passing.
* Seems to have settled down with all feedback previously raised addressed,
  so un-RFC'd to propose the series for mainline, timed for the start of
  the 6.16 rc cycle (thus targeting 6.17).

RFC v3:
* Rebased on and fixed conflicts against mm-new.
* Removed invalid use of folio_test_large_maybe_mapped_shared() in
  __relocate_large_folio() - this has since been removed and inlined (see
  [0]) anyway but we should be using folio_maybe_mapped_shared() here at
  any rate.
* Moved unnecessary folio large, ksm checks in __relocate_large_folio() to
  relocate_large_folio() - we already check this in relocate_anon_pte() so
  this is duplicated in that case.
* Added new tests explicitly checking that MREMAP_MUST_RELOCATE_ANON fails
  for forked processes, both forked children with parents as indicated by
  avc, and forked parents with children.
* Added anon_vma_assert_locked() helper.
* Removed vma_had_uncowed_children() as it was incorrectly implemented (it
  didn't account for grandchildren and descendents being not being
  self-parented), and replaced with a general
  vma_maybe_has_shared_anon_folios() function which checks both parent and
  child VMAs. Wei raised a concern in this area, this helps clarify and
  correct.
* Converted anon_vma vs. mmap lock check in
  vma_maybe_has_shared_anon_folios() to be more sensible and to assume the
  caller hold sufficient locks (checked with assert).
* Added additional recipients based on recent MAINTAINERS changes.
* Added missing reference to Jakub's efforts in this area a few years ago
  to cover letter. Thanks Jakub!
https://lore.kernel.org/all/cover.1746305604.git.lorenzo.stoakes@oracle.com/

RFC v2:
* Added folio_mapcount() check on relocate anon to assert exclusively
  mapped as per Jann.
* Added check for anon_vma->num_children > nr_pages in
  should_relocate_anon() as per Jann.
* Separated out vma_had_uncowed_parents() into shared helper function and
  added vma_had_uncowed_children() to implement the above.
* Add comment clarifying why we do not require an rmap lock on the old VMA
  due to fork requiring an mmap write lock which we hold.
* Corrected error path on __anon_vma_prepare() in copy_vma() as per Jann.
* Checked for folio pinning and abort if in place. We do so, because this
  implies the folio is being used by the kernel for a time longer than the
  time over which an mmap lock is held (which will not be held at the time
  of us manipulating the folio, as we hold the mmap write lock). We are
  manipulating mapping, index fields and being conservative (additionally
  mirroring what UFFDIO_MOVE does), we cannot assume that whoever holds the
  pin isn't somehow relying on these not being manipulated. As per David.
* Propagated mapcount, maybe DMA pinned checks to large folio logic.
* Added folio splitting - on second thoughts, it would be a bit silly to
  simply disallow the request because of large folio misalignment, work
  around this by splitting the folio in this instance.
* Added very careful handling around rmap lock, making use of
  folio_anon_vma(), to ensure we do not deadlock on anon_vma.
* Prefer vm_normal_folio() to vm_normal_page() & page_folio().
* Introduced has_shared_anon_vma() to de-duplicate shared anon_vma check.
* Provided sys_mremap() helper in vm_util.[ch] to be shared among test
  callers and de-duplicate. This must be a raw system call, as glibc will
  otherwise filter the flags.
* Expanded the mm CoW self-tests to explicitly test with
  MREMAP_RELOCATE_ANON for partial THP pages. This is useful as it
  exercises split_folio() code paths explicitly. Additionally some cases
  cannot succeed, so we also exercise undo paths.
* Added explicit lockdep handling to teach it that we are handling two
  distinct anon_vma locks so it doesn't spuriously report a deadlock.
* Updated anon_vma deadlock checks to check anon_vma->root. Shouldn't
  strictly be necessary as we explicitly limit ourselves to unforked
  anon_vma's, but it is more correct to do so, as this is where the lock is
  located.
* Expanded the split_huge_page_test.c test to also test using the
  MREMAP_RELOCATE_ANON flag, this is useful as it exercises the undo path.
https://lore.kernel.org/all/cover.1745307301.git.lorenzo.stoakes@oracle.com/

RFC v1:
https://lore.kernel.org/all/cover.1742478846.git.lorenzo.stoakes@oracle.com/

Lorenzo Stoakes (11):
  mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
  mm/mremap: add MREMAP_MUST_RELOCATE_ANON
  mm/mremap: add MREMAP[_MUST]_RELOCATE_ANON support for large folios
  tools UAPI: Update copy of linux/mman.h from the kernel sources
  tools/testing/selftests: add sys_mremap() helper to vm_util.h
  tools/testing/selftests: add mremap() cases that merge normally
  tools/testing/selftests: add MREMAP_RELOCATE_ANON merge test cases
  tools/testing/selftests: expand mremap() tests for
    MREMAP_RELOCATE_ANON
  tools/testing/selftests: have CoW self test use MREMAP_RELOCATE_ANON
  tools/testing/selftests: test relocate anon in split huge page test
  tools/testing/selftests: add MREMAP_RELOCATE_ANON fork tests

 include/linux/rmap.h                          |    4 +
 include/uapi/linux/mman.h                     |    8 +-
 mm/internal.h                                 |    1 +
 mm/mremap.c                                   |  719 ++++++-
 mm/vma.c                                      |   77 +-
 mm/vma.h                                      |   36 +-
 tools/include/uapi/linux/mman.h               |    8 +-
 tools/testing/selftests/mm/cow.c              |   23 +-
 tools/testing/selftests/mm/merge.c            | 1690 ++++++++++++++++-
 tools/testing/selftests/mm/mremap_test.c      |  262 ++-
 .../selftests/mm/split_huge_page_test.c       |   25 +-
 tools/testing/selftests/mm/vm_util.c          |    8 +
 tools/testing/selftests/mm/vm_util.h          |    3 +
 tools/testing/vma/vma.c                       |    5 +-
 tools/testing/vma/vma_internal.h              |   38 +
 15 files changed, 2732 insertions(+), 175 deletions(-)

--
2.49.0
