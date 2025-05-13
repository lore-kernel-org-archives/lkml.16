Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20615666D;
	Tue, 13 May 2025 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131330; cv=fail; b=Gd1q/O1QWFaNv6qppwDVuGhEr2/X/j+iiNurb8hjZKC2QJTEJ1Ue6mJdnABDq+Ul5LtczBHR6M1UvB7NTUxcLKGTJ2q/WvHPejSPC5R8OVrBoQV2L+Rxg9emNrdIt5ycidvnHA22+OYytHkRQXmdfBEwa5QwDlomZo2EL8BoYV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131330; c=relaxed/simple;
	bh=oD7xePy1oGD7SfwjzHPPncZayXRbbiNZr8Tw816dtf8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nyUA5mtGmh1RvrtbPlBVEU/AEwPSA67gqr+RgDMvgOvnfkQMjNKQlBmrQHTFQRkUeu60h9UTs22lRwzFSgQABXCYr22e3qqlkEtU2RgGtoPTxtSvAUEbDMPMXAxKERdcOkCnj/od+CxF3xwAEgH81ZazIpKq5+bPrPbS6ArixrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=G4XpTTKz; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="G4XpTTKz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUJqJQ1kq+6rXReEy/PbCPlM5FS2K6aBAALIyenGcDO4Ddu1K6Z0pBSJQyM17itO2iP9fSYMDRArQsGtm2oXL49DnXYa8IrpGeF6JWu31iZUsKvkGULlYM5yUHRG5QAldSPAKlUP1rtoH76ScBr02Y7OgW54hHtHF8BvB8Ru0jdGfYjIcIhizwVOxNZ585scEdUYTjG+XXIlwkjxyFg9VbDbb7icQpDuRmXcgpztaEkHvGXzG3N35BOmwS4cQV0yjx5mIL/J/8L6lIRrrisNwda0Ip8OPC5//Az++X/AgpaV8srUt+oA34yT96eqZZhPvUd31q4ooRp2qvVCvhoOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5PkTNT37G/8v4lYDKY0IH657fgBTomVoPWC5t7FOm4=;
 b=ljGzvY9fXj5wLhAL1zcTA2aac+tk742gISUPWB7E/FfV1INMp5KQZSs9EFaJyZEgixPxnyouTGRIzuEXxcAXVceBAtJaxlmLD9w/UCQJDTliGarb/HeATISn3kV2WMJRoQsxKrr0cECzau8uskWsFMcJYWL3+NYDimvGKE/R2pybetUSOmo3SGc4sE/U2KCS5SWT4j7OFi3x6ah3EJWITZUBMFywgoNs10LO2DrPN7XT/+a3W0SGIx8l03qF1y6fRPqZarLf9TbPb1cFw0zL9p0h3KUdho2iI8mMjpwxyTlONF64idV1+hkxR9TgaUnLmRadFwJiaQWPQ9Vt6KGhZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5PkTNT37G/8v4lYDKY0IH657fgBTomVoPWC5t7FOm4=;
 b=G4XpTTKzOSDl4VPSE/j720IlQOF430IYbmynOciA1OaG3PthQucWDAKu7ssELhOdD6qT2oh4mjq0/blgJ9IeI/B2IkVg7BQu3pUiiKEJ0LnmRFjiXmQl9Y7ZmEV957OKDbdv3FXMthKjLaBsPST01C5paf0ECciAmUE2wjDxHH4WjkvxcVfjPUCZU4Nq0LQlUNu9uvy/ZtxbOcFz7JI78QIwjHN/eDkyrSOwgn1l8cyglxe1fEdbMfGRM81vtM2v1M7xji2muyN76NGCR0O0I9842pZ02aSCb4JXLXepgRmMRYBIJYkm49+5IqpACatfsDxBQUgy9U2W9DOJnFZ3rg==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB1377.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:187::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 10:15:21 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 10:15:21 +0000
Message-ID:
 <MA0P287MB2262686358C68D015661BACDFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 13 May 2025 18:15:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] reset: canaan: add reset driver for Kendryte K230
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250507-k230-reset-v3-0-c85240782ea5@pigmoral.tech>
 <20250507-k230-reset-v3-2-c85240782ea5@pigmoral.tech>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250507-k230-reset-v3-2-c85240782ea5@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <521c5b1d-a5d7-4070-a1b9-0e34b4e5a76d@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB1377:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7a669b-963d-4bf7-47a2-08dd92071185
X-MS-Exchange-SLBlob-MailProps:
	obhAqMD0nT+76ZruCrigLPUIQMEMZUn+eeQh1jFeLeCiunAWhUAgPHBsqmTgRVoHHF/NSnfpsbUH7oCqso7CdbLIABPVgzse+110V86VXjfy6SaSXFIJilljojMn995JvqLP0DSMbdkgoXY05H47LzSF7RWzAU/FmmidJZf88Wbsta63pcxq6ylRaZGzYFhdU5UW+Ti1oCAqVnbM33wqBlT7UKNblT3snMS4M7Ty96TnwA8o+u8FihGJVJdpjeoIGG9yAu6DVObmn+XvM5MFuhCZvFGHwqYKCRBWxQyf55wCMhD8Cm8JRN4Si5jYXMA+tHPTwXUzYVUasUFt1xbzynGH0A4zqdE9T3VphN/Pve25x/7A9jtDR8RGIwDJ0a6VnuNqjLHfn4KH9KV1Q8utpTA9Naol1JtAq7RQAYUKJbx5SY/TVsaIbgyEas4tyPFMvSF2woNP6dz7Js3xvObshTMvx17n8zrbEzgdw4rUJwRp1cDQ8N4fdTUu2hHgWM7PETKUvTJwwvPW+ApsmFj/Gpf0bDTiPTeHzrPhpt1qOK3zVxG+7Gj2au6n399yTKXQHNRa6N/BEP/yYOqGlFDdlMfeOkn81VuF9txq8wJU/qzF5wiRV5RoyWxEdEFXOGS1XKapFN+PJShSmiU46p9pm/zLX2JDdhN2XR8CFWwrfC/07glKxjVAI+B57xP6uxqs9RRkvM49Uxf4PRQMAWHsbW/8lK9tzcGIpRlo1mx+zouc5qhVLM/3FTY6JSTbHOyooxg9/dQycUQb/+Mwz9RAj2KMoGobB19V7tbtcxMW1BBqqUT5XioE/5pXcnjcFR82
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|21061999006|19110799006|8060799009|15080799009|5072599009|41001999006|461199028|6090799003|440099028|4302099013|3412199025|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0puR3FUL3dmN3F1UXFzVHYycEh4TnhCSGdtTFpjVm1sN2FyQkF4dks1U2sw?=
 =?utf-8?B?dTB5OW82aUVOTmlYVXkrVHdjNklpL29GLzZhQUFtRlg5R2VFSzZKUi85UVdI?=
 =?utf-8?B?ZmFkMlg0UENMcFNYTk5MYXlVOXQ2eEFUSytUcGt4c2VaOU85aHQ3c3NMMCtw?=
 =?utf-8?B?bjRrWkdDNUxzVGhna3FnMEVmeHJZMnFjV2xVSWN1a1FZaCtETExJYXVjTFlo?=
 =?utf-8?B?elFGUmV4S2lqK2tIU1FsVStmN2ZDcG5hVkJ2eFBEdDQ5eVZrZ0pKV0lKdXhV?=
 =?utf-8?B?aDZhNS9FWWQ1Y05VZ2lQUTYvU3dBWlVBWWhSem1BN1JTMHFTM0NuVjlmY3h1?=
 =?utf-8?B?ZytRaG9MR3VYVlFsbm9mNkhaTU55QWlPbWErUndsYk1XV1NmZUdtcWs2ZUI2?=
 =?utf-8?B?OWtNdkt2c29VVkRiT1Y0OStEVFZQVE92c3pvbWJkQ2NrcCtVRDRlQkp4RFFW?=
 =?utf-8?B?YlpJTEpIMXEyMk5BUSsvcEdXRm1hYzZDZEJnb1dNa24vZkxOdUhDTlN1NUlx?=
 =?utf-8?B?REdkODRoU0JaRWw4UG5NRUNxa05nTE5GaEFHTWM0a25iTEdzRUhPWUxteUhr?=
 =?utf-8?B?emtrZkhub2crZlNDRzRwUldqVDNMOHkzN1FDWXN0VXNSZzVsc1FaUjZKUTJT?=
 =?utf-8?B?U1FKTHZHQ05jK3o3bC9xVEhhakF3S1dTR214N29lS0Ywc0JIbTQ2UllDb250?=
 =?utf-8?B?T0hFVTFwTjBpNERWRzdaL0REUFRZcnIzdUVobHpHanE1aGdlNm5hRk1pK2d6?=
 =?utf-8?B?RThvNnNMejhKN2lUOUtvblVhMWRsaGNxZ21VYThvMzJXTW8xNWNlQ2tpQ2dt?=
 =?utf-8?B?WGdlNmpPTTRjaGEwQVpqSGJZMjlLdllwSkdCREZQa3N1QmNvQmJLNHdHcjVD?=
 =?utf-8?B?V0N3TSszVmpna1owSk5yUGlUMWtKaGpOMEJxQXNYV1pZazVJVXNJY3pIM3J2?=
 =?utf-8?B?NjlpTWRkQlhLN3JCVU1RSC9HaEYvSGJ6RUtabHlUQytBTWZ6OFU1Nkt3djYr?=
 =?utf-8?B?S2w0S2ZBUGs0ZXFsKzkrY0ZTVEM2K1Bka3I3SDBvcEFqaVNkMDJ0dVBVUDY5?=
 =?utf-8?B?WVkyVEdGR1gwcDB4QURUS0dmc2RQUERORDBvMmtKRTNhc2NKcU5ZOEd5MkV2?=
 =?utf-8?B?UUQxbVhqUG8ycnkwRXdjOFVhTmJ4cVpwL1J4dUY2enhYdmlvazJDNW9vRjdq?=
 =?utf-8?B?dHlDclBvci9uQWhhK1JwSmhBUTZZR3hncEFubU9YbWV1SkRWY3ZNeXBIcm1y?=
 =?utf-8?B?T3dBY2VrVTcxVDAyWndzNm0rY1hqb0lQQXFpNXNibGJwVUhHNDJLRW8zNk95?=
 =?utf-8?B?WmZONE9lbVM5Tk4rMmthNmV3RVI4RFc0MTlpR0dkZkFWeXlpdysyM2ZsTzhS?=
 =?utf-8?B?KzE3ZjJRYXNvWDlhOFlnbnRQMFZKOGhCQkxSODl1S1lDbmdHb1YvcDRKZHN3?=
 =?utf-8?B?NERBSm9IRlBzZHcvbWEvV3d5N3NRWDh2VEJkaFBPM2U4M1RYTnVsblZzaUhi?=
 =?utf-8?B?WUZzZDZTcC8wcTZIMWRIam4zdGNCZ1VVNithVkZhV0paa3FPZEZVTU4rMVNB?=
 =?utf-8?B?aGdsb1ZaOGVFVGlZZ2xYUmQybmJpM01pOFZQM0ZTK1lUaVJ5eVZHbTVTTVNz?=
 =?utf-8?B?bkNNZUkwLzJ6RDE2cGIwZnMxbUpVZHBrK3d0aUE2VWdWY2RaTUdEcnpaKzVj?=
 =?utf-8?B?UUdLczhDVm9JMkZyWjh6VzdWVHpTaThlVnhKYUdzeEN3Q011YnUzc1ZtdU4v?=
 =?utf-8?Q?PhDewgGFyT6I0cZsN0xsOB2D3TTcyY9/CJKBVR9?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE4yaWNoZjV0OGZ5bHJGaW55OEJ3Q2hNVGx2SjFSTFMzbG8vWjBiNGN4L1d4?=
 =?utf-8?B?SzRxWHEwTVJLWmNzYmNnaXk1ck53MVB1L2RFbURoWHJrVFd4R3RtQ28vSmk1?=
 =?utf-8?B?SkVsYTdXQjNtV09uYkV0S0pSUzN2bkJ0VzY1TlUyWVhpWFhxbjFPcEVRWXVK?=
 =?utf-8?B?VzExQzh0ODRHV2V4R1hWN05QSHJpbGUzUTJudXVkdzBURVBHOG5PUkcvT1dQ?=
 =?utf-8?B?dUlid09xRU5DaldaVi90Y0QyUkVKVEFIR0g4OGpCY245UjBYajN4b0ZZd25j?=
 =?utf-8?B?OFF2N3pqd1piQ1B4TU1BcWhFODRiOFE4YnRMVmdnYTUydy80M0hwQkNUdFk2?=
 =?utf-8?B?YjRvSDFteFFMWGx3ckF2UnFkNERYRXF1R1R1K2tTTlZWcXBPeGYva3g5OVFD?=
 =?utf-8?B?RmRId3RTRHpaTXlEK1pMVmZvWGNycjhZNlh1aUtnWEhFUTJWUGdLNFVTZ09z?=
 =?utf-8?B?cHoxbEQrN1NqVnRkQjdNMkNhNjl4aEU3NzJ1ODQrT3hrK2pXSThnNElQNkJ3?=
 =?utf-8?B?ZUhpcUE5a2ZoOUM3VHJGRlMzTmtQZzFDS1c5S2tNK0lQRStXSVlPeUxOYVpD?=
 =?utf-8?B?SDlkVmJoV3RQalo2YXEzK2VjeXRnclF0SmxZOGhzWkRXaXV4UER6Mmtnc3JE?=
 =?utf-8?B?Z1N1WDNLWUl4VzZZTjdoYjdtN3I1bWgxR1hzRE5UcDNHREhlSFNzWENPKzRE?=
 =?utf-8?B?cG1NcnRRRzA5NklJR3RvUld1QTJXNy9vTW4rLzhwR00rVVArSlIxTXJ3YjV1?=
 =?utf-8?B?NVdjTHA5NmVieGVTR0k5QUZPaEdpSVEvUzNzbENCMTBOQ2hmQzNmV1FuVkZa?=
 =?utf-8?B?RDBaZFVlSzlueGhYa251MVR0MUhOaENlK2hqQkpxUU9VNDgyZEU4NzhHd01H?=
 =?utf-8?B?VmxQYjAxdlR1a3RvZlVQU3BYRUxsZUZsYi82dlcyRXVHN2xNU0RxdHd0WFYv?=
 =?utf-8?B?R2ZiZXprRTBQL1poWk1iMTVhNUlPcTVucUlHTC92Y2k1aDRJbE10VFM0UWlt?=
 =?utf-8?B?bGlZNEw2VUVrVGhvMEJsYzZ5S0UyaHc4NnpULzMzTytjR2JSS245SEtud2hn?=
 =?utf-8?B?QmY0ejdoV3Rmd3lFM2gxL2VxcFliRHMzdWc2VW1Hd3VvcGdwS3FYUk13emVo?=
 =?utf-8?B?VlhxYzlRcnF3Q2FaTmg2R2w2OUZkdExqcWd4cjZPZG52dEpBZmdaWUhtQ09I?=
 =?utf-8?B?MFphM1krQXFoNGhHeS9SaWZGdTNwZG1LVHppT0FBSkgvb043WHprVTlMQWpT?=
 =?utf-8?B?eUovN3Q5eklXUHd5Y1Q1N3E0ZzNJK09nZXhrQk54eWZmUEhDamlCbkVpS2pz?=
 =?utf-8?B?eGJsaWNBKzVqZGRVSjJkMitLd1crWTRTenRmbFFSdWpzT3BDNjdPTVpEanJ6?=
 =?utf-8?B?cFRicXJUSjJYZXJEb0pKSWZMckZTcC9ZY2Z4c1crQU9IRVhXMnlxSEoyV2Z0?=
 =?utf-8?B?NURTZDlEdWdlN0Uya0JWQTVYRHdJNHl2bG1rcHU5VUFpM2o0VW8waGw1V21Z?=
 =?utf-8?B?dmpFbWdCYVZUR3ZxTzgyUWw1VGVxVXJNUXFuK2d2VGk1Z3EycENadlAxZVVp?=
 =?utf-8?B?aTUyZGVHZTY5U2gxZU1lV1VvZFJyd1dobGpnMFhSb1NOR2VrMWhNcjFLTG5z?=
 =?utf-8?B?dlJsTElGZUdGKzBhV2hsR3lxMzhDTWt3RTJqaGM3bmJYekE2RDZCRzlwaTEw?=
 =?utf-8?B?SEJLZFRtdC9kSFE5OVRwd2l5TlVmazBlTHozay8zZHhzeDVMZFZyUGJQbVpa?=
 =?utf-8?Q?BScmEWjrMv8E9KL+qYzR2tMm7UHESJfJns+ZzDb?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7a669b-963d-4bf7-47a2-08dd92071185
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 10:15:21.6030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1377


On 2025/5/7 21:25, Junhui Liu wrote:
> Add support for the resets on Canaan Kendryte K230 SoC. The driver
> support CPU0, CPU1, L2 cache flush, hardware auto clear and software
> clear resets.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Tested-by: Chen Wang <unicorn_wang@outlook.com>

Thanks,

Chen

> ---
>   drivers/reset/Kconfig      |   9 ++
>   drivers/reset/Makefile     |   1 +
>   drivers/reset/reset-k230.c | 371 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 381 insertions(+)
>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 99f6f9784e6865faddf8621ccfca095778c4dc47..248138ffba3bfbf859c74ba1aed7ba2f72819f7a 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -140,6 +140,15 @@ config RESET_K210
>   	  Say Y if you want to control reset signals provided by this
>   	  controller.
>   
> +config RESET_K230
> +	tristate "Reset controller driver for Canaan Kendryte K230 SoC"
> +	depends on ARCH_CANAAN || COMPILE_TEST
> +	depends on OF
> +	help
> +	  Support for the Canaan Kendryte K230 RISC-V SoC reset controller.
> +	  Say Y if you want to control reset signals provided by this
> +	  controller.
> +
>   config RESET_LANTIQ
>   	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
>   	default SOC_TYPE_XWAY
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 31f9904d13f9c3a107fc1ee1ec9f9baba016d101..13fe94531bea1eb91268b1804e1321b167815a4b 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>   obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
>   obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
>   obj-$(CONFIG_RESET_K210) += reset-k210.o
> +obj-$(CONFIG_RESET_K230) += reset-k230.o
>   obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>   obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>   obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
> diff --git a/drivers/reset/reset-k230.c b/drivers/reset/reset-k230.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c81045bb4a142af7eb5ab648f04d04cc95919255
> --- /dev/null
> +++ b/drivers/reset/reset-k230.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022-2024 Canaan Bright Sight Co., Ltd
> + * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
> + *
> + * The reset management module in the K230 SoC provides reset time control
> + * registers. For RST_TYPE_CPU0, RST_TYPE_CPU1 and RST_TYPE_SW_DONE, the period
> + * during which reset is applied or removed while the clock is stopped can be
> + * set up to 15 * 0.25 = 3.75 µs. For RST_TYPE_HW_DONE, that period can be set
> + * up to 255 * 0.25 = 63.75 µs. For RST_TYPE_FLUSH, the reset bit is
> + * automatically cleared by hardware when flush completes.
> + *
> + * Although this driver does not configure the reset time registers, delays have
> + * been added to the assert, deassert, and reset operations to cover the maximum
> + * reset time. Some reset types include done bits whose toggle does not
> + * unambiguously signal whether hardware reset removal or clock-stop period
> + * expiration occurred first. Delays are therefore retained for types with done
> + * bits to ensure safe timing.
> + *
> + * Reference: K230 Technical Reference Manual V0.3.1
> + * https://kendryte-download.canaan-creative.com/developer/k230/HDK/K230%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3.1_20241118.pdf
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/spinlock.h>
> +
> +#include <dt-bindings/reset/canaan,k230-rst.h>
> +
> +/**
> + * enum k230_rst_type - K230 reset types
> + * @RST_TYPE_CPU0: Reset type for CPU0
> + *	Automatically clears, has write enable and done bit, active high
> + * @RST_TYPE_CPU1: Reset type for CPU1
> + *	Manually clears, has write enable and done bit, active high
> + * @RST_TYPE_FLUSH: Reset type for CPU L2 cache flush
> + *	Automatically clears, has write enable, no done bit, active high
> + * @RST_TYPE_HW_DONE: Reset type for hardware auto clear
> + *	Automatically clears, no write enable, has done bit, active high
> + * @RST_TYPE_SW_DONE: Reset type for software manual clear
> + *	Manually clears, no write enable and done bit,
> + *	active high if ID is RST_SPI2AXI, otherwise active low
> + */
> +enum k230_rst_type {
> +	RST_TYPE_CPU0,
> +	RST_TYPE_CPU1,
> +	RST_TYPE_FLUSH,
> +	RST_TYPE_HW_DONE,
> +	RST_TYPE_SW_DONE,
> +};
> +
> +struct k230_rst_map {
> +	u32			offset;
> +	enum k230_rst_type	type;
> +	u32			done;
> +	u32			reset;
> +};
> +
> +struct k230_rst {
> +	struct reset_controller_dev	rcdev;
> +	void __iomem			*base;
> +	/* protect register read-modify-write */
> +	spinlock_t			lock;
> +};
> +
> +static const struct k230_rst_map k230_resets[] = {
> +	[RST_CPU0]		= { 0x4,  RST_TYPE_CPU0,    BIT(12), BIT(0) },
> +	[RST_CPU1]		= { 0xc,  RST_TYPE_CPU1,    BIT(12), BIT(0) },
> +	[RST_CPU0_FLUSH]	= { 0x4,  RST_TYPE_FLUSH,   0,       BIT(4) },
> +	[RST_CPU1_FLUSH]	= { 0xc,  RST_TYPE_FLUSH,   0,       BIT(4) },
> +	[RST_AI]		= { 0x14, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_VPU]		= { 0x1c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_HISYS]		= { 0x2c, RST_TYPE_HW_DONE, BIT(4),  BIT(0) },
> +	[RST_HISYS_AHB]		= { 0x2c, RST_TYPE_HW_DONE, BIT(5),  BIT(1) },
> +	[RST_SDIO0]		= { 0x34, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
> +	[RST_SDIO1]		= { 0x34, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
> +	[RST_SDIO_AXI]		= { 0x34, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
> +	[RST_USB0]		= { 0x3c, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
> +	[RST_USB1]		= { 0x3c, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
> +	[RST_USB0_AHB]		= { 0x3c, RST_TYPE_HW_DONE, BIT(30), BIT(0) },
> +	[RST_USB1_AHB]		= { 0x3c, RST_TYPE_HW_DONE, BIT(31), BIT(1) },
> +	[RST_SPI0]		= { 0x44, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
> +	[RST_SPI1]		= { 0x44, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
> +	[RST_SPI2]		= { 0x44, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
> +	[RST_SEC]		= { 0x4c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_PDMA]		= { 0x54, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
> +	[RST_SDMA]		= { 0x54, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
> +	[RST_DECOMPRESS]	= { 0x5c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_SRAM]		= { 0x64, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
> +	[RST_SHRM_AXIM]		= { 0x64, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
> +	[RST_SHRM_AXIS]		= { 0x64, RST_TYPE_HW_DONE, BIT(31), BIT(3) },
> +	[RST_NONAI2D]		= { 0x6c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_MCTL]		= { 0x74, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_ISP]		= { 0x80, RST_TYPE_HW_DONE, BIT(29), BIT(6) },
> +	[RST_ISP_DW]		= { 0x80, RST_TYPE_HW_DONE, BIT(28), BIT(5) },
> +	[RST_DPU]		= { 0x88, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_DISP]		= { 0x90, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_GPU]		= { 0x98, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_AUDIO]		= { 0xa4, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_TIMER0]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(0) },
> +	[RST_TIMER1]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(1) },
> +	[RST_TIMER2]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(2) },
> +	[RST_TIMER3]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(3) },
> +	[RST_TIMER4]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(4) },
> +	[RST_TIMER5]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(5) },
> +	[RST_TIMER_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(6) },
> +	[RST_HDI]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(7) },
> +	[RST_WDT0]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(12) },
> +	[RST_WDT1]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(13) },
> +	[RST_WDT0_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(14) },
> +	[RST_WDT1_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(15) },
> +	[RST_TS_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(16) },
> +	[RST_MAILBOX]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(17) },
> +	[RST_STC]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(18) },
> +	[RST_PMU]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(19) },
> +	[RST_LOSYS_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(0) },
> +	[RST_UART0]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(1) },
> +	[RST_UART1]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(2) },
> +	[RST_UART2]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(3) },
> +	[RST_UART3]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(4) },
> +	[RST_UART4]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(5) },
> +	[RST_I2C0]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(6) },
> +	[RST_I2C1]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(7) },
> +	[RST_I2C2]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(8) },
> +	[RST_I2C3]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(9) },
> +	[RST_I2C4]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(10) },
> +	[RST_JAMLINK0_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(11) },
> +	[RST_JAMLINK1_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(12) },
> +	[RST_JAMLINK2_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(13) },
> +	[RST_JAMLINK3_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(14) },
> +	[RST_CODEC_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(17) },
> +	[RST_GPIO_DB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(18) },
> +	[RST_GPIO_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(19) },
> +	[RST_ADC]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(20) },
> +	[RST_ADC_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(21) },
> +	[RST_PWM_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(22) },
> +	[RST_SHRM_APB]		= { 0x64, RST_TYPE_SW_DONE, 0,       BIT(1) },
> +	[RST_CSI0]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(0) },
> +	[RST_CSI1]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(1) },
> +	[RST_CSI2]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(2) },
> +	[RST_CSI_DPHY]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(3) },
> +	[RST_ISP_AHB]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(4) },
> +	[RST_M0]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(7) },
> +	[RST_M1]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(8) },
> +	[RST_M2]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(9) },
> +	[RST_SPI2AXI]		= { 0xa8, RST_TYPE_SW_DONE, 0,       BIT(0) }
> +};
> +
> +static inline struct k230_rst *to_k230_rst(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct k230_rst, rcdev);
> +}
> +
> +static void k230_rst_clear_done(struct k230_rst *rstc, unsigned long id,
> +				bool write_en)
> +{
> +	const struct k230_rst_map *rmap = &k230_resets[id];
> +	u32 reg;
> +
> +	guard(spinlock_irqsave)(&rstc->lock);
> +
> +	reg = readl(rstc->base + rmap->offset);
> +	reg |= rmap->done; /* write 1 to clear */
> +	if (write_en)
> +		reg |= rmap->done << 16;
> +	writel(reg, rstc->base + rmap->offset);
> +}
> +
> +static int k230_rst_wait_and_clear_done(struct k230_rst *rstc, unsigned long id,
> +					bool write_en)
> +{
> +	const struct k230_rst_map *rmap = &k230_resets[id];
> +	u32 reg;
> +	int ret;
> +
> +	ret = readl_poll_timeout(rstc->base + rmap->offset, reg,
> +				 reg & rmap->done, 10, 1000);
> +	if (ret) {
> +		dev_err(rstc->rcdev.dev, "Wait for reset done timeout\n");
> +		return ret;
> +	}
> +
> +	k230_rst_clear_done(rstc, id, write_en);
> +
> +	return 0;
> +}
> +
> +static void k230_rst_update(struct k230_rst *rstc, unsigned long id,
> +			    bool assert, bool write_en, bool active_low)
> +{
> +	const struct k230_rst_map *rmap = &k230_resets[id];
> +	u32 reg;
> +
> +	guard(spinlock_irqsave)(&rstc->lock);
> +
> +	reg = readl(rstc->base + rmap->offset);
> +	if (assert ^ active_low)
> +		reg |= rmap->reset;
> +	else
> +		reg &= ~rmap->reset;
> +	if (write_en)
> +		reg |= rmap->reset << 16;
> +	writel(reg, rstc->base + rmap->offset);
> +}
> +
> +static int k230_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	struct k230_rst *rstc = to_k230_rst(rcdev);
> +
> +	switch (k230_resets[id].type) {
> +	case RST_TYPE_CPU1:
> +		k230_rst_update(rstc, id, true, true, false);
> +		break;
> +	case RST_TYPE_SW_DONE:
> +		k230_rst_update(rstc, id, true, false,
> +				id == RST_SPI2AXI ? false : true);
> +		break;
> +	case RST_TYPE_CPU0:
> +	case RST_TYPE_FLUSH:
> +	case RST_TYPE_HW_DONE:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/*
> +	 * The time period when reset is applied but the clock is stopped for
> +	 * RST_TYPE_CPU1 and RST_TYPE_SW_DONE can be set up to 3.75us. Delay
> +	 * 10us to ensure proper reset timing.
> +	 */
> +	udelay(10);
> +
> +	return 0;
> +}
> +
> +static int k230_rst_deassert(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	struct k230_rst *rstc = to_k230_rst(rcdev);
> +	int ret = 0;
> +
> +	switch (k230_resets[id].type) {
> +	case RST_TYPE_CPU1:
> +		k230_rst_update(rstc, id, false, true, false);
> +		ret = k230_rst_wait_and_clear_done(rstc, id, true);
> +		break;
> +	case RST_TYPE_SW_DONE:
> +		k230_rst_update(rstc, id, false, false,
> +				id == RST_SPI2AXI ? false : true);
> +		break;
> +	case RST_TYPE_CPU0:
> +	case RST_TYPE_FLUSH:
> +	case RST_TYPE_HW_DONE:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/*
> +	 * The time period when reset is removed but the clock is stopped for
> +	 * RST_TYPE_CPU1 and RST_TYPE_SW_DONE can be set up to 3.75us. Delay
> +	 * 10us to ensure proper reset timing.
> +	 */
> +	udelay(10);
> +
> +	return ret;
> +}
> +
> +static int k230_rst_reset(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	struct k230_rst *rstc = to_k230_rst(rcdev);
> +	const struct k230_rst_map *rmap = &k230_resets[id];
> +	u32 reg;
> +	int ret = 0;
> +
> +	switch (rmap->type) {
> +	case RST_TYPE_CPU0:
> +		k230_rst_clear_done(rstc, id, true);
> +		k230_rst_update(rstc, id, true, true, false);
> +		ret = k230_rst_wait_and_clear_done(rstc, id, true);
> +
> +		/*
> +		 * The time period when reset is applied and removed but the
> +		 * clock is stopped for RST_TYPE_CPU0 can be set up to 7.5us.
> +		 * Delay 10us to ensure proper reset timing.
> +		 */
> +		udelay(10);
> +
> +		break;
> +	case RST_TYPE_FLUSH:
> +		k230_rst_update(rstc, id, true, true, false);
> +
> +		/* Wait flush request bit auto cleared by hardware */
> +		ret = readl_poll_timeout(rstc->base + rmap->offset, reg,
> +					!(reg & rmap->reset), 10, 1000);
> +		if (ret)
> +			dev_err(rcdev->dev, "Wait for flush done timeout\n");
> +
> +		break;
> +	case RST_TYPE_HW_DONE:
> +		k230_rst_clear_done(rstc, id, false);
> +		k230_rst_update(rstc, id, true, false, false);
> +		ret = k230_rst_wait_and_clear_done(rstc, id, false);
> +
> +		/*
> +		 * The time period when reset is applied and removed but the
> +		 * clock is stopped for RST_TYPE_HW_DONE can be set up to
> +		 * 127.5us. Delay 200us to ensure proper reset timing.
> +		 */
> +		fsleep(200);
> +
> +		break;
> +	case RST_TYPE_CPU1:
> +	case RST_TYPE_SW_DONE:
> +		k230_rst_assert(rcdev, id);
> +		ret = k230_rst_deassert(rcdev, id);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct reset_control_ops k230_rst_ops = {
> +	.reset		= k230_rst_reset,
> +	.assert		= k230_rst_assert,
> +	.deassert	= k230_rst_deassert,
> +};
> +
> +static int k230_rst_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct k230_rst *rstc;
> +
> +	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
> +	if (!rstc)
> +		return -ENOMEM;
> +
> +	rstc->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rstc->base))
> +		return PTR_ERR(rstc->base);
> +
> +	spin_lock_init(&rstc->lock);
> +
> +	rstc->rcdev.dev		= dev;
> +	rstc->rcdev.owner	= THIS_MODULE;
> +	rstc->rcdev.ops		= &k230_rst_ops;
> +	rstc->rcdev.nr_resets	= ARRAY_SIZE(k230_resets);
> +	rstc->rcdev.of_node	= dev->of_node;
> +
> +	return devm_reset_controller_register(dev, &rstc->rcdev);
> +}
> +
> +static const struct of_device_id k230_rst_match[] = {
> +	{ .compatible = "canaan,k230-rst", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, k230_rst_match);
> +
> +static struct platform_driver k230_rst_driver = {
> +	.probe = k230_rst_probe,
> +	.driver = {
> +		.name = "k230-rst",
> +		.of_match_table = k230_rst_match,
> +	}
> +};
> +module_platform_driver(k230_rst_driver);
> +
> +MODULE_AUTHOR("Junhui Liu <junhui.liu@pigmoral.tech>");
> +MODULE_DESCRIPTION("Canaan K230 reset driver");
> +MODULE_LICENSE("GPL");
>
