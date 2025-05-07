Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB912213E81
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629186; cv=none; b=YvA5ItfifhYnTvCZiPW6zk9YMWCLeH7lFLol6qyFKUJHbCLTxw9zs86NJj1FdyavrvZwnrXl5V99hZQwmeP1+csDyhzkWPoseZt5a83SMPhouT3mF19rSyZ0uV7u5jdtGWN4zkGzr1os3IEIsrptTtlUw6hOXa4hljKwpCH1OQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629186; c=relaxed/simple;
	bh=k4A+WKVjlKLkBr796A5ZlJVeqnQawkqB30yX4FRlJqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiE5SNX0cm4dtSoOHXV/V/XDic2o+kOUXTo+HNmlCrz62MziOY6IIKe6tZ9cmwrHcKpqgqOo9YbQsNI9xDjGJvMAjX8jtgDfGSpbtaMCBg/tQbeQMDZJ+fyN/Iu4BVbbd/59LF3J2X/2e/mZdpIHvVkmlK91Ea3r7dNsLQY0Iy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=G5d1RD5p; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="G5d1RD5p"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso4968840a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746629182; x=1747233982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g2bMcU6pv7MMr64dYZxULRwXd0JLY8iiMOetVMeWmzs=;
        b=G5d1RD5pbDeBm7PHzhiuSfYGJwGYxbpQbrUTVR7wFbWw/uB6ifG/Ei1TE/uhVuR4yq
         K+NpTfHutZUZEWwReKHpXbNWYtJ8ZtgPMf0AmMoCGtY5r/bmbbNn/U9w33YxsYClI7tK
         GCz6MR23qX2V+1pO8K67oXJU4vjfn3CDXHKQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746629182; x=1747233982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2bMcU6pv7MMr64dYZxULRwXd0JLY8iiMOetVMeWmzs=;
        b=JrwZyJHmIKI6pgeIHOFkDDOZLxSA5mgz5HYawmLTELGomIwjuw8Ll3HfnnZ8AK3iFv
         Um3v7cOZkQIp5pjBZYpNBtYpuSN3Ko2hsdnm14Z1mRW6iFdxXi2U1lylKi1lNKSddqvw
         SBNIKuMJio5+7eImeYC8MQdPYmEel5FloPRy/orpwpzz5ju6g8QtRXeogw1NNeRoi7XM
         shssR6PSqWZZdrLXO7k0l9VkKDEdhxW419hDlPFGxmARgn/WyjX6ccpCHRMMiRCUmRN5
         Ln7RmW0nxpQfxDTvf+jluHK30qO/jfnvqe4/hTG1Xhzbm2moI4TTGIxtSOoz+//sX1sy
         bqvw==
X-Forwarded-Encrypted: i=1; AJvYcCXeSIKqYUiaUeS0ZI4HApFJ+3Y+Fhe1Or8GyqWG8KHSnUL7/Nce3qsX6WnoFxQyIgkZFUb8F8paW0NVp30=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzJsUtpmSm+aNBfgjRh0rb5gLJvaPH8+lxb/vdvDSzJc2Huvhh
	OI2uDS8UjEg/7InHU5vsXwURavPlgE8WweMMpfa6tYhXIuqCJhBb16r1vetQFHUFyurA/M726l4
	M9c0=
X-Gm-Gg: ASbGncsLK1n/t4Jjm2UMsTvLb/mQ8i2aAZ57aALhRBTcLevXpPoOyyQTLeJB8FNp5h7
	bQeZ6MwqXzmtw9YY/BVWfbCBzMmktMCgQUr4sURtypZn6LRDhmWbIlNfBpOv7Z3DsBG7E3T9g/c
	Z6UUr3d3vT1cJIaKMSZMtzkiYT/mLNTkoJLmSFecBpAIRksS8HW6FEZeJh7jgKiZYxv45d/orWa
	3o8mZ0qFzo1plYLtDkpkY0inhBTsHoQ6ne1vK09Rjaka7OQGVq/b6MP3zrtIgm83ZlZovV36m3n
	3Hm9/zahJHe3S50ZadzaDb2rF5YYJqHUKctx9J5pCWCmHpr9rWrQg2DXmIHNAfG0BdgLr1Zwe0G
	70FafmloXaXwZ19Q=
X-Google-Smtp-Source: AGHT+IEcDzpUCTP7OwS9DLDyu7ZbbifobdjC61eaRGRljEVYNPM0NAjX1eQAsAqQEdQFKM77CAfDIA==
X-Received: by 2002:a05:6402:1e94:b0:5f4:d605:7f5c with SMTP id 4fb4d7f45d1cf-5fbe9f46bf5mr3140785a12.22.1746629181930;
        Wed, 07 May 2025 07:46:21 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faa42f65dfsm8485229a12.38.2025.05.07.07.46.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 07:46:20 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5fab81d6677so4992756a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:46:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXd5po1QzYsBBZbGMjWxMfEVOMJxPa/w74oYHkulXa8hpvjwaPc34RlC50t3CfDa2lRaZiJdcV3ZOSDRms=@vger.kernel.org
X-Received: by 2002:a05:6402:13d3:b0:5dc:7725:a0c7 with SMTP id
 4fb4d7f45d1cf-5fbe9d8e4edmr3269182a12.3.1746629180115; Wed, 07 May 2025
 07:46:20 -0700 (PDT)
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
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk> <20250507135126.7d34d18f@fedora.home>
In-Reply-To: <20250507135126.7d34d18f@fedora.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 May 2025 07:46:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipkOP939yPWroH_u+CQGsJQRSa_BHsg4cLNPRPq86sAQ@mail.gmail.com>
X-Gm-Features: ATxdqUHqKH7jIA0FPsMKHdgnwYnSCzHeIXsbBOW5JTZ-BTyfnAbDNPcwl30lM2o
Message-ID: <CAHk-=wipkOP939yPWroH_u+CQGsJQRSa_BHsg4cLNPRPq86sAQ@mail.gmail.com>
Subject: Re: [BUG] Stuck key syndrome (was: Re: [PATCH net-next v2] net: dsa:
 microchip: Add SGMII port support to KSZ9477 switch)
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Woojung Huh <woojung.huh@microchip.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 04:51, Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> So, same as you, it'll take a long time for me to say with some amount
> of certainty that 'i8042_unlock=1' has a beneficial effect, of
> course unless I see the problem happen again in the meantime.

Christ. You'd expect that any i8042 issues had been fixed long ago,
but the problem is that the chip doesn't necessarily even exist in
modern platforms, and everybody just fakes it.

So the platform presumably still has hardware support for it, but it's
mostly in the form of "take a trap when accessing the legacy keyboard
ports, and fake it in firmware".

Although it doesn't help that there are literally decades of clone
chips and hacky real hardware that extended on the i8042 in various
more-or-less compatible ways.

Which makes all of these things almost entirely undebuggable.

I'm surprised the XPS9510 would be particularly troublesome - I've had
an XPS for years (older version, obviously) with no issues outside of
WiFi sometimes acting up. But random firmware...

I doubt it's "keylock active", but who knows. I get that on my xps
too, it's a random bit that doesn't really mean much. But - because of
all the reasons above - who knows...

One typical problem has been "the interrupt line is wired oddly", but
the fact that it apparently works *most* of the time means that that
is unlikely to be the issue here.

              Linus
