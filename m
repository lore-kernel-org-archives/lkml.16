Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82659230BE8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615684; cv=fail; b=pP6lQJH1FAwGQZjz/At1bvkoD/nj7b4+9YAhlxR0zJuvtY7r7qC+6U4HlV2nTnQIHEV7jqlyLe0RAw7vAAOjaPkF+8WT876jp0MnMtXTQt2AKl6+e6+OwRLAdccEUdXLCrYYDPQb0uF/F+XDf8KjoV8d7mJC7TXUzHqJ/r2UgeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615684; c=relaxed/simple;
	bh=mg568kLAeaA0kL4qZIWAXlqxHcR30mdTmJqN158UZmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VG+35I2p8nugB54AShQfHxY14LengnFnOVF10E91mO+YdjVtyLdKf/XCyKfco8MD2QlZZT5HtDYDicCNBs0fiy+krZy07/bwE7BLjJXcsQaI7xBtS6IqXTqjWkXBLm9IQ63hUoQyv/qZdkcysOraW+N1pxVX9EJ0sJEWyVpeVjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dOgR0Ulw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fX4ZZ5wf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dOgR0Ulw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fX4ZZ5wf"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAt10R004924;
	Fri, 30 May 2025 14:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=E9rluFO8ffN+GQZYACjsZoa6BNiHYTrZUfoqv+g2XRk=; b=
	dOgR0UlwRFgtiHHgtuW2QlWEU3mdjE6evn3/8PtN9C5r8W2nJI76trwYyu6IwLyH
	U7m0dASTXEZZMEBqtX/6IqpNVEtX+x6nK163j6XGO+aqUkJ3HlBNioKgqCaR4Q+C
	y2IuxXwSgwiGrFxhRHtPtBua/bLw5zKIQ2mHFl+57GxnbOx7Vuu1CKsA8sr9R8Ea
	tpRag4EDM+pcirLo7F6BwHQ+RnC0TDQ5ZWehjmMG0jk6qSEUF6x96wnL978mI5Dh
	vc7hpYn8faQJy26kDKhJHq5jZjuXuK8Esq2OX8dAEcFe4Hz8EbDdIIvULFxsqbl8
	c+RS666Pen69Dm81jrWbJw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3pda4nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 14:34:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54UEIx7c023101;
	Fri, 30 May 2025 14:34:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jd3e2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 14:34:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzU0feonCAPDJSh74s4RuXg5Ve0GETy68e8Acisjk3OCBYWRVjPTwr4+YyIe55m05fM1uskKgC0lGJa8IvfqUxVq2hOQjkeYGvvoWnUTlCijgLIYEnvJ8vGwCMTucQ4w8os3Cgjo/12+KxdVlL0XRzAWyqpTuP/r6wnBgSnVAhRigODwWTAtH/sPPqyZFhn0bAOKmgw5AGloCpSvRcAatIFcrfNCnO83F21vMBfM435uUdUd3079PsZvxzr/LxjYikG/YPjtldtTFip6PuU2cEeSME/+vrQgXKjfRydGXLWno5kWDx9voYt9H5/6CJ3WQNuMBmiYtmUIoxZ8L/583w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9rluFO8ffN+GQZYACjsZoa6BNiHYTrZUfoqv+g2XRk=;
 b=LZynu4chrH2gbf/JKNKn8avRqYDX4jdcQ10u1CqLmuQARauMQwG+uivtF1DjGycGyhuvn1oxS8llJbpbtDOSpLWIwpU+y1kgmSSMg8uILgfJ5gSNCgevSCxs7jICnw8xky2GYtY61WwGSS1mSNoBmYoFZGyAM2XmmqF2LNiQhyqHftSVXUtfiX2piqJ6/WMqmb4M9U3CEf2tf6/WP1/LuFrbDQeQGYAyREtNZOIlYhygqM36YuwNov/mCYqWR0FTfemc3iBrXMvShrBdsCNwVXLFTAmztBeL8ZlZb/X9srW1j96JlrPCFoUS2p3AvRJSnaA7oa/JmjPCTkjxo2v5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9rluFO8ffN+GQZYACjsZoa6BNiHYTrZUfoqv+g2XRk=;
 b=fX4ZZ5wfdAEC0YHhLHhl1Iu5Nd00s5hkJi/wpk1YsNCGAmQRy/4woA1rrIdcgIYVZMALZ0jRiqyjDly9yPBlDEnaNp4fx7rGC/RNFo2gcy6n/bFWvOiJh2aY99UAqFL2fmF6MoDuHiRWHu7LwfzqNH28BdMLVP9HzhBukcsctAw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH3PPFF6F8BBAB5.namprd10.prod.outlook.com (2603:10b6:518:1::7da) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Fri, 30 May
 2025 14:34:14 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Fri, 30 May 2025
 14:34:14 +0000
Date: Fri, 30 May 2025 15:34:11 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jann Horn <jannh@google.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <002aa917-d952-491d-800c-88a0476ac02f@lucifer.local>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
X-ClientProxiedBy: LNXP123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH3PPFF6F8BBAB5:EE_
X-MS-Office365-Filtering-Correlation-Id: 677e7016-eb89-45bb-8337-08dd9f870cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjlkTlc1OUk2ZU05eE5VTUpSaVc5RHgvN3VaejlCYTUzNmZyeDcvQWtBdkRq?=
 =?utf-8?B?OTNXcnRMWW9POHZTMDd0dEx3OHc5OHcwdkwzWXdmTERoRnVCMlJ6TnN6VmFj?=
 =?utf-8?B?a1dNUlc4dFA5V2ZaM3NTRWxWck9xU0psc2xVTndFV2FuQ2tTRUx6UVV6S1Zh?=
 =?utf-8?B?VXpRQjRsUTZ3MTU4Mlh2d2srMG9sbXdiUjVodVpIdzlhcjFJQjR1Z3d5VCtF?=
 =?utf-8?B?QkwraXBaaWtjWnJpcTF6ekJ0SlJxUHJqSGtHWVZ6Z2dlRWtWODNHdHFDRVZv?=
 =?utf-8?B?WWRwRDJ6Tm5FZWtvTGVobU8rL3VmVSthZlgvak5Lbm5EaGRmNDVVOTFoNE85?=
 =?utf-8?B?azBjU0doV0xtMXlFS0FVNllucm0wZUUzWUY2UlhiVXQyZlFrc2M3a0VyOEpT?=
 =?utf-8?B?aHUxc0F0TmNLTDdEc1BiUHMrUWxGa3plQ2krMU0ranRwK0Rib2h6K1V2UUtO?=
 =?utf-8?B?VjhsZnN4UXEyWDZBWk4xaFd1NVpLWU5CZXkwUE1lM3BJczRCMkJZUEVoY0pE?=
 =?utf-8?B?Ny8wckc4VWFaSmJkL2h2ZGwyNC9LZ2FlWmZOZXpJcEgrWEpxTlliUTByTi9V?=
 =?utf-8?B?eVlSMXIreFFOMmZXYnpRVG4yTzk5T0pLa2tDRzlXV3Uyc3FzVTREdU13T2Z1?=
 =?utf-8?B?MkJPR3hKejRzTU5hY1lvRElSNlBJWkEycU8ySHJTQ2RMRUtpZWYwM1ptV1lk?=
 =?utf-8?B?Uzk1L1VHMHBBREYwYWZyQnMrTU1ITTVaZWhoTko2V2dSZDNpWGdoZjl4WjRN?=
 =?utf-8?B?enlsei9jMUlKWlRzem84NGIwSGhVd09qZk9SUm1sT3E1Nm55YVM0SFBXTVpz?=
 =?utf-8?B?Q0R1U00zZndJTSs2bjRRV29mRWFRdFpxS1hWSHAwR0o4dVlUclZQTzZLQmFV?=
 =?utf-8?B?WkMvdXJsdVNQbG0vb3phZjlHbDhsM1NSUXJMQ2lwV3l1VXRwK3NSKzB1TWxQ?=
 =?utf-8?B?R2JORWR5Rk9LbC8xWXArdUlJejBXT3p4Vk1HTlhXcVZ3N3VMMHdVb2pMQXV5?=
 =?utf-8?B?ZmIzU0lWM1VicGQwK1E5Yk9MUHB5NTUyR242LzRnd3Z4QjBlYTN4MU9OWGE4?=
 =?utf-8?B?SEZHeUY3Yi9DbjU0ZncyVWNGNlFKK3lVdVJXSnRCYTh3NkhoelZLSVFyZU1B?=
 =?utf-8?B?RUJKSU1ZcHJRcnBaZGR4T1ZKVmh5V3dlaEdjbVFkMjVIeHlIRGFqeXZTTU9T?=
 =?utf-8?B?NGg5ZlFWM0FGRHJuWEY4a1lNL3BLTWlreWNXNTVrdGMwaVVUaTJjb2JDWVdL?=
 =?utf-8?B?N0I5SGliMGJuTlVUSG10RzVXOTJ2a295SzE0MC9NTkhYbW01aG1vd0dEMWN3?=
 =?utf-8?B?UWpXSTU0VDVWM0J0aWhQWTV6N0MrV2haSFJ6a3UvdjFRb2NvUXJKM2xIcXNB?=
 =?utf-8?B?RjR5amU5bUQzdlhHby9oVHpDclMreUdpL0V3Y2M3NTAyZXlwR0U0dWVEWXlv?=
 =?utf-8?B?OW1ydVBjalROVXlMQWswWm80ZkFuZVI4VDQ3VzRwY2l1bW80VlViMlVNK1F2?=
 =?utf-8?B?ckNSN0RpWUNvODdjWkJpVExvdTdRcmlhejJpek5hQkNFYlkvaWJmckJNeWNZ?=
 =?utf-8?B?NWNZVGQyTXo5dkdYY0ZoSmZwM1dMbmFaYWNoYmZOUnpYc0xBamttUmhZVHhq?=
 =?utf-8?B?N0VsQ3AyTW5JL01BclVuaFdrRTNraUtjdUpzaXpuSHg1NWFiL3pHMU9rTkJw?=
 =?utf-8?B?UkRNSVJSbFV5eXdqZFcwWVN1alBnMVpzSVJCQThsWXdETjFaTUxOblZkbzRT?=
 =?utf-8?B?aDdLNWZRS3VKMDBCTjlFdGdXVEZVUHpQRWtKVnhOeStHVWNJR0o3L0xzM2JK?=
 =?utf-8?B?N1AvNUVRSWoxK0lpTEVqM1RFd0RWSnNEcWovWERZaWlLSm9uUkgxM2tkKzdi?=
 =?utf-8?B?YjBQdFdOV1JLRHJUSFBPSHJxTFVtOFN1V1B6dUFlYkppTE9MM2wyN2hTaHl1?=
 =?utf-8?Q?dlpQU6nFLJg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnNhNUlSU0lROWNaYWl0aEFxamZnSTE0YS9wMHpuelRtbXBvMm5DRGpMUUla?=
 =?utf-8?B?TStQQUliWUdacE1lcVU3UjlxazZzNTJDN3luZVlWQjY3MG5zMzdJOFB0VzdJ?=
 =?utf-8?B?UGU5YVExQnlHaGtsd0x6azhVanVhbWFKRmM4OHoxdXdoMXIwcUFJTWFCV1Q1?=
 =?utf-8?B?Q1p0UkFLZXpWVW5XSkdQbDFaRW92M3R2bFBORnlOTGhiOHNCWEFhU2sxN21x?=
 =?utf-8?B?ajBhVGxnNTZ1SGFpSHQ5Vno3eVN2MDA5SmZpYjVtOEFHdm96SHhhY0U3cTRH?=
 =?utf-8?B?VW5FaVJGOE11cWlka3lTSXllQmxtMVhTNjBrWFNNT0U2dkR6dVNIdENRNHA5?=
 =?utf-8?B?NU0xY3lVK0RscUpZbUpQMUE4WmIwQytIdXNxM1U2a3NPMXdxbVl1L2wyV1Bw?=
 =?utf-8?B?UXZUb0xvOWUyTnhOZTNXYjR5dHhTcFVZYnVaSERjT3RyUmU2NEVyMEpBUlN4?=
 =?utf-8?B?VlpyaHIyRWNTYmxyVGJKdjFlVW5jaHJPeWY2NEpWaWNsMlRUalM4eW5SUGNI?=
 =?utf-8?B?S3YzYmJsRThuYTVwSXNtZ0FrT2VLNlBpYmExMjIxaTZwbm5takFGYTBVQVd1?=
 =?utf-8?B?RStHeHlYRGttYUdTWFQzdUhuZ21JOHRKSExNZnpUNElDTUFIUmhtaXhKcFoz?=
 =?utf-8?B?Y0pvMWFhckdqNUZ5eENlQTlEaWZaMjRaR29adlpKUnJiOEljRmFUS3Byck55?=
 =?utf-8?B?M0w5TWNJaExVQVR2TENRVTQyM0JVWFZrMDRlVFlBMjNSZVZmWGcyQVJLaWZh?=
 =?utf-8?B?OFY1d0REemdxR0FhU29oTUZKakFDa1o5S0RUMmNkWTNNK2FhTnNuUW90TEZG?=
 =?utf-8?B?R1AyTjY3WW82dURFV0p4eTZkZGJqeVFoTWZ5Y0pYTFNMeVRvczI4aHFqbEZz?=
 =?utf-8?B?Um11MmdsbnRDRmlVMm1wRURxb3Buc0xERk50aVlOb0pnbXZwN0NiUWQrekpE?=
 =?utf-8?B?THQ3VndpeE5WVjZIUnJ3bTZqRHQ3MWN4dUdEdis2NXQyYjRyZUcySmtTdzJN?=
 =?utf-8?B?c0wrZHo2L0ZVUXp5K0xtdUZjdGZrQ3luTEUzVWx1SHhtSEliZ2xUNzJPV1Bh?=
 =?utf-8?B?RmRocC93RTVCdkhyMDJKbEdFenRUeVlIdHQyeERMcGk3bktJZmFLdmFIYXNP?=
 =?utf-8?B?bHNNMWJMVElkMExGdGZkU3B5SllNZ0ZQdW5TZ01ZVFduWFR2MGh0SEYraE1P?=
 =?utf-8?B?SVNBcldwQm84alpDc2NPV2JzRkFadVA3U3czR1V4QXpMNG9ML3RYRlBtcXQy?=
 =?utf-8?B?Z1k4MUpzZGw3dFR3dnpJVE5zUGE5OS9HWmZFTmpxRlZobVJaV1AzQlpCYkt4?=
 =?utf-8?B?VERUYmtQblRqak1RbnJCNmtPc1Z4aElMZnNVcis5Z3lJYTlZak90bzZBSlJy?=
 =?utf-8?B?M2FUblRnVWxjbEV2MmhmZTFuaEQ0dUR2bWdhWjJEejlwQlg2bktPeXVPSlU5?=
 =?utf-8?B?RDZvU1NCUDl2bEVSVDVQd0lSK2tSb2U4cUgvVnZxKzllOC9YSGdKVEYwYnR0?=
 =?utf-8?B?dXRLdzg1eVNxWmM1S2VSTUZBK0s0ZVA0Sy8rak0xcHlZNVpRelRXRWUwMzhG?=
 =?utf-8?B?ZXBSNm1kM1RJWTFYWTZSRVB5cm0yK0NkY1ZISGduOVRNSWUwN0M4dC9DMWtR?=
 =?utf-8?B?NWkrMVFJangvYVBIeFRXOWMzeGJjaGxlQ2J6aFRVb29QeHh3TEF6Y2dWN20w?=
 =?utf-8?B?YndqZ1ArWGtMdDMrRzVXcXBseDZrSXY0M1d2WFJUeVRoZ2Y5S1NwanczamJ0?=
 =?utf-8?B?OGFQSjlybko2MkFUU3Q4dUt0cUo3VGVpL1VuM3d6SmdxUzQvU2tSMTNWOFRq?=
 =?utf-8?B?dFJ6NTM4cDVQVDAxcGQvTTR3RVR6dFo4RGpkTmltT0RSaGszN3FWbEUzeUFN?=
 =?utf-8?B?a3FsNk96TUJQQkw4bmFYTzZZRzBRVi9DYXhzOVZVTnh6Vy9MMjVEVVlSdTZx?=
 =?utf-8?B?MmgwQnNGS3lDYTlwSExHeWpDMzdnUVVNN2VvRnRBWDlGdk1kM3pYb0tJOFZV?=
 =?utf-8?B?aHlMMXY2ZkphZkNjNVlCcGxKMnZ1QXVydGVqZUQrY2hzeDhhOGtTcG9xSlk4?=
 =?utf-8?B?Ynk2cmsxQjJKOEtTOGtYNEJ2K3ZiUFlBc2c4TkJWTjIxc1ExNFZXbGhWM1Fu?=
 =?utf-8?B?ZlZ0NUhMWHRnZmV4OTF6R1puVnYxRmU3MGdhRzhCQzA4TkZqSXFRZnZBeFJG?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FO8lRQVhLMQj9/KGtBGSsJCp3v2wfZUGN3wXwBdeStEC8KR7w1ZnYT8nLsO4HN68R/tYY9CxecRQYShO4PCTiB+omajSpX1/5BYNMUva6gPme65kIowErCeAyzUvKZuOsSpXXzllSj0J4rz3Ad/Xu98tv9NBu7IDPRe1JxzSBRid+cHIC384Jg/E2xwGYnKX8xXBc/AIlwutvHZ6V+lnR0s7fLzKopR+6HJQ8xRz54wogMmcuG5gF5i4veOVksUIVzCfeml/EQ0sDSB8PbQYX19SlHXAYcuhWyKIgotVSXzh/qSefiuxW05F9FBO0Fzbv6cvhAQled8lneOEKmBsWbeT2pUwPojUbbBtaW4bN2JMK5eMu55rFYXK4x28Va+jELV/DRot7VA+TvLykgAakMc6+ZD6FkH1fDjswXZ6ZV08NyTeMIUpchhfCHEiHLBTc+lirluhFLYCBDmBPQh9m3g2Elaadt6+hpY6hHuvWq+6OKTWAllq6eJ7Qxpttlmc3SC5wN4DPU4u3IMAuSPYwsHzm73h/eG7GUBGE7Qc3OvitSUMYveCiQS+/9uIc8AZpBvMzJV1eUKXo9PUoa9iHTw6uyubbxA9YnB4rr3czOU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 677e7016-eb89-45bb-8337-08dd9f870cab
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 14:34:13.9345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbUhZM/J+aVZPC60WxdVroJ1c7gJZy45MZu+QDdZkzuqKLcCadBhEYWnpDJyH6mVMUcgmtT7EGaDltM8WP7aXHsMQMBd0KcPrE5iXrLcUTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF6F8BBAB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300128
X-Proofpoint-ORIG-GUID: bH_DH4S-t8fRmV5_Q1haZ90CYYg_ipSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEyOCBTYWx0ZWRfXzc0q2uCpSskh g16B9lAQfW29+lEYqyAzxJLqTDq3x3vDJrSZQ3Dr6OPRQGsfHMf//wVZn9rNDPhfVc+m2QBBriG jef43KV19bI6wCI8LHis5vx/H8Bu2O8M4lySHCuuPLNxSmjHgbyLrXx3yqw96h7l0urpYd+lCr0
 T/xWnl7bDAytGFYWJ7SRz3Hhn6bskt04G5PRLvVA3/JRbYVXB5COpfp3U0vSRBmwW8medOth/vo bDffIFvr00rU/cGS4+28qPjDu8EwA9zdSzGShV5VvdEbBjCN32nNXufjNBLC2hIRxtfFTLZ9w8i klFtvycTx/H4DXhnIYopwsi1+32St/NwRJ5qmZaDYCjYvRcuZFrUtLc8uH58xz/WameY2OJ4DX3
 +o1dSStF57La1ltharIADMjXXtleIz9B121Ib+wS14p+qz2cVJ174033XKi1IAmeVBfWLpcR
X-Authority-Analysis: v=2.4 cv=UZNRSLSN c=1 sm=1 tr=0 ts=6839c1f0 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=A2pY-5KRAAAA:8 a=Zsr_yqEhAbFuLJFsmckA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: bH_DH4S-t8fRmV5_Q1haZ90CYYg_ipSe

Barry - I was going to come back to this later, but Jann's sort of bumped
this in my inbox.

This implementation isn't quite what I was after, would you give me a
little bit before a respin so I can have a think about this and make
sensible suggestions?

Thanks!

On Fri, May 30, 2025 at 04:06:30PM +0200, Jann Horn wrote:
> On Fri, May 30, 2025 at 12:44 PM Barry Song <21cnbao@gmail.com> wrote:
> > Certain madvise operations, especially MADV_DONTNEED, occur far more
> > frequently than other madvise options, particularly in native and Java
> > heaps for dynamic memory management.
> >
> > Currently, the mmap_lock is always held during these operations, even when
> > unnecessary. This causes lock contention and can lead to severe priority
> > inversion, where low-priority threads—such as Android's HeapTaskDaemon—
> > hold the lock and block higher-priority threads.
> >
> > This patch enables the use of per-VMA locks when the advised range lies
> > entirely within a single VMA, avoiding the need for full VMA traversal. In
> > practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
> >
> > Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
> > benefits from this per-VMA lock optimization. After extended runtime,
> > 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> > only 1,231 fell back to mmap_lock.
> >
> > To simplify handling, the implementation falls back to the standard
> > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> > userfaultfd_remove().
>
> One important quirk of this is that it can, from what I can see, cause
> freeing of page tables (through pt_reclaim) without holding the mmap
> lock at all:
>
> do_madvise [behavior=MADV_DONTNEED]
>   madvise_lock
>     lock_vma_under_rcu
>   madvise_do_behavior
>     madvise_single_locked_vma
>       madvise_vma_behavior
>         madvise_dontneed_free
>           madvise_dontneed_single_vma
>             zap_page_range_single_batched [.reclaim_pt = true]
>               unmap_single_vma
>                 unmap_page_range
>                   zap_p4d_range
>                     zap_pud_range
>                       zap_pmd_range
>                         zap_pte_range
>                           try_get_and_clear_pmd
>                           free_pte
>
> This clashes with the assumption in walk_page_range_novma() that
> holding the mmap lock in write mode is sufficient to prevent
> concurrent page table freeing, so it can probably lead to page table
> UAF through the ptdump interface (see ptdump_walk_pgd()).

Hmmmmmm is this because of the series that allows page table freeing on
zap... I think Zi's?

We need to update the documentation on this then... which currently states
the VMA need only be stable.

I guess this is still the case except for the novma walker you mention.

Relatedly, It's worth looking at Dev's series which introduces a concerning
new 'no lock at all' mode to the page table walker explicitly for novma. I
cc'd you :) See [0].

[0]: https://lore.kernel.org/linux-mm/6a60c052-9935-489e-a38e-1b03a1a79155@lucifer.local/

>
> I think before this patch can land, you'll have to introduce some new
> helper like:
>
> void mmap_write_lock_with_all_vmas(struct mm_struct *mm)
> {
>   mmap_write_lock(mm);
>   for_each_vma(vmi, vma)
>     vma_start_write(vma);
> }
>
> and use that in walk_page_range_novma() for user virtual address space
> walks, and update the comment in there.

What dude? No, what? Marking literally all VMAs write locked? :/

I think this could have unexpected impact no? We're basically disabling VMA
locking when we're in novma, that seems... really silly?


>
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> [...]
> > +static void madvise_unlock(struct mm_struct *mm,
> > +               struct madvise_behavior *madv_behavior)
> > +{
> > +       if (madv_behavior->vma)
> > +               vma_end_read(madv_behavior->vma);
>
> Please set madv_behavior->vma to NULL here, so that if madvise_lock()
> was called on madv_behavior again and decided to take the mmap lock
> that time, the next madvise_unlock() wouldn't take the wrong branch
> here.

Yeah I'm not a fan of having the vma referenced here this isn't quite what
I meant.

>
> > +       else
> > +               __madvise_unlock(mm, madv_behavior->behavior);
> > +}
> > +
> >  static bool madvise_batch_tlb_flush(int behavior)
> >  {
> >         switch (behavior) {
> > @@ -1714,19 +1770,24 @@ static int madvise_do_behavior(struct mm_struct *mm,
> >                 unsigned long start, size_t len_in,
> >                 struct madvise_behavior *madv_behavior)
> >  {
> > +       struct vm_area_struct *vma = madv_behavior->vma;
> >         int behavior = madv_behavior->behavior;
> > +
> >         struct blk_plug plug;
> >         unsigned long end;
> >         int error;
> >
> >         if (is_memory_failure(behavior))
> >                 return madvise_inject_error(behavior, start, start + len_in);
> > -       start = untagged_addr_remote(mm, start);
> > +       start = untagged_addr(start);
>
> Why is this okay? I see that X86's untagged_addr_remote() asserts that
> the mmap lock is held, which is no longer the case here with your
> patch, but untagged_addr() seems wrong here, since we can be operating
> on another process. I think especially on X86 with 5-level paging and
> LAM, there can probably be cases where address bits are used for part
> of the virtual address in one task while they need to be masked off in
> another task?
>
> I wonder if you'll have to refactor X86 and Risc-V first to make this
> work... ideally by making sure that their address tagging state
> updates are atomic and untagged_area_remote() works locklessly.

Yeah I don't know why we're doing this at all? This seems new unless I
missed it?

>
> (Or you could try to use something like the
> mmap_write_lock_with_all_vmas() I proposed above for synchronizing
> against untagged_addr(), first write-lock the MM and then write-lock
> all VMAs in it...)

This would completely eliminate the point of this patch no? The whole point
is not taking these locks... And I'm very much not in favour of
write-locking literally every single VMA. under any circumstances.

>
> >         end = start + PAGE_ALIGN(len_in);
> >
> >         blk_start_plug(&plug);
> >         if (is_madvise_populate(behavior))
> >                 error = madvise_populate(mm, start, end, behavior);
> > +       else if (vma)
> > +               error = madvise_single_locked_vma(vma, start, end,
> > +                               madv_behavior, madvise_vma_behavior);
> >         else
> >                 error = madvise_walk_vmas(mm, start, end, madv_behavior,
> >                                           madvise_vma_behavior);
> > @@ -1847,7 +1908,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> >
> >         total_len = iov_iter_count(iter);
> >
> > -       ret = madvise_lock(mm, behavior);
> > +       ret = __madvise_lock(mm, behavior);
> >         if (ret)
> >                 return ret;
> >         madvise_init_tlb(&madv_behavior, mm);
>
> (I think Lorenzo was saying that he would like madvise_lock() to also
> be used in vector_madvise()? But I'll let him comment on that.)

Yeah I"m not a fan of this implementation it's not really what I had in
mind, as per top of mail.

Will come back with suggestions later.

Thanks!
