Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72250230BC2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572714; cv=none; b=WIq4Vj+0hOcp9BgekRYGR4aa2YF/xCYHdwxGUOxphS3kpIkQ5uZWcaNmhGwO/4cDS3zP4zbUp9P/N/u1fgJfhcLKAyjf20dN/i69+M5yLblHJqMYsqMhGQn/Gzu7Hi4JAptaNtDGGBCnQItQjwyyvNXetiljvcxenGXoLi/PJbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572714; c=relaxed/simple;
	bh=S3Ck7vwc07MYkEysfARCrCCCX/V3182fdfUPmdNoVyo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dXkZCtLOLRz5v7K1tTAdXK3ihznye6yMSbKL/GMFV9hVrizCWfNln4yQYci7iTAMqYTthwyb2HBw8Yt4raukvsS3jE9nvyLuFLgAmapej03plkObC9LGuxLxVHgW5FRZifSnKBg8R1TNtMjXx3MeWD/s1umtHlOI6p+rs1Oru1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re; spf=pass smtp.mailfrom=mwa.re; dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b=U8jTMOCw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mwa.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b="U8jTMOCw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c14016868so1867027f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mwa.re; s=google; t=1745572711; x=1746177511; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S3Ck7vwc07MYkEysfARCrCCCX/V3182fdfUPmdNoVyo=;
        b=U8jTMOCw/kXdkFy9QKP8c2E8arPcg/MPEDhyD72nlo+pP4gvo1KYh+/upszNk6ytXE
         ytg5S59bXBi1HH4xzLmideznPwLIBMcFQOaaD2vXYvyinQ3Du9NKEA/pngw10WZJOQ9S
         hkyBke3+jC1/ITLyWU37G1TnNf1l9GeR9kPu6PuMFugGqUbdCZQwJCa+t+AdSuZmT9iY
         /0w9ldfU7Bg5ejnUUKu875oaRjouxgqALMsPsu2ANy3dKX18NoTdPMJ4NLpKm0/cLlpx
         WVW4ww4mQFwsk9QCKeEeLjRgbkBqlgN0jZ3LgusGLrvHRIoKkQHLTlCRm6WKb2AeFJ6E
         gFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572711; x=1746177511;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3Ck7vwc07MYkEysfARCrCCCX/V3182fdfUPmdNoVyo=;
        b=Wq67g5I9nY0pwjje/BHiN8aCUgdoevWbmi+oSV95feTwwqDkJ/fQ0HtS0X3exHvxFq
         esBuzsuroe2SfhTPNbw7V/ReXwNYsxzGPDg8T0wbWUTvzO+LLAmfoYn5M3/kNh9oZhsO
         nkYnNCJ1D2bFJbkClYUwKT+imU0EBHwom0sIueXF8FEQQEgUpcCoOMK5GqaEnt/d8bZq
         956+WPN3PST2C9Ck7sjcgWfWz5YeWpjitz9aZdDfUIrUtYtDasEx7yCOLf7yuFW5fbfw
         t5TuxjKm1n76PJdHrOrbBdDbFtw9vp3GBceeRjrT599s7m0Gl+XHp4fbhCZrvtvyOv9f
         a/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWIe6Lw/l3Xb32Huuz6SHOcCt7faxWjyQTsHyl6fiGzwzrKtQB/0/MHntrUMS1/nLTOOQNed9/380lmBVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPzMdhuNxDqPbrj4z9iQHD1NHLB778YnQ5NIpJXdsAJCCiYvB3
	9INl5imkI0lR/H8BesZGcKzkv+/8Ic6OMO6OKBuGyWWlDMNgTGsS/NY5e+gb22klumrOHlTDvnn
	jItE=
X-Gm-Gg: ASbGnctL99khYbC/OcXri4H8qqJKyDkAyvDY6GxZHA/UlaYLMuvHBavtiSR6Tigt9b+
	ZTXGLljMt0xnHFSLavlO3D9boYUB8h2r4yRfNnvS5hPdCpq13S9W+7/e776Y7L3mrcw+Pu/5qak
	EuJVEQYzZD3RG1hcKwQl+2CgkVucpP0SoRvIxPNgi0eoctYDl9rJ8n1cfsklcIzKGcfCC7OnK3n
	8jImcDReaWysrFmk0YZGmiIAUvEb0B0gEjnP0WsZbRhJnthgqeCuSmcK/qdtB9pkJf+wEwmNplR
	WMpqsFEt8W348P4NEKiy5S6MfnPo7YKOZTxTFGUqkjTRjemgcTraksGweUaGJI9D9FW9z9LCS7Z
	N
X-Google-Smtp-Source: AGHT+IEy07M1Kka6h0pm1sIZsbtuaQoKm69f7gu2Qjmv8Z2/gVciyi0ynSFrOvtZvI9ezjUo9BawLA==
X-Received: by 2002:adf:e28e:0:b0:39a:c9fe:f069 with SMTP id ffacd0b85a97d-3a074e4261amr818270f8f.30.1745572710598;
        Fri, 25 Apr 2025 02:18:30 -0700 (PDT)
Received: from mw-ac-stu-3.corp.mwa.re (static-195-14-251-13.nc.de. [195.14.251.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c82fsm1714217f8f.85.2025.04.25.02.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:18:30 -0700 (PDT)
Message-ID: <1f4d6de1f452021511301070e76695d1e56a14a1.camel@mwa.re>
Subject: Re: [PATCH] can: m_can: initialize spin lock on device probe
From: Antonios Salios <antonios@mwa.re>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, rcsekar@samsung.com, 
	linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, lukas@mwa.re,
 jan@mwa.re,  Markus Schneider-Pargmann	 <msp@baylibre.com>
Date: Fri, 25 Apr 2025 11:18:29 +0200
In-Reply-To: <CAMZ6Rq+QVHAh8HvWcn8rAYGE8VoJmhQUxOFNqBpijSQz10Dodg@mail.gmail.com>
References: <20250424125219.47345-2-antonios@mwa.re>
	 <20250424-industrious-rottweiler-of-attack-e7ef77-mkl@pengutronix.de>
	 <a5684bfe-981e-4ba3-bbea-d713b5b83160@wanadoo.fr>
	 <2fe59c0c7e0f7b9369976501790fce5beaea5bc7.camel@mwa.re>
	 <CAMZ6Rq+QVHAh8HvWcn8rAYGE8VoJmhQUxOFNqBpijSQz10Dodg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-25 at 16:18 +0900, Vincent Mailhol wrote:
> I guess this is because your kernel has CONFIG_DEBUG_SPINLOCK:

Indeed.

> Without it, this would have been a more severe NULL pointer
> dereference.

Strangely, a NULL pointer dereference does not occur, when I try again
with CONFIG_DEBUG_SPINLOCK disabled. The kernel does not crash, at
least on rv64.

Looking through the implementations of arch_spinlock_t, it seems that
only PARISC's implementation would cause problems in this case since it
uses an array.

https://elixir.bootlin.com/linux/v6.15-rc3/source/arch/parisc/include/asm/s=
pinlock_types.h#L11

I think I'm missing something, why do you think a NULL pointer deref
would occur in this case?


Thanks for your feedback!

--=20
Antonios Salios
Software Engineer

MachineWare GmbH | www.machineware.de
H=C3=BChnermarkt 19, 52062 Aachen, Germany
Amtsgericht Aachen HRB25734

Gesch=C3=A4ftsf=C3=BChrung
Lukas J=C3=BCnger
Dr.-Ing. Jan Henrik Weinstock
