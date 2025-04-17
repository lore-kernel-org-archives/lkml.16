Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB84324E014
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910328; cv=fail; b=tDvtdsxRM8ZebAnjE8I8ttgPbNsEb3V4yyfbi51KJQTrX1Q6k3tb8jhEBDOYbGFIFcbG8dsl98SJ2tzTVudV2kM03LOfgKBSqf/f/V+vu1vA6anYz1F7CfdGYYQibi6MUpCAPyLE73D8kOrj58nAZLHX9F6qV2LT9boUH2DdbkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910328; c=relaxed/simple;
	bh=3KHmC8K744GpvCTmfDQa9VdvsQsayO5iU/bIbaf3rmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YQcMHD3u78zI5I18E20//te4mTJne8f4bfQf2aDtK5JVsCqhV3rL66y0daZ/6IM6e8M7zrPK3MYRespb0RXvxtlQC/0JUuL+VK3Ukj2mTULaMEmVMdKpyTVydY/RwpApifANO2oUBmLN/078bN0jOtjxGmlkPuNrIjPa6Bj3EAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Xa06gkVT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Pv8n3NSK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xa06gkVT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Pv8n3NSK"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HGNgaC025060;
	Thu, 17 Apr 2025 17:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ArIsYz2mykpxgA2Tv/
	T53D8FFmo9P2AerhrHeEtKRm4=; b=Xa06gkVT61T62lkDHg4qkC+NCAt/TtprTK
	9PFZVrq8/yW+6vZlRogHv4ipB7FyPJcCdPUAdCU9sSXqrW+kJ1hFE/1KzfE9rlez
	j441IAXoKR3RnmbZRV/3GkTle2LzODs749CwUWMsDrVmKGHJuRvBSBKGBw6TB7WR
	PSWiRiXvQMU99TiudIM+ZbG6XpjTozKVxInXvmSPyMpZSZlC8pIu+5gkpLPvlsJ9
	pcM/IKoYvgkxsQpEfexLKUIuV7aH5lYA8kYcFFFbchahOS3ETFzz+r6gER6MPu9f
	E0eNwtE3tzgBraVvUaWhUHRb7iHg2eTQTxoogH6o4R8kKFCY8QMQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619446rs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 17:18:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53HFX4qM031047;
	Thu, 17 Apr 2025 17:18:33 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012013.outbound.protection.outlook.com [40.93.14.13])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460dbe3676-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 17:18:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fml20kZ0yyneZUKAsE1lm6PVDt+eQI6s4I5d9i+DJGXaTr0CLI3sTryoC9JUY0tpQRjW+W6LLSbHRXbe1QH6cHQoTCoy9QVgqDe6wSCFEmTA92/4uh974rWy4emugerqG7fIRTc0dpFwfbGxJkQZtnQMErPRywGPKui+pinwfxqj5aQOMRZGcSlp5Jig42fFPihflmxJIey5g2CTfYJb12kzYkBkv8u0fF4bRXVQsrBOa8VdEdxlRgxy5PR90y3hr5p/wvm8jTuPYoSTR1ckFxCAXHnw+szxNRre6BKAMsoZPrHhC+V2QScRwCHkRFqwNhVGTa8wN6acvISkcbyZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArIsYz2mykpxgA2Tv/T53D8FFmo9P2AerhrHeEtKRm4=;
 b=sgQFPb3l3xR7ks4gWGtdKts2iUEEADMDPAlg2+61JLiDRz+FoAOVWimAa4+9OOdk8yrdm5dSA6IjOPxuSmYNjfZImF75sTYWAALMfPQpJxlBGsdJ2WfSgx73x4m7R6YYSC20GpTDyEEPnyBYcv4uastMkfz3D94iZTHbf9GgMwTEHOHhRZFa59+iGNcsiKByNheBMesbh0S0zuACalZrRMdwzj3Jw5O2frKvKVJZf4Wf4TTbSkDBHSnmthCEe2PzveBxavaOpKFK+F1Buh94XOy3i9y/AfKmzNzG8BlcpqfB2W+8dpuA41+COo5OzU4VSdzjFLa9X9WOzKIXZHolGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArIsYz2mykpxgA2Tv/T53D8FFmo9P2AerhrHeEtKRm4=;
 b=Pv8n3NSK9sdV1rNNA0QtqPsE3uRJmhlb8WU7it+UsjglSzZVJFrAJSHDK52R3dRy388fpDfcjl/d/N3TQVR2xxQTymNzbTke35UUsjlpYhXAycILoRbeZyKF0zyPZjQS1cdWG+XZDbVkzqjxg3cXTrIFZoVA5CRz2SvgMYZlmPE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CY8PR10MB6908.namprd10.prod.outlook.com (2603:10b6:930:87::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 17:18:14 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 17:18:14 +0000
Date: Thu, 17 Apr 2025 13:18:11 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Pedro Falcato <pfalcato@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: Add Pedro as reviewer to the MEMORY MAPPING
 section
Message-ID: <rmm3lgqdudfm7zupyinht635ihlstpbamhwdoa6y7l5kkhd3ok@hofxm3vqg3op>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Pedro Falcato <pfalcato@suse.de>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250416135301.43513-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416135301.43513-1-lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0336.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::20) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CY8PR10MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 30652956-4684-466b-2dee-08dd7dd3d64b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NpdF9hZAoOPu0FyIOXT9G9/5wJU8f36EFZ07Fx1T5fthu6sr++KuhbPMeJar?=
 =?us-ascii?Q?mdNQRHIYyAjyjZ3qKO/rAUcSNcIo0XFbKuzYhTzD2dYEXPvuMRXFI5FmDl6/?=
 =?us-ascii?Q?TRbZO1zuTjIn37InbRRKLYS+WLxXX0WfNsmR+J5GKZeTXaHwLnXx5B3nQbGu?=
 =?us-ascii?Q?HcLrNpE536dBMLBveFlVH5wGUx0AiM9wZwp8OFdvlmYm/33W6UoSR+z18enr?=
 =?us-ascii?Q?uSZOFkv/WM55Cq72biqa8Yq9IZMj1YKFFxoectPo3sgsrdcHa4qJQ0ayo+Po?=
 =?us-ascii?Q?LXYBZGN165JG9zllpDdnqJeFXcCZMZn3fzS37yfpotL9w0frJjgM5QkezHav?=
 =?us-ascii?Q?TrGouHLmXuZv2MiNE6AJioN0mjlYZkF84vs7WTbvF0EZIZsvZxoysyU9DJx/?=
 =?us-ascii?Q?9W6Zz06XF3f1vfJNXhZReDfm9SHqU54qc6h4j/PXL4pWCNdksMyFsxJWgcv3?=
 =?us-ascii?Q?WRlUx6i1+S2fUDuv+bEttUwbgeZyhrjSsgvcg9F2rJC0Sor8iymgoXzxYnAj?=
 =?us-ascii?Q?fyVVYQ+O7EGBpbKFdjiAYXLHBJN6LdC8mqfT26enzisTy+QlJKjS/g45nQrr?=
 =?us-ascii?Q?G87zTV4r1ZVhEkXUxsxSPqAaBS6LfNWRcvyO91NVhTMZutctZ0x1XYbUJza6?=
 =?us-ascii?Q?h1gMOjBTOgrN5sHQwpv8zi5ZCcIm8yG9qjy178vSggZugrLDn3mGjRHcT8Nc?=
 =?us-ascii?Q?BlEbtUapNmEtPj1DZzrT6t3AobSoVN+OfID0FidOc6XN1dGfm5T757GfR6Vm?=
 =?us-ascii?Q?vwUzQL/+7NJvM3VzfY+vhwPhe7fgcWnoADks0go4So2m2SwV5lUhwrgJPawG?=
 =?us-ascii?Q?2VGh8JErso0X0sQNP3lhZ8ebGNLciec143EMcT9syQNodii9/SLKVWUj9uM+?=
 =?us-ascii?Q?FUUC1pzHGBxcTsMzyNUEWks6qz5Ft1Nq26lhMw39AAK03vTJld7ZMya4LFJS?=
 =?us-ascii?Q?nC5k3kncMka9GOwLwRxHiVFUefwWjiclaorhjjjK8XHe3bMRq2twMXSpW93/?=
 =?us-ascii?Q?pooXNJrip9n5LKbnC2E8clqLgVhzvuAkvljAMDvRG4JwQ3HeQXYzCox4fEG0?=
 =?us-ascii?Q?+dpnDLEyGf96OqYIhOjsL/Va26pk6ItN5UCwUSDHz8aPW0lNn/8VwH+HYsCE?=
 =?us-ascii?Q?N74il3R81gg176eGxf/xysv1U3RDaSWmpW5W8vOZ7Yvv+xSWIOU6o9cliXrY?=
 =?us-ascii?Q?odozj8CaPJdJcHKNIog40GXsSXN+Rzx4XHCaM7ptkTooAkRRhTKdjp4aHLTF?=
 =?us-ascii?Q?LyqAHe9qAjAfJA+7fFt2dkPU0TJlh4PhIV7d16UsZZiygT6eVehkCrPYuh03?=
 =?us-ascii?Q?VH3YJBEBGK50VJXmoVRy8yGKUpJ4kCSKC7r7zOOCGRBEqAm7wIUrVFrnvRzD?=
 =?us-ascii?Q?qGxPMnM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mp/jqXJLO7fO6mRibPZX61GGMCY3zwna+SUnvNd3xsgjc8rEPCOmT3eN2tRZ?=
 =?us-ascii?Q?boQpQXIQQV00P7TtBEcpjOACdDf+MULMu4MHEvUhNvuWHluVjxczWISHn6g2?=
 =?us-ascii?Q?rmfXdkdGXzbemAGQAAV6XBuf1UW+nrDfh3vfw5qT7u0Ha+6mnMIHQFcXboHe?=
 =?us-ascii?Q?0v4UzQpS1Wb6woI2NKbGdrPlpr0OLiUpcDKm3XJU/6FDXoePgtxfOrchf1A/?=
 =?us-ascii?Q?nwfWfe7V+w6q/XzIQxA2qHCxU+VKddOPw3NTVBBAmNjaa6ORZ9XeawBIoyKR?=
 =?us-ascii?Q?hWpoPkJdh5Mpqzpjbt5+X0HX3l0s+kUmZKyLcgc8jG6TeHCKUAZEex7oeaC0?=
 =?us-ascii?Q?obe6vBcSFGxeMSZBLxn70LuIJlFZb1tUld6fqfOq7fure3Xi1pX1xhGfrO89?=
 =?us-ascii?Q?Q/7z1JhV7xuP3y7AzHxX6rp3IpMd3wCHsRFwQe7h/7N1GfwIqvwufN8gykgM?=
 =?us-ascii?Q?vKcGHpcenk8+g7/MuXf4hXOuia54WQXKgljsujbbTO9qjyyjiJ1dtZ85432f?=
 =?us-ascii?Q?vd4aoAFUGI/z9NUdNjq36APeI8BuvnmW6kx+rx3uvR339KewtNcqn2wiYQQC?=
 =?us-ascii?Q?2VsQng+ei/I9L1RCG3cpVfvQ08LpDAsM4R9gVaSe1hhA07F81jIXxRnSA6Ga?=
 =?us-ascii?Q?duvNVrPRRpXaGlmYWjTuksDQVJhkyDiQrYOG6GxrHyIkd4fK8Lh9PuWvg9E6?=
 =?us-ascii?Q?JPqsNVKEAyZ3Hbhg/Z+GLgkgfMgqrNuUxzPNG6EidC19sWYpPeQeY2shkYSZ?=
 =?us-ascii?Q?hdjUKjgppabX4zJfbPTl82BXzIFH9L2piBmVu+zRO2SlPZ6Qv9C4K27L8VbG?=
 =?us-ascii?Q?cXz0Kl/H5zgQOJMZu7U58eLClD15s5/FvWqjKgogmRn9YcNvxEYBhoLj2hbG?=
 =?us-ascii?Q?2Mq3MdcInmbdmI2cKdwjpQPswlqYPZEgbxcdDYjX1H6SsR3z9L6yWbr5BRPC?=
 =?us-ascii?Q?/Zy2j0c3HVsT3up+t8sVSwVy+DMKbLAqAppd/TZ5y6LGLjnfe7jvvpSHObvV?=
 =?us-ascii?Q?tF7ysCR3wCmotQx8m6XbIbEZodx4Shca6zSBUq4Gmx6in9WsBGJthjmvFfc9?=
 =?us-ascii?Q?tHee/Ew5cx8U6dVwTFVxIQal0cCByBpISwMcB3veSNkvGr0ED1FHV9VasN5d?=
 =?us-ascii?Q?IBQ46jVGWX6WeAex2sgpzolIPneLED2Gn1HSH+6uYp7pftPgGwYe7zaT01uX?=
 =?us-ascii?Q?do7fEo92+w8ciAVj9rk5zq/ywDY4ZGHlCZCdRcaih7snRIwhg4kfXUkS9xfT?=
 =?us-ascii?Q?5f9oeIJdZnb6k5D4eYhy0FIOo293TFnQ6hkpXTLaB97dwKO/NNbVFGXOj6V7?=
 =?us-ascii?Q?heMKlXozwrVqxU78zmSJuQ3mVB/iVHMTfU0QcU6UkXWWDwNfONt2mEwB+qFC?=
 =?us-ascii?Q?z7+rcrJlcgk+8tvDUpmPjUlV385VphrGX4hU7Cu6BEPn/XbaL86BFHp5UMw9?=
 =?us-ascii?Q?64Tm5Ou1G1bHrTK3Fy0jkF0gTA8R2qO+GLGp2WJ1eUujTKBhRMvsckMJwaKX?=
 =?us-ascii?Q?YXE5p3c19R9iPRDMserEo1wUkddkJKzMKFRyp74OwisILQdOIb6LGinZtTLa?=
 =?us-ascii?Q?NCtI9sWEkN0hTzeZMVd3ZVGIKOv6fuqzO8XUKl/f?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2zEFrI5+UXRnsJrlpsEVIQ7r+NTbfs6pv3c9covL+15fYB6rkSVN2xCHVnFZRvSBoS+9RFzl3276tjnpvH+3TlkOXsu1oIb5wY2WsQi2FiFTEYzYLHE5nnkbBGtXC8s555tQZQNOeT1wHwGjn/+MwkoNuvqAoVH/pJ87gZBhTB/Oe5l/gCYCsbcLLw75B9o4ltEZ1VntTWpkYugsuiOwNEWrzyM26sLJCK7GB56aQo1zPKuW/iGLZVCqSaqDdD6KQFg1fr/F9FFA6xyITwGa96hM9UlGxx3bXuiEpEoHhEqEft5r2KqnEc3kxWHPEK7X8DzvcbFxzxkkOKZ1AsVIbFigrkoIECb0q46GDvl+6NYoXwfVSk/Rlm9OqQYds+sM2h0WHMJxol8qblJDmy4IHzlV4oWcCRhuPqd6D6EVihYUekUSoP9L8uDD8vRhp11xuqqAMmZjOdefSHPAtXIyNl4p/HHUsLC3NSGfAHNHMfe4TvqbPUJjBC7JZGNIHyXYPtW0fpqREQyAG2Y3tuOu4iCbstQa5RSaUj21qR7i9QIiPXrnyMTIhYH0b8pO/KincwUYAMNJK/rubUBoihjwsIEmoG27o0Ptr00/FjTvbbk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30652956-4684-466b-2dee-08dd7dd3d64b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 17:18:14.5150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBVk6dWYrrJHDTpZE+M1dYUs+YDC2x4AeR6wqRUArCYisAPENyTxi9F8lnI/pCWAUYAvVh5/ZAA1TMLK3AYtew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6908
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504170127
X-Proofpoint-GUID: brFt2KOjOECapt4Dmpg170NEXQF1P8yk
X-Proofpoint-ORIG-GUID: brFt2KOjOECapt4Dmpg170NEXQF1P8yk

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250416 09:53]:
> Pedro has offered to review memory mapping code. He has good experience in
> this area and has provided excellent feedback on memory mapping series in
> the past so I feel he'll be a great addition.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d834514a047..ecbf9bcc7b57 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15579,6 +15579,7 @@ M:	Liam R. Howlett <Liam.Howlett@oracle.com>
>  M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>  R:	Vlastimil Babka <vbabka@suse.cz>
>  R:	Jann Horn <jannh@google.com>
> +R:	Pedro Falcato <pfalcato@suse.de>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
> -- 
> 2.49.0
> 
