Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2AD25291D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198158; cv=fail; b=NkSrpVUUNdY8OYOqgEQtjsr5iB9fSh4LNkdFigtAU0RAZVmYL5siGiFy4cHjC3n2HTSO0hjiSmS1JEKPzkl+cFCTicNWNtxtC4+D05ZWavb3noRafZweJMbM3R3NdnV3mv89gTLACpguxE5/uvxiMr0T9gRQOKtM/U2PIwKZEIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198158; c=relaxed/simple;
	bh=b/7u9xlmzb5bc3ZNhFUswMh4ud8US+63U56gey2I+Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rjYOl68kEJMw2y12CvatZdBZ8T0wE9GlDaq3Rh7Ps5vBeWtAzGkWInhJnwsc5hwRRcW58oq1i+H+h5vIdd5VJBxYGR/yQ4n8HVHNtaV4oGfFgCEXGhUGQEYUYdERf9CgVfMSZEGQIouF6Hqs+ZkjQam/2VS7trqUZJbaVHAHotA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JR53OLas; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NhmVxay7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JR53OLas";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NhmVxay7"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A7uNCv014908;
	Mon, 10 Feb 2025 14:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=begM9ojHNqGA5HUIBo
	/H221RbiTQDDvVhSc+JnDw5RE=; b=JR53OLasAGjfKbu/XNn5mbVwYShnYCE16v
	vZXaUB1JTW/CXBMm8ME5tX4FLH6JfsFNPpAygAfLw8xrTHB030BYYwFSCnd7fXxl
	2aSMPfnYb+pT3Ko/O4ZZGfQVFVjU9VjsdRxbJJdXzKZQETeXLhRMFQFJA9+b+4BE
	bCUB2luTPXJSbbrs7sNR0LILxLTPrr9bNJxRJVwjpKjvwf1VRM6G3oSblgPnzMKa
	KO//y+9UQzVKdMN/hScxfjQ9PsYNECpKBtA9rKIXiEbI2c/y6caXFP6omipG2tR1
	oqCnNw05c5VnujOZLuLsaJPZAh4yTATU/9ig3KptWZfOmoGvN0OQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0sq34g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 14:35:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51AEBuna002374;
	Mon, 10 Feb 2025 14:35:44 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44nwqdy2uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 14:35:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xT8C0qLX6A2X4xcztdYSXNkYcnqoE1wIGpIMYIoKXhuMKwOesPT7vfjdTv2ViLT87Sdw732UyFmxa7R9m2c48Ie8cB2nEJ4wqf/AWzZKpuh2RFZdU9j2I025TWyu3bWAgPgEiQ4NGgLXznHK1aKpI2eIDrPTB21K5rFJbo2JdsV+9BYhBZrdvRQAU4/HP/i2icWdvPOu5uZH+VKbj6kEzNQNdjieF4blcZDtUczgRxBnIVfcMDYiwX6MNWGLq91Od3P2kg4t05M4WtT9Q+8fxrjhHugHpQ4SycuiB9dInZmG+rdURVMdHY12wlEIO3O6wQQSvpodh6lbpLRkRAj2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=begM9ojHNqGA5HUIBo/H221RbiTQDDvVhSc+JnDw5RE=;
 b=GbNP3iAmC4TB2rjY27V6j83yHYs2lfBCYTa87gboUdFphoL9puokKHMmFxUYCdB4gHUgT1frPPpXr2wAMcGUFWQ00XicMZPxeR9T9hQHa8zL3VSwLFWjgXu4V8alRB/ZFFrpLAWEJRYzJeE9DgepwEmX1CZilN+zhCiFSWr+heVgYBZRw8T9Y8D87N3o/mBqgZb794nCyeVlcVBQjjmpOsm+RIvVObeIY2HA+1yPodnM6J0tt+n1m/NRoTbc2Wdv3ACfX9pLsloBPu2qwFHDLx/AzALPeoANSkwZUiS063vRlX0bXbVQN6j9KnKqax50cv+ddpDSDN+Y/zZyq3NYFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=begM9ojHNqGA5HUIBo/H221RbiTQDDvVhSc+JnDw5RE=;
 b=NhmVxay7bvv5SjNsoNmU7HnT+c3VO7GGg2Yu7xcPqtyPFZCE6mGHGcupaNP1IOq4+AHU6p0s1cig7sNYt1xCX3eSU0JgK3vhnThOlEeRS5CmngyBN0T2Z2i9h2Pw2ruoYxjYghgOg+zuWnT+h9c7+A7RPCVIawhhHk63d/lcoqQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CO6PR10MB5634.namprd10.prod.outlook.com (2603:10b6:303:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 14:35:42 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 14:35:42 +0000
Date: Mon, 10 Feb 2025 09:35:39 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: akpm@linux-foundation.org, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        jserv@ccns.ncku.edu.tw, skhan@linuxfoundation.org
Subject: Re: [PATCH] maple_tree: Correct comment for mas_start()
Message-ID: <2klvs7hjwnrmazulgmu2dnqtjwpg37iynwidvronk52sedrbt3@4nnt5x4wzzoq>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	I Hsin Cheng <richard120310@gmail.com>, akpm@linux-foundation.org, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw, 
	skhan@linuxfoundation.org
References: <20250209181023.228856-1-richard120310@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209181023.228856-1-richard120310@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0502.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::11) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CO6PR10MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d44ad71-2a9c-48c0-ca64-08dd49e03228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sLrX3xBWOKDKx1Ri7s1iuIopmzCHtERJ4wJ7FBbOd5oO6u2Dz9WC2Vfkmi0h?=
 =?us-ascii?Q?TTJW2t5/vYl4ueyus2Q++BbFK1kC4MEGkrR33AJxZjjgsoanmCFPRxVwYFck?=
 =?us-ascii?Q?1VZuV3GRPa8SgkLfLALq+59UPFg6tvjEER+EFssVwErvZyofXJ2duOd5TOTN?=
 =?us-ascii?Q?dlWj46FUgeLV1+keWP5ylmELMShU2yMexCQr/XCDUlHIvi/2qwV7DiWVa7iT?=
 =?us-ascii?Q?dtVpnTH+DpeZhJwCDpIhv1cWo4YGAIT3Y06pz7EPcDEfio20iFV5jLvzNeac?=
 =?us-ascii?Q?riLMiJq6SUxCGmpaNbAvCmiTVoHKb/grwMTuOTLXt6yQV3ttLp9Yq/6xiYU0?=
 =?us-ascii?Q?siTyLrfUdXitIzZky/Un65uW2MNpfTYFDoW4XWAfIRDNYFQn3bXNDe2V7zDt?=
 =?us-ascii?Q?AWo2LLxZt3D8JSrtIJMDie1re4ceO0Wz+mPbwIdj9sqk+kvQ2F3DH0uVMWOX?=
 =?us-ascii?Q?NCcR52zOmV6Fa1ddPHYDzYrwn28HMXrZSPB4/vS9F2E7mqtbEYyFtzm5A0f5?=
 =?us-ascii?Q?1DG9XIznfxsWN6ycfsAU9TxuL1voL9wPe8Jz7VhFDRaLueojBOcvLXzAqz6T?=
 =?us-ascii?Q?RVaBGvh7R/gAWhVPMfnB518bItOjyW12LRaqZ/5bdQjbTZaTbAFxHdmO3UWk?=
 =?us-ascii?Q?Kz79E5zh+u2Z+F2tSK58/yyhAYtlmMhCSSNme84wkBY8ciDqUu5sXf+MnJCa?=
 =?us-ascii?Q?DukCS+Cz9qjLMKouvybihAtWhRfoUXswlS9L+FifDfBz7Ta81KPwILbR5Pqj?=
 =?us-ascii?Q?EDBSg3QKgxYDzChUgLnHOsVCFDtvhJVGiHcwdxxBofwH6/g6UGUtY5Jp9rVJ?=
 =?us-ascii?Q?CBLv65kpI1yBPfEV2bBfXLyZz0A5UyrhsPDe5+ST80kLAkl+Vp2m/wpGYT7C?=
 =?us-ascii?Q?YpSJdmbenChPqgANvo2O2j/ry6EORoMXQMDatjtuQLQnVde4Ev3gxnsf4tEr?=
 =?us-ascii?Q?ZfPFZBtqouQQrUevqUJ0tbJ7ZwWs/+wdAmwZ+xUQyrrI0MLvY/EtPYbJiTPB?=
 =?us-ascii?Q?kvE9DMdno+JVgOXsoYgW/7+R1wU9cLAn5OMcfs9oKT48rBdl+7+QVG9uKlOu?=
 =?us-ascii?Q?LxH0qbX5TOMbFJWPvv2n7Hoym9c0S+3YFewxkHOTSolIp/yQsJooH2IXnapV?=
 =?us-ascii?Q?KE5rXal95jibygMgoZMvmEkY3i3Vv40J1QYE37wjNeO8UOClXfMuoz8AIVW9?=
 =?us-ascii?Q?pIHfCz/lXak4IbyqTrdIED3tgSU/Ojo5G9rQpXQe5xGZOp0PzuDdhXlGPY+d?=
 =?us-ascii?Q?9/X/5n1TW8bwZJlBa4xo1QkR47q6c0uIWiwbfNWfOhOuOY1SAzHk7kBWi1NA?=
 =?us-ascii?Q?pthAzhXyUHJbFYW51+vLGdYhoBOABmNmD3VkwMNCT63eMqkJjJUbuLt+4WNc?=
 =?us-ascii?Q?Ysa48FVX//KzvRDZcWZwMwbnMsex?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ytL/g1UyzZrDKH0oGQu/o3Xc7SAFicw63NkbqljZT3TA+Bo41xurVALLKSsf?=
 =?us-ascii?Q?NX6ntfJBaoVyptBr1hQTa7LgqP/MyHVtbZfi+ouizqTL7bufWQBqU2xWo1JH?=
 =?us-ascii?Q?2KvieVdJccttT2hQHypfOAHKnvvVQJKNI9/yvetRNlZTvGCRJjcs/opH8uts?=
 =?us-ascii?Q?8OYn6XNV5Nl7lsx0d8qTjo8phMYaRq9bEDAzdtjAaGQhAEfD5ZTK8vJ8csao?=
 =?us-ascii?Q?D7Ag5oqXHBK6dfnJ9gftFo7jLom5W/dNGg2mzQZn5AvUMujPTMektaW80aT8?=
 =?us-ascii?Q?KCpCekTU5yN/lHlptn5rRuo7o38/DrBbZftKuESfnhpsTDZojMRofyOgIvBS?=
 =?us-ascii?Q?IuIRw/2q0PyWUhNWdOL6INF1LFaGlLJa0UIj9o7rOgJG7mjx4lrgLbI5MVXU?=
 =?us-ascii?Q?U82YdJLfk9Iy0wurb7vnr/LtKkPBScXzK0weIABA3CS5lf1BzR1T1vIBt6mB?=
 =?us-ascii?Q?ZrYozcTsx8/engfiNr/9iUCD2BM9jiPXsY5p5uVlpJ5h3104sNqTIeZwxKDR?=
 =?us-ascii?Q?e+TeLIQT/jbM0ew3dsQwkYxJNwYYGsJK6TYpvHGfUVV7GkTFcKWyCjqJDKLt?=
 =?us-ascii?Q?q9w8K4ZNrj6V+NhE32byTkc+RqFg+z6hx94Jogax/Qe5Kfi2AkD8gNGgZ54u?=
 =?us-ascii?Q?n3ft83szISDpslxSROp+FY03/Tw4olucz2YxxfcwwKvqtEfUdfrSVdG4f/sQ?=
 =?us-ascii?Q?wXDAVgig+bXSswDBSpJL9cDIQ4kL7DMvD/nl/3Ia0qw4YLLQ/nt6CsImXE2y?=
 =?us-ascii?Q?XjQG1u5D9q3c5S+Ze14e5IYgUTZELA8Oqn/Su/CiB3WmOfdnAH0XLQOR67e2?=
 =?us-ascii?Q?Nz+Dx8JsMRjQFtlXZDyvWP8kLSl18zgKtATH6GhonX4WthAEHyG2Fn1UEk0X?=
 =?us-ascii?Q?UWo42jiEFZU9rePOffOVq54yhEZZM3o3pmzgnnhG5gzQZP5eIJnvtTaCxpP1?=
 =?us-ascii?Q?yCTi2p4Vz1mJDs5AfevouIrt0urX/XpdbWKZCncbbLrh/tJdOG55YpCVP5tY?=
 =?us-ascii?Q?N5sOH8pJHJsOxAs56bDbKi0g0mpaY0+EEwN0Q7ibsK50mMi4h6X0y5x8SCIJ?=
 =?us-ascii?Q?QKZREywxoCZwEYYDLPQcEO8qQ+OSpzqPpqyeog9GIcQYT/0iPxU5JCf6Eg09?=
 =?us-ascii?Q?+wuV5ZCE2j2k8Uu/YMXyTEAIZzauel0TsSQjXxiaSdH2ztBrttuG8alHds2m?=
 =?us-ascii?Q?UGvDoDHIiihX2zwF3YDssT7DQF32qAOMikC3xCBswLVxdHnBZWjgnw7fmf8h?=
 =?us-ascii?Q?dzKjzq2okTWfCdqzHs1ZGwYnOEjh4aFkcOxZcrqvj7bE+LBNwO+G2xSOnDxE?=
 =?us-ascii?Q?7PCunQbidBiOPsoilay8LNBkUy88J7QwaR1ui9Kvj00igyJFtsWxIwIjMPFF?=
 =?us-ascii?Q?PaCFdbRweKq3bbbKbTfF0a47J3yqrhrZlKFtywaaWWVqGL6KJgzrK7LYrno2?=
 =?us-ascii?Q?a+IFVK4BN/bxOQ9i6tm/Qw4vb2vUuvBmNbjdL6yit2VJATZKSJmJ6/vpV/rP?=
 =?us-ascii?Q?qkmbxD8LlEmfXNxcpyg+eBF06x5bAZ6DyYQp8WNe8W92ZFZdLp3tWCJ0pjQy?=
 =?us-ascii?Q?3xEwolC3Jph4qCnT/dcOuzktXjARhyDV/F5ZUhHs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XEGYmhzwT6xY02RcKwV0Q9oWd9fX0XkUO2llamcDK+F1wMVr3RGhMXjD+CpdLvyk2da6KlT7FhPK4CnxRnf8J3quWf1WBgTSYiGmov/hyjThcvTUvVdMxbCyRlzXOiKsn0RIR7WpqiGPppQVK9f87u4JHqZm2hQCs2c0tR5SlRIXfW2wMrmpi8Z+yxvy1/Zp2oF0ljGSUfB4SALIr/EE7dqtX9QqMCWMuv+ediJU8cu33p3zDUQCKVC1ykpCHIOhlGbnntANI2FzC2pKMNGh7Cb8KIi1gWzIgP7GlqHn1JHVT9Zq54/2H5KVZhAfDG8T/qVLhQzVaaG+A0LpbhOJlPBjGATfZsK++Vn3CQjEXOseqkLdV5AqYKa/+h5bN9EKBXPDU2Iw5Vx/H9rWRl0buFI409aYw5gqG1HLHvNQZDvH2c9oU7nT0hg/GQAwtxYOmA/jwZpplUjsynrCMvscA+hkIG+RlE/5eAJdKSONEYgkIuJ3Wx01RDffk9U4Jelmzew8JHWz7EtdlMlb/7t0+Rq9iVyY5tV+N66PAgw8PaTq/hEAxAr9rBlM2Zrnqasl9T4dNzdtlUzoOYk5Ll+zNdxxn0wvPXTKrh0mK92zD8Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d44ad71-2a9c-48c0-ca64-08dd49e03228
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 14:35:42.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNpomW8MuKEjcKSpeRP7ksksnedbChpjCDxsvORVNZigpDMDsK175fvOA0aGJOwu3S2vxWR1dadgoNhSolrVDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5634
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=964
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502100121
X-Proofpoint-ORIG-GUID: Jpo0Ixn_i0C-gmMFXOnegaJdlikWNpdu
X-Proofpoint-GUID: Jpo0Ixn_i0C-gmMFXOnegaJdlikWNpdu

* I Hsin Cheng <richard120310@gmail.com> [250209 13:10]:
> There's no mas->status of "mas_start", what the function is checking is
> whether mas->status equals to "ma_start". Correct the comment for the
> function.
> 
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

Reviewed-by: Liam R. Howlett <howlett@gmail.com>

> ---
>  lib/maple_tree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index f7153ade1be5..42c65974a56c 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -1353,7 +1353,7 @@ static void mas_node_count(struct ma_state *mas, int count)
>   * mas_start() - Sets up maple state for operations.
>   * @mas: The maple state.
>   *
> - * If mas->status == mas_start, then set the min, max and depth to
> + * If mas->status == ma_start, then set the min, max and depth to
>   * defaults.
>   *
>   * Return:
> -- 
> 2.43.0
> 
