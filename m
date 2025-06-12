Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3EC19DF9A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739808; cv=fail; b=a2JhMeaxTm7o7aQFUD24juXXzsSiCZaxP3RqxK7dEqrTZUx799w7LK4ZjvT4g3AubbmWZWgpVFcznrHC8TWCp21dMj+oSTon8V7wgL6nn/bj75i1T/QVzJ0oOV/YpEYaK8StkEHV/f9y2NqrOI6IA9XDGguJHaqyvO5kYf1ikcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739808; c=relaxed/simple;
	bh=CRAOsTiRRSzo5fqkHaMW9PhD0oVBBhBQYWOnB0WG7+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TZiL2+opiFFqneWguIkIWNFTf6SUk2NiGpLRYLfWWlnYGIlOngYgaaIPDjEI/MyMpA+CjUBxnErVk3TdmvhsfeJYgmOosah8U4YGKImmK5DNHYgkZPZsvCvKqJPAo5ASgX+E269bQrLSXDonEIVfSGpoSwlCVfrZczVKZQXmtAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OU2RLwsn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mA+bc96R; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OU2RLwsn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mA+bc96R"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CDtsf2032220;
	Thu, 12 Jun 2025 14:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7djpzxHv0pcy+emaJ/
	mK160MlIYNVFB7aB6pzxBwj/Y=; b=OU2RLwsnzxjmNE3jy/+OtXlmuBAQLUFg+Q
	sJhYMTYyfEGqpCQ7LV8v6lYI086l2OGX7BbllPnt0vbpZ18/0qDjQ9KxyqK1C6KT
	Jj2wdXjKvlOWQ4WsG3HLhvKk2VMw3b5N5OgjiJi3QBhYzYRmO1Ns7noRnsnmdqKd
	G7BoRQk5Wd8UtyYpGOavVkHhmCx3649HhOOiP7lujAOg+cNCUVuuNUhwnZmrg9Rr
	BrDgi3oY0MLu0fiHhbNINprWmPA6ojUagYfuVP0+UuRAqsa+RVjY4PoKnyKJPUPN
	xo2PJvHYdOW/KurPmL2C+6RxYDIFs5EBoLau8/Evd2yPSLgTHXiA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xk1agq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 14:49:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55CDxru8016782;
	Thu, 12 Jun 2025 14:49:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvbpw9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 14:49:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhRgiHt2lOpfbgkCc9zE7NQbYeEXltmtPnF8cFlkuaZu5HXoAG32PDQnrsyNQ0hy9eQUGbN+LcKJSvKRvxQ2oXpig5ujWdQeprTpuZ6EzLzFjdmmKX6Ano+DECLoS4x4z6zIiT1166yOh+6SxGnR8wdJMczQyd8AV7cuKa0EeaRL4KyO9ute/pUSJoksyjYjzSKEVswYtmCcLh9E0sifc40L0Gvg6vo5Nn5MSnMCyOcpzZXVY9PpZzKzsdTL9P6ZefX1luOp01HGUZqvpZmk3jB1AZchyJj94cIk2u3D1WVqHEXUkG5QNqo3TyjkjnwqATeXPAs9sLF5GuFCvxR9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7djpzxHv0pcy+emaJ/mK160MlIYNVFB7aB6pzxBwj/Y=;
 b=WS9Pyox6EUaulljFKTV0Nfrql4GcjFC0CuNjMFsf8r9EP7ehzZOr1ViRlFFQCLY0m5SKqBNwjYn1tysgTTb3mfJR1cT42QtTt0HaKbahSvPFQlikL3bBUORwQCMrR94ZECwEvchr8zaQX1FVY9mo3onfeJ+Bh+6PluQ5LHs1sEmwUmEQiaXk+0m8wrO1/tRA0fZyPkmFlpnAbreI3vhIp609ZPREVwBFjDQrTse0Rqd+5/N89bCLM+XL2ywvFZdHJufu4Wt9cBbeZTav9y83vQQ98NuT0TaVVWTQeE5LFS2L9WRGpY4HW7+SbBNTY55nzd4xPqov8Ztr5WRdPcc4wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7djpzxHv0pcy+emaJ/mK160MlIYNVFB7aB6pzxBwj/Y=;
 b=mA+bc96RgnM8Np+YLUAaVCtYrhxLEUZ8o1AvUiID/KFBepg0h65HaQY1Rh3u4Kk3TqMcTcnjBekUxwW9qSnOXQoXfJhGSzqjRMuQRw/LpIssnrvXRNc5FdYVSoQxBxVQt1N91ToiTeQVUVkyZNF1vRbuRP8p8Uds3yyjt2M/aeI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BY5PR10MB4369.namprd10.prod.outlook.com (2603:10b6:a03:204::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.32; Thu, 12 Jun
 2025 14:49:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 14:49:39 +0000
Date: Thu, 12 Jun 2025 15:49:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        hughd@google.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <815f383d-8636-490d-8994-486be51f3123@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
 <97a67b74-d473-455e-a05e-c85fe45da008@linux.alibaba.com>
 <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
 <ce58b08c-0ac1-4ec2-8ff6-cf8e651709b0@lucifer.local>
 <ee646bca-e77d-4452-82f8-0bdb4b241f9c@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee646bca-e77d-4452-82f8-0bdb4b241f9c@redhat.com>
X-ClientProxiedBy: LO4P123CA0448.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BY5PR10MB4369:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed25feb-35ca-4237-9230-08dda9c05bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TTTgs1wJG9PsGs8Glhr+CIlrCX6mlV9zIFUi/W5IBV/S4UNa2cCEGtQj/UP2?=
 =?us-ascii?Q?wYEA/X5TZhzSPwSHM3PQ5Qy2m7EvHjiRVHxw6T41v9lv2Hu+0O4aDIBeebdT?=
 =?us-ascii?Q?Pph0Fe/Za+y+bzj+tHjSHfH9cSrrfrOjS9wptPCSnNFY4i3OnaBqBbEXiibo?=
 =?us-ascii?Q?o8ucz7T0zwQmpKqK7/B/ufDuyPGyhsmtdvs7CSaMjujO5x7N7MO9PXDIO5mt?=
 =?us-ascii?Q?yiS169Byi7YI+L8jZLJsukndxgO/1ei42WVTlepJ5iMi4E0ZCK+FeUuKsBxz?=
 =?us-ascii?Q?eEpWad3Sb4QM/zjO4NWN8I38/Vrol0GhsQEV2XtGQM9svieoh3jJUDJZ6okA?=
 =?us-ascii?Q?0x41DVRL6wgNtNPl9qBzdCiQqqF14Rb80z5SXVk/+GKwb2pegLZyLXzhpUpJ?=
 =?us-ascii?Q?ozmH4alSwY4qoO9aZHT0a0FurL5Ogs1FL+nZm4TccQozMasqJNMo6ZQ0lZit?=
 =?us-ascii?Q?9ZqULHjgH/kHECWX3uMONwhTryouJjJhGd6Pjw1zEM1UTPs/hSZ4Vh+16KyR?=
 =?us-ascii?Q?VIgE/RN5lGOYTCeX8BHdVYqf+xmLJW0+vhKPgPTseF/9zAB5wn+fWn4F0OMH?=
 =?us-ascii?Q?k/9LGg+mS6xjh4vH2RMpev+zRR0PeZs4KdbY9XAI/0JheEBzx2oV1w6hDzX4?=
 =?us-ascii?Q?quL7zsylKzqDPbtfuUfF6hwXzQmRGT+a6dPk0FPIhsbgitrFoY3uj55nEcO2?=
 =?us-ascii?Q?TZrdJOX41n3E+Kd3bau9fplHuJW2fARavN9zAw0BWzHhD+aiZG421foEqELV?=
 =?us-ascii?Q?8xd/xGRiSqvZF+w/DUQa34zC4RhAkTiXPrZRaHGU4MnT8Ao5ivnlRVhCrlZr?=
 =?us-ascii?Q?WUrlIEUwCFI18fIaq9G0XwzjoiqPtDWEyP9atrhsQ6OiKvTAoSDumIUnTdgp?=
 =?us-ascii?Q?1lMK3mG86P+iTN0lrMxke1bI5DImimSSp18+jgi8pLy/mKrQQAR9AuvS+d9M?=
 =?us-ascii?Q?oK62btOdXaWTi7QrD0TJg8BPGq2/+qtxJycZ3jTa208xC3evo1TEHg+6tH8p?=
 =?us-ascii?Q?94EAHZvlHJtgv/urzFuYyABFJALnifN96k2co1JfFCmA9dS60ri92yw6j6tt?=
 =?us-ascii?Q?Emav1pJRHDoFcmT26K0fdneRjIoOEoGLQC01bLuYkaBW5o0EWsr24AzCHZRO?=
 =?us-ascii?Q?LYnbEkuKxu44XDv+MNe6K2/XPS175/XleIgz4bIMsFabxyoQegZoT8KaO8F3?=
 =?us-ascii?Q?3QTSo/PU4sByufkzYq1W1J+SuujYLGlYPGW7MFMMGOwsMTLodOtpcjOQa3p9?=
 =?us-ascii?Q?tFZOw9IdNd6kH10Lyg+xNaNqksLgCfokCMQyPCOJXrYU+UlVNYhThkI34IrS?=
 =?us-ascii?Q?5+2JS5eG+i6eIzSKN7tG5M83miAPhSw77TDntXiJrozz5UjRWRDOre2JW+lf?=
 =?us-ascii?Q?ewJ+tOQgYCIP04ZL4kvpH8VVgQV+6NlIxdGeOgiqpGk8StjoGAbyDOtw0Guz?=
 =?us-ascii?Q?hrWTipkdvSk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4M65wr6J7Hf/353+3/wGCTvA/x6sdzQWhUCXGUnEi2EQe6piUipVDq+E4lqG?=
 =?us-ascii?Q?UDElmnorFE7Uy3uo+MdcukGkMduhjrIxxmGFclkdEDBr9J5VK6FXTZ0SOL4t?=
 =?us-ascii?Q?+tGK/SEKNAcLRFIC1jf2+j6QHc+ITPjhj+lAaAkCdEIbb6AfCO+ztrFXxXv9?=
 =?us-ascii?Q?/vQzTAseOQ+Pwj2458hZZN15FUywX/KEN1HWY1sHR6PT9x3JJDjXJZyTMetT?=
 =?us-ascii?Q?wRc5QSH/G0PLwQFbuDHWru2UAnvOpdKRjE5rW6+FTJzy8w+zeJE4bmC2I2pF?=
 =?us-ascii?Q?anJo0IhXsG7R/2X6olyv+m0gmwI9pI3YdAXNdW+C38s3BjjtFlQr00MR5h7j?=
 =?us-ascii?Q?yEdmuG8UtHVNMSBaSdrefDnqI/KDPwAn/MMUcWCuP1wFrFmHri0ZHbZdQsbn?=
 =?us-ascii?Q?SwaVwPVeJDbqvr+xX38ZNcBH2Qe3Zd4efpoBVa8XjXCA0KSI2nhFPryePetO?=
 =?us-ascii?Q?blmHf838O36l/wtf6bujUs3WhksNHuL/dMAE/ahJu/c6R+whasZyx8XW8QPJ?=
 =?us-ascii?Q?q7K0ihsngi8+jxC4XewI2E+i8bKMlGPjJT6ZCcRDVXSYVHXl889VX+6e8tUL?=
 =?us-ascii?Q?crCHGLA5hbZB2qCIxJ5axfQBu4ntMd9OYHfHhYA6j1hmkrM9vpbRzOP0JY38?=
 =?us-ascii?Q?xlVZBawWtut1E6cb2A13pPHn2kIfwl8omjvGg0b2EmXXfvR/1235+EeUMAJ7?=
 =?us-ascii?Q?oxYSRbwOgG0jsQPdO91SnPudCHGB0qjnwROzWL+h09mVvN3PipBEVeL7mNXD?=
 =?us-ascii?Q?ERlAZjfY5lpJdKaJaec5GiZYY+ZHHjOufMFWsvTol0RkfeJws1xMgMR9qCko?=
 =?us-ascii?Q?+CyRRNWbQ6CT7bJEYS4U+fdoYOsNRRYdJ5UReVKRLUF2Hhgj/W8fzSiesvYj?=
 =?us-ascii?Q?S8lnZg/9sMxZJpmH9u4g2cRlPHkjZon0eYpj3L2RQz3zr1I0bU7MDoQTG7xP?=
 =?us-ascii?Q?gP+Kh4KPE7MnxIvxWqIKr3kt6ECeq0vxxhjSwVMndHOe4VYhR09Y3RXg/Q/t?=
 =?us-ascii?Q?dMev0Vz6cejjWOgsMEM4iHDAjO6MoJqpoP+peT31XexA04b0FTXptY5ft9WJ?=
 =?us-ascii?Q?9zmy5Nga1y0GnA3EP/BS8gYuChuc9LVxJixZuUOebpAyVy4pr+cwvkXB5NZY?=
 =?us-ascii?Q?Qj4anzEsLvqaiRuO80rPUgGsnhrfEJKNAjeyod4sA+dtWR375kwjjKkETkwF?=
 =?us-ascii?Q?T5u2pplKVX7NKWpyg/y3vnHDKsWuipIM3mhg+sQ78q1I9rF6WL2TkSXwkiN9?=
 =?us-ascii?Q?tnuaK1dc6s22H5/DKMF8Ot8zeCd+QlYKKJRdw9jIjlWc1IWUZ3gBsZSQHH1x?=
 =?us-ascii?Q?+9rF87GfjLn82XeltV4nzv3VSb7nRGJfz902k8ZMgv//P6Ds/C0Q3tLmVHxS?=
 =?us-ascii?Q?7H3dfUXDd2gDs6MusrrSvoBRcgKaKnLSf2BVn3rduCZ4Y7AgisZRTGtkgLXD?=
 =?us-ascii?Q?ddR1wys1QX3JpXReuyTt/R+R2xT+VDkQYCVRCoyfxpOrvH2HjdobvFDdrR6O?=
 =?us-ascii?Q?EwaKB7Qt0F0UhoWjkqZ1OUhGOl6zzCdzOH6yXa+2veEcI9upANcZV3UiwObI?=
 =?us-ascii?Q?yRxSD03OP5VA0qBnCUwm/isM1bor+ZQc6mT+bj6VbQ39+pfAhoOaVPSEafpw?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nFH/Kfphx0I43P8EQFNeNEWaA+POwZ/bNMazYT6Azj4GTvvAaap6DCKdrzeHVRyaVWoFNdcrAQoYqhzVa4QRUu344PNoj/Yoj5JhoUNyxdCVDGrr9spUppnkW8GecbmJmbZT48C5evhiI2vUhOx9wam+iFTXW0ydGATYnTXLr4e98B279rfmgzwUvNBlfepy7fgb9+NUB2plMM3ua8QJ46nBud+z2ezYCl9uT6RDMGxhWZzgk06SUS21Y3/shR/TMco3ovsiaM3B/yloQP0RZGtAQMFEL5elNW5zcqchejyxXPCQcB7xwttFqRcMToMn7FmrVPOux6TsQfyGdKGv9T4ndm0MlluPCzldCuT0yCgglVmdn1/yQeYSZDIKeu8EHgPvtm5xYUCBqG6lBSOe9pGsRIy/utkH8dPa3P5nF4Jd8CzEfh5l/2strRVD4UWTLsxsIX4EfrC6B7zqAEZomt/TrjelsDRYcerWwa5BJX/PYEvrmOSDhSzQKJ/yolP2e4nHkys1h2NNXqh3QDPFMnNoJ1MRY0Vy8Be6vj+Kz/GKyCtf6GBFSFH8lAvLfns/JWVG/CdE496fVZEuUj8KJIVizxODGtbyxW1vwY7h4QI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed25feb-35ca-4237-9230-08dda9c05bcb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:49:39.6149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjIDhwlWfnJAfjw5xWa3LX0dLOvW9BXZcM6VeYg6gAApoLznIDEnQe6Q0vF6Mfj/fzTDUiTl4qpUMZmRJIyUpr6IyyD848n6TkpWOTzeAdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4369
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506120114
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=684ae907 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=2bvqq_l4ezST_ojmyFwA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDExNCBTYWx0ZWRfXxfG8TtktHgAM LoskgTMEFe4kCvipG+J6eHPmWRADiIyOfgdsh92Zl/kJQvL78Sbim5jJPXV0orDVN0EQ+Rm4l+F WOy42V9jkOaF3oCoW2SZJ1JcmKQAilXa5mcbw7Hh9xy+i5A0a/zKqYlkfw9mUE8lccUp35wlQsD
 Vw5fQTu5lxa7eTCvrWA6ccRlgF5Neb5hGM9G5JALyTPU8v95TegHaTSJWq7GFRTZx+h+8yfdfnC f2j2r/MUJ5goNGKvBODFgFAoOoMQOxN+F6ZuEJSssesKNFPKf73QmmqQuZG+HKALp2A1vjJU53K 8LmLsk2ylMOYHfl9DsQVLrAYOgFdulZM0SCW9jlqtLCkaIvbJwNJBiijenzYqnC6XYurPKbev43
 NDnpU8tKC7lmQngduFTIEw+QFNLUlPwbkF5eQTZzpc4VBtlWSR30YOoPT217pQA+trQP7dxp
X-Proofpoint-ORIG-GUID: gpBCmZtRVt03CCixNYA8DTJDTye08fcM
X-Proofpoint-GUID: gpBCmZtRVt03CCixNYA8DTJDTye08fcM

On Thu, Jun 12, 2025 at 04:09:27PM +0200, David Hildenbrand wrote:
>
>
> > > @@ -265,6 +265,42 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
> > >                                           unsigned long tva_flags,
> > >                                           unsigned long orders);
> > > +/* Strictly mask requested anonymous orders according to sysfs settings. */
> > > +static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> > > +       unsigned long tva_flags, unsigned long orders)
> > > +{
> > > +       const unsigned long always = READ_ONCE(huge_anon_orders_always);
> > > +       const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> > > +       const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> > > +       const unsigned long never = ~(always | madvise | inherit);
> > > +
> > > +       /* Disallow orders that are set to NEVER directly ... */
> > > +       orders &= ~never;
> > > +
> > > +       /* ... or through inheritance (global == NEVER). */
> > > +       if (!hugepage_global_enabled())
> > > +               orders &= ~inherit;
> > > +
> > > +       /*
> > > +        * Otherwise, we only enforce sysfs settings if asked. In addition,
> > > +        * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> > > +        * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> > > +        * set.
> > > +        */
> > > +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
> > > +               return orders;
> >
> > This implicitly does a & mask as per suggested previous version, which I think
> > is correct but worth pointing out.
>
> Yes.
>
> >
> > > +
> > > +       if (!(vm_flags & VM_HUGEPAGE)) {
> >
> > Don't love this sort of mega negation here. I read this as _does_ have huge
> > page...
>
> Well, it's very common to do that, but not objecting to something that is
> clearer ;)
>
> I assume you spotted the
>
> if (!(tva_flags & TVA_ENFORCE_SYSFS))
>
> :P

Lol yeah I know I know, I just think I guess in this case because you're
negating elsewhere it makes it harder...

>
> if (vm_flags & VM_HUGEPAGE)
> 	return orders;
>
>
> Would have been easier.
>
> >
> > > +               /* Disallow orders that are set to MADVISE directly ... */
> > > +               orders &= ~madvise;
> > > +
> > > +               /* ... or through inheritance (global == MADVISE). */
> > > +               if (!hugepage_global_always())
> > > +                       orders &= ~inherit;
> >
> > I hate this implicit 'not hugepage global always so this means either never or
> > madvise and since we cleared orders for never this means madvise' mental
> > gymnastics required here.
> >
> > Yeah I feel this is a bridge too far, we're getting into double negation and I
> > think that's more confusiong.
>
>
> Same here ... I think we should just have hugepage_global_madvise(). :)

Ideally in future not have these stupid globals all over the place and rework
this whole damn thing...

>
> >
> >
> > > +       }
> >
> > I propose a compromise as I rather like your 'exclude never' negation bit.
> >
> > So:
> >
> > /* Strictly mask requested anonymous orders according to sysfs settings. */
> > static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> >                  unsigned long tva_flags, unsigned long orders)
> > {
> >          const unsigned long always = READ_ONCE(huge_anon_orders_always);
> >          const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> >          const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
> > 	const unsigned long never = ~(always | madvise | inherit);
> >          const bool inherit_enabled = hugepage_global_enabled();
>
> Can we just have hugepage_global_never/disabled() to use instead?

This would be nice!

Could be a follow up... though again would be nice to somehow do away with all
this crap altogether.

>
> >
> > 	/* Disallow orders that are set to NEVER directly ... */
> > 	orders &= ~never;
> >
> > 	/* ... or through inheritance (global == NEVER). */
> > 	if (!inherit_enabled)
> > 		orders &= ~inherit;>
> > 	/*
> > 	 * Otherwise, we only enforce sysfs settings if asked. In addition,
> > 	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> > 	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> > 	 * set.
> > 	 */
> > 	if (!(tva_flags & TVA_ENFORCE_SYSFS))
> > 		return orders;
> >
> > 	if (hugepage_global_always())
> > 		return orders & (always | inherit);
> >
> > 	/* We already excluded never inherit above. */
> > 	if (vm_flags & VM_HUGEPAGE)
> > 		return orders & (always | madvise | inherit);
> >
> > 	return orders & always;
> > }
> >
> > What do you think?
>
> With the fixup, it would work for me. No magical "mask" variables :D

Thanks!

>
> > >
> > > +       return orders;
> > > +}
> > > +
> > >   /**
> > >    * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
> > >    * @vma:  the vm area to check
> > > @@ -287,16 +323,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
> > >                                         unsigned long orders)
> > >   {
> > >          /* Optimization to check if required orders are enabled early. */
> > > -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> > > -               unsigned long mask = READ_ONCE(huge_anon_orders_always);
> > > -
> > > -               if (vm_flags & VM_HUGEPAGE)
> > > -                       mask |= READ_ONCE(huge_anon_orders_madvise);
> > > -               if (hugepage_global_always() ||
> > > -                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
> > > -                       mask |= READ_ONCE(huge_anon_orders_inherit);
> > > -
> > > -               orders &= mask;
> > > +       if (vma_is_anonymous(vma)) {
> > > +               orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
> > >                  if (!orders)
> > >                          return 0;
> >
> > I pointed out to Baolin that __thp_vma_allowable_orders() handles the orders ==
> > 0 case almost immediately so there's no need to do this, it just makes the code
> > noisier.
>
> The reason we added it in the first place was to not do the (expensive)
> function call.

Ack point taken!

>
>
> --
> Cheers,
>
> David / dhildenb
>

For convenience, I enclose the fixed version + tweaked the inherit local bool to
be inherit_never to be clearer:

/* Strictly mask requested anonymous orders according to sysfs settings. */
static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
                unsigned long tva_flags, unsigned long orders)
{
        const unsigned long always = READ_ONCE(huge_anon_orders_always);
        const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
        const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
        const unsigned long never = ~(always | madvise | inherit);
        const bool inherit_never = !hugepage_global_enabled();

        /* Disallow orders that are set to NEVER directly ... */
        orders &= ~never;

        /* ... or through inheritance (global == NEVER). */
        if (inherit_never)
                orders &= ~inherit;

        /*
         * Otherwise, we only enforce sysfs settings if asked. In addition,
         * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
         * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
         * set.
         */
        if (!(tva_flags & TVA_ENFORCE_SYSFS))
                return orders;

        /* We already excluded never inherit above. */
        if (vm_flags & VM_HUGEPAGE)
                return orders & (always | madvise | inherit);

        if (hugepage_global_always())
                return orders & (always | inherit);

        return orders & always;
}
