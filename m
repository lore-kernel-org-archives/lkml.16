Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08178204873
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516252; cv=fail; b=SizTRTO/zXXVVvXA2UpvEW3HF38Ayde43/vHUYBAmyhkxC7Yjdq6EWTovJb06Ke7uHxRbbrQAwfE/C21q3UCl43hhy7f2DvkCtDfjw32M/dwEOJyR23/EG+wZMXklzg0wBzs0CGvjgoko1IkvagMFdIKj3xT0YWgcnUXqTmbSAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516252; c=relaxed/simple;
	bh=v2VN1JAMzeh7JgrYbXFOdi6yll9Lcm3ukXhth6xP8Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I6kYkXQNN2PkjrjYHR+6zLwndNRj427WYnaHWnGwIEtqwk4cfwbQxADpW3l4W+SAgCAeEFch8JvyLZM0MVCFar2WL4VX6qw+0FX764/tgjTY8ksJd7fiMSpGfLyQLNNGB0cY9EnqJ5CNTXo0HAY78ejS9vvVRVuolcTlqtc8hDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AuEMJrjF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kfxQyazP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AuEMJrjF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kfxQyazP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531D9LSk011808;
	Tue, 1 Apr 2025 14:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=HOT9SQGpGvYjcGruWE
	NAS+hxGmnG149SazdS9kkLlb4=; b=AuEMJrjFMg1QiL3rTO9e2KaWPCVDbN19k7
	nQD3oi2WCDeHfwo8CWB3U+qm21V5iD2RnGFBWPbb/R+ms26cCnqalR7jTGPxphLx
	iY2zjPckrUXrZs4MhgpsskJqg23VQVSf/mz3W6KKCzsBgVgiacSjPr5QF1teLSee
	GaI1uVfPp4db9W1zn5FWVaVA7IbUTt7JBtx1/NX9v70QdRL/cdRDIYgbYIUvWS3x
	wlxdCIAC5R4+RyyUQHccNYuxhGltmkv+o4KvIq7B2ZZZqSJM20vvErMgZXOfh9k6
	rT/oFr8nOySX6pM7MfPt52Nu8Oiu+/2LvFXbj9+x5TGtQeonONqA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p79c8c3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 14:03:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 531E09jA002565;
	Tue, 1 Apr 2025 14:03:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45pr8qcg1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 14:03:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bb1ApMb+8tnvOLWufa7CgwUgi6EVRvV41edJ1TwS0yNxORwgWQ1UILAaaF2uwYqBYNCH/QgnjkgGkSQFJZks6lVcMwVDBgG17MWkl4n3xOhb2OYOtvKnsScxcxoil6nICGGAPEYq+jB0VmBqzeHSN1lBRn/SaP37qM4XV5OuFOJoY2SlWrj6dgs7Jwn2xPx13aPMrYqKZ+wJpIOKXhSHnr4qEFUruCbjOyu4vDKtudVaRb6ytzXhCGVKC0UoPaTqjKlnPM/n0sHn2C+7BuHaCoxB1W4HlSLTdYHLR3qoCg5Q5y9/Z8Nu2yTb2Olu4kk87u0aHtBRMN70rqQoIfCbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOT9SQGpGvYjcGruWENAS+hxGmnG149SazdS9kkLlb4=;
 b=Lk6B8/zmp3vi7VT/QaplKVLyur1C0U/aAWXy4Eqd4F7LWtAX9onfybqTZB8JiD+iFpo5m1QSqynp3LCvu20srAAhwLtoU7BBcYC1CR1QrzA/mh5xxjfB5On/mxVXUwbENxvZLDIWpTIjYen2+5/dE7TBRcCxGfvL1gF9eK9rX6pN9LGt6YrvLg20J0t6OwZgX3yJ++ZmE/K6vwA8t7bubp3ndrbQF1bJgqwl0BUSmNRwf3GQ5F4FZmEnuh4slgqSXsn10N3nKDbkHtRaa1ZfiZvsw6YdXfchm6eOon+cCLvXznovBsoxnZ5B327bcnXus2rLwP7CmxsX8t8ik2MTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOT9SQGpGvYjcGruWENAS+hxGmnG149SazdS9kkLlb4=;
 b=kfxQyazPhoWbL0Mg3jEdEMK/DLRtXZdS8V9GnI35h8befUrJXmv9UDV4AKITm8UY0odjm2aATRTyy6B/7xErT0qgHdnHUFAg/qOEbHwGATfG9gQNBxP2DUZIessP+378P2bgNO9/eR68tR3WU0nkDQLBwOPx429nMYwZBj68xiI=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MW5PR10MB5874.namprd10.prod.outlook.com (2603:10b6:303:19c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.31; Tue, 1 Apr
 2025 14:03:20 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8583.030; Tue, 1 Apr 2025
 14:03:20 +0000
Date: Tue, 1 Apr 2025 10:03:17 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <howlett@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, kernel-team@meta.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 6/9] mm/memory: split non-tlb flushing part from
 zap_page_range_single()
Message-ID: <bybnnqb4fyr4odgwa5qcgcysgjqjsilptreljgamt7ocb5ue7k@s3lvdf52csbk>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <howlett@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
References: <maypa4pf2fp7zcee5dazgeoowaxl4n4vnqhnfhck3yscchp5vj@dz2mmunbvm5j>
 <20250401024811.4285-1-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401024811.4285-1-sj@kernel.org>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0446.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::7) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MW5PR10MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f583312-c8b8-45db-3284-08dd7125f56b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PM9DVoX0aVxvfpIQFYfcPsyOUh+Q3Irdlb6+FVNno84ojNWp32Y7WiHN4+QG?=
 =?us-ascii?Q?e+tv6VGITbPztncoHtWVG+1X7o/IQdj9ZCi32+7o1HdsRzafhpfKWTyGg5ML?=
 =?us-ascii?Q?pjb8Jaq7QnJIRv99a8vba5E1+R3Xn+PqUQjXCBWtnCeqskwplJ3OBiE3vfKI?=
 =?us-ascii?Q?08WTYtfLFAKsjbHLDf+gbQIaoJOXGh9mjQOuQfg3BLCx4P148ZAqIckEuO8c?=
 =?us-ascii?Q?xBjY/xeo5pyP/4YCyBxe3Y8hwewAALkZbh6r37Njc0KSAuFHxWpnoRswk38c?=
 =?us-ascii?Q?v50LDsIJ49bga1lUdfFereRiVhWDmGVw0I2mKi2Bh8vWanW6Yl9EWg7IfPnZ?=
 =?us-ascii?Q?bHpJpuY9B+6/ZDSsRjJOGAw4sxTQaNNhRNd0D9Q6jUKVuNyG013ceulaoJPo?=
 =?us-ascii?Q?S94ahS72mMCAimmC18D88Znjsn3BK2aFUdoAnIJph/blQxlm/TTxrezhbj7+?=
 =?us-ascii?Q?uL24zEZpqYLLQwoinmD4haanXCafKBfxNdoXimxg9j8yPCE3hL0D5lxiCvqY?=
 =?us-ascii?Q?GQJucbddGhuwIT9ymvsiQtuSpWiyjLCUEHqPvLaQleShskByQRqN8wniLu3E?=
 =?us-ascii?Q?1J3CBp1i+g8xgQDK5vqWOZPuMP2ykzTZqstA0ffabqaUxweDNyox57Yudhv9?=
 =?us-ascii?Q?FuXk1yLKKfA113ty18nAMFK1Z7ZhE8TDNyUMOCK1ssFw5frSj58l1J5L2ATM?=
 =?us-ascii?Q?38NzMIVjFN0pKuP3Gz7amlPAg5XlKbAKJnc0OHb1aTLrb8s4/RHC2YyHo5Be?=
 =?us-ascii?Q?NwRRlCiCdgakHOe20/SO7MA5CbWFk82VSQVMxACGnaPmRWud+K0Ptspulyl3?=
 =?us-ascii?Q?RtovhGLZEeCq3AMgMz2N9uPaLkcxj0BPorn/ZNCicr8id/+EhjlXFk5HI5Ci?=
 =?us-ascii?Q?teoh91euTa8u+lPgSVpEz9x9IyqeWLNFuMFFO3yGsoE25VX2ZABV0oau+IdY?=
 =?us-ascii?Q?L8OCZhhq4PMpFkSqDAneF80R3Ut8jD6iCG4i78iWmNCh0Xxu8BYRGl5eEVWp?=
 =?us-ascii?Q?A4e8DQ2PT3tM1y7xNESkfaeVnVMkFV3HbYjbDAVlpXv8tqpoldXZYiZn/B8+?=
 =?us-ascii?Q?He77MHvnaC8+2q8UIA1bwq2ybenj0SbILePZwySSODYXNXcKQ2YCHXwDooho?=
 =?us-ascii?Q?loWBg9MIja8kDeMTWtv/6l3kV4wtZUGHGwUgNH5rPcnQXigSv+8yYTl3YJEw?=
 =?us-ascii?Q?s8zbqpksQa6uyrlSGNwARfP4VR9WMrS+nKXdJpvGuT8EdUqJJMwIUBvYS8k0?=
 =?us-ascii?Q?aM2A46P/xbDYFKnh6hEw67+H8YjLT/RfMDRBW+7dPih7Mce7IhO8E02jHJu3?=
 =?us-ascii?Q?pv5ppJgaP+JSpcJ7SnyjNCkF8IxjrH3DktxwxgMFaFCIo3wnWjViS7f1PngI?=
 =?us-ascii?Q?BX+itNAviDHH8HXtTyKMgw3w2NqY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4TqeMu9BuA/ala/i0iF6G4AUr/SZAd+8yqUFz8iAqYqg2NS1Rq2cxnW4fYgR?=
 =?us-ascii?Q?rHjuO9x3h8mEZlQrmbhgIzT7VWRneAMoHsgrMqIfycfMCXr4hoH488++dCO5?=
 =?us-ascii?Q?XPFUVaJahRlq4twLFS+KXwn+r+pCyhMVsHGS/Zc7jImzIveYj7iXydFTrOAl?=
 =?us-ascii?Q?l7WcoL4zf4evunG51QMRKliEATV7IYbNlrgv6HS3Wp2HM1c9l/gShu5MdZdM?=
 =?us-ascii?Q?EAJbEaO0Mlo4QIrdByQFffXsLNy0DxP8grJ2ly+lbEvS+hSwbl6//ZoH9Qo/?=
 =?us-ascii?Q?K8hSAKMPC6ji4R0RqywAxxLLgcjW/DPxkqqxsd6xa3fqGmnfPX7xYfAb53fU?=
 =?us-ascii?Q?k+fgcs67XNZzRBlCEsOwW5ukSTvxOdRtl973aIzikokX+OOV4pTLggZ7/j71?=
 =?us-ascii?Q?Ozg/yHLb4alAaQfBKv8LssUL0vvNqED8vFABa51lNRj4B8iFe4Iq8Hm3niCZ?=
 =?us-ascii?Q?qTWDRgcNYqmKEsApGedSn/1t091aDjNl4bxihwnhxFibjgI/4LEDhdZjlqOx?=
 =?us-ascii?Q?9OsIsp7uzDrjFeGNvBGAy4j1AawklTV36teRqm5ueVxBGgQhBCW4m5E/mW6b?=
 =?us-ascii?Q?TzfopdqnV6fW59lRz1Gy5iWApZi6djAU+yKUEf3BypY/ZrlMoDBbcTHdqWSo?=
 =?us-ascii?Q?Lno1vohMJD2tW6N5tHHLUeZnqgq1l9RdEqfUejSm2g/saC11115EETbXthF4?=
 =?us-ascii?Q?WLRMQy6HiIbnZ4LCOmsfdhNBllEOMLW6MAWlTDxUl3Bsb7itvxAaSWQXqgdK?=
 =?us-ascii?Q?sKiLEu6uD9sJj2Jem8nXtChY3N8Q3Hub9ZDeZJJWVKjqGdTi78NgAnZYO9Kd?=
 =?us-ascii?Q?njpaHuaM/LNLcQNGGaUIEDdVSTo5LsoEELiHpxVB/OvzeO6Qzjyx8zLX3mRB?=
 =?us-ascii?Q?wXsydwr+RMRcMEIaOtDVzp+5FyoSj/+z3g5j3N/HGN0SCbBCSC/72oOfM813?=
 =?us-ascii?Q?+03foajmrrcgBXKrkKEvwIjyCsEdDUOkFfhYXPZSALaEJ3F4Mrrim1enEAHn?=
 =?us-ascii?Q?Xc6/EowATWdN85f71Ym+l+Pcie5iHdHZPz9dwk/cOqtDQzv37WwsEcKCU2LN?=
 =?us-ascii?Q?59YOlxLTu6jWU/VDPdL5j+9gQR6S4wpp1CMZsUkaRBrmz52dDNumpM/7CZeD?=
 =?us-ascii?Q?en/W31W2WOANLfXol0DjHgXvXa8VNr5kAOug6Jr1P9ZQGNiqdTjFd026zkYT?=
 =?us-ascii?Q?emVGU0dp2W6JmrTKwX2jXHDna1HsD1P3RLexW7PmN2qIHJkAnwOdyaYTbGXl?=
 =?us-ascii?Q?rKAd7jZawKpnXlnW21ZeyikP69AYshCDLeG4SFlXSlF1lWpN6cHlxuTp/G0m?=
 =?us-ascii?Q?pw1FyfnnVShQH6JhLzAxTyVAx/iJPleOZGhfShSbfvJPY78c8qrT0Z50PxFc?=
 =?us-ascii?Q?06+fZTLD1fw7lXWqcxTM/uiBnww8u6U/Xiuc4Rpp0W8abUse6AJKueEy2G3K?=
 =?us-ascii?Q?S7o9kpUCvWyut1VbzcZR3oTKj9ZLJNoQS3ta6t87/MbhdP3ToYdVHvMMxlpI?=
 =?us-ascii?Q?9vunUpoBAc61dKwA+ZVsvY7MPK75JRzT8aCRflLAaILANrUgu6yCzF4l0ISB?=
 =?us-ascii?Q?OD8UjIR7GODbbQtG+pH4Z8Tt+8F+/hQ5l+oKjovV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SL7tpRCHGIqErN+gbRKeu+Frh7dT7Qx4PSw9uzdDajK3Igs9rm1SB60lsDilET9mQDGW7sGQLosw7QBs0x3PEoeFPp1kNNu44wWRdn+ko6Ar4ZBfHprbNxNwHhhji80M7TLcLLnndJVViwbMvzaRtS1v32mz6rt2Bj22tS/2C1jHZug8zinS2s7qRjtA8bbj6R7HiG6r+egfAA7fVvEPdKPrhLSkMJzyZZAUEMzntn6e2NQURqknaVmUiuB5C1KxF4rKNlZu24Z4RdqkQxkkVsEoeEPvO5L4BUM22Jp06iacTyRnqS6qg9ZDH9ftfUTADSLfdctKsfUeO51Xd+CkQ3gERoRvaYu7CNnYpDeIaDnTkAxgW6N5stkI7LQaeiKUT0hOtRU/Rn6IX4ct7dCG0jJTgPbX0qhYQPnnYaYWrORmG9R0Pfy/We+oQ75FCeQ4ReNLemf7mfAyd64zu2ACO08pHEbDXx7xRGOiAYSzSkosknkmPtN+oaaVxETaDT4w1jdAuEXauwSHDC2ceYKMyZvlprAyQB/omNSNMcfzZtm4sANeACD98oLFVmTlLcC65MIUewWRLMAg1xjYPhdHOsrELmDkvfVMzcZE1SiYhu4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f583312-c8b8-45db-3284-08dd7125f56b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:03:20.3214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+4zczcHyrZK4cUs/Y7zgPhDFh/1Xle5QY7+3C5G3vMbKQQcPhRLzjhXU5a2t+dIuQlGLaCTUiOUVRXk/98zAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5874
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504010087
X-Proofpoint-GUID: URO2SOu0o05CSlt1wsb_LPDAsPWcLg3j
X-Proofpoint-ORIG-GUID: URO2SOu0o05CSlt1wsb_LPDAsPWcLg3j

* SeongJae Park <sj@kernel.org> [250331 22:48]:
> On Mon, 31 Mar 2025 21:45:40 -0400 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:
> 
> > * SeongJae Park <sj@kernel.org> [250310 13:24]:
> > > Some of zap_page_range_single() callers such as [process_]madvise() with
> > > MADV_DONEED[_LOCKED] cannot batch tlb flushes because
> > > zap_page_range_single() does tlb flushing for each invocation.  Split
> > > out the body of zap_page_range_single() except mmu_gather object
> > > initialization and gathered tlb entries flushing parts for such batched
> > > tlb flushing usage.
> > > 
> > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > ---
> > >  mm/memory.c | 36 ++++++++++++++++++++++--------------
> > >  1 file changed, 22 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 78c7ee62795e..88c478e2ed1a 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -1995,38 +1995,46 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
> > >  	mmu_notifier_invalidate_range_end(&range);
> > >  }
> > >  
> > > -/**
> > > - * zap_page_range_single - remove user pages in a given range
> > > - * @vma: vm_area_struct holding the applicable pages
> > > - * @address: starting address of pages to zap
> > > - * @size: number of bytes to zap
> > > - * @details: details of shared cache invalidation
> > > - *
> > > - * The range must fit into one VMA.
> > > - */
> > > -void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> > > +static void unmap_vma_single(struct mmu_gather *tlb,
> > 
> > I could not, for the life of me, figure out what was going on here until
> > I realised that is is a new function name and not unmap_single_vma(),
> > which is called below.
> 
> Agreed, definitely the name is confusing, especially given the existence of
> unmap_single_vma().
> 
> > 
> > Can we name this differently somehow?  notify_unmap_single_vma() or
> > something better?
> 
> notify_unmap_single_vma() sounds good to me.  I'll use the name in the next
> revision unless we find a better one.

Thanks.  I don't really mind if you have anything else to name it, as
long as it reduces the confusion.

> 
> > 
> > Also, maybe add a description of the function to this patch vs the next
> > patch?
> 
> That makes sense.  In the next revision, I will add the kernel-doc comment
> here, but not as a valid kernel-doc comment (maybe wtarts with /* instead of
> /**) since this function is a static function as of this patch.  On the next
> patch that makes this non-static, I will make the comment a valid kernel-doc
> comment with a minimum change.
> 
> I prefer not having a valid kernel-doc comment for static function, but that's
> just a personal preferrence and I have no strong reason to object other way.
> Please feel free to let me know if you prefer making it valid kernel doc
> comment starting from this patch.
> 

Yes, that was what I was thinking as well.

...

Thanks,
Liam
