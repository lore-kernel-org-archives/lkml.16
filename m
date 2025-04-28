Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEE425D1F0;
	Mon, 28 Apr 2025 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829470; cv=none; b=diRwSCgFlQLsYdz9SCu6dDCbt5deg8XyBfaw7cZCXv9Y93n+ydTYvB4C7y+blJPhO9wD8+gS+7Idoob7yoCbyme7arnYCDNLMlsY0K0Hse+0R9lIOtezxpgUYH+aSn7oWWumvulLW/4fKZoKFJB2mVmuNOMdnOMI7K4PLzKIM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829470; c=relaxed/simple;
	bh=0kLJgngd8OBHnB9bkAEEFHOf3k87BlAdTqH93ssIaow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HoZlCU12FrueBofT3kc/iosYcwiTaYYhoJCGqSzTLIYdFY6OYngxLiSAAPw1ZbjJxFF6NxzSjkk+akR1djbZCgZIZ0wYpxuQyW0+9eqHN9oFSnHd4Ro/iH7R210DdiGifrWV39Ur743oE4Ry6V1R2yK/zaQ3P9XXGBOuLurHTkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so5277756e87.2;
        Mon, 28 Apr 2025 01:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745829465; x=1746434265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ztfMn1VNdd3sBgxsbvmNyvjhCCtBTgEPkzz2bCSzMw=;
        b=xDUl4g5KsAGno7/Xi9PVpXFWAhx4/jzUEY2qqFMp5EKZoXXlJnoFNZ5LuOhZMV2TUf
         myxbaGVsbf8ZU9soKFcrWcehhRiRVyfMfKSQ8/WdWuymXR1qU5UBkgLXXyiRs2HXvQ6X
         N854ByyyBQrYVkb/pl+GQ/2zkxetJoPmfPvoEp8lEBYQGqggg5jp25fvugDOt6LMLiYO
         iIqhEm/uv7aWLi7d9+BLLDIKbE/1rw52PJbqn5fSR986XxJmdrqrFlTL/F8/i//OwcUA
         EPhAb0VmlXwab4ChLtkwN9l/Rx7oOpUbSe0mlUnmHxjhGhc/NvhKczhubPJDW3r2GuBh
         ZMAg==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZO1jo0GzCD5EwCYcgxVv1kjHeqnFt6d9xU5xhVUIJhyNaDEZWUsR5C/UbAqv5+oCXYFv25H9nS8i@vger.kernel.org, AJvYcCW1y+C1+stw8qyVkW5pgmFe6lySNRYRCRQP7y3l+uiNXGYKjtCPNhk64K12XS1izeMZXWO5ceeIdAdCePSg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfe/09NukeWj0M6H56q0F5oMaVrL2AsXL7EBaiDrl9jCIlTYtG
	lDXmQxCPJJlZkKoh2lgipp3IiEZZMMidhqxX9fccbB2mbURwKWuQaZUw/R0W
X-Gm-Gg: ASbGncvIvbaQDvpYT4IYMf7kcdw9sveI0mxhqRywycygRlr3MpDY4TwLHAshTmNeWWH
	wWtP/P3p+RoMNiq962Joc7bT7dxxSU1N+MP0R8a+i733K6jJT9vqAhTf+FhGxOpC/JjoTN0MB0O
	R7knCllKA6Sl21naIIsmaPJEieGHQ/ieAcA4MMlF6elZqyXWIfUsa9GZlc651XF+REAe0lDEgU/
	t4pVLfrsDuvUr/oI9brs/EAAJyDlhmJRPGRuGVWfYgyxE9Dch3Guys9dSXkFmTbJNiXekfZ4fZS
	Wa++E4B+zpovI4LMh7+s+t4/yFwpd+IZJYit8lXCYfubW808or4+/oFsQyfN+x+MmWbagIxBTw=
	=
X-Google-Smtp-Source: AGHT+IFGk1CDfCRj/uFHPQZuVvqOBdytVA3yZg418ITL4VBPm6XEGCmdolILhkHHD+VF36LH+OaYZQ==
X-Received: by 2002:ac2:4e11:0:b0:54a:cc04:ea24 with SMTP id 2adb3069b0e04-54e8cc0e6afmr3350571e87.46.1745829464962;
        Mon, 28 Apr 2025 01:37:44 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb83b5sm1622229e87.245.2025.04.28.01.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 01:37:44 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-31062172698so47265371fa.0;
        Mon, 28 Apr 2025 01:37:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUy5nbDl0EYM6/al4YUlNn2igIY0t2w78YfbyoaCBGwZJI+imo9bPIHq5VeT7yV6lD43ud1DUrLNQS5dMcw@vger.kernel.org, AJvYcCX2juqirtQvXgOmN6+aC4u3GLIJRbU21sinjUkRZKmDsz+LVEllKqR7RZ4swvqIFxlLh/joF2kPOQdl@vger.kernel.org
X-Received: by 2002:a2e:bc22:0:b0:30b:9813:b002 with SMTP id
 38308e7fff4ca-31907611d07mr36339461fa.30.1745829463977; Mon, 28 Apr 2025
 01:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
 <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com> <aA8tsao6hhW50k4e@probook>
In-Reply-To: <aA8tsao6hhW50k4e@probook>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Apr 2025 16:37:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Trz_Dtp5_ME3MnfwBjtp=DwPN4aJ1vrtizgiUn08_3w@mail.gmail.com>
X-Gm-Features: ATxdqUGWc3W8r_9HVJ8EOFRWh1ggm3Yd1EhRVjGqxp6FjjlbklMvKQE6GcEe8I0
Message-ID: <CAGb2v67Trz_Dtp5_ME3MnfwBjtp=DwPN4aJ1vrtizgiUn08_3w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: allwinner: orangepi-zero: Enable audio codec
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 3:26=E2=80=AFPM J. Neusch=C3=A4fer <j.ne@posteo.net=
> wrote:
>
> On Sun, Apr 27, 2025 at 01:28:58PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Apr 18, 2025 at 7:32=E2=80=AFAM J. Neusch=C3=A4fer via B4 Relay
> > <devnull+j.ne.posteo.net@kernel.org> wrote:
> > >
> > > From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
> > >
> > > Line out playback and microphone capture work, after enabling the
> > > corresponding ALSA controls. Tested with the Orange Pi Zero interface
> > > board, which is a (mostly) passive adapter from the 13-pin header to
> > > standard connectors (2x USB A, 1x Audio/Video output, 1x built-in
> > > microphone).
> > >
> > >   https://orangepi.com/index.php?route=3Dproduct/product&product_id=
=3D871
> >
> > What about the USB ports?
>
> Good point, I could test these. I have not mentioned them because they
> are not related to audio.
>
> > In any case, we don't enable peripherals on "headers" by default. That'=
s
> > up to the end user. The description for the whole adapter board could b=
e
> > an overlay that users can then apply directly.
>
> For features such as pinmuxed UARTs (already present and disabled in the
> dts), I fully agree, because they could as well be used as GPIO, and
> that's for the user to decide.
>
> For the audio pins, there's nothing else one can do with them, as far as
> I understand it. It is possible to use at the least the Line Out pins
> with very minimal setup, e.g. just connecting the pins to headphones or
> something else.

Sure, but you are also adding the routing information, which could be
different if someone designs a different adapter board. One could
include GPIOs and I2C from the 26-pin header, and make a headset
adapter (mic on the TRRS instead of tv-out) with a headphone amp
and headset detection IC.

It's easily overridable, and I suppose providing the basic use-case
that one can directly use via the pins does have value. Instead of
doing a lot of editing, the user can just toggle the status via
the bootloader.

> I'll clarify the following points in a comment in the next version:
>
>  - The audio signals are exposed on the 1x13 header described in
>    https://linux-sunxi.org/Xunlong_Orange_Pi_Zero
>
>  - The pins can't be used for anything else according to section
>    3.1. Pin Characteristics of the Allwinner H3 Datasheet.
>
> Although I would prefer to enable the audio pins by default (because
> they are present on the Orange Pi Zero board), I would also be ok with
> adding them as status =3D "disabled", as is the case with uart1 and uart2=
.
> Please let me know your opinion.

I think it's better to have them disabled by default. We don't want to
confuse users that don't have the adapter board, who might end up looking
at their audio mixer and wondering where the line out is.

If they have the adapter, or they are explicitly using wires to hook up
things, then they can toggle the status. If they have something else,
then they load whatever overlay that matches their hardware.


Thanks
ChenYu

> I will test the USB ports and write a devicetree overlay at
> arch/arm/boot/dts/allwinner/orangepi-zero-interface-board.dtso
>
>
> Best regards,
> J. Neusch=C3=A4fer
>
