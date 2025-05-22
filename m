Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D6129DB67
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940870; cv=fail; b=Q2i7FRy9m5ZlNAorkC7/0HmAzHJe9JnM01nb7H9m5ut0Yy+zZSBBckk5sgkjk64xr8h92Y3W1Mo9jV81w7pe4yh+t/4P3Yj2+rkVdENf3H50U8rxKYIW7TC8hd8NwxoPctfVWMaw6hMv6mF6HR62PkiO1jcRU2K0F78lT1Ab3is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940870; c=relaxed/simple;
	bh=ajHADWz/9tPhdv8nNMF9ekM8FORh/5gtvq1VQwjk8r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RL8DUZMMdPgwpA6l+kViMBHfk4BDDbzDE36VM1Zf42Roqqc/WgCgn1SWsM86Ex7AikTTnkd56OLnKpUWDBjv9GzjxUy1Q0VtukuRyOhGbW7kbox/Qreho03RdFTDmv8M8hFjU2uzT50dYZX9IB50JOWvHd2i0Kn1HFYLvyNyfsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U9NVSl6G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qcQrRPkq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U9NVSl6G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qcQrRPkq"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH0wdE014512;
	Thu, 22 May 2025 19:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ajHADWz/9tPhdv8nNMF9ekM8FORh/5gtvq1VQwjk8r4=; b=
	U9NVSl6GFL4bWrObrEBwCroSBbRT0fgGhbhAe8aBrVCt7qy8m/+ome1OQR1AkWXr
	YHK22xtirb8mkH7IotpOXFxj8AXPGoB1SOJGbODy6m8sAcaCiRRkZW4JJwJ/J3eq
	8QD0Yg6mJMnXXhfYTlIXU2L06URj+JNen6ymFIPMJ+Q9aybordNJsEFSPfB5llYJ
	93MbaB4ownsZ/FuszxYiBBeOsYMJoka6qWAZM7Xj48UE+JxqhqLAaXVtsVmmiZe1
	2vLSeVATmQEiGRWZhZmM4jn+tMFX8eXTXEUcUWKkDznPJ55qxXn4G6ja27vEguwH
	4obEpdAfkt+oe2e4WuNvIQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t7838hf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 19:07:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MJ5MqO034633;
	Thu, 22 May 2025 19:07:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwerjwgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 19:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smcdlvL8LiDwy8xTvO15uTXNcWCEHCAzIgX27YkzYdxj1h+pAlqwjpfccbI6XgIBY6nohQ+p+4aMyeR+veCZSOsYzJauAnzKiYhnz6qcOD0tCuO8g9YTdrJ6hrTM+WUBWZvrXIGVZCeGNqVGGY5aU20/4KP3DmYi92FIq/MWJ0SWfDEe60a1f3CtJl8G8BJX4tjTxNU2r6RvKmZDyvMIjt1JZ8L+ODkKc4TQ5TZGsM61dG4OX5z0HgfBV/u/1vGBAm83nqXL+bFJZ/Dgc6vI69+pWc8de5ImT8ZVssEfQYlgHgQ0GjIeHCIS3qnDYWvWOehYdfh8k+xnQnRHAvZcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajHADWz/9tPhdv8nNMF9ekM8FORh/5gtvq1VQwjk8r4=;
 b=u4mndmSdcatKdWKjsKjIXxtxNE2Tb/KSxp5OZZdhuj5U3Dp8XC+MEPAmm7FgDcsOkG6ztEE2NdAriVx/yZt+r9r8M4/DZA7PzbZPptIaCL4Xrr5WhNilJv0kI4pBRMOTHe0EgkTZT/Nij/IcNLVwl30CGa61WMxKbV3Ei8OLVJUECSiAnHnuyt50QZdXUveGTesVxteyqnnruF7sYdYBJC8KW7LJn+eUc1CotUFHo00moclUpWZebyWx+S3EoWsHg3vFO1Zx1X7Xe3s29kVhI1VbtGm3CrWH8y74rBmnZ+0suySS2RQ657hQVDqjCPejKwhXRcD9TTL97HB2YA0KPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajHADWz/9tPhdv8nNMF9ekM8FORh/5gtvq1VQwjk8r4=;
 b=qcQrRPkqiRk79bDG9SJw1FhH3kgvd5qMRH5UuRzkwp+LC6gNcI5BvrOHLIBRm4Ueu8aYbhgaGB7wS10XeCiQNtgXeyOWz4lzWupX3pjoKmHkCxo5EujJZm2DcfdaoGfSm98IO+Ad0qYQ5kn/MkRnXc7v6b8PV799vgd6p0mPLJc=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CH0PR10MB5178.namprd10.prod.outlook.com (2603:10b6:610:dd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 19:07:09 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 19:07:09 +0000
Date: Thu, 22 May 2025 15:07:05 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, zhengtangquan@oppo.com,
        Barry Song <v-songbaohua@oppo.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Hildenbrand <david@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH RFC v2] mm: add support for dropping LRU recency on
 process exit
Message-ID: <iozdmu4wqtmq5kbd5d3j3f6xim5tsoqwymbdoo3c6v24p2xtej@kiedlpja574i>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, zhengtangquan@oppo.com, Barry Song <v-songbaohua@oppo.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@infradead.org>, 
	Oscar Salvador <osalvador@suse.de>, Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>
References: <20250514070820.51793-1-21cnbao@gmail.com>
 <xymq3lezzjc3hzh2eduogqpn6okrbbkodjdwu6ylpeszakb22a@ck6yhdfdcayq>
 <CAGsJ_4yKpRv392rbM=insAPZMA-cwvTNbcPzGAEycfPDzsbJZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGsJ_4yKpRv392rbM=insAPZMA-cwvTNbcPzGAEycfPDzsbJZQ@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0035.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::17) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CH0PR10MB5178:EE_
X-MS-Office365-Filtering-Correlation-Id: 608e4bac-0f29-4937-4926-08dd9963da09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEZOOW4yWWdaSmE4M2xvSE85Tkx6NjJBcHlrUHJzN29JR1I5OEhPSW8rR2RC?=
 =?utf-8?B?YzF2RHhvNnl1MHlLT0d3Q01IajFWZEh3WnBtTHVBTExiRlBIcDRwZGJuRmd5?=
 =?utf-8?B?Wm5VVkVEMVp6RFZ0N0ZubHZSUE11R1pBL29jR1NLNzJvN1JlUkRYV3ZhVXRW?=
 =?utf-8?B?NzBwSkJpNnUxaE1tUUEyaEYwZjEzcGFuSW9zNUJ3SDg3R0V1MVNpdkt3cjBq?=
 =?utf-8?B?RjA2UkZubUd6SVY5TGt3ckluck1hTjM5NWhwQnBSQTBEQjJhQXFPNFVON0VV?=
 =?utf-8?B?Vmo5V0ZDYkZVYi9DK3BxTTF1TS83endPVGcyazBibjNZWXhleUZCKzhnVlFz?=
 =?utf-8?B?dEZ0UUkrT2hRdTNJR2xwWEFIR0dmQ01XYThSZkI2MlFhN3BpZWdrMkl3aUor?=
 =?utf-8?B?d1Jnc004OHV1S1VlaHlOc20rTjRPRWlnVjRpL0pmcWZqUDEvRm04Nm9kbmZl?=
 =?utf-8?B?MHhGZnZxcnlmbVlWT1NZQUJ4OVN3RXY0MXBqYW80NWN1ajJoRGVkRzlBcEFX?=
 =?utf-8?B?WFZIZzNCdkFQZkVPYVpEaFhDL2U5RW9BKytrbXoydWs0d2U1ZFprRVVQemJm?=
 =?utf-8?B?VmlSMmJTM3l1dzNYZUlOVm1HNWdrcG9wRXQ0SmJsUXBwOU5RZjB3UTNkckhW?=
 =?utf-8?B?aGZXRERBSVp4bzltQVJIYW1OcGdpSEZ5dDdMSS9tbkJ2V2t1NjFYQXp1ZWx1?=
 =?utf-8?B?dktiVFUxdldZOXFrRnlaWHhGU2hjWHdJUEJWM25tYXJvYW1MTHhMeEJnbUdi?=
 =?utf-8?B?NkdJYk9GejZpWTR4RGw4VVdUKzlTQ3R1c3FPZThHa0xxcytvVXQvRHkxazBw?=
 =?utf-8?B?ZCtNVCtNNWNXcndjZkdXenFZanIwc1RHYXdpMHVORC9GdkNleWJjUCs2WkMr?=
 =?utf-8?B?VXBuRjMrc3NjL2V0UGhWbEFYeTlkQXpzblcyOHEyb1RxckNrZkdkYjFETExm?=
 =?utf-8?B?YzlyZ2IyZmdmNkxLWWhxcDNvRUZLdS8zTU43M09ZRTVLakN2WkFyZGIxeDI4?=
 =?utf-8?B?QlRFaERQYlpaa1BDTHRrZWNOaXFSbmxVRW5yQWh6QW1wY1YwRGg5OE9HeFFu?=
 =?utf-8?B?VHNhQ1RqY0IyMjIvRW5UR3J0RlE3dUZzRmwxK2gzdGRlVnZseWp6elFGRGRU?=
 =?utf-8?B?cFRCWEJlekJTczAydDRhQ0tFUDdsdGJOTVllOGo5eTNVcGlRdUtPVmlEck1W?=
 =?utf-8?B?MjlSVjM4bVByUWJFUU1wRTh2VnRWbmlLQjlnd2RmM2ZpVmpkNGlXMGhQK09H?=
 =?utf-8?B?d25id3g0NWQrNVB0a1pwTFJRTWgwUFJ5UXMrd0FBNmM4VXJDK3JqcDRrYnBZ?=
 =?utf-8?B?WHZGNUtwc2l2d2NyMWtRYmZINzJWYkg2T1lmeFBacFFaSDViZjJOVzZkN0dD?=
 =?utf-8?B?UVpXUVgrZ3ZYMG1PMlpESjZRVUtyanlZR1psMVh1aWY4blNzRWoyaUdsTits?=
 =?utf-8?B?N2NyQlAwdHA1aFRTV1lvSFBEa2xoNFErblFVcHZrM1hnYUtGUnltbWQ2UWJ4?=
 =?utf-8?B?ckRzRzhVREVtRDFhbVRpU1cxdUY4QXZCbDMxWm05d1FHeGN6SUk1RVJEOFkx?=
 =?utf-8?B?bDJEbkxpVlJiUXhCN09lY3c1N0JLTUMvWkNUWmpmVDFaOGtkMkIrUzNySjVo?=
 =?utf-8?B?K3UrRXFMckJlVzhEL2Z4ZFkxZTZXTGNtRndUSlBSK0dRdS9OR2RIRktlZEkr?=
 =?utf-8?B?WFpYa0N6b2V1aHFXSVFxbk8vbitJc3R6eUFQMDdMenNNOFNabXNFVWJXWk83?=
 =?utf-8?B?bzZlZ2N1cGRZbEJDbnV1QmNZL0VNQ0I4WGI4V3YwRDNNU3BEMzJqUnVRY2Jj?=
 =?utf-8?Q?Qzeiy293hE5ziRk0438PrkaowaTvl3CivxMTw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHJxR0VDY1crREhDNjAyODVHMzBwTVJzTFpnTHdrQnFnNmtOOTFlWXkzNkdM?=
 =?utf-8?B?N2h3SE1aekZCd1A2M29NR243Mm1Bb3IyL0FyNFRBczI5VHp4Ull5L0NuUjQv?=
 =?utf-8?B?aXgyc0NGZ1JpL0t4SWYvaXlwVmhDK1BReitLN2V2cnBtb1N2cDk4aGlZTVM3?=
 =?utf-8?B?TWhqSXBUT1o3cVJYekpIbmkvRys0ZS9LV3JqMFJiZjY4V0ltSTlFRS8xLzBw?=
 =?utf-8?B?VW9EaVRpbGVnRzVMdE9tekp4cTlEYzFhKzU2aG1EdkxVQ3Rjcnk0NjBlUGRC?=
 =?utf-8?B?MC9DdzV5czJ2RVc1Rk12T0twUTMzN2I2OS91ekNYQWxmSVlCbFdZQ3IwTEZn?=
 =?utf-8?B?WDdwdTNvdlRXNG9PRWx1dVE4RHBYTlNjeVp0MHZJTXQvTVlkNjJ4OEVFSEhE?=
 =?utf-8?B?U2pwaUttdHVyOXdBdkZBRUh3bDJNcUp4ZHc2cXE5eEtKeTRFWU0yYW5rZkFt?=
 =?utf-8?B?UnZJTkZWYkdHcExsWkNvWHgyNlVSay8rYnA2T3VPcndlRTVSTzJoTUpKZUlq?=
 =?utf-8?B?WDlYVmlzNjhaSVBDTmRCZytKMnB0ai8wc1MzS2tsWVVwYmpsc2xFNHo1eTZ6?=
 =?utf-8?B?NXUvSFd0UnNDMzI0UURlRmlnWjUzQXJoZm82NG9jdTZqSzdzd3RSL2s4V3VE?=
 =?utf-8?B?eG5YS3ZQc25XZTVmYm5kNWYrei93SHZYYk1PUjdwakVWWDVMTDZNekMxSmw2?=
 =?utf-8?B?dE1GTjJKK0R6UVRqVU1BMmVpdWZxdSt1ZGovbnhITFhpVy9Idkl1TzFjbXly?=
 =?utf-8?B?UVNyRGNoSlVqZkZXb1JuMFlyR2JSOVh5TWxZaWZWL3dLR3N1czd0dXIyaGdC?=
 =?utf-8?B?NmFDUklYcEthZG9xdWdYRjM0WlFwNTA3Rk9hMkZQRTJFY2lWMTQwUjU2ZEN3?=
 =?utf-8?B?YUNqeVZvU1RZazhFRVF1N2I1RVpiTWl3aVJtRVN6M2JKTzV0T05tTVJvMkph?=
 =?utf-8?B?dVZiTnY1UldEZFhqVGg1WjlMWjhrdURPNG5ERGM2Qmg3OWQyMWtDR1l4S2Jv?=
 =?utf-8?B?NkRPNEtFTm1XcW9xSWJNaEpPU0doR00vWEFXYVhTSitjWnBPYnFKdS9oZlIw?=
 =?utf-8?B?VnZjNWRuR3krbzdHMVphOFdidGtnUDZMR1NnREw2eWhIc2psM1F3UXZOY1d4?=
 =?utf-8?B?aTVXajhVTW9yME9USUt2Z0JQZFJrcVJta2RXS0tCVWQ2U2hVRTRtdTBheSs3?=
 =?utf-8?B?NnVZOC9ub3V0ZDFNQTRJRXU3d3Uvb05WbzFZMXB3ZTRJaDdqbEovbXFmQ0NB?=
 =?utf-8?B?UVVNRXBsUG1qQ2RqY0VRQlpzUDh2dWJ5QTFlR29aQWNkbG40TWc4dmdaNzNO?=
 =?utf-8?B?NGRkaVg1bExPUDgvWGx1QUZDSWVheGRvZ1FBM3BkZjJPNmgwV3Y2N2NGa0dw?=
 =?utf-8?B?R29Mb1BiNGlXalpNMTBtOGFFYVUxU3NtSnZ3VFl1K2xOMjkyTm9jZkN2c0NM?=
 =?utf-8?B?NHJrdnlYLytjUEQ0cUh3OUo2ZFpoREtYaVo5RWFFeFZSUktxN21PNnQzdFky?=
 =?utf-8?B?Z3BWdzN1R3kzS3loR09TbFk1Z0JWZEJlYk5icU9xaU9IVitraWFRTmlqKzNL?=
 =?utf-8?B?L0JCMHZKNzJzWGEvRDREUzdEVnlBZC9xbm5WbGllQks5TmZicEYvb1BhTDcr?=
 =?utf-8?B?a0x1TmNrdzg0ejdDL2FzMkxFbzQrUStub3U4QXVWZzQvaFh6V0NzcTFJQlVt?=
 =?utf-8?B?OTNXUGFETjY2S2ZLOE16THExbkFPZVAxcVVvVk02aTR2L1B3bzArdW44ck1k?=
 =?utf-8?B?NGlyM3N0SE9MZVNjVS9hTk1USjFla2lFZjZRaEk5R0Uzelpxbm1nWm5WaGpq?=
 =?utf-8?B?VnVTN0gzNm45aEdFUkFxT0UwUHJUYW9pODdGMFU2cW54VCtZVVdGYlVIMmN2?=
 =?utf-8?B?cWk5SmxxYkxtOUhpYmoySjJCbFFUaEhTSjR3d0hIWGpTQVg5SFZWZmhqMEZl?=
 =?utf-8?B?STNHZXNsblUzNEtaN1VQbFN2bG40cFgwckVvRzdwNXNnbEs4aGVTbFlGeVlI?=
 =?utf-8?B?MjExeHdHM3lFQ3JGT1JpYVJjem5xOHdDaU5RdTZZUmNOc2hHN1hxNVpybGNE?=
 =?utf-8?B?TUZjbWQ5NHpCUWxDY3ZvQlpuRy9penRmcmFsMnNUN0ZrR0xQWEh4YVQwdHlT?=
 =?utf-8?Q?7L2iXbcSqYl8J4g7PHU/VexOh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r4q0q25rkWWInFVnSSbuG3kF0ED76BAao5YGSLkSOVbmc1kf2wclCk2JJ6KoBxvP8EqprBhbBOcmoy2MSYirjK70cj07/0xZLimQC7Q6xV7raj/ZI6Zfg+1JFGUwdiM+n3lhQAfeMw82ALDJap00dz2BN4PTalo0n4rJI0STpqCyeEBdxesWXIwB3qsuxmCCM1Yv4KcsjPCpUPctwdMNO3WRu92rjKkM6qkKst86oAaNMOIMmUFdDS5+O6gybE7CrKJTgm+zfsA+esy98FrMmj0jKuXnKSVgUCzHEIw/j5pieWzyhDHpP1N9/BTAFNMR0wRi63U0z6ZFgkR42xBt+IRta2r2sz/6KJdEdg/D4UT6GdZdfZwUbG+e972w6P7GC8WrzlQX+hkehrX2tYASgarOlnyV2BvEf6peDvPf2YGfh7zXdzJD7fo0EARtGBhPs3UnW2L4VApbgzBB3lxPPF+iYdYx3pbikLReDU2y99rHLBhmV/QSj8EcbIGpzrm+fFTaogEuWzXlquk2DGtxLOexSxrTlWt0enGMd/myx6XfaEslbtHP4UHmzoxKhvOde8OdYhvTzB8nVafGrLEQhozFfFK1b2/m4vvbkNzXz20=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608e4bac-0f29-4937-4926-08dd9963da09
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:07:09.7134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WaMolnDeBQgvasfQpTUtdcZxaLjlbRrnk31rlPVzn4oI9NV25zlB7UMz4mHTd2nObFKqxQPicj6eOjoQ2e2/0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505220192
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MyBTYWx0ZWRfX0Adn/Mjs0bje kadYj3TBL9nPPGLwykc9SQMwC8eBi6WMWb8gf9NFNg0FHAsyrHsO1Wju3gKR/9CWKYWTcmSZ7D5 8eLhr0rtqt44LmiLM94urY2GsrMWAbNmiQmY+yr/5hBnUHhvFTG3PdPWgmPPbEfCG4q2hqCZdSN
 4+pWGM3BYTvApEmB7n2kdjv+jr+900Tt7pvCCxXujUWPO51vDB7hRwFwP/JdwAMnJUcfxtZqfrd 9jl0/abZ49qKxAv/PyDhCj9jRZAGZ57nbhjRqoOhFN0PDenaryWDhuN8EAJSK34gnb+yn9eWlHl dtuH1blGw10DajGwM7Pitv9AOZylzRw0pVIffljz24T/i1y3HjBJjRkUV75JnKGrVsufJQhyi7U
 F6kFCT5zkwQdseuflzloLQE5xl6iDRfhFGo31oFvHpuMnMwB8Kp7JfhRm1UW7+meDYTiKRJx
X-Proofpoint-ORIG-GUID: _wVLHjNQFqsti4oc4dxgQvov7QpHwta5
X-Proofpoint-GUID: _wVLHjNQFqsti4oc4dxgQvov7QpHwta5
X-Authority-Analysis: v=2.4 cv=H9Xbw/Yi c=1 sm=1 tr=0 ts=682f75e1 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=KYms7f0wK8eIc5LiMNYA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206

* Barry Song <21cnbao@gmail.com> [250521 22:05]:
> Hi Liam,
> I really appreciate your review=E2=80=94thank you!

Thanks.

This came up when discussing another policy type control to an entire
mm [1].

It looks like the consensus is that a new system call for memory
specific controls might be the best way forward, and your requirement
fits well into this idea.

I'd be interested in hearing what you think on this plan.

[1]. https://lore.kernel.org/all/a8aedeb6-2179-4e53-8310-5b81438c2b80@redha=
t.com/

Regards,
Liam

