Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33526235BFB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309410; cv=fail; b=VLa6YbEVes25cgNkmdP0Kd3e+lvvbV7rGuQWKO3c8BKpciIfoF9cS3WuwUupwqBwGlSYEzF9XOMOeQSH5eAS1duQp1undBhQ7vW7jG4vCihoBikyiitXNO0DSv7QoeQ9JmGOepke1lAtPpjW3pFsipkfsLPn9bFGrI0skSrTzFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309410; c=relaxed/simple;
	bh=nM8iLHhHoiTxHlhxq14s8ICkzi3b6JYK1uUO+1SQ37s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zd2LYmBoa0XboMw3KBStiN5ihy8ZtLGbuOyP/kK8ouL2ne/1yeKtIh2Ab2RGG6t+ETge9X8Knc4Awc1t+DKrWvbaOjc89xoIWQmw3ItkgGONdfq34lz7QoP+CKjEhkLaWgQ2rcnhNf33Emk6dwXdQB7EJZGQnIhOw91oiQLHJlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JGkC2rmA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hd6ny0p3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JGkC2rmA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hd6ny0p3"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7MwHg027820;
	Tue, 22 Apr 2025 08:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=5Epj3fD5BItOHfYbhsNznU6UMM8xmdysyPv3YXYuscs=; b=
	JGkC2rmADFdy222wdNzi7lD8PFH2J5h+ubTAmdW64SyQpIK76LAQWVikkJ9sq3LD
	giiT0ieDtM/qabQ+dERa+e0hpsEwIg0I3zlb+L2T2br0LiO9O2KZ27/NA2kEHQem
	z+8OarKSpJBif7Zm6PT+OoagpwjUTOWZYPmThEgsOQL3JyyXJMsoiDq7L34brdGi
	5+rf/SLZM1PS4SRb+PpPWuMltyes2jJmbjMTt1RQ4uzffLtKxDdjQMBLcTZ62OxR
	0ClZFYrWVVqx1IMdJpUR1kpHttwRQ6pfpoCr/HhivYctjRRvvyQD9SsnFwch6oDf
	skI1h5Bh+C30BcmIHvfMsw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4644csux0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7GZ4s021147;
	Tue, 22 Apr 2025 08:09:50 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010006.outbound.protection.outlook.com [40.93.20.6])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429fhse0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mf6PUt3IMueCFqjAbKpaZtmEBUGwp0a6x6ZwdA7+8obK9H401CyaayiUBvQPlVT7gEQmLlLdoh+n1vJlFrSNLDBYE42TxuFgFhpJiOkObsD5xklMIoIuP95Kh4jHur7DRDhVgGFbEFTOyl6kcJynAdYy8tc07T9YZhmcWfguS7YdqD/10Twra0rRjPPegSiuCWNA5KekRjcmzr8yJdXeKxhVNpnmZlDAlQ4Q8aKR+/SueqjLW7OB+aVnCsI9GzUdxtmjurqhoDRe9NrPWgsidIfLQHIEmMpmB8MYGxclXgQdtSkRwwdIaZVlm5RsflpcQMGT+AQi2u6BuMfFWi67bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Epj3fD5BItOHfYbhsNznU6UMM8xmdysyPv3YXYuscs=;
 b=hlUGajA4/ljbFbP3AJjizh0LnNjOKCFRvfOGDNtzb5Bhshm88vuReqT6rgrONUdoPzHBg6olMGurVZuFWymdr7Tki1TOk5g+o0FfDlq+Z5mzzeRmTzFIhSO4wRwz5XetARdH0hQCSEnGJZ8Ge9tBEKud5Z/YL2lv+iIwhS9PXii0iEPgE8Pw0WgOGZxrv3cMQcVK7Tkfl37o6aE4iymUtRJ0JtikFJHH7Q4kMPxwKRwY3lrXYcbN+rvynun7CwQ5sN6gCXem50l9kng0bcXL/Vn3/o579rFC0rf3ywjQIw1A8mp5YoPtbc5dvAME5QkWd7utdO35+P0S37+dj31G5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Epj3fD5BItOHfYbhsNznU6UMM8xmdysyPv3YXYuscs=;
 b=Hd6ny0p3wz8YkdbeNJMIxNJ+Zjue6plE/sAmXUJrJSGT60MPocaAryzFTRMjojVWz/Y+6rBZ+yTySRh0ugRzqOBrq+PnGpRHMrU7GdlH9oGhaoPCKbupfTIu86sYx0fzCsKWYX2d5td230UOlmQB8ceeEXGbETWNMGU+cd06NDg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4587.namprd10.prod.outlook.com (2603:10b6:806:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 08:09:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:09:48 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 02/10] mm/mremap: add MREMAP_MUST_RELOCATE_ANON
Date: Tue, 22 Apr 2025 09:09:21 +0100
Message-ID: <fe928ea16377f1553e3ffcf01234aaaada531147.1745307301.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0217.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e4bdb4f-b3c1-4c3a-d131-08dd81750cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nvF9jeYDy8yhYRgHZCxZZu5lSx/iVuLkv3MPOpfICWf2uMvBZ0XHtR+Ta+HW?=
 =?us-ascii?Q?5xg7KqzlPMGmYAjrwxSFxKt4k7IlzSH641IYCfG0SIGvlLlmeRVzyMT8AFYX?=
 =?us-ascii?Q?gSI5pzQC1xwgNcbA2KT6gDPJMOlbdbLC5RJss8xjrN3xP0z/6t26CPUZBSTu?=
 =?us-ascii?Q?t6i23TFj99+e2rGIi4nKHvCRAH88YnT5XYfqBMpyxwC/loGOl1L5+Xv7Cn1+?=
 =?us-ascii?Q?E4Twm/5u/LEdx2FszwJtoTXU+XZ4VuK6pw8wS8+9l2fYoz0FAYCVI+I9ktZ+?=
 =?us-ascii?Q?5SimnN5paLqYPotq/KOuSP6i0DG24S7j99bP0gmZUwwj8JaznhRXUEf5uD+u?=
 =?us-ascii?Q?vMfMD3MDph88cU9V+QVmR1pyKGVgjNh0M4SUckJwXqSjC+4qEakbhCBztNCb?=
 =?us-ascii?Q?soSLrPAthkZNXAU36U1ITYp6iQqCx/3ar4lQM0hNLEPZz87Le+UYddusKoOF?=
 =?us-ascii?Q?ARsg6eRKypRAG4aI8p2wCKvx+FZ6udWW05DcdJFB3/fmr/n0Q70Fm7XTszr6?=
 =?us-ascii?Q?pWfR0p+OPuOa3ANyI85GdmVS4c+ccAU4d/qU0XvAGudZ03D7LRDu8nEDg6bE?=
 =?us-ascii?Q?cETQpB/XpicRxujKVZT5ZpyRT0uYRgGn2cOh4AbaT+3JIMybHvYMSQuiVgKW?=
 =?us-ascii?Q?dRoeh9omr4yVjUTSI4L+DCZ6SBjsZxyJRcnGwCxUFWSRqFvomVQcdEkjhrHc?=
 =?us-ascii?Q?KcUHx9taQEUBEpiZKIy2f0XiaP02khZhGZ2sc3VeOdv9A103hfPuh4bC2VER?=
 =?us-ascii?Q?aPgESKurHTV+w6hrgAtEfqCHZDyCvYpjdcSlPL9U97sXziCSb7K29WeF9cm2?=
 =?us-ascii?Q?K6hWs3hkqRuI3/3yKZyNyZTBzgy29P1bkC/hsGTsVPI0AChzDpeVEzJE7ohw?=
 =?us-ascii?Q?rsIpn5YFxQWw2iheEOPR+pjdcObt/MF3dy5mZfWK6irjZZ2WjaGtyH0s5v2d?=
 =?us-ascii?Q?K8iZfn3/yv7jeqyR12XxMvTXLLB/tll72oGWb8/ZulxnVETVYWiVfONqNUij?=
 =?us-ascii?Q?IfmCHFNtzUkWCtacqbyS6vbOhRSGQsMFOt49nnEN4dW98HvwyIfj/KNF5N6v?=
 =?us-ascii?Q?qxdDmcHz+qYob4n5lM1t2v8yIC0KYZRtAF7PAy2SCh6H/K7Tu7rSjpYRVjKw?=
 =?us-ascii?Q?QMlzaStPYDXgsHcQeL78Iom8B6hzBCF7d77KoK7dpnmZCd80YFLENf+qJGzi?=
 =?us-ascii?Q?KnCrnXB4duTcT/WeBX1Uh4qGCMBwnaCZfjn66zvS9CfEB9ZiEmqjMWZt17Cx?=
 =?us-ascii?Q?HNZ0h/fgQzn08ZXpDLWSEmYUp9vR0n2d6XSQ65a8fmD/8bxBLmsZAkPhhS2U?=
 =?us-ascii?Q?ATtlWU0V957NW2pCfI/9cYdu8W/Osn6/+vKElKwixCsYQGgzyGwE5ECtAKzA?=
 =?us-ascii?Q?k1q+A9VjrxbXVOgJokAZc/cNaUkyKLMOVaqsmhjgPua9oMFRAHXIbgYKJLXj?=
 =?us-ascii?Q?3s6vhoHS5Yo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pdc4xvuaz2YyCBpX/4+vSpeRsokUovAX7ICuAKE9qFezFtD6OYLiJd59Tvd/?=
 =?us-ascii?Q?biBQmMd5qjvMw9DBysH+IrKO/qMWKGGWjiO49XfCZSKgsXfb1IY44B095M0g?=
 =?us-ascii?Q?fCNdnpp/LUP+Q+VbBEZoOLi3DJnxf48YLqgNjLTr6G0o7ZxbIZRkB1ZbmHcD?=
 =?us-ascii?Q?9/4zm8sV88DrGdNTYjbNrS2ajpuf1AskR+NRZHG1pEEYFRO5bjMjbr/+18OT?=
 =?us-ascii?Q?btHA6DhDsfj9c20L0KQL4gDq3nP9eVehZWM41HyMf4Zfs9sY5RvVUSGG5YKo?=
 =?us-ascii?Q?ADsKN/BhzYvl6ThLyi4zXSc66eOOap5vbGLEDDNzkq5WDPrW9x7DgiqXAKXg?=
 =?us-ascii?Q?39mg0uDZlEwThYSp7DFmeaIK25c2bJcNDN2815YiuOYuTlPfFV7cOusArdO6?=
 =?us-ascii?Q?QpGMSSTA/IlOPtcnGq3mfpqNEHskslOKhEPOqkfvSTXJ/Vm40JNtHrLvVmEr?=
 =?us-ascii?Q?wo8uW5xDUYpVWrZT+zY+ZT55AGT4lz1gOuWEZpLisMRdc7AhBcXgNLD+KmSu?=
 =?us-ascii?Q?5XwKWE8i0ZeaD7H9oV7FbUVVcKsnBfLzmrr95yL1fk8qFs9whxT+Yupbk7S9?=
 =?us-ascii?Q?TWBXTwTPPT0JZEhbRIwYwMzh91j7JDaPAoxc0tqq9N3Sjn4VGON5Hip86eMI?=
 =?us-ascii?Q?O1oscuavtFreehLLkEVTuHz87Tkd0iLvH2gcrpdFj8O1wg0P8iHoIC4jJNMa?=
 =?us-ascii?Q?4uRhG3v6vPecwETxLV0bo1sEcYrnPMYnGdjKU7yDC5uveKM2HKmtqI9NzMS5?=
 =?us-ascii?Q?qRKoM2bxHQ6hKnpun7X6EhgnDQTLWOXDdrp2MeQdaA/D0r5nNsJccjnlFg7b?=
 =?us-ascii?Q?U08EurQk5Qg0E89mSjyqZPq4TnRpFne1qxYEFUPB8pIG0H12foEoWfNDLFwU?=
 =?us-ascii?Q?xA39cLrWsYMAe/AGarnpJCS2xzent5US+RAFpZ1nKq1TSkyrVGnIPV9OTjZK?=
 =?us-ascii?Q?N21Au/Lv8ILOUrmpYUkLbSHgsBiHgYjVBuZnh+YA/yJ//1pZyMrQJp7HOee1?=
 =?us-ascii?Q?oZz58ZYljllTBA4GLjvfVqAklUF78VV/yYhaVUlb2qw3j+vb99EfWKfoB9ok?=
 =?us-ascii?Q?k7wNcfLrr0cwOZjSltTcly4sM9fM+s8WSrlVdZN1uSzQikTXfxMAfqQanMiB?=
 =?us-ascii?Q?1OR9lkVw7t2mozCTVEZLslkylgIJU5PGZLCdwGxfJyG58yPyoJuE+SUFpYnl?=
 =?us-ascii?Q?xUJ3fzMB28/7FSMCTg35DTF41VXYAQSPTxmFMj+EpdmvMFMSdhVEUaIrwQOr?=
 =?us-ascii?Q?NlT/hQADWfNXJ5GcVmGnvxbGTleVTm09kELoB9ZOGqLeU3lJGNFI5NmYyI3D?=
 =?us-ascii?Q?9lVBLnEg5PpNN8WPXmOAC/9xnIuoAYwQKsu89v7cKiZiAfEw2W3MAWmMWN/b?=
 =?us-ascii?Q?TxBfZXrf4M8v6ejKEGxfsgC4E+psPrndakyr0rPFacrAnB9InIWj8Qq/CU9C?=
 =?us-ascii?Q?fIpq0nvPM3mOicL27PshnGGPSQRFBmlO+uvXO8bG2YzU228KeRxvpxCPWd+n?=
 =?us-ascii?Q?y2kpUlQNdl0kK3pLOnJyFH+bwadZ0Z8QcZr6i+TVTD4NJ9u6h5HgTLb/2z6q?=
 =?us-ascii?Q?paOMxBOkiKNWVMLMTxi/t2/IP6hQLzgEX4xJaUPXCUu0ZHQgWiTR+eBzW7bU?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4EAJy1iYR4ryM3QrqOBWA7///begGsIFLTpe7BBDpSSbxgu6UVTIttxjD89/DZUBqW3C1spccP3nNt0tv/HIfl2NMd6gmRlujtVG5GEJO4Ms+j+TVrSAjspp7cG0lls1nEfcXVVxsqYwnt1iLAxVJFVAAPMdzU/hh0VjGa2zCkJ7tAF96Q/T4FjG8debRBiq8u8K/juiM0OM6Z8lHfr6s1HivAjPL1QpZevSk+ttG4u5XCWs+NE9YtL8bYciGAuLIUujxlKQWA9Girxd8ar3LhjRWk39Y6b3assYtzwZI4hHQMz1miObjCGkxJanzcSw9raMD1rA+xbihSd3I/Py6klG1lfz0LEJ626SRMAo4Xw/tPSH0+31a+rg1j56ugwWAwR0zG5EYIyjSkQed7xZtFTyk7UOtDWeVxbZbiClhItRppuqIlPmsUCC2JwEpocxFLBIO1nGCSKFoPCH8GPUK7n+YlxqhJBvtStw3UA6bI4lTITVwQcHM8YEtR8G4axSumlM8wtgGPL7o8WVDMBDEDf00EVsJsKEsR2X2qKxIEgf5ua7/jbNaCinDXSEuar8o3CCAXonbOjlw25uHYFjyeT243nY1xrjLpRtd7o0Yvk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4bdb4f-b3c1-4c3a-d131-08dd81750cc9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:09:48.3007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quZdGHqHyqGQs+ON7nIyBMgj2imt/tiz+QLOuoKogg05f1l/heAuhV4oL2Zik3BmtbozHuZhHwIJKg8+azeZh0AEWLGFqacDFFc2H4rDp1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220061
X-Proofpoint-ORIG-GUID: iU36dhlj7aw-4xCjAl2Zpt5qfduXprip
X-Proofpoint-GUID: iU36dhlj7aw-4xCjAl2Zpt5qfduXprip

This flag is the same as MREMAP_RELOCATE_ANON, however it returns an
-EFAULT error should folios not be able to be relocated.

The operation is undone when this occurs so the user can choose to proceed
without setting this flag at this stage.

This is useful for cases where a use case absolutely requires mergeability,
or moreover a user needs to know whether it succeeded or not for internal
bookkeeping purposes.

If the move would be a no-op (could be merged, or folios in range are
unmapped), then the operation proceeds normally.

It is only in instances where we would have fallen back to the usual
mremap() logic if we were using MREMAP_RELOCATE_ANON that we return -EFAULT
for MREMAP_MUST_RELOCATE_ANON.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/uapi/linux/mman.h |  9 +++++----
 mm/mremap.c               | 35 ++++++++++++++++++++++++++---------
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/include/uapi/linux/mman.h b/include/uapi/linux/mman.h
index d0542f872e0c..a61dbe1e8b2b 100644
--- a/include/uapi/linux/mman.h
+++ b/include/uapi/linux/mman.h
@@ -6,10 +6,11 @@
 #include <asm-generic/hugetlb_encode.h>
 #include <linux/types.h>
 
-#define MREMAP_MAYMOVE		1
-#define MREMAP_FIXED		2
-#define MREMAP_DONTUNMAP	4
-#define MREMAP_RELOCATE_ANON	8
+#define MREMAP_MAYMOVE			1
+#define MREMAP_FIXED			2
+#define MREMAP_DONTUNMAP		4
+#define MREMAP_RELOCATE_ANON		8
+#define MREMAP_MUST_RELOCATE_ANON	16
 
 #define OVERCOMMIT_GUESS		0
 #define OVERCOMMIT_ALWAYS		1
diff --git a/mm/mremap.c b/mm/mremap.c
index 1d915445026f..883ff9499e8c 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -1383,14 +1383,18 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
  * is being moved to by updating index and mapping fields accordingly?
  */
 static bool should_relocate_anon(struct vma_remap_struct *vrm,
-	struct pagetable_move_control *pmc)
+	struct pagetable_move_control *pmc, int *errp)
 {
 	struct vm_area_struct *old = vrm->vma;
 
 	/* Currently we only do this if requested. */
-	if (!(vrm->flags & MREMAP_RELOCATE_ANON))
+	if (!(vrm->flags & (MREMAP_RELOCATE_ANON | MREMAP_MUST_RELOCATE_ANON)))
 		return false;
 
+	/* Failures are fatal in the 'must' case. */
+	if (vrm->flags & MREMAP_MUST_RELOCATE_ANON)
+		*errp = -EFAULT;
+
 	/* We can't deal with special or hugetlb mappings. */
 	if (old->vm_flags & (VM_SPECIAL | VM_HUGETLB))
 		return false;
@@ -1399,10 +1403,6 @@ static bool should_relocate_anon(struct vma_remap_struct *vrm,
 	if (!vma_is_anonymous(old))
 		return false;
 
-	/* If no folios are mapped, then no need to attempt this. */
-	if (!old->anon_vma)
-		return false;
-
 	/*
 	 * If the VMA is referenced by a parent process (i.e. is the child of a
 	 * fork) or exists in a process which has been forked, then the folio
@@ -1414,6 +1414,13 @@ static bool should_relocate_anon(struct vma_remap_struct *vrm,
 	if (vma_had_uncowed_parents(old) || vma_had_uncowed_children(old))
 		return false;
 
+	/* Below issues are non-fatal in 'must' case. */
+	*errp = 0;
+
+	/* If no folios are mapped, then no need to attempt this. */
+	if (!old->anon_vma)
+		return false;
+
 	/* Otherwise, we're good to go! */
 	return true;
 }
@@ -1465,7 +1472,10 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 	struct vm_area_struct *new_vma;
 	int err = 0;
 	PAGETABLE_MOVE(pmc, NULL, NULL, vrm->addr, vrm->new_addr, vrm->old_len);
-	bool relocate_anon = should_relocate_anon(vrm, &pmc);
+	bool relocate_anon = should_relocate_anon(vrm, &pmc, &err);
+
+	if (err)
+		return err;
 
 again:
 	new_vma = copy_vma(&vma, vrm->new_addr, vrm->new_len, new_pgoff,
@@ -1496,6 +1506,12 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 
 			do_munmap(current->mm, start, size, NULL);
 			relocate_anon = false;
+			if (vrm->flags & MREMAP_MUST_RELOCATE_ANON) {
+				vrm_uncharge(vrm);
+				*new_vma_ptr = NULL;
+				return -EFAULT;
+			}
+
 			goto again;
 		}
 	}
@@ -1850,7 +1866,7 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 
 	/* Ensure no unexpected flag values. */
 	if (flags & ~(MREMAP_FIXED | MREMAP_MAYMOVE | MREMAP_DONTUNMAP |
-		      MREMAP_RELOCATE_ANON))
+		      MREMAP_RELOCATE_ANON | MREMAP_MUST_RELOCATE_ANON))
 		return -EINVAL;
 
 	/* Start address must be page-aligned. */
@@ -1866,7 +1882,8 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 		return -EINVAL;
 
 	/* We can't relocate without allowing a move. */
-	if ((flags & MREMAP_RELOCATE_ANON) && !(flags & MREMAP_MAYMOVE))
+	if ((flags & (MREMAP_RELOCATE_ANON | MREMAP_MUST_RELOCATE_ANON)) &&
+	     !(flags & MREMAP_MAYMOVE))
 		return -EINVAL;
 
 	/* Remainder of checks are for cases with specific new_addr. */
-- 
2.49.0

