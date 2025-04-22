Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD45014C5B0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344532; cv=fail; b=gneBW7+A+LxrUHlquR8HfxWQSFUkhrvfQlVdy1OlfF+KVPf+QdiKi6HO8+nSzpTfIP8Cs2eNZAOJPUeXBTL2pQP2TDmh5irCxYxr10N/PSvQKSbdCnuPxWpev8LypzXZjDLLn7WSL9TJz2NAPDVx00IesRyrn021tjHbXN8lKjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344532; c=relaxed/simple;
	bh=Crw7fgVnRFMYq68+kh4HknSteOfmaU6uKV5RS7cSDIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tuhWxfl3CaIjU4Pb7P6PuKCyHVvokaWBk2VcayX3VC3+G2DQjNSQkHKp65FBzWa9bFFxiUZTvR4VciAvTu6EhjBPy0TkZda5lR7hP5eydSZWjZrHhoroigcftKbNGVIuhzPerUDGu5jAdTTKHBIYaT0SDZWebIKlOSM5t1JKEh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WjlZIWRy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q8IJTYVp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WjlZIWRy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q8IJTYVp"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MFssTO002979;
	Tue, 22 Apr 2025 17:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=1BaG3pKhN+92U7zqG8
	E54Qa4iVDgep0oMZlWzw1ApPU=; b=WjlZIWRyr5rd+yEMuyRyESt3f6rHdBXDwR
	vU96zvxQLCmdZwGnQUzudp6MwOkOR7fQj4GlVRGS0lgG5JTRWnVCSXh87yJ1IRx6
	2JIoLB3VUE1koRyCaaunPMfBKgUsrI9WhjavkfQyFOTG2em/2n39l6HE95yCyf7p
	N0q2rSLWd34V05RBfVrZTZ+gRGL66pU9mHjmRGcWkX87w3QjfPn2rsEmx/CH7MrW
	dCQN6sqEXyDZaEPsBBjPXv7Y1iUzrCUxOlretgFEqBo4cO1A3gm8HXRIdt0RW24D
	5BakOvn5v+bE9pvk0/eWqPaD4P4duxol1BoZoMaf+ClLlFC2HJ8g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46428c55h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 17:55:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53MHsgMf005961;
	Tue, 22 Apr 2025 17:55:24 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010000.outbound.protection.outlook.com [40.93.20.0])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 464299ysn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 17:55:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=um7ikzY9ArjR6ITCDXdamNXJsfzEBXgL2aFmhvOIf4NFC91BAjReA6mFC5QopLVqx+tkBrmqxpI3D2SN5BeSE3VmGEM6N7Eyx75epWIp4kGz0Ndsmw4IAVAMZtX7e/TbtKPXS5xSQQ46CdKSjhalZvhDq0rzF7Lkhh/V0QFbwnDkCM4G9iSSDsEr41J16+dFKDWriQ5DiUVDXAEvo0ujfnd3ktMx5YCRZn3K9aVdv2gwnEvYTHSo6DZSvIJtLvOfN7lwCJFyPswTqJw1oUTBWRaWQTE30AAykghoBZzIGerBsDqvkoCT5Tfm9aFWc1aJxGpA86qA0t7RFv5JqU2ItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BaG3pKhN+92U7zqG8E54Qa4iVDgep0oMZlWzw1ApPU=;
 b=n6C7Jmk6R1t4lIMpihq+yMDuK+FPe6Wei2WcK3klpAzGofB/W2L4sbW/iEqjI6i7JBN3xgeL0BGNrxLjdy4IrgsOk9TehlszeZ05szFKa/1PRjZwgWIsKtngt3dcyX6/ADRo7ak5EHeqt3NaAv2NKBdzax9DGGIM6ba4pjZwtHCGS2anDq0tEg1nFGYZ8MFh8DislXtFg8cC/53Sqgp0bUeM10Q7ktlr1Wwx3++fkdG4Rbb7C9VyROPRaNWTeqmDh8tzhh4Dfv5vQSZ7TbBGw/JX4oqYjsLHXmfLdRZRfifVCriXCcYHUheyRwz0nSAGpxc8rYoTZSEkl8wXiuHoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BaG3pKhN+92U7zqG8E54Qa4iVDgep0oMZlWzw1ApPU=;
 b=q8IJTYVp9d/ndihwRCEsqLd/EPVwAil7LXIipfF67sJiGPX3ZKleQaQSjum3zleK2hpAxs88cXkLhKai+/oHpLNVB/9KT1l07HKcUU79VP9VT4l1JhiKlJdZJIPb+qRH18pRKc6jH1DHVl/zguH5LE3amEbjsIKACsI46Bwczgc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB5726.namprd10.prod.outlook.com (2603:10b6:303:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 17:55:21 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 17:55:21 +0000
Date: Tue, 22 Apr 2025 18:55:17 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jeongjun Park <aha310510@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, willy@infradead.org,
        linux-kernel@vger.kernel.org,
        syzbot+a2b84e569d06ca3a949c@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] ipc: fix to protect IPCS lookups using RCU
Message-ID: <e7c9e904-c284-45ab-8022-2009a976a894@lucifer.local>
References: <20250422124843.17188-1-aha310510@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422124843.17188-1-aha310510@gmail.com>
X-ClientProxiedBy: LO4P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a74e8eb-d4fc-48c0-3a64-08dd81c6d93f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q0PHM4jRYGuh+kJRftaSItsCBw6W6VonzRUI2FsIq62Y6D3v5qU1JprAzYBA?=
 =?us-ascii?Q?4QTyBPhA7IifQbtDqrVCBkkyc+GglzPfcLgVi7IZ60Z1EDJNRxjvvPQHt1q8?=
 =?us-ascii?Q?+8qrEwkefHccslbONMAEryPNjHEDi40J/U4LxBOHaIPGzdR0MkDLKzu2a9L5?=
 =?us-ascii?Q?OcU20jnACjKcPJPQDzgzlwExyH05TfoOY5p2s+0Kw2jxKol1VBzUhXWu1pUS?=
 =?us-ascii?Q?c8t2hkfWKYRtj+cBmbi3fIIsiG8VW6AWjWhLYzEegxQo3zHW3ZBYcqkkdEzp?=
 =?us-ascii?Q?vBNWVvVWA7VjohokqWX352hNnjDf8NmMNrskiiGPNkk3CPnDtPyXJgVv0jB9?=
 =?us-ascii?Q?Qg16iY+avsykOKcxW2cPOSuTIgNmQ2o1OFWlXBbQLWKajCk0HzOfgAw6S0/m?=
 =?us-ascii?Q?xgUL0hnp8av9lvlBFVbMSDE9++v5r8KVHjWoUGSQ0HpVBKgDsrdmYZkqlFCo?=
 =?us-ascii?Q?9yM193pHGcFFdYWehgj9i8zDTRIY7RHKrFa8ODX1tipwLFBI0lQUBpVDxIDE?=
 =?us-ascii?Q?lq58HGbcbxu/WUI59d8JHBSzRfJLNMurpHZagphxLPZFLY5+tnfUUgAmvafQ?=
 =?us-ascii?Q?WL6+FGyAaCOmq79obz8mTexFxfDQoridlG8zJFnv8B2thPuftRWKUjveP6Fl?=
 =?us-ascii?Q?m45amXWYuMlM1RruJq+0IuL5eUglNTAH0Wais2qLUxu7KaEuQ5w8Jvr5ao11?=
 =?us-ascii?Q?d1DQJOkY4TAf6A4bTrIzIulO7b1tjGhuAHsYn/dDl6RXRBIF6zKYPdxkWixW?=
 =?us-ascii?Q?cBYRytMIr5HmsvzasKuujfIg8ZfnJUUEYg15EPmJEQSFhrA3LODTTnwqPeY6?=
 =?us-ascii?Q?y4QDIitxSSaxplfIgisMAGfOQcCM2ssOGdv2XeulgAfDyBEfLJvd3ruZ8Cav?=
 =?us-ascii?Q?otX2hFAPE84KCcR00k2r+TgbvdZhRFmFml58w3Xc3LfqNWon0/zqKNAzl6/a?=
 =?us-ascii?Q?K2iVg2gL5vfzCJzpFB5klfxoiue2NwIBydLu3wfFiiVo8nSTQEwbV2S3QGrC?=
 =?us-ascii?Q?Bjwu27UTLOkywf4GuktSKrtBSzZW6zz1oIFJz7F9vaC7UGNK5UVwMGuIvf0q?=
 =?us-ascii?Q?SFld5uNzUZZcl+vbAp/+7iszBg+3CMlJih+PuecFAT4jjPhiinvX7PIuzvtS?=
 =?us-ascii?Q?m2Dso6cKFGqZRlByKGS8F/2SKr5s6ebPIU6lGZA6V3GjgUlszhgIEWjC+Rax?=
 =?us-ascii?Q?u51+nN8oqZeL9KWDTv5stRCIdY4Uxfl2gHH26yLmvC6ZnovrvlgP4uB4N1WH?=
 =?us-ascii?Q?oDUSJHbjvObchApzHjjGkVvBSGK38vb8U/dpel/FaQgCja+HVUAwT+uIh+1B?=
 =?us-ascii?Q?MHMMavNC3hPuQFbH+1AkuldidKA10jxUEbmoTOyrcTLrUG3ZAJ3C5oaDwSzY?=
 =?us-ascii?Q?EwnJw/OXjEyfpie3ErB0MBeSB/gvIscoHBXRDfwOItW+yKOe3n2oKTDh9N3e?=
 =?us-ascii?Q?4bWaVV45Nto=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MbIaurVve+G7QCEveoTHRyxxmiIGJEvOcoj6oD3bWGo+P1yNylpQJDX7nPTy?=
 =?us-ascii?Q?Gq+kkSWYKPTOuzM3tN89dP4z8JkLz+v5H72wyqq31InhuuPPsAPQSroj+AA6?=
 =?us-ascii?Q?it+OtDHw7D1Y7P7RdEesvvSXosddjNU8RG4LnQ0uNuagXqHY4U5VEDRX3zYr?=
 =?us-ascii?Q?OF389FjK516QWAcbzheFM0BmlZ33T35kF9v0raDN01qoc5SxA47sLxtJFHja?=
 =?us-ascii?Q?Pm7RQXfZINcf5LmRFp/ByoXl6YYaDsIamvZEznkkXYlAvp1d3yeLC3jYb8KZ?=
 =?us-ascii?Q?HabHn8S4taBQ+/hEK5JzDpm+Kq9/+gDHYDa3pVyPq8ufJBb5fCQNxeuGzidW?=
 =?us-ascii?Q?Ca9tZL7eWK973jp0FqefGslp1SuxWN8hr2dsgv6AiY0YeLjkJriN1GUX2uwk?=
 =?us-ascii?Q?MHo3ffC79fc4UVNU3dO7QDDbO6pg+NBOHSX4hcpTpDGpl3s2ihjRo3Wg/NnE?=
 =?us-ascii?Q?v9jWTWxsjxrJLQ9is7Eq2AjLYjc8FCVkJWb341e6uxwL9/JG0EDA0o3Q60wz?=
 =?us-ascii?Q?c5B3RO8GxQfnWGJSuvXM0hA0/blkyrPptWlfSTNiK9yUkEpm+sHDBhCqUqVW?=
 =?us-ascii?Q?6nbgjzrDBLjcm3sBU/zLoGtju+Vro1SSoVX+Pc9zZ2Ydn4jDbzMDLby0miZi?=
 =?us-ascii?Q?x1VuU9Qnnl3waKPZG8QqxQ8SBJcMpuBAjb70JQYkJCGCuEL+XL4amUEcZZSn?=
 =?us-ascii?Q?Ixep0k7vqqNtZCbyyeGO6d6ERNV698p9DZcBCANamPsprPuBKShQKIqoJ6gk?=
 =?us-ascii?Q?NH2QGejaYWUT3dMfO3qzKBk5VxZ6StrH0dvFOr6uxl1uZLPgokxWcbSrlmBj?=
 =?us-ascii?Q?j7bD7jbqHgjR3phCydZQkswOim5M1rekta00o1ecK+UIFGmCVH9J3Mry4MfK?=
 =?us-ascii?Q?rAx3zfk27aGRtT53sk0Sqvj8hmpIcZZ/u69CpWeTY+K1YGpefBf5reKtK1V9?=
 =?us-ascii?Q?bQA5hXfHrOJvkdUepki57pAYXNm4TKAPOStdsMo6a3Zm49kyMZVHUdi2zJ8Q?=
 =?us-ascii?Q?XXkUUxxRLoTsZLxHU52+lEeI+ieUTzRe0Psleov19qRjniVopyeW9CGrnUeq?=
 =?us-ascii?Q?fPoNjC+xpMeC6DJ3iTy9tZx0s0ZnvSp8VhTULJVwIUCpV3Y4BjEePCdO9Pe8?=
 =?us-ascii?Q?fbvYKOJsNK828rQMLP8HDgVX1Lwer1fSQYsrHtyyqy56alcvhgvgnOdHjygQ?=
 =?us-ascii?Q?lOcCeG0/u6oH7plfiATdQiB+qPUmUDDwSZBn3vvGM6CRogP9sfmTHKaut4l3?=
 =?us-ascii?Q?V52NjPoaEh51BwOmRv75kTam4AN33zw+yFk/nK/C3OVLmUvDVVBjEoIVwjw3?=
 =?us-ascii?Q?/3efuUTSjP1SmonKrr51ZeZZWXw5b4tp9npjNKn1uEvw0vIRt0cnIKc7icmh?=
 =?us-ascii?Q?R/XoeyXxuPlfnEod41mx+hcphWZcEXC+HXClNvGk8a/EbqHCgMq0x70vrH3S?=
 =?us-ascii?Q?XKSM4oLlaGRZg6LoNlCymed8nGbE1x7HoFf+XGZit5RvBSaqOzLCradBMXn2?=
 =?us-ascii?Q?KUO/fi06A2LmRLzvDAPfGhbU+qN46ZJ4SBFpJN87ygr7itK6p0io4WWmHS++?=
 =?us-ascii?Q?c2VI66qBsJ2qGsVDF7GDzQ7mdGm8HKkyzsR0WJsua2rbnCjrt2P6fr6e936r?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RzFnxCnVn1vf0jeajUlnnFVm00wlWNC19BbGIps7tB2yBsLwfAzqoofO4FQdh0gujYn3NzgzDZ2IkWGYMqHeX3ot6XAupgJwrDdL23vUZNNSyqT4kRFN0larzP8pa7mB+uVvHDdaXGUDewV0lSOabeFtGSMuEPDjOVXib1SXG0YTvsFHTtBlHofT+UAum8fQa9nijSc5DaHmaOCMdi9TfSEoH/2j/Rw6SvgMDKOrGAvVajsUEa9XcmRUl2FhcPgxogR6U9ylwpzbTcHigLd3AU2Es9qWP8+0/TpIK690bcpZ/LnbrO/aDfdcieRchq/M0MK6nw3UFb9T0MdJFF62BIGUr5ofBp0DdQsQtpFVEFPJhm8GRHGMz1vlIkEFrozrqf5nZRIyDgqkawI796kxePbXZHgjQqqVGkRTjYm5LxKEbw21jqYmATdikYHWDrVO9zsfYiuOkXwp8UReX9+jwvzg3XV+b2Lay00z1lJDTiID2JTAsJp/F3NYOqHq8X8V6Na9qU3/vHh4tgM1lc8VgqYI3cXVHLplExIJI+lx54MkjiPr4EQ9ejtlYiWXF4XxXQacM8EEp1hAC/h6/yQSVsAzzvEoURahINIFpca6di0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a74e8eb-d4fc-48c0-3a64-08dd81c6d93f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 17:55:21.0589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzuqVhNoxzbgLj1Vj0VECVy00Ajn9Z6LIkz3xKC1eXgwRIESoNmPFGCPRCdrPzz/xkze7wW8RHTuvbLmn7EYwVcsBG0FvkjKEqdH6mwaSPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5726
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_08,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504220135
X-Proofpoint-ORIG-GUID: J3P7A9kcjDQttX9WbGK9hjZ5cPdfQnuc
X-Proofpoint-GUID: J3P7A9kcjDQttX9WbGK9hjZ5cPdfQnuc

You sent this mail twice by mistake, and didn't link to the original
thread, since you sent v1 2 months ago it's really useful to provide a link
(here it's [0] ).

[0]: https://lore.kernel.org/all/20250214180157.10288-1-aha310510@gmail.com/

Your description is entirely missing any 'a syzkaller report encountered an
issue whereby [blah blah blah]'. Please add this.

On Tue, Apr 22, 2025 at 09:48:43PM +0900, Jeongjun Park wrote:
> idr_for_each() is protected by rwsem, but this is not enough. If it is not
> protected by the RCU read-critical region, when we call radix_tree_node_free()
> via call_rcu() to free the struct radix_tree_node, the node will be freed
> immediately, and when we read the next node in radix_tree_for_each_slot(),
> we can read the already freed memory.

What is calling call_rcu(), or radix_tree_for_each_slot() etc.? Presumably
idr_for_each? Maybe worth saying soe xplicitly.

>
> Therefore, we need to add code to make sure that idr_for_each() is protected
> within the RCU read-critical region when we call it in shm_destroy_orphaned().
>
> Reported-by: syzbot+a2b84e569d06ca3a949c@syzkaller.appspotmail.com

In Matthew's reply to you in the original thread he says 'if anybody is
wondering what the hell this is about [link]'. It would have been useful to
include this link here [1].

[1]: https://lore.kernel.org/linux-kernel/67af13f8.050a0220.21dd3.0038.GAE@google.com/

> Fixes: b34a6b1da371 ("ipc: introduce shm_rmid_forced sysctl")
> Cc: Matthew Wilcox <willy@infradead.org>

You're cc-ing more people than this? There's no need for you to manually
add Cc: lines anyway. But this is just incorrect.

> Signed-off-by: Jeongjun Park <aha310510@gmail.com>

Matthew seemed more aware of the behaviour in this code so I'm going to
keep my review to process nits mostly.

Others can actually review the change... But it seems you are doing what
Matthew suggested broadly.

Have you run with lockdep (i.e. CONFIG_PROVE_LOCKING) enabled? What testing
have you done?

Presumably it's ok to order the rcu read critical section and rwsem locks
this way?

> ---
> v2: Change description and coding style

Actually you completely change what you're doing here, this is a completely
inaccurate changelog, before you dropped the rwsem, now you don't!! You
should note this (i.e. - what it is you're actually doing...)

Not sure what on earth you are changing in the coding style? You're adding
braces and 2 lines of code?

I don't think you really need to note a change in description, that's
implicit.

Also a:

v1:
https://lore.kernel.org/all/20250214180157.10288-1-aha310510@gmail.com/

Is vital esp. after such a delay, as noted above.

> ---
>  ipc/shm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/ipc/shm.c b/ipc/shm.c
> index 99564c870084..492fcc699985 100644
> --- a/ipc/shm.c
> +++ b/ipc/shm.c
> @@ -431,8 +431,11 @@ static int shm_try_destroy_orphaned(int id, void *p, void *data)
>  void shm_destroy_orphaned(struct ipc_namespace *ns)
>  {
>  	down_write(&shm_ids(ns).rwsem);
> -	if (shm_ids(ns).in_use)
> +	if (shm_ids(ns).in_use) {
> +		rcu_read_lock();
>  		idr_for_each(&shm_ids(ns).ipcs_idr, &shm_try_destroy_orphaned, ns);
> +		rcu_read_unlock();
> +	}
>  	up_write(&shm_ids(ns).rwsem);
>  }
>
> --
