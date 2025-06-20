Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B328E7FBA1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429015; cv=fail; b=A3EooUgaf3CqyWwFw35SUwGrZVo2m755RW+xRWL96PjYv8lxPOQu7W5nnZBAWsxMH8JupKfnf8RWACrdDO4MsvKUrB5/pxcP3hhlIYDecORwCRYEDfYgGYC0IyOb0gBuOaE660tt/Gjmb1f8hKiqjQ7Fx8s4kwIQnSUC6yA7sFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429015; c=relaxed/simple;
	bh=s47C0oGV5+G9KuvZxJYSM65VBWJ5RlLM/IYPXpFXVGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kIa1oJ1TphOkYIf7uOlnu79/gkVa4kQTK2J8dKtdM9IaB6kUgcR6dlT2jOCzdUG9XI30qXCf8ECEX0TNTfTcbzPIvRNbLtBOeoNnKGXQx0VMKC6+jukrl2J1UyoNzzG1C/GTyq/DBq79RqCGnTmzCcjIN/gFwP3aerkdyTg+iI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S+vmfzf+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gqZ4n66E; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S+vmfzf+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gqZ4n66E"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBjHO019409;
	Fri, 20 Jun 2025 14:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=s47C0oGV5+G9KuvZxJ
	YSM65VBWJ5RlLM/IYPXpFXVGg=; b=S+vmfzf+AC9dfOLpbx3Z1BzHTJtbED70XY
	WNtKudM1taAdU7UT+k24uUfKnfRzizYCrYpHtkk5e7DsOb17W7xLvqQpQYIxZAby
	LpQFXp6CjYzDDif3rv9cOx7uXCPK8mFG5gf7No2I3Ny8Yj1NtCQoKjt7soe/Dk04
	Fy5SJdkQqnPBqIFcczcRNcSkpgHq7onske9W7s/HavuoLtWdZcxJhUzXO5+o/jra
	7+0OVyaUWcyXflqbrVyJ73UwHJj2MvF4I8LrUT27hscsJl3r4sjpKzdJZG9CC4yx
	BCNfbBlzAxvlE1vUJmiFe13kUCN6JMhAuixis4nbkwvMF12V9tCw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvnb51g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 14:16:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KCuwF2038363;
	Fri, 20 Jun 2025 14:16:29 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhcyhfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 14:16:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bB2wkFN4fj5loyY7DL87akG98FCu8WImaSRRJphfksupZvcQXYLJe6U1HFbdNzLBiCQXvqXqDPT3w14vqvVLJvIUszohZObrNKbk2yRccKWo0rCcOveXnuEVjHjiRtBsI5xDLHgPkovH7HNAdQwyn388W1mM/43X6tsGpGODkwGTODjjF+J0tuXm8fRFwt0K5P0ayem0x8bEgulocVlmmOtOKtrF49eMqkDVxRz9FyIHf0tNjQraiL8e45ak8iqNUfQ0utSdHNeMCU3IPFbeNYpzfo0SJZbd8bn6mI51oE1OJ93fUpbxsrqhdsvS7DT+84mZ75geDdb3YgPZP3hD3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s47C0oGV5+G9KuvZxJYSM65VBWJ5RlLM/IYPXpFXVGg=;
 b=v4hiMHYsTrhx//9KlzwOnA/ERrKVmJWKJBztjp2Gve7oNrLajjyNWRZZgVXDy6uCEIRF9OKb6CCjSquiAAn2rGUk/kXg2fEqC9IMw8yzHE+0NM/cQbz6PPIdNPXT5BhNqj+elC+smSRhRxdUerIWHABJVvEzie4OrDpTePnwBQmbRScT0dbnnEegXOONv9Q2AjEAzYzcNFW7C//jRY/aIkmjM9f12EIwYKHoHImZ0zHMpPSEtaZnfGPt0LI7TlycIES24Ci0ofTwkJxAMana9mj/iFE7tLAllSeFUZa83FIFs1/4mf/k1BuMO2NE1/xdgedTPb+4Syi+PpsRACXm6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s47C0oGV5+G9KuvZxJYSM65VBWJ5RlLM/IYPXpFXVGg=;
 b=gqZ4n66EXPKJR+LVg66L9IGyue+Rx86zYq7e6TFxYUf0FSvfEXGhLUoBZ3d3ze2o6ooWPi5MSYLAFitibvl3X5wrK8F2kK9SzYxt0XIo+SMTEU44NWorhnd1LuHrdhpUABsR4GBT4CCbG7Gjbi7O1nrtQlTjmMVebC9sJJrtGfE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5694.namprd10.prod.outlook.com (2603:10b6:a03:3ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 14:16:26 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 14:16:26 +0000
Date: Fri, 20 Jun 2025 15:16:24 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Jann Horn <jannh@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
        SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 3/5] mm/madvise: thread VMA range state through
 madvise_behavior
Message-ID: <880bc20e-589c-4813-90f8-42ab0413d8c8@lucifer.local>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <a520417243ce7f8122de05a0420f964a922e392a.1750363557.git.lorenzo.stoakes@oracle.com>
 <7b08cd65-6797-4678-9c24-a3ffad7acb53@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b08cd65-6797-4678-9c24-a3ffad7acb53@suse.cz>
X-ClientProxiedBy: LO4P123CA0595.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5694:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9f311e-5561-4e92-1b7e-08ddb0050b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5sB7SB/bg7q8rXExhg2/qQ8VXXj6dYKOEnttX4Ym6LhzxSq9uSndn0CHvMbl?=
 =?us-ascii?Q?a6PCCXcKJ2uj2IQD/U5UZVUSbmSXhl/MvI39H9IJtjVAZYKjg7+DJVeFgB2L?=
 =?us-ascii?Q?uEeUJHkQWjpQhK7pGH+GnTdEwrSrH8fxvsExuO5fNE9FKewZ3ggltA/cXXjC?=
 =?us-ascii?Q?KFJSrkoCjVyA4lC8qbRwmqXCT67d3B/l5jtD2WEEPCtAhU8lgytv45ebJ/BJ?=
 =?us-ascii?Q?SPF+2pBqWVbc+M3OwNjRIZYAq4adKzmxGR3AtXVgbdxRespC8/Yq4+RstfcB?=
 =?us-ascii?Q?lR0rZrw0jZbWbEiBCH+wC2Z15RluRy7JtU1tZ8KlpMB+aSCSK3zYGOL/G0Zt?=
 =?us-ascii?Q?3k4QDhXUB0rqEZ9GdzEe7Q8FQypWOb7edcpG0m52g5p6gkiSFzmQT1q5FPsM?=
 =?us-ascii?Q?lXhHpVqiBvx70cbet8uqFuK5lhjppx4ivZCieDPlYpTl9WxYk46wIvvEBxq3?=
 =?us-ascii?Q?cwNyGFezyofW4jXRucdlFJsugpLWpc5AWYSI3/W8w2ophKuJr2jGTSAa8zw2?=
 =?us-ascii?Q?Fxo8Ngs8JFYUXamvt68LlIRTsbz4Yx4LVWl5bWJ78q5CJwzD2MYJpa+fgrr/?=
 =?us-ascii?Q?J9Cwcvi48Rl8PrZtPKjI+svfYbaLFqllaNq6vdrhJwXgc5+MoDNHtJyo5l9F?=
 =?us-ascii?Q?SVIIV2jLrYjV+/wz4cVxboT8N2bId/tPl8I1qo48K7QdE77GQ9GZdj/CGK6S?=
 =?us-ascii?Q?T/a3opAN4E0G1Lu+FxwS95/JyXElVVGIeKMyW6u+1W4VTihuUpwYsBaZbMqj?=
 =?us-ascii?Q?WvsTfB80plOFH944amkP79WrzXtbTaYrJg1DsM4pZ88B71anLJtY7HdKmFO1?=
 =?us-ascii?Q?O5oJOOEJP3oQrYNXyK9XcEhuflV8dUdpCNo+03f2VPNR4ySPp4WX23Q7aHo2?=
 =?us-ascii?Q?Chg4WYL79/sRsFtvhaNJjrfTki1usTALj2j/5OH+x8pHfFwZhPfamyzNNQZy?=
 =?us-ascii?Q?l7/drQ5/mMqcxEwRAaMfsWnBYDl+TLpuK82A4qkx40erAlr2DBfI0J5i/ks5?=
 =?us-ascii?Q?xxGbqxTptPZ7v8bPBMdsUJB52gTNtWUlcNtMVTrVpFe3SaSNWxy/XLLeXlI5?=
 =?us-ascii?Q?oNcTFewc8lFoteDqIQy3tzPYf6asWlyrlpTw3WLVJ90gn0RfZ3W65j0iuZEB?=
 =?us-ascii?Q?yM6B4Y3l632oy3UycDcVduYMHwXAPHYt8e17UB2TO/aN3VpFjMgpn5jr/ncr?=
 =?us-ascii?Q?gthvZv1HEgc4N9ld5LPq9ks9UWM+vX90wy4GkPdI4n9jxOVd1mvCMaXhbC1N?=
 =?us-ascii?Q?O9ZEhopwu58HsHKlNNB6+NfeF90M2hSRBYTLzDANn9OSTJX/vGXGz6yVW3o0?=
 =?us-ascii?Q?Lm6rkGO3QtNHdJ2kEChXTUDNZQ1lWocHXusTIhmkz+sEtuc7n2lYejEv3Yn6?=
 =?us-ascii?Q?PEBb4usRwV5W0lL+c62LHWl9DtNDL+XcSZFE8F2SaR0M/gPCDroqWZw+5y0f?=
 =?us-ascii?Q?ZsDu4oET3JE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1AzmqUsQuAEcc3bqidyxP1klgng8yYoR0q87cuPJ6AWXBbGr6mXs+CbiLDI7?=
 =?us-ascii?Q?SwvO4V5QC4OdPmWrFghjJ4Kfk2JP/HoZv8L/U6p0tMAxTNOyMJ0eUiA73GQ5?=
 =?us-ascii?Q?YENMFI3AEnTUTA5+Myb7bOD/3Txc//42jMVpsriJtceaqVQHhM5PHggIwlGg?=
 =?us-ascii?Q?HkG+Ku/h5PjaNBwR18F3Yt7We2mQcv24pWwlZdhUbPXKhJQxZU51bibOV/O8?=
 =?us-ascii?Q?l1HTLUyt7/EAZnVEr3+FFxc3shHqV5jawg2X5slIx29nNMQJPJl4FyRDKpWU?=
 =?us-ascii?Q?ZEn9tc7IFnSe9VSIQatuq7GIC8duRtTvTCWzr5h1WteMWeR/R6wm597LFVSB?=
 =?us-ascii?Q?XaVoyUQbQBJqylVL2Bn7RZDg5aHrF6PfCsQmXp7MyTl6njBXiQVj8LI6yubY?=
 =?us-ascii?Q?LPhQ4KF2wGBWEioTZWshc4WwYKCcgvOJMBVntKf4bgHi5YjR5Cq//OxOhL6N?=
 =?us-ascii?Q?FXuQjrHd+dImxroNrcuSwkyc4RCnXq8DKSZAstOG7cTNH8zqpx8upfmkeBWu?=
 =?us-ascii?Q?KF+zGD+YaMx7dW1oywZuuxj3+7u9netWeuPv/8F+zXjfKtIqi/nBHrb/T5/4?=
 =?us-ascii?Q?I/Ck+13e45judUH5Psn7fsQsZJc157UFoki9uBUhuvz/Z7do1Vp5bzVew0St?=
 =?us-ascii?Q?2qxfy9QCT+/pxyZ9Cu1XNLucDh+uVKHtSI6ctKSNsgeb4eLWogXgzENVdON+?=
 =?us-ascii?Q?qAikyOgLSqL0CDh+4bmpB0AUY7qa1avnDH8282hRnPFKFgXhx7OmZfGopaE3?=
 =?us-ascii?Q?J4++k3/r6eIQArkoCRntYxBP+hPChi8DJzpUrPSDwv6bvEbW5hAgNlwCvPLz?=
 =?us-ascii?Q?Yyibo0JVPHpau99Q2jpHof884JrwWKTilKbnH/X9xAP70YqmkiHI8Un/KUUJ?=
 =?us-ascii?Q?5G3mzvfJ/yM/2aXZg4RUr8EkSaghbJ//KdU3ZomoVjcTgbMbP1V8og/dBenu?=
 =?us-ascii?Q?Sxj/zWd5ublH2B/57q9wMlVq4r8C5sbxV/bZPO8tasxk1RrWYVirdkaSpPx4?=
 =?us-ascii?Q?dLVKkS6+3tqqp/T2C8crW7w5ui0KP7ngS5lZ81PqogY51GjlFi64EA3l0VpD?=
 =?us-ascii?Q?IHByUbXXzY7T2VXp+42nKyVk/d9o5KEy4sguPFM7TSLGkdS+/yveRiaDEZiU?=
 =?us-ascii?Q?e0hTE40sMgU9IIkPbKueKZ2296XEPBA0/17N+vlapHFFlr5etHpBESwZuqHE?=
 =?us-ascii?Q?Io4HlUulkQGTQ/t84HSWj7dTOY6Tmu0WomwEMwfzHofYRs88iHn2rIBA2XZY?=
 =?us-ascii?Q?d/AmRX5fVRj7s9aRsT0l+xAyBjucKOSvNTWsLXhUW1alUZW9sJLl9eOVYNKe?=
 =?us-ascii?Q?3zf29JvJMknVjXLsyIzU2f2md/dNlofRtSMxPkX8x7J50/i9+BE0C9IPJlsf?=
 =?us-ascii?Q?CE42pq9PHgpwhzAxT/opCHlywlKj6i3PJQAmIHDaQ8ZSSKJZGcytU1GRViGu?=
 =?us-ascii?Q?ojsRCgXXSn8mtjx6Fn3Tac0coHR+e6Lt2DIaROmPfk0t5EyN2jtM2kJ1IKDh?=
 =?us-ascii?Q?H8phBaeD9BzkKDAyweuoQhK3khKk8EdP8JPQwtZRUazbwt7EvLwzfc4Fk1oM?=
 =?us-ascii?Q?15F4hMrgemoDasLVervdNGw7HNx4TZRxhqn3Fz0jPvzmP8g1wppXRJd1wXxw?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LO4jKe9zSp1dCrw02kC+wmZOAQJN6tcrmLtU82zpkuiEPf+slPzXKQjgFr+zxrcvDxusQszuU64AJj1WlwaXlOmf1U4xVgKDm5At/bRilB3NJvDROO/mGgmhEoHSd01yu2yQi+cR8MFtooYNJ5TUKq3Ls53dadEinyqtMeoa3HLfbf97RA424wlOf43SQbOoa0iiMhXIwcC1q+Zvvbzq7b969Yalm+CDViA51hD2HepWc37HDPqTEGrd4mYbGk+qWAzP58Yy/6FbFeHthsYCEFuNP7dahme3VMjkTRQAytdW75j/a2d1XFLFrRk3dzrztwL22l8BEQCmx7qd/xjiR5A/oyb2H2XaD+3eTJTssVQve0Km+pydH7U/lKAMKLZ3K4JPn5+0yDiUpsZZ2d+m3vubb8u7yv5jg2O6vptyQlPhWfAwyQSBSAuhxwGtK6k2YPgtFezlzTqqtziMYNovuy8ofl9g6EpGpu38t77u0lCcY1Uwckr6qEkXsxtsJuJj+Bzm8pJbDkGxCTzuQokWHEUREgEgA5Tpm2Npur5OTkrYjrjTRa8AbgXKeJjr+My+iHzEgjdy9MxO06s0Qw9gI1o8Z1Jz/Z7yh2YAtoNRdBI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9f311e-5561-4e92-1b7e-08ddb0050b23
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 14:16:26.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yi7vEttL8OyrT9t9zDdzfCJ+b4yvabmYAdYArdDnUgX+UukKk4lQpgNXUKLB5zk2kT3aSBz0GYZpgpkcuAhA0jfGjaJkK0OZrN9A3xCEXNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5694
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200101
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=68556d3e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=WbADF59Ui9FdkrFuloIA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: OFczSQGrVLQuOxxnjl2k4hkgPr_Hxcam
X-Proofpoint-GUID: OFczSQGrVLQuOxxnjl2k4hkgPr_Hxcam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwMSBTYWx0ZWRfX8wrtoQ7exlX/ ewGa0YmO9GKF4liJBHd6zLDlNjilWJWWEjZvHds1mll6XrEk/E1AMPI/d/FsTs1agtYanRapz1M /yW0V2UPqo8d1S7BCC5N9MetHYg8h8ujtO4bcMr8DQX1C5ZV2bmnfcPZCeWa9iI4vm8bxahaqCd
 ku1Pzlh3rK2oE1yzHEYEquRJGpZpUN5cXm08bLnOM2+lYxoISAMNBmmHTUTTJUwrV/tUw6njS2k D+ObtvkpXDXINdtEvesWC6FtwUqH4rtfCwTvfj0pL0FBZp3gf4wqMdcZ6C2jsKa6LpyFSAVzXie E2qNkTyxeZKECq4iPQtN1aRgKAHbQqpPLAHUI7PyIAQWuot3VYmGIZqdpPhE/EXiKatDM4/bPQv
 0E916uwYoLCS6Q30MxBBXZuBpTq4G/aEYba2ccLw39UOSEo97YqQvpg8GCcrY3Wd3lVSRUTP

On Fri, Jun 20, 2025 at 03:49:31PM +0200, Vlastimil Babka wrote:
> On 6/19/25 22:26, Lorenzo Stoakes wrote:
> > Rather than updating start and a confusing local parameter 'tmp' in
> > madvise_walk_vmas(), instead store the current range being operated upon in
> > the struct madvise_behavior helper object in a range pair and use this
> > consistently in all operations.
>
> Yeah much better but it still took me a bit to understand that "end" is now
> the original range->end that doesn't change during the iterations. Maybe
> make it const and comment?

Sorry missed this, will adjust on respin.
