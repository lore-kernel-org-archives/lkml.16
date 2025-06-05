Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2124.outbound.protection.outlook.com [40.107.223.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CBB1DFF8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145866; cv=fail; b=XUeQkeGBLZ19FBIuKsB10kYG9kHr9eGM4XfFOUqcXDmkPGS4/3O+jwxm0szxe4b9o5jPTjK0pk7Lw4U2GDvKwe5V9Fg0a18gIGKezI2oHUuv9l3LHAOs0+SDd6UM0AKIywj9Zd8onKJ0etRYecYSVTdJB1CD34rapW7xIEKXSZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145866; c=relaxed/simple;
	bh=2p8db8iDxIIDMWLSvAlshHizTE3cYvOvxRseGUiTujo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y+huhL1CN2Q6sMXn4WbT54CEvE3/HmNdF5q+Da2J362JC3NKkAjTtB3pCihAtpZM43prq3cy8wTQyvbeAe34CL1A+J1JXYeYx9ZwnAuDnphjqMpwe38qvLNcie9QdZ0SRyI+o8/GHygrjheoxm6xaobfoo9PCF+GBhP6zN6FH2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b=nyJYQxeu; arc=fail smtp.client-ip=40.107.223.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b="nyJYQxeu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZIKbz8BI3JpAZ8tXcr9rluQZ5tLwdVMEEzSmsekMtI58dmZlsv1m8rEDBHu7raTaa4009B1rzt5Xp6VlpnQoOUFs2QreAMDkv3ymeQER32Oiwhw5ju2X+nxWQ5zwZd8gwo/SGzrXMLWdJxwmb/BFBxcA9jHmNiRc5d6dfVCoehZMw524Yh2hw3DayEWUz8hA039SDJ6Iq1uC0iOHukifU2mA7Ae1pWn0XWvAIevbHVI4WgAJw1EpBoZ30IwVwiq1ofzskxYPforpqR7b6awMeD4U+OtOO14k19TlYAHUWn1WNxBbrFVb6d7hOsq8EKI13v+Vgj+A5PrPMSr6/OgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAqmykJ4B/SzyPfzAgRfHVxQpzh9cJqNjTQg84HTscQ=;
 b=eTQsAAijvaMi2MlpVXlrDCYxQYEG5wlA0CCOHlGxnHdlncoTqUbPgKP99kWYT4GF7svzi9WChEiE3ZiFlJ64TCIARUjRR0Q42Z61wplsgiRIo4RBaAR1fgefvvko8OFfI6z1FACoPeyz3qII1+4eYv3R6dPqbkSAnfeBfcT6LLwwHNm8qluAlNkgCPAlYSEPQuMRbyOCfT+pCh/uCzEkNlGF1ssL8STtt35M4JCeACergVu7SMg1z2Ksz/4A4Q74MmSmxamOOOqJcmWfsx/anckynr+3mC99opLBPT4qPcsV4ksdgskIgqquXAraKDhBKXrKHj3f+/d16w1ITlig+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAqmykJ4B/SzyPfzAgRfHVxQpzh9cJqNjTQg84HTscQ=;
 b=nyJYQxeuSscE3mRY4YDNuo897kzT0/iI2AASUDTY53gpzXU957+WMmnnqXpzIN/TcWKoyZ1W2+adbfvLOQ4rfUFBJ+uVBorTasa6GH53vX1Rfk3gMmAR9TPgD2ysrwuEIlxyiUoXb64NSsk8Dr1MiiAA9lPapbKsUUHe1ntNj8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by SJ0PR10MB4414.namprd10.prod.outlook.com (2603:10b6:a03:2d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 17:50:59 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea%5]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 17:50:59 +0000
Date: Thu, 5 Jun 2025 12:50:56 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Subject: Re: Crash when user space allocates non-highmem memory
Message-ID: <aEHZAGThzCdvvF3O@colin-ia-desktop>
References: <aDYXQDdT3dTodTlq@colin-ia-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDYXQDdT3dTodTlq@colin-ia-desktop>
X-ClientProxiedBy: BL1P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::22) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|SJ0PR10MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: f90ffb0b-d543-4a34-a8ca-08dda45987cb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7s2YWU4BXQUYqsFX8aN7cR2TL6qi7QTYOTiaWjze4cWXXAxoYcsjU3DZgMX0?=
 =?us-ascii?Q?hL7TKZtasT6mt3w3nirGJC7OpUwu3h4i8+m/6BHKDo3dFHwrdGjMeuaiWFC9?=
 =?us-ascii?Q?TiiIIIh4pv4pxn3o0gPJMKaUPKWOcn3EF7CTD5d7B3QEhk8h8w47nB+/FmpJ?=
 =?us-ascii?Q?RWIu+ugihWtK7KobkqI9ZnBNyAgcAS2j41zAW8SaX+np7P/7g7a3fiilVGsH?=
 =?us-ascii?Q?Em4I/ZwxlEpFk3y2RTRQSZpXjUE7vEbDoQnjLPbT8eDYntGdlO25yKDknRVh?=
 =?us-ascii?Q?JezOGBGtd5dNy7QKLx6dHPBgXoKG3IOAkaBHdaRRFpmugFlDiM0v5fdT5V4D?=
 =?us-ascii?Q?bupna24uqVr3phUP7Eq9TBfUD3OqFQ3x8MFSUNLCOogZWl5UCcvG6Crfu7YY?=
 =?us-ascii?Q?oA+ChLslD8bcNuVTb6cizixXxzo2s2mp+JRHOcAR3S53qVa6HQUVJ2BU8dvU?=
 =?us-ascii?Q?96RZEN6tfzmtgkJ681hISxaBz+hFDb1KXcqKS/NiSh6wp6rPDEsT+aiV+pDB?=
 =?us-ascii?Q?HtfZWDBZZMe5CKaEkemxjAFR0Q5EC1cyoe7w2rs3sZPX3GkZl60ufGZnwRw8?=
 =?us-ascii?Q?YJgc5nGSH53D7yXbEzoFrhtSzAkm0ACVRNPfwrw1r7Hbm5y4FjJyvHM8eAB4?=
 =?us-ascii?Q?ZDmhSDQ0NPqxM/6kEqCL5wWA9hY8ZTKPoCExMOH9asOwQg4orIfhQX53s7gr?=
 =?us-ascii?Q?+7BtY93KKm3sX+x5P4WwsSU3DGLEkqCdENQAUwR6eHvfubjB3Bj9FDQxoAWE?=
 =?us-ascii?Q?T/b+zMPogNd4K4+ZnF3MSZBj7K96Q+rHR6XY/bUqCqInwiaBBgvjVcVt6XVX?=
 =?us-ascii?Q?b2eUhVnggGNV0f9iCt/jsd6Jil+rIxVwek4/oOp5XoM4OffIdCWUn/MmCpwl?=
 =?us-ascii?Q?J8MacTXWMkOsbUtGp2Gb16ctq1gJWWm3BgNTguQhQChsZTZDYW14cBsOeHlL?=
 =?us-ascii?Q?jX/oGlOOybN446tH201sRbBxT3SzF+gV2EWrm3KTBB94rZ02vKat74Q3XcpK?=
 =?us-ascii?Q?1XBiJU49YKBnV02a+oq/eJV5NPu6qEsVwBxqL5X8cUuEWizU9H23u4zd+RDM?=
 =?us-ascii?Q?3VKOdxEmCD88I8VZgvIxanor9jxkvmWL8uAVeY0ofN8UtPnZwFZ9kjY2ep3M?=
 =?us-ascii?Q?1TD3Xh92valowx66EaTHpmJV1rgi7HTwtThoGM+AZJolgz+ZeKR6s6tNAEtr?=
 =?us-ascii?Q?13QHt7mPCFQC3/RbONClSAp8DL53J9laolfEKBlbMz+mSYWaIAHBMq0fEk8z?=
 =?us-ascii?Q?+rWAt94xTWRHoNgo4lET+D0eh0EKCU332n0QjqLMssz+jP6fxXmTdSWXTjY4?=
 =?us-ascii?Q?Ep0uGmdjagxN7bYreDUXnJxxivm06G2fAYe6XMUYEvk9Jrqs+DdjDWI60vAL?=
 =?us-ascii?Q?8he2Z9pPQNQ/wACiWNy91NHIj654cTryPTsppsU1n7olqAygkW1by+hYor1r?=
 =?us-ascii?Q?dOQJztQjXcY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6974.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dek5Kw2f8spY/NJNSZZF4U0ZJzkK/Px+58/3p70pTc/5+InfcKM4GxFMYm/J?=
 =?us-ascii?Q?mEmyRC0lm9DUJiY4z93EEXZdRfn6LETRYdR9MQ6TztHFZ7IPeUHIxn9mVbgR?=
 =?us-ascii?Q?a80kCz9cBq04G3eHnYmP490JZHqV0Zbwih6JtdVhFtp9lhJvf1E0DASevxO2?=
 =?us-ascii?Q?Nh+TM9s2LhZzmGhm36Je/+6cvEkQSWj+BF4IQaqOejsuHYLdYbvX7o3+D5NZ?=
 =?us-ascii?Q?lGFqgLpARrv4C7HIfH9Ngf6r86bc4zqxag1/z7rXe8QcRA0i9rRReCrDJvTi?=
 =?us-ascii?Q?C2pClrlFQULmp+qd8bxc7vXA1QuEAeMAc27KdGcSyQMI1lZmb75aviMsAdR/?=
 =?us-ascii?Q?nltZIYvloOJkyBU96U/10fUMSSds4Bg1YBApx9PilxEegL1VpfmoNPZcDGMu?=
 =?us-ascii?Q?JRM3Dtg6elSZHOmytkZIfsoVyhETbOAiJH7mLE1opKHfipm+LcCpWgRaTFm8?=
 =?us-ascii?Q?aVjJlNzyxVtHhAyO/RNf5H0dcQ3lQwIEmZ55mSGRWuxxWLrUwC3j74q9/XHX?=
 =?us-ascii?Q?HSvrsJCNJY4rlDICpR3VqN1v6IMiFPRwFNWsgLQl13A5tCjCQ1Cqchk2zjwY?=
 =?us-ascii?Q?agi1HCpHi5gi1GX/G1KpthMb6UrCkftDbs12CT2uGgnFsWvvLYAwsoUwRXGx?=
 =?us-ascii?Q?q8MGu8z/3zP3BemqpfYS6GQ1BJVWDj6XSbLO0NCxhZMIMgMdXSUe+ey8pVO0?=
 =?us-ascii?Q?Wh099KGkajbmf7e+XMT5hMG1egbb56jac/wAuoh2zrxnWIchkWCj18vhvS1f?=
 =?us-ascii?Q?1Wt6lmtbozTgZWKz+Ic3O7tAygJp2MUPZAdwKGeMENAEF9cXeeTd/CN5VxeT?=
 =?us-ascii?Q?OlnYdli/B1herXlj6u3Gve5qE/Clm/zijuenZ5iLxk2+ujOGtq9MX8fMTj6t?=
 =?us-ascii?Q?Z4BN7kxz73GEe7W23T7rrxVkkvtZPdMEb1il3HGoduD4iQpLkG5AxLUna8S0?=
 =?us-ascii?Q?pr3ZCHAAQkW1rTf1q6UGihUwMRb5BNB+3DTkLqsLpTkdN23R+YY5vpWKYKGS?=
 =?us-ascii?Q?Tr7FVdC5zhc/gdlK34TSpHEtbOl5iUQX/ceet3du92CxsbWd0XxZ6Yh85TAq?=
 =?us-ascii?Q?kOhXhDwWnjiGc2PtWZHUvh6KeNeOIil4dt8tdT+ZXXf5A1Yx+3Jh2UHlJ9bL?=
 =?us-ascii?Q?IlCugjLb9LEfajEj4PJgVkFsXkkdzc6/EpQertKFwjGiFVx4yD2QBr4zYWuk?=
 =?us-ascii?Q?DlgOiKyCALp+VhnoQ6NeSs75/Iey7lIa/Y+iFD2zpnVn2XO2VhP46N5eOqtN?=
 =?us-ascii?Q?mErfIVHou7HIOAnMF1CC/TqIJDp1D/yeK5hnssm3/hehxXAsqFtWYEqlaUrV?=
 =?us-ascii?Q?DgKeMtS09VCrKW1LVt1dNhj9Bu8p2kQUFgQZsz+RcbVuJ20JQpvcVd+6SGx8?=
 =?us-ascii?Q?sRVetPv46gMfAuHHx/v2gAk9DT5pFgWN5MfRoepV5hzDbzgD5vl8e5w4aS49?=
 =?us-ascii?Q?1BcgnuCbhnzd700r0Up98KcSVIEFD1yW5fQ3cUK9UVPhP2hQwyhoYYqmjuix?=
 =?us-ascii?Q?c2Ji3raDal5F9yCnaYXulCYxAZnURdw7QtxKCwgvRRlgGLfHpiAWeln3Q0fO?=
 =?us-ascii?Q?0dvByTDnNzStRAJFkoY7JGdcQJhQjrsGGS5e+cQfl8zBPOHGFe284QiAlNOE?=
 =?us-ascii?Q?ZP22d2SJa8toa6E+mmhDTis=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90ffb0b-d543-4a34-a8ca-08dda45987cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 17:50:59.5079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pd68JYC9czXWXrYe+c8V81qdBgDOV2PAQR1a3eFLrXLew6PqqCXpbNu9Z5vxP6M6U2A+S0Cli/qT742YBDdr/NKG7mr4/raEUss0H388GEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4414

On Tue, May 27, 2025 at 02:49:20PM -0500, Colin Foster wrote:
> Hello,
> 
> I'm running up against a reliable failure mode on my hardware and want
> to see if there are any suggestions for tracking down what might be
> going on.
> 
> The kernel is currently 6.12.28, with essentially no out-of-tree patches
> besides our DTS. The hardware is an OMAP 4460 processor.
> 
> The behavior I see is quite repeatable. I can allocate about 220MB of
> RAM by running:
> 
> dd if=/dev/zero of=/tmp/myfile1 bs=1M count=220

I figure I'd add more info about my issue.

A slight modification to "memhog" means I can essentially track one page
at a time. It leads to the following behavior:

mmap(250MB);
memset(addr, 0xff, 4096);

I can step in GDB over my application and trace page allocation one at
a time.

The PFN around 0x8fd3f should be available... 'page-types -l' reports a
huge block available, as far as I understand:

82c88   38      ____________________________________________
82cc0   d190    __________B_________________________________
8fe50   1       __________B_________________________________

However, it seems clear that some memory in that range is, in
fact, in use. 'memset' will eventually cause a crash around that area,
as will running 'devmem', 'dd /dev/mem'.

The output of /proc/vmallocinfo has me scratching my head. I'm not sure
if this type of output (the second address) is expected, or an
indication of something going terribly wrong:

0x887646e9-0xb6c38d9d   12288 kernel_clone+0xb0/0x414 pages=2 vmalloc
0x8d918e2e-0x0f0cf24b    8192 load_module+0x6ec/0x1e2c pages=1 vmalloc
0x8eadfe6c-0x2c2bdafa   12288 load_module+0x6ec/0x1e2c pages=2 vmalloc
0x90bdaef9-0x73aeced1   36864 pcpu_create_chunk+0x208/0x2a0 pages=8 vmalloc
0x93acc2a4-0x5c7fff68   12288 __devm_ioremap_resource+0x150/0x1dc phys=0x44800000 ioremap
0x950bf861-0xd3df2ba7   12288 kernel_clone+0xb0/0x414 pages=2 vmalloc


So I suppose I have an open question:

Is there a way to tell what might be mapped in that specific region?
It seems clear that it is _something_, but there is some MMU / virtual
memory misconfiguration that makes DDR that is supposed to be in one
area actually use the memory in a different area.

Once I figure out exactly "what" is in that region, it should hopefully
be easy for me to track down "why" it is there. Any nudge for someone
with little knowledge at VM layer could go a long way.

Thanks,

Colin

