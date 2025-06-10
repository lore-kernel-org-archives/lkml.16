Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E6B29899B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560282; cv=fail; b=P2hWj19iDmYWnZJCluke/2ImNGvEdB70ZWFxosvELgOq4rhDVtSmwpFzI+NEQ+Qdwl/39TzELTt493nagY1XrLb0h8lB2k6BChC5yA/I1V/8fQ0lcgAuHte0TpeIWvtj29Dvw699igjI61BVWFMW6/2eBGywrCNfGIHN0KPZSoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560282; c=relaxed/simple;
	bh=mBIs1HlpoC6g09psTqlSeQmeElIK1I1vUsqr3zUe0Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j8DvsYhpX8eHlsE9/LElafGEPPDTiSjadGwJZlpvLT2yxFvVD4A59LtHZ6Zu+haOZiexwf+KbqIYxRgcgXQSR0+negEeM80LkDeDyYcNG4orYXFKzvDyZ5JGi75LhqwM/gzk2tMGZDfXkQDWKuDd31SxL1/YnYg7KWyEcatW7xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eQmpbbXW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cFPa04PB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eQmpbbXW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cFPa04PB"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A2hUV4012080;
	Tue, 10 Jun 2025 12:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/HLKGSUkFR5L1pjHy6
	bKdioncE7QdxH/V7Um8qaFfdg=; b=eQmpbbXWLwjxSvVTuA1ZEGvs51J1B3vinH
	DCgVKSBbhda1I9uA1KdZ6Bnzz49YMAsZTYWwj4IxlPxOHQ3zg7/14OSV3mr74q5C
	jw/phm1WRPv3exADvyBmA23ts3za0lytSNVBDxL73nveyUkZmMycqX+Je3cdCAVT
	unQYG5O1IRJWlOPOnm+rkU41M7LbG+AuwMcbWqQBX1qesrGtzaDYAM+5U+9SQAtv
	BjsvyWmCMyi6YIVqy/4Iole3mucetver3HKhZytB6XMeL90+TLEBZst+nrCL0T4+
	y/tLiH3qRbqujileenPJWG8cSV9iB2txn132yZNB+nk+Ily9UIwA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf46m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 12:57:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACJKNK011867;
	Tue, 10 Jun 2025 12:57:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv9pdg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 12:57:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IclnNHmWIJtAN8ZAwwaQCUV4irltTDqki/tlIpV5+hAQNpFKOyW9NBC8KA39fzv/9w94FG6IFI3w6bFsdq4Rr626HoqQmqv0xcCPEJtBcVJAo2OhX+808/4nnF4HVUp5xXMpKnWD+2kv6iiASM/H9Lit61O87vpB+k/FY+IBZhygwmAq8XUS4MGJM0f53Pt0Ky0o2w157Y8HYe9HGqPt0+BCGF3MoyYMphdawHZqCh2U7+zUMTpJvwzQH3yhdJu1KqeJDhOGz61S7T9lX9Xwf3A7ziFt5bNwF0N3+OmjU8KnOsm+qL0e68dkWPMh+2+TJff8GOVFkJsnyIMHoAb8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HLKGSUkFR5L1pjHy6bKdioncE7QdxH/V7Um8qaFfdg=;
 b=pYgXrvRfo+/toDzlB2fX/cp8IWSolzvEqdLC+NcGgd824m/AcpR3eI07dhQsvyAq/4PuWehFQNaSi95n/dHqDGtoUDrrj786NqvOejXfzzTHivdMc8Vj+kWz2YpfJob9rsqGGcR1Jh1PnvkubXpUvfVkB73swVZ8Cd1S8vDi6fkI4x+USoZs/eoMeMVzOmqpDzF6dXznSx5LRmWsT8GDGvUCJ9wsIDDEAx9DMc20ufkksc1YtFKqeXgFFGqM4JqsGTVCt1ZdH3iCJFe8xlQgSK+Asd0fLrSnuxAWiCBhKeM2iJDp8J2uc53+FfqFptqAAbkUe46a1g2LteBw2PdS6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HLKGSUkFR5L1pjHy6bKdioncE7QdxH/V7Um8qaFfdg=;
 b=cFPa04PBX17rdZvVU4V1tfNwa4uVc/90Co/r7/bA6sz+qHX8HoyS/R0akmFJ2b8zp2Td7CQO3DbJd8HPls/zqZTGKpz4iszf5lmJPsEekFChTxezXmZRfuwiquBbDG6G4k21vPsNdRo0n12dBsK6mLl7VTcF46K0JXwcZ6JECMw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB7867.namprd10.prod.outlook.com (2603:10b6:408:1b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 12:57:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 12:57:35 +0000
Date: Tue, 10 Jun 2025 13:57:31 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
        will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
        ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
Message-ID: <4cab8fa7-2679-432f-95bd-4cb0bc636b56@lucifer.local>
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
 <1e89f07c-7620-4f9b-b647-c585824ce015@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e89f07c-7620-4f9b-b647-c585824ce015@arm.com>
X-ClientProxiedBy: LO4P123CA0321.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b059bb-42c6-483e-ca9a-08dda81e5f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?94hPVH/OVOb9vqjvcPp7BZp1udiXKf4ig74t9XOi4mhtmSkIQMLMDueIOFhl?=
 =?us-ascii?Q?q21c4FjvC0MFGgdIBa+jjfxupJb3ECJ306Ltv3IfR6Y4822NI5E9xKmXpZ0D?=
 =?us-ascii?Q?TTg+Q8/6g1bJR8qnRghLyFVlTabfXLdkmWboupEwtwXctMQmaXJ+Ab005sf4?=
 =?us-ascii?Q?MDFmwx8X3lGGkIusjAqB/ukJd/j3nxJg4/npNfd7RhK7R6lMkqG8X2j9Jsnb?=
 =?us-ascii?Q?we2ESW9e0PGmaZ4DocB2tAoHBfLhBvlbFqZKn1m6lPrfsl/oI05NhWy/0I18?=
 =?us-ascii?Q?fntUtcfjyNGubElj7fB+uHOADDH7b9snEab7nBSwqT4YAgnB/jP6WbW6K3gn?=
 =?us-ascii?Q?CdfnWgjTbJhgu7caQ7tySj7UTEWT7yWLMjEKPV8r3GzCVdk1AOVbJ5fz5K6V?=
 =?us-ascii?Q?LE10okXS+3wGv3i05KfRGazujE9R66jnTLcH9TBBEvq54YiLW1KlIHX//vbI?=
 =?us-ascii?Q?I97eJUBEg7N3X2N3Q1FITK8s7FFbQXcyYL83/A19VWov2G8vZS7b/p6fwP2V?=
 =?us-ascii?Q?YG0HoFQ1NZslQp7zuZy1g64AGFuYcItW83k2FPmlXbWwtVMZ1VYXqOlfRyF8?=
 =?us-ascii?Q?iVvFI14FzxQKRVelQ7EcQ71TYmouSK39x2h324blt06lKqWyZS1LhOg3RJ35?=
 =?us-ascii?Q?qCNLBHnNUjA6rRnEkypD3jYJYZGb1fH+x/ZCsIF/w52V3fPK+VBiaMHvd41i?=
 =?us-ascii?Q?jXFU5tTfkrZUXsWPMKs7dRl0FlwKvena/wkyXtPtQqG626twmF/qIUTWvuts?=
 =?us-ascii?Q?cal0gy3y8zrlm9Ql2PO04xlM+80Dqp8AsAJ7wFgCbB46nJACiaqvota2gMej?=
 =?us-ascii?Q?dX/7tLqbkZstLPYLxLRA3HhmE7deJTQCXDkftKIheeo7xkatkZ8IgfXS4yWP?=
 =?us-ascii?Q?cz9SL5TuWR8Xpl+G0vmVWVM3aKZRb58slyvSb/dapjivt5GHYoDeCUC7buHw?=
 =?us-ascii?Q?85DG8ccS07Myn/XIC3aE77zTmFAGwIg+RbFkPx4sy9FUOxW/TwMfcnKr5tJd?=
 =?us-ascii?Q?A3F8MguvNE8p7RY4ZbJLbCgIpej+E3SMxJPtlwjpCXbZZsBWa1aYczKxZC+r?=
 =?us-ascii?Q?BEWy/Pc4deT0myKeajtMCHSPtgjT9/KT410NYslgB4IlPDyFof8zyyPv9DC8?=
 =?us-ascii?Q?fl+62ZlAxM6UK5zlPysbi7fMCLyV3/maIhFNKLuqLmBvDNtYorNTvdasRyO5?=
 =?us-ascii?Q?SMaSEydYnfZ1S0QQC/xs26GR8y5LfVOgf/egPNEpovGnIzX3pRR0RgEkS+X3?=
 =?us-ascii?Q?eImOzqP8BneNoAve6GJRqZTp/VD7RArKAhy1qZuGztTuxlnpkavpoZswPqLB?=
 =?us-ascii?Q?RMCZDtdLliXVvAVEBVx4IuwxTQMX+kiMRMvdw2nybrXEzSCIpWBdhpm51ESP?=
 =?us-ascii?Q?xoezKWl43k8syw+kYDHo5UArWpdNuu7qdSh8zzQItxco9UZjxefDLIXno04+?=
 =?us-ascii?Q?R42ylumkLaE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XCoAs4svO0rHMBzuE2h2EMXwBN8Shrrm0kyNa3EGBbvkQENp1SMpFlNS1bHG?=
 =?us-ascii?Q?R35KwLGbGUccrk+fWax75nCaz4rv5ChcIAqQlDbtK93qXXc7sZR0fQNT4D9S?=
 =?us-ascii?Q?jRIW38sNVS4UULMxN17wkIj1YxWrQzqRjWTIrH/hifKXXvTz+n2aeGYe/jO5?=
 =?us-ascii?Q?LZa/kvHps5uFl1raLzYIQhwXqHPYReaVhxHyk38/vc/IqVeeXRkNUXGVGpFm?=
 =?us-ascii?Q?8JytEl8D+OrGIZk8lnuVNXmLcJSWAVnpNII8zGVBx8dNq0hwn33xLEmEj/Qs?=
 =?us-ascii?Q?hy++VkMU/4waEWnUvBGz756E4BTKZw6jGmMCa8FrdIs9bEuO9f+C6ouIl1Ms?=
 =?us-ascii?Q?+q0lowj5UZU/TzWAHJflsZyKbjujkzgKUqRtMlgPeaNtxPhZDAbsYUR8Oi3M?=
 =?us-ascii?Q?N6fRo1ehPn/OyyaIKS46O8Wsz0+x9z7Zhun102rAvdGfLs8miZlROTgJbwjH?=
 =?us-ascii?Q?dTEfp0WHuBJgNTE3tgtkSb+sTaueTC6DRscToHy6YRbFnM8O9T1R1yql6l1w?=
 =?us-ascii?Q?GfKCIB7+7KJCE2oXcuUkHPLsZdkWw+cCVjFveZ1jcUB0qcBjpjttFR/1+jzm?=
 =?us-ascii?Q?XOxxK8t9Is9iPOgUj7/WIoAXYSPSFOnxJaN22bNXHxp/X3/tIQjdnNaBuQ0H?=
 =?us-ascii?Q?QIgDkac9hbakG9o+sE9iogXNLDi/RshO5vpn7wX+QS5Ikm8LNmMpg4dLr/0X?=
 =?us-ascii?Q?O8bzwtBuZPqCZ0Ak3S25o9Qh3wQ8KJ/bv8IXUIeWznJcCkGJnaOvl6TSJuUU?=
 =?us-ascii?Q?DOMUBuzyWgtSYElpqqW36Q5PY34Xo+j3IdCpSpFD6Ki3oUvUvNruupDV6a7Q?=
 =?us-ascii?Q?gAPNPowYzGmNnwlk+Ly+yOqWRKFUhc5HDqa9kRZ+7ScmJFWpPAluPCK9Mvi7?=
 =?us-ascii?Q?J1RjHYyXxcyTFuIdqkXC1+0mTyJCSeB2JCs9+MWGzTvMYHsPx25KyYQ+mYrt?=
 =?us-ascii?Q?+Nz83WuUPipXGyMbrxBcLgGH86kBHH6xsMT5sG6vNTqfItNiWgz1FOcedjua?=
 =?us-ascii?Q?b+7PgmKumM6/X22L3cxsLztfy6hbXm+yHLZ30E+SNua4pId/51wzUDofVwGL?=
 =?us-ascii?Q?EsVah2O1HvemiIq3XMWv3u64vmiXXHU8+/9APMDt1TIQXE1j2Z/Pz2Fjp0bi?=
 =?us-ascii?Q?txS9ZqeS4UJ5pAhUWWLFX7d2uZTtgO+hhpJ85bKRpXw/odMxcaLP0GCRkkjy?=
 =?us-ascii?Q?oF3HHVd86fGx5AOVm9BvgnB87NQUSItp+o3ROiYux7PcIeb1xJX+o77m1sO6?=
 =?us-ascii?Q?quk8RT0aVGdEm19uLZiNidxIBgpqwiuDoG5P21kvhvqA0G02m2S1oqnycLKQ?=
 =?us-ascii?Q?fan/LfnStA1oljn/GrSH6DVR2VLLk/rkTZiY5e0MWP9duinptJW8FAWTfuOR?=
 =?us-ascii?Q?BQFRIxlWzbhUku7/V5Su45EqWZoEQzWUc+ARFFJYLxRvn+DA5zwn+ZybsrBB?=
 =?us-ascii?Q?TwXgZTZ8jYYFAjsff+JTYM9UvlZxfBefCb3xwNAAUNAMipI2jOmZMd895/rC?=
 =?us-ascii?Q?chrzk858LGiDRX+YFVui2FlUv7N7LDoVGleQvLLKPwQ6hZ8XYw6CNSJ2Z4g2?=
 =?us-ascii?Q?de3vO2i+zDgsDQ0Jne0bRgiRFntpk/hHAp2l9pob64k/H9XDLHd5uWjSzMLq?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7yuSYeCdzmW7bRvgrm/KajMoHq//apXwoPodhH+2UzDb9mHBikthYN/V4GBM23kB97CyDfEcK0a+LkzK4aE5r+WRyFOdF8yGpq6ed6O5mIL2+6T3R4/gpNhnCqz53tlibmB/57oGx+r6ze2iHlEPMJ1cLRFYcaFhuBkqbCi/ptc/NrY5EbcheUzeRFhVbD6tgrAaPazAcjF/Wz5hPUkkExXXCn6doFZOJjOLX2Ebwp6W9BZni8TH5q+gZPeThwiiqlPfi5t38WKzLMm7PTU90kGKw1bNu4xx/QpDVi6kHZEcDD4Up9RB7Ud6ud9/ZPVqGI4J+idE76UEXgpwYGPMWOxTCl6ZVSQ5fyMn6Y8dSjAWtyNK9s0/lJ3e3Z7hzHBFRM12MaJxwAVZ/I88dJxJBS1iZRIq2gwElHIZQx1EM0y1AM0vtOA6VidOL5nHg5O7hWlxk24eYABDIWjnC1QTNN6c+rI711hP9B1/GIhW+8RiD598vqN761z3Dck6WDSqOcGdj+Ppf19geeonnYy85kXZ9E9VGmWPZGEaHE/qBBd1VGRfTpAKgpqhqb4CWzddsPf5vsOtAKKjtGlUXx6tm1ihc2VqVUMYF+Anetokh3g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b059bb-42c6-483e-ca9a-08dda81e5f06
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 12:57:35.4922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnbzgmtwcfCV119yNcnhkkdLpKCf2+hp3wci6ZS6v/xlFNkaI/MYSQ3I87LmzEmqweQs8wXV2WcP3RKnzGJmu+E0Ky4doTiUmrAGzA3/RFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7867
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100101
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=68482bc4 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=7CQSdrXTAAAA:8 a=Ebo9dNYe1ZIrqAeqpY8A:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: GX4S0v18smz2GGBdOxzEoVSomHVyOTHO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwMSBTYWx0ZWRfX3LqFR1Fln6t5 /JynLAKQ1pmX1KLV2hdZMYdJMUdp0eyst91HUcBEwvJGBYFnrM5xz0EBQh4Wzyj3ae0SWzXYJHw LdYrv6UAuaXL0duCjeDmYou+o49jVvoRH73yf25fdNYXGzfRHNYqNkt/1+IqnFJjfCd5XxcT2Tt
 E0WShm/y5uV+w72Vvsi3TZsCuLss6mr6TKy27GhY8hD1XUoLkevfprqyXpcIIfs8lUgw7Tz0mvf WZxMDrVaSIC0585SD7yEfh8gP56k10D5E4bLdi+z+OXC04IC0JhGx1pm2Lp2FE8PG6XJXzx+X6i Fcd6vfVDqVNps0OZK23Mc7u4DtlkQiHA7yn8D/HbdCTJ6eZLBDaEj/Qox2J9SzSfK6TWXvxnoIO
 /ZtthWQyZ0HOCU8JB5ajAeQCPQz9ACZequKfJnYkx5GCyLOakF3Ry6bX5dTN6NQkL8Qk9xBo
X-Proofpoint-ORIG-GUID: GX4S0v18smz2GGBdOxzEoVSomHVyOTHO

On Tue, Jun 10, 2025 at 06:10:03PM +0530, Dev Jain wrote:
>
> On 10/06/25 5:37 pm, Lorenzo Stoakes wrote:
> > OK so I think the best solution here is to just update check_ops_valid(), which
> > was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
> > enforce the install pte thing).
> >
> > Let's do something like:
> >
> > #define OPS_MAY_INSTALL_PTE	(1<<0)
> > #define OPS_MAY_AVOID_LOCK	(1<<1)
> >
> > and update check_ops_valid() to take a flags or maybe 'capabilities' field.
> >
> > Then check based on this e.g.:
> >
> > if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
> > 	return false;
> >
> > if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
> > 	return false;
> >
> > return true;
> >
> > Then update callers, most of whom can have '0' passed for this field, with
> > walk_page_range_mm() setting OPS_MAY_INSTALL_PTE and
> > walk_kernel_page_table_range() setting OPS_MAY_AVOID_LOCK.
> >
> > That way we check it all in one place, it's consistent, we no long 'implicitly'
> > don't check it for walk_page_range_mm() and all is neater.
> >
> > We do end up calling this predicate twice for walk_page_range(), so we could
> > (should?)  also make walk_page_range_mm() into a static __walk_page_range_mm()
> > and have a separate walk_page_range_mm() that does this check.
> >
> > I think this will solve the interface issues I've raised below.
>
> Makes sense, thank you for your suggestions.

Thanks :)

Sorry to be a pain but I think this will fit more nicely.

>
> >
> > Thanks!
> >
> > On Tue, Jun 10, 2025 at 05:14:00PM +0530, Dev Jain wrote:
> > > arm64 currently changes permissions on vmalloc objects locklessly, via
> > > apply_to_page_range. Patch 2 moves away from this to use the pagewalk API,
> > > since a limitation of the former is to deny changing permissions for block
> > > mappings. However, the API currently enforces the init_mm.mmap_lock to be
> > > held. To avoid the unnecessary bottleneck of the mmap_lock for our usecase,
> > > this patch extends this generic API to be used locklessly, so as to retain
> > > the existing behaviour for changing permissions. Apart from this reason,
> > > it is noted at [1] that KFENCE can manipulate kernel pgtable entries during
> > > softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
> > > This being a non-sleepable context, we cannot take the init_mm mmap lock.
> > >
> > > Since such extension can potentially be dangerous for other callers
> > > consuming the pagewalk API, explicitly disallow lockless traversal for
> > > userspace pagetables by returning EINVAL. Add comments to highlight the
> > > conditions under which we can use the API locklessly - no underlying VMA,
> > > and the user having exclusive control over the range, thus guaranteeing no
> > > concurrent access.
> > >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   include/linux/pagewalk.h |  7 +++++++
> > >   mm/pagewalk.c            | 23 ++++++++++++++++++-----
> > >   2 files changed, 25 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> > > index 8ac2f6d6d2a3..5efd6541239b 100644
> > > --- a/include/linux/pagewalk.h
> > > +++ b/include/linux/pagewalk.h
> > > @@ -14,6 +14,13 @@ enum page_walk_lock {
> > >   	PGWALK_WRLOCK = 1,
> > >   	/* vma is expected to be already write-locked during the walk */
> > >   	PGWALK_WRLOCK_VERIFY = 2,
> > > +	/*
> > > +	 * Walk without any lock. Use of this is only meant for the
> > > +	 * case where there is no underlying VMA, and the user has
> > > +	 * exclusive control over the range, guaranteeing no concurrent
> > > +	 * access. For example, changing permissions of vmalloc objects.
> > > +	 */
> > > +	PGWALK_NOLOCK = 3,
> > Thanks for the comment! This is good.
> >
> > >   };
> > >
> > >   /**
> > > diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> > > index ff5299eca687..d55d933f84ec 100644
> > > --- a/mm/pagewalk.c
> > > +++ b/mm/pagewalk.c
> > > @@ -417,13 +417,17 @@ static int __walk_page_range(unsigned long start, unsigned long end,
> > >   	return err;
> > >   }
> > >
> > > -static inline void process_mm_walk_lock(struct mm_struct *mm,
> > > +static inline bool process_mm_walk_lock(struct mm_struct *mm,
> > >   					enum page_walk_lock walk_lock)
> > I don't like this signature at all, you don't describe what it does, and now it
> > returns... whether it was not locked? I think this might lead to confusion :)
> >
> >
> > >   {
> > > +	if (walk_lock == PGWALK_NOLOCK)
> > > +		return 1;
> > It's 2025, return true please :)
> >
> > > +
> > >   	if (walk_lock == PGWALK_RDLOCK)
> > >   		mmap_assert_locked(mm);
> > >   	else
> > >   		mmap_assert_write_locked(mm);
> > > +	return 0;
> > It's 2025, return false please :)
> >
> > >   }
> > >
> > >   static inline void process_vma_walk_lock(struct vm_area_struct *vma,
> > > @@ -440,6 +444,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
> > >   	case PGWALK_RDLOCK:
> > >   		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
> > >   		break;
> > > +	case PGWALK_NOLOCK:
> > > +		break;
> > Under what circumstances would we be fine with this function being invoked with
> > no lock being specified?
> >
> > Isn't it the case that the one situation in which we can specify PGWALK_NOLOCK
> > won't ever invoke this? Or did I miss a call of this function?
> >
> > If not, we should make this a VM_WARN_ON_ONCE(1);
>
> I was made aware that there is a quest to remove BUG_ON()'s in the kernel, see [1].
> Is there a similar problem with VM_WARN_ON_ONCE()?

No, in fact the proposal is that we replace BUG_ON()'s with [VM_]WARN_ON_ONCE()'s.

So this is all good, BUG_ON() is basically never needed unless you are _certain_
there will be system instability that MUST BE STOPPED NOW.

Which is almost never going to be the case.

See
https://lore.kernel.org/linux-mm/CAHk-=wjO1xL_ZRKUG_SJuh6sPTQ-6Lem3a3pGoo26CXEsx_w0g@mail.gmail.com/
where I managed to somehow provoke Linus into giving some (very interesting!) input ;)

But if you see the thread you can see further context on all this.

>
> [1]: https://lore.kernel.org/all/053ae9ec-1113-4ed8-9625-adf382070bc5@redhat.com/
>
> >
> > >   	}
> > >   #endif
> > >   }
> > > @@ -470,7 +476,8 @@ int walk_page_range_mm(struct mm_struct *mm, unsigned long start,
> > >   	if (!walk.mm)
> > >   		return -EINVAL;
> > >
> > > -	process_mm_walk_lock(walk.mm, ops->walk_lock);
> > > +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
> > > +		return -EINVAL;
> > This is just weird, you're treating the return like it were an error value (no
> > it's a boolean), the name of the function doesn't expliain the 'verb' of what's
> > happening, it's just confusing.
> >
> > Obviously I'm belabouring the point a bit, see suggestion at top :)
> >
> > >   	vma = find_vma(walk.mm, start);
> > >   	do {
> > > @@ -626,8 +633,12 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
> > >   	 * to prevent the intermediate kernel pages tables belonging to the
> > >   	 * specified address range from being freed. The caller should take
> > >   	 * other actions to prevent this race.
> > > +	 *
> > > +	 * If the caller can guarantee that it has exclusive access to the
> > > +	 * specified address range, only then it can use PGWALK_NOLOCK.
> > >   	 */
> > > -	mmap_assert_locked(mm);
> > > +	if (ops->walk_lock != PGWALK_NOLOCK)
> > > +		mmap_assert_locked(mm);
> > >
> > >   	return walk_pgd_range(start, end, &walk);
> > >   }
> > > @@ -699,7 +710,8 @@ int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
> > >   	if (!check_ops_valid(ops))
> > >   		return -EINVAL;
> > >
> > > -	process_mm_walk_lock(walk.mm, ops->walk_lock);
> > > +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
> > > +		return -EINVAL;
> > >   	process_vma_walk_lock(vma, ops->walk_lock);
> > >   	return __walk_page_range(start, end, &walk);
> > >   }
> > > @@ -719,7 +731,8 @@ int walk_page_vma(struct vm_area_struct *vma, const struct mm_walk_ops *ops,
> > >   	if (!check_ops_valid(ops))
> > >   		return -EINVAL;
> > >
> > > -	process_mm_walk_lock(walk.mm, ops->walk_lock);
> > > +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
> > > +		return -EINVAL;
> > >   	process_vma_walk_lock(vma, ops->walk_lock);
> > >   	return __walk_page_range(vma->vm_start, vma->vm_end, &walk);
> > >   }
> > > --
> > > 2.30.2
> > >
> > Thanks!
