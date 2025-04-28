Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CC3253B43
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745836163; cv=fail; b=lkgFBya0CBpTzqFc6LGglsR1hMbXZ0zjD1ofR1sAioqYTYeIyITnlGc9xrsfj5mkH/UHkuFIlC+yDL62O19N7wfPinsgUTAas/kxBo9QpvHLHAdQr+lz7en8qGC5ZFjcJf/Lkuv89M/hnt1sD3U53Lt3HItaqFE+B6AzSs1UPf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745836163; c=relaxed/simple;
	bh=chWsVYiIy2BVid2Qmjhf9ZMjnaGl/hcWz5yIe3Otugc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hdsHRVgljXFHkVbtEFCLyf0VhpeyaoGIezFSSUrrHaVrWSfigfUjVx1PP4OpOJJYfh/JNM9/ilkm5DyQs+oi/XtzbnbVFHxQ10nJmISN1rCXwlVsffFz20s6cBNiwqFDc00bUsyD6gZbXzDJACS85QxJtgITl61mjyf6wHD16ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F2ZlVmh5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cB5jolu4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F2ZlVmh5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cB5jolu4"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAMitW026460;
	Mon, 28 Apr 2025 10:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=j7X215ss49UwBRpPc5
	HjmNCf52LgfTrFSkpwK6GJo4c=; b=F2ZlVmh5m3fvpkDdlzHUH0oKsU5+KBlIHi
	gWWNckglZ+p1EE3JtFCOdQa7GWgchCDeCSYkoigDpRhoVHdh7RtYQaSuzLsO9NIp
	nVXvAlGuouNkHRya5HfNG6cw50z9mMBkbRd5N86RC+N4DG6uuE9JB3zZndpBKZIS
	rK0W3IpJe+afJmxKJJkesG0DuIiesip4xxg3JITDAW7BjgYECIAEsXhRX2emv3p+
	Y9ZhFFBtozgrWY2V6OhrT/Sf+MbwtL/NXHAZy0PSAbwp9YaW8qp7yAmA7/EEnFzh
	WVcytFsp4I/+cb7yzj7aP6sPrFuyRJe2JX1uhcNM/EoRuLjj+8gA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46a7nbg17n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 10:29:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9pNTD028457;
	Mon, 28 Apr 2025 10:29:07 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012012.outbound.protection.outlook.com [40.93.14.12])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nx87e6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 10:29:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiQCSzCGllfxp8EFOq6G+wNp91WFIyT4BXCgNOlANCAjv563DCKVjTXSBI4cjo/OcmJVbaxpPDkHuhGBOmw8EkI9ptg7oaImIGW4zj9RYojhe/qIOgrWIHZ2QcB+7AKmP1PcieKzKMPhz0NeFAirx/zDIOxAhcpZY0AcPxlGVgYDvOIne79Rurud+CypfRENVIxR9csK401TRNRKwjW/LmWacO4XeejNKON9YILXQ8ne0PxIRJuf/hDwsejLdahdJmCKvkweAYqu+QlJiK5ZN/VREbTUx1fvUAZ0sQzXtskNxX3mjHvpMxiJr7koY/nAXInC1eFVaKjPgrODg5H5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7X215ss49UwBRpPc5HjmNCf52LgfTrFSkpwK6GJo4c=;
 b=gulrDa24yeksesna3HuIs48qeB+f8NsfEv0YK5aQqxY4UWUqzWpCb0+BOiNcvpBzlCPidtK//jqVYD5cxL2Dnwy6IYsRWxIrXIoemKQByuCffxrQ/RGOZffXJD09xAEhxPjAJAxMGi5Cl+Mwws4TsXESpLrPcAqBNTBWEmD5rWTPGlFr6DF3yJWTcGtsLmNTNOsND1d1PPHs/zzKAEh5swGXxMwkrsScwbMaDaAVLynCKMceJnmrktb+LArDtSRJWNOplcaR2Axi01g+iwE+/WuW0wMOweJXIjZftp6uVgaa1goClMCSFqAYmHuZ5skMGcC5Uyx7IPDRDWTb4ySoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7X215ss49UwBRpPc5HjmNCf52LgfTrFSkpwK6GJo4c=;
 b=cB5jolu4S572Avw7Ua3egodVAe5dC1g6LNcmtUUagIRbSAMmCzCdwEcohtivT0RTbh0pHxKsgxpcVKt0OlRfoWHBuc/qCv3vaUoh1yxxi18DlthasChPov+t+kuydj9M/HF+X90RHu3LL3o7xRyOFJgTtuZFtMeWbyvaAzv8QuI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CYYPR10MB7567.namprd10.prod.outlook.com (2603:10b6:930:be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 10:29:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 10:29:04 +0000
Date: Mon, 28 Apr 2025 11:29:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add core mm section
Message-ID: <818e361b-1a05-4626-81cd-b6ec67673ba7@lucifer.local>
References: <20250423123042.59082-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423123042.59082-1-lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0459.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CYYPR10MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: d98999f6-43f5-4448-2d0d-08dd863f802e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+2Chgoesgu9VRlsos9Dpap4/Ta/3hWybAzb+Uejc06Un4JOFXLfR0OTO5b/U?=
 =?us-ascii?Q?I4Tt5PTigAJp8T9zCH1nI6CLwxaBUdfOt4omZsUrjpjTojpcBZYpFt1jq38e?=
 =?us-ascii?Q?4lgiiI61btRp1hMrQP6cjbjQP/gdY9Kcj7VD0taTq88KdvtZJ4/G9O6aGJsl?=
 =?us-ascii?Q?wQ3AgSdzK328d3LgEZIHbhe1OP85Zx+xJuIHft29hM/XDXhUv2yG4zTKyERF?=
 =?us-ascii?Q?jtkOvbpE1EdfZlkg4XKbH3jDVCPvGz78EPn5HFTQCLWXIojXIXtuIDvUYtN2?=
 =?us-ascii?Q?UjEw0DV7ve4xMk1ey/w1uTeSr5pz4RyZtQ9tDIQKvE0FFEEYM1gAazSH2oSz?=
 =?us-ascii?Q?cBrz7UkGp6SxpfGIyJrMCDoZGOjNWD/oJIrJ3jziYS/Q/hB9LcY8SDPCmQuu?=
 =?us-ascii?Q?CQFCOsVgU+lG5OVowNeTmJujA9lXh3zBIJ3GPTWy33vvN3Y5UIQpH+KJ3xrc?=
 =?us-ascii?Q?LYslcamcNdBsL5KdooGeHcLyiN2kfgrDTL6nkPatvF7Tx7nkXnvLySklMd9O?=
 =?us-ascii?Q?oUZHTDeFcjgp44pHMr2AEt0Z6Qj7V7WPhguVIp3pKt6QZ6+KTy7XIJok1pnd?=
 =?us-ascii?Q?kBHl+oHbwFIo8pOya9gjpTzBUVsMZ1tWp4FLAgJ0kvIz/Fc25qTbtBOKNrjY?=
 =?us-ascii?Q?pINwWCZBJiUG5JkZtZLg6sNm6GBe+TVU0blT5A9gFMC2SlBJEKmUoAch4rCO?=
 =?us-ascii?Q?Pf9/x6eNug7wEoImM3JW0YCmYKCFu0B+WS2xXmhVkDLnXwBK4OhZgnuIC8Jx?=
 =?us-ascii?Q?tdcluFQ1Y1GUQqeQ1ksEjctokRS2FvQAfkCNnxvFftn+9JL5WRxDr7783iUh?=
 =?us-ascii?Q?EusDjKpvQdn86O86Q8mOA1+chBWZDRiecXb/Ndh1MA9DcWMQmCN9ryjQ1ssD?=
 =?us-ascii?Q?6GyYAVocVHYgWxrTPtrM+b57shwykKajBO9LmqUFyNbd/IXaZRgv44kOUbLJ?=
 =?us-ascii?Q?r2f8vAR6oGOfUd3grNb1RN+snL+G+VbBZTG3LRDPlX5jtdPYKE1JgWQnI2Vb?=
 =?us-ascii?Q?yJpUNrLX77utVKRl+D1Md5sblBdu3tQd9ezOiU8RhfLrJEGXfBwd0Vdvgb1u?=
 =?us-ascii?Q?edDpK0Xp21RcdS7Hsn5iEZQLMX37OqYQpE9UzeD3Cz8W8OiXVBnQohRdxwwg?=
 =?us-ascii?Q?1sGFdxsFb1u7MNVR3OFzybtD874eCImHaQlC0SpIPhWaehSS5FuOYfJXqFiW?=
 =?us-ascii?Q?l9/HUMteKZp6tlIST9nr1ENsTinAr/sD2WUtGf01l/JN+1PWiFtfYlj7mUuY?=
 =?us-ascii?Q?z+asN1EVHgfqHYDqjioLcNpe1XBykpZJ3zxf0zc6djnZciQoHSGFw98nNYOk?=
 =?us-ascii?Q?g3hg2whA8mPg3CuCl75BnoQYoWRVzjx8bQmYlxj7V6Tusg4glXV44itGrd3k?=
 =?us-ascii?Q?asLobjU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PORuDf6xwlFmFY8GgJoHi6Isr5af2MkngnKl0VDpQfOXRoOdf8vXq5IZ08lc?=
 =?us-ascii?Q?HwNlOJFD5USKsoOtMmCTmSbNs4cSqwQvL3IwTbORoP+8m0+HrQW6wJbyMLvf?=
 =?us-ascii?Q?JZnZVAyD4ox7aCYi8wTusETjyXevbEdrDOurK/7JZDFxU9Xoz/Xw7x1qjQoO?=
 =?us-ascii?Q?EhMongWpLVrLM1A8WLlYufW24Weic1NqzOOH/DQ4V8dvaFwjXM1AWHwA/AFZ?=
 =?us-ascii?Q?C6ekhxWCFHcdrpbvMjph0zoeZkca8XJYBDpPut8+1TbH+lGRdAHbxY/je0Bb?=
 =?us-ascii?Q?80V8b4yKHh0+YKr79/jQkxSy8IPtqHXZUmkn043agcVhvdCHPqeipYLaeJSm?=
 =?us-ascii?Q?DeTT1mmJ1ruxM44AV3dbUlSkefZhvxCzarEbl4nPAmToNOinmd4L8yL//BjG?=
 =?us-ascii?Q?FK7nN50j330d3w02kK7/t0mcNbYTNwizXAT7eKwZDBCCdS6AZvcGMzN63chN?=
 =?us-ascii?Q?GjmKiSXTA5mChPYZ12Pz9tQuPlwU/OTqxWpLhJ1N5wniF52r3VNb1/ro2Bi0?=
 =?us-ascii?Q?7Qt5H4K0jKXkrYl6h/CJ8y0gnY6AoQwUBfcmXi2AueEGJJ7uqBrNDGx3a2rk?=
 =?us-ascii?Q?s9yBiLl3RfH6ZTjTG+RC1rEg3l1+MaUsKvXewZAL92bBGIKSuzZaYf8XHGqA?=
 =?us-ascii?Q?1dKoAX+1OFoNZOzvOy5r7LpDLrScm2y6+EvIPt4wo0Tecd6JX0vxcYXE4RR9?=
 =?us-ascii?Q?CRYfq7wq/3IqpWIQ6iy2YwSHzkSliRAipW5J4MPJivis8NX6EBsTkJ/qclKn?=
 =?us-ascii?Q?NooANiT62SQACb7Xib0dFI6YUJAR9XjiJZZS3pMGhZ5RBVfTuiQePgPfPvoE?=
 =?us-ascii?Q?wQ8+oT6mZUFrL3oGyZ26tH4yr52txV0LiFe0Qo5EAZKk2CLtKR0ngReHwp4d?=
 =?us-ascii?Q?JUEy4LexNRyJazsx4zf1PhyVuI0+RV0arhkqz3YiLVJNTRe3BPI30NLx6tll?=
 =?us-ascii?Q?t4EbjF/CMFfTUY8IMAWsiaZ8E3V9lX8vVTy3Aj61sqWK9YykaDT2vyk3/g4i?=
 =?us-ascii?Q?YVWQ/jSwtbkKir2AwAbqNHVBPzjozTGqQIiJaK7FqmcdKX1a6v+k9MD7dnFe?=
 =?us-ascii?Q?vjli6CiSuKkGFjDt5mwd0BEkRYcHnDCkuCXIjvtg/TmbYiDeV7O9AC3jtfq7?=
 =?us-ascii?Q?aduh6Oq8vu7u1mx3sUvb8xTLIXh1vN2jVQ6bNblZc70kaluoHOsFmjncqGuD?=
 =?us-ascii?Q?KeGTChZghU4CKETJJ/0QpjlOMipLbnSray339Q0qIk4sGdijy+t94cJgq2mt?=
 =?us-ascii?Q?TYG8xKLHSgWgCwREUUK9jhm8TgdHxMXXmkjSOo+ukWy4skxMghGbjXlloYto?=
 =?us-ascii?Q?Zm0fnV5nP0Kc3ENpRsVTtHDWm6pWjQ9lsV6swtdKAKVinS3KFLERwKreIY/6?=
 =?us-ascii?Q?D3oDemhpUaGlsgHBjWa/4ObAhWtKhjIt70OsRElmhsqsaO34soXLf6oItdC7?=
 =?us-ascii?Q?L4DyiB7P5LmtkYNBt0lx/PVvtOz2rdbzZBSdnzOAO/JZ0U0Dr6L4iAMdCP2d?=
 =?us-ascii?Q?AHiFt0b86AN4WKV6XMIG1srE38oBc8fM/6Rt+f+CGyQT3FkVksZR+PoZgQ1M?=
 =?us-ascii?Q?EBmseHmqDtKUb9N1iVb/+X7dXJpPC9qcoZK69J7UyNA4R+SWVYc05SMnybnh?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bPnMVN3UJP27rRmHQTGyE9SXWglfw7JbUSr4HzlWb2sGKhfG1rSGFGNPLudgoYhjLb4bRRAz//n53qqqzjJ/dZ2jt/sicqK4vnxa/10bE7kMrvoMR1qHRIFkGz2/n58mbUT4p2UXYWcDcF9TUrUh7ccW8DlgwJwWSyWHCT0T+12dMhvu4KzVbZlHkqUr5B3/ppB6k30LisNUCxeYVs88sEMRvuSG+/S/iGXPjaEbDcBFrEXpbM+QLDV6CJoIq+bqRDWKC+oA1sTcoa4WZHDX5akKA3Us60E/8CGksot2xdV1sjmaoHM2+ujsABpiBbSrFyEh+uLErzVdYGMxGtmWQYPIX5ZlZ/tlw75ULQ9rWPneboQFVp7vqKgVfeVYqmTy2kOZY+QgwswiI3yaZ8VCWlZuB1yFv9RexEN86DDGp6Br/O8JTFFxp7ZTJ+haenmN3RftlG+hlA3zYiijysq5rZT3vRFuf4QRT5xLsKr2haPYHow4YISsI8ZAs6OEm7ooEAk8z61dowc0yWjOD0njF6Dpfep08gVtXuNJa+f5NBhDTQsuWxX2L8B3Ukx2BCdjklpqUJOXDgt3dqNKZEGsirGSPks4RBtaNLrDR9NHPTc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98999f6-43f5-4448-2d0d-08dd863f802e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 10:29:04.9343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjSk6E58A9kl+rpo+zPj9VZtsiQWlVpkyFr6LjDIZANMUjAs+KYwt0M22WXqBcVbfM7rnK62JQsYkahhcRy7sw7/pMs1Tpi8P2WQ5iR+2T0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7567
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280086
X-Proofpoint-ORIG-GUID: ubcYEXluc-lLp88QS-TKL7P1g1ZswkmR
X-Proofpoint-GUID: ubcYEXluc-lLp88QS-TKL7P1g1ZswkmR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4NiBTYWx0ZWRfXydrNZ36+Fmsb NNNzggbr9ZcTzmp6NLLDMjQHzVwu9RGZBRzd3nBpdaVe5dpyhkl0rPIJAWfckavsQ9rfExBB49Z ro7uTHiN+Ng9/jIzTvR/p7mVd3NTeAgiQInLehOp24Idg24h7UMsV3MEH2nEnf9mLkP12Fbzg1v
 p60kdQ7hXvBUwIdzA7W5gTCQaWE+ukgGTkEoMVGuibdhTRt6tFCJdWujJlyNJIbqHbgNBvw30Ld ejy9o30hGsZF2iIf0Hs5Xsbl5x3RgMk+l/8u8EfDBrA1h5tYxqn/lQ5hKWJcDFPtGw/ArBLJnJ6 CjQWlfY/EhAco9TK8ocLswHBGAY3J+jBZpvnjQreL7QhdUkktQTjUlWDZn5AW0a/DRFLK9UklKc R2LxPPpk

On Wed, Apr 23, 2025 at 01:30:42PM +0100, Lorenzo Stoakes wrote:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> files - establish a 'core' memory management section establishing David as
> co-maintainer alongside Andrew (thanks David for volunteering!) along with
> a number of relevant reviewers.
>
> We try to keep things as fine-grained as possible, so we place only
> obviously 'general' mm things here. For files which are specific to a
> particular part of mm, we prefer new entries.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Michal Hocko <mhocko@suse.com>

Hi Andrew,

Can you please apply the attached fix-patch, adding some overlooked files?

Thanks!

----8<----
From 7dcaf0b92a3a23af5310a1d5184380c6e44dffd8 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Mon, 28 Apr 2025 11:11:55 +0100
Subject: [PATCH] MAINTAINERS: add additional files to core mm section

Some files were overlooked, add them back!

Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5ee0390cdee..1c243cfc0718 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15519,10 +15519,13 @@ L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	include/asm-generic/pgalloc.h
 F:	include/linux/memory.h
 F:	include/linux/mm.h
 F:	include/linux/mm_*.h
 F:	include/linux/mmdebug.h
+F:	include/linux/page-flags*
+F:	include/linux/pgtable*
 F:	include/linux/pagewalk.h
 F:	mm/Kconfig
 F:	mm/debug.c
--
2.49.0
