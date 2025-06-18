Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D17F2EA734
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246339; cv=none; b=ZysCbRf1MXtWqKW//Q9dub46GTiLckEMVmxrxqcv2KxzaOpPbXf3evBkm/m2GJ7D84z2NcZ3BSxerqwWbWIlunN/S2/XKWXp0Ql2OlDFn/rFfKQwD2w5sH0ePpZjUJPsemlpff/ucBSu64iKy+AbkKcENu5rwhT9RNg6xnbdnf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246339; c=relaxed/simple;
	bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHvE+nvNa3S9DWM8AosC8CTMMGsvxSXUvUBmTpC3G9GSdfpvnTDSFJVBkJgskylMV/1tdjD4ZgzZe+LEqCfTZEvunTTq+OZvoG7vJGxBMO6XBqGG1iALk+qsmxTaP0PH+9SeVnCSshITXRh74flwbmXcgvjvGvfghLAs2GwwnbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BFp4fz7b; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BFp4fz7b"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b5165cf5so5736143e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750246334; x=1750851134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
        b=BFp4fz7bOY3Md0H/fnwzevjZjP0acx6Yo3eVji3SmP1oNZzYZDp52a3E65OHcQM6Yd
         7EbzrKGEgdwkFFfxJRs6myFTdPIUjoXWO9n92BiMAvnlaSieV04aWb/GPeXN+/o55gbd
         9ubuYCkGzubPXrCzpNpSg6MANFs0WCBhpSEk4Iji4vbUoCrdKX+H4Br28Rlw97kfBiov
         6r8hLqwNX6Os6SAK5RQZOlh5f4jjWd4Q4Fdk/RG80vs1OTpE9fibxdzdRFlyLjL8VwlV
         Vs4Bfv/tpOTH8cTdppsgpdCY1lpe/DHbuQJLF1TZPoe8Hot1kOhFIWALJUqlncQ/19he
         RhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246334; x=1750851134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
        b=qmbTyvyoJ3EHtoRj8lRuOYwBH0Eqpp+cwPF9IdIv41HD/WjOfJlDcrwPgcPT5gFbJP
         05sJBqkHo9m1gXqxC0EiI+ugk/T97SYhnZNA5T4TVVSRYo6KUtvJEeTfgnv7R2zpnueH
         JOeZg4M2hSHuZcQdS+N6vq1nsNGwXcRqKdwY2xElOBlJuD6KCAkkAy1/+FXGI7WuB716
         6GVJHr3xLYP0sr9nDmTJomqEf68Y7KhygsXNGPqu/KEH3hMsvOQ9HtBwNzpzfuNGpbDn
         4yXNOPgGLzaX+nByIUYFniWFK/jWIyq9Gf941rTD6Dm666siynGn6HwvWJqPTBzIk5aH
         jbtQ==
X-Gm-Message-State: AOJu0YzAST8G9mJD6XciFae6kksh+9FBCISFxcMkvuCQYjskHCZsKXWa
	kQH5SHdcLy07aou1qwtjtNjZKaTH7sR8nsEzQk53HUg8/eOpZF7jJa1qtGCsbViMGEqp/KWQ5k3
	J+fEv8m84jQwpbD+4YNNjHRmYqK81nZ4ztOsxITAyNQ==
X-Gm-Gg: ASbGnctVtLt5z3rmpKlzBvsH+vEq3nnvuE8UMmIUNOcTxtzXSC50yMo3zQJ8Eww6+x/
	857vaNIxMHakKmV+6NCoDPOeagjEt7JEAvXl2dtLAPAOnNNNAACZKm1FVF2QoeoC+NVy8RnsU3s
	0bzvI7Ax5yVb7Wl914+EBINlWMccxE72VubnWgjQ6xzsk=
X-Google-Smtp-Source: AGHT+IG/cXE1HQ3EEXy0cPSnaDLNTuKJgzCF0qLdhOb/5CcGOOw+a/DTjj5TWhlAS5cXMjlqM/mbx0AMV43GUJjmW2k=
X-Received: by 2002:a05:6512:31d6:b0:553:2e4a:bb58 with SMTP id
 2adb3069b0e04-553b6e7337amr4658199e87.9.1750246334530; Wed, 18 Jun 2025
 04:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-17-jirislaby@kernel.org>
In-Reply-To: <20250611104348.192092-17-jirislaby@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:32:03 +0200
X-Gm-Features: AX0GCFvVR50_3aX2UCUBcxsZuxXj9BpNTfKCs9hxZHJvTphADGhBSjR3yjyWU08
Message-ID: <CACRpkdYkgHzEnqN3VA2MqBChjtwjC+Fhem7Bo3PdnfGZQgQ99Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 12:44=E2=80=AFPM Jiri Slaby (SUSE) <jirislaby@kerne=
l.org> wrote:

> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>
> So use the dev_fwnode() helper.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Patch applied!

Yours,
Linus Walleij
