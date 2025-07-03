Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF38729CB2D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529282; cv=none; b=d4OJFWI84u0YGNp0d7PGeielI/cJHw5RHJm4C/bGZER8iy0aG0HTXKR+buHue/oaVJQhDBnub8fr4IxZYJGb8fBWJ6/s73Zgg4WQOq4MDcuPFbHxMA5ikhA02Q/argWt5PG/9xe5/H7DojZsTCJVwIBQZDKltSVBh6OmyPlZS4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529282; c=relaxed/simple;
	bh=i/Tr33oBqASNVFfe599S1XtuxJI3ywlv04QSEz3vJH0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ePFhxxXF49vE8gd1ykQQ8ybgT3yjBldf1fSeePDDThsyFP2TaFmqgz99zUbuoE+PS9tWJv8nRDW7yO9tx8WVwDsMWDdIMDunscGjjjVy/xTejEIxHC93omWtxG/iFQ2UEU+xkmkfxR11TBX1T6LOvuSgUnIsCyhwWAEoudEbafg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1k9TzqiL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1k9TzqiL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453643020bdso66792185e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 00:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751529276; x=1752134076; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ+a7e2XqmrAj6StBU7aKHlBb7NWBzERXFCwgZtjl3s=;
        b=1k9TzqiLci/lxZyu3xb3v/VnbC7KhG6SZCOwdjzk1wSUN8BgDj1UmTtvtWv4P0QIDo
         lgPfIq/U30pEjzR0CCeWVpKL+PiJMxGAkF8OZeKzwjIX6OBTHTHGjsg8/bmFS3bXVlJt
         Ky3aINQb1j6OQtHZRs6RWIMJ9ohB1dV15dvoG1Hw3M4jdks4GrXGNer/V3LmOrvtTD1q
         joPHjxGctVPGx6tnOHtkCFYdy0m3HsJo8mWo/mI6hHXEa/Xi7i2OrGEhrn1jIj2koeN+
         uq+h4U/W/d2oQiS1LS0v6i+BpRhQlydeAeXKgYlCXubj+JQvtSTSvnCZD2PHQ3C8qTCS
         Fs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751529276; x=1752134076;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQ+a7e2XqmrAj6StBU7aKHlBb7NWBzERXFCwgZtjl3s=;
        b=SO63EeZwvtJO+hfhjSUy4P6oZdVoCKPihVDa6Xm94qpeilOnxyZiPHaP1hPsygRMTf
         xb6lWRytbedbJ31kYUdcV950aHeNN9v8hIeeYYyZgLvaowdAoEDrqWHgQA6qIIRHJHBI
         vN4O/2dR1oDCJkg4ENdFCszTAmg1Bc1F5KNoSEOsdeWPa5vzQ9RXkBI983q2/NzSTvEm
         1szOQ4lNgQAa/yP4xH5WgYKWjrHeJFIEQNSpjd+Cv4NbD7SuoZEb+TU6eZTdrhHdNDlD
         wPGtqiGFXg0v6aB9VrxfN4BmNOpCREDLpnb5uyMvOKSYENkj78GZADtP6tlN0g3ENE3N
         7EiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1oSn0pmdaj2EH3F336i22VI+l4Cn563WDf5HamZ7Yo1Rq3qxfpDH4ReXl6WCcbwzfABAN55TQd5l24rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YweriNhlaGB+tvd5rEjBHcw5ImSOH7RKIxNNqFymfevB59By7cr
	H6Vfd1q2UNlPSETP9Lcn3mZ2mH5z3tjrfwmfrgxLdfQDtXcuZ2dmjBotnr+cmeTx2yI=
X-Gm-Gg: ASbGnctNLoL77N8v/h+dsnsq5vyNXzsz1kFJf+6YgVdY+WeUUfb3cVuaK3y+xZfXWUS
	CvlmSHg6bov0DewoqzZ7nXljAQh8ThbvtUTr3nncxZc6zSkbBtsVl/ZMERebq1MiMETUPOTZGbd
	DEQg+9K9iDaT3RqvCki8hta09kYfFPb0R9fK4Fp94rDKSepBqbM/6MFEp2W+ni699w+hxY9UQdi
	T9TIK7LW4TlA0IgoNjYqBtjZ72eBZzpXlEdDKfbJ2PWs1HSc+LvhMGejpGkC7IpW6EKyT7dAf8G
	XX0AKuSwGGVKQyP5ZfoLDDFwiYK98o6npafiDe3r3l66JDQz6dLEpVcd+zQZOQ==
X-Google-Smtp-Source: AGHT+IHxPOgGMF4E/igQ+9zuKWpkgI9g01pOMTJQFOuCNZV4sYhenQsuo3Rce+I6dtWKJJvUGA2Kwg==
X-Received: by 2002:a05:600c:3b8a:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-454a5629244mr48611805e9.6.1751529275924;
        Thu, 03 Jul 2025 00:54:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9989fcesm18837365e9.16.2025.07.03.00.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 00:54:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/26] clk: amlogic: s4-peripherals: naming consistency
 alignment
In-Reply-To: <a7738c67-25fc-4919-bee8-69a72abb4871@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 11:18:04 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-12-e163c9a1fc21@baylibre.com>
	<a7738c67-25fc-4919-bee8-69a72abb4871@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 09:54:34 +0200
Message-ID: <1jsejdd805.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 03 Jul 2025 at 11:18, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome:
>
>
> On 7/2/2025 11:26 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Amlogic clock controller drivers are all doing the same thing, more or
>> less. Yet, over the years, tiny (and often pointless) differences have
>> emerged.
>>
>> This makes reviews more difficult, allows some errors to slip through and
>> make it more difficult to exploit SoC commonalities, leading to code
>> duplication.
>>
>> This change enforce, wherever possible, a consistent and predictable scheme
>> when it comes to code organisation and naming, The scheme chosen is what
>> was used the most already, to try and minimise the size of the ugly
>> resulting diff. Here are some of the rules applied:
>> - Aligning clock names, variable names and IDs.
>>    - ID cannot change (used in DT)
>>    - Variable names w/ SoC name prefixes
>>    - Clock names w/o SoC name prefixes, except pclks for historic reasons
>> - Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
>> - Parent table systematically named with the same name as the clock and
>>    a '_parents' suffix
>> - Group various tables next to the related clock
>> - etc ...
>>
>> Doing so removes what would otherwise show up as unrelated diff in
>> following changes. It will allow to introduce common definitions for
>> peripheral clocks, probe helpers, composite clocks, etc ... making further
>> review and maintenance easier.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/clk/meson/s4-peripherals.c | 746 ++++++++++++++++++-------------------
>>   1 file changed, 370 insertions(+), 376 deletions(-)
>>
>> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
>> index c9400cf54c84c3dc7c63d0636933951b0cac230c..9bcd35f12836de5e318fd1ad9c9ae15a2bfc3dd7 100644
>> --- a/drivers/clk/meson/s4-peripherals.c
>> +++ b/drivers/clk/meson/s4-peripherals.c
>
>
> [...]
>
>
>> @@ -1320,7 +1320,7 @@ static struct clk_regmap s4_ts_clk_gate = {
>>    * mux because it does top-to-bottom updates the each clock tree and
>>    * switches to the "inactive" one when CLK_SET_RATE_GATE is set.
>>    */
>> -static const struct clk_parent_data s4_mali_0_1_parent_data[] = {
>> +static const struct clk_parent_data s4_mali_parents[] = {
>>          { .fw_name = "xtal", },
>>          { .fw_name = "gp0_pll", },
>>          { .fw_name = "hifi_pll", },
>> @@ -1340,8 +1340,8 @@ static struct clk_regmap s4_mali_0_sel = {
>>          .hw.init = &(struct clk_init_data){
>>                  .name = "mali_0_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_mali_0_1_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_mali_0_1_parent_data),
>> +               .parent_data = s4_mali_parents,
>> +               .num_parents = ARRAY_SIZE(s4_mali_parents),
>>                  /*
>>                   * Don't request the parent to change the rate because
>>                   * all GPU frequencies can be derived from the fclk_*
>> @@ -1394,8 +1394,8 @@ static struct clk_regmap s4_mali_1_sel = {
>>          .hw.init = &(struct clk_init_data){
>>                  .name = "mali_1_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_mali_0_1_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_mali_0_1_parent_data),
>> +               .parent_data = s4_mali_parents,
>> +               .num_parents = ARRAY_SIZE(s4_mali_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1433,28 +1433,26 @@ static struct clk_regmap s4_mali_1 = {
>>          },
>>   };
>>
>> -static const struct clk_hw *s4_mali_parent_hws[] = {
>> -       &s4_mali_0.hw,
>> -       &s4_mali_1.hw
>> -};
>> -
>> -static struct clk_regmap s4_mali_mux = {
>> +static struct clk_regmap s4_mali_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_MALI_CLK_CTRL,
>>                  .mask = 1,
>>                  .shift = 31,
>>          },
>>          .hw.init = &(struct clk_init_data){
>> -               .name = "mali",
>> +               .name = "mali_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_hws = s4_mali_parent_hws,
>> +               .parent_hws = (const struct clk_hw *[]) {
>> +                       &s4_mali_0.hw,
>> +                       &s4_mali_1.hw,
>> +               },
>>                  .num_parents = 2,
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>>   /* VDEC clocks */
>> -static const struct clk_parent_data s4_dec_parent_data[] = {
>> +static const struct clk_parent_data s4_dec_parents[] = {
>>          { .fw_name = "fclk_div2p5", },
>>          { .fw_name = "fclk_div3", },
>>          { .fw_name = "fclk_div4", },
>> @@ -1465,7 +1463,7 @@ static const struct clk_parent_data s4_dec_parent_data[] = {
>>          { .fw_name = "xtal", }
>>   };
>>
>> -static struct clk_regmap s4_vdec_p0_mux = {
>> +static struct clk_regmap s4_vdec_p0_sel = {
>
>
> Since both vdec_clk and mali_clk are 'no glitch clock', should we also unify
> the naming from 's4_vdec_p0'/'s4_vdec_p1' to 's4_vdec_0'/'s4_vdec_1'?

Please have another look at the description.

As much as possible, I want the ID, clock name, and variable names
aligned. ID do not change and has that 'p' ... so no, the 'p' stays.

>
>
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC_CLK_CTRL,
>>                  .mask = 0x7,
>> @@ -1473,10 +1471,10 @@ static struct clk_regmap s4_vdec_p0_mux = {
>>                  .flags = CLK_MUX_ROUND_CLOSEST,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vdec_p0_mux",
>> +               .name = "vdec_p0_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_dec_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>> +               .parent_data = s4_dec_parents,
>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1492,7 +1490,7 @@ static struct clk_regmap s4_vdec_p0_div = {
>>                  .name = "vdec_p0_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_vdec_p0_mux.hw
>> +                       &s4_vdec_p0_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1515,7 +1513,7 @@ static struct clk_regmap s4_vdec_p0 = {
>>          },
>>   };
>>
>> -static struct clk_regmap s4_vdec_p1_mux = {
>> +static struct clk_regmap s4_vdec_p1_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC3_CLK_CTRL,
>>                  .mask = 0x7,
>> @@ -1523,10 +1521,10 @@ static struct clk_regmap s4_vdec_p1_mux = {
>>                  .flags = CLK_MUX_ROUND_CLOSEST,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vdec_p1_mux",
>> +               .name = "vdec_p1_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_dec_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>> +               .parent_data = s4_dec_parents,
>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1542,7 +1540,7 @@ static struct clk_regmap s4_vdec_p1_div = {
>>                  .name = "vdec_p1_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_vdec_p1_mux.hw
>> +                       &s4_vdec_p1_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1565,27 +1563,25 @@ static struct clk_regmap s4_vdec_p1 = {
>>          },
>>   };
>>
>> -static const struct clk_hw *s4_vdec_mux_parent_hws[] = {
>> -       &s4_vdec_p0.hw,
>> -       &s4_vdec_p1.hw
>> -};
>> -
>> -static struct clk_regmap s4_vdec_mux = {
>> +static struct clk_regmap s4_vdec_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC3_CLK_CTRL,
>>                  .mask = 0x1,
>>                  .shift = 15,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vdec_mux",
>> +               .name = "vdec_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_hws = s4_vdec_mux_parent_hws,
>> -               .num_parents = ARRAY_SIZE(s4_vdec_mux_parent_hws),
>> +               .parent_hws = (const struct clk_hw *[]) {
>> +                       &s4_vdec_p0.hw,
>> +                       &s4_vdec_p1.hw,
>> +               },
>> +               .num_parents = 2,
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>> -static struct clk_regmap s4_hevcf_p0_mux = {
>> +static struct clk_regmap s4_hevcf_p0_sel = {
>
>
> +static struct clk_regmap s4_hevcf_0_sel
> +static struct clk_regmap s4_hevcf_0_div
> .
> .
> .
>
>
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC2_CLK_CTRL,
>>                  .mask = 0x7,
>> @@ -1593,10 +1589,10 @@ static struct clk_regmap s4_hevcf_p0_mux = {
>>                  .flags = CLK_MUX_ROUND_CLOSEST,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "hevcf_p0_mux",
>> +               .name = "hevcf_p0_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_dec_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>> +               .parent_data = s4_dec_parents,
>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1612,7 +1608,7 @@ static struct clk_regmap s4_hevcf_p0_div = {
>>                  .name = "hevcf_p0_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_hevcf_p0_mux.hw
>> +                       &s4_hevcf_p0_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1625,7 +1621,7 @@ static struct clk_regmap s4_hevcf_p0 = {
>>                  .bit_idx = 8,
>>          },
>>          .hw.init = &(struct clk_init_data){
>> -               .name = "hevcf_p0_gate",
>> +               .name = "hevcf_p0",
>>                  .ops = &clk_regmap_gate_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>>                          &s4_hevcf_p0_div.hw
>> @@ -1635,7 +1631,7 @@ static struct clk_regmap s4_hevcf_p0 = {
>>          },
>>   };
>>
>> -static struct clk_regmap s4_hevcf_p1_mux = {
>> +static struct clk_regmap s4_hevcf_p1_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC4_CLK_CTRL,
>>                  .mask = 0x7,
>> @@ -1643,10 +1639,10 @@ static struct clk_regmap s4_hevcf_p1_mux = {
>>                  .flags = CLK_MUX_ROUND_CLOSEST,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "hevcf_p1_mux",
>> +               .name = "hevcf_p1_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_dec_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>> +               .parent_data = s4_dec_parents,
>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1662,7 +1658,7 @@ static struct clk_regmap s4_hevcf_p1_div = {
>>                  .name = "hevcf_p1_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_hevcf_p1_mux.hw
>> +                       &s4_hevcf_p1_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1685,28 +1681,26 @@ static struct clk_regmap s4_hevcf_p1 = {
>>          },
>>   };
>>
>> -static const struct clk_hw *s4_hevcf_mux_parent_hws[] = {
>> -       &s4_hevcf_p0.hw,
>> -       &s4_hevcf_p1.hw
>> -};
>> -
>> -static struct clk_regmap s4_hevcf_mux = {
>> +static struct clk_regmap s4_hevcf_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC4_CLK_CTRL,
>>                  .mask = 0x1,
>>                  .shift = 15,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "hevcf",
>> +               .name = "hevcf_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_hws = s4_hevcf_mux_parent_hws,
>> -               .num_parents = ARRAY_SIZE(s4_hevcf_mux_parent_hws),
>> +               .parent_hws = (const struct clk_hw *[]) {
>> +                       &s4_hevcf_p0.hw,
>> +                       &s4_hevcf_p1.hw,
>> +               },
>> +               .num_parents = 2,
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>>   /* VPU Clock */
>> -static const struct clk_parent_data s4_vpu_parent_data[] = {
>> +static const struct clk_parent_data s4_vpu_parents[] = {
>>          { .fw_name = "fclk_div3", },
>>          { .fw_name = "fclk_div4", },
>>          { .fw_name = "fclk_div5", },
>> @@ -1726,8 +1720,8 @@ static struct clk_regmap s4_vpu_0_sel = {
>>          .hw.init = &(struct clk_init_data){
>>                  .name = "vpu_0_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_vpu_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_vpu_parent_data),
>> +               .parent_data = s4_vpu_parents,
>> +               .num_parents = ARRAY_SIZE(s4_vpu_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1770,8 +1764,8 @@ static struct clk_regmap s4_vpu_1_sel = {
>>          .hw.init = &(struct clk_init_data){
>>                  .name = "vpu_1_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_vpu_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_vpu_parent_data),
>> +               .parent_data = s4_vpu_parents,
>> +               .num_parents = ARRAY_SIZE(s4_vpu_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1823,24 +1817,24 @@ static struct clk_regmap s4_vpu = {
>>          },
>>   };
>>
>> -static const struct clk_parent_data vpu_clkb_tmp_parent_data[] = {
>> +static const struct clk_parent_data vpu_clkb_tmp_parents[] = {
>>          { .hw = &s4_vpu.hw },
>>          { .fw_name = "fclk_div4", },
>>          { .fw_name = "fclk_div5", },
>>          { .fw_name = "fclk_div7", }
>>   };
>>
>> -static struct clk_regmap s4_vpu_clkb_tmp_mux = {
>> +static struct clk_regmap s4_vpu_clkb_tmp_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VPU_CLKB_CTRL,
>>                  .mask = 0x3,
>>                  .shift = 20,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vpu_clkb_tmp_mux",
>> +               .name = "vpu_clkb_tmp_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = vpu_clkb_tmp_parent_data,
>> -               .num_parents = ARRAY_SIZE(vpu_clkb_tmp_parent_data),
>> +               .parent_data = vpu_clkb_tmp_parents,
>> +               .num_parents = ARRAY_SIZE(vpu_clkb_tmp_parents),
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>> @@ -1855,7 +1849,7 @@ static struct clk_regmap s4_vpu_clkb_tmp_div = {
>>                  .name = "vpu_clkb_tmp_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_vpu_clkb_tmp_mux.hw
>> +                       &s4_vpu_clkb_tmp_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1911,7 +1905,7 @@ static struct clk_regmap s4_vpu_clkb = {
>>          },
>>   };
>>
>> -static const struct clk_parent_data s4_vpu_clkc_parent_data[] = {
>> +static const struct clk_parent_data s4_vpu_clkc_parents[] = {
>>          { .fw_name = "fclk_div4", },
>>          { .fw_name = "fclk_div3", },
>>          { .fw_name = "fclk_div5", },
>> @@ -1922,17 +1916,17 @@ static const struct clk_parent_data s4_vpu_clkc_parent_data[] = {
>>          { .fw_name = "gp0_pll", },
>>   };
>>
>> -static struct clk_regmap s4_vpu_clkc_p0_mux  = {
>> +static struct clk_regmap s4_vpu_clkc_p0_sel  = {
>
>
> +static struct clk_regmap s4_vpu_clkc_0_sel
> +static struct clk_regmap s4_vpu_clkc_0_div
> .
> .
> .
>
>
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VPU_CLKC_CTRL,
>>                  .mask = 0x7,
>>                  .shift = 9,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vpu_clkc_p0_mux",
>> +               .name = "vpu_clkc_p0_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_vpu_clkc_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parent_data),
>> +               .parent_data = s4_vpu_clkc_parents,
>> +               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1947,7 +1941,7 @@ static struct clk_regmap s4_vpu_clkc_p0_div = {
>>                  .name = "vpu_clkc_p0_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_vpu_clkc_p0_mux.hw
>> +                       &s4_vpu_clkc_p0_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1970,17 +1964,17 @@ static struct clk_regmap s4_vpu_clkc_p0 = {
>>          },
>>   };
>>
>> -static struct clk_regmap s4_vpu_clkc_p1_mux = {
>> +static struct clk_regmap s4_vpu_clkc_p1_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VPU_CLKC_CTRL,
>>                  .mask = 0x7,
>>                  .shift = 25,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vpu_clkc_p1_mux",
>> +               .name = "vpu_clkc_p1_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_vpu_clkc_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parent_data),
>> +               .parent_data = s4_vpu_clkc_parents,
>> +               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1995,7 +1989,7 @@ static struct clk_regmap s4_vpu_clkc_p1_div = {
>>                  .name = "vpu_clkc_p1_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_vpu_clkc_p1_mux.hw
>> +                       &s4_vpu_clkc_p1_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -2018,28 +2012,26 @@ static struct clk_regmap s4_vpu_clkc_p1 = {
>>          },
>>   };
>>
>> -static const struct clk_hw *s4_vpu_mux_parent_hws[] = {
>> -       &s4_vpu_clkc_p0.hw,
>> -       &s4_vpu_clkc_p1.hw
>> -};
>> -
>> -static struct clk_regmap s4_vpu_clkc_mux = {
>> +static struct clk_regmap s4_vpu_clkc_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VPU_CLKC_CTRL,
>>                  .mask = 0x1,
>>                  .shift = 31,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vpu_clkc_mux",
>> +               .name = "vpu_clkc_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_hws = s4_vpu_mux_parent_hws,
>> -               .num_parents = ARRAY_SIZE(s4_vpu_mux_parent_hws),
>> +               .parent_hws = (const struct clk_hw *[]) {
>> +                       &s4_vpu_clkc_p0.hw,
>> +                       &s4_vpu_clkc_p1.hw,
>> +               },
>> +               .num_parents = 2,
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>
>
> [...]
>
>
>>   MODULE_DESCRIPTION("Amlogic S4 Peripherals Clock Controller driver");
>>   MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
>>
>> --
>> 2.47.2
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome
