Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC6A26AEC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750131108; cv=none; b=na8/jdQuuAmZfCgLRXal4se6ptUMNYPIynUS9KDeuWYBXUknECBLqpDlEBRz89wkpSieaB+pr0Q41pY0eNqkfzNvb05g9LQmGNDu1ublldQP8Rim0mt/5CuiqZIDVY1A5nkyJijvrXKLFGOMs5tV/7xo93nkElCgfnOhmyU1E/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750131108; c=relaxed/simple;
	bh=ieph6lxJ3Hbp+Rp377DeV7BoLQycTf5gx8twwmnu68g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHTBdvKdL7aS/YldEee91LvXx+US8yWOPM/tsacBIfPZEMWDkfFluoJBFTu1rz3ESD8OcxH3pIsYyDRDFbjeJGzJlfd12p4KjA28+AEcIj95i7G3XgU5o4nm83Q6kw4WLxrnvimJ1HkT4a8ysodfO2lwLmCnl/s2RXv3QQumjYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dVsMuar8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dVsMuar8"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553a5f2d321so4852e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750131104; x=1750735904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwhOByNmuLKBhb5Mlg+5pTuchaKObMpIf2JB0S1ADBY=;
        b=dVsMuar8yrm/G2igr5QLyMut8oumHNdvZ+caLjegkbHueNVglAbTmx5qO6NH/MjyPL
         l2Egjfts32ZxPXFcETD1Cq3swij9aywwkQmjoE0Ji8c49tovTcApwBMYxFKuFcEsKP5R
         ObOcnqpDNRkD6iY48hVioCOb34EEr/E6t8zJK9WZkQ2VezXkisLyZZRVRJfuEgBpANQc
         PRZ8JAsuqLzztuXPBhmx/WCP8sxXHx/9GESGEsNSBTNlXIIyhO0ByJ+rRwXly9/NV0ji
         F/M8JKkEV0XMeEypiy6rqZhvfDXokKaGKDql7rK0DTX9iAx5U7+XhA4yrkts9FGXymA9
         WNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750131104; x=1750735904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwhOByNmuLKBhb5Mlg+5pTuchaKObMpIf2JB0S1ADBY=;
        b=D7volUtIOKA5o3/5EiVY0obbko3XKDC+y2lVuynG7fqOpYHyuuQKfszYgQI8mSUZKm
         cG0CCFEYzDnPbJxzJ4I/8XSHsnPrpPil1A4vekrX9mR3bUC2PP7virOJiFHOeSREqwg5
         WxdhXG5GK1R1OUdLossB5eZEK6XoELHYoLFJz8jB5E92U9Xe1RYB7Hkh7yfdboUPXEj0
         jolozp0Gi5FkDjH5L2zEm+18AUGN1h6zjO9L2dPYx4Tx+eXGptJFTW0WnPlzaOl0J7q0
         DogYoy1xQPVNIt6jNUUMdNOup27OJTI5q2cd3ZFQDBhUH/J+kTaw5VoDu+ndFQucGDxu
         69CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxgJkwBLNeI2/ZbXURKsoO81xbJenoKFNlmUKEkMMAwRP3tKfVJ/SiDWQwc9YPyyzGwKceTi/SJ3CaRTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTADpgEhjxACn7ajJjksBrMjklQ+s5j7QIAYXjIkWOJ5W1xubj
	GAMmuBrHOR1iXUrvfPrvyDcu6w7wpmlKLBBL5RipU/R6/UuwgJwY7CUfjs1J0iDhwvgk2Rk+Lw1
	NIBAabkQW6LG9WpLvxaukMwDQtEc5EGiNrTASzII7
X-Gm-Gg: ASbGncuXlUF8rDJ88XRoKTfzxCsMR01vpPYBpgCnINLwdMc6L7WAlUs6VAD1ToMp0Gb
	mUklQh7PbbqP9larVaszE+7NfoLpupwGcUdwYMPyQGp5wYlpT1YP20sylFF14c8aMFil3HlLnr/
	bGslru2gXKh12JQx7s5/xzrs6/oOYx0DUyRQgm9G4zX00sj8ynJdbfZdjhElFtIXfDmZI+e5Q=
X-Google-Smtp-Source: AGHT+IGyuaznBGQp3QUnLGhxV3KnZapR1/Gtg7nZI85N47EBN9ZMHFJ3qlouR/mC0M+rb+Bp7XeJeYNp9yNbpRoZJj4=
X-Received: by 2002:ac2:5deb:0:b0:553:50d2:5c20 with SMTP id
 2adb3069b0e04-553b80b051cmr508080e87.6.1750131103855; Mon, 16 Jun 2025
 20:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616132152.1544096-1-khtsai@google.com> <20250616132152.1544096-2-khtsai@google.com>
 <2025061634-heavily-outrage-603a@gregkh>
In-Reply-To: <2025061634-heavily-outrage-603a@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Tue, 17 Jun 2025 11:31:17 +0800
X-Gm-Features: AX0GCFsjBA1PsPOxoPnvm17MTnEeKtIwkTEYPQhKjxWr5yq-Sg5ZoYFB0zEugGg
Message-ID: <CAKzKK0oB83B3EwX75NTFd55E0qQ=QwNpKv3hUf9Oe3ZF3AAzrQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: u_serial: Fix race condition in TTY wakeup
To: Greg KH <gregkh@linuxfoundation.org>
Cc: prashanth.k@oss.qualcomm.com, hulianqin@vivo.com, 
	krzysztof.kozlowski@linaro.org, mwalle@kernel.org, jirislaby@kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 10:17=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Mon, Jun 16, 2025 at 09:21:47PM +0800, Kuen-Han Tsai wrote:
> > A race condition occurs when gs_start_io() calls either gs_start_rx() o=
r
> > gs_start_tx(), as those functions briefly drop the port_lock for
> > usb_ep_queue(). This allows gs_close() and gserial_disconnect() to clea=
r
> > port.tty and port_usb, respectively.
> >
> > Use the null-safe TTY Port helper function to wake up TTY.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 35f95fd7f234 ("TTY: usb/u_serial, use tty from tty_port")
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
> > Explanation:
> >     CPU1:                            CPU2:
> >     gserial_connect() // lock
> >                                      gs_close() // await lock
> >     gs_start_rx()     // unlock
> >     usb_ep_queue()
> >                                      gs_close() // lock, reset port_tty=
 and unlock
> >     gs_start_rx()     // lock
> >     tty_wakeup()      // dereference
>
> Why isn't this up in the changelog?

Thanks for the suggestion. I'll move this part up in the changelog.

>
> >
> > Stack traces:
> > [   51.494375][  T278] ttyGS1: shutdown
> > [   51.494817][  T269] android_work: sent uevent USB_STATE=3DDISCONNECT=
ED
> > [   52.115792][ T1508] usb: [dm_bind] generic ttyGS1: super speed IN/ep=
1in OUT/ep1out
> > [   52.516288][ T1026] android_work: sent uevent USB_STATE=3DCONNECTED
> > [   52.551667][ T1533] gserial_connect: start ttyGS1
> > [   52.565634][ T1533] [khtsai] enter gs_start_io, ttyGS1, port->port.t=
ty=3D0000000046bd4060
> > [   52.565671][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
> > [   52.591552][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
> > [   52.619901][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
> > [   52.638659][ T1325] [khtsai] gs_close, lock port ttyGS1
> > [   52.656842][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be975=
0a5) ...
> > [   52.683005][ T1325] [khtsai] gs_close, clear ttyGS1
> > [   52.683007][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be975=
0a5) done!
> > [   52.708643][ T1325] [khtsai] gs_close, unlock port ttyGS1
> > [   52.747592][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
> > [   52.747616][ T1533] [khtsai] gs_start_io, ttyGS1, going to call tty_=
wakeup(), port->port.tty=3D0000000000000000
> > [   52.747629][ T1533] Unable to handle kernel NULL pointer dereference=
 at virtual address 00000000000001f8
>
> What is [khtsai] from?
>
> thanks,
>
> greg k-h

I added the "[khtsai]" logs for debugging and left them in the traces
because they clearly reveal the sequence of events that led to the
problem.

Regards,
Kuen-Han
