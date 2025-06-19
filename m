Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D984212B71
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342281; cv=fail; b=ehImTh1AbGRUvFHu5Oh4FFNIMMEuiqy/9ftmtAsq0fjB03eCMfG43Xz0xba3RG9R8bd59BdBXl9eK8JqX1GHKqFjaWhrV3k8c1F6Am09eHTZ5LAWRLK4jyj/fwNmsZ4sXZfqt1ufn2ShazKy6nHMd9/h+/0vbN1Ohd5HTGWmeMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342281; c=relaxed/simple;
	bh=4o693XL/zMOYmCMyHtkfLX1VwmzK9DiOiJfPiSJG0as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j3nQUcp9v/taSD4cnuKghRbAz+i5c/IhkoAJAatD4hY9sng79HonS/hDqUtMn6ft3lrgduFOdIbgB2ezRpdSn7GfLtpQt8SDJZjWUY2GaNWT29ZAvDsValZBtHjUyBIKdWBno2zN6YKfjqPDiLf2NhbsX7OEFvGh/0SEueSnFdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bUfnnaGI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ihOI+1I5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bUfnnaGI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ihOI+1I5"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDSrmO021431;
	Thu, 19 Jun 2025 14:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=PucWHrm4dEUuNadbCF
	3DAg49IJ1Mfygrzil/nlnhkeg=; b=bUfnnaGIYrSUq+qJTwA05zQkNB166NF1kt
	JnEp/X6HKDnhXC8D53VLooSIqbQiM2oDDw0LI3MV/khoBrbu1rhH5BWWJFJYDi4x
	+UvxeHjUw1VGb7ElYSCo8BM9z/PEWbxrtxMlWlAmHIMKkyF7ZKkZ+06L+mDqsh/B
	t+EPih91k4s+KuEFNs1px87FluZ0lGHHI+/m4n1NgOIbZOWLf7csunBSmss5EFH5
	LLyM8z44P/5YJoFhuWeTmN6oDOrvj1XR0zzKTIurdOjIVP2HoENcngMYArPUqLZo
	k/GH3gn0lkZGbq3TygPgVwIStr8P+FMBaYG7dh+K7bDoqaB+LQtQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914et0np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:10:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDN9xI038224;
	Thu, 19 Jun 2025 14:10:55 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011005.outbound.protection.outlook.com [40.93.199.5])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbxsbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:10:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agG/mCsZQDx5r22uMjnqz9cFIHQyS8uUR7oMrnS9DutgnI0w/oz8A1hos4DXqXfDuH12VgZ87aemeP7xdEvsGcjxu0XgCKYRrC90s7h0fLGmEtJrPnOJ09Wq2wPpBxIdhoNVtDl3LFlkZAam0+824Kxhpr6nw56B+QonnGEZBznTFaRUx4lTTJQ3pV9rkAS+bzCdNmqMr6T/4ZX9RKZO7ewhMMPvSJVQShD7CwpewqpNtvRTk1TdE/d6V/no0qGtThhO7Z9lBBdG5KbN6rFE2JLtUaAdIeUYvEG9fgO+C/skLebYn9T0ykBx5RuNpyfeI5S2+LUyI624tRTBB+DRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PucWHrm4dEUuNadbCF3DAg49IJ1Mfygrzil/nlnhkeg=;
 b=T+W9iN+NrhbAf2E8/SvbJ9zRZ0nem4VIcM1tR9MlsblCknvV7BeqXaAtbd9vASC1yi9231zx4SPI0jLdcYZlMPhcf8LZqGlOICMeDoF7+AxuVz1MFmS6fpci3IyhsQm/Bo29f87cjAohswYSeyy5fQwWWXm+iq1cYq1YKItqL+VTUWHHJlxHijy6wcj00SmHXaX+ZvlJQCUIn0J3ACZYlApHF8IV9u3nyQV3zE1lEzBhE5X4XVlGcgtpYkvsrEbKEPe7ENZPyM3X/X63wqDBd33FZtrLgeKWH4KT2kmylwkH619GFEctA+X+Ql+Xq/RoW6RS3kBO8lPOmbYbyYUOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PucWHrm4dEUuNadbCF3DAg49IJ1Mfygrzil/nlnhkeg=;
 b=ihOI+1I5fxKrvUU8UqKmzQ5d1Dq98lFmScbMd2WicaY+w1iO6SWmX9e4gahciwNAsXmB7V3lBqLU4q1oTCcsnl9zBQA3QLelnwcE1pYT1S/Tbx9Npd+ck7+jnmYCYn3oKTsleTPN+q+NM92otqzQHUt7uqIU9gbKWitF9e5tRY4=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by MW4PR10MB6485.namprd10.prod.outlook.com (2603:10b6:303:221::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 14:10:51 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 14:10:51 +0000
Date: Thu, 19 Jun 2025 23:10:43 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
        Adrian Huang <ahuang12@lenovo.com>,
        Christop Hellwig <hch@infradead.org>,
        Mateusz Guzik <mjguzik@gmail.com>, linux-mm@kvack.org,
        Suren Baghdasaryan <surenb@google.com>,
        Kent Overstreet <kent.overstreet@linux.dev>
Subject: Kernel crash due to alloc_tag_top_users() being called when
 !mem_profiling_support?
Message-ID: <aFQaY4Bxle8-GT6O@harry>
References: <202506181351.bba867dd-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506181351.bba867dd-lkp@intel.com>
X-ClientProxiedBy: SE2P216CA0146.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::6) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|MW4PR10MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d69bd6c-e2f3-4d98-700e-08ddaf3b188b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WG7ANKpoek/v2aYzAetNJ8RyYySDLLhx7ScKkFAAmM3YOjtz/zcx49/n1Zz6?=
 =?us-ascii?Q?+SFGryCodE/N+3iHXIxpXqY31maE8iuDJN5nFP2S1C21aRKHExmLtk2cJg/s?=
 =?us-ascii?Q?FIvJoFbHVrvAQKjSqZhSZ4uVk+eNszVKrAg9oiatfJksCMztNMowY/qiNbqa?=
 =?us-ascii?Q?lH2iD5ad2I0StNRhOoXatOqvsnQdTtRB6rwk3Gid2/z4URYzmDJTjKpo2GQA?=
 =?us-ascii?Q?VqdkS2IPYeMWH639AqfZZhAFuWyRra/GIWJDV4/mrgQKJsebcOJo3ZkOAu5t?=
 =?us-ascii?Q?BJEyqNSfEXf1RKRnsnCsgqXemyvoFMXMAPb7pj+kV2e+kF0xCJxQ3eD8Q4ij?=
 =?us-ascii?Q?kfHabjRtbH1GydF1fcH3tYbEngZOAqYjQlKKY4Enfw/2I4exx8EJzxChQ7S4?=
 =?us-ascii?Q?ciZleB/xt2nCQFbH2qzLMV+CRYvlw096ZVrsCRoH2w5pOFFqkHd6Qc/ynNIj?=
 =?us-ascii?Q?XcFVdhXRRxLumDUz+Zvlgz1YriVYJPZii++sudoo5vlCcVZHvU2IvhqQmuE7?=
 =?us-ascii?Q?e9i3Yz12eKsx/j+HVjxyKYi23TLfs0F7KDw8RKSAuUIztD2jGNtPg25AB2eC?=
 =?us-ascii?Q?SDVD7AaXKZWvEVx+IUfCTlFz2V8S2FO+qw8xQd0QjfOGMszgULO2JuD1Z0Wp?=
 =?us-ascii?Q?dPW7ptTUQfgofisMZvQYRCKjAjOXpHTbYu6QY8GyYm+zdf6yXREXn4XAvkc7?=
 =?us-ascii?Q?mNBSaeuAAuD10z5U1Y5HEJRV22FR5pklJpaVKzA8K/aJpe6YKG8XIXAdOa2n?=
 =?us-ascii?Q?klXLdHRZdI8kK+GGGC9+dNznod8fx0e753QkinOjr+6PZMXH1yRWt5Ua75+G?=
 =?us-ascii?Q?Zh7amq5OsYDx+ChjTVwr0FNLkF8HJtbtsAEoVkisu94l3Inbx+JG1Rm2G5yf?=
 =?us-ascii?Q?UG2ACgbv3m47q5GqEFa8Jvmb5gp9Th0D+ItMXzhPN1cs6kJv+aV0ypt7jd66?=
 =?us-ascii?Q?csnGXO78ORK90JP3cJ4erpPzT18M8zKgyWmlUEsmCPXaXPQMLjwNKk2Y80cn?=
 =?us-ascii?Q?J8qvctHt5HNh2ax6jQM6ra1J8tNZZP6ZdZhkMkhGoS0KWcLsbfcKMchOQbzs?=
 =?us-ascii?Q?APQ5nlydeoq90zTVMqgQS2RQSSC0xwq9t/ksEMmiWDayp+t6eLZ4YzVMRS6b?=
 =?us-ascii?Q?sm4Cmi1igW9Vp60EwKzgvK/eEg21pODlxuhMIAASrwukuKV23XJDHNi+CeZF?=
 =?us-ascii?Q?xZIw1ZKhxBkeRgUeNMkHp/mwndSNHUCtVTStm3YBBAjkk2obLIHjgrspsNyO?=
 =?us-ascii?Q?+GM+qgB3rulEXT5ZJ5crJ9+bwgjU3j+yY8rLYzMcP/U04o9MmBhuroE3TAbc?=
 =?us-ascii?Q?sZPSEE0IoW0xk+utPU4viCNBMVNLm60D0Lkw/IS1MnDwyExPGiWoIkzjOwR+?=
 =?us-ascii?Q?9Ew8U0KJEEOWRtkxOKh8KaywHh8l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zfucC6UMxV8gjEsBXzGUsGFITyIEZpMK5GdJ0fzwS84YWWZeusQTdkdqJku/?=
 =?us-ascii?Q?85c0Ti048KIDSxUhE3qFk31yhdWx75D1iN+D3eqA5KG5OTWMOMxGE1+cVJbo?=
 =?us-ascii?Q?PjxpU///jqawquB9gTHABJNauvu/MkOHRDVs1jAHoIgSuc3BEZNHyBiiNdVG?=
 =?us-ascii?Q?UYDNH8do/6qOrXZIhD4i8T4OBmUWTPjwoeLXmZN8JOXyQ+1icgYmJSM+QpOf?=
 =?us-ascii?Q?diQOc5/+KBdof7F4vP+ZHT7NOKrhuns2sRIpndW5CKnryazHm2L3dd0VAqvL?=
 =?us-ascii?Q?qwcPevnE0xuN8WwDqDlhLBOATzoqOkudXQPzFvXqnzxdkTBqiR+j2fxWj582?=
 =?us-ascii?Q?Lc2mguLkqfbACkeIsFBxC3JPvLDJscYOxaU57cxOl8eU7ujL5DAomBb8gAbU?=
 =?us-ascii?Q?Nv1a0gcbhxfEtV161JXi6EStzLvayaiUmQnmaF+DxhvGbXncB1NG1dNyLibt?=
 =?us-ascii?Q?xDQe1AERllK2l1YBBrUCm/MikUdTFpOUqyyYSAJvMcY6CGjXulvNhyaO27YR?=
 =?us-ascii?Q?TnNV0RtaIWCOUPynlSNi1VBRIVRQk7voo4tU4PlMTgDMm4+mtpVCvJHOduhx?=
 =?us-ascii?Q?wzvVUT5lcvc8HHCgJpI69x53NbCIm95KW8s1zGMtSW1gpa5JjkVV2Quu7rm+?=
 =?us-ascii?Q?nJ0PxE8zvqhPevcRSC8Ti9OSq+f0stMhqZ+X2i4mWyDRj9yIOy7w5AVDGYM8?=
 =?us-ascii?Q?Y237zYZNFF9yVZARaxa9y4MfjSGR5R7jVROkUUK/K4eUoecxyODVs3c+eQxe?=
 =?us-ascii?Q?bo34SG+F48SJUEffgSLwVjC6rcEh+sSGJ8/Auybu38V+nbRl54grFJKb8KxK?=
 =?us-ascii?Q?zNsCV7O8O8uxCWvse3CYeoyicVdmxsGCmF/o9Y89kKojYscUj8A6zla1FI/1?=
 =?us-ascii?Q?vzPmKLRHAgY/CI1GMD2W1/X1bO8Tz7hEIabE7mzXrdqodMDapCa9YPaj1ivn?=
 =?us-ascii?Q?M77evAq3j6NmhnMSnCwfjrHB5+5WM1Fnov7ojiIRQ25TlXKa0XlpN8NNVUXK?=
 =?us-ascii?Q?wkc5Vb74s7SE+XAnvdD51BvRUn2t2+Df/sQ4tKBp+GziottU3soRe0BGIyls?=
 =?us-ascii?Q?Fvp+GI1b449Bj4OSFH64A5G5iJorXlB/mmSsn3bool5/9kwtX4gaafAS3lCk?=
 =?us-ascii?Q?hAYVJ9oTvzUDUk8agDxzxLvrx0Cpj3QP6R2wGFMl8zaz75UXQIgu/6d05E4E?=
 =?us-ascii?Q?VXFwghsa7dX8iSUGL7IV+S19MRBBSoS6kOhLYIEpBSitSBJyTdMGlNhZ334x?=
 =?us-ascii?Q?rwH58rzWBxBjYuxJoxtY0/HiG6vgZ653eDDC2koaHc3OSx9WlXn23UNqP2bx?=
 =?us-ascii?Q?47W7Jm/8YM0nuhpHAIIS+HFvsXa5S3T4W3RLAF6+5FMeqlN2NCqrcm38l4dn?=
 =?us-ascii?Q?RHqIXXCNjRQe1gXQqnxKWOhxDM76AmeEi5GAEBLTarJPq6Sy1f6uQ/i9W0QV?=
 =?us-ascii?Q?DHvUFyPGWduwpzdCmreN4nuVvHxFk2+V/dddrCKacFGBZkAzptvAMt7s0FTh?=
 =?us-ascii?Q?mb21BqqssgU2SK15TqvVE3q9ln6fMyV/p2LG75lo3dJ7hpFRENl/rp9lP9Cn?=
 =?us-ascii?Q?1J6l9LcK8Ud5EIWDMj2A3cg7sxXQpjjFMsUuG+gM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WyncLxLK8X8UuYXxiJhebKInIa98uL/Wi6WB+8oFim/upkKtOi2dZH+q6KODOryMuQzHYMh1xyrFgK2+8ZuQ9qyQ7q0ZcIqnpE8ZKTC6/DmRwkYoTIrOl4U9BRGfnDIQ6jHnqGHxrUzoGpuS6PZ7x5bD4WmLrxKEVP+IlWP9pwvE7hijKAgu/q/kZ2DpXC8UbnMutxl3xsjjGt+1BI9OEzenMS3/8oQwlJ4BAG1in6VWFugKjgcSgJiidtyP8vXcjRPoux6BdmX0XLXE3t+RS3l/gzVHmhH7rAn+DFNpAnGe4sD4KLqPEqiQ7h6ICBoWMDo4Ucd/5nuZgo6AKjDod+xP+ozy19n2QpeeLQIxi/iKz7Eh2jC0dhy2rYrkAehQROO1LeLS1IFZ1ywvEELorBdNEUBHTitv3fJEE2ukDEZROXSGavjVHTlz784R8loXUI8+KVI/U1Ue7SyC+0o0poNalCQUqttGWhq5ZheC129Z/jxffN/J8f5sk7AM5gZZCrfTqqw08Hah+pxVb23/pleW3hHE67eTbG/XzX7+TMQAHZNDi2WhKdVqYezRM2gRJU7z1IHPTl4VUlzrYXoqzGaa30Du1Ewn5w6ODUC9kQ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d69bd6c-e2f3-4d98-700e-08ddaf3b188b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 14:10:50.9036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WL5XjC53X5uW2SaqxLHRUOy/iZ3e+V6HzqcexKOPV6ncTTbI4JzjAqCz4K2LSS2UpfUMEnzU0h7hr6AtVXkd4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6485
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190117
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDExNyBTYWx0ZWRfX/GxloYDGmBOb aa8dy88ZRZUiVxnK0j3D6rXrqDD6AkLtrWCbFGwkypsHrWFK82/7J8Qr6PEGnvUb8toai+WwQje o63FpghfIQMYTAElvQLEfa0FPOvdAtNBsz22b3zxD0jEET10hDm4AZEM4GDGKY1GN6Al4eEC2Gp
 7Ga6pxOs+3Eme1fkssLVgVX6icShE3VKwnhJFF/OgJiuDpYr43wiHwU5ZcAf/wN4gvZp2X0GzdN PamCjre1rtgmXx49x1J8BQ4LJ8Cda22YkAInQLlPNm+Kj4G2UW+ehM31Zsr8QJKArrDCZEqxQ/e bxQRHUC79Mzs1Zzu2/YGooyowlSbmpulPvRaGIZ9W92h4Ah2Arspfh7eZbNM+Qjd/Iu99z09Lv5
 8pnJS4y5aze/68fuRz2j5O5CVcVHKHwGq+9+mwnHuYN0+stGYugUNWUsD9SkAo1qJt1kMgm6
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=68541a70 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=i3X5FwGiAAAA:8 a=NEAV23lmAAAA:8 a=gdRfedmb8AejtgjZo1QA:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf
 awl=host:13206
X-Proofpoint-GUID: XYYrTkRSCVrs7d2HCo9JV_vTHFo2YAIT
X-Proofpoint-ORIG-GUID: XYYrTkRSCVrs7d2HCo9JV_vTHFo2YAIT

On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> 
> Hello,
> 
> for this change, we reported
> "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> in
> https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> 
> at that time, we made some tests with x86_64 config which runs well.
> 
> now we noticed the commit is in mainline now.

(Re-sending due to not Ccing people and the list...)

Hi, I'm facing the same error on my testing environment.

I think this is related to memory allocation profiling & code tagging
subsystems rather than vmalloc, so let's add related folks to Cc.

After a quick skimming of the code, it seems the condition
to trigger this is that on 1) MEM_ALLOC_PROFILING is compiled but
2) not enabled by default. and 3) allocation somehow failed, calling
alloc_tag_top_users().

I see "Memory allocation profiling is not supported!" in the dmesg,
which means it did not alloc & inititialize alloc_tag_cttype properly,
but alloc_tag_top_users() tries to acquire the semaphore.

I think the kernel should not call alloc_tag_top_users() at all (or it
should return an error) if mem_profiling_support == false?

Does the following work on your testing environment?

(Only did very light testing on my QEMU, but seems to fix the issue for me.)

diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index d48b80f3f007..57d4d5673855 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -134,7 +134,9 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
 	struct codetag_bytes n;
 	unsigned int i, nr = 0;
 
-	if (can_sleep)
+	if (!mem_profiling_support)
+		return 0;
+	else if (can_sleep)
 		codetag_lock_module_list(alloc_tag_cttype, true);
 	else if (!codetag_trylock_module_list(alloc_tag_cttype))
 		return 0;

> the config still has expected diff with parent:
> 
> --- /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/7a73348e5d4715b5565a53f21c01ea7b54e46cbd/.config   2025-06-17 14:40:29.481052101 +0800
> +++ /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/2d76e79315e403aab595d4c8830b7a46c19f0f3b/.config   2025-06-17 14:41:18.448543738 +0800
> @@ -7551,7 +7551,7 @@ CONFIG_TEST_IDA=m
>  CONFIG_TEST_MISC_MINOR=m
>  # CONFIG_TEST_LKM is not set
>  CONFIG_TEST_BITOPS=m
> -CONFIG_TEST_VMALLOC=m
> +CONFIG_TEST_VMALLOC=y
>  # CONFIG_TEST_BPF is not set
>  CONFIG_FIND_BIT_BENCHMARK=m
>  # CONFIG_TEST_FIRMWARE is not set
> 
> 
> then we noticed similar random issue with x86_64 randconfig this time.
> 
> 7a73348e5d4715b5 2d76e79315e403aab595d4c8830
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :199         34%          67:200   dmesg.KASAN:null-ptr-deref_in_range[#-#]
>            :199         34%          67:200   dmesg.Kernel_panic-not_syncing:Fatal_exception
>            :199         34%          67:200   dmesg.Mem-Info
>            :199         34%          67:200   dmesg.Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
>            :199         34%          67:200   dmesg.RIP:down_read_trylock
> 
> we don't have enough knowledge to understand the relationship between code
> change and the random issues. just report what we obsverved in our tests FYI.
> 
> below is full report.
> 
> 
> 
> kernel test robot noticed "Kernel_panic-not_syncing:Fatal_exception" on:
> 
> commit: 2d76e79315e403aab595d4c8830b7a46c19f0f3b ("lib/test_vmalloc.c: allow built-in execution")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linus/master      e04c78d86a9699d136910cfc0bdcf01087e3267e]
> [test failed on linux-next/master 050f8ad7b58d9079455af171ac279c4b9b828c11]
> 
> in testcase: boot
> 
> config: x86_64-randconfig-161-20250614
> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202506181351.bba867dd-lkp@intel.com
> 
> 
> [   36.902716][   T60] vmalloc_node_range for size 8192 failed: Address range restricted to 0xffffc90000000000 - 0xffffe8ffffffffff
> [   36.903981][   T60] vmalloc_test/0: vmalloc error: size 4096, vm_struct allocation failed, mode:0xdc0(GFP_KERNEL|__GFP_ZERO), nodemask=(null)
> [   36.905195][   T60] CPU: 1 UID: 0 PID: 60 Comm: vmalloc_test/0 Not tainted 6.15.0-rc6-00142-g2d76e79315e4 #1 VOLUNTARY 
> [   36.905201][   T60] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [   36.905203][   T60] Call Trace:
> [   36.905206][   T60]  <TASK>
> [   36.905209][   T60]  dump_stack_lvl+0x87/0xd6
> [   36.905223][   T60]  warn_alloc+0x15e/0x291
> [   36.905230][   T60]  ? has_managed_dma+0x37/0x37
> [   36.905237][   T60]  ? __get_vm_area_node+0x33a/0x3c0
> [   36.905244][   T60]  ? __get_vm_area_node+0x33a/0x3c0
> [   36.905250][   T60]  __vmalloc_node_range_noprof+0x170/0x306
> [   36.905255][   T60]  ? __vmalloc_area_node+0x460/0x460
> [   36.905260][   T60]  ? test_func+0x2ae/0x469
> [   36.905264][   T60]  __vmalloc_node_noprof+0xb8/0xd9
> [   36.905267][   T60]  ? test_func+0x2ae/0x469
> [   36.905272][   T60]  align_shift_alloc_test+0xa8/0x165
> [   36.905277][   T60]  test_func+0x2ae/0x469
> [   36.905281][   T60]  ? pcpu_alloc_test+0x31b/0x31b
> [   36.905286][   T60]  ? __kthread_parkme+0xcb/0x1a3
> [   36.905293][   T60]  ? pcpu_alloc_test+0x31b/0x31b
> [   36.905297][   T60]  kthread+0x452/0x464
> [   36.905301][   T60]  ? kthread_is_per_cpu+0x51/0x51
> [   36.905304][   T60]  ? _raw_spin_unlock_irq+0x23/0x35
> [   36.905308][   T60]  ? kthread_is_per_cpu+0x51/0x51
> [ 36.905311][ T60] ? kthread_is_per_cpu (kbuild/obj/consumer/x86_64-randconfig-161-20250614/kernel/kthread.c:413) 
> [ 36.905314][ T60] ret_from_fork (kbuild/obj/consumer/x86_64-randconfig-161-20250614/arch/x86/kernel/process.c:153) 
> [ 36.905318][ T60] ? kthread_is_per_cpu (kbuild/obj/consumer/x86_64-randconfig-161-20250614/kernel/kthread.c:413) 
> [ 36.905321][ T60] ret_from_fork_asm (kbuild/obj/consumer/x86_64-randconfig-161-20250614/arch/x86/entry/entry_64.S:255) 
> [   36.905330][   T60]  </TASK>
> [   36.905332][   T60] Mem-Info:
> [   36.919941][   T60] active_anon:0 inactive_anon:0 isolated_anon:0
> [   36.919941][   T60]  active_file:0 inactive_file:0 isolated_file:0
> [   36.919941][   T60]  unevictable:41612 dirty:0 writeback:0
> [   36.919941][   T60]  slab_reclaimable:7429 slab_unreclaimable:145259
> [   36.919941][   T60]  mapped:0 shmem:0 pagetables:145
> [   36.919941][   T60]  sec_pagetables:0 bounce:0
> [   36.919941][   T60]  kernel_misc_reclaimable:0
> [   36.919941][   T60]  free:3233392 free_pcp:1185 free_cma:0
> [   36.923830][   T60] Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:166448kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB writeback_tmp:0kB kernel_stack:1952kB pagetables:580kB sec_pagetables:0kB all_unreclaimable? no Balloon:0kB
> [   36.926265][   T60] DMA free:15360kB boost:0kB min:16kB low:28kB high:40kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
> [   36.928855][   T60] lowmem_reserve[]: 0 2991 13741 13741
> [   36.929411][   T60] DMA32 free:3060560kB boost:0kB min:3224kB low:6244kB high:9264kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:3129216kB managed:3063680kB mlocked:0kB bounce:0kB free_pcp:3120kB local_pcp:3120kB free_cma:0kB
> [   36.932080][   T60] lowmem_reserve[]: 0 0 10749 10749
> [   36.932604][   T60] Normal free:9857648kB boost:0kB min:11744kB low:22748kB high:33752kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:166448kB writepending:0kB present:13631488kB managed:11007884kB mlocked:0kB bounce:0kB free_pcp:1620kB local_pcp:740kB free_cma:0kB
> [   36.935336][   T60] lowmem_reserve[]: 0 0 0 0
> [   36.935802][   T60] DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15360kB
> [   36.936931][   T60] DMA32: 0*4kB 0*8kB 1*16kB (M) 2*32kB (M) 2*64kB (M) 1*128kB (M) 2*256kB (M) 2*512kB (M) 1*1024kB (M) 1*2048kB (M) 746*4096kB (M) = 3060560kB
> [   36.938318][   T60] Normal: 6*4kB (ME) 2*8kB (ME) 7*16kB (UME) 5*32kB (M) 3*64kB (ME) 4*128kB (M) 6*256kB (UME) 2*512kB (M) 1*1024kB (M) 3*2048kB (UME) 2404*4096kB (M) = 9857528kB
> [   36.939849][   T60] 41618 total pagecache pages
> [   36.940324][   T60] 4194174 pages RAM
> [   36.940721][   T60] 0 pages HighMem/MovableOnly
> [   36.941188][   T60] 672443 pages reserved
> [   36.941626][   T60] Oops: general protection fault, probably for non-canonical address 0xdffffc000000001b: 0000 [#1] SMP KASAN
> [   36.942185][   T60] KASAN: null-ptr-deref in range [0x00000000000000d8-0x00000000000000df]
> [   36.942185][   T60] CPU: 1 UID: 0 PID: 60 Comm: vmalloc_test/0 Not tainted 6.15.0-rc6-00142-g2d76e79315e4 #1 VOLUNTARY 
> [   36.942185][   T60] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [   36.942185][   T60] RIP: 0010:down_read_trylock+0xa7/0x2b9
> [   36.942185][   T60] Code: b0 ef 25 91 e8 57 16 40 00 83 3d 9c e6 a7 09 00 0f 85 2c 01 00 00 48 8d 6b 68 b8 ff ff 37 00 48 89 ea 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74 08 48 89 ef e8 3c 16 40 00 48 3b 5b 68 0f 84 00 01
> [   36.942185][   T60] RSP: 0000:ffff88814657f848 EFLAGS: 00010206
> [   36.942185][   T60] RAX: dffffc0000000000 RBX: 0000000000000070 RCX: 1ffffffff224bdf6
> [   36.942185][   T60] RDX: 000000000000001b RSI: 000000000000000a RDI: 0000000000000070
> [   36.942185][   T60] RBP: 00000000000000d8 R08: 0000000000000000 R09: 0000000000000000
> [   36.942185][   T60] R10: 0000000000000000 R11: 0000000000000000 R12: 1ffff11028caff0a
> [   36.942185][   T60] R13: ffff88814657fa30 R14: dffffc0000000000 R15: 0000000000000000
> [   36.942185][   T60] FS:  0000000000000000(0000) GS:ffff88841c1f0000(0000) knlGS:0000000000000000
> [   36.942185][   T60] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   36.942185][   T60] CR2: 0000000000000000 CR3: 00000001636e0000 CR4: 00000000000406b0
> [   36.942185][   T60] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   36.942185][   T60] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   36.942185][   T60] Call Trace:
> [   36.942185][   T60]  <TASK>
> [   36.942185][   T60]  ? clear_nonspinnable+0x32/0x32
> [   36.942185][   T60]  ? vprintk_emit+0x165/0x194
> [   36.942185][   T60]  codetag_trylock_module_list+0xd/0x19
> [   36.942185][   T60]  alloc_tag_top_users+0x95/0x216
> [   36.942185][   T60]  ? _printk+0xad/0xdf
> [   36.942185][   T60]  ? reserve_module_tags+0x308/0x308
> [   36.942185][   T60]  __show_mem+0x167/0x54b
> [   36.942185][   T60]  ? _printk+0xad/0xdf
> [   36.942185][   T60]  ? printk_get_console_flush_type+0x272/0x272
> [   36.942185][   T60]  ? show_free_areas+0x115d/0x115d
> [   36.942185][   T60]  ? tracer_hardirqs_on+0x1b/0x28d
> [   36.942185][   T60]  ? dump_stack_lvl+0x91/0xd6
> [   36.942185][   T60]  ? warn_alloc+0x251/0x291
> [   36.942185][   T60]  warn_alloc+0x251/0x291
> [   36.942185][   T60]  ? has_managed_dma+0x37/0x37
> [   36.942185][   T60]  ? __get_vm_area_node+0x33a/0x3c0
> [   36.942185][   T60]  __vmalloc_node_range_noprof+0x170/0x306
> [   36.942185][   T60]  ? __vmalloc_area_node+0x460/0x460
> [   36.942185][   T60]  ? test_func+0x2ae/0x469
> [   36.942185][   T60]  __vmalloc_node_noprof+0xb8/0xd9
> [   36.942185][   T60]  ? test_func+0x2ae/0x469
> [   36.942185][   T60]  align_shift_alloc_test+0xa8/0x165
> [   36.942185][   T60]  test_func+0x2ae/0x469
> [   36.942185][   T60]  ? pcpu_alloc_test+0x31b/0x31b
> [   36.942185][   T60]  ? __kthread_parkme+0xcb/0x1a3
> [   36.942185][   T60]  ? pcpu_alloc_test+0x31b/0x31b
> [   36.942185][   T60]  kthread+0x452/0x464
> [   36.942185][   T60]  ? kthread_is_per_cpu+0x51/0x51
> [   36.942185][   T60]  ? _raw_spin_unlock_irq+0x23/0x35
> [   36.942185][   T60]  ? kthread_is_per_cpu+0x51/0x51
> [   36.942185][   T60]  ret_from_fork+0x20/0x54
> [   36.942185][   T60]  ? kthread_is_per_cpu+0x51/0x51
> [   36.942185][   T60]  ret_from_fork_asm+0x11/0x20
> [   36.942185][   T60]  </TASK>
> [   36.942185][   T60] Modules linked in:
> [   37.000652][   T60] ---[ end trace 0000000000000000 ]---
> [   37.001188][   T60] RIP: 0010:down_read_trylock+0xa7/0x2b9
> [   37.001731][   T60] Code: b0 ef 25 91 e8 57 16 40 00 83 3d 9c e6 a7 09 00 0f 85 2c 01 00 00 48 8d 6b 68 b8 ff ff 37 00 48 89 ea 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74 08 48 89 ef e8 3c 16 40 00 48 3b 5b 68 0f 84 00 01
> [   37.003488][   T60] RSP: 0000:ffff88814657f848 EFLAGS: 00010206
> [   37.004072][   T60] RAX: dffffc0000000000 RBX: 0000000000000070 RCX: 1ffffffff224bdf6
> [   37.004848][   T60] RDX: 000000000000001b RSI: 000000000000000a RDI: 0000000000000070
> [   37.005610][   T60] RBP: 00000000000000d8 R08: 0000000000000000 R09: 0000000000000000
> [   37.006381][   T60] R10: 0000000000000000 R11: 0000000000000000 R12: 1ffff11028caff0a
> [   37.007178][   T60] R13: ffff88814657fa30 R14: dffffc0000000000 R15: 0000000000000000
> [   37.007940][   T60] FS:  0000000000000000(0000) GS:ffff88841c1f0000(0000) knlGS:0000000000000000
> [   37.008792][   T60] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   37.009411][   T60] CR2: 0000000000000000 CR3: 00000001636e0000 CR4: 00000000000406b0
> [   37.010175][   T60] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   37.010950][   T60] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   37.011716][   T60] Kernel panic - not syncing: Fatal exception
> [   37.012397][   T60] Kernel Offset: 0x6200000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250618/202506181351.bba867dd-lkp@intel.com
> 
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
> 

-- 
Cheers,
Harry / Hyeonggon
