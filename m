Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B3266F0D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358911; cv=fail; b=m1T5V/FQMmIYYHW8k2qoz12pvH9r5MuIXvuaYtSsItftZTYVpFgdSZbwRd5m2dnWWKK6LlgaiDUdCIR8Br2DXXuDGkfSwSrNzl2L2y0xV2sSDirn2gN2XTzTHcTMn1Dngk1PLyCCTyBbAnfmi3AcZehWGeyWAt/QZIg/SOWjfiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358911; c=relaxed/simple;
	bh=YybYTVInCRpUKceI4+ZzpZZTwsIDdBr7QaBXiUZuDvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WLpYbANWu9M6ysj4SctpO5NNhZyVBqBH3sNYlx7V6eYzp3hWjgI8bNF+Qj/dKXppbomkF/5lHwegBfTqaQi85xHk3vFM0bsTOFWDNDafyVS+Mr8CZ1TRgGmxiXjBFeoSlIMrT8j8XaOueywP54KwTkbqdABTEh8ZleeNGbKll8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QoKmNEWK; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZpXbJwSj reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QoKmNEWK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZpXbJwSj"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611MtcY005431;
	Tue, 1 Jul 2025 08:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2fMPb/Oc6JYS+rt94UesW5LimrV/TC1d+eoWcMFVuHQ=; b=
	QoKmNEWKciKuNoLCfIG4GloMYFS1W6sIC0RNG+EtCnLP4zfhjcElqvUbucq+c2pa
	6EHS2YmE/Vve+KjLdEw3RpzaUR6xdYCAJrc0ULgS6jYsWQX4+LZRv8VCKWJGgP2E
	tGwOPID0LTGhOUGVffN19SjeYQYu++vLRa1m07c0nztt50EjHeW/J5sooSnX8kQG
	GUPQSHGhhB8Fr+zYik/if3KaRKsv8s5Hy1mo5fr59yU0jFJQantJZdgEHp3K9N9n
	EtOdAYCtRw5mzg9BqhC63Qnt30XEKWZDYlsl5KpOOdeO79/3eczm22bmNu49CA5S
	wGrmFR0RNt7KtEYBtDBA3w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704c827-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:34:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56174nnQ005961;
	Tue, 1 Jul 2025 08:34:37 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ugpv19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:34:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H033Jx0PSTRHYWIxCH0KzRp6NOifXOMfif8WPcasrIS3o/9Mq2YTbD0uklQMz+I0yJe4QOpsmmuMTXJLztGL/uPQeVO24kX/Oat3vD9ypfW3O/liGcldFr2kmJIJT0Q/P/ieDpq5Tl9HrBGMaky73jLRkbv+bXQV3t89vQ8jaso949QW8BZ6eSICFVTYIhYkBCo8wD7F1Q8qK/2ATf6R40JgCOfW0iO7MQibchj/DKFTmJM5H8RMRWncC5W364PCrQSmeAppDLNnwQ34nZAe82BGjaT3mh6OMLjW5XYt0fU4MiFkpu3La6vHyX6NDeYjZ6HU4BgsmzlzhAIRhjDE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmOqK0/7Zgrc29Kl9ivWg5CUTMKDl48xG1I9heGtyp4=;
 b=uB5LszFKGSwZWAaVJawAjw3BxV75UmuzdBd1SG1SbPoM6a4Xu8Nnsq1+P0avynji8Dsrpg8unxtbgVAmQ4Cif/NsDC9cndIKzwmA1XHqbT4DXYajLR0xPqRWsKgg6g5DXdojY+0jc8gzaaoxZZe1T8oyfg6yJjw+EXx7jQxFTpJjUsItqw11uAfJE+RvLwQ0lEhjojQesZHAie9+4/OzQ+KqpTRZZml1KTSfkSHIfOC89cUN+qxDmfZ2CsWZv4117DTQi/MqryDCcgGJZM9NDLN7VWd/dR2jjq0RAQss9V8gb6H0NMW8nPF+u1Sue1m6Qz2Emkeieja2lI+1V4roXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmOqK0/7Zgrc29Kl9ivWg5CUTMKDl48xG1I9heGtyp4=;
 b=ZpXbJwSjHDvpsxP1UxUeu0zItrXHUIMdsP1VcrOfIZFHFuzmhJDcrWDd5wokZg/FSKJ4HJuXBWpbRJAy/PIx7yDadcePn6fiLnF9HXI8oKFJ/zNV9N4gpvH+yzCZXw11vS+iKt6Y1TTyAevJLkHjjOof8LzkrTUa8XiksCL5ADU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5871.namprd10.prod.outlook.com (2603:10b6:510:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 1 Jul
 2025 08:34:34 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:34:34 +0000
Date: Tue, 1 Jul 2025 09:34:32 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 2/4] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <e54949b6-3635-4578-b98f-08c029d7796c@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-3-dev.jain@arm.com>
 <a305816d-7770-47ec-bb21-1572c7c7783b@lucifer.local>
 <c12e2958-5a51-439d-aa86-e72d85699562@arm.com>
 <23a213b8-280a-4544-a210-7c18a0caf8a9@arm.com>
 <b214edda-4162-47fd-a9e0-c2a4cee3ac88@lucifer.local>
 <3959a598-c7c0-4321-ae2f-f45e5ff144e4@arm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3959a598-c7c0-4321-ae2f-f45e5ff144e4@arm.com>
X-ClientProxiedBy: LO4P265CA0165.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: a9478e0e-d183-4581-a4b8-08ddb87a1bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?bwdiuZJ++124e+TPEoP90yiQl4/9tBUDjb8O8BvULBqRmp956kqDpoipkF?=
 =?iso-8859-1?Q?08nelR4/QsOGh3juwYnO0aqXRckV/Q9D8EZZ/ojjjrJvphTWsEFEgB3yGw?=
 =?iso-8859-1?Q?Ziz7yILcqIMOC6PDlyxGjJ2k8POCYfUnyL9IU/8GSFN3CA8nLDrM/kRd0r?=
 =?iso-8859-1?Q?mfBhAYheohmd2LK6+BX6j2kKK88KJ3ACB8wGkXQRxM5jcr/pq9wc18TNXq?=
 =?iso-8859-1?Q?gbWEAasblSg6qU0rNAD666gA/ntIoHk5ylTA1mCH9GSDU9tfvGuPCGNNgO?=
 =?iso-8859-1?Q?WBWx9E9FUFN0GAcgXVgU1EY/oeKlNqZMD72IJJhgZCUIzh/OwsKLFBzRL6?=
 =?iso-8859-1?Q?WdNpIYefjK6m4D3AGtpOMBsZFVzBlJIrL2XerGYy0Myvhhx/Y8Ja+PifnN?=
 =?iso-8859-1?Q?KK0K2Aarsu0R6p1voeBe3vOjPBrYUWcGLGgKi2sjwEuO7yOEU2bcIC4ZiB?=
 =?iso-8859-1?Q?GW57n4vqhEay9Pb6COgVYLqp4Dsu8h5mUErcn7mhrEXhtcaf6reeIwcMJD?=
 =?iso-8859-1?Q?mEPxlvLlzd3pyy1W4Lcc8nCd1aORc30cTShnfRFfbo6ukPdIq5wYJIfrxj?=
 =?iso-8859-1?Q?TBUoXbxR/6+vO5xsuRi1kuv7nDT1DPdjMRwoqzH0asmtYdtUcSVC9VbSui?=
 =?iso-8859-1?Q?6uR19UFvR0Akdc6mdMzHSFD5jscZ04noTgYrPvalI6utrOG7LxdzmD89U3?=
 =?iso-8859-1?Q?Z8HAcRMg4rHrpFDRkzcHM6djMYMvgBV0BEWI+rv/u5QodbBcGN0Dn+rEx4?=
 =?iso-8859-1?Q?4TSJBIgNt47OSvAJTTEQ3U/phIfFHG/M3nJ4ybmFdu12NklEjBeu3+GisS?=
 =?iso-8859-1?Q?UXZjbKu9qFDg3nNIRwVbo7r+7sMcj6L7K2/rmHPTdb1qNXgxLcVjYDUqsa?=
 =?iso-8859-1?Q?hDBD/ZKqJjl4Rv/p4WZlHUdzUQpW7xcDwViLfkbdZIEgg0ruqPPFRWMYqv?=
 =?iso-8859-1?Q?/XyXiihHRNuXA0PZ6RKVg4N/lgEJY2OpZD/WRyQleZOLFDLQbXWtCJ1XQo?=
 =?iso-8859-1?Q?nFM/QQVNtOWnPCs8QRXH0q5DXsQwIP6812IsmdEczm1nRmNiXFIQEYLgMq?=
 =?iso-8859-1?Q?wHBCCl4Eqi/tG0c3WcyNLCj/trsG81b9ZDGQyikS8to0OTRsqw6SY+4LXB?=
 =?iso-8859-1?Q?NNNai1JhIn5VuA2oZgO6hintws1Sz43dVYaSds9ptJ0j4N+c4X+zzhw9Ds?=
 =?iso-8859-1?Q?4lRMQD3wdyQk660jzDeivd9d+DfMWxFhjtuU6j8tMXWcH5knhoFTOj1GAL?=
 =?iso-8859-1?Q?jXShVLc5+TUEFHkQ9AUYce53kWdmLgn6Ws443OSnxrNhOMiBgPwV8YhkEw?=
 =?iso-8859-1?Q?oeS/PpJie7ITSGEI9VbJp6CMgvyW7ym7AIjNO+75KJAc9x0jB7jWs8YnSV?=
 =?iso-8859-1?Q?44LfHRd4WqQQFrZAiGwN2ftPoJmtoX7kDuiW1dahDb8LBPcpvL3Qor5u0E?=
 =?iso-8859-1?Q?dYos7xXIr6A6TvucjCwbjtqnLdMH5e7t9f7qHg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?l5xTzSEx810aQ53DEJ/PM3uw7GH97olPM/Jtu+IInU5xE0QiRcm16OlARH?=
 =?iso-8859-1?Q?wDoTm2euhfhke3fb+lK/+wE1XbvxYHju3p209FTBccp9fLjWgTO7vIewcg?=
 =?iso-8859-1?Q?kYBhKchyz6YPvFybHwYwsXXdkC7SbBZWnm3XlNmyrFACsM31eA2Ie0xBGk?=
 =?iso-8859-1?Q?Pv6fi4K1p4OyoP67lilItFmdMrL2YcxEUxGohSQhyfpa3cVelLZInYx+Za?=
 =?iso-8859-1?Q?aUl5RKdd7FfzfDanWlz5IzjqtYEkc87h1+bAxSow1uC6TwBcf5Eydx1vf4?=
 =?iso-8859-1?Q?iAYjboG+e0cy7PynNyrktvAp1NKy23y+TyGUBXdLhoGvIxPgZxWqUnkL64?=
 =?iso-8859-1?Q?JnBT5eaI49qBLiUJzGvqrmp9WyUBE4k0aa4oJy4Pz/DXHnEx+II4P96IZH?=
 =?iso-8859-1?Q?NhZnLt8A4M7eiGtVwY37HgPVyMbYSqVfdtMedc7w3c2YA2imiEFZyiJFbY?=
 =?iso-8859-1?Q?QWbaxENQ56AYTXr/NBbH9FgxHErSywwAPc5JUmEF1XIXS+HTWT/+wFXcIM?=
 =?iso-8859-1?Q?icdTUqq40dMCbe6mh3FpTG5D/F66Tupa9qerqDi9Q22STtWquzq5cdaWgy?=
 =?iso-8859-1?Q?33KyNnVgkNKzmgpv+VY1466K+PzbI/vVS02tHgaymZ97Wz9EuWe4RihYnX?=
 =?iso-8859-1?Q?StlWOB7hVO8nXQDt1W88NxQoSKcLOCD/2QBSJNZZeC070M3Hovm9q2Cw1M?=
 =?iso-8859-1?Q?7umR+T5E0+201hFf/jXo8hhM7dhCoveUMP6AyvNx6DhakBK5EAi/VCbXbo?=
 =?iso-8859-1?Q?yaRmcl1b9M6V7eaJM8/sZUAoX4CISwNlstKMfCQlYuALNSwhCm06H89ZwL?=
 =?iso-8859-1?Q?5BAh26xV/D6sNuWaXY3GD6ss13abiKUfDhJlVOR8O2PrjnSWCol8PPMEsA?=
 =?iso-8859-1?Q?iCvC1z6vqmAG0syXLe/cMwpWwRyPucPNpXnjIiUcpnyDyQ1s/HJZPK3OzR?=
 =?iso-8859-1?Q?fnp0+NgCn/w4by66YqvYtfGD02e4yUTiz8FRTpUX2LbxAHO/rJ/i/UUsiS?=
 =?iso-8859-1?Q?vSoQ7i9iTJIXX2rMHWqdgygfW2QdhonARBBToAEdb0S4WkEWOanAoJQR3K?=
 =?iso-8859-1?Q?ZxnfCf+SmbG03s/+B8co4yhrrdWaZuRpuXyc9F73lLeFLdZNw+2KqlAs4h?=
 =?iso-8859-1?Q?24ZIt/1AdJDAwl6JuPETBr+bBhy5M/upuYkS0MVWaP0FwTQ/cTCK1PqCEG?=
 =?iso-8859-1?Q?UsVcWpDzWJMMR9eKn5mvr64NUHs4WSSj4q76urup60W7zLpe9uxT57+rkL?=
 =?iso-8859-1?Q?ABpkYTHzjdj4olGonyZoGDyswg/6ZNSnKOMdnqKmcqGtCHT4j0SirfHMk+?=
 =?iso-8859-1?Q?V5n8Zxmw5TWigenesZIZYfXuOvD4a3An1pNhRxl+W/tLPP4ojeWZmFwUOW?=
 =?iso-8859-1?Q?xmCo3XcWHZbngrPenrQO9nVaFv5HPJydyT51v86NyBgpm+eqkd7dh+mX90?=
 =?iso-8859-1?Q?95DKNgz9X+8u0Hdg8TaK6huyeFMXRN+shtfVUbLvk3u9l764HwsH4TwNOp?=
 =?iso-8859-1?Q?e8rqf2hvsww+VbtyhzLdIJW157LBInMzrc/kQ8/+zEs664w8d0/bd4XMni?=
 =?iso-8859-1?Q?fIEDDIENeUN9DKyenAkvvN8UrsdK8QH9MXXiOKqXeyCE0uD0lfw32dwJzJ?=
 =?iso-8859-1?Q?ySYCStxsb9W6Su/s6ReOVAcuvOzQEkPFvfS498KXY8OJL2trWT3Ubm/Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WDuW4hM9P4QXo+CfYEvsHSV6Yj1o55eXF58Hp6pKDYoL/8oymrdDk2mcdA6kNO0npVHTuOrMIDCl3Wvh5csQ265PvJnsNpgrgEdoICQumGIdFLYF2ajzIOGPuqepcK7TsFvFh5feYSXjpNq+cMXKjfjzmV+nH5DrTmpDNvfmsdiDS/G/9JLfiC7+Uj7R5ULKxf42QMAVQS6SJGx7pXqU+VmSvNYtIJIa7x0fPcIpsbwyPiI+cbAVk3Y05uujh2cX4uX7r/2Bjezco8scqZTQx0EJQ9fzj0H+CClGmIzGGa+WMIHnPAfJKmtqrFUqbe2+POlcZBkXxpQU2A4sG5u/XYdPZWuS+hx+8pgt5zlrFyvhA7kPuDjXNTIWW5pa7Z0KNdW34pJpcHhJ37Ot+6HJOhgvx0pR4JgTBcqpmrnCjCP8n7McaDxKBmDQ93uAqEmplBRZNY2i7aFHoWejdpR2+98S0XQV2NJxC43U2X49wKWnipbOKnsyJCClfvCeQ4VObfIY51M36YhofZjdLbN9rfSkeL6cjOQQ2cOzwaHXLO0jINrD+3/TcqNb+BTVFskRh1SlcaWSENAwYaJUKAFMO8kIPpK6igRA6rsynbNFkA0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9478e0e-d183-4581-a4b8-08ddb87a1bb6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:34:34.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvtGbhFj5RpZbyILNOlabc519DePpfSEhTIRbrAysQf99mtK2l5ySZVjR7ZAQjFd13OHlK0FBPLfD2hW1nE7ZJDkmNVA505V1+QOsBlbUK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5871
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010049
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0OSBTYWx0ZWRfXwkbzWhkDN2Y1 LFM3a3ea1bUNsSFk9N87EDvep901TakAdRXOzgJjjZQ0sE91seImgT+cLB2wfNzW1OplB17mFSD weBiZMUd/uW/oZsvu0F5k/Cf0Nrv6ciaQp0kjvMp4qHbyKEaWL4CiCXGYJsXrbDKduL0/qqpgsf
 P3laDFGYjPC38ZwlkwMtSOnWU22MG1vlWf5o3K3eKLv5SbNS5nzwrZ28ZveYP15Py4MVqf5iL1G d9Zx1RF2wOSJdtbMNH/LkQ1urXfbTgq+ekVJMz8oN1STK5uEAdMbFi6XMnE63ui4NxUFBPwh5Yj EJ8FHLfIsnP01NJjMgamkNyBPUuGt3DomiXgvUm2MBR9cdyuLUuEX4Zltj379AeRFKUowGmQoC6
 pU2KAd54HX7aT34CEN5T8ZsYkiWECRBDlsCtpcCyKWbixp+diOSDIocWOeucgs3kADggTtqa
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=68639d9f b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=tngGr7c-m90JZK_C6tkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13215
X-Proofpoint-GUID: 9hws4dcbAHH2ePB2xpLwWRnWnX5b6ULD
X-Proofpoint-ORIG-GUID: 9hws4dcbAHH2ePB2xpLwWRnWnX5b6ULD

On Tue, Jul 01, 2025 at 09:23:05AM +0100, Ryan Roberts wrote:
> >>>>> +#ifndef modify_prot_commit_ptes
> >>>>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma,
> >>>>> unsigned long addr,
> >>>>> +        pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> >>>>> +{
> >>>>> +    int i;
> >>>>> +
> >>>>> +    for (i = 0; i < nr; ++i) {
> >>>>> +        ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> >>>>> +        ptep++;
> >>>> Weird place to put this increment, maybe just stick it in the for loop.
> >>>>
> >>>>> +        addr += PAGE_SIZE;
> >>>> Same comment here.
> >>>
> >>> Sure.
> >>>
> >>>>
> >>>>> +        old_pte = pte_next_pfn(old_pte);
> >>>> Could be:
> >>>>
> >>>>         old_pte = pte;
> >>>>
> >>>> No?
> >>>
> >>> We will need to update old_pte also since that
> >>> is used by powerpc in radix__ptep_modify_prot_commit().
> >>
> >> I think perhaps Lorenzo has the model in his head where old_pte is the previous
> >> pte in the batch. That's not the case. old_pte is the value of the pte in the
> >> current position of the batch before any changes were made. pte is the new value
> >> for the pte. So we need to expliticly advance the PFN in both old_pte and pte
> >> each iteration round the loop.
> >
> > Yeah, you're right, apologies, I'd misinterpreted.
> >
> > I really, really, really hate how all this is implemented. This is obviously an
> > mprotect() and legacy thing but it's almost designed for confusion. Not the
> > fault of this series, and todo++ on improving mprotect as a whole (been on my
> > list for a while...)
>
> Agreed. I struggled for a long time with some of the pgtable helper abstractions
> to the arch and all the assumptions they make. But ultimately all Dev is trying
> to do here is make some incremental improvements, following the established
> patterns. Hopefully you agree that cleanups on a larger scale should be reserved
> for a systematic, focussed series.

Totally agree, when I mention my distaste for existing logic, see those as
asides, I'm not asking the series to be blocked until that's fixed :)

I'm happy for us to take Dev's changes obviously once review issues are
resolved.

I think my suggestion below helps get us to a good compromise (modulo
mm's beautifully overloaded/confusing use of terminology :>)

>
> >
> > So we're ultimately updating ptep (this thing that we update, of course, is
> > buried in the middle of the function invocation) in:
> >
> > 	ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> >
> > We are setting *ptep++ = pte essentially (roughly speaking) right?
>
> Yeah, pretty much.
>
> The API was originally created for Xen IIRC. The problem is that the HW can
> update the A/D bits asynchronously if the PTE is valid (from the HW perspective)
> so the previous approach was to get_and_clear (atomic), modify, write. But that
> required 2 Xen hypervisor calls per PTE. This start/commit approach allows Xen
> to both avoid the get_and_clear() and batch the writes for all PTEs in a lazy
> mmu batch. So hypervisor calls are reduced from 2 per PTE to 1 per lazy mmu
> batch. TBH I'm no Xen expert; some of those details may be off, but big picture
> is correct.

Yeah, here we go again with some horror show stuff on Xen's behalf. I've played
Half Life, so I already know to fear Xen ;)

I believe David has _thoughts_ on this :)

Again this is aside stuff.

>
> Anyway, arm64 doesn't care about any of that, but it does override
> ptep_modify_prot_start() / ptep_modify_prot_commit() to implement an erratum
> workaround. And it can benefit substantially from batching.

Ack. And of course, the batching part is why we're all here!

>
> >
> > And the arch needs to know about any bits that have changed I guess hence
> > providing old_pte as well right?
> >
> > OK so yeah, I get it now, we're not actually advancing through ptes here, we're
> > just advancing the PFN and applying the same 'template'.
> >
> > How about something like:
> >
> > static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> > 	       pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> > {
> > 	int i;
> >
> > 	for (i = 0; i < nr; i++, ptep++, addr += PAGE_SIZE) {
> > 		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> >
> > 		/* Advance PFN only, set same flags. */
> > 		old_pte = pte_next_pfn(old_pte);
> > 		pte = pte_next_pfn(pte);
> > 	}
> > }
> >
> > Neatens it up a bit and makes it clear that we're effectively propagating the
> > flags here.
>
> Yes, except we don't usually refer to the non-pfn parts of a pte as "flags". We
> normally call them pgprot or prot. God knows why...

Ah of course we love to do this kind of thing to oursevles :>)

Dev - suggestion above then but s/flags/prot/.
