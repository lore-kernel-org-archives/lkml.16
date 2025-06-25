Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246101F0994
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846549; cv=fail; b=idqThVgga/ykAzorG4L4fZ0OZ96ZPbFrX4ndRuRsdY9qV2Sy0Z2O904FthoFa3j522x4tpqyrzdiUAC741/u55YhI/6sTlvXEe4+Py3hDjvLua5p6xL/PW9U94EQ2F//QM1E5tvXGBEqdw6XKvGPPMqtYwAdlTdekcpaXRLI30c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846549; c=relaxed/simple;
	bh=C1zFrxK0wtrWR2HMgImPLD3tL9MI/ej2XvZaWEZt7AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JKlbVqgYsoRiEG1BeqQFxhwTjbhzoLem5HM2Q6NVM0DUS4UWGIytBeEgi6YMEU1mh4C3zrrqa+6qMLoDh+jY/MpjgUUReQ2tWvnmFIXWFM4ApfuGZKOXkgcU7QEkpvTalzVq4Bp7NQyHA+eKRbPsu+uguZI6UTgM6OQ2mJgQKDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IuPN00LY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=r6eKW6RE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IuPN00LY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="r6eKW6RE"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7fit8012123;
	Wed, 25 Jun 2025 10:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=C1zFrxK0wtrWR2HMgI
	mPLD3tL9MI/ej2XvZaWEZt7AM=; b=IuPN00LYq1vEQLZGmLCUPlGDfRMaLzYWm4
	rqpDQiAokfGLRwzUqZxPckhq/LmoyJBI///qap5NSNibSTsI1aTlurcg+zpPtcSn
	0v4gjHvRXbEydNvOwoyVNNSBMvMVXw7Yb9+EXQAxUooV/3pNT9C68b1mYREXup6y
	cqSqwZpZV9PjoqhZbh0u4HIMUxRk5x2CBYq2RRoP2lUHY64KqzUaQOX2m7nD7BeZ
	WTWQGznke1nhXzfYZT5lTnmsaTpD9XBRnVzkG4pr+DNLQM3VxjFvnit1Jc4+eDp8
	0J9/G64k/sJ3b7m7LKvuEuNAxP7JEHuiVAM6EsDiv9r6AclsjgyQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y7526-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 10:15:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P8d2K0025285;
	Wed, 25 Jun 2025 10:15:25 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvxcjs3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 10:15:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gzf/ycze1mSeKFTug4/uZwUIppLgp8LgKgY0ucW+EPEKCgzGnDy6zS3eDBfcjwSuJRciHPly9QkL3ov2h1N/60G8R4SaSmBeC5an/F4dgqNgIg9j7JHyq9x2ue5Gk6LHGHlKP2ibAtADB3oULZRd8QRNyOuS1KgpQ+Yy8+N/edJ6wbAAflQqphn4uuA2y4w0xl1NkREjfmZE0b6Lb8I8rqLGq7U2zn7ei6BtVkM8xFvcrzYVcAPikUmafIvEna0EnHqpQEvo4kUCiu9+3/4+pf3PRvog+CuEYt8e8KRRKBmvwPyQmtgWUt47hDg4yEfVlw/3HJuJ24Et7OjxGLLGnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1zFrxK0wtrWR2HMgImPLD3tL9MI/ej2XvZaWEZt7AM=;
 b=rnHjzpVYOomCOVo2m6wddoNvnpdS+IkOIIBJn0I/5cTC5sf6EIfb3oa+PUcnVf7Kj3/DRiHIRU2Ite8OGEy/wZo9AWqD8AWdDfBYfrvS3pTxPR/TDCw78V4Cwqw4uxmTCBpJzUakV8BUXQWOUdW7Cn7NZnLdzNxy/VJe+Ofph6d0K67E9jm45FHSzNQRt4jXPBTxaljS6HjAQ2RO4FksW2N7N2fpa7TLsN2n2Lb+o6l5cMPChK1IcYBPxX49gg7pB/9cypvmu0DLZ68MGVbKnwLB42GxnYqNOgRBGdN1SO7TvcSGNan58YCJ36Ho/QkVxu10DNoqlcfYw5ZwCLAwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1zFrxK0wtrWR2HMgImPLD3tL9MI/ej2XvZaWEZt7AM=;
 b=r6eKW6REIS7F/fuFAncSbsFN7zXL0ky9VihQakIu6FJSH1OjHrObVayT0YWceSwtA+fUjBhOGRHynftasqklLSLt1NW4tDucZP9nghlPhLad1tMEzWIkgpPIkqsYJWVJ9nBXhPhba2F1ygYOS/H/WmNpzjdR3QZ2zSyhq71xL9s=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8346.namprd10.prod.outlook.com (2603:10b6:208:578::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 10:15:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:15:23 +0000
Date: Wed, 25 Jun 2025 11:15:21 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
        Hugh Dickins <hughd@google.com>, akpm@linux-foundation.org,
        ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <eb0c8d93-cd9f-4b57-a0f0-d30cdb5b31bc@lucifer.local>
References: <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
 <01d679f2-fd64-472c-b9dc-ebe87268ce82@lucifer.local>
 <a16071e5-ae97-4e1a-9df8-f353f6b319c7@lucifer.local>
 <23b8ad10-cd1f-45df-a25c-78d01c8af44f@redhat.com>
 <decbae07-0c84-4379-9f9d-6e2bd6dbad6e@lucifer.local>
 <a877b2b7-382b-498b-9b4a-188a0845d630@linux.alibaba.com>
 <ff3cc6bc-dd40-4b6b-a293-eedcc7c8eaf6@lucifer.local>
 <37fc3553-0d5a-4bdc-b473-cd740d47598e@linux.alibaba.com>
 <5de8ca8e-f293-4bfc-b49d-6e2a2e049f2b@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5de8ca8e-f293-4bfc-b49d-6e2a2e049f2b@redhat.com>
X-ClientProxiedBy: LO2P265CA0513.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: ee87f69e-cf45-4712-57fa-08ddb3d132ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mn6Po3kLLgy/xMMqHoY72MTqZAgmY0pnlsQJKLZ6Yf7wfVf3tvaTQsSSJqxK?=
 =?us-ascii?Q?yUMmEqwI64YQhZxsFasD84wN1NzHwGFDHZ75Z+iN64Ow6g34ZBmmY6QckLCP?=
 =?us-ascii?Q?xzdKd3BUBz6pT7Ed73WjC506Pw15uqhrZhzLb7sGMZ+djUk2gf57lT6KR2jm?=
 =?us-ascii?Q?hwfsffaqMhCyR0iy3mGLIJHR9eZsOVgCmc4wisw9BV9DkWpta6yt9UWb4wBx?=
 =?us-ascii?Q?keHaU5UlsKXXdIATahfpoAMTLUAXoVTWXYKvWl8f5JX30Zt/F4hQ6oprNM2R?=
 =?us-ascii?Q?32ZzzSgzIrAHKH2IARL7aELPO9wnT5s5ugrpn7Ma3O9kfKZ/jKHjH3NoVkEI?=
 =?us-ascii?Q?aNKf7YpfxjJtU9Cdeld51FwOdxsE1d+YKcUfwATtu6vDRdwU02tKMLLAtsUO?=
 =?us-ascii?Q?KCCTzPmW8RPdmx0fGfaCbw6zcN3CLw3bL8K977FQjSU7e7b5JAs8z+iOm+C9?=
 =?us-ascii?Q?uWGNt6G+WJpGl4ayX5XdsnKzntUmApQg0XLYpCD4SdY5DKIfIv/L2/UXjUur?=
 =?us-ascii?Q?Yk0QKI0M6/S7gbt0iIlHKci4PegnUx6e3aZWfq/HBbyAELeDCI3mw1MBldCw?=
 =?us-ascii?Q?gj2b4djiIoznlO/udZ+ct1n+kX/N2vEaIeS4JmCJKZKWmSGeJpo3YfD+HX0o?=
 =?us-ascii?Q?woHO5PIuxX4RbzqUnN69zF+NeQHyikOpNGcsxjRgTAiY1jInEXkplF/5hzxr?=
 =?us-ascii?Q?rp0iL7H3i4uhjvNG5zmx6ZfnGdnFY4kplshuHCq2m0/ZG6N2JRlFP+7aZBmM?=
 =?us-ascii?Q?hHx7HqUKJ6aN6NWCejb7pwLlyXSfRE9u0UsZjx72yg5CJVkQc6kvrTPhowja?=
 =?us-ascii?Q?Mao6x7v3uxMwkut9PS6dGJCiwgdu3vxyeR3ZSXKgbYDWth3tupROHZDyINdC?=
 =?us-ascii?Q?k1Q9o8iv3Vyi30gboC44C4Vyhm5NAnz+qhjPgAakUOjkraq4zsTF9xwVxDf1?=
 =?us-ascii?Q?6EETC7+e48iZBjjA3cpdf6nSVEuWdRjIWioFKaOfk+gzr9he3P6dZAHFta9N?=
 =?us-ascii?Q?oS+0d6B6c4FIOqiAHuobhoDaX3SFVdW0BOUzpFNcpjJEjWNIEYoLRDOiRRmH?=
 =?us-ascii?Q?U8ywDB928WKIojT5o3UOqxaJU4Enf2AVj1t+obd8RKYURjzBBgqg2MTezZQQ?=
 =?us-ascii?Q?yxARS23EUByM8DmXz3xKYwWwuy7FfxC5TMk7anTBh+A+EEk2a1aPdMrvF0hV?=
 =?us-ascii?Q?QGkBrJ7+hZthxORAp8rNjyJVc1YL5qvgMc5yp9yKPaH4yJ4N70ExVmAORQeW?=
 =?us-ascii?Q?h0jWbtr0Am/PzYchLNdBZ0uEK6765/a72B5y3K+bH3vQFLz766ssQPbhIBeO?=
 =?us-ascii?Q?PlJb6ZkFyiRG+B80ph8Mvut+9EvenlqVg8cJnQJhxS2ppOQTX9VTyxbIzI7L?=
 =?us-ascii?Q?SxsbesvkfKH9tZKFoQ6KC5ZeglP1YejtnShx61YsS389C661lA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fQ71pZvOScx36InOrDQfs2CTshwdieQOEET2alDi+aPcub2sPvDribToyGsu?=
 =?us-ascii?Q?DDfNtiez2G/iiUqV6a9vX2B+UgaGiurq3CcCByBg8QXfhg7VvzNhjOL54nV8?=
 =?us-ascii?Q?KGJhgJcqWdLBlIqdP50/0DCsaCY2RqosgBgjdWLOPcUaLopHmB+N3VJjTmEy?=
 =?us-ascii?Q?deFluGiHhiaCQQCN7hYK6GQ9CA3xftV+GQX9CE0toeiB3SVeMTBTFS03mw+Z?=
 =?us-ascii?Q?rGaJJIj0fCGPgj8Q3TDYRx76h/+81lkFwQRYkbiSergdu/U6Qu6wiRJMYiPx?=
 =?us-ascii?Q?gGoxhWvacA7U0BFuiR0ge9h1H4OVd1K/rQFlWYYNfZQZaoJscNDS2zXmtgib?=
 =?us-ascii?Q?TKvUj4VOs34DrxBpZBfqI4/lO9oXQ4m2Po9ZwjC3Wi6uwkHhnfunzv9+i2Y+?=
 =?us-ascii?Q?mX8++cyEWXdiR09T9o9vnec7bDAgbUUIZetG7WdK+FtNzHOQMKGycol2+HJC?=
 =?us-ascii?Q?i2Qg/NtmjMCF4IBS+rWSAihFZpkI4ZMxIBRYGUC4wLZwibImnKSQGjLcRD3J?=
 =?us-ascii?Q?AFhVicLQFVxYRDEDvL8ARqv6GpXGEkyzrCkBmNpb1dnGKeSM1Zlrag8Dgdz/?=
 =?us-ascii?Q?4XAsl8AN1bYd505q4Jr/aDx8t64/QtCieYVTetIfLqcZervhV1f4YU01ehx/?=
 =?us-ascii?Q?gW5Ty8GrrgSD4byWdSVsG9k1/qO6JXMFLeRpA2Y1p5U9Of/8/Xem51cqqAIn?=
 =?us-ascii?Q?n+X9H4apo37nSjkx5RG1406eecc19wzhGzacAK6dbMjzW/U0QsTZQjR5driF?=
 =?us-ascii?Q?ZOhloF+lBsa7oWBO6f4vx6Uzd+jxDp7o5Tt+tg93cc1TxCDiWoYgR5Uc4g3I?=
 =?us-ascii?Q?lx4ScbOTFDjkS6LXzAYBtrDZW8zve/Po5GBVC6KpueK6WHYNWKRHoyDauOEk?=
 =?us-ascii?Q?vSN4CNPmzmh8/cHiLGTxfBe2hjKnbZ9EkF43HyE0B1xsUxGTjL/NosOcr75q?=
 =?us-ascii?Q?ZIJtt2OclDI54SGUd7wNbKT+bQdShrla98y9QrRzunUmiaBFMctuagi1iHNY?=
 =?us-ascii?Q?jRX5efJVWVbk2Fg1sal2N+BEWziPFKCqIjThKE78U78YUUlAPdybbv2We4lk?=
 =?us-ascii?Q?txpjwhNNJR9TJH6qGZWxRFyry6efEDz/htWAGbiWgza+nd7FWa+keeriE9U1?=
 =?us-ascii?Q?BMlPXdkkjfAPqnPESu4/k9nYrexkD6rMtIlvWmBm9saLBGCr/Vzplcvlrnak?=
 =?us-ascii?Q?wkR+MKBz4f5b8mhNuTH3IPY0Bfk9rmvDrS27wTLq9xsRFJaud1AMbAuLVCU0?=
 =?us-ascii?Q?/yzWHfsN+iwu9fcUNVQw4ag/V2XqxqTYnkOrIFz3YdMOXtdEc5vqwsS581jG?=
 =?us-ascii?Q?aS2jkM0FCedZ4MuaoW8TFfiMD/O4rPBg+2TKTgP8rWddp+POc8YEz0hlfi0b?=
 =?us-ascii?Q?L+FBO3f1WvUjkCE2UjxKKoXiJncuofNxoWRuiBZ2JrilDvzOip4Ophm3KYdA?=
 =?us-ascii?Q?b+GJ42Gnru6J3VNYvUiPUxW26QNiwLQ39iaBNI2j8dcQ1fm1qNgQiHI+MuCR?=
 =?us-ascii?Q?Ddz9fFa0PSR+5xowL5pRpk8Gz89iDUtF8h4KSSSBR3+NFYIRY0moYGxxNyyv?=
 =?us-ascii?Q?2XHiz3vJ7BO0T8tkdZEixvBCWOPMQZFzfAjpf9+7SDCl2meOcW84DfgS3hyf?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8v67GJGIkX1yXb06ZRtpAyYyI+JWXjiHabagVYDY5Uz2KX4+z2pOPK8xsIFqQ6BM5nkb3xaxcKn3WveTnmxnqFwNZK13ULcE9OkJgrOSRSVKXyalcyuwGYtCHfX5eQM9fQHOM7/dymLmluxH91+mzF9W17KNA5ddCO50GTo26oLFhyOIlUA2YtWMg7tIWYLjsZs33NED2VpPhcWc4q004u+4xH+8jPJheXfiKro1PLmZxAAltXN9RBU6rozPWoM5j3fi9XFP4ifl4Q3A8tVrnD/6Uv90+UiR0WW42ge19763uK90TTcPnGDAfBvEfbhY4gNl7K2wEKI+R5ltaTfrwAC9zFs9wvxAMonar7o2QZDdibvrtUpIC4DqJAYEXMId/4fG8KIQ6ey/VJsxS8+AwwqOlIz7G6hOV8H1w/JURj5m/gaYbFXho+WrYD9fOXZE8rYYSMrw094EoQ54ZJc6lQLUCTd1sDJ5huRNkjKRNUu74yC/8eM4dv7dMLzFgodM6en9cacZ6R6fSsvmLZCKiHrm44Val8kVqEIDb0MQreVDooT1S0PnwKwG0a5mmK3+NrE9YXR+nljjVH4cZRnH+/8uWJuZpw+qI+aCluhdMT8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee87f69e-cf45-4712-57fa-08ddb3d132ad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:15:23.6846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2Vau52rXvOR+kBA+QK9tJD02KxzNJjsSrP9VaJ/JCfk2enTi8TGV300oanL2Eg26WbaMsTdzWCiI9baWMi+5mYdulGwK4tdMHWUdfqdHeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8346
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250076
X-Proofpoint-ORIG-GUID: SBipj2rPrHPxCyHxvCGIW1BzNpHf2BWr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3NiBTYWx0ZWRfX2SanTI576cO7 lpqLplZG7kvUZXGsUcqaO/cqY9Q4y/dUv/ZDhU4gbuVrAuH8aQqQfJL6vbPlO4KBGAJqZipDWry fStH7hAx/gaAVEDkqCqiGHcoG6hQnk/5ywfK8lfa4AQ1+b7vnifwzmsMiP3XMWbMzvEFLCiZ0qJ
 eYc6KRdViMIc9uqc2pWE6524YSKarvT+jKq9m8nlN7vKPK9QKHkxtSbWYlJGKM9mwtJPIOsy6vv 4IUEg5GVTj0M5EKb0ZfXHdfAdqRXIa4qSolrHdn50I+tZqtMj8VuPiUJT7lct0yw4rDTifYI81d 0QmIwVEWmhY918ZUqPO344ptTScClx5w6/qYS9OkHfukGsmZEIqRg6lpDWYJ6/5/nwEUJCCpU4p
 Lu/lavt31vCNjgrg57BXOq0XxEf3EfeCQkyFwOdzCXT54iImoV8XIj25e5gHhiPuh39vCzzB
X-Proofpoint-GUID: SBipj2rPrHPxCyHxvCGIW1BzNpHf2BWr
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685bcc3f b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=3KkNcHVVQ5zp_-OeQKsA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 cc=ntf awl=host:14714

On Wed, Jun 25, 2025 at 12:07:12PM +0200, David Hildenbrand wrote:
> > Yes, I don't mean it will prevent madvise_collapse(), just as you said
> > that it could be problematic (it's horrible to try to collapse 512MB).
>
> Well, assume you have a VM at that is 2 GiB and could use 4 THPs. It's
> stupid, but there might be some selected use cases where it's not completely
> stupid.

I guess we limit the stupidity by MADV_COLLAPSE working on a PMD-aligned range
so it'll be a no-op for an attempt to collapse 2 MiB (unless I'm misreading the
code).

But it is a bit weird to think that users might assume they will get some
benefit in collapsing a range and in this case would not.

Anyway 64 KiB page sizes throws up a lot worse issues than this (e.g., page
blocks + water marks) so this is tip of the iceberg for that.

>
> --
> Cheers,
>
> David / dhildenb
>
>
