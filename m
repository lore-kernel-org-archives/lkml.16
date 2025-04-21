Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5615D1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745227402; cv=fail; b=n6lzZiArfZG6c2nh9eJvSPJu10CYflRsqgPzmN02nmXF2XmcFT0FY6BKV+LpEdcb8zaLJjXdrckVSDbteiGkS1EazVblsntN4ge7J/Rkg5b3t2znUVz/I8maptC63jyN0QGkOx7VzCVEJ0q8eJuu+W9k2aiBmDWceb2m1YFXOpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745227402; c=relaxed/simple;
	bh=btY/vjKs0SLln/QoDbwWTDXKFidfa5krtPF9D9xgHyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YVoVovsE5PCfL2zFOUCWsh0tRm0aZ/ErKCQ7W+S2LKRctS6ZeHJTufWiqpQRVf1kdh80qu+qletTRQbMSwXtN5fd+oLVeD8TlyYkIdoWMxvBgjcru8VJxzxKwEvYkLY/JzvflaKV5HqbxrM1qQ3TPjys/FnLKY/LHBGwESEOqRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EncRsklt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NZgsFMAS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EncRsklt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NZgsFMAS"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L1C5ul020736;
	Mon, 21 Apr 2025 09:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=SwOfA3GS0K87lxooKr
	bSJvNqMgQs8du73fSuyz6B7ek=; b=EncRskltRmq9aY2bThoxovRSSWcJF/YZXS
	CsTCekhTvokPRWvA5wJwWZSGmNIc1klpg9rz+2VjosRp6i0ZlBgDDi1KL0UCyxSr
	IBCt29qHiyvdcBbnwExmVQa1lk4YAzDpuNpKZYJ6DM00yZRu6sOBcRXkDjWWNd8r
	w1C0kAIK58F1W5FnWLVDD77bcHw7MxoEIrUYnC3TTilwNMMVF7ajxKRKk/A1gERw
	M+nLu9YzP8b0Vrf4LKQyNnb0hUPkoHKUJEGxriNqCfMLO8mOl/VqxHi+lyamJKuM
	nnMgqLHG1Osy1DEI3SdENG6FBBG2H3U9TqFx2I4xA7YDIFCFvXPA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4642m1t6hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:22:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53L7tBm7021214;
	Mon, 21 Apr 2025 09:22:32 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azlp17011027.outbound.protection.outlook.com [40.93.12.27])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429eang2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:22:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9Kfr3X+jcEp9lNKhYZEbDRJn7UFJRzxuXkzEd1iaplkyLtyqs+wlo+D3YxaZN3UNLclNZfnfaZKupupogD7HujrAfu34Q9hyk4l8by8o9FPY47tC9faIGSRagw6EKYlispJpllBtTDLSDcnzHjZlwmdUd5T0pBC49Gh5Hq55s+8Qg5uox9IM3c8HG7Tl1AQdV8/+SBtWroAF/NhX0PnZPTmkXxhjGaZvkr+03onGtbIa/ento2ZNNcDuUgbseAf1YhPUHf4CTNL97L+OOONABLgA11t9vnj7GKNS5LVWECA9VbHVW6Uo5NKU70fhAIlVbIAat7pIkI0Y5ZvYuWsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwOfA3GS0K87lxooKrbSJvNqMgQs8du73fSuyz6B7ek=;
 b=evK2EplN1Ux9L08e1El8OvzHY9TESTnTHCM0kbzpZrcXKgmZA2Yh831XuIuN5f4DG5H4wH258a9+utKqckyVHzz2GMHL2X5NrIDL+MFiWo/y/HqiE8wSxp5/LVNdNLkcimZrTVHnx0rskAgqe5z0XKF6CSTXPujyPTXpkVpelqNIlDHrs6PHivEqp7wFJF9e8DVwpUOjHvO7CMb6YBdyJFCndD9DcaMC02AbFnF8YrNUcXu5l7wIhUEq8GYk+0lY70WrrBAXxPzhRcHJSpneE8tEnOA/QI5glKtCGud3oYoD+PnYrOEX+B8UJ1Ucy2nE07xbW4GcF/xZWrkOw20ALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwOfA3GS0K87lxooKrbSJvNqMgQs8du73fSuyz6B7ek=;
 b=NZgsFMASuMHUtEbBny2zbLEIQcXAWdWCdDekyThEHmRjLIYw2TBg1D94JDQgc13yN6ttBxHhw97HKYKgzWS6XIRvvzA+5GfWGTrWgOYQOGtJ6IjKPVBm5bo9ALEj/5azIALnSuVsLypavfI7fxkA9F85RiejZujKqRgxAeHABA4=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by IA3PR10MB8468.namprd10.prod.outlook.com (2603:10b6:208:583::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 09:22:30 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 09:22:30 +0000
Date: Mon, 21 Apr 2025 18:22:23 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, nao.horiguchi@gmail.com, linmiaohe@huawei.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, david@redhat.com,
        riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
Subject: Re: [PATCH v3 0/2] mm: minor cleanups in rmap
Message-ID: <aAYOTxsCG81etPLH@harry>
References: <20250421085729.127845-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421085729.127845-1-ye.liu@linux.dev>
X-ClientProxiedBy: SL2P216CA0229.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::21) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|IA3PR10MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb5d90b-438f-4455-6fa0-08dd80b60a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fhtEN8ilXyLuD75dR3PimR6psWOYHz+pdxPUpB/s91PmozVBaz9tc2XR42/K?=
 =?us-ascii?Q?rRMF1FP71UXJnSy1CluA54Zaf/YZdtVRrhVtebeLIOwtbXDLMMCR1GnY9w8x?=
 =?us-ascii?Q?8nCpIj7oIHQ53igV2WLM73Gl194NoQZBYlbQBkFnTE680y2PrS4fIa3YzxOB?=
 =?us-ascii?Q?2u2wn6F6g0NE5rjyl1gNEoymAS8q5XjmClxRqcPL29Rnb6EwSqfei1Ktu2KC?=
 =?us-ascii?Q?I0dExQxhMiLKzIYLbdOgAaL38BdnyQZzppI0oEeIUifGx61vNJFuecztp88H?=
 =?us-ascii?Q?1AoBp6HMXopwMN5axwXy75Tt5QlifKi+eVHD4vHCQML8XdejRCLlu0OgKcVY?=
 =?us-ascii?Q?vusY/bC8JEh7F+rTkoYebNHnls3Dmgp7JJGabsTJlt0Qxyipi5GbeS8MvcaU?=
 =?us-ascii?Q?aRTIC5/L84wdBDkidgQg9K7GaNIzVafgamiMuKqwZ2A6JeIE3xi//Wkt4mOH?=
 =?us-ascii?Q?xSSIu2jlnyqcIHrw/K+ocVm5YyrHe4liEIvziKGUBReWHFKt7l0DxL4ZWRPS?=
 =?us-ascii?Q?SQ6IEzufioTtrckGwZUq30mGrEhBso7Omwb4Q/mGBUcvfLfG7sfuN5CiJdua?=
 =?us-ascii?Q?ycnka+uEjOLNG0H530voix3nFqzhC2goSH2ozQKa87JHdlqkkACJeEjkheaI?=
 =?us-ascii?Q?1gvEbItIm/DIazbXDbN+JdjmhON88MOz3jKmJHGmX4J7tv5Xr771xCun1Vln?=
 =?us-ascii?Q?36s0J+EbicnjH4EaR21PhGPjkvJGtFFvZVswxtqMPHaqYqVUeckivEKelMYV?=
 =?us-ascii?Q?pBfvnNWsugPNm85877PvzKa6ioaJ4p1HmUvqCAOFa0q/h04VaBro7sqm+gQZ?=
 =?us-ascii?Q?qiCFx4pW4/1DPWD9p/M9S9GERswjiCxBrWX7SsSzvqMMMWJ63XgH+RRDuwfX?=
 =?us-ascii?Q?haNykLMnMnWJWGD3f4/ueQmW9tkcJO0aUqp391r2WbOh18tpV5dXS5ZK3dMM?=
 =?us-ascii?Q?x69kzKy4g4cXR+3nr8cCWwliKP0JB5Rx7cmkQGoKdLxdNLBBl/Xs2LWBV1Lp?=
 =?us-ascii?Q?5jORObUUxktSAjjFIDAWPQlu8uyF3jGsQnXfP766FEWbqHbxColyfzDJzfVh?=
 =?us-ascii?Q?kpN0aP9G6nq8jRuUgf+suss7a7XinLZ0dubgIZQQ0qyOuBxoQh9vHFiJcjkM?=
 =?us-ascii?Q?i29KEunU6RzymUpOK5GYw2RtkR6SrkgzFYooHgaBVTbrtJfcHeFV93dpljCO?=
 =?us-ascii?Q?dU8aW/r2UCrf9NdcfNu6kGlBXcKtV6Fj7Ueg2sVbjL8Ni1WufkzeupnD2aqb?=
 =?us-ascii?Q?UdFugqYdle7qywYYC/+t3KkysC1W3UfmuOmqxJbRbZt6FXbr8BGfw+tBFuVQ?=
 =?us-ascii?Q?4LV9UDcjIEGYWeRpSyVP8SB58WzhUygcipDxlRR+UuQiaTU9dg/2SLZIrr2P?=
 =?us-ascii?Q?3oLTitzfGxu9MIDbYOLLT95kbGp/KoaVhOtybJAywiGKoeRKVax1qXWVR6ci?=
 =?us-ascii?Q?UIybFtxZuVw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UcVl7/FaUa9/cy8+B54PtHBA4PLVbYnQecbhHatozbyI0KXlbxY+80qVSVqE?=
 =?us-ascii?Q?g/2vKECKTw0HnECQihH6iGVRJ2C03Dvzlvvv6ftywI/GpSdKk/HZ4JaM/tmX?=
 =?us-ascii?Q?6rviTjBIWpYC+IP4Pn+aT4kks0QGL2LrtrfMUUVHVLI6oIJanmEOQ+gtCWxi?=
 =?us-ascii?Q?hxJ/u2xbEmAggCvkBElkBXo7B02u/Rvz6OhAT3CfHJhHxAkBJlk6d8UjuqmU?=
 =?us-ascii?Q?OSjxhk6DfEi3/Y4tgYxleW2KM8ft0dP7v8cAOcHDEzt+4Lzrq7qUuANU+QnZ?=
 =?us-ascii?Q?cM389Pa+LZpV2CK6eMELYdMZOQG0oBRZmS+T1Fk5eg/TVYfSYbTaaKE0ILHf?=
 =?us-ascii?Q?vrQddR5Vk0it+HCRgIHplDdCaBnNXwMXIWD1Rffz2FoV4Dx0aZ6R1fUSn4ke?=
 =?us-ascii?Q?SloYa+XSi74F5qKvbyWEo0BkN6gcbK18Kw6QgId2OCu0ZxtDffd34ea2ftdC?=
 =?us-ascii?Q?SwJBokiA6BLCmM3SSwkA1UIJ3ktcJjdj1fgNR6lrHPn3uHhJ1aEa/IPanE3P?=
 =?us-ascii?Q?3czj1UuP5vGZlcpwSdNYDczhqvtO1QMsELd9o8seI8zk9/OGrunZzzxcUdMW?=
 =?us-ascii?Q?lmUcEM4CsXEXSazD87NOW9UppW7MLxg1GKZgIPnpwKOhDemkmU3bcHXhGaFr?=
 =?us-ascii?Q?XwGqa8Iu1iwk3SsnUGGXjpYwr/1S2mXm8gC/ET9EXxUZ4Hxu8JcIZ2pEHyL2?=
 =?us-ascii?Q?RBABdyIF5YMDho6NmuNW0SeG9az5867qbh9F02Bl+wuJ4+h6+PqXxKHWm/Iu?=
 =?us-ascii?Q?vx9YJiTPpEz770eOND8jKN4HgB70ww3bzwEFVa6+ZhUBSH1scnrggu+uMFqL?=
 =?us-ascii?Q?Gf+NkWYNx59wHFuMI0lTBOk/ymu0st54r2QyrUIiZgFRI0YLQdTUM/pphBag?=
 =?us-ascii?Q?Ma4G+ceOeDVWfCEbzr8rKeWWK5jBl6nop46r6A9O9EvwAKu92fTUkAoQ3ocE?=
 =?us-ascii?Q?uYIeLC/xNJE+4gRx9OXZFfhA/Ea9m5DIBacuDLVCvqDNNOkjcA4VmrrgagNB?=
 =?us-ascii?Q?ljJI6xGy9Y+v4+osTIrkC9aiJgs3VOjCLsnQlJJYJpBAVYkYYoQCedC7h9m1?=
 =?us-ascii?Q?J7OVcPwzy6ddMSx9svOALab1fDQBwWOUjAcRd7wtS+UjvuQP/0t+GK87ScBJ?=
 =?us-ascii?Q?qzh3Sr8a52lmnyPyf+HuOdvB9MSSDw630GNwuTte0CTe6u8T93I+WNGnjYsI?=
 =?us-ascii?Q?JfgoJDNdijQexfLKizKXpdaAlISjeoCh88X/NPU20VP8p/rucLGY515weW72?=
 =?us-ascii?Q?kU8L/hY4jGR0pie8ISiohLlpBNtvCgURUjbDjRJoD0MYmR2i+RJmotqu7kK+?=
 =?us-ascii?Q?Xu+HwV+BcKEIqc0kaP0KFTIFLwJZCN6VRWgP6xrt/6Mf3JSp2vqIewdkDoym?=
 =?us-ascii?Q?1lD04bq1JqkEcCBFx4lgHUAn1qFU2qvtyMHqZCol/6ko+HEYnVq+14DUBNaJ?=
 =?us-ascii?Q?+OVMUofQmofj2P7aLuMqB5QQygFPwqgUJ4uk94gB/0QgW5L8r0a/HCDqry7q?=
 =?us-ascii?Q?iMYAp4L6P7RBFR68wToJwfJYcapUMrM5vhv48K6dmG9SjBQ7MAfRKjvzYeFC?=
 =?us-ascii?Q?2z0FhLLsTFbPz2FascVLI8x4wxz+TkkuL+t3dUrQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Bw1pS3Kc6/brb9LIrfeZF5QdGhWAdRW6hDE70Quj/cPGMOIC/Ku1AS1xKsvlCqWdKt4GyXZcUXPQkcEqvcfoOS4BkO2bwaqySu3FvryHiLQkHCTC45hAxjtKAoJrJP/stx0pOF5LHQlEVgVz1DWI8MQFlQ9ZkjyvN685lwnWG/2th+CEYqKBtgyjUY+WugOV1Hko1PrhFcCQeaE61+MASiffdip/KC4TvaZGv4B2JJUHyWWij5Fzs5PU5PvnSY7+eUrn43cVb0nWYBlkMl5ReFtGA7shJ3Y6tAnZNhZLtZYdXg7mcoIsTT2eJ3bZ+F27MDkwWwXj23pu0pBBIp+pNQoQnutdm12Adb5TahKJLj7t7BYus1Xix2JJ9nbsLdI6Mb1U/51ABS9jtfl/OXhFb08tk+fgnyvBIdXbXQyLEUpRvV2PT9f+BxKbs25l9zANtp0FPOjZw6r2qnjkXFDfVrIE2gvHR9p2qSzgqKXHjS5ume2Mk6fiaBNP2B2+4DmOqgkp5MwOlmCuedxJhYwZkKlE/twqmtYqLFYqm3fZ1t+tHzU5brJjrJUviyLA115/4yBEDU5aB6N7A6KuqCHvaRqjLvX5S9ED1nmX70CwopU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb5d90b-438f-4455-6fa0-08dd80b60a70
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:22:30.5623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DZYyclqzfA9ulZBNg6JdM4UBgAe5/5LFRHmjBIi5Ku4xboBiy1wQM2orAReo1s9oLyll49ajn7pZI9NroEnrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8468
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504210072
X-Proofpoint-ORIG-GUID: aRPZYrgmK09GRilyp8GfGhAI3CArm1Dx
X-Proofpoint-GUID: aRPZYrgmK09GRilyp8GfGhAI3CArm1Dx

On Mon, Apr 21, 2025 at 04:57:27PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Minor cleanups in mm/rmap.c:
> 
> - Rename a local variable for consistency
> - Fix a typo in a comment
> 
> No functional changes.
> 
> Changes in v3:
> - Rename variable from page_anon_vma to anon_vma.
> - Link to v2: https://lore.kernel.org/all/20250418095600.721989-1-ye.liu@linux.dev/
> 
> Changes in v2:
> - Dropped the "mm/memory-failure" patch.
> - Kept only the uncontroversial rmap cleanups.
> - Link to v1: https://lore.kernel.org/all/20250418075226.695014-1-ye.liu@linux.dev/
> 
> Ye Liu (2):
>   mm/rmap: rename page__anon_vma to anon_vma for consistency
>   mm/rmap: fix typo in comment in page_address_in_vma
> 
>  mm/rmap.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> -- 

For the series:

LGTM,
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

Thanks!

-- 
Cheers,
Harry / Hyeonggon
