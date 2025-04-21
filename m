Received: from outbound.mail.protection.outlook.com (mail-centralindiaazolkn19011025.outbound.protection.outlook.com [52.103.68.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5671E51E3;
	Mon, 21 Apr 2025 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745232463; cv=fail; b=HB2cyPdjSvSc+lc1or8X6jrJfAAUWuI3IGdEYq+30SbCeFeJY7qHsvcCIVCbXLhbZfTH14XuHwhW80gmlJJBCp6vgPgklL8AlUObKH2k+BsPtHqrKK/0QUjMeJ5LL46dgYnLn4vLgdpVnYpbyIdVvCUKHqNrypkiwgaETisQQPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745232463; c=relaxed/simple;
	bh=H8mko8EAyIGdc0x61FkfIT+uKJAWEaHSc3/ABxi0628=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ggaswuOREB5ObgdK9/xo+O+uRsnacUZvT57RVz9I/mSNtEmu5lHTWB5YVf09JKqkvnZILEAXHsrRumECUQk8CqIz5jE7ulFvpCBdfdTpu+GqOf4vqlWuevepu5bSTCfNfdnGFnKAkCbHdYsjBzfs2pAs1kur2tm7gdegUrJBw9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=S7jl4xIA; arc=fail smtp.client-ip=52.103.68.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="S7jl4xIA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eimp4t3R868K/qs3rfh28HkvAj3ckJiBMs0NhCa+RN5s1tR96YKflRxfF/9D9UrrHFGUlsNBAI/QkKp0hVcerj9/yxWmBoIzPBle0Y1Ek2W7gNdtZFAGf3O0xEQldb3tk/EhXqgjimVk0jenl/MALoVmMIRAcJP3BCs4DxfCdjUg2fl8ck9HpzRSy7OZMc2Dl2wzQwrIYGtshuj7BWp84LYPBnw8XVG1zh5v2ZfpmCTcsR2QwUdFXdwwesbTqn87ognXY+Q/UGR5ILmk5qVICpPQ5MHldu5LOV57VdsBAH/VhHG4mHa7y5HjJuRrGIkyU4n/PoAROWslKgjnG6bFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1ZJ0e466dlV2K3/r+tkxL9WDn3GALswAKZf/3fmOeY=;
 b=RQmRZ3Q/vZqBBFIeyMEnj4rdOnWYlXxHSUhxZAwa3gnA2VZC7mFSKFDllEZvc/+jx5HIFeN+cAPazZ7B6LfmzZlRpzUTiXjpjnYF56uGkNV6wjAXd46mN9SLTxgRpuMsNx7AGKtNjzIVP5JQnAhq7DfspDsCbHebIgv2NlgoeSyLanhAKKkjR5701KFrah2bV7BiqZAdfXBAWZxg3goxOwSiDDf/buJdHjdwujb9cEpuKTqOe/io2KJ536aUumvblYWphZKnk6f3emJJHHe7HJMm4EDr0zLzXDSCU9J/ocg0jDkI5+ugJKrSNu/2S9I5nfuzBSr5abiFvkPFmW2/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1ZJ0e466dlV2K3/r+tkxL9WDn3GALswAKZf/3fmOeY=;
 b=S7jl4xIA7np1yCdAG1xwRZBqis52Oj5HTX4kYjezaFinGUzNHNscriDYDqsIe3o99+lI0NQMj8EnKkr7pBBytO/xZfcAw2cQPRYGNIgelBFTdxkvvB9ScubNZ6uM9X/FnxRfe4YTuEuG/zKGN4BO+yXfNRwXaZYe3n2siID1a5sladxXDV4GC533a5UiBGYyFACaPBTTS7+LjgmS2ur2SVCZaUIGp+q+9h5N4jmIzZCSk9h0OJbStmAE/QZBM6yBSWvrtYSrkGyfjPIZRHdw57hlT2ZSTEHO4W/N3xjztzutJE/BkyzXNGyefog3FqZ2mqd6QM+mOCevI3XykofHAw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3PPF4A4AF0FC7.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::a4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Mon, 21 Apr
 2025 10:47:25 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 10:47:25 +0000
Message-ID:
 <MA0P287MB22621E1EC7F030E093C05084FEB82@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 21 Apr 2025 18:47:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Xukai Wang <kingxukai@zohomail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
 <20250415-b4-k230-clk-v6-1-7fd89f427250@zohomail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250415-b4-k230-clk-v6-1-7fd89f427250@zohomail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0095.apcprd02.prod.outlook.com
 (2603:1096:4:90::35) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <86c1b906-b4d1-4c12-9b26-2db1835aa212@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3PPF4A4AF0FC7:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b066396-df39-4883-180a-08dd80c1e6ea
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|8060799006|15080799006|7092599003|19110799003|461199028|4302099013|10035399004|3412199025|440099028|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0VnOW1iZEFmQmFNTldPeVREU20wN0V6L0gvY0x6VHl1SXZFdXJsczh3QzQ4?=
 =?utf-8?B?bDBGVjVqOUpDY3ZWYmZqMi8wWmVGMkloUkVHNUpuRURxS2pSRDJTTHNJa1JM?=
 =?utf-8?B?ZEtpallsc253czZVOXNGYWxSTGhvUHlEUU9TS0I1WHM3VFZtY2R5RWlpUGlB?=
 =?utf-8?B?QUZ0NWFNSWpHVlQyTFIzUzRncDMwekNwdVhrZDV6VHkwZkM3SGQra3lTNytU?=
 =?utf-8?B?Z01sUHh1MHRHdjkxMHVseWlWbnNvOEY5a1V2Y0lySVdXMzg0dmM2YlVQckN1?=
 =?utf-8?B?VkdlQWZNbWZobkRjWE5VMWNKSzc0SnNTb1gzenhsNFZCR1dndncvaUpLOU9t?=
 =?utf-8?B?Q3JaeGRQdGJOc0NVVTk2aHFxVVN4cHBWeGdSYW9wZW9OUmxTSnNTTHFBQ3lh?=
 =?utf-8?B?NTFVRHBCSGlCaS9teWY3cFNFMDhZeUlSNHp2STh3NUEzWjgzb1VJMGo3bzVL?=
 =?utf-8?B?eWhRSTNiUEFXdnQrbXNkbEMvMjgrekRxNjN5QzVRU0dlRWFacThOMnp2dnVS?=
 =?utf-8?B?aGZMOXFrcHI3dUcyNkZ1QnduN2JRQUtKU1dkK1FLODFUNjFYK0JrY3ErdnVm?=
 =?utf-8?B?dk1melp6ZG1ZbEZuNGRZamNJV0szVDFQaEVjdVRmMXBRSUU3RkNLNmMvaHp1?=
 =?utf-8?B?RFQvamMxS001M2pGQmlhSWt5R1Q4WUVNd1ovUHo1eWw2MnMvZkRXRWxEMVFh?=
 =?utf-8?B?SWxBaXk1UnhkYmNEOVdiZm1FQXJtOVhJQ3NIeTViNllzdURNTld3alhMYVM2?=
 =?utf-8?B?dHQzRDh2dy9kTHZQTDlZRUpJSHNUN0ZYMkdVWjRVTkJDcEhSNUUvTkpUdVg2?=
 =?utf-8?B?c3NtZ2lkZDA4eEw2TDRWZlppWEQxNGg4eldaTjlGV1JEQktvNjdDWFZDMWRr?=
 =?utf-8?B?d1dyQ05FTlBqQW9FN29kclp5cm5HazdGRDBsdDh0K0J1ajIrb25ab3JvUmti?=
 =?utf-8?B?bXp3RnlBMFRidzRwUUFUaXpHcFZvU2wzNjRTcVV3cWNqZVVLY2dHaDZGWEZR?=
 =?utf-8?B?Z25WRHpIOHZJcXYzZ0syR0dlNEoybTVsWm91cENtZlFOb2EzanJxOUlXK0JE?=
 =?utf-8?B?cFhDZjVlYjdPbEZNNG84bTMyQUZjNGpSbGRNUzh0ekIyK2pReEk4Z3JRNUFh?=
 =?utf-8?B?QVBLTHE4aXJHKzFQRkdRT1htZGdXcVZISGpOV04vRDJHMCt1NjdtajcyMHhK?=
 =?utf-8?B?b3lhQllQMndNZU1pS3QxWVJrUGVySHR4MGdBeHlVS2FKU2dsTXlJd1hVa1RE?=
 =?utf-8?B?ckJOc2NLTGQzcFYrOThoMVJ2R2FsVThiT01YejR1MkpyYlp6WDBTb3RBWlNG?=
 =?utf-8?B?WXZ1bUZZaGUraWxjSVoxZHpWUkdPb2l4VHBmYXlzcWZBOWlnei9IRTJBa09k?=
 =?utf-8?B?TEZNTmZqSjExNEthb25XazBJV3RGVHkvdTRqN2NoeDNCYnhvR2FIMmpVN2tU?=
 =?utf-8?B?NGFSUDBUZVdvL2xydWhTSHltaER2NG9sY3NhcVovRlNNMklUbG5UdGtwcmpM?=
 =?utf-8?B?OEdDaXV6dGxKZlpZRmZmM1RocjZNcGVYaFJvSUQveEdlZWVhclFRZ3VIaDFh?=
 =?utf-8?B?Q0lZcThueWxhNmdDNlpVTUw1SHdXL3RCRWZGakZDQkQwdlI4QWRqYVE1bldV?=
 =?utf-8?B?Z0tXdE1lMU1RODRReW9WcmhlSlBPbVJTVlhDZVVTRGRsRnpLQ2VRTVdUYk5N?=
 =?utf-8?Q?jUuCug2AKgEguFwPpEoT?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU5sODNURm40bTlmdnhpeHNjTXQvMkFhNDdnRGZmcWVRQzFRTnJCV2xUd08y?=
 =?utf-8?B?VVRlQWw0S2VEeTZ4dmVINDJ2b1FjVjZ2V05WRFdTSUpjczhRYnZkRWZHcUJL?=
 =?utf-8?B?K3lMTndrRWxSTk5FVDRlNmE1d0dHRk5FT0w0eHBzYTc5UStUVncyRDE1VW54?=
 =?utf-8?B?V0RQeTIxZ0w2UW42NHZnV3UwVFlWSE1NSVVhbUVMRDdjMUNwYzZvOThSNkor?=
 =?utf-8?B?NWw5UGdPVWRVZWhWK0h1R2R5UGhSLzhUSFpzc1ZaL0ZmbmxNLzNoOFRDSjNj?=
 =?utf-8?B?OE9iVk8wcEtISUUwM0RKcVpEcGlXVENUQTR1WkludlgzclJ5WCtxTWl2YW12?=
 =?utf-8?B?aXNsQWJtY3JIVUgvOVdlbGlJVm5OWldubWIxK1FsMEdHdTJkZW5aY1FYVTA3?=
 =?utf-8?B?WnBKSFF3cVZtc2VHRE1RYjlIRU5QZGUydHZmaUMxTEcrK2pXaFkxTW03enNB?=
 =?utf-8?B?V2dXR3AvK0JzdE9lbDEzSnAweGJESGRLVjdMb0UrdE5hZjlhM0FFVlFrVmg4?=
 =?utf-8?B?YUJqZ3FUblpFWTBHUDVveEhicE1lTll3ZG44YlVCTWk1UTFPWGxndVo1Vm9o?=
 =?utf-8?B?b2RoTUpPQ1R1Q0FFdVB4Z2s2ek9tdjhjbHV5clNmWGVwbDIxck8yNWNXOEhk?=
 =?utf-8?B?b3FQQjhXbzJxOGNxblNodU12aS9BR3JTMHJSaC9JWlFuNGlPa2xzbG1rQkg0?=
 =?utf-8?B?enRtaXJONitBeHVxTWxmTXE5ekkzUVMzblpoOW1zL3Z6TVNxYm1mdTV2NnVC?=
 =?utf-8?B?cEd1U25zMUs4bVphUVdNcHJvQVZNb1Mvem5qc0tyVmpqWXgzR0h6SlIvbU1S?=
 =?utf-8?B?UVdSRUNKM1V5bmg5NWFxQ3ROOHQ4OVdlT1Rvb004R1RiVExWMEc4UnF6M3ZK?=
 =?utf-8?B?cVkyQTVDcU1tS01XOGYwQnFGTyt5Q0dNSHdoRkFXS21YVE5qRGU3dDBFUkd6?=
 =?utf-8?B?R0srMU1hbDNwOXk0TStHQUlBODZncWh2dFphUXM1c043ZWJxVEk4bW94MTk1?=
 =?utf-8?B?enJHZitpcVF4Wnp2cWJpMk81U1RJbjhpU2llMHFydG9icXJRV3RsSmppcXpm?=
 =?utf-8?B?MHVVTmJhNmxmZ2N4M2o4K1plUE15em1pcEZ1T09yaU1KMkQxWk9mUzBJZDlS?=
 =?utf-8?B?UlVYRWdqSlNBd2tEaEdUaTRtNzcrb3JhMkFaSEFqUHhaL2ZjWSsvSFpZMlNq?=
 =?utf-8?B?QmhySDVRMkZTSXQ4M0RBVUdlQ0NkUTV5NnF3UkgvR21JODVRYmdSZlk3eHZl?=
 =?utf-8?B?SWdLajMrY0hBQWp4UmFJbkJiZnlpaGZYVXF0b0tIRlRwcUF6NGplcWIyQml0?=
 =?utf-8?B?ZHYwV2FjMTBiSWxWVWRoc1VTVHZOdmsvdVRVT2kyejNtMnVRL2w1MnBhbHNO?=
 =?utf-8?B?VHI1amZDU1BZYkFXSmZIUkp3KytldWxtSTg1RkoxcnJNOWRTNXBKRForNWw1?=
 =?utf-8?B?Z01EeVhrdVdxT1R1dGZveUJWU28xU3NZREJkcitmVHdmTE5jQmpwU0gwbkg3?=
 =?utf-8?B?dzRsOGpoVDd6b3BQcUJYWlY0NWw3NUQyTDhxcndhYmp1SDRnRWRYbDBqd0pj?=
 =?utf-8?B?ZVpEd1RieVV5TWZhTkxqN2QxWHY0NUZMcVdoeTdUendpWW1qTGpaZm5kaHZs?=
 =?utf-8?B?MEdFd05CWlJ4OHNpTlUxSnZjeEJuRVVNaFVhWjN1UEhNZ0FYblNiYzJlMHkz?=
 =?utf-8?B?STdTNmVwWlR4dUZQOElLVWpPa3lLOXh1aU5UbVYyNXE0VjUzVHV4SFBGb29T?=
 =?utf-8?Q?09qt7IrHle62Rg+KQKUa+dd44R6aMnvuEsq/jMi?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b066396-df39-4883-180a-08dd80c1e6ea
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 10:47:25.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF4A4AF0FC7


On 2025/4/15 22:25, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the new clocks available and
> the required properties to configure them correctly.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>   .../devicetree/bindings/clock/canaan,k230-clk.yaml | 43 ++++++++++++++
>   include/dt-bindings/clock/canaan,k230-clk.h        | 69 ++++++++++++++++++++++
>   2 files changed, 112 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d7220fa30e4699a68fa5279c04abc63c1905fa4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K230 Clock
> +
> +maintainers:
> +  - Xukai Wang <kingxukai@zohomail.com>
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-clk
> +
> +  reg:
> +    items:
> +      - description: PLL control registers.
> +      - description: Sysclk control registers.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@91102000 {
> +        compatible = "canaan,k230-clk";
> +        reg = <0x91102000 0x1000>,

Note that when actually writing DTS, the PLL-related register range is 
not so large (0x1000). Otherwise, the BOOT-related registers may be 
overwritten.


> +              <0x91100000 0x1000>;
> +        clocks = <&osc24m>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/canaan,k230-clk.h b/include/dt-bindings/clock/canaan,k230-clk.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..41edb13ea04bffaa1ddd1d1af87ae3406b688332
> --- /dev/null
> +++ b/include/dt-bindings/clock/canaan,k230-clk.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Kendryte Canaan K230 Clock Drivers
> + *
> + * Author: Xukai Wang <kingxukai@zohomail.com>
> + */
> +
> +#ifndef CLOCK_K230_CLK_H
> +#define CLOCK_K230_CLK_H
> +
> +/* Kendryte K230 SoC clock identifiers (arbitrary values). */
> +#define K230_CPU0_SRC			0
> +#define K230_CPU0_ACLK			1
> +#define K230_CPU0_PLIC			2
> +#define K230_CPU0_NOC_DDRCP4		3
> +#define K230_CPU0_PCLK			4
> +#define K230_PMU_PCLK			5
> +#define K230_HS_HCLK_HIGH_SRC		6
> +#define K230_HS_HCLK_HIGH_GATE		7
> +#define K230_HS_HCLK_SRC		8
> +#define K230_HS_SD0_HS_AHB_GAT		9
> +#define K230_HS_SD1_HS_AHB_GAT		10
> +#define K230_HS_SSI1_HS_AHB_GA		11
> +#define K230_HS_SSI2_HS_AHB_GA		12
> +#define K230_HS_USB0_HS_AHB_GA		13
> +#define K230_HS_USB1_HS_AHB_GA		14
> +#define K230_HS_SSI0_AXI15		15
> +#define K230_HS_SSI1			16
> +#define K230_HS_SSI2			17
> +#define K230_HS_QSPI_AXI_SRC		18
> +#define K230_HS_SSI1_ACLK_GATE		19
> +#define K230_HS_SSI2_ACLK_GATE		20
> +#define K230_HS_SD_CARD_SRC		21
> +#define K230_HS_SD0_CARD_TX		22
> +#define K230_HS_SD1_CARD_TX		23
> +#define K230_HS_SD_AXI_SRC		24
> +#define K230_HS_SD0_AXI_GATE		25
> +#define K230_HS_SD1_AXI_GATE		26
> +#define K230_HS_SD0_BASE_GATE		27
> +#define K230_HS_SD1_BASE_GATE		28
> +#define K230_HS_OSPI_SRC		29
> +#define K230_HS_USB_REF_50M		30
> +#define K230_HS_SD_TIMER_SRC		31
> +#define K230_HS_SD0_TIMER_GATE		32
> +#define K230_HS_SD1_TIMER_GATE		33
> +#define K230_HS_USB0_REFERENCE		34
> +#define K230_HS_USB1_REFERENCE		35
> +#define K230_LS_APB_SRC			36
> +#define K230_LS_UART0_APB		37
> +#define K230_LS_UART1_APB		38
> +#define K230_LS_UART2_APB		39
> +#define K230_LS_UART3_APB		40
> +#define K230_LS_UART4_APB		41
> +#define K230_LS_I2C0_APB		42
> +#define K230_LS_I2C1_APB		43
> +#define K230_LS_I2C2_APB		44
> +#define K230_LS_I2C3_APB		45
> +#define K230_LS_GPIO_APB		46
> +#define K230_LS_PWM_APB			47
> +#define K230_LS_UART0			48
> +#define K230_LS_UART1			49
> +#define K230_LS_UART2			50
> +#define K230_LS_UART3			51
> +#define K230_LS_UART4			52
> +#define K230_SHRM_AXI_SRC		53
> +#define K230_SHRM_SDMA_AXI_GATE		54
> +#define K230_SHRM_PDMA_AXI_GATE		55
> +

It seems that some clks are missing, such as the timer-related clocks. 
Please try to fill them in. There is no need to submit another patch for 
this.

Thanks,

Chen

> +#endif /* CLOCK_K230_CLK_H */
>
