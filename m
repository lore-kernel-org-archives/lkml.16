Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF21910F2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699054; cv=fail; b=hGOARx+im9tBW+WvWazL9z73FjCYxpPRX9DNgEQhEqOVS0CG1NQuy9PcHSbvcNJmhWitmG/S8QBlqiNMJp7Wg4m6gIZnOjweIC44CNpsGIF/UWj5TIgTwurnkhZSaQABzux7Jcw4xOyuhYzyQk3KDSuPmUdPgZHbcKXzIAxIZVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699054; c=relaxed/simple;
	bh=r+kM4RssjPXL44z0jNqWTf6TIuDC9pCqUb47Les8p84=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=VemJUHSPn7broAsxCv+1Qw9xi8p/Bsfo5ZqCc9FpTZSbG3IxYMgmgrN6Hn9ZBfxdZDSX/kXWl9qaRNoJ/wOQjYoCszfFmyFaHUwEz2SIQDjKmGWX4OVqhGw6OUqqFrMYnyqzMYN/LsmnOw+ZSbUTIhKK6QbC0egkMGDh0d+ioZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B0x7Z2S1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jAWMGrHU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B0x7Z2S1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jAWMGrHU"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ELBr0t025040;
	Tue, 15 Apr 2025 06:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=qGT6nrLK6k5Q5/DT3K
	MkAZgNMg55tUY2zxR5JMOUMk8=; b=B0x7Z2S1n4K3oM7Jp2udhwOkx1OgCML3RJ
	28kMCOHgNyglHUBjT4XXkXTWASNErZs05mFq9dcmxLTGQh/sjBEcprf2eZhoZ6Dz
	bHFT20BI65W0bd1E7xWdkD8jG9a/RBz2qXiA9I7cek2w09yru5HqNvaA5qSZg3Pm
	ksfyQ+tnhNNaD9V1NXRdgifbMjfz5VacFfm3knZZ2bc7/k85zvl+y0Cd7g+Gca6T
	spSdcYUua8G4anY6ROZRAd0wBoi2ZzKiXjjzf2pGvn1G30qh5aheRJA9IVFn1kkH
	yJ9WHY1tQEbObFcPBMLZC8y6KxWOMR5I44OyX1xcF7Pj4LPA1yBQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619440tr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 06:36:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53F5nMGR024692;
	Tue, 15 Apr 2025 06:36:52 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012051.outbound.protection.outlook.com [40.93.20.51])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d4ysns2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 06:36:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNfClkxlH1dbjJo7aN02idJRuibhz3H5Nr8aQhA5GHmzMDnuTd4H3NTf+kgBO2XeqKBf4GQ3xLokongumEYM7S2YbCb4bgkdsJW976QxfbAC9IBehlXa2qF/WLZfXT0cqGevdcn03L3Kc57vZOwQJO9DLPqdkn4RDUPa6/ZjItSpQbMcg/QyDq5m8vpJymNQLKpzWOZ8Ctsrenam/saA9EfG+Xe6WlQHIM9LJVDLqS0d5M+O4XnJNpEzvw2kWJcZfZvRkCoaQ8vdHElf/yw5CFzrxgstnqDatyGo2WNm71or9fhssKvcFWPypMEpXj/if1MIjr+0eT4N49p1XSpc3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGT6nrLK6k5Q5/DT3KMkAZgNMg55tUY2zxR5JMOUMk8=;
 b=fkJ54rqS7XH1DHDgCSZCZ7Nh6wczG/xK1NcL+iqOBXr2/gc69ds1ryuiIEmFgeq+rH8rwNbj4yMRwH4w887S3gUNVIu0aPax+YPO+oboIkiT3xJh9VYGkVUivQlQTXl+HMIAO2pTanBz847a4aGHmUF0PMNHAfqsWKkxMy1rnz/7tWb8+G1BKeDKE4yTedz7p3XsjOeAKYwVa0/051+KGtYmuH1pDjoza0a1DcxnS1H6vFlXrHjivdpqqID3IjKrDApkUu3R3o/fiAlp8qTgCFOKvj9Ud06ry0DdOVR/zVSYKEHNtLBo8uQmRdZ2nCAPzkxY8+xI0CUCc6ZJRej6rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGT6nrLK6k5Q5/DT3KMkAZgNMg55tUY2zxR5JMOUMk8=;
 b=jAWMGrHUF8J5v2Ul1DwmLlEi3vNgJWGBlwaehJWzK5JZlJKebzkbcAD4/vw6uvGiD6H6RYoZ12KufeccuZhSGBgSX26DHXHMSp+OU40Es/62NPJzACgpD8MG57oreTU/anAK93j6RWtg0kLDgDXzWp5rqk/BOJ4rRHDe3pz/BiA=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by PH3PPF87283933B.namprd10.prod.outlook.com (2603:10b6:518:1::7b4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 06:36:50 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 06:36:50 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-5-ankur.a.arora@oracle.com>
 <Z_yzshvBmYiPrxU0@gmail.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
        paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
        willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
        raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
In-reply-to: <Z_yzshvBmYiPrxU0@gmail.com>
Date: Mon, 14 Apr 2025 23:36:48 -0700
Message-ID: <87jz7mx75r.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:303:16d::31) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|PH3PPF87283933B:EE_
X-MS-Office365-Filtering-Correlation-Id: 44be3669-50ed-4e1a-8f1c-08dd7be7e6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L+YIRQaN4BRCmSgRQ48qE/aztYN88BU/pYu3oaE/TrdNhcZe+1hjMIsNLXkB?=
 =?us-ascii?Q?e38g+T3C9gKC9GygUih+KFRyyOCIozmL+X4JAFgCzBUulo/F5oGBPkz7Jlpn?=
 =?us-ascii?Q?YNOYTTQs7PMXAMjKp0Qz5QGb6t2iNPDA9JRVDcmOxBzfScsKDr4sv7eRjuH6?=
 =?us-ascii?Q?YwG7R2PqLrnu7QmsQOU0u0gRe741UjlwRcTupzmc3Lh90ZSmxx7757lYM4j0?=
 =?us-ascii?Q?JGp2vnjaEYOYz0Ual4fCGdrlDa0xKEudUNRNT2InKSfPXuaI6goeriR6y+hu?=
 =?us-ascii?Q?/4D1r7jZacvOsgdBFDFE+YkBOkuM7BsgYAvQEhDM3zeuHm9lDU0IwL+uTm2S?=
 =?us-ascii?Q?Gsx0IXcA4AfLz9G7o1pVRuPRQHLBXQptK8hWJJWJxo5UQWKcGtQVHtNJDRrB?=
 =?us-ascii?Q?T6+uG3961IHgC3rJE9R1uysM1a+hPgkdmsiZ40OBjnue19o+eXym2uVK9r5y?=
 =?us-ascii?Q?3l0rkPl3AkGRp7xDyaGVAu01Q90Uk14ul1xdcDG8HJ8CKeDBbDFQO70BFhfy?=
 =?us-ascii?Q?CyMcawLXuJyOknlOAuSYTgpWodCSJf/FcUwgKMcjovjMRh0UtZMnlmruGd3+?=
 =?us-ascii?Q?khG+n9z17VkNE9TH9GDxr2fKFnrmJ10k2NDZWwF5I/bH+jb0P01/rRUoimE9?=
 =?us-ascii?Q?obgWMX01vtfPJrKbSF9cxJWifODkwepVE0pD10xsPrecOiGDT0VNED7F379M?=
 =?us-ascii?Q?Fhs4EH4Vqxky1xDya/dxDVsO8TdmrnYBdG+paxCaKLgko1cGTVSA1RS0jd+d?=
 =?us-ascii?Q?6jfVjGGBOP7VMe3H4n10iU04S2RBLpKQXcJwM1LddZmLUmJyTsyAfCObxs9p?=
 =?us-ascii?Q?M69zlAwIN+8uXS8uesUr3DBP17QM93y5Y3Eyh8KXCdKrGl02wFmJUTS4r1o3?=
 =?us-ascii?Q?4c5WHWEdAMjjqiR6Byw/Nj0bD7SK0itOtxbq6GQutJ8V1zfyWGBd5wEtnBUy?=
 =?us-ascii?Q?GywJFfo0tHn9AZPUEZaVvQz6M8XIuM2Ehn5gPbjet1ffzRoV8DzRvVTeJvq5?=
 =?us-ascii?Q?TcIKPlBpJ+0P8EUSgb80oU4394Yl7Y3XbgrxAYcaqHt0cUJD6o6TISEsJHcA?=
 =?us-ascii?Q?WJcPy757FFnwJz3OlKtzAyif0XWC283M0JDemt08At5us/2eWYlDKWxhLkwL?=
 =?us-ascii?Q?vEYF+VonYcuLtoGYw3z4Eqmf+rwGSvhROchMeYwhZ+BK1QqOa340R+B2ZxhT?=
 =?us-ascii?Q?oxmT8UMJKoo4krsb0O3z99n+m5EhUDC0V609ftj4S2d99mpmfXnAPuuPghZy?=
 =?us-ascii?Q?gIi7lYe0PlX2FXEiLGmDQjFNX9HU/3PMZ9+6zDk3UrP05DHBtK29iIEUWirQ?=
 =?us-ascii?Q?AimCvxSNkdylvRTsYsYL9O6vwwD6u01usX3bE/HlyaSqUjDtkCLVwd1VtdIv?=
 =?us-ascii?Q?M3Fb+uhfUdP4W0JKgzYorI+3h4Zh9+LZQeABAnjmAsUMmj5R+JmEgq8ppQf0?=
 =?us-ascii?Q?Y0uom7ommAg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IPVjcAXu6iPKJdvHlZoaqgIfXcb950OyRo/Kwcft5KJngrDvWUvmNb62z4Um?=
 =?us-ascii?Q?vcLf7zFFB1CaSUsjkYvt+wYqDvzJMunTrzGeWc4CzSxGMl8sGUaoZVbA3rrA?=
 =?us-ascii?Q?LrZyasHIy/qL69j3PfCEdK7RgmRQIZ2uDvXFKKLyRumo5Vdin6I5cWuBKME0?=
 =?us-ascii?Q?7vtvuyxhU6cXiK30bMiRiciLV/Dkjd8IE7RhdYK7ZUo26NjaO3WhUIBbIRJk?=
 =?us-ascii?Q?3swqx8sWNJOF9GkL+q4zcSGtYm+00fRkHgKM5SNqqgGBRwR1n/NH32kPfZwg?=
 =?us-ascii?Q?pCwzvF15TLjm45kNn7uAjTpX28YcI4xABkmhyKUUzLLQWBmlOlX+MJtOqvzO?=
 =?us-ascii?Q?P99Y4BN9QRF8hYjWXjQDDvSMrBtGkZakjZmE0sM8p8+/m3kv8w3oVTVxjyy0?=
 =?us-ascii?Q?P+4xJM3dMWrfFGk1gtGfofL0Ypt8uw4O14DaAZlrebcpgbYM8WKVV819lTie?=
 =?us-ascii?Q?ClxN2jJZRz1g+Z9c70ICH6/jtY95U2kDdpZdGPVF41M/cbGJpA0sSRnj65Do?=
 =?us-ascii?Q?5y/pmzGJ0SSDAkta6Tq2JNorqYWrKHh03jutwinQyTpkIf0XZRxn+xT0psKp?=
 =?us-ascii?Q?nvyFDMjIaiqAFeagAwOEwEvwyS+aQQCQ9LyWMoqTEaXvQ+kdSnhFoY+6drEu?=
 =?us-ascii?Q?loSwO6GqbUQhumwqJ31LTiqrG2tKGcIc5rDc6GRYEOxvKxvqhFTcu8NfebV3?=
 =?us-ascii?Q?CdOIj5fC32CThxI1dTWjOdHgw9cyTbUeWIYw5S0Iq32ErjvkAbbr1cNcKzRh?=
 =?us-ascii?Q?60Qvg4jyvDNln4LBNlK13Sz+Ixocdh7wxXioD3icgcmnRyotbfnYcvhpwLYi?=
 =?us-ascii?Q?LbMJgcG9szDGaq+bhwCcnK/s4vkxxPPefZjmM2vEqzNPYkoR4CT8S2odTJqe?=
 =?us-ascii?Q?5nBSKKlT5TZJog/tr129XYxUEALo4p0Wc8CTGF2xUQZr/6GtYdsjZ4Znhldv?=
 =?us-ascii?Q?f+oox7fa9mC5DbiBcNlnJEciR8n18KKeEhbEsefbM2ZJRJM++pnvhMhMufrY?=
 =?us-ascii?Q?ZHM4c4X086wxOB81aYcLYdxOeoRsFGB5LlXQDOkxjPsptlD9rDNkvWt7faBO?=
 =?us-ascii?Q?WSzzCYRiLDRS5qlP+plO0aiU4s2EKklpvhgKdPmx3ASn07X+nHwUCIym9FR8?=
 =?us-ascii?Q?epTYCPXxmhCAjOxDtaZXJ90oY7HXQG6mIix+ejexLUkwfo+L3AE2/1/G2x3z?=
 =?us-ascii?Q?WMyUS3TpqgndCJlXHvHunlAnbHYo3VQMr+ivHC8Z72QOQSwvhgnvLOJBcRdA?=
 =?us-ascii?Q?jfL0sjdW3CbH7Xrw+BRr5hY8Op2nXBKNjiCwHk2y+mmX16MPHFuAjMkv0Upk?=
 =?us-ascii?Q?wyd2KMH82ZLm7Vhq8UoIiMs7DtwZ1LCa2vBr2VV+qhfqGg0dOHlDakrOEuY5?=
 =?us-ascii?Q?G6BRbbz0NLdam0AeErWlRmStbX8Hw0FfOsuvcZfv6OVfE0Rfnr0XP2/hNWLN?=
 =?us-ascii?Q?3XD59BBRz9zHCRpnqjvT6PfVwyD2Hf0lUYaoBnIY6iT0gszzVgeUTNKmhZwA?=
 =?us-ascii?Q?tE4IQql16J8aLw352b6MmHGOyurGds7Ic7HtJY73qAqtU1ay9e13eQL2qa1D?=
 =?us-ascii?Q?Dtx+m63micdeQXKKX4U+df8rce5XO7IwxKyfSbU5B9BSLYAnsiNihkq04Fow?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	clggc0jwsyLkJHThrWtRsxAXrgoiSeDVq8bfsa7i08g0AJwP22HJedsY99UnYJcPko3Gt8GMzCXRqJFr4eqaqbdf2fHULAQq6nkaxTvDQt2EyDmVjEQ16+u9MvpFGJTH4QkbLhFyD2AkNZhL2oOGWJkYNiC4Y6x/dfyOy1tF2dfMMSlK2RD58R5Cl3DC94mg39Gn4rFFDSXy550H0LT3Sr9jaEzwFKsIkUWySpl6HUb9hXjgWvg5xLEnqx3uLg6JCAT2zl2kf8pUtu5MDnTp9l+DjPGFFB5Q1K0PKfs1QCCwrRQLOU6a3De4a9QWWtsbvbF/NdHcRIz3LNWz41LdHQ+x89Dsh5ZcIQexLBdzIhqRTxQHIU78SxLXb+iOTnIx9n/KX5HIjgB1SCaas37ZiuRrbxrtwvewd4LaMyVeiH2RdKtGUr+CYVmEWR9IqolDoTlETBLf3xn7DjQs0g4+/Z3FnOKTlmWUFOHKuSpZaj/YVcSETCQmk6QPYY9eX6Cg7IvtstSiwcTVoMXsFQmfhOo2y/1f7f38NLsLHvQHRswSpaffZTzgYXpXOcznGh1J4pxIeHT+B0GP9RO//HPd97bltvUbS3kd7lDDGLbFEtE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44be3669-50ed-4e1a-8f1c-08dd7be7e6e1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 06:36:50.0073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7hP4qgIytirzEKXZ89RGarTLGCO+Kv7wrY6p6621tb0exntr7eLq0siU5kfALJGo2AiLwBlvZ5QyRgMie+mncd/TTU9RrZNCr58vKSOPto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF87283933B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150043
X-Proofpoint-GUID: JBFoRIrSXYvJwsTX7s3XAvC07QqgrDp5
X-Proofpoint-ORIG-GUID: JBFoRIrSXYvJwsTX7s3XAvC07QqgrDp5


Ingo Molnar <mingo@kernel.org> writes:

> * Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
>> clear_pages_rep(), clear_pages_erms() use string instructions to zero
>> memory. When operating on more than a single page, we can use these
>> more effectively by explicitly advertising the region-size to the
>> processor, which can use that as a hint to optimize the clearing
>> (ex. by eliding cacheline allocation.)
>>
>> As a secondary benefit, string instructions are typically microcoded,
>> and working with larger regions helps amortize the cost of the decode.
>
> Not just the decoding, but also iterations around page-sized chunks are
> not cheap these days: there's various compiler generated mitigations
> and other overhead that applies on a typical kernel, and using larger
> sizes amortizes that per-page-iteration setup cost.

Thanks. Yeah, I was completely forgetting that even the cost of returns
has gone up in the mitigation era :D.

Is retbleed the one you were alluding to or there might be others that
would apply here as well?

>> When zeroing the 2MB page, maximize spatial locality by clearing in
>> three sections: the faulting page and its immediate neighbourhood, the
>> left and the right regions, with the local neighbourhood cleared last.
>
> s/zeroing the 2MB page
>  /zeroing a 2MB page
>
>
>> It's not entirely clear why the performance for pg-sz=2MB improves.
>> We decode fewer instructions and the hardware prefetcher can do a
>> better job, but the perf stats for both of those aren't convincing
>> enough to the extent of ~30%.
>
> s/why the performance
>  /why performance
>
>> For both page-sizes, Icelakex, behaves similarly to Milan pg-sz=2MB: we
>> see a drop in cycles but there's no drop in cacheline allocation.
>
> s/Icelakex, behaves similarly
>  /Icelakex behaves similarly

Ack to all of the above.

>> Performance for preempt=none|voluntary remains unchanged.
>
> CONFIG_PREEMPT_VOLUNTARY=y is the default on a number of major
> distributions, such as Ubuntu, and a lot of enterprise distro kernels -
> and this patch does nothing for them, for no good reason.
> So could you please provide a sensible size granularity cutoff of 16MB
> or so on non-preemptible kernels, instead of this weird build-time
> all-or-nothing binary cutoff based on preemption modes?

So, the reason for associating this with preemption modes was in part not
the difficulty of deciding a sensible granularity cutoff.

I had done a variety of chunking for an earlier version which was a bit
of a mess:
https://lore.kernel.org/lkml/20220606203725.1313715-11-ankur.a.arora@oracle.com/.

Fixed size chunking should be straight-forward enough. However, 16MB is
around 1.6ms if you zero at 10GBps. And, longer if you are on older
hardware.

> On preempt=full/lazy the granularity limit would be infinite.
>
> I.e the only code dependent on the preemption mode should be the size
> cutoff/limit.
> On full/lazy preemption the code would, ideally, compile to something
> close to your current code.

Yeah, agree.

>> +obj-$(CONFIG_PREEMPTION)	+= memory.o
>
>> +#ifndef CONFIG_HIGHMEM
>> +/*
>> + * folio_zero_user_preemptible(): multi-page clearing variant of folio_zero_user().
>
> We don't care much about HIGHMEM these days I suppose, but this
> dependency still feels wrong. Is this a stealth dependency on x86-64,
> trying to avoid a new arch Kconfig for this new API, right? ;-)

Alas nothing so crafty :). HIGHMEM means that we need to map pages in a
hugepage folio via kmap_local_page() -- so cannot treat a hugepage folio
as continguous memory and thus cannot use REP; STOS on it.

I guess the CONFIG_HIGHMEM condition clearly warrants a comment.

--
ankur
