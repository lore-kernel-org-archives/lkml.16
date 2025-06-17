Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896531A60
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159026; cv=fail; b=GxJ4dBS4ZKZen/fqY6hnb2TF9V5UOVQGn+2ijHI0WtiTAn7Vmygpd3yig/yaXoiBZi2kIT4CXptE33hkJ44bfaofpqpXqMfO/TFH5tTuphkxi+0gkN3ivSN7Lj4vu/Xv7b3JbLCKMJVSQNhgV0NFmv5bIPkms3non2CeExOAtHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159026; c=relaxed/simple;
	bh=eveiIn5SsWmDcVtGxFJHh9eFF/uxrx9OhmyqJ3/W9t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wc0r0pLkuDASDzdZy+v0cf+8hMGq+4LA78CH/fFa8WGgHXotMxHkUZSrEIREV93m2po5JmVHuiuyl3Qa558FssA5l36MkM2HikepSSuFcFyWIBUyUqEbmZ9voR2nNP49e3YGxGGYaRLDR6SREYChzca+/vxozfcBgih+8JRrf7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CJW93H9+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XLYYyjLQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CJW93H9+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XLYYyjLQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8tdLS000569;
	Tue, 17 Jun 2025 11:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=OOr2+qtmezHJP7DtOb
	cV9OGeWaZrzzX2qcUGhiNvWpw=; b=CJW93H9+4oxorzRhvvyLIHn3hfJVZjPz/8
	MXrqP9ECluW9bbwb4Bqf6AqBbqZjK3Gk4rXvv6JkxWOV9K/+8uiZApgu3svOKvJZ
	D4PI8BY1kwrSdPxI0dfKdwWMlfdrgTJcWI+M3jsIEscMUx9QCTSvHLui3RgZ2j/q
	Cd5EETa5gwi3MKv9z4I2+zNiVgAtCwHBikrEwaSd70GbC7irrAE5iE5Tv5lrLt/d
	asdL4lM2nSOrHYtuWzle/Bc2k8M7MRqvxLG5ymLX046k6ag9j8GAVDZ/9XuK4WBg
	UQPnkONvOjXHSCXyfqzQhlWa5NGslT7tZxe/6xZf5StUHsLTiaAg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd5249-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 11:16:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HBAL66030973;
	Tue, 17 Jun 2025 11:16:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8umde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 11:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQj4P5JgpV0VpsoY1B/D7rMnAFOHzhUkGalR22xJw8vdsv8NygfJMNL0NQPb6giASFBHik1Mj7I/lIQJIs7TqKeB/gU2q0hY7U4IE1pJgxGRFfEr+V5ouE3reFk6BvcSXEpMHnIG/XqCOQip7gYPSeuA0YSwSlCtqiHyR82euds6XvWLrAbdHBs/5shSlJBuwA/RG8HEr0wbYUGeoNUz24sp4Ba5afGfSy+805QrBNIqCnY1X6Ljrrn3A59OIEVqXu40gQXdblgzIuspyGOJfC2LnbLyKQHgZ+glalI+EFQKoXkSMppETvkoqsrdhlOLfVtbeYwmdTUOElSuK5e/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOr2+qtmezHJP7DtObcV9OGeWaZrzzX2qcUGhiNvWpw=;
 b=dENxRH15h/4RYH6v0SXpBQDAw8RJySAJYOamYGHZCDzGf3gtzh9MwNvZ9py+23Jik4ajl53t5E/HlaYG62x5H2JMrDZ4XKQVEhAWlT08K20jMXX5Q9tYASpPGG4XZ7Apj82I7PymcVTiqXw7auIu0GdS3shZYhaw5yWi452yNX3CDnoEd1WRGXjjA7hXurN96/SRnGwI2ftBoaZA7fFgYCIDjGw0ssW1hoPdeACxYAUW6qqDVrJO2+Yvcd0n65LL0RgpMi2EF7upKYHxOtgcd0VwjmV7Q3BNAZkh3/hj6hfJucmtiBLwOb5CcRhkI7S2rHN75xSV9I8VbCpHErsyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOr2+qtmezHJP7DtObcV9OGeWaZrzzX2qcUGhiNvWpw=;
 b=XLYYyjLQvC/cwqWCkFGbr77FOvWmjMasxgL7YMQM5dbGPhUQBzmWSofaBlDezKld0tF+aY1Pb3ozgO0UclA0umVU2WRDn9MjsfpcGPyHPl/uaqIZkw0Nno0YIGbgiZRCA/JH3O16yoCJTgSuB11GTmdcBUTQqOmRTuXr4ynRPds=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DS7PR10MB5134.namprd10.prod.outlook.com (2603:10b6:5:3a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 11:16:06 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 11:16:06 +0000
Date: Tue, 17 Jun 2025 20:15:52 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <aFFOTjLtPNp7S8sP@hyeyoo>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: SL2P216CA0167.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::16) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DS7PR10MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: 6994c22b-10e8-4c36-5da9-08ddad905a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XqCIAHW8cW5M2Rcm+7wTF10HfFJlI6XTcxjS/GGDlsOJNk3m107anWr8zC82?=
 =?us-ascii?Q?KIepUA6JHYuNjulEvnpyCQsFCZj7jk60pCqQVMMxxGBN034l3C5wfhUU97yS?=
 =?us-ascii?Q?XQU8TfJRxQt5pnG2OlxyMt+sh8erDIDgAsGxG2ikW7DX8eUlH6KSSRDbhDcl?=
 =?us-ascii?Q?9JRasnIRmd8d2Akv9B7SegjQKo6NpgzBp86I4QTQpzE+jkJn/ZbIsqbLNM6G?=
 =?us-ascii?Q?DS1Y1IYoZ/aI82UvGGOHpqpCuAyOogMRA25ONaFsvwcLmVPXQKcbh/+t+gUP?=
 =?us-ascii?Q?/AT9lvHSmAse0EC4vAdkNvifETEnEAITutbNMJ9zXguzBTBcWPdD+99s0pY/?=
 =?us-ascii?Q?9WlQAJSvuWAtNvQcfZCrIswlTaMyuZE7emkugiJL5YQ/64K/okAc/BkzkppW?=
 =?us-ascii?Q?FA2RzCAphFaGpKINID9o4TKXvuJELL+Zi2lWMejMOY1Tr34ldT8tV6pEjvA5?=
 =?us-ascii?Q?7FDnyz7HSZiEC0j0oHZuKTnesNCN+bfZToF6uLMp0YluVuQ50lgUKhGis6TN?=
 =?us-ascii?Q?oQw/FuvFYMZWTuq52Gyv8BEiW24/aKts720byWbsXC7jAdjR4TgCT9qCABpq?=
 =?us-ascii?Q?Nzm/l4F6OuvoDxT7uY6iVRTK7z1SePyW0B16wgbXLcPFiDBnNkpw1CX9zumX?=
 =?us-ascii?Q?sZJ/VDtZp7JUvygd+WVmULFjEQTAGdn64qJazxarIyR7oFaCinGAdOVeVyHn?=
 =?us-ascii?Q?93ZUvTESZ/SKzoBXLJ52bofZSfe/e5R4LwjO8eauNXB8XZSsTD9X5wrVxFVc?=
 =?us-ascii?Q?I15rhxJPLRof0rnHEW316wARuUebPFYTJwCKAtWgYY+mD0iXL6p8TlRiuaDa?=
 =?us-ascii?Q?ZwTzZlx0qW8Rh5pbvP+4VF6ME+RjOe6udYmofEHqr8rgLsX/pRPWoTBifVit?=
 =?us-ascii?Q?4MxdqDxT1l1Pqmvx+Cnli8mZD3E4fQHf0Afk7HrcSQnsLzEQ9JCvMgocihq5?=
 =?us-ascii?Q?BhmAus7SHCY+qjDIKhZROEGO8CX0GDz7lqFKSs0w3lQPO41e1qmJhGBKB4Fp?=
 =?us-ascii?Q?qHCoaYGtff2iOeEpqgYWJqN9bcw3enfkgIvm5jrBasu3+0d3U3Kp4U7b5fyg?=
 =?us-ascii?Q?gf/DC0S6RuE8PcrVuBRsbO+o3Qb0tc/mhHLCl4H1SItGOgHhGwMxm+QbW3oH?=
 =?us-ascii?Q?zyoV3QeEWOi3JDQ1c4bGrelUADLILMfwjGJJgoME7kvikCe1oYFqJKK1HD0m?=
 =?us-ascii?Q?RtvXtkKvqqxcubfYbykeRadCZFMgJNspIEti3wX7tb7VU9H4IqAy/WYyJdpr?=
 =?us-ascii?Q?ret0DoEWdFBTa9AqAqEjs702XUW1lAaYzpcPwEdDUKPYEYQvf9UPfqph6xY5?=
 =?us-ascii?Q?zPs3KDk3pD6co/wAe1uPeT3RxFX4Y361CKBw7mJXdFPtPnO20enUD6AvnMzK?=
 =?us-ascii?Q?Gy8ZRlF3S9yoN4ovOw7H9W142rPi7yLOXZZyNcK/ju/0vsAQsw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aY/hUAmx+ljpKULYMPkwtjj7GybV5rKWFjaypXZYV1Z9dBEdlUUYBwd/S0rH?=
 =?us-ascii?Q?SKTmO5WGr8ZyEydXR6Nu+B9lCG+gw72eZNWVYgZCOHLiF7Ikzoe31sSGzaEJ?=
 =?us-ascii?Q?SgGRDjtUhrEEGAStYMAmxT9czgnKCmbbJf1FudaDg5AUdK2HdXQwRPLegqYX?=
 =?us-ascii?Q?JvfT54BbHy7sMojBcHSV6Y/2G6BhXtX8wHn5YHhW+ukp0pXOnLhync2VeIcr?=
 =?us-ascii?Q?GDadBGCuypSYOtz+zaJhKL2SWEAscW+2nS1+6mahwFM4hm5JMTGQ2+ubO9TB?=
 =?us-ascii?Q?i9knzFlsH0rX9WuQwmj5xSvUU/93rcLKPDtfLc0NgBPIsw4zzoBfU90vup6a?=
 =?us-ascii?Q?IVn5ee51ltyoGAJvwC3zsalVKmXj88y5euBrnoKscb6F8dY+09P1nEDCbqlk?=
 =?us-ascii?Q?KO0mayH80esZ+tO3me/mxZ1OQqR4UyNPnf8UkwVj6qjHpj+HWCuLJs1zHnjE?=
 =?us-ascii?Q?UH11P7iWu0YeK9FDj+BgbgnAq5a51/2ddM+4AJDqgY4F1tayKJL/TZibfBPS?=
 =?us-ascii?Q?4x2/pMKzO3xNvv7GPhHU7jQ/0rWpa2DzlN1HSLZzh+t266orSpFSxE/IyBLs?=
 =?us-ascii?Q?mI7WzK3RW3BLLjj0q0hssJNfK+8px6C0Pbn0RHxKbhxvrGV46y8FV7MuugoF?=
 =?us-ascii?Q?d+lUIKlG9wOBEbfzSgQ7hiujbYadmgkjbTbit9Ob2g+g8Uckp7YzcObixzgb?=
 =?us-ascii?Q?FPMpI9gMEzw/z5JfR8qPJEy0MRCvw3yUQT2os/8Cz0zYek2enKuts3/F9gi7?=
 =?us-ascii?Q?f5U7FUAzhfxBlr+yQ7WRC3ez1zRj7Iu/saZ0Non+t6w0Wp79be0rWjbMgvXF?=
 =?us-ascii?Q?GEiTE00OZ3mvHBoQxCHReC36PQiNuqAcmm/okoEFh06H/UJWT/aPpJsIQrqE?=
 =?us-ascii?Q?GN04iDa1O1rJnwM9fo/xly7EAn8d3puSWWWzC6aNWU6cmSWenKoTHpQ/OVAK?=
 =?us-ascii?Q?BBZryza7BU7Hl39jiL/jiP5l1zOZiDRDfxKUBNbekYxZ74RlItNFU3n/Fh+3?=
 =?us-ascii?Q?5YxsF8GDhr6NwUNKTBARiYfDAoylsOoTqkH9j5zSwR2DgoQG7iqCMisxlZ0S?=
 =?us-ascii?Q?c+y0Bs0FQd7ahYCUD2ksDn2yDvs2oznN8qZDVZnoC/4JrquqY/e+1d5QZBJr?=
 =?us-ascii?Q?gNbIQadNl/vnIGIMLU/HkzrFCiqRBG163eVI9PRzBGAHZIRTsVFLlGNxwf0t?=
 =?us-ascii?Q?+HFiZ9PxdzEHH5nqGfSJq6JMly6XKIcNTybRnKxWfox8UsBeSalv4JjVk98j?=
 =?us-ascii?Q?BUnumVjGRSN+8kEdnbJOWre7Bkww4cIrivaUbAe0iXojnsruPDRC+9MlMnEt?=
 =?us-ascii?Q?GAEu1FhAczHdmn34wd3vywiF+8eG9b9fHrbv+YsUjUJs1QBfZm7SUZIxZwMI?=
 =?us-ascii?Q?iDapQnCit8MPMC6dYAB77og9R1+6cmUWnICLFhbWG9w6siuSkUz8l77SX8vJ?=
 =?us-ascii?Q?bOl77uyr/CuQeHgkLBlveXWduDGl65PscDeCKngIOm5890SUAYUMTPkEa2kz?=
 =?us-ascii?Q?93W/tNtufeF9S/SRxpA1GpJsOcKs/5uuu0KPDAN3Mxrxc57o1EgCRSrrtBFZ?=
 =?us-ascii?Q?NzTQn4dFO4cP2GO+DZLS8DD13cUi22bvRMigyoXa?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L1g2Cn3UtPkhlsgqidLpYLErEET4ELmKUmOjFbvT6Px8rYSDrRC4xG0t6eKsQ6s6v8SchW/ZlURaap5dsXv3K7NMPexD2s53DhqR3Sw69vym2KgOnPhcpSKG4Q4rklqBrX1fxvNvCSPDZPivT9p2NGvb8TG523Kc+yoWETqFLosI1vpiUWKGrNAac3kH/XViLxCTVW+jc+d3tECWFL2NVzJ8wpCwbGX1pBUBTkJ1Oz9rqWGuzjL4dTfJyU5TIFkCtOMVA1ypg6H81thhWCLKD5Odh2Zw+Ld1n27t04X9Cr0e0K5v5mehpke7/dufYTx6IzI0RT9gqjQ/9Hm/NwSqQJBtK3ej/WBys5QIJ/F5YJGuhLNc7QdYm5/pG6zQnKSa3C63piWI/Qoe6olgwsU86b7z7nFgezB9Vujr+MdknMCRfMfsjrFJu8/dvgQR98ZaXPx2B8j2vz+CI/yX72DI2KVNHsnYjPGhPQQmsUBVQzYhspCn77A/0hKAqHlUxdKrNANwKApr9UUBcRSutFxL4h7YAEsE+rlRDsxRsUt38olC320w4gG3vrH9lmm693MvZvcGDQIh3uFqJWmoKyGcn7tPLHPc8QIzyJDlxk/jfgw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6994c22b-10e8-4c36-5da9-08ddad905a42
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:16:06.0827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZjJGfW/sjjtjy6HSLWrECO6NV5OpGjQy+SwVanQiPtxMPYMBtwZf8pPNh90fFtW5cKRRvZdR0gDkg6U8yjw8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5134
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170090
X-Proofpoint-GUID: qodBQLuHEhhQjkvycpcr0-SWE8mYz8n8
X-Proofpoint-ORIG-GUID: qodBQLuHEhhQjkvycpcr0-SWE8mYz8n8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA5MCBTYWx0ZWRfX6Xeh+GD1PRBB poTF7bC4B1t5z7K631Oq/EO9SCp79ne8JSGzr4OkERfU+5bBR9uEMuuN/OeRj9Rr8TBDh2N4x36 hNKOwnEFYFMjX02itfWnkvjRqWlyh+0AuJg9L1qJHxFG/wFNVjvE0yLOwYfONZm3IS8lSMviRpi
 cCIWCHtmReDX6+x86qAPZEjkI2CB1N+4xwzGgbtBGTkyA5Z9f7ipoIjBgk7CH/KfIvdc0k07FNb SqNiiDRmQL0bmN/akOh0EtiypYEys6bDiTDMG2ogrWuzAGYi1CYR5yn562izvSfM8pUrYTdqh5V RXgNkJjtl8X0Os0FCkU2w44RFhBsBSEsT81Ejmdx0wNB/1aB7GVv8uuQwrXxdIOaUq8X5lQnrLq
 sZPiloYpogzBfPJPiMrsstsXMS+Sj5cdjrgIPeeAEm7fNWwDzz4dQo4IV25TqQdM6SX41L1d
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=68514e7a cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Pgk1ULY_s0Vp1ZFqf4oA:9 a=CjuIK1q_8ugA:10

On Mon, Jun 09, 2025 at 02:26:35PM +0100, Lorenzo Stoakes wrote:
> When mremap() moves a mapping around in memory, it goes to great lengths to
> avoid having to walk page tables as this is expensive and
> time-consuming.
> 
> Rather, if the VMA was faulted (that is vma->anon_vma != NULL), the virtual
> page offset stored in the VMA at vma->vm_pgoff will remain the same, as
> well all the folio indexes pointed at the associated anon_vma object.
> 
> This means the VMA and page tables can simply be moved and this affects the
> change (and if we can move page tables at a higher page table level, this
> is even faster).
> 
> While this is efficient, it does lead to big problems with VMA merging - in
> essence it causes faulted anonymous VMAs to not be mergeable under many
> circumstances once moved.
> 
> This is limiting and leads to both a proliferation of unreclaimable,
> unmovable kernel metadata (VMAs, anon_vma's, anon_vma_chain's) and has an
> impact on further use of mremap(), which has a requirement that the VMA
> moved (which can also be a partial range within a VMA) may span only a
> single VMA.
> 
> This makes the mergeability or not of VMAs in effect a uAPI concern.
> 
> In some use cases, users may wish to accept the overhead of actually going
> to the trouble of updating VMAs and folios to affect mremap() moves. Let's
> provide them with the choice.
> 
> This patch add a new MREMAP_RELOCATE_ANON flag to do just that, which
> attempts to perform such an operation. If it is unable to do so, it cleanly
> falls back to the usual method.
> 
> It carefully takes the rmap locks such that at no time will a racing rmap
> user encounter incorrect or missing VMAs.
> 
> It is also designed to interact cleanly with the existing mremap() error
> fallback mechanism (inverting the remap should the page table move fail).
> 
> Also, if we could merge cleanly without such a change, we do so, avoiding
> the overhead of the operation if it is not required.
> 
> In the instance that no merge may occur when the move is performed, we
> still perform the folio and VMA updates to ensure that future mremap() or
> mprotect() calls will result in merges.
> 
> In this implementation, we simply give up if we encounter large folios. A
> subsequent commit will extend the functionality to allow for these cases.
> 
> We restrict this flag to purely anonymous memory only.
> 
> we separate out the vma_had_uncowed_parents() helper function for checking
> in should_relocate_anon() and introduce a new function
> vma_maybe_has_shared_anon_folios() which combines a check against this and
> any forked child anon_vma's.
> 
> We carefully check for pinned folios in case a caller who holds a pin might
> make assumptions about index, mapping fields which we are about to
> manipulate.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  include/linux/rmap.h             |   4 +
>  include/uapi/linux/mman.h        |   1 +
>  mm/internal.h                    |   1 +
>  mm/mremap.c                      | 403 +++++++++++++++++++++++++++++--
>  mm/vma.c                         |  77 ++++--
>  mm/vma.h                         |  36 ++-
>  tools/testing/vma/vma.c          |   5 +-
>  tools/testing/vma/vma_internal.h |  38 +++
>  8 files changed, 520 insertions(+), 45 deletions(-)

[...snip...]

> @@ -754,6 +797,209 @@ static unsigned long pmc_progress(struct pagetable_move_control *pmc)
>  	return old_addr < orig_old_addr ? 0 : old_addr - orig_old_addr;
>  }
>  
> +/*
> + * If the folio mapped at the specified pte entry can have its index and mapping
> + * relocated, then do so.
> + *
> + * Returns the number of pages we have traversed, or 0 if the operation failed.
> + */
> +static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
> +		struct pte_state *state, bool undo)
> +{
> +	struct folio *folio;
> +	struct vm_area_struct *old, *new;
> +	pgoff_t new_index;
> +	pte_t pte;
> +	unsigned long ret = 1;
> +	unsigned long old_addr = state->old_addr;
> +	unsigned long new_addr = state->new_addr;
> +
> +	old = pmc->old;
> +	new = pmc->new;
> +
> +	pte = ptep_get(state->ptep);
> +
> +	/* Ensure we have truly got an anon folio. */
> +	folio = vm_normal_folio(old, old_addr, pte);
> +	if (!folio)
> +		return ret;
> +
> +	folio_lock(folio);
> +
> +	/* No-op. */
> +	if (!folio_test_anon(folio) || folio_test_ksm(folio))
> +		goto out;

I think the kernel should not observe any KSM pages during mremap
because it breaks KSM pages in prep_move_vma()?

-- 
Cheers,
Harry / Hyeonggon
