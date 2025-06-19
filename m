Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E2226CE8
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337588; cv=fail; b=abpVJmXy1Y1mmiWnlvMlHY6+gw5Y0WhXnqpgqaxjNvI3xc/V+2HMbW+6lGS4qgNbNoo7rf4PZTp5iSWrp0vh0I09b+NLrIdpkiqaYLnbFYQPbzLfp1DOJM5GwgHrydqpRmG7sU/W2AL6pSqyUFMZmp1xz9C8WkI9F8HLHgn/5G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337588; c=relaxed/simple;
	bh=9GixjBuuE272v4xJlBPGPlotO1qT6rmWfJydVr7Mgdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VrVGb1KqW36y6YJCn7lnz0U/nU3xgX3xvG2KF1kfpcA274s8RFZKQvUeYPQZ5E0TLicsxDleJEAGHycj01ttEEDTuqbl0cWiyJzQJasv5xz811ZFbLgODaN8i0877zpKsJqzOT4Oos1u0OzkKDYFkxwYwbwv8mUG6wTBDtUQ4ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QWSW6OWe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Tb+cbbLB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QWSW6OWe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Tb+cbbLB"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0faTY024627;
	Thu, 19 Jun 2025 12:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9GixjBuuE272v4xJlB
	PGPlotO1qT6rmWfJydVr7Mgdc=; b=QWSW6OWeyWVs3aFVlyXLZM7e+uv0fZfqcW
	h/71N+xFyJylNHNc4O59payvDzCHFbI548Bkc2fLdKCAWRFjnllICvGnPheHtM6x
	Bb7PIsiMX8bkWRzHnFjjKbf+0Km0/NVkRxpDK4tgUwmcZBN4FW17l0stB0nFhUxV
	QGutmjv9HFUk49J26VUcnHX9bV9vIakJXzVHPcqSYpHPjRd6NP7w8J5VQuBorUJS
	zfg4KhNaB+++jvqqOS3JIBl0JRDC/wHbGQPU5vD4/fPS1eyPhNzW/bXX+qujRm+y
	rOBNBtUV5InJXwoZSHMM1a5Fk3Iz+JVLwYd443MuKc7oDRtrSHgw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xwchu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 12:52:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JB1HPr009836;
	Thu, 19 Jun 2025 12:52:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhjcnj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 12:52:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1QeIHLDlRWR6RfqotCIDWLDOdpyYUt47cMBPXNYnZgp1x/wwD6SJrqJobKMs6siHVWHFZZvk6oSlwhd91o5Gh5AT2NizNlvkqAlvhHe3+dsubw9Qn8iXZA/PO9ZRSa9ANYRZrpGmrqJfAqNs9Pyok+YkdmG0o5JyBqddPx74B8H6hktg9nIvIKFYL4Ra+WjLn2genR+FwPBm9zSAlrKhkjVh3XmvYGQ4xBwhbD/D6ppkDdIwNr+DSj3MnwevekVmA03txlsf68WGkMGl6yTvnmvWK63thjoM2uVpnZHvA/n6oNYjxI6Dd5bnmmaWoGZtrMXH2JzboRqhY6ft+yDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GixjBuuE272v4xJlBPGPlotO1qT6rmWfJydVr7Mgdc=;
 b=UF8zYbWWWmPQNGs6W16xc5xouFnOL9UIrnjJhxIKVegWeFPt01MsamPclxbWWBP6UPOFXD5COBdSfmNXyOi94ZDd1+VXkxAknB2WsD/Y/K3hwkol/faD7RC/uhBThpIT+b8Dw9k277PPEO2QjJqsS4HK9Rr5d/E/CjQ9mWPSMl48OsMsgNJPn3fbUxJDeay3IJ2gJuz8veXmrwcH4/3Qw36/jm9Mdl+M/qXqdUhS3ES5GBpHOqZNme4ZPh2llHd45F12IxJ5CMfagLbV28dJvzox/LH5f/H5V1r9F5yBPoJBUcY8XAe7ZVLAauz3YMXxi9Ea68ehf0B6Mq3W9mKTJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GixjBuuE272v4xJlBPGPlotO1qT6rmWfJydVr7Mgdc=;
 b=Tb+cbbLBu8QjNOVXa+p86e/V8hSB9xradQM9fkWEa+2bgp8V5jJ1dCu7aM4mMp3su7Sz2XRXX3VoHFI8v2GfDKSgZPRcVALRu323QxHCSSfPGPW99VHfam5X4Lchb1f6hUgnJQsxMKMY0bzvls9OJkUh04BkQRBjnM9drRI1EpM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4622.namprd10.prod.outlook.com (2603:10b6:a03:2d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Thu, 19 Jun
 2025 12:52:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 12:52:45 +0000
Date: Thu, 19 Jun 2025 13:52:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() for large folios by PTE batching
Message-ID: <eff48e22-0323-46d1-bb9d-70f2c534f758@lucifer.local>
References: <20250618102607.10551-1-dev.jain@arm.com>
 <f4de7754-e60a-4a87-9319-24b78a0c6895@lucifer.local>
 <970e6480-5ba0-4500-85a6-f7ec6db2f005@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <970e6480-5ba0-4500-85a6-f7ec6db2f005@redhat.com>
X-ClientProxiedBy: LNXP265CA0081.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4622:EE_
X-MS-Office365-Filtering-Correlation-Id: edc1964c-1db3-42e4-cef4-08ddaf302ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tq1XoNex4Xqd37RAgz3gSjpuEUsDw+KNU9DlyXN0qqqJbCNLpt0aYufU9Wy1?=
 =?us-ascii?Q?qRSM8ZsU7SAkbB60MCK2Oqk4n/04q6M5ijJU/zFJOCw/GZwMHK66RTi5tjrK?=
 =?us-ascii?Q?rB+EGFQI0NFL0rsY+fBLhYD3y84wA6HLdkxPTQrDbQfTMJkJv8ffnFx1WRVk?=
 =?us-ascii?Q?IG9E1qeOm4z3TkB6zegCYGkHejSeBoYgQKicNduDB+CyyIh/UnrBiQE/IFbu?=
 =?us-ascii?Q?J1EypWF0FmIgH2yqF2f2theabZWnHhPIhuxYLwr2tCVuzo9qr5JpuYKrzB91?=
 =?us-ascii?Q?7h4lqeJkmOndtZVM2MfXLe2inzXmoLSQ2mGK3mwvBQuH5Rv35V9WxEexLB76?=
 =?us-ascii?Q?XmdsZw96IutzEB1/FA1SFJtQXUNCJDw6c8RNMIVsjPKKfRMeraf7aTyuYOa7?=
 =?us-ascii?Q?+22I+zAXVAdwezDCbCZrxXSqSiEOfmatmO4dKmN2Mm3UONcW0gDyo+jzoCh6?=
 =?us-ascii?Q?TIfaaFlGGZNcIsMe4OrrW2cReYxD7A5/fv3jM4Hn5oTGdGFhPGeeCrghYy/M?=
 =?us-ascii?Q?5DnbVLhlwOalP5vY7Rv9iefmW+/HNGpfrAObFwAJIdDetHlQn4J/MFBzXRHW?=
 =?us-ascii?Q?44iysCdb2Z6gY8VdLRA1FFKa1QBjCMFRQWbm790UGR9P1hYi6dYJYGj8HecU?=
 =?us-ascii?Q?JNRK+0Dhn+Ow+tqtoIefPsCeBHA6v9xMvHktpR797yNeobn/Lu6X1wTPfvyY?=
 =?us-ascii?Q?r+Mu9X8yGLz6t4vJ9s03mK69+sLOEWvX2yU5SlvL3Erhsg34wQRhHN6drxfV?=
 =?us-ascii?Q?Swz/XwnI9uA1lMFEDQLMv0IgNL/oFwznqTK+D3RaZex1jV34IXPQl8BfV6vs?=
 =?us-ascii?Q?TLw4nbFiLiqvZo8hU6V2Ip5ZTkFor1aJsYgC8C1wDUgOYv8398fUZfqyGJJ7?=
 =?us-ascii?Q?nMjvJmdx+OYV3JqV0imdGtVqk87BtRrKyl52FdFFT7tZBABQn3LXLE+8jJSy?=
 =?us-ascii?Q?ZopqeQwsoSlPp13beyBJ22/i/VAnex/Uh1agDClLFomD8AjlfF2dNLQaAhF+?=
 =?us-ascii?Q?jIN/GCdg7ovVKW0yzpEX+S/gS3d2JsrnM4ZzMprtTSx3A1AobDqP289o3BOR?=
 =?us-ascii?Q?Me+KQqGkvgf15uEkt+w+OTgwFvZCys1TpoBfF/SPKAbsJblCRQzFaU3ccto8?=
 =?us-ascii?Q?qeyYnhYapcmRbZ28O+ehvBxjRuJrRPtoInokNVC36Q49/eiZDj412Kn8WdjI?=
 =?us-ascii?Q?x8SlwW0IFSaug0EcBI9rc0+bu3XrxMBW0Y7dWg+EGC3nILb+ZDBYCirfDng7?=
 =?us-ascii?Q?ovBeFPemBm45bvVw6piu4HDstfOcCVO41jxAMY1l0Or22g/yudTSrTBEu2E0?=
 =?us-ascii?Q?vRYEqAFjl1mtp3qRdujzE3ysW1kXrDCZUQDhlzQq7ZW+9rfw/7RXAcHiaGz9?=
 =?us-ascii?Q?SHrpHvy5gzZadMgYZY/D9MaoLT938KnT/vSr9/3RSJ3p0KrBSb7Ckkqewszx?=
 =?us-ascii?Q?3ZBsBMQfzZI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yIV4YWlQ4BGGSYwa7mZNexssoFyCcfH/4JYgWKItdVpEsmf6G4NKc0Tip5ys?=
 =?us-ascii?Q?olYhQUz5lqZEv6oozZ/FkdTv2joA9BTBglFgQ68GLpzFgM1ybEdT9aqyYMis?=
 =?us-ascii?Q?G2LQuaz6gMMuK8m3PZs/s+mHEKAg//NkcF45qOuahJo6gWQVwFCyuMxKmeqo?=
 =?us-ascii?Q?au1mBqWCLBOOUGOwCNiJtWzelQ5cw8Sn5zUZWverxIQ6dNDtODlNwsIpSzYJ?=
 =?us-ascii?Q?wJCEHkFhJseaxERigML2MCZMiRO+9v4TF1pN8D7M661gwl45K1mbnLWty4Bb?=
 =?us-ascii?Q?ZnQ88Jcat5SPlJ7JbrtZ+D9ruXK7BgrLvvM7m5t7LsVwcReDPInaDnG33y6I?=
 =?us-ascii?Q?hs9GuWXgFCfiZo11ripBCvmsXlMOywSvsiLDkmgF3MAN1ZnbLTgPR6ocq9rC?=
 =?us-ascii?Q?gNpMgvftys9uook0sy3cg2/o1j75/VyawG5xSxnJHaySfg+bVcJqkBX31ojs?=
 =?us-ascii?Q?40BEQ2HmFM2nH0mO5PBuvlxvzkys1Sn3av+d+E2c48S9/v45ayAAc8dOEuJY?=
 =?us-ascii?Q?8R0oc9yVv2/faIf3sJADkplTrYMl8U4koqW3waiNX120CeDYBCkfn0T7yfdG?=
 =?us-ascii?Q?g+9pDS+MTEY0e7XiIeQdbRYmQRmah7S2SALAGr3L4+XjRIo3UcKPyigfdYUC?=
 =?us-ascii?Q?oJsOmk/0rmhIM2wN2qBra+E0b9HRTtJgiarOom20U3Fhct2S7ej76+sCtsCZ?=
 =?us-ascii?Q?l13IfBh0oSDzk5Q3XyNHK+x/zGOVvOskgptN5ZvjiDdlIHjohf4ftJ4Guo5w?=
 =?us-ascii?Q?MA3j+S8jgPEtBg124GtYpA0haLJUp1Pu8+3gkyGoh4DzIOCO/49RQc5j4lX/?=
 =?us-ascii?Q?z55fgeSwRmzzC0Slq8lMES2tIH55PEl1YXE0qegQArfGjywunxg7DHyiNpNB?=
 =?us-ascii?Q?gaKd5hp+PuMlTi8+waiBGWZN54VRO26ZTxPbZeRbUtUI+2VVVR5LjrRb5sDb?=
 =?us-ascii?Q?uOgsSLeUzMydq9tqKE/a/gjGFPnEX8RzjHZ7pal4YrHbYsPE0XzHlBlyF4PY?=
 =?us-ascii?Q?VCqt3r0MF1My6+814aifFEUK84L+g/lA1Rey3S31j7lKG9ilFtUF+qLr0BXC?=
 =?us-ascii?Q?IzwTvo0bT4BV9zkoTsatwvIKKDUvuyfpsGqGWqCSzutIBfQaGADKEpDrR8PA?=
 =?us-ascii?Q?Ht5I3WQppu57tEWIf7xC4fGQN+CAGK8mKxH0tmLN5C+9xBUvgYaLORuB4cOS?=
 =?us-ascii?Q?a/X8E14NEAPPtHGsznlDt1q6kstfLiVml5ARHU3DE8OqI3cmHwt5Gybujt/l?=
 =?us-ascii?Q?2jKL27uoQnRQh+w4q4h+lxPsf/SJaND5qCZvjx6RO8TvaQSYydnV+gGKvhEO?=
 =?us-ascii?Q?WLGyn8zP9vnwC/2003rPbSGOLVSDec/SN6wZw8Gzq0rlgcKGmITD4oPIiX+b?=
 =?us-ascii?Q?sxUfN04wqCtOFimYVU8VUwboiHulegr+hs99tv3XbveOWwgPlHhoPZds4QAa?=
 =?us-ascii?Q?F19SCCBZLw8t0OHSKDSlvMFlJSytbMQFDgZDR0EjsngsH2/D59IKkojABl+q?=
 =?us-ascii?Q?F/C37xvxTA39FhxIKrF8msny6VGCk/I4xA355C7SrY4wbLZYITkPbP0lbUAY?=
 =?us-ascii?Q?9QCKpjest5SBSHYwaCVUYns9G9TqctYgbpTDjl31yfBmJwLsIg0u+Xnui7l9?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DKwWZVMrKKogTPbi/L/gtcT5hrk94P1QCsJHSnDmtrRcN5ONg4V68CTo8S0uyfMIlFEPwH6h4p5kzAOlIVF3LSdJBSlR5lIbbYlJmWnkP6tjnyxORBNgZ9g/gUJE34vJ+sLB14Wj1Ksw35ilxyh0H2ErCjNkBVjGuxJxV5jf6Dj9SO+R1+gWMgv5Csw2MkTVJe+NeRvHEgXnfw65i+zDrIF2hcLKRUbigQGluDzEDI+5bWTn63YJzDK3T84wYeEma0yQ5U8dh4GldFGn7lEALsnK1bbr1UfBviQC3Q6fl0zClwTcp0nN1BFPQvgdgCIp3nN4Nl6PqsSi8WJySWyj0bqEcYIcOyokreJNHbDJsTsI0RMl+65S6m/bf1VuGy8kdwNdmmzrTq7N8pjSvN1d9QLjcmYdXpeYLztS9SsEMnn1irdnkSBjXgz9++94yP1/eVB5z+csIr9T0LjrL+2Rl/PttC9DD+Ew5IPZpvqcei7gajMnAUC5TwXUGtFzTRnV8bQY6J7T4WdIOIbDx7qb9K/kGz3JJum8sKZIl7SYKYjnWFE1dW+XYOOJ7ClAhUyoPcVDpvkR/af5fpDMjynPR+30k14vdcuw8dp1xWafExs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc1964c-1db3-42e4-cef4-08ddaf302ff9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 12:52:45.6254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8J/pfx32ALeE1QAV+yxwDw6zhlUXVL92X8VaVqj0iHaOQ/iUUYM2XZCZmi0l693RTsVvPYG1BXiMSNOnd94Og9dPAP2BjNTycKomvOtczU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4622
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=663 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEwNyBTYWx0ZWRfX+8RTshoOQlAp fuEGuespy3WQqzDGFZ81z3O6m+5PLZS9OCYRk5fS0Xy/skrSNUKMB7mlDwMlc8bgvHltEuqBOze ghIji+3JNdJyFzdi2/PQprP6JRkfK23fPDxZJdoNxiMAURBEfJsYmVeD/2Qv9kpVN5DD6hOs1Ij
 4L11g8AGW6aCPfpD5CpkmT/cu8V940lOWCnb/C5g6cJMPSmyaw2LlwTYcpmdOhf+uQd9aroms/E vAOU46fnepDD1XnHVLZIkwVG3Pz0ghPuY6UoKoweSB+1lcjIAEBnqH+XJ1jiBbG89y1V2FFZefR SVGpcsfgeMucpMgReO7CtWZvTr4/g312fOSDs8r4bpz7mvv4lmNHPoNa4WWgzML+ztdXBJasBGZ
 pat57qr7rX5UPfYn8742DXNzSp1zZKEPlCAd4N8JFVxbSoeCLkhfNAB6SfnYqa/6bI9d5FZb
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=68540821 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=HLjKRdHk46vmvVkc6LQA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: bMqCxQPr-cRqITqZWirsyEMTt6bHNOR8
X-Proofpoint-ORIG-GUID: bMqCxQPr-cRqITqZWirsyEMTt6bHNOR8

On Wed, Jun 18, 2025 at 07:29:42PM +0200, David Hildenbrand wrote:
> On 18.06.25 19:26, Lorenzo Stoakes wrote:
> > Where does a large folio get unlocked?
>
> Through the "compound_pagelist" below. ... this code is so ugly.
>
> "large_folio_list" ...
>

Yeah I did wonder if that was what it was... yuck indeed!
