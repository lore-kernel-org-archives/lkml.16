Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0852253F8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707030; cv=fail; b=ey99rqvOcdMxbUJEnzAKBuiafCKGsJCcqbmOh6H91bXDMzSEKECaedEugiukC9Ty94CucHkV+F2S+oBLoqDAkE3IVu9J4bb6aNHWWqp0++KoAjlJI4nOw3/aqGVZn+Ib6vmHZyornticZODhQ/sc+udByENd2y8Fwvj3ChnNXjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707030; c=relaxed/simple;
	bh=REARhlKksgTkwO3VpcY1ZieoDmWfQREBJNgmfCst3V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tsrKnIfRaAiyolkE8Mn3NJeHoTT5Ie9usVR6i5El/9afHgowRXtX8zzVYUK/2l9VtXN/QIwdmaUWufpeakTJnrv53ldRbAWY6n5G1PRQBkiQPCfkubfkgIaVFfhz7lecT81scpr41FNiT1tFLgE8dBLWjVd9ayCDgbIqifZlzPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dn3IHn2G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F8SrcH5j; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dn3IHn2G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F8SrcH5j"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548CF39s003379;
	Thu, 8 May 2025 12:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Pf7bZYUNQ64F4iPV6m
	s2SJ2g4kud3rKtGeT66x9zjhs=; b=Dn3IHn2GngLNYNkeHFMqM2mDXdT6fTobfV
	/UGIUk7PGgw0FDuNvnGDoWayb/5H2tp0YSGqtWo8BA1zgk0Vnc2gTINP03Eap9Jn
	pptcERghasQdUncNswDz51LMxsPZ9iEcz6H0n+qbQY4VOMT1n7xL3gNCyOf2UPu4
	EjKarDCCzR4KduT1+X4PxBGty+unMSQdc7CiE1a5Sd7FTAJuLD62JTVb35OeUyaM
	q9rZNMcQ9ZyJm13TtdVnlrdXDiy7z2Qs7NY9tzx9w0SrrDwSGv+4DQasI3eKEikI
	Cxwo+B15PPfYcCGVV2kQAX+IL911xwsdH78rOUHfjbD9y688PcgA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46gveu80hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 12:23:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 548BIT9m036039;
	Thu, 8 May 2025 12:23:35 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011027.outbound.protection.outlook.com [40.93.6.27])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kccjp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 12:23:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2CW1FRucCdqHGaJrrlnOrNWiU4TreZA3wGF7YOtYnLEAzP1c/S27XqUATsIWjGBXBzRje9qLqdj7c8RhKoTbkK36wkJ3tekFoJLNTBu6VUhoFySJzBd43fFhOocBtKS/lj/n+9ncV8aB17LnSlJ5snQODf9KHoBTtvSpMEYAMZ8xDtH6UWDIoBuSX18vsDum3ABXF++EBKI/Pp3fiiAnMiCidYUVW1jSqbgC2+bhTe7OohCG+LFSS316zOXXyCzcOqURmsr6b4mmpVYrXCMV2tqPztJGZ0ardWLG+7yx5o59Qs6PTXuVPfVnGWrUcUgeSkLPI78XFhDMi1RCamvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pf7bZYUNQ64F4iPV6ms2SJ2g4kud3rKtGeT66x9zjhs=;
 b=fSXhwJQoajYEe/iUpe10hCN8XlHfp4ZC7VBjS3OAUxguRR9rPlbIv1jskHgmYvLTTqB8LT2wW73Owiiij2acKoZ3Dx3XTSdAaxHVqvgJznIXnIjPZYPCmZK4iBwkgMoGGjAKNYtebxvo4a9x+jMW/hDjC3gdWXCPeBVXw2sQZ9HOO9Qxnmfkm+nQ3LhhR8F4Ls7gaZs+eJESDDFFTWpYWhdITwTixKgUshRUn3g4pDUMdbAJcKp8GIo/bwUB8Uc/NP7SCBskpEVZfu7jZV6iVL0h0KBPpKzjwXkeuycl+jKERdim1Najk0Qxly/UlcjACkvHUj63TgvxD0l9F38U+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pf7bZYUNQ64F4iPV6ms2SJ2g4kud3rKtGeT66x9zjhs=;
 b=F8SrcH5joTwFGGAX5AN6uY9iJYZkcExH1GE7jqT80SizDto5UE6HDF5FnYEjXIQLpFoBIyqP12x8W7Wd/tm6rNM0WLu8uXadFnwwiaxRVkrXdXTjh8LzJW9RHaP6BnBYLiwFlL4zIk9KIj9yDKX3cdeQOTz2vbBwLzvltghgTQw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB4956.namprd10.prod.outlook.com (2603:10b6:610:c9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 8 May
 2025 12:23:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 12:23:28 +0000
Date: Thu, 8 May 2025 13:23:25 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
Message-ID: <28428030-1178-469a-a4ab-f1e7179d9106@lucifer.local>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com>
 <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
 <e3e2663b-2749-44c7-8452-ffcbf2167572@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3e2663b-2749-44c7-8452-ffcbf2167572@redhat.com>
X-ClientProxiedBy: LO4P123CA0170.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB4956:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b16973a-e73d-4f64-b15e-08dd8e2b236c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t3m8SpV8L+NsMGLJvRnRPkpNTpTGhxLAZipfwqcXsuO11ewzodCK6s3IK8pY?=
 =?us-ascii?Q?PqGKD6D/3LSlG19wlKUgFn2JoE4QYhEtTEOdK4+hW3QVjFAs2tvbvP3GnI5s?=
 =?us-ascii?Q?yHjMdUGnSMdqR7CxHBo0zF1AMragyCrvB8GWRbUkd2U22AIjdIOU0S/EKut2?=
 =?us-ascii?Q?dnpaiRs/b57aqgc70haa2OcGaRqkGQHpWEPMf/oYRR/2NgUSykbw2DEZtOY+?=
 =?us-ascii?Q?EGfEuoeXGCnR3jKxmgsBn01dTX/TG/oV2XprMzgUlkpPhVVoh60mCVsiafCl?=
 =?us-ascii?Q?ChGeFBUxmh9YY/vvFqqerIE0+JuvjdL8ihHnAHaxSaW/Z4kfdr1qDtMcNcV0?=
 =?us-ascii?Q?FURwJ4i3wHSHBHLcIF/8VNudqreKmJI/jdHLjqka5t+U41uqyH9LYI08Mlfp?=
 =?us-ascii?Q?LV0PaiLAVVDEHml2+TmUYbhtDiHxfm3AP4ZnQK/wYijpfGnBUk4dCUaOtSpJ?=
 =?us-ascii?Q?u7jC+CrtNU1u3EV91RXfHxo4SNLk6+bfqQ4jol1wgcFYB0r4QWAVBrphRw6a?=
 =?us-ascii?Q?tl+ujZHJDsaJfFHDZpbuUtqzNdZxN5pIMgh/V5ymbrqoeJNv/Wz/HhyPnUO0?=
 =?us-ascii?Q?73cN4vGtvYRI2cQ5r6hsupLzgCSfdJ0F35V1akuIR01E9UjGKxjUYf/VPN/o?=
 =?us-ascii?Q?wdefcO0lsIL4hWgSTHOmv7BoPm/fmLU7qIY5HMwwsATi6LcWdMjm5BOrFJlB?=
 =?us-ascii?Q?1AVD7XwUWVXH11nNKzxSIWHGpImwZUlzwXvoqp43Jl+Jr6T3A1XU3/BP/lhl?=
 =?us-ascii?Q?wg1vthE5AKmITb+1519TqG56XI8EZZI0P5crU4rDFrE87mCEpTajtZb3/CET?=
 =?us-ascii?Q?/D2Rj+L08gPnrRr82UPaH3UVLSR4scGKXtu8hiFDup6PB2x37GfO4DrLSKFr?=
 =?us-ascii?Q?F7gwOwzCIvkBPub/0+zORjSLPo80ynE9C0kuH9PShtiT/CGCypmrSVJFrLur?=
 =?us-ascii?Q?W16AXwgCbD3J2XNAbhoy2leBRxkJZP9m/J0Agvy4GjbUXsYDGLNQ4yqIJn4r?=
 =?us-ascii?Q?3kksb1o19HBAT9/jy2RqCwRQpN7b6cnzj3yyxCmWdlR6ryfUy2anAgTz58Ob?=
 =?us-ascii?Q?4QywBJMce9THGxmDigfCcYGt8aJRgYkLZeozkQYLjHE+aGsV4906xrpitJ10?=
 =?us-ascii?Q?E5lF8YqSy7bHHfPRv8MAlumL4oyczBjoWqr5Eak3Tw9XSlxOc8gQRVbwxeUX?=
 =?us-ascii?Q?ltbj1btKfc6XSFRth5dmIQHiasod3vm0UG/EczLIuC48qAShDrrQASC5DDaP?=
 =?us-ascii?Q?AX8bH+hmtNJODaENectifdo6hhIeROjXIZ7Yc0V5gGrYuYm2r0zVmSaf/guN?=
 =?us-ascii?Q?TjOQteV7BCnjVm7VQDa4lj4lzM9Me3WsIewaXhDCoqX9VX04w5gu5LGRvUi2?=
 =?us-ascii?Q?lbmS1QugmFeVyOpMGEaIRP0Oq7WSX/NQaXT9NJYAqH8ydOPCS2A8NxOkmtk7?=
 =?us-ascii?Q?Lav+z2F/1yQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DxcqGWn1NtuSRrTxGUNJ/Pc0LcBG6+VeIXABuZMR20rpyW6BEkoo37A0NtC5?=
 =?us-ascii?Q?fPciaHTsJnQENKCj7FCHfgc+8iTWOYnP4XUZiqucfkug4j1WeZwNk+4NMJz7?=
 =?us-ascii?Q?KjXE5TtDBWMkE/DWRqyC0/dg8IgRzHfhGFK7Iarg57z5MwKIMFMoPdLwtUKk?=
 =?us-ascii?Q?t+abqbd4YAu2N6gyYs/gIE/c7+Oe4efRXc44PXOlJOXX11DkaNwnrczoYZ99?=
 =?us-ascii?Q?N5oUTkXnQto+LLuBz5/fnUowIYpxcG2Mn8Do+ffnFdl2JKpzSD7XsN1PFj2c?=
 =?us-ascii?Q?9GSiScpoY5KRthp6vd+TQlXAnN/OLhvQqxBRFQybz67odj6D7kgnY2jRtEzv?=
 =?us-ascii?Q?J/Ei1HQOcD0n4Jb+4epcEvWKYxA8aZ2l++1QqVqLFPOfMfAOCPZKr0/jfVVu?=
 =?us-ascii?Q?m7Z2BxYH22gNfY29h0nK3Y9O4ZyISQooP3ub4C5deW5G1udTNwNyERcPz/go?=
 =?us-ascii?Q?PYUGxHRTXhSubKdNgvA0jHuoiZXsPYFi6ZSe4R08vZ4aE9/UdhWjwSb3bvEz?=
 =?us-ascii?Q?/CNBnBkgJCAyLsJATAL0gupjQKCI3ay+YomS210hg1VN01oCboeb+VCQ9/nB?=
 =?us-ascii?Q?Ds9YFZKqpPGPG6sLfR5oMkz9VyRGYRoGCSZmnpzd2ROsLOvLO226kDyZ6giX?=
 =?us-ascii?Q?T9oFUwvuqJeiwMT+z+wbRSh+CtSKEiBIC2cO7YJRgneYXgZcwzHpDMSPUE9g?=
 =?us-ascii?Q?wxTGUnfaH42ipy9WR3OyhDJ0OFdauTJ2H0x8SagimrWSUonEcsTbSTfMODja?=
 =?us-ascii?Q?2gwbwnykJSlqiDcRvVTj0ziAYNvkVZY0qupjU0VGW8baUl0bTab0WIRmNtzk?=
 =?us-ascii?Q?dZ/+uDCOMBT2yi5GHINUhvatmu4Prwj0+lFfu/9775lT0jZCV9PbM89dlkQi?=
 =?us-ascii?Q?rUpMn2RkhVE7P7mMNVP2u7c//OEX45vqjY7C9yFYG1eKvqQP1cJGB7eWwyse?=
 =?us-ascii?Q?ZWPEztwmaV+9CBfG2TSSn85Jj4tE26p3nypEJ2K32g3Vv1Ss1CyJhAtxelD9?=
 =?us-ascii?Q?IWFEgFma8JTH4rGbGWndkDGP3ihMlN99x7hDBzZWnTlIUenQbAnRmw/dFrIO?=
 =?us-ascii?Q?i7Qb+x76H3M6wvAMc1aVjn6nat3u6RgLkD0U4pHEElPWkq928wNhUAd9nXBM?=
 =?us-ascii?Q?IGZHue1EN9jfejY2F/lHiebhwKs55TmlKjo3sp+CQZHxZyUmaNQGf8amiBKq?=
 =?us-ascii?Q?y54muOx927ESu5tRrhIAqN2dJfxzAaAH+NuJJszdQhu5e2C5SPW/eDGuO3hE?=
 =?us-ascii?Q?ZACyEPiBI3hpcAaSkDRloeC/hbgneOi+pVPjs+UdwX4SaC0HlrmyRE0bZiKA?=
 =?us-ascii?Q?fzyQSla5fWFfpkWWUAeOMnzVzeIEAhbiCsOKKIxOMBtEhXHYRR5jIQm/a/Ca?=
 =?us-ascii?Q?uD+XqIhEJptgOVB2lFx1fFq55u43rvMy6qq8n4PdospFe55CXT/bAKb1XdJC?=
 =?us-ascii?Q?ToTh2xHP6DfscKd/JBQ/Q7Hsi4x4l9LEGDXeXPxQbyLp0rWMnkr3FQkN9Sog?=
 =?us-ascii?Q?etefg6r7KYExG+5QyM97CW4Jz22UG9Y0Qk2vtKQuKoJ2eTqxUnmzBBgeboN9?=
 =?us-ascii?Q?ueSs13yeLAviRm5Os9/+tonG6Y5d63yUxuHVAoH9VpLaxziNAp+pyihHBkHl?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	51zVi1vs4w9Q8/z8KTPVV321p0OLifoZlNiu3AvcI2kzvnEHpEYS0Qh2bzXS7qOnpEpynd5b+vAKHXYob6XeaEoLtPoVKGUBRAcRRSeQslWMsNEhuh/ebvSFyNLauWjBVlsefGQbdUjc/IusHL4yzc29v9JS/lOWFcHuM+wkVPQs/3ceLfhjuBxnhYVmHjldiJcQf7+tENVWtsADrduIOb5c2o5+CTUtwXOpHm9T6dfunE3lmK03nFy9gqNGcyWpyUf5kQSzGMSLREYOJzd5Whs5K4WlDkblZ9CA/a56DnQ/LKLVRSZ5fdNpeA+vjqxE3dFgIEFsIeyXiMPMlMMaFplKX8Hth36yrgAQghLg6RuFyOCz+pwZEmI33s0sfe11avP4SHuyk7r+bl6Pq98kU+RK95PgNpAmYmx/C6iB6G6uVvMpUKNjlCFaA9ag940nGf7XT6rsgU5DFF9IAguVIOXD5SDZsBYFG1FjC6MSWTjPWefz7988ixad9H4vODf4tMWmxvEdETq98jgltCCTlUoSK7q66ZAdH5roeV9jjAM6WjtDs+aHe1Q+bWmJu/aV6nX6cm8MNDzpOT9a9F8hYrHJcO6pTl3+61hAthYMZ0c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b16973a-e73d-4f64-b15e-08dd8e2b236c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 12:23:28.6457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5eXawK62K85xzNV2H9IPy63aHPUui5P054uzmJmlmiRriVJbdzjUAU2ELWnzQadPE001mJpiiFFLL/5i84jqqroZ3Kaiptx5fQCLCqLsTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4956
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505080101
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEwMSBTYWx0ZWRfXwBdxG4ZTuqRi 5rKkJBQevqW8JBPObEe5kbB6FbhNXlmU/WuYNlpnirQinZGVBkC/55Ip0gdqgocTdlcBu/inHTa gGT5rby0SoTg3bbmUjUnB11Af3DWCjqXX/nX/2QqOb4LDr4rZwO28lMNxQSIAU0a3JX292egzxW
 vcF9UxbkF/vkRyJudb4eXiTieGt1s4I5t0e0zdkJZlb51ZaRf03Z+GzkRwzXogqA0bNQVKxUjaU S7B983g3yUqu7TbouEsvffAyQovogywXtOAsP5yw3SuaIMy1ukmgEXlVj9RWYn4+Q5SXAXYmumE gfWDDIyHSUhBmOCuOZcEst3TdXUnn7Rbk9il+pYGJKu0qh97mI6b5I1kTBrLpyjJ3Om7M1HAtQY
 FlZXw6oRNu2zWXqZvAXnClJ8UQrPlZm9dCc38wZJ6PRxfvMIi2ofvQKxMbPLdJnBnpQW077m
X-Proofpoint-GUID: 7V21rctO4sz-SkcxJL7JSBHvSzQHiMtT
X-Proofpoint-ORIG-GUID: 7V21rctO4sz-SkcxJL7JSBHvSzQHiMtT
X-Authority-Analysis: v=2.4 cv=D7VHKuRj c=1 sm=1 tr=0 ts=681ca248 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=UVWNdVCc2wBdS-21L_wA:9 a=CjuIK1q_8ugA:10

On Thu, May 08, 2025 at 10:53:22AM +0200, David Hildenbrand wrote:
> > > > > (looks at vmscan.c)
> > > >
> > > > Current maintainers (mm/unstable) on 20 biggest files in mm, Andrew is
> > > > implicit:
> > > >
> > > >   $ find mm -name "*.c" -type f | xargs wc -l | sort -n -r | head -20
> > > >   198195 total
> > > >     7937 mm/hugetlb.c		# Muchun
> > > >     7881 mm/slub.c		# Christoph/David/Vlastimil
> > > >     7745 mm/vmscan.c		#
> >
> > This is, as Andrew rightly points out, a key one, I will have a look around
> > the git history and put something together here. I'm not sure if we will
> > get an M here, but at least can populate some reviewers.
>
> Yes. I would assume that at least MGLRU people are reviewing this ... and
> probably memcg folks :)

Ack indeed, will try to figure out who best to include.

Will either RFC or send off-list message to coordinate.

>
> [...]
>
> >
> > > >     4703 mm/huge_memory.c	# David
> > > >     4538 mm/filemap.c		# Willy
> > > >     3964 mm/swapfile.c		#
> >
> > The various discussions at LSF lend themselves to suggesting people here,
> > can take a look at this also.
>
> Yes, we should be able to come up with some R.
>
> >
> > > >     3871 mm/ksm.c		#
> >
> > As per discussion below, thanks for suggesting yourself David, I hope this
> > is a case of 'well de facto I am maintaining this'
>
> Yeah, it's exactly that I'm afraid :)

:)) I mean the same in my case also of course. Though far, far fewer
instances for me...

>
> > rather than taking
> > anything new on, as I worry about how much your workload involves :P
> > > I will sniff around the git history too and put something together.
> >
> > > >     3720 mm/gup.c		# David
> > > >     3675 mm/mempolicy.c		#
> >
> > Ack below, and will take a look here also.
> >
> > > >     3371 mm/percpu.c		# Dennis/Tejun/Christoph
> > > >     3370 mm/compaction.c		#
> >
> > As you say lots of R's which is good.
> >
> > As per below would you want M for this?
>
> Probably we'd want a migration section with sth. like
>
> * mm/migrate.c
> * mm/migrate_device.c
> * include/linux/migrate.h
>
> And maybe we also want also the following files in there (a separate section
> might not make sense)
>
> * include/linux/mempolicy.h
> * mm/mempolicy.c
>
>
> MEMORY POLICY AND MIGRATION ? I think I should have the capacity to be M for
> that.

Ack makes sense, will sort something out.

>
>
> mm/compaction.c is a bit in-between the page allocator and migration right
> now, but I think long-term stuff should simply me moved to the proper files
> and compaction.c should be a consumer of migration functionality. And likely
> compaction.c should stay in the "PAGE ALLOCATOR" section.

Ack!

>
> M for "PAGE ALLOCATOR", hmmm ..., I was hoping that Vlastimil might have
> capacity for that? :)

Vlastimil? ;)

I'd certainly support this.

>
>
>
> Not 100% sure what to do with
>
> * include/linux/page_isolation.h
> * mm/page_isolation.c
>
> (I hate the word "page isolation")
>
> They are mostly about page migration (either for alloc_contig... or memory
> hotunplug). Likely they should either go to the MIGRATION section or to the
> PAGE ALLOCATOR? Maybe MIGRATION makes more sense. Thoughts?

I mean it explicitly relates to migrate type and migration so seems to me
it ought to be in migration.

Though migrate type + the machinary around it is a product of the physical
page allocator (I even cover it in the 'physical memory' section of the
book).

I wonder if our soon-to-be page allocator maintainer Vlastimil has
thoughts? ;)

I'd vote for migration though to be honest.

>
> --
> Cheers,
>
> David / dhildenb
>
