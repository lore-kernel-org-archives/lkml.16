Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DBF2528E1
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199119; cv=fail; b=M0WSPWzhpvPD+wHBq29EEKRbmSm+lM1YBmIkdaXIFIPSddwd5GfsaVXs32hLVQhB+uBohereTiRt9mO42jaTYnEKEcKrHDvsqHAbwOOjqx0pHrf1MXUnGiZp7A90QF9oD1Zjj8DyDn6WKieOQYDaeWaWj7xw4VO0TNZSsetP77M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199119; c=relaxed/simple;
	bh=g1SzPTTXP7PV+kD5Xf4cFEG5x0DHu60ZLjK9FryQEiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jS2Pyb9R7Y1b8r4ATsYfbEotqIAqYlXZJKsolTpyNJJQOsQBDFuZBcTr6g7xoofzefS3HEEKB1djISv6SBliN5pdC8tLaAhTonM4IQTvVksuPX+BWIC0JD2GyEz+v7pr5wZ8xEDJqHDFWBngUsScSY92YgRD/RT4vGmfPCiBtdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H388DmeR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i8Js/nAt; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H388DmeR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i8Js/nAt"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A7tjAN001762;
	Mon, 10 Feb 2025 14:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=/Vk+oypmJbkUWFO3MX
	cWNlkoG5y2Bt+XwvnA597y7wc=; b=H388DmeR4xrvYqMx8odePcgudRgqZcXkTd
	7fKMbF+AYQ+GjLD1y1bXmBXPYhGrDRE8ksMeMtpuSrNkbf9DdmkegaQDHUr/cve1
	oDlJklEv52MclaIn3pAAAI7ey+KDmUFLVKqNYX8LTFMNWDyp7WYWq2ZOiRXH3qSD
	QgFrCRXtby1MHrlKyyfR56bHZGe9Un8OLyU1b36YQ3TeF3LVrRJtLFMblleB0194
	dC+RK/XF7YYJ3FqNjQ2DWH722ddhUHDRuB4Ki5URIP+ApZsbMxVgXVzV70eH5sPB
	EgDTZ+Blc5BYkeAXVYqV0A6Smc751CpPMSUv4Row0MjcWyK1JNqA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0tn3350-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 14:51:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51AERd7U009792;
	Mon, 10 Feb 2025 14:51:47 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44nwqdr6hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 14:51:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExgSoy5V4vCDUCNNU+NE0XKAnGnoXyABFH9ydMQxBAY8moX2pRV47shTTA7qocy2ex6UilO0LD11aSPzUXW1ZY6fhBMzyAH3XZeHmwT2zTQJLPPjcyytkmeX7aQ2Ry/N//ILBUuNCETFRcc03/4ud4V0W0ZXYerJcuzL5b+Gtc3oqqJM/hRXi4MMaV01y5uSw/FBmqJIdnLKm9mvSzN7eSPRRy16YcfY7R5gW0BLsHr16asLqklOXG+GbK/dWQ0NtoBaytfNYH93zSZof+MvFdTaM8Hz5oL0QKdH+dkMMAgqxZYqPAoVYeBuGVLB96lfoN+Fy2ZqP8eELpy6+kS+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Vk+oypmJbkUWFO3MXcWNlkoG5y2Bt+XwvnA597y7wc=;
 b=iZUFlPaF0yv2gUSmb9ixOz47aDJuC8eBgSB2GvpOvf0nwugBd3cqCtxGwitMXWxgGLFU65JvBuhhlTtev8kJhlHcwHGilYpHnJ0KtzPK+aa2+TGk2HavF4OHqDoOPeO0zJYI+sMCfwOWHZ0cVWwrtLa+JeS8T8q012j6BGbIThnsRkZLoBmdeqRyHtu3B7uyRs5DwawYGcpKs0NkEU9PpDH4ROGay+3t1MfPiG34l4UFVBzGdkRlkR5Norq/qYkzhURcjOcQpQ48fkuBq8MuLlpBZPa/abus4UatL0mxWRHGG8NpQ3yacIK1gvS02G/A9i1jewbZDfJHIC4KxBXrbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Vk+oypmJbkUWFO3MXcWNlkoG5y2Bt+XwvnA597y7wc=;
 b=i8Js/nAtzNWORczR3Q+RUWHk8VMEMBGlt44913e4amF4SvanX09UIci0IJQJZC1ZlYlOjujHcZP3Td+mMfm8E7KIhOCciWDMnHE+7O7lmygbzOZFYnMDrtt2OBzSEcVh/B2/7xz4dlGu0eSl6OXkMIevI6tmurYlea2PmTGC8jE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CY8PR10MB6516.namprd10.prod.outlook.com (2603:10b6:930:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Mon, 10 Feb
 2025 14:51:45 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 14:51:45 +0000
Date: Mon, 10 Feb 2025 09:51:42 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        jserv@ccns.ncku.edu.tw, skhan@linuxfoundation.org
Subject: Re: [PATCH] maple_tree: Remove redundant mte_to_node() in
 mte_dead_node()
Message-ID: <j7vbmbqwapzfs4vnkb6jfbprmdwzzq6fu7jjpvcb3q5szdvh7s@p7p5ur2ivlts>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	I Hsin Cheng <richard120310@gmail.com>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, jserv@ccns.ncku.edu.tw, 
	skhan@linuxfoundation.org
References: <20250210083526.252955-1-richard120310@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210083526.252955-1-richard120310@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0014.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::17) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CY8PR10MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: d300616d-7d59-4aec-5f3f-08dd49e27050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mPIGF3hJB9NSZlQy9lrSdZXalkuON649FoaGcryLqUOeZFyn0kIGkPu1ePmt?=
 =?us-ascii?Q?4LHAqnJOz8Zg54YD+NgilolmGS6UQPLfiSw7GDD0qdBicUTXdnokhi6ghPuL?=
 =?us-ascii?Q?1g6QDQUk20ozJ4VVd4RdGHtFp2HWjwfW2eAh6AKrft3eVPegrT7XU2lMP/X8?=
 =?us-ascii?Q?/ZTrnMYWyCDPb6XglUkalK5pvU6GXDUfuqt7IVSmVATJJua7ynV8hdAIzbIr?=
 =?us-ascii?Q?AEZRdrjPjZl4pzyJ/gVB4kw81jRaX/OkCSvWpj/G+nVWFl2Q71siOl1c6jen?=
 =?us-ascii?Q?YU5B5bKmHbK3wFM4jhSjoSMRlpeNDAxMpL1YEJYVHe5IusXcY5Ih0+jPJsnW?=
 =?us-ascii?Q?NgwSffLOEeWOopbRSTUq0BBGdBpD706kwoJ0HCh3O1ARROmo1KnA4jMiAwqn?=
 =?us-ascii?Q?eCBTAkmIy1qMV32Zq8IubB8RZ7091cbaitEoobkC99Yl4WA0OrOX7nKTH6C4?=
 =?us-ascii?Q?PkBCYH7qF3kqLOFblByhquDOrWvLNgEFzcAdx9f/dAvqhhOvVtZgFSO5S5fu?=
 =?us-ascii?Q?cqr7fwgaC0scOvMsM/uD4EqPeRVXTFwBJUHPpkB2YG6av4ROLUlI7zfs0tjs?=
 =?us-ascii?Q?7AYMZA1rfF4BYYzqLm111dnF+X9HoINj5Yq/iGf5bItworDV+KylApXJIZR4?=
 =?us-ascii?Q?YftIQt1DT/ZMaqrtMk4WkjjVuubNi1R7vLyjI6DKp6f+JQGqVX57UKH1cBi0?=
 =?us-ascii?Q?W/u2lK26qmfOgs4SQeHK4jBddmLlZaBHoA8NV4p5Z/GdxigpZBCTXYvduo9q?=
 =?us-ascii?Q?BVVdQITH7Acz3DrRdPynU5VKOwCwqqza2nbCdAqQspdpTjn77kPgjvfRXr1e?=
 =?us-ascii?Q?ukiQUzKQ1cMVvnlN0yeyH1nqn+D3sdtEXWXdpj3xONpWhMJxMG9lcCUS96n6?=
 =?us-ascii?Q?1tL1SBDfsOiODGifBiRqhUGqqQ8PP75SBbhnIeW10bm1CDcBwDDTsKKFCDaz?=
 =?us-ascii?Q?mKAzqjcdFZvLHjDbTFFtf8W5/Nv0vXNRew9nuWt+mzJQF17anOagjDycBCrP?=
 =?us-ascii?Q?qi5j/lH8IltwQtYclMUaYFVLdJkE2NwBR+fdem1/sKnG7PJB+Xkz9puPJ4is?=
 =?us-ascii?Q?NTiQACa/g47TSPFz6yrZizQ/UaA4mQSxZbZ2h/KiAk/5BKHH4RXYdWGBYlRN?=
 =?us-ascii?Q?dWK9xa0B/myjrnPm3qeAuq4Jqw4rhO5KUrdKuLPBl09fc4u3GSgjD8Kn7sXY?=
 =?us-ascii?Q?eeeDn0UGLF3sDyw/PYUQJQJwz8Vwzbm7xGCP4JfTPqvAoXkyh/YFo+KvmxjN?=
 =?us-ascii?Q?cOAImcNXzbQ8ex4eEHssKmdBTocO7uHRuQGkVx0jbqngesS1mKfI6fS58acg?=
 =?us-ascii?Q?Cah4Yn8vJKzpK+nfwEtKa7XnqGUCKu6AWX6pVOrKfnvpPv7heMUVGOZfkxfU?=
 =?us-ascii?Q?f7JUtpg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?61TuuA6TGrOW1/2HTvWXGUI5yD2hkPA1H5hKJuvT7WU5BbBC3LKnPosmTabn?=
 =?us-ascii?Q?RNM9WROJtbLIB0eXGqYRjydRK0+cY6wacUUjE2u2vV0zm6WFggYllb8kMGyj?=
 =?us-ascii?Q?pawQ/i4jElMMdR4ha5dLsb3dDZ1gRU8JeEI1n2b3MNj7Bl+20Dn7PI02PH5N?=
 =?us-ascii?Q?rF3/sbDjYKUkGGYtpRdx5Sz3YGdC8pnSy2gJ15hEqI68fMIk3B+bGaUzaGPG?=
 =?us-ascii?Q?40eurHMXj9dHla06SYWjmxws+vc1JrnvYm+O50w2egYyiTOvhFQsoqk+peQc?=
 =?us-ascii?Q?1j3klAP27hkOTY5bT8e7bjGWNsTq0Uywkd/jNb9CwwPhM6VHfp0kSmR+w9ns?=
 =?us-ascii?Q?zjTLbRldb3UCdyX0eT1X+MdMBkYLxoEK/ktnzazhKUPRLZVDINBYX1KCEYqZ?=
 =?us-ascii?Q?3BOSXD1Lf00x7vQs86uuzQa2INqgzCBrkA2aS7n/aAkV+wa5kgp5JLqJq7/7?=
 =?us-ascii?Q?0fPC0v4U5dELS4dBeOWJfVvwni4E9NQxiiaglGz80uzFc2mb0sNdHFkN+E2I?=
 =?us-ascii?Q?95492HBDD6agFJm3e/eecOZ6LhAl3kUGDZVNcbDEYz82ZIBf5DYh3fL5K2Ll?=
 =?us-ascii?Q?WJxqK2IZJdGa4E7HrC2F2RgmPUwhVeHtrZDI4zvCuvyWjXweJzAs+UezqAi9?=
 =?us-ascii?Q?94U5deCgiiF2AFEV9l15pHps2gimAR+cyWQ4u8bUYI7R/Rh6YbRsC5lgdctn?=
 =?us-ascii?Q?o3Esd4BqJIWti4kyEoe1H3E/V+tyJG8lmMzdaqawFCQvMkHA0zerrgzSs5XW?=
 =?us-ascii?Q?GLhyf0bJjM2xzEeALp9M+7weTs8U/jj3E+aiYDM+Hr2eriCIyMHhGRnA+SkL?=
 =?us-ascii?Q?El7ZdMF1V3BW6ZdNzGXqgZnavhJmxg5pQvs88FX5HGIiT1ttXUj07s5eDSx8?=
 =?us-ascii?Q?ocoAurC9wDwrZh6pj3OgzKnqtdWQk6BMTNT8F6rCuGobKVp2zCje9O8xMWpo?=
 =?us-ascii?Q?jtxmB96mNIbwsJJmjDieihIMrNEQzn2omCz5Qt5ioFm86tPxna2VTxCnbYwt?=
 =?us-ascii?Q?r7Q5yXHx3gI9PbFwP9OJzk7vtxt1VCda0/UX3mTF2tQ+Jl14NRFVHAERdUwY?=
 =?us-ascii?Q?hJS3Gf0+2RqigMTZsa3g2m0qWyXPZVez8w79ascF5UHhSgAfYD1Eu92QCqlZ?=
 =?us-ascii?Q?qXLycdqw7JNrbGSzspA3KFnV71sNONcD9EZse2JyL4fWdT0CTSj9sqhHafsG?=
 =?us-ascii?Q?n8F6tSZb4v8bgBNQdJ69OmQ9ysAw6WO2tXvUfO39EvSrHn2Ckx0KkpxacebK?=
 =?us-ascii?Q?ct0frLXzzb97Dh6AKPk96UKUSeg6kf0//Ytsghg7DNR3XxGIyZ7ncc7Ijt9z?=
 =?us-ascii?Q?Y4lZbpZXwmNSC6bAPOh0pHQXLZHeB2wQCq7JxQZlxzxLspT/uY7zeFe/stvt?=
 =?us-ascii?Q?5NxbVZ+JX/TPTBUwlnY6be/s8cRjRO+36n95js2VXinszkAbGi0CXgdNtRXy?=
 =?us-ascii?Q?K6tsa5up4deTSrKblSRWN6pMIkAXlIRh2An1DBSm9gYsWq6T21OmNSfGLK/G?=
 =?us-ascii?Q?7RaIth04C4fxZpc8R/+IuGFrjAy6T7tylc8iLic/MWduI867TywKEm5lz/nh?=
 =?us-ascii?Q?nGVaG0ha7M+RJA01Nk7+Mk3oTO97XjvvLSa2oXuz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eXolMZFpE1vD7R6yUIJ19VcUI91Y8sSnPhV7yVOIZLp3dwzSGiHdr5AUfoHKXLGOCt8nOXASoF+UPA2ZuyTea3SehyjN8oncoHAtjb+9HGk4wXNKJS53uzvRhwQSHdXyVksnu+UMFgiIgTMhs8jzRc2Dhn8wD2Npu2OEQ36DU4VuQFn4agVHZVrKX+f4GmZUkDU7BPBUVjWyADf92wcdpl72fUJ5eeT2lVC4CJ4CsQOnOBVHSBYC9eVcLJ9bkIZ62E6vSoy7A8caBk/ERUfzwHAHsgi/AciKqOdslpj4ot8keEnSGeGH+wp03Vb1BYZOoJWBID6p1wSauMJBdhDUuJfd370He+93DY4xs49QRbmcNulqJMveIJddoSDbnGrsTr710ba0b5DixtyIEi3lMX/2rEzYKC+IDbhulAuOa1eInXwZi2Yxa+ygAzd+5cghTcxo3PGhi+Sm14jE/3QS+4TQanh27Uex1CyLtJYi/IwBpdBPr489VLtffvhfHGefjfzf8EmrZldd6S1vhb8xgwdPlpMVg+AacquJC1AJvU0FawWzBmwQFnu9LcSeTgX1BUxAESrWACPY4YHCO6g12FJCMVunWNirz1snfQa+Pkg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d300616d-7d59-4aec-5f3f-08dd49e27050
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 14:51:45.3661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5pe6VCH9SxiZqpR7yN88v1JlHYfJAz3S3eec5jcnVKefkeJBbhKStSDhA+iH79L3ePIh4gdB7bP5c9Ix4MUmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6516
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502100123
X-Proofpoint-GUID: GRvdiezajJyQWklXrjX-MOe2NaM05_ZA
X-Proofpoint-ORIG-GUID: GRvdiezajJyQWklXrjX-MOe2NaM05_ZA

* I Hsin Cheng <richard120310@gmail.com> [250210 03:35]:

> In mte_dead_node(), it already assign "node" as "mte_to_node(enode)" in
> the first place, calling "mte_parent(enode)" will result in the same
> "mte_to_node(enode)" again which is redundant.

This is a very confusing way of saying "avoid calling mte_to_node() in
the mte_parent() call by using the ma_dead_node() instead."

In fact, the subject is wrong as well, since the mte_to_node() was
removed from the call path of mte_dead_node(), and not the function
itself.

> 
> Refactor mte_dead_node() and utilize ma_dead_node() to perform the
> parent check without the redundant "mte_to_node()".
> 
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

The code looks right, but the subject and change log are not.  Please
respin the patch, something like this:

maple_tree: Use ma_dead_node() in mte_dead_node()

Using ma_dead_node() in mte_dead_node() avoids decoding the maple enode
for a second time to find the parent.

Feel free to change it as you'd like, but I couldn't follow what you
meant.

> ---
>  lib/maple_tree.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index f7153ade1be5..362f85c62678 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -584,13 +584,10 @@ static __always_inline bool ma_dead_node(const struct maple_node *node)
>   */
>  static __always_inline bool mte_dead_node(const struct maple_enode *enode)
>  {
> -	struct maple_node *parent, *node;
> +	struct maple_node *node;
>  
>  	node = mte_to_node(enode);
> -	/* Do not reorder reads from the node prior to the parent check */
> -	smp_rmb();
> -	parent = mte_parent(enode);
> -	return (parent == node);
> +	return ma_dead_node(node);
>  }
>  
>  /*
> -- 
> 2.43.0
> 
