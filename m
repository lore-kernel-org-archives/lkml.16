Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F1D287511
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091342; cv=none; b=Qicinu9ikj1SXMWpq+L1qdj8OMipFfS+YXGXWhDgfEzkJqv0s2d22JxzFC2030OxaCsL3IyW6UyOW4yr/M6MiNJKVEFIDygeHZvm6X8O9aK9bFVn9+l68Cb3jp6TVf32MzCYqsgRZIXTQkomivyZwol6muLV/ldxU44vKzjls5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091342; c=relaxed/simple;
	bh=oc308cWJY7K5jtB4M8lGQgi0gwj+laPxSvUnNM1ACGw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gx4RyELFZgUw9fC5HovsNolKYgqfT3j31OoOIBzEB/wDvzUQ3fCLTzb3u8C513YJb0Req7c4zVJcmf77qMSMvTQaqGMpqTMZwqitkEUtxaYXCcDfuS5CkElhajFqsDVhsopU/IV1ZN6BFEPdNFQVoBD8eVqBko/9Zr+Xtczsejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jkjYoPFJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jkjYoPFJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so2684056f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750091339; x=1750696139; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GLMk8sUAbFDL9awvd1JVfmla5ZuGflgSXmH7EtFQNMY=;
        b=jkjYoPFJOKMBzVp4gaYUmYrdwEo44U3Kvrkp8aDRzsY+PznXMsZSXsLph1CCWcjWbP
         fbnSPRsj7mCsxB4q7LNiyZOHBpHA942a0WZsct3ixAxlLPm6RpqgOWEGCj7/XsYE2Qe+
         4PxPT9rmsmY1f/lPwWxDZrBYeh3R9sqD30RQkTn0DH/aASfAtfIbL8yXPk+uwxK58UwX
         j+049SWln+hHrPnzANpUSGQInhu6DVAxNEz5FrZhVsc5SneDM7VivovKK5zwhD3WQ5PO
         8nEcWU2Vs3DqcnQcoUoMD8R5/pUGaVkvuYQwhOo8t/0KWpAJjOSEMfu7KEe+XSDzxrJm
         wwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091339; x=1750696139;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLMk8sUAbFDL9awvd1JVfmla5ZuGflgSXmH7EtFQNMY=;
        b=aIsyk2eFx+dhE9PPm4DTeRqgwtVy5wA17JWTNl3HxhXSs2ZLOtBFxEl+jIB9nQ/adK
         nbz+vkp5+iVdjacPS8grrga3r1ESG+z5B9F+5sZlSG0BqK7S1nCIGrAh2v5x3tXSHkd9
         nsy9GePt8vO1NZmSwRAJ9ZRpYoz9zc7L9OKS0FAvM8eAc3TX/X6fDibmlAdnSxzZYInR
         6oDmICSz4vRVX0xmou0OGoGx4Tn8qtOGSs/pcwoKlIhOOi0IEBKH5yu0q/8p6atH5rIV
         sst+073mwQVC6C6D6MoZX81KQqcNflF1qbUDZUwkIlt98Qhvc2+euxU6JUlQsugIKAj4
         qFqA==
X-Forwarded-Encrypted: i=1; AJvYcCV53dCf0hNjz4lPf0EZUfq7T6oQTbmhNPylEZjrVSPyNY6Cwm7PP2Kpj4EFqaZnNlJHkvtNMEiAoIzfQ8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXAo9QCaXwRnplY2FT2U1e8kpw56/2bx1Ot6wKq41B05PRXTOf
	jyeiF4JCb98MPpp39YSkHQog7dCL4CH/HjeYwoy+ynLeedFRU4RAe1/0qkRWMmC7RiI=
X-Gm-Gg: ASbGncvvib+hUjAW3EbKdh5FrmMbhVU5s1DMUlJQ2q/PsHz1UBa4KWC8FyES9J7lGsU
	5o2la4bbgzXm3T6OhWslRqAl6hysrNNOjZK/wfLhMwRRhD2HaXGJFzr94nKz+u/u+gtvD08HuO0
	XsDB4h8oipmpuUGyziYcMFYK+52s6730ZvfMjJKaZzTor+EjR9mKW38aVmNlGBYJh80W9jJ09Rm
	iwIGxuZRGt5dJHSLJ/B51ae1ZoAT3xMBYajJZkTJ4H3x6apUq54yVx/EC58qdVWq5A6arYDA+1q
	cOjQYX0irRGlDajKdg3q/KZVDiffq0fgBDSPSI7IzSD2lzTsOTYU0v/XQGivpg==
X-Google-Smtp-Source: AGHT+IG+uKVD+2uQ30rqIvYD8novgngIzsToeM/OcxULMAkMYw8cbJlVs0Ezi+EAX8FyDekCYLEjHA==
X-Received: by 2002:a05:6000:1447:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3a572371aa7mr7369046f8f.13.1750091338599;
        Mon, 16 Jun 2025 09:28:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1866:9357:88b6:f1b2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a5407csm11646209f8f.12.2025.06.16.09.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:28:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Dmitry Rokosov
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 5/6] clk: meson: add MESON_PCLK_V2 for sys gate clock
In-Reply-To: <ea83e375-7088-4047-92f1-31d0e7c2c331@amlogic.com> (Jian Hu's
	message of "Fri, 13 Jun 2025 13:35:22 +0800")
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
	<20250509074825.1933254-6-jian.hu@amlogic.com>
	<1jzfffy738.fsf@starbuckisacylon.baylibre.com>
	<ea83e375-7088-4047-92f1-31d0e7c2c331@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 16 Jun 2025 18:28:57 +0200
Message-ID: <1j8qlrd512.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 13 Jun 2025 at 13:35, Jian Hu <jian.hu@amlogic.com> wrote:

> On 2025/5/14 15:39, Jerome Brunet wrote:
>
>  [ EXTERNAL EMAIL ]

Please fix your mailer, can't read that reply

>
> On Fri 09 May 2025 at 07:48, Jian Hu <jian.hu@amlogic.com> wrote:
>
>  A new MESON_PCLK_V2 macro is introduced for the sys gate clock. Its parent
> is an SCMI clock. It belongs to another clock controller, and the parent
> configuration is different from  that of MESON_PCLK. This avoids new macro
> definition in the peripheral clock driver.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-regmap.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
> index e365312da54e..61b8fc2d875f 100644
> --- a/drivers/clk/meson/clk-regmap.h
> +++ b/drivers/clk/meson/clk-regmap.h
>
>
> This file is not meant for amlogic specific stuff. I know some found
> their way in regardless but that's being fixed
>
> I found macro MESON_PCLK is used in G12A/MESON8B/GXBB/S4.
>
> you mean the macro will be fixed? and use something else instead.
>
>  
>  @@ -134,4 +134,28 @@ struct clk_regmap _name = {                                              \
>
>  #define MESON_PCLK_RO(_name, _reg, _bit, _pname)     \
>       __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
> +
> +#define __MESON_PCLK_V2(_name, _reg, _bit, _ops, _pname)             \
> +struct clk_regmap _name = {                                          \
> +     .data = &(struct clk_regmap_gate_data){                         \
> +             .offset = (_reg),                                       \
> +             .bit_idx = (_bit),                                      \
> +     },                                                              \
> +     .hw.init = &(struct clk_init_data) {                            \
> +             .name = #_name,                                         \
> +             .ops = _ops,                                            \
> +             .parent_data = &(const struct clk_parent_data) {        \
> +                     .fw_name = #_pname,                             \
> +             },                                                      \
> +             .num_parents = 1,                                       \
> +             .flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),     \
> +     },                                                              \
> +}
>
>
> The proliferation of those macros has been going on for far too long,
> add using CLK_IGNORE_UNUSED inside is certainly a mistake I won't
> repeat.
>
> This will be part of more general clean-up that currently depends on a
> this [1] patch to go further. You'll have to be patient.
>
> [1]: https://lore.kernel.org/r/20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com
>
> OK, CLK_IGNORE_UNUSED is added for all gate clocks. it is better to remove it. and wait for your patch merged.
>
> And  quote your comments in v2.  the T7_CLK_GATE is newly added in T7 Peripheral driver in v2.
>
> If I understand you correctly.  A common macro should be added for it and remove T7_CLK_GATE.
>
> So I add a common macro in clk-regmap.h, and it can be used for different SoCs.
>
> MESON_PCLK and MESON_PCLK_V2 difference is a clocks's parent defination.
>
> the sys gate clock parent is in another clock controller. So parent_data member is need for it.
>
> and parent_hw member is for previous SoCs which clock and parent clock are in one clock controller.
>
> How should we deal with it. 
>
> 1.Add the macro in T7 Perpheral driver.
>
> 2.Or add a common macro for parent_data,   and where the macro should be placed?
>
> ---
>
>> +#define T7_CLK_GATE(_name, _reg, _bit, _fw_name, _flags)		\
>
> See, redefining the peripheral once again ... something all the SoCs
> uses with minor variation.
>
>> +struct clk_regmap _name = {						\
>> +	.data = &(struct clk_regmap_gate_data){				\
>> +		.offset = (_reg),					\
>> +		.bit_idx = (_bit),					\
>> +	},								\
>> +	.hw.init = &(struct clk_init_data) {				\
>> +		.name = #_name,						\
>
> There is an exception in the naming convention for peripheral clocks.
>
> The name is soc id prefixed in most SoC. It is these pointless minor
> diff that makes factorisation difficult.
>
>> +		.ops = &clk_regmap_gate_ops,				\
>> +		.parent_data = &(const struct clk_parent_data) {	\
>> +			.fw_name = #_fw_name,				\
>> +		},							\
>> +		.num_parents = 1,					\
>> +		.flags = (_flags),					\
>> +	},								\
>
> ---
>
>  
>  +
> +#define MESON_PCLK_V2(_name, _reg, _bit, _pname)     \
> +     __MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
> +
> +#define MESON_PCLK_RO_V2(_name, _reg, _bit, _pname)  \
> +     __MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
> +
>  #endif /* __CLK_REGMAP_H */

-- 
Jerome
