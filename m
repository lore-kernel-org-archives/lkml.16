Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51414C8F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749298652; cv=fail; b=l2igeN9SQ5/GUQJ5GGVw6r5LmSiUxtOoxsrGthcJ7wapaMTPH0aMYzNF8uq6JHT4LHtmBsU/m7Cyi0bismJutVZcyB2fFSe2w6ZMhvtw5NmNtCLgTNlKG/eFqBZLq7vdy1hRx/iHyzaowTBKQ1Zo+QCUCsLitGLAVrheBiCDl80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749298652; c=relaxed/simple;
	bh=IebRKpTjiKg3fDwchBbSuilhL28YA0IIyhehpQBMphI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pr3zK4VDP+VjqIGZR83Z85vZ9eiAwh5d67ZzETfw+NBJJJrJUasNsxI/AIx5AW6y3KqHbje6rDJBNRu2pyNXmOQzbvIbdVgzG4qTgWXUHslPtDZVougwWkFWJKeDYFzaqcCOr/0xBDTnDJavmyMn7lA4RW2PwaCFC6N5lLdDKQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UlED6IlX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xe0SMJiw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UlED6IlX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xe0SMJiw"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557BK249002318;
	Sat, 7 Jun 2025 12:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=IebRKpTjiKg3fDwchBbSuilhL28YA0IIyhehpQBMphI=; b=
	UlED6IlXPI/RoYYPgrvjWMbcbcLYnBcSsyf4eXuCQODq3JouNX0qjOtMehGzVsvY
	lTo9dFjsnvoDAE+jmDmNh6MwAOnMmxXQRV3YGdZS7cCWSwk9KhTlSZe9LdynmuQn
	F9jipn19bNTKAm+TvALO0JNGrNhpN+bRoJlbcTpmW2Q0W4yeVILIkW2y13zuMT+u
	PT5x1ybQG1eBcOGQIihIftsTbreHC2DziAFwNZIBA3rXJJUOEM+xQ5L2r3JKpbVD
	+fO3Dkl+0heRfQ6LBHF2sAAPc965E0N5a2WUHVNkp75TmiFQmBK+eI0NjeLStnWB
	FzwRjCtNw/3tlWmirkwgeQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dywr7a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 12:17:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 557CE3OS020668;
	Sat, 7 Jun 2025 12:17:10 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6rne9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 12:17:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNL7DiwwmbqUvx40lR7CtA1spbwYVsoiKwkwZjvqMeSlQ8IaFP+kl2BzDNiR9n100Ddccrq0j9/w4DhRPiRLzxeM2NJ+rd/euxNyMZuyiAOJzbnW+YIzbTeAa3TpOVFeh5cHlXziXX9P/Yjr70h7CPqFhbnBC20X5B9gTlzCBSLbYRLs0ZeCvOyj5ZK8ZTfeCnQI8QPZ33nUSQFv6hiDSKBbcbgO6KJkZeJADz1qA8OLhIvjmQ3osno+ELbiHKEuxFy7M8AYvWYn+pmyYUAVwegPOl/PRVmb3xss2J4beJH+N1DdZQF1MxpKTI5EBD4WKLJKduri2D7BZ8n2YiMXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IebRKpTjiKg3fDwchBbSuilhL28YA0IIyhehpQBMphI=;
 b=sN1u1F2RNUOekL9mvl5WZFp8p7Jp2/mJvzchsGZQJUwMdTZGt1sr8yFG/9jJD6h3A7Tx7j799C2aRvh7Me+XrEAZk2G1X7yB/mCvnCcmUMohudV20FkPAMG/qVK8lGQmV42ABvRlRfRZrYVooKyi0xV9NNm+q7ylyJynuHeXZFwvy0lIu0esBqw3kGenNSfsN3gBIjfPZFw9Gv2kAfPVfkXYUw6KXQ7BrWGpaUHgjChrdsWoKeAC7g242cRV7gJ1QuH3FZUbRKjsTf+DwSZIvTCQ4JjHAMtjsb2VQfskZRArsn5cJhE+aJ5HLpjxs6ufqZwmpE5R9X45EAGBZTSGCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IebRKpTjiKg3fDwchBbSuilhL28YA0IIyhehpQBMphI=;
 b=xe0SMJiwGngqCKAAwnSJ+0U9oDTqquLZlB0A/MVoBB8hglGWIzbiTRUURnzKJQNqKCvGa0MEI9QSupQXMP0bKvUoDDji8tQNu7GCRJXbUUiUCdpDahWjFyQaimv/UWzQ9d+Q3SyToufutHdz/oUNT8QlSmFBrf6x+RUpk5OKHqI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sat, 7 Jun
 2025 12:17:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Sat, 7 Jun 2025
 12:17:07 +0000
Date: Sat, 7 Jun 2025 13:17:05 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: shmem: disallow hugepages if the system-wide
 shmem THP sysfs settings are disabled
Message-ID: <b455db10-f129-4603-a087-43a1b52ff09c@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <39d7617a6142c6091f233357171c5793e0992d36.1749109709.git.baolin.wang@linux.alibaba.com>
 <b6ae32e5-60e0-44dd-a1e8-37c162d04ed3@lucifer.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6ae32e5-60e0-44dd-a1e8-37c162d04ed3@lucifer.local>
X-ClientProxiedBy: LO4P123CA0177.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: b2857cf4-c484-4a47-eb6c-08dda5bd38d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGZIZE9aL3ZvRk15U0pCd2RGQnVIdTN4Q1BicEorZFZDbldEbzZPRmZJT0t0?=
 =?utf-8?B?YUUySEp0UVpTMkhpcWlESFF1aENiWTkvY2dKWkwxNVZSZG9tdWR4dEMvQVFH?=
 =?utf-8?B?bzhzRW1LZitIZXFLVUYzOXk0OVJHK2twR2hkNHlBcUdWOVBnMlJWOHVaNnlv?=
 =?utf-8?B?b1VvbWpIR2JzSGpKUm51QmtNSVV0NFJZVkNmZjFaTjFxWGMwWWtpc3krUGZK?=
 =?utf-8?B?UXl4SW1KQjNrd0NtZmovdmthR29jNXc0NTZUS1dmZGJ0cWZzaWRLWmxTMHZu?=
 =?utf-8?B?YnR5L1ozQkVSQzRLeDM0WlFYOEZOSXoxR0xGcXBEOUVWWWp5TklxNGdiS0p1?=
 =?utf-8?B?eFJObjVadzA5aG14d2FURjBRbzN3empscVEwQVpYOGFHSG43VnpoZ3lRcWZ2?=
 =?utf-8?B?QjFhMG9lOWttaktQZXVuSXh6M2pDZHp5ZmtXZVZjbUxCUWc1VU1xbTZ1NlRn?=
 =?utf-8?B?dFZFcW56Y0JpaTR4SVlzL3hCYjg0QzRHUVNJT1k5WDNERmtHYlo0dHVZeGt3?=
 =?utf-8?B?VVNvOXBQdEdlWm9MS1pRT010M3JoZFNiQ0U0bnBjSEJWclUvZ3NSYVNhOGxW?=
 =?utf-8?B?dEtmQ0U2NExTUWVRV2dMMmRMbHVVbFh4SmdaSk5zamxwbnlIN05qbklsQlk2?=
 =?utf-8?B?TXgzOW50RXY5VHhUQjArQ1Y4RzlTNW9aakFFVVhuRFpaVldVTFRZNXZLcjJK?=
 =?utf-8?B?aGVlTkJDcG5qQ3VpRVlBMUQyeUlFZ3FQOVVGQWhSZXVsUWtrZHltcHZTd1Bl?=
 =?utf-8?B?SkpsYTZCdjVaR3d1QTZGYnMvVVpKMVVmZmtpem1YMnlSZ1g2VGxEeENKY2g5?=
 =?utf-8?B?THRwNXRjM3ZPVFBCWGlPdjhQZUJKY0dyMXN2Q3Q1MjMxZmhzVWoydXJERjNM?=
 =?utf-8?B?WUlqWGVCZUhuY3hqaHpIUmNCd0ZXRHpFaGx6dGcySTdnRGE3NmNSRG1Vbml4?=
 =?utf-8?B?M2VnTkFMU0xRMVM1UlAyVisvd1RoNzZaZUpQczJWNWlsUHd0RmRRbXY1dWsw?=
 =?utf-8?B?c0h5MWVNZkFSY3l5UWh5ZmptT2dpaUlXdnY4Uk80dXpDVTN5NXlocG9VMTNS?=
 =?utf-8?B?U09YUFhxTE1aakJNTlY3UmxsMmo4ak9RQlFyYUw3YUkwZEJJK1RjRVlnNE9m?=
 =?utf-8?B?YTZscFFkMk9JQjdoTU9rMFdBZXcxaFFkMWJ5ME4vNmRYUHpENDhrN0sxcGZs?=
 =?utf-8?B?MzZvTGNtK2ZLUXJlc0RpRGRwWGtTOUxRTzlJclMrOWhWWW54eVZRMVMvbURy?=
 =?utf-8?B?VTFHakxDdDRBNkpnWEVLVkU3d3lyb05YRkZmYzBhS0w1TDcxNFFXSEovS1Fu?=
 =?utf-8?B?M3F6a2R4MFpwL09EOWpqbzVRcTZxcStLTWIrNEFoNXk4djJkK09sbW1rbEhI?=
 =?utf-8?B?K0k2cFRmT3ZhVHFpTzNHaHE0ZmlpYnNYNGJxRjZ5RS9CRVd1aWo0OUp4NWtV?=
 =?utf-8?B?Q0Z5ZU9DRDNGVVFJR050ZXk3TjBDNkMzditETFFWRlpKY056ektTNVBEYm5B?=
 =?utf-8?B?MHdHNmtpREp1NjZTYVB6SlozdDByRUt1aFlkcEJ0MUpsMTExbncxWTJyNzZl?=
 =?utf-8?B?VC93V09SbUsvYXQyZ0RDUmxoakZwbXcwUXd6R3ZlZlcyVGpvTUI3ZG4yYnlJ?=
 =?utf-8?B?VDBZbTVHZlJDcFRtbzE0RzlnWmlFcWZvajBLUGpJSUYwYzF0WStqT0N3N2Q4?=
 =?utf-8?B?WXVkdE8yUHk4SlFsZW1wb3h2anhFSjk3cVRQNDNhTklEV2twUkM5ekM4Rit3?=
 =?utf-8?B?dnd6S3pXYlF3aXk2VEdnNWpjbk1aMkEvZytLaHFEMERRZktQcS9CTzZPc3BY?=
 =?utf-8?B?RlBYUVJLNDMySFQ4b0ZsYVNKekJtMy9vZHFXQkRLSk9vUmE3MUNBQ3FWL3ND?=
 =?utf-8?B?OHZoUFcxZTgySlZUdVNIZy9XZWhxVjR2T3Z6VmNwVmZTaHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG1WZnd6Q2VVNVBGYm1zU0F0RVJGZERKRHdob2lTTUNQNmE4YjFOSHBZTVlw?=
 =?utf-8?B?WkxWTk1nNGIxYVQzTUFLYXVLVGxvWXFvVUZCR3dkdWJSQ1FOV1F4bU8yaHo2?=
 =?utf-8?B?NE95Uy9iUy94UnZkMDRhWldqaWx2S0p6WDNJeXlSKzBWOW9XeDlCemxQRkhI?=
 =?utf-8?B?YkRVMlA5c21iYVVQK2orcE9jY3Fuams2UnFSTzJMTW9FK0pwZGFzaTV0TWpw?=
 =?utf-8?B?eGV6bmdtQVZwdlZCK2dIV2hpUFBjdkE1ZytaYTllYTlNcndSUTVQaHlBZHhL?=
 =?utf-8?B?Vk1Zc2ZzNHFLZ0NXcE5mbVZRVXA4VUQ5Z1FYMnBCMjJnaDlaMllXZFliQmlr?=
 =?utf-8?B?dWZaNHZMRVBYRlVhZU5PVllWZkQ5T1oraVc4N1BNOFhHQVVyM2lzNjBKUTJP?=
 =?utf-8?B?KzhONkNWZ283dUNSenBXR2ZPYy9mLzlRUmZWUFFRTDBQakFLaXNGT1hZOHF0?=
 =?utf-8?B?V2x4V01BbVk2V2VTQXltVHlzSU9LaEdyUEtjbkNHbWw1cE42NXZmU2NGcjVv?=
 =?utf-8?B?TTRlaWZlRFExQkhjQ2taWUQ2d2QyY1plQ1plWEM5NVlab1FyeURwaUx5Z0h3?=
 =?utf-8?B?ZkpldG1KaE1mNFpXRU9mTmpKMERpRFZqTml5Uis2SDZ4U2oybmV4WDFjUk5B?=
 =?utf-8?B?RGZvRHlKRVdDMnp5WXExMkhrSVBnRlNmV3RtWFk4RjMrK01NL2E5a2hnS2J3?=
 =?utf-8?B?ai9nZGlhYVJTdUxOSG9sU1UvVEhaMWlnR3JodTNYTTVuWk1mUkF1ZXpYQ1ZQ?=
 =?utf-8?B?ODJ4RGJRV2VuL0tiaHhRSFlLRm9jbExlMGtiRTcvSWI3YlM3VDRzdHJCUnRI?=
 =?utf-8?B?ZTZrb29OLzN1bE8xVDZPZEwvOVQ4RTdxSHhHT3ZOZ1RFNGE2VzUvMVExaGtB?=
 =?utf-8?B?SkZJV1JyeTZmVklHZDFXcUZaVzZ5bTgwSWVDVWhPR1U2Vi9aeS9oV0orU1ln?=
 =?utf-8?B?TWdRT0xzd0pyQkVvK2M1WGVTdllSQnkvaEUzdjRzZUlWb3czTkdkYUJUOFhE?=
 =?utf-8?B?YkI2eTM0eUlsUTc5OHd2a05PeEJQTjVaT0NvM0xldnBibTNHdHNCOGRXSVZn?=
 =?utf-8?B?OGFnaHVYV01MNXd4R25LUVplMkVVSU9QNlozbW9NUXY5Ri9BbGR6WFRJQTBQ?=
 =?utf-8?B?OGdxdEVNVjJGWnhrK0Zqd3BGSDF2US9wWElkVEdtN1hIMUNwRUo4MHk0aThB?=
 =?utf-8?B?UGZ2bFdaS0duL2VwRDlVaXFTeXhRTzA4NDl1Sm5FU0t3NUxCakFvZjVEZjJU?=
 =?utf-8?B?Ynhwamx0NndRRHdyelpQNXRMclRQRzdsSU4zc0ZSNEhubm5GMmE1aHBTWlQx?=
 =?utf-8?B?dVpXZ25JVy9zeFBWdklmYk81NlBuNzFLenhwYzQ1ZHVhaFFhQjZOSmMvZ2dW?=
 =?utf-8?B?Z3ZKeHF3YXBiQ3BXSzc5R1NEYUZUcjM3WnIyK1FKQzA1ZTl4ZWFVbUpTTUlK?=
 =?utf-8?B?ZWdBQWFjL1B6WmFyTFNXL1Y0NXI1U0JSKzFScVdDMkNwRnpWeHo1NDFJbkNG?=
 =?utf-8?B?NHdSUEJqcGdTcjR0WkNCV216RXhvaUx2dzIrQ0lUdFo3eU5kanpGanhqL0Yr?=
 =?utf-8?B?SENRaWhUeTJiWDY2dXdDS1ljdkFJZDYvRU9yaEJoREJsUFd4Q0VXVEtkZUZj?=
 =?utf-8?B?bXZLSTVPYUV0MXJLVTBYVHhNbmVNRjFtRldNeisvZTBjMEJSakYzL0p3bnM3?=
 =?utf-8?B?RnZ4L1ZmcUhFaGtsTVdGdmZrbzRyN0FDS0lwYkFRWTlTcnVHT2FXUXk1WUow?=
 =?utf-8?B?QmY0eFgyZ1NReDArbmloaENORDhsNmk1dWd3TGZua3lNOHlaL04ybm1hL3RD?=
 =?utf-8?B?UHhQRC9VYVZhU3dobjRVVmVZVW5VSXhxVGZneGRIM1pMRnRrQUZYbG43eHhS?=
 =?utf-8?B?N3V6R1hZcXh1WUFsWlY0RnNBL0V3UU5YZE5CenBIQ1F0MGZ4VHR5YUpyTC83?=
 =?utf-8?B?bXljYzVCQWZtL1g5Z3BrNnpBV3NzN1VsNjEyNGYxbTVFQVJTVkhNdVdEOC9O?=
 =?utf-8?B?YTlPazd0aWZYdmJpT0tiNXN4eE5ZaGVaL2VUWkM3TzJRczlUZXRpVFNNV2pH?=
 =?utf-8?B?WGc4NWFVQWFqWHJGS2hlMVowNkNjMkJTUTZCUjZDUWdDWlZ4cVRwOGM5STZV?=
 =?utf-8?B?bHhjd3JVUXJkMjNYN01XUnZZaXU5M1BuWm1HSlZCQlZTd2t1M0ZxYStMdm1U?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n0vTSXDBPw22HXUM+DSTFFr2zlVxsmfGfxMZt6bYSfvaoS1w76PO23lqKcZm/FMeBHRib2ye+/0M2kcETFE4oD0uWPxNDgzmNTgE+pt0y2IXJCaJcPyeQV/aWL5lfXO82uEkaKnEc4/BnSmC/qltt075+eJ0vnn+DanEzB1H5KZ21+K+ZdLhaQNiIw6XgPwOzMSiK2tP83YtR8HyOqqkQ+Pg/9HQnCEfdDiSn3aIlw4ECNqlR56w7wrJw70DyQRvLUV3y0XR32zHTjtDvU4o+Ud6oy+it1Rd0c414Qn6Y2xhGP38A/AbIwVHvAg8WEJJvA42ATmVGJVeeB0q1E8xhOWmGnBSoZ3Bpd4IKdZSMKFisFEtUCGvodlhBoElxPe5Yo051lmD6SqV+qwe05OBWx+LLlEa9SctfX0lMLevmooIlnT3h9eB4uj+/4W1xWP1ovutipwA6SxjkeMATZIm3w09GONumEIB5LLNsFDcpG/W6hwzLqbsAaitEmRKiflOt9qGmsfLz0K5TWr08I8J4XxsBbAw6geZxwzG+gVjkahbRu89hEt2UKSrHWtFHGgK+Fjpk+mLWu519vaAcn0ad4JKvONVoqdgJo3ohQ3+3+g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2857cf4-c484-4a47-eb6c-08dda5bd38d5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 12:17:07.8142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6M/MrPqUwJs+zNeSgunkHXlBr67nJIGodV6QPrAP6DZilX/WNyWSbl4iYBqZFZIo+2AZ+1T7Y97m2ry307EHU37DjB8JrcGMg2Zy0RSXRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=680 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070087
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=68442dc7 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=qezY1E9EOtMgOe0lgCcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: GOOAB1WcaMKDVdEYFsf5bfx-ngJBuqsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA4NyBTYWx0ZWRfX2n8fL7uP22Vy e9xvEo8MI9jxwymUyzI3ETLOM1AY0FdxDOqm7ZsiAYQiOYMGlb//dWfm7gtIzwACcL5MFKQIb1v 1QF/EiLVoxQajPxIPK9TK/HRqrZHJ/a/79TzLdLHSJ3v4LoYUTqZGZ/SJYSGlpWzhwgQIi103EP
 PTHuQRoiR3LnT9eJYUpOsn9sW6RViKnpGY106IWoQzikqG53+ixfaun3AAiq+5gJYqTkbYqYKQU Bj6G9NYDWM89TMN/u9N/MjXOEyez0WuhUgZe1b1+oHVTm/hhI8mV62ciWLcC0Dzbw7gZe6uUELU SV5V4/6/sMUkyWgo2HyBePDpdkobpRtyS1zjOgtrBtB/UVNkItp6+D9J4SnL0hHWD6cNL810Dsz
 NM58XtStd++CaSFwTT4434iSmgxc7QI4LBm9uzPPEELpZeOG4TmiiPEjOc5e3Zzjj3guXANn
X-Proofpoint-GUID: GOOAB1WcaMKDVdEYFsf5bfx-ngJBuqsj

On Sat, Jun 07, 2025 at 01:14:41PM +0100, Lorenzo Stoakes wrote:
> On Thu, Jun 05, 2025 at 04:00:59PM +0800, Baolin Wang wrote:
[snip]
> >
> > Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> > in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>
> Hm I'm not sure if this is enforced is it? I may have missed something here
> however.

Oh right actually I think it is implicitly - if TVA_ENFORCE_SYSFS is not
specified in tva_flags, then we don't bother applying an madvise filter at all
anyway, and we account for that in our 'enabled' check in
thp_vma_allowable_orders().

But I don't think this patch changes anything, I actually _think_ we can just
drop this one.

[snip]
