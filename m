Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C28521B184
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148834; cv=fail; b=H5sJ5aKssTWTWtMOyj/rFrAjogGuAGGU5NlRw6PQaoevIjGcuP94IhgMzC0X4kPGYruGvQppDt2VtnQZw2jsYfqEH1I/xhKcooiigjEfKhMkPUGxOOC8C+u0pCmLmXJqwz45wxvTXR+CVvs1RYV04HfnnuMzysOLlL6e0dE9SMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148834; c=relaxed/simple;
	bh=0M2E50KzCNqpfQ8IM0yAquPHXCeEA167NVBYrL3Lnl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gSYHXYxDyCWwWQ7zvTw80dh+zL6pM6ipKMUAFe0Xh2SKY3OmBjvvgIwjFMybGt9tjIuh8UT12+Ak5tNfF3SMx7NU5mwcPoW1/rUogJq/gXa6KcsLMdUpRwYI3Ei9kAn7eADYLKk0gHdJtdvcs2V1IBZPVYQ+0cPErRaG0HpkRpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sKmGMI+J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Nxlpn2gQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sKmGMI+J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Nxlpn2gQ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7tXsg002038;
	Tue, 17 Jun 2025 08:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ggs+syH2hF5NJ50O1B
	bQdLBqdIJ9ohq77QLa8X9LUdM=; b=sKmGMI+J9RsZleo8otmEo+KO4/GdSz32Qo
	ICpYJUcUFobq1ocHCw1CG53eQ10CggOLlE7x3nkWfrlNexpjH4Mf8BcjsBEwS67G
	XpmD1SNTFa4I6e3QrTZzWM03JW0hFe/lmM5K7ewh4hkBKWjgYjJoZCl+B4F1JQwT
	qPeg3NnFv8TG2MMFwNxCiI80WrGzDFB5QelDEZpVfMqeWI+49s67Hy6n4+YTrn4R
	1Rm+h8ZoWD4RsNQO0jFki3QZzQl9vqSPFBN7b69W6DfFOOZK1J953QjlTali4/f7
	ooQsCfsNJiG4vRhjsSHxcZVdKwViDrIlLY29dulez0aXZRqnoImg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r3vdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:27:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6rEX5031601;
	Tue, 17 Jun 2025 08:27:00 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010053.outbound.protection.outlook.com [52.101.193.53])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8pkhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:27:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5UbJuQazK72F7aqt4gYjHA8mVc91upKureAgIj5aG7btWK+UGvwi/JiqBYTZLwTZ0vySMT4ZxasoVJ/Fp5FJZ9oUEVaH6OmNnVjLrud39AhDQTKlwA9nOy4Uc3mHKPr8kBKUcNimPBLz7KJaoCaxEi+ZHFnaqOMa7dTVu2y4FGecEBb0qzCfecsrbHEfxP3np7jGeYYJkc11Eg88LQSIQPv76nNc/z82y8EtLR18tYqmE3H5IaIVNPGxXjgZ85mgmhun1r7b2f7vnsIXwsI54j47ydmI7mRZ+Xp0GUVduLS5GXz9NBPW6JAL73J2obpz77pK+A01X39erNr8nW/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggs+syH2hF5NJ50O1BbQdLBqdIJ9ohq77QLa8X9LUdM=;
 b=if5IxR9QZpUrNMqdm1pjl/odGuYJIGqAvlazeGnxXENlOTKSVudInRfR6tyHW+0gJD+SR9M4/LG03WilsQsKzs7fHcbQEAtqNXx21tByvqrLPQaWlmU+xWQwCFRELwn89L52QEK51rqU1JDUeCt/BCM0KZQnbjImdHyNvC/BLtWgLF93Ih4//p8aA8amoyeZCmfBG3KTtAURpc7MQ55zHbPKOiK7ySegvieTKAmrXLaNqRTPGbd8Oe3v0pm2+Uh4m7f/s2w6GC4ok9n74A8hfZFMUVrUz5IqBFunfEu1FGGeNJkMZ58Nr2JGtL1WCtrXqIS1eqiJep64SpNIYKC7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggs+syH2hF5NJ50O1BbQdLBqdIJ9ohq77QLa8X9LUdM=;
 b=Nxlpn2gQ0lvUHeiaSPKkhDGHBG3lGzg1mkJJuhpp9my/zQi4y4HkYZNOqTpIZKoP4+amP9OIlVBYI4XnkY6TIsSt99et88lsoRgW/O/IFWyJ76a+iCjmc/yU9dgK2dWfU2xJhFPJ6ThC5R0uFrgtimVrhG9JQx/mLMc1DeJPmX0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB7536.namprd10.prod.outlook.com (2603:10b6:610:184::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 08:26:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 08:26:57 +0000
Date: Tue, 17 Jun 2025 09:26:55 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, 21cnbao@gmail.com, david@redhat.com,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
Message-ID: <007fa541-94da-4f89-88fe-9402b7fd5310@lucifer.local>
References: <20250617020544.57305-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617020544.57305-1-lance.yang@linux.dev>
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ede819-19ef-4e89-7e32-08ddad78b99a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KT9I+KGraGXF/qvAhjOgYyXpfNJW4w2SE+avXVDlsenQXdjok5F7HaXbnTD5?=
 =?us-ascii?Q?Coi/Dq4GuCAgrWbXd+pwxAvupvpTKaatCc/5mBi1jBO9ol1vUl012W2tWz5d?=
 =?us-ascii?Q?r+HCoIbuqzN3u/cvmH3mtdW/KOfkErGR2ks0iS+N9SNXmMKpOlXJRikXV6oR?=
 =?us-ascii?Q?8ZvDXCS6Oot13eIm+tRx6QOnnSf2oInJ/5XhmPq2J1rkYrV3fokkdm0UzLwq?=
 =?us-ascii?Q?qQbVrZ1cuK/pCw5iB1GaBUbpJpUzEy1UdOxrgP2a9owVoEaDBVfVU5Gk7kck?=
 =?us-ascii?Q?sxXGcjF+8N4M0sC3SXmIKWUE57GnQm98uvNfHZg35xrGXSayldmpnbzhqV9p?=
 =?us-ascii?Q?2LuyrCY3QkzJppybz7ifD6za5OfrpYVSNDVqRXoVVr3IV2FGFPDCgPI//deH?=
 =?us-ascii?Q?h3AlN1C7GbNybKQoKdtX/q0FirlYBP9PfH86LQp1ZAs8mGMl38468PUAsCK0?=
 =?us-ascii?Q?jzph6Ebp6CMh45lpxYdtW5n75PEP+46zLxcAFrVK2BElmUtXTF7yRV9vcupz?=
 =?us-ascii?Q?jWS8tyuUmDNeFHk8gOPwAK3we2mFp3PK/DWLyp70cH817aPxhp/JViPRLQx+?=
 =?us-ascii?Q?7xZCh1WC/yE2STfRn3LbnwFk9AisS+b07b/znW0zsY7Rf4CQv3DLlsKB+f0U?=
 =?us-ascii?Q?WJve9NgFtKqevk2lfp4S7ecKhp95oEPYqtV8/visltQ6hYiby5/UNKPP8JcA?=
 =?us-ascii?Q?fm+oU69hxCVG6vR9a+zsnC7lO3avFG/Sp2VcFlkQJq8/KcrS1IQ1/Ge1naDU?=
 =?us-ascii?Q?h0yM/Ex3/2Ec9tM7nnO1/KU8h7jBLoFoM8wvDqY/gbvJH6JbOEETvhAVhqcu?=
 =?us-ascii?Q?rN4laBc1Ke0pybJ+htjPSfsIfX8x7fF/FTr2OdHFJThjJCvmBE0tjLo3842H?=
 =?us-ascii?Q?5bPFDfjS5BvRSIupck0net7/71A5xdc9idF309dpO5A4/uvl8HNsnr15kor2?=
 =?us-ascii?Q?ZiIULkCo2Nv6sefHxsMAa7C4eC2ZaueUhpEhlt+FAoKHokSQLZf92FOVwzJK?=
 =?us-ascii?Q?mn41B2Ripnqdnat6zlDLRpxbytX8XMSSs6AKAjQBnIqr8so5S+tB39Sn48Ws?=
 =?us-ascii?Q?zdG3vyU2WiIrF27y4DuFoTrvZDq4+0cL2ONc2LOW4VtL7sVJtBVJpaoLIVwn?=
 =?us-ascii?Q?PHJM5EqVVBqz6yIsAsqqOBDjuJ/nyXCOe+MPHrDngPtb0albzTFSwx1vpdV5?=
 =?us-ascii?Q?zB0070Tc3ElaNX9nC6b+Wl8bw110SuSOZ5PCuhSzMf8n9LrA8RTcFBXd47VB?=
 =?us-ascii?Q?vwzWnv25ATrtc+tXi1FFeXThmoIxEXD9JrI5qeDXanwp0k+W5HL/7cmUPZ0G?=
 =?us-ascii?Q?F69E1G1zOJBOcV11K2YDhnxBomq2/WRen0pHEq3gowpebDS7wz/InU1zyHvr?=
 =?us-ascii?Q?y68Mp9dWy8Uio6VhcSpBzywy+zM6DnlJZzR338PFPRdLMHR0mE1cLAY6lddb?=
 =?us-ascii?Q?8nLPeX4a2uQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/zqx9t9Pu2Pegwujr0nNM4oL9RsNjIIL+o9m/GfEAzNKpiZ42b4phTg0CJo2?=
 =?us-ascii?Q?GWjshJ5W5bt5Jd4TPwC1PijuS9ufHzPlH8phN+OwVhgQHlFdlDJe36RHA2WL?=
 =?us-ascii?Q?xlRO06TbNSEFvz2ATe+JcM3a56VpaIMYBnwwL58P9ZkXP/v3N4TSCDg7CMFB?=
 =?us-ascii?Q?Gbl9JuFj54SIJE88XsYt4Z3tNuy3sXV8XS5Qbe+RZKBbvdUuZ1U75ODBkd+I?=
 =?us-ascii?Q?u03QzIEZdufta50r/+SCjq70sVqLm4olWnGGb2UZr3gmVfW1daTdeH0ZvLEw?=
 =?us-ascii?Q?petefhnz5NPGy9gejsUKkyeW5wSOWsLRLr9fbVQd+7k/I42PF2ds1aALoUH0?=
 =?us-ascii?Q?dd5csa5NcgmeTtnvkCbfrO2U5K/T41ub+lGtVH3wMUfvamhHoLzFOYiscGvZ?=
 =?us-ascii?Q?5Pztx4TVDWDysMpvZWsnFSLK2xhl+msPO47156KqjbKyy8IdAjmkItK7VKNk?=
 =?us-ascii?Q?7rOeauxYi5e+ZsvcOeHsrVUna6AKa6z6D3D9EeEIlgpnmEY8bwFc4aeFK1gL?=
 =?us-ascii?Q?IVB+uVfS49PniGQtFfIA6tOYcBCVMn8Rl3tVIrz1D/Q5vZsLSZccvoXprOHw?=
 =?us-ascii?Q?o0zXn+mMk3GdtT5TxE0n/Y2Fw8NDUVjdOvXAT2qezWSi/dO42P8UFMCI3+qW?=
 =?us-ascii?Q?bcDzQTqcX7ruQ0qDYW/RvHxEjtO4m9zeXg+ea4Dga8QGNmkKZVcQ1eQaguRh?=
 =?us-ascii?Q?hnpT0eMNPe2D3tX/JEMArDZsp5oewO5zl+SxMFmdTY5KlVcgbSfycEW7ehP2?=
 =?us-ascii?Q?iQg26j4EfGRjjL9Hhc7lb3fLvvIhvO/RGcN++cJXlhhJtw/VjO+UBzjTzwaW?=
 =?us-ascii?Q?OwcY901WqPUAKF3anuqn6jQGmdVZ9ulfqWNgATa5lFcppZTMOMS6MTFIyHJs?=
 =?us-ascii?Q?jFt2XecP9/OhjYNCrydOxYmYFHMtybbgK4ONuKOejnNNcIGXaqT2aZzBop3e?=
 =?us-ascii?Q?pzRs9qj87AkNDgvv+PEcrf+Oh+7u9gsZHlkQxIx/qQ4L7KEpHaNb8YGIu8j/?=
 =?us-ascii?Q?mtFqy7a4ZCbB5+Og0RTgc7W/nizvI8Pu8P6e3wZdbgCH6kS3q21710CrU/hs?=
 =?us-ascii?Q?glcpFeGUS2Xk6qsqSMIxEIF+e+nZi18VSuXWPfBi2K0egQX+s1Os92cJa/mF?=
 =?us-ascii?Q?7jNDgc23qC9Ga8oAjuk/BJreRt0kMolnlzHLqtkdtqmm0ZmheJGJl9gYv2IR?=
 =?us-ascii?Q?f774zTbALVAau7aS4/W9Q4x/8HE8cCNA5Rk9mJjSHNSrwJWi50TIlPFFrYtO?=
 =?us-ascii?Q?9vCeVTHXhdtur+0m4eYV2NgpZSOd55g6AfmJB3/K+Y0ZZIfgeczPHUR7uZ3/?=
 =?us-ascii?Q?KqRe7OcgSfpsZqcLXovS1ZhQAfuxI8Mfxy9aXH2sC2J8ZZzs/zuWpJGQQNdW?=
 =?us-ascii?Q?eyThYbVds/Rcu+xt/+r4sePqcgF1EVx4osgWkgjqbCsBt2NzMOVz1fbsffrd?=
 =?us-ascii?Q?HLgGP4Z9FaCGnFizIsFIOaWlbzDlV5N9BmQZX/hoq05E4yHR2WMllqjMAMMw?=
 =?us-ascii?Q?drcGvWF2eW1Sihly/Z4BmO3uKyBpJm2EgUs90jJ1O4OHu71u64OrXAxII2rt?=
 =?us-ascii?Q?wkqM/MivOeEmwMVMZyIEo7lPfVn/AzSPVDTPY+hCHtbv7monZUAgpmnYuL7B?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qx/tHBZm/kyELC1VN0yTrR+2felz+z5gzbk63rnHiI3wDmYHLn3qQ144myeh+rHqYVRA4Y1pTBTvvFY59SMvnuisSjnN72QD900i04rONDNG6fnmZWHQIK8Zc75IqVwqSsjJxYHl9hfEwuqAQ58GmbEJHF9Dl+9UxghU+nc9v2xVo77UFf1gY6qArdZ7KkHHZxn38AlRNX2HOdWY8YCEkHm54jcKwLFKMODtJ3I/t6Jc3mUZNDR0VMuTxtcrt1PcyLWoWysXstHs8TpBAPqTsWy2wa2ZDZTVXpQzRHQ7knc6q6odYQvNeP2yZMRBa6A+BotjElcXjcdqWOO/nbe3reTt+PXeuLBnfJpg1ZUsliDUctnt6QKzmlXdsrJO5QFV0A5Q4JlMmKUTTQQFzVcujHKTYNSPFW8OYuWxcjZjBcseG43F0Vu+TuT4n49MtqtejSW30U0QjvEF0PNV6v0pRHj6OhYeQ0E8dHrGx3dcQLdgdZ6ut8Yw/8sELgFqhXjdo9Gqn9M+aeWBpTdd/G5Kqw1qPVQ7WYFc5DEnRe6M257+2dR+1qIqXRuwetrGEIT0Vr5S/BKsnm3ffMiz6lXrwjbi2nFwfBuccOR+E4gAqz8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ede819-19ef-4e89-7e32-08ddad78b99a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:26:57.8722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mM4R3oEXQ0h6eQ5pzHMch7Pm1vG9PMbXnQj3S/9rIsXNft5z/J8IeBVAhZxWjT2yreHRprFnNr+PsJVatbpKYqldHAlVOdFyF8/Eth5/8XE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7536
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=979 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170067
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA2NyBTYWx0ZWRfX4FYY9qDN8vYq /Taw9q8B2CAG90I+ghe9XiCA1UBLFX2AsSe6+I3TQuWDmkOCXkLbPrduQYAban0AQi6JUq+gtUD FRNXUY0JH+I9HOB8UM9TbbVhKEpmsNMd4c67vOgQ4v+xR9rM64RvF9F8z6CASBFthRLOP6xoIaI
 coGUDhbA3lLZbKgTtGwLPs6yWzIpDFABELX4v3nUiLZyfPYuFtPBe5Z8Fdu4DTUhfMqxunp+7Pa em7EOiaIJwqYHVVXIIv0YntPJFEVPMs3xFcqUNiWHHmLs+m7bkN3A8zPFjatw3hSxp6xdEZrdNv Sex+4RebXrtKXEgMXKCIe/cNEs5xl15vWi+XjnttdtH3j/MJHFPqV6DP7q3dapddjg7cTGqFRF1
 Et7Trnw8FttpLPzhRZEGaYlZwGreGBKbjwB/zj250eipq+ATT8EggvvlzRfAc4AmcBlKQdYu
X-Proofpoint-GUID: kz5mvvSskehs8za4cnj_UnnBbR61dF9-
X-Proofpoint-ORIG-GUID: kz5mvvSskehs8za4cnj_UnnBbR61dF9-
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=685126d5 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=fFkDC0MTDGs3Ij0jIZsA:9 a=CjuIK1q_8ugA:10

On Tue, Jun 17, 2025 at 10:05:43AM +0800, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
>
> The prev pointer was uninitialized, which could lead to undefined behavior
> where its address is taken and passed to the visit() callback without being
> assigned a value.
>
> Initializing it to NULL makes the code safer and prevents potential bugs
> if a future callback function attempts to read from it.

Well, no it doesn't, it prevents only one (easily caught by kasan setc.)
class of bug - that is accessing uninitialised data.

But is prev always NULL? It definitely isn't. So we're now basically
introducing a new kind of bug, one that won't get picked up anywhere near
as easily.

And yes this whole thing sucks.

We can't be arbitrarily walking the maple tree to get the actual prev
either as it's inefficient.

>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---
>  mm/madvise.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 267d8e4adf31..c87325000303 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
>  				   struct vm_area_struct **prev, unsigned long start,
>  				   unsigned long end, void *arg))

Is this patch broken? This seems to be chopping bits off, or maybe it's
because the @@ line shows the start of the decl?

Makes it look like prev is being shadowed...

Actual decl:

static
int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
		      unsigned long end, struct madvise_behavior *madv_behavior,
		      void *arg,
		      int (*visit)(struct vm_area_struct *vma,
				   struct vm_area_struct **prev, unsigned long start,
				   unsigned long end, void *arg))

>  {
> +	struct vm_area_struct *prev = NULL;
>  	struct vm_area_struct *vma;
> -	struct vm_area_struct *prev;

As far as I know there's not a case where this matters.

But it does suck to be passing around a pointer to uninitialised state.

> -	unsigned long tmp;
>  	int unmapped_error = 0;
> +	unsigned long tmp;

Not sure why you're fiddling with this?

>  	int error;
>
>  	/*
> --
> 2.49.0
>
