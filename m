Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AB219D080
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746680123; cv=fail; b=CgNYQT3ZXlSYs5htz+34c/qbQf7buO5KBdxtdAOVSsmHZL7tJK6EqE/v4MPiPZypYxo2iHrt+3iFNF1U21SPrZpv3MB4zyJcJHBq7vbS54oEbcExwRLU6qKtkeF61cf9eciQeZFe5Lb+ouryCB7hYsLsV0Vwfevs1lLEQfhZ2X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746680123; c=relaxed/simple;
	bh=FVd3NdLr9np3zjuDq2vQ9dSdBE4F6sOzWVZKUiptQcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uDz1nQw+9r6tkJF0YKXfHh2gbjGwEFUvEyKO6LdTs6jOrmp9DtXlE8omOZM00NKyj6bDuRArOfY76+2bR48tbIf/7g6aola943iH5USAwWSwekz5GnYZKwPlqDZgO6adOSHNHv1yxT6ww1pV2xznkl4Z+GEC48Xg3W3uNQl2USY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UKgEwnoQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RQjchnP4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UKgEwnoQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RQjchnP4"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5483229D005385;
	Thu, 8 May 2025 04:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Rgx1xrK4RLGcleRER1
	A2gM8XV6YQ9i/t5FjbhQ5mBo8=; b=UKgEwnoQB1ibVvHId+Mr+OgUPmf8xLR0E0
	kYrg3QkZJ8XScOyF9p5cVP/f3nTwqczLDl8VMF/+aRe/gqlZvC9tL9YQnebpJ0WL
	x/YllBX3sy2W5uVjD1XvERUgndwh0TwOsTuWJ7RQ3LZHRqSORAflH54epBtfRfwG
	piQZJwvGC7ykrHG38ywNZbyB0IBTlplW5yxWm5aZFwi/dA0OP5Im6z59m+Br4JNe
	4CHfmMXcB78Z7W57NsQmvCHnd5eMOWWyE/xB9A+wYy1GQei/gs70uL7Xs5Xsdqej
	aoI0hkrCGHJbKZLQuxIDfUiiLVsp5j9Ibrb4fu0Ccq75jJGeepaA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46gmbmg4aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 04:54:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54833RIQ002001;
	Thu, 8 May 2025 04:54:28 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010007.outbound.protection.outlook.com [40.93.13.7])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46gmcba5ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 04:54:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3HuSDuy9Dbt2R+vNx9Ou9DsO8nN8TwSVYGfdKWH1kAI1e1qbVs72BmgIEgB9azTSTvMZYGW6zC8XMu+XI3GnKcu6pxV4TYtAj9cC/z434hzfxFqVBPHkulm9AqYp08BCtLK8HyMPkoe8IBLxk6DvBsdSIjX2X0ORb8yJjYBfOxYTtkJavoMZ/uUODN0jaZV7g0YlimfnCdWHIt5fbZKpezZxVhAwu4JuOxjrD6QuuUHEnHQEvOzwfOmj8hcsUETt9FJ6Hc/FQzXoDW4dYYzUtrB7Dfnuzx6u6kuOiQQ7eSywfWv5+GNYEOnEfOWaqG1fk/uL/z7XFsZGgpKpum1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rgx1xrK4RLGcleRER1A2gM8XV6YQ9i/t5FjbhQ5mBo8=;
 b=Gu4I0K41CKpPGQDmoiyfIcmRxVHBWDqLYo3u5OgXmN8MXOPTO/ESM8qWGaw9ZNT4ItT9qfZh7HI8H70EgziFyaH239U2t6SgoFrCPkWF4ShpHZYhP8EMqWsRLMZnXgM+K4vefh0uSqmwflWVwCktfuXep46yp3iA7fCEUtW3B6SpPuKE4cLeK2a1B1o6v52prhzQeWV/bgK+3sTlG8JXe76e3TFHgq0PpLfqEANV2qiPZxTvbuNxOTgeBo5rsJRZlAoAfDz7z7/p36h+V+4Figk5lIOaPDWP6v1k48JAU9bGStHOnsTs4ma6D7jITMJJGkRLNbRMv5hhIFd16WyejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rgx1xrK4RLGcleRER1A2gM8XV6YQ9i/t5FjbhQ5mBo8=;
 b=RQjchnP4oiNbVOvUTSD02ZnjKuu+4vZej7t3CKSpwio5LWYPON3gLc1entky40cglfe+FMPuTG4jZrBcm8a47oOq2lwjyg946w1XA7mK7+hRW6AC8Hbggzeh7e53bDFkfnSZ/MTpkZzspd8eOsLXyyIpkQiIpWn+Fg4KiIBg/84=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4360.namprd10.prod.outlook.com (2603:10b6:610:ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Thu, 8 May
 2025 04:53:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 04:53:45 +0000
Date: Thu, 8 May 2025 05:53:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dev Jain <dev.jain@arm.com>, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
Message-ID: <21642319-daf6-4104-8fef-f6e13925d9a3@lucifer.local>
References: <20250507060256.78278-1-dev.jain@arm.com>
 <20250507060256.78278-3-dev.jain@arm.com>
 <20250507183703.43d7b53d5e2e263566cfe80a@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507183703.43d7b53d5e2e263566cfe80a@linux-foundation.org>
X-ClientProxiedBy: LO4P123CA0048.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4360:EE_
X-MS-Office365-Filtering-Correlation-Id: d04bfa0d-6c6c-4d69-3405-08dd8dec5039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a3p3XhCcL29RVgjotC+m40OX9+N9LHxaEJchK7dKPJ/hg0p8nr6T0vLh8O4t?=
 =?us-ascii?Q?uYuexXHZveE2SR82oVPLmRtSFUpuQzV3hbHVT6pAxf5dN9Q2y1e44XcAkc6m?=
 =?us-ascii?Q?XKpIudLUPk6fno6v295Du9yHOBYkvGKweqCvMBP8C1C/8+qX/u05lLP2rpbL?=
 =?us-ascii?Q?KXrb13uEhKgbzetUGan+eacJRnt/XfdUV9BHX7EpIlQC8zfElhOFDE31iag+?=
 =?us-ascii?Q?gGCcJJkLfVHxqJZWmyuN+wNEJ5QDsypplIKcA7E1nP/rjk3KdrCjT9A5xoWx?=
 =?us-ascii?Q?eU7dZVD/N+2JQLn/NED2wt5cAfYTkrguuj2tUyVrpK9SHfYR0WZYm1tNUtmr?=
 =?us-ascii?Q?ByYHArvgyJ2Nyq8ji2JQYTe1FWhBW78Tl+g3rRnOxGKTq8+Lw2iUH1tUpgEs?=
 =?us-ascii?Q?fVcx/UJ4/Vw4UWw7Ouy1wb2sPfjCo/DeiB4VEU2TMZ+QT1v2nDEDQPbzqVxw?=
 =?us-ascii?Q?KXi1XSrxe4pgquBehJR8TEt1k9cHta9pUuz3H57PP1qKJXPTOPxkWW3b/ckH?=
 =?us-ascii?Q?v5KD+D/laH3EI+5eEGCs34jZcN9JsOk3UKpFqL6nPGCVekpsUfrh0h/90qYZ?=
 =?us-ascii?Q?wUvQrpoX9G+4S0VH88WeLJ+Vuv0c/XxUVySyMeQdbVDl4XFwd6nSsOLdoFrk?=
 =?us-ascii?Q?VnnnWtJ4Tt+Zpjqzw1kxAQg0eojClbtp2hNpI4P3qHx18JRx1i6B/5xKfHyJ?=
 =?us-ascii?Q?Zp10tlek3932zMrCanQk491EmVOCfAMIPJvm9bJQIMNN9E5wOOgEbwI0zbmt?=
 =?us-ascii?Q?uGyJPFsi5TWvW0Rp1xzyPvIaSRIh26gR9bPXSVPUHke/KoOlg0mI/qtcMOEU?=
 =?us-ascii?Q?A6BeqA76QguyGWoC/fw7FGnjcXvcd9x9j2csmbewNNwx06e5ci0FhiawQFVh?=
 =?us-ascii?Q?ikMsqyK1Y76rlg6Fb0ksnNGmRyGj8Wy52r5joCOmb6C/Ls7KfAMCkC3mslul?=
 =?us-ascii?Q?3idbEW4rggXzbqA2+0gWGMi5xDI98d8o1e27DN6o0PEQ7Jy/zHTh7OHsdNU0?=
 =?us-ascii?Q?SmW+iZJOXHScaTG9G4KFzjDJ6Znkoo67/4qOUdcWzouu4PVb78zGLiMxRBYd?=
 =?us-ascii?Q?yrlM2bgpd6i270kTHbM6gNlWtFaXtaGU9+GKoi9zMsdY8HOQdvKsEAxgADxi?=
 =?us-ascii?Q?71EnaSOCROJTyeCxFjfhf4Gsz9jlwPfI21cb5e3JA71SgTp7Odu+kE/bZ/IB?=
 =?us-ascii?Q?CqFKvUg1oUylhDcqi/L2FYQdTfhvDp8OE+bDIuvd150NHMINItkZdwOyKebA?=
 =?us-ascii?Q?0MPFVbbpF54+OuhsBfUPzgowcXoW8225E/1AQqGpyNHnOQ/3L+BKmbFQBXjZ?=
 =?us-ascii?Q?HUWcU5v2ooNQmZ9Hon0jc10Xmq0DPrrlVqX1mkguUXGbl0abm4ROIyP+lT5F?=
 =?us-ascii?Q?0blrBWIup7FS/i+v5gV/6N5Vw3Q5k95NSge52cTQPpaGsvae4iKR7LNR6Bix?=
 =?us-ascii?Q?y/3EbOKhMW0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b6Tvh/CuLmFBun/VGCo09gig/XeY25f0NZktsuLLFmKbt+6GO9t1h+1mfM7B?=
 =?us-ascii?Q?EA6BtHXMfFfgce7cpAL2RFY/sD9pJBlf80wcTKKKHVrtwMSceJyGv9VkNpg8?=
 =?us-ascii?Q?Bxl7YdG2pjL/UvbTjajTVFxRIid0LrupFR+cf1/scbW4rIOGEBLzeA0roKDC?=
 =?us-ascii?Q?IPXy56/C5q2HUXBPHuFP7mYnq1B2ZNc1m4h2H+Ntm0Eokfpp6kOk0gxXiQi2?=
 =?us-ascii?Q?zB2aSmatHF0evo46+NT5/MOHILBEpr9Jp4gtZZ/PiPzchP8jl9rFfcN+qlfX?=
 =?us-ascii?Q?KI5WaD+xcP/DShBhTKJP5hC8hpR4jcT4bFBdPVG6AhCOW5I2QRo65Ir8icFl?=
 =?us-ascii?Q?3vxC15Nvl2+jKSKRNVDwJaJP7FA7CVFjTRnJuQ1Ab4Vl6ICSGcjVudVdzbMy?=
 =?us-ascii?Q?g1752FZm23M9nDhyGHQaUdE+78XJNzDhDS9a/RVvxwcPLVEQYy3USSZqZGoE?=
 =?us-ascii?Q?tkXffPN3CfyALIMWatj6GffmDffW0RA4hSNmlsOKxVzqorijinEd4kMcWZuV?=
 =?us-ascii?Q?KIgzi9r9S9JZFgLhoL9b8d1NUyz7JnHcFpUG70+q0vmiukj5J9ovOvOqWI9w?=
 =?us-ascii?Q?XG04WzuPHyck3ry6T0dA/k+jTDegVn2wHCRaR2208hzi+LsmomzEwSe/bXl3?=
 =?us-ascii?Q?+Vmng1FNlq3/c23sgTD6TNqSvNVzXyzZD3jNcu7qeKH9e6CHDZUaUCo61N7Z?=
 =?us-ascii?Q?RvJMl1zwYv/tFji1y+HeQ1bbjRQJ4n2HWTo+DFTf8Lx8ag4dtNHj5fiW3YhK?=
 =?us-ascii?Q?800hr0RmKIzDyRRH+QbAg7l/PxeTZjnHtP1OI0ljlzsKRCEzJqklbcN3LMzH?=
 =?us-ascii?Q?yTfCRhJGaXohAX4wMWTLeT9pqufAaN+fsPUZP8z2ikJGB16x8YSl+wN8fbiV?=
 =?us-ascii?Q?LqiOSz3IMOoOU2uX2eJEmI3XQM6WmO9gwdGDeNuwyR6NlEAGl6Hn+CrQYqOW?=
 =?us-ascii?Q?yeRZi1YfJWNgNx1Mtwterh7iZ1A+ZseorsDcU7e8RjU1HZ23Rbrsdl2rWc0D?=
 =?us-ascii?Q?SOA0Icj8UKUIMlrNSQyM3mQ5zIWDEZViJ20R9p4QrB9ua1zLS8rq3dUsOWMc?=
 =?us-ascii?Q?Ch3gtNwvaQowokHz/+kskGz9o1t1JJo/teQ39D8tz/kKuctRRZaApuRjVlyl?=
 =?us-ascii?Q?LNc1+zsSCjPuxXXyGRBjcE9q4udvBpsro9ZmjbDjQvmGwOa/h0t0AL5UcsXU?=
 =?us-ascii?Q?zvVDiIknmOOf8r80Bn0cXPIVaCj8YgaCnAqLRPt2RlttN47kTWxJJm/s5XRS?=
 =?us-ascii?Q?V3SCdjGEixipZ22wlB03KR68Dx56tDzuYE02gha1OK70aBhmhauz4aKCG51M?=
 =?us-ascii?Q?/CNarWEtyD9tjGFu+KQnDXqXGIzJ4QAvUg1xSui5sM5IU5mOucKWIIJcF16v?=
 =?us-ascii?Q?e9Q93DzWxdYMNNYyj5DftdURncrAiDmAoPeh5/foReu+XSdYjmWdOYQLnQEn?=
 =?us-ascii?Q?fzIfXwoWX+YiMRBaPS86chpeW22rDw7foHLj7H0Kws/mVU0i3uswpEft5tO8?=
 =?us-ascii?Q?tOpDsP/kDDh5iSujSYGK7zGY2Gcj47QzrJ5hH8pcsCz42+C0iEvrTWCuPTGw?=
 =?us-ascii?Q?/zwCh0kpaox2CIuDzgvB6Uh3yHv3jOIkPe8zT9CQi48eBnN1MKpM/hf0ANKx?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CjGAa+ne/Z/wC5+L5yxb+qgHenYY6c+0425xO4TPEaOEj3TuPcVUaHi1wUjc9ZysDwb0MqxYfQTg00J7rNt7oGZeqSZibXRr8YNAxlxuuX6nBHR7IAeTM5pcavWnUG0nrb5kKM7UBYwH20vdwBcADC9l3IGwewnVl1GKHtjjydtnUGM4iJbb+XgYYTV0nBCYuSatk8D0AocvJgKHyUzbn79g05LQlRK9S4rnRacqrsczP/3V/W7TaTpCUW8AWyve1O33aGvtGVOExexg1yc6oaaaedS8RvB6ZXG3vxRdrMwoXdvAjK0Yv/NIcLt1AS6w8S6diGXhvIkxWMS9h3axQGNQTlgKpteTt4q+2sFECFtmasgcxntR1Vq5zhQUyaUWnKzPsuS+sZVNpN/+e3jrSU2fRhJrrnyAKb3DfSQDb3+012WgvKxC1ZTf9RBNwtyGts1POgllOxbSsidTjgAbVyJl2SSHuLQ24nRs6ni8lMiOfF68cPDatTtE84rfbJ+O0njYAXrXNJhBxqIHUBhrmNYURxBTNGCZZ032pW6MA07ViPuGQ1fEVC2I6U1mq65lnMre6SR/Q1/c/vXZs4M4Xy53kaDoknqRMsQr5mUOWG4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04bfa0d-6c6c-4d69-3405-08dd8dec5039
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 04:53:45.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cv6uroQPMOM5mKb6e8bjirmnvvTPYoHzGNjRZ7p/HyBz1wkrZaFvtG/yDieAMC+6L6I+pRn8RjPFf+wEwbV1OJgzj0VGEtLF3Q3Jq+Fh0sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4360
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=663
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505080038
X-Authority-Analysis: v=2.4 cv=OvhPyz/t c=1 sm=1 tr=0 ts=681c3904 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=b6yz6vDP_wTYGmRa7XsA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13186
X-Proofpoint-ORIG-GUID: qteI39IZy8a4JrikGYFF7e7FuMh-YUDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDAzOCBTYWx0ZWRfX97UebWD1auDK QnCM4JMjIMV/6D66SDUSGZ5CGwm5AYa4mzA/m1eIoPQcqxvFTHoSnw1GVVLeXcq4P12Bi4hEq3N tNqZjtlsX4Zy/CSmaZr69IiSjozOEA2I7/kCT8sOYp3XnTlX0xr/oyvNnsU8LsU5AZ0WRi0W5Mc
 fC7pdY18iRBGZ0dI6Z/NuWAqP/FZQzNLuE60qeqObwK+c+Pfj8as4UuD47Q0ipjAYWgtDHsE49C FtPE92xbhXPuHIlWP5bbhFNHT85ci8v7SPPyh5Vg982h3M6SC+efyfEuGRDVgE09Jl50mA+W7jG 8XmhUp1YZG52V/oN2/6FTJNd9gazSM4JRS4ojKhQK7mJN9lF4qWp9gZIuP19f/iy1PqbaqG92Kt
 H6m1QH0or4u3XzSTEB5Szu9QNu0UxqXaf2TXG29wGWXdPuo/62uVl+atZUl42HkGfUtHWjeB
X-Proofpoint-GUID: qteI39IZy8a4JrikGYFF7e7FuMh-YUDF

On Wed, May 07, 2025 at 06:37:03PM -0700, Andrew Morton wrote:
> On Wed,  7 May 2025 11:32:56 +0530 Dev Jain <dev.jain@arm.com> wrote:
>
> > To use PTE batching, we want to determine whether the folio mapped by
> > the PTE is large, thus requiring the use of vm_normal_folio(). We want
> > to avoid the cost of vm_normal_folio() if the code path doesn't already
> > require the folio. For arm64, pte_batch_hint() does the job. To generalize
> > this hint, add a helper which will determine whether two consecutive PTEs
> > point to consecutive PFNs, in which case there is a high probability that
> > the underlying folio is large.
> > Next, use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> > are painted with the contig bit, then ptep_get() will iterate through all 16
> > entries to collect a/d bits. Hence this optimization will result in a 16x
> > reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> > will eventually call contpte_try_unfold() on every contig block, thus
> > flushing the TLB for the complete large folio range. Instead, use
> > get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> > do them on the starting and ending contig block.
> >
> > ...
> >
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -369,6 +369,35 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
> >  }
> >  #endif
> >
> > +/**
> > + * maybe_contiguous_pte_pfns - Hint whether the page mapped by the pte belongs
> > + * to a large folio.
> > + * @ptep: Pointer to the page table entry.
> > + * @pte: The page table entry.
> > + *
> > + * This helper is invoked when the caller wants to batch over a set of ptes
> > + * mapping a large folio, but the concerned code path does not already have
> > + * the folio. We want to avoid the cost of vm_normal_folio() only to find that
> > + * the underlying folio was small; i.e keep the small folio case as fast as
> > + * possible.
> > + *
> > + * The caller must ensure that ptep + 1 exists.
> > + */
>
> Gee, that isn't the prettiest interface we've ever invented.
>
> Is there any prospect that this function will get another caller?  If
> not then it's probably better to just open-code all this in the caller
> and fill it up with comments.
>
>
> Anyway, review of this series is scanty.  I'd normally enter
> wait-and-see mode, but this:
>
> > the average execution time reduces from 1.9 to
> > 1.2 seconds, giving a 37% performance optimization, on Apple M3 (arm64).
>
> prompts me into push-it-along mode.
>
>

There's been a ton of review on the v1 (see [0]), I will get to this one
soon, but as you can see from the v1 review there's lots we need to check
for correctness.

So it's coming :)

[0]: https://lore.kernel.org/linux-mm/20250506050056.59250-1-dev.jain@arm.com/

Let's not be too hasty to merge this though until we're sure it's safe
(this is delicate code). But I'll be giving R-b tags on a finalised version
anyway.
