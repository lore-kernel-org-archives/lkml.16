Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D1313633F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811624; cv=fail; b=ocWsRPXQzVr1T5aGMG/nGv15v4SMTTvIu2XIk+tMI7eLFQZEVevTNTPntwRR2nvej82C21IKaEiPX6I/NfL7YM1savz1xTciFX/FaxH1/eNsB9sye3GsDoM64MF1/U5eRTl3BZDCaYT0IY7S71aFBNvFpAAob4bRuEj75egE//Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811624; c=relaxed/simple;
	bh=ZvN9ywPDOermmhTDM0djpuB40UqylM74oF0dc/auPlA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CXsBr/r27+pJnRzMudnYZ+BACiCw0S/UJEtPX8vEUR0s21vBJhcUCu1OdjIeEry31hnsRdUjE3e9nfoS8TJz7Zdq41Tb0Uh713joA/kvlTj5d4IjmFEV17NQui84Bee3uDnIvizm4BcIQLxyr8GZobtTk24ry6mw7fmQi/DTuYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dbWPvzqj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nPGnq6TG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dbWPvzqj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nPGnq6TG"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GDNGSV001262;
	Wed, 16 Apr 2025 13:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=9OMN0ZiGhJ9od0h+
	MyWpCiEPQ97P8CZG3vPnQPfq/ZI=; b=dbWPvzqj4MQ8IOVMrjNw2n7vDUJyYdEB
	6S5tcNDEi90JSiMMrfwOJD2ZM/Q8X7jc1YKAvfcIsVuLn1vGArUBWodK5mxv5RaO
	qQkL64VfM4tXtk7QMSZBlm0wiH0jvt+dH5lILwEJ4oIKQj7UrJdar61BrthTBYQe
	Rary8c3XgpBV1UBUbH7qEEm3FwiJ3mYzWBrz7kemnKKDUrHavh+WepvAU1vn+Pir
	dUQkY6pmRPP1nOiQDZFvkyqyyQoAfWrkYWmb89LWDh9cOfsqdSmZbefOsHJQSfxE
	abzVxveWFKisCmrCEpZ7xHDnBMSIu8u3mY+12L/eH0WkZBCH08h9MA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4618rd41w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 13:53:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53GCbcFQ024650;
	Wed, 16 Apr 2025 13:53:29 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010005.outbound.protection.outlook.com [40.93.1.5])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d51vpgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 13:53:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FN3IZlaMt9vJUF3tXfCbRzMndh93Wz6p6j9OkDiLW+rAYpOPANq5aOMnA9jjRybfyPZtbCgWKfCUlXPxgYlOxXfPfcCVYtISDTWYvz6lQ+P1YnMlBM+aavaT60aWewOnsxUHBxXQpiCsqTNc88D+AsXA/T4Ll8IHhdAQG+gqNwncl9oFouhk4zLfDMi4/W+he0pcYlbjQK5catcI80Wwac6tKiSth01lJHD5jjtjsG2fsU7d32+91lC7um8DXchJgpMZIk6Sj5vg7OyltjKh2GWvZ/K/D3ZssvJ8w+5YG/QPpRky5meoZ9y3ymjE/buq41foj9zQS8OstBqg3N5rrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OMN0ZiGhJ9od0h+MyWpCiEPQ97P8CZG3vPnQPfq/ZI=;
 b=ipuA3pzByChlNO0FGAIypXdzRQRsZcsGyAat+qssTt/WqAvYaPBe6yTKG4Pdbv0PaMlixU0NjcIU53FEqfiYgU9/ijI6kuo+s9d+T3FtDg30XQlgcCBnklmvn/BSv+A9XNErfbJCBXouQcHFD0wnkllaHz0omLpE4/EPcme4Ui20zXBx8iVYIgNVyMQHqKiwgDKkkRUdavZ1gBQRXQUxn1CX9W/3agC6MPpn8IYNHZ/kq3LF4o0wS3PZTsw4Mm+/V4kadoG65XCwIQsDTEWKV0il1AvSOcPXyOh2lAR7nCwv/OvCswpxj+oNIyJhk+ZSgLY+aWc6Djz+bOPmlnJs9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OMN0ZiGhJ9od0h+MyWpCiEPQ97P8CZG3vPnQPfq/ZI=;
 b=nPGnq6TGafAtYNLjBMt2TyyfRnXey7Uqvefao6AQzqqrgIS69yqKYAO5qyhUWUD+7WqA6uCriHTZXU9rHRsXY5Gmp+3NPsvy/gKpqr6TtTfRLBiGxDgQWkDzNMf0sMLbiui/aEW+MNluOoEBvoXtWmMlviH9mMf+uM0/rVt/Rwc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6154.namprd10.prod.outlook.com (2603:10b6:510:1f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Wed, 16 Apr
 2025 13:53:21 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 13:53:21 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pedro Falcato <pfalcato@suse.de>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH] MAINTAINERS: Add Pedro as reviewer to the MEMORY MAPPING section
Date: Wed, 16 Apr 2025 14:53:01 +0100
Message-ID: <20250416135301.43513-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0330.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::30) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: f28f8a3f-db6e-4713-2ecb-08dd7cee0cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Herlu22K3t3D9mQEL7ZPSxs0aGodmlrvnl6pY9mrckpcuxTXgPf69fZM16VX?=
 =?us-ascii?Q?b5IOsVEidEAYoJ1zBI2Enj4zbXHslPzxRQqSH9DEGtB3HGYS1wvY6AfKkmLy?=
 =?us-ascii?Q?T+aRPIJuxERw+5ENiTmInOpnZi5w0ox2HTpSdeQ9uQWKdGNTRcV0GMyh5jU8?=
 =?us-ascii?Q?vJRUYoPrYK/E1LztC9Pl58ma4rj5rYjMbNXkuqIJ4de39VF2R33mSySJBuAH?=
 =?us-ascii?Q?UoXsFE5oWVbgnquZqxR4HP1n5AdEKmViJGOON0ROItzQii6uXkYfjDLOVUQC?=
 =?us-ascii?Q?Fx4F5rfHai2oxp85dKj1Eod06g46/9XqDsGqlDAUqfuw7IR2qVRtGQF7ihOK?=
 =?us-ascii?Q?tLSQqAMI8rR9TUnuxRn3pTvJobFc+ozy0qm2k/ta1o7DYONbKBCRtULk+3Z7?=
 =?us-ascii?Q?D6uigk+ASie6vIGJQjBNGPMGALsFjC3ZLgViaFbx8vjIIUe9YiW+CN7PikGz?=
 =?us-ascii?Q?bBeeArjt5GfDm/IAkvtzwd9CFc2Vbx/N3A1ki/8TK5BDvxhlf14/xQPRfb4/?=
 =?us-ascii?Q?yXygZ7aRl/KmybtU1PR06nXQbe7t+kjY4gamMXcT0OB2mXKwT228AYEcbHCh?=
 =?us-ascii?Q?nhlQGSaDWfxhnzBi2SdWMxUrCxZL8vZ91ogFX9ZVDqHVqnkchK2aIZ1jIuMP?=
 =?us-ascii?Q?mVnZUa+zKr++rufLbJc4IenfrDWpj+yo+UieR31TEj04WBBKm1dlGpG+t9tH?=
 =?us-ascii?Q?gQVm7e8ziFippPRxN+N4WC30U367Ih+sN2IhDMRTiQs98+99HBikkeTE5eP3?=
 =?us-ascii?Q?N3HHe2nyUjQ1Cem9P76w1oevmlLwlwPpjfutIcno9TcSYEXU79BR90xLtsQk?=
 =?us-ascii?Q?4Lm7fQYyYgTZbV2gljKwTKfkJ7nR0Ew0C/DANsgT54yxPH6ZL0Kid70RDQaR?=
 =?us-ascii?Q?+AgGQcbXSNq6StGhQRWNGtSiibiHAggyIC3QWC00Gi29uA5nDkggLEhoNPvS?=
 =?us-ascii?Q?vIUbm+WtRaHP74yazY8c0CUCOtGhk/n9GD8flv1QcXEPkj5MqOtkbZ+WixVQ?=
 =?us-ascii?Q?RaoQLFW6WooY0iOTW2XIKQmMqpFe7s+vMZZLl/TDrOMjWgdimOnomhz8DcMs?=
 =?us-ascii?Q?CH/flsBwJZ0ZRl+xAvtPS779pmwZ9DCeKCOO/HpthyM9PMvXyUw/sIsfJ2fh?=
 =?us-ascii?Q?Si87Q2ZLwOcuIMI8CojXjMUDhXi12Pg5gIjwjc5OR7Cx4C4hcfr4cRGedIPe?=
 =?us-ascii?Q?wtCFOq19f01MvmNXuYtlRyJVJt5YGX8m/ZOTxdvVceE081+we8pyUzJ1cFdH?=
 =?us-ascii?Q?HKGSIv2ztB2p7kUlzFd05PBlTydidpQUgiWRwJ8OG2SSP5GJ7PBXO97kTLtq?=
 =?us-ascii?Q?ftqTYvzeYGBqluHorxGiZRTA+JCMrbbKPsciWL4rGxI/9Or8Rr+gKTkeIT6+?=
 =?us-ascii?Q?YGVeQ+o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2G5DgrZT2j6I0ypvzHBarFLMNDAFD3tQT82NK0s4MuS6GpjtbsRxEhZ8sQH9?=
 =?us-ascii?Q?kh8Tq6zgX0iDPo+jXqagK5gliO4fHzQvYOHKd/JSZmNX0DEBIDYhg5Mxk/nm?=
 =?us-ascii?Q?D/t1ji3cvT0RzpNyU7NPjKGTFp0dcO2T0I45I4IPajBQr0AI3XDVbK+irNgj?=
 =?us-ascii?Q?vCUulwmvnHxDxJ5OvHNOJWc1XGLZA6P4RKjgcQ4FdHXcaoJd/B40Zm/MeOir?=
 =?us-ascii?Q?Ut/UlRKmveYf+4Nm00Ejt8QZ76g5KqWhWz85J6TCNQ9JSa/IrJoZESa6LDuN?=
 =?us-ascii?Q?v0n580NUxuhHsDTulgTK4SFcYSaoHmXKcdhx00yV8HNl7ck+VIueltyeVEZ+?=
 =?us-ascii?Q?DwoIWL0Wl68O15RQFGot2ge1rKFk/b+suPALtj+ZPVfuSNWgJmbmx72GkXKB?=
 =?us-ascii?Q?34Cf39gQpmgatW5zvklpGEONfu4zDY3FtXb8PN19B46z5U8cNN7dwb6rHtIz?=
 =?us-ascii?Q?9PcD4S94K3ooes/uZhq2mbxPuaDZTY3R2v+46HDg1LaOr9AH4IuFXSPOwajo?=
 =?us-ascii?Q?wkJKMb68K1fJJoJ9bKDzan5OPtyxW4lY0WnGXY4uRx5tfzh1FhCCJsSb9mjC?=
 =?us-ascii?Q?mOVp9XREncl4XHZLjLpycxHnWEZCVNAedXXSdnjI2Om7OOFnv0nXZJmA3ZLR?=
 =?us-ascii?Q?3v3W7OT+GKlJc+z6LXGqr4Y7epOBpplyTcbpWaUj5s2MvvQdEakp96breel4?=
 =?us-ascii?Q?J2ibNro2Rzt0WLNQ+2lMrE34bDmqgzYHnrHnybbmGmAtSOTeKNBEEZrAsbKo?=
 =?us-ascii?Q?RegIjkZ79wFzJloXdMCepOrSQsjYpmY09X+xYfZINFzTDYjqHLaliBzrUXKT?=
 =?us-ascii?Q?/U+UyHnBDAeCZvJTVQNlKca+Nsmt7ciFQJvjeOJowcqDpfBFh4z/Yvumh7Za?=
 =?us-ascii?Q?KR+Vma7qcj4Lrz+jCYmVSCGmSVJe7ALtuSwkHHra0AAgs67/3UZC9Kh59N0R?=
 =?us-ascii?Q?8iGGuhUhcs2eyArZXcpXk4vQLUtVFIqIslI5qzhQkBrOAuDH4HvF/iK0WVpE?=
 =?us-ascii?Q?mCyKLyOJGyzXujHnlE3T+UDt0UypiKczA51VeubMXXBat3HpF8fl2g/GFtTg?=
 =?us-ascii?Q?ZVmrs7D7slvd/kW5UVAw2hkiDgUsHWLhAjdnSZgYqGybhrLFB72jAo1jrw1t?=
 =?us-ascii?Q?TV0Ygq0lBN70sOSTD00gHIsl+yzNybn6ulX0pduyZi5m9kw83/U+O9f+14BB?=
 =?us-ascii?Q?ORSB55DZU9rNN/YqFdOBTSGMrP3QzF3iSjaovknPDVEtzvJW1LHylaHf8XgX?=
 =?us-ascii?Q?9bn64tW4wXrigLMpJZeedtBgnUCHAvBO3LanwUKFuYomv4ssirf2kT3vXmuN?=
 =?us-ascii?Q?3w2NvWorvu+aOxQlMb8xgIv024h74znzhwWKbP2yuvhvoRx4RbYMryQ9j83+?=
 =?us-ascii?Q?NbME9/Ccsj5iiAPXfJpOhDNoL8P00n+r2Tw0GfQKYYXP+OPhNfkOv0dKCf+O?=
 =?us-ascii?Q?Tz8SRTHBYaECsbA8UhmVjpwWw41cNvvRdwcX36aUsYAxzmkzC8BNBG36g+Zg?=
 =?us-ascii?Q?Td+27V83Xb9DC1DXhFmDjWIVd8iQVD4/6zFiQ8fa4ENWpqPkGcZom2Q/bjDg?=
 =?us-ascii?Q?YeWNCUr0Gy70gceu/itBD5NnwYadSWs43Rng1EhR/4X0MO9GZRtmc3JpsuZi?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	75PvnXvUuYpd+zHOif2SA2WcLe8ZhzTzH01dJ69UBsWpsYu9u8d2ewK/jnjnYyyGY/12TPe3WthVGCNjRGGgWHcNh4Na2CiS5K0/ztaD3uXRlETYiDlnjtfp6yZlw0aRNFAFmpyQ38N4He1HQ6KLM/pKSOE8Sn+NnUnUU0h3V9ggaz4kHoslOQgCP3+ung4gYaqz9pioLMkGCox535jwtI3h/U9RnNpMA1JWJAxU98X2GYLGxswSdBq2nnPk5SbnBhZly/wEENX7EE6WCACK7Hw/wmAX3rVXQS7s9Ilwlt4Opc2kY8l+fGYZSbncOTYw9cBhnhMuV8YKJrfc/dqmV8GkPJ2wlCIqtKeOVHAK9/06vStLxwtAD1/aTimZV9+7Bg+UQHqBpwif/pqJRj2oFYuFHmMOEu72QEWR/1IlBVOUCj5YkiusEj33sX545vivgCZpGYHBPyLU4AfMYCb1JdGSm0QYDGKvmo5xkn5szKCf5OqrCo/Kl+nm+ERYDNGbLAjnH3qZi7EBnKLF6U8mYyA4xs5RHgbWO2BrYw/cP3/6Fe0GI0Hs1NoBvOeV1HH8nlVtZRFUSBpsntXlHeTklKcFWlZ1cpRDy32YrblpLE0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28f8a3f-db6e-4713-2ecb-08dd7cee0cbb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 13:53:21.4913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrzFyRFe6Mq6GWr+eD9hcJ74VYDFmF0+0CNzTwv6OD2mXILJQbSC2F19P3aRrLB6RiFDWbtT/XagSVWG7zhxcWc8T7HVv7akrr49WkjT2Zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6154
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160114
X-Proofpoint-ORIG-GUID: mlxSrBD9HY7sPSB9wFQRRhB9Xs-dopAO
X-Proofpoint-GUID: mlxSrBD9HY7sPSB9wFQRRhB9Xs-dopAO

Pedro has offered to review memory mapping code. He has good experience in
this area and has provided excellent feedback on memory mapping series in
the past so I feel he'll be a great addition.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d834514a047..ecbf9bcc7b57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15579,6 +15579,7 @@ M:	Liam R. Howlett <Liam.Howlett@oracle.com>
 M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
 R:	Vlastimil Babka <vbabka@suse.cz>
 R:	Jann Horn <jannh@google.com>
+R:	Pedro Falcato <pfalcato@suse.de>
 L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
-- 
2.49.0

