Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E83C27587D;
	Fri, 16 May 2025 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747417919; cv=fail; b=CingP9vuCUT0gYTNWA2RZgx5W0HbokwSiUKtHoso74cn0xSG+/KoC3GPGa/jed82H+0cPS5muHqRt9lNPHQXg/BGGTPaHNc40VAdyRxLNoV7VrgVSDkeMThLEhuPHqMLNiArKGQOlL5ppF64ov/OpVLDkEfxJkUyguqGhRlcCas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747417919; c=relaxed/simple;
	bh=WcrWFpnGTdIcPLnStoEG2MpjF+KiVDdnfhUs8eb1GL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kgZkwSnxe2uL/vDoGME+Qe3V7VJMrdbWo6YE8VSQXt8vl7P2e/StwaGY80Fj/g1vYBGLnM4Z3GUFEgmeyt1v9X3bE/3guy9PxdOiN3ORCExl78cPHWzRita0krd2VrMoHD3kQ/nXG3wR0Uo+YLbG39Z9+mdR+rHZgGfgEQmqAAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R/AnSyn6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z0spjDBi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R/AnSyn6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z0spjDBi"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GGfrGQ027663;
	Fri, 16 May 2025 17:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=oiH3M6AFGIheCwfk07
	2WAyu4/nNOsXjFgDVT9qC4eOM=; b=R/AnSyn6B6P4vw5CStBqBDUPfG7wi/uPLd
	UTjZUvYMQlMf2LiGaAqfWQh/PkFfAKfnIZZk9pSRgBimoev+CckhOogp4H/hyhPZ
	Yqi4oEvdVd3RWsajMdh2H3RS6EH6SAAKhS2+Z6JvtB5awb8nzNM9eBxK2HZrPIZ7
	5wNRElo65Q0CV+fwraTfVqvpuxEoaOLNNtbm/JVYq/i5R3DM6qU3fZYV4BgVQrE9
	vPDffrGZhZTXt5v3TvgTW6Xts8M0CzdZAInubU8es22NMI9j79a9rF2DX3e0cO+n
	uCPgqusjDRVSQVHjdVWG5J0fdxqJdczG8Hf9dyO2Q1A49ztskKBQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46nrbh9up0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 17:51:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54GGECiT004251;
	Fri, 16 May 2025 17:51:10 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mrmfmrcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 17:51:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whydUcgZJp+ryH0+qzQ6vdl2Dxl3zErMdWPczLdlnckxrwV1cgbRxIt8CSnxPNzOo2LoxKaUJLNIXNM6qPO5yVmrLRTwq2xDq95SvNlO5cUXesE2c54LVSg6NKytiv46R+QSSmx59NCeiJhr82OU08uqU1zed2RdBIdonjQDdZ+XwHMFAujyNYOrevWqha+Cnsw5ouJoQbU/DeDu4SFPc2UQaSdDM/Vbr3VVB1lWaPKyvQhBBPw0lTud0B6zUzIPV0UlRLQgHuXrJTgxoZsmGsRiYWNARhgjb8nUaayEDmvPllIsMdz4MFsQ2x20ySAh/aOiqUb/Ec6XHV2E8kkuwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiH3M6AFGIheCwfk072WAyu4/nNOsXjFgDVT9qC4eOM=;
 b=CK0sE4xfFb1ysd8wQw0ypBMbMj/x+TT8EIsWgSIt55VnGWV525fP5IGp3BOWD5lfStaIk0ft1rV/ZmAEWuSaMnSZQWeuFIMLFMVIdo2b9JMk3ZVyCIZJ+9zgjDyYFRgCAr+d4xbEBxtxUob+PNxLN4lDnDVD7IpKtZc40t75znVOWxf/VyaIYXLE8uKfyB/w+X+rVKj4H71cmEtgKeIhcIbuH74D/a+nG7EEzazRRfO5Mn04RUXz+Qwg/Mwvqu8ORv7Ey1OB8ACMeqyh4bLfIG8jJl6yea9daerWyZeQpzfnryBBfscZIKSsZdPb2kzFuawU0826msJ7wxiuaM9HMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiH3M6AFGIheCwfk072WAyu4/nNOsXjFgDVT9qC4eOM=;
 b=Z0spjDBia6wSlMyVF+n+b4/OpZzpUxZuOKvwIBja6UKBJ65QkXQ8od9KlPkrm7oRqCYP/x8VajmQlwxS2pbEo0Y6xcw9VDICUlKBkDmFETm/Rxx1GempR/cIitRIat7Y0TFBuSLDC2bYk/Jlv1huu41q0OP6hWO9CdU4fU1MlE8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6705.namprd10.prod.outlook.com (2603:10b6:930:91::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 17:51:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Fri, 16 May 2025
 17:51:07 +0000
Date: Fri, 16 May 2025 18:51:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <df1f49a2-6796-45fe-a58b-2ea7290c3712@lucifer.local>
References: <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
 <8ea288f2-5196-41f9-bd65-e29f22bb29e8@lucifer.local>
 <5f77366d-e100-46bb-ac85-aa4b216eb2cf@redhat.com>
 <cbc95f9b-1c13-45ec-8d34-38544d3f2dd3@lucifer.local>
 <8f0a22c2-3176-4942-994d-58d940901ecf@redhat.com>
 <1a175a2c-8afa-4995-9dec-e3e7cf1efc72@lucifer.local>
 <d8a7644b-6ec5-48bd-9789-cb5017075690@redhat.com>
 <c390dd7e-0770-4d29-bb0e-f410ff6678e3@lucifer.local>
 <3284ec20-2c3f-46d0-a599-2f322b2883c8@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3284ec20-2c3f-46d0-a599-2f322b2883c8@gmail.com>
X-ClientProxiedBy: LO2P265CA0193.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: b0142a04-ea86-44bb-8ec3-08dd94a23bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SSGkshzOQnoO9urNs3/LIOcEx2dHXKGuKGTg4kv+GafZQrr5RO0ZqBgB+5e0?=
 =?us-ascii?Q?5Dk7zFICWy91WgMzwqo3yvJFC9cKeYzOxc616TAVtgygWLLKSopMRq0JusdZ?=
 =?us-ascii?Q?Jsy3mBSC7HkoexhD6cB/5LCwXD2dyeyglLzH1usXanct30V2aeqr7VPvmxn/?=
 =?us-ascii?Q?PUEyBM6HYTt4h/ZRJdTv8i/gv8un+5dUczBXOO8eGtI7cx5Qo0ssTQ4B1m0l?=
 =?us-ascii?Q?rW+bUHteBr0+WDUx/8070kvDR3IEIciIvbVU4GQYQhfj/xM29WMVd8ax+z1j?=
 =?us-ascii?Q?sa+d2LQAWlBOTcR5DjDyt8ZuoEMDirH/FqANErrwtn+iBDO6Fo1PmybCVvJZ?=
 =?us-ascii?Q?yPVhXpBQMnsr9H1/fUdHMEDEu4QMRXezWSXH11xpvQLqg/xlKyfCeMnCDbn7?=
 =?us-ascii?Q?me9QlIvKSQnWFfk6PU94SYDDBJkuU4oW1TZEw/W4gUYz7vMlQKAYII7h/ADf?=
 =?us-ascii?Q?2/5GQqtSc+mYmXjImj4PAVXVnG8upP3800mNhOgYubNI/2OE0l5U5Fivll1k?=
 =?us-ascii?Q?8WuY0K2ilvf6m53XldAwkVmK7HoPB5f7dbD5Kdf5UZynsUJTBCbA1OHwCYYf?=
 =?us-ascii?Q?Ew5bKvVt7yfx/VfmTwKqSc3EzbfzzXMws1xWekCtELNXdpaErkOmWLFo2OV2?=
 =?us-ascii?Q?JwVYKLviiM/Wq10mGA2BtA0T4KlZNsX+dGGkh3b6mnf9SpMwtJfbTWaAWlWF?=
 =?us-ascii?Q?VIDqBNIshk0CYwl/OcCuhpZlWHhPDJZVV/qk4OUPtg7l9AfRKMr2v5XPxi09?=
 =?us-ascii?Q?Xtu0iu/Y9j6RTmAD+uw5ZHmKQmda1T2mQ7Kuk7MukAORiBmy/TZm+h3XmF2a?=
 =?us-ascii?Q?ANNLIIfKcOqjfx83u3HBM2RLF77BV4zLuyoFCNjjzdpGby8/sWEX0MFuXjgs?=
 =?us-ascii?Q?oyBgPYGttcORVnJAfMcYgy+eOxbTqJK/BT+p+7FrOsBNpuEH53BM+HAgARFE?=
 =?us-ascii?Q?jnOyDtVlUSttH8Y+zvK/Uym9uMeKzNHkLIc8HWk1HybdA2WEwdpaFv6JOjGQ?=
 =?us-ascii?Q?gZYMYhFufiXJhV3obKd2UPwddSxaSuNJEpTovPXL0zcN9f8+DaC6dgJJlXnh?=
 =?us-ascii?Q?74AJo6KsEZzqWZgXIen3wUvpG8a6JfXVxIX8BYDDeICx3Dl6XUb7OYRD3Jjl?=
 =?us-ascii?Q?AQnDy4EJmduj4YgiGekIKHlWd32mnas28u9q9pKe/vIdNOZJXsn5LoE/hc0x?=
 =?us-ascii?Q?LXCloc627bue2SzEUl1C+WzV1phdA3NisrwXuZptD3MGrs6M4UgexKP+QygU?=
 =?us-ascii?Q?CbeHNx9+tW4Ti/0I/d5+xbn2RPlVbpi0iYPMp+MJiB0E2S33crIkw+oP5Xkc?=
 =?us-ascii?Q?mn/T4sxVYY0PsQ94YvKzYOHpCeIgltye/hoO5Y1G1e8LXJ2qJnYA98eF6d8m?=
 =?us-ascii?Q?moxRX0Kgw1Bt9+hqgB/FZLux3ogqftJC8TrY4vuxaNfaLpy3lQSFOJrpwUE1?=
 =?us-ascii?Q?gJsCItCQ/K8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e2hrlFRzJZzh6/9+o4cT5H6qIQzrR+gq+nHpKIThRUL0KFnEAgyRi51acc+a?=
 =?us-ascii?Q?p4/qYFeWyVOboD29lbBp0j7PoxCFASmck2q6LS0Y75ipWP8UAP+oRkKlYcEV?=
 =?us-ascii?Q?SSzvaitj9dfq1Ha94Dg3VbYXPhc6k8ygDbteXpCKXXRhg3GeANsVFC7nhpB0?=
 =?us-ascii?Q?RW3R1zljIy6la693HSvh4ehfzZpQ/ACfESHIrYeDDoqCt4uo5TWlttnZ7YcM?=
 =?us-ascii?Q?ctdbawwaWQlxioDdsDbanVl+XWQhbi8Tg//s1RL7APvziu0fDbtxAuqUZUSR?=
 =?us-ascii?Q?oUFuNcNiWG/Yx7lGX/USctkLPEyZPr2gku5QgHDQlBy6bqonRZlZ2xHpsS3E?=
 =?us-ascii?Q?wt4ClqxxlBHBcusC1t0LWkkGxOlpb2vMIQLsghVlaHpsay+S6Akt0paMA/WG?=
 =?us-ascii?Q?4fM920hPcbJaEY+prMkcrwMgfKL5FoqLe7l+ch/k/bRvy2Ig49f0maZl9+IB?=
 =?us-ascii?Q?RQTdoc+5dO/N23pUAMmSsWE/0BdTpgns7rtDIGTvrZDvKfTPBadFDn/Rlyzr?=
 =?us-ascii?Q?M8SjpEQkV2Jmx/HSBgYLVJPHrNy5TCoPUVAYfm9+ydrnUyfD9qLVM2Pct0O0?=
 =?us-ascii?Q?MfJRiEDpQuW7+I1hUZRhszJJ1HXBPBbicqMWdaJ6Agr3KWomnXu8j9icennw?=
 =?us-ascii?Q?S5HUxaUSoRwHRp+ZnkAYx+09qv1M/d0a0wIsPpEtIoHjxN9Z6e208PukhXEp?=
 =?us-ascii?Q?UdQTfMU9/5rPedO2mtafSi1oxeWUAyPGmxisUunrke+WU3KJKbx90c9YbnQ5?=
 =?us-ascii?Q?/yKggf/Y3pAhh8xrZymn2/O4/R8iwQa9ROQOmivwApyXP3JjCnPtPhDH150X?=
 =?us-ascii?Q?19X/y4oAq7SuKxujILZt34Ni3r8nXHCAWr5P8KOBk9L67AyLAsdZfh5wOGQU?=
 =?us-ascii?Q?g5baLT+CLKb6hJBIKt0bA/tqHsOZ8UXw5QytmNjXrBZ20W8dY3wrzz0FLens?=
 =?us-ascii?Q?MWRhN4L+ZQXPbN5P4nPAYeyiauSWB1GpvgRsXZvpxC3W6+cI6QzzwN35bfQM?=
 =?us-ascii?Q?WcELhyIYrkBbaoloe3gJm3eBvJr0y+Jvw3ZF1c66Q8Yrni+1krGQvdY08BWB?=
 =?us-ascii?Q?4yr4uHhLt/HpYyNgHAlgjfaWUpupXdoK82qLE1o/au3LXgJlvzx4ZxQVBU96?=
 =?us-ascii?Q?YZME7oqdV9dIqk0Qh1bP5by7doxau491sHv0Of0MjqIuf4LWSRe7I1Wtfyxu?=
 =?us-ascii?Q?p7jRGIh88G5qE6qOnVDIjZWKg2erOzqamOObVbuGNxyxFxVPQY0H5lYypl0F?=
 =?us-ascii?Q?eEr2/Q4WuGasdj8Vn6ie5FE+OunmnsQZf32If4+7S6UgHoj9ql/NExlEkuc8?=
 =?us-ascii?Q?NmIkjYMNFr2bEDJEfnmemo1ofNRYjJ2oyZRenEE+TOnxb3rGArSk0pTFKybH?=
 =?us-ascii?Q?5xP0KywILcSP8eURAOSGQ97wmTHxBIcx7ckoKVANNtxz+AkHIA07l23iwbSP?=
 =?us-ascii?Q?SpHHa3cRRfvvwTnPMp+nDzBT3cdTfkv2jYSUQk6GUh+pHNs+dPlOF3xhE9QE?=
 =?us-ascii?Q?KceQQfBBabspNg2El0LQEBy4yJBNSmkDLO0VMOm5GAHeb207B+tVO2MmqGXA?=
 =?us-ascii?Q?z5xAPGmPDRUMgXQAKZYpWQEnWdv2d33H/h3S3BuhJBIt+0/mlFm2vcgD3wqN?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2zzQvENhCisYHnCqR2ZYQ9NaqDSP3ukqM4H7O2B14mpWKQrdk+MLR/WqfVLNyjvc+VKs45/SzXsEjY0t9KqHlb1RF2mcWv0I6tmLuB2a8zVZ83MXhAO+xFfTDhj3l3d762csSItukYx0HDqrJRz634OPKveVjOolQKiRfuOHk/5gkcNKGdOJgP55nBcBRdnhH61+lb+vwq5tVxKoPX15paH/bUqo6K3jvYt8vl8ePP2h2JbYjJ4gOD1j6q+hxqV3fc6HC/wdmbUYHzgT3a41O0wUFd074aPNsAVHpKG8HaQKWK85C4lGjA6ceIipKhDYOCnPj3imFGbbGB0ndyaKzB9RE/+vi2rtoBgVvqK/pugODWQ3bLab7K9KUbJ2PoRLgo9eVrUrjd2x0nUSzl39P0fnYg9egfC46jXSia8hqPqiFcuY4rCoIj+cjRCFh6ej8CTtkaWT8Z1sjceluzvPwwc5LMhVcnvLPfOH8q8FSFzhFHjL3hUyn6x4TBYHcMcT4n/FDNA4apXqKCLNGTuUXxvzZebPhvoSxJY5H3I1jyWSWng4evS9qPZ0+4e4HGU0cS51dGtNr00lOCLWO1F4fqV9D/zs5Rr6DeUZIYucFuw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0142a04-ea86-44bb-8ec3-08dd94a23bf2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 17:51:06.9817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFHtPdnBgbtWQ+WkNXzTEusMn/XmHrr9lrmBV44o/T1fZo0kR6+8o7WGZVISWFSenUR4gvYdBPKOPfr2d3vzJV8LUceY3pGzm4+lIB4RlWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6705
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505160174
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE3NCBTYWx0ZWRfX1TvoI96VR3BH LSwxBaKLgSeSoijK7XK0O0JBF48lQrF+XML9scxjiGh439lGubOYuoDn4uKakbeYV2ftXrTvwH4 /g263Mvp/OYtubdYzWCsGyD2Hdqn7eUoxDxDNCh8ckHVcHfowBXGk0JNSHehQkyl09heLFp4phC
 ujEp5H/8RFyNnw8x6aRS1e9wpcAvLrVmum0RhuI/06Sb+4YG356jZ1Eu70fkgVTDNjwy6wItShG YxqF2CzX3uh5Krx5hT+st+ECcq40+N/E7KVTeTK4Yq9geTI68FUt3MCwULlldtOK0XqyuHEicSx H1wjJUU4Yj9uwsPnnSx8mKT4mWlDJIsOwWog9lK8EB+JaFFGflWXsGLsNyQ5Qtk+9SkJ2GNeTd0
 y/sftvVXjyQWYk7TqX272UyGjKbyiB56LqSdxMyiE5MZCuvI9aoGVU1T1mKWYJjLI8smpbgg
X-Authority-Analysis: v=2.4 cv=H63bw/Yi c=1 sm=1 tr=0 ts=68277b0f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=E8_EoijYQFnT_tdTPDcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: D4L80fFjZVADenHFBXbnIvXdNZI8uZ3i
X-Proofpoint-ORIG-GUID: D4L80fFjZVADenHFBXbnIvXdNZI8uZ3i

On Fri, May 16, 2025 at 06:19:32PM +0100, Usama Arif wrote:
>
>
> On 16/05/2025 13:57, Lorenzo Stoakes wrote:
> > On Fri, May 16, 2025 at 01:24:18PM +0200, David Hildenbrand wrote:
> >> Looking forward to hearing what your magic thinking cap can do! :)
> >
> > OK so just to say at the outset, this is purely playing around with a
> > theoretical idea here, so if it's crazy just let me know :))
> >
> > Right now madvise() has limited utility because:
> >
> > - You have little control over how the operation is done
> > - You get little feedback about what's actually succeeded or not
> > - While you can perform multiple operations at once via process_madvise(),
> >   even to the current process (after my changes to extend it), it's limited
> >   to a single advice over 8 ranges.
> > - You can't say 'ignore errors just try'
> > - You get the weird gap behaviour.
> >
> > So the concept is - make everything explicit and add a new syscall that
> > wraps the existing madvise() stuff and addresses all the above issues.
> >
> > Specifically pertinent to the case at hand - also add a 'set_default'
> > boolean (you'll see shortly exactly where) to also tell madvise() to make
> > all future VMAs default to the specified advice. We'll whitelist what we're
> > allowed to use here and should be able to use mm->def_flags.
> >
> > So the idea is we'll use a helper struct-configured function (hey, it's me,
> > I <3 helper structs so of course) like:
> >
> > int madvise_ranges(struct madvise_range_control *ctl);
> >
> > With the data structures as follows (untested, etc. etc.):
> >
> > enum madvise_range_type {
> > 	MADVISE_RANGE_SINGLE,
> > 	MADVISE_RANGE_MULTI,
> > 	MADVISE_RANGE_ALL,
> > };
> >
> > struct madvise_range {
> > 	const void *addr;
> > 	size_t size;
> > 	int advice;
> > };
> >
> > struct madvise_ranges {
> > 	const struct madvise_range *arr;
> > 	size_t count;
> > };
> >
> > struct madvise_range_stats {
> > 	struct madvise_range range;
> > 	bool success;
> > 	bool partial;
> > };
> >
> > struct madvise_ranges_stats {
> > 	unsigned long nr_mappings_advised;
> > 	unsigned long nr_mappings_skipped;
> > 	unsigned long nr_pages_advised;
> > 	unsigned long nr_pages_skipped;
> > 	unsigned long nr_gaps;
> >
> > 	/*
> > 	 * Useful for madvise_range_control->ignore_errors:
> > 	 *
> > 	 * If non-NULL, points to an array of size equal to the number of ranges
> > 	 * specified. Indiciates the specified range, whether it succeeded, and
> > 	 * whether that success was partial (that is, the range specified
> > 	 * multiple mappings, only some of which had advice applied
> > 	 * successfully).
> > 	 *
> > 	 * Not valid for MADVISE_RANGE_ALL.
> > 	 */
> >  	struct madvise_range_stats *per_range_stats;
> >
> > 	/* Error details. */
> > 	int err;
> > 	unsigned long failed_address;
> > 	size_t offset; /* If multi, at which offset did this occur? */
> > };
> >
> > struct madvise_ranges_control {
> > 	int version; /* Allow future updates to API. */
> >
> > 	enum madvise_range_type type;
> >
> > 	union {
> > 		struct madvise_range range; /* MADVISE_RANGE_SINGLE */
> > 		struct madvise_ranges ranges; /* MADVISE_RANGE_MULTI */
> > 		struct all { /* MADVISE_RANGE_ALL */
> > 			int advice;
> > 			/*
> > 			 * If set, also have all future mappings have this applied by default.
> > 			 *
> > 			 * Only whitelisted advice may set this, otherwise -EINVAL will be returned.
> > 			 */
> > 			bool set_default;
> > 		};
> > 	};
> > 	struct madvise_ranges_stats *stats; /* If non-NULL, report information about operation. */
> >
> > 	int pidfd; /* If is_remote set, the remote process. */
> >
> > 	/* Options. */
> > 	bool is_remote :1; /* Target remote process as specified by pidfd. */
> > 	bool ignore_errors :1; /* If error occurs applying advice, carry on to next VMA. */
> > 	bool single_mapping_only :1; /* Error out if any range is not a single VMA. */
> > 	bool stop_on_gap :1; /* Stop operation if input range includes unmapped memory. */
> > };
> >
> > So the user can specify whether to apply advice to a single range,
> > multiple, or the whole address space, with real control over how the operation proceeds.
> >
>
> For single range, we have madvise, for multiple ranges we have process_madvise,
> we can have a very very simple solution for whole address space with prctl.

With respect, I suggest you read through my justifications a little more
carefully :)

What happens for a single range when you want to ignore errors? You just can't
do it.  What happens if you want to actually determine if an error arose or
whether a gap appeared (-ENOMEM happens on gaps, regardless of whether any
operation failed or not)? You can't.

process_madvise(), a function I personally expanded very significantly and
actually made it possible to be used in this way, is limited in:

1. It only allows single advice to be applied to each range.
2. It's limited to 8 operations at a time.

Also neither allow you to sensibly apply something to the _entire address
space_, ignoring errors.

Also neither allow you to 'set default' in the all casae.

Not to mention the ability to actually determine if gaps occurred, more details
about errors, etc.

I'm essentially talking about a fixed madvise().

>
> IMHO, above is really not be needed (but I might be wrong :)), this will introduce a
> lot of code to solve something that can be done in a very very simple way and it will introduce
> another syscall when prctl is designed for this, I understand that you don't like prctl,
> but it is there.

By this argument we don't need any system calls relating to processes and
instead should use prctl()... I mean mmap() could be a prctl() right? munmap()?
mremap()? The list goes on...

So no, I don't think prctl() is 'designed for this' at all. I think it's a bad
generic interface used to brush stuff under the carpet at we don't want to put
anywhere else.

However in the case of the problem you're trying to solve, we might perhaps
decide prctl() is the only sensible (if yucky) place for it.

But with my proposal above, we can actually have two wins - we both enable your
use case and provide a general means of doing 'madvise by default' and 'mass
madvise'.

At any rate I'm not saying it's right, or sane, but what I am saying is I feel
you have not refuted this as a concept :)

>
> I have added below what patch 1 of 6 would look like after incorporating all your feedback.
> (Thanks for all the feedback, really appreciate it!!)
> Main difference from the current revisions:
> - no more flags2.
> - no more MMF2_...
> - renamed policy to PR_DEFAULT_MADV_HUGEPAGE
> - mmap_write_lock_killable acquired in PR_GET_THP_POLICY
> - mmap_write lock fixed in PR_SET_THP_POLICY
> - check if hugepage_global_enabled is enabled in the call and account for s390
> - set mm->def_flags VM_HUGEPAGE and VM_NOHUGEPAGE according to the policy in the way
>   done by madvise(). I believe VM merge will not be broken in this way, please let me know
>   otherwise.
> - process_default_madv_hugepage function that does for_each_vma and calls hugepage_madvise.
>   (I can move it to vma.c or any other file you prefer).

Thanks for taking on board the review, it's much appreciated and I hope you can
agree this is a big improvement :>)

>
> Please let me know if this looks acceptable and I can send this as RFC v3 for all the
> 6 patches (the rest are done in a similar way to below)

I think it will be useful to see this as an RFC notwithstanding my idea above (I
was saying to David previously it'd be useful to just see how it is now with
these changes).

Then that gives us the basis for further conversation. Thanks for helping us
iterate towards a solution here!

I've commented inline below though you need to address the duplication issue.

Thanks!

>
>
>
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2f190c90192d..a8c3ce15a504 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -260,6 +260,8 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
>         return orders;
>  }
>
> +void process_default_madv_hugepage(struct mm_struct *mm, int advice);
> +
>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>                                          unsigned long vm_flags,
>                                          unsigned long tva_flags,
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 43748c8f3454..436f4588bce8 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -466,7 +466,7 @@ extern unsigned int kobjsize(const void *objp);
>  #define VM_NO_KHUGEPAGED (VM_SPECIAL | VM_HUGETLB)
>
>  /* This mask defines which mm->def_flags a process can inherit its parent */
> -#define VM_INIT_DEF_MASK       VM_NOHUGEPAGE
> +#define VM_INIT_DEF_MASK       (VM_HUGEPAGE | VM_NOHUGEPAGE)
>
>  /* This mask represents all the VMA flag bits used by mlock */
>  #define VM_LOCKED_MASK (VM_LOCKED | VM_LOCKONFAULT)
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index e76bade9ebb1..f1836b7c5704 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1703,6 +1703,7 @@ enum {
>                                         /* leave room for more dump flags */
>  #define MMF_VM_MERGEABLE       16      /* KSM may merge identical pages */
>  #define MMF_VM_HUGEPAGE                17      /* set when mm is available for khugepaged */
> +#define MMF_VM_HUGEPAGE_MASK   (1 << MMF_VM_HUGEPAGE)
>
>  /*
>   * This one-shot flag is dropped due to necessity of changing exe once again
> @@ -1742,7 +1743,8 @@ enum {
>
>  #define MMF_INIT_MASK          (MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK |\
>                                  MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK |\
> -                                MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK)
> +                                MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK |\
> +                                MMF_VM_HUGEPAGE_MASK)
>
>  static inline unsigned long mmf_init_flags(unsigned long flags)
>  {
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 15c18ef4eb11..15aaa4db5ff8 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -364,4 +364,8 @@ struct prctl_mm_map {
>  # define PR_TIMER_CREATE_RESTORE_IDS_ON                1
>  # define PR_TIMER_CREATE_RESTORE_IDS_GET       2
>
> +#define PR_SET_THP_POLICY              78
> +#define PR_GET_THP_POLICY              79
> +#define PR_DEFAULT_MADV_HUGEPAGE       0
> +
>  #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/sys.c b/kernel/sys.c
> index c434968e9f5d..4fe860b0ff25 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2658,6 +2658,44 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>                         clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>                 mmap_write_unlock(me->mm);
>                 break;
> +       case PR_GET_THP_POLICY:
> +               if (arg2 || arg3 || arg4 || arg5)
> +                       return -EINVAL;
> +               if (mmap_write_lock_killable(me->mm))
> +                       return -EINTR;
> +               if (me->mm->def_flags & VM_HUGEPAGE)
> +                       error = PR_DEFAULT_MADV_HUGEPAGE;
> +               mmap_write_unlock(me->mm);
> +               break;
> +       case PR_SET_THP_POLICY:
> +               if (arg3 || arg4 || arg5)
> +                       return -EINVAL;
> +               if (mmap_write_lock_killable(me->mm))
> +                       return -EINTR;
> +               switch (arg2) {
> +               case PR_DEFAULT_MADV_HUGEPAGE:
> +                       if (!hugepage_global_enabled())
> +                               error = -EPERM;
> +#ifdef CONFIG_S390
> +                       /*
> +                       * qemu blindly sets MADV_HUGEPAGE on all allocations, but s390
> +                       * can't handle this properly after s390_enable_sie, so we simply
> +                       * ignore the madvise to prevent qemu from causing a SIGSEGV.
> +                       */
> +                       else if (mm_has_pgste(vma->vm_mm))
> +                               error = -EPERM;
> +#endif

No, we definitely don't want to duplicate this. You need to share this code with
madvise(). This is classic duplication, and loathesome specialisation anyway
that we want to limit to one place _only_.

> +                       else {
> +                               me->mm->def_flags &= ~VM_NOHUGEPAGE;
> +                               me->mm->def_flags |= VM_HUGEPAGE;
> +                               process_default_madv_hugepage(me->mm, MADV_HUGEPAGE);

Nit, but let's at least abstract out the mm here.

> +                       }
> +                       break;
> +               default:
> +                       error = -EINVAL;

Thanks for fixing this! But technically you should have a break here too.

> +               }
> +               mmap_write_unlock(me->mm);
> +               break;
>         case PR_MPX_ENABLE_MANAGEMENT:
>         case PR_MPX_DISABLE_MANAGEMENT:
>                 /* No longer implemented: */
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2780a12b25f0..2b9a3e280ae4 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -98,6 +98,18 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
>         return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
>  }
>
> +void process_default_madv_hugepage(struct mm_struct *mm, int advice)
> +{
> +       struct vm_area_struct *vma;
> +       unsigned long vm_flags;
> +

Please add the discussed assert for the mmap lock :)

> +       VMA_ITERATOR(vmi, mm, 0);
> +       for_each_vma(vmi, vma) {
> +               vm_flags = vma->vm_flags;
> +               hugepage_madvise(vma, &vm_flags, advice);
> +       }
> +}
> +
>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>                                          unsigned long vm_flags,
>                                          unsigned long tva_flags,
>
>
>
>
> > This basically solves the problem this series tries to address while also
> > providing an improved madvise() API at the same time.
> >
> > Thoughts? Have I finally completely lost my mind?
>
>
