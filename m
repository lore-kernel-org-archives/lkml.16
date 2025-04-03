Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A8E24E4A7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688759; cv=fail; b=qkMGKtLyLyfe0SapGIMMcB/XY7yxjbvFXtabUaHIrwHh8fgA0mml1rVN6WfXrHRIn3WULLD0U0M4WkMC6oWDLTdxhrIe3kpfnOslwIidAVwkGJO6YhhfGJ/EVgRw81TH7Gp1rxuyw9SuqJ1JXnRCt+BVK0U33IKMSCuXyj1z2RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688759; c=relaxed/simple;
	bh=vIv4ngHrzNyWjzcsJzgD/hNPor0XGgu46FfmYhGs3Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m4wKXcowhBfJw7PtYSIgVFOTr6jhv2+drI2wenR8F0kL5YuqhspdOzhyz9XPEdblnabKe9eoEqr+gR+DipwSUgo+o/9MTC9wbdm+zAtTMpDGFs6mDR56Av/D+tDfE+fK37pgdrhnL2XG7y+Ok+RuRjBPzWUBxDpQXvUjpjD97bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iJRr3wu9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZbBO4POe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iJRr3wu9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZbBO4POe"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BHWJM000561;
	Thu, 3 Apr 2025 13:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=SJ3kZyhnVC9pd+cGMk
	dV6+yZXNkcx/UZkwhHCgW8BBc=; b=iJRr3wu9gkRraqL+oJZiqLdX1xd2s6XXH/
	goWGKF8t8TWNCBQEueHnvOvlBEaUQRg0L+/Zg1HYBANjyEucxZAwaL0RP+MtdHpG
	A8HozB9kHoG0Fyu7SE8G0OUMNyatH+4OMx92umW6zLV90tIA+8aSxxEPbNV3wUxS
	3kzmm58oUxySijrXGC/7f+FOFIUpOcB5cVqmEkgvl5edZxP/51+Te+7Ob9f3l1bZ
	IsqaNmZlxA3wtdejYRaLIPF9F63TU7Bw4S8wOG6XvSoUOW0i/6oqYk0pvUkMIKdU
	r9fPOPUCBFmWj5yLjenuihCiUTlK5S9BdkY4agC7TtrD5u9ktthg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n2d7gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 13:57:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 533Ds3nZ003380;
	Thu, 3 Apr 2025 13:57:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7ac38ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 13:57:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDz/mJP9EwZeZZUI58p7ti8hj9poXfBVSKKRXDGRnLxNqgDpdlfCDwWJP17STUQZIRhmxF5hFcSmsTCTwpanSU81vy4Iyr3zOGE6HeUpwwwqL8fFPt9MqODB3eqaOwAGetlh1P7UBUsnY2OW/58kFA6jawNo97vE0rQlua2V45c0ZPmBF11+cXIANOrn36e/HSgx/UG8bNOXD2VPSz9Xs2XEh/oEUsMYAfBnAzT1bSKzhpeWRinAcgBvtVqSdxNkdhVLDi/rjh97alkhrQXI6xZJUI4Uo1aRwMNEPGQ7yrWY3rYYee/VDxlRtTU3MA90EsEhLyCM+jaJ/BRA+bs+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJ3kZyhnVC9pd+cGMkdV6+yZXNkcx/UZkwhHCgW8BBc=;
 b=XfY6bpUS/875Sskio1Ls2B9OTibX6Lo3bnrqxPzObJDRSYRSBVIU2nfkndrMgYx8IUeV4cW2P7Rtr4jB+v55dmJjKUsgZk9HQlSolKT43SUO1AyZXHpNJuaTSWy82c0lurqMRaW/XdSqrKW22RBGUtXu+Lsj/QUQeY8iA9NNkHIAltB6M9Jd9VSgO1fQIDykiWyw83Lygq6ZTo9apgd5GevK4GmF6OusjK79YoXsBPeW0nJ2fZEeWVtc560sx+JBl3CZ50HNRFzhbHzmgGBTrNSNs3YWmvHcFiUtz9iTvvziNEXkbs3Y1ZM5Psy4RGY8iwZ5LFNDBixRo51SpJBX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJ3kZyhnVC9pd+cGMkdV6+yZXNkcx/UZkwhHCgW8BBc=;
 b=ZbBO4POeTzLZ6q5c6PKBPyNje9S0by+aYCO7dQZZtQJa0JUr0Qiqh/pZPlM7a8zADZMoH5Qo9J2zoMOuA9Xs7Qw1OIHfQCwhKxAsTglaDbdD1F3U4pNgWm+ATnQRyN+PLOh642g+d3sBgG5aHfqJd+gkHF2xMPlOUFJ3qH4u2ak=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by MN2PR10MB4304.namprd10.prod.outlook.com (2603:10b6:208:1d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Thu, 3 Apr
 2025 13:57:53 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8583.038; Thu, 3 Apr 2025
 13:57:53 +0000
Date: Thu, 3 Apr 2025 22:57:47 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 0/2] Implement numa node notifier
Message-ID: <Z-6T234S88wkH0uh@harry>
References: <20250401092716.537512-1-osalvador@suse.de>
 <78c976ba-1eaf-47b7-a310-b8a99a3882e2@suse.cz>
 <Z-1tzl2NqqRUYyU-@localhost.localdomain>
 <e1ebfafa-f063-4340-b577-d1b6b2fb5d11@redhat.com>
 <b9d5a23c-f97c-4d11-b468-5a83ee2e25e2@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9d5a23c-f97c-4d11-b468-5a83ee2e25e2@redhat.com>
X-ClientProxiedBy: SEWP216CA0141.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::8) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|MN2PR10MB4304:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5b9461-4b94-421f-6d7e-08dd72b7874e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bf1ThxqpCbzPB5wzCk3hJ0dXud7D5bjrxqaeuriKIwrEp0WqbYgMwZcZFiMe?=
 =?us-ascii?Q?b+8EZdrnvZyZKNICevqMedWBMr9J/k0Vzd4w4/gV39G7fB49wzU0myvDjVuZ?=
 =?us-ascii?Q?+x64TrsN8X3iRvjT6chjuq+StHYXExMzxgenOspLjJjkT7Ziimo6gUXe1ChD?=
 =?us-ascii?Q?kxGfAEW2zZFWMLOQ+tJPkdR4AVT0k9A6egxviPHfQBS8ixA2HmzqTMcdi9ss?=
 =?us-ascii?Q?VPOFUBTSFmngJii176W7X9G4xPwm3EGO6R2t7Cn/OYwBH+JK9uuWaUb2blAc?=
 =?us-ascii?Q?G767OPwoDYO45mgkWDkJBlELJ99xJ8rADQhz6AjDJIwl1dqwEBGabQOOBWZw?=
 =?us-ascii?Q?XKCIIXspnHbr2Vx6ZDbu3CC1fe/5KY0LWl+4eBduP4CWuS61Apt9tF1duIu8?=
 =?us-ascii?Q?duKEYN73okatPpIW4WhwTehDyoEKJj0Bt5P+WeEvjbEQ94MDAZZSzy1D/Ez0?=
 =?us-ascii?Q?tOIMrTXsnEd+95liNt08d0PEIHovDjU4bGAxW61rq6USgNxuLSo2O0grdYvB?=
 =?us-ascii?Q?G4IbAbHvT2I9MrDVOrSlDGsE7YjMXm7XjZcSKTeVeWoGYBv/oUuZdq5mzgoG?=
 =?us-ascii?Q?Nl1rpyFZkpzoJUsLL1eL2eqQxPPWcA9wQa9fr31RNdbPEhlrOa40MaX33B96?=
 =?us-ascii?Q?q/jWmSD/4KtFBpyo/+54+EYAxCg0VYdIKv3DfpI4z4XQjcNzuXk/mt5eVi0I?=
 =?us-ascii?Q?l8Y47lr5tPH4qnH7mQxoZ2r2nZmHmeJmBWIPxJyshGqDs2ByEfuzQ1rjKfrH?=
 =?us-ascii?Q?Gr3p03hLNzA2uGmQ0WXdpqD/cy+QCA2OKOz6AoRqQDAxtLm1UKYbwUb7uKTf?=
 =?us-ascii?Q?Fiu9XzVx6+gSwEX130xCSJR2NDgfplSkRVeaPd1RwhunRgqUvWrkuyNM8DeU?=
 =?us-ascii?Q?oBMe5ZUihcrlGWfupnl8ibpZ7oq+nTr6eCNvPpQOghIKgXwhfRYEQt4lQxTE?=
 =?us-ascii?Q?kECi+sOWnDiIZJe5SoA5+4Ie1odztTs23bZ33HWQILb+Zr26q73bIE1qQOjs?=
 =?us-ascii?Q?vtWwSxa0tcZ0B6MJXE8lEcPZlJCaifSTUjJxvi1BhXr75r1T+LFYbG5gLA0b?=
 =?us-ascii?Q?b4eZMIlmiFF0grwVOqgecHR6cwB00Pp+IEv8wnlJBeDEVKa40i/8z6O1EpcC?=
 =?us-ascii?Q?b9cslp0R1jwaLrvIvb5rPsvf7eZX2CM3Wxuq0o0yjzjQ9KHoIXM3MH3kt9HS?=
 =?us-ascii?Q?8O48v8UfExKG9tnD3l0CSAzRMpxsAXVZ7vmSNKiYZ79yC6cvjeMiFyaeLzzB?=
 =?us-ascii?Q?jIuGp8Yt3agr1OBRtMhxbGxGRQbwYuze9i/jc5ueMe76ok1ycBYAFwzNeV0o?=
 =?us-ascii?Q?7JipJ2BIi5HoobpKINSN950LoaHOgN+9bUIZd5KqyQB94+tIs49nDUNGfCgs?=
 =?us-ascii?Q?eKlOH3PBSMMlAY1qy5rZFtWWkMtU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xS3tHXOvARz4FLK6hEyqV54SczWb2I8f6JB089uU9tR0Q9Qn1JpiG2HTmjJ3?=
 =?us-ascii?Q?HZm3aYFmoEf42zBSJAWYHCSCAyAQ34oB/1VqB2tp0xIEKDmy/S/1f9EjoApA?=
 =?us-ascii?Q?kGc/3Fm9OQ0okL2or6CxZ3/H+RSxSorAEnEE3GQ/56DIOgI65LLY+Oi4/HL0?=
 =?us-ascii?Q?ty0Amwl97QLZi9scIWmUXY088MoIWqfsqwxiWkoNLTaiRhK+zPt4Dr5lKlMg?=
 =?us-ascii?Q?t7j0OAY0vjXyhC4H8/XmZUo0coHN9MyrjBBReFK0pg/NZUMQdVDvBlL1RluN?=
 =?us-ascii?Q?H3IgB7iwHlm8qmhJ/tHOAdBOxJHp3owqgO9LQ5fhj3lNPm7hG4uIjQBlD6Lh?=
 =?us-ascii?Q?DFtUxtmuj5VaKmWpDZSBV38SaNH1HC+DrGi32J3Ny+uaXRa5FrFRgTM87xeM?=
 =?us-ascii?Q?dH1t6wTx+A4dX/r8vVFWpmBKZUOrwUWzt9we0ikppsBdiSDeWx8JcJZcrIea?=
 =?us-ascii?Q?o0ympeuzwfvwhQ/9wFrd6vgwH4CYfHkMQzsOwZSBcSo1Db/dH3/mbQfSue7t?=
 =?us-ascii?Q?kV8XJP5GuOuNF/Ny4WwVgMm0xQCIE34WevWwhUOrysOp6aVUSH5Lp6qs6O50?=
 =?us-ascii?Q?RncMY5jgtAeFCfUW0wjDGFF7BlcOC/LmEp7ivpI5TAHAeLOwZRoPQ9q5Dc9/?=
 =?us-ascii?Q?9JercRYzI46NUxlWb1dt6axDQivy2QnlGbDT6A0uUu3eN3KPNlo7cSv7dyg9?=
 =?us-ascii?Q?v1cEkgsia2b47k9lqNxaZ2RGQyRo9SMGIFl72vLQ1IpmQ2rVoK/ATBoCsSsz?=
 =?us-ascii?Q?TOlpEjdV/F1mWJ6D/T17HcC0l1tW5grVsjcdiJcBxh5LNXmU2xMmAvBtFS0L?=
 =?us-ascii?Q?rtVNs4jzdUxSqN/vVznuEG3ujgnc06ZuKcZSOPdTJXCWOPsCzU1nfRReIWej?=
 =?us-ascii?Q?ahbnK+xhN8giPd3cs3S7vtXnb8aZbE4WDDcddNm3c3VpBe2ipjxJfkKHhmSx?=
 =?us-ascii?Q?7qkrMwxhdHFGw+fW1fvn8PolO75umzKcghpdvWNWAmlLTfPpABYICYkmtth6?=
 =?us-ascii?Q?nlkN/7uaHB2ZX1jjc4FHcTil2jYiTEt6DX9cRwO5IH4Kxung4nhb/12kXHRn?=
 =?us-ascii?Q?WdSozXMe4A1ZLZHSNFokBvofBwHbjTJPwE0f6JWrQ+mYO0rETqrc08OEXFQZ?=
 =?us-ascii?Q?6osHVDQ7vH2M8lMOSGbcT0FDqjbGrV7B+HebHycCS8f+7ooBxoOALUa6XazX?=
 =?us-ascii?Q?fgQlYj43HTEnoOV612hJJMkQ+SD3IJYMJberGXRaG7ptaf7ONzlXsxPS9tCH?=
 =?us-ascii?Q?bt0EZ0f7/zpt9VS0efEuvE8RDfTGVIR+Ey1G93CYwkwUvk4HFjhcZ1rlc9Ip?=
 =?us-ascii?Q?wvNd7OhvQ+z3eMY7jmHR7WmqAUG9eIiKdw+GCHKQvDhwiWxcjnYIIb7grLEZ?=
 =?us-ascii?Q?n1OwJPfcNTRLRhK2wXS7A6DM9sUw+p1OHnU0C5/VNwViKQ8w6dCWWGzjEvUQ?=
 =?us-ascii?Q?kjhTtoJE3aAufGb3D14JI0F8zP9Zdpoerae3/xckKgcKZ4Qu/H1Qygt6rMTj?=
 =?us-ascii?Q?BZewOufO8jSfQplOk0hx2VM06ex/uP8F79lepRGRiRQaWroOxZCnvLE3cuqm?=
 =?us-ascii?Q?xOOT2S6zNsh0yH2jyKaeeQexu2TYavpUA0ciMLAp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8g4IqRv8oljXqnwZyeGeex4xsrltzhSk/QEbBQhVANt3r7ZDVzvP1k5vgMK3gUMDDAK0GizCQDDVgYzrTjyfWDmLUCeUAEGTGMDOKbMbifTffEdHJuzVQrc/zgDqJAmBsLvw77OtYHA6KTBNP3AeMxaxm0TmMXsxoXPUKZ+a5f2G8ZsA0Rl5NvV8/4cbQ61yR2yHlM4GPb6pKJNI426W8SJcFc1AlDPkiEcbdErffNz4a6o10RU6i7TkDUI2XglKQTRNl+zBMf75oWap1RYCXLIH4KD3YhwXIH+NBuQTQCLWqSH783Rjk0tm3jPsBUYut6HJCOA7kPAVxWimuIw30Ya/9YUcbEpM3hOElIsSEhNTxWUj/xPhfoRcJfcw0r9EFW9MjiK0XOMss7beVT+IYzcaoynC8LgC91GXj4ws7qzH799rS/bs1K2tKeEr2NlEfE7UUZCO3JNqDdowfd5hc+bNqHtnfsVY0xeJpvHi5s8mMLqUP8EsIRF6tG1xJN9tGMpIxHFAEy7weaznFb7h6J0g40uttHbdIsBo1b01y2wD61ghOdF2j7HtG/M9E6MwDXZmvcqETQBhLubaURK6w5QnCC7f4PQh9K17F0vVNC8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5b9461-4b94-421f-6d7e-08dd72b7874e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 13:57:53.4907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNWq6XvPVXSS1vHSF0WThX0jEW43CIMKmZ5H3alOnoSccKNWsdrQHxpkYa9oiR/gWgC6UXZo8iWCKjM0ml6XKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4304
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_06,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=977
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504030063
X-Proofpoint-ORIG-GUID: 4riEiSf7X7FS3PA16ViaCzOHJPbxI_VX
X-Proofpoint-GUID: 4riEiSf7X7FS3PA16ViaCzOHJPbxI_VX

On Thu, Apr 03, 2025 at 03:08:18PM +0200, David Hildenbrand wrote:
> On 03.04.25 15:02, David Hildenbrand wrote:
> > On 02.04.25 19:03, Oscar Salvador wrote:
> > > On Wed, Apr 02, 2025 at 06:06:51PM +0200, Vlastimil Babka wrote:
> > > > What if we had two chains:
> > > > 
> > > > register_node_notifier()
> > > > register_node_normal_notifier()
> > > > 
> > > > I think they could have shared the state #defines and struct node_notify
> > > > would have just one nid and be always >= 0.
> > > > 
> > > > Or would it add too much extra boilerplate and only slab cares?
> > > 
> > > We could indeed go on that direction to try to decouple
> > > status_change_nid from status_change_nid_normal.
> > > 
> > > Although as you said, slub is the only user of status_change_nid_normal
> > > for the time beign, so I am not sure of adding a second chain for only
> > > one user.
> > > 
> > > Might look cleaner though, and the advantatge is that slub would not get
> > > notified for nodes adquiring only ZONE_MOVABLE.
> > > 
> > > Let us see what David thinks about it.
> > 
> > I'd hope we'd be able to get rid of the _normal stuff completely, it's seems
> > way to specialized.
> > 
> > We added that in
> > 
> > commit b9d5ab2562eceeada5e4837a621b6260574dd11d
> > Author: Lai Jiangshan <laijs@cn.fujitsu.com>
> > Date:   Tue Dec 11 16:01:05 2012 -0800
> > 
> >       slub, hotplug: ignore unrelated node's hot-adding and hot-removing
> >       SLUB only focuses on the nodes which have normal memory and it ignores the
> >       other node's hot-adding and hot-removing.
> >       Aka: if some memory of a node which has no onlined memory is online, but
> >       this new memory onlined is not normal memory (for example, highmem), we
> >       should not allocate kmem_cache_node for SLUB.
> >       And if the last normal memory is offlined, but the node still has memory,
> >       we should remove kmem_cache_node for that node.  (The current code delays
> >       it when all of the memory is offlined)
> >       So we only do something when marg->status_change_nid_normal > 0.
> >       marg->status_change_nid is not suitable here.
> >       The same problem doesn't exist in SLAB, because SLAB allocates kmem_list3
> >       for every node even the node don't have normal memory, SLAB tolerates
> >       kmem_list3 on alien nodes.  SLUB only focuses on the nodes which have
> >       normal memory, it don't tolerate alien kmem_cache_node.  The patch makes
> >       SLUB become self-compatible and avoids WARNs and BUGs in rare conditions.
> > 
> > 
> > How "bad" would it be if we do the slab_mem_going_online_callback() etc even
> > for completely-movable nodes? I assume one kmem_cache_alloc() per slab_caches.
> > 
> > slab_mem_going_offline_callback() only does shrinking, #dontcare
> > 
> > Looking at slab_mem_offline_callback(), we never even free the caches either
> > way when offlining. So the implication would be that we would have movable-only nodes
> > set in slab_nodes.
> > 
> > 
> > We don't expect many such nodes, so ... do we care?
> 
> BTW, isn't description of slab_nodes wrong?
> 
> "Tracks for which NUMA nodes we have kmem_cache_nodes allocated." -- but as
> there is no freeing done in slab_mem_offline_callback(), isn't it always
> kept allocated?

It was, but not anymore :)

I think this patch series [1] forgot the fact that it changed the meaning
from 'NUMA nodes that have kmem_cache_node', to 'NUMA nodes that have normal
memory (that can be allocated as slab memory)'?

[1] https://lore.kernel.org/all/20210113131634.3671-1-vbabka@suse.cz

> 
> (probably I am missing something)
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
> 

-- 
Cheers,
Harry (formerly known as Hyeonggon)
