Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561981CA9C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891350; cv=fail; b=QnYv+R/gSy7vdhgME23gh1ssW/nTuuDC2Zq1vifH/1g8BGqnD00R7LXsbfKu4HrL35jFAuACThP9LQCJ3/ZYnxcloRGQQWnSj6CYVs/WOf2tymQaxE+SDvpzrEV24icAZcA1W1ja+BeB8bujS5d7e2kSZi/iKa6UGyJigrc32zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891350; c=relaxed/simple;
	bh=9cJlgfXBZlfWNR1+eer2TceSpCDyzZL4rq1cjCzsucw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WloCmiqeQz8d2Ar8PECKiV+aKtGBluso36d7CWe5/Y1m/xqU7WSi7ZwW1HYvMkv/MGSW15aa7nLK1Lyu8PkkXRoXBM8BgwODDUPsMzH5ICnvfzfr/Qx5Pks/UY9dMQZV0ttcdu8Joq3qJ1vjWNYXacQpTEtnaectqt+mLBIw4A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HSOlaWy0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=B0xE8oAf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HSOlaWy0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B0xE8oAf"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T1gwVn007211;
	Tue, 29 Apr 2025 01:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=AxW+zpEuVdYaJZU+
	XIe3E3llBBEK8D4IwWHCZaQk84I=; b=HSOlaWy0DLcLcCWhlobzUeVf30l9SsFD
	JxLO0smDsuvIcZknNqs+lLzHVZy2d5+OykEvsFOcrNOjURVYVSbVoUFiD0I979+K
	x55sUe9Y70gppsvugn127um2JddnUXVFhsH5lhEs2mxp6g9nKxVy8WlKg9EIE2Oh
	+7kcmjdhijqqQdPW3O9HCcsSEzIZ7oIwLsBxT+1mEgbEq/EgvbNsBqNGXckHP+i2
	8QdCnxcM44Sdt6D/5T5tCxjtSpgkAABNaVmvbTjMCmMZ6OQHWVnKtvCcH0M4NQmw
	OrqR+9fpakJ2SgmlQp8XZBIlkcbC7D0wjYHJESA//lBkEs7Q1vzxGA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46amrer185-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 01:48:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53T0OR2q035576;
	Tue, 29 Apr 2025 01:48:40 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nx8y43h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 01:48:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A73JYBA918ZK/6Ffk3DiAzhdwq/MeBA8w13W7kjNea+O/jv6GxvK/+iu/oMvWoPalQCKr3LN3lY+brv8e6lh4XbFnAC9Do32AhrkRMkkYYHZUoFHsBCEwTXbFYMwnHYx70erfjhGQX8QWhR+pCS4qfS+MBCAUq3fR3cvLrZw/C2Xy6yV75gTSnFxI2xSVz5XBrrTyyt5n74Lh7K9HMcTT3facFySW2vnFCT/yySN4WEZPXiGfejDQrmEEh1OgwOLLJvIETKTQWcI7C1dhRpSIPHyYBzeTQHIDG92JyttexHaQwgoXgGST2noDmAD80MFd64muf6lzNhfr4j36jlHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxW+zpEuVdYaJZU+XIe3E3llBBEK8D4IwWHCZaQk84I=;
 b=liCQ73CwOWaRxuuytaj6edENwx7FARGPcZnS94xXp0vJIgiGuWI3QSx9L1T4FgcmCkgf6ckoNm2FSrN67JJh8TUMcJWW6ZzsyBIWjO4L3mLuwkxOrZZcnC8V2z/K1Glz2rPOBSyli/LgDjeayPa0oreLz9uy7f6BfkQOJ+In5lLKGc/lZVl80Q/zMJ7FrzlEBF7OYW7HtPfE0i1gcdfTZIoE2U+0smMbPamZJjjsBaeFIAm7CY4vD7Gr4eJDD1yd2Bnssolp16p9W7C0vXQrbeHh0lzmgTU9GxzmffqpOdIcFx82HMIcGlcldOZNMYXJh2LCNEyVytAyyhJcjuZ52g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxW+zpEuVdYaJZU+XIe3E3llBBEK8D4IwWHCZaQk84I=;
 b=B0xE8oAf/Vku1WDBsPVytgmPFsJYQcB282AW3zDc/p9jQ2evH6ZjhpDRQhSV0PXJXN4W6jGEBcEL+G/9dYHAdj5/4PYLbE1BqNGKvPGYrEU5r/DXqLG3cRmogwkO5osz1N0/gc4+mr4aC3WpNF2huvEzfU64LNFHUDQ6U7ZFytI=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SJ1PR10MB6003.namprd10.prod.outlook.com (2603:10b6:a03:45e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 01:48:11 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 01:48:11 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: "Liam R . Howlett" <Liam.Howlett@oracle.com>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
        Hailong Liu <hailong.liu@oppo.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: [RFC PATCH v6.6] maple_tree: Fix MA_STATE_PREALLOC flag in mas_preallocate()
Date: Mon, 28 Apr 2025 21:47:54 -0400
Message-ID: <20250429014754.1479118-1-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: QB1P288CA0020.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::33) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SJ1PR10MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 352034f3-508e-40c1-14d0-08dd86bfe5b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Py9FHVGK6BCrapgSRoIajjnEPTNN2XDyn/Tdi/zH+gybyReGJCu648H43MGB?=
 =?us-ascii?Q?RA8UhMNBsmy9l8wUb85oBI/HJ1/8Zx+vFPZpM4Dfk/HA7tk9Gfs782AHhXuY?=
 =?us-ascii?Q?VqrzmBbF0X2mLG1INc/p4BCa9GLRnFLuBSkABeV4yHnD5om1ZlUI8Emx0i+h?=
 =?us-ascii?Q?rjpKg90Lbin/DZEHXPN4sEaMiAukwkY7fI3X5egtRTCuqOC+OkiR0U4H4OH6?=
 =?us-ascii?Q?gXth78aL/oIQTryhCpeG9CFfegIOACS69egrAmWg+vpsmI5BRdR5yZ1K0jhs?=
 =?us-ascii?Q?rkLmYtLffrnrHKQu0SFipfTaLxBBc+StxG183rViDqUacmFEPjfbMxDamAdG?=
 =?us-ascii?Q?X/B7Ppsc5hhoyjt5OIx2qSbjRnJrlrPDWH04iyN5VRPOYprKXY78NPZkEp5d?=
 =?us-ascii?Q?PjqezKVvIF7lfuetC084pALBoNzXyyjb3ytPri53pQ984si4Nw89YhZbgBgg?=
 =?us-ascii?Q?uyJtdktnjnx9CbiOFdDEgA7bIwjfngbdOoBHak/1b7f0T7dzXVfJ+3fHpOpb?=
 =?us-ascii?Q?oFTC2X6PwvU0DP073/SklqNHze+MMdTyYbV23mR70vhRG+4Z/Eu2QEmm1Maj?=
 =?us-ascii?Q?70mcHsNzVJOWL+HngVQvNwxEcL01OPtTqyfrQjOPLcT6OVP7bd49If6R3cVw?=
 =?us-ascii?Q?1pvFvHsrkVItyHUdv0GGnrxCj3yNRl7QHAVpAftoHFXE31HkoN4RLUNs6TLO?=
 =?us-ascii?Q?lRuuJwvpLSPH+fg9N5Ud8GD/MdwDNDjmMHesqrzPZfZD9yQTFqcu7g/9gWFP?=
 =?us-ascii?Q?Hd0e39Hnxp4PoCfNX6SLxQ2vcie/pWyxcEDxVtNQOWpc29r3lMOgB+6RByvM?=
 =?us-ascii?Q?YTiBIqI26vWAL2DhiDKFBuxOPvepxB0miGmF4RfCklpHgTEFcnodK6l54omQ?=
 =?us-ascii?Q?MIwZZ2DEhiwBMDipwYQ/bSrOLtF6Yzqh8kOdqXvJ3MBtHhb8ItIolvDSRRaX?=
 =?us-ascii?Q?G8Djsc4m9aB3G5UJXmE4ZN1UfscvQw684yhnwrSR+uNkzhxg7FAAdOXSHLsZ?=
 =?us-ascii?Q?v9nC0Qe4JekJbtrZnto06uui4qZ+jhFkEBGeisIA2QMMzZElbv1N5bbG6QlD?=
 =?us-ascii?Q?MmFyicMFfnVaDSwtoaGdqcLx9cY5+oz2CSLMj5r4i7mc5etqTjCpg2D2abYX?=
 =?us-ascii?Q?CpHzzTdESnld9yxX8GTrDQ+SXfWD1MAtczVB1XU3U+Ej+gTislxVpgxuecG4?=
 =?us-ascii?Q?xuAJsIhbvqzMIQzexW3o0VMaYGf8yh/rR30/TjTmdvRqc5kNQGtT6JnoIUwy?=
 =?us-ascii?Q?QdfsE2jf+aj96Tk0gtBIinq+Qb471RJWNe+CXDyLJFYHrNZAUs8re9c2gnN9?=
 =?us-ascii?Q?nQB0six+WAf8yHdLx3gYSf+O67AzdhFGr+2RaeWGcKra8cagzDkR/UPLWdGj?=
 =?us-ascii?Q?tfViyM9QMxKlQJ0pw7KL7Q/OdmdpCpCRSRhVySPDYCNBD17gD+HVa0F5SiIy?=
 =?us-ascii?Q?h3DM8rSCK78=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GUKFpM3f4mhmsBjgai9sxaJgc1zq0JIOsVK3MJ/0E1Xw1csIMkDMZLRW0DzS?=
 =?us-ascii?Q?I13k/dutzEr4qK7hqZ2BxMAoiuLRPe8xLFfQLoNPbS2MIAmLZh3iGn3gc9pf?=
 =?us-ascii?Q?2P5VKJkPeqCJ/QmjxOuFcz1VPPL7O2qo3tIoPyYLOZRAs326ZVsbZtU7COZz?=
 =?us-ascii?Q?CjqhFIw8Oul1Uqh5CzkAJecFBkrcHl2ptSrvXwlR1G7rihgcMSBexHbPZzji?=
 =?us-ascii?Q?BaN076afq3TScMClL3L7Q9DO54QSdr2m9vr2woskQXJUSLgX7VWMOefV8t8k?=
 =?us-ascii?Q?5qDA7S8EnpAUTU8ntStqNPcp/Lo9PJWUWytuULPHRr9D2vI7h4dodMlCs5bv?=
 =?us-ascii?Q?YtYWZ5iwSV30iulvTiU1koo906pfVQIMENBQEfDKU6xCDRPsLxpwJrp00vO+?=
 =?us-ascii?Q?MBAXktZ5WqacbBR3xA6x2HaOICodjPmmMAfNQjuV4A2lLdz8+8wa9eaxEiEM?=
 =?us-ascii?Q?Bq04pX2W/pU9vaz16g/Abej1+eK3DFwv0WEk1n6dXwU/QpaXN2WCiES89TBT?=
 =?us-ascii?Q?K9ROeC4Wct1B+mhYlTAFlyaAnDN87ShS9dDb1I3eD8i20bhOEVJoKKUK58q5?=
 =?us-ascii?Q?cXRXNPPxO39RW0Y8SMFbho+VB3OW6dKdiQ0oNZqSoxx3mInIhgVzjVaQK/pR?=
 =?us-ascii?Q?6xadEcPue7iu5j4AT8s/3RaM1VqpNH61unlsMIQ7yU6HugJF3Lhasc2Ca7mY?=
 =?us-ascii?Q?mp6b9lMJ+VH03S/w4CG/kSDLJ0KYflECOxdl6y66G2KtcP64sL1QsM5liE9v?=
 =?us-ascii?Q?oQ8DLm/6AFDlT8+dcbC9fpt5ghNgZ0FiPRtdv8lxEYUZjb6D5/DabTKVHJ4S?=
 =?us-ascii?Q?JFtwCgaRMblUehisFFxwICQY3cciNXWJu3xY3AQ4jd/Z6lnlKnufirBqm+VU?=
 =?us-ascii?Q?lq0b2IKYmxHreT4PXjKOq0G6Vz36CX/qsse05mnubNPabJ3pkrtnopd6oJQi?=
 =?us-ascii?Q?F+aSO7RNhq6CVkQwYvh8YwXL8rdc9BnJPlPM9NlFXjrkRLAmXoR49rg0qquQ?=
 =?us-ascii?Q?r/2LjuZ4mPlA6SqbAhGfr5mKvlzWuLWkttRsbOLkfNnx7UwdT+lLWCSpNx9m?=
 =?us-ascii?Q?nrA+iL8muEaMTRqd3XPDzeWWZz3Tbg8kPYbFtO5VEy6BkC/CQF8vdVu7BJ+G?=
 =?us-ascii?Q?2LP5ibNCwYv6LlL6g5OS82VnhZyYBBZ1kI1YA1Ou3+nSbfkz2DKtKw8bL0l/?=
 =?us-ascii?Q?m8VvbGbkCKDmemlnnBWeT21GmQLtG+06uRRuaVRsuU2jR3LaO1Ml0KNL4lz6?=
 =?us-ascii?Q?HLvGNfVNhk4R9XWAOmQU6XtON1nE3vFAhsGmIBoToFzpuk03thiXWIfYk/TD?=
 =?us-ascii?Q?wjoqw62oCpu6MusvlVEb9+A7bMwbNXNY1HKrIx+lw/6tHFpKSCd8sWWOdSHC?=
 =?us-ascii?Q?uCR/DFF0sd0+o00p4iWy3MK9pwLPTgYSmxe3q+fzLNDzqpnJu1sANCADzHUK?=
 =?us-ascii?Q?WHfSWwq/0fBq9j8ingbJJPQQ1180E4yIc10RHfTZ2AjqdMM71ChsAaJWsfi2?=
 =?us-ascii?Q?qyHISNnfiOYxxhqlXQwY5jC8VZWkL1KrnM3cNZy+i2QEHoAAFLpjScYJvk4O?=
 =?us-ascii?Q?qlgvTZnBX9AQIuSihktEHQnWQxKJwmtymGS7ZBZi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GTYGq4Lv1anm0v3Fk1AHxfuScg6wRS5YiOQzgRsnmFfucOmYeYcU4PT0Y2xhzCV6BTnXFOAET2X33Bocpg2+3+Hg6OV5vN5gO057QVYNk/g+dJt8vHvYtey/ufoKuOKsDMkp//XOSye/85iD7tH1buDkpl1ZNt9y+1J4s5JkAbfKyunPmDwdWLQELL35DPG+FJgL07imprjkt7EUtB124sUA2PvKENI9ZNid69mTV2a0tVAOURSH8PlBIFt/zL42DThfABYf/cFP3Fna9IlA/75te4aCZipcsVkW1QyYIPROXjqgKViGplJTKZkFJMcsRFZ2f0UukcYiXuIoD0J55qYqCT2mLNtiVFwkYn+9aznEa4pg3yj1rkjcKlvcwqBUQx61cyp7aubn5nuodDQkftJKbXzh5B5kCvxY2B/wev5JOAvA0ECiR3sHoFNn2brXHlrbH7HV0kVOtuwnvUiN0ajiZ5wbxyqk6Z4hG3MZVx1SEvQgt3WH4jwtnZWOtSw/6kESvhgjBvf2CmgJbER0cNjCiT4b7nUyTK33nOFWrswR7Md6f9I7f4jfxNoVKNGUuTb70A5jaxran5iLenB/P/WYljDYseedsucr3IgEMs4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352034f3-508e-40c1-14d0-08dd86bfe5b0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 01:48:10.9667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWzTXVjIu3QZhNh2dqkZ321R7ihGx1z0Kf3AuQdGJXbHE17/kvmOmXSTRn1vcPkNghUIN7gwKz6vP+n6a723rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB6003
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504290012
X-Authority-Analysis: v=2.4 cv=O6k5vA9W c=1 sm=1 tr=0 ts=68102ff9 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=A2pY-5KRAAAA:8 a=yPCof4ZbAAAA:8 a=icsG72s9AAAA:8 a=1XWaLZrsAAAA:8 a=968KyxNXAAAA:8 a=JfrnYn6hAAAA:8 a=qBVN9rlWmg4_UtZo-wwA:9 a=T89tl0cgrjxRNoSN2Dv0:22 a=1CNFftbPRP8L7MoqJWF3:22
 cc=ntf awl=host:14638
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAxMiBTYWx0ZWRfX4j2GEheusdkL Q9JDIabmCu0jqogvZlD/6kM2mb60HEJnUOBvVCzP6FoGg2kDvDbelUZ7F0VULtfdpK0R3XE6qwm CuMKiUGthv4KVEejuenFQD6IKDkibTYwJxTbJyCnsqp3CQqar+cbE2NSgIF3E7oooVjlGYZ0tvJ
 z1enJi0uG3mIYJIgPzUmlU/zW345vIRNzNtryak9c6/TucFJDzD8mLGsC3k8bTkhgEaILj2jLOe f0qP1IcrjMeBoQefPj3a2oP7aG3/+7WHrgCTgPPgrYaabfdhQ+yM8PaLtagAMgEAVlHTdFs5m8c y9ud5VrNSZNVvyn4G6Bo37SgSLYZv4xGARnlp15Jv3DjUadFpSc2O0+DWvKA7rZccAR3qgsDFqy eUnxVqDT
X-Proofpoint-ORIG-GUID: sFGHI7AVCvzXKKDHqsQHd6WIdTNOLBJP
X-Proofpoint-GUID: sFGHI7AVCvzXKKDHqsQHd6WIdTNOLBJP

Temporarily clear the preallocation flag when explicitly requesting
allocations.  Pre-existing allocations are already counted against the
request through mas_node_count_gfp(), but the allocations will not
happen if the MA_STATE_PREALLOC flag is set.  This flag is meant to
avoid re-allocating in bulk allocation mode, and to detect issues with
preallocation calculations.

The MA_STATE_PREALLOC flag should also always be set on zero allocations
so that detection of underflow allocations will print a WARN_ON() during
consumption.

User visible effect of this flaw is a WARN_ON() followed by a null
pointer dereference when subsequent requests for larger number of nodes
is ignored, such as the vma merge retry in mmap_region() caused by
drivers altering the vma flags.

Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Reported-by: Hailong Liu <hailong.liu@oppo.com>
Fixes: 54a611b605901 ("Maple Tree: add new data structure")
Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com/
Link: https://lore.kernel.org/all/20250428184058.1416274-1-Liam.Howlett@oracle.com/
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Hailong Liu <hailong.liu@oppo.com>
Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
Cc: Steve Kang <Steve.Kang@unisoc.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---
 lib/maple_tree.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

Only the MA_STATE_PREALLOC flag needs to be fixed to avoid the vma
iterator issue.  Doing the minimum change here mitigates risk in the
stable kernels.

If this fixes the issue, I'll resend without the RFC and add Stable to
the Cc list.

Thanks again, Hailong for the work on this issue.  Your testcase helped
me narrow the bug down in the end.  I appreciate all the work and
support provided by the Android partners, especially the involvement on
the mailing list!

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 4eda949063602..d9975b870dadc 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5508,7 +5508,7 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
 	/* At this point, we are at the leaf node that needs to be altered. */
 	/* Exact fit, no nodes needed. */
 	if (wr_mas.r_min == mas->index && wr_mas.r_max == mas->last)
-		return 0;
+		goto ask_zero;
 
 	mas_wr_end_piv(&wr_mas);
 	node_size = mas_wr_new_end(&wr_mas);
@@ -5517,10 +5517,11 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
 	if (node_size == wr_mas.node_end) {
 		/* reuse node */
 		if (!mt_in_rcu(mas->tree))
-			return 0;
+			goto ask_zero;
+
 		/* shifting boundary */
 		if (wr_mas.offset_end - mas->offset == 1)
-			return 0;
+			goto ask_zero;
 	}
 
 	if (node_size >= mt_slots[wr_mas.type]) {
@@ -5539,10 +5540,13 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
 
 	/* node store, slot store needs one node */
 ask_now:
+	mas->mas_flags &= ~MA_STATE_PREALLOC;
 	mas_node_count_gfp(mas, request, gfp);
-	mas->mas_flags |= MA_STATE_PREALLOC;
-	if (likely(!mas_is_err(mas)))
+	if (likely(!mas_is_err(mas))) {
+ask_zero:
+		mas->mas_flags |= MA_STATE_PREALLOC;
 		return 0;
+	}
 
 	mas_set_alloc_req(mas, 0);
 	ret = xa_err(mas->node);
-- 
2.47.2

