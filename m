Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11022076.outbound.protection.outlook.com [52.101.66.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664F1101EE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636700; cv=fail; b=cXBSRSsOhvNEyCJfoiT+ikcie3gN2PSfTe77QOKK8TSYcAdgb/Hm3rmgIXGVqU4QsuVTMzr3dy1lWridGcWyv0buOVkMAxZyPAgT6OxxwXAox5Mn41kVir+0YJowRbZpnJBzMYV1RZ/sLSWj8K65nryFqPzqF4XOgQIprchZzl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636700; c=relaxed/simple;
	bh=6n8f/Dg22bshEHN/v4l4XGRCAfWpFTFmQCMabKIxmBM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BAdOqsB0hQL+aFpQnGbuk51Qfq9m/YfDI4vjIjQa2E1nazjuquNrLylttIcQCEZwZmH3A+JNLHmgwCUDF7n7Wfy91S2y8fKMkLE/dczyAf+oty8hCpb7TJls1MxnjhztNEtscRmcaK6b/OjM26v0X+av43PRjmKkHuSUJjQUwj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=C5WqiuIr; arc=fail smtp.client-ip=52.101.66.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="C5WqiuIr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn+IB1FXhhWOBKRioAMKVqeVpLAwHEsfjnqtSIinnkfUmBAstWERL+/qMk/8z/LR53BBZ8g12QS4K5cc7ULvDh34XBbXDqY1khi3TOVUkgA/qvF0LCe+oURX8DLVYDfyFHFClYbB+WuWiyMZnBRfp2UftP2UcEGYqAKKt1vIk1VjoR8ZUrfF1d3gMcU8hAO3NfMD4a5toxN/uwz/u9j6Bx3La9LsjiLFWBxT08exm7aaF6OkO2lxlJsUjVOGt3DvwaOGvLiGoI7eV9AMOb7w+Y3lC1kB23FZzJ70zjLlOvaLTIPc59Mct6dkfZ5uHCF1L3kqSKsNT3EooyITbnSikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ilKclNN3H5GFWF17Jcz7b5vTq9J+9zZyPsyt4D0RWA=;
 b=ppu7fkHJQIjgKUN9zDqFnWjwjrnAPFPzgwIMa+5BQfjgCGY21tE93TlXoG0FehMO4bOJXj8R2NF3omLnE/kM5ERgQ5RbJYQV0oC8rEr0FsbZ10X4e21eDFtYALnKUqyLJGTguud8AwbfvCrUbCiYtfokNv01fI1AwGgcvlS+TyLbaZyTwaQkw1klC/4MRXxAs45xOQ+ODWenyRpdITzQRlHswspGSVFsyX3gyrZl7KGH1wA4FeMiBjG9VM6MaRka0yu/BF0xJG2SaD4gqn0jWfN8yvGnJ29vTamr0WQW9my5slThUUgYxMLQSSTaIVDXQZTMiZNpaD3NhACsfzZLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ilKclNN3H5GFWF17Jcz7b5vTq9J+9zZyPsyt4D0RWA=;
 b=C5WqiuIrPn8OXw636fDWx3qvmmc08qXv9NFtNxT0Ae+mDo7j8Y3fOzXo8gprm2a5UOrBQOxMvdn714g4tXHiuBoAkufAAZggjnTPlwEjtvfrBtA8s8yBctVxL+1KLZoihKzFbjuTZcZahd6fub2F9sniGMlTMBGhqqoxPWyBgCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DB4PR02MB9336.eurprd02.prod.outlook.com (2603:10a6:10:3fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 13:18:10 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 13:18:09 +0000
Message-ID: <c0f63b8a-7197-050a-ca01-a1050a2e287e@axentia.se>
Date: Mon, 14 Apr 2025 15:18:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] mux: suppress lookup errors for mux controls
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
References: <20250414124220.30578-1-johan+linaro@kernel.org>
Content-Language: sv-SE, en-US
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20250414124220.30578-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVYP280CA0001.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::20) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DB4PR02MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: fced7280-3bd1-4e9f-09c7-08dd7b56ccf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTlZSUpjdDZWejZRcU5oUVFTQWI1bFc4dEFWM3BmOERoMU1MaDQrOXlmQ2Zx?=
 =?utf-8?B?WHJZRVl2R0VJcnRoc0V1ZFhQZTJzY1JUdWl5N21XcXgvaEJUTk5PdlhBN0pq?=
 =?utf-8?B?Vmt5dWJsRkhhTnBQUlZKQXU3UjBydldmTGczZGlncTNianN4TTdmZmFOLzFB?=
 =?utf-8?B?WHNlcFdhZG9FekhIOFkzR2k0Qk56MEp3TVFRK245aEZZK3FXbjJ0ZnNJSFNY?=
 =?utf-8?B?Y29KVmk3bjY1OXo3ZFlLcm5neENreTJxdFJwZWpoSWMvanlnNlhRbjErWGFG?=
 =?utf-8?B?SGdTQ1VEUjRCS3NNcUxRTjRGWFFnOEY2UUF5U0xGTUpQQ05sdTNNWGMxZE5X?=
 =?utf-8?B?bWFRQ0xjM0NnQjZ1MGpyM01LV0pKeHdmQjdsQ1MyM3NHbnprRTFGODNmWHUr?=
 =?utf-8?B?L2lueG8xckRSTGVhK3pMRUNkSFFyNzIzcUtQMHlqRlNlV1pvazdmMzBzUlUv?=
 =?utf-8?B?NTVLSUlCc3QxZDV2OW8vYzlpc0JLcjNrMUNlRzlUT0Q0TVJFa2tyemdvblJU?=
 =?utf-8?B?OWcyOVNoZnk2S1k0RTNacTVaWFlFeEthM3ovVHR2Tnp6SlV2TVRrdmYyblFK?=
 =?utf-8?B?d0phdjA2c0NkbkFTZXVJUjB1Zi96MWx2dDVIZThGdlFiR1RZbVBuOEk3NnMy?=
 =?utf-8?B?a3I4d2o3ellGRVg3cjRwS2ZKT2d2SGdYZi9LazAxU1JpK1MvVUl4QzkvQ1BC?=
 =?utf-8?B?WTI3Z1FtRzdtMnNoakljRE5TUkNtTS9RVnNUd1dpVW9GKzJIRFhSNzhVK3FI?=
 =?utf-8?B?RHg1V1lMZUcrSUtnNTlsWUljV285UXdLTlpYZ3NMUW02NUoxSmlBR3lmVVRW?=
 =?utf-8?B?d0tteTFoWGdyWUY2b0xsWEo2UUVnNVdmakNTV0FiMUtBSmxhblk2bHNqdGJI?=
 =?utf-8?B?T25wMWlXbm5kc2RxYi9BK1RFWHprSVdYREtxUUtjeFFBczRyeXQ0dVQ5UERv?=
 =?utf-8?B?V3V1QlNyVEpkR0JZdVFTU2pJQ2Yxd1o1cTlBd2NOUU5oL0F4bldsR0xNaDdn?=
 =?utf-8?B?VDBETm14ajhEa2xLZlVBa2lEREltQVFuUzZWWW1RTk1QdDNnclBDOHdydVlL?=
 =?utf-8?B?OXd6RHZ1L3VWK0tDOGhpZ0JtQzUzakJpcmhheXFVKzZzZU5tVjAwYyt4UXdl?=
 =?utf-8?B?d2NUdTQrVEJUK2ZuZjlQWlZIa0xEaWlqNUJUbEhlTy96T0hIYm1kTzFZdWp2?=
 =?utf-8?B?eWNzd2l4d2VmVEpHMWR0cnlNbHVMTVhST296cUU4WjV6SFRnbE0waVZxQnQ3?=
 =?utf-8?B?OVBYZStHR2dCc2ZCelNhNmtXdE1lVzFibjNiR1pmcks1K2cxNy9hTFdpVjhM?=
 =?utf-8?B?YU5SY1RPekdEdG4zaHhKcm1vRUduU2s1dlIxdDZ2U1poRXhrdVByZ1lWbXlD?=
 =?utf-8?B?RlhCMEJIV05jQVJGMSt5U3M2QlZNOEt3aXBYNU9VZFF2SDRXcjBBWU9Pa0J3?=
 =?utf-8?B?RUVVL3N6SHZlbTZJMmhoSWNadEFGbTQ1WVpiamJNK3dZRUdmTHNtcWNBS1BJ?=
 =?utf-8?B?T0FaeVByb3hOZFp1ZzVKQS9IZzF0WFdxc2JXN2lieloyMk5TQWxwWndZbXFv?=
 =?utf-8?B?bERrQk9namxPSnp1NFFoQStJaTJja3VDWi8xeEJjaHllRDZVdmZlS2tqaHJ2?=
 =?utf-8?B?WXBUaFNnMjFyenFZRkx2WjRxVWtLRFgrbVpwWngxOVFZRnh4RWczcFhBOHJr?=
 =?utf-8?B?UEE4UHYyUHRzSjJpY1U0MU1lUER6Y0NRTmIvbHVqYUd2Vi9PbENhemZnVEtW?=
 =?utf-8?B?VXNvL2tDMGY2WXlBSEJ4N1FOZXlPOXNrMkJUWlExbDVHbDRlTE13SktnU2cz?=
 =?utf-8?B?MWkwMFd1ejRDOFFFZzNOa1k1bDJFK1JESng2KzQ0ak5ES0Yrb2RISHVWZmpo?=
 =?utf-8?B?TEIvbFRPUXJaS0I1Z3RsdnVxMVIyaW45TXA2V0M0SFJ5ak1peHEvRUVrekZm?=
 =?utf-8?Q?3oaUHOMbtAU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUozVUVHUHN3OWg2bjF0M0lsUGNmQmZ3Zit6NWEyTE1TNzJsTkRUUDdRc0Ra?=
 =?utf-8?B?UEtudERmZk1BeXdVTVJ2L0hOcGFGdWVTbWx6a2J1eVNtek5jMXBHcDNoZFRx?=
 =?utf-8?B?Ty92MjUvWVkxNUZtZEExdDdwWmR3RDNWaWZJb1ovNE1TeG1VZGZKSE93WUZ0?=
 =?utf-8?B?MVJCL3ovN3pLb04yYnVmTTd6TUdtRC9EcnlOMWJ1R3NvN0RRWVdCbkl4WEFO?=
 =?utf-8?B?SVdWbFdFTm5XYXNjUnpNYS9ReXhPY2prSGhTRWVlOUlid1RJL3V0bjdaNU5n?=
 =?utf-8?B?MWxWaDRBWTRHRHdvUU1KS043Y0RDa1VGYzVYYXJEZGhralI3K1F5bndTU3dv?=
 =?utf-8?B?enF5alYrbStFdXhVVFRuS0p6SFA3S3drU2dlNStrdklWb3huZlFPeGFHNWJ3?=
 =?utf-8?B?OVc5a1lLSVk3c1JNRlZYY3NDclhnajFGZ0lrcStmRTFoSjRCSTB0dzlKVHdr?=
 =?utf-8?B?ZHBNZm5LZWl5UzJ2MmZvS2p4UnZZYXFFZVpWRkxYdTd2cFZVR0doWGdSWlUv?=
 =?utf-8?B?M0pRQ05ZbXJHQURYU01OYUhSdXg3cnpDcmtJTlY5VXM1dXVvZGRqcktuOGdT?=
 =?utf-8?B?d2FJVG5pRm02RnlKR2lPZjMwNENxdngxNXlTYmVuZ2hIVy9hcDk0WXpRQUhK?=
 =?utf-8?B?dmgwczQ4VmZ5d3Z5QVRkOHdOd1lsM3ZuYXd1RzRkSnZhY3NlRGo4aCtIYzZW?=
 =?utf-8?B?NDhyYVh6Njd1emFZd0wrOGdpVkJpK0hiK2ZaTGdyWXIxK2ltU0lkN01nMHpD?=
 =?utf-8?B?MWF1UjBhdE1ueFRUMlpBYVdMM0VSaWJhcFBQMDNOcnZZUlZFckpsdExETXJT?=
 =?utf-8?B?M1BmK1V6bTdkbVlOM0c0Zis5N3piRnkvUUtVN1VLcExSaTRVa2xwTnFQZDk3?=
 =?utf-8?B?ditxbjFELytHYW9rcE9NMG9kUjd4WExraU5sdXNnenE5cnNlclgxdkg4dkM2?=
 =?utf-8?B?RklIaU1YRTNGbDJQeG1ZOXVSeDgwTVFuck45MldxZW5OSHkrblFKOHpnZDRZ?=
 =?utf-8?B?Z2ZXZE5zUEpQSW5tNGVCb3lrTDJJd0RxN2RKTFdGWmdKRlZYOXMyUU5VU3Z4?=
 =?utf-8?B?Z0M1MngvS0pMbHZsZWJrMnh6ZlFOK3lRV3lySS9RdVY3ejRvbHVucEpWQlJx?=
 =?utf-8?B?NDBsVU0vSS9weTUwOVhLV2hOd0JOeXo3VUhITDJ5bEJPL0E0bnp2OWJ6SHpH?=
 =?utf-8?B?akQwdFQ5YzJzUWxYTXNmQnp3UjFnaTROTzByS0RlcmQzaDgweWlDTWQvQXc2?=
 =?utf-8?B?NkR4Z01WekVLcFc0czRpUTR1TmcxNjBETVJabEczWjVtcmo2YUVuWXo3cWlI?=
 =?utf-8?B?Z3Q0RndpMEpKLzVtUzJ5S1JDZFZRMmZSVElEMXNhQko0eWk0a2QrTlAzcFBJ?=
 =?utf-8?B?UStlallmc2swamlNQVI3WGlaNkU4bStRcXp0a3VFZDBTeTZDTmlxRFY5M3RZ?=
 =?utf-8?B?UkM3TGVZZk8xUklPNGQrZjlNWmNhcmtzeCtOUGNkd1pNN2xFaERTTUd3WFAz?=
 =?utf-8?B?bXl5c2FHQXFhcHRrR3pMSEplY3BGY2dSa0Ezc3VkSTZVcUR5K096dlJUQzkx?=
 =?utf-8?B?cStaZjRzMUhJQmFBMXdCNU9JUnhMd3pYUjdjajd6YzZyZ3A3dERRODdHcXgr?=
 =?utf-8?B?UmNLbVRhd2M3YTBKNjNtMTNHUXBMS2h1S05zYXQ5QytQcUhGbzVnR1FneDN0?=
 =?utf-8?B?Q0ltSi9hSE1ubE1pamNmY0NLZUN2U0RqS1NNalg3b3FNOGtqWEhmRVpzSnd0?=
 =?utf-8?B?V3g2L3lJNkRJMmU0ZTZQcDJnUDdyMnJRV0xxTG5VK0g0VEFyNWE2WVhNT2dZ?=
 =?utf-8?B?aE9MQnhrY2FhSWNtb2wxRW5TSE1tUlVlcHJFSndmMS95bFdCNnNNZFExVGxR?=
 =?utf-8?B?TmFJVFNwdUt1clVkTUZnOWw1OG1Tb281NW9rWm0yUE1JTjVPQlluMEF3SEdm?=
 =?utf-8?B?ejFKNWRNZkg4VXBLa2VndUFZcFFQeFliVGN0TnFQRkt4YkxyYWRYRXRGQ1Fh?=
 =?utf-8?B?eVhybnNZZjliQ3Qya2JyV3d0TUIzZEJBalVsdnY3aEtnTXk2QWlxWHRxOWds?=
 =?utf-8?B?ZTUwY041Ny96ZzNCWTQ0dmlzQm5tL2dRb2grbFQycEQySSs1UjN5RGFKa1JT?=
 =?utf-8?Q?91Swn7/62NrAlbHIdYczN6R5j?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: fced7280-3bd1-4e9f-09c7-08dd7b56ccf7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 13:18:09.8112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sMZaV/mCBw9nFNHtoyJQ/bFbglnRqbrt8zNEdVYa6tPwyLxhgbvwjE3BNbuFGZ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9336

Hi!

2025-04-14 at 14:42, Johan Hovold wrote:
> Since commit eec611d26f84 ("ASoC: codecs: wcd938x: add mux control
> support for hp audio mux") we have drivers looking up mux controls that
> are optional. This results in errors incorrectly being logged on
> machines like the Lenovo ThinkPad X13s where the mux is missing:
> 
>     wcd938x_codec audio-codec: /audio-codec: failed to get mux-control (0)
> 
> Suppress the error message when lookup of mux controls fails and make
> sure to return -ENOENT consistently also when looking up controls by
> name so that consumer drivers can easily determine how to proceed.
> 
> Note that most current consumers already log mux lookup failures
> themselves.
> 
> Fixes: eec611d26f84 ("ASoC: codecs: wcd938x: add mux control support for hp audio mux")
> Link: https://lore.kernel.org/lkml/Z-z_ZAyVBK5ui50k@hovoldconsulting.com/
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/mux/core.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index 02be4ba37257..b95bc03e3d6b 100644
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -544,8 +544,13 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  			index = of_property_match_string(np, "mux-control-names",
>  							 mux_name);
>  		if (index < 0) {
> -			dev_err(dev, "mux controller '%s' not found\n",
> -				mux_name);
> +			if (!state && index == -EINVAL)
> +				index = -ENOENT;

Why exclude states? For me, that's entirely random and inconsistent. If there's
a reason to exclude them, I'd like to hear about it. If there is no reason and
this is just defensive programming, then I'd like for someone to dig into it
and either find a reason for the difference or clean up the inconsistency.

I think the model of explicitly marking when you'd like a mux to be optional
is a better and less fragile model. Who is to say that -EINVAL from some other
call is, and will remain, a perfect match for the optional case you are aiming
for?

Srinivas Kandagatla is looking into optional muxes as a side issue to
exclusive muxes.
https://lore.kernel.org/all/20250326154613.3735-1-srinivas.kandagatla@linaro.org/

Cheers,
Peter

> +
> +			if (index != -ENOENT) {
> +				dev_err(dev, "mux controller '%s' not found\n",
> +					mux_name);
> +			}
>  			return ERR_PTR(index);
>  		}
>  	}
> @@ -559,8 +564,11 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  						 "mux-controls", "#mux-control-cells",
>  						 index, &args);
>  	if (ret) {
> -		dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> -			np, state ? "state" : "control", mux_name ?: "", index);
> +		if (state || ret != -ENOENT) {
> +			dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> +				np, state ? "state" : "control",
> +				mux_name ?: "", index);
> +		}
>  		return ERR_PTR(ret);
>  	}
>  
