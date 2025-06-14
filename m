Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384AD78F37
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.9
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749896895; cv=fail; b=WGKJpOT3i4p0gX2zypAnDqVe/DQhTkqruTuv/m4boLZl3AuqkYENSgvGruayLfxoxKAGb3BTqswudzs6mAueaOK2cS9YtGDjd1W15Yvqgw1FMDAk9dpImdSl1mUHvDZLfwYW2D18DFoHqk5xovPzibfx63oZhR6UU3ZLDN6gb/Q=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749896895; c=relaxed/simple;
	bh=l2SN6LuuRMtYZes67FvOmO3ttl2F2PTaIcSN29xNRnw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p8DSFj1+KPKuTJFQBvpDMdoHXtnxpSIvZeG6oTaddv/K/Xrb8pMhBezohZ0gVONeY7NnnxZxtXx8oti08gpRFYqWPZG5g4jq8/r7LmB9tKE254XdudKkIEfNRjQbVPFB+bcKUcJ+QiimaGhcTn3/bqWSUQkH61Uup/qy4UXB2xE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=B3JWHGJY; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=B3JWHGJY; arc=fail smtp.client-ip=52.101.84.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="B3JWHGJY";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="B3JWHGJY"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fZIbcXFORig0raZfnh/sx6m4A7ZrVrhuqRdcFlH4UNAoP/5PHSEs6Pq+GeNrubeXZSEkmewM3m70hQHnwMqaox3VFSgkoGJil2LZg/hwkQWX+x8CvJYBCGQkTOG0jc4lCG1oMdacDyp+C+qtfO/Sj2ZRI6uNcR+Q+KNBnVMZdVoOcwJ4t/BUekGEOQixl1cgvY+5CwAqZHzwRA+JYmKchI9i9XKKVIpsIxYPz8qhGFgUco5G3x06CLZzRiM7jul5iGwuAnS8J2EQohB8EXLS2xUQue7w8Jb5dTc0Gd1CGK+q+Tb6iJXxr4sFofp3TToKxmF3SNwKTCnJGopf3Vf8Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vibe3sTszvNuChlgBflTY900vX2W1GtLNLZu3ldlJwc=;
 b=jve4U8o1+7x69sdHJ5NfOf+rp7jhcIqYHG/PwOwi4x6kV37BkHSMpHAvorq5wd5ID5EXs27ZqDOX99m7RAPbbhrN/WRv3ICWKXZzRak34+f+v8QK8qpO7U32E95c1lAnNkHc3shZwrrM9nDoDDDNJ8l8Q/u56uMg2SX1gChKWQSJnzNdyk3BLcyB7iT5mLPHwexjxaPHj+/HneaiuZlgySF5jRoaPTOu9akzhcIA/KLlamemGjkeAVMrOfg4OZ89Av3l2aCvoQrpn3YVFA3Y11v3kGZkrkF/RMZOPrarLl0lWJl3U/i8W6EVEZ+RrfhcgPMoP4CZx28S0rXSNaE31w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vibe3sTszvNuChlgBflTY900vX2W1GtLNLZu3ldlJwc=;
 b=B3JWHGJYzkBFO9Gheg65IA0JfIXpUCz0V9wypmCTxtyMQEu7vMgBbtOWD4I1wFXGIVqKBqNXp0hTm3U6wlEuOMESLpKwmwJr3pOoKeSrOPjjqlObI1LKH5B3aGpOGFvv4+O1M3q50qz1tPE84v3xCUQJjUQUu5f20BV9jjlEjPo=
Received: from DUZPR01CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::8) by DB9PR08MB9563.eurprd08.prod.outlook.com
 (2603:10a6:10:451::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Sat, 14 Jun
 2025 10:28:06 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::58) by DUZPR01CA0065.outlook.office365.com
 (2603:10a6:10:3c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.27 via Frontend Transport; Sat,
 14 Jun 2025 10:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sat, 14 Jun 2025 10:28:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDcnnqVtiLfblfz0erLFROcjSNh85HPsWw+rAmKWSJcQ7VtZq3R1LTEv1cXHJY7l/COHuyOC0MaPcXD+5+xTx/AbOQX/SDqThLqPRwLVFu7tLJPeipe7IItD6KoIYE+8vIMuVWfwsOJ4SyIdZRFzG5aomg0ecbWckVMt7M6dligpdly86olBrHcUlhukUAIvVwkY3eQLb1JCVj/oGECygmMp6CmPMiDaYly0jPrNVfd+K6zEYVC5Dl9Z1qPecp9LBRlaxDGVt4jwO0+qXSnIK2/cxtaFRSFv/c1yYOfo4efWDCH0PTCvCDoVu4S7bujnkjIV67srbudUraiNCPcxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vibe3sTszvNuChlgBflTY900vX2W1GtLNLZu3ldlJwc=;
 b=gOF/v4rDcKmRfm5MKvgyFDtTIlPuScRVhPw1l9oiRCcTZnl7xflWYENYpmKglZK6dqHzTmaf27bgMqaZxzoQGMvG0CPoV1TNrrxkYivL4VGvPtH0A6GUrG6io8Rlz0UaoqxRLFYHycpmB5yVJz82Drnuj9vYh2DQtBHT4rUZM3TPxeGrLMYnOp8GtOkvGq/yblYKTOHIIFJeZ/JxLmbJsDcepAbut2kzBVUtaspUe80fdKNE0mmMs2Yd8v3qLCkPqpvfshGvs4yG2h3AwSGZ/EdLnjnSonwO0JrZYDg2elgIrBIXkkcK+acq5n9BaH9rdhxSpBphRkvz4BJUFb/Img==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vibe3sTszvNuChlgBflTY900vX2W1GtLNLZu3ldlJwc=;
 b=B3JWHGJYzkBFO9Gheg65IA0JfIXpUCz0V9wypmCTxtyMQEu7vMgBbtOWD4I1wFXGIVqKBqNXp0hTm3U6wlEuOMESLpKwmwJr3pOoKeSrOPjjqlObI1LKH5B3aGpOGFvv4+O1M3q50qz1tPE84v3xCUQJjUQUu5f20BV9jjlEjPo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DBAPR08MB5559.eurprd08.prod.outlook.com (2603:10a6:10:1a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Sat, 14 Jun
 2025 10:27:32 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 10:27:32 +0000
Message-ID: <0a7dd23f-9f6f-46b5-8ef0-b09ea1b3ccd7@arm.com>
Date: Sat, 14 Jun 2025 15:57:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] lib/test_vmalloc.c: Allow built-in execution
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
 Christoph Hellwig <hch@infradead.org>,
 Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250417161216.88318-1-urezki@gmail.com>
 <20250417161216.88318-2-urezki@gmail.com>
 <6c6f1cfa-7f1b-4133-ae2a-c6b1ef2d82e8@arm.com> <aEwzcsDM2PPsx1h-@pc636>
 <b28374e1-a387-4a2c-8986-02cd5081a8ab@arm.com> <aEw3pSVJxyCkhnTd@pc636>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aEw3pSVJxyCkhnTd@pc636>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DBAPR08MB5559:EE_|DB1PEPF000509F6:EE_|DB9PR08MB9563:EE_
X-MS-Office365-Filtering-Correlation-Id: 856fb4e2-c669-47da-5131-08ddab2e25ef
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WVBsWm9iRnQ4RWE2OGRpS0x5M3U5dkNGZ2tHV2pqS1REUk5tcnZYcGZnWnlR?=
 =?utf-8?B?cVpWWHVFdGVCd0VhYzdoeXlHaEVHTksvamptUjlqSFhYUnZIaVdLM2xGZkZP?=
 =?utf-8?B?N1JYMlBDQUtJLzdWUGd4b0ZmV0o4em9CWk5Rc0hxd0g3T1BxVk9kUkV4cCtk?=
 =?utf-8?B?blNVb0VHM1kxNnFDaENSVGlHVXZRUFFiLzBJL2V2ZTVnalVKaDFWc1FwVXNR?=
 =?utf-8?B?cUR5dkRZTWN2bi9sTGdnc3h5bmE4ekxmLzVOQkRlQk14UFBmYW9HUHhzdldo?=
 =?utf-8?B?T0llSDJicWpUa0VYMElGVmovdGJEZ0pwemdLZzVMb0FUZmFRckUzakthQVVH?=
 =?utf-8?B?dDhjb1dDanJraktGUzZqT1Y1Qm1hUEc3N1RmYm1Zb0REM0tmVGszcklmYzBi?=
 =?utf-8?B?bEwvSmlOcEJuaWYxL3VRZER5QkZEd0hUbW5RaDZXMTk4bDA0N3IvUGVyM21v?=
 =?utf-8?B?ZHVVaTMvSk1CQlNQNzZ1dXY3bTJIaGViOGtVcVc5dzZsNEloOFh2VWtZd1dj?=
 =?utf-8?B?ZEovWTI4dEVkSlBkTExKV01tcTJPcDFDcTNRS0tOK0tZQ0FkREdyTHpUT0kr?=
 =?utf-8?B?UERlMGQ4TXdhakVZdVdQMzhDbmFhMzJYcnEwTEZtNjRwdUdMYTN2Vm8xVE1n?=
 =?utf-8?B?ejRPU0xmbE9DaXJkb3FuWUpuVmc2UVZlaFBiSW9rWm5KcTNyMzhST1BGbklQ?=
 =?utf-8?B?NFk0Ymd1UytCWjVMYUdscm5JUkg1dVhtMXZVejJxemxWMzUrcWwvU0FIRE0z?=
 =?utf-8?B?d1dwbUdLN2JLQXJwWkg3K0d3NFk5bTZQV24vL2Y2ZEYyaFhQYkVxR0hVWTZP?=
 =?utf-8?B?anZiQ2wzK1FHOVMrbUptSUFQUWEwemF4NjlxTW9tcDVvak1XNC82VkIvbmdx?=
 =?utf-8?B?NXFXODRLT3VYVVB2UDdsVmZzc1RZcGgzUG84bmdEUEZVUkpQRk5EMW9NYyt4?=
 =?utf-8?B?a2lXandkWWg4SE9uMEZkMDFQd29TZEZPd1lEVERRU3VuaXkyRmJ4aWZBZlZp?=
 =?utf-8?B?bWJKaDRtSkN2VjB5ZDZVZmN3K0pLMlYzenZWTUJsNjNBSzdMMGpmMk9kNmxT?=
 =?utf-8?B?N2p3UzIzZXpjNmtNV0U2TENFQ3N4UytJR25neTFXdHZsVUwyZFhPUUNYNy9M?=
 =?utf-8?B?OEQzL3pudDRFQ2gva0VnOTVxT3d1MURGWVJoRGFNVUlIeDZrOWlmUjVXbHFS?=
 =?utf-8?B?bzhPYVV5SEdqeWtqc1VLb0dYZ1R2dzRXbmprMzNqR0Y4dk9HcVZYc1Q1Wll0?=
 =?utf-8?B?RXpVTlduTXBPSUdHVjM0Y1NQRXUyNDQ4R1VNV0hhb1dPY2I5bXlSckM5NTlW?=
 =?utf-8?B?cXVES3ZsMjJJMm9mMENzWDZHemNnTnFOazJPeHhnSkQ1OTVHQUk2QVd0eVQx?=
 =?utf-8?B?aTVCYVB2OHpjOGFhWDRuWURZSkZWeEJvV0NFV3FlZDN6aURTd25UTkd2QlA3?=
 =?utf-8?B?akdJZ3NtK3Z6YTU1YkVJUFVHRnRJVG9la2ZlazI3OWZIK1ZYdno3T0dIdURa?=
 =?utf-8?B?bnpsUzZQNS9xTG1JTWxIZkUxcXhHampnVkxHSGdabEpMendpOGhWQ2FwUWRP?=
 =?utf-8?B?RXJXQytxR2p2b1dMSmF0WVJrbk9DbUZia3ZQMVZaWG5tZzZiZVpyV3hNNWp2?=
 =?utf-8?B?cys0d3k4ZVUvMnUrWFRFbXJiRWVtTDExWG9NWEUzWWtTUm1EUjBtZGZmNU5P?=
 =?utf-8?B?WmtqYUY1ejFZTHFURTF5eU9iMG1lYlVMQnN4dWRHbjVZMkZxRDBIRE1PUWZS?=
 =?utf-8?B?MkN6YWpRRVh2VkJJbmZqc3FVU1ZISXRWVW4wVkwwUDdic0RGbjZsOWdTeXpW?=
 =?utf-8?B?QUlGd1B2K1F5N1RwZS84bXZrd1JVdytnSjNDUDhtZm1VeWJTV3MyaElXdmZY?=
 =?utf-8?B?aVk5VHA2VFFxQmJwQ1I1akhLNzJTRzRRTDlWalRoWFFLU1ZrL3F4RDVmdTJR?=
 =?utf-8?Q?rbAiGofCgLs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5559
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ebe071ca-2641-4ecb-db83-08ddab2e11e1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|1800799024|35042699022|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVkxV1R6MVo3NkdRSlFydjZWMFdlby9VTVM3b0kySFdwanhCcDNUbzZpaDFD?=
 =?utf-8?B?M0wrV084ejJETEJzcUtqUjJqQTF1UlFDNTBCZFZWSkYycWk5c2M0andEUVQr?=
 =?utf-8?B?RndoNFdKRCs4eDE3QUdRWml2ak9hMWY0MlBnVXAwM1Z6VE5JN3RHRVdtOW5O?=
 =?utf-8?B?RUVqUmh0VFd4b3FmZXNPMWRuQ25wN1RoNEF0aDFCc1hTZ0xpWGJKaklDRThl?=
 =?utf-8?B?MVRUWVdpcUJUM2lYaUN6WEpTdUhJN1lKUVBZSVRHUHJnUzV2eXZlQlhTRjhR?=
 =?utf-8?B?Z3ZrNzhNS0NMNVFHVVFNekpGVzZ5TXlYcWxOY0VjVkFoYjlMRzcrcHJaV0lI?=
 =?utf-8?B?ckJUVEpvaHJ0UUFyU1BNeityMlkwMHdlVmFrTW1RbTZNTUJjTkw4enAwUlJJ?=
 =?utf-8?B?YXRCd0xBWlhLYkF5UVBrbi9lRjFPQzVmdXJSeWtOblRVNFI3cDdWeXdYM2Vz?=
 =?utf-8?B?TXJoT2RYRUEvaXJoeGlnT2piYTBHUms4bHRBUW9ucjB1WkhrOGJiY0VFT1hz?=
 =?utf-8?B?c04rYU5qbGJ0MGo2cHJXaHFST1E2Y3FwYmRYWTI3WXB1V0hBZjBPQ2pFMU45?=
 =?utf-8?B?THc5aUVROEFUeXczQnpzcnhLdm1TRXhoSHc0L3lKOExUdXU4ZDFrdEFXUVBL?=
 =?utf-8?B?QWJHMGNZR3FtRWszekdWbjlDVUZweU8zOVlRY3J0V3E0amR1TC95cnQ3c2hI?=
 =?utf-8?B?SU5QQWxyZFcrOGNuNi9Zd1BMZ3FGNW1wY0dpRExWNGdTaU5ubkZ1bWcwNnNp?=
 =?utf-8?B?RUxEanhuelVNbThrRHZ1WGFKNS84NE81RUNmSkllUjJrQnVzR3o2OFlVVkNB?=
 =?utf-8?B?a2hBSGdacm5Dc0ZMclBPdUd6QlNXTzdsNWNSNXhON1JTNWZpWjhBd25BUjJN?=
 =?utf-8?B?ckRwVWNxcHA2UFFKRmd3ZGZkZHFydnBZOC9MMXhQL0R5c1RMT0hLMGlTQmhp?=
 =?utf-8?B?MzBXNlNXcW4zUXQzZ0dzODZxSEdlYzQ2SWJUVGR3Z3Z1aUdaSmRBMk4xcUxS?=
 =?utf-8?B?WS9hc2M0U09DZXBaaVNaaFZFOXN6RDVkUnBRQzd3cVZJQnZYRzJqZDROeHlW?=
 =?utf-8?B?KzhzNnBZOWp5OW1nVVB6ZFVZTVJEMTFvVXZGeVgrVmFiWmpjQjZSS2FocjRh?=
 =?utf-8?B?UThkOGtwWUNaZ25hT3p4RjQ4RkZ4UllvZmtKQ2dZOUEwUk1kMFJCTHN3K3Jm?=
 =?utf-8?B?MjFaMndWR3V2UnMrcERGbmRtbVI1YXRFcEwzMUhWUmcxajB5czNpMndGa2t0?=
 =?utf-8?B?L0FYcDlIZkdBNk05TFdYWmhVNVc0WlowK3NaL0VVNjF4a2g1WlpGSWJqU1pM?=
 =?utf-8?B?Mkpmc0ZPS1BDNU9XVjRnZzVUT1ZnV2RpSDUwdHVzVms0S1F3K05nb2hBTERx?=
 =?utf-8?B?OE10bjBvQ3ovUDVpN0R1aDlYOWpqbVYwUmdkTmVydElUS0piaWNTV3FJVjFa?=
 =?utf-8?B?ODJjaFlpRkIzUlhrenFqbHJVMzJ3RVFWRGpNY1YzOWtiUEcwTitvK0pEY0lF?=
 =?utf-8?B?dW4yaGlTd3gyQ1FQcDRKUmdzLzUvK3NHdTN6WXdTYndiSnFXdG1XZDdIZkZ2?=
 =?utf-8?B?amh6My9FQmdwa21LQjRMU0p3YTEvRVlFOUxSaTZzWEk1TDNabXdURHVCQkl4?=
 =?utf-8?B?SHJ6YU9qZHBJaDlDbmc2bmk0ZUFVRmNhby8rMVQvdTZNSHl5OVh4aUt2NzVs?=
 =?utf-8?B?SlNYZG9vdkYyTlN1VDQ4UHNtbytRQ1NiT1BsM28zeFBkQUpaSzZQOU9KUHJk?=
 =?utf-8?B?SlVFUGtjTXhqVVIxWU1SU1BrVElwTlpDMFNKdm1qbTl1SE5HT2xiR3BObmNV?=
 =?utf-8?B?eVJjcU1ib3g3d0dzQitTdk13LzFOVERYcTlIMjhLUTkyQXdSVmtJaWZxNGFr?=
 =?utf-8?B?RndCTWNEZGtPNXB5MWpXQ0drbzhHVndxczh2T2hiNEFpN1l5N2xMQjhPMUlG?=
 =?utf-8?B?VGlncS8xY05iTWt1L2hHc0tDZUN5eWZCeHZSNExSa3pJbkVRdzl6eXhGMDBT?=
 =?utf-8?B?V3oyOG5OdHdsUlVIZXdONkIvdGI5SG5KaHNPU2pPcThsbU1meXVwVVlGRDBu?=
 =?utf-8?Q?toQ0vD?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(35042699022)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 10:28:04.8611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 856fb4e2-c669-47da-5131-08ddab2e25ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9563


On 13/06/25 8:07 pm, Uladzislau Rezki wrote:
> On Fri, Jun 13, 2025 at 07:53:37PM +0530, Dev Jain wrote:
>> On 13/06/25 7:49 pm, Uladzislau Rezki wrote:
>>> Hello, Dev!
>>>
>>>> On 17/04/25 9:42 pm, Uladzislau Rezki (Sony) wrote:
>>>>> This patch removes the dependency on module loading ("m")
>>>>> for the vmalloc test suite, enabling it to be built directly
>>>>> into the kernel, so both ("=m") and ("=y") are supported.
>>>>>
>>>>> Motivation:
>>>>> - Faster debugging/testing of vmalloc code;
>>>>> - It allows to configure the test via kernel-boot parameters.
>>>>>
>>>>> Configuration example:
>>>>>      test_vmalloc.nr_threads=64
>>>>>      test_vmalloc.run_test_mask=7
>>>>>      test_vmalloc.sequential_test_order=1
>>>>>
>>>>> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
>>>>> ---
>>>>>     lib/Kconfig.debug  | 3 +--
>>>>>     lib/test_vmalloc.c | 5 +++--
>>>>>     2 files changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>>>>> index f9051ab610d54..166b9d830a85a 100644
>>>>> --- a/lib/Kconfig.debug
>>>>> +++ b/lib/Kconfig.debug
>>>>> @@ -2574,8 +2574,7 @@ config TEST_BITOPS
>>>>>     config TEST_VMALLOC
>>>>>     	tristate "Test module for stress/performance analysis of vmalloc allocator"
>>>>>     	default n
>>>>> -       depends on MMU
>>>>> -	depends on m
>>>>> +	depends on MMU
>>>>>     	help
>>>>>     	  This builds the "test_vmalloc" module that should be used for
>>>>>     	  stress and performance analysis. So, any new change for vmalloc
>>>>> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
>>>>> index 4ab23e5e772d0..6d65ef725d42c 100644
>>>>> --- a/lib/test_vmalloc.c
>>>>> +++ b/lib/test_vmalloc.c
>>>>> @@ -591,10 +591,11 @@ static void do_concurrent_test(void)
>>>>>     	kvfree(tdriver);
>>>>>     }
>>>>> -static int vmalloc_test_init(void)
>>>>> +static int __init vmalloc_test_init(void)
>>>>>     {
>>>>>     	do_concurrent_test();
>>>>> -	return -EAGAIN; /* Fail will directly unload the module */
>>>>> +	/* Fail will directly unload the module */
>>>>> +	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
>>>>>     }
>>>>>     module_init(vmalloc_test_init)
>>>> Hi Uladzislau,
>>>>
>>>> Post this patch I am seeing the following problem: while booting the kernel, this test is
>>>> executed and a particular testcase triggers a warning splat from the kernel, then the boot
>>>> gets stuck for 3-4 seconds, then proceeds. I am not an expert on modules so I don't know
>>>> what happened but I am guessing that when the test fails, the delay is due to module
>>>> unloading time...do you suggest a solution? I reverted your patch and then proceeded with
>>>> my work, so apologies for not having the dmesg log, if you need it I'll replicate, although
>>>> there is some subtest which has consistently been spitting out a warning on my Apple M3 Linux
>>>> VM and I have been just ignoring it for long : )
>>>>
>>> This is because CONFIG_TEST_VMALLOC=y is built-in in your case.
>> Actually, I have a usecase for test_vmalloc :) I wanted to test my
>> patches through the test, but the problem is that the moment it fails,
>> it gets unloaded and then I cannot use the test at runtime. Currently it
>> is set to =m in my .config.
>>
> Ah. It is unloaded itself when tests are done. Do not use the
> test_vmalloc.ko directly. Instead use test_vmalloc.sh script.
>
> It is located here: ./tools/testing/selftests/mm/test_vmalloc.sh
>
> Example: sudo ./test_vmalloc.sh nr_threads=HOW-MANY-CPU-YOU-have(digit) run_test_mask=7

This is what I have been doing. Before your patch, I was able to run the test multiple
times, even in case of failure. After the patch, it fails at boot time and unloads.

>
> --
> Uladzislau Rezki
