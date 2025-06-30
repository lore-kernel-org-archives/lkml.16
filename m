Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BCE25A2A7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278621; cv=fail; b=fw+6w2j4DIdFBqWYSeonD4+ONen8KqcBPxcoDcMG7jkUi39NJMAJ3v9wGxKOPIhzfdUy0wv1RF9Mvrnm0zyLK6BBj0d0+75cZgMkox/tv0WW+bTdKIVOijmb2AdVKqBp1S61FXSPfU9hn7U/PB1oVSr+9jtziDgNsaLKQuV7mnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278621; c=relaxed/simple;
	bh=My8InxSzBGCNDDevWbY2JpFhfed1iOZ0kiAa0pijHJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eIxLNSdK/ejdTKdbIOkJSYz2W6BnTO+8J/S7sqWSTUvG3MEftQEGoBmTWLF0iY1yd/bwgC3mqlT8GQeDxWetIywSPx0GFH4FouT0u11qmr2VIVd3m1bEYfUSar73L/1df0ks1j4frCQzs7IO+vdkOot+gAHTFQiJlmwzBBeyDWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DF2jBpuH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wwRvZ+JB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DF2jBpuH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wwRvZ+JB"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84mdf029654;
	Mon, 30 Jun 2025 10:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=S/jq+/KRcvUuj7rtSS
	4D1YugRVKOterajFVkK4gnssU=; b=DF2jBpuHRi7FeyaCsB3HtYMRoPW37tWWYL
	DOJcd1PFPdboBTDzOdgC4K0efVOLgapHJujYGyvxHT0772uxNVMqzYszbRvGXttY
	8TIIJArvQnPEOUBF4gO/Hqx/fq5ZXw22u3bL2l1865QoMQHjN5WxLP36vmMiU1if
	dZ04Uq9y0RvLD9FkS+4DExhpy/MWkKoe+TK9IKsRLi3uTTZpon/O5oZLxArhR2Dl
	hsiA+Z2sZ1flHthGoKnuFwDTyIgDWik9iFW/wcrztyuZ1FYrloGsdLmMwZcy4HJd
	vkDu5ECK4n//361DMxybHgUUVEnk3SU5WJPi4TC4KZQYh27KpG/w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af26n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 10:16:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8KMt9030452;
	Mon, 30 Jun 2025 10:16:03 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u852a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 10:16:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hopTpTqkRKFnfaOCSpLurBJ2bh7ei7YikT0Qdxu+igFG1gU1HnAvHhjzehq61aigjcICzKK3kP8ww9J9niMaNR9BK1pZnsBlJCGEQdkz+clzXykmlAJxO/8EGJqxD/39+pmR9Ss9yEorpCXe03KCjgU/GY4oodrOODh4CUFm6SGl4PUNHwVjCeFi+oi2e2bSWsdCd8vEEjEz+iuaCeeaHcJEkgM6AHGOO5a0a0JGuFofW6H1AIOz9S+36ohJr3c2rZdCC7kla5qwCHCvA/BHZbxtdLx4u38nJWhYk+kAV5HDekRvx+RoAbsuEl/qAEzLlXoAYtTMSLRCDqC9LJ3mHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/jq+/KRcvUuj7rtSS4D1YugRVKOterajFVkK4gnssU=;
 b=k4p+Iwvd1eBfdmSoXcOeUSTiKJWrChDDpEJMSveC54BP0+g+QzkbrCm3k9xRx6I8qO5VT8CLyyjRFklpuR7yhB9wiSfg06WWsfTUlXxJsLj3q7VUkUMDEbb/aBE+h1UJBAgWYxz+GOUcx7fqmgmAC5k+0thYnf6KvvsUfY19V4bDzD8jsyziyS6ZfJiM9Zsr+DYScvLPHv1mMHN+x1iYV2pIJvUWDloBxqegjq9BHGbdoBOTO7AmINYHVcZ2ngRSeGwfmlpUUpasxjNQ60hxb8F6C27QR1F0OkQZzZqSVazS8aJd9nXq8vX7QIGSx//bS+O4ADQHqfxMYXNw8OWNGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/jq+/KRcvUuj7rtSS4D1YugRVKOterajFVkK4gnssU=;
 b=wwRvZ+JBmenkfxWsnycw6H2J9SLUkAY/G0FifKjj+dcFnbYZ5QxZIAynM5z0pyPlQzV8pROQnKW5PFkERIUTSrRVxrALWBu2cgESKOmQ4AAATjqyCny5RQL9VoUYkYATQ9jPuMxRh3tqvTbcAoImGQcZGSFTzmGq3PeFXCE+ZM4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB5124.namprd10.prod.outlook.com (2603:10b6:208:325::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 10:16:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:16:00 +0000
Date: Mon, 30 Jun 2025 11:15:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nikita Kalyazin <kalyazin@amazon.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627154655.2085903-2-peterx@redhat.com>
X-ClientProxiedBy: LO2P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::31) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB5124:EE_
X-MS-Office365-Filtering-Correlation-Id: e267171b-640d-4271-21b2-08ddb7bf1c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SmG49FFXZakXO+JEnuX8dgTUpPqbqD4gwPS14gPT4eoGPMiZgjBA+HAEjHJY?=
 =?us-ascii?Q?PAx3doEOqUVQywLRbpcR9FwOM80m1nIOkJ6mNnyyGk0BxAsKAAi+8NRNti4x?=
 =?us-ascii?Q?uPzH8lOy7BKSjUcuJ4gYd+bztT2FVvYxLmJkjOGlw0awpd/q622K3QW81htW?=
 =?us-ascii?Q?yrI//NgCu1PkmKs3XBMoodYq2UHosG0MwoRJWNlnskzSfmsx9Y4j9UFFtYvd?=
 =?us-ascii?Q?oiuHdqV1PSlSwWi2BX6+qpx5dY04Ihp5/6r49heQRvocuXUu3Iz/9SXKuEl8?=
 =?us-ascii?Q?iFEIVn5c2V5GQQcDy08nOCCdYjMeClyHiwDNuZ2waHrNJWBJQD8z3sY3yT7d?=
 =?us-ascii?Q?AZfLiUGSNI629HncZzmjjTbCm6HpvmqHXNhXlIAa8+AfkaNp9s/7GJSZoznM?=
 =?us-ascii?Q?iWZpfdjiCFbpgezVaV392eIxmSugyoPi/J+gHPAeOYf5spQZTCgQlP9fpNOO?=
 =?us-ascii?Q?ZKns9BX3JRx4CLDoTdZXBKJ1GuCdqmpxJ/8pHLUOvYG8PiADqE9v/HaFiVgd?=
 =?us-ascii?Q?ZImGH4W+TUVzql2RRN29EZcGVEwOELQNlH7Xp+vZuOR2ggXLRW2I9Guen/xI?=
 =?us-ascii?Q?92noNb7X71+6HtTqIrwo9O4wvqiOYZsBVrm4l6H3okplLW05UeG0DBzkBA6v?=
 =?us-ascii?Q?DQFugUxQMKGqrF+OTZ9bpWo/kLdRQxGPxIPeBecshYXxXZcmTDL3+lHHijbG?=
 =?us-ascii?Q?jTfbr90wvD7/5iF460F//9/hhCTCQVyRgFB0SSmDG738mpWCtk6Nvb1JUEYT?=
 =?us-ascii?Q?xItdg0Qvro7O/ZlW9++PhuGRT/W6+tF2ZDvnKWbxtySWRN9oT7arPxC0bNN4?=
 =?us-ascii?Q?Prharo/UFtsoJEYE/BWvXtTURbdRWZ5+deDq0V0Kk5Im2Ze1jdpIQJnS1+WM?=
 =?us-ascii?Q?/yxAZTuuLuqkrf4kyGLsw1MSqoPlKgnxU7PZgpsdCjRg8LfZ2lf4Qm2tkcOT?=
 =?us-ascii?Q?2HMxwyhqy3COq7Ex5kElvJZ+u0tCbIElcf54tnWgsD2tG++GlIxAldaShwXZ?=
 =?us-ascii?Q?Aou7HguOQoS7rxE/pgm79fJl1+ouRE9JwsoefTrkWACQxbmFS5ACKllBHDGg?=
 =?us-ascii?Q?P5Rw7PnWB/VuEaIJFIa0k6J/lq+BzFqVSweQcwKjT4ZHq+rM3xh7fc7Endbv?=
 =?us-ascii?Q?MVb+iPrSkibcL2pXNE73vMHoZm6z9QjNGH8HTVX4yu5hNIOw8UqZG9N7qeWu?=
 =?us-ascii?Q?jPgrZIlyPHC9nCGfB9NjwRSCkk036+JIidk7ziMMyjHapZ71ah+4ruHZvFy2?=
 =?us-ascii?Q?0V8Cy1qws/LMXcd0jiZxTthISfueR49s4Do3ivFksZuVIeV5oS1jWqjn290B?=
 =?us-ascii?Q?Cb0cvkJjAiF/H7LELRqYEACTyXPGtVZMgclC/rzQ80OsPlhgedjL6ujvs5lx?=
 =?us-ascii?Q?QsHCeZZ8nuua6CMck9N4BA9ihrp+2i4GtfCGURtYh+v+qzqBoYiaSOUm8t0L?=
 =?us-ascii?Q?rfp2KiJdr/g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ake1jCb0bUQAMEanRlglGxUYX/YxCeqc8e4yxXurnU6vbiwACBgXG3fJUftv?=
 =?us-ascii?Q?xmTlooFNN4qitJ4ykADd+pn8/28ueMmXzhaq8GKlpFVd8HVzWA9tC79tkwqz?=
 =?us-ascii?Q?/m30bgxhGq95pn+1jVZ9KP+2l9JV5PqfwVII0okwWkCn1slnJMWjNFoT7xc4?=
 =?us-ascii?Q?WDA0CA0ZbiQpvi8My4pHFIpN9kOI/ru3Lv5OGkU5cOu1puJbhk0uZaYHju/8?=
 =?us-ascii?Q?JhzkWlG+6ylNcJKgwVIXunSz9k76nmgYQ2gN40dIU5wYyYz8liBg6I3SGZef?=
 =?us-ascii?Q?bDmTHGKM6pOPKANOULMdCMCPWSgU06st9p719XR2DLJvpz6d3jYZqDkJmZOu?=
 =?us-ascii?Q?D4W1JMUP3cLUSiOczbrN1X1YhfPRq85sSdqDFiPRVRJtThbsluFUoaHGvA+a?=
 =?us-ascii?Q?hxnI95SID2cS77YZrs9iqODaVFgONwKa2ONC42w6kccWQjRCOUg+cEdMW42v?=
 =?us-ascii?Q?GLXxLhQ/kcUvXCcewGSuHQoo6yDTha6FHFma62QDNKwQPWn8KeU3Z6yCMgLn?=
 =?us-ascii?Q?jiqmFm+3/b9EU1NLIpDgC/rUBKuiWbmiOpz/wGj3K9SRJ2AMZiVBWrUE2kU9?=
 =?us-ascii?Q?4EbuV3fqcw3a3moFjD6ZpOTf0IB+MnLeoY3n2QSBSgchmle79GVQ/cGD3ccZ?=
 =?us-ascii?Q?gmM6LmRl4+Ny3llw3xbH7dK4gihm+5JyK1fCL+wURcCRJJdFVVUmmBQM7WQD?=
 =?us-ascii?Q?CGY/FGbzvKKNNx5HuMlRxqmvM8ng4mYkfeJ2ixpXv7Z9WXWhA7B27fmmmIpV?=
 =?us-ascii?Q?+wnyz5B22YBfaYFnLQ1VMqSW77upLMvQFofzLfQMxhyLpf/BtiNSa7pycgB+?=
 =?us-ascii?Q?B/P77SfNWqz6BSbR7RDUPAaEX9Vou7GrAqdYvbwwYXQ7WeN2YzHUq/wMN77F?=
 =?us-ascii?Q?pQTTZStOEFsqpohwOqo8g7FKVBJYBuaREYcC6HjrSo+prsieTfJtabQNpC25?=
 =?us-ascii?Q?zUl+vDOLxr5bdVq4v0nOnwkFbUIjHpB3F1M1XtmSqVbK/FJXgUhHvU2dNWe1?=
 =?us-ascii?Q?Vtb6g0Cc5pEWADam7NKOf67enPjCwJQ5v1+/nmWlTvuVw6Cu2Lj9CP0sW03Q?=
 =?us-ascii?Q?3NUANcIsng9dYXMpNX2F8f0jwQ39O6RI8SGZIl16X3dH/Ql0vQRndb9b7XTW?=
 =?us-ascii?Q?kZTClm3iRNt6JELnju0lvFF4aVtQ7APY3iyDoyG8vkcAiWvUdqdj4o6AS6Ch?=
 =?us-ascii?Q?d7ozY7EN00Yli7KNTumvUJtAWB/oeCxwOTRG13vdmDT3u3FdhzwlDEwl+nba?=
 =?us-ascii?Q?FGF+bg71OVvCT30rTpvZUjhxV2Nr5tQt++x09XLkyWIv+f4JE1S2J2hvuI6m?=
 =?us-ascii?Q?0RVo3mOYI0NWnoNppte1l4lia0sKNJmnAub+PVGCzqIWpyUGim7EHuhij6Z4?=
 =?us-ascii?Q?yLsYRN7+ovYt2+XmVRKMSSEoDq2eQIC4UyqFcdQLcCtoYEYV2gb+iCjFEaDg?=
 =?us-ascii?Q?7+KNFr1UVqM/O08EBVWpq15YFSTDTm38iaYfp8dxV8KPvKVjDlPxJ/jK86TL?=
 =?us-ascii?Q?Fy7JftO0QtfPuJPFxFF4U80HEzn3J1brp0b9BQ1LKAWU/YefGKrD+WWga2U3?=
 =?us-ascii?Q?5jPgJ1L7zyGyCdG1GU3I1LkEUIpzTXB2KSLzFDSJDyXi9LQ+3AbcrCVcmQLc?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qlc9amt/BkWmnTy7EKXYCNTQQZQQUnRa28eEGDlKKqs6yTLDN51kBNXwIjbSlYq3PwMBpmuCaWvNJXG4ExMREmLoxWC90vfYr0EnrZ4T4hdZBxuZ/CS6k2wg4r5FECvU34PhLHrIOwh+G0JhFhCnH0lJYd4WTXGwpjAwrhTPKDuTVBl4vLNG4jv+cocVepoplAaWBN4Qm7fyDTgCIgAk5XfJRp7kLv1LB+uRCvo2WgzIuynzZpZ5ZUQMtw8ZNHDzhYdpB+dqowYQ8vx+4TXr0rtqOrd/sEfHPuuXpr5Hq5V1J51PL7ka7OrmoXQSHRYzJ58+xMnRAzK0rF7UaEgMCft/vmtcgsUZYwRQuMwZWnYz0agSprV+j7rW137OP+F8LTIGmnWZQ1gGBi26baaKOMANS8//lAV11emH9P7xjR9NwG6yG3WYAnaG4WuwAQvT/O1aK1EpiH2OK8h3Xit3+qFfMuTRYUBawnO+NFkxPEVL//Cd/piwYVnLuYRhgYU7nCe7GdbiMAssMZhR2NpWZg+mwB+5sWfNj1+SEKGn1+3EK82z9KGhYb+N292fwQs9hZSpYFEZT9ZYUBqmAg5ljWbkaGh70zZ8/sqMeSoiDLU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e267171b-640d-4271-21b2-08ddb7bf1c9f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:16:00.3879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzMkX93raGO63nIajSdMFV18hUgYdhYojb+5sI+Os9lB85W/cKiLHGJDITsG20bLI54Tfs+mltGyH97p4dNhhMZpAn6jik7ZoAh4Xq5VU48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300085
X-Proofpoint-ORIG-GUID: Zb0sOFJXLKL9wh6CIrFp_QrtJat-Qojo
X-Proofpoint-GUID: Zb0sOFJXLKL9wh6CIrFp_QrtJat-Qojo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4NSBTYWx0ZWRfX3xPVdg0ApEQk IK2LkLCI35qVM9VFg823cSAuXQ10ojyRr/FRDO2LjcuKgzZxgb3Bd/Ofs+wzB6zzUR+mJJcFHQh 8d/2YHKJctnvo/lyChSc3rcsyVULX+aoFC0F/CJQdcNuQ3TNj+8jP5CmRLUbe9sdjX2wj5WTdnj
 Pci/escopOsxDaC0gjKf5CeLnll9c9cVIoHpxwPxwDJepVcKAUCz3jEX3JVzubpCczlPvBCbAU/ +HLXyrzqnmaT+4lbD67AVgkJm1alMH+yp6PxafSojvKyoSZyqspWLJXN/xO5y2p2+KdCMMClK0t LdMDexPfyNw1oTIpB9iMucAckqL519PvXiG60ZJoqD89WM169DCZVJzdFzOdE3xBVzHB6B3aDnH
 crS1TlZilddwLiMnzoIlNA6WrZA4NFKrB3enO/MoEdLcL3y3E6u3A2okRKSrcvLfkEowZWJh
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=686263f1 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=SG6u89JugPITXVSWqf0A:9 a=CjuIK1q_8ugA:10

On Fri, Jun 27, 2025 at 11:46:52AM -0400, Peter Xu wrote:
> Introduce a generic userfaultfd API for vm_operations_struct, so that one
> vma, especially when as a module, can support userfaults without modifying
> the core files.  More importantly, when the module can be compiled out of
> the kernel.

I'm not sure I understand this. One VMA 'especially when as a module'?

This whole sentence is really unclear.

So it seems to me that you want to be able to allow more than just:

- anonymous memory
- shmem
- hugetlb

To support userfaultfd correct?

>
> So, instead of having core mm referencing modules that may not ever exist,
> we need to have modules opt-in on core mm hooks instead.

OK this sounds reasonable.

>
> After this API applied, if a module wants to support userfaultfd, the
> module should only need to touch its own file and properly define
> vm_uffd_ops, instead of changing anything in core mm.

Yes this also sounds reasonable, _as long as_ :) the module authors are
aware of any conditions that might exist in the VMA that might be odd or
confusing.

For instance, if locks need to be held etc.

I am generally slightly wary of us giving VMAs in hooks because people do
crazy things with them that

>
> Note that such API will not work for anonymous. Core mm will process
> anonymous memory separately for userfault operations like before.

Right.

>
> This patch only introduces the API alone so that we can start to move
> existing users over but without breaking them.

Sounds sensible.

>
> Currently the uffd_copy() API is almost designed to be the simplistic with
> minimum mm changes to move over to the API.

A good approach.

>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/mm.h            |  9 ++++++
>  include/linux/userfaultfd_k.h | 52 +++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ef40f68c1183..6a5447bd43fd 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -576,6 +576,8 @@ struct vm_fault {
>  					 */
>  };
>
> +struct vm_uffd_ops;
> +
>  /*
>   * These are the virtual MM functions - opening of an area, closing and
>   * unmapping it (needed to keep files on disk up-to-date etc), pointer
> @@ -653,6 +655,13 @@ struct vm_operations_struct {
>  	 */
>  	struct page *(*find_special_page)(struct vm_area_struct *vma,
>  					  unsigned long addr);
> +#ifdef CONFIG_USERFAULTFD
> +	/*
> +	 * Userfaultfd related ops.  Modules need to define this to support
> +	 * userfaultfd.
> +	 */
> +	const struct vm_uffd_ops *userfaultfd_ops;
> +#endif
>  };

This shouldn't go in vm_ops like this. You're basically changing a
fundamental convention here - that _ops structs define handlers, now you
can have somehow nested ones?

It seems more appropriate to have something like:

struct vm_uffd_ops *(*get_uffd_ops)(struct vm_area_struct *vma);

This then matches e.g. mempolicy's get_policy handler.

>
>  #ifdef CONFIG_NUMA_BALANCING
> diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
> index df85330bcfa6..c9a093c4502b 100644
> --- a/include/linux/userfaultfd_k.h
> +++ b/include/linux/userfaultfd_k.h
> @@ -92,6 +92,58 @@ enum mfill_atomic_mode {
>  	NR_MFILL_ATOMIC_MODES,
>  };
>
> +/* VMA userfaultfd operations */

Are we sure this should be operating at the VMA level?

I mean are the operations going to be operating on VMAs or VM fault
structs? If not, then this surely belongs to the file operations no?

> +struct vm_uffd_ops {

I'd comment on the naming, but 'vm_operations_struct' is so bad that it
seems we have no sensible convention anyway so this is fine :P

> +	/**
> +	 * @uffd_features: features supported in bitmask.
> +	 *
> +	 * When the ops is defined, the driver must set non-zero features

I don't think the 'when the ops are defined' bit is necessray here, you're
commenting on the ops here, you can safely assume they're defined.

So I'd just say 'must be a subset (or all) of: VM_UFFD_MISSING|WP|MINOR.'

> +	 * to be a subset (or all) of: VM_UFFD_MISSING|WP|MINOR.
> +	 */
> +	unsigned long uffd_features;
> +	/**
> +	 * @uffd_ioctls: ioctls supported in bitmask.
> +	 *
> +	 * Userfaultfd ioctls supported by the module.  Below will always
> +	 * be supported by default whenever a module provides vm_uffd_ops:
> +	 *
> +	 *   _UFFDIO_API, _UFFDIO_REGISTER, _UFFDIO_UNREGISTER, _UFFDIO_WAKE
> +	 *
> +	 * The module needs to provide all the rest optionally supported
> +	 * ioctls.  For example, when VM_UFFD_MISSING was supported,
> +	 * _UFFDIO_COPY must be supported as ioctl, while _UFFDIO_ZEROPAGE
> +	 * is optional.

I'm not sure why we need this field? Isn't this implied by whether handlers
are set or NULL?

> +	 */
> +	unsigned long uffd_ioctls;
> +	/**
> +	 * uffd_get_folio: Handler to resolve UFFDIO_CONTINUE request.
> +	 *
> +	 * @inode: the inode for folio lookup
> +	 * @pgoff: the pgoff of the folio
> +	 * @folio: returned folio pointer
> +	 *
> +	 * Return: zero if succeeded, negative for errors.
> +	 */
> +	int (*uffd_get_folio)(struct inode *inode, pgoff_t pgoff,
> +			      struct folio **folio);

Not sure uufd_ prefix is needed in a struct that's obviously about uffd
already? I'd strip that.

Also this name is really confusing, I think it should contain continue in
some form, such as 'handle_continue()'?

This really feels like it shouldn't be a VMA function as you're dealing
with inode, pgoff, and folio and not VMA at all?


> +	/**
> +	 * uffd_copy: Handler to resolve UFFDIO_COPY|ZEROPAGE request.
> +	 *
> +	 * @dst_pmd: target pmd to resolve page fault
> +	 * @dst_vma: target vma
> +	 * @dst_addr: target virtual address
> +	 * @src_addr: source address to copy from
> +	 * @flags: userfaultfd request flags
> +	 * @foliop: previously allocated folio
> +	 *
> +	 * Return: zero if succeeded, negative for errors.

Can you please ensure you put details as to VMA lock state here. Uffd has
some very tricky handling around stuff like this.

> +	 */
> +	int (*uffd_copy)(pmd_t *dst_pmd, struct vm_area_struct *dst_vma,
> +			 unsigned long dst_addr, unsigned long src_addr,
> +			 uffd_flags_t flags, struct folio **foliop);

Do we not need a uffd_ctx parameter here?

It seems like we're assuming a _lot_ of mm understanding in the underlying
driver here.

I'm not sure it's really normal to be handing around page table state and
folios etc. to a driver like this, this is really... worrying to me.

This feels like you're trying to put mm functionality outside of mm?

What if we change how we handle page tables in future, or the locking
changes? We might not know to go and update x, y, z driver.

This is concerning.

> +};
> +typedef struct vm_uffd_ops vm_uffd_ops;
> +
>  #define MFILL_ATOMIC_MODE_BITS (const_ilog2(NR_MFILL_ATOMIC_MODES - 1) + 1)
>  #define MFILL_ATOMIC_BIT(nr) BIT(MFILL_ATOMIC_MODE_BITS + (nr))
>  #define MFILL_ATOMIC_FLAG(nr) ((__force uffd_flags_t) MFILL_ATOMIC_BIT(nr))
> --
> 2.49.0
>
