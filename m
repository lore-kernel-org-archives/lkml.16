Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278182820BD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745518295; cv=fail; b=dpcbYy8vHO7KjgLz0Z1ftK8V2Qf483TQ6XQlAvjFs0m4FvByt0aFV/gHL754XmXHRBIRhwcHNBW/KB9ddk/ot9byq3eejNN1guMsPoNKtlQaMgPzfMV1Pj4pPGuDEZAYa7NiZXoSIjo8GMRXywuOTYJqqiJacOzD5rrsGnHwwR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745518295; c=relaxed/simple;
	bh=TNvbhaD8HDa9ghGjTbzcRr8l0DyTkIXRBlxbHM3v+6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dnjGbcBmpKEd6eeOb2OhxZgtm/4NoYOCMbG89MP+O1PD52bHFM5byEUUcGvVoGlJo7IkU4y/OaiU+hxUegxd4Tu0XzIM+E6vFCOhLoPmKuHajnCsmUrN9/540L6/BgenRDXN8UzCMCoByElS4CSJxkn9j17QiM5MGCQeCzEDcKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cjpK1zA+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c765S6nv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cjpK1zA+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c765S6nv"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OI72tL014019;
	Thu, 24 Apr 2025 18:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=45lIFV5Ytvo0xGUgtD
	eJJy9X7rAKnLstsGhYHO7IlWA=; b=cjpK1zA+GWCsbUFmDzSIqPe9FTtmcPni6K
	Gjc3Z4P3VM6Js4TYoQaWEB1+OD0ggGPC2+WBjpQOO35zl0G4GwCv5oKXFBuMeC5v
	8JkBCgoPbmp1OJyubv9mfl6PyKIb+bdWzqlnFNrRkamMbSQE6P63S+prpW3yutUu
	ab9doWAd/UaqWHW97hQDd+oS0vQzB++x4nMsa/DVBg/LqRqsO0aqsAeXq8A4H4Gn
	3AQJyhErHPr5pESy9OIHjygT76+c0jkzwrbi0y6sVAW5iWt2nZxb9BKcxnGpvOU2
	QAnCbHc4f0+L0NMB677zuGlZQdHca7qKosM1+cO9vg33Y7wrpjtw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467t9tg07g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 18:11:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53OGxRwU014194;
	Thu, 24 Apr 2025 18:11:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466jxqn8pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 18:11:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vB6bYakqWveACuSeTJF4bVE4a0cM2q6n3emlWHQFaqd3kuvqe/ZigPag3l6u4s0Y+OsdgCSHPOhCWvtRGLMHYa4rn7kbxWxsomXvGTe38gaJN86Z+aCbbV/h/0u2MCvdlZJTPlJwCVOl5PoiJODpKPSgRwwyz3Jxvp7YdryoozYZw4D612e6VX4SFreY89adWjeqc/4UhkhqZAF3t4V4A8s3caYeyjHVzbXqTOvlMXk97++bISzBBnha2EKon2FKNPXqqThUtNmhYXDJmBX4zsZXGCZhAg1dc3ZNGOcFNqPzGyv1jhBNoFRWkZ1Hm40JS0SpHyj4EXjE2EU2J1jbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45lIFV5Ytvo0xGUgtDeJJy9X7rAKnLstsGhYHO7IlWA=;
 b=fT5r9+0u3fU1f2Ov4A8Me6depl22MSZ1kszF5JHUCwoAk8g7ZZw/hJSQpT+KCROHDfO8DvtoGDs9t5BlomCE/o+h+kInRfugoNt5cZPamq9rl31XUXk2yGlCHq9Y+tD+68rhmPAKezZ0HsRw3PsrpNGPB7NUl0kWAPT+aDsD6QOCY3Jr+9ns0ZPQPCE633EHEqnFZ5IOlK3VQPLB49T3UHZbHcnAmm+bSRWZCgnUSDzgdGMfT7BxRDmpOGqurLqUJLJpvuTqqa2udhT07gIzKkz8pBk9kg8toLeErCBaW6DvmmjIiW2gq/a+a3n2L8DbJITVwXwvW/FJEPAfycgYUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45lIFV5Ytvo0xGUgtDeJJy9X7rAKnLstsGhYHO7IlWA=;
 b=c765S6nvO2NIrHQmjxv4i6fmfYZ1gg01w/ljnWm+Pdc6ukQdnF/mUqZe97bwsbR0EFXOiXiNNDpStbcC8/4WSYQ1NIecuZzHhQev67AoTg2lHbOMZhk9+TE1joYdfUa3plh2IeRy3bnQDM3W6dX2CI+yzUJq4q0GyPfm8DOejC0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7501.namprd10.prod.outlook.com (2603:10b6:610:15d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 24 Apr
 2025 18:11:06 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Thu, 24 Apr 2025
 18:11:05 +0000
Date: Thu, 24 Apr 2025 19:11:03 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add mm THP section
Message-ID: <40e69993-e83b-4019-943f-ab90a43eb0de@lucifer.local>
References: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
 <aAp7ggknCytUyAXd@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAp7ggknCytUyAXd@casper.infradead.org>
X-ClientProxiedBy: LO4P265CA0281.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ca9ecc-6921-4c3c-0a58-08dd835b618b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PoVg92UZ/XnIfN1raQtjfY36q09kN5p93BwiETizSwoHaLundzyG+4QSU5Nh?=
 =?us-ascii?Q?N9Ch6J4pR3YwvPraX50npIMq5Vz/kR0opDsO60rdigC7m8PGgUKm9iYeNtgs?=
 =?us-ascii?Q?/HNiG9/5b/GqvkU28JeLI87UVF3OBTKzc+Qkzu6X4VFC0JKobSid/80wZ2HR?=
 =?us-ascii?Q?F+TYWfTjxhpUBOtLFXZfzx7JUxkrMWqHEVw6xircgg3DSD9A1dubrsLyN94Y?=
 =?us-ascii?Q?mMXu5zQkAYy0CVUzpUc15txViqqQNkgDbk4Hu7dUxoP3Q+fMacmPEn/xy5Mr?=
 =?us-ascii?Q?6p6XemlDyfs30KrIlCecJGXvmaz98z2W+yNPI1w+n4nx02SJqTflE6nuY2lB?=
 =?us-ascii?Q?CpN7pZtBO+DTWo8NzjHOjqrDueBr4wXbbMPCcXcPfSzYv7Fh57f8DeN6N4o2?=
 =?us-ascii?Q?WcsTQcci+4yHlaWW/7WMJBsIXDuCtWdHD/k2GT4+HBxyMpFPMULDx/j7+qUT?=
 =?us-ascii?Q?LYNP4k8JUkWpxpm68L/as/M6ABaAL+lQQuozhbgxnEYqqJMRsXZC9q7QjBdN?=
 =?us-ascii?Q?qAew90AlNExGHWzNREby+F7gmP7z6RtiSEiNFFfqGLNOQVUwbVfbXVzoGgUE?=
 =?us-ascii?Q?MYvphQnObuSl3pyObYnEM60BWzciRda7YwY9ewJm/1h/tzDQzPM0q9IkVE+B?=
 =?us-ascii?Q?DG5I3D+EC/oEIXtSCsrNwf/NGX7MlN3y7LfkI13DflX65K5UrJ58kViybJUd?=
 =?us-ascii?Q?eww6BpSzkKHxpwRGSALmvKFlldUX1m4KpLJmXL4WMvtJtbFDniq+XF+aJrfP?=
 =?us-ascii?Q?iIXYp+KwVLLSxhX4fN/U1IWxaKURmLZUZGFxXB47k2qHZpsU5I9Dq97VJRX8?=
 =?us-ascii?Q?ySoO+JrKyKlb1/qJJloYNckOEV9Tvzmme+3NdqH++if3f9NN6BstuL7kvmm6?=
 =?us-ascii?Q?TrQqsk4HeTze976r3vp9cEBR/obenqHRB4OjC4ztnlHlEBsizKCcyy9Nh7Ii?=
 =?us-ascii?Q?n7TaEDShh2Tn23kVkEjuuN4ppnt7fPCv+G7vW935Py2i5MykG1hN2iVfmpYJ?=
 =?us-ascii?Q?52pQjBuME6o6SG2gGW/Iyc9CFC0f0mgym3oBjhDDI5URSa2QKf4h7c15jHQB?=
 =?us-ascii?Q?gB0aN5fgbWD58qNBcjyVz0FoZLR68Q4O2jz2k+GBXphLPGWkuaB9h5Ewdh6V?=
 =?us-ascii?Q?xGWwaUNtm2dgoY1VWHIHXvBO7p/BpwRMXKMskaX/Bm8jBrPvQ03rbEMdbN5z?=
 =?us-ascii?Q?TsKKAHCTHwgXSY5X1eAv14QRJmdlQvsJws4xJHacQVJWCgVOFJymE9Cy1RJB?=
 =?us-ascii?Q?yCnpGueBIWi+mr8lxfIJ0SlEsy4+at0E/vIFjOCDI2aeu0Q1SEI2rmxDbuD8?=
 =?us-ascii?Q?h2s+d5/9AAvCjOtoCTolaEdCNTt8dV9ABfj+zLflLKLRUMX1uG24ehNyX/zC?=
 =?us-ascii?Q?b6lqZyl5V46YzLHm77iwqwFEgDVsi6zq9IV6fDV7YfUavHerzn2bRpuAs6Ch?=
 =?us-ascii?Q?aspthzPTx1I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pxy4u+6BYWaiSF9qZLWaLbx/UTOWuXAYnGckrzspHWpb+mmMhfONHirOWNCQ?=
 =?us-ascii?Q?OFVCOniXMCDjaHIjBsew16OMifMjuh6+voY7vSZEiyDZv2s52UUdzG2yT8kb?=
 =?us-ascii?Q?yF117Me0wXJsIJo8iwVWGkPtAMC6v0jpgWF5MIG1/gN5CXPdwTS/SAyDMAa6?=
 =?us-ascii?Q?ibPcme/qETeO2aWGdddw6VtrTjlp2i7ZIARCaBVxL/H8ipajJgYXQzYrzpD9?=
 =?us-ascii?Q?9zZbLs02Urs5eCSBQMKYfZe6hhVqhHiBpo5cyozK7dYIXReAZ48b3V0R/58D?=
 =?us-ascii?Q?A8a55TFE5T2KO4jNkbTPA/tHgPo6MZvz9aVVbjta3/N4/5lcUHCpPsA/HvJU?=
 =?us-ascii?Q?4uQr/IIXLEzFCT7ks75hVdN1hJsuPhrbABTRJ+XE9nGLs74etlZslhU6a61X?=
 =?us-ascii?Q?ciCH+CEyq6dmT57KhXZI3QGV5NAGKQmoPe9vOiyQe1X21Nh1YSo41p7umw7T?=
 =?us-ascii?Q?NTYKBzPMfzeVEMV9jR9/nlk049/vwKJp3MslrJ507IhuAwGtFyR7gdY6r+CE?=
 =?us-ascii?Q?CKp1zF9fQLqTgrkvGIOLO1PoxTCH4QJNanvSXAfEdZOuWZ7S1yT3uAZB4t/Q?=
 =?us-ascii?Q?9WV7YaNuGUD9gWtNNoU00Lx9DLZo+cif1ynWhTpx/Y2Ka5RtXKCkkeeaq2dG?=
 =?us-ascii?Q?sKCdeyNDaaZOn+RhIJh1UnjIDfQnOd8fwpz+9Yk9PZRUtmQsRLQwR0FNOgJs?=
 =?us-ascii?Q?dyplTRR71R3cItkHb4MnXfjcX3IPRW7F/CXLkL1KATMTfRx/XPSJeYll00Hh?=
 =?us-ascii?Q?W0J9CeqfBS6frDeQMTflu/FP7To+NLTnvM9Ltd9juEvF6LmJJu/y36PewM70?=
 =?us-ascii?Q?7usRSfwuGCDMo4jZmXgRJtReKwLsme0PUKde/hUo6xNvKD/4UAHfjdZHCP2g?=
 =?us-ascii?Q?mbUhtK70c/9lSOCeKAGNOoyBeDA6JXgJT9WH1jox+7ZkjTJNE+9+/YMqT7oo?=
 =?us-ascii?Q?+NihdUl/RbFd64p3AUEiwBgml25zKxBn1FYQl/iFuYiR6b4spDbKygJz3tti?=
 =?us-ascii?Q?xl/l0vJN2G7Dp1w5t/YGlgfGmddKW0nNe+apcBiJFc+4DATnvS9+8KjsGkuf?=
 =?us-ascii?Q?MNgEb+0zg17L8MoTcJug4AHQWDxG8P9b0u3u6OD/c6xn3xVE0FDcnuGxSrJZ?=
 =?us-ascii?Q?zs5nuZ7E9Jx9XeVCfP1/AzdqgogeLc+gaMb1OOcwvhuTw0MwtBiYys84/wtk?=
 =?us-ascii?Q?snkQuXXeQTQUAt9QoZTErTBH7ccwHXmHJ1NSiNpEPaD0124VH5YvjFuACZVE?=
 =?us-ascii?Q?f0Q7VW/J0eVGuPFlu8RLxYb9pIpq1adtpy6qkXlZcRaEJW2Y49wN28vhrTnz?=
 =?us-ascii?Q?kuIHndh19DnviYw22ulZByJnxMRbJWKoJGFT1yi/X/S+CjAqQ4CS1zs55QMs?=
 =?us-ascii?Q?rwKvUQkT3XvO90ZBWQD80qSdo7L+WMO/TTE583YKyB4scjVABwfkfjb6gYER?=
 =?us-ascii?Q?ZKtkhNYqJWwiv2Fcz/pOI8FH1UxGU8Qc20slW9VAESK93DthptJLvDQE8l2i?=
 =?us-ascii?Q?rMS4JC49f3TpMK1aX3rZsBKF5MmfcaYErzXSK7oR8gH4+5hg1izV/o+JrcZt?=
 =?us-ascii?Q?QVFLa882dLKgBsTAC+43y2j1ZPzpLLlA0DLJMH0RBgEQH570kVRAuTQUwSX+?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oB8YHP2y5SizUcV4Qg+5lqPD8RFvhLm5MVlMwrUNRZKDgBrVmAUZpGjdeaW/VXqV2NELarHnv+k+j/sCmRJQraYUPBrCkIQ7MUyzXwNRDc0y3k58fvzJgKFqe6RGP5cg5zYd11smrlFV9bBUtlR1XkaX0VuNtsdTHKb0dohFpfEcPXMVkDajWvVUi2LJ9E3sEhobrMUPY5DHNKVEO/y4p7OLCVO7GXRH9Kz1Uij+y8ZhioyX0A2mLpdAE1sT1ZSgRbBEv+Ab/snqKm21GzROz2ujIF/WIqfe2Xv51BSsAhjrY3SWqt2QRKRccDBA/8SejnW+pCSQRLDmG7yLJxnrWuR3HZOGgLb83R5MFw/I6E3pDUp5G4C2uWF3VOPXidkzxTJ5gxIczDh98Gx3YYv4iupUMD5+TEOky9z6gC3kV2QV7WgraLNphKHaCQLj/+Sgh8niSD4LF30U/aaoGOO6zu4lR0zYbeSQ1bnAjD2ZLjng9Si3cbQsFsZ7yAy/r49gdM26B4XilX2/SrbiXXyVeVButq8x3inpy6iXMGwZst73ytZXxL/Tp4cMhaOWJrwO4Os3urHqTriYgbrq1PFWPKunh6yHkjckrLyAcE7K5cY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ca9ecc-6921-4c3c-0a58-08dd835b618b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 18:11:05.9489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fcAOLRPazCkVhkK/ABZgSfa7ZYjjSDpgGYc2G9DgXJXZIAEaXUtZ6cC7SEXYev5SKNkKSldxCr2hoxNqqlCiuBDCEtDIznXOYQdNIDwGZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=909 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504240125
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEyNSBTYWx0ZWRfX9pY+b27WSSps PzSAvx4tsiOUApQ0UsT3BMlPkZp5QTXkPNFAIwkjl911BhfLhgp0uCBnkLihYv12lsTvJGUexYi 30mmctq8Sr/s8h2qyZOpZYpcrSUej8W+eGFYUIckG/WCunxE3fT9oOzCzs40Uq81Dpv9SAf2tXc
 U/+sa79t4OOAXtqYtK1TtFXMlYctzFabqHEFHN1jCWaxomMm2JO7JjV2nJpRHLhzMbGDm0u8o6j YZieR5yRGpbTao1GVULVxAiWkkSPGsN4P6PSJUkz7dBgbV3XVEiTctuf8YB4jWBDSAwy12k/0j7 i/8kdgfancfG9K2IJ3sk+vEuuUO9UHnYGBBImoSWwRGWQpliFvSwUHVAMV+eoiGMys2gG+smJtS kTFqbGAC
X-Proofpoint-ORIG-GUID: YgWibrBnDGVuXxVIFy2we7Ua8yMGtx8C
X-Proofpoint-GUID: YgWibrBnDGVuXxVIFy2we7Ua8yMGtx8C

On Thu, Apr 24, 2025 at 06:57:22PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 24, 2025 at 12:16:32PM +0100, Lorenzo Stoakes wrote:
> > As part of the ongoing efforts to sub-divide memory management
> > maintainership and reviewership, establish a section for Transparent Huge
> > Page support and add appropriate maintainers and reviewers.
>
> I'm quite queasy about this.  I'm doing my best to make "THP" disappear
> as a concept.  How would you define what THP is?  Originally, it was
> PMD-sized-and-aligned allocations, and some of the way we expose it to
> userspace, that's still the interpretation.  But we also have folios which
> are of some hardware-defined magic sizes, as well as (for filesystems,
> at least) random other non-zero orders.
>
> Memory is just managed in variously sized quantities.  There should be
> nothing magic about "THP", and I'm still annoyed at the anon-mem people
> for baking various magic sizes into user-visible APIs.

Right, but as it stands, we already separate out handling for a whole host
of different THP things by file, which get_maintainers.pl knows nothing
about.

For:

	include/linux/huge_mm.h
	include/linux/khugepaged.h
	include/trace/events/huge_memory.h
	mm/huge_memory.c
	mm/khugepaged.c
	tools/testing/selftests/mm/khugepaged.c
	tools/testing/selftests/mm/split_huge_page_test.c
	tools/testing/selftests/mm/transhuge-stress.c

This is not a philosophical position as to where we _might go_ in future,
or how we might decide to treat varying folio sizes going forward, but
rather a purely practical step so these files get seen by people and the
de-facto maintainer is ack'ed as such.

When we get to the point where we can simply treat all as the same, we can
reflect as much in MAINTAINERS too, this is not set in stone.
