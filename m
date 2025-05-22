Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538B926A09A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.66
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903218; cv=fail; b=CpbIdcHtT4hnn9+fanctHkjmJsv8n1zzkIbOsUL2wymyovwM6fxx548+aRNIcgJsiL/hdfrQ+Q29gIO+krHWS7jFYfrQj9OMvYuFRzgQgqRj4HRGKDRYlGcHdM53bRIi71PaFgd9PyN1ifD3QSyv89zSQluGzMnrME/I+EkPrIs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903218; c=relaxed/simple;
	bh=xG83CGClFxGseITuBYdxgsZiI8omHl9fJ+3v81RuGjo=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b9I+PaWJb8rc4Lo1GCF6hp0yZc8hMda4ryJjKlxjz8jlI/KNrOkWvsHmG4Xxo0IgPgC6+n71b/bbeFF+JoHWLKvO99WvCY5R9DIBkE+xOLhiSYplLi3hzkgSoMz5ZxlVbqVKrxvJ/7FrWy+D4dxKdHHijS6PRUKFXRUyO23Coto=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aK/ZQZLO; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aK/ZQZLO; arc=fail smtp.client-ip=40.107.20.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aK/ZQZLO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aK/ZQZLO"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G45IWxIAKh2LHcu63Pl4qXnJ3eYWciER5NEsA89AM4wXD9HBrQB7AqYYBow6bubkCcn+N2fo/rh/O6InnKZkAQyAxILI0kRJMjZB7jASW459SCwi6cMWqGseAStkjRWSKRkxdP4pEUGfPanpzybI0sMSpREA4rmkmskx/gFxE2O4umECWXDNwIZAq9ilH7YFvYANPNwKRJ1pf6wWOEfS1UmaSCd7wmv1xQWDy0TsY6p0ESNqDDAATc039UwjLeFswX4vIThKcK34NnFbmg2lKHEwsCnDl/3SxBZKvEGUY882lXzdbKfPDaNN3weESaJctIFxthJ1TVAMf0VxiNtwjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu5u/7uviB7nC90j0z288fmJ0uJ0uDTjZ/miSOH76d0=;
 b=t/FLRNQ0QZM8uUVwdoX8izlamB4HBRf6D8sLttKo43ys50Jp32HTIvK/KGsu1Xf/s2PYopI0y1sUt83wr/dKu32PziA2k4zp/CKoDx6Sj0H9kEOm+pHgaPSzbjhWtGELwg7udRuTf3LYwXF3GKlAZKvk/db/4wceS7s2g3IFkl+tNJtHYICdji8sWJdP7mt0OKxPsVBGq8bw9XCwgG7cCKjZvnGAxnPuJj4zKW6dUGGr9xo2T2vb1of/WCT0DcDpQqikhIwcUG5b5H/Rk3II/kSsxA8gGOeiAvtnolQdeO+v8Q+nyynglB8gmRr7xIaKLigj4r8bnj6hoGvPOVXkFQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zu5u/7uviB7nC90j0z288fmJ0uJ0uDTjZ/miSOH76d0=;
 b=aK/ZQZLOl3JHS78BD/O1/fmLSboDs/Pjqk/qBVlB6osp7jWl3xZcmVI35J4IrSJ9eXSR3Mxc10ZB47Ymqw3iMGdcgRJdS6wVAaCt7W+A3yXFJSIcHq5ug5ieHU/rKuAgJ1zEZUfUb2L29eo512ChWDWzXGJUKcBR21gXLhc8AvI=
Received: from PA7P264CA0227.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:372::14)
 by AM0PR08MB5345.eurprd08.prod.outlook.com (2603:10a6:208:18c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 08:40:11 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:102:372:cafe::8f) by PA7P264CA0227.outlook.office365.com
 (2603:10a6:102:372::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 08:40:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 08:40:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrlc90z5v+rRLYqIwj/PmQOqiEl5/T5T37FQzdfydj8NpdyJfr5d5/KmZT1yCUScG1WPbahhCAraxobm3prBb9wqLYIPcejOzblagnZ5czRSzLg+NRc/EpOR6CFZ5zA52lC7xMm0Bwq1lLQMIjdANWpLp2QefuvUxQ5zL/g/vIR43hnZhps5lwXokSW6GWvFgaGSr3mtdR77S0UTGojOv/fpKvBWNSj88YOYUbX6ypeUZK16M/n7TYFO2abOHkOFy5oooWlx5Ie/qzU8HfwsnsQR7jZOtplKPd+Wem3bQ7as3bGbM0n7qLM3KyFR1a8fxIxwV0uC3KDjBM8hJDmTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu5u/7uviB7nC90j0z288fmJ0uJ0uDTjZ/miSOH76d0=;
 b=kKJoQAX0XMXyes9P+3e5PeYKB0qPL/Y36YxK+YutnMuInBCermQYLx5qXKHwccbUgzEMZTtXIILDuWiMUpJY9eYZLTMyHiFn/7cHbbc/BPiVWLiaXUqibnk8thmYl+oT8z6z3vRu1GLFuCvtOb24sDGifHJ3wiZKbwsNmkh1B9Pms1CSQfuZxwJ5DCN39lGAj4tpNDB3aUC2fiUGaGq4WjeAwg1fYJ8KAFGisWO3Vs7DUediHK7HQxOS+pXQcVtklf04Zjmi1OKqC6ZKO+x/NzxfCMcV5XshEuW5xCSnouol4RGQPlRIiJSzh5O81qfYbnStdpw/JgxbgQi7+Ifz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zu5u/7uviB7nC90j0z288fmJ0uJ0uDTjZ/miSOH76d0=;
 b=aK/ZQZLOl3JHS78BD/O1/fmLSboDs/Pjqk/qBVlB6osp7jWl3xZcmVI35J4IrSJ9eXSR3Mxc10ZB47Ymqw3iMGdcgRJdS6wVAaCt7W+A3yXFJSIcHq5ug5ieHU/rKuAgJ1zEZUfUb2L29eo512ChWDWzXGJUKcBR21gXLhc8AvI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21)
 by AS8PR08MB9503.eurprd08.prod.outlook.com (2603:10a6:20b:61d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 08:39:37 +0000
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d]) by PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 08:39:37 +0000
Message-ID: <80eb4745-3e4b-4420-ae1a-2d25741f8175@arm.com>
Date: Thu, 22 May 2025 09:39:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/events: Improving scheduler debugging/testing
 tracing interfaces
From: Luis Machado <luis.machado@arm.com>
To: linux-kernel@vger.kernel.org, peterz@infradead.org,
 dietmar.eggemann@arm.com
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com
References: <20250409151338.1046335-1-luis.machado@arm.com>
Content-Language: en-US
In-Reply-To: <20250409151338.1046335-1-luis.machado@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0450.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::23) To PR3PR08MB5852.eurprd08.prod.outlook.com
 (2603:10a6:102:8e::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PR3PR08MB5852:EE_|AS8PR08MB9503:EE_|AM3PEPF0000A798:EE_|AM0PR08MB5345:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc87915-508d-44d6-6e49-08dd990c437a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Umt1cEVRcFhBemtHQmhpWHExKzdvSHFvbExqQnRxMnd6OGhqbHMrRVEwbVRt?=
 =?utf-8?B?Ung5LzJncVFUMS9aZFUxaS96REhBZDk0SXl2MzUyci84ZWVabDMzNkc3dTZT?=
 =?utf-8?B?MFhIUXZFTFJTejVVUnA1NVl6Z0NkWTRQbjFvRHhZd1J3ZWY2TXpZRXhyWmg0?=
 =?utf-8?B?bkJLT0t5bys0OEo5VEdFcElXNVJZWmRaR1o2V2VkM21xNUg4NktYSHFtMy8r?=
 =?utf-8?B?MXljRGhFdHpKR1lPSUIwZSt2SzU3Uko0dS93ODErSnAxNnFVMUk0REptTjN1?=
 =?utf-8?B?WVliUTFrYU92dkV5eWFuQmZlWC9iYkZZMG1NeXJBbm9YYnh5Wk9EMksxWHpG?=
 =?utf-8?B?VTgrekdmZlk0LzBxSU5Zd1hNOCtBZTVIWUxhSVc3NEhqeStoNy9PUWptUGUw?=
 =?utf-8?B?RFplajdqTFhaU0tFNlNLQzN3eTh0YlZyUEtJOEFBUWRZY2FCWkVQSEZ5UHF3?=
 =?utf-8?B?QmFjMy9yWU0vNWV1TVpBcmpyUlE4ckc1ZGtIL2pQNmxHMkhSYWc1R0hBTTcz?=
 =?utf-8?B?OUs5VlhJYmhsWFJ4RkhVYlVxVmNkN1htZENvN3pHWGxsd1AyYzVNUGYyTkd1?=
 =?utf-8?B?NlZmSzJRWWdrOGcvY2hKRXNxQ210T1N4QjFoT2ZRbnphYS9DTTljTjIzMmU2?=
 =?utf-8?B?YkNrS2ZwRnU0S3lWTk04bjdiWWg2L0ZzZm5IREFsQlA1K1J2dUhLMWVXdFNT?=
 =?utf-8?B?YTd1RkMrVVJxUDRLR3ZyM21DQlVTMzNBUHdLbVNvZVZnaUhweEJKckgwNzdw?=
 =?utf-8?B?RU5nQ01sWWxLaEczU3ozSE1iTzJ5RXZKNFBlRFM1dE91eUdIdUM2YzFiVjRI?=
 =?utf-8?B?R3ZlZDRpeURqUEYwaGRSZTRUa29nVGhsekd6Ujl4bEhMYkt2YStZa0UxQVVY?=
 =?utf-8?B?bzhmaFpNS291dUhsYWpadTJjengvMWNWTXdKQlNNWjd1SVBKbHpybGF0ckls?=
 =?utf-8?B?OXVCSDh1OWVZcjArbXFkOTlwMmlJUndIaDAvNG1PREFnSVBtQjZFdnhGMTJ2?=
 =?utf-8?B?RHhHL3U4aitRNk9IcUlyQWxNVzlncGh2WVdSSE0zUnFZUnN0QnVhdy9iKzhG?=
 =?utf-8?B?RE5IeGxWTnZwMDRpUVRBVzZLZkFGUVQySU1DYlZHeVY3bkdJeERJSmJHRklt?=
 =?utf-8?B?SDI3RHA3UGlDQ0QvMFlCS2J3N2FqNnV2bElKdVhreEIrMGxEMEtkZ3djaERm?=
 =?utf-8?B?QlRyamYrZHluMXJRNm90aDZmMk5EZEF0SkNYbjkyRWw1VUJkOXZ4VXhSNm1T?=
 =?utf-8?B?QWlaa3VSSXBLWlpkQlNEZ283bVg0bkNqeDF2cEJpOUtIcjNiQUlIWnlYTnkv?=
 =?utf-8?B?a3dXR1UwRzNod01vQ2pVcnJGWVgwY2kyL1ZlMjB3VS9xSXg0bzNHRHF0bXFy?=
 =?utf-8?B?Tk5MUWpoS0J3TDh5anNaeVpKNDM3TjB3SGxJRmpRdWdUMkZzSVFDOHpIMW9x?=
 =?utf-8?B?ZU10ZXNYcmR1NW9xeXVoM1VKVFFPWEVmalFaRkRTaERueUdhRjhWRzZCWGpV?=
 =?utf-8?B?cVpjek9saEpack5YVXp6NkJMN0VnMkNnV004d3U4bzlVbGpBdWJ3R0IvNlQ0?=
 =?utf-8?B?WWVMQlFGK2kzVkgyR0d0THJtMk9sUFU5NUxwTjI4Wm85NzZsTkhaM045anhS?=
 =?utf-8?B?SW5VTlBGdDhxcktQU0lHejUzUGpncGU4NUt5cm56K0w5YlR3NEh0d2JkNUpl?=
 =?utf-8?B?TmNJR1VnZ2xDU2ZMbFNjN2ZiMWVJc0F1ckluUVJHNGlrcGFMSUhXR2JlNHVS?=
 =?utf-8?B?QVlmWk0yVnB4aUF4ZnEvNHB5VHBWa0tRcHRkaitxaDIrMDJSVVhTSzZzS3By?=
 =?utf-8?B?SHBHTEd1SHlkeEllQndMdURTUHB1MkhZbGFxdlREZjd5Yld0Wk01ZkxHTHVn?=
 =?utf-8?Q?7Oy2QZSBUOOiN?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5852.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba5b546a-23d4-4e90-e398-08dd990c2f60
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|82310400026|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXFCRXZrQnE3MVFHcXNaR3AySDlJZDlIRjVTNkg4ZjB5K01Za2FyajliQXdI?=
 =?utf-8?B?MFZoOXZuY2FNbDVvb1VpVEtaeklYZGxtRHExTHp6QlRDNEdnVnZMS29LK3Mr?=
 =?utf-8?B?WDdTcnBGZmlaTHB3T3RSMHFtdmZhNG0vWHNIVDNWVjdMRkc5QmppdEx1bnlM?=
 =?utf-8?B?U3dHZVhBNkRzY1VweEFEZnVKOTA3WDVXQjA3SlJFRUI5eXFXckp6MzJOMElh?=
 =?utf-8?B?N1E0U1RZbW9WRUJ3a2JCYXJERmh2MXI2RER1ZVF4c1F6cGo4cUJrYTY0NlNi?=
 =?utf-8?B?aEpTSG44SFNWaEpRcjl5OGpramJNZmNIYjNIcVNXVjhJVGNvZXN5MEt4dUs4?=
 =?utf-8?B?WENKOFA3ZU5wb1ptLytmZEpObS9EUi9CZzU5ejg5UDFObWcrR0dodjFzTW5z?=
 =?utf-8?B?SEVSU05tOEZaa0ZvOGxzVkNyL2FFMWVhdXpPdzZnaGF3VnBSdXFRY3BsSDlJ?=
 =?utf-8?B?OGFDVGxjdnFKcU5ORHloaTBRR2tKMXFBOUQrVEFZcVVRa2czNlorS3RxSUhS?=
 =?utf-8?B?Z214NXRKb3d4MmlUNWtsVkJSdFZ3bzd2SWtxWWRlSHYwVE9lTDFHcW5FbVAy?=
 =?utf-8?B?NFFCN3pHQWtmdzlZcUtIdUkzR0pWRjA1c2xERVUvTVNoUk42amtkdzZEQnZy?=
 =?utf-8?B?d3hOUzNLS3FkQm04OVhWVkVNSXNMcjMyM2hQZTdWbDhqQVZHS2VFTjVrWnoz?=
 =?utf-8?B?TWU2cTNJNGxCVmxzVURTNkpZcDNKTFJ0UHhiaGM2T1I0Q3I2LzhCN0tlY054?=
 =?utf-8?B?WlI4T0ZLRHhJeDhQald5ODlEZzl4VGxFNGFKNmRsY0dvNmF2ajNyQVBJTTJl?=
 =?utf-8?B?WFBLblJCZ2FabXRMZjhUQkNKRXdHWHRkZHI1OUtacFB6bThGNmpvWUZsU2Fx?=
 =?utf-8?B?eko3RjFNRTArMjl5TjRkdmptK1RNMFhEQmtoRXhrcnFaRFFVRmptMDFLcXlI?=
 =?utf-8?B?RUlDbFNTQU5mSWczR0NLVGh5eklqdUNUbUllWTlGejlIWVJrOWFYd1pIYlhY?=
 =?utf-8?B?RFdKNUtXZGdHTnZneFFNM3Z2S0dxajR6V2pFdkg1QlNGRzVTZ1BGVWRRNmNM?=
 =?utf-8?B?U21vUG44SSt3MW02bUM2WkJCNVJydEJhTkRIc3pkN1k2QUFMbjhsdzJHcUJD?=
 =?utf-8?B?dkhXY3oxYWx6R3FmelRjVHZjNGd4NzlhZjM1SGx1Tm9lSUJKVDJMemVLZFlS?=
 =?utf-8?B?WjVWWFg1aEsxWUErdUsvT2pWWmVnemkzWWFFOE9RTlJKVGpYVnRBYUtQbkZs?=
 =?utf-8?B?UVZyNnZVcHdDVE9RMnp2NzVEM1pDRDR5aC9JaitYRlpLT3BpcmhSOTV5WThn?=
 =?utf-8?B?RDlmV2crbnJHN29OV1BSTk1CM3J0THVTa0k1Rmt2NGRxMTlWOTJjWDYxdktL?=
 =?utf-8?B?Y0dkdHEzb0U3WU04RHFpMW5sVnVxcnlWWjBqUE5GL2J1SGh6VE1WWVFCdDR2?=
 =?utf-8?B?aVNZdHNvcVlIay8rclpkZ2k1bW5kU09OTU1vZjFHY2ZiZXhweHVFUUNJT0pI?=
 =?utf-8?B?LzFJWDU5S3ptVDdIQjAzZ1dRZVJiNFA1bjZLZkxraXUxSnNVYU0vNEQrTW5W?=
 =?utf-8?B?YnBFc2c5aGhKeklhc2czTnNzZC9aN1JXaFBBV1Y3WVBTcGpWbkpTQjNsUmxV?=
 =?utf-8?B?a2tIb2w1UFh6S2I1OXJOQjFHK0dQdlVNSUpNQy9ycnNDMW9Pdmh6WktFdCto?=
 =?utf-8?B?aVk2TVRnUG1PU1JBemZhTVFJOFg3SnhPSEVTY1pjeEZROUwvVGxVOGFnUDZ2?=
 =?utf-8?B?NExDUGVYOTYxeWpJcE94VktZanI1bUJOYmRYNFV4Z3o4MkxGajMzYnFWRUdk?=
 =?utf-8?B?VXJueUhhempVZmJkZHJPaklmWklUSUw0UG5zdGZ6SVJQczVvSFJzV3AxdmtW?=
 =?utf-8?B?TmJ0aTlobzdlMXBqN1UrVnVpaWtMbWNLMTdyTGVKRTVxUExIUXZTRy9iclNK?=
 =?utf-8?B?THVvWnlyaWQ4and2aXB2OGpUSUQ5S3Q2UGRZZ0sxOWVhTTR3YXJZMFFXSmVE?=
 =?utf-8?B?cWl2THR1ZWtRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(82310400026)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:40:10.6275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc87915-508d-44d6-6e49-08dd990c437a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5345

Ping?

Any thoughts on this one?

On 4/9/25 16:13, Luis Machado wrote:
> This patch is primarily a proposal aimed at improving the observability of the
> scheduler, especially in the context of energy-aware scheduling, without
> introducing long-term maintenance burdens such as a stable userspace ABI. I’m
> seeking feedback from the community on whether this approach seems viable, or
> if there are suggestions for making it more robust or maintainable.
> 
> Today, validating that a set of scheduler changes behaves sanely and doesn’t
> regress performance or energy metrics can be time-consuming. On the
> energy-aware side in particular, this often requires significant manual
> intervention to collect, post-process, and analyze data.
> 
> Another challenge is the limited availability of platforms that can run a
> mainline kernel while still exposing the detailed data we need. While we do
> have some options, most devices running upstream kernels don’t provide as
> much — or as precise — information as we’d like. The most data-rich devices
> tend to be phones or Android-based systems, which typically run slightly
> older or patched kernels, adding yet another layer of complexity.
> 
> As a result, going from reviewing a patch series on LKML to having a concrete
> good/bad/neutral result often involves several intermediate steps and tooling
> hurdles.
> 
> Our current data collection relies heavily on existing kernel tracepoints and
> trace events. However, adding new trace events is increasingly discouraged,
> since these are often treated as part of a de facto userspace ABI — something
> we want to avoid maintaining long-term. So extending the trace events set isn’t
> a viable option.
> 
> To work around this, we use a kernel module (LISA) that defines its own trace
> events based on existing scheduler tracepoints. This approach gives us
> flexibility in creating events without modifying the kernel’s core trace
> infrastructure or establishing any new userspace ABI.
> 
> For the past few years, tracepoint definitions for the scheduler have been
> exposed in include/trace/events/sched.h. These definitions are not always
> made available via tracefs, and are documented as being for testing and
> debugging purposes — which aligns well with our use case.
> 
> However, this approach has limitations. One issue is the visibility of
> tracepoint argument types. If a tracepoint uses a public type defined in a
> public header, we can dereference members directly to extract data. But if
> the type is internal or opaque — such as struct rq — we can’t access its
> contents, which prevents us from retrieving useful values like the CPU number.
> 
> One workaround is to duplicate the kernel’s internal struct definitions in
> the module, but this is not good: it’s error-prone due to alignment issues and
> requires constant tracking of kernel changes to avoid mismatches.
> 
> A better approach, which we currently use, is to rely on BTF (BPF Type
> Format) to reconstruct type information. BTF allows us to access internal
> kernel types without having to maintain duplicate struct definitions. As long
> as BTF info is available, we can introspect data structures even if they’re
> not publicly defined.
> 
> Using this, our module can define trace events and dereference internal types
> to extract data — but it’s not without friction:
> 
> Struct members are often nested deeply within BTF type trees, which can make
> it awkward to navigate and extract data.
> 
> BTF describes data types, but not semantics. For example, sched_avg.util_est
> appears to be a numeric value, but in reality it encodes a flag alongside the
> actual utilization value. The kernel uses the following helper to extract the
> actual data:
> 
> static inline unsigned long _task_util_est(struct task_struct *p)
> {
>     return READ_ONCE(p->se.avg.util_est) & ~UTIL_AVG_UNCHANGED;
> }
> 
> There is no way to infer from BTF alone that this masking is needed. And even
> when such helpers exist in the kernel, they’re often inlined or unavailable
> to modules, so we’d have to reimplement them — again reintroducing
> maintenance overhead.
> 
> To address these challenges and reduce duplication, we propose adding an
> extra argument to certain scheduler tracepoints: a pointer to a struct of
> function pointers (callbacks). These callbacks would act as "getters" that
> the module could use to fetch internal data in a safe, forward-compatible
> way.
> 
> For example, to extract the CPU capacity from a struct rq (which is opaque to
> the module), the module could call a getter function via the callback struct.
> These functions would reside inside the kernel, and could leverage internal
> knowledge, including inlined helpers and static data.
> 
> Here's an example of the proposed callback structure:
> 
> struct sched_tp_callbacks {
>     /* Fetches the util_est from a cfs_rq. */
>     unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);
> 
>     /* Fetches the util_est from a sched_entity. */
>     unsigned int (*se_util_est)(struct sched_entity *se);
> 
>     /* Fetches the current CPU capacity from an rq. */
>     unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
> };
> 
> The idea is simple: given a base type (e.g. rq, cfs_rq, sched_entity), the
> module calls a getter function that returns the data it needs. These getters
> encapsulate internal kernel logic and remove the need for the module to
> replicate or guess how to access scheduler internals.
> 
> Since these additions would be part of tracepoints used for
> testing/debugging, they are not considered stable ABI and can evolve as the
> kernel changes. It would be up to the module to adapt to changes in available
> hooks, types, or fields — something we already do today using BTF for
> disappearing types (e.g. struct util_est becoming a raw integer).
> 
> While this approach would require some extra code in the kernel to define the
> callback struct and register the functions, we believe it would significantly
> improve testability and maintainability of tooling like LISA. It could even
> be extended to support non-energy-aware scheduler debugging scenarios as
> well.
> 
> Our current testing pipeline already makes heavy use of LISA [1], which
> automates test execution and data analysis. It also integrates with rt-app
> [2] to generate configurable workloads.
> 
> The attached proof-of-concept patch adds three such callback functions as a
> demonstration. We’ve tested this against a modified version of our module
> that uses the callbacks to fetch scheduler internals.
> 
> We’d appreciate any feedback on whether this general direction makes sense
> and how it might be refined.
> 
> [1] https://tooling.sites.arm.com/lisa/latest/
> [2] https://github.com/scheduler-tools/rt-app
> 
> Signed-off-by: Luis Machado <luis.machado@arm.com>
> 
> ---
> 
> v2:
> 
> - Fix build failures related to unavailable cfs_rq avg field and lack
>   of arch-specific capacity and frequency variables.
> 
> ---
>  include/trace/events/sched.h | 27 +++++++++++++++++----------
>  kernel/sched/core.c          | 30 ++++++++++++++++++++++++++++++
>  kernel/sched/fair.c          | 16 ++++++++--------
>  kernel/sched/pelt.c          |  6 +++---
>  kernel/sched/sched.h         | 13 +++++++++++++
>  5 files changed, 71 insertions(+), 21 deletions(-)
> 
> diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
> index 3bec9fb73a3..ac45fb9b1f5 100644
> --- a/include/trace/events/sched.h
> +++ b/include/trace/events/sched.h
> @@ -793,6 +793,13 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
>  	TP_printk("cpu=%d", __entry->cpu)
>  );
>  
> +/* This struct is declared here so the tracepoints below can pass
> + * these types as parameter.
> + * This is only used for testing and debugging, so tracepoint probes can
> + * use the callbacks to fetch the data they need.
> + */
> +struct sched_tp_callbacks;
> +
>  /*
>   * Following tracepoints are not exported in tracefs and provide hooking
>   * mechanisms only for testing and debugging purposes.
> @@ -800,8 +807,8 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
>   * Postfixed with _tp to make them easily identifiable in the code.
>   */
>  DECLARE_TRACE(pelt_cfs_tp,
> -	TP_PROTO(struct cfs_rq *cfs_rq),
> -	TP_ARGS(cfs_rq));
> +	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(cfs_rq, sched_tp_callbacks));
>  
>  DECLARE_TRACE(pelt_rt_tp,
>  	TP_PROTO(struct rq *rq),
> @@ -820,24 +827,24 @@ DECLARE_TRACE(pelt_irq_tp,
>  	TP_ARGS(rq));
>  
>  DECLARE_TRACE(pelt_se_tp,
> -	TP_PROTO(struct sched_entity *se),
> -	TP_ARGS(se));
> +	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(se, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_cpu_capacity_tp,
> -	TP_PROTO(struct rq *rq),
> -	TP_ARGS(rq));
> +	TP_PROTO(struct rq *rq, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(rq, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_overutilized_tp,
>  	TP_PROTO(struct root_domain *rd, bool overutilized),
>  	TP_ARGS(rd, overutilized));
>  
>  DECLARE_TRACE(sched_util_est_cfs_tp,
> -	TP_PROTO(struct cfs_rq *cfs_rq),
> -	TP_ARGS(cfs_rq));
> +	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(cfs_rq, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_util_est_se_tp,
> -	TP_PROTO(struct sched_entity *se),
> -	TP_ARGS(se));
> +	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(se, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_update_nr_running_tp,
>  	TP_PROTO(struct rq *rq, int change),
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 79692f85643..d4b4646f984 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -99,6 +99,28 @@
>  EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpu);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpumask);
>  
> +#ifdef CONFIG_SMP
> +static unsigned int cfs_rq_util_est(struct cfs_rq *cfs_rq)
> +{
> +	return cfs_rq ? cfs_rq->avg.util_est: 0;
> +}
> +
> +static unsigned int se_util_est(struct sched_entity *se)
> +{
> +	return se ? se->avg.util_est & ~UTIL_AVG_UNCHANGED : 0;
> +}
> +#endif /* CONFIG_SMP */
> +
> +static unsigned long rq_cpu_current_capacity(struct rq *rq)
> +{
> +	if (rq == NULL)
> +		return 0;
> +
> +        unsigned long capacity_orig = arch_scale_cpu_capacity(cpu_of(rq));
> +	unsigned long scale_freq = arch_scale_freq_capacity(cpu_of(rq));
> +	return cap_scale(capacity_orig, scale_freq);
> +}
> +
>  /*
>   * Export tracepoints that act as a bare tracehook (ie: have no trace event
>   * associated with them) to allow external modules to probe them.
> @@ -8526,11 +8548,19 @@ LIST_HEAD(task_groups);
>  static struct kmem_cache *task_group_cache __ro_after_init;
>  #endif
>  
> +struct sched_tp_callbacks sched_tp_callbacks;
> +
>  void __init sched_init(void)
>  {
>  	unsigned long ptr = 0;
>  	int i;
>  
> +#ifdef CONFIG_SMP
> +	sched_tp_callbacks.cfs_rq_util_est = cfs_rq_util_est;
> +	sched_tp_callbacks.se_util_est = se_util_est;
> +#endif /* CONFIG_SMP */
> +	sched_tp_callbacks.rq_cpu_current_capacity = rq_cpu_current_capacity;
> +
>  	/* Make sure the linker didn't screw up */
>  #ifdef CONFIG_SMP
>  	BUG_ON(!sched_class_above(&stop_sched_class, &dl_sched_class));
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0c19459c804..e0ccc763ef9 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4433,8 +4433,8 @@ static inline int propagate_entity_load_avg(struct sched_entity *se)
>  	update_tg_cfs_runnable(cfs_rq, se, gcfs_rq);
>  	update_tg_cfs_load(cfs_rq, se, gcfs_rq);
>  
> -	trace_pelt_cfs_tp(cfs_rq);
> -	trace_pelt_se_tp(se);
> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
> +	trace_pelt_se_tp(se, &sched_tp_callbacks);
>  
>  	return 1;
>  }
> @@ -4698,7 +4698,7 @@ static void attach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
>  
>  	cfs_rq_util_change(cfs_rq, 0);
>  
> -	trace_pelt_cfs_tp(cfs_rq);
> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  /**
> @@ -4728,7 +4728,7 @@ static void detach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
>  
>  	cfs_rq_util_change(cfs_rq, 0);
>  
> -	trace_pelt_cfs_tp(cfs_rq);
> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  /*
> @@ -4865,7 +4865,7 @@ static inline void util_est_enqueue(struct cfs_rq *cfs_rq,
>  	enqueued += _task_util_est(p);
>  	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
>  
> -	trace_sched_util_est_cfs_tp(cfs_rq);
> +	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
> @@ -4881,7 +4881,7 @@ static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
>  	enqueued -= min_t(unsigned int, enqueued, _task_util_est(p));
>  	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
>  
> -	trace_sched_util_est_cfs_tp(cfs_rq);
> +	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  #define UTIL_EST_MARGIN (SCHED_CAPACITY_SCALE / 100)
> @@ -4963,7 +4963,7 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
>  	ewma |= UTIL_AVG_UNCHANGED;
>  	WRITE_ONCE(p->se.avg.util_est, ewma);
>  
> -	trace_sched_util_est_se_tp(&p->se);
> +	trace_sched_util_est_se_tp(&p->se, &sched_tp_callbacks);
>  }
>  
>  static inline unsigned long get_actual_cpu_capacity(int cpu)
> @@ -10002,7 +10002,7 @@ static void update_cpu_capacity(struct sched_domain *sd, int cpu)
>  		capacity = 1;
>  
>  	cpu_rq(cpu)->cpu_capacity = capacity;
> -	trace_sched_cpu_capacity_tp(cpu_rq(cpu));
> +	trace_sched_cpu_capacity_tp(cpu_rq(cpu), &sched_tp_callbacks);
>  
>  	sdg->sgc->capacity = capacity;
>  	sdg->sgc->min_capacity = capacity;
> diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
> index 7a8534a2def..7ca37abf46b 100644
> --- a/kernel/sched/pelt.c
> +++ b/kernel/sched/pelt.c
> @@ -296,7 +296,7 @@ int __update_load_avg_blocked_se(u64 now, struct sched_entity *se)
>  {
>  	if (___update_load_sum(now, &se->avg, 0, 0, 0)) {
>  		___update_load_avg(&se->avg, se_weight(se));
> -		trace_pelt_se_tp(se);
> +		trace_pelt_se_tp(se, &sched_tp_callbacks);
>  		return 1;
>  	}
>  
> @@ -310,7 +310,7 @@ int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sched_entity *se
>  
>  		___update_load_avg(&se->avg, se_weight(se));
>  		cfs_se_util_change(&se->avg);
> -		trace_pelt_se_tp(se);
> +		trace_pelt_se_tp(se, &sched_tp_callbacks);
>  		return 1;
>  	}
>  
> @@ -325,7 +325,7 @@ int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq)
>  				cfs_rq->curr != NULL)) {
>  
>  		___update_load_avg(&cfs_rq->avg, 1);
> -		trace_pelt_cfs_tp(cfs_rq);
> +		trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  		return 1;
>  	}
>  
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index c5a6a503eb6..2519da0c920 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -182,6 +182,19 @@ extern struct list_head asym_cap_list;
>   */
>  #define RUNTIME_INF		((u64)~0ULL)
>  
> +struct sched_tp_callbacks {
> +#ifdef CONFIG_SMP
> +	/* Fetches the util_est from a cfs_rq. */
> +	unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);
> +	/* Fetches the util_est from a sched_entity. */
> +	unsigned int (*se_util_est)(struct sched_entity *se);
> +#endif /* CONFIG_SMP */
> +	/* Fetches the current cpu capacity out of a rq. */
> +	unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
> +};
> +
> +extern struct sched_tp_callbacks sched_tp_callbacks;
> +
>  static inline int idle_policy(int policy)
>  {
>  	return policy == SCHED_IDLE;

