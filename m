Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4678F39
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750396700; cv=fail; b=PnN1YGKk5wPPGtkLG8Pg0tJI/kAvSK5K3KogZSBZ0zEtjD6nHO0yZplKJuJFFoliY6ga2X90m23GjAG3bKXrqVcGouBDQvIe/bBAZOMHwvzT8QlxY4LZ06Tp61mgz2+dZOVQ8B1kzqsbhcuyJlbL114ncCllFoQesnj+gp9hl0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750396700; c=relaxed/simple;
	bh=9Dje9/2oCdUOMJM706kpOR3YGOL8W6J8irdNLXkHOWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IDM7/Qd3gUMieTOBKgbdzlJHOW7zQoA/QBK3qB+L+TGgcR/sFxhk7RSKC4v6+pROwuEFoQTt3WQKZ+ky6t3qFzKFlz6OiCPmaaX4Sd4UhXhgQPfhKdRnHztLiashJM0SSjZbUKwTQ8mXm78nE6QAJDMmM+whXPcq3k1AtspQSfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fu96WN7U; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ftbOVMO4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fu96WN7U";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ftbOVMO4"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K2thjf001193;
	Fri, 20 Jun 2025 05:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=uzA5mlWiA0vRIjT1Rj
	UPyZNIbvc4+SuLtY9Sd04gL/k=; b=fu96WN7UblHf78QVv7uL/1J3d3VBfcjdqo
	FMxyHB2uUkYh+97fyXckMKDZdC1X/2RxvQzI73MePoorxpYpHwom6+WB82E7pVf6
	Ix/OjMHTDE5yq6J7UpqyBwRjTcAxzpokRAjCEG2e55TJhgJ/fdp+69chnu/Bzurz
	LxrNkcq2C60o7FuEVabOQZrot1TNiUCSdKLhKl8h9bwt/HULeOtX+tCQwN+5Kat2
	ePOac8qsjXAZ9OfkzBdVfQxp6QT0pieULu8pQNhSglzdMRnzA/ktvEhxI0aqLrl6
	Ic+61VaupkiXjLq6pfOr+RXib+1mC+KO6NQXgSm9gMuqi+7rK6Ew==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790ydaws6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:17:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4mb7p038357;
	Fri, 20 Jun 2025 05:17:52 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012005.outbound.protection.outlook.com [52.101.43.5])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhchm7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:17:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRZrbeTqoLZFDxLtwZM0X/UuY6EY0tDMq8HxAT9NKIKVUUsQUNQkLFCkia/aZSj/G7HDvb05ERXIMn3md8r/aPY2gXh76HXTcDzc32NC9proxaCPCYReSABDCsAUYCe9KH6XxBZLawXSCh4s68y9/fGB18guTo6oVYlLEjRgBYT0hZFTc+rjL/kq5sb02IxhcIjXErYQynhJq9QibYW2JJb1arCz/u55aeWmM2kOozJ7rKfQjcVJ1FAnR8tSQ8gxmLnaCoMcyzT3LjqWIj+o3g4cGxKncaRa7DjdzD2wquhb4kUIeJtSQX1Ln4BvNejObQxfpU17hjgHtQWo3idOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzA5mlWiA0vRIjT1RjUPyZNIbvc4+SuLtY9Sd04gL/k=;
 b=t1ZhrF328z9pd35c8bbQeykuh4gQtb1w7py1+rbZXW/eG+NvtQC6PnCRjrWz3jA3usjZT4Zk99u2HvR1P15z2+MCNEyU1F6wPwScj3kOqiBFhIOjy/qVMlZON2imzvNfU7mGiN/jvdlVzLGw5WWJ6W49MX1NgQUJZXBPvExnOGi3PLkkbrPXjYWnWFyVTBh+a4/RURQciE3vjOxX08UqF2zflapYLhgP5lyT4t9iPJxprU07COORpTiTI6XCkBi81cKdkxI8go+Y8H/YKAN9ez1ndnGk5Llj2gQgK6ceKY/r+aOdOikqSU4mo1nkaNJJSRJX5vILms04c9u0LUUjPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzA5mlWiA0vRIjT1RjUPyZNIbvc4+SuLtY9Sd04gL/k=;
 b=ftbOVMO4iqdy/TZmqabEk05G5oIo9xyfEUeStmQLo9dxOUv4HfTLOzBaJR3HRfh3UsOxg1iX0KpPhuXovDNE/m90foG/TsZaTlqnXdu2BaiBB79wtmU8FeZgrcGEICaIdwHqgVyLOmzQnmjax/6SXAzXrjFDJq+8IGKLiYNBfOQ=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS0PR10MB6055.namprd10.prod.outlook.com (2603:10b6:8:cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 05:17:49 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 05:17:49 +0000
Date: Fri, 20 Jun 2025 06:17:45 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 3/5] mm/madvise: thread VMA range state through
 madvise_behavior
Message-ID: <2718d196-dd11-404e-906a-962629923be6@lucifer.local>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <a520417243ce7f8122de05a0420f964a922e392a.1750363557.git.lorenzo.stoakes@oracle.com>
 <3651A1A2-6EB0-4731-BDB2-E11FF7E63749@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3651A1A2-6EB0-4731-BDB2-E11FF7E63749@nvidia.com>
X-ClientProxiedBy: LO4P123CA0266.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS0PR10MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dece106-de4e-403f-ef5d-08ddafb9cc24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QFDIrKsKIxdbL34lUiA5DVAHl34wMeHpu7J2bFFXfDAyEdhk6Lpr3bVx0VHf?=
 =?us-ascii?Q?lwWb7d/P/NUyI9YnU4QXCY7p+ZzZpkxjCprwqjDK+SWrHfYMs/BbW91ryJ9z?=
 =?us-ascii?Q?xM4sV2q1t9eKLkc6F4hcDfueQBcuk59kBY6eQSCLY1jHxf+p41dda6o6yGJj?=
 =?us-ascii?Q?qzYaTCg6F9EfNqmDKrzmN5WUf1lFB9WhQU4wCv/nqF+I37/M4lVDpdVsFU9h?=
 =?us-ascii?Q?Gh6g6H3opwYAMH8OEsnOE6U7QFX9JmvoXidVsaOvZL9UMb4ZdzLR6AJ9ohzb?=
 =?us-ascii?Q?UC0/sz15SjZrqop0wGugS1OaiSNCd2XbP+zvruvkVTVeGedCbTfaZO1ksfOj?=
 =?us-ascii?Q?kwlQMY5en2nRhdL0sGb2C14RaBbF779hrfq4ru9UcnEGOGpDzRZfb693heeY?=
 =?us-ascii?Q?j73o1pR/sBdYeseinkK8KmXpajrrN9azNN6DU48c9I3kxqth87ROaUc7j/og?=
 =?us-ascii?Q?C0a1G0rN2KCuryxVhEtM67Xx4h26WMPEBqFGYk3c/+7CT92HAk7IBdntSkY3?=
 =?us-ascii?Q?lYQtIh9MgjYInaAycpj1yk239zztkoRmSqa3gE7/VraRwEUTE99E11rltLN1?=
 =?us-ascii?Q?3bd2at6Qz0UR2y0tJYlIVpmyangqH+YGc8yVo6as1bde55mY6NNlxcOMBF1t?=
 =?us-ascii?Q?K1AyqvuwWIVMwhiqFwKMdprNdVlq8QllyLkr5p2mIzkgHS/oiUJKALYbr005?=
 =?us-ascii?Q?HEh4jIi+42sLNSpc9Ri2vQOdhRqdiBvHULVafhq6N6d9Px/UQFRcMs8q01dU?=
 =?us-ascii?Q?XQw20ohcPSV2sjrh/WipttfJpjXiI0PF0x8lCWPLp0iVxPrQg+uaw2uKabh8?=
 =?us-ascii?Q?op7TdpFkxqtIqdSIqYXwhis/yIbx4pPfcDaW9pEGUOvvBgKRclITDizF2tfD?=
 =?us-ascii?Q?rfl1zuehujx1FmelJ66mvVXwzQMBd1rfoI/XNV9QQn1ZUpuygAEqULrKXyY/?=
 =?us-ascii?Q?bITm6gdHunwyAPdP6ea9Mh5yIv82clBiZZCCb7ISRQXAAu84SFNhEyJnq7wS?=
 =?us-ascii?Q?gbWD+Y8pLBGTLUrTxvYhJaep7dUCMU8Xrjz9iEnaW6OOSASJtt8xHeO1gRKM?=
 =?us-ascii?Q?QuJCySaDRGk9uwz7D9HJ6h/FgZieolNz+EYDxysbOJZgNKcqGgbUNdPeU8Is?=
 =?us-ascii?Q?4r1wf3h15zEiou+nnjtfZUe1vUopULgifGva2ZkCFpT5fWdbrswlQ6bwcg2k?=
 =?us-ascii?Q?mGvripj15eckdqCV4yoywCMcm/7xaRcTNj9jzYSQjjP5+OhYeZv/ctq7YZPH?=
 =?us-ascii?Q?ywH2/i2juavvkCHyROsSJPdAEVCD3C1+8tHJFaqiHNfCtJ4Xd0MubqfeXpDk?=
 =?us-ascii?Q?oSv5WN0/uPH8jiGV3qrLAvvGZdErX+T+uZiwvAEmtuQJGM/PDIt2fPlZYj3j?=
 =?us-ascii?Q?9fYTX51gyEdANZNveMbmP9YBuO5aoo1sFGwpCG7rYRJ1N1cClFancg1sF4h2?=
 =?us-ascii?Q?KeL5WVJ447k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jnLDw+FsdT2O4tEATndiJT0oZAE5v9Bf5MAtR3AyHLV0ngmH14Iv5LnU2h00?=
 =?us-ascii?Q?Ahy9OQRrZLotQv+ReEPyIBXj4r5rbHSuchbQtYbFvOGfol2SeQn4WBHbzGCf?=
 =?us-ascii?Q?UsdYPg1iVHA8nu1nHWI91B32Pmm7FGg/6OlmOnohmc+v/897rCuR+gwwKF3B?=
 =?us-ascii?Q?+g2kFcPkrK/S6tpVk7K1i7azK2zLZSu7HLM+0zkRw8NKmdqg85qfJxaZHfAD?=
 =?us-ascii?Q?mj2mYGs7b9iiAs3PLeRIJtEAFAVq2LywuG0gJsu8v/z3hy6zlcavCNOZ83R1?=
 =?us-ascii?Q?E32L79JklYGKcDh7So4d6RiXEO90ksT709xASjqHquXJwiROhbA4yELPbyxu?=
 =?us-ascii?Q?2vwbyMfx8E1AyFgNPkBhyXCBWKOtYgLO1qr7kKb9tyQWviGusRmG6zg6yDW5?=
 =?us-ascii?Q?4MiSgmc/BwjdlDUlqFJVnGvfpUw362xQC+R94a/794JNYlyhVscscK/P+zUQ?=
 =?us-ascii?Q?/qA+oBLm3x/yMyyTf9O8WW42C5vQzb+dVHJWVdBZkOo5QECN3NKI4orxJ9nA?=
 =?us-ascii?Q?NwyGPHngBTr4rmytLffMEAdAMD6fMBT2ncAy9HkPwcFpYhBuAbnTNnWr3Wxx?=
 =?us-ascii?Q?2mdyxz3iE/3mbIi1I+MUdcyQoIIApUERds0Xd1yq9ETmCRFZ8aknHpx/L0M5?=
 =?us-ascii?Q?z25vxYH/waKdBcXfDsbw9RPSs7y0UmprqHNYEMinyZ4FcT4BZuLNUU6FzdpG?=
 =?us-ascii?Q?aZkJarLHK3N/x5LxrT7594VzhRiJ1TiHT58uuZLLEfqruIJlpSVkMOtevPXF?=
 =?us-ascii?Q?yYTgoKM64gY1RtXvE/a6fjrdsQQ/FpndHwO5WUN8yO03Zvk3Dp05CXOX3REv?=
 =?us-ascii?Q?Uw+v4NY+zoLcOyZSRXJAXFe5PCoXlQnQ909W0JI29emwHUKsJU2kRptbEWw2?=
 =?us-ascii?Q?y0uuvoWLlQVLgzUVnM8h80pjp/zDFEsPd5vMKUib20bD3sbvFJhgkLj3r/3+?=
 =?us-ascii?Q?2yuzPuZvzzerdI2jr1wez/oWuUBtetdfZCDdJFdv2dsAOuDzSHXwMuE8bEf6?=
 =?us-ascii?Q?Irj3P1mPEc5yRJDjQx93V/TxcsfDQVJLbWu0ShPOxp9UQzvHx6B85Y4rz7BM?=
 =?us-ascii?Q?Uxr4z1t2886dtieQLKOk9hbCdoffDTI9eUcLtp+NSO/PP9z+8j93O258dOVg?=
 =?us-ascii?Q?6mgG9zLBdHNJRWa4kODDZRFBBgDkv4B4qgAHN3FQaNarswIIK0uPNr4zCqAx?=
 =?us-ascii?Q?FC4z1e+FT+A23O954MZ0KQiI/ByPFplQXNSg5NXaJuDw7cJM1iE2qZMY59bS?=
 =?us-ascii?Q?D8BqNslrN1Q9AaSoXdiUvNxB6vxxHXNeEUUENKGbC9xPLIrwnQSz55eznc4I?=
 =?us-ascii?Q?bU3CbeXLnDtqwlzsG8MusoI4A+CzgskgtoKQyfpiM9UW7WorZ1E13GtjD/gG?=
 =?us-ascii?Q?0GSpUSV5525hha+EWQiuHazWTntvn1CAA3riT3JqzhtDR1uUmQValXcB8ZGR?=
 =?us-ascii?Q?IsyAR8zsFf1QnVq/P5FJofwEEwLPcIAtvYvxACoYYJkSWzaXUSSFOyzPMKY5?=
 =?us-ascii?Q?5S4/9co1JYvZe/Oqo1P/es6o4OhTrzKmtfp9h0jh+/gle3pO1xsWY++ljpFm?=
 =?us-ascii?Q?VcEchaA6K4QaGpT6b6VmPyocn//Z6sVPi7YBJdEUUmIFL8G4lU2NLmxY23fy?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	22oJBlMYl+zddRojHXLbgi3wXzPsgWFj6/NQBUSmpbO4YQdjjx1xJ8/Cfrleytoka50P/WC4XkQwkhmt+pGRjZ0S+EXXci/iTR+wWG+LNbK0a1NTwUEpyXlkqKsdW0wDwM510f34Sy5Si9u4lca2FRkztlvHeC6xhHCd5IyaSdn+aLVmfu+pFBLUIqYF+liswasOnZpldUnCBx6oShMfS0c6HbhDoIbhkigR1WfelcgiH37LJNn0jwO+y7PAlEMoqu9KJf4R6lzZp/3aPqVzjbsPjPMoxGBRWjQh6C+hHmwGokvNkVSl0izZ06Fm8gT5ADcyl7jNVO0Ri4YBU2xi2uJMnHVWNYvFME1pokUTRz/cYp3xuM/XkAhHeBVfzWKZhtxjYATKspq195kASBTdfMARXusDsL5ZMedNu7y+UbHQoiFT59KzthA471gjf4Bsr6AbdZWle3yw9X2SzwP5Wut8HJprboraBGhx0PZ6908EBeGwZ/ZB0wRtCjjIoQREoVhAR75sSHK5DuhvYjGKWshCg9Y/BG1EtPmH+2P2a1YYDVNIb1AE5ML83xhueK4Tvg8AGP3bIPPHM3oykwqym3Ehl+6Umj7m1sN6zj0QXss=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dece106-de4e-403f-ef5d-08ddafb9cc24
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 05:17:49.1829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fi0m5BGUyCwpQM5vXJswp+bB180T9ikdmhLjyiUHLvF74CyWILKGTJBXay61Z1gFVNroRV/7v8+bFfZrBEl/giEW7stjqKWJ75LSiMHEAdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6055
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200037
X-Proofpoint-GUID: Wm3dGecV-OpcU6yVto40yvpfZL7pTYNt
X-Proofpoint-ORIG-GUID: Wm3dGecV-OpcU6yVto40yvpfZL7pTYNt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAzOCBTYWx0ZWRfXw1MWdtSVfJO1 wgkobjdt5hdHyIftBaIDiMK0nk6FbCku7w9yMpsJIDQCgnAqY507Ze7S9sQUN7Up17IkqvgaQUh 4WdjfjQM1I25xfPx5VRKbwE3Z05VuMq2Cr2VkeRGhRpZSw+eJt+abhv0wAhekzeUD4Vbve/NaEA
 OKc83Sq9WM12b+9fIcU2Xp+8d0zb3z1YMrBZNwEqejcasc9o+btGr6hCkdRA1RShVSWLKEXUDiw A88QsPwVPU6smv4zNGYTkccsdogwev70GDwQaaR9T7yh/tu1V0p4jg30aiM09hsLGZXxqc5sB4w W/16ak/6hp00uXEuGTIdVDRzxr8o/cGqr1vd1rgcwlfAd+DRNpiXDSFbq4+mkvZ8NxkSoNT4VM2
 c8JbueQSKBCV+enLXWXlywMT8mCpmLCEqQzyfDrccD0kW9ilYCa2IwgIzmvgN0iBj9vKQcs5
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=6854ef01 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=diY6tPMMjQEgW9jduPcA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206

On Thu, Jun 19, 2025 at 09:54:11PM -0400, Zi Yan wrote:
> On 19 Jun 2025, at 16:26, Lorenzo Stoakes wrote:
>
> > Rather than updating start and a confusing local parameter 'tmp' in
> > madvise_walk_vmas(), instead store the current range being operated upon in
> > the struct madvise_behavior helper object in a range pair and use this
> > consistently in all operations.
> >
> > This makes it clearer what is going on and opens the door to further
> > cleanup now we store state regarding what is currently being operated upon
> > here.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  mm/madvise.c | 101 ++++++++++++++++++++++++++++-----------------------
> >  1 file changed, 55 insertions(+), 46 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 47485653c2a1..6faa38b92111 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -58,17 +58,26 @@ enum madvise_lock_mode {
> >  	MADVISE_VMA_READ_LOCK,
> >  };
> >
> > +struct madvise_behavior_range {
> > +	unsigned long start, end;
> > +};
> > +
>
> Declare members separately?

Can do, but this is one of those subject things where everyone has different
views, if I did it the other way no doubt somebody else would comment about
declaring together :P

I think as a range here it's not a big deal unless you feel strongly about it?

>
> <snip>
>
> > @@ -1425,10 +1437,11 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
> >  /*
> >   * Error injection support for memory error handling.
> >   */
> > -static int madvise_inject_error(unsigned long start, unsigned long end,
> > -		struct madvise_behavior *madv_behavior)
> > +static int madvise_inject_error(struct madvise_behavior *madv_behavior)
> >  {
> >  	unsigned long size;
> > +	unsigned long start = madv_behavior->range.start;
> > +	unsigned long end = madv_behavior->range.end;
> >
> >  	if (!capable(CAP_SYS_ADMIN))
> >  		return -EPERM;
> > @@ -1482,8 +1495,7 @@ static bool is_memory_failure(struct madvise_behavior *madv_behavior)
> >
> >  #else
> >
> > -static int madvise_inject_error(unsigned long start, unsigned long end,
> > -		struct madvise_behavior *madv_behavior)
> > +static int madvise_inject_error(struct madvise_behavior *madv_behavior)
> >  {
> >  	return 0;
> >  }
>
> OK, now I get why you pass struct madvise_behavior to madvise_inject_error()
> in Patch 2. The changes make sense to me now. Maybe delay that conversation
> in this one.

I think it's valuable there because otherwise all the function invocations were
inconsistent, but after 2/5 become completely consistent. I mention this in the
commit message and I think it's valuable so you're not doing:

if (foo)
	bar(x, y, z)

if (blah)
	baz(y, x, z)

etc.

When you quickly read through it's easy to get confused/lost as to what's going
on, whereas if they all have the same signatures it's very clear you're
offloading the heavy lifting to each function.

>
>
>
> > @@ -1565,20 +1577,20 @@ static bool process_madvise_remote_valid(int behavior)
> >   * If a VMA read lock could not be acquired, we return NULL and expect caller to
> >   * fallback to mmap lock behaviour.
> >   */
> > -static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
> > -		struct madvise_behavior *madv_behavior,
> > -		unsigned long start, unsigned long end)
> > +static
> > +struct vm_area_struct *try_vma_read_lock(struct madvise_behavior *madv_behavior)
> >  {
> > +	struct mm_struct *mm = madv_behavior->mm;
>
> Is the struct mm_struct removal missed in Patch 2?

Yeah, I will go back and put it in on respin.

>
>
> <snip>
>
> > @@ -1846,22 +1854,23 @@ static int madvise_do_behavior(unsigned long start, size_t len_in,
> >  		struct madvise_behavior *madv_behavior)
> >  {
> >  	struct blk_plug plug;
> > -	unsigned long end;
> >  	int error;
> > +	struct madvise_behavior_range *range = &madv_behavior->range;
> >
> >  	if (is_memory_failure(madv_behavior)) {
> > -		end = start + len_in;
> > -		return madvise_inject_error(start, end, madv_behavior);
> > +		range->start = start;
> > +		range->end = start + len_in;
> > +		return madvise_inject_error(madv_behavior);
> >  	}
> >
> > -	start = get_untagged_addr(madv_behavior->mm, start);
> > -	end = start + PAGE_ALIGN(len_in);
> > +	range->start = get_untagged_addr(madv_behavior->mm, start);
> > +	range->end = range->start + PAGE_ALIGN(len_in);
> >
> >  	blk_start_plug(&plug);
> >  	if (is_madvise_populate(madv_behavior))
> > -		error = madvise_populate(start, end, madv_behavior);
> > +		error = madvise_populate(madv_behavior);
> >  	else
> > -		error = madvise_walk_vmas(start, end, madv_behavior);
> > +		error = madvise_walk_vmas(madv_behavior);
> >  	blk_finish_plug(&plug);
> >  	return error;
> >  }
>
> We almost can pass just struct madvise_behavior to madvise_do_behavior().
> I wonder why memory_failure behaves differently.

There's complexity around the start, end stuff (Barry bumped into some of this)
and I don't want to mess with that in this series. This series is meant to have
no functional changes.

>
> --
> Best Regards,
> Yan, Zi
