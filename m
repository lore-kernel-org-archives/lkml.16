Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C012191F74
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.1
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454359; cv=fail; b=nCFs6+EGD4AakBAsR+1qHAKpZdH1u2B/SIV1Gh+sy2qAKzZbDcbf7zq31lR1wA115HIGWdfo03biUZ4W7tHa+dOWZqS/6pGZGUS7Tp/RPFPPljvdrxq7XCmPJdKIxtbwiQmDxhSJwPCFvL2SQ+ogo6MFdSpwVnBe1MUtmA861HI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454359; c=relaxed/simple;
	bh=XLITMwH3JTOkDU2ASz7KnjWg4Afdimn96ogp04G07/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qCmzaddfhkL2X3oIRYNKg5qF7tvYgnPmgCP/9qqZ70ly4yewBipHX+AUdclzeW8hxoZxpHLrLqJW8gOLLHfjcpuyOp/FDYja1bGCEugWS1GgRUN3Kawizj8ND40oiAPBNbibYo1tjPR6oGfuW2Km04/sG2veh1dJVO7/VSvhbIo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SmAAjQ5M; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SmAAjQ5M; arc=fail smtp.client-ip=52.101.65.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SmAAjQ5M";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SmAAjQ5M"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AFg6fWmPfmGvdIbXqth8vjJWJ9PLgGZUBNgNd8/P856fwCqNwOpQvw1IQ8YUiKLYAMs1evDGQ+Qz6ljs8ldLt82KJgL+EcQKvc2FLqaULiuckHCZhdSkxSvhCbVfRof3hxxyA63Pdyox7CmrfaWxa+zn89qRP9Rpq4GOiktCf5oQX/AcwMnYCLp95qEJ9ZscCOxwrIDFmbU7rMtLhcZa4DDjS66FmrF9PMtWSt0Jw8aIVqhHFO4eB8+9rbku0Ui612ZSV9TFMA3HGnlfY3DDX6Ma244bSZfxw6vyUa90cVW2KbhQqtn9wRYLGprauIFfOcsyw5zx/H4nxWFsNdHjDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ4XjANDypB6xSZ5gpbiDZdBoT89c7RIyQ3RUMjwI90=;
 b=yMbzaj81y119RtXpLrWISC98iIsB0Q/L4RD28bHQ50eHUJEPNvQbhuqcsiG8XLERUTIDZUefhsdomim6m01e32lHMfZ7HF8DiHhYWtp1bBwpuBDSNjMsfOSUpvmMFw+2/yxaPW+y+liJqZEIoOn5LckY3IWmKfX4ZGeJF87w3drEBZgj2Mu1zGD0ytFV/Vj7Ui/58uplNSUCheUEZNe7vRrFo1w19UPeTV7WQyoapFarRuDt2w0ZvMJ+MvqEjo7qSN/ZdXS7/uZCWsP/YX2YLXfRis5CXGBemeW519NT+w2YavhA60peovVyNdG+SS/7WoJBRbVNlI/d9eazYKkWZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ4XjANDypB6xSZ5gpbiDZdBoT89c7RIyQ3RUMjwI90=;
 b=SmAAjQ5M4foczQtXnDZ5Jhf2oirRcG/Ld+Qr1sN+997entBaf2/aWC6ab/SduP8kNwHpRjbtCH92PJNf2hMCOSrCvpwtvs+zwZQI01xYWF5gJ2e7GMNI7xMnpJ4bLzdYjHGkNIbDdC1sK0eBwi1bsOwoZb1szJDFZ5/mTXfShaE=
Received: from DU2PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:10:3b::23)
 by AS4PR08MB8021.eurprd08.prod.outlook.com (2603:10a6:20b:584::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 11:05:50 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::92) by DU2PR04CA0018.outlook.office365.com
 (2603:10a6:10:3b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 11:05:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Wed, 2 Jul 2025 11:05:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spebgrjlki/rRy9GnH0Iq1lHpa26gMToQdzZa3uJx0yLK/8W136sLYtdeMb9brjmtig6N1p3OKUE6DnZdJAy/sNCUIo4KC7HZhUXGuRFOC5mBdbGorINOadr8Ur74QSmIZ2tTHSqbS6tWAFtfiIOirQEsRwMTaSx4L1Zq+LoSep+DkTCUbM4byTYYTVQQ9wT1CsCAbYN4wHWGPNORFYoHrbmVYmjRMKCLiHsbWLM+pBUUrWiknKBiLmN8RoydTXBd6VCfZvCUAmDLUaxqXu/zAMApNkjW1sU7SWZG6kzkuVoEp2JNwVeBEwC35gYJ6XD5pSx6DZPemPE6HhauLN3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ4XjANDypB6xSZ5gpbiDZdBoT89c7RIyQ3RUMjwI90=;
 b=nIjJ+czFhHGTSij21ThCvH2Id8KKxmrqF0ep+HnRJqZlwlJqB3YCXP0Uq0Rvv6/H+Gcj7V/pRWOklJtF199AlrtUzqnHSS5NmkVb+T2pA4eR4sZV4ymkf+nuIaorzg6TtIFlcOJQQZBz+zXxsPShXAE7u1hhn2n8CwEXdd4ujru8nR9F7kqTrwoKiz8Ri8gGBkmw5R4+VA74lMrlwNHlHIJuxboURa6GljDm0xzvyS9vk941joLFan8rf9iDyK2FFshM8MF3X19F3Np1KvotFufrWUtomi2G4eQuni55uA8VfkCQ/rQT2X6ekUHcTomzE9pvzs6hHB9cANlYcup4XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ4XjANDypB6xSZ5gpbiDZdBoT89c7RIyQ3RUMjwI90=;
 b=SmAAjQ5M4foczQtXnDZ5Jhf2oirRcG/Ld+Qr1sN+997entBaf2/aWC6ab/SduP8kNwHpRjbtCH92PJNf2hMCOSrCvpwtvs+zwZQI01xYWF5gJ2e7GMNI7xMnpJ4bLzdYjHGkNIbDdC1sK0eBwi1bsOwoZb1szJDFZ5/mTXfShaE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VI1PR08MB10031.eurprd08.prod.outlook.com
 (2603:10a6:800:1cd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 11:05:14 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 11:05:13 +0000
Date: Wed, 2 Jul 2025 12:05:10 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/28] coresight: etm4x: Add context synchronization
 before enabling trace
Message-ID: <aGUSZpR1QHNgLu6f@e129823.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-6-23ebb864fcc1@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-6-23ebb864fcc1@arm.com>
X-ClientProxiedBy: LO2P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::23) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|VI1PR08MB10031:EE_|DB1PEPF000509F9:EE_|AS4PR08MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f44fba-4ef3-4d16-8d43-08ddb9586769
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?aDzH8RWPvCZ3sNRD582kt8GF5bcoW8U1/JxOi3x3ooiLttF9KBwYJugxlHYP?=
 =?us-ascii?Q?S3vUbYuy7At6u5Ooq+xsbBJ5+2ljjRaK9SRomGmtbdzngi62pMNqO1YxJ8V/?=
 =?us-ascii?Q?szxLtaHjqdb2yhrWxoDrdwxODcDDe8wR/X4lNKWW0aA/AU3yTPd1h5Wsl3mt?=
 =?us-ascii?Q?3dX8eINHBt+A3ji42NU7aj0nOawA/4wTlVj67dk6ot2PlYULjfrrsSe7II3a?=
 =?us-ascii?Q?p9cGGxHtZfx0SOIN0GUGif2bGzoa+JF34jMKz9Io6vEtHj1rwdhziC3pGPk+?=
 =?us-ascii?Q?Cou9WocctuZbGS+HVGqi/MUptrfXtKam64L4hgEaRwLEMb2sfBDJAuTpPGmO?=
 =?us-ascii?Q?8wUfJbLLjN0KaMOrD4MDwDqmpEStovgJPl7YKyyoRxzzzzdszCB7NPoT3/P0?=
 =?us-ascii?Q?Che7SHXOQ6z7/iKa+Qfyykae1U7F0pIOO1n/q7ro306QDd+k52Ag+0d3tPEr?=
 =?us-ascii?Q?KAK8GPB7o1PrGMcYGbdNWHjUvWU5KMVpE+o1jZ9Fp2y5/GppEMuvpsGcF8H5?=
 =?us-ascii?Q?GDT5DkE6WLBzHuSdlqe3acXmGwgI4jY4CognMdn/M8Dz4lpHvDKQ09hrSx3Q?=
 =?us-ascii?Q?X4FxfOfz6YcoOP8q4RCiZ52THkjbk0NZXGXFD8MQxspX+u31ObHfAcMEjyH5?=
 =?us-ascii?Q?WB1OEZ6Bgr/EJl5z9j1og4jXB/G74GLwU1bxefTyMYscB7Al8+hjtOn5qmE1?=
 =?us-ascii?Q?3mMrpRAnophNUEkCyAomS2Ez9TT2LKXnbRL92zIEQUWqQFOfEZhkg+K5D5r2?=
 =?us-ascii?Q?wArQUPHPvpZy3ZdSN+xUN5jPQRZ0ys90FfinRW+IEffsdetnFr7p9AmpEN6b?=
 =?us-ascii?Q?Xj71h88Io8L4HFN33cFT9SRVGHn6z+KkEvNKHXpZIFNr2EUQbo0WbvCiQEtQ?=
 =?us-ascii?Q?n0DR76q9yGJLIY0zIaIfgOioPCAo5wfRzCrkEFSJkWMJjCnnKGp5WiQBQoAp?=
 =?us-ascii?Q?6ndyDONYzkuoBlipRY0YihcTJeKKmA8BQ1DKJKUb1+LBsP4BvXuZ2yZ7NFe0?=
 =?us-ascii?Q?mj3EcLoc0NLz+xonFhlCahNIezlCv49+oFBEwBmhhXV6NKrIQ7l7W+YxhJOU?=
 =?us-ascii?Q?eI4scQIlb6qVWWc4CMFhqJgvfuGY3w5ZKDUfBOKorQEXFz9EPS2QJNTxWwb/?=
 =?us-ascii?Q?5yV973qdLm6KRpS9SKLYarjeJD8jxW9/jkEabZHeStWwvIRLcbmGrCJUbOFO?=
 =?us-ascii?Q?humwo14ruyWcGkd1BmUYOMlQbY2f8hszJSRzfNQWUYy0+IYJJiJLxY5IGJ34?=
 =?us-ascii?Q?FddCVBCO44J4vIfVSglXLsWo1X6/dtK7e2g1GJk7PB1fTGKLzi6Aql3JwuRI?=
 =?us-ascii?Q?TRYKUQDn9ggJ62mJmlBeokFR+b8FlH+lP3M1b0Tm/fY09j623sIhBQRFFSkI?=
 =?us-ascii?Q?mOw7tu+Y0kxIsy8J+NMRylfOdYJ8z2V3xGyK0IXDJ1EEIZzUGiFfd7MBEmyZ?=
 =?us-ascii?Q?jtnGXN7P71A=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10031
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26f34db0-e67f-4528-2e5f-08ddb95851a9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|1800799024|376014|7416014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B14thiRtHI1VAfkwwss3+eAOmsSdXL/79d/kig+w4KNu3gEn5K1ct1rj5GdB?=
 =?us-ascii?Q?TwgaEmkp2C3vNeN/cf1EuDUUvxIJtqks0dFcRvjRhY69BN3kVtZmLvfbBskz?=
 =?us-ascii?Q?rhIsyNVEVpkMFSMBtR5AavD647OcAwDpXTp6EmNkWvOlzHpPIrNhrNyiKfru?=
 =?us-ascii?Q?1kH7ZwE/vLZvlJDw1gKMtONyAoy2+kNNr+DR7sqg+k5CCf4FAO4QzE3niW9x?=
 =?us-ascii?Q?VuIO2Lhrl9YCEDlW07Ftt7bF/HrQDBOhMFnCSzJ2l8rhKHBueyGGTwu4o7hu?=
 =?us-ascii?Q?gC5Lf9QpYB0qOX1weB/wjWd1//t7gDaWakW2i+HK0zcLwsariQCOLofOjyB5?=
 =?us-ascii?Q?usmpHmksIqHi26eoGqgHzd9Ul/o3hsl3N4NtXShghbdADeddXM1Gu/vEA1G8?=
 =?us-ascii?Q?w/6An/VXpSVSkI5Djzgq0vpk34CirA2q/VdLbcdIFejA24pmSpbdaz/Nhqp4?=
 =?us-ascii?Q?OWXHU7DUY/LxO3nLtcN6u1paX9IVdGPBb5Ek3guQbBjivYXUN26r94HlFk41?=
 =?us-ascii?Q?3GdrFeCLPMXgsnJ1XGxqOxk4qxGLXTQDNzT5ftqhwEu2rGIUqrUwOCcTqOSl?=
 =?us-ascii?Q?M6xnrMfU/cfzGbbKJOr2osoCdjnsKHwrJ0ecXlhxrN1AfmfRByfuX4GGZAqb?=
 =?us-ascii?Q?bqfdb+dcnwYDufNWx+/6MDOJSVHLulXmwvwZYh4cq7p3qLLvgqXFc4CLveAk?=
 =?us-ascii?Q?mQ0qbwc7nBRN83v+/Et1l7AJGYhuYIRhy7MLABpXgqynu+9KoxOX6VePA4Bh?=
 =?us-ascii?Q?/PP9K/Smj49Kfc3o0noBYAccDgJdXQnrF21Iz5qX4R2StLuGIIp4OoV9B3yb?=
 =?us-ascii?Q?BC8+F4dwJl9SSZiz7beX/EcOosJWmg71pVIMBrgxLArk3eP+BTDVAmEGVHUI?=
 =?us-ascii?Q?JgEbye+ZNWsLzW/zPZlXYM0acL/GtEQ4H3UD/8yhH22/kaiBeLx/bYVquXTL?=
 =?us-ascii?Q?XUojGHh1xKpKqU/swvLT6CF0EgpnkCHQIpu0yGR3CNg07UpJZVWmnF5MQhBs?=
 =?us-ascii?Q?+77O+9TLh1aIkao9sJlY5iJ35ukvuRrucs9kOvv/wX6XWfhE+nsc8uItG2Y8?=
 =?us-ascii?Q?+AM+HMiP18Oqa5Lqzz5mtPBctlNq3egLuWyrf3SbcFVktupe4rydmkOp8jzU?=
 =?us-ascii?Q?xjmZMwgeNM2wuaLSCbYPqdznGAemGbBDn0Hq8dawBCMURmr2uIRDTjrff70P?=
 =?us-ascii?Q?UYn0oI+bSKkNLrtceHVpB9NV61dvK4enih05QEp/ZAEqTxdCY02SBCgqB7MP?=
 =?us-ascii?Q?Nmf5hV9+v/ML8yMCEqm1yq8z1/YeYobTY4jpcSYVXNlzjE8X2cf26XHadcfU?=
 =?us-ascii?Q?hAygnqI8OD0T+DAbzlQJfhPO+klOKm37GcoPAndQjMvp6UXZdU6714sWE5GE?=
 =?us-ascii?Q?/opRtC9ahp4aJvLkVQ8acTiSg55GocRtP19liqZR0el3IbFZCu9jgvFrzoXC?=
 =?us-ascii?Q?TFx+MlrtosEHuzxmuSk81c1gO2qQVwmSPwgtG7iSKaQHS5XO6JYMSxGVUFF2?=
 =?us-ascii?Q?ZxlegMCuNiAx+wVy8xhpla2zzqPheCjHSfii?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(1800799024)(376014)(7416014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:05:49.8664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f44fba-4ef3-4d16-8d43-08ddb9586769
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8021

> According to the software usage PKLXF in Arm ARM (ARM DDI 0487 L.a), a
> Context synchronization event is required before enabling the trace
> unit. An ISB is added to meet this requirement.
>
> Improved the barrier comments to provide more accurate information by
> specifying which section of the document the requirement comes from and
> clarifying its intended purpose.
>
> Fixes: 1ab3bb9df5e3 ("coresight: etm4x: Add necessary synchronization for sysreg access")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 +++++++++++++++++++---
>  1 file changed, 33 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index af9d3b2319c5f49ccd40dfa0ccf0f694ce9e2f4f..e3a73718d0c903ee9c72b97028b56565f5ee1053 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -445,13 +445,37 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
>  		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
>
>  	etm4x_allow_trace(drvdata);
> +
> +	/*
> +	 * According to software usage PKLXF in Arm ARM (ARM DDI 0487 L.a),
> +	 * execute a Context synchronization event to guarantee the trace unit
> +	 * will observe the new values of the System registers.
> +	 */
> +	if (!csa->io_mem)
> +		isb();
> +

But, when write to SYS_TRFCR_EL1 in etm4x_allow_trace(), it already does
isb(). Is it redundant?

> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun
