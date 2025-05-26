Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838EB1F03C7
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253985; cv=fail; b=B6njTCNToimuKhc15Ke6sjMb9anNVK9PA8g16q411oPHPsInKEFQV1N1dxqNb3eu7Ug+uUFU2M7VZ07s3tvtICmOWGDCKboUm4qKjOSgzU+wq455rSi4A62J9b73Zi5YProZsNleBTT9BRSr0MaX4bCJv8CID+76N/JmJu98sFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253985; c=relaxed/simple;
	bh=7A1oWndVVJBxl9RCGkuxuMcuaGs2XKj25t8AGAlWGp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T6nCsk/R2pD+XCOAj+cpdgRAOLIEQyZfoHPf/0dDIfIT1NMQI3reay1lWopTUAoCvAicExnIRc6XliHlmDQw1gxd2VBkU9kCFYrrqHLAqXcL078cQbKThVEfJffy8F54G+yHvtxR+CSOxsU8yoS16uKHhI8MWhhokvSTmxyDbKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FDUc6LAQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u6x7OBvk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FDUc6LAQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u6x7OBvk"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q8tvim001020;
	Mon, 26 May 2025 10:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=EHOb0Nut3YT/0e3cNM
	NcCdLCKwxCE8xB8RWtAB2q4sE=; b=FDUc6LAQuU8uP1qY+zNLQuCzIGtrpTj+Fk
	3mMkhZg8YDsMlrPKrKW5GqD6t44gQ1I4hdhRsL55z8+RxFWreFI+SExX0f/IGeGN
	r8CnCDFqYMBJwZxqmjZwmRWnJnvqAJPuYp9quyxRAehQVcdy41DBlpwxrBZpWdqy
	YJfFWfFlz7SkMwjuEdMSRnBtdkKp5VUKEXB8U9KvKrXNXkhKXQPTdxlM52X8u+xX
	zLMfsV3XRBCrWYaH7ZVkf60c/kbGte7Tn/nGzOf/R1ncqqUB0IbZM2mg5h9FNkg5
	B7iBrKSmkRxHGLTwShIrKkjlOuAMzQ4iPr7KsFZWWxdzm4ukqEhw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v46ts2j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 May 2025 10:05:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q8mahJ028359;
	Mon, 26 May 2025 10:05:38 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j7ntyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 May 2025 10:05:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1tVU+D5iWbP68UMNdc2hhiKFUyaFc7ZXCgJg6oKjG1tj5yYUeXiFTgr7wdhLPOlXDLIKwA8VcIqJzNOVKWy3vOMluJzUKveN0TuRuoyBgRDKW60+nvN6wR6LrXvVCgIhCI8/pby/r39LjcxfQm/AcIvXMWhvJQzNw8oX1mfGjbEQi0DdtOwxktr7qynxgqTxKIIkatUBAiwEeg7X3NgAg2iz6IybQWhnUIp5RojBAoe0BA9sg1iluMb88sUMfv4U2UFRkBVLFo/WZ78NIbf2KK/e0YZIzDaIt8ruwBPBtDSDzYXtAkIITImUePbO8OquxYUI+7LM6cK1VytymGISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHOb0Nut3YT/0e3cNMNcCdLCKwxCE8xB8RWtAB2q4sE=;
 b=lV9z1U2oFp1xY6a+dd6syOWbOgNWh2zTRgpyvUgHRE3nMx0i3rsx8WkTh3AljrpwQ8iyLPoj0HLIkW33UvM2MFLgYX4TAc9JZnUGvlkiBbsvN1TZLDnjISOxyJWX1ghhu9cWDyd1ZbcIVw1IooKH/ylq4MsIFtzohat7p41zCUKmKs6ZGJB1D83HUKjhbsQZVGR5dewNx9i7pmHx6G5AdjRvImCpu16knMq978gBFTFgL/wt6ngpj2TEZZXjKI1Q9CvpU2ec5wmZexmEoDr5hiyorIZS8nfKBAbTRXq6No48gwamt47+0yZ4W7Hb9mMqEudS4cZhTbd0ZxctO02uvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHOb0Nut3YT/0e3cNMNcCdLCKwxCE8xB8RWtAB2q4sE=;
 b=u6x7OBvkDs0QnpuwVkdgKsRKmlzx3SPoXTQYx+9pp5RdfRn0dp/IKgbFtTUqDMgXfP78BsIoTaDomk2IijqCqLIS5WVrgUYkO3b8bnrCK/YuFn/mktTA9+Et6VSaXqxF8TtenFdR4EqWW0XrBSTv6+9Ow3e8wFbDOZHgCbUI79A=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DS0PR10MB6149.namprd10.prod.outlook.com (2603:10b6:8:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Mon, 26 May
 2025 10:05:35 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8746.031; Mon, 26 May 2025
 10:05:35 +0000
Date: Mon, 26 May 2025 19:05:27 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, surenb@google.com,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com,
        linux-mm@kvack.org, kent.overstreet@linux.dev, cl@gentwo.org,
        rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev,
        linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3] mm: slub: only warn once when allocating slab obj
 extensions fails
Message-ID: <aDQ85_EeqibtbUR-@hyeyoo>
References: <20250523165240.1477006-1-usamaarif642@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523165240.1477006-1-usamaarif642@gmail.com>
X-ClientProxiedBy: SE2P216CA0031.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::10) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DS0PR10MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3fee1f-c4fe-4624-50f7-08dd9c3cdb71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IGFey8mRlRV7uJWMMsg4MhjYZojqmsE5GexOaCp7r18HcPwOlBPBf5O20vI4?=
 =?us-ascii?Q?FbPCse0jJ/a1h7x2qGXtFsyyEOrSm32trXjcItWpIca68F5X2wuKSGZC+UZY?=
 =?us-ascii?Q?2XlhU6iUESixOg55smTYwfesvoJPN1Ob7TdyVRn0dtZoE+IiyUHg2kq9jqey?=
 =?us-ascii?Q?8IZuN2m8FTcjCIEbEtYYIthzI4RhH+uWVJ/1Sr6Q49SwXdlLa/ApyhnXItKx?=
 =?us-ascii?Q?LxN/wFiXVRk3EJAhX0SSHfVHGpMxbGfuQYKvqMuYPRBGhZtI6VXsn1yP7Wm7?=
 =?us-ascii?Q?tVNIX0tQkD2FELoeHaGB/gdsywCk91M1CeQhdTVCCGzMbhIDAUgqVFqHuZk7?=
 =?us-ascii?Q?uZAgXQDAGcRo8jxIS/azMjdE/jVgpirm67BKS2KPPtbj4nn2BbwFVIxMtRdO?=
 =?us-ascii?Q?21d9dgfodwwOxmXcdKfuj9x9DE22rryzweik0lpIHPUm6qwO1hFlg6jr3Atx?=
 =?us-ascii?Q?7bPlocYjYrD0kuDbvmMmg8dkt/bgWNVoO16abhNCJvpy/ppaF1WSIdHn9h/P?=
 =?us-ascii?Q?pqwZpuBWbJ5fwU9LQXgV/QkTq3zNr9TccEaDOu4hoF0aeuK0ANIqJ0MlaeAF?=
 =?us-ascii?Q?5f2Juk3C7PK9G06XHKK2R77kUUB8sG+MeVaq7R+WdXa3V0zFR6gcsfg6/4QG?=
 =?us-ascii?Q?v3X81soGFkWZUa28qGrhygjVZQ5IKtlXkDYPwQwT2qadIXYLojv8p4yHdnf6?=
 =?us-ascii?Q?TehwWyOosJ3M5hg9CLZT680757x21pV2PnJCt9XNmYTfaUPVwqFZMImv9Q9b?=
 =?us-ascii?Q?XF7vpMhk3GCQq33ZLEUxd+43FS3n3yI814uwV1HSLWoNi7TfmA0uiZ1oAPhm?=
 =?us-ascii?Q?HNUa2rMVjOATbYpARh96csuAF4Q6L5hlCoZl9Mo7B2FT7B2HHXk2TO3j7Q81?=
 =?us-ascii?Q?gHkJv1UA2gmfw5rfYbhhB9XeNrRxL/28hTiAayet+1oCsQMX+CWyxAbpOrVR?=
 =?us-ascii?Q?3zsbgKNjWe14X4KWyjqqyItV9zBls/ztLtUyaO/Aaq1b6/EiDjpUnz7jUMnc?=
 =?us-ascii?Q?mN6DMY2qexdlxZJPC54U2nWUoq/V/gmQemZzR1xeS5JR++KJwguwEoHQSiKm?=
 =?us-ascii?Q?LPsysJV+BEj82+3KHfRp/O7hX4GkHAAfTvHNVFGdWA/f6Q0CNVcYepNjeZua?=
 =?us-ascii?Q?QS4ixV3ATW5LDnfsTGi5lOsktIP/Q9wbPmxmmR+9terN/J+zsUkihaA9RkL/?=
 =?us-ascii?Q?VnqVbWDiojYSptvSRRzwcWxFaOCQPhtvb2d5kJliQdInNfMqHJShbeLHXXkf?=
 =?us-ascii?Q?f0zz+cufiVEa+3T23iQYMGazCcDvh//xJYyRhyQ1CEs/NqKP5DZvlEAbezu3?=
 =?us-ascii?Q?gmiRKqtPquphHxyV6L58jXV5Hu94yuQlnSayNXlWuGNFGtXUGf0B/pGtXMnZ?=
 =?us-ascii?Q?oCuOsK1zZPU5mahSYOpI39p8fv56k1mDeQEYKjdmXOINMUMDN2x4klobmWxo?=
 =?us-ascii?Q?tH12qSQSi8I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZdS9DVn48EwSQygUrQ23elUTNeuVdGaV3C6Ncb/aQ2i0awk7W1dj64H+V88?=
 =?us-ascii?Q?huGujE8ZJbEg6A2toA/CWGb3H/moVTK5W2M6gSLcjFrMImivwiZvEPXcw86H?=
 =?us-ascii?Q?uBHVor5VzZc3EX1FRiu/gUye5+fyThVLiImpcVMraqRsVfZAsm5rXx78ZNr0?=
 =?us-ascii?Q?EZ564IhWHu2EKZMNhS8HdOw5Uwq3GndR1oh6N5dLLRIs2tGexHabcWjyZvvp?=
 =?us-ascii?Q?qIs5w2N0CpRZbLwE2kNbrGlEFhqnAJ1anFahkpA9fnKBSXExcwN8K8RDG4Tw?=
 =?us-ascii?Q?ktZrcJ4D2NsrS6c6vXNytMiSbCsXsbywM4w6dsyUG9CdEiEejzuY4Q1gIlsl?=
 =?us-ascii?Q?yb1ERhxrRz0Q2SaXRSfl6ifD0FD7PMFXZ0KRqRjFHrr2r2oaOwJdObkZ9uoa?=
 =?us-ascii?Q?Rqb8QpYZncV9JzxkSjgGKmJIdfY6QnNjk0AvhZZt+jkEBLfAhjHyO3iVWXvg?=
 =?us-ascii?Q?j7bk8VBGOylS+jN3DXsAeADey7DvyAzx4gj1sZlQfCx+KmZngjZqXBYNxrai?=
 =?us-ascii?Q?ofyS+iZYT/rzHEX3eAShc5gO0AqMpLyqcyCHkajA1uqcwUeaIFK706HdgnUf?=
 =?us-ascii?Q?nIrwUNH3qQ9R1Zd9By1yZlABiKpPvKT/fIOzo20XJ7dipCeYA/yQ/zr9hiWl?=
 =?us-ascii?Q?3EWbqAmktQSL3iEyHw8KXM5WOH05WUSMT9rWWFjfAuioauXPQ+G2NubYeq8+?=
 =?us-ascii?Q?hKDOhQB3FvRgEl2o+e/UW5EfvWVeKcK0GMNZxYDsgd13VokirD+WS0V92TuN?=
 =?us-ascii?Q?RrVXVtObGQPR6KKrs9bwSwreF+fHHSN6+KEGTvLCYSqm52n6HQVf/4UOp6jM?=
 =?us-ascii?Q?J/5X+gs3WgDQCwEsihWG2nsrhWriVy7zI1iHBQC6RECD2X8ABALvjzneza8K?=
 =?us-ascii?Q?wkYfFlFMwM//J06fOhgmNv1zFYH/6rWQ6vsI6nUOEtbYp0MZ3f9OV6hdhi3s?=
 =?us-ascii?Q?5J0JD7i2L60uFVBnfq0w5d2X+Icjtu//LYS594jJsyJFvLZwZeyYMHre9Vnc?=
 =?us-ascii?Q?NBE1i8Ls36QvNkHkStmxeQINw05ObRHBMCJyCAyDFmaHvg7nLcwwv+eqpZ1m?=
 =?us-ascii?Q?aIOXGKYtrCKKOgWxfSTV2UX7wcQfSFqpy2AZZhuzhxtyhnkfxidsDXB7+K1k?=
 =?us-ascii?Q?95ATdIFE/0OfagHerqHkLtjl5csMV8nXRUuxpGAfS8d/RAARCyTrnBhgpjUf?=
 =?us-ascii?Q?xP/TZb8jkvj9S2t9Pl99yDEhEP2+xzrFjEombya5FrKiMl8/SCbQ0wfeKVPL?=
 =?us-ascii?Q?h5ikSr23RfJcq76Nvc/RjZVUdUL3h4awrY1a6HwtiTuR1ZYPGe6k3bOd5eQK?=
 =?us-ascii?Q?nUjwPaV88YlW8f3Px8C486/DvFmRoZZeffd0Y4OJmPDs2yNchsN7+GFZDYQR?=
 =?us-ascii?Q?pK9yOhDhoh7n68NFWew4D/5d4GrSoaw4yc4CbNholbSExhGH9YlHeZ2zKlas?=
 =?us-ascii?Q?Z/ZNzgnDqtJoYX6N5aLtZ3V2nv5bSZXqUh8Xzpv8OcKlvfcFn0lo9rFSlQQF?=
 =?us-ascii?Q?TYye9BtoDlrqHJKiCcL0UU7XC/izKe3++M+xkLc1rE/H9FER4EoAqGDQGScj?=
 =?us-ascii?Q?T33M42IHT0wlPEWgjLYofhuPk/B7tmdgyRQs0txt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sWDu/hJEieFvnqy8kuOLBKJuDK0W5S57mYSD1O13nySRVIPUyCDUpS/pkNmMgj9jxbzC+SxfwdVoFYoF6u8XvQLhVXNzl9v+K4sBNrtd0+MquQ1ozf6tdanhgYyfGqP5oeT7h2M8I+UQ60XzQhlE5izAxzeYzRaCim0myt67E2Y+8v4PMmoN6+rkBV/n/7y20ESUWYl0AATLoR9ZLr3EjK66V0SxyHYtmqLOLPZTlBF1h2kJN17wrbagcwOogcBJ3uRqBaxBwvS5pExPGkAyrMNsOjKy5koiM6kDo7DYKjOxI9R8Tsicw+dlIkIqcASIjxET7zplKaNwBc9CeS/rOl0t6L6kw3/ROVPT12ENK09+CZjFVBCayMnVR9e7zsI9meEapLdgVr++JCiL7PomcSu21YcEPtDtbdDEa1EuKXpOwckRb0tVGQ6D1Q+tSD9IC5Z3hNn1cfJpDdmXH9uQs6gAgRxyZZeyeEgpFGWVsn9eCpdBuiq2ndJBIFHLE0Dzrr4VGr2B8shse0DkRXAMrgHltzpZnZTCBq8jEj0zrR5JBtYKzG7M260KfSZzdD/tMelFvurjyKiutp2IWeWEh+9+/LzKmKzC0J2VhGgBbD4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3fee1f-c4fe-4624-50f7-08dd9c3cdb71
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 10:05:35.2125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oF36IPrB7DhWiuFTriclD2wFeFMmMoKhyQshmqreErHBObD70O8XI63yV/lklNkfGDI7JbqKgNGuGuNkdPFlMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6149
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505260085
X-Proofpoint-GUID: 4bJNK_teGhMso8jUmeo1LVbfoZnXixGO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA4NSBTYWx0ZWRfX4X3tLEpHZFdo L8OEh4XxxabWykN64qTbXmvwoNir4ojN+cgSJd7a4YEfvmPgeTTZ4Q5gWXYzjrUoUT3EJhjJpPB i/T4Sm4xlX6SaiLozVxJSEpo7rXgIT7TPY3r08mf6AHpeIYxTsFdd50YrajR//C9x/rcYdCCDtp
 MxSG8GN8IBiGxnc/htnpMRrpmRq5K0jiTH15D3L1Hpcg8KquRM607di7FKzP7HICmxht5SHKBBu oHf+XeK2EDYfYGJ/Une361e0cra/nOkY/++hyzpZ8vwLu+4ZzAeknghH4H9yT0s4vvsv+m7Cv1U rDNgN6vDmpmXm7PiQwiCIxUupid25kjos+3FxaxFlkN7+ZvoyHQ3CBEEwPRKFwSPGD5Kt7APBfO
 pCA42wHrKsDBQurc6FzEj2OtK8dgKw37G85N6Arg5oWWcketd499mzwrDnga2E6mei0t9iID
X-Authority-Analysis: v=2.4 cv=VskjA/2n c=1 sm=1 tr=0 ts=68343cf3 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=1M2fwX6h1EhmJopYyZUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 4bJNK_teGhMso8jUmeo1LVbfoZnXixGO

On Fri, May 23, 2025 at 05:52:40PM +0100, Usama Arif wrote:
> In memory bound systems, a large number of warnings for failing this
> allocation repeatedly may mask any real issues in the system
> during memory pressure being reported in dmesg. Change this to
> warning only once.
> 
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> Closes: https://urldefense.com/v3/__https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/__;!!ACWV5N9M2RV99hQ!Nv5xX_X4cBQR_HUDO6qfamxI0GEW1eFRCpPj29lANRashIUJDrEWAjU7vlys76FH0voShW07CjpDkzSST46Irg$ 
> ---

Acked-by: Harry Yoo <harry.yoo@oracle.com>

> v2 -> v3:
> - Put warning back, but only warn once with pr_warn_once.
> v1 -> v2:
> - remove the warning completely. We will have a way in the
>   future to indicate that the mem alloc profile is inaccurate.
> ---
>  mm/slub.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index dc9e729e1d26..36d7c43a6f2a 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2102,10 +2102,12 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
>  
>  	slab = virt_to_slab(p);
>  	if (!slab_obj_exts(slab) &&
> -	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
> -		 "%s, %s: Failed to create slab extension vector!\n",
> -		 __func__, s->name))
> +	    alloc_slab_obj_exts(slab, s, flags, false)) {
> +		pr_warn_once("%s, %s: Failed to create slab extension vector!\n",
> +			__func__, s->name);
>  		return NULL;
> +	}
> +
>  
>  	return slab_obj_exts(slab) + obj_to_index(s, slab, p);
>  }
> -- 
> 2.47.1
> 

-- 
Cheers,
Harry / Hyeonggon
