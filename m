Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66896259CAD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619938; cv=none; b=OaOC9QdiEpprfDFbUbwRwdxiH41G0KrFWRjLGyP6tDoepC/ngo4GeQ8nEgyhEDCjZVP+DFO4l+7jVHtJKvOtQGhotC9q++eePcpASDWxtRFcQdgd3A/kkypoAmeOigRYkljPRuCPVwOr5kVUXmET45QwrI4psK3wsaJoHHvwUE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619938; c=relaxed/simple;
	bh=uIs8J8TAolvkoMCl71is1jxlWb8HZlMXJNpvhI0wHXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzKaCf/bMjTzm/iQNptIjYrjxTSUho2kr47idzlmjN467Vnc44//4F/+PsX5UNnCNVEdXqRzV49V0wFgKt7Eym1k5PVnCMI6L468a/J0D7iMigt+mv64FQYhYZNPhZj9Hz2HIYcUH1NtHlhq9/yKoQBtNFhbunBZyNs/yIr+ejI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gDHXoQvs; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gDHXoQvs"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5faaddb09feso8013061a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746619934; x=1747224734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=om7oxz58ErunXunVagFusPsxHO+ymwEeUcfbgeIERHg=;
        b=gDHXoQvscfSxC4cv9kOvIrvJQqEoxJ30mXevrvoH4N0OpEgESS0Ai3UNKem91xkCZ9
         1v88zEfntid3OYqdBohhjxT3SwpefJ4VxsvI26c8ml2v6PQRQI7bvKTh/lGkU1Yuu+Y7
         t86+RtGHr0cxzTYm/7t3VMZE2HhmLHWVMgeCwBWzXMGFp3k+Rzz8WN3hpoeLeaReSfB5
         k5Nc/YFXmo5rrlmZgGEWY8F5wASiIJHRYLLQdZNK93prpz7eJU6kV77a+9MB2hCPhEzS
         z9l9oMK0xwWo2rka1eKmQFsZ8GBDr2m57NSbTPcnqSXV1ihmxCEcRrz8mP49WmDh81l5
         e67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746619934; x=1747224734;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=om7oxz58ErunXunVagFusPsxHO+ymwEeUcfbgeIERHg=;
        b=Ijm/4FTAmhA7EsYCoja2XlXdH3XODT0aOkS0A1AyMyd6WCEFjXc95ayBXGpPRceqE7
         nTpioc3DEUbOp/l1g0wcFJy6Sxf7h1jzLBlvkHyrle/O/EwQklsuoPn9211Lr3xrVzlC
         2JsQ6Dy4fSwwG+l/Vums6Urg/aMA7RC1MOpx8vZ5DitBf8jcf9y2J/WU/vg1ESNZvV/1
         SJZb5bR0qg6Qis6MGsEv0Mxtwaw0MYduBakykCEdL8Ng6JNhEF2Q2XN6/pwdsfnMRUpL
         3wANShqJRO2o2puH7ViIkZuxs/lRbJBwEpwwJaKJMYSgLTdwUBVb9zrxeP7ExFpbbQmO
         RBDA==
X-Forwarded-Encrypted: i=1; AJvYcCXeRAaV2Jye3dkL4x/PpDGUpZSq6y0kIGkv4E8+pesluNeqoEiWAARow5nh3N3rK01XrQr6vA7buocj0Uk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzllfeMEDGnEAtJgpvErle+cCplGySJD9OxutKEohsHHkprUOsn
	G/OR6Xa28k5+Bwpuumhuuq/ADYkDByFebcEKljMcV6AakjSHKaXO/zdA8nXkSXk=
X-Gm-Gg: ASbGncuoRC5/s9o3DQ1nvzZ/5J8p02XrWqSLBjZwXKwCrSIW1wSCuCYTh8QJDtVuY1V
	YKeJrCBJhvCtoD8kDcOUwCBzmUShogkSUMnfLlFW/oUVSvxFY7h3BvAIVlhwYeImHqLNVmIiaSA
	wAJhroAkqUo/fL6jEtP4viojj3TB+mBDxfWQKSpLht8GkdpzIHKxyA26EFewjKAKgKvdEz02jey
	ZGYmApEBnNuvtgTZNa6nF4jVR8d/Sk0xdnJRpXktKEfqUzvTEMNj9SJEeT8166jH1AY1DiiXsYi
	OwRNMABKqwUyTzncrrJzCT+AyflhDnq6+NoU3+cfsRhAbUZiAQ==
X-Google-Smtp-Source: AGHT+IF48ijHwhb+prKlciJYrp91ZouEQg6tU7MenRCxXDs9b8jde3XxqSXhLBFuS0IMKl9YSMBjHQ==
X-Received: by 2002:a05:6402:42cb:b0:5f6:c638:c72d with SMTP id 4fb4d7f45d1cf-5fbe9d77ce2mr2895742a12.7.1746619934400;
        Wed, 07 May 2025 05:12:14 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77bf3f01sm9392974a12.70.2025.05.07.05.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 05:12:13 -0700 (PDT)
Message-ID: <df05d999-8eba-4fbd-93f6-7919f73da11a@tuxon.dev>
Date: Wed, 7 May 2025 15:12:11 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] clk: renesas: rzg2l-cpg: Skip lookup of clock when
 searching for a sibling
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWx9Xk5QksoGFvCyo2HLXZ_+WRBCe3bDrZx=bfPoXHJgg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdWx9Xk5QksoGFvCyo2HLXZ_+WRBCe3bDrZx=bfPoXHJgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 05.05.2025 18:52, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Since the sibling data is filled after the priv->clks[] array entry is
>> populated, the first clock that is probed and has a sibling will
>> temporarily behave as its own sibling until its actual sibling is
>> populated. To avoid any issues, skip this clock when searching for a
>> sibling.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>> @@ -1324,6 +1324,9 @@ static struct mstp_clock
>>
>>                 hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
>>                 clk = to_mod_clock(hw);
>> +               if (clk == clock)
>> +                       continue;
>> +
>>                 if (clock->off == clk->off && clock->bit == clk->bit)
>>                         return clk;
>>         }
> 
> Why not move the whole block around the call to
> rzg2l_mod_clock_get_sibling() up instead?
> 
>             ret = devm_clk_hw_register(dev, &clock->hw);
>             if (ret) {
>                     clk = ERR_PTR(ret);
>                     goto fail;
>             }
> 
>     -       clk = clock->hw.clk;
>     -       dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk,
> clk_get_rate(clk));
>     -       priv->clks[id] = clk;
>     -
>             if (mod->is_coupled) {
>                     struct mstp_clock *sibling;
> 
>                     clock->enabled = rzg2l_mod_clock_is_enabled(&clock->hw);
>                     sibling = rzg2l_mod_clock_get_sibling(clock, priv);
>                     if (sibling) {
>                             clock->sibling = sibling;
>                             sibling->sibling = clock;
>                     }
>             }
> 
>     +       clk = clock->hw.clk;
>     +       dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk,
> clk_get_rate(clk));
>     +       priv->clks[id] = clk;
>     +
>             return;

This should work as well. I considered the proposed patch generates less
diff. Please let me know if you prefer it addressed as you proposed.

Thank you for your review,
Claudiu

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

