Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FBE2DE6E8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531995; cv=none; b=AIiVfkXZrVmb9CK9THtEDtXFBOUFD2RNWMbo5z0n+M8F8JUP+524OgHk/zDysEb74OZdvtjTouyJOfo5cXPuhydw8Ki8N8K0vhUGAoBfR7FNZXQpcbv2FHdHyNvkyfx9DnEASgQorGvXLigfGZ2OfyguqI9wbqUjXArc+FP7BI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531995; c=relaxed/simple;
	bh=yjEFNI1vnli0Mlc4ilFGuKnQevWJvkf4tPCLZeb4m44=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F1m/QTTGWdu24v267NJDyXAE2wXuCwyD/yYKcKuBLwtR+QFTf3w/josc5iHcQBS7YpuWa0CcjqqnrvgGJcF3hKJNyN4GFnWadHnLk7kprJhzsPOtrw5Py6aC9B2j49qYqvpRZVyVwwxz7cJAdnqU0Gbd4nEal9cc4rLu0V/QrJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wXwfJqfG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wXwfJqfG"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so3516965f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751531990; x=1752136790; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5c5DYGl47aYWZLPkSpLUyqJH150qyEt79Wo9rxFNQNQ=;
        b=wXwfJqfGjMQuJtzWDDyMPHXGCc53TNUw8Ej01m7sWCwrJA8ym//JAeRbaMhGEF0JTX
         SmR7+w6o//wYdZfmrqw7mtbkIX9csvsA1ZaxzB6aAQIO7XMA7MAj3t1pjRWx47qzttxH
         YKWMrK+ldLbC7Ywhw1UQWg2cDgLUjeVXcIwFe+zmG7yZxJexHq/va4q8+i9ZOfRcskXa
         vFjP4UqDhzy7MKJ8zRmHV6SIcpEEZDVR8zjuTV6gOxoHT9O15VW3X+evyiD34mo85hUc
         eRBlly7Fd30M0jYYctyjIXu0KQVBaRoylgU7sBZ5GLzH1NtZipRl5DCdbI05W2JLpW9M
         BNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531990; x=1752136790;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c5DYGl47aYWZLPkSpLUyqJH150qyEt79Wo9rxFNQNQ=;
        b=Pzj8pohXFAeZ5O/54e2Iaajx0fYuKxJKXo74YXDxxTDoPxRjltdPD8BJxjCYR38SO4
         bOtWwmDNFaQxoyUuzd8v8IQiW/mJklkYIFVkvk9EI8+c96VPD6iK2RqZwiW0iAebv1RT
         dL99h3TF+VlHrA6KArdAZefgQrIwH9EejudL7I23MWKWL486K0JcffTb0eq23tlcLypw
         tpprK/xJC6jeGOds4TZTbTr1Z2g40zo0JZVuYuHgf72cT7R7SiyTuz+x9Nh8m8z9ZrkL
         vKp1z+qQ/zKkD36Jtmu5aXWUbFpW90mSladwOI8aiGYrFXj8pP6W4RTKc3WF2FioSLtV
         Vk8w==
X-Forwarded-Encrypted: i=1; AJvYcCU0RcKU/pwdWOwW6dYgf8COMwJjP8XRU9giPGTjttP87b5C9br9y0iVDT/865fxaWkM3HHRFZ0qIZGQqDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUPk8Ooi/0f2OsgRqFZ0hMtzitWUjQlzSYIxQ9N+U5+GTnbTkP
	Lu478XNJjvVZPiwma1z87kpvcmYBEeKeiWFl2jnenqDBZmsHXfRcJlk7nKQwCeXaAzA=
X-Gm-Gg: ASbGncvo1hOxqcWzXBUH4xsXY9us6US/0yCLVui2oG+Txqn4sLtgtLpHhdfWwDhFZtU
	d8cMeejT6RHZtA6Nu2ngfzWlODnaQXHF1sBqnMGan6eEPzOfjVXPowp4lLVcUHBSjtd0XUu9U7i
	14gd2Ym/L9//YDNvKCtFdMD+Gd+F05diOpm8yXGt5iNxDoFv2RmWqqV7vd8mPdtBEZh55Z+hCPZ
	QnU4VI9tNCz/HlloBlDdrC+B748bSB05npTmVAabyst1cdtlL+RkQ+xXpxwMBseqwERZb7WlJHt
	UeugFcEEnj0l4jValkXPYXbWLrLR/9ltLFZ8SEbkUJczm3pG7n7yd93cHU0esQ==
X-Google-Smtp-Source: AGHT+IEM43hwgON08uzyYs0xx1I5VpWRjMLLXLPjH06b7O2PIIqRcDAeRfUfliYzvrSLOzEu/UQUYQ==
X-Received: by 2002:a05:6000:26d1:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3b32db892femr2028812f8f.35.1751531990341;
        Thu, 03 Jul 2025 01:39:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7fab6esm18379133f8f.31.2025.07.03.01.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:39:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/26] clk: amlogic: add composite clock helpers
In-Reply-To: <a9b6ffdc-489f-4be9-9005-e987df739901@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 15:24:50 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-24-e163c9a1fc21@baylibre.com>
	<a9b6ffdc-489f-4be9-9005-e987df739901@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 10:39:49 +0200
Message-ID: <1j5xg9d5wq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 03 Jul 2025 at 15:24, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome:
>
>
> On 7/2/2025 11:26 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Device composite clocks tend to reproduce the usual sel/div/gate
>> arrangement.
>>
>> Add macros to help define simple composite clocks in the system.
>>
>> The idea is _not_ to replace all instances of mux, div or gate with those
>> macros. It is rather to use it for recurring and/or simple composite
>> clocks, reducing controller verbosity where it makes sense. This should
>> help reviews focus on the tricky parts.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/clk/meson/meson-clkc-utils.h | 57 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>
>> diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
>> index 95d9f85f7ca22f63a16f8665d6f7a250b21bfdb8..ddadf14b4923781d8807546f35a1ba2e6a8a894a 100644
>> --- a/drivers/clk/meson/meson-clkc-utils.h
>> +++ b/drivers/clk/meson/meson-clkc-utils.h
>> @@ -48,4 +48,61 @@ struct clk_regmap _name = {                                          \
>>   #define MESON_PCLK_RO(_name, _reg, _bit, _pdata, _flags)               \
>>          __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pdata, _flags)
>>
>> +/* Helpers for the usual sel/div/gate composite clocks */
>> +#define MESON_COMP_SEL(_prefix, _name, _reg, _shift, _mask, _pdata,    \
>> +                      _table, _dflags, _iflags)                        \
>> +struct clk_regmap _prefix##_name##_sel = {                             \
>
>
> Can we apply the same naming style to the '**PCLK' clocks? The SoC prefix in
> clock names looks inconsistent and awkward.

Replied on patch 5

>
>
>> +       .data = &(struct clk_regmap_mux_data) {                         \
>> +               .offset = (_reg),                                       \
>> +               .mask = (_mask),                                        \
>> +               .shift = (_shift),                                      \
>> +               .flags = (_dflags),                                     \
>> +               .table = (_table),                                      \
>> +       },                                                              \
>> +       .hw.init = &(struct clk_init_data){                             \
>> +               .name = #_name "_sel",                                  \
>> +               .ops = &clk_regmap_mux_ops,                             \
>> +               .parent_data = _pdata,                                  \
>> +               .num_parents = ARRAY_SIZE(_pdata),                      \
>> +               .flags = (_iflags),                                     \
>> +       },                                                              \
>> +}
>> +
>> +#define MESON_COMP_DIV(_prefix, _name, _reg, _shift, _width,           \
>> +                      _dflags, _iflags)                                \
>> +struct clk_regmap _prefix##_name##_div = {                             \
>> +       .data = &(struct clk_regmap_div_data) {                         \
>> +               .offset = (_reg),                                       \
>> +               .shift = (_shift),                                      \
>> +               .width = (_width),                                      \
>> +               .flags = (_dflags),                                     \
>> +       },                                                              \
>> +       .hw.init = &(struct clk_init_data) {                            \
>> +               .name = #_name "_div",                                  \
>> +               .ops = &clk_regmap_divider_ops,                         \
>> +               .parent_hws = (const struct clk_hw *[]) {               \
>> +                       &_prefix##_name##_sel.hw                        \
>> +               },                                                      \
>> +               .num_parents = 1,                                       \
>> +               .flags = (_iflags),                                     \
>> +       },                                                              \
>> +}
>> +
>> +#define MESON_COMP_GATE(_prefix, _name, _reg, _bit, _iflags)           \
>> +struct clk_regmap _prefix##_name = {                                   \
>> +       .data = &(struct clk_regmap_gate_data) {                        \
>> +               .offset = (_reg),                                       \
>> +               .bit_idx = (_bit),                                      \
>> +       },                                                              \
>> +       .hw.init = &(struct clk_init_data) {                            \
>> +               .name = #_name,                                         \
>> +               .ops = &clk_regmap_gate_ops,                            \
>> +               .parent_hws = (const struct clk_hw *[]) {               \
>> +                       &_prefix##_name##_div.hw                        \
>> +               },                                                      \
>> +               .num_parents = 1,                                       \
>> +               .flags = (_iflags),                                     \
>> +       },                                                              \
>> +}
>> +
>>   #endif
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
