Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011026.outbound.protection.outlook.com [52.103.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B9922DFA3;
	Mon,  7 Apr 2025 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016484; cv=fail; b=JnM+VAWeaJDYQP89rYfxl3Qehm77ADQR642QKi6wAnm7W3CEfuy94skw3c/pFT8Gc7YCvAHSpejHsaLXd3zW50l6U0Y+IMuB5/gLw6mSi+4mVPvPj3o6tX/t9gs4jGFjFHWspS2sitq7X8HJ7DrWm//scNJGU4cji9KitCNUCMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016484; c=relaxed/simple;
	bh=Vn0wolzTNL58KJlSaKYSnRqm+c8uvjvM5F4tT9IlyFw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ODkbgB8gQwKD0MNh5efb2WdbIq/i6X0U1502WtU4meOQfWEwvJvYorMUZspRuHlamwfwCdRgp2zaA3xvIoGmyZqvxEK9C7jdAL9k7Ox8IWTUddCWnOHUbiIurf8Eln09K1wCM68J6vWpo8NgpDiyTNIO5paXbRs3gbsMiZ67BLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=LPAPhOcB; arc=fail smtp.client-ip=52.103.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="LPAPhOcB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ig9WHfNozN0Tw8WeRFuz0LPGI+uDg7ZJaROZTd1NYGle9lT3UvQZq0sdzWMrK1o1OIBtSggXwIc0bM5rGGnkTAKYkZyhuS5OodX2UEA9ynse1ho1gX3t5QMNgwBKzmuCndQHvQEgol2Zv4whVAhb/0+iy0zuAwVaP+dEG/Ne6gD/aP/KNynsQ4dmI7tLQ8gH2AFbYXWEIQvvFlQunuhSl5nbfkE2nkBUpk4tWswfLc3nV3UfOnPdZJQu6XHjuz2cjlrXosznItLvItFbXpktTGG7ocvvs1V5i0b94S7hsTLKB7h+zNV5oKTF2JtVrFr3FQ+t5cdfTuEUcZ0OgDuyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEIOOP8OompWh9pq4Xz3BGdUah0+9Fwv5ySpU3gVFAs=;
 b=VRQTmWuvGoEjfOQZCLHm+vBKMXtHvd500vbkfMnBO9WFzkpL7Z/PRt8DdUy2VBOA9J1SGfRIsztZXv7yR7D7dpchxk1zBc40IhdnDDLkpMsTtH3JA+HaM7Ixvd20OKbfnxyHSpaTA2QTQyx4E1WejPkEjPYC6V8C6pl6vCJ8qohRZlKipPlfKiXGBz13oIZEQr2FF+YYk4Y3xPCBvBg3TdEeyngU1TKNjbBvWpMJYFivRe2MTSTcmZ3v7BtAJmfAVf245v4+jFlaeG4YWWs8xRBpJ0d22laWpUx0YvtuakyjltJMCe5XNqWH6OBDcvsV/DHY9KU1QyU2cbHTHc87nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEIOOP8OompWh9pq4Xz3BGdUah0+9Fwv5ySpU3gVFAs=;
 b=LPAPhOcBX7K2SIRrdcb8Rq75fls+fH7f/AKF1eWpNbAxhh7scPLmczZtXZoO7LjXbRMjer1LW5DM6NU2QD0zDqsR/WRllZJMV/SFJ2CL5rIxe/OQacpunjIlfm1bYKCxnTJlQ4TZcBXO503Z2KKQkvK33B/sNHW+8xQdGUqyz683cb0UtT76Yv1npEASADIHJ62mCOnuvWXpZpKn++c8gLOjW8lEqsPOJVwdaPRl37G87hcDcon1DN1oNw0GDwx+aK1NuZeBMdoHR3cY14/9+PzBWqMFQbrLHMJHjA6dBH7EEVI08DhUHix3ppOB78UtJtI9uyiFJ5kVuVKE5dnSoQ==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB0584.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 09:01:16 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 09:01:16 +0000
Message-ID:
 <MA0P287MB226200F09E78C592897C8FFFFEAA2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 7 Apr 2025 17:01:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: sophgo: Fixes Coccinelle/coccicheck warnings
 reported by do_div.cocci.
To: xiaopeitux@foxmail.com, Pei Xiao <xiaopei01@kylinos.cn>
Cc: sboyd@kernel.org, mturquette@baylibre.com, inochiama@gmail.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_D5D35C992B70843CF70F5533E49717D24906@qq.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <tencent_D5D35C992B70843CF70F5533E49717D24906@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <90010661-20fb-4966-aff5-83911d0b57b2@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB0584:EE_
X-MS-Office365-Filtering-Correlation-Id: 04663d29-02ff-4217-cc0d-08dd75b2bffa
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|15080799006|8022599003|7092599003|8060799006|19110799003|6090799003|5072599009|1602099012|10035399004|440099028|4302099013|3412199025|26104999003|41001999003|12091999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0xhV1A1N3dqd1NMc2FaMG5ndjE3eTNmdVNlYW1XUHVTTlpOd2l0am9IMzNP?=
 =?utf-8?B?VWdBWUF2dGhlREVONndza0JsaElEWDFZRzQwRUN2YlVLVlhubzFscWltWmps?=
 =?utf-8?B?VmtpNWNMcW5iUWtYcldUZ1hoc2hMWmlEbFRROHRxOW0yV0tvSjBYeWJib1J3?=
 =?utf-8?B?L3NpL3JqYXBsckw5QU42RDZoYk5kSHU2OGNlV3ZWN1Jsd1pQNzAzZkZxUUc3?=
 =?utf-8?B?aVdKVWErRzlmN3RUejhva1VGUXJJVHdJWDE5U29ickkyNnBCcjhlbXZDWmU2?=
 =?utf-8?B?TmhTZU5XQ2hhR2V6MTVGblVuUHQ0V3ltTm9xb2o0ZDd6Tng2aHNIQytLcCtE?=
 =?utf-8?B?dlNpSHl4d3VsVXptYmFWdk9jemVNaXBTMDhuNG1vMkZHNHZTUE5Wc2wyMGox?=
 =?utf-8?B?QklrSUhHUnAyZ0RyUldDZVUyUTZXdVhBMmgxdWhvbFdOOXRMQXNVaEtUR2du?=
 =?utf-8?B?ZUZ4TDQrNHl1S0lQdUkzSGwrbG1rTnkyMG1zNzBQU09abEppTmlMSHZEUTFm?=
 =?utf-8?B?Y2VFRHkxVEZKMjc0SmlSNmRGQmdET0ZuOUx0QVNBSlVzcVI1MElSZG1NTC93?=
 =?utf-8?B?bFlVaUFwMkYrV2liZDdjb3p6dEVCRmFJRWsrL3ZadzZGYTRVZklBNWh2bGxW?=
 =?utf-8?B?aXVYNXQvNmtNZVlYeFhLMlc0d2Y5Zy9pdVo3Z1BWeHZvUlRQUUVOMER1VnpV?=
 =?utf-8?B?NFNpTlR0WUF2UllJMUNpYUQrMTlkTTJrNGZLQnRXbTdsTFgxTkVxbmo0cFlU?=
 =?utf-8?B?bWQxVDdvQzJpK0lDelo0U2V4bFpDeVM3TlFrazFFYmpnQ0NEd2k1WFhxV3g5?=
 =?utf-8?B?V0ZzY2NQM1hsbE5PRmw5L2g1ajYxK28xc21zYTJDOGg2OVRGTkt5T2ZKUGl2?=
 =?utf-8?B?ZEw5d0o5LzZsRFBQYWtsckJCMWFtYlJVZzNLZE43dXpLU2RvcTIzemY2VXM5?=
 =?utf-8?B?c3N1Skkxem5JVkRGOWZWMWRVQUVkQnBVcEE5bmc3MGFwK0NNTVdrVlBBb2Fo?=
 =?utf-8?B?NTBFKy9KRUJUMU1qNFd5VTFzaGo1VzZ4SkRXY0R5ODlKYTloOXVnY0JKNXZo?=
 =?utf-8?B?VUJZTmlzZ1FQaGN0Wi9jbTZ4bFZwRERNQmkxaXNGUFpLTlZtTjdpVHNUWE43?=
 =?utf-8?B?M1lFWTBLay9HRFdCTWRSbkw4ckpqa1pjS3VkbEQ0SmRldEN3YWY4aytnd3FY?=
 =?utf-8?B?b3FpdnVFaCtMY1ZkZkU4SzZwTVdDR1VpV2N2Smx0enRIZVl2RDZldkdPRGtG?=
 =?utf-8?B?SjdlV2xaeWZOQWwwRWxaQlllN0lQVEFYZmlNL3QxU0dFNlloTTZlRWdTTHJt?=
 =?utf-8?B?aldEVkMzNzN6SnZGOWh6bDc5Y040SXkvYjRod1UwK0ZDQjB5RE83V1NNcHlJ?=
 =?utf-8?B?MEhZU2pzMVdCZmlmaHIxQ2xwZnhEVkszN2pCdjR5TDk4Um1qWkEyNEJyWkZm?=
 =?utf-8?B?TUV5MWZSNXR2aDA3dUw4MDNXV0xONWFYTmZjd0I1SmdnQnFrbCtieElKRnBT?=
 =?utf-8?B?QVFHS29GMkdQNitTM0l5cWRHT05EQVhDYVh2d3ZwVVpmRDRvTmxNdWdOUG1x?=
 =?utf-8?B?ZHA0RHhIc2ticGQ4bXJxSGIwbDNmOVRHT053VWUyYXNvczIrbW5SNm10VzJj?=
 =?utf-8?B?R3hQcnkwb2Z1MWxjMGhIYXRJWUd4cEx5bVcxM3l4WVozZEZpQVQ3UFE4WUVI?=
 =?utf-8?B?N1ZpODZQa2ZCMXNZSVcrbGN2djdGNlRvTGtnRWgwTGJIUXRKVTYxbmhueTNt?=
 =?utf-8?B?ZHBXcFdpZW91RHpIaXNSY2lTV3FUQTdZY25hK2c2WVorTzRDK1N0QXgwbWM4?=
 =?utf-8?B?V3FaYlVhcVgwbVQxeVlobVc0NTZaRER3eVJjTE5FTjhJS1QrbHF0bDAyaG04?=
 =?utf-8?B?dXF2T0Z0TU9XbkQxRnR0Zk5qNW5Qc1hReThFalFGdVVRYmRHMUZNVU9OdFc2?=
 =?utf-8?Q?3L/gIm1pk8weouGKUGzhCohwcSnXiYXJ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUJxTDhBNlFzUnpnNGJQSGcwTGRlMU9QUnUxbHJXUzlqVGJUWi82VUc5M3ph?=
 =?utf-8?B?elh5S0NkRUhMcjBtVkpLdUtHNHRod2ZENVc1dUF3ZFVNT0xCYUZ4ekwwQXRY?=
 =?utf-8?B?T2UvUjh6SzZhY2p1OGVNTmxvWERyaytyeGdvSWhKRDA5UTk4cllTSkpOMTlu?=
 =?utf-8?B?d2cyY0lNRHJLMTJlUnJYSnJDWklrc1d0MCs1TGhZWUJxaTVZczVLY3hFdVo3?=
 =?utf-8?B?OC9FSGxhbHlOR2hiN21OTitxV0I3Z0tYdjV6N1FJWXE4Y0RSTWFmOFlhaGs0?=
 =?utf-8?B?RTJhOXN3RjRRRFpMU1NVQkRIdlBrYmR4ejJxTDZhOXpsOWdSa0FldXh4NDlR?=
 =?utf-8?B?UEZEZDY0RUJUYzYzc0F6bzRRR0ovSmNISHpNUXZpMHNGL3ZIWjlvajl6aWJC?=
 =?utf-8?B?SHJUZVNsV0Urb2d0cmExNWhHZCtXRDVxaGRmakNlTTQyU0dtMTZyQzVoOFJY?=
 =?utf-8?B?LzJKRjJtTFZaTzVFWDdUSEpreTgvWDF5cmx6dzg2eWRGVjVxUURkM3pJRzVs?=
 =?utf-8?B?b1ZMUDRTM01qaGJMbEZRTXJsM1MxNUlOSStCOVZuWWc4SmFDaUxlSjBuclhE?=
 =?utf-8?B?NGdmUk9wcjJsNVBzSFptLzFwaEd6N3B0Uk9VMnRDNm9reHJHaTB1V09ZbEo1?=
 =?utf-8?B?RXpHcDhyR1FuSUhLbVI1UW8xRUpyM0Zjd2ptcHp5VThqRi94UEUzTVczSkJt?=
 =?utf-8?B?eW0vdzNLbXBFVENGL0hIMzBuWGlLNnBnUUo0bG0zejBTdjd6V0RlUWNvK05S?=
 =?utf-8?B?Tm03R3BMYTBPNDVRQTZib1Q1NjQzOUNxK0FHUzFyaHk4VGVPL1RTUWRzR1N0?=
 =?utf-8?B?ZnIrZTlqTFVUS1lyRGlzdU5wT2ZaU1F2ZFVCdVQyZXN6RXhZTlphemx5WUJN?=
 =?utf-8?B?TmtrdHJCa1J2S01lV3JKK2V1OGJ5cWFpUWVMdzMyS0lqRFZQT1lsdmFSbjc3?=
 =?utf-8?B?ckVpQzB5d3NsU3JrZUtoRWFzVlBwRWRudTBHN29ENjY2Y2lGbUxWNUVDRGZl?=
 =?utf-8?B?UGFsbHNZTjFFMHpLcVRWMEV1RTRCNU9XY2ROelJQNGdESzhGdGRsVG0vRkNv?=
 =?utf-8?B?NkF2VXltMUFXcm9JTldZRnJzbEMvdzVXTzdaOWROZnFZcUh0L3MrcWhXR0RB?=
 =?utf-8?B?TFh6enZ5TXZFZXZ6a0RObUFiSlBxZWJGWCtZbHBCbnRFSDlFTnNxZlJmOFpk?=
 =?utf-8?B?TjZLZlVwL2h5QWtCOUhTbmxuRHgvcmVackh5MmlaSHAwazVtRXhjZlZnRDhY?=
 =?utf-8?B?WTlEbDRkNVZKVk8zaU1adW8rYmo3L0tISmwzKzMxMkE0TXZTS0FmT2o3Rnpy?=
 =?utf-8?B?cUc3NWg1aUZKdG14Sm1Fb1ZVaGMrMnFDR25taEhhKzAvcXUyd1IvMzBzUElR?=
 =?utf-8?B?WDg5ZGJDd0NreGM5NndDbDVLS3ZDdU9scU1YYm84aVJKZWQ2RDBtdHBDVWdm?=
 =?utf-8?B?Wlk3S29VSi9WTWVCeHg5cFVadjQ0Rk5DOHViOGd6d0JPTGZyY282TVBMMlVz?=
 =?utf-8?B?TVorQmxnK0FMb1dRZmVIbDVQSjlWZ2ZxVHYzYUt2SDRFQmlBaTlhQk1NaW9D?=
 =?utf-8?B?YmFOZFhjdkgrcnpmcWJYWllUSUl4NE11dFZqSlBvQzBkVndnKzlXVHNoS082?=
 =?utf-8?B?a0swaDJPb2xzZGNnQjM5REFRZ3BUdTcxT0dTK3p3TENHZ0RKN1RaaEI4bWh2?=
 =?utf-8?B?NU9hMDdQYjFYWlorblB3WldITmdOWEtMWEdLU0hvR3p5WnlWNW53akVzcGVQ?=
 =?utf-8?Q?7EsXdTIb53Avg7QPHA7UHs31otFFzg+qczI8v9R?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04663d29-02ff-4217-cc0d-08dd75b2bffa
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 09:01:16.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0584


On 2025/4/7 11:21, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
>
> cocci warnings:
>      drivers/clk/sophgo/clk-sg2042-pll.c:217:1-7: WARNING:
>      do_div() does a 64-by-32 division, please consider using div64_ul
>      instead.
>
>      drivers/clk/sophgo/clk-sg2042-pll.c:160:1-7: WARNING:
>      do_div() does a 64-by-32 division, please consider using div64_u64
>      instead.
>
> replace do_div() with div64_*() which doesn't implicitly cast the divisor.

hi Pei，I'm not sure if you discovered this issue via the test robot, see 
this: https://lore.kernel.org/lkml/202504051456.niworhgJ-lkp@intel.com/. 
If so, please add its Reported-by signature in the commit as required. 
Otherwise please ignore my input.

As per this patch itself, LGTM.

Reviewed-by: Chen Wang <wangchen20@iscas.ac.cn>


>
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>   drivers/clk/sophgo/clk-sg2042-pll.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
> index 1537f4f05860..e5fb0bb7ac4f 100644
> --- a/drivers/clk/sophgo/clk-sg2042-pll.c
> +++ b/drivers/clk/sophgo/clk-sg2042-pll.c
> @@ -155,7 +155,7 @@ static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
>   
>   	numerator = (u64)parent_rate * ctrl_table.fbdiv;
>   	denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
> -	do_div(numerator, denominator);
> +	numerator =  div64_u64(numerator, denominator);
>   	return numerator;
>   }
>   
> @@ -212,7 +212,7 @@ static int sg2042_pll_get_postdiv_1_2(unsigned long rate,
>   	tmp0 *= fbdiv;
>   
>   	/* ((prate/REFDIV) x FBDIV)/rate and result save to tmp0 */
> -	do_div(tmp0, rate);
> +	tmp0 = div64_ul(tmp0, rate);
>   
>   	/* tmp0 is POSTDIV1*POSTDIV2, now we calculate div1 and div2 value */
>   	if (tmp0 <= 7) {
