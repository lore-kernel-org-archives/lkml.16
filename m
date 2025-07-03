Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD6F1C07F6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528923; cv=none; b=AhKz/S870mjy7aYJtEMAepq72u9HWW6ets/YnYUcly0pOd5UQCOXXHPEJGMPuM9MHRNqNbG8OU6cND6zdH7cnzEGmw2B8dk2j4OOfc8IB79j5rraZCICgu7TEqsRStDiu0mobMADyElqv0QIBi5RqN36EyTJYAWstoqav4Kc+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528923; c=relaxed/simple;
	bh=j1R2tzNnpcdMXSp73I/ESna8RxsEJoNEvqBwW8U2zWg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sBV0vZv2J3kIRFw9RP5/SU3ZhaDp3ogABYtO1MHf6dCGFO4zuf0DLbk4Fmv3hpS/48JC3GlvgpoMVqEEk4tN3jkrvVBCJq/CrqFamad5lPbqUu/qOAbKIMQbewt22qCbY5wTfZE5CC6aeFrPGj+CF/fRaAGyeN/atAqCqfGuaVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TJY1hLLG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TJY1hLLG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453634d8609so54797905e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751528919; x=1752133719; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8j/0HFcGq80O81mlMY+WzGVR3ktjzb/D67nQLfvYiE=;
        b=TJY1hLLGOuCZ0wd8HeLAAWS374w3K0XA69l6QQTYCHOyCGbC/oZ8sO1/o8Mp+im1vO
         GLCyoYj14tn1Ux6PMcnuDcOfq3fbHas/OK9W/UTvinYMZZymxR/7EMjgDmcFOLK52+JZ
         Ybf/C/W7fkiTjpLYwCBud5+199nm4mqV7ee/BCqXy7q9g52+mK8Oi/uZg4cWHAI+hOnn
         EBqEVvN4GIUMqqJzA+Pu6mYe2rngKq/e6dUwWBwioIMDPUD3hGExhxQ3hQX2y2BzyRiA
         G4Bdz++E06g3YbgKNRP9mBoc1RkHlqnDNeOCzFzai5SAzD6J54rS+/rOlpJhwHF0wcfx
         JRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751528919; x=1752133719;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8j/0HFcGq80O81mlMY+WzGVR3ktjzb/D67nQLfvYiE=;
        b=rjLQAL0ymi94/J7MlR7JxS+5rgNbWGwa7HfUsFGB0lHSQr0AShTKokVdGrkh3RR7oM
         pEKI9I0y7LNEVRjgrzqYX0DhlL8cGkwzIS3WvyTVUMOJhKo2CxvZnnnXVpa3tHcmmCqy
         EQ54mp6/z0yTZ/EAHWAIDx1DFV20xp2MgrjnL6bijY36/xHO3WiaqyS+69l6ve10c114
         1mTuQNmCIj2G6tDD+d8XlpIMJqr16OQvZG8GtQ3pmgyuq8fKHSdnkZG+WyKlpBWa6XIb
         b/1izED+aqhzSTDEFP1IpX0OpF8+bbYiyYdBU6J7SG4t0cEeUo3tHOBd2aEdhZZsU3Qk
         w21Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3HBHqCBQkyPxSXxKe6OU2cTFrhP0AbC9yDRvJtfvbGhXrMcJZIkvg9JZFDZjfwwfTZZVVtB13R4dyOIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkF6aRoMgj8docAZe5lDByADCZJBRi5Mk4afFTHgRnONG5DiJx
	0tFS+M8Uc8QCDkOQrnZ7P1rug4Mfilfj+cOJ/supsWLUxI327aVyhxv+p908i7C/dc4=
X-Gm-Gg: ASbGncu24y8XJEmpCmH+WGbtyZ9n/rzETpb4nQ/4+bT5eJV+tUAf9a6x77smd14Shqv
	zVadFJ+iYRdBvPFxnrUAwhD75/MEUDtLfMhkR3thEjAbtaokoUH+lmvEpHeDSkD8m/fEsHRRwpF
	evUFKMKZ6Ov6N4BaREq0VFpqRbQNa01SMVf6LLYs64bSNR9hdhegy4CtoFZZ3p0R882QWFgCqJX
	zMgcU2zTDTVUG8X+btjQmXqPCdVt1bfnhLuW+HN3mD9ohhuG2rTO6C2X2BAj3evrF69KaFl+PhN
	cRrYM/7BRQwh1B2f/jkA+KkHtfAEO5w4wm5+DUzIY/Xw9J169jbuqM9mcZzKuA==
X-Google-Smtp-Source: AGHT+IFJpSqy935AeSkMTPdOYET1P8hC02KkMBO+l6v23mFxwRQ4BlWOp1U7Ls20FOnt3iQ5UlOJAQ==
X-Received: by 2002:a05:600c:608c:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-454ab3a9274mr19797505e9.17.1751528919290;
        Thu, 03 Jul 2025 00:48:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a997ae2esm18696005e9.9.2025.07.03.00.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 00:48:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/26] clk: amlogic: c3-peripherals: naming consistency
 alignment
In-Reply-To: <eb233f20-1927-4944-9b57-f90c998db19a@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 10:51:07 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-5-e163c9a1fc21@baylibre.com>
	<eb233f20-1927-4944-9b57-f90c998db19a@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 09:48:37 +0200
Message-ID: <1jy0t5d8a2.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 03 Jul 2025 at 10:51, Chuan Liu <chuan.liu@amlogic.com> wrote:

> hi Jerome:
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
>>   drivers/clk/meson/c3-peripherals.c | 1261 ++++++++++++++++++------------------
>>   1 file changed, 630 insertions(+), 631 deletions(-)
>>
>> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
>> index a25e7d5dc6691d2d4a852e3d3da2b36f251cc141..a09cb1435ab108b2dcc209c6557bcd1988c4ba1a 100644
>> --- a/drivers/clk/meson/c3-peripherals.c
>> +++ b/drivers/clk/meson/c3-peripherals.c
>> @@ -48,7 +48,7 @@
>>   #define SPIFC_CLK_CTRL                         0x1a0
>>   #define NNA_CLK_CTRL                           0x220
>>
>> -static struct clk_regmap rtc_xtal_clkin = {
>> +static struct clk_regmap c3_rtc_xtal_clkin = {
>>          .data = &(struct clk_regmap_gate_data) {
>>                  .offset = RTC_BY_OSCIN_CTRL0,
>>                  .bit_idx = 31,
>> @@ -63,12 +63,12 @@ static struct clk_regmap rtc_xtal_clkin = {
>>          },
>>   };
>>
>> -static const struct meson_clk_dualdiv_param rtc_32k_div_table[] = {
>> +static const struct meson_clk_dualdiv_param c3_rtc_32k_div_table[] = {
>>          { 733, 732, 8, 11, 1 },
>>          { /* sentinel */ }
>>   };
>>
>> -static struct clk_regmap rtc_32k_div = {
>> +static struct clk_regmap c3_rtc_32k_div = {
>>          .data = &(struct meson_clk_dualdiv_data) {
>>                  .n1 = {
>>                          .reg_off = RTC_BY_OSCIN_CTRL0,
>> @@ -95,39 +95,39 @@ static struct clk_regmap rtc_32k_div = {
>>                          .shift   = 28,
>>                          .width   = 1,
>>                  },
>> -               .table = rtc_32k_div_table,
>> +               .table = c3_rtc_32k_div_table,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>>                  .name = "rtc_32k_div",
>>                  .ops = &meson_clk_dualdiv_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &rtc_xtal_clkin.hw
>> +                       &c3_rtc_xtal_clkin.hw
>>                  },
>>                  .num_parents = 1,
>>          },
>>   };
>>
>> -static const struct clk_parent_data rtc_32k_mux_parent_data[] = {
>> -       { .hw = &rtc_32k_div.hw },
>> -       { .hw = &rtc_xtal_clkin.hw }
>> +static const struct clk_parent_data c3_rtc_32k_parents[] = {
>> +       { .hw = &c3_rtc_32k_div.hw },
>> +       { .hw = &c3_rtc_xtal_clkin.hw }
>>   };
>>
>> -static struct clk_regmap rtc_32k_mux = {
>> +static struct clk_regmap c3_rtc_32k_sel = {
>>          .data = &(struct clk_regmap_mux_data) {
>>                  .offset = RTC_BY_OSCIN_CTRL1,
>>                  .mask = 0x1,
>>                  .shift = 24,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "rtc_32k_mux",
>> +               .name = "rtc_32k_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = rtc_32k_mux_parent_data,
>> -               .num_parents = ARRAY_SIZE(rtc_32k_mux_parent_data),
>> +               .parent_data = c3_rtc_32k_parents,
>> +               .num_parents = ARRAY_SIZE(c3_rtc_32k_parents),
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>> -static struct clk_regmap rtc_32k = {
>> +static struct clk_regmap c3_rtc_32k = {
>>          .data = &(struct clk_regmap_gate_data) {
>>                  .offset = RTC_BY_OSCIN_CTRL0,
>>                  .bit_idx = 30,
>> @@ -136,20 +136,20 @@ static struct clk_regmap rtc_32k = {
>>                  .name = "rtc_32k",
>>                  .ops = &clk_regmap_gate_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &rtc_32k_mux.hw
>> +                       &c3_rtc_32k_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>> -static const struct clk_parent_data rtc_clk_mux_parent_data[] = {
>> +static const struct clk_parent_data c3_rtc_clk_parents[] = {
>>          { .fw_name = "oscin" },
>> -       { .hw = &rtc_32k.hw },
>> +       { .hw = &c3_rtc_32k.hw },
>>          { .fw_name = "pad_osc" }
>>   };
>>
>> -static struct clk_regmap rtc_clk = {
>> +static struct clk_regmap c3_rtc_clk = {
>>          .data = &(struct clk_regmap_mux_data) {
>>                  .offset = RTC_CTRL,
>>                  .mask = 0x3,
>> @@ -158,62 +158,62 @@ static struct clk_regmap rtc_clk = {
>>          .hw.init = &(struct clk_init_data) {
>>                  .name = "rtc_clk",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = rtc_clk_mux_parent_data,
>> -               .num_parents = ARRAY_SIZE(rtc_clk_mux_parent_data),
>> +               .parent_data = c3_rtc_clk_parents,
>> +               .num_parents = ARRAY_SIZE(c3_rtc_clk_parents),
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>> -#define C3_CLK_GATE(_name, _reg, _bit, _fw_name, _ops, _flags)         \
>> -struct clk_regmap _name = {                                            \
>> +#define C3_PCLK(_name, _reg, _bit, _fw_name, _ops, _flags)             \
>> +struct clk_regmap c3_##_name = {                                       \
>>          .data = &(struct clk_regmap_gate_data){                         \
>>                  .offset = (_reg),                                       \
>>                  .bit_idx = (_bit),                                      \
>>          },                                                              \
>>          .hw.init = &(struct clk_init_data) {                            \
>> -               .name = #_name,                                         \
>> +               .name = "c3_" #_name,                                   \
>
>
> Prefixing variable names with 'SoC' is understandable (to avoid duplicate
> definitions and facilitate variable searching), but is it necessary to add
> 'SoC' prefixes to clock names?

This is part of the description but I'll ellaborate.

Some controllers do so, some do not. This is a typical pointless
difference that make code sharing difficult and lead to the duplication
I'm addressing now.

Both with and without are fine but picking one a sticking to it helps a
lot. I would have preferred to drop the prefix from the pclk clock
names, same as the other clock, but:
* It would have changed more clock names and I prefer to minimize those
changes
* It would have caused several name clashes with other clocks.

so prefix it is for the peripheral clock.

In the end, what matters is consistency.

>
>
>>                  .ops = _ops,                                            \
>>                  .parent_data = &(const struct clk_parent_data) {        \
>> -                       .fw_name = #_fw_name,                           \
>> +                       .fw_name = (_fw_name),                          \
>>                  },                                                      \
>>                  .num_parents = 1,                                       \
>>                  .flags = (_flags),                                      \
>>          },                                                              \
>>   }
>
>
> [...]

-- 
Jerome
