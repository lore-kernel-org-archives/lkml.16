Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3484CA927
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 00:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748305222; cv=fail; b=CssbgQB+99oUsQ7E3sMw4/8+l37fBsbrNgdwZiaDQGrKfgq9LFkJ+00g9jquQ5WRqZp7TyzfQ+PMRy5tPuYKb16TCVPJ8mr6odeJ/esuIgX9TUn4B/tOKmAFMwiU/qUntSZvMgzq5LR7stwN3iUcWFQhad/oBk654o16xvmNe+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748305222; c=relaxed/simple;
	bh=1ZSxOhyz0SI9669/q1sRlOZEME4gDt/ru/WPE8oLs1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OXVWyMMo+ogGAuU8OYqydF25yFbugddDXIkG87YMrA/BPWcZkEVbEgUHuY0YqcknBPv/rQVuXhbO7cTHK5kgzzL2Op0+VKDVEjM83eOMpjcSiMQBnPVNwDQkwNMT9Z/qbzDUfZVYOscwE55yV+odn8VZAL7tnsz4TrftoVbLrRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ywo0+pun; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MkNJi7Sa; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ywo0+pun";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MkNJi7Sa"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QNCYiK029294;
	Tue, 27 May 2025 00:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=E2Dw0WWrMX+A9GFBL3
	k27Ff+BFyb9lP2na8CsK4GXkc=; b=Ywo0+punFJAPbqjafZmJjQFZSVkoqWnfcC
	mg/w2qes2BcQfwSIoonvwrfqOoZ1eT4+X0iP63DVePAQwEThV3x60dDzooMf9d8j
	ZEWTXYk9E8OFErLrBVgDUtoBpIOikOR869DyLX/Yej97h58bCaCVsfSiBVWvjItW
	UK+fbsPdDjcD+zs5qudimEWo7xi9G+drgZATGKetAQxDzNG/Xgutxp+8Yw2IboPD
	YGIJi6LlJBrQR20jx3lpQuHyhoC4ZgHvJQmKPGKe7YSSd3YgCLAJ1OKGUIaFsga4
	V60tdylt17runXCgtrWiknjAGv3i69D4f/EBWm1K2s+XQBj1sXyA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v0g2a5sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 00:20:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54QLaTaT035788;
	Tue, 27 May 2025 00:20:13 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2087.outbound.protection.outlook.com [40.107.96.87])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j97j60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 00:20:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdELA9Y2y36fZit/XicUOYcYg7iP4ZsQk0RHJLed4hAdQDdak5hJ3jfOFPIgwukpkr6c+IsE/VBiN/wWjB5mRxWqR1HYU+NbjXeab5weBXygyhYidWuBU+2/y1fibbBdGI4+b1AiO2CMVO5PrHOYN21Fwdc8UjsXEifFypUzvtIgCuA9JpQv+aRf8LUvYvX7HN7vPU056pWNEe2jQeg7SsQWATQJKWceK4oab3lltotvcWDCX4FiWXr5sjV7mh34rk/fDpvWl2J1Vv9MwUfpymgBg5MK/dRG6MFdDP+FWJMugb3/iJIPe9+tlT9Qg4ZiI8cuKZt5HD4KwjYoCd5t0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2Dw0WWrMX+A9GFBL3k27Ff+BFyb9lP2na8CsK4GXkc=;
 b=EUXPvmhK/j6ElllaV55v7DhNSERneONFUm12LLeXUtVbWxrYa4fJmjvqwPJeFMEyPAbukj01yATFfuw4NLU4Ag0P0bislfO6kvDK3rRoKkgMe2M23Vp29w6WU5hmtL2QxBQQ48CebNYasR4PKrVFVgRIjzRWp7q92aqzTH25JevYL0WnWBEAygNh7ijlYFYN9OX1va7mQTOmoAIq9yn3ZwnrwCZ1kof6t72a1GX60RMQRrmwez7304kDUj1ERs0xiNjwqt/Z8p+nl4V/ErSg7f1Qi4G4Ss4qKSOkUUyfnjIm0trmlgL5exEchELNHNxHKdixSmmliIyBKCZ9skqzVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2Dw0WWrMX+A9GFBL3k27Ff+BFyb9lP2na8CsK4GXkc=;
 b=MkNJi7SaB9y49NJLxbYpHzSiWLys2zmaCxMu7Zi8hHXnRA9V/vD+l3koo611sh3KQcptPPjeStpEgSgg4VnBb3lJh8y9Yfsu8cJ8VRiKod87qb4LgClXzXbkqhaH+uWgr8cEl8pgSbuW6nAeCkl0kQR+sX4By5pFtg6NHouEgAo=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DS0PR10MB7017.namprd10.prod.outlook.com (2603:10b6:8:14a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 27 May
 2025 00:20:10 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8746.031; Tue, 27 May 2025
 00:20:10 +0000
Date: Tue, 27 May 2025 09:19:59 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Xianying Wang <wangxianying546@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [BUG] BUG: scheduling while atomic in throttle_direct_reclaim
Message-ID: <aDUFL68oPvsIp47F@hyeyoo>
References: <CAOU40uDrsJH2562F4FdxEatGmxRyX0anmFiXN97+gOKDqAHmbA@mail.gmail.com>
 <aDUBqusF_ROpiuNv@hyeyoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDUBqusF_ROpiuNv@hyeyoo>
X-ClientProxiedBy: SE2P216CA0019.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::15) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DS0PR10MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8cd41b-aa10-4386-64fc-08dd9cb43db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vb7g0rNnP2jkn3gUET15BwNrG+0P1XQVBb+M02Av5eMxSrISj8Vi4FSUI6hU?=
 =?us-ascii?Q?eVdhKEP6VFWEzOng/6XPXCvF0E6PysuajJWj26IbHPu6Q16o+Bp5c+YfwBDK?=
 =?us-ascii?Q?cAK0TLUNDpYdzBqoYKsv2NNTSfDmcDtzK4j+vHkWxZ9zucZ8Px1kuw+CEv37?=
 =?us-ascii?Q?xMmHcK7LDBw+vTpTjG46XJGWsI1pRfmGT33hOzIBYMhO0/v3k5afDemiEdng?=
 =?us-ascii?Q?ddGymZ1zmSmYyADi6G7Z8gAA94N/SoY9w9gWkf4e8NupfJL8Kt0iFqItF/lz?=
 =?us-ascii?Q?GvM1rxC97LkxU+C9seudXX6KXNVqy2JL0hSEH1LatT3U4AC4aDQEeGxpiKUy?=
 =?us-ascii?Q?KJrmsIJxKRVMu3g/Wt/EpqHobhOs89NjwDmYwUVQDn8fRqeI4wPJwZre8rpv?=
 =?us-ascii?Q?+sTrHudVNEtVYwKoKHn3FKMuYKPCmEcAJYjsRuCJAM1Fc72UJu0TWHjOXYcv?=
 =?us-ascii?Q?Vk8mFu4fvnNu/Ts2XS97tsIUc1BtJx7lKnuOWA8nnciQBAFUcarW61bdN7SZ?=
 =?us-ascii?Q?KHUPbCnT59+QQeXy5Kg2Hac0EKIOw4B0hJn2x9i99Ye/RYn8aG40aoshxdTG?=
 =?us-ascii?Q?cm7x48VZHqaprRysG5QRlN1rdd/EUnN+plLq+Sr4S3S4o5yjEi+9qqa0Yvi0?=
 =?us-ascii?Q?cSE97uQ/ZuxaqRv6Uz2EZ02o4vO8mM3zV2y6/WdS+H5cTsvJsqT35MkIGIVf?=
 =?us-ascii?Q?Ng3luReGVYsVMSQedkNC57Oy5ulC5R4eTst78UgZDcDOEV/g2S4Z6UCR6Jdj?=
 =?us-ascii?Q?/Wa2+wT1JMfYmxxikR9XV6AbephLu5VmmKuauesmsA/SyH5LCOktS+49DkXQ?=
 =?us-ascii?Q?guawZoVRa31btzxlfMVXFhmx/fMj1Rgxr29xpDTXpEPbL+lDqpufdNLaD6Bi?=
 =?us-ascii?Q?jKDQJFxTIXt0UVU7asrJgtpgtiUH2izpV7nORvcLWCm4VOicZubXRn7x3OKE?=
 =?us-ascii?Q?TodFW45zUCS33dPmRmE2A/yvPxitVWf9RU4swtjFhljXrGAGkHOdcvg9GVOz?=
 =?us-ascii?Q?K0hYE9pfwTcQHcDPJABdqAtK2DJ8CujI9GwYsTOHMcepjtXT6H+6EoKFpo2c?=
 =?us-ascii?Q?rE0p2+A0Ng17WZYhN4aggWXLZR8v5qIZnJ2tvGCEoRp+D6unDMUplnMfr1iF?=
 =?us-ascii?Q?cQc8mqtSOtdHGud5GHjZuz5+8X7EXShG7NAv3T61UAOvDPbHHgzxkX+i97i2?=
 =?us-ascii?Q?t6I+PJysoTOVoaWY92a/o3AqmvvriRLHfMryScTOnALSSp+pjBgep0j8Lv86?=
 =?us-ascii?Q?oFTl4E7DtSs8wpTIoW+rTd0Wtr7Sy9fXqNsItCFe8XJuTrM1ydMv8jNe3Xqj?=
 =?us-ascii?Q?1Ib/5DcNmc5wHJTsHrIfVyimtJ5YdWkQfcHm9kHDpqecX1NWZMsNItC3m2vi?=
 =?us-ascii?Q?mjOszPPkcFUIn4n2cOG73rCEnk7s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tz1ABtJut3OaDpQV+WgiuBRm1PYg9jtfeuiWqc9/k0UAb1szUk6YW+vjL+cK?=
 =?us-ascii?Q?qphL4hpI+gzswlRbdOPg/xKsO2o+1PkGShiRi9aexl1FeETmL+hquQNZpZwJ?=
 =?us-ascii?Q?6ZM458zGrjTQZjV4yGU7AamC0xBOPgB0axO6GqSkwO/8IDhEph0R7XLu5JHo?=
 =?us-ascii?Q?lvzYTGsDpAdsJw9xrIAOelqW8w9LXszqlQ+M3LtFMq8JaUR93KXpn7vgtIwx?=
 =?us-ascii?Q?OSSwjW4efOrM2qTlMFm3amUNE1GziV82oQFZcKkBajTc11vzgTWKhbjMjQ+l?=
 =?us-ascii?Q?oF6rf+kn1UqC65dNVIKnOSXB5Vmyb+NNiLtSymfM0fRHPy5/p0M055nizJ5j?=
 =?us-ascii?Q?6zE8iSiLJHV/nxuL9rzrMjzAH6yNVf64A+8sEqu0+QfNAX1kSc2IDxoJxdzP?=
 =?us-ascii?Q?jLnMcpmBzgIwJZDHsq0Fv+DLROlFZz4P6S1t7LvPrkSYvNYGquQKqAT/WW0N?=
 =?us-ascii?Q?djvW82yQJdmUZnW5snS0eazI5OYVVb4TZXxhvd7cJFM5yysxTAVv7D5PijhW?=
 =?us-ascii?Q?YMWAgYmJsAtTgrt2jRdCDUHeNxXm7qdgHDDubt3forrzxTGNK12xTwKn/mId?=
 =?us-ascii?Q?QgyE8cbYXtZmnJQzGn7Bo3g3Aqrk1I6C9RoVRfZizx+R8ylYK/0zprfZj8V3?=
 =?us-ascii?Q?WlzlQ3Bd59qZtX4ClPlmt7VY0PE1ThvjKTrMANnHv0ZAJhMjW9KJ/nGHPp/l?=
 =?us-ascii?Q?suokdYXRMDpiX8RB9iTxaEWGiiWhB4AyoECUuSqCiHdxx22ra8Flzd3SY1C0?=
 =?us-ascii?Q?fmVF6uyFH0Yz9DcK1jl/IHjp5GUE2OUugRNAoi2E7RVei5VJ1GVqRV2KlsF1?=
 =?us-ascii?Q?dqmyh5Hn97SMQugO8v1tYqn9caoCyCOQBUJ1jD+zUXz/ZLroYSU08DYVWSMy?=
 =?us-ascii?Q?mJkx9yC4FHjJXwGC2POwT7Ot2MZpslKEeY8oUTZH3e4Xp9rWDyOCjyxRuCu+?=
 =?us-ascii?Q?IUO9C2951MkxkZEefIdaYZwozzvG+TsIEQZuyHP6tHmELa7ngN5d4JNTJCKC?=
 =?us-ascii?Q?9rZzh6ud/ZvZhoLCt/FYlEtVnSh9SytAJOX+GGFdhQNUXJ/sRkYz8Wy3afFW?=
 =?us-ascii?Q?VVBDAOi1LB0/p9/1Wt97Lc/l/VhbrZsEzHKhbTVvo6JfU3RV11N+z0HXx80j?=
 =?us-ascii?Q?lxGhqJOyRJVx3rgzuX+Pvt30+kun6Yjdwnisy9pPGmhexQ9fbrYnL2PIHbMD?=
 =?us-ascii?Q?i/Mjtf536owz0wIwE3cFM+nAn4+yCTQgneIzxL2saCAjwEw7v+HtVcbYZeaV?=
 =?us-ascii?Q?HvFTBRl0rz9hZdD9G0AXcpSaAhL69811yI1+sUuwJvaSDdiz1nURudhk/Zns?=
 =?us-ascii?Q?nh38HMNBHiiq2u9qaQTOJq5VztofInMNd4a0G40TQ5UGzj3EIjfyCT6ehMXP?=
 =?us-ascii?Q?WUhsWXktqR0R3SpC9MeaBy6YCmdB61STl+G4lUJnLZoOyBcdneKWUHNPiiY0?=
 =?us-ascii?Q?3vmks8JU3Xf4FKQoTIDWScISq6J1l5Ma7X/d3pbvbuJvC9c1E/29ebRce+3L?=
 =?us-ascii?Q?rl84mp/iY12NvgbLyQBxK/weYghu7V3A1wh6n2+LYu27kxT87ED4sBQjUYVR?=
 =?us-ascii?Q?b+XO5sZfS0pSpZNVkTryTA4Sxkhg565B8wTF26JR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oVd9HmlRXRabwVxWBKD+30TOOl07To06aHizOm8kldECsdVe1PwwUf/0mP5KZrqCWqGLsJo7rgyQ7Dq600ajsOmnKK+DbTxJQArYPD3hx8cWS69IVcXLiBquZHpiZI21fVqv1rl5vVFgqYZLlnasccVCcP1pwy+4D3UloL3sh43TgaBqT1UNgYcHCmPbm+sME+DKFC8ELZmxz8/0edK8DotfWXPwi9J+avyoYSC234vm9uuFMkt0/hGekjdb7brr5lVHUR1Na1wT0eFUKAOnjQLqbKMC8LYpbWHv2aQnLNDUP/OPbCEZVz4fsBvzAsqr/GHKesiSRRTyUVM3fcXG9akw1JFm7+R15Bw7kIN6Qtq8rxIYhuU6ipHnB6Y2G7EcL6dg6Be6NCpAv/Lq5t+TiwF+g3EfAd1jzz+eB+AOAIES3YhcDUW8p2bkrfWH0L67kZqwnSRKnhOB/JC8qzuWgxczCsDGr0HaV8gDaIe94aqXbfAz5jR6p7t6z8ve5MwRYNFCF3jYyR3joSMuYVrMSx9e+YFRpGk5FQyE4exyKOFBj3zgTRd1ULeIsR9ejGuXe0igAVDQHLuB73AW6UF1EyHPuQpei0sQdZXA6qiI+h8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8cd41b-aa10-4386-64fc-08dd9cb43db0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 00:20:10.3105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqQ+RKYYasEYAAoiPVhVEcYd4Gd9rwtc7C8b4Pn7WpbC4AcMfN13JH+tC30Z4A4+17eemri0OO+kzjazFZo7Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7017
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_11,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505270000
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDAwMCBTYWx0ZWRfX2QWW5QRIUcxN tPASEGtciiIgHasrvMlIuuU092buxPT993/m9ti4o4cZ+0jlDro4N5Vz70844piAZvoP+ZkAcp9 +JHhjmdi+m+weaKwm5d/1NtAjDS75CNANnS8JJQhAXQMGxcct9sMGfmU1UMHI6J0sD0L5jpO5uf
 AREg31/v8fA8ZTI7OzdsfLYohjqYusHJ0v6AVt5S3AGO/LeqDz3iZf9jGFEo26ON3uHAqB/XeAG 9HQiMdWalhfaq6ykXPZbHvUyXnKOVRG9vWPJfvSjpBYjsZjo+JdvSMov0f3nqZIREVYXCQQRZuM 2JyGJ2k7n5SUx5x4k3/Gc0LLvN0uY08KoF7RBSraDtATXbAvk35yGuv+SRg5aKK8pMIMxmHPRTm
 fGXzviyoNFH6ZKakqpaRweXoWjRWlUjBZO7rktBwK4qpLv/QsHjv3FT1PSd6X564KpGu3D1G
X-Authority-Analysis: v=2.4 cv=NJLV+16g c=1 sm=1 tr=0 ts=6835053e cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=v-8uxmmbZgS2ErsW1wQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: -CeVBctLpFATwRSK4bdIgRHTETf1oFf7
X-Proofpoint-GUID: -CeVBctLpFATwRSK4bdIgRHTETf1oFf7

On Tue, May 27, 2025 at 09:04:58AM +0900, Harry Yoo wrote:
> On Mon, May 26, 2025 at 11:49:30PM +0800, Xianying Wang wrote:
> > Hi,
> > 
> > I discovered a kernel crash described as "BUG: scheduling while atomic
> > in throttle_direct_reclaim." This issue occurs in the memory reclaim
> > path, specifically in the throttle_direct_reclaim function
> > (mm/vmscan.c), where the kernel attempts to perform a potentially
> > blocking operation (schedule_timeout) while still in an atomic or
> > non-preemptible context, leading to an invalid scheduling state and
> > triggering __schedule_bug().
> > 
> > The crash trace shows that this condition can occur when the kernel
> > mounts a specially crafted ISO9660 image via syz_mount_image$iso9660.
> > During image parsing, the VFS initiates page readahead through
> > read_pages, which issues block I/O backed by a loop device. This leads
> > to a SCSI read path where scsi_alloc_sgtables
> > (drivers/scsi/scsi_lib.c) attempts to allocate memory for a
> > scatterlist using mempool_alloc. If memory pressure is present,
> > mempool_alloc triggers try_to_free_pages, and subsequently
> > throttle_direct_reclaim.
> > 
> > At this point, the kernel is likely in an atomic context due to
> > earlier direct reclaim or preemption disabling within the block layer
> > or SCSI stack. As a result, schedule_timeout is not allowed and
> > triggers a BUG.
> > 
> > I recommend reviewing the reclaim context propagation in:
> > 
> > scsi_alloc_sgtables and sg_alloc_table_chained
> > mempool_alloc in SCSI I/O paths
> > throttle_direct_reclaim to ensure blocking calls are not made from
> > atomic contexts
> >
> > This can be reproduced on:
> > 
> > HEAD commit:
> > 
> > commit e8f897f4afef0031fe618a8e94127a0934896aba
> 
> Well, that's Linux v6.8, which is already end of life.
> Please DO NOT REPORT bugs from kernels that are past their EOL.

I mean, it is fine to report bugs from the following:

1) The latest stable version (e.g., v6.14.8, v6.12.30, v6.6.92, ... etc)
   which can be found at [1] [2], or
2) The latest mainline (Currently v6.15), or
3) Development trees like linux-next and Andrew's mm.git.

FYI, kernel.org [1] lists kernel versions that are supported.

I appreciate your effort to test kernels, but testing EOL kernels might be
a waste of time as the bug you're encountering might have already been
fixed in a newer version but wasn't backported due to the kernel being EOL.

[1] https://kernel.org
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git

-- 
Cheers,
Harry / Hyeonggon
