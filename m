Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010012.outbound.protection.outlook.com [52.103.67.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A008322DA03;
	Thu, 15 May 2025 01:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747272811; cv=fail; b=kgIBDlOl62pXg8GC/CFMNKmFJOI0FiQx0ML4KvcSvQ0EW/OmIAKaC6OmZWUeOB5mkqvfb9IH1vbJFqd/pBdvaAaGvZVCkoiF4jbNkbAn34uqAS6gKjCsnS+E/Q0goehLwR8oI9SiTtl9aqGtMLcBsXEq5+A8m+E7xGgEVXR1R8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747272811; c=relaxed/simple;
	bh=ANT3wVW1Coq5tNNp1UqJmrY+pNx7cSaq7cC4r/IMH3g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M4NwUQk+I6+XxwUi5B2KGXaTpr/7B+lnngECJBUp4WA2qFt+pZ3MY0NEO1EvFvnnKMjn4rw4jT2ZqoPKV9fL6TfsJm8U8ubndNFe5FY/2P348bVakyOwbhVXlUvhtPSuxV658eXs2Rt14em9wDN2lCVJcu2oWF57LdMhAdfVI74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=cy6yuQKN; arc=fail smtp.client-ip=52.103.67.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="cy6yuQKN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=az5rjByporB8xNnrfI7W1/6FFoQnbClAfF+CjPIYk70b2RlUiM1/M5oxKCrN+g1M5HNBAXKPubTVwQe4JLuLJSjHmL/GQx17MHbmQQYLnO8l8RInyBuNkI2Jt8uFIVmGRQu88WblFc7oFEp6DSoV4O8JC6muaPKH0DVb2cuG8iAzCnrEG3upnhIfkbRYnLkk5dgVyqTbjwUwNFhowmxG24F+hlDqLrni4YHBifLEJuj68cOWgGkoUixV32GZVhdZJ/tHMURRYXLKClJLH66LnVhysXJu+0C8pFwf9FQI6yc/SZ4ogvJZ3H2DblT0uyGAVJvhxCSMxrRAQVeCwswIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkQE0aGkvkHq3NJlYMrCj5AQ13lzHmYjgXWG1y69J9Q=;
 b=KZCF0pPk2dCOVh2V96lf/h8P8RjDh+7j+pWHdtQ9b6kFnf9e/O3cm3zAEDi9rLp/4Si95XFfVcBRTnu6n+psgshJ0dQG9Ymqx2jFpUvi06OVDBbsXGhMPdCCr9kAx5/HDFLByVuNpmAndQPpFiBYo1q3wgFtvtr6c6xsUpP+VWm/XUdlrHvmp/AsMCTpNpko5BqEOETLi1Gt4/8+Lk5ZxXBi4IPQeayxnEVmlHNxwkxNm4DRCTZQa8QMbQWK9sTvr2RZqT1x+jZMsxjDnWh/Vw0cTD5SHg3nlcDPQbSKL2+znyJ6Oao9t1lzWbompF4R8mNmYuihummIRQEdIe3xGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkQE0aGkvkHq3NJlYMrCj5AQ13lzHmYjgXWG1y69J9Q=;
 b=cy6yuQKNJqARMt99IYsBk/4J1Xhm8LOmXG5OeYppyM0MWu0uRvxBfbw44r4EMY4RwSlN3uXZtGiwaMJp4JuxUxzZ82rlZDexKdzudPVAWdSCyZlZ09H1hWIkQrk4HO9DIEHsWb9nzqv6ndx7s2nA6IUOUoljbME8hKW4sW6is8Kzo0lXJx/TIr+X5s+aJ7zOK3jzZ2bz+gWbCZjxEC6iZdnsa9xy4kldWZUP3u3uDyz/aPne6sy3aSG2iAnC+CdYvHyhIZmXVkjckBses9zL0m5Ppjci5fhMRK7u+O0j63U95OFnP0PoivXQDq2znEdSSzm2sPdC4Uf1kDG0I1mwAw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PNXP287MB4034.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:297::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 01:33:17 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 01:33:17 +0000
Message-ID:
 <MA0P287MB226290B908D3209E5C890BFAFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 15 May 2025 09:33:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Inochi Amaoto <inochiama@gmail.com>, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1747235487.git.rabenda.cn@gmail.com>
 <104dde6002c268a39fab6fcf469adc26d49ba364.1747235487.git.rabenda.cn@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <104dde6002c268a39fab6fcf469adc26d49ba364.1747235487.git.rabenda.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <6d914f6c-0d88-459d-b476-c1e6527ac3af@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PNXP287MB4034:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bca1bd3-34d1-460b-c4d8-08dd9350779e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|19110799006|461199028|15080799009|8060799009|7092599006|440099028|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXFzTjhpRG1jTFNtbUlNSTVEdThGQU95NkJhMEFKRENTQlNleXF0UXd4NEFU?=
 =?utf-8?B?dEIyYzN5S0htSk5XaDBGMS92eW8vOWNZQVd6dUxNajFWUjRScEFJdHNnNFd3?=
 =?utf-8?B?dFJSRHBDZ2NTOEphT2lNM3Z1TmNVU0hHeWh2a0RubHBPWWRJZGtyeFZnSmUr?=
 =?utf-8?B?QjBFOENNc1hSbVl5ZzZqS1BKbUQxMU9MNEFnT0wyeWQreHZ4bVNNNko1Zjht?=
 =?utf-8?B?cjVXV0RwNkpySW9FanVLTXVtWStLVWI3K2ZQZGVYMkx6SFQxMXNlaVNkTXEz?=
 =?utf-8?B?QWpReDJKVERtd0RyT3RWNURReUlQdGtyR1E1M3pLYkU0YjVZb1dRVU1Eb0Zr?=
 =?utf-8?B?b1V1d3hvSWNyd0NZMGVLVTcvVUpRcWxVekw3elZZL3Y3T25mcWhNMnpWZ3dz?=
 =?utf-8?B?azM2dmRqb3J6SzZPUHh0ZzhGcVpjaUFHVjJrYXQxSHVyYnFGMUhKYmZCYWh4?=
 =?utf-8?B?QkRXaVU5bGhtaFcwVnp6bnhkeFRMY0t3N3lGZHVZYXltUkQ3Wllvc2RUQmxT?=
 =?utf-8?B?MEN1bGI5dVcvYTVwYUlUNnpJR0hmNnVRR09LMkRkb2V2Uk5VOThTdTc3dXh6?=
 =?utf-8?B?VU1RUmJGQklKUXFDK1VsV2phQmw3QXZjOXJIT04xMmt4cFBFZUdOUTI5ZTRY?=
 =?utf-8?B?VndQcGFwOUdsWWNXeitXRTF1djdzMjZ4UFBXRVVmN1FYaHhFZ0F2ZU53NmtN?=
 =?utf-8?B?TWh2TTk5cERwdWt1QmpPS1lLQitsRGZ5T09ESVFHcnR3bzI4aUlSQ1ExTUtp?=
 =?utf-8?B?TldUTGxiby9jQ29FU0RsSHY3K1BnT3NmbVBVZWZ5UnNacng5anYxaThlczhD?=
 =?utf-8?B?dEllSEZKczExbERQaWJ5bjR4eEJydFlHOEk4MEV5NUJZMjZWK3VRT2xtTkpK?=
 =?utf-8?B?L0wvK0RxRSt1TUJ6WDdoSkF2OXRFZ3h0WVVkS3FZZ2p1OXJqVzVKUFhrN2gy?=
 =?utf-8?B?SXpMSE53ZVFHeTBQWkdEU0ZCazYvNWd1bXhsS3hiZ2t4QjM3d3dRQjhDbjRK?=
 =?utf-8?B?ODJsM1FZSllwc0tZL2d5bGl2SitaaVpOd0pzNWNPclJ2aXl1eUtJUjMvQmI4?=
 =?utf-8?B?UmxzaGpOajRya2ZpM25WUnlHbEswNUEyQ3ZTeXREWHdaUWpLc2tWbWVPY0pS?=
 =?utf-8?B?WkhlMzdYbzRyNmowaTR2N2wwdHBZMDlVdnFZb0Z3Z0dXUUtOdWNUMy9PV240?=
 =?utf-8?B?VlZPdGpjT1FKUldmYW1Xc3lZZWhxeHpPalhCWXRib282Q3I1bWpZai9JSUNW?=
 =?utf-8?B?MnJYbWVjY1dQc05LdzRCNzRqUXFOeWVPWmVaanVDWmtJbzRHcjNkRVhncXlH?=
 =?utf-8?B?OHFkOEJ6V3krZGNXZEcyalRMVHh6ZHpaOXRDRWdCQVl0YW02aUw2b0hJRXNn?=
 =?utf-8?B?V2hLTEVqNllEZFU3U29IZHl3ZS85TDd6MGx0RVRqWU1qaSttajdKcjF6aVZE?=
 =?utf-8?B?ZnhuSkx0ZXNsZjB1SitBbzJmRWNqeFRwNzRvVmRWYVpOQ21MazgrYnlhNk9n?=
 =?utf-8?B?WStVbWIvcXRkN3NNTnJLWmt2N21McVpEQlFLY3ZHTk9CQ2lHT3A4bG14ZXVL?=
 =?utf-8?Q?TbNs9cGhZ5weYfkwD7gRMvKCUV7Z3dewsQkiFx8swYTd5n?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVk4MkhNMDhqNlVqbklTWHREMUMrbk92Nk01N245QXYzaE5DUStjRUR6RFhM?=
 =?utf-8?B?SGFIMEhvQkdOeGIyOE1BREs4dTZpdVJkVERZWkZLMjJPbStMWE4vY0MxbkJ6?=
 =?utf-8?B?VlYzdHBaTnlxMEN2VmVNalpSUjhCQ3pZODRPT0VFcGp3T04zZHpyRk45bHYy?=
 =?utf-8?B?U0ptbHRXd3hPTWp6b3Bna0lMVzRpSzlNTUw3UmdZZEMvaTVIYXd0M0pRSUI0?=
 =?utf-8?B?cDZKTEdaUU1sYlppcTQrZ1p5T1RESnhWdEhTcG5sc3pBYTFqNU9nOTYrbVNZ?=
 =?utf-8?B?emoxOUJ0ZlN6QmU2TUY4eFROMGZXQ0lzSUgyQ1N2NEczVG9idVBXSEFCM3Q0?=
 =?utf-8?B?ZnpFSjNQaVZqdnJ2aUpPS1J6Tnc3R1hWYTJ4bUFWVnBBeUZybGNtWVQ2a0Fy?=
 =?utf-8?B?YTE5L015UklodHEzYUIrcDBzWWpLZDNDaFJULzJjQk1ET3QzUmlOakJwQlhS?=
 =?utf-8?B?eUN5a05mUHdTd004aEFwZ1Z5U2poelV2NCt1d0pPVG1iRVVyTlU5SHYxLzhE?=
 =?utf-8?B?OUFsVlhxdnkvWjlGcTk0NFVXQk40dHE4V3hFYnk1Vjhkdm9tSmRsZzB2WE8r?=
 =?utf-8?B?VzhnTWc5N0Izb05MMkRmL2dJeHVPaUc4S0IzWXVTM29jbkpVWGZhZ2Facm9n?=
 =?utf-8?B?MjByTjJmbXp6c0xJWlVrR0NXdjNoV3hDVXhTK044SDdWMzhCZk5mS0IwbWlE?=
 =?utf-8?B?Y1pKRFRMWjZadUdVQzNjSk1XRXg0eUhZT3lXKzVVUUQwNVFoWHdFMHgrTUZx?=
 =?utf-8?B?TzFKZDMyaFR1MmY3Qy9YVVF0NHFjYUZ1ak1uKzhEK0JqQmxMR2JTUUZEYStB?=
 =?utf-8?B?WkJCVDd0V0RYMFh5dURaU2JCVzk0RUg3d053VTB3TXRlV1JkL3NOUGcyQk4v?=
 =?utf-8?B?eTVBU3BKOE5ZeFVnQWNHa2RDaFhYcVhEbThuYytTYmJNM2VGVURFUy90WHNM?=
 =?utf-8?B?MGpacnZCdFgyVEFvQTlRYTJHVE5hMjREYVk3NEJjWWV6NmJXOUhsSU9BOUt4?=
 =?utf-8?B?aGdUSXlyVU9XSFVTb0hTZHVMR3FIeDZiZjdMNGhOUHhzR1BDMkx1RjliZ0Q2?=
 =?utf-8?B?WVZpb1lKRXhKaTlCc2FNUHZNeFdSNVAvT3Y4cU5zNUo4WkxWRFRMNjdZVXNT?=
 =?utf-8?B?eHFMMXFGY2NoRU9mV0g1RlpGNmVEUHZQUFpjWEx1elhraWNaYXBZZmdhQW9J?=
 =?utf-8?B?UkVMWng0bWtHY1dLTTNZRzhJbFdoWlVkSGQvTHVhY1lvSkpNb29ON2REMFVF?=
 =?utf-8?B?OVIwbDlWaXNidWRjRm9RQkcvOGhaZlhSa2RuU0l4S2lBVUM1N21aQnJBR2hp?=
 =?utf-8?B?TXZCRXFaNEpLdzBncTBsbkNVeGVtWm5CVmlWdGxWem1vb1BaRzB1Y09MUFlt?=
 =?utf-8?B?ZnRvOTM2RDV0SWFxbGZOOVp3czVTQkQxVVVLRVNjbWluSFRPdmVVU0dVSHlq?=
 =?utf-8?B?cGJPVzNzWTFaOVJ6SVFQUW1BYnZRWnFyZnEwVThjWThkZGJZdzNhS05HOUZ6?=
 =?utf-8?B?cDNQdnJQSXh5d3JZM0FiVGRmTFlKQzhyU29mWXAwMlFkZ3N2Mi9qTlo0V3dE?=
 =?utf-8?B?MnJNdk1zY2RYWXNHRHNpRlN5aWFzNzJkYTYrWkRncFNqbVhyMzhJb2ZQNXho?=
 =?utf-8?B?UzArby9BbFBVRU8zRTJaVG1KY09Lb0U1bFQwSmJrdmQrMEVJaVByWFBlNnF6?=
 =?utf-8?B?Lzh5L3ZVNzBtOVRaZXBCNytHMWgvcGZrMDllVU5sSmcrVlg4TWl4RGZ6U01y?=
 =?utf-8?Q?GrTcF7W4nLD8CAp3UoI5I5NrEawip+0lpjUb7FL?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bca1bd3-34d1-460b-c4d8-08dd9350779e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 01:33:17.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4034


On 2025/5/14 23:15, Han Gao wrote:
> sg2042 support Zfh ISA extension [1].
>
> Link: https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1737721869472/%E7%8E%84%E9%93%81C910%E4%B8%8EC920R1S6%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C%28xrvm%29_20250124.pdf [1]
>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 256 ++++++++++----------
>   1 file changed, 128 insertions(+), 128 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> index f483f62ab0c4..8dd1a3c60bc4 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> @@ -256,11 +256,11 @@ core3 {
>   		cpu0: cpu@0 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";

Need not touch this. "riscv,isa" is deprecated and replaced by 
"riscv,isa-base" & "riscv,isa-extensions".

And only adding zfh for this looks a bit werid.

Actually, I plan to remove "riscv,isa" later, so please don't touch this 
from now on.

Thanks,

Chen

>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <0>;
> @@ -283,11 +283,11 @@ cpu0_intc: interrupt-controller {
>   		cpu1: cpu@1 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <1>;
> @@ -310,11 +310,11 @@ cpu1_intc: interrupt-controller {
>   		cpu2: cpu@2 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <2>;
> @@ -337,11 +337,11 @@ cpu2_intc: interrupt-controller {
>   		cpu3: cpu@3 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <3>;
> @@ -364,11 +364,11 @@ cpu3_intc: interrupt-controller {
>   		cpu4: cpu@4 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <4>;
> @@ -391,11 +391,11 @@ cpu4_intc: interrupt-controller {
>   		cpu5: cpu@5 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <5>;
> @@ -418,11 +418,11 @@ cpu5_intc: interrupt-controller {
>   		cpu6: cpu@6 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <6>;
> @@ -445,11 +445,11 @@ cpu6_intc: interrupt-controller {
>   		cpu7: cpu@7 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <7>;
> @@ -472,11 +472,11 @@ cpu7_intc: interrupt-controller {
>   		cpu8: cpu@8 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <8>;
> @@ -499,11 +499,11 @@ cpu8_intc: interrupt-controller {
>   		cpu9: cpu@9 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <9>;
> @@ -526,11 +526,11 @@ cpu9_intc: interrupt-controller {
>   		cpu10: cpu@10 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <10>;
> @@ -553,11 +553,11 @@ cpu10_intc: interrupt-controller {
>   		cpu11: cpu@11 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <11>;
> @@ -580,11 +580,11 @@ cpu11_intc: interrupt-controller {
>   		cpu12: cpu@12 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <12>;
> @@ -607,11 +607,11 @@ cpu12_intc: interrupt-controller {
>   		cpu13: cpu@13 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <13>;
> @@ -634,11 +634,11 @@ cpu13_intc: interrupt-controller {
>   		cpu14: cpu@14 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <14>;
> @@ -661,11 +661,11 @@ cpu14_intc: interrupt-controller {
>   		cpu15: cpu@15 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <15>;
> @@ -688,11 +688,11 @@ cpu15_intc: interrupt-controller {
>   		cpu16: cpu@16 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <16>;
> @@ -715,11 +715,11 @@ cpu16_intc: interrupt-controller {
>   		cpu17: cpu@17 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <17>;
> @@ -742,11 +742,11 @@ cpu17_intc: interrupt-controller {
>   		cpu18: cpu@18 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <18>;
> @@ -769,11 +769,11 @@ cpu18_intc: interrupt-controller {
>   		cpu19: cpu@19 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <19>;
> @@ -796,11 +796,11 @@ cpu19_intc: interrupt-controller {
>   		cpu20: cpu@20 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <20>;
> @@ -823,11 +823,11 @@ cpu20_intc: interrupt-controller {
>   		cpu21: cpu@21 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <21>;
> @@ -850,11 +850,11 @@ cpu21_intc: interrupt-controller {
>   		cpu22: cpu@22 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <22>;
> @@ -877,11 +877,11 @@ cpu22_intc: interrupt-controller {
>   		cpu23: cpu@23 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <23>;
> @@ -904,11 +904,11 @@ cpu23_intc: interrupt-controller {
>   		cpu24: cpu@24 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <24>;
> @@ -931,11 +931,11 @@ cpu24_intc: interrupt-controller {
>   		cpu25: cpu@25 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <25>;
> @@ -958,11 +958,11 @@ cpu25_intc: interrupt-controller {
>   		cpu26: cpu@26 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <26>;
> @@ -985,11 +985,11 @@ cpu26_intc: interrupt-controller {
>   		cpu27: cpu@27 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <27>;
> @@ -1012,11 +1012,11 @@ cpu27_intc: interrupt-controller {
>   		cpu28: cpu@28 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <28>;
> @@ -1039,11 +1039,11 @@ cpu28_intc: interrupt-controller {
>   		cpu29: cpu@29 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <29>;
> @@ -1066,11 +1066,11 @@ cpu29_intc: interrupt-controller {
>   		cpu30: cpu@30 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <30>;
> @@ -1093,11 +1093,11 @@ cpu30_intc: interrupt-controller {
>   		cpu31: cpu@31 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <31>;
> @@ -1120,11 +1120,11 @@ cpu31_intc: interrupt-controller {
>   		cpu32: cpu@32 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <32>;
> @@ -1147,11 +1147,11 @@ cpu32_intc: interrupt-controller {
>   		cpu33: cpu@33 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <33>;
> @@ -1174,11 +1174,11 @@ cpu33_intc: interrupt-controller {
>   		cpu34: cpu@34 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <34>;
> @@ -1201,11 +1201,11 @@ cpu34_intc: interrupt-controller {
>   		cpu35: cpu@35 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <35>;
> @@ -1228,11 +1228,11 @@ cpu35_intc: interrupt-controller {
>   		cpu36: cpu@36 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <36>;
> @@ -1255,11 +1255,11 @@ cpu36_intc: interrupt-controller {
>   		cpu37: cpu@37 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <37>;
> @@ -1282,11 +1282,11 @@ cpu37_intc: interrupt-controller {
>   		cpu38: cpu@38 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <38>;
> @@ -1309,11 +1309,11 @@ cpu38_intc: interrupt-controller {
>   		cpu39: cpu@39 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <39>;
> @@ -1336,11 +1336,11 @@ cpu39_intc: interrupt-controller {
>   		cpu40: cpu@40 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <40>;
> @@ -1363,11 +1363,11 @@ cpu40_intc: interrupt-controller {
>   		cpu41: cpu@41 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <41>;
> @@ -1390,11 +1390,11 @@ cpu41_intc: interrupt-controller {
>   		cpu42: cpu@42 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <42>;
> @@ -1417,11 +1417,11 @@ cpu42_intc: interrupt-controller {
>   		cpu43: cpu@43 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <43>;
> @@ -1444,11 +1444,11 @@ cpu43_intc: interrupt-controller {
>   		cpu44: cpu@44 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <44>;
> @@ -1471,11 +1471,11 @@ cpu44_intc: interrupt-controller {
>   		cpu45: cpu@45 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <45>;
> @@ -1498,11 +1498,11 @@ cpu45_intc: interrupt-controller {
>   		cpu46: cpu@46 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <46>;
> @@ -1525,11 +1525,11 @@ cpu46_intc: interrupt-controller {
>   		cpu47: cpu@47 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <47>;
> @@ -1552,11 +1552,11 @@ cpu47_intc: interrupt-controller {
>   		cpu48: cpu@48 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <48>;
> @@ -1579,11 +1579,11 @@ cpu48_intc: interrupt-controller {
>   		cpu49: cpu@49 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <49>;
> @@ -1606,11 +1606,11 @@ cpu49_intc: interrupt-controller {
>   		cpu50: cpu@50 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <50>;
> @@ -1633,11 +1633,11 @@ cpu50_intc: interrupt-controller {
>   		cpu51: cpu@51 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <51>;
> @@ -1660,11 +1660,11 @@ cpu51_intc: interrupt-controller {
>   		cpu52: cpu@52 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <52>;
> @@ -1687,11 +1687,11 @@ cpu52_intc: interrupt-controller {
>   		cpu53: cpu@53 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <53>;
> @@ -1714,11 +1714,11 @@ cpu53_intc: interrupt-controller {
>   		cpu54: cpu@54 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <54>;
> @@ -1741,11 +1741,11 @@ cpu54_intc: interrupt-controller {
>   		cpu55: cpu@55 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <55>;
> @@ -1768,11 +1768,11 @@ cpu55_intc: interrupt-controller {
>   		cpu56: cpu@56 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <56>;
> @@ -1795,11 +1795,11 @@ cpu56_intc: interrupt-controller {
>   		cpu57: cpu@57 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <57>;
> @@ -1822,11 +1822,11 @@ cpu57_intc: interrupt-controller {
>   		cpu58: cpu@58 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <58>;
> @@ -1849,11 +1849,11 @@ cpu58_intc: interrupt-controller {
>   		cpu59: cpu@59 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <59>;
> @@ -1876,11 +1876,11 @@ cpu59_intc: interrupt-controller {
>   		cpu60: cpu@60 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <60>;
> @@ -1903,11 +1903,11 @@ cpu60_intc: interrupt-controller {
>   		cpu61: cpu@61 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <61>;
> @@ -1930,11 +1930,11 @@ cpu61_intc: interrupt-controller {
>   		cpu62: cpu@62 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <62>;
> @@ -1957,11 +1957,11 @@ cpu62_intc: interrupt-controller {
>   		cpu63: cpu@63 {
>   			compatible = "thead,c920", "riscv";
>   			device_type = "cpu";
> -			riscv,isa = "rv64imafdc";
> +			riscv,isa = "rv64imafdc_zfh";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>   					       "xtheadvector";
>   			thead,vlenb = <16>;
>   			reg = <63>;
