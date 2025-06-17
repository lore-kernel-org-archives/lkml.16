Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CB7290D9E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148535; cv=fail; b=A9rizIJ6+mb1i2JqH0Ty6wERqzU9SNyLua09eFY0nxeYsRLvxpoVa4D+XwwNzINrY/f95SWX4VLU8VtFfaFZfJIWyH09ChN60G2o3TZLCruab2LowSS3sI9FOK7D382V/g21Gv4JCZD1oFMQgrXAV56iU7sSn0px1T30xB0K6hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148535; c=relaxed/simple;
	bh=aW06xFDjbcKdwyQANlzVf9bKAzdXL2pzB0RQ+cYsx8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aT7FyT5J9y3d2muf1WHIIahAp39+klFS9wj58gV3ooVUNMfo53rnp9SFkC/41N0fhGtvNssMJznK1HHbW56MR7QKxaJ4JMPGyXPoid5GRyO6j926X+32mQSCr9ObU7fXk9C/wOfaphDjbNZnpbcMdzIARBWUNmAK/9jojrRmKYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lw44fih6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YNYGL4ge; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lw44fih6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YNYGL4ge"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7tj4L001514;
	Tue, 17 Jun 2025 08:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=UjbkHGBLUZzjeuDxzD
	ioyYBF5t3J8QU2XMWFqxaBwtI=; b=Lw44fih64O7FEZiUuma+5lXNr5lAgmT49U
	GmySKQkIw3toe/f9H/hzOokQkGk+Jm4ad5b/PlHg8ceCF6u/UlkjO19Th/Zixqob
	AOHOys5OMqMHgFbt3QZIzbxNXf0JUniJOR30c1g6qGIDVPsDXujwiapwxNRLTajw
	2FNL2rT1cEqjdDJhT1PxeRlkBrzEwC7Ul2uHkyRnrDbmwjoJx5PbsLbOiogpqvgI
	u0LjglvApEAjA6pM4qdbpSKLlWfkgZr30TUulTgKi5glCm8h1O0/ySdF8CN0d0Ia
	qUqOB9BhiBewEs+NGQ4aRiB1YIe0g35Iu6ItTtrCxMVfl7NR93vA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914emrfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:22:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H83W7L026030;
	Tue, 17 Jun 2025 08:22:00 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhf6qbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:22:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyE8dAtS4sUipzTIIOEYFB1J5m1+bJAhcEuXsB9j918z/uu4pgjNhVFTAG+jt5ilWambrKxCvqmcLtuXm+8Alr3BIHj3ELMn1GVSa7LNlgjHTw1oG0vlYzByfycxDIFFdkFw0dBBqnweSNTIjlr29v7LGh1+QPSxwcyPjP7eDwh2v71w5SG14LT5g5FNWfDaug9sMoHBFWTq/D9e1NE0bDxjrY7lO9BhczUfa/jsA5AMXBeUQzDnmVOjELEgnH4wZsr9O9Qe+IwoBvfINsXtKS0R32PH6YQgF1xiEpaiW2AkM4gZQgl+aIa4Rzj4s5Z+2LEU3P5ihfGW3+ZWTGr4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjbkHGBLUZzjeuDxzDioyYBF5t3J8QU2XMWFqxaBwtI=;
 b=kSoGmh7QOTKZ4csIMzkJxVJWu3KBWyf76lbmEC1zODgB9ycssdaMsN2NDiaxvrK4IOuP98nht24lbmEHCRIo6rFcZZcvks1mmYeJwQHKARUBHkK63Gn/uX8L5qUHdMm5SLi/jCfV0wqhddqkWhseo7Bsj8l07TsX9SiYFPxo8m14Y5VbYQYN1pEFJEzEdPYITUk+3xHcNX/zU36Br2yAa8EfZTrRJW6VdOzWG52xLcC/kAwf3XZ4T1BlfRwe6NC6u9OZ2vaA5FqGczHvhR1OCoPYT2KT6xySI2jNYtYCbalu9sjg+7tRXPylSoFydy8G9nmCHgJ/H/y8OHadXQGs8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjbkHGBLUZzjeuDxzDioyYBF5t3J8QU2XMWFqxaBwtI=;
 b=YNYGL4geXPDeRnp3ctg88g13lyVVWVtybSauigejQZzgaZ3SoCoihxxfAC03y+r0vVRrMYhcdKN449NEnPWgSg4ULpesvOe3JvZp8o7VhA4wuIb7H5eF33MDWiF2Ry93xrDYwwuaeSjxovbeRQRPTvyLi4sf1SMUm2aWEwqHPgs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB5109.namprd10.prod.outlook.com (2603:10b6:408:124::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 08:21:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 08:21:58 +0000
Date: Tue, 17 Jun 2025 09:21:56 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
        21cnbao@gmail.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
Message-ID: <e61a7aea-a87a-441f-809c-10acdfb82df4@lucifer.local>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
X-ClientProxiedBy: LO4P265CA0245.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 47048310-384e-44e8-bbe5-08ddad780744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?owsBbShqt6iX7ibyir9jNi7SiktlxeBIAFpskGpQLKjebUWPoRsBQIQ0JpFg?=
 =?us-ascii?Q?JbEn5uUwqfKzn4UhPi6dOF2I/5+fMXFKlapZ1ibD7ZRuF8C/vAAmICWujgQG?=
 =?us-ascii?Q?dgac1MEuxV1hTTPsAjifTPmnw9wXCbxreeK/2NqPnIo6jj4bpoBKfEaYu7Ff?=
 =?us-ascii?Q?SxpIg52Gk8FW0tfjZ19bLtGtxWKKgyMfsteFLKXt9LUKiXlK3/UK9Z0vKzMw?=
 =?us-ascii?Q?eKYI+Wh3q3qLqLORZM1U3WYQhJoub0DC0zJ9cCiR4gBjV0K0nzPqz6j+AyZe?=
 =?us-ascii?Q?KjNWFRIEIDThVjUAtqfuYCfwmH5e0SQnGRiAJ0DB8noG623ZBKSrY6VuDZ9b?=
 =?us-ascii?Q?Ar3ph21Hmp+R62ILQPz8Yv9op6MU5/bu3Vq0t4bLJ/q9qa+fCOY6wGWr/e9t?=
 =?us-ascii?Q?k6ySgcYO0IRdReCImrShpgAIFcHb2k607HOZWdk7cXc0x0aUfECyjZBnepJD?=
 =?us-ascii?Q?h54x9qFHyfGRHGmaANr3feNhA9UW0CgQN1ovhhdQPZ3PtSJmBWy7ey70y79V?=
 =?us-ascii?Q?YuYtaLWjZnWB1MkcFkg41kUHXQU1LfBp5HG3AWiF1m9V14Giogw41H317ft8?=
 =?us-ascii?Q?DQHug3v+WFyHpeIb8wC7OH17Ptz/WSmKKq7noQLJ68ek0U72OrOBY6w6K1bJ?=
 =?us-ascii?Q?MqP38fKJGK6Czag70GgrELbArTRsOEignMuktWiUSjyWaRdI4StsvT+Wv6nO?=
 =?us-ascii?Q?vs7jTZ+wRKz4u8iPj0P6Xp8B4oIX+ibZpTva9p5IZmbjoUGHjntbXBdvhAn7?=
 =?us-ascii?Q?ckLk2DhTXzX+Y/1yF/UzS9RBzCisvHbFrAbLuCZWPzQ6sW4L0eRWs9pp+iFj?=
 =?us-ascii?Q?nLtW6mhsqL9LshSFF1jl50+Y+6CvZyEh4RyiWuf0MKinzjh6FTaf4zYQUAcI?=
 =?us-ascii?Q?zYvaCne5R/jKaIYYME5UO1TS+BEZuXueZYrxuz6Ulx2ZY3d8572oyP3WeEpn?=
 =?us-ascii?Q?OeXWKpceduirPseFoXJuGf3QSDCY4WcNOmWCiwEG9LYwPA4afBNpfRi/u8Em?=
 =?us-ascii?Q?VkPqu0EWCh0Zj/NkdYZmfw/aTlCsXP/crCksGb6860U6Zti0BOHT2JkNEFye?=
 =?us-ascii?Q?cjkhFI+dFBihe7UXD/UoIzpZwmDnptTfySvosrdZzHJU5CdvIVEvm3gvCa8n?=
 =?us-ascii?Q?k9kltzdjJKcAXJfgigRYnOhpuOey+bXhPmZlNg7vB+BLF+9yMXT0m/SAhpqR?=
 =?us-ascii?Q?ZigZrz9PYgeRdYfu6Ts2hmc/bPpAbTBHNlnCUAmBC//yPpbdoXzoKmTpmenv?=
 =?us-ascii?Q?yNNwVEyOPEpj39iGvPBxoZuczld34uZLccUHCncHRrSeOvRBBBpR8LfCdFOc?=
 =?us-ascii?Q?dw9h1hdhGkrOy0AV3jwmeL14BrJwPUezIvWoPEtKtQAyjoJVrtmAzS94CliS?=
 =?us-ascii?Q?3W7EGqLsOkUY5s/zAaAF2AE/Nsa4NskM8WaKKun09n/hc5cgfdCyZ+cI13dm?=
 =?us-ascii?Q?cX13cp7S4cY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iw8xgnQScIf6Zp1s1FdS5/ONOT/c1WoOnrOLoCl0JncCgkMfRB5vT8xvalse?=
 =?us-ascii?Q?oKg9VT53A4h18NE1qPHHHibZoFS7qRlaIWQtxJcpRpWYjsjPUhfZV4XFk0oW?=
 =?us-ascii?Q?n2NPpscOIKpKXxdtVKHLfFIYcOeFpe6/osk+1/Nod60FtBvJFi+JHWzJkF5t?=
 =?us-ascii?Q?YVuBp8sf8EL/uwgUoB8ZTjdeP1ilsljvsss/nh0u1wh8NMDVLaq1x8B5iVye?=
 =?us-ascii?Q?0A/qfLW460DM5z1OmT21+qJu6gvXFyqg60FBBmTNivqvWAbpISjkvSGQQ0kW?=
 =?us-ascii?Q?n136MDUwbNaq33F2FtGhUKzK8rIFOpxZy2IS68V+F0PbdklVhEx1STcWfNTi?=
 =?us-ascii?Q?H7YLk++9KVufxMAiuTgUm3RRXjveiakMtm6CJuasQ32nr09BeRSMVQ8JNaMU?=
 =?us-ascii?Q?PSjYzs5HHOUKQ+Wgso4C19my6HL/jMBshOSGHzBMgwEVC4D3RH6TwFCwpetF?=
 =?us-ascii?Q?riDtBP28+nAp6byMdv0IEJ3qd/SBrBzQklihf96jogP/LuvGLLAZEgo5Uyzk?=
 =?us-ascii?Q?cr9FFTUFh/ebhAHB8bvv3ey+8m6LD182MT39DX5Cu+UQmwYSuBHe+WT9q5A5?=
 =?us-ascii?Q?I3pK99CZJ/0D/ybwbQ73F1JjOPGwISn7Y+CxIRr0O1UOMcM+gBdrOCyKtisz?=
 =?us-ascii?Q?x7yX9UlUwuKObU4DlY88wZ2D12fBwNq/I3LLIvL8qzjdfZWifLU0arSmOV9f?=
 =?us-ascii?Q?Y2AfVaHd8VVA9PQ1Z97qbjPmAqcTs6D3GG3dkmtuZFfDuHzN3kCgK01P4KGs?=
 =?us-ascii?Q?08hc/1erMGzasW01O8rrohQwxMQpOzYAy+2xoXC8RuX3YgyYT0cHWBDpt11G?=
 =?us-ascii?Q?e4ipXl8zJN4cG/AqMQxggyLipaf6K6+S/Au8t0mlW11WP7oQOT0bqUEGwe1b?=
 =?us-ascii?Q?z3Jo2jhp9FBmY9up3zIk5gtQI62CEZ1banJQW8WTp1fCKYYO04QB2s6hgg9x?=
 =?us-ascii?Q?7DeZzpp+XJXB2ctL7kSkUNSZ50izs5fDI9E/m4pdS+Njj/sEmfUCoU+PvGf8?=
 =?us-ascii?Q?yf1mdoIJQQ8okNm98MtEARjGIL0CKjH9WDQGjRphTr+OdUroLyM30TqHxewA?=
 =?us-ascii?Q?KsDjGBvlTXv7xA0Hsu+sKh0dpkDZLcdsH/Ivzumh9ApWaIE1dYbaNkuLDVrr?=
 =?us-ascii?Q?CwTd0wv7KiZlzA23j0+1coEOjoI3HZLm+620gcLDNFUQSO3DudcCRU1+13aq?=
 =?us-ascii?Q?EO2L79ztQygkD6WHCTmy3C0OVOpRSlZ7vhkgpxls4IYl3POt8ODlgNJma5/N?=
 =?us-ascii?Q?xLWvxqIP4RmklPVIr/0Gg+W2nOjHqOsUzQISwGAXvzW6DxryQSoxABOZO3Rd?=
 =?us-ascii?Q?E210MRFqWUiXkH/pFjGii1+rxNXLFzwsi15GSuyL7Xhp7qhNtx7u9+PF1d6n?=
 =?us-ascii?Q?NKWmXzY1qls7F6tz5pQraIW0ai2fAa/ceFmvhbM+PqWECR8dWw20psapN3jn?=
 =?us-ascii?Q?TJqVdTGIyq66MA4XR1Idqz5j0fZ/zfRwmTWR4nutj0pJGaYnVT6TmfsmswJE?=
 =?us-ascii?Q?3cTJ5ZOtMjUXqfZiChNqjuhwT1b7uqb6VOLGBpQHssH7e88/4uzULoihIa+J?=
 =?us-ascii?Q?C3g0WiFXnPGvPBCLPEbB3LFTHJlOeqfYllcIu4JPUJyNoIDdSu2p9s0yj/X8?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IqOBA86/OTY3cqB9VrYNwN1QGVesVA+RJH2QjsxKHMFC6bpv9ux/W9/hdluWbpxDfixzBJKCCTFjUtx21nZwimjSx9coNDPX6SRNZPE1pt1/ySTGE6ZSIQXv2cOEfYpyMPtgtCXNgrbui50b/SkPjYPE6VKTK+KuCWwiIdzPOw4QHRVx8YZr3oOp6CrUFzP1GIFee8Q8PKl1XbeOBAV8ScgBGCgLCRhqT78C2FAmY1CvctNJ0pFmO0rEHIU6Uimb+DrLhingDTO6vxzfCw7IRB0xmNBEaUVm6UDGA4/kP8hO6rowZr5dCTMhmDk2efl5hE7J2VCowRyRnahW1gM6cLj9M9zirhbPgKkHf3M4JT+1uHcX9Bqc+05h3AIIlt7gnT9T+YTr8H+uulsHoUZK/LbxoEiiJ76FEv36DoNLAAqC4EkP3z6YB46zR+KNoKLsUNxO5FwkA5YBA6SIF6DxlyZ1/fOZBWSWjf+yrcA/326SnXBzgJTd448ylkHK2hHYULXMrt83JqlfCDXlDVggL4kPQBs65bJtAGwvjti8Suhy5+QuoFFSklYzwchAbwtfyvAZsyiT+clBqnUtC1OH8eHPCH6L0HvXRZd8HZT53gc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47048310-384e-44e8-bbe5-08ddad780744
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:21:58.6807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySLPOzuGtdcN+R9NCwVyVLTwmcR/o0qki9PYPufipkNyzXSrHzhKr06gZt6nMibiN6ygUsund6Mex1yp+Zezm5dWzMLYCCSkErBsVkZjK3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5109
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=847 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170066
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA2NiBTYWx0ZWRfX0rDS6XmsAukF OIBU1STlYcnrTZjRfUkSn0+3UXHK8NWGPPBROSk4Ew5Zo/RyG/+da2TpRyp+dZWYk3Qh/SWJ5n0 Fn7C/jhhbCBSAl9XoDsoQkpSq3BTi6iF6VsJkiAxT62Ze2ePledVDQXeXcBNOyYZymGGEcUTON5
 PE3ejTRez6aekFSr0vGmp4wR27S87EejP4wnAbHOJIeTEE6BQ/HZamF9w3/d1vie08BnpR6lRNF duLJLOeY6JlG9EuUB4CAL7Kyo/GUQfV/BnhNXDha48ukmhODHiFyqFq5YaeLH7mvEU5Prf0GLgI 6itUC/tmsiCwiA846TQ4IInuPJQKhVhyUU+ZGHqkugO/MZ4Co4NCZ2vTY55Qsf4P3vd9Lmt+4C0
 XwcA4sR8DPQnZQKU17Zq03Soil+mlBIVN+upoo7Obvs+OaRbW68722RnlhBymTVoIwIapOg4
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=685125a9 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=VM11dIpZfkom8c9tnxQA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-GUID: DHzZkOHYqr2pjcik8c0a6CM9K3R2YxbG
X-Proofpoint-ORIG-GUID: DHzZkOHYqr2pjcik8c0a6CM9K3R2YxbG

On Tue, Jun 17, 2025 at 09:54:29AM +0200, David Hildenbrand wrote:
> On 17.06.25 04:05, Lance Yang wrote:
> > From: Lance Yang <lance.yang@linux.dev>
> >
> > The prev pointer was uninitialized, which could lead to undefined behavior
> > where its address is taken and passed to the visit() callback without being
> > assigned a value.
>
> So, we are passing the pointer value to visit(), which is not undefined
> behavior.
>
> The issue would be if anybody takes a look at the value stored at that
> pointer. Because, already passing an uninitialized value to a (non-inlined)
> function is undefined behavior according to C.
>
> In madvise_update_vma()->vma_modify_flags_name() we do exactly that,
> correct?

Err the parameter there is struct vm_area_struct **prev...

We deref to the prev ptr which is unassigned yes but the pointer to the pointer isn't...

>
> 	vma = vma_modify_flags_name(&vmi, *prev, ...
>
> We should use Fixes: then.

So no we shouldn't...

>
>
> Acked-by: David Hildenbrand <david@redhat.com>

Sure? :)

>
> >
> > Initializing it to NULL makes the code safer and prevents potential bugs
> > if a future callback function attempts to read from it.
> >
> > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > ---
> >   mm/madvise.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 267d8e4adf31..c87325000303 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> >   				   struct vm_area_struct **prev, unsigned long start,
> >   				   unsigned long end, void *arg))
> >   {
> > +	struct vm_area_struct *prev = NULL;
> >   	struct vm_area_struct *vma;
> > -	struct vm_area_struct *prev;
> > -	unsigned long tmp;
> >   	int unmapped_error = 0;
> > +	unsigned long tmp;
> >   	int error;
> >   	/*
>
>
> --
> Cheers,
>
> David / dhildenb
>
