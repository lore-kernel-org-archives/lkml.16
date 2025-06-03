Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5463F239E79;
	Tue,  3 Jun 2025 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748962356; cv=fail; b=U3h2+lSv+O3SpY/x8OH83I1WTR3vXjT94G4959SBYdt81WOFiXnUuZXawfn/a1u/ndeXOvkyXraufOI7QyOBgFIKtC1J3+gN6CydhQvl01jtz1UsdOxx3Qfv23gGgoTV/ouORXQTwDpvFCvYbVv3SfR+V64GvLRmHT2mkxM/nAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748962356; c=relaxed/simple;
	bh=miDWpJSBh+IovTlGdi1FWys2XiPgGn4hVB/2b8WUu/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KPyzHYxcxdWyGBiUVDbfMxYSqUeYiHBjv24+8EXhTj1lmsup9gbApHhfL5xujc/kRXjJyMWCx+9FJwOHknl+S53cvLLDQP4jt7BiWQrdac/tn0Vtg8rSmhgIwOovY55u96FJ3DgTWhIpBTAiytDKixpCGAXhC91LIxr6eJmeT4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Xs+D8aLP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SKizAn9v; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xs+D8aLP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SKizAn9v"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AEmpb003774;
	Tue, 3 Jun 2025 14:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JXZ/IdNGnygsuesks8
	+TLPicWJQx3Fqe6SY6JG1W4Dw=; b=Xs+D8aLPZm0TYpkA6RQBCsD9yJ9C1B4sUA
	qPFgf9UfkLh8GCJUoASxD5ACxqi7xJPkvgEehVwEld5XV6/yllfRbR6gojmlgwHy
	JwLv5vRFyqDGEVWWgZuUzQkCnZ6E7PzBihjo4mxngdKJJjT69O5J1DfkM0do3NVX
	l3lRQGsKkzDnVsXIlYNQ4hu+arOFnu8dHCaNc2ZKyLxQQ059RFhn+/p0P8gRCcuF
	RJCstPB5O6raZVhLZI0bbDJnIxG/AbxIOAdNHYXdhCr+QH36AZhB4apR5vVnY48X
	R7lKnGDySJdN+bhGHiYsE1ZYiBsn0uMvLzFNFdV0IcJDUi3Cetog==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8bj1u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 14:52:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553EUZVW034879;
	Tue, 3 Jun 2025 14:52:12 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr79q428-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 14:52:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PE0zhGXAGDVT2SnTuLHOKvG+XNyx3jiEiER0yADgMmhaAVrJC71qTFsQqZNem+f7BWkzBsn5ccqZuN71RxKu+A/VcnRSZCXzCn51fICpv7i8NNpLE5dAwZJXZWDNpdoIH9pbTNhSBlxFCQdm37G1pdYaI+xuaI2mm10jMCuq1aONPoL+OK+PJ9G2VDnZ9FuxJt2uElr93gD/rpMRGRdNzc9I+dnD4we3NEqfbjHp9gsEnPJrpHeoTLZTTEUR2iS9iUxcIv3G0TcoN3IwJAGycYHbhMnuit92LRy+VYtOhl9Vzfv25wShZOF2kXz9g4uEfCBNGYLqnRoBsFm0p6v7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXZ/IdNGnygsuesks8+TLPicWJQx3Fqe6SY6JG1W4Dw=;
 b=iEuomYj9n5GtZkQdae7/SEg+WpZsLCUk6U3Trk10z1gHHSluNJl9DZB1a9ujkQQHrX+OyyLmIzszUPp4wVzOKuwtSSdowQl3esssQldPLDv8+ehp/SxLLiZRjQH6/yS3DXiLWhH3E81KLj2m4NHih1/Y73C5mZKO5M//X+dRk2DQtDq7EwaxYV/MWl1TXNM9pAONmlilhdnNpmOKFYLvjJCzyVlfNACqxd577kzoLUgIk/b2/mGgawWngVkMdspdO6bQiPtr67ddkyzJDEc6Yj05etzqoqm3pAyquwZPFeYXAF+9K82uPSZlzjvz4dAlvEpxMy/YkX7v98gBGRXo2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXZ/IdNGnygsuesks8+TLPicWJQx3Fqe6SY6JG1W4Dw=;
 b=SKizAn9vjgJG4SpLlUTBhKe8JymKr9hPkEJet3Ih8RtbkfCIJwPA0zNAtdvMnvmYC9SXnQXizP5SBI0hwqwga5hZ+7hrLjD4eY2a9OOkwrIj6uGUMbMb9mrrbSYRpDly7JKZg9bF3M+WNHe8StMoOsuQx2OmNDXzb2EhXpsBCxM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BY5PR10MB4323.namprd10.prod.outlook.com (2603:10b6:a03:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 14:52:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 14:52:07 +0000
Date: Tue, 3 Jun 2025 15:52:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing,
 non-vma traversal
Message-ID: <1b340b71-6664-48ff-b783-aa89fa5b0b16@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
 <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
 <8734cg9auh.fsf@trenco.lwn.net>
 <ea8c2be9-0af0-445b-b7fe-fd9e80bd6a65@lucifer.local>
 <87tt4w7uxo.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt4w7uxo.fsf@trenco.lwn.net>
X-ClientProxiedBy: LO2P265CA0497.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BY5PR10MB4323:EE_
X-MS-Office365-Filtering-Correlation-Id: c28d1dea-0bb3-497b-d97b-08dda2ae361a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1RSzOfdHFw461oiC8+3W+8y1gOLhsOXxAUhBoDxR5nlse/CmjcmEkEcgkTVz?=
 =?us-ascii?Q?RvWXlZfN/srW+2E32IeKoe2qoSqlhmbWqWcIbisNG7j2g8orFiRsSdgI8Ovr?=
 =?us-ascii?Q?uxUjxcoRecmHGQjlYOs6j2S6z5rUHO+SvgBe5S+Xe8UT0LRMRJCl4WfjYH57?=
 =?us-ascii?Q?S3cJ5dSIwXZbVl3HqYjRRy6NGHqIOStsUrr4dhd+ID4jgiS3qC/n8JdnxvMl?=
 =?us-ascii?Q?cu6BoqSIWNbcfPsFaiPmX70IuLaB47Z8PbochH7z5KHpgkcDIY2crzADQGps?=
 =?us-ascii?Q?XiPHX8jzZiKBsuA2xI82cNEqGzBN6GlbWD1c4h+LTg9Jle7kT8u5O2CVuW72?=
 =?us-ascii?Q?+I5XxnKF0nK4qr7183H7GbTY7CVqDijCREjCTCglmW2lS2b9sobknbKPPXAw?=
 =?us-ascii?Q?+nNJ2VQvjm/LOHJSuUlzDfBzJHXRh8xe1nhgtYeb/AJQmdcqbaWa7RqGqRbd?=
 =?us-ascii?Q?lh/dZKVYAdQe3FPBjeMP/uMhtW4BYI7e3slcdgvMkw9g3weHCgwP+zTU/1wG?=
 =?us-ascii?Q?NttiOEugDMLOR4vNzQJjKR9lTuruVIManLybUNFlSPhKYTstox3/9jPkmd4B?=
 =?us-ascii?Q?kumHdX3dJsjYc8scutHPIHEAUYiVx0Q0GrWqDuoRkc3chwXHFtqBbvxkgorm?=
 =?us-ascii?Q?kUKY1pZXPboFc4GS2rAOyFYTPQhmLB+HXwLYyOMOVmHhF+1lvM1eqeQ+S6mE?=
 =?us-ascii?Q?ngaA4lPmeJubTPsiEBHDr4MtOV7kwKpVyK4Rc7zhbLDDKaKoB38D+XFVXyf8?=
 =?us-ascii?Q?InJ4184WBsXrSZugpW4WJMwIBZ8WZTbg/523TaVPJFTo7zecMvPU+DwdrE5r?=
 =?us-ascii?Q?FR/QE+AcP8uYx6jsUhmBYk0kbQUF+S1bb34nLqxh4HZWg3RoKZxCJ1ES4Q4Y?=
 =?us-ascii?Q?Cu2bVXelkcNlrh26hQUBnt+QcLEJkuo2j3Hy07RFaUD6XKWHo/bpTt5I7DAl?=
 =?us-ascii?Q?zICy+IfrFARUbLQAdU2nHLCgyVfAxH+Ccue9/v5NxHbIaYHjcM3W5rSTqdeX?=
 =?us-ascii?Q?lylfKFmRVt8/Fm2HgbiFOMIh/TarZga+nW0RMBfiUnlV9AiPU6To39bD4r2+?=
 =?us-ascii?Q?a9aiYiBAr9HWryxqWVBpCxV5eml4h5lMwOG+t4c90wwpsrZBrX4YvBJHK2m4?=
 =?us-ascii?Q?XsweXoqqqnd5Xf0ESAe+5cq3VkEDApkatJoEKi/HsT0nbcANf78U59xIajZs?=
 =?us-ascii?Q?+9bpLG+8GGeiK8mr9y+4Mkthdokcdlgo4OYO62MVpMZA2s+QKIr9CyAuYplP?=
 =?us-ascii?Q?vCuV24cmJtVZpCNCN5bddPE0lq25Ckhl9evH+kLaAscS4yafVKLQEZzLE9No?=
 =?us-ascii?Q?5WvEUuslrCO+bGHpn1RsvRZkSa2MstF2+WaShrR8f5phSHpHw8X5EhpsZViF?=
 =?us-ascii?Q?s6oU0fxt8yInpeiKVqqLa8VnssXrS4ozOdauz4N0QRtmSZWNMM9RNwJPBnVZ?=
 =?us-ascii?Q?+q7Syvo8a1A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hLB2947DR4H6c1qKgLprb/rouiBcgX2kHREl1/dnxl8JFF5EhjAmC+WCZWPX?=
 =?us-ascii?Q?s8phDSwPIiJjcWAUF2WUn21LieiDqllLmA/PFyQKcAgrH2ASpYUV96W3CD9I?=
 =?us-ascii?Q?hwr9PAK9L0OtcX2HO3sY95W5tIWqhWKUHXKNbY/8w1JD/SpW+uYZxOzoiB4/?=
 =?us-ascii?Q?I3xtxuFnONi3tq6+lr0QG3MlnQgPAWGbWUG74+ZCM6Qi3flblVE+hVj8jiGa?=
 =?us-ascii?Q?towZcZYJ0IBZB7e1i4uRr80P3l57NkP7FF1Ywdp9fIEWKMfTe8WErRCQkHxC?=
 =?us-ascii?Q?8dH6QBVTfEIFFRGQ+lpY45WaP+r86QUSf1OMSwtOKSCEmZDFMTt0gF3IKHuI?=
 =?us-ascii?Q?h1igjRBCD8EMnzuWW3/LmXDk+33Afb8Th6D4ttt/FdTTjOPxYwBOdBzjBGgR?=
 =?us-ascii?Q?6dRW/jEY/qZr9LhEfWAnQun6By0ko80qSOJ5rfLy75lEWoHnZN0JdzD3p8ES?=
 =?us-ascii?Q?VXdpir/mk1sFLldCHTCPzhwPjOyj+JT32hTCG/CGsEf42e3sUDP5JFn22iU9?=
 =?us-ascii?Q?tKylcnnrtULobbe8kUwbWbEnCbtktCok5cj/0SuglxZPEkrjrG/ddtBqE+gy?=
 =?us-ascii?Q?jABOkH8j5CKgvyyMnoIf4O007hgMUmtby4zmsyuXVMDHhn+odTHSyDznq8RT?=
 =?us-ascii?Q?pkYovuc50M7v05tQu9IMz2jCR3mf5604Eq9FoFinETKH9307auaxVG9hs6/n?=
 =?us-ascii?Q?2PIdCkrCw9sEczP11n0KuUEXVRn812FlAMDVzLdPFEE6quwESdQC59lwn95v?=
 =?us-ascii?Q?H5YRhQYBQPq6X31zez3Al1gDIHDSNcNk8gnMM751MGpSPz1/ohoctY1fj4Aa?=
 =?us-ascii?Q?3tPDKT+0YptqV+Qx2Qff2HfHrlwlpEMv2hN8shqhDo2zDSX7xZg8I/SJHTN4?=
 =?us-ascii?Q?RBgE3m3XSltp4/cveDsUbW4l5bjCy+zAhHHXSSl1AkoIyuKwjvtlh9laM0MH?=
 =?us-ascii?Q?yYX2Z8Q3zURhIwxMK9EIOzxX6TWphqOCARPHgwozavfVTe3SL57KId2YzRUS?=
 =?us-ascii?Q?4WHf/R9NOdbKM3G/83HIvl101F4kMEAm9RRfNFBlGa2duI72kIeoFxkUBbtY?=
 =?us-ascii?Q?YVW5KMjbYDdbMATv3ZnVJw3Uc32d7fb7Gg6wYw7iNwTgumqo2KiCWzOfuBgH?=
 =?us-ascii?Q?mXU1l1uN2PqYvzT2LJvSWzMZpCZmAUrnDSdD+tfI6dlbFpfttir2D3MtxFHk?=
 =?us-ascii?Q?LcV3+nPMdohOVfC/NoD2tBt/BaH5QkUedk7kuTA4e6gwUt8ebiJ+duWmzitM?=
 =?us-ascii?Q?raQH2PIhlEHqHKYc3V0GNS0wyS0SXhMxyvN9hI9LqbfQCBvURmXxde3q4zEg?=
 =?us-ascii?Q?Ht2klnH6MzMbIt1tMCfSXHXOVOIXV5ZqBF5B9jHcDzPqAzAJ559i9r+XzBYo?=
 =?us-ascii?Q?TtzwVA/k8abybVLJRDzOsG93OPMyTWgmOk8TBtjcgdV0t0ZntCoKjIDRC5nH?=
 =?us-ascii?Q?JyoQ6j3kHakSSc4nQvC0py2D6U7yQOLYaanhen/4yURdtO49PNt7rLPovCpO?=
 =?us-ascii?Q?S6UMrO+qT8Lt6VM/KL4OQ3+di2WsZ+3iAxNNKpxgIvtMFzL2RkrRr2frYMfR?=
 =?us-ascii?Q?6T06Z6UfDhD8UxDJSH5izONIMi4X3UFjzIManzVr7RVTKK5hqzZWWyXZ6xm3?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+Ifyhvu517uPnQ1KsIsUoE98Wz83wE0RzA21LHq0IkdFdjZylp2Kx04291e08MzPSeT4zerxfRkwuSCTtKCK+tNVOqLrdzi9IUHcnUGUwYKwFKNN8p6F8TDHCpg6BPjkr//cZwO2j4qhCS5/C0/kgfOgiwwSiM2gik7wZgQrwNxvA0u0/dShhzTJxtVbF00rEKTXIWMtecZImtfZxL3I+OlpMuP08cQjYGFmEVrl0o4eWLpE2/hQskL+rtQxTg2EaVvXfwxlckDl7julPGuoy6+6/Np744nvX3xH3dR+yeRuyqXPX5GKhNUZwcRd6qYoy1aeGWJGjYfUcyRW4UVpo30qTren/a0tdZF/THPHJbD8bfZXLvcbIW1i9tLVNFaoiQElsuN6fC0jbFezkHWnoQJ+d75WsRoyf8LCdupze8Eq5oXJG0B4YJRocHWPr6Fuuk/y3dRwp/75DWBlk/7iw2a3K3rQPSzbpp40ETRobs4xrgdh0Geh7XRRh6vcTVJiSka+CFjLVCaAj707GFcvuCZz6rIAUEqFYFVvZoibfJ6J6h41KOnRPnzZ9GI2vAQevd1g0w82K8bbe4uE50KVZd3n0bZoX6bdxtfW11Q6jeg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28d1dea-0bb3-497b-d97b-08dda2ae361a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:52:07.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zYDnJvRsFBgvBZxN64LecMogB/HFCNSaLIQ/3jUA/OQKvR+ouZGdizIpiFmPfhqHdIA+pmXxvQ8/Av5zXk7GQnDgA6lD8sjeODWYllGxqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4323
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEyOSBTYWx0ZWRfXzv3vnkM04oqi cJhXYBYXuc6cfUnrK7TslP6xVaFdX9z038vPGDkz7AD9sKF6wJXcpBsYdwPbmvYXvcuh/o3PFc3 3F9z7D+urCp85pOuSW5Li9cU3+o97P8ZSPpi/RhBZI0VnXkHTg2El0HscPyFqAEjaUkENYoWh/M
 9W1F/apbMMmR37nVlKuCW6cPsUeV3m51sKy9nqRsWMImUXS98zmOwBMaa20wlgfjsE4ZjY8/uMO 4+G44qk+KooHnLL00MrSn+Fq3xiMswZl2NgJq/6ii6KUUijTjVkn4MZEfrkx/HUR/mp2I4BBlQF K5/6IGvFJHJ5hTzHPVHNMwTyfwPqlFz4zaKMscUijyFiNPLZRLM0CoOW2bdyKBFPHd7rBpS/c2o
 6jG5v/l5ZITKXo0bJTAeHWd7NUbmUMe2vnNUZH5ncXnDrb3yr9Oks25EXhCQ203iohFtjLIq
X-Proofpoint-GUID: gNW475j8_kWCKG4M1Zd-7ECMQt1sslTY
X-Proofpoint-ORIG-GUID: gNW475j8_kWCKG4M1Zd-7ECMQt1sslTY
X-Authority-Analysis: v=2.4 cv=H+Dbw/Yi c=1 sm=1 tr=0 ts=683f0c1c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=45g3FxUCzF-VZec3iLkA:9 a=CjuIK1q_8ugA:10

Let me reply in one place as we're currently having 2 largely similar
conversations in parallel which is unhelpful... :)

On Tue, Jun 03, 2025 at 08:37:23AM -0600, Jonathan Corbet wrote:
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
>
> > But to repeat - 'given C's weirdness with typing I really prefer to be
> > explicit in referencing a struct vs. e.g. a typedef.'
>
> ...and I think that makes perfect sense.
>
> >> Why would you *not* want to cross-reference something and make life easier
> >> for your reader?
> >
> > Because it apparently requires me to document every function I reference?
> > Unless I'm missing something?
> >
> > I may be misunderstanding you.
> >
> > If not then fine, I can delay this patch, go off and do a 'cleanup' patch
> > first, that will drop the '!'s and come back to this.
> >
> > But if I need to document every referenced function that just isn't
> > feasible for me with my current workload.
> >
> > Please clarify!
>
> Hopefully I already have - I'm in no position to enforce such a
> requirement, even if I thought it would be a good thing -- and I don't.

I think Andrew would think otherwise :)

Everybody respects you a great deal, myself included, so your opinion
counts for a LOT.

> It's hard enough to get documentation written as it is, I certainly
> don't want to make it harder.

Yeah, I mean I take your points and it's important to me to make sure I've
done this as well as I can, but this is my main concern here. Often times
this stuff feels rather thankless... so we must maintain a balance here I
feel.

Anyway, I think we can figure out a good solution here that should
hopefully be satisfactory for all (see below...)

>
> My suggestion would be: proceed with your changes for now, it was never
> my purpose to put obstacles there.  I'll look at having automarkup do
> something a bit more useful for references that lack documentation, then
> maybe I'll do a cleanup pass on some of the mm docs if nobody else gets
> there first.
>
> Thanks,
>
> jon

Thanks, I appreciate that. So I want to address your concerns as well as I
can. I think I have misunderstood you a little bit here too (text is a poor
medium, yada yada) so let me try to nail down what I feel is the sensible
way forward:

1. Once I am confident I have correctly addressed Jann's feedback I'll
   respin a v2 with the various 'sins' in place for the time being.

2. I will also drop the 'since v6.14' stuff you rightly raised in this
respin.

3. I will create a follow-up series to address these issues in this file
-in general-:

- Drop '!' from every reference so we get automated cross-referencing - I
  think now I understand the point (hopefully!) that Sphinx with
  automagically link every unique reference to a function/struct/etc. to
  one another.

- Perhaps hack in a **struct ** prefix so we get the 'best of both worlds'
  on this for types...?

I think my misapprehension about defining functions was not realising that
by doing :c:func:etc without the ! would automatically provide that
definition upon first reference to that function/struct/etc.?

Is that correct/sensible?

Would you want me to only use the :c:func: stuff in the _first_ mention of
a function and then to not use it from then on?

I wonder if the _appropriate_ use of :c:func:...: is in the actual
definition, but since it's not really practical to do that right now* is
simply doing it upon first mention a sensible 'least worst' approach here?

Let me know what makes sense!

Thanks,

Lorenzo

*I could add to my TODO to ensure we have at least kerneldoc descriptions
 for every referenced function, and gradually burn these down as I add
 them, I just can't guarantee you this will happen any time soon :)
