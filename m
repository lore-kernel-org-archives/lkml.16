Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB0B8634F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927168; cv=fail; b=Xa3TKalckqYpJWKuMnJWB7AkQaS8//B73HqVXW9mhM+Qpm7DkQ3wU1gqlCzX5s4iA8c9ZEboRhiRD9NraKywrzvywfimrrhEKpGmHLKCad6M9uPtvEJAbM3XAIch8Uwu1isZai1KbGwfKknPobXgxJGXSWrdMcBou59UEfL2dWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927168; c=relaxed/simple;
	bh=Ql8wyoY4sib7U/fcZXxQv6qLc0qnoRzcJ/yxUPL4y8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YEsr3SLHRFRG8Y2xD97ZuSdDCGRXhkViI8I57TLaNDVEvyFrt3IH+T4WjfDqd6PNXICH+hHqbDAufriTRsFNpIJdBAvUANXIS+l/5pfsaaA5v7tEzZyjAAu8EY+y7g0NFO7XYknRvADKr06rVZT+lr+RvzPG8Ffyc1Us06Sdhdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GFKc2fN4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qfng1gBp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GFKc2fN4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qfng1gBp"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MEtr8f028800;
	Thu, 22 May 2025 15:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=iP5HR2KSOr/97ZthcJ
	wNgn0CBALaQK9C0UWmePBeUMA=; b=GFKc2fN4O5/xYvZEpRYD2pypsDKbLNVknp
	vXXNFAoKjEA8aGpmGXVBtg9g/n8DJly88bTyn9hke6DsdraHN+MOQpLf/5QeM2WU
	JanZ9SOHpp/Gr+sl1DkHnpmV3wxxfsD0zxoNNb9bRNUdGG/2rcFfVci0U2lBLhd5
	EhjzzyTpLeRvr05aoWjbBJnPduyqj/Rgyo3gnTVZgZFCqxSprBAzUDpzOtbzFVp9
	PYVLr8/5+gXdchvNcpReLnX//DG+avX/VGgXgP4qJF+v7NpJcSoWnhBRT7Qe6Fbx
	pgYc42hkrNbVItFQg0xEZP9QHBPqiprMurpsmZ24TXLeHMR1A/7g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t4ck8dr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 15:18:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MEHQN7033511;
	Thu, 22 May 2025 15:18:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rwepsved-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 15:18:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBU3wKS5lKQYRbmEoYB+r7x8a2p8apWBSDjkR96lhEu0rVHA2zGmlLxQUjSiBqkcbUGDO501J74aZOx1WqVGHXnqLbO6zgyfYW+a3C+5qeip2rEcXC20ufFa/1d5PPO/EpU2VgoAQMAyramHVkucs85L3MHdDjUeUC22OGJuDqcMyQQday8/adzO6gUpIIx4ED9okyZEDQ0P0g47svpdeluGgrfmMzBickTT8BXvAZqOn6lAFpdiSLFqrILUttXNboTTiAvJvNwEbuHX8e2aWQotWjfsPYQFlGYW0Jols00mBZzUYwVThVs9+PyNOhaGV+PsRlDebe7/cnXVmFbZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iP5HR2KSOr/97ZthcJwNgn0CBALaQK9C0UWmePBeUMA=;
 b=irb2Ls8kTdGVKK6LV7RmU4o/ZuRpEz9nufGHo9tF4CTyUpJhTnV4Nt4ZmO3ShBpL/gfM0/K+M2Dq4wIWGGmoJLVcrOEZTbLRrGxbvLBqKNEvCPkVaXAt7yRMZSIAxsrrdUkUOv7Anx6bxxqsVvi9G3hUjPT/tNHx4xf68GQHbqYf4X1cXb9hyAF5j4xLfevMfXACLJmDqueI/FlL142mV1Gd9KLXOYk039SIT9WWWsZlNn7qYrNepCMFmyk7EE4TXpYRhAh3TmR9RELDAmXIN2sqoiGktOWyKJDCNk52O9+KwaMKMJz9AnImP2es8rVuuzWzGmMTqaoyxeTJWaAPNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iP5HR2KSOr/97ZthcJwNgn0CBALaQK9C0UWmePBeUMA=;
 b=qfng1gBprZi/LXOxbYNMThWKmcEnmcIjJfVVsE3CrQvL3A/J36uKYX6ggZZozNwC0tftS9vzOfdXKdO8+jqzn4FosJqHGz6wxdAEsaT/C8zQ0PI19H8+cYzfoNl14TdgnMYljsBayX3ZaDveA0KGP0NuzoPFZ+uQYioDQxO/REA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB4852.namprd10.prod.outlook.com (2603:10b6:208:30f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 15:18:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 15:18:45 +0000
Date: Thu, 22 May 2025 16:18:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
        akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, pulehui@huawei.com
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Message-ID: <77f9aac4-da7e-4a86-8e7f-685f4ceec270@lucifer.local>
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <a55fd3c0-cd53-43d9-a200-290d64dcf04f@lucifer.local>
 <d0b9208e-755f-46f5-928d-77b7e120d74e@huaweicloud.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0b9208e-755f-46f5-928d-77b7e120d74e@huaweicloud.com>
X-ClientProxiedBy: LO6P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c13a04c-b95c-4199-a4cb-08dd9943f198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sgSOI4c9DBoiYMBarBTTVMGCMcsGl/4UL21+nBxtaZ7Vc4M0XgxcVsbTQm+P?=
 =?us-ascii?Q?b4Yc45Dkq5IEOLl4kfguMx1scFHhvYxazjSnYXH4tjiCnRBwREFw4OkNgo5E?=
 =?us-ascii?Q?iSvJu+477vvUIqMwFDURqyqOtYgs9BWpw+VsqI7f4Cj9PjQeRK1Lvj9HdC7L?=
 =?us-ascii?Q?drAAD1mRy+V+GH0lWIPwoFAGPA2UYgjtcBYVA8nDxveH65r0I0az19eTbkMl?=
 =?us-ascii?Q?VdJRORkm8RTjMKWCs6lFNqB15iETEBRaio9tY6g+o9WPkGVlFmVciw1MNXi2?=
 =?us-ascii?Q?pVtm168VQUxzNVUAqckcuD8AyXKLts1vqS271xi7xS5ruZUaixsi/VDAIL30?=
 =?us-ascii?Q?GfjrzFF7sBJk9CF+Q4Etxi8mTQedNZ0rTpBWE7U4Pbd3otX2JOPWeFiL1K5a?=
 =?us-ascii?Q?y0A9+a8CqOrDzYdM3oCiueM3SBVQo2sQfjaPrP0k+Mlc3hDJ8Kxyk6X10KdG?=
 =?us-ascii?Q?zF5y/7l3oss2vu5PoTLqOTKgBaJKdgzOaQB86jqGYTc0uFWP3lXC8DtGkcLD?=
 =?us-ascii?Q?g1zQd9aOjPJJje3kipBKJ/C/+kqLfA1y5gJtBYNoyXVH0d8GNT4TGhJJfBVI?=
 =?us-ascii?Q?rFY6v6u96j3QU0eRVAqk1s7a8O1rUXeN0Gh01n9ddiHV8uTePWnmFZ874v23?=
 =?us-ascii?Q?HKOOS81kCKGf09qYwsQbyDJcOegEqT21ir8RErkxnKmS98hwgghlm1SNZZEc?=
 =?us-ascii?Q?rcMfFZIQzQMyVOEu3MZ551lDR15dEqHMPyNhoCZJBoxOAsvEaVA185ie2TaG?=
 =?us-ascii?Q?aT9iVlgopMcvINZ4W74lWiTw3mPsazo+Ab//ewHXVhRqnYN3iItdABMbBXRO?=
 =?us-ascii?Q?04ycIs+brU3QfBZI/CODYj5T1+V29RJ6DHSXFw9rd/R52VABGbEt7ODhnR78?=
 =?us-ascii?Q?SRElfaeW3sNoRfwuoSdg16lQA2o9egi4wjKRP45F1MP26zgbY9nYHP4LtNav?=
 =?us-ascii?Q?JrwercVmtmaQZrRPw320+QW0eLRpYgg1FgOhdwErSi3CQOH2xAUJpJPMyvQo?=
 =?us-ascii?Q?Jjr2BL7NFV0Fv+FuTgavVRwD1/ozfQWMjXrkRqLVI7E/GMVsWNr/+fePil2V?=
 =?us-ascii?Q?yU6UfffwbBt3X1NCocCKkamKrgKZ41pAEOZQGhRoBrjydd6GjVgThxd5WEWA?=
 =?us-ascii?Q?JGd7go/FB1FdoJc6Ida4z9xwwrQ+x4WI/Ln5UwLMhf82PnUnBJc8wlwX5FAO?=
 =?us-ascii?Q?7k5mWTPr1CzLzvEmL8UML63w5WBOHeHpLWDwt+C14tVLUyyDVEZSH1dog9aK?=
 =?us-ascii?Q?Lok7cKfFhZhVrVurCsMfCSzmPE1H3paiY2beZdwKsP8kLUUg17St4iUKF9n4?=
 =?us-ascii?Q?sR7//dOI/IDQheLxGjwczFsFn7pc7m9qalkmZt20yWSRkqE0t+83zdROxVPN?=
 =?us-ascii?Q?teMXTBkHGm/AUHBrtJAgr6YrcRy3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pVT8uw4B3Pj0ZuESciMnhxlBljQINZ6vmeZmT4f063MxutdfrOBmHG/AJTAR?=
 =?us-ascii?Q?n8ci3jV8mpgI63JdeJR4upsexw2/v6eOlsWUDljWDmcRltTO9C7INvHpVGXV?=
 =?us-ascii?Q?0no8AE0qk8ptDc43u8EBjOM9Ldly2qPH31cDDOPFP3tCFXqX4wVeES6YfONe?=
 =?us-ascii?Q?5gTMwrz9tEaNGXVht7eBtkYz9Q5crDHwHszj0WKfoWSpaag+SWB/eoEEXkNM?=
 =?us-ascii?Q?BlwU22heA4wFeJ+qW/1SwlWIdsPiV+Gq8AxkaopBBVupU/fgageE0DpIBgqW?=
 =?us-ascii?Q?U2OK6QpuiHScwSx7QizJvq+ordWFf/ww+RZO2NtIZ9wB2CueG6F22ViU32Yi?=
 =?us-ascii?Q?A5+fhCYCP5ff9KCFrn/BH+F4atpF0KWhD7wESquiU5IpTTC5QAAtr+O7aDMK?=
 =?us-ascii?Q?Ujsghbrjp/hRLY6QMNBtW8MT5v1b5E1EwM2B7Z83XE/h6S4NoP5gGR39QNJB?=
 =?us-ascii?Q?D3huYtRu2wEyIZl7Ge5m40FnqoW+MiDvbx5cz++CLRlx4kJqG5nvvPMD2Gjv?=
 =?us-ascii?Q?xK+JTg1aRZiHaYBNqUI0qAkjhBYKTq6g31dYVzgRZeZPAS8k1LjNzZSCRxV0?=
 =?us-ascii?Q?LV0vSrUzWf5R4COVhd+/Q7gF5pVusYWv+1WrbjAMXAOzEgBqaRKEjbfqtePp?=
 =?us-ascii?Q?uqJar5OuK8g16FgiV+1IVRpHFHdELH4DKLCvPd7x8/T66RKTi2tvkAGKfxZC?=
 =?us-ascii?Q?whsZbT/BHO60GNTFt84peTXBLZajLLEN7698j1ap7IhWDUKeZOOKladXRxtz?=
 =?us-ascii?Q?qfMpLSCppf48uTG1OtjrlZGzr+hrjnOha0U1hFJf8ti60eNiBnNgwImx8cWC?=
 =?us-ascii?Q?2iCZHXYf65l7fZMvVqevn12AT/5AdCDDtYiLUtMbPysLq0VqshQp9nnRypi5?=
 =?us-ascii?Q?r5jUUzqtVEiIkLdEgpv0RTe6MhxqSNkwoSo6JD3PTzwM39eogbs8gkeIbO7j?=
 =?us-ascii?Q?lo26Qg47nCgvH+6CFE75qthp2058fdBAg3kjHxbU9WBjaOlzdep5z8Asdfmr?=
 =?us-ascii?Q?g/0IbHfAsFRCPggMmrnvFyWvw+cyw1rU/2VwSjZn8V7gRXR2JCZRBpQqCEEs?=
 =?us-ascii?Q?YBUb5p7Bk0MjGwXK8vWTw35hRvbEOXzj73I2E/23Nn+8QOj7Kinj9J4oibx9?=
 =?us-ascii?Q?dmcgKskzTA7japz8XZqWskxQV3JAlbMJzymp6bdp+FF1kL927QTf0THtakDO?=
 =?us-ascii?Q?VnGvbocduJjoHm0J/sDCu1hE3WMzQ2lSr4nKtl60tgDP8iirxxJLznW1QkHW?=
 =?us-ascii?Q?H3s97mTNy0vri12It4rEZGEB6Q7WJOLeouTSztfhXV21EYGv+8QjTAXECwg2?=
 =?us-ascii?Q?GWvXWrlwraOvFu2hd7izJoGQ52GwxcaaNQ8u4I/oXVWSpUm0J36n4pL9kiYz?=
 =?us-ascii?Q?Gmv0H4OFnDbEaKw2rTLXIjNSP5VrOTz9QWjsP8xJ6GTqoEsMfXkEmcbxyJAe?=
 =?us-ascii?Q?0T4k/kFqpA018AdAnjbhlwPScOroIN12/1OtkCPQjCNjVKzw2uLIsfsfENbF?=
 =?us-ascii?Q?joxK8USgodpG+nu2PBvMX1h8eG3snJPkDvcN+b6Ut1EJNNgZ0Zxr/IJFNman?=
 =?us-ascii?Q?g3JZf4lXJm+wSCcgIN1twvw9svFgU62agCvEyKkayPsY+bfaF6UoUG8W3Ovc?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wx8qFb81jRjYiZOejIvwinOYdfg+is6d3OFryMX6YaKr/zGCfRTGmKxNn6OrwuaVIBeg400O/IxGnJf97cXOpNtLD0wJYP/NTXaZvYQRCABJALoCCODcZcnXIZIcoozGcfAgpWs6P3SoiF0ATOZIUwLd3/f2Tvj1nDxm/yTD2qWZlNenp/o9kGlCi4hh4tnMgzecj6gsXsrm+P20X1gjEGDg7HaFfkX2uiXLZIxeIu6BIbNzcKUfiJO8S/AE7Ti3cNQq3QWnDVPHesIplR+X0Lpr2EC+AUYT5A+fa0fZtOkK/73ep6h4YCiTiDn5ng8/SsbJV1AZ9ahejJIsYTqkOCWsc+XxXpXP4HRwZMGTPYMka+nsSYcin3Y2onxcNUP+qo0gUiAquOCwEv3Kbvp7IMs4ZgA4Ab+40ECRSLGbPsfto3+RUNJV09R6MpTDcYRlEbyQ8VFSiSvynPohwmYizhtZMFYne4p3oSXxOBGzceT7gnbKfm/zYKyTGTCTVe5sGEN/Ks4YCjMJ/eAg+p93kYmstGg89VN/o6RgINtOW2AgApSUDasNAgflbCP3RraHIjZcwpg+aHhszCt+MO4gymXIEpZAPRj4YInSY+2GPIQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c13a04c-b95c-4199-a4cb-08dd9943f198
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 15:18:45.2696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4/U+3nB/fIAn0IltTGzZDRU70dS5aV1j22nIY4AqnbwKM3+bmxrxVKIQrNHxsfOw/HrczgMq2h9OtVx3F86e4sWgoSP2/oXtKP5V0eoChg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4852
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220155
X-Authority-Analysis: v=2.4 cv=HvJ2G1TS c=1 sm=1 tr=0 ts=682f4059 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=i0EeH86SAAAA:8 a=JC15_Z-jydJvKT-ON1QA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: HHaW1i_x5jLOGd3FJWojmc9UIpVm-9M6
X-Proofpoint-ORIG-GUID: HHaW1i_x5jLOGd3FJWojmc9UIpVm-9M6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1NiBTYWx0ZWRfX9vfrcpUEmbyw mM90st/OwvHziAFvPvJJSxU/muCiF2HB964P2SJXDVyM40XpqfqbsmHEpbISc3ScozP0nEudTlw n45ZeCWe3TrCbopZTn+1ucOBBUZPGwrx9aT0hCl/Av7c2UsZJDvvFJXf0a1aEkO1daNkjoeJ+qx
 /hMyouy+o6gvdgZsuXP0lxL1Z3siXdvx26eRPQn5SzdPDBHNA8M5A56M1g44iXxMjgui2H4OzmL ZnbdhOY217LgpvcglHqlcKk6etgnJdPobPrGWPWHGvPuRk4lHjKlg2PYgZwZAAs917Ry6vovwkL egQyAJRYwx+C6Juh+ktiDJIZIKo4YhNxu0Wub7fBTN3+2VS6NSfN51+TGmVbY1XupG+KwqTkQAp
 9pqfwdLTXbVdnXF38Rfuw7MW1RrzhT65gehkb2zkQsdWMY/jueCqOuP8mLCE2BpjpTk1EtDj

On Thu, May 22, 2025 at 11:00:30PM +0800, Pu Lehui wrote:
>
> On 2025/5/21 21:13, Lorenzo Stoakes wrote:
> > Overall need to dig into this a bit before we come up with a final fix.
> >
> > Has this _always_ been the case? Or could you bisect this to a particular kernel
> > commit?
> >
> > If you haven't dug into that, could you do so?
>
> Thanks for your review. The directly related commit is 78a320542e6c
> ("uprobes: Change valid_vma() to demand VM_MAYEXEC rather than VM_EXEC") #
> v3.7-rc3, but in fact, I think the issue was introduced in the original
> commit 2b1444983508 ("uprobes, mm, x86: Add the ability to install and
> remove uprobes breakpoints") # v3.5-rc1. This issue is quite old, but the
> mremap code differs a lot between linux versions. Perhaps we need to fix it
> in multiple versions separately.

I can handle the backports as I'm best placed to figure this out due to being
the one to radically change the mremap code :P I'd rather do things optimally
for each revision, and just take the back port pain.

>
> >
> > Thanks!
> >
> > On Wed, May 21, 2025 at 09:25:03AM +0000, Pu Lehui wrote:
> > > From: Pu Lehui <pulehui@huawei.com>
> > >
> > > We encountered a BUG alert triggered by Syzkaller as follows:
> > >     BUG: Bad rss-counter state mm:00000000b4a60fca type:MM_ANONPAGES val:1
> > >
> > > And we can reproduce it with the following steps:
> > > 1. register uprobe on file at zero offset
> > > 2. mmap the file at zero offset:
> > >     addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
> > > 3. mremap part of vma1 to new vma2:
> > >     addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
> > > 4. mremap back to orig addr1:
> > >     mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
> > >
> > > In the step 3, the vma1 range [addr1, addr1 + 4096] will be remap to new
> > > vma2 with range [addr2, addr2 + 8192], and remap uprobe anon page from
> > > the vma1 to vma2, then unmap the vma1 range [addr1, addr1 + 4096].
> > > In tht step 4, the vma2 range [addr2, addr2 + 4096] will be remap back
> > > to the addr range [addr1, addr1 + 4096]. Since the addr range [addr1 +
> > > 4096, addr1 + 8192] still maps the file, it will take
> > > vma_merge_new_range to merge these two addr ranges, and then do
> > > uprobe_mmap in vma_complete. Since the merged vma pgoff is also zero
> > > offset, it will install uprobe anon page to the merged vma. However, the
> > > upcomming move_page_tables step, which use set_pte_at to remap the vma2
> > > uprobe anon page to the merged vma, will over map the old uprobe anon
> > > page in the merged vma, and lead the old uprobe anon page to be orphan.
> > >
> > > Since the uprobe anon page will be remapped to the merged vma, we can
> > > remove the unnecessary uprobe_mmap at merged vma, that is, do not
> > > perform uprobe_mmap when there is no vma in the addr range to be
> > > expaned.
> >
> > Good spot... lord.
> >
> > >
> > > This problem was first find in linux-6.6.y and also exists in the
> > > community syzkaller:
> > > https://lore.kernel.org/all/000000000000ada39605a5e71711@google.com/T/
> > >
> > > The complete Syzkaller C reproduction program is as follows:
> > >
> > > #define _GNU_SOURCE
> > > #include <sys/mman.h>
> > > #include <linux/perf_event.h>
> > > #include <linux/hw_breakpoint.h>
> > >
> > > #include <fcntl.h>
> > > #include <stdio.h>
> > > #include <stdint.h>
> > > #include <string.h>
> > > #include <syscall.h>
> > > #include <unistd.h>
> > >
> > > int main(int argc, char *argv[])
> > > {
> > >      // Find out what type id we need for uprobes
> > >      int perf_type_pmu_uprobe;
> > >      {
> > >          FILE *fp = fopen("/sys/bus/event_source/devices/uprobe/type", "r");
> > >          fscanf(fp, "%d", &perf_type_pmu_uprobe);
> > >          fclose(fp);
> > >      }
> > >
> > >      const char *filename = "./bus";
> > >
> > >      int fd = open(filename, O_RDWR|O_CREAT, 0600);
> > >      write(fd, "x", 1);
> > >
> > >      void *addr = mmap(NULL, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
> > >                        MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > >
> > >      // Register a perf uprobe on "./bus"
> > >      struct perf_event_attr attr = {};
> > >      attr.type = perf_type_pmu_uprobe;
> > >      attr.uprobe_path = (unsigned long) filename;
> > >      syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0);
> > >
> > >      void *addr2 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
> > >      void *addr3 = mremap((void *) addr2, 4096, 2 * 4096, MREMAP_MAYMOVE);
> > >      mremap(addr3, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, (void *) addr2);
> > >
> > >      return 0;
> > > }
> >
> > Thanks for including this.
> >
> > We can probably refine this down a bit though (let me have a tinker around).
> >
> > >
> > > Signed-off-by: Pu Lehui <pulehui@huawei.com>
> > > ---
> > >   mm/vma.c | 12 +++++++-----
> > >   1 file changed, 7 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/mm/vma.c b/mm/vma.c
> > > index 3ff6cfbe3338..9a8d84b12918 100644
> > > --- a/mm/vma.c
> > > +++ b/mm/vma.c
> > > @@ -325,7 +325,7 @@ static void vma_prepare(struct vma_prepare *vp)
> > >    * @mm: The mm_struct
> > >    */
> > >   static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
> > > -			 struct mm_struct *mm)
> > > +			 struct mm_struct *mm, bool handle_vma_uprobe)
> >
> > Nity, but please do not add a field here, add it to the vma_prepare struct.
>
> ok
>
> >
> > >   {
> > >   	if (vp->file) {
> > >   		if (vp->adj_next)
> > > @@ -358,7 +358,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
> > >
> > >   	if (vp->file) {
> > >   		i_mmap_unlock_write(vp->mapping);
> > > -		uprobe_mmap(vp->vma);
> > > +		if (handle_vma_uprobe)
> > > +			uprobe_mmap(vp->vma);
> >
> > You could perhaps make this simpler by making uprobe_mmap() take a vma_prepare *
> > parameter, where you can check this?
>
> got it
>
> >
> > >
> > >   		if (vp->adj_next)
> > >   			uprobe_mmap(vp->adj_next);
> > > @@ -549,7 +550,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > >   	}
> > >
> > >   	/* vma_complete stores the new vma */
> > > -	vma_complete(&vp, vmi, vma->vm_mm);
> > > +	vma_complete(&vp, vmi, vma->vm_mm, true);
> > >   	validate_mm(vma->vm_mm);
> > >
> > >   	/* Success. */
> > > @@ -715,6 +716,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
> > >   {
> > >   	struct vm_area_struct *vma;
> > >   	struct vma_prepare vp;
> > > +	bool handle_vma_uprobe = !!vma_lookup(vmg->mm, vmg->start);
> >
> > This is really inefficient. We can't be doing a maple tree search on every
> > commit_merge(), especially not just for the sake of uprobe.
> >
> > Let me have a tinker around with this and see how we can do this more sensibly,
> > I'd say as part of the vmg.
>
> so, we can add `bool handle_vma_uprobe` member in vmg, then set true before
> enter vma_merge_new_range in copy_vma, and then pass it to vp struct. wdyt?
>
> But this may not suit for other version, such as linux-6.6.y.

Yeah see above, we'll just have to bite the bullet and take some pain on this.

>
> >
> > >
> > >   	if (vmg->__adjust_next_start) {
> > >   		/* We manipulate middle and adjust next, which is the target. */
> > > @@ -748,7 +750,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
> > >   	vmg_adjust_set_range(vmg);
> > >   	vma_iter_store_overwrite(vmg->vmi, vmg->target);
> > >
> > > -	vma_complete(&vp, vmg->vmi, vma->vm_mm);
> > > +	vma_complete(&vp, vmg->vmi, vma->vm_mm, handle_vma_uprobe);
> >
> > Again, having fields means we can drop this and the below changes.
>
> ok
>
> >
> > >
> > >   	return 0;
> > >   }
> > > @@ -1201,7 +1203,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > >
> > >   	vma_iter_clear(vmi);
> > >   	vma_set_range(vma, start, end, pgoff);
> > > -	vma_complete(&vp, vmi, vma->vm_mm);
> > > +	vma_complete(&vp, vmi, vma->vm_mm, true);
> > >   	validate_mm(vma->vm_mm);
> > >   	return 0;
> > >   }
> > > --
> > > 2.34.1
> > >
>
