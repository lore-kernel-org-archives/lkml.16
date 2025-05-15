Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CFD1C1F12;
	Thu, 15 May 2025 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317396; cv=fail; b=DF9f4yRArdmnl5U+ZNugDkwwKj/57M31qOHwUGN+7kKOBxql6J9Wtr5JTpuoHuiTAF9bIqrsvzTF+vnOluIJ6LyNr6dWYhO1F5bEC9ncKA4kJeEYfTpfOHuYylwu2Xk8CJERxmxi5NVP1RU50pHsdUfZAA/fhwRl3Dzx7htNwQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317396; c=relaxed/simple;
	bh=hFqY8DXJHxbgFZbnhNf3Y/4wV8nrCYJRwB/YY3Qi/WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HUVCU69BJlDWRq2hceG0URJ1zGKdkobVchf/8MjSRwGQT5LA3FiDlbfw8pxTxtOewHaLGar0bcWne2pPuovqhu1sRMMZiHdyz8QarpzAcyKOxJxmUnFvXRxJn6bIRvACXxuKbPHSivPypBkQanhlzZ2JYiJ2rICzzOtHBcV9Dac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RpO483T2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dy3EWP/I; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RpO483T2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dy3EWP/I"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F7Bl90000856;
	Thu, 15 May 2025 13:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=gdDlaQZwnb63dmvTqo
	LVxQlYzdBtm6H1SlAiSNvjYQQ=; b=RpO483T2PGBj0oL1dpeS5D0Tcl94B3s9ps
	5R7algQVnVkiZDTVRExLLym5lI/8P5IvIMbEsWt5Ayg8Fyk9HDYrimlZzhLg5XqD
	5vgFj9PQHG+r4QUC+F5I6hwPTTsBH3sk4C3TVGAaR+5UV8YJF3xhzURdHS5+sDwt
	3Jwq/OjETWBUfZC1Gq7A1sC/y/TBJcjIrtpMnEeNW1ByUbi4CpgK6y7LVd2XLCh5
	q26mt3KE0Ifn0mJcIqHqGMU+aG0zjntDyzefqQpWXbzQx1QGhQ2wSdXmD92bbpHU
	+LbqWrmvvweH54YKmfnY5qHQo11lAeRbttK/iymOH3rbrCZK4S6A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbchv106-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 13:55:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FCg6Js004936;
	Thu, 15 May 2025 13:55:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mrme47bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 13:55:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9UygAYRujjQuBIj1E7G+luzRbWmEcf6teVsToC3mwt56hpwp9j3C2bQuuD99pfvElwZPkfJuh3A4M2/ykunF6qYF99/ZasfR0ZyTRW9Mid7dsCSuLC3t57yISVsYwd3g6RUN8ECKVo/ItAMzYYoQTipwOWDr+AmWc/vHyLPRE96z9gxOcigMrrwaj5indb6MamEjLxprFjnJ7NG44cVeprjogr4CgkBVQ7VYzpjqXH5FD6AW/jv0dcY3PpF55YpJUVHWRBztKqwpz+ZXPGygR3TBp2K7E+PNZKNVujyb+5+N1xECTcJMeWO6VbbkrJG0NI4knpCD8pufNRGJ78LHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdDlaQZwnb63dmvTqoLVxQlYzdBtm6H1SlAiSNvjYQQ=;
 b=ABhNJ9PNtnldzbbxniilvkLpky2TnNd1y1krJ9zkgqg0yMI4BDmqH7w+xIjD6yOCSbWBDKk+fb3hrNlufqFvKTSDjfQqJQbfjoOD+YkXLuHTM3V4H2mFQSCp6KJVRc/L/wUVq8CqY8zMBvW5tutvMryT5GyhRtqyoLgQBRwSCHOXDnAZuKTrLPGRos6/tgFikbyQ4xFvZX+JUpnL1djGxn9fsbDBuZX8+Qlsv7NXobO2QaB2VIN4mMdLabH2Z8CJzz5BG+DnE6tjiD9GOGkB5JRO/v/aIjwVE6/8krIoIoLnUuf70oYHyjH9nM/ZH615b6nsQYitE30zP3JOo5zDOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdDlaQZwnb63dmvTqoLVxQlYzdBtm6H1SlAiSNvjYQQ=;
 b=dy3EWP/IstRS6FQgEqGSFyY9/wqjjLCI2Q9mHM2GxdohrOgFiA6Dcir54OVMGl7tMCOhDeVVkzP6uBA1S9MMqlSPoQ34+cQN7RxbrdaRppaoGHIsnLIM0i4jvg9vW9tcBZXPanpL4LPOMt0psWocWgPkougPwV7/jI0/uU+3yYg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB6902.namprd10.prod.outlook.com (2603:10b6:610:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 13:55:30 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 13:55:30 +0000
Date: Thu, 15 May 2025 14:55:28 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/6] prctl: introduce PR_SET/GET_THP_POLICY
Message-ID: <6502bbb7-e8b3-4520-9547-823207119061@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133519.2779639-1-usamaarif642@gmail.com>
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: ced9e386-62b3-420c-c6e3-08dd93b827c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9SoK4e9mzEGRVH+XB0C8Q30rvjQZbWQzfir4m9LewfXTQCiwVLHAk/HSVEs+?=
 =?us-ascii?Q?7UCujSHhFiyslX3sZKMgetDPpMEVrrI/3cwtICjvQI5+74qHUjgXCQhWzn5k?=
 =?us-ascii?Q?nBudVjRzunbEseLloNVJV56woS8hJiKZ06O8QmqixLLGdQ756x91/Ec2gd+3?=
 =?us-ascii?Q?CfTTWsinNMBy5KuA/3J+3ZWPbrqHIfhtBDZgxEGTojDw1enAf9cZ0CW9gLe0?=
 =?us-ascii?Q?WkoiMbh3aCDswpVuwu163hAed3Gp1d3jEzrUJbBotriL+Ip9uxC6ymig0CMG?=
 =?us-ascii?Q?dkKChJjpR3ukl29mx3HP52COCzRNaoqaILhX1n9T53TPC1O826TB3gkXbcDK?=
 =?us-ascii?Q?olKHVSZZMhTxI4AGTT+n8YcaA2QNfwbgxhYpvlZo4Y6kAUnRsOAgmwNGNMH8?=
 =?us-ascii?Q?iwAdcKFd4bWaMx+WO2PaISk6Uux+oFDuTWtC213r5t9K9u1s7eM09wJh5nw9?=
 =?us-ascii?Q?pJMpiCTx/vLUN2ZpY3CqSd7fyhnJuprqc/GlyhMaVoAyGwBiJ96rmXntITk7?=
 =?us-ascii?Q?6j9+BasKdG3znyiZzV+n+YLXd7Pyq+EqVB2q47Jf8WUm3TrYE0wsXSJanQ8u?=
 =?us-ascii?Q?2BNr36QMimc+Nu33f/OYCiffAaViz2mqf3duQw0adyEhWFIlekVYyRFWsvPJ?=
 =?us-ascii?Q?Zu777Yoe8tTzjFgD5l5N2iBOEP7N28RKBpQAqmtjKJNhZtko/bnR/sqOF5RU?=
 =?us-ascii?Q?0djZd+Ykg8t9RUzb4BSO0tC/Rbf+ZVtFT1a9aKWnRtOkhwe/+mRKh5Cl3iND?=
 =?us-ascii?Q?CWMbCpVSQ7sxK2/iW77+NSSiviYQK8OcMbWhYKl6rl/cyO/HMOaPgUpKVLzQ?=
 =?us-ascii?Q?xoAilX5iViHIs0AjjNAAbrdHplzL0VnaBLn6/ke7MgaolopE3ImB1arSaclV?=
 =?us-ascii?Q?UJcydTXqw7nS84wDgoi5YTrx19cxCn3R4iBLIZijImVujfIjhYSWwhEBn04v?=
 =?us-ascii?Q?cxRlxCyhIP6I5nmEKcUGWVO+fdF8kvwZTkwNDXFsD+QgjRnjHQlzK19b67Nk?=
 =?us-ascii?Q?gNr371kBadub2Jq/iawCx6ii1rqPepx+YFERqHZLWYI5TehAfiVl6n0jV7fg?=
 =?us-ascii?Q?xyPUuf4czvi4GlK8LpvJQ2G7IIJJggF/Ii1ql2GaWw2J+auw4SayS2mITaj4?=
 =?us-ascii?Q?iTO8Lg9SPu2zczKXHPa+2K0XmWoZ87fqeIeP6RvVnhYggDJAc5J8UO6qYpFv?=
 =?us-ascii?Q?bSqZ3u4xAeDs7ITfwXfcWOamXj6WHHkEBNNyP0baIA45T7BygQN9hppGa8V8?=
 =?us-ascii?Q?0LGt4o7MKVZHTbV/75mGhiTUFMzb+0CMtUrjy+iMBrBOI9VoVCNDgFr+BIk1?=
 =?us-ascii?Q?NUrgvGNxf7XjjdBO5cfY1wKcyXI29Hha431uwnXCJI5kXE92RegKub4a1Zgb?=
 =?us-ascii?Q?nPhR0Dvq45yu+kOaqRT65Weq9hYFnB26clZJod5cbE9U8wuQd+V+7mAm//qY?=
 =?us-ascii?Q?TUP3dXtk8Ds=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8uXHIg/nvCK6SUWP0nNIVK1oXDPKyqNuKk9q9as0fRD0vcBZfQ+jK2MDw+Ed?=
 =?us-ascii?Q?FOFiaUGQHJvSaOm4eNVb20ERZX/wAw6rzBlHzi2SwkvBW7JI3hnvLUJWcLNQ?=
 =?us-ascii?Q?lzNnmKwvFOGhXOaJKLUC3K9xXeGnYIuThnw7g83xd5bHoc2IHdclT+ate7Cq?=
 =?us-ascii?Q?eh8WOGAcYoTFXvDrBGfcxXyxhzBx2A358+JsXdE06ZhgWfqqHgj/4awPWbH8?=
 =?us-ascii?Q?svlGwAmw3bp8WvJ3cx4ZffQ9gzo8NgtNlzRH0WVsZbFq4M2UDL0/6EFeDVOp?=
 =?us-ascii?Q?fzyxg+tbnUpy1EsyYNBteG/2ArRNfs0tIg5Ji1rD9sllL/oW/WlGpk0Bxlsa?=
 =?us-ascii?Q?0gyZG8EvFNo1UNfp2YobbW8UCutOyDHDORxKLbxL30c26h5oIW6AkpUnLDCY?=
 =?us-ascii?Q?+jMF2e3FCz6Xj5xjAiucQ2S7wDSCCAmJyYRd7fKQO2uJW269JOs3wSu8sAvc?=
 =?us-ascii?Q?DNF7vIWNcIgnrd7tmf9egt+QnKo22KZpX+ZkficoHomrhrxC1MXdKF5RyY1R?=
 =?us-ascii?Q?fjLart3uZ6PPKMdXK+9hh++LA36OIJVUjDnlKzw9OytxQV1khTf6/gtKry/D?=
 =?us-ascii?Q?CMRQLojUkk5gM46U6SRpo1WFBVSiHPgcHzwHCAyswFJuQd9xc0AWIpJSbCFk?=
 =?us-ascii?Q?GW4erc2JKjn391Rgf6VxiuwZMs+qFwVvXZNa0k9lJN7XRRSS7EmRhAwBfp1/?=
 =?us-ascii?Q?Ddx4jE9BwPIsKlZZGcICMEdNAKlwyKxn0CrnafE/nrEq3VoWa6BZwyYKFfSr?=
 =?us-ascii?Q?I4MLgpoZQxjE9cO+xB/VzZl6xgiyJ6sFeD6tH7AAOz/656DSJnET18OfhkSD?=
 =?us-ascii?Q?kQJ1casPNB7z6skwILCyZFpTIAdqJjdwPqNpOK/F9Y8ai+gfaVZyBjgeKtUz?=
 =?us-ascii?Q?/Nc4wNuhoDO9MygP20/oUxPNvMgVTblcIh7jLnTkWRoLJHZjYEFudZXPn/Ru?=
 =?us-ascii?Q?DCnO7aTYE79dh4uXkd3ZHnpbNn94N595KbEoVMMqF99f0yCg9fTNYYBrZZK4?=
 =?us-ascii?Q?MNXREUwcbeOWB0s+KX5wUI2gc3Pw5D4Nrv9U3aYbJ8iSCLwQunpMsH1sS6HW?=
 =?us-ascii?Q?MofJohREhH0RZEhMkWgAjxxkdX7e01kTuj+kVghtyQQSU15nJauwWX+JEyao?=
 =?us-ascii?Q?QN7omMzyf5+kTA4rmT1E+8OWUhasnjZ7YpzI2aaoNk1M0uId7I04hIEwbOMO?=
 =?us-ascii?Q?Okjuyl8Wil+FHULF+Lt70S5/4DOK0eddTTx6wmEHXaTFM65xJONhJS+61ZS/?=
 =?us-ascii?Q?UkWtus4K1Xbjx7tA8pqp8y7wesrRALJ3rnf7d3+AYiENxSMz9lUdvlaxiaIL?=
 =?us-ascii?Q?SxPtWaNJJBZpsAoUGoBIKyHu8tsTbM7BJefR5GatXNkkjTKokopVgkLCyf+I?=
 =?us-ascii?Q?CS5rAvnEKJ6Z3rDsucQUdlTnUrK+Y2+YKtweVS9PHg+miVCjL9uWLrPDcpBJ?=
 =?us-ascii?Q?Pexq78q4D4YfpxZb11HoYcIBS5KqsAB5Eo66UuCgMifAwOLnih5A9UOHPfcj?=
 =?us-ascii?Q?ikPaS+2YDMXkrywqylvyopyGIN9IPGLVw1gdkNG/J26ql5ZlHJgCmvW85oao?=
 =?us-ascii?Q?2oQpiYKMrfZtQA5rxplF5bgWAkautnY0lqj6V8JBtAcTjdiHgBYLp9Yf6/8H?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ILOSPamQLwFWxOjj/8yLNnbdm3qOrPm56wBLSotgSTywy4RQTSF1fAPp1FrcXlhh4TqmHvowIO/ONVFtGgUx3HAVt9up9pME+IQzA8ZtItEsNjyM85fcgUjd0KlLfsqqjiEVVWm4uEaibRrY7+Y0S5mpTCQTSyabJ7Qa99kSTJNNy/Yaoo2xuQf1Qifu9ZqzkPezSmKXpVXmEXStyvJDR4+zMr3uNpZstjUiWGs/4MlqiyF7VhCOTz+5PmHOeIwWKKLzWt5IPUB4RXFLtfDZUSSQv3thoKu0S9sMHvUZTCH2lXZ79N2TxnQEHz39nfRKwKkt4Sy4QaPoMUjJ8V5L74/2XXfxHIS9uyKbFlA0k9v3xN3N1F05aSKHAglmAAHLcG+qmoigId2KzHGWJhpPBPSZE56JaPw0Y4U9mPvFOpRST+A4dyxo/Moc4XhFYFYo70v0s0Ei19L/ENVZDva0i1JZ1cnnL1ZwRwGuRRL7RXehX3U7+E4QsftWPyOpfO1uCn1DbY+Go3NAtuG0za7hbeTMROElSBjBwZG5d18DIZgBnwbMvoAlSCD1t2XGykr/TYJnPRZlundPMPA+hxRjb/3EgZ81RGKuCZI78c+pcng=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced9e386-62b3-420c-c6e3-08dd93b827c7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:55:30.8073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BW0fJ8KU4DXH5cbL6tZ22pxMT1P9XC6CyMHglKbel4/67fJrIIIVxJchpDB6IETshf7v0vMuhNMCsCvE9oDvQhL6cRuYFwCxVYtG9vF8WHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6902
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150137
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDEzNyBTYWx0ZWRfX/TV+BLNz6Nab YNE/Kqe91kG3vF9DJhptGID9Dd113iiZnC95ozHz4W3dKHxf1jfiIznT94PMqCL5iNuYvQBqpUp 0wKZkbdGJADV2p9McSY/dNRCTISvhaAKsndBmysYQnkUsPewNa+coU0TlaF2aM0X8kd1Lf3BIyJ
 kMtrM2a+CwlKepaJro4DlSz3YXotCAGGIUm4d30XCAllQaI+3FQDpAMjC1ZkRWPAQFyp2KI6ZeL blL1wOjSNtMmsr5cagFhNqy9/5DdJTB2DL404rajF115zFPJIe1BMg7gyw9V6j/6/UfggiKs4P5 2N4CiuCp2NVONoLwj5tTeW/pC+39wshR3xfqUVp6/VEIixofy0xdC7Uy+4kEwzL/Urze/h3ZwiF
 6jgBPAybo+TKJ+lly7A2OsH2LRq0C9gr5DxkCc0ggsHFbi5Jyc1bm5JBoYPCqeu2sRZCtoE+
X-Authority-Analysis: v=2.4 cv=EtTSrTcA c=1 sm=1 tr=0 ts=6825f25b cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tuhdFAgoEM9STPHgZ1QA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: pO_swPkuCJbksxFUTmBgL6Ku435eLkyh
X-Proofpoint-GUID: pO_swPkuCJbksxFUTmBgL6Ku435eLkyh

On Thu, May 15, 2025 at 02:33:29PM +0100, Usama Arif wrote:
> This allows to change the THP policy of a process, according to the value
> set in arg2, all of which will be inherited during fork+exec:

This is pretty confusing.

It should be something like 'add a new prctl() option that allows...' etc.

> - PR_THP_POLICY_DEFAULT_HUGE: This will set the MMF2_THP_VMA_DEFAULT_HUGE
>   process flag which changes the default of new VMAs to be VM_HUGEPAGE. The
>   call also modifies all existing VMAs that are not VM_NOHUGEPAGE
>   to be VM_HUGEPAGE.

This is referring to implementation detail that doesn't matter for an overview,
just add a summary here e.g.

PR_THP_POLICY_DEFAULT_HUGE - set VM_HUGEPAGE flag in all VMAs by default,
including after fork/exec, ignoring global policy.

PR_THP_POLICY_DEFAULT_NOHUGE - clear VM_HUGEPAGE flag in all VMAs by default,
including after fork/exec, ignoring global policy.

PR_THP_POLICY_DEFAULT_SYSTEM - Eliminate any policy set above.

>   This allows systems where the global policy is set to "madvise"
>   to effectively have THPs always for the process. In an environment
>   where different types of workloads are stacked on the same machine
>   whose global policy is set to "madvise", this will allow workloads
>   that benefit from always having hugepages to do so, without regressing
>   those that don't.

So does this just ignore and override the global policy? I'm not sure I'm
comfortable with that.

What about if the the policy is 'never'? Does this override that? That seems
completely wrong.

> - PR_THP_POLICY_DEFAULT_NOHUGE: This will set the MMF2_THP_VMA_DEFAULT_NOHUGE
>   process flag which changes the default of new VMAs to be VM_NOHUGEPAGE.
>   The call also modifies all existing VMAs that are not VM_HUGEPAGE
>   to be VM_NOHUGEPAGE.
>   This allows systems where the global policy is set to "always"
>   to effectively have THPs on madvise only for the process. In an
>   environment where different types of workloads are stacked on the
>   same machine whose global policy is set to "always", this will allow
>   workloads that benefit from having hugepages on an madvise basis only
>   to do so, without regressing those that benefit from having hugepages
>   always.

Wait, so 'no huge' means 'madvise'? What? This is confusing.

> - PR_THP_POLICY_DEFAULT_SYSTEM: This will clear the MMF2_THP_VMA_DEFAULT_HUGE
>   and MMF2_THP_VMA_DEFAULT_NOHUGE process flags.
>
> These patches are required in rolling out hugepages in hyperscaler
> configurations for workloads that benefit from them, where workloads are
> stacked anda single THP global policy is likely to be used across the entire
> fleet, and prctl will help override it.

I don't understand this justification whatsoever. What does 'stacked' mean? And
you're not justifying why you'd override the policy?

This series has no actual justificaiton here at all? You really need to provide one.

>
> v1->v2:

Where was the v1? Is it [0]?

This seems like a massive change compared to that series?

You've renamed it and not referenced the old series, please make sure you link
it or somehow let somebody see what this is against, because it makes review
difficult.

[0]: https://lore.kernel.org/linux-mm/20250507141132.2773275-1-usamaarif642@gmail.com/

> - change from modifying the THP decision making for the process, to modifying
>   VMA flags only. This prevents further complicating the logic used to
>   determine THP order (Thanks David!)
> - change from using a prctl per policy change to just using PR_SET_THP_POLICY
>   and arg2 to set the policy. (Zi Yan)
> - Introduce PR_THP_POLICY_DEFAULT_NOHUGE and PR_THP_POLICY_DEFAULT_SYSTEM
> - Add selftests and documentation.
>
> Usama Arif (6):
>   prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the process
>   prctl: introduce PR_THP_POLICY_DEFAULT_NOHUGE for the process
>   prctl: introduce PR_THP_POLICY_SYSTEM for the process
>   selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_NOHUGE
>   selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_HUGE
>   docs: transhuge: document process level THP controls
>
>  Documentation/admin-guide/mm/transhuge.rst    |  40 +++
>  include/linux/huge_mm.h                       |   4 +
>  include/linux/mm_types.h                      |  14 +
>  include/uapi/linux/prctl.h                    |   6 +
>  kernel/fork.c                                 |   1 +
>  kernel/sys.c                                  |  35 +++
>  mm/huge_memory.c                              |  56 ++++
>  mm/vma.c                                      |   2 +
>  tools/include/uapi/linux/prctl.h              |   6 +
>  .../trace/beauty/include/uapi/linux/prctl.h   |   6 +
>  tools/testing/selftests/prctl/Makefile        |   2 +-
>  tools/testing/selftests/prctl/thp_policy.c    | 286 ++++++++++++++++++
>  12 files changed, 457 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/prctl/thp_policy.c
>
> --
> 2.47.1
>
