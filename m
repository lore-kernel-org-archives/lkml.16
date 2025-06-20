Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA61530E82C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382139; cv=fail; b=lzb5pRjCVMJEhc6+avyyFnICABhGInI721Z6sZEWTOyfNCYjXfP7KtBVgN61gctYsMOXusvqywWUnb59crws8dlsFpd2kVj79qhBZj4nbzsnxRYcXzGmbafh6cVRK5Fo+2gYB/oR+lfPA9rUA5mkpjpuVEM41twAatO8QGz9jnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382139; c=relaxed/simple;
	bh=ABFCmrpVQ2GfPY5wdCT0j+fsa7Fvh0RNvzIyFbaOTjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W5sNGBBwsyYHqNSixW1RzQzNhOhe5HJ3ZQ6juDsN6zr6yRxpPoppPuR2IK0zNfd5HxAA9BrHTGvkP5DSnvB36Z9U8BvHKqvXpL/VppJaIT1xdSx7MYR8MPDNT4WQBOus8EGjdwith1wvtF4nE/1ydy1btCBpFOLg27a8IBRsBYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T/sK/EvS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SY0eURxK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T/sK/EvS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SY0eURxK"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K0YQwL000969;
	Fri, 20 Jun 2025 01:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=G1stbpnlm40E2vjFvK
	qEEqVvCmwuXQgZ+/3ROKIBHcI=; b=T/sK/EvSMkf2LiasoieUdLZBij4GuMoILQ
	6ZMVz5o0d6x4PKOFteBbLA1F9idMX7R0Lnm4bvp+v5+/v56SxmZ/gOFzZwUhc+tm
	+B/actlxUokf6c6nFUGTbFUUu42/wwfgjX1L603500nNRuj5iZznKizZTMhZ26Mw
	//Yc30DF+Dw3m6I5OisI4xme0WEaK8XKq3d135AIT1woISx1KYli/5650mpMyBoH
	+KYlXQbezvqK4xwobB6JX5d41E/cZGL3q1JoBs2njVUZj7ExObW1lUkuWMpGTVPv
	ep1RKcwL4fi43TQ2B0y4iITAUBRdtAht4HKdv9wWibFlxJcdlt/A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790ydaqtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 01:15:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JLsE7b009743;
	Fri, 20 Jun 2025 01:15:06 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhjw794-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 01:15:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZ8FJNAn8vnWIar/gUNv5Tw1X+aNqyXYGTqLsSB1F10pqcqOlv8LfsFHqYq5W6qiy32VP59EYZyULdnLJgrIUERQLDVqtbrVM+3Lf7HeWqzZUFRtauCbOIDziEcs9tdSXoBQD6n6YN9t/Fjxc2VQXhnGYlZF9Xe4tnhp9Hv5gqiVnMKqwTpTslmDG6kefo5aR4Y3ohh2lmEOoNcb8F6z8oHluZF2sTxQ4dAVNHxNV2HKu/YxzZ54tTpG6AZfB9vLoicnEWeazdW2RREKXOIAGJ2rOkyouOPtPlJ2bNynfOe6Kt/Z5rqj3fF45MUma/uhxSnJHuOnzym48SYj9ez5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1stbpnlm40E2vjFvKqEEqVvCmwuXQgZ+/3ROKIBHcI=;
 b=IzwyVS6KdDde5MNEg2etSG55lae13laSYHQrZuV8ENVU+XgAyJ45tQW4zhwRg+BKFWBr4Jkb+ACDKZh45QLVdtYYousR7bBD8JA5AsHkdlT4/sHrxfzrkrH4DPCblE4414rv7rYkhIqbB72Xs+kTOJIvB61QH1JgwJaWJeTGyEz136JHxdMaeMyhi5glkxU591gOR4jc45uPGBsE80Kxa0SZL+tDAaa44lgL50Cwnp4F2M8dar+QFIiUSQn0VEshy5WG5qNMalctsnQFuX6W/YLm1ykOdvfQxmlNNlv0//g+69lFCNJk+nTaqGLE/FJlrNnb8lBEzuNBf7bAszbJnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1stbpnlm40E2vjFvKqEEqVvCmwuXQgZ+/3ROKIBHcI=;
 b=SY0eURxKaohWWkI3r8Con52J2N+MQ+JlQS1H05Ty7vW08PoqyNeZfmxQeol5oFS4tqKjyfSqB9yjLo2l2JxQmVv8Jd13oUcCT4pvEM3PP1DpRUgN+lahP6jpUPTYBNJKMw7lNYpToFRyXGcEgIvZ/AhzMdWP1ZbChU7pMMIXJfU=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by BL3PR10MB6235.namprd10.prod.outlook.com (2603:10b6:208:38e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Fri, 20 Jun
 2025 01:15:02 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 01:15:02 +0000
Date: Fri, 20 Jun 2025 10:14:48 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: David Wang <00107082@163.com>
Cc: surenb@google.com, cachen@purestorage.com, ahuang12@lenovo.com,
        akpm@linux-foundation.org, bhe@redhat.com, hch@infradead.org,
        kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, lkp@intel.com, mjguzik@gmail.com,
        oe-lkp@lists.linux.dev, oliver.sang@intel.com, urezki@gmail.com
Subject: Re: Kernel crash due to alloc_tag_top_users() being called when
 !mem_profiling_support?
Message-ID: <aFS2CMu277HzT7wW@hyeyoo>
References: <aFQaY4Bxle8-GT6O@harry>
 <20250619150809.69482-1-00107082@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619150809.69482-1-00107082@163.com>
X-ClientProxiedBy: SL2P216CA0074.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2::7)
 To CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|BL3PR10MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: 622fb6e3-97d6-4583-1232-08ddaf97e1e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?woOXcSckUtrz2J+R9VxHKR3CdLbHMIbORslq0KmZ5r/rL37wa//HgcFtOdwE?=
 =?us-ascii?Q?zZU/J0RTe4qWSFMxFpYoW7sBTa8K0AbC7q9JBJDb+gVeONXNBVRx9FiuvE20?=
 =?us-ascii?Q?LlRWETzyrAtbnz5umVzD7tpGQwF6N7cSDYSqqBGRgl0DnbuLYThqQ3nkSCuB?=
 =?us-ascii?Q?5DSWW5unfXNRniFBq8tlwLqho4BEmvLTb+HPNuKE2zZXOAhUms9ehBUU4Wcz?=
 =?us-ascii?Q?BU43CFTvCsK5Zm2llMSXDDy7mXizy+DtygJ3qJJAKpJASgq9nIykEhiSJfNg?=
 =?us-ascii?Q?mDVUNfKVuRa4VJAP6aEbOlv9xdXuFcGr4ZsuU+LkGrKVTQ0xGBDyENcpEjU+?=
 =?us-ascii?Q?2ej9TuiL31ULUMK0GC8ymgnKYNwp6QsCkr5VRl3iA1ilVOSNrGWNy2PWCQwS?=
 =?us-ascii?Q?e2znxDy7L+P7Gdm36UrVUp9FC4QpF3sPV4hJ6a72P1QORzQuLH7qXgxsQYK7?=
 =?us-ascii?Q?Z9ruIq+AbSiwaTwu1emV7I5SzHhdRW6QRaSYZeqChp2/3GhoJs3IAxN/35oG?=
 =?us-ascii?Q?yYvb4VdWejBGfic9+NS0cTYPChTvBoA1JRD8MuBU/lNb22fKHJBPfsrx/Q3u?=
 =?us-ascii?Q?sXg2Iu/8MbaTEdIkgg9vkIU6O9sBsKZNCO2y2jlAVaIKTIppkh3smwqNfDn7?=
 =?us-ascii?Q?hE620OSpRUh+fv7Diat6LGiq1xencRcOXUwJk89Nswz1R0ilR2AhVKrQZ89L?=
 =?us-ascii?Q?D1hTIzR3f1pRe1SDBLi5Npn5zmLjl8pSTYnUdnOFvVAbY7a3erf8cloGEdzp?=
 =?us-ascii?Q?ZFyiUDdCJow8qr5+ojhnAqinQa4lE+PCbZsMkTCNajFsI4R5IXgADLzsinkQ?=
 =?us-ascii?Q?dLJBK6AMDd67EEbxS2Vee08/D8Zazy10qS0iuNyljD/vr7SYy8sFtgvU5Ur7?=
 =?us-ascii?Q?hL/NlqxIX2LRMyO9QHl84aZ/kQvDEjxzPojiiquwJaG13xW7UzGu7cYi9j0O?=
 =?us-ascii?Q?+KqOS9SP8rCl97f/+ccrkvU7/XnbV9sUsnChNMkQvMgCn0McBm5JrpvK5L95?=
 =?us-ascii?Q?7WHaBY8NVh4TDjaQTdD2HRp1/hA4ZpwhIX1KQG1iF4DZnkt3lk5qSFo6i3ej?=
 =?us-ascii?Q?WEhNWX+9gpiqgf2LybyD+kpe+i7eZvdFMTUEi6MBnXD3LApwsIo2Et5zlsnR?=
 =?us-ascii?Q?TPP92tuPEzj5kcIYdY6mirgoh44lqytagy4FsdGjVIikybnKyWJ2UgB26/em?=
 =?us-ascii?Q?jz0v79SBPgCAc+mFJbAF+M5wzmM2DsCaLaPFK+SK55G6OrzojQPHv0IFaJC1?=
 =?us-ascii?Q?wgigMotOF1veHeIgiucI4mJqU2kwypEpUXv4EsSuashWjfYndZQtu3XYW6VQ?=
 =?us-ascii?Q?qCq8Z0IZGbQ35aE8esE4TcvYxF4eBP9FdTGGyobRcfp/qy0YLvVvJWBiT4VN?=
 =?us-ascii?Q?PVa4ksCalEBvSTPwBBPeR6kR8aR4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pc96f0TY2Pzp6sAr2Jm8a4VltEL0sHl8OWuI1JW4ODFY+Z74Du+I/d4gJTa2?=
 =?us-ascii?Q?/HVXB4lEoHqREqb4G2vTYi0UuvcYwUdUHPr/Ob7AOkGS64NvYNQoysAqI2TN?=
 =?us-ascii?Q?9ATncRzLTKnf5pLMKqHKFpt1x16agLWKaQ77GyFpO3L8+x82KM2+HFn3ELsf?=
 =?us-ascii?Q?XB9cYCjKCqVHDM730j/yYuZEfXrs5qt7mV5HAD7ZXCNsRQIjssGMyyK3WhJf?=
 =?us-ascii?Q?QVnsTsren98V4EVWyN1uiJi14Zkf01WAPBiC/zxBqKatUiyDoIjNS5wrR/sL?=
 =?us-ascii?Q?z2AZ7FHtq+iB2g9gQyd8Y1qSb2Oodk4y8kz0zi9UZQbmoV5KfWv6mpaf29Wo?=
 =?us-ascii?Q?fQrsUf+WG540MRFp5Kz5eN27y+rx14kiiGzzKmDE3cW75ihqxkWlExknVTME?=
 =?us-ascii?Q?HlaAGEweRd4OaFiyeRFKoPsv6T8PTCQ2zXHW37JZIZgs5ih2TKze5mUeSOO9?=
 =?us-ascii?Q?ciM7Di2zEryPYJmuMsKYdk+i/adXCoiArMGQT8q8rFprCEpXmyqwi6SgmRA7?=
 =?us-ascii?Q?cJVhocfvuJ2NZ/4JMTRKGYsAGUqTpzIRgonemGuuoEhyQg540rKuE5uklSat?=
 =?us-ascii?Q?+2KkAC85abumsu7MjfXWy3xfnPtsebGpaJh4xWs1T0yDY3t6zLEV+tF7GrwF?=
 =?us-ascii?Q?alddPZICyTU3Jk3PSmUi03crUQDbP4NinJ/THjpqJSKf5Za/HeLcKS1eRqJ+?=
 =?us-ascii?Q?1Zx/tKBfFX6/h9CkPsKF/dVKrg4usVn8WTSqXP//HQoxnqNc5DxzNpbz8cKB?=
 =?us-ascii?Q?DytQEvSSgEz9J5hjw1d358EUkZ6IzVhxhtMZeIRlEMnQ+VAyLU9PCywAYxqc?=
 =?us-ascii?Q?NHYxjXU/KNoQKazGiKwM37GB2BEemf1QGGoUGnR0aU183dSPujsoRfphFiba?=
 =?us-ascii?Q?jabF5L/yGLaRKRNmFbm00YI4CThrLdqoKu48fmRawK2S6nucbIZkbR/PnT3C?=
 =?us-ascii?Q?X1zIirwP16ZYeegqRLE1CKHC08LhVqa0NZIfjJP6o8a6vVdxepfbLvyeOeYb?=
 =?us-ascii?Q?R5fUhDwouRjxrgfYmtq0P8zhb77y2jR3y8+27fNjxs22DbaeSrti2sTb14Q9?=
 =?us-ascii?Q?HkTheaZyN1XcEINNigq1kF5peOruXgYVfoGvb56seWeazw+aY/jq/wO4LbuQ?=
 =?us-ascii?Q?087w1O6HhvuILqKqFySdLgGtg2D05HmbaTsKAaaxekSQYM/TTR4C1CAqvA7q?=
 =?us-ascii?Q?cH6Oj9hABXsicOLo1PV8wxt4axPM78qKvJAk0zT58rR2jo8YnA5gYgVnC6Ml?=
 =?us-ascii?Q?5v2we2twUc+SpA7cKISVWtdurj8ZMWCkB6OCyYsyPaq0aequT2ZBno6YCmub?=
 =?us-ascii?Q?1e9txqErCMkV/z7KytcJh86DLq1x19drKBHohEdTELz4LrBRJ2QAPj3KU/bP?=
 =?us-ascii?Q?kmhLsf3Yflf0AN0lQiBWJbF8OtyCDor66kLdfhi74jaH14MWelXLszdWLnJd?=
 =?us-ascii?Q?KYjvMLKaAW5gogGXA7ikIyH0QdO/ilw1cA4F02r9DzztJ7rchplU7aFbbhsE?=
 =?us-ascii?Q?xHEwKpMgOWL2yL/pJPHHrKAN6J7f4hIJLMVt20YijGlhOJUKM0dFJtzyyt6q?=
 =?us-ascii?Q?wRP2+OG1JK6b2x6A6OziIyXSQbf9NR3qg8z76yrR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u68QKtEEI7HYv9dpvKbS/pEXVekipKdBGwe9fYDZiJn/IrH+OvwNFVs6HpfdmD/JiqlObBzPkHZzKrUw70KW7ljKdX4Hb+abz/JCWGOfbLqLeypvaDnasD8d+SD9T5M2PHqTi33lUe88vHBs4s6w9CNa+In2qqPYEgdx8YvfiyIqgVMeAM9ukoocdiFEcNXqpXvbe+Qg7Vh5EuzcosYmE51uNGeWYK8ze+Yy5gpS65mWeLSVeh20zMxG9uFSO0gqbYR6JeJmTM+qtbLRgSMTYF40XZuHs9eGPrqg1Mbuuz/snzrnABh8sNJ151v3nHywHeJC+iPZcgIdJR84BA5QgIM5XmdRW0pPadQYgqdifTeBKNe7tmgdD0LkRKx+IVDk1lvd7nSJkKp6V2QtXt9U2JrQL7n1gf8lRnMnMOQhDRm2Tg+AirpyI3R084QvAaIh7mCW/ULpWlRNbrKYN4CdUJ79tLlHVPJLhFyUVwiED+slXy749ab77/pI90JHBhZnadClrkibHM5L9C8io+0p+vCUWVC3CXjGVzJUjxhSgjE/fqfO5OohIGC2Gq8dMXWnXkLhAKKnTmUDSr2KJqGLkJE5O7P6kZCAnOJEBdz2kSU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622fb6e3-97d6-4583-1232-08ddaf97e1e8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 01:15:02.3393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjhDqTj+an2MbMPEFpzmXg3FDY8+oYsIfR3ePiuOC8sWGhbIF4QFSaB9NUCfUhEORBrfRZxhekIHU2MKGkbYvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6235
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200007
X-Proofpoint-GUID: CI7TdEZB4Y3rWJxNO3gYGDw2xGf4-8Jr
X-Proofpoint-ORIG-GUID: CI7TdEZB4Y3rWJxNO3gYGDw2xGf4-8Jr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwNyBTYWx0ZWRfXwsvoptnygXHX R1RMA80gFmyGTEP+hqPIb3B1r+WGr0Rg40DM6wp2SfKcfs0HoPgWdi1dKS/JTL7U5IkD34CYQoQ VMkaRB0b8xcaFEOQfgXr7xl9UJIzcz+XHTAR23G2kzk/dh9s51RBvqGVgU0v7bgVOYEEkR4rEti
 Qhgv+UaaSmkM7+Wa1XxBzLYvSPzk78+MSWTGFvclDDSwmIVZvFjvO/Bv9ZG0oWjBjKPRIuknwqy g1Fd2aOauraSjOyoF3XId0XBiK+pwqg7YklwgNbnXXjwF8qlkUsu4B+PuDsxz985toxbjJxrzgV BTAy94rJo9iUGLbT50Mm7qhqDTnHkqsUiQ5UDofNUOjWpYd4faNG/8nBsBQAMu/I5few53fa4F2
 GAeuiZs7xX+Sp8+OHA/Lmm1Kv4Y34XlsU0lD9g/RpwhbjIXoV3SW3k8r/PZzuQWphSTBMHS1
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=6854b61b b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=euXsyEGkHRZQdVq6BakA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714

On Thu, Jun 19, 2025 at 11:08:09PM +0800, David Wang wrote:
> > On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> > > 
> > > Hello,
> > > 
> > > for this change, we reported
> > > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> > > in
> > > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> > > 
> > > at that time, we made some tests with x86_64 config which runs well.
> > > 
> > > now we noticed the commit is in mainline now.
> > 
> > (Re-sending due to not Ccing people and the list...)
> > 
> > Hi, I'm facing the same error on my testing environment.
> > 
> > I think this is related to memory allocation profiling & code tagging
> > subsystems rather than vmalloc, so let's add related folks to Cc.
> > 
> > After a quick skimming of the code, it seems the condition
> > to trigger this is that on 1) MEM_ALLOC_PROFILING is compiled but
> > 2) not enabled by default. and 3) allocation somehow failed, calling
> > alloc_tag_top_users().
> > 
> > I see "Memory allocation profiling is not supported!" in the dmesg,
> > which means it did not alloc & inititialize alloc_tag_cttype properly,
> > but alloc_tag_top_users() tries to acquire the semaphore.
> > 
> > I think the kernel should not call alloc_tag_top_users() at all (or it
> > should return an error) if mem_profiling_support == false?
> > 
> > Does the following work on your testing environment?
> > 
> > (Only did very light testing on my QEMU, but seems to fix the issue for me.)
> > 
> > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > index d48b80f3f007..57d4d5673855 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -134,7 +134,9 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
> >  	struct codetag_bytes n;
> >  	unsigned int i, nr = 0;
> >  
> > -	if (can_sleep)
> > +	if (!mem_profiling_support)
> > +		return 0;
> > +	else if (can_sleep)
> >  		codetag_lock_module_list(alloc_tag_cttype, true);
> >  	else if (!codetag_trylock_module_list(alloc_tag_cttype))
> >  		return 0;
> 
> I think you are correct, this was introduced/exposed by
> commit 780138b1 ("alloc_tag: check mem_profiling_support in alloc_tag_init")

Oh, I wasn't aware of that commit.
Thanks for pointing it out!

Indeed, prior to 780138b1, it was unconditionally allocated,
so it shouldn't have been a problem unless the allocation fails.

I've sent a formal patch to help testing.

> (Before the commit, the BUG would only be triggered when alloc_tag_init failed)

That is nearly impossible to trigger as the allocation size is
too small to fail, and the allocation is done at boot step,
so it shouldn't fail in practice.

Or should we be more paranoid and fix it in v6.12 stable?

-- 
Cheers,
Harry / Hyeonggon
