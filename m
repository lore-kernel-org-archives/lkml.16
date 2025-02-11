Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBD41F193C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271113; cv=none; b=guOJN+u0Qh6KnRGJVmhgBeIW/GZzvCGbyA0guIHDRpHuaPJb5dqJi5nTwalOC7VmnpbCpiBQGCESMH4DwyaNGZaJXKKPAoEV9b+0NVCvcE9YFShVSBkJ5fwWT9wOjnw9aIdJfixE+U2jHkwdLcxb3BNuFHWRpeDxtYLQYGujwpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271113; c=relaxed/simple;
	bh=ARtF4OvwMld7TDHIHm/xgk9/+u1COpK4K0CUMaX3KTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWANzFlEvoUo4U8SveqzairT8qZpXguZbY9dsMqpACsmHjj6ISgb9RMkq5w4jd9ZW0KWj1eAL+RNfg93mAcYknnI104JgQEfzkSyl0hHSftxJcn3LVhfBDLK69+UKoGMOr1sLjMk85qyQe6JwLiMuMfQy+wO8GP0Bh8FNUYjKlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=picrD+3u; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="picrD+3u"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7d3bcf1ceso228393866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739271108; x=1739875908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSL6/7KbkCyWike0T72jibPU31Fl6EDKbQdc+JSt7yA=;
        b=picrD+3uUQ7eSIQ9Nj2d3RLIrBVVmOyePFfvhT/pUFWxulUDK/GnpRFsxXZO8YFnAW
         k97J6mRts3C2Syu9orXebhG/FGdOa/XGckdZoNvRztsw7jsNV4t5k2GvH0fSaIkJlzmc
         1emTrdkNGe+MgoW8xmnpGHxW20ca0yxeaq0QZ27A89ajd/ku/dFkze/Op0jqJP3cPara
         YmCURwyLd29FEfrzvRhGwTrhCUvLEmEzLCXqGVOtmAWr9p4UHahSgawknkxFUTmRWNc+
         Qco4QruPVB4QZz82OQoQB5vFAmcgZ7hP1AkYYrKV04c67ztQN+0klXLVYxPsvRQjMX37
         V/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271108; x=1739875908;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSL6/7KbkCyWike0T72jibPU31Fl6EDKbQdc+JSt7yA=;
        b=IpYSUViWMNJvA8ACCx8JfARm8lpZkCuwXnGqw7IvJSVnRRbEdJTXoPt6IBA1CWAlEu
         mpAtBBGtSNmhXCCTV3xOb//UCW+IsIU/qYjsoqc5ZNdxba91JlkxM4fliMRk58y3XdH6
         +JwOCJVWNszHvswsjanvfnKzH0lygzdsCVHnmWe6JiQagH7rHu4tKpLIEF6/u7e0atWv
         Xg2p1um1SP++AIXwJVslwD2o1GMtxU89kiwTPcv1imPnkqCSuZhDoioSRfmVIaqRmUhL
         RLp09snUs6q7PeM+6Ho9u+0q89G+9MYOfpT+BsyHQsEo/Ir6bYAgHVBS+e7T0RH67FHB
         kKbg==
X-Forwarded-Encrypted: i=1; AJvYcCU65jItF5qQz6GTItY8Y+EbtUk102FAuCboubSBq6wZ1OURfne8KJ9kJZEBL+JgNQt3WSYmWdspmXW/A0g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe010RaBCQ+VUzf4XUTf/8UViRF+uiFSlwMzth16tfcWDzO2yT
	rQr+7/bzUDa82z+B2KrbqmzmLHEVrpFIWeq/G/SBBYz8lbbpQWP/7au7WeF7lP4=
X-Gm-Gg: ASbGncurCYvjCxMfl/H7t4OBVviJ0DZ3vWTis965Yv4gPuG0n5lwHh1ES02qXKMSj4C
	mQ6vEqgvFVRsnZWxMazC5OL/iQH/e4/zW/pDOoc4w7TIwJXQK/zPH1MGePbO7dChl/FX4pIPEeS
	ixiQ9Zaz0Ipq5BqWp7ACKO2Pf+jbiwvb7Yc9b9P+EU6gUjmIeflDrK7vWQYJAyo6qVzInJiNjgP
	lWpBrQ6XZdmccj6j0MKGuIQjt3U8o8Greh5CogdKx7EDFiu/dYk/q+dG7z4L2NlLp1VlqvoLpNF
	yczGGqawH6YzMrlxdiV8LIrC
X-Google-Smtp-Source: AGHT+IFOlRSXmPpMqNX1Hj05f5snUNJfrKfwz8DXHeQeL+jYNzKx2LjKje3P7Gnm5KJFqEO6VeZy/w==
X-Received: by 2002:a17:907:2ce5:b0:ab7:c115:68fd with SMTP id a640c23a62f3a-ab7da4fb5cbmr276750566b.53.1739271108039;
        Tue, 11 Feb 2025 02:51:48 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ecb3bc1asm3454766b.66.2025.02.11.02.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:51:47 -0800 (PST)
Message-ID: <01f30b36-2f8e-4209-bc73-b955916977d8@tuxon.dev>
Date: Tue, 11 Feb 2025 12:51:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] serial: sh-sci: Update the suspend/resume support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de,
 geert+renesas@glider.be, wsa+renesas@sang-engineering.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250207113313.545432-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXis9-PjpKXP7eDGzdgox_jp8Gop6zgJBrnGrATdFTBTA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXis9-PjpKXP7eDGzdgox_jp8Gop6zgJBrnGrATdFTBTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 11.02.2025 10:16, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 7 Feb 2025 at 12:33, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S supports a power saving mode where power to most of the
>> SoC components is turned off. When returning from this power saving mode,
>> SoC components need to be re-configured.
>>
>> The SCIFs on the Renesas RZ/G3S need to be re-configured as well when
>> returning from this power saving mode. The sh-sci code already configures
>> the SCIF clocks, power domain and registers by calling uart_resume_port()
>> in sci_resume(). On suspend path the SCIF UART ports are suspended
>> accordingly (by calling uart_suspend_port() in sci_suspend()). The only
>> missing setting is the reset signal. For this assert/de-assert the reset
>> signal on driver suspend/resume.
>>
>> In case the no_console_suspend is specified by the user, the registers need
>> to be saved on suspend path and restore on resume path. To do this the
>> sci_console_save()/sci_console_restore() functions were added. There is no
>> need to cache/restore the status or FIFO registers. Only the control
>> registers. The registers that will be saved/restored on suspend/resume are
>> specified by the struct sci_suspend_regs data structure.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> The v4 of this patch was part of a series with 4 patches. As the rest of
>> the patches were applied I dropped the cover letter. The v4 cover letter
>> is located here:
>> https://lore.kernel.org/all/20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com
>>
>> Changes in v6:
>> - used sci_getreg() before saving/restoring registers to avoid
>>   WARN() on sci_serial_in()/sci_serial_out()
>> - splitted sci_console_save_restore() in 2 functions:
>>   sci_console_save()/sci_console_restore() as requested in the
>>   review process
>> - adjusted the patch description to reflect these changes
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> One philosophical comment below...
> 
>> --- a/drivers/tty/serial/sh-sci.c
>> +++ b/drivers/tty/serial/sh-sci.c
>> @@ -3546,13 +3559,57 @@ static int sci_probe(struct platform_device *dev)
>>         return 0;
>>  }
>>
>> +static void sci_console_save(struct sci_port *s)
>> +{
>> +       struct sci_suspend_regs *regs = &s->suspend_regs;
>> +       struct uart_port *port = &s->port;
>> +
>> +       if (sci_getreg(port, SCSMR)->size)
>> +               regs->scsmr = sci_serial_in(port, SCSMR);
>> +       if (sci_getreg(port, SCSCR)->size)
>> +               regs->scscr = sci_serial_in(port, SCSCR);
>> +       if (sci_getreg(port, SCFCR)->size)
>> +               regs->scfcr = sci_serial_in(port, SCFCR);
>> +       if (sci_getreg(port, SCSPTR)->size)
>> +               regs->scsptr = sci_serial_in(port, SCSPTR);
>> +       if (sci_getreg(port, SCBRR)->size)
>> +               regs->scbrr = sci_serial_in(port, SCBRR);
>> +       if (sci_getreg(port, SEMR)->size)
>> +               regs->semr = sci_serial_in(port, SEMR);
> 
> IMHO, it does not make much sense to check for the presence of the
> SCSMR, SCSCR, and SCBRR registers, as they exist on all variants,
> and are always accessed unconditionally in the rest of the code.

I kept it like this thinking that it may help keeping this common for
RZ/T2H (though I confess I haven't checked it) and avoid future WARN() on
other possible platforms. If you prefer, I can drop the checks you pointed.

Thank you,
Claudiu

> 
> Same for sci_console_restore().
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

