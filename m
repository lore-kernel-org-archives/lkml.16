Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5227FD6E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335460; cv=none; b=rpDwlTXBbmb3HsGl/Qq8UcKhgonAps+gzXfnOu0GhnC4XyyIS86HUWx4Juyb7JbLqHEzuVgZF0oKmW5UES1wgFdpzFxupzgFNrPINJzu2sbKTmqMwickat7p2uuW9z6RsgdvK5j2JRo/hUq/PkFWguwi6H/eWGJZkDuNjCoHEv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335460; c=relaxed/simple;
	bh=piavZKKVRRRXRJ3oD+/qvHhZf5oizYKW6Z2MeaDahMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIOT3XSJh6sWrHhmVtMfTS47Ay7gjIHue16M7ZpeJljCUeYe38eZ9fsa351OuVGdNjBvjCIg0wNZ6LToPlxekoII9w7wrkp1T9mBit3KagNfCZvY0WwFqYRLdwT5OI/e3x9DVJ7jln6I/zJM3AkNVHNuoiNhJHQbFnyzv7z8P/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BrWqlxq1; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BrWqlxq1"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f549550d96so16724596d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747335457; x=1747940257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/R8law/8/813zo72mA7DI8YflQe+Z614jj/lyvxtZk=;
        b=BrWqlxq1TRl0pPe9dbtZYkhECCcPMoQNYxQ7NPUHFCDi1aRaBZWtz4zAHY2yNiuYwE
         WV99L3q/MGWl9HUzmPHR1tQmmMuc+XLa2qQVH1+QqTYxGG2h9Fn+CfpxVTFyIPUvhE9H
         D+BBQPsC0l2/7cmF3/TeX34ILssISdkgbEPBZ4U2fkpQi/jNeqAEka9USwngwINahX0K
         ZS5pSjZtw0RQ59FMalKCDJQEUycs8fE7p8Y0j8L8WqHj0HLywUy4GWUCCPti0OHd44kE
         kv7aA5vqKt7ghFeDSBALpnMovZlOGCC62D266kmpmuLtd68q2yeER5QrcPc0NIOt+I2t
         a06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335457; x=1747940257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/R8law/8/813zo72mA7DI8YflQe+Z614jj/lyvxtZk=;
        b=P7pY4+ND2ZgeHINGrauwLIe+xrtccKdXjthn84Cf5wqAgx6QsJaoTMjzgB1Bv45aor
         3wMwfxu7YwJ+oKVlDeGKhXcCGC3tPiRTIlfz+MDCKqqaZinFy4KOBjui3IhV7Rb26/3V
         6m1Ltzb62r4LMY9Qz4U9ASLlfVjYUzj0ZuaOtqc4pLye1m6ayI+1WOk7qgmMFKzOAAn5
         g2iclUGeVuPAy0VcUibQdQWxIQXRtxy5myXgeVn/mqDU5xhmyICDknEqLnb/WxxRfZSG
         75AOyaSKZS++tX8SUB9t/8X31k2NMRO5cu6CzsxRYpoDyil3SdqbMdL8Ht9MocrlWrRW
         9JNA==
X-Forwarded-Encrypted: i=1; AJvYcCXeWnrO5/79bXKN1V9cPYMvJTNSGULM8kbUzp7fGNa06BS4B5nDLEVazF1NlNpMklm75vO3siyWYEw3XOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuSd6ksILDXNi916oGgU4OGKCm3Qr3iy8zBt/LrvHDBgooovQE
	N+vv4nfP5ks6+WfzSxDp9laRrm/sQcEWwxb4wv5kfmhFaiiq42aQUWpAezhHlz8w4IY7FwaY6lN
	n7okc/v1TpYMyA8O8DaPp5lcLCJ89TrKbo0jkRCtG
X-Gm-Gg: ASbGnct+EYOZD5QoRAh1cneJZ9imY89DMUur84TZxd6ANgHb16WZFmI/SCz1I2qzPpw
	kZQpD4FCKMMLk00H0GtubzWxKnWXeObaU65YoxNMGmMiNMxajeV6JldT2G5hzOVcISbSCo5gLf4
	YtuyO7NQqK5ARzNZKz2K6OqrjcSlQ4PmAaiAbo4HrMxw==
X-Google-Smtp-Source: AGHT+IGVpeq3eTEggXlc3vf0T5zsSry8bVGdR5Y1sfB50aV8rXY4FCCFvw2rE9KucAvSWLEzhPVFTL50u15lCBvuHqg=
X-Received: by 2002:ad4:5941:0:b0:6f0:e2d4:51fe with SMTP id
 6a1803df08f44-6f8b086e55bmr12999776d6.26.1747335457076; Thu, 15 May 2025
 11:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515040259.1254356-1-royluo@google.com> <2025051557-dismantle-exclude-c437@gregkh>
In-Reply-To: <2025051557-dismantle-exclude-c437@gregkh>
From: Roy Luo <royluo@google.com>
Date: Thu, 15 May 2025 11:57:00 -0700
X-Gm-Features: AX0GCFsBuB9-8JhivPkgRd6RL7eyeHPtkdtsutaRykFSoVwx59LH0yf2ovmPnfU
Message-ID: <CA+zupgwRNNsZumGduPf-s0eCSGzaFvTGVuuzWY1aXOBa3OxRFQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: dwc3: Force full reset on xhci removal
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 12:34=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Thu, May 15, 2025 at 04:02:59AM +0000, Roy Luo wrote:
> > During an xhci host controller reset (via `USBCMD.HCRST`), reading DWC3
> > registers can return zero instead of their actual values. This applies
> > not only to registers within the xhci memory space but also those in
> > the broader DWC3 IP block.
> >
> > By default, the xhci driver doesn't wait for the reset handshake to
> > complete during teardown. This can cause problems when the DWC3 control=
ler
> > is operating as a dual role device and is switching from host to device
> > mode, the invalid register read caused by ongoing HCRST could lead to
> > gadget mode startup failures and unintended register overwrites.
> >
> > To mitigate this, enable xhci-full-reset-on-remove-quirk to ensure that
> > xhci_reset() completes its full reset handshake during xhci removal.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/dwc3/host.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
>
> What commit id does this fix?  Should it also go to stable kernels?  If
> so, how far back?
>
> thanks,
>
> greg k-h

Added Fixes tag and cc stable in v2.

Thanks,
Roy
