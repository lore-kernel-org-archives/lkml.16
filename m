Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168931E25FA
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738174633; cv=fail; b=nljpzTuXyF2bXMoOVUSttyppq3fBxSb3p43BlVXxnWtNDr4kPRh6AIsWEFFpbKwX1bY/PoK4XmWo1GbbDJdnF0xvIpqetMoWwKI5/YdSLKh7PXe7ejll0NxKFK0QO3KtXPMh3CL/UJBLZ+4ttyigM9csw0qguLy99U0VuqWsjQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738174633; c=relaxed/simple;
	bh=6YVaKgM4ReKCYOjolsDFKxlaScsEkp/oJyy+b9Jbmck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZYlQ603y3HH8NWJAh7Xc4ASZ1KrNZn7VKeQQpjol0psCrs/VXciSNx2hqlSIl0eZ5XPe79MwyEJFsiuGWbkBSOVJUToLyKzjaDWAtDy57K3A0TG8MxmV/h0/IP/1FFXSkBzxolToPxTxK89xPwHv9TGHipnxSDcAHn4MEjsvmmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h9L5mj8d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PXT0eFmb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h9L5mj8d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PXT0eFmb"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50THQmA4018733;
	Wed, 29 Jan 2025 18:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=/pm97kA0QTHF1nI3s5oQ5v8v869bmuA/oC9oHoS2dr8=; b=
	h9L5mj8dnjK9DSzY76P7OzL5WaoKyEn6qrAyuIzxwV5YuXyYzWaVNGFzF0vgy+ds
	r2bm8M2p2JV7Gtvg2peFEcFhwQCVKLwSE1W7HzQ2dsW+i/1QhtR8fE5Yi2z4pDc/
	stXqlkkEi05OxL5otTthgUfJqOqP4b+FtfU/Fe3t6GOmV8mU/O5ACMO7Jcu4vAp3
	OGHiM27wyqfzppP9uPQV4zmHXxHRj6//dd1O4WGm+BbCf6neGc392y2/8uGjowHZ
	4SBcSyM0Vozk4MrYxbCuULeX8oCWzOdSC9iF1O0uTXM2VYZJ0qwU0/8RjKKHFn8o
	4PvFh8taeudKOaPNScSlXA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fqg6ga57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 18:17:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50THQ6SU034307;
	Wed, 29 Jan 2025 18:16:56 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpda2b2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 18:16:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASMXIZfrGJwqWycvFbGtG47Wu/8Mdi2h80WCfWo5DNMG2VnFADTBVmNxtNHgs2fe9QWThGPSW9n7WPbcDG7NQ43AvDMcXv2zNASVJ+jiFyJlqfwl0hW/X16H5ZG7kaFKc36XXKdIUcUjafqOBTr183P7VVNDEJgom4eaaCMXF0Z/5Lxu6ZlLbe0wf4wMem7+PU8LICf+Hx+RthzZGBP0UxH3/sNPjFbgMSQD4B1Zq09TTN8bYJiutnFZBIOnsZq0yqT4PHBKIt1P8f4kV2FaMKjqJLbYN3XIDosyIlbt9PsTRATIxmCoczIHMd7icYz7wHLwsL5tZHms/AHzEAwOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pm97kA0QTHF1nI3s5oQ5v8v869bmuA/oC9oHoS2dr8=;
 b=yKYv2rpw5R07FaTa8W5vGOPSdojyx/Ff89pJEWg+i6X3ZHNLwVUHjzsaEAcqb2W1+//brEPOzrXb8oeL4DdN+UuhhugcghFVBIN6S5lglrQxiZQL7j/yTX+6zXQEwNGbN2on04iPXchaaEl97ei9ADCpo9OPCiUVqrliEPkUBTU/iH0mPS9faRsMuNmv6EOnpoPRFm+3+agD/Ib6vta7Za2UfMrW9uBnaNvjeva8XDAHCT/YspY51nufjeXtMyiXvHWYwSHqSYCXS3p0LqevLkHtLUvcnMnXp00KBABu7Za0o/0gp2mb3rITzv26ylTq8ujAAqRSSYZFuDGsrLPOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pm97kA0QTHF1nI3s5oQ5v8v869bmuA/oC9oHoS2dr8=;
 b=PXT0eFmb+AofMvGA+9X0wrLhc0LMjAVqRWeINVrrbz6io3Ci0IZfvRU0MoilUQ31cbBWQFJ39pMZxyPX1uA7Gc9/ZT+XzXjLg8fYwwGbVhqLmT9EyUATFE4kxD6iQ6uWrzCJ1CPg7AabnY1LahgJR7VlR6KHxQsybm3BKT52ocs=
Received: from MN2PR10MB3374.namprd10.prod.outlook.com (2603:10b6:208:12b::29)
 by DM6PR10MB4314.namprd10.prod.outlook.com (2603:10b6:5:216::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 18:16:53 +0000
Received: from MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348]) by MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348%3]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 18:16:53 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] mm: make vmg->target consistent and further simplify commit_merge()
Date: Wed, 29 Jan 2025 18:16:38 +0000
Message-ID: <96d33b2251265da01595b97f2639f1b23fea6b2a.1738172812.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738172812.git.lorenzo.stoakes@oracle.com>
References: <cover.1738172812.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::8) To MN2PR10MB3374.namprd10.prod.outlook.com
 (2603:10b6:208:12b::29)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB3374:EE_|DM6PR10MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: 642ef9cf-743f-4399-3e67-08dd40911bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x2usHfvgl361DE7adSMbLd1lLDb7XMR4aExzQ10LfNSSZy5pnwAwFTbi8kfE?=
 =?us-ascii?Q?vpoIleu+7LkE6CDxBQLDbyttf3wFk+Aq1WANbrtz8bP7tbENhZIDmKhGV5lM?=
 =?us-ascii?Q?ezNDYNeGH0mEFsARz8VB+Qm/ThiXN5KqpVv03UNSxVznOrnjXoOp/ZQYYRaE?=
 =?us-ascii?Q?F9RYM/8DlpvxLv0JmURqyxFLuuO6W6rh4YPLp2REXdlw9yVWjO09p0zpmGQ1?=
 =?us-ascii?Q?KDed6M4mwMZa4eHbwOnW+rYawkFGZOJcMg1v4eNOIpQe+ggE4Wo/GF2KSaiX?=
 =?us-ascii?Q?2phVHWxM1gnE5dLmdV/34+Uc00r2XHhMfaDM4NI3Zqs4GUePTQzFyE5xXvrW?=
 =?us-ascii?Q?lo50iEM6YBS4x1wqQzJfbIOYGwvo6FRDZtTCI2SXwgLi5MvaFu8DEaJgXqwz?=
 =?us-ascii?Q?QzXPsUJhOYsmfSrXtd1RWzWicFMzmQsvhCKZQpsKdKPXBwiMLr9rUVaG2tNG?=
 =?us-ascii?Q?F1h7N4aX6NnhXemlpn8DqjMeZk32By6mBoRnvrg7OkXjogjBQfqof3Z2srRO?=
 =?us-ascii?Q?UeiijMkYXIWXc2AVlIcbUKcMUxUR7JDwsCCPsUWZZNWHZUCIwiKOm0BpYNbS?=
 =?us-ascii?Q?KoQ+5uNTjM963KAziJ+iIP8iZLnkGcWNm37PF70JrG4Ua042eE48zV/w6Iql?=
 =?us-ascii?Q?FHpiiDRzzNKjdviE4ZVbawVADzNICdpixApj2ykaeLgWhYmIpUK7vEOOZiQv?=
 =?us-ascii?Q?BLMcenZBIFaKOWjPEjImqHCUU0C+4I87dJKcZqXDpYXoDNcVkZVq1sm/li9X?=
 =?us-ascii?Q?BH9Fznq8AAEtWeQKJelUKR51zpwFIlJqJ/5BqL9QsIcSIXLJCazGXJcCGQ/m?=
 =?us-ascii?Q?nQtfMpQUrz0e1hiWfUhLXo5LWCVkvjnQZlWDAxhunvjxOoNlLnqeKW8AL+CG?=
 =?us-ascii?Q?VTF+aLmMwKVagX+hIXkurjk4kOgmG+qM9epLBZoGoFHQv6ujm3gCQnkKkLjm?=
 =?us-ascii?Q?vYs5hUmW5LM+31bqQYfEwPdeWhPlQYOWwqVRBS5UrOtz5CKFvBSysSN3gymC?=
 =?us-ascii?Q?B4hEP+kjpKowpvjgGBOrMyriNDuHFo5cBamnrCBsOheLS0NhcvzVZ6NiX+eX?=
 =?us-ascii?Q?FfYPRykYHgNoTl7SidFeHHHHCfKwA4IIZGBjpZubPTU0PR2/AQ2DEAvUipIy?=
 =?us-ascii?Q?e7EUSNTJRwh/e8TJlPvWAElxJZPK7iHSvBzTXoG0ftDVieCGGdCadQzIMM6u?=
 =?us-ascii?Q?RI4C0o2b/0BszElGX3N/BMmqLvl3ARqtZQedmyN/6JgC1dcIJGn6R3Lki204?=
 =?us-ascii?Q?d2n+HR+8QjLOQnoyM9aclN+ioSsrqYw0MRfbbQF5IWrHXAhV5iVfOpmmsnkI?=
 =?us-ascii?Q?gKUrbDb37AcCNMMUUZ6CKhXySDwr69E+GKlzWq0+UFc5dnQi0o9KiJCbZuR0?=
 =?us-ascii?Q?XgdkSGoWCcwoQV6+F5seZWwfegeA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB3374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OEdgRKcO/1FknuT7OEhoPZhAMpuEpd0dGHA5Tbep+GynRFIkoq9To9LoidWT?=
 =?us-ascii?Q?Wq8mGkpJj8a1Zy3MLidIo0MTZrzazHoiwEOljbD0jBlmUF9Ib0QZYRR/Ojw8?=
 =?us-ascii?Q?BCvXJC1kuUGzTWyjiX54mW14OINLxqvOnkD4XcnjkyG4ip2LP3G5l/ijDH5f?=
 =?us-ascii?Q?cbf1hn52ESddzkFkNHnirB1yy8XdIIJ+CqzDqPFSEzQTyEBdZP7a15GHI+Ig?=
 =?us-ascii?Q?2V1W3NMULsag054mCslLoiwFWt5TgVuLhkKOooOEly6f6s6rq+P87YVFRMAL?=
 =?us-ascii?Q?PM4HcphcuFpM9unmZRchvqqQkNjaoISr9Q6aWgdDQ0FaHCgXxszY+OQJoTMq?=
 =?us-ascii?Q?KHdY6WDZ4vjEE9QAFX7tPFdZPQTm06ZRAPz3gxQLGJUvtE9IlZ6DMiYE9p1I?=
 =?us-ascii?Q?kFKVeGhyTUEFccOgwM6vkWakdOO0XqTCeaf4dPr2ufPyLF37PWruuUeyWsVR?=
 =?us-ascii?Q?02AiegGUVWaEZ+IJBaK/6nRYY4BpPrnwgzdkd1XGcXmn0xWwBKX2a4jlG126?=
 =?us-ascii?Q?hlEYcT6WNIirsz+NZxp6DSr7OdZ3JXkr4NWo7EzT/lzwTD4LmU+2iD11PhGc?=
 =?us-ascii?Q?bJrL8ykKh1WichG9HaO1TITI9aVgZI4uj5Wou4Cb9BqJcbaMyANvNSw7SqSG?=
 =?us-ascii?Q?22EQMWcVnGiH2idnfRN5nmjIGl9kbz+6jfI8Fa+IM2YTKiaTLeL3TAa8a2go?=
 =?us-ascii?Q?ZYaisNRYcuvM8ikK5Ufl6ow8tUKreobkwNPZW3/8D4fN5DZv8rsafl4bDHu2?=
 =?us-ascii?Q?NwJb4v8N2bCuFeMFPPF6Le5W/eAJqUpXT7Y9G9mMsVzmALz+EhIcXI5MZ5qp?=
 =?us-ascii?Q?hKgFsVOPmf2/AlnYJjzguS7Vq8kXtd9PyymDMe8CqGnj1HHRyD0XNAxAFdx3?=
 =?us-ascii?Q?5zDgXto4tcXt8D+xrOPq8w3sfpRfmUP7yzcJ0Q+s1gUpkfkohF48QIi7mFiI?=
 =?us-ascii?Q?pTCzF7c3ZGqSwt8MV1IqBiH5svufec5kDXK6BYz9n9gRAefbDBKKqZZ5nyrb?=
 =?us-ascii?Q?e5AKSCgQqZAeKDvhv+JUg0qZS1Csu1OB2TFpz/8QxuRd3XFm7Zksu/n6+j6U?=
 =?us-ascii?Q?tLaVGcy7KwSv+6TxW+RzgdCd3Syis6qnXsEvhRP/UWg/v2Eodvhdfutchj4P?=
 =?us-ascii?Q?a0kVGk3/2qx4Gf6ierDmSSwsM/tJma02OZ6CTzpZIjH1VO/K6MwpJU1EG5CA?=
 =?us-ascii?Q?Y7GqYGgTWCSg5Afun4JglMyQtOgfWqx58I+edfw+5S4ovN+ZUptRGmW26auD?=
 =?us-ascii?Q?C5gFJaLSljmjiMTup8K26AIhcgf/RFGExShF9dbqR69Bh2YFPOfQ9Ig+wRfA?=
 =?us-ascii?Q?HgWEA6vPCiAqtTJJeNChZaUtTTP8IpOXGRHGtPlmZX1unP8HAfWzc/g4W+Dv?=
 =?us-ascii?Q?7rJ8GqJI14N9TjQXuPU78V0Q9L0o1R6t90hPckfiz6Mfj/7p9LtTiowpC/06?=
 =?us-ascii?Q?ZR3K0dGk/uRnASmOuN2Ue1XlPgHIAiuBlh3KCoymnLpki9AT6vSYR1FKzJVy?=
 =?us-ascii?Q?b9nlCRIUlbHFsCYxmXaVqWtldlxDzRAZb4MZutmCki5ljmVxsGYPMX+0/G0S?=
 =?us-ascii?Q?ni4CkJR+VJfZTSjzujFY+afePiSWivakM8LlwkIOfr1gLcajA+WTCgIXaxbe?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nORQr74kkj20VNWgGf35Uia2FtKE8gFTGKTZqMJC/vOpy93pR6PRX+CkXyAdLRaEfbubrd0KhuRdlHE/b+UM1O4wYbcltJWC8qNsAiRHVth8foQKS65f3i9cqL1eMW9z13Yug/lKguPeyUzJmJywDAsIBozJn8bhehGOgKSaqNZo8L4dvsDKY/wqhZOWkcDNtBVNcrxpDC+KY+Ow10OT9z5VspYi3ynEus8WDSScPhzC8Ah9h5shu7lfigqlvXL/C4dRQ2fZlBHcy3/gvs3mwVmGR0XRJIpC+S6wbWYEQua6/CR0MyRKZzbJu2kALDWG5zNgB2/UA65zWzchQnz99u4I7TJ2KsdfApnXKI+pa8mVSjrpoGzBhXfVz80gJ6iq560tUoUV1j5QEgUY3drEnapLf6SjXgByZXOoUiZ+Wf+E05y6PkgUhWy0Mozo4GJcKwEuf2UpIwiZEbO0aTOzSGgocBMAHEVMg0zREDO/M1SfG3BU/3YyHkjO/ezCru89qhDaM+5vF5DUwkgUWwg8c4n1LTldfVv/9sewcq8sTAQ2ZX2XDSvAOHZABbx3Ah1n1FDOcslDRHqYMy2KANS0dvhOphjhDgEiNBWBXvaPG1Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642ef9cf-743f-4399-3e67-08dd40911bbc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:16:53.7549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgzzdQb39McVYhLsFl4Eh5CxLFjFAgku/GVMOZxBxcmJZsxjplT6AxGAAC04Un1NrK+9cKfiJOtpXKnO2F2kpv6RqRyWTMxciJnR1Gbb6/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4314
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_03,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290143
X-Proofpoint-GUID: XHzyXCLLp1lw6_oduByeG9NNMcdjbnbr
X-Proofpoint-ORIG-GUID: XHzyXCLLp1lw6_oduByeG9NNMcdjbnbr

It is confusing for vmg->target to sometimes be the target merged VMA and
in one case not.

Fix this by having commit_merge() use its awareness of the
vmg->_adjust_next_start case to know that it is manipulating a separate
vma, abstracted in the 'vma' local variable.

Place removal and adjust VMA determination logic into
init_multi_vma_prep(), as the flags give us enough information to do so,
and since this is the function that sets up the vma_prepare struct it makes
sense to do so here.

Doing this significantly simplifies commit_merge(), allowing us to
eliminate the 'merge_target' handling, initialise the VMA iterator in a
more sensible place and simply return vmg->target consistently.

This also allows us to simplify setting vmg->target in
vma_merge_existing_range() since we are then left only with two cases -
merge left (or both) where the target is vmg->prev or merge right in which
the target is vmg->next.

This makes it easy for somebody reading the code to know what VMA will
actually be the one returned and merged into and removes a great deal of
the confusing 'adjust' nonsense.

This patch has no change in functional behaviour.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/vma.c | 119 ++++++++++++++++++++++++++++---------------------------
 mm/vma.h |   6 +--
 2 files changed, 62 insertions(+), 63 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index 3fe264200b79..75bbe82b2e65 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -106,24 +106,40 @@ static inline bool are_anon_vmas_compatible(struct vm_area_struct *vma1,
  * init_multi_vma_prep() - Initializer for struct vma_prepare
  * @vp: The vma_prepare struct
  * @vma: The vma that will be altered once locked
- * @next: The next vma if it is to be adjusted
- * @remove: The first vma to be removed
- * @remove2: The second vma to be removed
+ * @vmg: The merge state that will be used to determine adjustment and VMA
+ *       removal.
  */
 static void init_multi_vma_prep(struct vma_prepare *vp,
 				struct vm_area_struct *vma,
-				struct vm_area_struct *next,
-				struct vm_area_struct *remove,
-				struct vm_area_struct *remove2)
+				struct vma_merge_struct *vmg)
 {
+	struct vm_area_struct *adjust;
+	struct vm_area_struct **remove = &vp->remove;
+
 	memset(vp, 0, sizeof(struct vma_prepare));
 	vp->vma = vma;
 	vp->anon_vma = vma->anon_vma;
-	vp->remove = remove ? remove : remove2;
-	vp->remove2 = remove ? remove2 : NULL;
-	vp->adj_next = next;
-	if (!vp->anon_vma && next)
-		vp->anon_vma = next->anon_vma;
+
+	if (vmg && vmg->__remove_middle) {
+		*remove = vmg->middle;
+		remove = &vp->remove2;
+	}
+	if (vmg && vmg->__remove_next)
+		*remove = vmg->next;
+
+	if (vmg && vmg->__adjust_middle_start)
+		adjust = vmg->middle;
+	else if (vmg && vmg->__adjust_next_start)
+		adjust = vmg->next;
+	else
+		adjust = NULL;
+
+	vp->adj_next = adjust;
+	if (!vp->anon_vma && adjust)
+		vp->anon_vma = adjust->anon_vma;
+
+	VM_WARN_ON(vp->anon_vma && adjust && adjust->anon_vma &&
+		   vp->anon_vma != adjust->anon_vma);

 	vp->file = vma->vm_file;
 	if (vp->file)
@@ -360,7 +376,7 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
  */
 static void init_vma_prep(struct vma_prepare *vp, struct vm_area_struct *vma)
 {
-	init_multi_vma_prep(vp, vma, NULL, NULL, NULL);
+	init_multi_vma_prep(vp, vma, NULL);
 }

 /*
@@ -634,76 +650,63 @@ void validate_mm(struct mm_struct *mm)
  */
 static struct vm_area_struct *commit_merge(struct vma_merge_struct *vmg)
 {
-	struct vm_area_struct *remove = NULL;
-	struct vm_area_struct *remove2 = NULL;
+	struct vm_area_struct *vma;
 	struct vma_prepare vp;
-	struct vm_area_struct *adjust = NULL;
+	struct vm_area_struct *adjust;
 	long adj_start;
-	bool merge_target;

 	/*
 	 * If modifying an existing VMA and we don't remove vmg->middle, then we
 	 * shrink the adjacent VMA.
 	 */
 	if (vmg->__adjust_middle_start) {
+		vma = vmg->target;
 		adjust = vmg->middle;
 		/* The POSITIVE value by which we offset vmg->middle->vm_start. */
 		adj_start = vmg->end - vmg->middle->vm_start;
-		merge_target = true;
+
+		 /* Note: vma iterator must be pointing to 'start'. */
+		vma_iter_config(vmg->vmi, vmg->start, vmg->end);
 	} else if (vmg->__adjust_next_start) {
+		/*
+		 * In this case alone, the VMA we manipulate is vmg->middle, but
+		 * we ultimately return vmg->next.
+		 */
+		vma = vmg->middle;
 		adjust = vmg->next;
 		/* The NEGATIVE value by which we offset vmg->next->vm_start. */
 		adj_start = -(vmg->middle->vm_end - vmg->end);
-		/*
-		 * In all cases but this - merge right, shrink next - we write
-		 * vmg->target to the maple tree and return this as the merged VMA.
-		 */
-		merge_target = false;
+
+		vma_iter_config(vmg->vmi, vmg->next->vm_start + adj_start,
+				vmg->next->vm_end);
 	} else {
+		vma = vmg->target;
 		adjust = NULL;
 		adj_start = 0;
-		merge_target = true;
-	}
-
-	if (vmg->__remove_middle)
-		remove = vmg->middle;
-	if (vmg->__remove_next)
-		remove2 = vmg->next;
-
-	init_multi_vma_prep(&vp, vmg->target, adjust, remove, remove2);

-	VM_WARN_ON(vp.anon_vma && adjust && adjust->anon_vma &&
-		   vp.anon_vma != adjust->anon_vma);
-
-	if (merge_target) {
-		/* Note: vma iterator must be pointing to 'start'. */
+		 /* Note: vma iterator must be pointing to 'start'. */
 		vma_iter_config(vmg->vmi, vmg->start, vmg->end);
-	} else {
-		vma_iter_config(vmg->vmi, adjust->vm_start + adj_start,
-				adjust->vm_end);
 	}

-	if (vma_iter_prealloc(vmg->vmi, vmg->target))
+	init_multi_vma_prep(&vp, vma, vmg);
+
+	if (vma_iter_prealloc(vmg->vmi, vma))
 		return NULL;

 	vma_prepare(&vp);
-	vma_adjust_trans_huge(vmg->target, vmg->start, vmg->end, adj_start);
-	vma_set_range(vmg->target, vmg->start, vmg->end, vmg->pgoff);
-
-	if (merge_target)
-		vma_iter_store(vmg->vmi, vmg->target);
+	vma_adjust_trans_huge(vma, vmg->start, vmg->end, adj_start);
+	vma_set_range(vma, vmg->start, vmg->end, vmg->pgoff);

 	if (adj_start) {
 		adjust->vm_start += adj_start;
 		adjust->vm_pgoff += PHYS_PFN(adj_start);
-
-		if (!merge_target)
-			vma_iter_store(vmg->vmi, adjust);
 	}

-	vma_complete(&vp, vmg->vmi, vmg->target->vm_mm);
+	vma_iter_store(vmg->vmi, vmg->target);
+
+	vma_complete(&vp, vmg->vmi, vma->vm_mm);

-	return merge_target ? vmg->target : vmg->next;
+	return vmg->target;
 }

 /* We can only remove VMAs when merging if they do not have a close hook. */
@@ -833,11 +836,15 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	/* No matter what happens, we will be adjusting middle. */
 	vma_start_write(middle);

-	if (merge_left)
-		vma_start_write(prev);
-
-	if (merge_right)
+	if (merge_right) {
 		vma_start_write(next);
+		vmg->target = next;
+	}
+
+	if (merge_left) {
+		vma_start_write(prev);
+		vmg->target = prev;
+	}

 	if (merge_both) {
 		/*
@@ -847,7 +854,6 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		 *  extend  delete  delete
 		 */

-		vmg->target = prev;
 		vmg->start = prev->vm_start;
 		vmg->end = next->vm_end;
 		vmg->pgoff = prev->vm_pgoff;
@@ -868,7 +874,6 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		 *  extend shrink/delete
 		 */

-		vmg->target = prev;
 		vmg->start = prev->vm_start;
 		vmg->pgoff = prev->vm_pgoff;

@@ -892,7 +897,6 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		VM_WARN_ON_VMG(vmg->start > middle->vm_start && prev && middle != prev, vmg);

 		if (vmg->__remove_middle) {
-			vmg->target = next;
 			vmg->end = next->vm_end;
 			vmg->pgoff = next->vm_pgoff - pglen;
 		} else {
@@ -903,7 +907,6 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 			 * merged VMA is NOT vmg->target, but rather vmg->next.
 			 */
 			vmg->__adjust_next_start = true;
-			vmg->target = middle;
 			vmg->start = middle->vm_start;
 			vmg->end = start;
 			vmg->pgoff = middle->vm_pgoff;
diff --git a/mm/vma.h b/mm/vma.h
index e18487797fa4..e55e68abfbe3 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -82,11 +82,7 @@ struct vma_merge_struct {
 	struct vm_area_struct *prev;
 	struct vm_area_struct *middle;
 	struct vm_area_struct *next;
-	/*
-	 * This is the VMA we ultimately target to become the merged VMA, except
-	 * for the one exception of merge right, shrink next (for details of
-	 * this scenario see vma_merge_existing_range()).
-	 */
+	/* This is the VMA we ultimately target to become the merged VMA. */
 	struct vm_area_struct *target;
 	/*
 	 * Initially, the start, end, pgoff fields are provided by the caller
--
2.48.1
