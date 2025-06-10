Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4C29ACF4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.69
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558835; cv=fail; b=rlZH92oz0NZ1UP4EH/clJuAMQ51RvPDoxDZGz2SXUUzwpzQ8NTOzmomjnzCgDlzSOiglkC9KAgKSi+lJqR1xiyDJ4eAQQsxy8AAgch2AcauRYdnCRwV77z//cL+2mMkOlnlH+Mfjx0uRX007TfEUuPGKj5rVpwztqs9kZadDNrE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558835; c=relaxed/simple;
	bh=gVb/nQCH013FUumxRhCMjwY/T6FJWTUr2N9ORNy8k4g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WJczuxbDg/jUrh0gYTEKMiBfJ7zdCrX7SEdBaQJn/ejakxiKVrDmynD4Yv5fiJLtQGmlFuAskptnUBFukkUzRwmiVn4fsb79rnXX7oyO+XiJXn3nAGhBjrF6GeiHbfSqWmW/P3XU+reBUsgtZPOzApxRtgFymIK24a5tS3lt5nU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EdE8qI2c; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EdE8qI2c; arc=fail smtp.client-ip=52.101.70.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EdE8qI2c";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EdE8qI2c"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EjFwGbxS8U76TC/DFKyJQMcDAoX+0JQaeA0QiiSY6n6o0XZFbkEzLBZcW/5uK48S34ioINcNkv44W0HquOgukztgR+g6BfaPyy+FP77801qq/QJWDts19O45pGAmOCIRagMxrd5NaRHyltkLH8U2RDxNFcgrSj4NFrfsDxqVvI+qKK6vEcgJJ8RQWwd5cV/9t8fN7V/b/WYN4XLjYK82QEdACxl3cvCj8UquSKD/jSpzfpY/FZa5anFz8pTLXig1k5GnhK49EM17dQlXj/H+kLiKD2Hkytf5zhGs1ZEQJfACe9Nr7X9sTcDoCh96ks283UYr4Ymk38wXH5wnVV/GUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtWU+9RZZhoClSVbQuuKDn1MhHCMC4cUKDFsEeBcEzc=;
 b=NQM/2RJQJLluoOQ1jzVtTGlpCOlm/dyAFU8D6NnNwaz3UiiouCkwxrsqFcx+SH0YQnkF7t9kwxJtw6ve8ZeC0EjI7x1hjFEM4RdE3dQm4yjL1Xia2EOFBxwdW3HyIorSs+XUQGbn0PxtrIxhJ2F8vkxkrOYMRNckHH/Qj3DsGAKSPuG1l8FvHe+th/hrc1CVb27bJrzfHoYb/hizdCdIev0Mo6mS+uSAAjM0bPZCUnwucJXySXtxvRS6H4+uWUgC+AqEZ8wPlOB5v6D5a4aTx+JLa1v/uPiB9WU+3wg+IBaNiJCxDhDae7fP1YDT16Jti99UdCa5vSe76H4ieQF+Qg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtWU+9RZZhoClSVbQuuKDn1MhHCMC4cUKDFsEeBcEzc=;
 b=EdE8qI2cHyA9BxaEK7asj3PBkIN0zAKaJEhhOvWh19Fu3D8Ywsf3fkdc7Ngj4KDdHAY4dJyB7Mknyp5LDXgG/4DRi85j1M3expD8dC2CZbdyNe8u3lklo1J4SUpVIYf84tPP4tuZ2R1mIBVaauJNo25b0kGjH/9+9mnix35KEOw=
Received: from DB8PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:10:110::14)
 by DU0PR08MB9822.eurprd08.prod.outlook.com (2603:10a6:10:445::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 12:33:48 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::6c) by DB8PR04CA0004.outlook.office365.com
 (2603:10a6:10:110::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Tue,
 10 Jun 2025 12:33:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 10 Jun 2025 12:33:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vH8PGyQSeo/IpAMnCEFPe7+OOz0hM4NU39GptL45R5NOE2XbuPE6m7ZTUVejWxY473ZgOf1pLufPz7QMRD9C71JU1LNXI+5AAAM+HMmzJuwicpprmlrd6NRVnxNvM/2FHErgglwy97hpo/TtrWegy1rp3q7j1E6O7vdXdE6uv2yV3q10RaAnxOsOMYyJkcnRNv3Fx6D/DVZymktWQeOwzzIv1+UmMtM3VhdrNcrR4kBGlsKdNSd1z6stprYNU1S6L9u1ZMNn/EvtfQ/ATASA/L8ZVIbbiVUjRv/hh1q3ENfXlGQy0u2lZSERK3cIf/6U9KnKExcn87K1Ra9AZQRlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtWU+9RZZhoClSVbQuuKDn1MhHCMC4cUKDFsEeBcEzc=;
 b=GImIjoJXYPLs/j+RiCNlOFtuzKBSUfHFLQqaUA/O8NiUELOEXEYjXoSPkLJRVhxDiGJCoMnb5ickQhkIDNCjBn9sfDsrc3X1DzxIP9qb1dvpX8JVGe4tnvFh4UVJND2SnY4sK24yV8PmoGe3wWD6xHw8U0VxyoCdZJ0eFhTF1Fyy20NRXMe1KvTEfeX1JpQC5mhpPX01wYJAhSauRKEaoU2iZp97dt1lFa0vp/tf7dtMYSwrmIspYU82cl7Ocs8M1GDVFm2KcxWwGDdpxjIjQ3Quq53IZBa1f/1QCNZAc6+IOlcG6N9YtV0Rq8EY4YRojMAs+Ej+u7TqBfICiRiA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtWU+9RZZhoClSVbQuuKDn1MhHCMC4cUKDFsEeBcEzc=;
 b=EdE8qI2cHyA9BxaEK7asj3PBkIN0zAKaJEhhOvWh19Fu3D8Ywsf3fkdc7Ngj4KDdHAY4dJyB7Mknyp5LDXgG/4DRi85j1M3expD8dC2CZbdyNe8u3lklo1J4SUpVIYf84tPP4tuZ2R1mIBVaauJNo25b0kGjH/9+9mnix35KEOw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB9538.eurprd08.prod.outlook.com (2603:10a6:10:452::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 12:33:16 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 12:33:16 +0000
Message-ID: <c05975a5-9a4d-4b23-9768-18b9534333b6@arm.com>
Date: Tue, 10 Jun 2025 18:03:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Optimize mremap() for large folios
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 hughd@google.com
References: <20250610035043.75448-1-dev.jain@arm.com>
 <7cf96262-85b4-4a7f-9ca3-de627ee13a0d@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <7cf96262-85b4-4a7f-9ca3-de627ee13a0d@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB9538:EE_|DU2PEPF00028D03:EE_|DU0PR08MB9822:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4d5ee6-fbf6-4324-93be-08dda81b0c77
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YnNJWmtVRVNxbGgwTHgxakkzaE92K2ZQN0dIcnBaaFNhN01zYk1jdUpOT2ZU?=
 =?utf-8?B?M1BzZ2VVbTNPQ0tOK1JRTzJiNkxoZWRnRm9TYzJ2eTZXR2lWWlo3UzlaUHBn?=
 =?utf-8?B?NzExZFdEWlNmSHNnV3pMejFLM09CZFRULzZNa0ZHdHZHVndXQUFNTFhmSFFM?=
 =?utf-8?B?LzBLUGEzUC9QMGxjZS80WTFtaTd1NHN2Z0ZpRUVEelRhUFhtd1kxTGFEWXlx?=
 =?utf-8?B?YjBIUWxCYlVFRHBlOVlpa0tnQllMMThLWEpTdEhaSURza2NBRysrTEtBYWRR?=
 =?utf-8?B?TGxNN3ZYVyt6bkhFT1NJZGsyVzhFbkZ1VjhRZVBNMnAydDQ1TE00Y00rSzFm?=
 =?utf-8?B?VStKK1hUN2xjSzVETUc1WFBWc3BkOXpjN3VoNFdqOHE2ZnV3YTFiYVBtTUZ6?=
 =?utf-8?B?aEFteW1FRnloRVNadzJ1K0llQkxuUG9iejArOGY4T1dvYVBRYVJKMWcxS0ZK?=
 =?utf-8?B?VkNvWTBRUmN2MHVvUWhXTHQ4V25qZ09zMjh4bVE3NGNvd0ZzZ1B6azltME01?=
 =?utf-8?B?Zmh1aG80UFZuZjVCb0VmN1FFNEhBVGV0SkFCeVFXU2pKZ0lXVy8zbDRJczAv?=
 =?utf-8?B?ek54RS85Nmc1bmRpK2w4RzRzazdpMHJEL2xlb1UvdWgrcjZ3bVo0R0VKaHpr?=
 =?utf-8?B?cGdLS2VnRndiaC9KcnV3R2RXZk1XeHhwRGRJOStpR0MyRU9qOUVScVMvWFpv?=
 =?utf-8?B?bEdHNTZTZjNEUE01bms1a0xqYVlib3BadW14bG9ZdGd4d0ZKenRTbmJaelJm?=
 =?utf-8?B?MnJpTFdwb0Njby8zdE52NVdZanRrNVNhMWNla2NyNWJXbUx3ZHEyL3VYQk9Y?=
 =?utf-8?B?aXlraUREdGJnTXluRnVITUMvMDNLeTZWWmFONmxoS2c4dU1nbTJabnd0Qlhz?=
 =?utf-8?B?S0YvNllLWlEzME1GRjN0aHV4d216SEJqL2IrMCtCTGpQMFFYT0puK2VrbGph?=
 =?utf-8?B?ZDYxT3h5MDUzTWxOU0VSSkc0b3JQUGdYK2h0eWYvc0dDRVRYQUIyTExKV3dD?=
 =?utf-8?B?SHROWlFad01hd3hncCtGSGh6VUdUQkIxcytsOEw1QWh4cWZ1YXI2UTROeXNt?=
 =?utf-8?B?NVR1dHNyaktyczZkdVlxNGlqdWZvbmdXRFhJUzBZb3A5Y1FwamIzaVBlRE85?=
 =?utf-8?B?MFFETmUxakdPMUpEM3E2cDhJQ0d0UVk0RGo1QjdEOEh1L1hibUhaQkVxQ2Fz?=
 =?utf-8?B?MXc5SnZQbnEwaUdkZ3d2QndFUmdFN3BTeitMTnNkVXFHOTRDeGdWalRLeU1v?=
 =?utf-8?B?WDFkUGVoZWpNL0R5UEZXVVZ2VVpwUFU3bnZzejA0c3crV0ZpUnY4UFQwSTFr?=
 =?utf-8?B?Z25DMTV4RDk1ajJub1FqY0M2QWNKeHV5UEo2c3U3ditPR3ZQS1JYODlsTTBk?=
 =?utf-8?B?VU5SaCtOUHdkMUlXTkNRcnpURjBIVlBkSTh1VXpDT09lNjBaUGZrSTJQZUMx?=
 =?utf-8?B?a3RHNXJDQ0RORXdYTjRVQTZkTTVYSXFTcHZyUExqUVNrTzlIM2lvMkNyTVNE?=
 =?utf-8?B?MkM5TlFwVU5IWjV3R3A3ZS85U25ZZ2phdXB4Qys3R0xoUHlJcXlUSW1GZFlV?=
 =?utf-8?B?aElSOVE4Y2tyZUIyTHZkS3lScm01Mm9BOGpseGxIRndwSGFkMnRhaXArUlQr?=
 =?utf-8?B?VmhkcFNtamltYjdDYlJTQVh0VVdoQzNtVEZiMG4zQitVc1ZOaTFlNDFETVg5?=
 =?utf-8?B?WXVyUVc1WmszZllGUGhtaDVyblg1bk8xNlZ4Q2FIRUJXMEUzMDhkZ1hQM1Jp?=
 =?utf-8?B?TXpodyszRFhRWVlnTFFGMW93NnU4empJcnl5eFBqd21TSkdVZkRHWGEvclF2?=
 =?utf-8?B?M2NFZjBqeElaRlZub3FxSTRTOWlXbHh5UWc5UEJjeUFpRXcycmNPaGlBUHlX?=
 =?utf-8?B?cmNRenN2azRmZ2ovMEc0Sk05ZnpwUE9HbXhZQXhZQWp6U2hGbTBmU0s0bGph?=
 =?utf-8?Q?QzPs3992U9g=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9538
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6828751f-7834-4bb3-c88f-08dda81af903
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|36860700013|376014|7416014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEdTSVB4TmhIME5XQkFUQ1hsaFFwY3ZFQlZOcHZuc2JUa0VZNktSd1Q3bS8r?=
 =?utf-8?B?SlkzNHp4eFJCdFZEemtuZTFFRXdYbFNkQnpSdGNFdHU3OFJQajJyamtRVTVi?=
 =?utf-8?B?VzI4clFCZnRTa0tUdStRYUIxWG1nS0pxRDlNVi9LWHB5R3dYWXluSU5HV2ZX?=
 =?utf-8?B?VUJXZkRaYkswdDdsdWlJWDF1MFVoVmhNS2lHeVM3VnJ5OUNEb3Zxc0w2UGJL?=
 =?utf-8?B?MHpPdlV0Y3czbmE4K09YK2o5QTVpMUdaeXF6SklIM3oreTIrMFZNNzdDbjUz?=
 =?utf-8?B?T0F0TGZHTzQwRXF1eDlsQit1V0JLZXpzd3VyU0FPM1dzZDIyaUEvV0tiQXZ5?=
 =?utf-8?B?dDVacDNCaDFEOWVaVzNNQnMyZmtYUlNuTmxKdUxJbEZkZlJQZERKeGFDY3dV?=
 =?utf-8?B?QjF3dHlTeGxaeGI1amIxVlA2Z0x2SUZJQnRGYmFGcUs3K1ZHdWl2eUhzWGVp?=
 =?utf-8?B?SkR1TmtwdGRZZzlObzE3SlJYcmk1ZVNkQ0FHSCsrcHVqQUhtQ1BGbG1JaVN5?=
 =?utf-8?B?SGt2QjliY0JBMGpzNnpVa1R5emFMb2pxSlFJMkJxZ3lVNG5DVk5CQkN6MGhZ?=
 =?utf-8?B?OWd4QjVQSk9DaXBEY3BRYzZwa1Rrc1V4TnV0eVhDV3lwMEM1d3pMMXcwRXh5?=
 =?utf-8?B?UFlBVytzanVzTmxiQ0RaL09nZnNDMndMWlNZdGJFbzJvRFFJN3BYb3YyU01i?=
 =?utf-8?B?OWxuTVI5MVJDMUJKQkFZdXMyNklvUVllbVdhaTN4Y2d1QkI2djFiUkRURkJE?=
 =?utf-8?B?OTM3clh6YWxXVmJXZ0xsdXRGcVJ4ZDFaWTBiOWZIcDErUm5PcWtlQnVDQ2p3?=
 =?utf-8?B?REg5ZUFiVXBabHZQK1ozczZlVTBRTTRIa3FLcnFxeHFESVZ4cG0xaDJ0NGRF?=
 =?utf-8?B?WFJjbUZ2SFNmbUNmQysvemJ2ZzVoVnhlakoxS09kbER1ZWVmRjJNTFdlVWNo?=
 =?utf-8?B?MzZrcUQzeGptT0xROVpJTTVFdmZiaUVmamQ4U2pCZlN0K3RuRW1WSWtRd2dl?=
 =?utf-8?B?WXlCa0NBRDdmNmZuemlwVzdPRmMzMmNjSW1HejkzeERlbzVYaytOaTNhakJ0?=
 =?utf-8?B?aDgyOHNDblVIOFdLdXhBOTlOdHJGZzEyUnJPU2NvWStVTFFuKzJyMVhxZ3RD?=
 =?utf-8?B?SnZ5bzIwWWtWU3UzaFhiemY0MmRHRlVtUU9VWlF1aG42K0UvVmZhWkFSOEY0?=
 =?utf-8?B?SHY4M0FiR2I1eTZYSWx2dmpDQzFLaGpoTzYxQ1dqekVFZFRZMnA5Rm8xNEt2?=
 =?utf-8?B?VWlhaTl1blFBSkE5dGVzS2x0YVF4MXJLWGVLV05LVDljbzVkVXZxdHBzclZO?=
 =?utf-8?B?ZlJFeUNpeFBRZHdrUlNwQ0h4Y29IV2VVUVk4ZlFBaTd5N2dJTlVPRGF2ZnJt?=
 =?utf-8?B?UVZoRmFvVnQ4UzUrcDBlVHJuZUFYVnN0NFR5YVQreEZ1M3FHREY0Q1U5Nmx0?=
 =?utf-8?B?QzJtdGdQZENoNzBnZzN1VXNEQi9HZ21wYUZEeVIzcHVIQ0Y2UFJmVUpHQmxq?=
 =?utf-8?B?TzB1YzVDMFRDMlQxQjhycE9BOG9GeS9GYjV6eWRmdCtzdmhCTHpYbVdDV2Rw?=
 =?utf-8?B?UWk5STk1cFpyYkpZKzQ3OXFNeG83S2Vmb20wZ2F0MHhYclJOTyszcFZHUVdz?=
 =?utf-8?B?NVlwd21tYkE1NndvbzJJMk9yWitKRDZ1aVdXY0FnamcrU0FkTUlyYWVUSXNT?=
 =?utf-8?B?VDk4S1R6LzdFVHpyeXJyTjByQVl3ZnV4VFl2cGtHQ3Q0UTd0WVVyODdJOFJN?=
 =?utf-8?B?NTR0c2F1R0dVa3RINDNRM3Qram5wWlJBWjErQ1pDaUtsUCt3b1pUbzFCYW9r?=
 =?utf-8?B?VXowamxwMGZ2Z1hFZkRpRXRuakF2anJnUDBtOUhvaEpPenhTNFZqMmpDUGpJ?=
 =?utf-8?B?eUxYYUlieTJzdmE3TzBzZm1Ua2U3VVhZd0lFT3NBUlRwY2FOWkNYcE5JK0Fi?=
 =?utf-8?B?OE8vUXo5M1NGVzFGb1VaTVFFSW9TTjNGdjFnQWkxVWt6clRyOWx4WHV5Q1ZB?=
 =?utf-8?B?VUltSzA5d0tCS1Q0dEdLcXJ2RnFkNlBWdjMvVmtibGpyTnlOb0czVERtakRM?=
 =?utf-8?Q?ZT4UCC?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(36860700013)(376014)(7416014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 12:33:48.2234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4d5ee6-fbf6-4324-93be-08dda81b0c77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9822


On 10/06/25 5:41 pm, Lorenzo Stoakes wrote:
> On Tue, Jun 10, 2025 at 09:20:41AM +0530, Dev Jain wrote:
>> Currently move_ptes() iterates through ptes one by one. If the underlying
>> folio mapped by the ptes is large, we can process those ptes in a batch
>> using folio_pte_batch(), thus clearing and setting the PTEs in one go.
>> For arm64 specifically, this results in a 16x reduction in the number of
>> ptep_get() calls (since on a contig block, ptep_get() on arm64 will iterate
>> through all 16 entries to collect a/d bits), and we also elide extra TLBIs
>> through get_and_clear_full_ptes, replacing ptep_get_and_clear.
> Thanks this is good!
>
>> Mapping 1M of memory with 64K folios, memsetting it, remapping it to
>> src + 1M, and munmapping it 10,000 times, the average execution time
>> reduces from 1.9 to 1.2 seconds, giving a 37% performance optimization,
>> on Apple M3 (arm64). No regression is observed for small folios.
> Hmm, I thought people were struggling to get M3 to work with Asahi? :) or is
> this in a mac-based vm? I've not paid attention to recent developments.

I meant a Linux VM on Mac.

>
>> The patchset is based on mm-unstable (6ebffe676fcf).
>>
>> Test program for reference:
>>
>> #define _GNU_SOURCE
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <unistd.h>
>> #include <sys/mman.h>
>> #include <string.h>
>> #include <errno.h>
>>
>> #define SIZE (1UL << 20) // 1M
>>
>> int main(void) {
>>      void *new_addr, *addr;
>>
>>      for (int i = 0; i < 10000; ++i) {
>>          addr = mmap((void *)(1UL << 30), SIZE, PROT_READ | PROT_WRITE,
>>                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>          if (addr == MAP_FAILED) {
>>                  perror("mmap");
>>                  return 1;
>>          }
>>          memset(addr, 0xAA, SIZE);
>>
>>          new_addr = mremap(addr, SIZE, SIZE, MREMAP_MAYMOVE | MREMAP_FIXED, addr + SIZE);
>>          if (new_addr != (addr + SIZE)) {
>>                  perror("mremap");
>>                  return 1;
>>          }
>>          munmap(new_addr, SIZE);
>>      }
>>
>> }
>>
> Thanks for including! Very useful.
>
>> v3->v4:
>>   - Remove comment above mremap_folio_pte_batch, improve patch description
>>     differentiating between folio splitting and pagetable splitting
>> v2->v3:
>>   - Refactor mremap_folio_pte_batch, drop maybe_contiguous_pte_pfns, fix
>>     indentation (Lorenzo), fix cover letter description (512K -> 1M)
> It's nitty but these seem to be getting more and more abbreviated :) not a
> massive big deal however ;)
>
>> v1->v2:
>>   - Expand patch descriptions, move pte declarations to a new line,
>>     reduce indentation in patch 2 by introducing mremap_folio_pte_batch(),
>>     fix loop iteration (Lorenzo)
>>   - Merge patch 2 and 3 (Anshuman, Lorenzo)
>>   - Fix maybe_contiguous_pte_pfns (Willy)
>>
>> Dev Jain (2):
>>    mm: Call pointers to ptes as ptep
>>    mm: Optimize mremap() by PTE batching
>>
>>   mm/mremap.c | 58 ++++++++++++++++++++++++++++++++++++++---------------
>>   1 file changed, 42 insertions(+), 16 deletions(-)
>>
>> --
>> 2.30.2
>>
