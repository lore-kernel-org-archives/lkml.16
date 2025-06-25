Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA42261573
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858146; cv=fail; b=GPcmorB/XRBzgpPZQ23/Ubh4X7nfmpZ9Y6TWFj7WtPCJK4Tw73TkPaZHt4oTqTMpe/mqrcqRmnllFc7cDWtJ9mqjOlO8QSYHP3onmPwXWc3MPVTx8hHuJ+vyhntKydYYPWu5aF6LWmlRjTFVME7NBSP+LUFF6glsHQUXPghFI5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858146; c=relaxed/simple;
	bh=2y4muOfDaPb6KQbMo7ejVK6FOpP0g03ecBUxQzxU4V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uaZHC5B2BOqoI+72t/ReNyhduS0SOt6F85AnCjsUC2QIXwMumioX6C+EU0/vZquDQhlb6SMCkFYOZLYBAyBYyO8FuBhKD4AlKp7lY9kJal0pAC09dmLysN9sQOZW4pd9NsuN2JfWtTZCMnyjU69VEChyH0605QawX5OJPP3rpXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CWPQPWmj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gyyFb12T; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CWPQPWmj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gyyFb12T"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAq35a031435;
	Wed, 25 Jun 2025 13:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Hsh+fJfSQzoElhUwnI
	uCaTZ2b6dRELZo3O1kEPivTY8=; b=CWPQPWmj/zfVx9Szrw4vAXnimfMun244r6
	+qS/Iu58HaJqhB6ixaBgckyYocvAACGwp2LNZETYWfT9QP5zsgYOmwMkNEuaMCWS
	rRiRDF+JSVsdAsvUiLCCjAjFN8mXwsKvQci+bF90epuRHwZh38qzQGXrroq1Sdv9
	FfCqCZO+opXWOAfMzAJrWWJ1tM0+bCzPye+iUTvd33yPGwIKaGuG8SQKJw1L//yr
	fBfCJ8/UDAMMTsJQvuy3OXNf1aPg9hz1utbFZ8qnJr4mnw6vV8/HwuGIDpCJ8f9L
	KE0NU7mSESqIgbecoOhk52GjT4Q/dT13osG6Cx0lVP9xhQBheNuA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumpfc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 13:28:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCt9Dh034596;
	Wed, 25 Jun 2025 13:28:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehprjus9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 13:28:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhJpI6VBDmwayDpRJxisvnObz+iBn2X/JSX7ux+p4AkUoHABfJjoIGXSieI9EhVO868yxLo14Xo+7Sb15KMwK6Ha/8JJVQaiYI/7a0ohLPgPpjAw3Fna8uQ9R7l+MurwWNzq3lhHD9ewcexUiYReWY9jFUHpNJC7jvyWzwFrJP6V9XN9MYnFxADB2AhlEc5YlwxD4HXv2wiR3FC9ZCvBIbfeaJ5S2qG2S4ZFrhct9xH3lkC39FVT9wfKM4VghN/x2K8Ajp8XQaabOWHBJYmdx+APk3Abv6POsG5MAr1mwKZ+IepBxqMpc/rDnFRv2qNMYm0BzNRFYsAoQVdbfHJ2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hsh+fJfSQzoElhUwnIuCaTZ2b6dRELZo3O1kEPivTY8=;
 b=boHIItYwE1jxcimxcuM9SI7NcwLuyRu/zMeyVgolB8FfN5iGoeX2xcpVML+P+46xDrPZsrgLOvoSJjFlrT3oaiwTpAfHfI2amCLSyYobs6X95r89S6yoUUrssL38VXYIdnUrnU+bsLQJVPhqIjKrkkUhYcrh81yOHYjxaxiq8VGcL6c8wZoqj6KamF5TE5bn8RlhJHZdtmHMXUG+6NrGlm9HvWV91GqREXC18cCHuAyRazGgZAyQ1D+Sd3XPo5Drw/g1OamNqBzY6WwwPVCNMVetOtUYuImolRzwmMrZXvccwPz1Ngo+oTVn0JKvdpyEE7wjqGcxEbeOxvgVECP1FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hsh+fJfSQzoElhUwnIuCaTZ2b6dRELZo3O1kEPivTY8=;
 b=gyyFb12T20dSTVWAn2ULzSeGH9akP/gV41qigq1YzDT+8Ex4rZUrG3texDQVQ3Tq3+4vV75gY/3N3DP5gyUOWFtDrHkxF3j9Px7+CYJFCsRx3QWI3hYqqYOIqIiOC06m+Yo0r59k3ezqWTG2aqUgsmH+7vMr792+7L63l+z88bI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB7635.namprd10.prod.outlook.com (2603:10b6:806:379::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 13:28:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 13:28:35 +0000
Date: Wed, 25 Jun 2025 14:28:31 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] khugepaged: Reduce race probability between
 migration and khugepaged
Message-ID: <e94c3460-144d-4243-98a3-fbced10feefe@lucifer.local>
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-4-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625055806.82645-4-dev.jain@arm.com>
X-ClientProxiedBy: LO4P123CA0533.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: c911d30f-da18-42f0-5efc-08ddb3ec2fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AX4rvRAVklLp7VLhWC8+foe7NJuE+CvJDQYfQxhOGl8nv1WRjA32Jx/27lak?=
 =?us-ascii?Q?efoYsFrpS5IntaDV0HIgFlmtFhTgmGFh2MV2whBv65GRc+LLwHphQeThW/S0?=
 =?us-ascii?Q?RcixlEKwVNYUfeNTLyYgmbxicaA1qzye/YSMQ5VsU14cm3uBzLr+mF/D4igJ?=
 =?us-ascii?Q?ZlSruv68fO4wNprBP7yRdpxkkD1xDn+ACzy6IT8VhKALIg8zhP4K6+WMnkeH?=
 =?us-ascii?Q?1Mrbh7hYWypsJqg9cOIvCnZEE+uIWWUV59Zas43AuqSIHFtDHSDsvd8oQfYL?=
 =?us-ascii?Q?P+Nq5MTkqoTEjj+MJc+ghUOGiJUw9g57IClGm62/99FoUl2PhWe9NiP/sjAm?=
 =?us-ascii?Q?VtGkdwdcPjIvYXZFvh3mJuTik3LojfR4zyHwtpjduSxJTmaf6t7u5fvp5Ke+?=
 =?us-ascii?Q?wqByCHpKBZh+JdEJZlD36b0XPXn9PO0ChZidYWjLFZ6E8vBBrnrBe9I0NhF7?=
 =?us-ascii?Q?qiXtGFnEa+Q7OrJGnpIsMjyOEr0cdU03NMKIRsyKw16H2nPSaDrdhw76Vdq6?=
 =?us-ascii?Q?bDz56qNco/G1a+BtGe+qQLM4odBnXnngztEO9IZWwXmAU6usu0EHFUY9kyUo?=
 =?us-ascii?Q?8zOkln8QXb1pdDySdzplBTfDJIQkG1L/C6NHp9Tcg1PnfJmuX8za3Xi9AN+b?=
 =?us-ascii?Q?uqm460UNDE1jI5gj5wpb12ncXFRAmDmry6MC6TmuMG+WGK02hyBcuUETNwS5?=
 =?us-ascii?Q?xY1vsAeIpgSh0JcGRBYSVmpdp6DXA5H8xVEpxPVhHNWMLL7Dupsmv4SB92M0?=
 =?us-ascii?Q?DKsjDDP+gZKSFThybOBZw/yWvCv1GFIwikjRmpGWU3GvejhZASOuZrpLczh5?=
 =?us-ascii?Q?EOVVjwqXC90wpmZBcGM+xHnQDkDZkSxAgTDSnzMVNOwa87GVdry/nDWrCMiZ?=
 =?us-ascii?Q?JiQpcPO2EAZuKHnB5agq6zuBUSeTUW6ypBl8Qh59Nv2UNm4XnjD9XHFQQ2cC?=
 =?us-ascii?Q?LVh9FrBvUa3XkN0nN1dzbYtcF5oCUiuE5bm2xq6tWM3RCHkqCBhrb8/BCery?=
 =?us-ascii?Q?3nyYR7A95yEwtNZZrSAFy1Ys/doAQvuH14rxACe43OxFdQkJ45rpfVjcgmGz?=
 =?us-ascii?Q?8HNuC4b1LhYmEoaz3OyWUsEgfIXmrtI9U+IEwAx1EVJmG0Yhr1tHcNeWGGDC?=
 =?us-ascii?Q?rKc7vsbucbYpUAsl3EoUIC/mCFi5aHpYShPxXf8vIfRXFcT4UXcd7biL5v2y?=
 =?us-ascii?Q?Qb9ete6fgdsK3YnriNwwxqHZ+XHVoJxW7d9YWQC1eJTevGJSiYMF62mGtz6r?=
 =?us-ascii?Q?Ym5r44TT5oQCs2anrEuKeRmgDesT9OY7KM+yMI9FUtf/XoEqW15TIVgSFEMW?=
 =?us-ascii?Q?k8ir1mZA8fcCejI0YYSh55ZrwclvLAfmfq8siWDK00SHQ9+QU3F0WWjI0Xem?=
 =?us-ascii?Q?mKQ9crzIuei9EWDLRDN2jycYMrQQsy90E92mAUcUcW5yd7x/6Xz6/vMdGqy6?=
 =?us-ascii?Q?FX7Qz8Qog8M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UbId8VGVWrA7Ro+1NZZXKAxLptOFxdFuM0YHipWav7E1XOtRqcHt88t7Ljw4?=
 =?us-ascii?Q?rMhTgGjKs/tABSauxKa21gDvY/AHOvE+Q1WaE6qYf3Qa5Sa2ZmUMAE9dkQWx?=
 =?us-ascii?Q?7dVVUDQmqx7bUNDVgcB+ZTybxfiM1zCBs9o9BckfiQMV6Q/mvvY1c/PyS6a7?=
 =?us-ascii?Q?+AyE7vl1tjrktgd5+tVJ2S9S+oWMokc2uq59t6kLvm9tUMlTfON6H/auwYVV?=
 =?us-ascii?Q?7HmeyeR9kOLFuytBr/9XZ9iBLVV0otb8zNSYgdhbTH5Rotjhn/ogoyYzOqL/?=
 =?us-ascii?Q?7YN5tvFMFcxuGM7sMw4Vq1/QHPZDGM9S6l1olIKVU5TjOWE9Bj/vgMxVcCXq?=
 =?us-ascii?Q?dX05vPvjAawA0XBbLFsuWn9USbCyoZ2VNfu4DDwJtcpogxGIj5AP3qdp6On2?=
 =?us-ascii?Q?2vHSa38XeZ9963YT6Ofmhozp5enh1lTpgYALogv+wRdYEFQy2wy4ZrxuVEfC?=
 =?us-ascii?Q?DK/9xjuTLSG6lzsz3aaVtRn+fgnyJ7QEkDmgCrfBBsfhm2jne61L0SLgvupt?=
 =?us-ascii?Q?2xBKUpTgsvTPM77A9pcnx58gaDBTQIWO7IeOXmDwVBxx6DDkk5I+FPEiHN/Y?=
 =?us-ascii?Q?897A3r9z+y+F1scvhR65vRlRJwd3xVlImcBr8K8Kt3hZszUBAQSPIsC/Yu2w?=
 =?us-ascii?Q?l8+aUwgOyHvdtlJWK6mJINTgMSHpSiOvsOGLylFtshC2V2RabXMt8LcbpTkg?=
 =?us-ascii?Q?ZHqE8SpEyUXJNGihR6qLlkSL7BeiWuzsEULyNv5m3hZf/VV2ebW5/xF8QLR2?=
 =?us-ascii?Q?83rzCpQH28MlwI71h1pS2I73g9HBCUIPuy3WiTOoFY13NSJisWTxPNIRSwAT?=
 =?us-ascii?Q?lIw/BYhFFVMOFtigSOzLIqn15FmEvXj7BecUPFHlGT8JzsDGKqCK+idweW0n?=
 =?us-ascii?Q?qMeTdXh9Hn3o3fACLMyv1Y1MXoatG9EY6/DLyXh0vOB5QB1x02clcjbKc3I6?=
 =?us-ascii?Q?O2XcuylLs2RI1v6it6lrCBqbQ6gkepk/DPjxhNg3jS01GNyECogpiKaekUdI?=
 =?us-ascii?Q?pM8wtSX5leOaylg+hcajpMQacqqT8UjOgRT7P+wxvU7Dl2HzSl6MtPJCwhUl?=
 =?us-ascii?Q?5nvOIsS8SoYWCT+9fH1ofrpshsWiFQJT8pU8Kx3D2VrolKBuQOrPMGejXE0s?=
 =?us-ascii?Q?fP6LFw7RCUvV0kErWk4tO8RawSYv2StPRQLcZ95cLOu0RWUGC+1hkZRIJXH6?=
 =?us-ascii?Q?6kAAlmbUmq5comZi/NyGUenjciqi13IXwDfXNCVjfeRML5+KgbCUtis7v/0A?=
 =?us-ascii?Q?AWm0snK6qkZTF7nM9oKp6T75ica8NapisNjVHkjSNjz/Xu0ySsq/qllSM1pv?=
 =?us-ascii?Q?V2zwTH1FOSolVZdnE7D2xOQHG6dT2PPMelbT7w0vRmtoiUjOBrLsqc+A3GOy?=
 =?us-ascii?Q?1f63x5CKAj6gzU1iV0e39ON1MqG5kbe/h7z99TmLLGlyqbmbxDl3fXPyMD4Y?=
 =?us-ascii?Q?6eHBshqWDnTg6fShk9dgzbRzSvXZ6NOZTiRmGX2MnXZAt8k731hAUdLD888w?=
 =?us-ascii?Q?9FDpe/6zrK1RahxmUZ+Z7fPu5vKDN2gV/lgoE0DY5ywe9JSYGxtzj3YCiWHF?=
 =?us-ascii?Q?bA8aOjYBKqw9YSsfglYJcExoyN7qUXyN2uBEnsMElltFbiVHIW5Qedyhtqyf?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8ZbDYjIq+yrlLKKGf6jvdWn6Mx5x2dWgal2HUVq+clLp7CuHHzJPjbRzQIgUklG7d/W0jORuuG/ss0p+4GuKJFM+MrqCtOhbWYqme0cn6d4hIRHdE1n6e7CVJlANTu5i3wIWXNQh9qm0LLzrkR/IWCJ54zXosW0HHBIUUuAetC9sO/Kbxus8rVNqnLGzTP5i896iZIt1UHlVzwkT6mFmd0utE+nPtVYhfdNOw622/xOK0aNMahshjqYlUBFkhyBJb7XLS2RRe2shy/twkB/kyBEv3nF1OemKnmkRf6n1QPzX059EUkqb9/UXX3N8lMWrTwvA6CA8avQhZDrGdajSEh87FvcIohR/h1+ErTivLfjnswDn25A7T38XgyVTVR2e5oF/ARn53beKIkM/GwrWt2PYNPNFGcH2zWIxk1zoY3P/q1hdJPRhcAcDbJKhrZEfa/NELPjMS93QPZgGQeCgRWzBVhs3jaN7+GxCujGwAn+KqpCXipCOOxMQqA4Gkqk1ho4zVvKpnboRR8zKZrAs8sB7+VWl9H376j6vg2F2qSm0YjcNp6PeJGUd4svHbaeuxe3so+0jQu/ZXrf+EfrjXDSE0bkCNLptvKHY8e4/mRk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c911d30f-da18-42f0-5efc-08ddb3ec2fbf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 13:28:35.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qe6StaQp/K/ErCYaY1CxiGAST7lFflLLBuIRVeRj4T4Nazu2aGyp8oWXDiWr3e06ZKdBQgREN7NJi65ZIKqnLq8wzLH4uDp2gtFntyy3AOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7635
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=593
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250099
X-Proofpoint-ORIG-GUID: rDRNxPsdfhAxoGF4uUSgBQp_7N0yhueY
X-Proofpoint-GUID: rDRNxPsdfhAxoGF4uUSgBQp_7N0yhueY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5OSBTYWx0ZWRfX5TFLc39nC3oN NOtDvud7FcYyCWawJJmdEd/4lnE+/n2FAlr4bQfaMYY8qaA2rjFXfKSNz6YgUrLXnfqXOZN1a2W cC6890PuMJYBNMFuVG38d2SHsyQwB35Yqr22oQp1hWyIQPNdQHD6DERs4sZ8Wo94T3niyW6+vec
 bgTSBqmx6xL9c4oZFprs/5q4QtJ7M9OvOlFTIePSaMbEDj2LEjqRH1GVZ14z6tKI7P+77Oi+3RC i6jiEU6L0u7KZkV9/pAqoaFOO5WTGsybPZej4reNSQVUfHR7DypNlFD13gpvWaF54Svls/Rku4X 48adk/mlg40hq8vZCOj2FLlIaxNjGfDglAyb60rG9SXaMp6t1k8qR7XLaBP6eF5WhzsLM5lXRst
 HF1f7v56jq4Jt973g6rB/hMyoDJOufk8m8dCmUyccOnRJsBZnXRVC9ofSBB+n654aI1jgjDi
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685bf986 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=hBzYAgUNK-nasgSJZ6MA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22

On Wed, Jun 25, 2025 at 11:28:06AM +0530, Dev Jain wrote:
> Suppose a folio is under migration, and khugepaged is also trying to
> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
> page cache via filemap_lock_folio(), thus taking a reference on the folio
> and sleeping on the folio lock, since the lock is held by the migration
> path. Migration will then fail in
> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
> such a race happening (leading to migration failure) by bailing out
> if we detect a PMD is marked with a migration entry.
>
> This fixes the migration-shared-anon-thp testcase failure on Apple M3.

Hm is this related to the series at all? Seems somewhat unrelated?

Is there a Fixes, Closes, etc.? Do we need something in stable?

>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/khugepaged.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 4c8d33abfbd8..bc8774f62e86 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -31,6 +31,7 @@ enum scan_result {
>  	SCAN_FAIL,
>  	SCAN_SUCCEED,
>  	SCAN_PMD_NULL,
> +	SCAN_PMD_MIGRATION,
>  	SCAN_PMD_NONE,
>  	SCAN_PMD_MAPPED,
>  	SCAN_EXCEED_NONE_PTE,
> @@ -956,6 +957,8 @@ static inline int check_pmd_state(pmd_t *pmd)
>
>  	if (pmd_none(pmde))
>  		return SCAN_PMD_NONE;
> +	if (is_pmd_migration_entry(pmde))
> +		return SCAN_PMD_MIGRATION;
>  	if (!pmd_present(pmde))
>  		return SCAN_PMD_NULL;
>  	if (pmd_trans_huge(pmde))
> @@ -1518,9 +1521,12 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  	    !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
>  		return SCAN_VMA_CHECK;
>
> -	/* Fast check before locking page if already PMD-mapped */
> +	/*
> +	 * Fast check before locking folio if already PMD-mapped, or if the
> +	 * folio is under migration
> +	 */
>  	result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
> -	if (result == SCAN_PMD_MAPPED)
> +	if (result == SCAN_PMD_MAPPED || result == SCAN_PMD_MIGRATION)
>  		return result;
>
>  	/*
> @@ -2745,6 +2751,7 @@ static int madvise_collapse_errno(enum scan_result r)
>  	case SCAN_PAGE_LRU:
>  	case SCAN_DEL_PAGE_LRU:
>  	case SCAN_PAGE_FILLED:
> +	case SCAN_PMD_MIGRATION:
>  		return -EAGAIN;
>  	/*
>  	 * Other: Trying again likely not to succeed / error intrinsic to
> @@ -2834,6 +2841,7 @@ int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
>  			goto handle_result;
>  		/* Whitelisted set of results where continuing OK */
>  		case SCAN_PMD_NULL:
> +		case SCAN_PMD_MIGRATION:
>  		case SCAN_PTE_NON_PRESENT:
>  		case SCAN_PTE_UFFD_WP:
>  		case SCAN_PAGE_RO:
> --
> 2.30.2
>
