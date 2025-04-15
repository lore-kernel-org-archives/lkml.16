Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BA023F410
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704810; cv=none; b=QbLafiXX0TjNSq3ysi5TzXFMEQRLqjAjHWzIvHw9pHg1SJBGx+F0mYIUSd2yw61XiPfnwuZFYb+U5UUO3VdFwEr5W0KbNObnB3d6HO4X1zND6SmxaA1h9WOhs3EMbuDhUGVdNM//SiLMmCGmWjeKJc0PjJnnGmNbfE74XC0cCKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704810; c=relaxed/simple;
	bh=G0SXbcSPD4eKG170yt9sFXLWLNU52miss6t6Hiv5iPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfRHgY4TnS4rJh/GO9T/tKfqV795QTJ8oX9h7nI9YwO8TY6o1EjlRhw4ZSGjaBJSqgr2V+qPYTCrtUO5ujw7ImrLzhkurarqYr1w6F4jYjDbRuYBzNNff0BuavtzZ7Mx28Msx2OP7fubETo36/QO7c4+Y8ip5I72LqSBZbwVOLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCIx/Jit; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCIx/Jit"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bef9b04adso54893141fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704806; x=1745309606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFY4iz2NkMkn82wtqK0wu6zYdnpLwKWjcxUnTT45RU8=;
        b=ZCIx/JitnnaWQJAXvBnCeoXK2NNFa/Zgpi6Qw9k9RIafy5HnXqtMrzx38HnO0NbbIS
         pUJnVbm+kRFoRchhUAum0QhtLzCPNmE9V2qOSj/gFWbfzXtFHOS0eqJpQhdJBvDMTeni
         ydC+DZQxnid3SSKK4R+aH9t5qX7FT50KHDC/NCKZpH8MEWfHtoFn3c0TnzNffLX2jz3R
         bsNFC9So1H7uJxxep8yHt/i3tDTt+tj4bAmRbyiju0c5CqCVs5CV+CPV2V9CankEsQ7G
         3RORjGh5YWxYxlSjDgAGA0xUS1u0XndaTwIl0FOCruy9PM/qSx6yV6Nl4wyNhMMYg4rf
         UY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704806; x=1745309606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFY4iz2NkMkn82wtqK0wu6zYdnpLwKWjcxUnTT45RU8=;
        b=tGCtCDuvaUiWlOIbXW0BOV+ZmAkNjgekNi06iPxmtfWoGz1wLyoMp+ax4F5bqNfIPm
         20znWC6k5WqvOc+SRNfyajHKi+VwDBoDrUWNXNxNTLV6yROdzgo3QdoS17vDsvpF1eh0
         A+Df/eUoHcwOdM8F3W6nl3JQOYK4zFzw8cb35GbjzebiBdkcNvyxgSB0X17FQXFibqF0
         nsJXHTzgd7KBckl9VG1ICDAY2kPcKCH/+Ka0bNYzC+LEOddmsXp9xKHj9lRhKzWLbMDh
         QQJkYTrkAtqhWjzNkyMh/oXZw+9PMRUiVKGEUFpjXXT14BfjEHsTZ1BTDqDjRhjaTzlt
         AjSw==
X-Forwarded-Encrypted: i=1; AJvYcCXnpuLQZKFmmEQVDIpVZKCMmBwVL537Z6+epw0nzzdveTcEyzUMQKXdtqaFJSt5whn6rs25pOjU843Wp4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAe+whigYkJcTT+k28bDS7jOh25vLm5XYFbzsWFXJFQj+wvx5U
	owEYcVz35oqYC0cShOc2iK5OQ0UobsIJASNNFvcm81yYxmdZTa/2f6JDTRDFVp337SVU+jruknt
	9xrRBZLn0BHRld/rlbw1ExH52ca9uQZNPLKSk4A==
X-Gm-Gg: ASbGncsWpGmBkV1PSOwgTvkVF2eQqP5IrDFND9OJo0dzQTwvD4/zKueHFJ549dF754m
	qV9tIpSDU1LpfSc3A812PFOZSQjkihutWyfdfBZXxje9YIm57Vq4wMkCeEKsDeX2YUpSPb+wXe7
	5JZwrxywyJ/+B6TewgUzZCLg==
X-Google-Smtp-Source: AGHT+IHxu3L63YU3X/OHUffJLZIcNuZL0P4GMbc/IZR6G3djfSF3hlUGgCuVWz6iHBq9HTYYouQFmi4C+M66/YtgIJA=
X-Received: by 2002:a2e:bcc1:0:b0:30b:cb10:3a20 with SMTP id
 38308e7fff4ca-31049a7fe2amr53834191fa.32.1744704806469; Tue, 15 Apr 2025
 01:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5879304.DvuYhMxLoT@lukas-hpz440workstation>
In-Reply-To: <5879304.DvuYhMxLoT@lukas-hpz440workstation>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:13:14 +0200
X-Gm-Features: ATxdqUEIY8Ee1-V3nQ_ndtr9ZjLOof5UyRNAsAbubag6b8OmUtmIRFDymqGDsXk
Message-ID: <CACRpkdYbZfcyGUUCe2NomFHAoaychOTBjr+k6Xyqe3AjEq0+wA@mail.gmail.com>
Subject: Re: [BUG] pinctrl_mcp23s08_i2c: mutex used in irq_bus_lock causes
 'scheduling while atomic' with matrix_keypad
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 1:48=E2=80=AFPM Lukas Schmid <lukas.schmid@netcube.l=
i> wrote:

> I'm encountering a "BUG: scheduling while atomic" when using the MCP23017=
 GPIO
> expander with the `matrix_keypad` driver in IRQ mode on Linux v6.12.20

Apply this commit from the upstream kernel:

commit a37eecb705f33726f1fb7cd2a67e514a15dfe693 (tag: pinctrl-v6.13-2)
Author: Evgenii Shatokhin <e.shatokhin@yadro.com>
Date:   Mon Dec 9 10:46:59 2024 +0300

    pinctrl: mcp23s08: Fix sleeping in atomic context due to regmap locking

    If a device uses MCP23xxx IO expander to receive IRQs, the following
    bug can happen:

      BUG: sleeping function called from invalid context
        at kernel/locking/mutex.c:283
      in_atomic(): 1, irqs_disabled(): 1, non_block: 0, ...
      preempt_count: 1, expected: 0
      ...
      Call Trace:
      ...
      __might_resched+0x104/0x10e
      __might_sleep+0x3e/0x62
      mutex_lock+0x20/0x4c
      regmap_lock_mutex+0x10/0x18
      regmap_update_bits_base+0x2c/0x66
      mcp23s08_irq_set_type+0x1ae/0x1d6
      __irq_set_trigger+0x56/0x172
      __setup_irq+0x1e6/0x646
      request_threaded_irq+0xb6/0x160
      ...


Yours,
Linus Walleij
