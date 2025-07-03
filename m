Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C5D2D2381
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531967; cv=none; b=oYPoqZABO6QBBDIF9zXbwf9w1XlAzqv5uPZtJ8iFlWdaMMuOCYcluBGYkIeTGoOV9KEtDFYVYxE8Uqr1XD86A8M5+mLXGNAt+HDHdNO2/WNnCdtK0d9qqB9G4P7/3T6tvF7eGXddG7ba0U1kYwVOV9x1dY9FTw6/bXaAYg12gA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531967; c=relaxed/simple;
	bh=oeEJeRpohsvPzBmZ1Faihcy2y9EpVE2V5TndzPQFvYk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ASozPBvZeLe0wKX9W2HrH5XBrC4AUbX3iMsXlKCmgTwioimVk1sn8pqMRp02SWfyz9gso8ttL8p7era04AYDjUMSEOczgWKXWMqz/l8nOLz3AsKQrcypXDoP3RuGehkoCRSKuombJrDETRU+6eN44otsHUm+hDMYHyhqMacM5rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DljF/uYk; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DljF/uYk"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a51481a598so3032004f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751531963; x=1752136763; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W8bfHzYesKlfwRcWidP0bBqhx3KAGU/Um8O30E5akgo=;
        b=DljF/uYkN3z4fqKwZ4ox45RmfzLIsngcIsmed3NBvsgzQ4mTm0rv+kHyuBhnY7zqto
         7iQ0inFGUw4l7Iu0fne85l4En8jXMs5Z5Nl9+ZogeUVWRf+nn9WAcxOzdOrt9U10Hvq1
         pT34/7Cz4rk/whPymgTVyzjoc/dAz+8q0+ArB9ZgINPMrqd/VufjRpMZdxJR+bTkIC0f
         Km7Va9OMz2ykPjbcJn7qtEy0CyOlCyWKuEu4xAA9EOz1blgf1Mfr3XE7dgYdVjIKiDFV
         Zekla+Fs2oELaP33xWN+CKjI69A55Mo92x3dEDaqlKkDKwGHjh+DNYT6q7Zmlu4vc8Ej
         uJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531963; x=1752136763;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8bfHzYesKlfwRcWidP0bBqhx3KAGU/Um8O30E5akgo=;
        b=hF/wyOk3qxNRGQbqghjeYXpRnxPdRzfWZh7hP0zg7Escg7b50Y3vWxYkpQrjZeVC9t
         kpunnwt1uRuIpU+ptOwhTamGGfye5dDI54oMpsCPBoKGX/4XA4EgNs/e5VikH1Ksbn5O
         dlbTerOkoMjOu8ZbGeSDR41q4fjZsEkJEBp0AxDkRMCBjbBxueh15fE9pM17UR6PR4c1
         TY5lAX1eHcOlmxJ5BBitwlvCUvB4HJqdqMnEbcOzdvcLWdHdfOQ73gxc8pxO7f/YcLZ+
         ZatAT4hOZ5LmMxtNetKLwweDlE9Z876+G2TeT2f2HdQS+672TxUbxJNvhHsWMRyxvVRM
         cxqw==
X-Forwarded-Encrypted: i=1; AJvYcCV/2R0JppwXNgANyMdJcbgz/6IhWGa+9dXacc1gWX2ma9nk4zaNW0ivZP1QpJ/yC+d1rNXBv69l4XcBBks=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOuvHuSs5IVTumcm3q4jY/faCethDhaa9bTBnzt1jSgoPTOHze
	7g+xDkJEoB/TYbvAmuClf9fPdxUe9brlUqwCDmcMeEiwm9OzXEpihcuCtqvG1qHa+2I=
X-Gm-Gg: ASbGnctv2t5Sii7kRlkrbo2tQmKFJ1Og9zH+C/8t6V+lnCLgQjOoRRnMe+KRnzsqc2Y
	CTDAwmmk/NbvqNoep8/w1qqPXwMa0YX8P7VqQft9vgqRzllqAIEK+mUsCGEi/3Pc5APF1L6BSht
	4bNSt/fiWMNTvNIvhkdkD8skLeLGW3ysVUpJZ99hVOu8S0u3XqIQ36pK+3WdVgxFvQKdMGff2Mf
	fe1k7DTxpgOPP7TS2MXcMCDzHL4/7/QekjpqDXPJbhBPP09AKg3goRAvC+EoMbyWM0r0iFZUuXy
	b3kwHcp9xPeR1gEmRhZt67H/PnAJ2Snuji5Ug5DYRQ10+SOj9lzcYFaHBpyQvg==
X-Google-Smtp-Source: AGHT+IFk0GiSnUT1zfe9NSXWr0EcN2n9FCxVOudGKE8dPnwlMzp1PFM9M1gfeXEtcpX/kdpzNxhwhg==
X-Received: by 2002:a05:6000:4205:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3b1fe5bf32fmr5156869f8f.3.1751531963412;
        Thu, 03 Jul 2025 01:39:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52ebcsm17684011f8f.46.2025.07.03.01.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:39:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 23/26] clk: amlogic: use the common pclk definition
In-Reply-To: <1fcf7e52-b265-4341-a360-93aaf293f131@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 15:16:36 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-23-e163c9a1fc21@baylibre.com>
	<1fcf7e52-b265-4341-a360-93aaf293f131@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 10:39:22 +0200
Message-ID: <1jbjq1d5xh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 03 Jul 2025 at 15:16, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome:
>
>
> On 7/2/2025 11:26 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Replace marcros defining pclks with the common one, reducing code
>> duplication.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/clk/meson/axg-aoclk.c      | 35 +++++++++-----------------
>>   drivers/clk/meson/c3-peripherals.c | 34 +++++++-------------------
>>   drivers/clk/meson/g12a-aoclk.c     | 50 +++++++++++++++-----------------------
>>   drivers/clk/meson/gxbb-aoclk.c     | 33 +++++++++----------------
>>   4 files changed, 51 insertions(+), 101 deletions(-)
>>
>> diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
>> index 74c2f51424f11cc04a80a3a4918e4de0a5d11d08..902fbd34039cc06d512f1237a1e5d9050fd00b4b 100644
>> --- a/drivers/clk/meson/axg-aoclk.c
>> +++ b/drivers/clk/meson/axg-aoclk.c
>> @@ -34,30 +34,19 @@
>>   #define AO_RTC_ALT_CLK_CNTL0   0x94
>>   #define AO_RTC_ALT_CLK_CNTL1   0x98
>>
>> -#define AXG_AO_GATE(_name, _bit, _flags)                               \
>> -static struct clk_regmap axg_ao_##_name = {                            \
>> -       .data = &(struct clk_regmap_gate_data) {                        \
>> -               .offset = (AO_RTI_GEN_CNTL_REG0),                       \
>> -               .bit_idx = (_bit),                                      \
>> -       },                                                              \
>> -       .hw.init = &(struct clk_init_data) {                            \
>> -               .name =  "axg_ao_" #_name,                              \
>> -               .ops = &clk_regmap_gate_ops,                            \
>> -               .parent_data = &(const struct clk_parent_data) {        \
>> -                       .fw_name = "mpeg-clk",                          \
>> -               },                                                      \
>> -               .num_parents = 1,                                       \
>> -               .flags = (_flags),                                      \
>> -       },                                                              \
>> -}
>> +static const struct clk_parent_data axg_ao_pclk_parents = { .fw_name = "mpeg-clk" };
>>
>> -AXG_AO_GATE(remote,    0, CLK_IGNORE_UNUSED);
>> -AXG_AO_GATE(i2c_master,        1, CLK_IGNORE_UNUSED);
>> -AXG_AO_GATE(i2c_slave, 2, CLK_IGNORE_UNUSED);
>> -AXG_AO_GATE(uart1,     3, CLK_IGNORE_UNUSED);
>> -AXG_AO_GATE(uart2,     5, CLK_IGNORE_UNUSED);
>> -AXG_AO_GATE(ir_blaster,        6, CLK_IGNORE_UNUSED);
>> -AXG_AO_GATE(saradc,    7, CLK_IGNORE_UNUSED);
>> +#define AXG_AO_GATE(_name, _bit, _flags)                      \
>> +       MESON_PCLK(axg_ao_##_name, AO_RTI_GEN_CNTL_REG0, _bit, \
>> +                  &axg_ao_pclk_parents, _flags)
>> +
>> +static AXG_AO_GATE(remote,     0, CLK_IGNORE_UNUSED);
>> +static AXG_AO_GATE(i2c_master, 1, CLK_IGNORE_UNUSED);
>> +static AXG_AO_GATE(i2c_slave,  2, CLK_IGNORE_UNUSED);
>> +static AXG_AO_GATE(uart1,      3, CLK_IGNORE_UNUSED);
>> +static AXG_AO_GATE(uart2,      5, CLK_IGNORE_UNUSED);
>> +static AXG_AO_GATE(ir_blaster, 6, CLK_IGNORE_UNUSED);
>> +static AXG_AO_GATE(saradc,     7, CLK_IGNORE_UNUSED);
>>
>>   static struct clk_regmap axg_ao_cts_oscin = {
>>          .data = &(struct clk_regmap_gate_data){
>> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
>> index e9c1ef99be13d0542b8a972ceffe69c8a9977118..02c9820cd98655e57a290859b595cf09d39e5fe3 100644
>> --- a/drivers/clk/meson/c3-peripherals.c
>> +++ b/drivers/clk/meson/c3-peripherals.c
>> @@ -164,30 +164,13 @@ static struct clk_regmap c3_rtc_clk = {
>>          },
>>   };
>>
>> -#define C3_PCLK(_name, _reg, _bit, _fw_name, _ops, _flags)             \
>> -struct clk_regmap c3_##_name = {                                       \
>> -       .data = &(struct clk_regmap_gate_data){                         \
>> -               .offset = (_reg),                                       \
>> -               .bit_idx = (_bit),                                      \
>> -       },                                                              \
>> -       .hw.init = &(struct clk_init_data) {                            \
>> -               .name = "c3_" #_name,                                   \
>> -               .ops = _ops,                                            \
>> -               .parent_data = &(const struct clk_parent_data) {        \
>> -                       .fw_name = (_fw_name),                          \
>> -               },                                                      \
>> -               .num_parents = 1,                                       \
>> -               .flags = (_flags),                                      \
>> -       },                                                              \
>> -}
>> +static const struct clk_parent_data c3_sys_pclk_parents = { .fw_name = "sysclk" };
>>
>> -#define C3_SYS_PCLK(_name, _reg, _bit, _flags)                         \
>> -       C3_PCLK(_name, _reg, _bit, "sysclk",                            \
>> -               &clk_regmap_gate_ops, _flags)
>> +#define C3_SYS_PCLK(_name, _reg, _bit, _flags) \
>> +       MESON_PCLK(c3_##_name, _reg, _bit, &c3_sys_pclk_parents, _flags)
>>
>> -#define C3_SYS_PCLK_RO(_name, _reg, _bit)                              \
>> -       C3_PCLK(_name, _reg, _bit, "sysclk",                            \
>> -               &clk_regmap_gate_ro_ops, 0)
>> +#define C3_SYS_PCLK_RO(_name, _reg, _bit) \
>> +       MESON_PCLK_RO(c3_##_name, _reg, _bit, &c3_sys_pclk_parents, 0)
>
>
> Adding 'SoC' prefix to clock names appears redundant and inconsistent - only
> 'sys_clk' carries this prefix while all other clock names don't.
>

The prefix is not added here but on patch 5 and I've replied there.

>
>>
>>   static C3_SYS_PCLK(sys_reset_ctrl,     SYS_CLK_EN0_REG0, 1, 0);
>>   static C3_SYS_PCLK(sys_pwr_ctrl,       SYS_CLK_EN0_REG0, 3, 0);
>> @@ -290,9 +273,10 @@ static C3_SYS_PCLK(sys_vc9000e,            SYS_CLK_EN0_REG2, 2, 0);
>>   static C3_SYS_PCLK(sys_pwm_mn,         SYS_CLK_EN0_REG2, 3, 0);
>>   static C3_SYS_PCLK(sys_sd_emmc_b,      SYS_CLK_EN0_REG2, 4, 0);
>>
>> -#define C3_AXI_PCLK(_name, _reg, _bit, _flags)                         \
>> -       C3_PCLK(_name, _reg, _bit, "axiclk",                            \
>> -               &clk_regmap_gate_ops, _flags)
>> +static const struct clk_parent_data c3_axi_pclk_parents = { .fw_name = "axiclk" };
>> +
>> +#define C3_AXI_PCLK(_name, _reg, _bit, _flags) \
>> +       MESON_PCLK(c3_##_name, _reg, _bit, &c3_axi_pclk_parents, _flags)
>>
>>   /*
>>    * NOTE: axi_sys_nic provides the clock to the AXI bus of the system NIC. After
>> diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
>> index 45e4df393feb6f916b6e035ad71e379e6e30ee99..96981da271fa1453ebbe433e36cff4409661fa6a 100644
>> --- a/drivers/clk/meson/g12a-aoclk.c
>> +++ b/drivers/clk/meson/g12a-aoclk.c
>> @@ -37,22 +37,10 @@
>>   #define AO_RTC_ALT_CLK_CNTL0   0x94
>>   #define AO_RTC_ALT_CLK_CNTL1   0x98
>>
>> -#define G12A_AO_PCLK(_name, _reg, _bit, _flags)                                \
>> -static struct clk_regmap g12a_ao_##_name = {                           \
>> -       .data = &(struct clk_regmap_gate_data) {                        \
>> -               .offset = (_reg),                                       \
>> -               .bit_idx = (_bit),                                      \
>> -       },                                                              \
>> -       .hw.init = &(struct clk_init_data) {                            \
>> -               .name =  "g12a_ao_" #_name,                             \
>> -               .ops = &clk_regmap_gate_ops,                            \
>> -               .parent_data = &(const struct clk_parent_data) {        \
>> -                       .fw_name = "mpeg-clk",                          \
>> -               },                                                      \
>> -               .num_parents = 1,                                       \
>> -               .flags = (_flags),                                      \
>> -       },                                                              \
>> -}
>> +static const struct clk_parent_data g12a_ao_pclk_parents = { .fw_name = "mpeg-clk" };
>> +
>> +#define G12A_AO_PCLK(_name, _reg, _bit, _flags) \
>> +       MESON_PCLK(g12a_ao_##_name, _reg, _bit, &g12a_ao_pclk_parents, _flags)
>>
>>   /*
>>    * NOTE: The gates below are marked with CLK_IGNORE_UNUSED for historic reasons
>> @@ -63,22 +51,22 @@ static struct clk_regmap g12a_ao_##_name = {                                \
>>    *  - add a comment explaining why the use of CLK_IGNORE_UNUSED is desirable
>>    *    for a particular clock.
>>    */
>> -G12A_AO_PCLK(ahb,      AO_CLK_GATE0,    0, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(ir_in,    AO_CLK_GATE0,    1, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(i2c_m0,   AO_CLK_GATE0,    2, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(i2c_s0,   AO_CLK_GATE0,    3, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(uart,     AO_CLK_GATE0,    4, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(prod_i2c, AO_CLK_GATE0,    5, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(uart2,    AO_CLK_GATE0,    6, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(ir_out,   AO_CLK_GATE0,    7, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(saradc,   AO_CLK_GATE0,    8, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(ahb,       AO_CLK_GATE0,    0, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(ir_in,     AO_CLK_GATE0,    1, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(i2c_m0,    AO_CLK_GATE0,    2, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(i2c_s0,    AO_CLK_GATE0,    3, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(uart,      AO_CLK_GATE0,    4, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(prod_i2c,  AO_CLK_GATE0,    5, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(uart2,     AO_CLK_GATE0,    6, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(ir_out,    AO_CLK_GATE0,    7, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(saradc,    AO_CLK_GATE0,    8, CLK_IGNORE_UNUSED);
>>
>> -G12A_AO_PCLK(mailbox,  AO_CLK_GATE0_SP, 0, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(m3,       AO_CLK_GATE0_SP, 1, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(ahb_sram, AO_CLK_GATE0_SP, 2, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(rti,      AO_CLK_GATE0_SP, 3, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(m4_fclk,  AO_CLK_GATE0_SP, 4, CLK_IGNORE_UNUSED);
>> -G12A_AO_PCLK(m4_hclk,  AO_CLK_GATE0_SP, 5, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(mailbox,   AO_CLK_GATE0_SP, 0, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(m3,                AO_CLK_GATE0_SP, 1, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(ahb_sram,  AO_CLK_GATE0_SP, 2, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(rti,       AO_CLK_GATE0_SP, 3, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(m4_fclk,   AO_CLK_GATE0_SP, 4, CLK_IGNORE_UNUSED);
>> +static G12A_AO_PCLK(m4_hclk,   AO_CLK_GATE0_SP, 5, CLK_IGNORE_UNUSED);
>>
>>   static struct clk_regmap g12a_ao_cts_oscin = {
>>          .data = &(struct clk_regmap_gate_data){
>> diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
>> index 2bf45fd7fe4ba0783e736fbbb126209870985b22..c7dfb3a06cb5f70c98f65bb91b937e1b870b34fe 100644
>> --- a/drivers/clk/meson/gxbb-aoclk.c
>> +++ b/drivers/clk/meson/gxbb-aoclk.c
>> @@ -23,29 +23,18 @@
>>   #define AO_RTC_ALT_CLK_CNTL0   0x94
>>   #define AO_RTC_ALT_CLK_CNTL1   0x98
>>
>> -#define GXBB_AO_PCLK(_name, _bit, _flags)                                      \
>> -static struct clk_regmap gxbb_ao_##_name = {                           \
>> -       .data = &(struct clk_regmap_gate_data) {                        \
>> -               .offset = AO_RTI_GEN_CNTL_REG0,                         \
>> -               .bit_idx = (_bit),                                      \
>> -       },                                                              \
>> -       .hw.init = &(struct clk_init_data) {                            \
>> -               .name = "gxbb_ao_" #_name,                              \
>> -               .ops = &clk_regmap_gate_ops,                            \
>> -               .parent_data = &(const struct clk_parent_data) {        \
>> -                       .fw_name = "mpeg-clk",                          \
>> -               },                                                      \
>> -               .num_parents = 1,                                       \
>> -               .flags = (_flags),                                      \
>> -       },                                                              \
>> -}
>> +static const struct clk_parent_data gxbb_ao_pclk_parents = { .fw_name = "mpeg-clk" };
>>
>> -GXBB_AO_PCLK(remote,           0, CLK_IGNORE_UNUSED);
>> -GXBB_AO_PCLK(i2c_master,       1, CLK_IGNORE_UNUSED);
>> -GXBB_AO_PCLK(i2c_slave,                2, CLK_IGNORE_UNUSED);
>> -GXBB_AO_PCLK(uart1,            3, CLK_IGNORE_UNUSED);
>> -GXBB_AO_PCLK(uart2,            5, CLK_IGNORE_UNUSED);
>> -GXBB_AO_PCLK(ir_blaster,       6, CLK_IGNORE_UNUSED);
>> +#define GXBB_AO_PCLK(_name, _bit, _flags)                      \
>> +       MESON_PCLK(gxbb_ao_##_name, AO_RTI_GEN_CNTL_REG0, _bit, \
>> +                  &gxbb_ao_pclk_parents, _flags)
>> +
>> +static GXBB_AO_PCLK(remote,    0, CLK_IGNORE_UNUSED);
>> +static GXBB_AO_PCLK(i2c_master,        1, CLK_IGNORE_UNUSED);
>> +static GXBB_AO_PCLK(i2c_slave, 2, CLK_IGNORE_UNUSED);
>> +static GXBB_AO_PCLK(uart1,     3, CLK_IGNORE_UNUSED);
>> +static GXBB_AO_PCLK(uart2,     5, CLK_IGNORE_UNUSED);
>> +static GXBB_AO_PCLK(ir_blaster,        6, CLK_IGNORE_UNUSED);
>>
>>   static struct clk_regmap gxbb_ao_cts_oscin = {
>>          .data = &(struct clk_regmap_gate_data){
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
