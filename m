Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3922D4FF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131662; cv=fail; b=bI1C1sn5N0x6dR1i6+LuGTEGNiXkZ/1VfGM+FTQg82u2MNkzLRa3HFFJkBYqOEtTl16LEA2HzW+6pCM28WzM07KfrZ70sccrVM6Rlg/Lr9gTOGaSI6b9IMMGh+Uqq+Ism0usgJHwor4uEU7rc6V6cva9/T71GIKGGwJXFKBZSqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131662; c=relaxed/simple;
	bh=14YqscRzPnXkVMxiJlEA0bMbngGKzmKrm4UOMqTzX0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JsVGvjYzUPP1CHWJt948LWRYhOZJQ/fsXg/6nYZjzF7Emko4u0hClr5TlNPz9A7w5lAB4RU5LJIF+udtjIM46S59Q3FL2yPBOWvvLLPWE28zyp7Cn+ZoOZUh9GOViRqdL2EFkn61GGP+isIEhAZtMaz9dlD461nO1lQlimVweHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U3sP3OlM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NTp9xnix; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U3sP3OlM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NTp9xnix"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538GBsHx009824;
	Tue, 8 Apr 2025 17:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=WuxU/C2yDFpx+wTf7F
	AIYvNbFOxVgoMG7k/h5AyZ5WE=; b=U3sP3OlMsHCXVYyv8Vt/x6cKKohXfZTqqY
	39w7R+1tQ4wdv8j2sJO2MD+JVFFK49pI/t6JHOZF4jSSc83Lf/3PfVl8EJ866G6L
	oEVXoceqYVTyISRVGH9JZ2jcevyNl+HFLyVcXRH7q9zTAsUOyHl0MylnrbuGICcD
	LkNe/9BJz/KBsaa9EiKo3SO2Rhv8TXCQpG4PABGzlBz7HtJWnSnZMWzKT3t5bgrj
	ddjqbxQISEcC4+EbZkN/vkq0XlrabY29ZN60MujA9Gjla2xPd4j9Z7JsfalJD+PJ
	Yma6dcx9kKP7xWF6xqB1f8cZw0m+SVq0G6EFAqUQGP5/vjrWrdVQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tvd9w7jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 17:00:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 538G3jQX013750;
	Tue, 8 Apr 2025 17:00:46 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011028.outbound.protection.outlook.com [40.93.6.28])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyfvt4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 17:00:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGA1ABDLT/zoiClrikgRbe8U9eYuSP8lhTFxFMjdfcW4LJcg7drUACWA6+4UtviQ9LHz3/yRS/FA9yiAGsNQcJTE9v6zHNPR6o6Hk107OgWqtrwtnEjWTcoRK/lxWvXcskJenK/qWUGCJ2uKV+SnYdFOSkpUMsQhHC7AopzIMbKB0hAWNwzVbypBxH2wghxnlxqFD+F/aJJ4ef/Qhau5vRsbgfkQli0DiUQsgCiEK6XEOJR63j4AKG/RrsoD9TdwjVA0W6Gu1b6Afp4wNn+ERoWQ1IH+uOrYkO1xG6pPeIqHNDhZwO4p2jnxJI9elffXSL/KuC2NsL6o4qwvH2cknQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuxU/C2yDFpx+wTf7FAIYvNbFOxVgoMG7k/h5AyZ5WE=;
 b=etrriQwdCmY5LyeIu8MPxk8URgxBZfIimQeUlosFQ0JXcgtGhohm/5dsoZQuXGqWxlHtI+FJ7NW1GuxrzsGSesG8pARhvYLz+AE2Ewjg7fR7FZKi2YBpsT2tEu8hniL+fh+KC5x8ZDZrqQ9vxZoF0bqr/iDtM39FUkD19uMFqUan9aEbZACRWi78P0mr0ItKnbQN16bE3q0P/GjvyqKOeFrpcsNCV1D+u2GMQL2cPp7KUOjac+fzPkLZ35PDHZW0/figtIUHaMX+diDlrvD2Y9hqZ2pIiQBG1fwzQUfRA/b5/g3V7whYURzmgqwS4UEOMvWMfV0Xwbgw98stTxMH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuxU/C2yDFpx+wTf7FAIYvNbFOxVgoMG7k/h5AyZ5WE=;
 b=NTp9xnix+cS9fB0DJ3UdbfJbALaNDqWGl1BaBQxedx90yW96dHzL06W9QSq6jPpKmSp4UzKZEFNcvhbhKZRlZHzNG1NuDcoezn/byAJfTKfn+1tL/mB3SpjMqkqYxDyxeuaLZBb3QZuCWhqsV0pXNUy7h6DAJSBx3HsuA7y3G+w=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS4PPF9390CCBA1.namprd10.prod.outlook.com (2603:10b6:f:fc00::d33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 8 Apr
 2025 17:00:44 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 17:00:43 +0000
Date: Tue, 8 Apr 2025 13:00:41 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add memory advice section
Message-ID: <acwykb6o3cqda46aq6li6jzjq2rovjlsuf25didyln7mfcguws@z3c2p5n6aand>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0453.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::14) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS4PPF9390CCBA1:EE_
X-MS-Office365-Filtering-Correlation-Id: 31856c27-87a7-4915-9aaf-08dd76bee663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/1o3SEAboevcGliz90EGYY8K3ipRp8lyYEFPM/kNls6lTep4FQ3PXJ3fEBpc?=
 =?us-ascii?Q?797x+sMgBsD0VZdhAY+LA4wpGGHUWujjKEzVmcXY+oOGTWb0CcYE6HebVq23?=
 =?us-ascii?Q?muWxqYBPTDceMpRGMadjtmoE+lXX5ohpjgn4TLBEJ3YJxcuQYFuWr22+ngKC?=
 =?us-ascii?Q?/bVM7XSmUJ6HnVQE1i8lc+8X/uO3GjwTD/qTPs/mhiaSRh+BygIlvN1wEpty?=
 =?us-ascii?Q?o6sYMnCca++IDDsetWWqyI4Wwym2nUeKjB20d1NgS/giTTm9VyxL9qvQ90dw?=
 =?us-ascii?Q?RicRjssmHvNA8nVL+F9SBsYeFyeKSYLyOHyfNMY3qSInLdvVVQDj/+ASCDXa?=
 =?us-ascii?Q?obpB35najnbcVP76V0o1nanLga96rs84U+eCn+KtG+N0p3lNoldpdMjSBvrc?=
 =?us-ascii?Q?Gem8HRDKX48FxqBQY/oNqN50rqt16Q2dWChRjzq8kNFcMxkueDpeQ75SLZR/?=
 =?us-ascii?Q?hgd9by3dQWK462Qv96dr2Mvs5H4tEJG3kzgF/K6ZjcHRi6OM31h1ejhqSJ9n?=
 =?us-ascii?Q?KQCgezPtvMjoZDn/pVsKXA1IU0oU1FZt8n1a/anm4ZI7dE6ryhiCgd8lH7FV?=
 =?us-ascii?Q?1PaBqh4GJQcrUIsWkUO/p65lKpoplDQt8szt/upAMJAYpWIvgpNfwhJqOyGn?=
 =?us-ascii?Q?jqqun9QltQJP4KBhR82kSQDjmbkk3R96xrb2uCv3cfEWMNPpGKCzJsWKzX28?=
 =?us-ascii?Q?NZOynrcje0Aj9ITm+N9yAUSvXmMv+kjhSi372tEEecCv6fe8Mp52qkuoPcZb?=
 =?us-ascii?Q?E6ujeWr4MPyWvZLrVbyFxjPT+Bi8STfnPVx4Hu+BeqVcbN7fi/ttNlU1czfi?=
 =?us-ascii?Q?qPw6VGXJgv3eaDhEBnZDARafwGH7jTE8XVaYVNvDNMKwRDPHlUJ8irrQJXEa?=
 =?us-ascii?Q?AAbTtdrs6l5o60mNwxLh01wXBzVo9qZmoM4ZG6KFUIrA0HHG4vn/ekYXGjEM?=
 =?us-ascii?Q?APv7JvcHvnIRo+1Sh7FY233KBwHogaFoEJ5DBquRR3zjrpxFd8d9YImMhpnH?=
 =?us-ascii?Q?s8y1jLpRulaTP4BnXfmm1eZ4QsUF9WA5MkB0mOU+tubjhQ3wIhAF5BzT96QE?=
 =?us-ascii?Q?OlcT2Ei19wIPWj/XOAmD9ihdTMzYmiYZJzR7IHVzhDpNdzNzV5QqeDVrtkhO?=
 =?us-ascii?Q?Ttk4wCI7Uclpu9N8I/H/FkOCKocX6uxP+KGrprULaBLYqu11T9pT7/l7qI2x?=
 =?us-ascii?Q?p40CWhI7pI4f7HotRrS9j2kRU1vdt1F0UBIdxVaEW8+NGiJcOF46ZboAjZ5k?=
 =?us-ascii?Q?UeeqewuAiFeKH3+7rb9GyxI7LGwQup2vdfF7cesdnRAxPeFDpuDswufFFFmU?=
 =?us-ascii?Q?IXdwPmovfRLUflC8iK1wxXHB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QJ5I+wI6LGjdkncoommOxMXI5vNU11IGBI9c4tLc8MRswrSvHDjnyGcITKEe?=
 =?us-ascii?Q?BVhlDnzSR0LaVUlnZbKFHTyju0zriu50eRjhSPz8OpsUHVUcWLLSrENsVtcu?=
 =?us-ascii?Q?JkR9+WbegyXA1eJ0ULY8waPU7kKZWBodovsyDGHHliwzNoT0UOEQXF4Y/6BI?=
 =?us-ascii?Q?wrO4mpUhSvYT4tpvv25ppG+tUObghrmaq9in35Mie50Hq1ivk/xFXCGplzF8?=
 =?us-ascii?Q?HNspmxEpoJ3Xhk6lPCPOHezmG3imk/muUwdzbCFBnnpgzaeNDDW/ukdFIGeI?=
 =?us-ascii?Q?mCMfsiipIU0X2XcktqrCxzvmYkoHxSdcoPhe2FayovcOi+HmkGYcXhOWij6H?=
 =?us-ascii?Q?+8xVVYtbdaLpbjfe8paRuvDl5u/Ef1acYimPPeR7zKltJghu3JJGDf6ZGXRK?=
 =?us-ascii?Q?hoTkTfcJqISNRbBEgUyIp0o87iTvcGpmqKhgH/jo6Ept4X60Aj7Tv6u8ei00?=
 =?us-ascii?Q?lo5A+wGivfw+qFvtsQDrDF9Mettf87qxaQHjnK4em00twqvOyUJ6U2iIBtFS?=
 =?us-ascii?Q?cAleAufuxH/CX5v2PDR+BOznGZqRholAZBocOniN4FQqbV2bnwJZFjwbDzJp?=
 =?us-ascii?Q?b63MqGJAJqCVIfgZZfbPXbnZiXo2L1eqY4SPw9a18nKK0GZIZbn8uv1DVKO3?=
 =?us-ascii?Q?1YcRjWIN/kmiP9/quI06iUkB2kFpJRFo4bhKByTxqIR5wVbmB8PdlmKhGz8h?=
 =?us-ascii?Q?0c3way84p/XY6QpqvH43OesZ3P2bHVs4OnDx8MKK259PdTai/yRj9XSfI2nt?=
 =?us-ascii?Q?BJir4DSMnzzoGoVcuYG2QLzxHW5Zz1Ud1/naPE6/gPPbVK6O14+Pp7q8B5Xw?=
 =?us-ascii?Q?D9NFQv844QhhvPki/XmkzE6Tu0C3OYpvz85JL9ZR3XN54Not82Fezh8lB4me?=
 =?us-ascii?Q?9YKIG2gBfJ8ruj1HC/fFw8lfxxICzngsNlbWBmLSb+JMHWO/4hpKj08ObWC/?=
 =?us-ascii?Q?6/eUMoPo5bIY+hu5Qr5belysZUoOdMEvw2bRF/NLMf7LrM9WA19TeRn7/Ysy?=
 =?us-ascii?Q?CvIvnSpMxwKwbvQIsmVXFmiWrQneHuG3mhlkb+ENn82R95sy9IS48iUpLT+N?=
 =?us-ascii?Q?FnxAjZxovgganQVfukDjklvUzrztmA7ggKT1Mh7I57Ke3c9ReIOWCISzJOrh?=
 =?us-ascii?Q?/1sJK1zHVV74UkCW3YPEtuAA5GIgKSIVE3yjsb4dEaAf3M/eckXf2jJaKLtq?=
 =?us-ascii?Q?//H1C/FqtXXVK3T/Dy39MRVhPxcLRsuayD+9LBd1P7EzALvLrJCnMRdvS8Lc?=
 =?us-ascii?Q?AOrA5+itk9VFsdNslxUv49lvf3DZdnfHQ47Oy2wwXEkFXmdeqPTTxqWa/TA+?=
 =?us-ascii?Q?XOnHQPr0UWpfTZfmH4JdzjjMcy3t6FDYCq3PJZ6RL8NPHGwQyARyJIYugO3N?=
 =?us-ascii?Q?2VBdQyjMFmTvT2Fd9Mr2+0/+31Eh8HlUenQpDf7SOUKOyeX4GbmhkXbSbrf3?=
 =?us-ascii?Q?cB/mX4/a/D2T9tCeAzkifkpMI/z8gwCSpp5lOGKtPZYh9Gk8FD88kbwL2ATc?=
 =?us-ascii?Q?j6SmYf8Cdplsq7zv7XBoeoAYd6mufU7rBFx6FweWtOvI5OWyrBpxi6nc1868?=
 =?us-ascii?Q?Hns4IY551fuJyyO+wT43q7NTyRaVtS3SXLSD5NKF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HMYhstfPRVF/mpvOaOzBtJT7KhqNli3zDdh8ghBq9EhIKP/Pxl7EsZzKAZ7HbQmB+UzlSJgntZJPOsCeQP/I1EnGVT3Q5JjoX8t9W3W8GQjRS6PXxPnjfTafWligTTg5pnHmhQXxiwqpd6YEn+9N02JAGCNPrR04dAT6EgWXSjp5+ZGWlrqdIAClU8ZlbFQdl+VnYnQnYolaSwRcdcSHfcZzUC9BFl9kQ2gpKEMwn/PsIpK5XSv5YZ6fBSqQHUOPxK/lkW0sHbQ0YIQz+VjquICOyIutKe+SLp0NEfh8x1caDMcf5rhVqyLqF16ikNQxMQiS+YLr82wQuQKeH9DobPSEJfFd01BmrWW/8lIzy/UHYG655Dg9XO5T0ZcYuR/fE6/b6mMssJ9Y4fYuw7zJw4CEU4hXbmTWlWgusXxWlpPg+gQ8s+a0pOOl4ZRKuxrFs2mOVCM4E0WXQ7YRywHSEV/OaovHb/j/tj3D9oYH8EwQ85vK6xB/hn37mXqaKPFSjND6bOrHm9mkj4rG033NjbDGe/azAE34JahRf49f5hZJHLpgpdBvSic5smYof+O8smE0stdLIYN2wHISbhEPgsjmdwfIX5VshSCkBROfrDY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31856c27-87a7-4915-9aaf-08dd76bee663
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 17:00:43.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jd/VHGhbRpdLKIV8baT3R5ppoGikuGabi7etECdDnKmShUzTz/Fk3y06PrUMAJffXfiiR37/qwUCUdSrN0Etg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9390CCBA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_07,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504080117
X-Proofpoint-ORIG-GUID: _DFAFZIcOm0T4AdO_D8BiK49eRtOHC-c
X-Proofpoint-GUID: _DFAFZIcOm0T4AdO_D8BiK49eRtOHC-c

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250408 12:11]:
> The madvise code straddles both VMA and page table manipulation. As a
> result, separate it out into its own section and add maintainers/reviewers
> as appropriate.
> 
> We additionally include the mman-common.h file as this contains the shared
> madvise flags and it is important we maintain this alongside madvise.c.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  MAINTAINERS | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index de97cd54ff24..325424a53acf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15552,6 +15552,19 @@ F:	mm/vma.h
>  F:	mm/vma_internal.h
>  F:	tools/testing/vma/
>  
> +MEMORY MAPPING - MEMORY ADVICE

Advice or advise?

> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +R:	Jann Horn <jannh@google.com>
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/uapi/asm-generic/mman-common.h
> +F:	mm/madvise.c
> +
>  MEMORY TECHNOLOGY DEVICES (MTD)
>  M:	Miquel Raynal <miquel.raynal@bootlin.com>
>  M:	Richard Weinberger <richard@nod.at>
> -- 
> 2.49.0
> 
