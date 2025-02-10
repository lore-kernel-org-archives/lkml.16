Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010003.outbound.protection.outlook.com [52.103.67.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4326A934;
	Mon, 10 Feb 2025 01:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739149242; cv=fail; b=nH/jSPbFr326K8Wl/07jTP0dkLLEebJaKQ4X7jwWlBusi0LhNxGzl1YCJz96LdCQC/BxA2l/RqtHupsEmuC4u0TZv+qqeACoWQ8Esbxaf5ukin/AuO3p5bTtCPUKl49YtOpwJcOCMbtrolmcnjgkIS53zQCi2PmAqkJMiBwRRh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739149242; c=relaxed/simple;
	bh=PCur83ryAbxjGJqf9qh+Od/vlWtZxt0Z25cF/Xpl/R0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EH89OkO32TNxBqrdptn80PknOh9/f+mq7G8zpjefpcpZcT6U5YnsApXdmrqj1RtjDdZrJ645t3GefkKGnDRSLpyeGBPYqE0YnWKYUyGOvR7uODPYcDGWjjBCh5goQW48RMVVNRVFqhSoVvGrhNVcOhyrVMlUVtRYanR2c7OoO6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=alcpjTP7; arc=fail smtp.client-ip=52.103.67.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="alcpjTP7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUzf5qfzSKAebmEo9qsb/DF6ld/WMVC+nVpk7U1UuZa88/kfFnmU1GVBMa59beE4ah+8y7vPhMt+xuVQbHYL9rqE5fuy0dqEx7HKiAcVJz5tQV2WaUCdmLluvg9MhZy/VHNAR/OkYlq2l9oMikXl3DMQzWpsvNd3xiJDC1QEfbxR+G8f13KeuenFUElR3+xgXqC8Kjscn6b6H45h6BZlbq+cmVJUNRTFNErRIVknp/bhmTam93e84VFUH5Oq7zQM7Q8S22F2pYLubFvuk7ULuFrV23+9nuKjK8Fl9ivTKY+RuZ0rDyOTOFdEG35sqCTl301RRY9+bY1TOMVAmDmJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfzdOSgS1/S1pZsN7uRzspdptiSUoUF1r4B+ixT1XXk=;
 b=s41V1xGkP8jtryahuR0osMA4XQuXq16Et1w6/pc2dxDSNb56KCX/aiOgCnJnvzOHYSitI2Sd1VRPhaLVh5FpgiUezsQZneD+wpnMVzY2DuJKcoz6RXQjIMBR4wJhwkMoMSNU8QiB/YGilHd4RFRnwvOJGFsxU5xXnv5oMZ2Aa70+rL3TT6W4bcr+sQ9cCa1bFg7Kd1FhOn8CANksCTeONC8BGadQBKJAxhWukMqdfgG7gKoDvh+JT6ccz+NtpjZZAgoxgH4+ueOnE7/kUY6nUG6+IQVT1uLkH1/IsnImYVacBBb4L4ewmqWxYLmdcpxPqKSyLL3f6xMIULzEz9+2pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfzdOSgS1/S1pZsN7uRzspdptiSUoUF1r4B+ixT1XXk=;
 b=alcpjTP79Un/ynNiRfPk1ZIdkPrCKSiddKZ2DmskHW7AVJYiLI4hjw3h/OJGzuUQq3uA+77GKb89dyFQ0kQTsqwRKIlKoYBGJYTxAEq3E4Wg9w1Y4EFkShgs4qxd7UHKQazDbtLmY94+zMBaxN2le119gn7DpRd3jiErELMkIQ2/X+9+OjDc53YDbZyDqosWsikec6KYn8yQYbQ+dy1IViegmU5ZFR0xQULAL//iD4NnCywzAAetyXnFSMN9bMpFYjZvQbJeRWniE3whpYZA39pBPMIr4Hjr2N77bFqi9g8cK1QmwP9dhTwCQOf7A/YIQkQyCYjBd2my5C+uBIkFyQ==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by PN3PR01MB8657.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:d8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 01:00:31 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%7]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 01:00:31 +0000
Message-ID:
 <BMXPR01MB2440751AD7D99F33081DB330FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 10 Feb 2025 09:00:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: reset: sophgo: Add CV1800B support
To: Inochi Amaoto <inochiama@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-2-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250209122936.2338821-2-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID:
 <584cc62f-33ee-48ff-afab-39991eabbed9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|PN3PR01MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb1f7d8-fd63-4f28-cc45-08dd496e50c9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|15080799006|19110799003|8060799006|7092599003|5072599009|3412199025|440099028|12071999003|21061999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk5kWFFmY3l0S3FSVjA4MDk2VU02RkhrVjhzUFBMSkw5THp4RjBYQkZjRUJG?=
 =?utf-8?B?NmVSMXdyWlF3cUVhdXZiVzVQb0k2WDRXRy8wZG44Nk96czFsM2g2dkQ4cmVD?=
 =?utf-8?B?Mkg3eDVMVjF2QnpEZ29uejhlNUc0OHcxUnBVVU9Zd2hoSHJSNGY4QnVyUWQ0?=
 =?utf-8?B?R3IyV2dRUXRwT0ZzdGlTeDhIZ2piTGhOWE0yaThuaStWSGlzZkJ6SGxiNTVi?=
 =?utf-8?B?VUtGb1NxaTlFWXJoL3BDSGVFTDQ3VFFZZUJRMWU5RGVnaWtQbDY5UHh4VVFk?=
 =?utf-8?B?TG9aL0ZEb2lrUkt5Qlk2R0JVbGFzRVVZSjh4ZzBTQXBFblBCczlZQm43N2kv?=
 =?utf-8?B?bUZLNG1GZFFXQ0lMR1JMVHRuV1RRR2lhTXlKTFBTazdzcE1DcWh0OUkwSm4v?=
 =?utf-8?B?NnU5VjhNdmREZUx1NVB4aEhqV25WVDlnVy83RlQ3OE9vS2JRNWFZVHAyUkFm?=
 =?utf-8?B?VHpheWJkN20wNFZreWsyWTR2RCt1cVVJV3dGUXBRNkduWEdEWkk2Njcwd00v?=
 =?utf-8?B?UW42VnFQQnNnQkRyWVFHWGVROHVDOGxxSU1lNGxQOTFmVmtnMUZraFpxMHBZ?=
 =?utf-8?B?R0IySnhWejQ2eXpxdnAzN0t1NDNuK1VLSWRid1UrbnNQbUMxQnZCeFo2MTUx?=
 =?utf-8?B?c1JTVElZWlQ1MHdZZWwrSlZFUVJpOVhaQmx3Uk92RTlEaWI0d2lwelpEZmIy?=
 =?utf-8?B?NCtwZ3hOKzQyU0VYVXRibHdpbUpLekF5MUdKcVAvK2p2dnVucG9aU1BMUUdH?=
 =?utf-8?B?L2tOZjFGMmJDMHplc3RRWjJKUTJiUW0rT3Fid2MwQTVOTGQrbmQyaHgyaEQ1?=
 =?utf-8?B?N0o4UDRpcGJtWkNNYXVSVlZ3MzZKTXNFWnhHQndWbXEvWit4T1BjQUpuZFR2?=
 =?utf-8?B?WFNGaTVhbXZkMGlTMEplQnFRYmUzZENrWXpQK0J2Kzk2cWtUVGlERDk0b3ht?=
 =?utf-8?B?MFNmcTY0RmlSRjFpWHhqa3QwcDB3L2UvbS9ZYWVkY3FVeXUxTCtLcjN2M1V2?=
 =?utf-8?B?dVY2Y05PNjkyN05pWFU5R2RyZGNveWRZVWIwYm0xN1ZvSzN1R2xudzlBOVN3?=
 =?utf-8?B?dHp3Kys1SzVTYzk4QzlRMnRJa2ZkR1B5TkJ0dW04WHh4Y2FSRjZXM0FRZXJC?=
 =?utf-8?B?Z3Z3dmNHZnFRQ1VEMXRXc0ZNaUFkV2xnSzBqMjJOWDlNZEZHYXVLWnYvdGVG?=
 =?utf-8?B?Rk5tMmxpbUE1UC9LN3F3YXdwNWhseUpRTjBKR3hSWXZHT3poL2FxUThJRHJQ?=
 =?utf-8?B?Umc4alNQQ3FkTjI1YjNwWUNZL1dCWm10SWFwK1VlYUpjcElsbmdiMHN6cXBv?=
 =?utf-8?B?UnhvbGpkTSs5K0NsSEtkRWI0KzJiWEZVdm5EM25qMDNLNDNiMjhGYTVTOGJn?=
 =?utf-8?B?THlFS3g3eDl6RkNSV0UwdUJEaDFzbzRuTU5rQ0RVbEdOeEJ1ZDk2b0VsMFhy?=
 =?utf-8?B?Qzd1Wnd4VjJIOHZGWXNSYWR4U3ZiakJwZDdwN1FTdHF5dkUzcDZtdlRKVnBr?=
 =?utf-8?B?Y0NNRDZlN29HbTJBV2hFZFNsNUkxaDhvdEFkOWRITDJEK2lHZnRaNnJ6M3RZ?=
 =?utf-8?Q?DkMK/P7+dqwo2mpBN0CRXFqPY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek8xMkZTeG9pSTFVbncra3JlUnd6OG9LcUwyNzlZeE4xcVNqNk03Tjl1WnpT?=
 =?utf-8?B?TDlEZ1Vyb1Y0MWpqS2I4b0picE9VditYQ0JXY0tSUStrNkJhZmxkYU94QzRN?=
 =?utf-8?B?Q0ZGNVU2cG84UDlaek1ZOGRDNjZlYXMwRkVmbHJDNVFVWHJkV0FpTnhsUzdE?=
 =?utf-8?B?VGoxckxhUnN3Zmd4RHNaZzJjTWNUVytTSGtiQWY3eTAvTElHN29aOHV2ZWEv?=
 =?utf-8?B?Rk1LSWg4RDA1MFVxRE52azFRZ1c5WWdoajVJbzBEKzlFVU9MM0d2L3ZHSnUr?=
 =?utf-8?B?MUtkTUhNb2dVbzBGTHprLzFmaFBucXRVNm0wQk50MW9jYkErbzJEaGpUSEtO?=
 =?utf-8?B?SnJYNFdYUVZTMmNtOEREODRWdGtoUjdkWis0QmFrUDV0UXFxQy9QSjh3WUp3?=
 =?utf-8?B?Mmkyemt4elpzU1ppZkpjTUFvRUQxYmdGWkx0R1Z6Q2NXTldhK2Rvc3hLSmlZ?=
 =?utf-8?B?ZmJPdlFuVmxNWDZIM21HTThVRnpFVHpXRTNPWUlqR0pYRFZUdktvbkFWbE8z?=
 =?utf-8?B?VmZ3bGh4NDBRd2tMM2FnaVFvYy9Dai9JaWZQRlZPaG44U2hJZkw5WkVCV1N1?=
 =?utf-8?B?OG9qK1ExMmZWZldkVFNOYWlpSmxRYWQ4U1ZGQVhsYkpmOXo4TytBSDZoUTU3?=
 =?utf-8?B?Zkg0MHlUb0FNNDdtVFhBZ1k0L2VBVWIrTWFhclhuLzZMWUVVN3c5YWxyUC9C?=
 =?utf-8?B?TXBXT2p0SFJRWmo1K2FvZ2ZEeDFPU08rWXE0bjlRNjRad0hCdTZlbVdzT2ox?=
 =?utf-8?B?MzhyS1BETlZzN291c0drTTdsWnNTUWdVMFU1SWI4bFNBVGt6YVBXNVVkV1JC?=
 =?utf-8?B?ZE51U3Y5YXF4VFRZSytqQ1dhY2pKV3QrbG9pTWFLbWEzdE5OVGExMTQ2TWZT?=
 =?utf-8?B?OWFPLzBTYTNCa1BrUGZKN0xmVjNtNHpETVJjMW94TmZCTVU4UFBqL1JjdEZI?=
 =?utf-8?B?NngxY1A2cWRLNy9TMGJibG9IbU5QaS9ETUh5SzQyakFyODFDYjhCUHA2bldj?=
 =?utf-8?B?Z21wWVFjZlYwdldtRUo4SGtXWldLRm9mRTlkMk4xL1FNQWZuTHpiVkYvTmtK?=
 =?utf-8?B?S3ozUldldDJGM0ZDWjFBUWRWRVAxZXZxRUlxRjIwdUpmSEI1YitTbTk3NWNz?=
 =?utf-8?B?eTZpdE9TbklUVTFlS1BJbTlYa1BnK1RrR00yUW1HYkhaUjVGNFpFNUdjL1dQ?=
 =?utf-8?B?QjBNakd0RER3QWt0SFdyNXNPUVU3dmdNampHUFBRTnJTdjJMV1diK1VSQTdv?=
 =?utf-8?B?RHBTRGlyWFpzdGJrU3RYSG1EQzdFSUROVnlWRjgzSmxFUHdaUlN3d3NIamo0?=
 =?utf-8?B?bTlaa0VBZjZ3dVhVdTJXVWlNSEYycEx3clR0VTg4WWpqem9UMUlMVHBSZ1FN?=
 =?utf-8?B?ZGpLa2JOTThzUlFWcmkxMHQ5ZnZuYUwwSVhoOVR6MWR2QkN4UVlTalIxWkZE?=
 =?utf-8?B?QjRLN3ZCTllpV3paZE1uMEZZMFE0bWs0bnJqaG9hdHFvWDhURVBDaS84anlX?=
 =?utf-8?B?cjcybnN6VU9OSzBPNk9kalQ5T3o2T0RaZ0dvekVSSFVRd1plT0xvZ3h0ZlND?=
 =?utf-8?B?Q0NHKzJtTkc3YWZZSkVvWitFRjNhRk5QZFRsOHV5NTFCNHpQMXlhTFM5b2ti?=
 =?utf-8?B?MkxycVBRUHMydEZMZ0lvelFIbG1YTGpBai9Db1Q2YUh6UHVZTnVDdDN6SWph?=
 =?utf-8?B?dEFYYmNzZEE5WlJHRUx3ZWxudHo0RjYyTk1rNmE5K0hKRTFFL2hiZURmdFl5?=
 =?utf-8?Q?35cFn2zbcC9+ZTTG5Vg99BAOBitAeve2hTWOjvx?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb1f7d8-fd63-4f28-cc45-08dd496e50c9
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 01:00:30.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB8657


On 2025/2/9 20:29, Inochi Amaoto wrote:
> Add bindings for the reset generator on the SOPHGO CV1800B
> RISC-V SoC.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> index 76e1931f0908..73f8009698f3 100644
> --- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> @@ -11,7 +11,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: sophgo,sg2042-reset
> +    enum:
> +      - sophgo,cv1800b-reset

I have a question, if this patchset is for all cv18xx products? If so, 
can we use "cv18xx" instead of "cv1800b"?


> +      - sophgo,sg2042-reset
>   
>     reg:
>       maxItems: 1
