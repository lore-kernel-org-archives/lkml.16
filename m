Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012029.outbound.protection.outlook.com [52.101.71.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE4C1F09A3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.29
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663062; cv=fail; b=KcCa4myktSjdnqyi+GZw13sm8Gi3qf9xJUkBkBaOID8nHT47ryj5ooPQwg/38+DyB9sPu+eUv1BF0UIkedkDPuMM0//Wu56tWxQtC0UGiC1pJwKwMgSwHQUmOm2tmWwXrXAUcU+HiBPi23LFNYjlqzdLwtpR/4ejR8qEs/HqB1Y=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663062; c=relaxed/simple;
	bh=M0CwmZT1Bx2aXjGrqoeBHP2DHnU4bMY+BLTaVlM83ww=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qLomfrNFg0H+OnyOVKqetSqOd4mKwdoFwWttcDZa30wcqMgCLgOPqHUsZeTjp/sl9pXD9W9EkdHluEcFPMffdufPNXZ6VIKVgreWdC62aOasOTv+6L43wJoCdG3iqzNRgeqmfrrtB+zAsx2ZV4K/iolJkne4a19ONYF4fFfb4Eg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=g9SMgbKn; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=g9SMgbKn; arc=fail smtp.client-ip=52.101.71.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g9SMgbKn";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g9SMgbKn"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QTXnsK+S+Rptq359FfnAqVbcShjbmOUbSBm92eupskwdbbSw2dP00Qd+NiV0lzIn/w8Dbu1z4p1eajYGBszM4D1CdVSLyPxbfytIkfjtxvSKqV2spafGajXSR2xVuBG+3kb885j1a30FOz87LSnpcbXzTAvJWH5XX7MXSUB23qDq+t4C5BnzLKtivIUFeSdWJw5lO+2tAmvcoi+QA2Yf6sGPhJj1jyWOvXZcd5D+f2Fp8Hpygz8Y8TGYbEgPsqQppQlYDQNxL1J+7zF9ufaukzz8dhNX1TqUGIYKvO94FK3oPDzMGIQn41JHNN51NqCNbvbK+b1avoZ6SgGGYcY/mA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG9g5dWsPu7jCMF2Isuov8qulNNYkTw+DxWpsCNvVr8=;
 b=tDOUptyVv2R/4GIsh4aaRlyb+lLSlqwUp9RxGsgtVX7q5RCbOVOaN+zgSxT/+YZIPtlLc66bFip+tx7ztdl/6PkVw4ZBm+f9yF1jp/ibuKKUG5Zbnt4D60u9dClTxCnCKr/ooevaMWKCMNA6f2+LHDKFpEwzaQtobTKz/UaCmBhO2yI+BgCDcTAaSXLJ4A86g4OCaIfDryBFskUN5udpVXP3yD0Z4FqfC/oJbetDvWFdgUslSFmRHSfrpVu/b+yizrRtno9NZcZ/E7Iz2GSP96jyLfRP9aw9PUD69R+A7X7ASjmVmcKTzAY3spsOwBgh7uzIiZwbZaFcJx3taVqnSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OG9g5dWsPu7jCMF2Isuov8qulNNYkTw+DxWpsCNvVr8=;
 b=g9SMgbKn409Cu3gYE1dLH/8N76sdiM6VnIuesEL31tZweqaSblu8chQSKmEk248brN7h4s8SAsVvtxy3wIXC5QjGn8H3QE6+aKT1oOM6R8d4d8STlXalW53stzNruzDGfuVPZDA7ZK0O8176NJ/FNyHOonKHgNumJl7MeJltX4U=
Received: from CWLP265CA0392.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::17)
 by AS4PR08MB8219.eurprd08.prod.outlook.com (2603:10a6:20b:51e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 07:17:30 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:400:1d6:cafe::74) by CWLP265CA0392.outlook.office365.com
 (2603:10a6:400:1d6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 07:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 07:17:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5d7rM8fzaZQbonpjOrMpm9Max4M3PuUn5qJBNaYPMwn7aGXYo08anY3wL0IraFtrmGZE9UcpjZeL4p8R5pwbVK2k+1w/YoqMNW1XQs3CeeuaKsXmwfFyK4fHPw7vxYKjPwLbtUvNe4Zo+SEa0/VQUEmbB12x8iW3+rm3g4pzzm5Nq0nABank09bR+KJN8VvRDa0UAiF+m7GnxkiCw6CE1G17r1KHKb2Hk0vq78SqrADlMRNT4mpLF7luzx2NqbivX056460ifdSoSSyamtF1POK3rOZJTKTaSJgOw1cPk3EGXYhm7mCacTck8lfOqAhymfRtEQt386FSJdgRXg7eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG9g5dWsPu7jCMF2Isuov8qulNNYkTw+DxWpsCNvVr8=;
 b=TR/1PeHFGOGm5a34mqsX1P5izQ0VJjmVJ8wLL6ynIi1nV7uXmgWuDO9CQ15i7puNzm5cxugnUZnBkMHOvolSoZcOatE9629BZJrkcZOHz/rNL0sHlXTF2M2Yte8XYvfEaRg5Wz7xHfVbuSoDkNLxEcqHtx9wpP809MU6JKziNCuQmXXrWr0hXP4daLJ7SHohyMFZHVTN5S49ze74nOywg15dhw2EpPhePgMZJrF05KkV7IzPP85R9fc3bJNgQV9Q5tLb4fAVa3vv7u6/l5JZU3NEdqDjLnziaczLV3YLomdinfrZVJIqGmXKpjyezEhsr0403JZ67XZIdnmhglXG2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OG9g5dWsPu7jCMF2Isuov8qulNNYkTw+DxWpsCNvVr8=;
 b=g9SMgbKn409Cu3gYE1dLH/8N76sdiM6VnIuesEL31tZweqaSblu8chQSKmEk248brN7h4s8SAsVvtxy3wIXC5QjGn8H3QE6+aKT1oOM6R8d4d8STlXalW53stzNruzDGfuVPZDA7ZK0O8176NJ/FNyHOonKHgNumJl7MeJltX4U=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB6214.eurprd08.prod.outlook.com (2603:10a6:20b:29f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Mon, 23 Jun
 2025 07:16:56 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 07:16:56 +0000
Message-ID: <0c20196b-f5bd-4238-bbb9-316f6ac3078e@arm.com>
Date: Mon, 23 Jun 2025 12:46:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Optimize collapse_pte_mapped_thp() for large
 folios by PTE batching
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@redhat.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250618155608.18580-1-dev.jain@arm.com>
 <d2aee3d9-d3a9-4c69-ad03-8e5774d12dab@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <d2aee3d9-d3a9-4c69-ad03-8e5774d12dab@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB6214:EE_|AMS1EPF00000041:EE_|AS4PR08MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c80a2d4-7a71-4261-0317-08ddb2260393
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cnVKOEVlQk1maGxneWRNR2JHK3IzdUY3WnczTHJSVVIyNEZhOEhuM1JiQ1My?=
 =?utf-8?B?cTFXYlR2OXJ0RGxoSTJEQVV0dHFQUnlNRG90RUNHcXVzWmxHbGVrN0ZmM3pm?=
 =?utf-8?B?T1BzazFXQUhYMVhnR0htR0dDanFVWUJwS3I3d0lKMGozeHlEVW1zdFF4YWJM?=
 =?utf-8?B?SFhrVFlta2FYdnFCSWJkYUdTVTd2NzZPWnpoRUgxOGttNUFBMUFjQ0h1V0kx?=
 =?utf-8?B?djJVZEdxc0krNlJaNStkMWNRcGF1Vm5vR2tJb1NKMC9ZbWp1b1VWOG9HeWl5?=
 =?utf-8?B?UTdaQ1pCemFYcWhnd3BMTHR3eHE2dG5pelAvT0xMSVdKOXR3Z1h0cG41WFZq?=
 =?utf-8?B?VWhXVG1FVTdudnlOVFZFZGpwVUlXeVJ6MFFTTy9uR0VMRXhYZ0d4WTczb2xV?=
 =?utf-8?B?MFg4UG41TWRzRG9iRnEwZU1qNlhFaFJndXZWUmZaQmZialNhWDFhODVBWm8w?=
 =?utf-8?B?L2g2eUZVaGZkQlNwZTdkUDBmSjlPaDhwL3hYRmtHZ0lLdG9GTW00TFBUSEJM?=
 =?utf-8?B?MVpZWWEvaVlML2lsSUJINnlnOExXcTNmVWU3VjRtR0VxMDQ2QTJPbDhzZTAz?=
 =?utf-8?B?akZlTnh4WFZ2ckI4Z3d3UnJHNXh0Nkl2R25qcHhocmFRenFwMENVamNRME5J?=
 =?utf-8?B?NVZmY2Z2UEpNdlg1emw5OTN1bFJpTjdtOWtOTklWV3hZY09CUVNIeWJSaXov?=
 =?utf-8?B?Y1pQMW0vUFZWVDBtL0h3RStkZWlyNWt2bk9XQkJkamsxMVp2bFZxWkxoSEhG?=
 =?utf-8?B?N21VZmlFc1lmUit5QlE1UzhWdW5KN0ZZanMzL0oxdU9WSExMdEtST3MrNzR1?=
 =?utf-8?B?VGRBVGlUQUpxUjd1a1dtLzlobzJMT202VHB1R1RpOWZQUDgvbytGTGlTVnRK?=
 =?utf-8?B?bVJDNW5zQTVZMkVldXhvQlJVMFZFM0RNVDM2RHVJaTlscTI1R3ZIRUpZRHNS?=
 =?utf-8?B?K2RaTW5MNGFobElpYjlrQUJqaHkxM0tXcFhzTjA1RGprRjdvZmJjMFA1OVNO?=
 =?utf-8?B?Smx4TzFZdjQ3TGZ6bnRRaXN5ZUl4M283MDdlY3NGMU96bk10WXliK2hTMU5n?=
 =?utf-8?B?bURhcVlneHlLaEIwSHFtS2UrTGliRFZuVUFTRXV2THNJRVptRVJpbytjL2JJ?=
 =?utf-8?B?VzBuN3NQR0pxTy91S2tpN1JwUWorSVFTUHZsZG9BbmRGd1hmbGErcFdpME1T?=
 =?utf-8?B?TFc0dmN0N3VuYUk1OXgydlM1cklZQkJpVEgvWC8yR1kvYVBscXFPckc3dEky?=
 =?utf-8?B?dXRCbkNhZDZlM1lpUlJMKzN5UzYrVXBja0xSZGQwT0R5Q25iR0Q1QkhIc2hi?=
 =?utf-8?B?ejdpRzQ3QXBpU0xyZ1FUZWtlaS9yZklXb3NKbFZ0V2FBM3hSd05jaEtzMzhX?=
 =?utf-8?B?Mm8rZlBHNkgvRkg1bWJqb2hjUldnNjBRd0R6RWFuYTZINkt3MW9ZV2dNNE84?=
 =?utf-8?B?dFVIQzV0cDdHa08xTU50YXBnK0NDQkJsSDczRHdxZnNuUU5VVXJhOXN1eE9v?=
 =?utf-8?B?SEE1aG83L1kvYTFPOGw3U1V6SDg2VnR6MUdGeGVqOGVOcWlNV3FwWjFiSVlI?=
 =?utf-8?B?elI0Y3AxV3JZNElVcUxqL0hISXRzTGJNamJ2RFJQZ3RhMitUQlVDdFc1QUZ0?=
 =?utf-8?B?WDQ0QlQ5TlpsZzZRNXEyaWJrS3BNTjA3a1FoajMxc1k0S1gyazFEQldobm5R?=
 =?utf-8?B?czhCdWxUOEh1ajF1M2FmSHVJdkZ3bnFPTGxFeXpNTlU3dlk4SnYydXZkS29q?=
 =?utf-8?B?Z0JlQWJwd1BiRHdEenViRWVpTDU2MFhWNzNmRm9QM3UyNENNQzBCNXRLWnV6?=
 =?utf-8?B?V1h5TXJqeStmZkliUmcweUxZYy9leFNYK2VKRUpYeWxoUFdUVWREeC9BTFV3?=
 =?utf-8?B?QlhjbnJ2MEhyL3Q1R3RKa3M3Z0RCa2VMYzhyY0xTK1d0ak5WMjhoekZHVytN?=
 =?utf-8?Q?YXnS9J2RVXM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6214
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	428d87c0-a4fa-41ff-643a-08ddb225ef91
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3Z5UjRIYmdjQ2Ewd1JwUGZsNHZMUFlrYnRZaW9DRFN6MzhHL0d1T0NCdS82?=
 =?utf-8?B?OUZnS0RqQnJpUnVlZG4veHRIMUJxd1pHcllaeUFvOEV6QzZFdktBd0JmcE1L?=
 =?utf-8?B?cWxSTVp1azlxZzRweUttSzVsVTJLWlFwV0dhOS9qVGtLejNjZDZlTk84V0ls?=
 =?utf-8?B?dmpnRDVYNkVqU1czMTJkdGtxZkZBSERHMTdQMkw2dkNrdlpTdkdMVDZIMzBF?=
 =?utf-8?B?djlRYlpmWmlPbGs1YjZKN0EvR3NZS1BlNVVUK2I5anFJamdIT0xCV2FEVFRK?=
 =?utf-8?B?YVNOL1VZMGVvemMwajhsQVBNL0d0clduNElnWkR1YjkzNmFEdTZhN3NuOGl5?=
 =?utf-8?B?NncvWDZONFNtWVZXaEwyNXgrOWpZdjY3K2pjL0dOa1g0NjNoZTMycVFrSkhO?=
 =?utf-8?B?WEpIcVVheTYzNlVnMHY5bno1aWZQNnhMMnpHT1BGNE9RajRvSDd4U1VUQjNw?=
 =?utf-8?B?QzRIa2xpbmhrSUdVUWpJT01KQ0lJSTB0T3MrWk4rbjlUT2IvY2xGMWRkMjdF?=
 =?utf-8?B?MlhPWUZFRW5NTERBUkJzbGh5SGk0aWh3dkdYZExDQjg5ZHVaM29haVpqNFox?=
 =?utf-8?B?R3FPd0JxNjZiOXpiK2x5MjBwZkplaHBKTUJUUUxiemgwUVY4QUVzckR3cDc5?=
 =?utf-8?B?eDFRWnJjV0dQNXpBSlRGZVB3SmpYUUp2TlU3RW1CdElLQ2RDSUpUbGZYbWdB?=
 =?utf-8?B?MFNQaHBtT1owcS9YbW1RdHQ5TXl3aEJ3NTg3OXlvTnZBcUREUzh5cWlndDl5?=
 =?utf-8?B?Nkl6VlFiVi93aTUrSTQ0UTZSRDNySktvVDJFb3huQUpaTU9PSitWOE4yVVN0?=
 =?utf-8?B?ak9GV1J6OFMvMDlBY2IyTVNQWUtmYVdoT2NidUhvZEdCUWlIQ2tIZnpUMHEv?=
 =?utf-8?B?aXJJVVVBV0pYdGdYWk43NkxVZzJrak1PeGtzYWQ2VC9adFplVEJZa3d1UWpD?=
 =?utf-8?B?OWhwT2w2cjBUU0ZhQjZlSHprUUlhSTl5RWNSWFhQcVhvS2RWamdLYmFtS3g0?=
 =?utf-8?B?STRLdDJsaUJyd0VDNWxzQ2ZkT1NJWEhjYWJYNHYveEVzcXFGWHcvR2s0TTNn?=
 =?utf-8?B?bGM1WXVnS2ttWjVIbUl6cHdnYWVmdzRzcFdQb2FDS3dtQzVidWF0d0p5bDBj?=
 =?utf-8?B?YzRpbGZBTXBXSW1aYUtFZHNxWmFCYzN0NE1KQ3JhOUthc1h2YURBWVNYWlhv?=
 =?utf-8?B?RDQ2eHlQTXdoaDJFb3Q5UEFPekhTVEwvZmxVSndKMFE2UFp5aTNRcFZVSkky?=
 =?utf-8?B?c25SYjZQMGxuSDJFK0J3Z2hFRlE5YlNaaDlMaFdLNTE2UEtCUThpb3VWZEQv?=
 =?utf-8?B?SEc1VUlGUmNPeFdIaDVMRzlwbzlyRUdaM09yY0V0VkpRZ25PblQxT1ZnRFE5?=
 =?utf-8?B?czQ5NzREejNUS3FjYVB1NjVpVmhQYmREbVZEQVh5OXdIME1kelBDNEdnNzB6?=
 =?utf-8?B?bjZJRmhFVHFYaExQeDFHV3UwZ1Q4THhGMVFGTmUxcmRLSkpjcW0rU2FibkNF?=
 =?utf-8?B?bDBjMEFURXZiNzFPZFhiREYvQVAvY1hjWUZ0QjhuU0V6YkFIYjlqeXJ3bkZK?=
 =?utf-8?B?MW8zY0hKa0w4MnlVeW9mTnBxcDUzWEh1WnhlaWp2R2cxS2phRTZkS1EwUDlU?=
 =?utf-8?B?dEloaVZRSEF5WlFOMmpKMnYyQUZKNWlLeFFHcGlqYkJ0MFBjek1Nbi9MYkQr?=
 =?utf-8?B?WFdtVEYwcHFnR2lpS05XVUJ2REpIb0NaZFh5OXFQb01XQUFvYlA5R3Z0b3FS?=
 =?utf-8?B?OEVXSlBWYmNQK293RFdZSHQzQWlJMmUyOFcrRzZibGh5dlUxeW9FTjJlUmhl?=
 =?utf-8?B?RUJ1RmNOMHZWSkZxclEwY1l1UW1SWDJUTSs3WmZPRzVzc1FoQStUYU5POXFa?=
 =?utf-8?B?QmpjcWZuZ3Q3eUJ3dnlzbFV0NVRHY3ZHQUFjdTB1a1ZiT2s3cWFidnpCaXE1?=
 =?utf-8?B?a09KMWVPZ3ZtbGUwZ0d6aHF5RXY0bzk2ekYzVGo1eit5RHYzVVk2MUZmTnF5?=
 =?utf-8?B?WmJrc2lmSnY2VGNPMVJZaVdPWk02cnY5YWcyQlBFREIrbW1EVXlVQytsVWpZ?=
 =?utf-8?Q?RGZ2mi?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(14060799003)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 07:17:29.3972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c80a2d4-7a71-4261-0317-08ddb2260393
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8219


On 23/06/25 12:10 pm, Baolin Wang wrote:
>
>
> On 2025/6/18 23:56, Dev Jain wrote:
>> Use PTE batching to optimize collapse_pte_mapped_thp().
>>
>> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for 
>> collapse.
>> Then, calling ptep_clear() for every pte will cause a TLB flush for 
>> every
>> contpte block. Instead, clear_full_ptes() does a
>> contpte_try_unfold_partial() which will flush the TLB only for the 
>> (if any)
>> starting and ending contpte block, if they partially overlap with the 
>> range
>> khugepaged is looking at.
>>
>> For all arches, there should be a benefit due to batching atomic 
>> operations
>> on mapcounts due to folio_remove_rmap_ptes().
>>
>> Note that we do not need to make a change to the check
>> "if (folio_page(folio, i) != page)"; if i'th page of the folio is equal
>> to the first page of our batch, then i + 1, .... i + nr_batch_ptes - 1
>> pages of the folio will be equal to the corresponding pages of our
>> batch mapping consecutive pages.
>>
>> No issues were observed with mm-selftests.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>
>> This is rebased on:
>> https://lore.kernel.org/all/20250618102607.10551-1-dev.jain@arm.com/
>> If there will be a v2 of either version I'll send them together.
>>
>>   mm/khugepaged.c | 38 +++++++++++++++++++++++++-------------
>>   1 file changed, 25 insertions(+), 13 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 649ccb2670f8..7d37058eda5b 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct vm_area_struct 
>> *vma, unsigned long addr,
>>   int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>                   bool install_pmd)
>>   {
>> +    int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;
>>       struct mmu_notifier_range range;
>>       bool notified = false;
>>       unsigned long haddr = addr & HPAGE_PMD_MASK;
>> +    unsigned long end = haddr + HPAGE_PMD_SIZE;
>>       struct vm_area_struct *vma = vma_lookup(mm, haddr);
>>       struct folio *folio;
>>       pte_t *start_pte, *pte;
>>       pmd_t *pmd, pgt_pmd;
>>       spinlock_t *pml = NULL, *ptl;
>> -    int nr_ptes = 0, result = SCAN_FAIL;
>>       int i;
>>         mmap_assert_locked(mm);
>> @@ -1620,12 +1621,17 @@ int collapse_pte_mapped_thp(struct mm_struct 
>> *mm, unsigned long addr,
>>       if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>>           goto abort;
>>   +    i = 0, addr = haddr, pte = start_pte;
>>       /* step 2: clear page table and adjust rmap */
>> -    for (i = 0, addr = haddr, pte = start_pte;
>> -         i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
>> +    do {
>> +        const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +        int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
>> +        struct folio *this_folio;
>>           struct page *page;
>>           pte_t ptent = ptep_get(pte);
>>   +        nr_batch_ptes = 1;
>> +
>>           if (pte_none(ptent))
>>               continue;
>>           /*
>> @@ -1639,6 +1645,11 @@ int collapse_pte_mapped_thp(struct mm_struct 
>> *mm, unsigned long addr,
>>               goto abort;
>>           }
>>           page = vm_normal_page(vma, addr, ptent);
>> +        this_folio = page_folio(page);
>> +        if (folio_test_large(this_folio) && max_nr_batch_ptes != 1)
>> +            nr_batch_ptes = folio_pte_batch(this_folio, addr, pte, 
>> ptent,
>> +                    max_nr_batch_ptes, flags, NULL, NULL, NULL);
>> +
>>           if (folio_page(folio, i) != page)
>>               goto abort;
>
> IMO, 'this_folio' is always equal 'folio', right? Can't we just use 
> 'folio'?

I don't think so. What if we have mremapped some bytes of this PMD range

to point to another folio.

>
> In addition, I think the folio_test_large() and max_nr_batch_ptes 
> checks are redundant, since the 'folio' must be PMD-sized large folio 
> after 'folio_page(folio, i) != page' check.

As an improvement we can at least do likely(folio_test_large()) since 
this is very likely.


>
> So I think we can move the 'nr_batch_ptes' calculation after the 
> folio_page() check, then shoule be:
>
> nr_batch_ptes = folio_pte_batch(folio, addr, pte, ptent,
>             max_nr_batch_ptes, flags, NULL, NULL, NULL);
>
>> @@ -1647,18 +1658,19 @@ int collapse_pte_mapped_thp(struct mm_struct 
>> *mm, unsigned long addr,
>>            * TLB flush can be left until pmdp_collapse_flush() does it.
>>            * PTE dirty? Shmem page is already dirty; file is read-only.
>>            */
>> -        ptep_clear(mm, addr, pte);
>> -        folio_remove_rmap_pte(folio, page, vma);
>> -        nr_ptes++;
>> -    }
>> +        clear_full_ptes(mm, addr, pte, nr_batch_ptes, false);
>> +        folio_remove_rmap_ptes(folio, page, nr_batch_ptes, vma);
>> +        nr_mapped_ptes += nr_batch_ptes;
>> +    } while (i += nr_batch_ptes, addr += nr_batch_ptes * PAGE_SIZE,
>> +         pte += nr_batch_ptes, i < HPAGE_PMD_NR);
>>         if (!pml)
>>           spin_unlock(ptl);
>>         /* step 3: set proper refcount and mm_counters. */
>> -    if (nr_ptes) {
>> -        folio_ref_sub(folio, nr_ptes);
>> -        add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
>> +    if (nr_mapped_ptes) {
>> +        folio_ref_sub(folio, nr_mapped_ptes);
>> +        add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>>       }
>>         /* step 4: remove empty page table */
>> @@ -1691,10 +1703,10 @@ int collapse_pte_mapped_thp(struct mm_struct 
>> *mm, unsigned long addr,
>>               : SCAN_SUCCEED;
>>       goto drop_folio;
>>   abort:
>> -    if (nr_ptes) {
>> +    if (nr_mapped_ptes) {
>>           flush_tlb_mm(mm);
>> -        folio_ref_sub(folio, nr_ptes);
>> -        add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
>> +        folio_ref_sub(folio, nr_mapped_ptes);
>> +        add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>>       }
>>   unlock:
>>       if (start_pte)
>
