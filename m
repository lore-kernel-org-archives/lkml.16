Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896F15479B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282888; cv=fail; b=Y7pUcgc3aus3Hn3OiX5gnjvsYqH/+zNK6VYrUVZeXM1RgXrSPA3PE6ZVrilfXwj34FiXROkQx9xeh3Ne22gFcFSWsBvNMVLQo4emDZo4sXHxk+XtOhjfSwHg2bj1ZDnTM2Y964sKjYBs4789pEAXjd7mIIyS8mX72LNkfV0y40w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282888; c=relaxed/simple;
	bh=hRa7DzFpFzjIJZnQnp+/gHwHpicIRDccyzACftppw7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SJJGCpjJaolnGtW8uWTZfVCoFQ+fzoZrokSe5p71ZJGDMIGXxsa/YBJRLwQoWOa9suLxbvoxjoLjRUCP8ZRdbZq7Jv4DbJKq4mjnFD/ZtmoZJk/8bC9CaoG+qh76+LbJzRTVQqumQZsl2yBw/ao7lXmxvoG4Jbt6RstU/yUlH/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AVC687K/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Up8IPHA1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AVC687K/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Up8IPHA1"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84fmw004453;
	Mon, 30 Jun 2025 11:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=hRa7DzFpFzjIJZnQnp
	+/gHwHpicIRDccyzACftppw7U=; b=AVC687K/iDteia4nAhHu08B839mY2K6EWU
	6r7wARil3Hei2R8EuTQhRIccQcXicFmV3rC7C5G+NSnykUolfbUEyq8p/f3dWjEk
	3HjBhgWuU5FFFVYxw8QHVpgA5s7F/KKCf0sn8IQ2uWmHP0bCZo/oqISDb1ZGgT6z
	esES6BHGr+EwQvRs4McCGQe42Umr44lUU0A1Jie20PBfHQZQXpq54NVWRHzNU8L1
	BdftlqNADq9koHKPWCpncTt1zejU96A9rgQhSKHvjFs4uoinbL/GbGfPXTMC9chl
	m8b+5livbcFE4PVYfz7yuhp4H2AgpW2bwInZtKEZc+qHRw1HOu3g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766aac7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:27:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UANuda017677;
	Mon, 30 Jun 2025 11:27:34 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazon11013041.outbound.protection.outlook.com [52.101.44.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u7yfar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:27:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rULgtdVXyCem8VwKuZa0DdYhp0bGm1SGKflHPfhuKNZ6lM1m0UQrpDbLzqdb9FTcvWHgTC4xUomwE28o748EJ4U2iP04/ELXA7QRmWdkqIi82EiKdmdzECxvMkDQAP+Xq9/2sa/V67b3FBHwpKjQ4367QM4M7HcIDpQBmOBo7NldbyxpNS1b71rnx1LiC/RHBBO6NgJfSOlddGNbgOyRwMMb1YdIRPTeudTw4xKRC06FuP8AM32EqCRREmEoNa0HF7DRAvtLZh1AbkMsktNVii0ANfgrHD6UxPLx5O8aKU2Rjo2XmIeY+mYtUFM99ognoYBp2rnqdKfzaHY9trRWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRa7DzFpFzjIJZnQnp+/gHwHpicIRDccyzACftppw7U=;
 b=LZLYxKZ6Dmt2kU1VdEdL+UZL0G71UqnEgRlUbuml37rjceRdzfDIgA7/qPLMt96RZjd2itSVbJ9F8XFNJ3OyBGD4l8vSvRQzb5q8aP8vi22o0wifRgWpuaOG8HULFuHdPW4CS9nbD+aYgnSqyOv2e83awPCxojfHkHD7Gh6YBmFVH7jIvzlYhxUkg0e5r6OpIR56zY83Gb/FH0dE+9rVJaRfaK06tJrWuMJJV0p36yTfdj/fXk0uwltMUegbM3LG7MpICu0vK1mjqiCz/tOUG6HEQ1/5Qkd7aCGgJwyyDLaoRPbarmySQgQ4WeoWbSEwiko42EPhOcOq65R5Zt8+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRa7DzFpFzjIJZnQnp+/gHwHpicIRDccyzACftppw7U=;
 b=Up8IPHA1hfafK2sQWM2a58vlHDuuD3mEPL8apEpl4yDq9TD6YVhpIBXIAirwm39DXudCOm7HpQhpBLtyOHalmweN8KPV/oTT5xPPyPuglD+D+7TovzZuuYkp0l/N+vvxQhQD2o76eUrm5SlbgU/8roIuXdNIrjRHOyEdgeQrAp4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB7255.namprd10.prod.outlook.com (2603:10b6:208:40c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 11:27:31 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:27:31 +0000
Date: Mon, 30 Jun 2025 12:27:29 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
Message-ID: <abb9d742-d7ee-4379-aa0c-9f5d68cd076f@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628113435.46678-1-dev.jain@arm.com>
X-ClientProxiedBy: LO2P265CA0197.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 16381772-76a0-4283-8b84-08ddb7c91a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1L9QEfmYhnJ1GIEE0ZEQy5syM+/kJwyYpFYyMurtJixHu8aqHjDadUB5h0wG?=
 =?us-ascii?Q?C2oXiyvrw+1LC/vR6u+Ua8wYUXwJhTM4WLXGMwPsKBdh9MiqYsboDJFuG+Hy?=
 =?us-ascii?Q?3VjYQlCbyNpZOafq0HGSSxmlLLjZZkLmzo7moQiJji4XnG2jlE8xJQ3nziK7?=
 =?us-ascii?Q?mlGEYWT2Qq6UuV/OOdsCmkoVzqX8GJrUbYkbzpT/q9blEObxbB7/Lx5xH/sK?=
 =?us-ascii?Q?zQWvXc1t14gbT3ATgS2aQiq0jSG4GttPpQyT53sKLQzigLvhMzLQGQ0Hxf9j?=
 =?us-ascii?Q?3+RiZBHUr1Auai/scyC29pezUVo+I3HjfQTHv6JEswxp5JPGgoeD4Grgj4CO?=
 =?us-ascii?Q?Z6eW8VzJLIAOEQ2+i0Jty0TS1N7V0+OxJ8s/+pEFshEEaicKQCppgKyiJe0B?=
 =?us-ascii?Q?EzT/yxOuI6zTROJwjGu6wEI7uAywjlhIaj5Y/tsyeDn2m4Mi44T00tQTAJD+?=
 =?us-ascii?Q?mHdm42s6yFnRK7xTl5smxeuF+Ivbidn/KYBIkJAOJ986HCXN40TiC25PH8n4?=
 =?us-ascii?Q?wAxvvaEhFxFjl4z94wiS2KVwTLH7TATo7hC43KhG7A+YaPN4mNOkqf/0+Kf0?=
 =?us-ascii?Q?mmBqNfdYTTn/rRsrkA9uNvo40xeA+/Louy0WgABbS+XEUKJUVienr6CiTca2?=
 =?us-ascii?Q?1C/wff2xyiB37E12Xsu4fTIs1cUfBonN5rCiktCuIXXDuDQySjvXek6uEcoE?=
 =?us-ascii?Q?ittx1hN0fTv5iX3BGdcYE6mflh576pfi2sZP3Zv6mUGnQ96akVh9Uhguqhqo?=
 =?us-ascii?Q?mH8GNR5I6oanpn9CZuta/C3rkrCJcZ8Gg7/yimGvFYmCDQd1yxk1sS5DEmzG?=
 =?us-ascii?Q?I033i1doC0znVZw890VMFzy5sRx3KHGw8ifvr2m6epSklDI9ZOi+t4GN9FZN?=
 =?us-ascii?Q?O32iEMMnAByu2DKaMzn46TU12S/EtP6gvHsvEMMJJvYgLisgClF2UvZkp2Nx?=
 =?us-ascii?Q?ykU0XxfpmX8AJNQwgmOI3/oU3hYD0ok3eLPGQQGo2ivqEaAMFVCdQy9keIOL?=
 =?us-ascii?Q?8nEEyjFV5meyhN7/T3uoyUDalzI8vSUoevmsyUoo6wiX0nGvn/tj+qr8yujB?=
 =?us-ascii?Q?Yd+iDKT3FK9+qme3qBSPa7NoUpDJYAJcowGUY6Dao4HFUBzVza99/+0kCS1n?=
 =?us-ascii?Q?wPUkhIBwuGM0ksNEse9UbsbUG7WVPYoopVlymwPY9U4UFBERzMSXRZ1+qH5a?=
 =?us-ascii?Q?+g2mjKsrcVEvt2kwLg4GF0kM5GU06vGIHNbC5RRal5fjs595F0qDlEpXDnuq?=
 =?us-ascii?Q?zTrpQJeRpngfne31KFKngd4+QdfOWbR+GSF0Y5L73lCk3O79bLfs10OiVAyL?=
 =?us-ascii?Q?5EOxP9mBT67yq0BYLFn30uOQDPwBQWjLrn6sJLRZD7r2YGAsEDaTWY3M98FU?=
 =?us-ascii?Q?vFpg8rIrCMGBWEsEA+bx4mO4OcyAAY9kqrwRZwd3nIJFwXkzMy01v8Iu9vi4?=
 =?us-ascii?Q?3nP6vfpk2jg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HYv2JF1IyevKNSCkwNN8XBxtqcvOLdMlVjMJFrfnxaVb39m6yOtcUPC0A+jy?=
 =?us-ascii?Q?Hyu/WuapaZH3U1y1pDXoBuI1rDlxho0EtifQJu8roD4yEvqBr7mHJsrNjSI0?=
 =?us-ascii?Q?/hh5pxJVVl2NHvYlNSKKuaC5p2uZY+kUmT9882eqhytiHAyNtlmI1N4c9YiA?=
 =?us-ascii?Q?IRlRnbOZy421Miq0w8UdlSAk3yl/udDa9jicUPChX3qVWSSHVHgo3X/8dOi6?=
 =?us-ascii?Q?RMn9e9da+8J2/xIqBGA+MlUlm2PvFNW4U1Spq7wDAd6H+R4KcLt5/ibYP+C1?=
 =?us-ascii?Q?9OpBtLSnM8LhX8hjV28xnEZ8YWEie3JWLsC1NiYW6VpB77r3G60b59FCkedw?=
 =?us-ascii?Q?hrssZm3Fdh0pu0FQll9EhycnxATMpOxxVLxSXr6tRE9cu5kGpE4HvSZB36Bx?=
 =?us-ascii?Q?18N40LNhV1HAr1x8wg73B3XnIymlRk2OCoHdxr0x6BzrsxfE32tfI0zd2iYw?=
 =?us-ascii?Q?Pw98xYzeamNN4p1JNKBaOoh8bfwOTSWZAl1AyjuPICQa7m4iz34GaFT+J51D?=
 =?us-ascii?Q?11ZfYnuR0VBU3f3R9VavhO2p6UlD2oKPxkFCeOs1MGMN7cdEcjpCvz6MHtuX?=
 =?us-ascii?Q?lOtOEreyodjeHR4sM0O64TkzL3Gx2ATZf95uyHKd818+3PZ8slshqTU9uk3f?=
 =?us-ascii?Q?zPZkEm9WS6zFjGvFWT3+BicsFZZghd7nKBjPEMmTlNGDX5qoVheFgvXFPIZr?=
 =?us-ascii?Q?wC/X5lCM7xAleUcPUtYbUnNP+3q11DSTZGP/dZtH8W6C54IJTIL+NThYUwKD?=
 =?us-ascii?Q?fLWuWHJzYkz+5V8CaDsi7r7s73SThDuCZeHBvNgmU7ztf5Lp54+dw7JquePl?=
 =?us-ascii?Q?s513tCrcLLWzbmUtorIyYR0TRoqveITFIvoJEVGMtigtfCb0gKOYV9wJmnmM?=
 =?us-ascii?Q?8OlCh2FEalnIuvxtYTMiis3MSE8mjRCj5pn/UeScdGnjimstBinYhBfAh2Bb?=
 =?us-ascii?Q?VU9fQMrLur0WT9JHt5Wq8k/rkyZEIJGd8rUzjC+jpXiwv4SniGNJA5mXZj2c?=
 =?us-ascii?Q?w//ivrmtVRS5fHQaiuXeX/mZZZDh1PM8nQfR13qlMCHdYGAD4VFof5NuhRrO?=
 =?us-ascii?Q?8+h21EspvLyle+iBJrjVMaDdyoWX/3om4VmuVPnU1oaBSQZHHEme0g3n957Y?=
 =?us-ascii?Q?uCJ1s5fS7NeZcWfw0i6mEfSF4X/pMKhl7FTFYOJcP46jx+hU/KHmkAMwQK+i?=
 =?us-ascii?Q?06dprd8CJGc0Bw7BVKMZS4l9YN1CT8zObhfMvBFqgAstymNwxMwnxIORUYBm?=
 =?us-ascii?Q?4IQEjEAKPSs/oZl+BmnnlnUugtAF15OLflGR2eNlRBrKeXppzXzIyLYZ9LN6?=
 =?us-ascii?Q?5m8b0sTWbX8wmuSot9nQqtXOYvV2mQriPf8WU5YtphAQ0sV+JL00lEeqJej+?=
 =?us-ascii?Q?r2M07Kc17tE1Ay0TmGl0LlXbIQnE8oMQ3xNm9K7awX3+RiTRu8iEBQFNtsPB?=
 =?us-ascii?Q?v1cx6eerYh84srXhr7qTRhIyUs9BoQO3ba8PC1ivpINtKwVwsYiqM0vnHrAD?=
 =?us-ascii?Q?+svu8qNXCnE9t10dJmM6FBXjwHvt40MKUxw1lQLlZTBXrUSpS/LtcRN4CK0U?=
 =?us-ascii?Q?9jgNvAJxpKKzX8+ebYTUreNUsMgXHRrURPjo1VpttmnhBButTU5BEPWOBYi6?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F/eQPqnjbA7URN8eZqfgWW7LoZv6YWftSiAo/Pz01SRQW/+k9Uy3Joc6DZ1lT9i9gEEQADhtO86tR8KYg5n5mNFVC/oVYETgO0u6Nl0PVv/+SiiHRAoRF5ko2rjyvkqQ0egZrWoc11c/Ht5ZbNkcJ9rEZtx6SmRv7mCp70LX2SVQkPS7nfeZ3lth1SURW0VaodgJfv9lRwLFo5Nr1BGFNAUmYbIhxVDowON46VcFVCNVrKk1jRRvidim1Bv+mLYt0huSpe3NUIVuTatmrquW1jqf2MIVm4mIQSiuRgXUwCDq2z6C9KtQjXQqf61hjUD92tJsAwUXvI6PtQPl1VhqvFuVrRoKXBIFjXCT++RlhonxFJwyl5Yc7OcYRLxtx1QF3IViQeQfWi7EL5Dc25VjMnQ2Fk3TDd9gnUYvpF0ABa0t4V9rTgrJoTkVnwGMDqI4HOFv7yr8ztEH/NSwSLjyGrmp9PL+3jBgr2Q+Td7ySaAXkOUaLaSBplc0ptdVO0qSiemJMhhxO++7xr9yvfMM0VNtPSESjyz7QiF66b7oB0HFJCPfgabNoNIygei0DzP5DIMjfYy/XUnpNzmvfRNUKnsru1ApLNBPOjRuraKE9N0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16381772-76a0-4283-8b84-08ddb7c91a50
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:27:31.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3apfwheFOtHUb/KqSsccnW0pD+Lkw5gfICrK9D7kNSH30qUUQwk4roldcsozP36+2+DtOhAEfUwbLdMs/Lnip8hSOJ6zzFYiLcuvYzH58Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7255
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=875 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506300093
X-Proofpoint-GUID: fj4BO7j-1bed_3vz6kB9GvSEF0ViVJ7d
X-Proofpoint-ORIG-GUID: fj4BO7j-1bed_3vz6kB9GvSEF0ViVJ7d
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=686274a8 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7UiBCLYAQFpmZOxwHLAA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA5MyBTYWx0ZWRfX7X7RoYzBTnvy E9uFPRE9eF91vHPS2uCttH17zVN+Rue2Rrj8NCXTqqZT1VppCzWq2KdKjqtZS43BgX/bp8B8LaY boqMLRFkqB2XHDeS79w81UnXrQsrYl6GfJdDyXHRiyq2al8DSXQPqBfyMWHYXugzfwYxtLjA4er
 PPkfQ1ESSMwEWdXtiErOQyavswOpPQGcgAH54Y+paFEAEc8x/gFKxjhD5ZfH5UmXaZ4jbznBF06 7s0VENRXe8hJJitQSJRoEXuIurKIdjX4bgQCJvgSxC1X5t9qtbCujE5OWmPZX2HnoNHCT867ixU LjUOSzq+yFTjYJQxRUfXm3rWT2GP2FncIcBDk2ljzTl9nLPNH6mzZEPI/QYaQJV6dknmrpr76wd
 Uo8lIWsKoP5KowRg0jDMLm/KReBsw0+lwcG0QNCZn9917cPSZpZJ25wOSPw4of2PeAttIfpY

To reiterate what I said on 1/4 - overall since this series conflicts with
David's changes - can we hold off on any respin please until David's
settles and lands in mm-new at least?

Thanks.
