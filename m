Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9308235963;
	Mon,  9 Jun 2025 19:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749498095; cv=fail; b=j5dJrkmZqFrN0rxMQ6tMUXcEWaGN3tjGf3q8xtiTi0MQJ6TAXs67iGfYnVuSKV9PjNoSbsiFw3AHgHNJXqrXyiBX0M10Zi8HDOWr96IwOnH9SQlP8C8ZLdkRmlArmMGHdyKXEFyLYn481rQB1vHqiSa4ec63QU//yitoLu5ArgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749498095; c=relaxed/simple;
	bh=OSpihlKWROC+ChvSkZlBzN+zy/D0ZsF+d/h4JA59Avc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eelbF4l4weNd4/+CJypUPj2N49XwniVAWNdexYzFzKaqxSJmty3y7wp0XPR0hIS8Lil0FxEZTMzd/9XS+K0jU6Q080baksF0OAvmVKDOgSS05floPfSjQtVfsXIP+54VJeTCH6A0g8eXPQPCJ4N8sdHIOP7mla9ysFFsmKnXfn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WXqGoqY0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QoBpC0Qz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WXqGoqY0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QoBpC0Qz"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559FeEKG010478;
	Mon, 9 Jun 2025 19:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=rSUs2A3yyfqxVmUwSKsgHBqnoxpHEnnd/l48vAZ70og=; b=
	WXqGoqY0zdpEaEXMBzDw/QfFkU/WZHlHpCyEfXV2y+gYAp8eUPDWLMvOHrARCwDk
	pAvp0AgSlsWeeMnoxyVoc3ehU8keZL8/WCHWE6jht7podhO4lWwXFdjlmK8DRPfC
	QAGGhal6Pd00bgFVEln2KFFuJHvk3uoWw1A/xYX0DxGaTz8USWtKzEeMjulLSoda
	SZTxgoHPhm/rpx2o9QvrIFpTAkYHWLr7MqmSZTR393/MD6L783+OPRf7P/zccylm
	+q2a2XwT609pb3LRF8PidV8eXxUxfH0DgUu8aegrYVYSRM7EJzfHOGFQWMTshPTX
	F+YBcwDtEJ11E9Hsg0g7bw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbeauys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 19:40:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559I49Hk031946;
	Mon, 9 Jun 2025 19:40:41 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv7u9xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 19:40:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/ylodtJmTauOzWmtzzlf/gK8bk+Xz5tKzNySmfbDm/dh6IN3i3WPIOLtXc7+H3wqkiy49IwBKmfjTPU5luxFef/u+bh9mtKme20GzIUFdEUQ732KL6Ng/Df8kxeojX2do/Ceao+WNEmV3PW5Sx/55gXvXH9KH/ueQBaKZzUbqkdArW40d2mrS5SCHne4qI/qK1sw7dt0M4EtUTaMtgxs1/NHXq59yyE/ZWWoYlP+8kb/yIADfScts0JU6fjoqXoSGSZ6RCvhPbNaMrYfCbslEnhRQjcASe8wZocB+eSzNvvjebMUyMJfYe6dEKpZUH6YI/XpR9ynRsjxo8Q9Y+2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSUs2A3yyfqxVmUwSKsgHBqnoxpHEnnd/l48vAZ70og=;
 b=fy+9fCvW29KV/XepJoAPDCAGwFBpilRBdBMPFQFkBb4co1ezJrXAMvxExtEAkVGvPJqUPkA1m7Dp6flECEmF9nZOgwZl80Xdu97G48H+t0c6WhSbeMl3FOL0tXCFlJqiaK/RH7AWo/fwV1b3CafpbZ8GPR2XPyXFc8suE/QSc4u5DpwbShqyrRIMLgf23a2OpXznA5al8iqzpjvup5lhTaALGXbzq+GBlC0XktSfRNqQFtYiLb/wNT7GEN1kUfZmdzjQt8yn+Cs2qV/028p4lyGJnq/UGxIOcIAYMV5jCA8d68ea/IzbgVarjngsomz3zPPL0uEd/GDcoPIndjHTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSUs2A3yyfqxVmUwSKsgHBqnoxpHEnnd/l48vAZ70og=;
 b=QoBpC0QzfZLovhwzL7j7qsLrmjdfOqBXUwDNHmqVzMPg/uRFCSnPa8XjYYlyXinAsFUWdpRg+WF8faXsybZGyeNvijRIHaKDpZaI7ZCxr4OoTyx2p0fxEi9xT2tUgm2E785rjbwthO97d438zNV89xz25vnAWFnNl5QG4XK1kow=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SA2PR10MB4761.namprd10.prod.outlook.com (2603:10b6:806:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 9 Jun
 2025 19:40:37 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 19:40:37 +0000
Date: Mon, 9 Jun 2025 20:40:36 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Usama Arif <usamaarif642@gmail.com>, david@redhat.com,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        hughd@google.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com,
        Juan Yescas <jyescas@google.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Message-ID: <f980e652-8e2a-41da-af9b-39fdd439fefc@lucifer.local>
References: <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
 <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
 <B2F966F0-8F5F-43AB-BA33-BD3E65504F4F@nvidia.com>
 <61da7d25-f115-4be3-a09f-7696efe7f0ec@lucifer.local>
 <AA2C4D68-B1DC-48A6-A807-56516067B9C7@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AA2C4D68-B1DC-48A6-A807-56516067B9C7@nvidia.com>
X-ClientProxiedBy: LO4P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::13) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SA2PR10MB4761:EE_
X-MS-Office365-Filtering-Correlation-Id: 250cca6f-7a75-495c-ae4e-08dda78d8274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTd2OEY4L3ZWcHFIMXViZFE3ek5UVnFwYVVFVi9vRTJtZW5yL29tQzdPb09h?=
 =?utf-8?B?c3dxKzVDZU52WTZ3UFBkUmJYeWJZMjlmS2UyZWQySll3WXRUUjBhaWMvVnd2?=
 =?utf-8?B?YW1KdnZzcDZQczVVV3F4RFZrZXpKdjZ2aWlTUmpsaDdua2tFRThLMkZza3Fm?=
 =?utf-8?B?S2JiZ09sWnFoVktieHkwNGNnZlJZdTRNVkJ4eVBqV1NqNVd1RVVwS1VnVzVl?=
 =?utf-8?B?SkpENnRKM1Rnc21GMlFhbEtxeGtxaENnL1UvRGVIbDJOMkNLR1BSU250bDhZ?=
 =?utf-8?B?ODZBQ2ZWc0FXMmpzd3kvYzZrT0V3S2w1MThIYkNkTitPaXhKVXRuTlBiUC9Y?=
 =?utf-8?B?ZG1ud2FHRFE5RXorUHI5S2oyUDk1aURUOFZvaWYvbVlKcDByQmVXQmpmOThz?=
 =?utf-8?B?TUQ1WTZKQm9MRUlmOFgxWE9DWmRIWVhGVDdua1BUMVc1azBFK2dhMHJReEhE?=
 =?utf-8?B?M2N3bHk1MU83UjJMYlo0RVUrbUthdWNNM01nUElQcURYSmQ5eVRtek9WUjE2?=
 =?utf-8?B?a3hvbTVhRVdTNEdNbWhTeWE3OUZXTTV1a25SYjAzMUowS3NtSGIxU2FLeWZR?=
 =?utf-8?B?QldiNzNLZ2tLQmNGT0xYY1Z1TVdaMDNINFNWb1RITEJBUVY4VStwSXJnUUc0?=
 =?utf-8?B?aTg5VjdjZ1FwbExkdzZFbWRnMzc0UHpHUVpqV2wwajJ6eHRXb29hd1ZJSEdV?=
 =?utf-8?B?MnJZNXdBRzNZNnU1MHQzL0hPdFNMUE5yeDkzaGpOUVlDQXdrT1JSV21ocGRF?=
 =?utf-8?B?VWlIZzROT3J1Wk4xd05NSjZIYjY3dTdCNWlnbEw4REhqMTNsVnUzQWNFOVVP?=
 =?utf-8?B?ZFByL2FFZmhBZzcrUFhRMG1KL2FrWE9mbzhBVGRsNDJrUVYzQ1NxS0dxbmRB?=
 =?utf-8?B?UEg0Sk1XVDJoUkUrcGJ0aHY3SmloWDlhN2M5b0FSNyt2eFN4TEZxOCs3a1Bh?=
 =?utf-8?B?NzNBWE1Dd3I0bk90dkNvSlZ5QndKU1czRkQzUWhHZTZpK2NIdm5IMFlJVjJH?=
 =?utf-8?B?K3JKSmZ5WHhvV3NxYWR5R3RyRnBPMVVNOXRBb1VLMVZ5Mzg0clppblp6MGZn?=
 =?utf-8?B?WmY5RmltTVdNbUY2UTF4ampSNjBrZDZVcGpJTmdkMC9yb0t6WDVmTTRPcUVR?=
 =?utf-8?B?SXJObTNpd3EwOVlhL0VaY2gvcmc0Y3JCbFpyUDVHcG5scHNJWUsyc29mWnRW?=
 =?utf-8?B?emxYK0RscUNwajZJNkw3UnNCOVBMQ1AwbVN1SVcrQUdjV3ZKZEVBTDZhVGdJ?=
 =?utf-8?B?OGhKVXRwZEtSSGRqTVVSRE9vVlhnWmJqVzBJTHJpR3NHR3lrZkpZMUMvV2tu?=
 =?utf-8?B?RzVGaGdLL2Q5eTNiWThESVQ5OVM1RDBVWnRQZFEyZEpGdllkMkFQYTFBM3ZD?=
 =?utf-8?B?dEZEUHJDOHpKZ0ZyT09zc2NONVFzY2wyNU5RSmd3QldNRGlnOTU2bUVPbmo1?=
 =?utf-8?B?d0dBMG1Bd1UwNm9lT1Z6T2d3MzFYZVoyNDN1TFl1SmtMY0V0ajlETUFPZE9H?=
 =?utf-8?B?R1RzWWhCbFV5ZENCcGNCZlJLQWNVbW1kRS9NODlBTGpjbU40bjRMS3BscDc0?=
 =?utf-8?B?V3JyWlNZMFNDdHpWWGZNTTRGUm5Pd2M0N1RrbnloMGRMaGJmM2NMK21COE52?=
 =?utf-8?B?N0w2TzZRbkM1MG9IYVJQM1Z0UVQwR0dvYktzUmVwZjBiQjhYNklPTkhnbDRk?=
 =?utf-8?B?anhRMzY3WGQzSlVLUmhTc1gxSy9kNm5hTWZINU1VWCtXTmdrbFM1QTNHYmgy?=
 =?utf-8?B?Y3NnWUV6cmF2KzUvdVJHTHdiWUIzbG44cjFyeUhYeFhQbTZmQ09KcTM4aVZp?=
 =?utf-8?B?MkIva1FDaU8zNEI0a0czUm4veXN6RGpacFlCcUFwMnlKME1IWFA4dzIyd0Rq?=
 =?utf-8?B?YXR4ZWZBSDUrWHZxMnA0WFV1OXFpbm5LMGZiaVAyM2ZuVkZDVnlETkVQdGFt?=
 =?utf-8?Q?JXdqhITBVu8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnZZMTVqQVBYbFBVWGxRU3lpbDh2blNHQ3U0VUdCUWtpZDlSV1RMMXIrZ0dO?=
 =?utf-8?B?aWtpMEo0YWFyTU9ZNTFnZlV6WWdhMC8remQrN040SVpKWm5MUEZEYUtCOFNs?=
 =?utf-8?B?elpZbjhxdVlsTFlmbEJGL2RZdGppODl6Uk1PQVRVR0kxYWlQc2NKRmVudXVl?=
 =?utf-8?B?VXRQelMvWTdZdWVNS2tiNjNnWDduMEpPaEkwYVIzQVd6RHlHYkQ2bmt6RTdo?=
 =?utf-8?B?d01GRFZWWjh2U1czQTF4dnpkOG00RFIyOGxaRGtyWDUveUowMVFjRmVtQkt0?=
 =?utf-8?B?clllT1Fuc1NhZWFFQmZtYXBjMVNIRXUwd3lMMHB0TE5TbFdPcC93eThZN0VP?=
 =?utf-8?B?V1F6OGRwVTBQQ3phYlBlNnMwWjk4aE5kVlJUMnh4TndmaXhEQ1NObVpQUVlX?=
 =?utf-8?B?UHd6SUpuczdpYStTMEZoUGhsOWtXYk5BMHRVd3NCOUp0UDh6bmNEQVcwTjRz?=
 =?utf-8?B?UWNIQUlrM3BQTmoxUFlTdTFpRThIb05wRHc0RXJRT0lrVXJwOTJucVVrMGNO?=
 =?utf-8?B?R2xTeDZSUUN4YTBYWUpOanhRT0FRYnB1dVc3Yk92eTh1QmpQbnViLzZ2YnBH?=
 =?utf-8?B?TlRoUUpUeHhrTWgzV0sycEJXQzUyMU03MEFJMmkySDRzazZkcmtrZ2tncW1E?=
 =?utf-8?B?a2JZcFVKZ1VTeEtZQ0R3eFYza3RIVVhHVkhWUkptb3VSSXVTY0xBU0phL3ND?=
 =?utf-8?B?enowWXYrbkNDQ2FzRnNhMGZPZHgyRFVJQmRNS2ZEaG8xNnJSRHBmazdNSmxX?=
 =?utf-8?B?T2kxd2JWUWltNHE4Z1BnUzNEOG0vakJZTHlCUGQ3YXNaWU95VkNNSitEd3k3?=
 =?utf-8?B?RVo3TzlZaE53dHZyT1JFVWtRN0ZYM0dNdFp5N1c1WndyL1d6aGxsU3ByMUZM?=
 =?utf-8?B?VStpcnRmK2tkU2dXOGE5cXY1OE5hR05QTWxTb3BjT3JwejZMSE13UGxOenlZ?=
 =?utf-8?B?UURtWFhPaElkTDI3NENOMGs1dSs0WmdjaDNuTGhGWkRZc3NoWW1RZ245TStD?=
 =?utf-8?B?SmZpTk9zSUhaMjQvemFXZEw1NUZCYnpNTXZRWklzWEtZMFNlNDlLR3dNUFJz?=
 =?utf-8?B?MDJOZTZ0djJvanA2SEZvbDJNbmRCV2U0Nm9TWkVGVkFubTdKVVhRK2pHWXR2?=
 =?utf-8?B?Qnlpb1VDbFdBTTZNYW5sS1FnK3B6aDlIRFViUHI4YXN4T2dpSnF3QW1ZN3oy?=
 =?utf-8?B?UEx4RTNKSlJSQXR5ZTdOTWM5UzgySVhqZXNIWjJCV0Y1dnZzSE1HQkhXbGZv?=
 =?utf-8?B?TXlDcS9uTGF6M3RrT1RtL1JRWmZxSjRjeVUwbjMvOURKWG1HT3ZjbEg0MDdl?=
 =?utf-8?B?cHNEeGVjQ1ByVkVLZXd0SHVBU2JOTXRoUVJQTzh6eDkxVWZwOW1hQWVSN2Zk?=
 =?utf-8?B?VTg0NE5UdXFmMnJJMHdlZllYYW9wODFJQ1ZNNkhGcGNWc0l0ZFE5eGtERzZZ?=
 =?utf-8?B?ZmJPdXgxQXExM1pXRzJpdTRmVzV2KzJpdFhTQUEwbUpHRW1oTWM5NUpJRytn?=
 =?utf-8?B?U0Z0N2RXLzczcWZEK2lRSHBmQ0wzSFFxMTJjVGptZ1pOSHIyM1A2KzF4amJB?=
 =?utf-8?B?MXBNTUFBclVoekgrbHRmNm5hWm1CalVPTDc3eVlkTXViVXAweHh3N2xsVVkv?=
 =?utf-8?B?b29YUFNqMlQ1dGZoakRkQkFtcUZ6dHNSMkRtLzBFTmFjc2xUanB0Lzg5N0JO?=
 =?utf-8?B?STRuVUx4by92UWhyeGpoY0tnTWh6M0FINlVENnZHanJ1YktPWWZQelZxcUkv?=
 =?utf-8?B?YjhuRk1DSXhWZXp2dmlNRktxOVlkblRIbURuQWhJYXN3THRWZkdGMXJTSXF1?=
 =?utf-8?B?NmlzcmdMQ2NLeFFXRzlsQTZ1T2xEdWpvWmVzOHZIWU56UlRuamR2b0hBdjBx?=
 =?utf-8?B?NjhWRmRBWUdqdjBsVW1pUVR4c2gvT2RqamNMa3FvVEdPYTUvbXRFR0pNQjhG?=
 =?utf-8?B?UytSRng1aWpPeWtnUWg0NWxXdklMbFdSaFVVaWNCcVRNUzYybG9EM2R6VDZ6?=
 =?utf-8?B?N3FxNDZibFUrVW9zMlZpeERML0RQUEc5QlVQUlBVZGdPR0tVcnAyaHpVcGVY?=
 =?utf-8?B?Y2FFeUFsd3FrcG1pVDhBcVpSaDJOaFBoc2hvZWpGWXQ4OXhXSFNKczZOOVpU?=
 =?utf-8?B?MUkvcE9LcU9LbDVpNTk3ZDZpR0ZKbm9mcEdhV09UNWxDblRCMWpGWC9tWk5O?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8uomvFhagFd0GGPLlB9GMWclL0ZV8EzkmFh3xiF2R8tiaTpmguXIPqQMBfleBzUwj2wxbIoxz/k/qxEXJJpX8AUXpJq7B//ondPb56UaP6u+RuMenMUdnlLq9ptDcG95BLmQu6ZhOwLFKMhc1icWBy7KxUuXcwbIgxUtJECBFPma5ZZAdTrkxPsa25SGZgMBV7b+N1tDA2uH/bpEfbZDdner6UfXXhGBRT2eqRCwfMe4w+cpSnMzcRrHhFe3OHhwxGqPT8WN2akGG0otEJJkBiQkJcktOCjUszc8/8Hgq7TTFfQdSIJI8ybe/uxSzU4FwOLZSWL4QQdgqB2UdvSAcFsYR5WFGx36O2fdH27bWrOB/9r4UgQYm9VSnd38HhFq3HCwL3538jX4KpDjsIQ1we9uB96xw6H8cIZCVqHWCOlEFUMl2Ovap4hzQtTvDg1DDfeL3fDFfGjpIjnZL0aLyI8o0eF/l05Ryr585txcLAKKp1Bf2Q7KvgwV3iJMdESakUL88EToZ8iPiJ1GjFcjsSXLaLm9THBGDL/mlo2zl7NOcR4Pt4M4sJ9jjLb3HJ0GfmygeBqLlJWterjnHmZSynVr4KB6WMgTDXXvQo+G6bU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250cca6f-7a75-495c-ae4e-08dda78d8274
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 19:40:37.8350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qReo5atb3pWd3v8W9oNNvEQkmQTSXh3QkYG+SGKUdcXB6NpfUW+xIsuPSUpEStjyChriTVCJ5coND1EhYi9WwTs3H5fuNDnKXnLxwL3xzo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4761
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_08,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090149
X-Proofpoint-GUID: HZ2E2OEvqYQsRQP4AQOBLEAlOQyatPAG
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=684738ba cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=vKqikLxY70d6_XfIc5UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HZ2E2OEvqYQsRQP4AQOBLEAlOQyatPAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0OSBTYWx0ZWRfX54Q20VSPWf1a CXDCc9K5EjdG5LtSh9ry8r+0cKcYUIImfrWsDSc/rVz3+LDGskePUGkpk5F8xyf/4q+f7r66PBg lVs95UdlwMa+a+jytIo0+e7WNbwx1/i8NVKS98WZ6i2MNEU08uj+AMPJyy16t500N9M48/DVCoT
 tjWdMPiN13Q11OazGM9bldLWdNiDrhO4br6HiujD4hY1QQ8cDeRmWAlm4IqFDcxB398JuqFcBOY g/2erzgayhXlCvmflnUIb6+UbnkYG4e+hJmBywP5Igr+lLKy9yhfyIuJCLArckyrPLDCR0tgMxp oyd/8xNelYzhuRHophXO7VsqbHV+T/Bl6zznEyQYzUmBrV30484CyZ6iymgt9hW3e7VQq2/h7tX
 +XJSXaTGxqYVImkeRoZahs+RL+CtS8D/bB8M4Cods8LPvXQiRbZSWDnK2KNH7f0H/Pg5J3U7

On Mon, Jun 09, 2025 at 11:20:04AM -0400, Zi Yan wrote:
> On 9 Jun 2025, at 10:50, Lorenzo Stoakes wrote:
>
> > On Mon, Jun 09, 2025 at 10:37:26AM -0400, Zi Yan wrote:
> >> On 9 Jun 2025, at 10:16, Lorenzo Stoakes wrote:
> >>
> >>> On Mon, Jun 09, 2025 at 03:11:27PM +0100, Usama Arif wrote:
> >
> > [snip]
> >
> >>>> So I guess the question is what should be the next step? The following has been discussed:
> >>>>
> >>>> - Changing pageblock_order at runtime: This seems unreasonable after Zi's explanation above
> >>>>   and might have unintended consequences if done at runtime, so a no go?
> >>>> - Decouple only watermark calculation and defrag granularity from pageblock order (also from Zi).
> >>>>   The decoupling can be done separately. Watermark calculation can be decoupled using the
> >>>>   approach taken in this RFC. Although max order used by pagecache needs to be addressed.
> >>>>
> >>>
> >>> I need to catch up with the thread (workload crazy atm), but why isn't it
> >>> feasible to simply statically adjust the pageblock size?
> >>>
> >>> The whole point of 'defragmentation' is to _heuristically_ make it less
> >>> likely there'll be fragmentation when requesting page blocks.
> >>>
> >>> And the watermark code is explicitly about providing reserves at a
> >>> _pageblock granularity_.
> >>>
> >>> Why would we want to 'defragment' to 512MB physically contiguous chunks
> >>> that we rarely use?
> >>>
> >>> Since it's all heuristic, it seems reasonable to me to cap it at a sensible
> >>> level no?
> >>
> >> What is a sensible level? 2MB is a good starting point. If we cap pageblock
> >> at 2MB, everyone should be happy at the moment. But if one user wants to
> >> allocate 4MB mTHP, they will most likely fail miserably, because pageblock
> >> is 2MB, kernel is OK to have a 2MB MIGRATE_MOVABLE pageblock next to a 2MB
> >> MGIRATE_UNMOVABLE one, making defragmenting 4MB an impossible job.
> >>
> >> Defragmentation has two components: 1) pageblock, which has migratetypes
> >> to prevent mixing movable and unmovable pages, as a single unmovable page
> >> blocks large free pages from being created; 2) memory compaction granularity,
> >> which is the actual work to move pages around and form a large free pages.
> >> Currently, kernel assumes pageblock size = defragmentation granularity,
> >> but in reality, as long as pageblock size >= defragmentation granularity,
> >> memory compaction would still work, but not the other way around. So we
> >> need to choose pageblock size carefully to not break memory compaction.
> >
> > OK I get it - the issue is that compaction itself operations at a pageblock
> > granularity, and once you get so fragmented that compaction is critical to
> > defragmentation, you are stuck if the pageblock is not big enough.
>
> Right.
>
> >
> > Thing is, 512MB pageblock size for compaction seems insanely inefficient in
> > itself, and if we're complaining about issues with unavailable reserved
> > memory due to crazy PMD size, surely one will encounter the compaction
> > process simply failing to succeed/taking forever/causing issues with
> > reclaim/higher order folio allocation.
>
> Yep. Initially, we probably never thought PMD THP would be as large as
> 512MB.

Of course, such is the 'organic' nature of kernel development :)

>
> >
> > I mean, I don't really know the compaction code _at all_ (ran out of time
> > to cover in book ;), but is it all or-nothing? Does it grab a pageblock or
> > gives up?
>
> compaction works on one pageblock at a time, trying to migrate in-use pages
> within the pageblock away to create a free page for THP allocation.
> It assumes PMD THP size is equal to pageblock size. It will keep working
> until a PMD THP size free page is created. This is a very high level
> description, omitting a lot of details like how to avoid excessive compaction
> work, how to reduce compaction latency.

Yeah this matches my assumptions.

>
> >
> > Because it strikes me that a crazy pageblock size would cause really
> > serious system issues on that basis alone if that's the case.
> >
> > And again this leads me back to thinking it should just be the page block
> > size _as a whole_ that should be adjusted.
> >
> > Keep in mind a user can literally reduce the page block size already via
> > CONFIG_PAGE_BLOCK_MAX_ORDER.
> >
> > To me it seems that we should cap it at the highest _reasonable_ mTHP size
> > you can get on a 64KB (i.e. maximum right? RIGHT? :P) base page size
> > system.
> >
> > That way, people _can still get_ super huge PMD sized huge folios up to the
> > point of fragmentation.
> >
> > If we do reduce things this way we should give a config option to allow
> > users who truly want collosal PMD sizes with associated
> > watermarks/compaction to be able to still have it.
> >
> > CONFIG_PAGE_BLOCK_HARD_LIMIT_MB or something?
>
> I agree with capping pageblock size at a highest reasonable mTHP size.
> In case there is some user relying on this huge PMD THP, making
> pageblock a boot time variable might be a little better, since
> they do not need to recompile the kernel for their need, assuming
> distros will pick something like 2MB as the default pageblock size.

Right, this seems sensible, as long as we set a _default_ that limits to
whatever it would be, 2MB or such.

I don't think it's unreasonable to make that change since this 512 MB thing
is so entirely unexpected and unusual.

I think Usama said it would be a pain it working this way if it had to be
explicitly set as a boot time variable without defaulting like this.

>
> >
> > I also question this de-coupling in general (I may be missing somethig
> > however!) - the watermark code _very explicitly_ refers to providing
> > _pageblocks_ in order to ensure _defragmentation_ right?
>
> Yes. Since without enough free memory (bigger than a PMD THP),
> memory compaction will just do useless work.

Yeah right, so this is a key thing and why we need to rework the current
state of the patch.

>
> >
> > We would need to absolutely justify why it's suddenly ok to not provide
> > page blocks here.
> >
> > This is very very delicate code we have to be SO careful about.
> >
> > This is why I am being cautious here :)
>
> Understood. In theory, we can associate watermarks with THP allowed orders
> the other way around too, meaning if user lowers vm.min_free_kbytes,
> all THP/mTHP sizes bigger than the watermark threshold are disabled
> automatically. This could fix the memory compaction issues, but
> that might also drive user crazy as they cannot use the THP sizes
> they want.

Yeah that's interesting but I think that's just far too subtle and people will
have no idea what's going on.

I really think a hard cap, expressed in KB/MB, on pageblock size is the way to
go (but overrideable for people crazy enough to truly want 512 MB pages - and
who cannot then complain about watermarks).

>
> Often, user just ask for an impossible combination: they
> want to use all free memory, because they paid for it, and they
> want THPs, because they want max performance. When PMD THP is
> small like 2MB, the “unusable” free memory is not that noticeable,
> but when PMD THP is as large as 512MB, user just cannot unsee it. :)

Well, users asking for crazy things then being surprised when they get them
is nothing new :P

>
>
> Best Regards,
> Yan, Zi

Thanks for your input!

Cheers, Lorenzo
