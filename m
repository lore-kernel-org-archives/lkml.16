Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8124C265632
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241174; cv=fail; b=SDac/g+c+kJOg1tr9yt0PE0I91oSslqj1+wRLqjqsXPI1RA48r+eEPCai0krRTOOlc2wB4ZMmS9IkopIzohRd0LhM+I2H9TvasTL60NJ32wwDDT6pj56LC/IMJZCgO1eilx1tmFMlBoOGBm+gjtgVef5tMRmVSi/mooTkhXwRF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241174; c=relaxed/simple;
	bh=e6pJ5Oa9St6Bi2ubbsyyUlqBWG/IdnpgfCawpFu3lGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=koT6rAaoZUnVfbsgMlcS4wsQ28kZE4CWpYIZYaUVJW6MYMbQv6v1/IiCmdxJqivWmNGz/h6SvAtdDQj4RIh0kXsvkB8xe1aLohek4knJ1jFstoqLTDf2v8gCzqtrPbsGkgUD7PLk0DRDvmYAPf/hriNr5oXt69fSXZHIikhUe8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UixSYqal; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kRjim1LX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UixSYqal";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kRjim1LX"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LCAmfd015781;
	Mon, 21 Apr 2025 13:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=zCds2idwCngYnJz/z2
	WuUxhIcSh1oWn3WPVsLe4L3iA=; b=UixSYqalieO9YKPk1kXK9GVHMxr5oKvN0/
	qJKUIJCXvYYohIe+Xub1gXDNQtHH0nVkgtpjtK8Mhu4kXm80+cOvx6NNND6Xr3VR
	l6VuIAc2eq4mSvKw5RajnhAZpKaKbpk51PS5DHZC8NNcflqyYQ2b8U0ynAf8Ny0e
	EumnByBeRs94lYN8akqo7DkV1byofAg0kF6Gzy/xNXcgVMygElmoXnUHwJVk8NWO
	aBofK4hH+SHTdGIQNJRdTExCynH4vU70Kv7CaBUMy1+n9vgTNpZNmMUdrylQDpKj
	FcdL42q5SPI8pjqUqPJAP2tTqnY3IL8v/FCLl88KhN4prxD+G00g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4642e0af3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 13:12:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53LD77RM010848;
	Mon, 21 Apr 2025 13:12:34 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012032.outbound.protection.outlook.com [40.93.1.32])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 464298h1yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 13:12:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2cP33QgcR2HwxVP5tnVb7OvcbHnFZelyfk+kb352IZTsAdCb9aOCn70E0zNChGhjdVxOaUet4IlgUvO1JwGwYR7lBSr8xPJKuotj/Bevuzkd+Rk9VJI2qaD3i2V7/DSq159Fxqc9COXHJ8a3+88BgwSP9bHRekI0wcYnZ1LrMvINJNlpxKxMC/ytLkciCSTFHTAj3QFZATWpWJlpPzcwzf6gSyjWfRN+FooXXsHYJFSD1xVyo+ti5m/ut5DtdL4ydx2aqmFPe9UIfI0W70H38fHIbN+syrRo7DKx4t5ttgYSk9MraCC+jss+mcjw9SClrIeZjQL+4AKsi/3InGhNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCds2idwCngYnJz/z2WuUxhIcSh1oWn3WPVsLe4L3iA=;
 b=vc8wmnjoIdXn3ieHm2jt01HOAi4tNNQgLRL3isXXNhaUS5rFfLdtKOZR+EHtjs3g1N237G31pZQZu0Vqv6BvgOdRCLgh1BQYBIzDFWST/5sU1XIeXNoiS60dyM1PLqZClUMwLRjwWA+OS0G5slI63T4anZzIJXzhzWSQ8O504rW4OdElGERqGmi6S/XW11NTIgpJo1RCVXwwvnoj9Do7OfYmZjXTpsyz8k9viXzt0hnaEz91g1RlcFhYruLQJIWK39b8GOunVBqehJw99l+KEquTzkLVQii3Y9V8/ZgsMak0P3pjGCKXZhHuVBuiKhmKtfDODa2SjxO0x06k6s4HyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCds2idwCngYnJz/z2WuUxhIcSh1oWn3WPVsLe4L3iA=;
 b=kRjim1LXDkxNqF/HRxEDn0q3/1ry7U9x64ZooaP0RXfns139Nj3Csk/SvICoJZssYVJ/fn1HsSFQNToMabTQwIpzsf4sZiHxn6Onm0OawZ/pWbiSctByvPA3iFg42D6dBOB/6cemWAG4jp2Q/IzlueA8A0AF9sEK5nIGfnBp0r8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM6PR10MB4201.namprd10.prod.outlook.com (2603:10b6:5:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 13:12:31 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:12:31 +0000
Date: Mon, 21 Apr 2025 14:12:28 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/7] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <f574e997-5276-415e-bdf3-8d347d120bf1@lucifer.local>
References: <cover.1742478846.git.lorenzo.stoakes@oracle.com>
 <d10037699391c42a4943f578c2a0bca890640f30.1742478846.git.lorenzo.stoakes@oracle.com>
 <CAG48ez3CiRTUv4Qwy_UQzQuEDtUoPVVXnuPyiWoAhWVqkF3VTA@mail.gmail.com>
 <182bf1ce-1b67-4243-854b-4d0c26aae563@redhat.com>
 <2bdf7ac4-b359-420f-94fe-466ae98c4a49@lucifer.local>
 <335b3432-af06-420f-b575-7a1d92148f6b@redhat.com>
 <f718ccd0-7b67-4c82-87e7-720d905c3595@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f718ccd0-7b67-4c82-87e7-720d905c3595@lucifer.local>
X-ClientProxiedBy: LO4P123CA0180.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM6PR10MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f9bedb-4e1a-4003-7c9c-08dd80d62c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tNMCDlP3SFUSqFs/hg+piYcKKpEMmVDftxxF9RDohLuuPBcQF5UxQvNvWBNU?=
 =?us-ascii?Q?xYlKPP6V9oeSKC/fut5GjGGmXdAnYVExCZYFBHoT30HwDNbu+bZ/xEX8QKDU?=
 =?us-ascii?Q?3033XV6dfekRaGEhlx2IA8SZ2HGEd+gZoSXwjBb6OU1M1WAmoB/9hWipGnJK?=
 =?us-ascii?Q?ZbrmR3HIooVUUohkV5QmjugVrm8rutyzIhIki9k/BNEFcLweY9wZh/UnmNmf?=
 =?us-ascii?Q?ydmkx31r8/q6kKZRDYwYK3Im2Qc7DcGJThG7mUMvEUYlmgbjZrKiCC4ZhPGl?=
 =?us-ascii?Q?ULXqHiU7+0UaHO5bQwXwqI4dr9YmSHgjdJFjoquOkjRjioRaI5ZscB64MKIW?=
 =?us-ascii?Q?ReQXz6WCuoIvsvpucZUjcV9BN2IRbhKIscMSKoc7fLEfoau3mrAWGovqktlA?=
 =?us-ascii?Q?MCW6985KeRbHjx6YliVdWzb41cw1AtCI62iYsT/cGtD1+NWz6Ou45gofXvU2?=
 =?us-ascii?Q?mvE3Cf+MnDWJfoJEA+bH+WXkNbBQ6AQGuGRO1qjSb23ue2fb3qlvZKTiedr2?=
 =?us-ascii?Q?h0g+YBY+aLvuKpDfJdE3rQoXM3MpDDouwMnyTHD9K6xwL3l5p5z9lXCiYsX6?=
 =?us-ascii?Q?Mi/PmNd7/Uzhy/+V6mlyq4hxYJs3RTKhAwBHOkvdV6NTf0LaLJlFU2tiUYWd?=
 =?us-ascii?Q?sLXNWjlkYebbhs8Oou16yk3a3bBPGJ3AxywYOY4yr+CVrvu+gDwf4NkdSpKv?=
 =?us-ascii?Q?sFwgi0jIpC6QuDQ9DTHvHdVoi94J6uhDo8GM1a/EYTQXDDPgpRWTzU3Re5Ok?=
 =?us-ascii?Q?u/THgz+vverVWmjbubqPQniAm2ibEzVy7OojKgNl/XWEdtKpzX1XzUkQhqP7?=
 =?us-ascii?Q?tX6gaonnCicF8vBlU+bYkhZaQmG0ZkSKgeyn2aSYHFozxaS3I29GK1e7oGBC?=
 =?us-ascii?Q?ihxR9bBrFTM0xMjyLFv19SniLnnRN9tQFzYuPRUIXvOVOlgsqqF3paacbs5E?=
 =?us-ascii?Q?KmGGiF6Y9Qi+jtdx004OBT8D+5pstHtp+1f08ubVsCAwfQOiMQxCxAwRVmuh?=
 =?us-ascii?Q?hTPp8iUGXMEcqWmkcsyGCBxy+sBWEJNf+MK++4OapZ15V5EKegHOmHa6HDPl?=
 =?us-ascii?Q?AYDxLKhbw2c/3Hm8W1J+3y+ef9CdU46ieJ3eUPqRNZyHWwbNrh/h10aAxfKy?=
 =?us-ascii?Q?Ta6HRg03xls4zwNpvQaUSMh04a9/jAnVXPc7vIRYn0bHnKnBSxI+Uawpv4hL?=
 =?us-ascii?Q?ZAQ0hFYJF8tBYB9f4Gk8h2EobhSWkv3qaat8vUQ7smJbJk9N5HqzWV4qqrEf?=
 =?us-ascii?Q?MORZTgMFZDNQSgGgB7rdBTDEOZ5DogXhU854tBqYUT41hWRFqHqoELoPa4y9?=
 =?us-ascii?Q?T6Siy5sFhtfeC4fE+yo9e+cwo5Qi33k2zs+/ebFzgekP3Rhe+QEG5xWsi2pb?=
 =?us-ascii?Q?jm956lvmB0JlgQHIR8IO9taVJJCNpP6XIYFuCQpGttbnDZSlcpGsb/EyhyGC?=
 =?us-ascii?Q?BVjymOxY1FU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D4a0+4Vy8Bk3+l9b1X2Vp6m2GM7p+hf3zCvAq7u0Vp7Gy/Eay0rEgtOb0M8g?=
 =?us-ascii?Q?oOA2+AspfjOrrePAOUZsQCsEuh0N/LkCbBxGAFeS/zeldFIm0NZgzFu+7gWA?=
 =?us-ascii?Q?diyzS/JP1ZyUfWavd28gMrnOyEw65+xlY54OjwRpkM/CWKuujfrACs4NaL9k?=
 =?us-ascii?Q?Ncv+A/OYXOWlzTPmHeUGJNZf6DMGgQkyqOE0ctPiDptV6fWZV089nOsN2Ntq?=
 =?us-ascii?Q?hAAciiVQH2FfEjr1lEyPLipDEWBkPgQvPFs6hqw/k1j5iqZknePiKzBx3GWu?=
 =?us-ascii?Q?eZ8ACoeNtLtpQxlD6SO93RQJfeRAaRB+UNqgdIYYv4mmgk1Wo0KcGUw3gMYw?=
 =?us-ascii?Q?qwHNLpxEIvBjjp6GfiggNM//CvdY8vyOPhJ7GXakUGbJUUpc/A/mKbWh2Zgm?=
 =?us-ascii?Q?nVfNrBkizM7iNT2LzQcJxUc7GyVVkUTQ6rcVQBxjKNytA4Nzbn4jVrkJQ8MO?=
 =?us-ascii?Q?Jx49wZNNrTrVc1BI4ZABnxS32Waz/ix3EIf3mSptQgnr2Qbnlp6qUoa9OvHW?=
 =?us-ascii?Q?Od9/wEnVqOs7FNQblu0RN0VD9DEpk9pS0WaBwGuBBxw/nsLA+xxLFaMaDbnv?=
 =?us-ascii?Q?Z0W2UXUFifa2Rmz6B1vZMPaY/KPWAsMloc8ctCduLkXl1dUpShOZWgfXHlAC?=
 =?us-ascii?Q?M7LH5edv6PHgRBRqImdYkPiqLj3Bx+6xzjQwiqfWQAFoz/4uN4QdhOP7QnrS?=
 =?us-ascii?Q?3b7HD6bGAE75kevw56C+SUPP2L2A6jppcYBZWGNjjKN18ZC69226eGtzSVyq?=
 =?us-ascii?Q?4LOIeOU3cOB8DkOEDUFqE1+xDWr9Ra+ede6EIZr8w6OUUsCaqKwwW4ffAsd4?=
 =?us-ascii?Q?hn7hwB+glp5VGIaSXLiq4r+XGn93yK+062rXTyGCTbf/QHvz3ZbzB1QJjQr/?=
 =?us-ascii?Q?O0g3/mrN6lUiXfy5VB5LsRkqN7BLBdMxvLXdYUMaqgMjeHub6jR4TJphOTQ4?=
 =?us-ascii?Q?Zm+P/6Nhg/e8aFeFEeXPUXywqdrUyUlC8HKBFD+tF+id4cuu0bMI0AWre/+W?=
 =?us-ascii?Q?w0Az5oyDUwkpc1FMU+MlwBrtKMux+51hpcyN9ZoWWly7xhBFGqr3aActLdap?=
 =?us-ascii?Q?C1c6+R8YLbkXPsmx/YXtxWgJF/tX/rO3f/LX9rr2wa5mxLsuuegFLdAFSJ//?=
 =?us-ascii?Q?wZrUwcKI50ZYbWlLZT4OdJrmlSRx7aCZoxXu5vLFJZiNRIQfU5ZNA2p/JQGX?=
 =?us-ascii?Q?z3HDljMAMWCxEtRMliDJBRuCWo87j98GaZXrD9xg6gmXFFQhEiHtxGyiNgKP?=
 =?us-ascii?Q?KJstZASysYXyukYI9KzvuIHvl1y552spk5t+/rS8/T9Obfzc/nl7w/sl3D+u?=
 =?us-ascii?Q?x8CD9uXlS0etHuUjNhjC2TGXsPdWXge2MOtKdwXTbQN9oF0XVOOQEuh5pX/m?=
 =?us-ascii?Q?OqpY8DYA2a2OeKw5DbcGxcIOOGbiq+X2km5uAyJZfVrSbMdXSiduzIscXWxW?=
 =?us-ascii?Q?OYUshd9duh+ZQN+LP05ROf42/IV7guVtoJ43HacPv8U+Jut5DdtYrSFrye8i?=
 =?us-ascii?Q?pSMxPuTZRwCIxuRsXBKg/gLy8g46VXY5GPu+4H/KvAXHWzPW4f0FaAqxQqh7?=
 =?us-ascii?Q?q7DP6qhi3oiVZhOL0InBS1xrMmMdsvwoAagAYRDt/hXnxAOw1WIty3FJ+dAD?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4gSFBAh6AP2CzgLf5gDksRxHHMVNRlW17QuD5+I5EM6VYXkOjwSZUSRoIlWC2hLWWE95fK7AmBAyM0wflBk6LsEWF63mpwJX+4I3aiwDqNHsg0uodEMGk9kaWy4xjE24GXJqOnuXD0H3l7LIEYKKVsfd5N3bPirC2QF7TbLbaapU5G/RCkrVWc6eluUkKhUQh6otinO+elrPO0fnWcBZMdQg0YbSDE6DWMPs3btpPySYDsSdVjyym1fQewl97Ecu/ybJkqZ0PtFR2h5+N4D8U9BSZtDj4LQ8W8Qgpno/Np9oCNC4P34ePOHkxFaRS6tiekpzZbgElPbK2ob21NBDEF0x0LoZNKqWoYaT4K1+OCd++paGtzFWWwCYKY0jxxIKucPdtXMCA/uVY22yn59reN81ZVxYzFoOoEuBHIR2bxkCpDKXTUxmHQmsKZLp86DYEF0ExLVtR4KWe2c+/5NIRCiDmbvZwIT+kgjX1qn0RW2ei7ODToRxOOrml1oxtwIo9OUJpx/vPDSd//rhQ6bwCt1+eNi+lTk+sMCJhnh/Ln1zjq54tGB3pv8X3isBLB4rtxbX+pq1ODGIxcmjbVV7dhPYn/wHfxv/96MGM2NPW84=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f9bedb-4e1a-4003-7c9c-08dd80d62c9e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:12:31.8465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXm3poP6OCAFFirKicBuJjX8v2S+MzHgco0L4lOM1sjCzh6mwNN+tgNJNufKirqRkF97v2SKjXv6AGiLESzKt7+S0PG0hKEcuAKT5FwVbv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4201
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504210102
X-Proofpoint-GUID: ZKBhHNeB_4dLsd5n29vtGNsouIso0QNu
X-Proofpoint-ORIG-GUID: ZKBhHNeB_4dLsd5n29vtGNsouIso0QNu

On Mon, Mar 31, 2025 at 03:50:59PM +0100, Lorenzo Stoakes wrote:
> On Sun, Mar 23, 2025 at 01:49:07PM +0100, David Hildenbrand wrote:
> > > >
> > > > c)  In -next, there is now be the option to use folio lock +
> > > > folio_maybe_mapped_shared() == false. But it doesn't tell you into how many
> > > > VMAs a large folio is mapped into.
> > > >
> > > > In the following case:
> > > >
> > > > [       folio     ]
> > > > [ VMA#1 ] [ VMA#2 ]
> > > >
> > > > c) would not tell you if you are fine modifying the folio when moving VMA#2.
> > >
> > > Right, I feel like prior checks made should assert this is not the case,
> > > however?  But mapcount check should be a last ditch assurance?
> >
> > Something nice might be hiding in c) that might be able to handle a single
> > folio being covered by multiple vmas.
> >
> > I was thinking about the following:
> >
> > [       folio0     ]
> > [       VMA#0      ]
> >
> > Then we do a partial (old-school) mremap()
> >
> > [ folio0 ]               [ folio0 ]
> > [ VMA#1  ]               [ VMA#2  ]
> >
> > To then extend VMA#1 and fault in pages
> >
> > [ folio0 ][ folio1 ]         [ folio0 ]
> > [      VMA#1       ]         [ VMA#2  ]
> >
> > If that is possible (did not try!, maybe something prevents us from
> > extending VMA#1) mremap(MREMAP_RELOCATE_ANON) of VMA#1  / VMA#2 cannot work.
> >
> > We'd have to detect that scenario (partial mremap). You might be doing that
> > with the anon-vma magic, something different might be: Assume we flag large
> > folios if they were partially mremapped in any process.
>
> Do we have spare folio flags? :)) I always lose track of the situation with this
> and Matthew's levels of tolerance for it :P
>
> >
> > Then (with folio lock only)
> >
> > 1) folio_maybe_mapped_shared() == false: mapped into single process

Am looking at this series again :) This function is very handy thanks, will
use in the upcoming RFCv2!

> > 2) folio_maybe_partially_mremaped() == false: not scattered in virtual
> >    address space

This is intriguing, I think perhaps best to defer this to a later date :)
have added a personal todo accordingly. We are able to fairly reasonably
detect this case right now so it's not urgent.

> >
> > It would be sufficient to check if the folio fully falls into the memap()
> > range to decide if we can adjust the folio index etc.
> >
> > We *might* be able to use that in the COW-reuse path for large folios to
> > perform a folio_move_anon_rmap(), which we currently only perform for small
> > folios / PMD-mapped folios (single mapping). Not sure yet if actually
> > multiple VMAs are involved.
>
> Interesting... this is the wp_can_reuse_anon_folio() stuff? I'll have a look
> into that!
>
> I'm concerned about partial cases moreso though, e.g.:
>
>      mremap this
>     <----------->
> [       folio0     ]
> [       VMA#0      ]
>
> I mean, I'm leaning more towards just breaking up the folio, especialy if we
> consider a case like a biiig range:
>
>                        mremap this
>     <--------------------------------------------------->
> [ folio0 ][ folio1 ][ folio2 ][ folio3 ][ folio4 ][ folio5 ] (say order-9 each)
> [                           VMA#0                          ]
>
> Then at this point, refusing to do the whole thing seems maybe a bad idea, at
> which point splitting the folios for folio0, 5 might be sensible.
>
> I guess a user is saying 'please, I really care about merging' so might well be
> willing to tolerate losing some of the huge page benefits, at least at the edges
> here.
>
> >
> >
> >
> > Just throwing it out there ...
> > >
> > > (actually at least one of the 'prior checks' for large folios are added in a
> > > later commit but still :P)
> >
> >
> > Yeah, I'm looking at the bigger picture; small folios are easy :P
>
> Yeah, back when life was simpler... :P
>
> >
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >
>
> Cheers, Lorenzo
