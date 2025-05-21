Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465E62AF1E;
	Wed, 21 May 2025 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747845612; cv=fail; b=pBHcz305qoyGIsvL4sLhqOL+2puub9ZH1Uyangsl2cl2i9RpeLOrl1bo/lOYp94D77+PHpPwr/hAZ1GQd0KGauNrf5676xbLGzZx0ljWpwttRFBOoUBmYuJiMCOB1/IsMjl39Mz+S/tL+3l4neCnux8UjlCJEPaf/nzvkkItLjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747845612; c=relaxed/simple;
	bh=ZjG7CEy17d36Wm+iptq/yAitDlyV7lmw5U2nh8s0aA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jfA+lMRp3I59SLqVDrcvFvJxi/EtDQ7ywsQ9DVP/5oXcO7wj2sS6Mu0IrkWlTRpyvHD5DCVl1lgvtamiJeEKER6vugrMc6NRFxYwRsH0sj9/Xu6T9FKVkhjTAaEkW7hmnAbTix/RBEjqlruLbBNqdje6cjXItlsyF3oLvOwQn60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a+3tNbjV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RJf03Nfr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a+3tNbjV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RJf03Nfr"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LGZ6AU026708;
	Wed, 21 May 2025 16:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=auhF6X6stmgzIsS+qh
	fxDWqMn5ab/PY6M2VQX5Ip/9w=; b=a+3tNbjV0kt8tg6XZgi1u4oTLog+FoEBQ9
	9ceQZkW4Gs0eYWUA7D9+6CcG3xbikXB8UdqV7H0kpa0cOpYcCe6Emnii/xy2rjp7
	uVciOxZypkwGauXkIFLI3cuSVJekMDzZlIQ0IBDR6+jZm3t6NLV2ufpsKn+ZGwsp
	QqEZJ3xesdxC75AY6cqzs21wzKL+upF99o78EcdXNXqz5L6yZlsNYGv/oy9C3B12
	ek8Qxy0ughW7ascfncebhDP+Xbvks80MpdRcAFM/5E8K+M2I0nk8aOpdDDI+DtA5
	BwB5u2Db6ZDCdqJyxUefbNPvvBmtayh3Mo5smYBQ52o9kz6IbIzw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46sj6fg2ce-16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 16:39:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54LFJUdm034530;
	Wed, 21 May 2025 16:37:21 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rweq3758-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 16:37:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRRbBX25zMfeV7zcVJD0bMK9u8D1w+KWc/t6RWX3dVax/Gy66x3uubfs3fivu7Eu0hD5wGFPLbhWdGZQ1AeXmCkC0IpvFQzz1IF1neKDJla8VeERoxbohRhOBtWQqreabECIIYUINHVDNnp6SqtKWv9OWjSVHEH1ORg53IsrZmOwbBctQ+laveklXkun5ZB2gta7Qq8xLAk52n9nTW2M3byXWxuUobko33gVxmJNyVCXW/+S+7sEnRvlQNNJtdiYbuEdadqc5v0lGKfm3/emcnWAQLt3TYPPRQ7VP9HlXGP6OKx6mtfdzi0exVdJ3/AwBdYFS6x0wEghD0ioK/7VJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auhF6X6stmgzIsS+qhfxDWqMn5ab/PY6M2VQX5Ip/9w=;
 b=RIRkENU5NPUdD+fRjcV/DV01Ao+3EEhqptwgG4B4Ka4bqam21bTUWTyUUEZBM5PPFLlK3FmKO59TBUqDRUkzraAQcdijpu62ZLodbks7Jm+UTi4sZtsIBQ/4mBoXi0SK8li/mxX0egeDqVX8OunFXTZulq2gfKyHTIjT1eUVyTVBf6jrYtA8BJ92wk0rpdvcJmWFXE4CJUnoBgIR1CI/Rs0N2XuaQlVnPWgerTAFH8egeMy/FQL0Yhsfz/Sn7Cd6rCL2cpWaMd80ogwO6dYoiSJZ/P2Kt7JWQErDjV/7pwcXTrfCGV4b1ZhwNhhM1UCLUGEpAwU1uvw0Bn6DFVtSCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auhF6X6stmgzIsS+qhfxDWqMn5ab/PY6M2VQX5Ip/9w=;
 b=RJf03NfrSf5076Qzc8xCxKkmvirjlctc1OJHO0ICLNMeV2g7Oqhi4Ffxx6Ij9U+zdG6qvVDvhJzZqWUdFoWg7Ej/Xmtm4NR94ThH7IEJ0IErMk+c/vhdxBZTvXa7TsOZWkwbTmc4H99XXFAOkVA8GXvAqJeDLLxtvNitLVubxYY=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by BN0PR10MB4839.namprd10.prod.outlook.com (2603:10b6:408:126::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 16:37:19 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 16:37:19 +0000
Date: Wed, 21 May 2025 12:37:14 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz,
        jannh@google.com, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH v3 0/7] prctl: introduce PR_SET/GET_THP_POLICY
Message-ID: <ass5hz6l26jc6xhbtybmgdjf55hmb3v4vvhrxhqampv6ohl67u@qi6iacwzwfk5>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Usama Arif <usamaarif642@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, david@redhat.com, 
	linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com, 
	ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz, 
	jannh@google.com, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
 <p3lc5tuzpblwtikfodj5d5wjbpklqwg6oexn4xw3cdwspqwkmy@l7vhj72rjgsb>
 <f7f54cd8-cc60-44ad-aab1-c1c082ed70f1@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7f54cd8-cc60-44ad-aab1-c1c082ed70f1@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::13) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|BN0PR10MB4839:EE_
X-MS-Office365-Filtering-Correlation-Id: 52960015-a023-4395-95f6-08dd9885c0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yfi0lhXGEdCJm0z+YKNCdkU4jqGa34b3/p4UC0ppYpU03WSSR/jU22JJrhfK?=
 =?us-ascii?Q?NYCSxlPtjNGolnYJEOd3+szU1ZcTpuTunXZx9AvpcAIDoHWd3c1jhf1jHbm0?=
 =?us-ascii?Q?kFXuB0QPg5998YOfd+smq3ly98DLqzHCzxiBPaEUCkM2BDzQ1HxewVFVFNJK?=
 =?us-ascii?Q?A4mpfTL/IYEBT4UvsonFdZGDwY4Qv8uHDFvfp7E0Vc1MvGCbGhqHo18hvGn2?=
 =?us-ascii?Q?l4KRla8nKi6xXHit4FQ1zcCrLGxvE+fPsM0HSrwT/kDW9B6rMzQrjPOXn1h/?=
 =?us-ascii?Q?UAhypMS8JaOiln/dJw3IEGCALmrp1aZUUY5aishsaxJUQIOtV15XqpORpk/o?=
 =?us-ascii?Q?GdkVgKDh/vVYtR/JwqmNW8k4qCefHMUQDNsd79+E5DcMASZ193Pun/gTypVf?=
 =?us-ascii?Q?EW67nxHfDUgexzeO8xbPD9FzIjr+lVSE+k+sLuzyHwmY8QUfZv2TcdF/84yy?=
 =?us-ascii?Q?YJpBfTTL/eUjgmGyR96GJQbguwXj00CuPvUus5yx756XK9+H9WIekaCKoR6L?=
 =?us-ascii?Q?CX/aQAL4jTSXfDdBLmf+HjnC7lxgMtETUqRGnjZ/TkcS28t48crYc7H6Ff5k?=
 =?us-ascii?Q?MHNQ3+dHbnWvpTCS3QRU7hTwjVClTPPDG3gD9HPFQvO4SdecdJ4F+jCPTt16?=
 =?us-ascii?Q?ruJiVgHCLTpWs2haiVyBIjcDGOoMKWx4/DpVG9TgJbJl8u8PfiNanW+UoTvz?=
 =?us-ascii?Q?taBrDdIKVEMgNUR6+mxvhqBU+Ma/g4tWyd4DEsV9yGQm3DBdjMRZtQeGGfD8?=
 =?us-ascii?Q?rJ2Vf+vWPXf1K4WWRHCdQ1fhQHERH7NuLg1CXnVxqPq3Wk7nscO4Zhb318wm?=
 =?us-ascii?Q?p32peXx/62utzFOJbEBOWacAhoU/gFdbTkimLiL2k8Vin/rieM5JiHOlwEWk?=
 =?us-ascii?Q?QKCnO5msHwB2zVtj42ivtOK/Q3GO4kAyJDZhNNMouPcgByr6P1CvT1gkmlYC?=
 =?us-ascii?Q?CbH4sfI5cXEEdlgsmIErCg63iEeUcsSW1BuN3tPguDdKEHZwioryd8/FFzN4?=
 =?us-ascii?Q?hgCgDhrf9h6lHLmUd/C9bSFJldkCOOWPTirKj4GYdJk+d9J5xnxsOIfLwxft?=
 =?us-ascii?Q?k+Y3nVAX+u2UudYxuL9GrBUqHMbcxWtzhLOML6Y3vrHnswCToaS4apZlmqJu?=
 =?us-ascii?Q?bOFSvjGUOPSJp+p+1+U/hjB6F+ULfHYwK2awojDlugdQdbXzpBpgxCqaFnmI?=
 =?us-ascii?Q?3BBKKxEbAFDXJUhRRe7iMZCkE9qhsPK1+uez7hMWbLiLuaEIj/HHQENPCi0T?=
 =?us-ascii?Q?hmUNN5+QxBmnunrRy2n8xrAopXfznfFuJWCnLKMzDsxeKhDDVSGp6BpROFOD?=
 =?us-ascii?Q?ZRwqGg8PjgAoM5YeitmAp1jW8nc3a2C8DT2BesVJhRfnwvlRon823IHFjoRc?=
 =?us-ascii?Q?DbAlya1Hx+WQ37ErdVgCe4ZK/OSc7j6Xq++8lueZC04CfCVuHstByvMJXRFN?=
 =?us-ascii?Q?5FAEVC1gKw8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a5YEZaGLVlM3y7/HWXn8FZ+6LX98X2Bs+OjgIxaORgTWc7ERqGO1pwsCMf3C?=
 =?us-ascii?Q?bwWI+vnLjheW4ViEW7v0+g6n48PI9BkBhUYPNG0TrYLFsn0+/chLBZlWQFpn?=
 =?us-ascii?Q?HT6kgx/O+rGXc2mtZcEGdIA5cZi+XwwYmQ6mPaMOvDAX3Anv4ZZ55lEdYtG4?=
 =?us-ascii?Q?s8mxIfiZcCtW1B0K4yw7x+crNAsvFAEYMvxEVQrwwWDqd519vFMNosSf+T1h?=
 =?us-ascii?Q?CSatIkl6DGMt+xMuEzo34jWdPlyAlAInHqzF3G7y0Y1KC9lKEjQiKSgaOexY?=
 =?us-ascii?Q?HxEcuPkcQ2I/mklJP+LL6xawQ1oIqYdVRBzVVF39+PBQvGsiMSHpJquRhOKU?=
 =?us-ascii?Q?Dxo82TuLOb6MyycSg7D5ykDGvRf1fmxhWPZAcCzexUsDfI03QLLqm0vurK8q?=
 =?us-ascii?Q?8FPaIcT0Br9vAtDOQgIvnSIB1XXmkrM9FUrRXPfTbh74t53dDoukMfoXENXn?=
 =?us-ascii?Q?Rr/iSe/iwg3TcXCiKxpvQ9+FSuywn5ALDRR3GrS36dkFUaJboO90AMOo6rgD?=
 =?us-ascii?Q?IbOSySxtpNxJlsRd2vQZqQXYoqSdiZ6fCTRqiS3Mmr9E8qsaDwHSWiNWA7Ur?=
 =?us-ascii?Q?I9fsxi1ZQAqVO1dTlbw0NfPjWt1hNMLiP9vpOQZCsGw/zHxFUI9ZLJLWaFn6?=
 =?us-ascii?Q?G9ZnSFin9UHWyAbbJHbJY5QGo6qh+Bf3ui1N8pdE/PMCryF7BdOmhLOII6Qa?=
 =?us-ascii?Q?nqTiqLTNDCy1CNlLpRyrFKr1g8ZPOdPLvj/HBSfYBFhGYkQ1OH7UB0f4exxS?=
 =?us-ascii?Q?QXhLB2H0VmZGH9gSh1yhCLT940eCc2+AvqF3DqhEeJ4pJBQFce8AVVtpbLki?=
 =?us-ascii?Q?OMjB7q1UU2VgnK6NPaqnNldSnKjptyquxFPMxw3wtpTWLDS73sbQjIVflco5?=
 =?us-ascii?Q?k2l4DqgUKi/mdK05KauUpfd/MZkl6db8v23k0DuBFOoaw3OV/M0P9iS4wzKF?=
 =?us-ascii?Q?Q2t8T4ZYW8ULji4n2S0vhCljXBkHWyrZhVl+u5gFqpSGYBtiQtT94Ktem2j5?=
 =?us-ascii?Q?x2AuSeZc3yx7T1crjriw1S5os1OOZCBz5YWt1QJHV8zEfDeL3KuzztSfN8ob?=
 =?us-ascii?Q?HU9qNyMzTyVMNF/a8aLzS5C971uLZC4ZIRACKE2zwr8buIFZ/H4/xHAOYeFe?=
 =?us-ascii?Q?pjabkH2cg5/SOCnnM1YmN+WZWuE2WyTe1ZikoVuSp/lPrcOnXLqWkvuzzUOO?=
 =?us-ascii?Q?ALRc2Yqa/BPNMIUVB3Duu77gWVXUyOsv0a8g3Gp0DSqjR7zlSEXCWYZGXiS+?=
 =?us-ascii?Q?GVIlibEN+HfetDFIy7b5lD+VFh8c1lCA31XGHK6lZ5j+7u6ALKYXn+5lBooI?=
 =?us-ascii?Q?wdPem1HLjCozKlWLXzkY6BaKfmvvc9Ws/onuP9MAOD06cbJcNOpKUKeWV28z?=
 =?us-ascii?Q?hhC3sX85224Cw808ByEvn92puN20EjvFC90QffrDwY8uHz1xkJlArPp5txUA?=
 =?us-ascii?Q?LyBrmp2vZecHJ8g9X1FWVCA/44SK08x5D60bl6VW2aALhpZv0QXvLq/NSh9b?=
 =?us-ascii?Q?GucC7IqH1ikR9lcT0859t0biIDUOA48WvrZWqiNYoVxbKGU6ZoHUfviCuf+P?=
 =?us-ascii?Q?TxO0wApi4mmFKJQUcXLzYN/i8eZLXUc6lkPgbm2X?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b5D2a6xhhDoI1127mkYJKe1uJuuJGZde8QQs57zkFmXYYEZVuAikGCSwS7bNcYkZhrrNm5mihkQz0AFkjieYKX6p1FDLToFNdfMy5MqblTyQGybf7UytWigtB1UQRXwIiPuyoFv+PLFNCnTlY+rI9I3w1cYftHIAUNpTokhorFSe3AGNPWcr/wIxvDVGx+vPuo8o2+Q13Ds28Esj7+2H9tItGO1s6tqqQof+o0LWIqKiQhc13r7LxRn1uFg9aCUl8eP47eD7h4iz4kpXClJS/ZaqLah7XYAmFPvKKoZ3irv+wCtKgtn40GdaLq54ummrDHfcgncC77UFPpOJbd/ih74PC+5SwkFr4KtOoonOrYrieKEDxyUUNTp1qYhvUTZFvFxB0XufIEeYiFwGT9jvN1ukvaAXeDgC4tfcAYpx8uFtVSi44OV325xFI90TeSaKWu66L5lTncOd9awrMEj9c3teMs7Y0OcFl9xX+CFOJyOubze0+oXmmLm9xnXiBrJrDxGc239gprivC8O2lHoxT9r+L9pOqKtpNuJhnIerguqfhOdJMpg6dJduDFfY0O1VvWxCDD9XslOAzGWUxxno5kObOLU7Q8l9UoTFlPIoxoQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52960015-a023-4395-95f6-08dd9885c0b2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 16:37:19.0314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dygqaMseqzwGr/SYM9TwHnjjVKw0Tbahj92CngGXi5zil0iQfn4ksQoEVHk0Jid/+YIvzg+VPSs/U/AXIrbhQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4839
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505210163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2MyBTYWx0ZWRfX/QlOyEKqVP7c wT6jWycIyTOBX9W5s0awbN5CkqYgIu52yWaCfLmobDuNThKd7/aBIyRcC/z6OMVA2AkxA7DIzEq Pian553LPNEOJValuQARoiuJpTBSIDfxRhDdvU3GT2VgQSQeT26ofiZajI+9eg+mICL2Wdcg0p8
 OyskxDiqqygQsp6Pw4qu/mvEizQE78PjbCcHEq5niLxycC9r4wxzZQo2yppe35w0SFvGbavKtN6 BLtBwYp0JeYh7MaQDxXnPs0FInclm+Ttj0p13uQrdiGwChdOgNSJmd7tyAj+xt5jcz486iO6Xu3 GgXzDTMgabGWjgC5UIVgVgzKJ/5VRm2hUeyY7uotKRwSOQ2bGZCEKYt/YuXbEbpBdFbzdQjej8y
 yO/sHHCrOmAlgxqu552yGMAi5qYzHe/iV5r1kBp/foLoiPNX0Y5hVJy8KZ7/jVvGZ6kjzwrJ
X-Proofpoint-ORIG-GUID: _kckZ-nGuuMn0knBYLLzInvAlC8TbCDF
X-Authority-Analysis: v=2.4 cv=Y5H4sgeN c=1 sm=1 tr=0 ts=682e01c6 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=WCdTcLu4AuRS5FSS4aEA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: _kckZ-nGuuMn0knBYLLzInvAlC8TbCDF

* Usama Arif <usamaarif642@gmail.com> [250521 05:31]:
> 
> 
> On 21/05/2025 03:33, Liam R. Howlett wrote:
> > * Usama Arif <usamaarif642@gmail.com> [250519 18:34]:
> >> This series allows to change the THP policy of a process, according to the
> >> value set in arg2, all of which will be inherited during fork+exec:
> >> - PR_DEFAULT_MADV_HUGEPAGE: This will set VM_HUGEPAGE and clear VM_NOHUGEPAGE
> >>   for the default VMA flags. It will also iterate through every VMA in the
> >>   process and call hugepage_madvise on it, with MADV_HUGEPAGE policy.
> >>   This effectively allows setting MADV_HUGEPAGE on the entire process.
> >>   In an environment where different types of workloads are run on the
> >>   same machine, this will allow workloads that benefit from always having
> >>   hugepages to do so, without regressing those that don't.
> >> - PR_DEFAULT_MADV_NOHUGEPAGE: This will set VM_NOHUGEPAGE and clear VM_HUGEPAGE
> >>   for the default VMA flags. It will also iterate through every VMA in the
> >>   process and call hugepage_madvise on it, with MADV_NOHUGEPAGE policy.
> >>   This effectively allows setting MADV_NOHUGEPAGE on the entire process.
> >>   In an environment where different types of workloads are run on the
> >>   same machine,this will allow workloads that benefit from having
> >>   hugepages on an madvise basis only to do so, without regressing those
> >>   that benefit from having hugepages always.
> >> - PR_THP_POLICY_SYSTEM: This will reset (clear) both VM_HUGEPAGE and
> >>   VM_NOHUGEPAGE process for the default flags.
> >>
> > 
> > Subject seems outdated now?  PR_DEFAULT_ vs PR_SET/GET_THP ?
> 
> No its not.
> 
> prctl takes 5 args, the first 2 are relevant here.
> 
> The first arg is to decide the op. This series introduces 2 ops. PR_SET_THP_POLICY
> and PR_GET_THP_POLICY to set and get the policy. This is the subject.
> 
> The 2nd arg describes the policies: PR_DEFAULT_MADV_HUGEPAGE, PR_DEFAULT_MADV_NOHUGEPAGE
> and PR_THP_POLICY_SYSTEM.
> 
> The subject is correct.

Thanks, that makes sense.  You are adding an entire new configuration
item to the prctl fun.

> 
> > 
> > On that note, doesn't it make sense to change the default mm flag under
> > PR_SET_MM?  PR_SET_MM_FLAG maybe?
> 
> I don't think thats the right approach. PR_SET_MM is used to modify kernel
> memory map descriptor fields. Thats not what we are doing here.

Fair enough, you are changing the memory map default flags for vmas.

So we are going to add another top level THP specific prctl that changes
flags, but now def_flags and that's communicated by the word POLICY.

I'm not sure this is the right approach either.

Thanks,
Liam
