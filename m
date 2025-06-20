Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCC622DA06
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750449598; cv=fail; b=YhQFxD+3jIVBsrcC6xdB1V9K75y2/DcTFo6WHYLU73sQWtF7vgXeOM3OlRPuELAG0VXW+5oGivHX0t7jXJBn3lqWBJIYV8s2xqCXv99GE861NP/JAj2rtI/7s6hKaJZMTLEqHIgnW8aLQoYTj72S6/1YAt+Sz0Wdpe7b53ljwd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750449598; c=relaxed/simple;
	bh=CJAysYj9QVmJU3CSoRLND1gkrcTU/hdXusSNB+RGeTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TrE7VjQhUEbOGpGkUmEuJ1dfqOvI2zfrTMha8ajw6eByuGQtF07cX6wu0pPdflenuiTaHDwowMh3m/YRUGeuzfYIyx0o8OxCyQxmWoNW7/xXmBGRAQBdHKzjzF84EDMg9YyEmUNFMTO24DMOf2frOyYPnEjWOIp7HcEU4IDe1wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kj2DCitJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aFxM4RbX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kj2DCitJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aFxM4RbX"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBj19022859;
	Fri, 20 Jun 2025 19:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=f0f4JFEPv8jyq9Nvd+
	1pNTDNzUDgpbe1yU3GrHN5oLw=; b=kj2DCitJX1XwlmJ8R3HtB1MggJcBtzMGYt
	7IxzCoEbB7cqUWndUBnpUa4omIQYH5KqWKyk8rI9fYPIcTd+K7mCbloQv3CVyDjh
	VBTkbFQopNyoWOjSM114vCKbLb9zz/kMAwC3XFEBYYEXRo/iDvGTxxesLzTUWT+M
	cJ9cG0vWkUYZrHtzWHSLoQrWGgAmfDFtIB2nULv0RbrcT2gJDC1SpA2D8zn1OH+W
	Dw2vbH8C/yWijbWhfTwSibZn1TT9ZTIPXCryPHGqpTBJMX6ozTG7qXBb+ssGCkNs
	pZ5zmH0em9kWp6j98iQWUV295DZC++tB2cXiitTxivpOs6KNIasQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv5ca1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 19:59:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KJ52W1021547;
	Fri, 20 Jun 2025 19:59:28 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2046.outbound.protection.outlook.com [40.107.101.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhd23pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 19:59:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJ06qlxhBtHKb7RLs3/R4+ZdiJRsmSCaqCQxkUxAQVVHf6WEmppS3KWZI8657+v/cF+hkSeACTKqRTmeztPTdBo/4tolGR0K55kbuHgH+vigl1jNo1nozMEoBSEzf9s3R4l0QCMAm/oZt9Wz3Vpz3LK9XUTkhV/oD+iPSPSNFF7+XvRCxoF7/pFiVkm7cSPD9LngjUKbpf9KSacDihiWDKmbjZMuMdHZgKTWlb9AmwvLiPCzxVknz2fYoHB1ZrbM6SsK0SHFlB9AQl0LXvKgMgdnVj22h4ZCXzgxYuRoeG23HM/Ocj8WVtwAq/RmZ3LHIHT36DjzpNHF+VvtsHD6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0f4JFEPv8jyq9Nvd+1pNTDNzUDgpbe1yU3GrHN5oLw=;
 b=xN4BEcKlxJqnMgQ1a2X242XBQ2GDHkJ+/3bJoF2GJnoEq03eG+akuNF/dJEDJtZX5q2zIa6skEZpLH7aNxdIrd7RBs2dHyqY67VwLBe4D6j+UxesDA0KeY9l0gPMi3L6P2hQqJJb5ovBlLbJzjOaLDYIyhJ5bdwXvbA/0TPqAXnKbd2i0r9mVjKLZ/qCDueq+0f0GtuBfq4E6Czne4dyCx3dtHiHxhrdEs52GW797d3vxh8RdOpqtsEgFnZcUB8Pm9F1qfSSXIzx7UaXBj+PFg+8R7g2rboxnsG32+7nmrc+1SHy6iuW2KtrY/slPi/c4RNOAqzI1tJhdaByjhe5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0f4JFEPv8jyq9Nvd+1pNTDNzUDgpbe1yU3GrHN5oLw=;
 b=aFxM4RbX8JEiz7s0I1BqorGi1/y8QEDiOiPGyPmG5QK/mqP3ktmLmMKAp3fh4oN2AfPZrtykyVDdu2hk6wk9JyoNNL+r3nCTeZ979GRjqbcHEDRhLb9oQJVbjraFo5g+BXZ5jnYYJMS0nLjXQEE6JDM/OLUhZg3LlN2KNRJNgnc=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by PH7PR10MB5879.namprd10.prod.outlook.com (2603:10b6:510:130::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 20 Jun
 2025 19:59:26 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 19:59:24 +0000
Date: Sat, 21 Jun 2025 04:59:19 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: David Wang <00107082@163.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kent.overstreet@linux.dev,
        surenb@google.com, kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] lib/test_vmalloc.c: demote vmalloc_test_init to
 late_initcall
Message-ID: <aFW9l7JJnkB_ovsM@hyeyoo>
References: <202506181351.bba867dd-lkp@intel.com>
 <20250620142448.653645-1-00107082@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620142448.653645-1-00107082@163.com>
X-ClientProxiedBy: SE2P216CA0113.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::17) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|PH7PR10MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e8fb83-c16b-44e3-7ad5-08ddb034f4bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oabblWyJZp4X1TuSYAg5TMUn7O414tfw7NtLETPxxHfgrqin7iRJBxI4mFPE?=
 =?us-ascii?Q?qo9JxHIxLcCdk3FeCzzdTvyVbhHhKGlV5/hqre65yNZH+1fO1lmqXEaNZBS9?=
 =?us-ascii?Q?IegFlJqhmpseaF/4jyoUsUSZECWa/pUcTEAUCRtFb9JypdzsB9ruQP9dpGTJ?=
 =?us-ascii?Q?5w3KBQg5+U+7VRB12uo8g/N+WssKX+H3z/2GEhdGwCxin8uf3I4FGEGo0Evz?=
 =?us-ascii?Q?4y2C/Q5JYxBSBje64ci7a3c4xqIGM1n8UXLPzoQCT/JRWQOiYOMT7YGzOmGI?=
 =?us-ascii?Q?8HMgkRN+GU9rHtKjW5qXu3aMqNHKrXDwwJQQrrpWAQlVkG5gFiUGOx5Lv41W?=
 =?us-ascii?Q?MN0Wpc4pYv/9EsOgqjw6xelPULj94M2WUqdC63ytRaR193JVqLT5MGy5JzWM?=
 =?us-ascii?Q?b27cAbtt7UMmVtZ8vV5l16npTWtQXS239YuTOCPusMtA5BYJkEBFS3UUKqUI?=
 =?us-ascii?Q?0WOvKh3+IxXoIMaAohLbHrrcr+v5LogaEx3qgJarjne765rUwXjjAqEYnHcf?=
 =?us-ascii?Q?XIckcz6HIBSURxRarKMiied35ftAphisKgSr7G8Q+QHuOQRoWbZzbxDGU2iC?=
 =?us-ascii?Q?tuz3VWRSIXMkItsCb9SvRwrMy2CoVinNnjKZL86o6SgwSWVRj0ftYdAtxn/2?=
 =?us-ascii?Q?PVPA/TZcPxmZbvqoyitB5xpZ+rJ5yP9WTvXVQlTcmDF7DnAuRnfRJ7raNQP+?=
 =?us-ascii?Q?vQ8t52gPj9ISYK8pRx4KSMjcZ9MzHeM6gc2e+w09YxLhGRlFPTQ5nDsQE4j7?=
 =?us-ascii?Q?UqYuJxH2LYMl+lY8LOmqLPYsT33sUOFy/hsKqsoBnTF0N8JTn7l8OhpoaaIv?=
 =?us-ascii?Q?MfjaEG/Rcn7rpbDWO3XXP/5MfAts/vnHf6ChBfglmMzsIr1SOhGYkXBL+V9l?=
 =?us-ascii?Q?NOhYXGnwcAxqzju2VGHUdgjGhfF3nrgY5LNFg+/nQZt5ETjcIk/jTjGV9TIi?=
 =?us-ascii?Q?3VdJniNk08JsRzVV3IF2DjW9hlnG70jDlKbY7k8F7n4HXZq3pWHTIL3BWP8W?=
 =?us-ascii?Q?mA60MqMsCuSiyWdcDe7aQmHNdR3g7w0bzuh03m7cPmVRYsmrG2dtmfwZfQ6E?=
 =?us-ascii?Q?TU7/9vTrb0RaQpY+MNgLbVIuuyT1DYA5Bv8tpSxTgeOtF1UJih45RPR2oe3k?=
 =?us-ascii?Q?tjCOrr/TzliKIlrDEuFVzDvESDLaWWxMQ1UV+Z91n45sJc53K482kGQj7AEu?=
 =?us-ascii?Q?RdnkeK1uQCbpGAojAwe0d6Ezi5tyA9V7SK2EOzNPvpxcMRB48ghp9NRN4tNF?=
 =?us-ascii?Q?NQViu0Q+hxWTl9z/1x/DDg5vvxfIzG69GEYBFyXekehbZ/9SH6Yc9YRSSUOq?=
 =?us-ascii?Q?O3LZDqxPp7nZTvKUsBwW6U95xqiND52InokaWcEgFmwBU7OLM05Du5/X6zfc?=
 =?us-ascii?Q?Z6N6W/60i5rkZyJmIpiYdAfOgKNDX51sX6tWomk7ZL4wNjneqrCU2Kl52idD?=
 =?us-ascii?Q?6HCoNpIS0IXbaNTfcWByzqGd56vWC+uo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FZMRjK/2kV/6e7+bF2nl7Dkes3eAHrhB+CONDaVTszg+HWGDwB2GML3k3oyn?=
 =?us-ascii?Q?5jCUWbYHkCSuwjfcEfnkpysqhmM4wLDvQX828ZqjsH7//asJs70UCqY7cAAn?=
 =?us-ascii?Q?Wx+qHKwBUecUTj5MQ6hpOm2lyRDk09Qvnb9yWCkMPkKxqY7e7Z9hg6fKuACV?=
 =?us-ascii?Q?dHA9D8RufOKvI+I3sOYLMXVDwi9bqV/PqZyHDSr/conHEoDI5SEOIcVi8Zig?=
 =?us-ascii?Q?oyFH+KBFWaCIS+rieMJYWMaE/vBpwLhVz4eNmEw9H6tMl9H/5XmYcVxh+28a?=
 =?us-ascii?Q?J8WBYD/eBNWY6CuAaRBRheKiCV1AYfmLP/wFHSGkSx++wGUpxxs3lXvJWhoc?=
 =?us-ascii?Q?TJwMWZA17JnPriaSs2TNjH9A1K7unnTjWvF3WHX/SuIJAnu9+a7/xLFEoiiu?=
 =?us-ascii?Q?bPli5g7lF4a6R46Zeb3GH/HUY8uaQq2oYOf69MDaDbBHpS/BHzdbpWyh/kne?=
 =?us-ascii?Q?Hz0wSUFA/p0VYQURDqn5mL7pJi6iFM6OgChzf9SjaDNRjno8cB+1gP4+BrhD?=
 =?us-ascii?Q?Wp+jhVfLIamlofN2DkhKPaZCu0Gkq4ZQOK+EnJoD4pUe2z82ZyzL1ojBuace?=
 =?us-ascii?Q?yePWf/kQA5ZOBy0pMa1AmyF5adA0l6yjLnX+5H9qGTrHBz6BIhRztxpXUbXP?=
 =?us-ascii?Q?2AP9nvZ4XWexipTQ5+FN0fXc2L+gtgTRvItjRUd121DSsPOTALV2+C9hQDJs?=
 =?us-ascii?Q?5KU5w7Halit01XzVUUkoSmZbtqXBGqVJGIiUpX14KhGnfTeDL36diDG1Z6at?=
 =?us-ascii?Q?T8bgMybpB/hl3eGPN1P/VA1SgdOsuzDB3ishB28FRtIr9KhGWNbkRWQCgS0L?=
 =?us-ascii?Q?nHp7avnFU6YWsnAmizIojtmLKONjOrJf+O/wsvElRkl45YeiYNiZPhtGFyzN?=
 =?us-ascii?Q?9A6N4yLzPqOT5HH5bJOf8mG1wd2fee9PVEmjqvzAqkCgbKgQAQEr2HFSFZhI?=
 =?us-ascii?Q?IOHMpTA0KTJwr+q2amdiloTBDgUfHz7zbp1fTsQ0XZu2bL4DFd7im1fy+CqH?=
 =?us-ascii?Q?1GbFkn3IEHTI2yB4sB9FNViz/XiN7r9HbDb66AeQeKcveADRNWO6FdfEaDF5?=
 =?us-ascii?Q?cASBIFd5QeycGBxC52dO0lia2aVXM/qO9V+FYCeb8Ki18dlm0KtFyAoXVY4V?=
 =?us-ascii?Q?6+Ff46XipNZlPvm0By6YkoH+BkxhmIn/b7h5RIKYps5h/zMa/TdPGMLSQZkt?=
 =?us-ascii?Q?eshg/ul7GIeq7LvE0UOKR6nD77HRf23jk9XYY3GdL0C8P8N4Qlx7H+n2KXhh?=
 =?us-ascii?Q?SxoA5swy35n8Wgdh3IWkXYCvmticDef9DkJQG46VWvF44tBa0ESH9VFdWKXZ?=
 =?us-ascii?Q?IOA5WZqB5uzGz2pf+BbGlVQ1/EEH/oKHNOMCKsxb+EyoIVXWnY2RSpfZgeZK?=
 =?us-ascii?Q?C4fvzUnz6VsuSmUuLNbCMnMXs42IDKI7rTwbNMWi2+6w3erMxlrK76h8xSxD?=
 =?us-ascii?Q?w6YlcfuJl3ZUIXIJ0tJkY6r8diPV2o20BvxDCjw6ssvYnEji/J2zeiy8h7bb?=
 =?us-ascii?Q?U7eabqK8rBu8HKLqX/pE4G8XJjyi7WWGHJRQIwFyTE5kgRvdwmiHlt9cOV6o?=
 =?us-ascii?Q?EHsbBRx3wERTriUy0xCcNt3swTrZlilYaIHevW+V?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QPDOYkk+82WcvS6Dag1ZEycxTqF9k0qVnA41OxL6pGrQ3Zo69im+QzkVmggDJhY6ol+ghZT852qdjrLn2nrDfd4C0E80cIMJAif2Kt523+DlhZ/knTVWdx32J7z2z8tF3MduxRgVg/SdDd4WyQIS3W+9t9oNFqk8uEmyOrRYyoriYfe9vZzVoNVoSzA7wsufgdMXN3PS6Lq7ggta7MbyeMQ2kE8M0ITGZO7Awr8vkqJajXNbJJS6nzlGjjr1r7XHnoKmVhjOkG4AORHMTz8eDnllNudvu2ThWSIw264IZv2VW+rOyKLwCSsqlUEh55YosseX01JyodPW6CVkAK7OTRZfxBk6Z1nKoEevec/aZqSDgpd1iwIUReIO7MbKdsVEDJ1SLgtjJiM3rmAtOxTFEC9Ib1EADvAg1gKWN2N+rEYg4jwILdNOz3MBTSM0r02NW6amXZJ1i6NJkTKm1m9rUrrrPik6bHD/hWmgB92ZyBocRl4ZxGTuRP/ouTjZgg5Yv0Ki7r/v4Sa541OOj+V+as/Zoy5PRmpQULu33+VdzmqxgQodwMznN8ds+geN/uLZmKz6NHmz+6II9/2exGc4genG9Kb4+I1fXIE3ptVAmP8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e8fb83-c16b-44e3-7ad5-08ddb034f4bb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 19:59:24.8567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7Xno1m90plWsTuJo5lyLkNx541LnFbR2pvdftblXNQuZCuXu7EI4hryov72mze6bktxIYJG6ioohbgpp0Ilrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5879
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200138
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzOCBTYWx0ZWRfX3GyeZJJG+DCt i2uQ+JYfPvfx8DVCMqYtSvvd68fSV544del3Onh4GkTVEuSbc8gkqKQI2xtKe4okLZRYFuEjmtn XWKSU42yuWt3ThFiri+udVmkjdOyxMjZAgJfzi8ycGMJKJLFLLbTjEe9knizgsGfSD9esPXlRB1
 FNkLZWG8tZYC3qAOA41x2YfLlHPoIsTu3NH4I+IlVVVF4fDrvcSg9OesLbjurAzdgYEYAsEC5A/ ParFBjV2x8pO7BXmzJi0l/KZhvxmwFnwPO+NP5DThFV506DdLHDCMYxuDdRF/p2SOW3ECFW0mIf BdsDHpS1rd3YlByw8LKu5XlG8SeH4sMJgnx5EFFGMASyPnKIuO9PHWXj38sGaEnWJHBm2iMGbHj
 aNzGbU/HO5H1M51CZc1J+a418Xlc6dLW/bjBj/af0vKdtOmJZdjajdlRPB2hzqbfgJjbHj9g
X-Proofpoint-GUID: whucyZNjK0d5r-t-RJ4FmyjRgDqFeIC9
X-Proofpoint-ORIG-GUID: whucyZNjK0d5r-t-RJ4FmyjRgDqFeIC9
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=6855bda1 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=QyXUC8HyAAAA:8 a=fgo4JFhnIoLrlpzt2_IA:9 a=CjuIK1q_8ugA:10

On Fri, Jun 20, 2025 at 10:24:48PM +0800, David Wang wrote:
> Commit 2d76e79315e4 ("lib/test_vmalloc.c: allow built-in execution")
> enable test_vmalloc module to be built into kernel directly, but
> vmalloc_test_init depends on alloc_tag module via alloc_tag_top_users().
>
> When a kernel build with following config:
> 
> CONFIG_TEST_VMALLOC=y
> CONFIG_MEM_ALLOC_PROFILING=y
> CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=y
> CONFIG_MEM_ALLOC_PROFILING_DEBUG=y
> 
> If vmalloc_test_init() run before alloc_tag_init(), memory
> failure tests would invoke alloc_tag_top_users() which is not
> ready to use and cause kernel BUG:
> 
>  [  135.116045] BUG: kernel NULL pointer dereference, address: 0000000000000030
>  [  135.116063] #PF: supervisor read access in kernel mode
>  [  135.116074] #PF: error_code(0x0000) - not-present page
>  [  135.116085] PGD 0 P4D 0
>  [  135.116094] Oops: Oops: 0000 [#1] SMP NOPTI
>  [  135.116123] Tainted: [E]=UNSIGNED_MODULE
>  [  135.116132] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
>  [  135.116148] RIP: 0010:down_read_trylock+0x1d/0x80
>  [  135.116188] RSP: 0000:ffffb5e481a9b8f8 EFLAGS: 00010246
>  [  135.116200] RAX: ffff93dc8a5ac700 RBX: 0000000000000030 RCX: 8000000000000007
>  [  135.116214] RDX: 0000000000000001 RSI: 000000000000000a RDI: ffffffff93d2e733
>  [  135.116228] RBP: ffffb5e481a9b9a0 R08: 0000000000000000 R09: 0000000000000003
>  [  135.116241] R10: ffffb5e481a9b860 R11: ffffffff94ec6328 R12: ffffb5e481a9b9b0
>  [  135.116255] R13: 0000000000000003 R14: 0000000000000001 R15: ffffffff94e0c580
>  [  135.116271] FS:  00007fd41947e540(0000) GS:ffff93dd6654a000(0000) knlGS:0000000000000000
>  [  135.116286] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  [  135.116298] CR2: 0000000000000030 CR3: 00000001099f8000 CR4: 0000000000350ef0
>  [  135.116314] Call Trace:
>  [  135.116321]  <TASK>
>  [  135.116328]  codetag_trylock_module_list+0x9/0x20
>  [  135.116342]  alloc_tag_top_users+0x153/0x1b0
>  [  135.116354]  ? srso_return_thunk+0x5/0x5f
>  [  135.116365]  ? _printk+0x57/0x80
>  [  135.116378]  __show_mem+0xeb/0x210
>  [  135.116394]  ? dump_header+0x2ce/0x3e0
>  [  135.116405]  dump_header+0x2ce/0x3e0
> 
> Demote vmalloc_test_init to late_initcall can make sure alloc_tag
> module got initialized before test_vmalloc module.

I'm not sure this is the right place to fix it.

The bug can be triggered by any early memory allocation failure,
before alloc_tag_init() is called (yeah, that's not that likely).

There is nothing specific to vmalloc that triggers the bug.

-- 
Cheers,
Harry / Hyeonggon

> Link: https://urldefense.com/v3/__https://lore.kernel.org/lkml/20250620100258.595495-1-00107082@163.com/__;!!ACWV5N9M2RV99hQ!NXhzLP0lE5O2YKK9PfCt3LDTk4qWGsy1ebNXBQETNNJrL2JS3R01iunwBVXbDA4_kKjrbyQWfzNa7iN5RQ$ 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-lkp/202506181351.bba867dd-lkp@intel.com__;!!ACWV5N9M2RV99hQ!NXhzLP0lE5O2YKK9PfCt3LDTk4qWGsy1ebNXBQETNNJrL2JS3R01iunwBVXbDA4_kKjrbyQWfzP95R5wqA$ 
> Fixes: 2d76e79315e4 ("lib/test_vmalloc.c: allow built-in execution")
> Signed-off-by: David Wang <00107082@163.com>
> ---
>  lib/test_vmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> index 1b0b59549aaf..5af009df56ad 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -598,7 +598,7 @@ static int __init vmalloc_test_init(void)
>  	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
>  }
>  
> -module_init(vmalloc_test_init)
> +late_initcall(vmalloc_test_init)
>  
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Uladzislau Rezki");
> -- 
> 2.39.2
> 
> 
