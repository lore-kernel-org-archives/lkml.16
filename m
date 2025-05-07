Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6272616
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 22:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658179; cv=none; b=T5MUBJNiDAvdsOiVvskHWFg9KUFfT/wGa9TzefeI3a/SEgKGUPOzPKiV0V8FiJsDBug7iOtAvcotss6/SdrPPByeJE3Gb0fEvcKAZbV+ay4Qn35+TPTb8NkQckP80dsEGCCCMrqq31PAA24dB+mtHRFmkaWwgTyLYEJLYk471sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658179; c=relaxed/simple;
	bh=PvDFEE4pldzNMJVI/3qnZNeeXQmAT5KwifJDwZVUP7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kehiUmtrgmSFjEKR6bfWxH6ACBXVnMEhhIud7J5BQYVRX2S7J9Nkz4/fXteOWkTX/Ss7jMa63m5KDmJtzEkWsDgQdgGxDHQ7Q2RNGPY4B2tkMS81HeeXihwN06hGI4Ju30JcPEssDLYIFj9coG35CSviSBxncsA8K8sAOArnXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=M2v/eDPy; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="M2v/eDPy"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad1e8e2ad6bso75714366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 15:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746658175; x=1747262975; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u7YUzks35rR75q6xrog819ITBOZWiyWDzRcGbuvS5Ys=;
        b=M2v/eDPyPR/DicxWmC7aqRxsja0zUyRkJm3piBFx/aevzUsQppjuGxwa9oU/d5oo9i
         b/idagCWcZuRC5GI0ykQLJTTaspI/QTEwku0cM00VAnB9890z9t2uPZ2sQtEzQv3b2Bw
         DZQKWqx36QDhGgvMqatTOU+oFdtKthe48UZ88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658175; x=1747262975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7YUzks35rR75q6xrog819ITBOZWiyWDzRcGbuvS5Ys=;
        b=ngjgqZHwJXKPuGS3fMo/EYqF7J9derm3F5bUOVAbU2ozuVeiTV/zYiGuM7/wIzv1Kg
         wbN/0WH+BOSXyxwW8JyUpnGxkZgScPH83UGfWB7nWVbL41o2MWB6CDuAlcwqgZKSsftJ
         8HjvUcZLbReVWp9hKym6BPeb68jcScb6136VRGWgS+5IEGaxdbhWC1ixlY8Wwjz/+vmt
         LEuX35ppwgS6HpT6s0dxo9TUQ05YJemli+lGP+wdtDsKIuJzBHR5AMUzNEvhUaijj+pH
         zXAfbYzaGyw9owUhY8aw6FRixj0G+Njrr008X3ZGlHuf2Z++rZWKqWgNVE0Gav5HVwfh
         5ejw==
X-Forwarded-Encrypted: i=1; AJvYcCXuLNeJy2UUYq9uyVqkMzMhZHZXAIKP2uvMcX9gRIx6DQ3eBWIXlJNAcE/fjbZu5IAWrOFhWqRLYt8VmXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDGptXP5D2GwvVFwo7jr9C7ckUgeyqhr4q0Ng+cC+qMJo0wXdU
	T+dFbRSz96WDXzEDaLcm6f6IG/yalbHY173YPrxZPMWyp7fom3mJtML0udOiMXLibutAHjSWGJ7
	tEK4=
X-Gm-Gg: ASbGnctVRfBY/Tn8nWU+WX4eYVssJSwiWl9yv0fMMDydehnKAInPHmwvJQr0jE56fsu
	nwebJb3GJWIrXsEl8LN+TE4JunERXP1lDidskQBrdq7AfzKIUwxYGe4H5MTQH2kZidj8LQ8aQHY
	LEkNY/b26ag5QLtr2suN1Y48Il+NL2KZ6W8PYIyeiFYQaEIiQuFBVNEH8KXCWawpevU7I68JmEn
	3NvhkRkgTcJUTqui6KX//Wph23s7Txmh2VmTx0QYzD1k3LF+eGYbbdvWf0ppAtBFpjSwGEM+eOe
	HsJ2hiMMR6s3ENir/vAH0Sk0qhBLN06A73MqsJ6UcBCj6xjGA7yYgYpRJG+CFUUksIw8psssaVb
	v0PXSM720wO96NoQ=
X-Google-Smtp-Source: AGHT+IH/K5MqpT91gWIPjuigAe96oaN8JYZS4rwBmTBA7KY0TB6gFKKYerQ7e3xBNzZFb5gkul4aBA==
X-Received: by 2002:a17:907:1c8e:b0:ac4:76e:cdc1 with SMTP id a640c23a62f3a-ad1e8cace92mr445659966b.21.1746658174832;
        Wed, 07 May 2025 15:49:34 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914733esm973676166b.33.2025.05.07.15.49.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 15:49:33 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5fbee929e56so681570a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 15:49:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEvLQYqhcRuwZm1Owo3FzzXqOOMSV9E/jUYN2Mkwv6R4eiEWAgDce9m11+D1kwcavoPWoywoW1w44UA1M=@vger.kernel.org
X-Received: by 2002:a05:6402:51cb:b0:5fb:a146:8600 with SMTP id
 4fb4d7f45d1cf-5fbe9f46c17mr4622673a12.25.1746658172895; Wed, 07 May 2025
 15:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
 <20250507094449.60885752@fedora.home> <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home> <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk> <20250507153236.5303be86@fedora.home>
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk> <859b32ca-acd5-43fd-0577-a76559ba3a9e@applied-asynchrony.com>
 <aBvZgk4HFakkw_c4@shell.armlinux.org.uk>
In-Reply-To: <aBvZgk4HFakkw_c4@shell.armlinux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 May 2025 15:49:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiuAc-aQn7JCuCc+5w+j=687puyd_TXXbfXOmU8t1C9cQ@mail.gmail.com>
X-Gm-Features: ATxdqUHn2iOL5GJPc8J0WR-WHr68qYXiPYhykRWA16gZ3OPpxUhkY9XMpei6vQ8
Message-ID: <CAHk-=wiuAc-aQn7JCuCc+5w+j=687puyd_TXXbfXOmU8t1C9cQ@mail.gmail.com>
Subject: Re: [BUG] Stuck key syndrome
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Woojung Huh <woojung.huh@microchip.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 15:07, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> So it's interesting that Finn's system is AMD vs mine which have
> both been Intel based systems, and we seem to have exactly the same
> problem. Is it possible that both are using the same firmware for
> emulating an i8042?

Might be a BIOS vendor issue.

> Also what seems to be interesting is that it afflicts specific keys.
> On my old HP Pavilion, it was always Ctrl-F3 which would get stuck
> down (which I use to switch to virtual desktop 3 which has my Konsoles
> on.) In this case, pressing all of ctrl-shift-alt would clear it.

So multiple keys being pressed at once can result in confusion
depending on how the keyboard matrix is set up, and pressing multiple
keys then causes ghost reports.

Usually it requires three keys to be pressed simultaneously - and some
really cheap underlying hardware without some basic N-key rollover
protection.

But who knows what can confuse the firmware.

And honestly, it might also be a timing issue. So when you switch
virtual desktops, you end up doing more CPU work, changing timings,
and messing something up in the firmware in the process.

For example, I wouldn't expect firmware to be great about SMP. So
while the i8042 driver serializes everything with i8042_lock, who
knows *where* the firmware runs.

Maybe we could do something like tie irq1 (keyboard) and irq12 ("aux",
aka mouse) to the boot CPU in the hopes that there's less chance of
confusing some firmware that way.

I have no idea what Windows does, and - as usual - that's the case
that gets almost all the testing from vendors.

> What also crosses my mind is that if the i8042 is now emulated by
> firmware, is there a replacement interface that the kernel should
> instead be using?

I don't think there is any documentation - or necessarily commonality
- for the low-level hardware. I would guess that it's probably some
small i2c controller that ends up doing some keypad matrix thing. That
i2c thing *may* do native HID, but it might easily also be just some
custom GPIO expander thing.

I think the touchpad is usually some i2c device, and it is sometimes
accessible both ways. And there's a long history of keyboard problems
when the touchpad is looked at just the wrong way, so those things
most definitely can interact (because the firmware emulation emulates
both).

It's very hard to find hardware information at that level these days.
It's been decades since things like the keyboard matrix was documented
as such....

                  Linus
