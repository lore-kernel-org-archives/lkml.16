Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9054B30E830
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750442514; cv=fail; b=nxPDW5P38bpTycvC2/sHyeTu3/W/itiuwucQkPnJh3D77EBRmEPT+gX8gQI9XsdUISmjGcLhfO6aB5iyNfPYPvAaGtZL3Fwsvv0+lqubhS0od+amI0F/7OTHdezG/qK9cCz8XboXHJD+dY+jPAugP7M8zvlgKtCDpReZ68uVY/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750442514; c=relaxed/simple;
	bh=kpWaAcvCQbcq4iU5T+3qfJNos7zzt7+OudqWdfd5A8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CtWFBTCrQ3TtnI5QJFJQ5gexWNF6OEfiJ8F7ND6bMu88VFrWLATYAU9mfeh06wM9JLSS8MbXSGDLQC87gosPks49IH+waPoHY18Bufa0Jim6LGIeSrMOCRUG4Yt33+kZ6X5860Msv4o1EgThKUjFG4NT9MKPxBP7OuLWqo20gDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yv0vnbsS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uzKoPyTG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yv0vnbsS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uzKoPyTG"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBpv5010687;
	Fri, 20 Jun 2025 18:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xriO0L1PzdFVQW3rzp
	wAJibY8MDpKVHkxzj+WTplTmk=; b=Yv0vnbsSuYbe7p10mjlW02hQdismx7xKtd
	ILdmbLsZnB52g6zwqaf1F46ofcdQVImlVddcSxkjYZny4+BOm6nsFkmZLI0D8ZyE
	J0IfsW9jIPgurN0qCuWFu3/bBC6E9abJm1P+wYAt2WgE6RKjd4hdyGI72DPUyBht
	0AkvYHp28eh7CvKh/qzmDcFFsJrmI3fhWdWBLtXJUXCRqUk36pvtEiwPj+wL3MhD
	d+VgL7s7wVImV4UFwReJrJC66c69zulC1LCxv9I1795JsNfSesamhWxDvDHJEL4J
	KY/Z0r5rmvU3TasvEkMDLXCR7g8pBjYT/VxSyu/QFP4PivTNZWKA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4v8p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 18:01:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGK1LR038326;
	Fri, 20 Jun 2025 18:01:24 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhd6ga5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 18:01:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/zGSg9AX3/ymz0gBHJ0H04LYSKmw5RzD8RDyPSRjC4nrv45J7lJsWf3A1kthlc+MwxMyWUqLf6U5q0oOZit89QQ+2sh3rhVLAYmEDB/CR5dgBNzoj3tdMx48cCTWh+09+vVob22y3/T0UACmLGet61+qwT+oozlDJkO2q5CfgttuDijcNcjsXKi5k6wPYB87lGCosY19+RcAIRo+45JZVq6qL9PaXk08QgrwsXU9Bml5RmCWEfDGYrsLd+kryzn/h60kY215WPwP1Fj70+96gR0KMjt+Xw2OvTZ8G7tORjG23pR01vM/Nm4Xz2CdXUgobOFzutUvK2oIFhgPTJkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xriO0L1PzdFVQW3rzpwAJibY8MDpKVHkxzj+WTplTmk=;
 b=jq6aw7RPxLfTDAeBX4fMYpil0R2sCo2iYD/PvTA3JqUQErExKC6Mmioi8nSAvHzwtGaGOjS3qEvILaO9JXTLCIWOA4Fa06x5/2Qw67TTpg3r9ZHbUjYUCIvRAKqumijWpUJDo6l6lryuWPy2CCu1fEAzeuyIZ+Yp1amQQExP3PJkmt4Hv89LqIyRzvx9I3L5V0ddUf/wICQVLhjV8y1AKHjdyLY3ULRKEioUHvw5TZfl7RZ9CugjB2P/o2bey7kC6LVgNYnO0BPq0RpWn3+yKiv35IsepteP7SpLDe9gzDx+WVp7ivuHS10Rz9m6TN2X/pt+4hpFi8NXP78zmlhJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xriO0L1PzdFVQW3rzpwAJibY8MDpKVHkxzj+WTplTmk=;
 b=uzKoPyTGnC6lQOOrUR2Kbx0gmKXbX032kVEcglQ+GYeMzkl+Ai6+zXq0J8SUTHJDOumDESU2b7z0eyrkuRL6wueAn6gAxUrstDrTpUQ3pj+9LzaTJCdR9ChDzjfHUva3ZQ6Ae78o780BVpSZtIQ/1LhuaiBcHDxW6GIsG5QEzfQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4650.namprd10.prod.outlook.com (2603:10b6:806:f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Fri, 20 Jun
 2025 18:01:21 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 18:01:21 +0000
Date: Fri, 20 Jun 2025 19:01:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>,
        Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 4/5] mm/madvise: thread all madvise state through
 madv_behavior
Message-ID: <a7dad10b-11e9-46e0-a21d-5862a0167ed8@lucifer.local>
References: <7b345ab82ef51e551f8bc0c4f7be25712871629d.1750433500.git.lorenzo.stoakes@oracle.com>
 <20250620175622.96449-1-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620175622.96449-1-sj@kernel.org>
X-ClientProxiedBy: LO4P123CA0245.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4650:EE_
X-MS-Office365-Filtering-Correlation-Id: 8598dfe6-0329-4d32-03d5-08ddb02476db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7COCVKfMUg3fSZF0OzAe6Ld/0UHDEm+wqIK0+fKkaO12jvWeQVzAFwxNg7MJ?=
 =?us-ascii?Q?agv+R8O5aVaca+4FqX/IlG9sQMXc6w1xG7tvK+ES4YcLjct23J7DmY92qb3Q?=
 =?us-ascii?Q?IR5Ah7jcF1G+C5mGWc3LpNJRA3qXszrCleI39oFaS2W2UeV4ByBiG4ErPPNg?=
 =?us-ascii?Q?7APFZzsJnaKL/lR63ZAnVfrKxYHZLgCbnL7sERDtIJyMwCeRsmI4xRpjWqhY?=
 =?us-ascii?Q?EtyAN8J3q3//pldKU48CTfHbnL05FWoo9G2hbAld/fHWg0zPi4BkhsGGGagp?=
 =?us-ascii?Q?xKTX5cKTuA4GnzxNM4JiuO6Q+wzSBdzHu3qy6tu3YKBFKp/AMqEe3pVuwRgG?=
 =?us-ascii?Q?k8oUZhkfUQFlvbN4E8BlD/2RhuHftoGMOFQWintLjiOIIWqmmLKhp84IHIeO?=
 =?us-ascii?Q?MBTrcfogvgaUFaWhk+O1GFW5OdLm8qQTPmYoEDwSXa22Ac4l2x4KIuiui74r?=
 =?us-ascii?Q?ya0MjLqIT6Tl9LbHY94UTRQ2hIGWA+KHClMoK8pMSRTF4Ege4iRiykJ6VzT8?=
 =?us-ascii?Q?hrgJWVr27tiGEzoXAhEqeG5cZq93tRgy4q8TW3TjWMa1bnDkNYKfNdMwp6fd?=
 =?us-ascii?Q?ig3MVlLMRQtlMw78miEmtxylrvdlm+Wb5LsP9kzbriiUcuqCUkOIDXlZdNi/?=
 =?us-ascii?Q?jWL5Obz1+RawUo73+jjBINqNO3p3eSOiCiM52OKYK5k53lOwT5S451x62ZA/?=
 =?us-ascii?Q?WY9xGTHU3Z3WF1u+SrfRcQnsYv3NJ5KyzsA2rBaX+oooo/Nkc0TVE60W70RL?=
 =?us-ascii?Q?zM9NS4DSi5iC3PQrYHdK5w9jmuFSHO5zdT6ePINKcPELhjXc4bN1KmlTLTK2?=
 =?us-ascii?Q?NLrIZ8o9rVv+nF7TuDFoOzoEGFNzJ6TX6h8irvTKmt7LQt4DiAX9wSisa85U?=
 =?us-ascii?Q?rEvxH6ilYrrowrrEaYtB/41Sk0MEfRHyLqLtVUl1Xu4bG1EBMFfC/5lTZcXV?=
 =?us-ascii?Q?b+x5zomRuIenwJX4zaiZ19gyRvuDRgLFi6QZYpRX6HRkk5B/uMwaiAZyI63p?=
 =?us-ascii?Q?QhpSyP8PR3Kd1PfTK5czT35dH43L1VG/CEnGCCOlkFUpJP8JsV8PfmeKiIYI?=
 =?us-ascii?Q?GcTRjNz3gRna1lsvNmuLgRj+1XNyexQMqKFghxXTN+t5aAXZA5scY2RBkPOt?=
 =?us-ascii?Q?JjFYuexH6HsPUR4iG+OQUmvoOkr36El4jmzc1WAspUs57onA7IXGg2LF4qxS?=
 =?us-ascii?Q?XIYPhb+w4it2UO8QtbZuChTki/j/yDFX7klTgNwmabhs4E664z4jX8NeKmnI?=
 =?us-ascii?Q?jv+NJ0aeKmHGsVktHgq35dcp6YkgOYEx5AZRzSAXkngeeYOBjTBeGtKWR6hy?=
 =?us-ascii?Q?cM3SuALd7xkifET+Lv7FtTnJAGP9uDk/gpWLLt9Lt0ISvxjl+QVGOW9zUkyI?=
 =?us-ascii?Q?ykq/BCh0V6oTTPXf6CaDEqAS5mnD3+QLGPFN/RiKPT1f5Stp/58YOlzyt0SN?=
 =?us-ascii?Q?JmTbcA9ayH8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GqAKi+k0NRQsyi9LKnSWBBLXM8kncSOlJuml4ify5d8yvxB6hxYfZYfTFHVK?=
 =?us-ascii?Q?hfsEJYo6QjpG1imLMzPPu4mJVKVTOmpKMuCkmU7RfegddSDnUgP42kWHIUIH?=
 =?us-ascii?Q?54jI5pwgvyoib9DxKJKz1HxzazZd0Z9Hs7/W0FiHpK92kXJJN7H9I/dXAqPo?=
 =?us-ascii?Q?ol3Y8sNRWnA8wChKZHLdKvtXvK743GHGFsfcJrKdrZhjXaLsR3vciCeeR82R?=
 =?us-ascii?Q?reRl5tQ2l0psadZkT53rU7j4fMK3f8bKj+aHspVqB4+KGNHRsUchWA+s25nt?=
 =?us-ascii?Q?u2564xlbmEwjRD+mZ9+50CX5AT8K2RDbxXF006yG29zKZOcFA2keYRoS9FL5?=
 =?us-ascii?Q?UMuD5ticTYo4Ug1umBlM+6HArdcq9Hs/bNgO0ppEPuCbq20j9jcFHFG89kHV?=
 =?us-ascii?Q?iwWr9JNcEFxXcKEmnx32fce/4oqkOqnP2/XLIj2r1zoQ1Ln3hkqoBzX/Txzp?=
 =?us-ascii?Q?vbOawNuV/CGe50paVCpqQu6UMQi5190xfJi9j3wboMECJw95XUWV5COAelkK?=
 =?us-ascii?Q?VEEH/HS/c1KQlenG06qcyUsK/6lVFItLF/qpJq/eJ+zUy9rd6xkuxSx5qEsz?=
 =?us-ascii?Q?sZNz5yUY8AFxjpK+dk4lrGOz4ysiu5vTN0hi6UnOatukarQjf6ot8zcy71js?=
 =?us-ascii?Q?RUnGzQuIZ4vcEzxZAVMxsXpttvmgM6+Z6H+uLDVihE+U4HWQdHn/U6+n1svA?=
 =?us-ascii?Q?l8PncsxEIUd8lLBrjgW5wGCp5k5Zq6UcNi3aSzJL8G1rL1+a0yM9twz3pBzV?=
 =?us-ascii?Q?PGlEjYB/e1QrJmy0ZsHZff0narDI6ZFXBQg2Knjnght7P9sARTwDhQeLEqh1?=
 =?us-ascii?Q?eqxpPw+W4uGfUpDjApVdNhnf6NcM84yItC/UZ/JM9vKwwmMliWwTGDW8m5uD?=
 =?us-ascii?Q?is0+Aa9eNiGXkuWl22LMHnuGINCkaPYvlca2jaG35Ky8LnC+gihoOf6IXzz2?=
 =?us-ascii?Q?ya0TfD1FXvK1nau52UgQk8OQmZlYk7hk0SEqq2Fh49efTV0X2kJ5sPcYPrWC?=
 =?us-ascii?Q?a4+G1A4W8wANP+9pFJ7wpRppXtl6Eucdd0Rh9BOL+tuAdf6o8Pb9MFSLQVUp?=
 =?us-ascii?Q?xylX4mOZiathzwXm62TTpE3LPEz5g/TnSTaNWaY8brxhpOrbfMM7s9WVKCwo?=
 =?us-ascii?Q?QosUai/m5d41ze/vlIV15AfYGAwTlsjWRjZ/LiajoNxhd7FuNJj8GEWuO4hF?=
 =?us-ascii?Q?SGknrHe5laI+IqWpzLMxp7gbOCUTBRPN/mZuHVw+ut89YZS5TdbffyVxIys3?=
 =?us-ascii?Q?KqzRQcx4heoRNsZ1ZIhRloc1Cc04HVcu3s+WE3HDf1xHO+IMjqrnqEh1B5Wn?=
 =?us-ascii?Q?PgkGTXBsu3MG/SukfLvYL5pxlBbQBK3LpXwHMFrQsqgRGK+DEHT4YgFGci5u?=
 =?us-ascii?Q?SxFfirn1UtdKF9Xm6CvEw2/Sugyf9YOx9k9aua2TM4Q+imiJ4LTOaJ5oHEhg?=
 =?us-ascii?Q?zFfObdm8g+g9Ic2OfRLi9y3SYQR1ZzEtYN1fKIjWl0D1S7Z/SiNS+No4dlVg?=
 =?us-ascii?Q?Pj3gSdJTtJDXWLz/EWdC6kIvoDDJxWiGaqXqfYDdbMFEzkjvvKbHbVrZ3dO2?=
 =?us-ascii?Q?quba410Xicdrqu6m5m2gbfV8o2j/N14zzbbURwkfJVAN9ZjOEiPIIzcTlIaY?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NE78JIhM68lOeIGPWrFl6+nC2k1JhlfCfN0KLppI0q/Rc1nqWEVsENeQSL5zFsaYFn/yuHQPPlsoNWSD81Bj1WeijlOeBUUh2308t4avFfxjnDEsFfw9QckmaslYi+/eGqzZobCeMILOqVjyRMEu/KyUkWWP6mR20Yx1FAl3vRFhmKgADdszlE5nSmsaxSyOn4K+/mDwVu2+YBKgWA2Mu5LN/VwIgBCEesvwWW0nbtMJO42KlQe7V9TRTLq0/QavculyaUYcYXa7RsoIdnF3dRdT79UQu31MZTDRVD1Uc4E0hccvDmCZHi0S6+qx9SO1cv1qMPdpY4alitmD3pwVE5QA/wL7nV8eNgTn2Lk0Gh/5IB+HFVnlWrHtOrzKrigRK+66RY8h3ggLBwzng4Ag8gFUuoH5EvkPR30/DXIVcUnHSLm5jDbinAHZTm102Q61dFzc9cRoiVWpZwF0+3isptVtii2ehuvJFJyR7E2Ahy7rKn29DDJmw7qooD1lU0vHGzyHD7Pps8iCOJrDqOQtKHLICBWyS7ePrXkgupXONJEicW97kVvQam5GVofundZ7n0CoESpVxgkIrHw1mgG5K6UWVEIotLq+VhhHvmdYix8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8598dfe6-0329-4d32-03d5-08ddb02476db
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:01:21.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJoTDm83LtnvD0AQzS2Pnk4AnbJ4cD5CAeyHNNNkZsNs0rU+MhTKwADQiBYgwkF8HRM6Ceyu8ZE7wzMEurIkzH/XvLqA3A+LIhal/UnYmDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4650
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNiBTYWx0ZWRfXze2dqvxqy0ry JElTCQQV2mPQODzcpe7mUdQed102XLq7shMkssFn/O+eMtzJpTmS30EWCON6cE0y+DF/VvoziX3 6wsWP6zN049Upd+kcA0E7W0NCTc+JDO7fnArjsK5oHVE9yBFrZOAG/ZaYAh5bmwEh/Wt4mU5LuR
 SqBmqXEi5hUKl93a0b+NDjdJMJYxn7NuKe8F4GKGFXYrbwCj+Ptx5a1svRE6IRqHCSdgX7jlSJ6 zgnnQ1zoLxx3rmmkYWPbWJarjW/PIzyBkxb+BscyrTcYJsjD/qhL8rmiAsCV90zGRv5WM+ri1al 3zBnFYbHibuwj+uCHJGo/Wkp79/tdH/zHYQ3w165i0873oUke3IWOPKEFSxJsgB4tGaeoxYXJaF
 5g/NIw/1Tcj60dZliYt6sm5SMWYhkUEH3ciqZS/VYpNO1xB6ksPA3Kk1xvflmrKBWvG9cEkX
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=6855a1f5 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Ikd4Dj_1AAAA:8 a=VwQbUJbxAAAA:8 a=W7Rzk6matQMIy95MCW0A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: uvJ-l2p_FWDz-idxn5w2sPuvS4yzTC-X
X-Proofpoint-ORIG-GUID: uvJ-l2p_FWDz-idxn5w2sPuvS4yzTC-X

On Fri, Jun 20, 2025 at 10:56:22AM -0700, SeongJae Park wrote:
> On Fri, 20 Jun 2025 16:33:04 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> > Doing so means we can get rid of all the weird struct vm_area_struct **prev
> > stuff, everything becomes consistent and in future if we want to make
> > change to behaviour there's a single place where all relevant state is
> > stored.
> >
> > This also allows us to update try_vma_read_lock() to be a little more
> > succinct and set up state for us, as well as cleaning up
> > madvise_update_vma().
> >
> > We also update the debug assertion prior to madvise_update_vma() to assert
> > that this is a write operation as correctly pointed out by Barry in the
> > relevant thread.
> >
> > We can't reasonably update the madvise functions that live outside of
> > mm/madvise.c so we leave those as-is.
> >
> > Acked-by: Zi Yan <ziy@nvidia.com>
> > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Found a very trivial nit below.  Other than that,
>
> Reviewed-by: SeongJae Park <sj@kernel.org>

Thanks! And also for other tags of course :)

>
> [...]
> > @@ -1607,23 +1615,19 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
> >  	struct madvise_behavior_range *range = &madv_behavior->range;
> >  	/* range is updated to span each VMA, so store end of entire range. */
> >  	unsigned long last_end = range->end;
> > -	struct vm_area_struct *vma;
> > -	struct vm_area_struct *prev;
> >  	int unmapped_error = 0;
> >  	int error;
> > +	struct vm_area_struct *vma;
>
> A very trivial nit.  We could just keep old 'struct vm_area_struct *vma'
> declaration.

Haha yes that's a good point! I think probably it's because I initially thought
I should drop both, then decided to keep vma around.

Anyway, I'll fix up if I need to respin but I don't think it's necessary for a
fixpatch at this point :>)

>
>
> Thanks,
> SJ
>
> [...]
