Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D0281508
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943827; cv=fail; b=dgCoLj9wcamCL8KC87QyRf28NyK01jd7whiA3AI4ct6atmSDRn+3yWYFHQ4il1wc40TCHGBJr2aIec3/QMsKKgGVC/bwJ7e2Gf6+wUktZJuJQUSPZbOmvCgbf4+8NVduBTmSqzKP6PuzsaDAT7EvhdkReH6Exxc1HyNnL76OcO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943827; c=relaxed/simple;
	bh=O760Xx2L6MJyEKM60UNl1SXxtcZ9PvlqFhHSOUSCuLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XCUjtFN6+oAuZZBqxb1mrStKjHhQlIladccS6UtFyUS6F9f+LrOS8W6QuI2CNgtFXgzp2/+8+tgaFZy78L0jBGiu1yNSS7WKJIwpa/sN3EyUJiqSHX+WIizRrwluGQ6daSWVM3qO6iyQIhScJ22yswf+gParSLHqBjqczEWU570=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X+u+5VrP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NUKtKiAQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X+u+5VrP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NUKtKiAQ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5537u0dU014133;
	Tue, 3 Jun 2025 09:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=3P/48eoxQ5CDSs0nnW
	MdF8TW7z3fVjgkfFBlhMhFWKY=; b=X+u+5VrPM0gxSxA3W5bxVuIqGiHKi7pYnj
	v7V+JffYfKy49MzusRRA5j5ziTNqCEdYjmD3zb6iRz9JgwR4wDQo/i0I1EGejLNk
	0E58M9hIl4I4lS/xi9AxZg8zwlnSALPrEjDqdjYvzB6yUpPPDTmY1HItMuYd+RuR
	a7BUmJt8aH0FnXPvoYXairCLi/JSOod+lLtQV2558azYAlxvoQVv5irgTX8oDTsm
	zDS5h9nVKvO91AAteT1npXs6+jHvu010fUSoYNOcMEv9Ukq5lYzxlfe97JEUj1xR
	uL+H/8TyucRsQzHXYqtR45ljL2g1oICiCExW8HAmu8nm+bVMIu/g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8dshkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:43:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5537Uu8q034879;
	Tue, 3 Jun 2025 09:43:19 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr79adv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVntwj3ImP+n5gtdEpvshQ+qi9NH9idQUH52SR3OlK01OWTOAfgyYNAP+e6xLXFjXV6sQ6hGzILKBCTGp5kkkc+PEqhczha3FlsRAjkaU5OLcgBPdk1igFUGzEDAG30NDRqAiI8FG4OjRke3eWBkPPgfHTOqOf7JGRDWfARzw/puPiv8CQ7UbWiMJPtu/sybevjElQJfZ4RhRSh7BLzxncB0n0pu9iIvhw9ffgv3L7J0xMOUzi5Rqcpu/gXdBQKB21EMlSf0rQUHeLm8H8V1OKk2Fnkz19AXDR2ycz6/k2CHlm/oI06hTfPkcfjUYr/OqLuFG+TkRQs8H0OhpQQyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P/48eoxQ5CDSs0nnWMdF8TW7z3fVjgkfFBlhMhFWKY=;
 b=lh0DPXvz5HL/WXio+OA+nPErjIY+8mN/q1qxycfgRyJJIgSOH5tUOXhb+Bj0iVtCQq7BAx02CahdVE5VbusPTeggr7eijIdcU3cO3iLaY09WFw+0z+hA5Cfda7pNAPF8WX325suoQBtunwDPls/sn9w7/GfK3SQMg5zz6eyj+XArR+qxSCSugGmVUwCiHhVuqxsPFNi48vuu3tn8dkRD1I8mW3jpqJuoWZWH9tMohT4fNTpZYiMxqprhsYDxzcITdb6zM1Zs+w4vbe2jJ9MRLG5hFGqQVVj4IdJtOZmmtk/tg4BHo9cOIOutA4plfjZiLiRxnmnt+DX4RdqJtI0sLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P/48eoxQ5CDSs0nnWMdF8TW7z3fVjgkfFBlhMhFWKY=;
 b=NUKtKiAQ+NBUsCKua8h+LGwZYhH0kkUFxotj8slWQojXi4vaXEYO1MLT0TJ19pwBJVOPb6mWwTzHXKuVCUmY6xowD2RV90L9qm2UAbiEETVzi+QtdQbn1eMIQ/DYmZ1sL3clNqCD+QIMk4uMvrGYNgBxooVByMj9gm7ipDL3Ads=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB4990.namprd10.prod.outlook.com (2603:10b6:5:3a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 3 Jun
 2025 09:43:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 09:43:17 +0000
Date: Tue, 3 Jun 2025 10:43:13 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Juan Yescas <jyescas@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: Kconfig: Use verb *use* in plural form in description
Message-ID: <30a49bfd-266c-4972-adaf-f8732084c52c@lucifer.local>
References: <20250603061303.479551-2-pmenzel@molgen.mpg.de>
 <05576df8-20a6-417d-a4f1-867c4d30a9ea@lucifer.local>
 <46fc14be-d2ec-41ad-a01a-69cea0074021@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46fc14be-d2ec-41ad-a01a-69cea0074021@redhat.com>
X-ClientProxiedBy: LO2P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: df553f97-0b2b-4089-c07c-08dda2831143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WpqSDZuTcaR5rxckn1uhBdKz2iGXnShBg/x5m5WwQngmhjyffbtt5P+sP6nb?=
 =?us-ascii?Q?Yk29PdghGJooKjdQIQPq50HqE8fluTZFzM1qN9H9GPepyXe0AOwdHrfdVf+2?=
 =?us-ascii?Q?nwtUpl8mqE9VPPKaoVBfaW2j28OKqRYbcYjRCUdqpkGxANx+EefuR/xucKIJ?=
 =?us-ascii?Q?7Jchg9hg912zFrifsf2ElQY3vUUTMMP4u0cI0T6sJckvg3aSsnP1KGHgd45y?=
 =?us-ascii?Q?Bhb5wVTPnMpUau+0GtDXNevyEy5C707GsJUn2erqNKZPJukVYgKVDYb4ODpm?=
 =?us-ascii?Q?/YlMpscUGVtztsTtVwqTIz5BM7DDrbtwnAdvvyZkWdF7VyNJuYyGpT7I6X7h?=
 =?us-ascii?Q?eYZ7/LZL7m//u1d8VCGq4Eso3qT1Ce/cJEyNVn86V6KYLe9bOO2q8z7/Z/xJ?=
 =?us-ascii?Q?VSVaLXK+AJWyHQNuWZUGX4pZFzlvXseeG+sLctuvq8bHOMViWUwct72GgNXx?=
 =?us-ascii?Q?TG5dcTG1SIqg8TnBliGCG+sayZwhVZtoeKG9f0/jyZidnAeDlMhXqMTDEkRZ?=
 =?us-ascii?Q?3jvzu1adLqQJSpiB4mWh/CjGkrjlJVuE+ppbhyAopnozkTt+8Mc64bczjGtL?=
 =?us-ascii?Q?Q4nb31btqc9WmkCSgDJue/6iC8iE82v71xOtYCKWiKFUCl4yRXONDnPLhKaP?=
 =?us-ascii?Q?qFcDaqu7WnkeKMTiCa/qOPPIt0BT0/VfqUC1/rg0KfsoAIRnSc8lzgMbrSE2?=
 =?us-ascii?Q?CjTvbir5Zz21MCVslD2Ksyjzsz48ifI9GcpRFXJCSm6Q6IQaIawSxtzd890U?=
 =?us-ascii?Q?Kc78bCvjhvXbU+sZPuvvpJdDzTCliNqgmUpz13aXJo6zfWpNMDzRee+PRFgc?=
 =?us-ascii?Q?WT2sF4QDnttlpvA7UoDR0dmfFejD+XlKhjzWofXpek+gCG4XuHtnkLaPdNkL?=
 =?us-ascii?Q?JHKlDLelvOLMMINqOoaq4aUOY4A2CJ3IBKy4WayFdBUBbEtBtMT4uHS7XemM?=
 =?us-ascii?Q?9+zTvutGQn3vs5Co901Eqfs2e3cM2TZFJ8h8B7aLLYxqwhsAq/RaGhyJa0/x?=
 =?us-ascii?Q?urfJc+Kd5vr3ZsF8NW9hYhta1vfmVzBRvN6gUsNH0heE2gs8xKHKkyw9Soiz?=
 =?us-ascii?Q?w3qIuFhtD6h0wI9WY8ue16RL4v6+V/+IDqYiNPNJcXvxJGRjUOF0pdFV0L0F?=
 =?us-ascii?Q?WUyp5fLAvsty9H8+flwTkU6howCqKRu0OUEaR1G3+M0VYNenzZmKrRGEE34s?=
 =?us-ascii?Q?JoztvgpJgC760g89OO95ewvlMXC7LbiObKJ8xQLTCUqFPdu2Kx1I4AphqdRZ?=
 =?us-ascii?Q?l/tlNsqTrttlQ7ir2En177XXeWADDI1bso0gfi1/mcPdNGxrpxaC+EH4ujjs?=
 =?us-ascii?Q?nXOAbGamjXEUMzXJ6EYCIKLl821F8VODJoiGK/bG2FVSG/nqqsRf4gw5Ho/B?=
 =?us-ascii?Q?Ptfy9YUsRjiSMEoIfdRMtbKBdX+tAc8nCpMYNWpUvsMMCeQF/JCCUR21xIBI?=
 =?us-ascii?Q?EzVSqwVMK88=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wZEVgcwASa4+dl6fhZbzAt47lrJPtkH30zF+Lhgzm5CiYxoqkYrwcCzIAi6B?=
 =?us-ascii?Q?URZzIbpqQlx1HMGy4aGxv0wOYgCvWG5LDpvZA1pCb/i/FQ2XpQJ3mtX54+Y2?=
 =?us-ascii?Q?NRfmaox+wg/4ufYYs3IkYlwHHymlCqOojXw3wAaGh/BpVS2aEBYNMEwRWW/u?=
 =?us-ascii?Q?TcA7mF48rVSsD29O1ZetQNMwQuKP/zlTRQdDK+A39xc8TquHP/KbLbVV/EGK?=
 =?us-ascii?Q?AEhj6h2Mz9sTVrtBT8ddPHeeF7GWmaZrHVW6x67mn6cFvBUrpOPydF1gJXTk?=
 =?us-ascii?Q?HX3O9CHpuLTS02r2osZ/4ctdoMD91o1BqTu2zfH5OjlcpzqshZ/NNycQoKp0?=
 =?us-ascii?Q?V+q/aJVpL5FyhMfn8GGjl2f8g1/Wa6KF0RpDrVO5jMC3j+4did8dVQQea050?=
 =?us-ascii?Q?rW7KslGIs+rAGEE4MZzaO4YJEC3H0Cl5B55kEb/9ocmLeESM3J6Xfc8G9Gcl?=
 =?us-ascii?Q?hp6+4/P/RtHVxmZX1RrYDuOHg+eYSzOOFNeOwYjmhMHqEpamO21AWaMvb2F5?=
 =?us-ascii?Q?07iOvRmYhPuLwwCmAHx6ilGy7nAEa//wFh+so9JdT3GGZDWtyNBIMzrrduc9?=
 =?us-ascii?Q?fwDK8fne3GmTyz75+E09adyjyYyts8u2cqnnqF5CjIzOBI00q2NLw7DNUm7m?=
 =?us-ascii?Q?NlqlW5wCRljxOqY6i+9tSJNRa0MuGMyPu5NFzoquWFCMYd2/c5/frgn6iJc3?=
 =?us-ascii?Q?hql05+i7fFbO2p8UkymmF/1+zcI/O5ylPXxj505HbpK9JCDWY6TWBiERvBjF?=
 =?us-ascii?Q?13vBAlYsWpWZLm4AyPFoltnQMEIzmub40Zpz5/pSV6UqcfmI/CxZ5BdViSCZ?=
 =?us-ascii?Q?6c7ADtWtCEYhqMtF4xqQPVXy05F9RYJnGBrjSFXothwHFqhH1GsTIjGFaEZu?=
 =?us-ascii?Q?WvUWiCKSmmxkR6lZ2FSdlTiHfctHLrOutxNA7e2HBE/j6JBAdYoRPl3hZHZ+?=
 =?us-ascii?Q?Ru13LgRLs3PBbrg8sOERaOfd+eeIm0botNs9ByrxlTUZNMTQv2uFH9UPFvxz?=
 =?us-ascii?Q?FQz9aieooa2JO6jWi8KdJ86szpMfU9yIm1F8vx/7czBmyyOLxtA9mOk8BjZe?=
 =?us-ascii?Q?oKF3H4zR0GBiFEZklpDfr2EV8QKjO2fN8prbeu0ypg0wO1uq93BMZ7O/tXR0?=
 =?us-ascii?Q?dTUaTqP/0O2HnstEiy4G0NH/nS6bMdmAl1zm//T3kCCe78oX8HxrJQgDmymQ?=
 =?us-ascii?Q?MuhG+ouVAJv/duXhxg4Oc0ckzQ1tWHY9vhKHizb1XwTpZCZWXl+TI0MvBRfV?=
 =?us-ascii?Q?W8VZt/k0iBN2RwVQK2G3VsNzozfwZfwrjM1KNWL56b2VpvGOY+kK2wUKjdtr?=
 =?us-ascii?Q?ibCzd09LfXuPzlZqQEWkhYub9+xdcxbwxBrRbuchaGn3GBSB5eElosCQtj5L?=
 =?us-ascii?Q?dakEAfgNri3H3SyZEeyecLOaM6e6XszHOSRp9I7gwW2E7aEpge3iIqIF2hQF?=
 =?us-ascii?Q?mOiOW7Bmr5KpMo7ex6Gw72ObbgKdl3ex9u6NyuTlmFbBmAyqKuWvv7QzO5hp?=
 =?us-ascii?Q?iPzoEsvvZd17RLwlVDlRA5ZfbdLo7J405hjZ41OlOT4dWfzpFYkLPOdglFWB?=
 =?us-ascii?Q?0vf0VBBIvjuyGt8brEFSdjPRh/OhjCCnVdFKea0kZLMPkIPRXfhSqjItlBxm?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7TZcspZkSfS1p5h0exLEiR+TdVQshIAWITbhiu3HQHowEjJ8jFxrOZ9I8YldZ8WGb1ktfuRofxgXyV+PhU4w1Glww2kb5mh1CfbChv1RFmVqD1QBPD0DDwQcprbqbNFUd4kkAkacPUdB7hSbMRuu8fGBqEVn+Y2Fp7j/3VIY8Dsr/6CvhhV2ZcET/LwmGVVzQjBA7fxyKOksjDsCGSSqkqwiaOCnt9LpZkPASS34XKd+P2gJXefw/XtH+iWdndWi4/mMeMK7YB07Fl/lBMbYfhe8SmilQgZqKrKnjXOcI+SYYaylinG7Hh2VX4dv2p3zVH5qy8k0t7mVv9s+uqCun4MIjYdXetB+9VPd8qdWNdpW5cTKQXpxl8Rz7LRUfbSEimLjn3idXYYLHX3gVw664f874MLZT2jN53UULb1BeRudQlyuQBuGbvVNTQzToEp4rcY3l++i6afNt7gqrLttAZOXUynxtTBsUCva78eLUf+nA4Sum9EbsPenk+Gox8N/eWghEhTmcnuXFFa11jdT1henS3f9ip6vBZXta8e746fhgS0+3ISnGRoyEYZdGjTFJWvWXqdylHvrSacdCgzl3C2eUPIqq7RBF3mgMPM3mfI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df553f97-0b2b-4089-c07c-08dda2831143
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:43:17.1160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWeftmj8v683xeberV+wAZYUgcpwbXLHrGZLdKq9aRpImg7z4Ia5tFDJ44EVBTBtYeYLlCCzlnDUziQDk7/3EfUV/A1exSP7bwWmvjrLbTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030084
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=683ec3b8 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=JZ8z6huOQwk1aofmi5UA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4NCBTYWx0ZWRfX2UIIm5O9kMwv qY5sMq5bYugdCtHzyAOfAhYGlkgkmnheVMgGzI5BqGte/3TCudO6XqYysTs/Q/9tPEQcB3ViTPE zghECgEnmC9r6hDxXiy5HSs+p7JQHZxnzaYavqgEsvKHBL6iwNzlEp6JP3oLfwC7xQke/Jv1cJT
 1t34f6GuKICx4JVSACGGfGwPfuWW95Ch4ihdlg95iiivq+jt8v0GC7oIg6yk5yjibr43hh6l3Df 4TLtV1W3AXXqWCb9DqGKwF4G2dE2elqnvl6m61iR7ah6DQfNiLDbVpU6jEgOjnhEUi+f0IJbehy 5E0cRQguLhqrcLKKpy+eE/c/4rNeclfBxFgHqPw/mMCJTbwiN7eBmvyn/hO5CiVIK9D8RIWMwnk
 niM4chmZ/M6gI3+djkaE3CmYjwgVMOA1LRC6WTaObxGsdh/tVwe9WfF8ukfDl+pFxuaHAepX
X-Proofpoint-ORIG-GUID: wZnCKy5FWd90aT1Gpft0uQyk9g-bms_B
X-Proofpoint-GUID: wZnCKy5FWd90aT1Gpft0uQyk9g-bms_B

On Tue, Jun 03, 2025 at 11:38:47AM +0200, David Hildenbrand wrote:
> On 03.06.25 11:31, Lorenzo Stoakes wrote:
> > On Tue, Jun 03, 2025 at 08:13:03AM +0200, Paul Menzel wrote:
> > > *workloads* is plural requiring the verb *use* in plural form.
> > >
> > > Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
> >
> > I think a fixes is unnecessary here :) I mean strictly true, but we don't
> > need to backport a typo fix :P
> >
> > > Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >
> > > ---
> > > Reading the sentence it feels like, something is missing before the
> > > *please*, but I am no native speaker.
> >
> > Seems ok to me as a native speaker! Though I don't claim to be the most
> > erudite...
> >
> > >
> > >   mm/Kconfig | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/mm/Kconfig b/mm/Kconfig
> > > index f8bb8f070d0d..e3a07687ed0b 100644
> > > --- a/mm/Kconfig
> > > +++ b/mm/Kconfig
> > > @@ -1022,7 +1022,7 @@ config PAGE_BLOCK_ORDER
> > >   	  or MAX_PAGE_ORDER.
> > >
> > >   	  Reducing pageblock order can negatively impact THP generation
> > > -	  success rate. If your workloads uses THP heavily, please use this
> > > +	  success rate. If your workloads use THP heavily, please use this
>
> Should this be "use THPs" ?

I would say not, because in this context it's 'THP' as a feature rather than as
individiual transparent huge pages.

But, to repeat, I am far from erudite ;)

>
> --
> Cheers,
>
> David / dhildenb
>
