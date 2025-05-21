Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712E14430;
	Wed, 21 May 2025 02:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747795180; cv=fail; b=XVu5XiVZZ7LVbd1mfURIP323dDDneqwW5IiMwFx+Sa4Zz/M5mKz/hU5/fzKuU4/oyWja5H7653KKtrJlnhiSkkCvZVGsznJWx0VLUyGBzMlfWTDGX5RZ5HO+nCWL8MpAvX3wgDJSs2ZqjHuOELdWAWmZM4LgQmZqhCnetdouFng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747795180; c=relaxed/simple;
	bh=2LeWyE+6OGor5NXEgh/ezXyK/LbkPOGnDFkl+8Vl8sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y7s7kxc9DDA5zPjKewWwCnFcKyFWakB3fS5y/IBbKzFk2GbW0x+MWT5U/oPOEHT3uySbXPWCXJcW450mTOAZWKRG7mXIwEwYWdpg0rykNDrbvuK8CWQ/svuCYsDAKYJDCSRvXBPnj84XQunzU/T8TntiPydLPBzISupiWy2ouPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D9PhdOFp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=exVl9IC+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D9PhdOFp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="exVl9IC+"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L2bGw9007102;
	Wed, 21 May 2025 02:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=vtowT1H+IIvsA5yCNK
	JZnitSzw3BYbNRQ0xDkTLuVX0=; b=D9PhdOFpLQ8ONiDO1w2/xgiyvqQabF87X/
	zQtjTQe1YT756e5DySbzVmoGvPHkr65+4WumheXFcUhjtoX34WH4tR8ueuiZ6AgU
	XIT4LF04J5HdtbMCBE6VhF7H1tvISf8viRo3rUodba+QCIkCRipWVAQlUrw+frm6
	iYlESKbb81xQ0/U5VAL/URsLdjQp2qzwLgaKkRh9e1v94YEwLR94/mTQgnsvkmy0
	JnET6HhP1LeEX9YJ2Ur/cD+Snrr/L53CFy7nv+Hr3nDGbZuDqgLaN0YlNQB2SDZP
	i40funbgcuIUTGPwbVsreLYe7e2DkZ3myrGbGeuFc4Uxo3I6wsoQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46s671g046-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 02:39:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54L2Dkqi032049;
	Wed, 21 May 2025 02:33:34 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11010051.outbound.protection.outlook.com [52.101.51.51])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rwekshk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 02:33:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuWrnckOobhL9iR21DBuzwVnNkF6v3rTlUV8bwqgXN7y8Np6W9W0+824oZdgn5ucUBLNM5hMREGdLczJpxeB1pJUhGhVp0UBek5VU85t6G/2m4hl83+/zYHcqQcNW06gkIVdodljpCXuXZx17oez66UCIxmiX61P8Gd3ip3jzqVZx2aRKzPuZSMNNLgeWLOkaHw8p/3Ebf9H33hJQGn58wOE5oawSf0UGDSazrt9i/dY4gOD15YSBYkcZPhC/W1LQmsnnPvjrI5jeoGIO0chLS7FnsD4j/DWRuFxD5CNDZc7W7Ip6wCtygUWOKvJZ82yUqI/G+3xXGiglKJoTq1x/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtowT1H+IIvsA5yCNKJZnitSzw3BYbNRQ0xDkTLuVX0=;
 b=cJ1pkScfPGDRsL6QyHKow4kEhJRE+Qb/c4fLUtmcjLcEUm6eKStHRBFGwUEqKsJWSv8tTJrVo2menXCZVjzXJXHwzJEOaiE91AoqnBWXCi/wcQzgMf2oDz+KT0rZNX7m2SLqL6nL2XwIYidD3KtMr5uk7cxlAzoE/nGHWgkDPETn8Jf2vdPlKJenEvCUGGcR6mijpi9CvASDHHFg+OTCp2CLvCgXGKC2VRYSn/Fk2Lu8PAN4PCpueYmBwv2sW3DzHheLAdZrRGMQ9t4WiWv5r36G+WAu9cQc0G3LjMDBPyTj9L7qdEMYsNjeljvgZeFZipInBf9TWrefMoWmi7ImGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtowT1H+IIvsA5yCNKJZnitSzw3BYbNRQ0xDkTLuVX0=;
 b=exVl9IC+v8xDETsNeQs7IpGOW0Wwn/K+NuFFTytdZkBP6etm0KpJmSA5nRWTQ0grwh+DYN9SNIeQY2cQYPTOv09vhYWCioslxtLOfaiJwSmVPygFghDvhzzswwZmG6If7jDTIRkawQ6xUuWpkpJ85skQPtzcCxyduouZnCZlvAE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH0PR10MB7064.namprd10.prod.outlook.com (2603:10b6:510:280::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 02:33:31 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 02:33:31 +0000
Date: Tue, 20 May 2025 22:33:27 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz,
        jannh@google.com, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH v3 0/7] prctl: introduce PR_SET/GET_THP_POLICY
Message-ID: <p3lc5tuzpblwtikfodj5d5wjbpklqwg6oexn4xw3cdwspqwkmy@l7vhj72rjgsb>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Usama Arif <usamaarif642@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, david@redhat.com, 
	linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com, 
	ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz, 
	jannh@google.com, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519223307.3601786-1-usamaarif642@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::31) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH0PR10MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 42cbb7c6-3f26-4d97-0895-08dd980fe07d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aJHpPQxEfaB1/a2cQvlGnU8j4PePeWOGEKjC9Lw4FIFIQoGDLAVdTUpdsHNt?=
 =?us-ascii?Q?/XcJAZgR6HceqMUuGOCCC63aF84yDdVqqSiLVTjc9dCLkLDBei7iLL11DqXI?=
 =?us-ascii?Q?ju6jTEEpeb898W6mNrCK24c59t57MZNIPuD7DPafbVRmERFYRhYOock0hjg/?=
 =?us-ascii?Q?uvu0LPNYva/xzOGMTFtYvpKyr81BEW12dPCVbpROnAAp3w3/ySN01GMfip2E?=
 =?us-ascii?Q?7qoZC1TGF6IrHBXiEErN5lXDmVc3uVhSVv37aXJT51Qc4saffbNLb94LI7Wq?=
 =?us-ascii?Q?DmdzuuG/HTZLn2FixurAptvpEsrlmmKhIl7i6lKVsJuG6akUclBZWi2zRuw2?=
 =?us-ascii?Q?/BpknBgRww7CQTaN43ilqdfxWUQv1H/0NLZZPmYaH5WwU/j15c+CSGBEuYgB?=
 =?us-ascii?Q?GdJkw191pZY8pOZQYOrSSZcI/RUfkanrh9vkh3bb8hHeVN/piL2lbgTVmt2h?=
 =?us-ascii?Q?LyRZIL7/M1KnPyxGAWyAly95enEs0kTAzMmZE/BUD/QWuUL/URCLBo8OReNG?=
 =?us-ascii?Q?7ZVO46Exvn73IGGDqYjxLYKoxBNUJwM+saioWXVSiEWO4YOf/eKzs1BmhBMG?=
 =?us-ascii?Q?wGjew94vL64Dc1Eag+0LmsSIu4FRBsa3Rtq3s7d1oJqGFwmnWQZXrielbm33?=
 =?us-ascii?Q?sMbPHy+Hgp6KO0icSCDuUKfTA/B/1hlZsthRSAP+DeCYKXu2QEss1zKYt9BC?=
 =?us-ascii?Q?XiLhWg1W9UBqCdDBPQ1lJwj9DS49tP5PhFHp90LvopJ4arsEz2NxP+ikcaon?=
 =?us-ascii?Q?n0AhWquxXR4yQ32v1xUX7uDZ2tbEEGUeC51a1k4votjbATM8mPUR3Tkf/dU5?=
 =?us-ascii?Q?9FNeFzTwtex90RvgCvkEmjIl231qv5FebrrLgqdmQNs02lXpQs+YeQnTPcz4?=
 =?us-ascii?Q?ucb2GrigXu8F9XS1JPlLPeqUlW+2d8cR71DfcBXe1qRSnhk/ozOgpTn0q2IL?=
 =?us-ascii?Q?P1KQtKlPSa879psffgUQpZqCxcHw7ZsqzhCGgMuTVZgOUAjhGOuR/t8Va0Mr?=
 =?us-ascii?Q?2fdHOtjmqVpHHw5CN7V/Q0rgavRjfpslQGUdRQcDBEe6g7aABEK37Bmns7Zp?=
 =?us-ascii?Q?eHNLFftmhX16MKygK2SU8AVZ5H2lrGFa1a+Gp2VvjTbS01YkX/s+A1s4jaMI?=
 =?us-ascii?Q?tZdEwMZ0Y7sxQ/uNYoLP9DcKZidNrMlMd+AOk0mA5zInXgdF00UCIQnOKc9I?=
 =?us-ascii?Q?JrPIj2JmcwuLYmcFe+I+X8MZBLz2FmwyNn+YQCiI6yN9NLUiSsYkRqpGIUpv?=
 =?us-ascii?Q?N+xPOrQpIcnWG5ltin0M91tlJ3iD2650jCpHGo9VtWESp7JWAiPTHIkKsnN9?=
 =?us-ascii?Q?azpBqFIyuQ8ohAQcibywhoSrWcyv8qZC8kxewxVg4UeEyXS+5hIz2trimuiI?=
 =?us-ascii?Q?e+QmxX0aDoYi39HV9Igb9e7jTg9eRJI20ejl63ARw44bQHAU6oJBuG/J3MO0?=
 =?us-ascii?Q?U12hX3kgK14=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nCJmeSGL7FCzPjlGNaP0baXxMhnX7oq3bNEi+1D18Ak2aL//T/zNQnkgrbMO?=
 =?us-ascii?Q?bSpwgUXvgXZWtsIY4/27hadOAUYJBWw8wNyVYG+gI5K9PtDIM5ImJwRB6vlA?=
 =?us-ascii?Q?OBbqN+USASe6usBlm1r5HwhEI9s/CcjYy7zLx075dC2HKuLI9+1rxaCFgRwK?=
 =?us-ascii?Q?ZyItBN10Ue0i6CKHGAHL6r43EsoV+lKBlz11UBjmAOM5WTZ2Mgn8u9blvaew?=
 =?us-ascii?Q?z9Mj588J5U1E3wlDmkL7D850k8UTOac0OznLn/CtZ8cZGffPP1CGZpGKZPWL?=
 =?us-ascii?Q?7cqeDYuDF/VaKfj7SYNudfL25tAp1WmIkXgsp627ZTqPG5+iCSS3s3BFsSu7?=
 =?us-ascii?Q?EC400XZjdXXTgeHd6gzMwanaoWozmotB0OrtGwvHdYSF1cS9TnvUnzVd0E4G?=
 =?us-ascii?Q?KXKCkLKYL26frnOqm3KfE8uBm7fFaaCoKxxroSbHvk6ZhzIona28Eg0NzyOS?=
 =?us-ascii?Q?th7IjcXov/Uw6SRVzozI1SR3ukOv7OGQz+LE+pgEkUX/4DH1G4/jFKTyFEuh?=
 =?us-ascii?Q?myewgotnYQlBjpT7PCM1Kmjcl9YjtB7UJLthSm3fNr/t00+hWTOxn6kKO9zI?=
 =?us-ascii?Q?p2VgqwgMWIoTLHP6JeBVsOV5hwfWbpBx2tlpL3iBU/WY82ZY3fdHd0b0i+Tm?=
 =?us-ascii?Q?oqX38dEzMbEgaa3yq8sV3nl3NM0TBPiHGdGjHnUcLqfed+GiTvaK3FZBt2lZ?=
 =?us-ascii?Q?LfIFZNJbU/hSTjG6bQimCuxfSG9zeqNm9SV9g4awFiBlDD1wpeJbC8MO2IJM?=
 =?us-ascii?Q?Hnhd6va6ubhFJokTdWls+9r0vyR5qpbCDzQpXWrXvkosXUke3KYz8w1YebAY?=
 =?us-ascii?Q?j6XGsuTW2eHG1mRMEL4+OGSmhTRKLTKNgE8DSoPxICV9gE9hmkW3tLYtaD5u?=
 =?us-ascii?Q?5QcBH/nE9RM/BJGG26+hPLL6PBSDmpiktfSCA94AIau8x9E7klHDS4XH1OLz?=
 =?us-ascii?Q?fxmpRTW0CrkbHZ4UjQpT35MRnq1zgZSFHFB1hoB4tTDo8OVrB48TTvEaBBIV?=
 =?us-ascii?Q?cE4QVndlu9FlW3DAs/cmUC38VvYR71UGYw8OGmjQAXkxQOoajeiJSaiYs4Zn?=
 =?us-ascii?Q?/NLlo2XOs7tZ+Eo2wIOYkhBmUHgeYbvn6cP9DsTOr74Xvp0tBK7RSWkQhvUg?=
 =?us-ascii?Q?smsRszeSCwcpocYu2mpr2c/KU3j4V1HU0iPGFrARryrw0DzFCljuwpSZXEF8?=
 =?us-ascii?Q?B0VIngYFD/aGUyKYDWcLiJ6TAXKYoINBPjQlVmFrSN7SWl+0wST6zvi15Np9?=
 =?us-ascii?Q?uTDStmhZ/BE9AZUSAK03QjTqgwC+55gyYgHxLxLGyZZqYGfg5ss46VQIQGOd?=
 =?us-ascii?Q?zuw9r58ikVA558HE47vVr+LWOPwyC+XndeFgUEnmNaZj9OcAHNp4SLvpp39h?=
 =?us-ascii?Q?cyBhpauWpRH972eQPQsrgSpBxLfVI/4XhD/U/R+BrSGtJuerEfJsa3v0YJty?=
 =?us-ascii?Q?riZ3bZb2m8aGlNtIXSuRBi7+t+tRzG6Ue5CJD7ttZzjRcpUDaYZTuVJAxrpx?=
 =?us-ascii?Q?ZFMfuzA/evDAQvMs/Zbs6Q5OXetNQULsbCxFLJHGbCn8i6ZJW8j5deL5+UjC?=
 =?us-ascii?Q?NyMOZXV2SAgoqmUaGLlt67iK8rJJS/SFIGnOGVIj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fc3b+kTbW2GQtMudLy/ZTv+i8/me7vBQ+felA8Uffmpof39LU8DZY0WqN3EGGu0On2nv5WrOdhWJga9l/6H48u1sDkrLowuzfMfYwo2YYWpz0olO4T1WDo6tXaJTFKKlUVEs+bCsyrej/DAvDVfFrplZBZHj/xIDRFPe0EQQdXgEp8qfMaSuDqpPJJzJmv6xb/XSX7sF4X/GyfCqJSjq0pfgMbma0ARJnyRXjqgh6WkJRPLxq6UlheOKsqgZCEAlpIvRDW7tod8GMLeukqwvwATYfOEIIHPuoDQYRnrEDeISzCpGC8/+W+REl9Ky9anWSl4dagCEFrW4eqntWk99HMU7A2NQuiJVaUNzO8FRSG86yTrdiMF2d71rU/p1ufq2pFaB/wE8MYCJoiZNki1/R6fwuiVaUpELliqNKnPNX5iCajoF7u+Rqnh7/tQoLfbUlZkDDZkZci/32huLUVs8In39+sYzRy26Eyq9vHtecQ86cylbERUO+1iN2+2eBq28TCFJHPRmLODTaAyod6Vm7uXykqL/CPy/5wcPWEfz/EsSMhKG6GCp05kPkr/FDbes1xxJ3eMRFx4QU2NgjTKauP3EoojI/RL1/OaKloor/C4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cbb7c6-3f26-4d97-0895-08dd980fe07d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 02:33:31.5888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJU+5vK5/1OAXqwLCsE6GbopWdwjZ+w4vwYXRhbeXpoXlbg8yPikpsQsoVN7fgvUkzlopFFGnDNcZoF7NdPrOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7064
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505210024
X-Authority-Analysis: v=2.4 cv=A/tsP7WG c=1 sm=1 tr=0 ts=682d3cc4 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=L2Yv9HJ8LMasfULxJ7oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: S5tggjKnvPfQvgbFebWod7Mh5GKnplFX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDAyNCBTYWx0ZWRfX/QJQlvMY2lfg HNO3OyIt5d6ropv46hErEwCkuIc48VuAxvnNCiim3ugAprnOL3XCIhyRLBU/75wvDUdtiT++7W6 KZczBvnFGrXLcKGnuMMeyCJsCDFXwFmkRKQNOu8Y1//u9ch/HhJ20mdbqoYm4hml7AxKMHU8tjf
 uLsoqOaxZEkFzPl8IscBTWC4NrDrzBH50dRkCLz/ZSZXN5LY4IZ/qILYT8nGS0L553BoEGbTEgw yMuANTnlqBtFpO6cgJW+ERkF3KvJyDiTuAjvDeXa+nBj/d3aNigWQ/X9Skk1Xcpp7heGZTQ/14I 0hSlElIKpcjK+omgEQ+AH0o7K21uO8az+E/nnEP3n4/0RGqXYXqVOQ7jyQzkMpCNUewdsVDE997
 spmZYP1fF9K4mvI+2hoBM692ThKsvBwK5fw3E9kZLZa6x4S3mNHNX725LQi2fITkHHJoEfpJ
X-Proofpoint-ORIG-GUID: S5tggjKnvPfQvgbFebWod7Mh5GKnplFX

* Usama Arif <usamaarif642@gmail.com> [250519 18:34]:
> This series allows to change the THP policy of a process, according to the
> value set in arg2, all of which will be inherited during fork+exec:
> - PR_DEFAULT_MADV_HUGEPAGE: This will set VM_HUGEPAGE and clear VM_NOHUGEPAGE
>   for the default VMA flags. It will also iterate through every VMA in the
>   process and call hugepage_madvise on it, with MADV_HUGEPAGE policy.
>   This effectively allows setting MADV_HUGEPAGE on the entire process.
>   In an environment where different types of workloads are run on the
>   same machine, this will allow workloads that benefit from always having
>   hugepages to do so, without regressing those that don't.
> - PR_DEFAULT_MADV_NOHUGEPAGE: This will set VM_NOHUGEPAGE and clear VM_HUGEPAGE
>   for the default VMA flags. It will also iterate through every VMA in the
>   process and call hugepage_madvise on it, with MADV_NOHUGEPAGE policy.
>   This effectively allows setting MADV_NOHUGEPAGE on the entire process.
>   In an environment where different types of workloads are run on the
>   same machine,this will allow workloads that benefit from having
>   hugepages on an madvise basis only to do so, without regressing those
>   that benefit from having hugepages always.
> - PR_THP_POLICY_SYSTEM: This will reset (clear) both VM_HUGEPAGE and
>   VM_NOHUGEPAGE process for the default flags.
> 

Subject seems outdated now?  PR_DEFAULT_ vs PR_SET/GET_THP ?

On that note, doesn't it make sense to change the default mm flag under
PR_SET_MM?  PR_SET_MM_FLAG maybe?

Thanks,
Liam
