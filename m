Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0EB8F6B;
	Sat,  7 Jun 2025 02:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749264165; cv=none; b=I5dw2VnhHrq5MOI598Cv6MevzlDKRVILkJ9Xpk1cyYma4BTEAfgXkDQaDqlO0zdBW/8A5hyzhqc6Mar1lcoHGl4c6/3Q3MGL/82JVX72hw5HszMkpM7A5xdE0Nua3Rom5ViYqFkIki7s2dBekuopFu83hUJIP+h5eMMRP9PUZwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749264165; c=relaxed/simple;
	bh=+M82ZTekhCUjokmohH7i3f6ytFDNIEk4TULjD2DLl54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rL0ZLP9T5ej5YeBzMQXOW9Jy/YBmT/JGN+dNCNjEYO3QN+6CTCzWE2dLbofu7frAnBGEC6YT+0A3hBUX+8s5rsvu/ApbPxUzBrRk0qMU7uZOFP2cixLasg0uAjjMXUdN/sxF689p3m5JXs06LXUapy9KWG3IXl5vB1k4xi4U108=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTCQVSZp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTCQVSZp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so23144155e9.3;
        Fri, 06 Jun 2025 19:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749264161; x=1749868961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CefWT92/pn4Htibx0ZcptASfFKnZ0vYyjmoTK16U7Y=;
        b=hTCQVSZpMT8smDgOY5GHIchPabHzgmAZ0YlXPNXg8CCxk6tDBwdjvn/4VdcbQ6qMmp
         aLgyJQAZZ9BCsoEjswQ1fu12DUEA/6Pds6hDLfsxH46MmsdfdkWVdtEJbmGo7WW6K2JN
         pvF3J3s/jxQkYpdsBkY0ZLDf9/anZDcf4IqiwwTXkJ+QuKPyeobmrKoh8zvxyBmEFyCu
         nMCXDYGh7Q/uclFVdHUV2xcWiE2/hjw7xs8YKtNA41EpZYI8kyXDSjwJaz8d6EbzU6Dm
         2H73dQchUADUA9ylomF3qJ/OYwvpjWC54U0Uo+RzElXD3oAi/wUjQsPgw5gE4XxE9+m8
         ZJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749264161; x=1749868961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CefWT92/pn4Htibx0ZcptASfFKnZ0vYyjmoTK16U7Y=;
        b=szp62b+fgZF4Lw7hQmuIaWsw33RH2hocTbwgqMuZ6uvon4OjHuP2Sqsk+07PcWOw8T
         YelTOwmpod74kKaweT4F/ACxWsEyu31LjvDlHn9Vhs06mdVvK7KeRaHojbqnvtMN+aaU
         VskDhcSGuPBu+I+vJu8NxU3hIZg8cuQ8xFjP9TyWDe0ZclmGyU4uU8bOM7bDt6jXGRLr
         SnLa9xxLfUtkFhJ6IEyXtNn0GGgHDf+dHtZG7rXXF/5vWlOpOvZ+KLiiET0e0rFoTVBY
         xVmsWUlzAZKk7onukD2w5UP/i/vt0Hq5XhOtOHiBNdDVmiBiRGT3mANYAbKYnzQ4ASuk
         g94Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/L8uIo0jm9gQAMqJNac0Y9FFo7RHXPqHWbJWSXWNOSoRtQteBHg9L8rPEjlGBv3G9jg58/iQ1CdzVZNiK@vger.kernel.org, AJvYcCVwm+SO1s19d0BkZxuUEf4zBmuWuALvkmchPcx/yoj+utYubJ4+3pPmyZcvyuoWm0wPGeM/P4gXdqM4@vger.kernel.org
X-Gm-Message-State: AOJu0YyZg/Pwy9Vd+IfULFXiGaeu9x2F2e591BsvKowCMUzk6uTicz8R
	6vrBwz6az6oexD4Ii36+yonOkNObXoKnRAhdJjRZgOmJKFbUL0sQ4096NipUusDoOqY1Y77IaLC
	rh5Kxp49tsohlbPD0Chs6tv3/5KbUwmOr2R+1
X-Gm-Gg: ASbGncv5H+dk+rgtIr/8nxaGNbxl/vVmhHONMuB4dkJYIkE3rTBPYcAdN06veIuW+hB
	1+9sZpYxJThaXgjZOdlYyyaTPDQOkHF18OJjYCHyEkGPkN29rohaojeZoo3GNZShU/FvHKX2ah1
	N8eRGhEFROWHeXw7meZiA5K5CNFoAzbPbajORp4veQjNZzdvShIEoGuLDgjuKxN6MyVNBUsoN0z
	w==
X-Google-Smtp-Source: AGHT+IGcEKkjQjtCriThcqw8RLc0+PuS0lf/rMkncpVF4bkgmYsjA2mOt2fM8jKZfdbuxZZdA2tkH6bTKQQT9twpEKA=
X-Received: by 2002:a05:6000:2dc9:b0:3a4:cfbf:519b with SMTP id
 ffacd0b85a97d-3a531ce09e4mr4689955f8f.44.1749264161453; Fri, 06 Jun 2025
 19:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com> <CALWfF7JOJSihtfqrFiZtTxnzvoU6FP3WXuWjYOVaAvjPJZWWgg@mail.gmail.com>
 <CABjd4Yyw5xStJYU5c5snUGpBjEYL8=qoj=bWYLnuzSWzr8shaA@mail.gmail.com> <CABjd4YxfG3WZxRL3ihQLtdVdp_3Hq=TKKrZJktJ_C5i+xCM2Ag@mail.gmail.com>
In-Reply-To: <CABjd4YxfG3WZxRL3ihQLtdVdp_3Hq=TKKrZJktJ_C5i+xCM2Ag@mail.gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Fri, 6 Jun 2025 21:42:29 -0500
X-Gm-Features: AX0GCFsASrqjmeogHKGqU5uJIqowBQVTy5uoU6CN1I531lsTS5iFJUyKloDL55Q
Message-ID: <CALWfF7KS_kGK-RQVfcPMkvo_2PD_w992Z9hka_3=b=Cgnto6Lw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:14=E2=80=AFAM Alexey Charkov <alchark@gmail.com> w=
rote:
>
> On Thu, Jun 5, 2025 at 10:32=E2=80=AFAM Alexey Charkov <alchark@gmail.com=
> wrote:
> >
> > On Thu, Jun 5, 2025 at 6:43=E2=80=AFAM Jimmy Hon <honyuenkwun@gmail.com=
> wrote:
> > >
> > > >
> > > > +&sdio {
> > > > +       bus-width =3D <4>;
> > > > +       cap-sdio-irq;
> > > > +       disable-wp;
> > > > +       keep-power-in-suspend;
> > > > +       mmc-pwrseq =3D <&sdio_pwrseq>;
> > > > +       no-sd;
> > > > +       no-mmc;
> > > > +       non-removable;
> > > > +       sd-uhs-sdr50;
> > > > +       sd-uhs-sdr104;
> > > > +       vmmc-supply =3D <&vcc_3v3_s3>;
> > > > +       vqmmc-supply =3D <&vcc_1v8_s3>;
> > > > +       wakeup-source;
> > > > +       status =3D "okay";
> > > > +};
> > >
> > > When you enable the sdio node on your v1.2 board with the broadcom
> > > chip (using SYN43752), does the btsdio.ko bind to the device and
> > > create an extra rfkill bluetooth node?
> >
> > Good question, I didn't have it enabled in my build:
> >
> > # CONFIG_BT_HCIBTSDIO is not set
> >
> > Let me add it and report back.
>
> So I've rebuilt it with btsdio.ko module enabled. As I boot the
> system, WiFi (via SDIO) and Bluetooth (via UART) drivers get probed
> and load their respective firmwares. btsdio.ko doesn't get
> auto-loaded. If I load it manually after booting, it doesn't bind to
> anything and doesn't create any extra rfkill nodes.
>
> Is there anything else I need to check or look out for?
>
> Best regards,
> Alexey

That should be all you need to check. I guess they stopped incorrectly
advertising SDIO_DEVICE_CLASS for bluetooth.
Jimmy
