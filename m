Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659DB1361;
	Thu, 15 May 2025 18:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332690; cv=fail; b=jq/Tfu6lhrSBR6WYp2chnbinNBJPpAUqhaqEZGJv0Gl8vL0P9tpuaNrS9F0LN4OxRb061I+DfqPzZdxqE8MPUsAI/zu5jTUDjSPv3knbWg9+27Hh6D8qK0miFlP7SP/YFnw38S228nC4cg6TWUuRl4YCBbiU1PrH5czA4AAU0sU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332690; c=relaxed/simple;
	bh=8NwFYLUBl2Dk6e9QutaQ0r35iyxc7MHAIkfUnaoMyxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Lu13pUuYZl9ZU/F7BF0aPYtTgGlw1Gsg1cQu5oGM5q7RuZnWKi2y/MFzFARJaFQbtJJbGK+KYjBMvgjEOAjs/3Ag1xhjAifl20idCGb4dyAyUHnyBLEaX9aozcMdw0vU5Kn1ZDCZefpGLhicHogqRvjbaJO9jZT47V1CKLLyImY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MzY+OKWp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=En3DcqUy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MzY+OKWp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="En3DcqUy"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1rfr000536;
	Thu, 15 May 2025 18:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=wwJZ+CyQmtM9m8y5TI
	G5rvQrJMUbxjG5SRNvMjUxEQ0=; b=MzY+OKWpQJY0ONtewuRC7d+Y0Q9tgX96gL
	pxsC5PSc7IAMPu+B940zE8PAvwameiXElXbG899R1s90h37B7kxXclN3EWeJNxvf
	Lv9QwyKW0jAbOlfboJhrBjQtHKmuwubZjuRzWp0BC91tOvOB/KwejNPEKRCmDv9w
	W+Wa9wrOjaY8RtYCy4yNLqsaZ8Aahpwoc4YLIMbbUzQL/xBoKftwIRSAuFEamj4O
	p/dk64BQKIKr1j/JNJhKigM7dfQX9zYCqgMFzEK2eFpx5LkrKl4SqXibiTxh4h++
	KJ23DdqCbCXeqTCcqUZJOMfV8gcNMESvaYKY7TneDRCzRii/Uz4g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbchvrvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 18:10:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGX624033214;
	Thu, 15 May 2025 18:10:03 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012010.outbound.protection.outlook.com [40.93.14.10])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbsax9un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 18:10:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8qwhgSUe+FpA35DIzzAsdL2HGWvEzYpYXUEAIvP7Kpc+Y9MhDht1+KoswWyPKoRq+wKAvoXtg+P8hGVKEoApSO1aQ4w1IPnFQgqDyK4i9EQOyOb8YzZYarDALSwVDM1fWgxKVx6tlxi/2mx0H5H44M2RHKfRhhlaNDPI/uh/L9Zl1Za82xYvGcDbFIjcAXTirskLi5TsAyhdeNQXiYTxfwoMQnUsj0IzlymKf/QHiEexlyf8wbkfAEwUXfYy0GPAV3aRwd165C0tuyaqEJP/3CeqKYxXQLduwt1TxS05DpVa+z8myI3w9FyA0Ogq/o6oJuJjEsQUCYSvuvUhdfCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwJZ+CyQmtM9m8y5TIG5rvQrJMUbxjG5SRNvMjUxEQ0=;
 b=lWHy6WLpasfH+Uj4d0rio7aAZx9UBq0FmImcGKM+0JYKNCMly2JS9A7SY/wSM5chR2n3J6TxSSRah5muaqwydFCNul6wGyeTm+foqQ6EwHZHehInM7/xUyYfOX+SX4egm6MFh5wT/p4JC5qzcwIR4RqTyzpghlVHK/Cr2TIQ374q0pfOJ7wVr1X1yK1U0Mg7OQ5zs7RlfAZdkzJC2FdkPuT/yVZvaVYJVmhH23q+3tXTlPgkQOcFFCMYdO8yNH7ugOfBLl6KqDMTcs1WK+RMbkFzdRrcnW6nTs1OsbKQ7zXVVfesCfF3c7qo+Biw7iPPDXCMo0MLylxQNh1kYQicNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwJZ+CyQmtM9m8y5TIG5rvQrJMUbxjG5SRNvMjUxEQ0=;
 b=En3DcqUytXYfcK6S+0kJM08CSQn+a5tOFH/gW0ZTRhl3qv8hkh6BKneiFtVhgl7XLubJTUvpBbZD5jIARIB6Lu2OEXoXatKVvdCqALY6iOi07BEkcuAraqQl5q9+/jZEQvpq+SkE8YFc9jb9dtVtsilA1OrXDNcH/0TFF+e0HTE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MW6PR10MB7658.namprd10.prod.outlook.com (2603:10b6:303:244::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 18:10:00 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 18:10:00 +0000
Date: Thu, 15 May 2025 14:09:56 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <yec4eqg73qejlnmtckwjiexelswcxf3l5ctoaphq6ugyp3tu3e@vmex647zbp52>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Usama Arif <usamaarif642@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com, ziy@nvidia.com, 
	laoar.shao@gmail.com, baolin.wang@linux.alibaba.com, npache@redhat.com, 
	ryan.roberts@arm.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
 <kuxzxh4r6fapb5tjbhvm7fsw7p2g6vlasdv46j2ggedmbbsec2@zgt445q4oob2>
 <360bac52-2cda-41fd-a674-89b113fef918@redhat.com>
 <7a255984-7c9b-46f1-b73b-f85b5b571a92@lucifer.local>
 <c3c264fa-b74c-42ba-a3ad-615715c8fa80@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3c264fa-b74c-42ba-a3ad-615715c8fa80@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0171.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::17) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MW6PR10MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 593df09e-197d-4c4a-c03d-08dd93dbb4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3MjB9Svy0r/cwsYz71qdxxrENIfXOs6QpEMSEZWjuAw2yJlMri1X+dmVyzkw?=
 =?us-ascii?Q?8uOU7vP5dwaF6n6yir4ZV8vvP+zuRc7VHGSMPaOq2Kj0pcupx6Kly/Zuu9q8?=
 =?us-ascii?Q?wBoavSNml7xcDTJTTDCWg4UkKq52ulyiOUiGCR7wlh7t+zDvv9GNZzfygN9/?=
 =?us-ascii?Q?FbfSrI7QHlp504q7P2osAkhjmQhgXa8d9JgmxQkSLBxR5wbvOZSuaMvDyHXJ?=
 =?us-ascii?Q?B/Rx9DCKGUCKi2a2e44UbNGbdaxPiBixbrf0oI+4z4/jpIvmOKBJF+dgtKvZ?=
 =?us-ascii?Q?6KgiRQrNiIOAtuRsoVvIbSRSb8nQ8MaxJvxlfHBeZf0UtWh28kNOBZoATzGm?=
 =?us-ascii?Q?pJV5xjtgzQdJ8cTM1y6M+Dg8uI9NqtNK/tk+h861DFvca+ATZofoxaxGO6hS?=
 =?us-ascii?Q?bLmJZ9G3UklF4ggsNyWu8v30v3cDp3jeS8z8mndDbi2TfoVnkuEKW1xAUpQ8?=
 =?us-ascii?Q?NJ9TrBAyuj+zXb6/U0JbeqLDrl7LEIwEPH/+FDpIDYzfQlJGRZ99daU1vpdC?=
 =?us-ascii?Q?yznoMNoq4d2695owxKZfXwP9Qqx3zygujQfzv97LV8Py1wM7m0GYvDwrvOJC?=
 =?us-ascii?Q?1LqNorWaL6FxKepSF4lMcfBqIMx6tLMjRR9p5RqcqSuX7bbCiDyaoQqt0LxG?=
 =?us-ascii?Q?Kj/nVfTulWU8IuALYIxG1vqIyw99kT0bw0MVG0TZ0ZIZt4Ajzk7YQk0e5qT5?=
 =?us-ascii?Q?GNimxJ+lWPPo0P+4QMr82NMN4crtZhKRKotbU2dBzDL3aHmub+bx3whkL1ks?=
 =?us-ascii?Q?cxwZWho/Zw+yW/wTnvS+Q2NYqcdSJrSqMXGR6QjZ/eh60PexMK7KwNnLFzFO?=
 =?us-ascii?Q?E6c5YfHaMi07N57v266zX8IlWQJ/Xh6t5saxWHCoIRrvGU10tevn/QcEYTzF?=
 =?us-ascii?Q?2j4Y5Fgr7dfEK5HrTNYfVVKJFLRn0ka3h94VSYnJ3l6bphRJY+dunYsw8iGw?=
 =?us-ascii?Q?qW2QOh6eVHNyPAuGXojm0onUclwWMrpkg2fhkAQzacJTL4RnoVPiCO4v+aVX?=
 =?us-ascii?Q?hL4/5rqdo7IwvdfspGGOddfhovnzeEhEeNnbf2lC2fnlYswlZw9PYbCmD5Dl?=
 =?us-ascii?Q?+NeqP0nDkpsIlsc5Mm+AxTgdciRfMAwYtyF5Bs02t4+uZL3LFJRix4vfdnHa?=
 =?us-ascii?Q?IdM1NMgcIM0zhN4wT6Yb3ZtY31KlQrcefTg/cTPKncZ0urxpnSnLZKpgCn03?=
 =?us-ascii?Q?uudkSiqmUlqOtokegn7C4LFsrNTT0fJYKL3u9JZ38SAUnanKaORTy99S2f/9?=
 =?us-ascii?Q?ehx5fKQci+VLFUajMJ02lqNW2m9yqy9R5Sm8VoSoC879t53XPYrBLKfYSVVd?=
 =?us-ascii?Q?vbt430VyOAHwlUYSiDZA6wwh0A3/LSwQEmHEdYbZ6mbiUJoTbgSSUnalAvau?=
 =?us-ascii?Q?m3oHK1967j0OIvIn2ERlK+Rm+19QPfz7zl5l0+b/45mbtAwFfI5viW5RlLnd?=
 =?us-ascii?Q?FKBQq4cojoc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6vlbtnShW8HPP/l59UelVMN7VD9JoVN87DQm3cvUjm+BN7rxoWqoryB2+9D1?=
 =?us-ascii?Q?FfwNu/ZmiBxhE9cwP6u2SIkkkVCEQ6RcZgs7EJ9sdED4TgmWHZ55Ilh37RXp?=
 =?us-ascii?Q?iWLMrCn1WBibS2MKgjDL4v8LtJ/EmwUxLlgCQeA+CMTcLm9eKW4Eghc9x9Yr?=
 =?us-ascii?Q?h1DE6SCuPE2jHZBZhUEuXZVVlVd3Y73CqZBMjUUV4RlusNfEVHUWLVprdz04?=
 =?us-ascii?Q?wmVM5IZ+VfXTksFEFy0sb+MQ2wYo/6qAR2AtXtbiuN8mH9W+erwzM9TmAnQu?=
 =?us-ascii?Q?tBKMmJpl4uj5pvG6rpM530mnUsE5dos38SwICKENJkzrE4ujLo+LxOpnAxXW?=
 =?us-ascii?Q?ADkpX+1KKLYYIpa6vH9CdmOWWPPT4/mjxFd+KoTXtP5KWhNbhG/gSUtsxjoZ?=
 =?us-ascii?Q?zssB7oquTZ9h4o8nDrvDtA1UgpR4FtBbHwSjql3D4EPXyeQRRa+vEw4SFTar?=
 =?us-ascii?Q?EZ83OE0u1f0M7r4iNQrqPq4omOrxhIBZMUEgyvB1AV6WrkXLY7DxuQzN0QQa?=
 =?us-ascii?Q?38gPX52+bGO2PkRnGOknUajzzWDo65BwnJKC8H1JsgOmKQMy7MRDeyf4OjLi?=
 =?us-ascii?Q?GPCojcvlPAAZSml85OdEoRlSRdVOFM8txnVXy9j6+IX+uM7XdhU8zU3yETdh?=
 =?us-ascii?Q?+FNiPM32O+FxUut0T0+jftATYhLXYTIyqvskDdjIXoE76P26V5Mder3HQ6cb?=
 =?us-ascii?Q?2uhHQ4kHPzEwupbP7y+o2ozBsK7RR4+XbeqQIxqlETrneSDedlEDAJ7akGv8?=
 =?us-ascii?Q?cqVpPVQR6eW+jYvgTFLIYy0JFe0JLUT7ZkVjtIW0geQmgik7HMlW5oQojs4y?=
 =?us-ascii?Q?WXhpbolcnBpuFgbrPy2hdGuzTtHlvli2F+wW1lthrzmud8zjlFVpXZ1lENjA?=
 =?us-ascii?Q?ijdHUghSmP0AtC+Igz2kmhCCZpHPd9vuqwt7xj5iCVp/GVG6Vpn+1T5ciKLE?=
 =?us-ascii?Q?09uGScmUxsWsiaeHr+QQDQ1WGM/wyGIDt6DiyIUhk5P5paSwo98QcTCUdOKd?=
 =?us-ascii?Q?/c+x+xAS0a5bFDSRyyDUMYIxokmJthHVdlRdbUZYiiOpIxWW6I9o0ION9cjD?=
 =?us-ascii?Q?8AzH2UI0JKNOVv3fppiR4KlvsD+eGT0ego0KHJEqq8YMpnigc8Lr4ex/vgUe?=
 =?us-ascii?Q?X7C3p9qyQ2OxwI2sHgNpGASM457bCJdagSqCLtKDVrkCPMi8V/UaMjZRQcm9?=
 =?us-ascii?Q?2P50nveVXPF+hIdGK9gCPYhs+KzIsuP/QGICwUeXDoOpgZxiwLsJtS1QOJ05?=
 =?us-ascii?Q?iLQI5JYMYSslgmJs6oLdyocHrV9w4JnEOjVCqLdG5c+BHgFe0qLcdMmUkl/C?=
 =?us-ascii?Q?3Q/e4OQJaysdJbbqb80y2B/mjjjY5qjsChuJqRv4Ur9F8PkvHX4reUcc/wow?=
 =?us-ascii?Q?k7VVruxd4XdB/OYLV/88oYGb+v5qHQP1qO7ppt1HxBi7IJXQecALdGjS2rro?=
 =?us-ascii?Q?3VV/4qbfWhR7MNUIWspxdADESf8U4zvxImZEtUiKwqNJKSXFebY/Pa9ZwZmh?=
 =?us-ascii?Q?xS24R/FTNQVl408wdXNWwZyI7MJgZtxfmAi9RUGDR3gE0GAigz7sPNd/xKl9?=
 =?us-ascii?Q?SYYlG5VgLjJaYp0LpjNuKp13Oi65KsV8d7FWT/01?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mq9R1Yz2fOG/emQQzFXAfUbyCUXjJZba8DJ3XQsZNMtkoo0fuyYVRW+2pz4EfQ5cqDh3rRVtE4ZXlmXGMpZqdSGh2yI2zh8sZ+KIOVqfiQDE/ja7lhY3dz2nQsaI2YN3GtJzzF71z2/6hkyCFg5nelVlOzpLw3QlXGcxtOpHNyLGUTOf+i9C/eQKYA7FiAgDITXPCyfuTEm5dvltbeH/meqypst+Cd3o/eEw1WVxLjUu8qRcKIdjjo1/8cQwWuR5Dm5nLc2ihtQRJftEz0NJrMN6szY8g9HhITgi6mqJ8ZN+rQgp8yK2+GPnscRMmstqZVdQiXAdj+s9vg2OKYhLf87O8TpyKvEJ4X0Wab7iNnz+wKPg+uQa8+a8WOQhK8eGLc3kt8E5llRUooyits1Lc7cLVCJur8ppUXWeKfnGrKtXNdjN4nIYRaa7tBzCbm6DheNkaShouSrPJRli0pBoz5fa3uJA8WDrjx6B8Cw2ZoYTQGVJe9UWv5RhKus7fvSIkM8ACnDMXLB7vqdlu2JNC7TQGY0Ea2IXfDJQWnNYmS8ZjAhiL0RutbKJFHLPr3ImTn3mie0/c18rp2QrvWc4EHCk/v3MUXZ4/Ph0w7Qeu2c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593df09e-197d-4c4a-c03d-08dd93dbb4ee
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 18:10:00.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bh85whTCF+B3VobEZ4j7k5isRECmO6D1OLWSJan7Fi5hnH06fEHE7z4CCa+RoRyaIP/gYkbL4G9s30a+ooASmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7658
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505150179
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3OSBTYWx0ZWRfX8nAPrHav2678 eSEuUOxwZ37SwKXo27l3VZD11wdYuN/jfFIlxzh8Rd/4Eewx3zc2t7jr5IL2XSTYNzULJPPdMXj otTG9HDEmSjXjtZizX9SkXug4wHZ/rlggkA7dRXKrW2Q5yq9H2COLjalB8qgiM/xQY9nyFU2g6k
 Yzjbjqjeo2J9ADiwwSv6rVtKIPkLaGf+w0o0ys7CMyPGt6cu7Es/7DcugCa6dHcRr5UawmIw4uQ BoTuK5zZtbiaobBzAgKb6fumZSynhX08dZONBZ5N6DQabUgAgjQlA9+GWhX/2sxeYTGFIrrMLmv xmUDJ9nkmAoYEvH2/qfphgWZTmG2pIVaiJMugBs8NdNMk3frWrVsJ1PkqRmWapTYc7TI6XidDdi
 nZvCHpGFYcPucNWj/tMEueRodcnmaIVHBUjN2tRG/O+ZcMQlK1lqhaY+zmbEfShR1rLMsGmK
X-Authority-Analysis: v=2.4 cv=EtTSrTcA c=1 sm=1 tr=0 ts=68262dfc b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=TDfkz30aOg4or2VWauAA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13185
X-Proofpoint-ORIG-GUID: BAPHEDIg7R2gdW7Ztje2v6Z8EtbDNUe0
X-Proofpoint-GUID: BAPHEDIg7R2gdW7Ztje2v6Z8EtbDNUe0

* David Hildenbrand <david@redhat.com> [250515 13:30]:
> > > 
> > 
> > Did we document all this? :)
> > 
> > It'd be good to be super explicit about these sorts of 'dependency chains'.
> > 
> 
> Documentation/admin-guide/mm/transhuge.rst has under "Global THP controls"
> quite some stuff about all that, yes.
> 
> The whole document needs an overhaul, to clarify on the whole terminology,
> make it consistent, and better explain how the pagecache behaves etc. On my
> todo list, but I'm afraid it will be a bit of work to get it right / please
> most people.

Yes, the whole thing is making me grumpy (more than my default state).
The more I think about it, the more I don't like the prctl approach
either...

I more than dislike flags2... I hate it.

but no prctl, no cgroups, no bpf.. what is left?  A new policy groups
thing?  No, not that either, please.

To state the obvious, none of this is transparent.

Regards,
Liam

