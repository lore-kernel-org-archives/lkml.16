Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168A6297B83
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308567; cv=none; b=ddaI5C0mJV2uriMDodBkvWQJKEYHj+i6+/9cbGpvNay9zxI4SiaV8AbGJtq0TkJKI4CXfjPYMeVwilSyX6oEBB83yCcu+N88UV98ut6OHS2XHy4EtC5tinX8ap0/OII4SE3Y7VD723LuxBJ7OahqsMbBGwGAEr3U+pdXRHI9N6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308567; c=relaxed/simple;
	bh=3oRgJw3evCQ0RL3v3GCElsf+gGhnQ22AKjk2UoQk2F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mz3u1ynvjTuAKhYvpUX1GvJnlwD1zzVFC9LevhmYLxX9JGOzen/kGbT3E0lGefhKB6Xqz/xP9iqTEltaJq7RYQw3nd0xXX0ZiLtDdy5FgUsVZg0Cc++QFT+KH0jkrOG1p3DMik7gkAmXJqPwf7WCtYKbO0IbAGxkO/ZDmvcioaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ICsdN3L3; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ICsdN3L3"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso6472a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747308564; x=1747913364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzRBye7mYNx2WfqoxFyVvS6OH01y5FZb2FkpmaNP4/E=;
        b=ICsdN3L3vgZ4XBd1fV90DXkG1EkHqxBmcYAW+izEluvrVTnFv7iYtSsnda1pjjv3zl
         uP59dWV3+CGq4DJ0vTyrw0D7bhhroXoO6+DJoqY4g1/kFfwCHvMdNTUyQhNs9RWPJv4I
         h6JI+LzPsnxh76zCDRa3zDGbQZ7Kz6W0QQ/zdSlZ3I/YQ8xo35pRk9ICk4YDVpEZjDaC
         zGQOdeVxyzaqgcSCCEMVRLOi9Z4kowLHU5JQmiT/NP/dBYam6Ccg6kNKQvNj1Hfowm+Q
         4uvs5QpiTI0cINTxx+GD/vOf74srAdJzg5cVNKLE//FtHJaKOmBtkAgCp2eMHLAlPwz/
         GoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308564; x=1747913364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzRBye7mYNx2WfqoxFyVvS6OH01y5FZb2FkpmaNP4/E=;
        b=mt22QrYdSYAYA/s8av3UcDEB5pxPOhqaYjqp3TD/3fa2LTUy9RFtVn1WnQodICRIMS
         HGFx1pqKR1P14wra/GmoxDdhoxw0gpgsY3tOEnFZPpkQ/j0NQbo7ue227mPj2UVaJK7x
         8wdFgIHNQWTzgHb1DfXCoxZEzVtw3YEOC+GTm4Vnl39zjX8IlP6gRHNydSCsPXnwAsve
         C1xadNee7zTkqihq6OQ37vh+nXP0WGjiRamtri94wIZ3acNTHgSJlx3DnxYGiEptw24A
         OnLGH3zCFw+vN244qKH2kAd+h6jC/xQ9t8j9Y/Viv7Tk0XK8jA4orKlK2d+uyBBJgGqp
         ZwWw==
X-Forwarded-Encrypted: i=1; AJvYcCVru/JreADVt2aHqPtdd6W0YVhnkavfVvi2h4l9bTRz7VPAxh48UApFM58ufC5TEBGlKXTGbXVyk+I5yD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN1VCNe6SmkHgvDtoLaWbkw9vvZ6cWJGCIxmHysPN+vSzo/3NJ
	nfj9KZz25ekyk980SycGnyAzzbLzuIlLjfROY7sEDPTunFQu4VYoKk7fDPySv/ANdlMcEzdjay6
	v226D2zWLEq+JywQtROccUF5n+fUMX0pqscPe+ET2
X-Gm-Gg: ASbGncsUK/MdKNFA3zeejYpFchVFL1k/7zy48/uGOzan4hacSa8YiCNw8PlkSeQgfvz
	1pfghCfU+FzNK8Cpv7DqoOqPD3o6Ud8vJUKJ1Qh7XsJCwCR9o3HrKN7anlHJme+DYniOJboGH3d
	rF5l6tJH9j8bEXVs6dLRWqSplyEc8A9X9/34bHOpzPj0Bjfcoz6oXUosztceCltHy9h3dEexU=
X-Google-Smtp-Source: AGHT+IHVy/ik0Nx/Ftwe5i9orvHk49YRQhzFLLv+FVTpZQYefrx20dw09KlgkolIzPgb71jbGRhF3cI3fChWmszAhVs=
X-Received: by 2002:a50:f69a:0:b0:5fb:eab6:cdb0 with SMTP id
 4fb4d7f45d1cf-5ffc9db061dmr101970a12.4.1747308564180; Thu, 15 May 2025
 04:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416144917.16822-1-guanyulin@google.com> <20250416144917.16822-4-guanyulin@google.com>
 <2025042518-shoplift-garnish-3a69@gregkh>
In-Reply-To: <2025042518-shoplift-garnish-3a69@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 15 May 2025 19:28:00 +0800
X-Gm-Features: AX0GCFsv2GU_vLXxmUUrchnxLmrX8mWeu2FTRQWhqt42cQtyn9lmqGje1gCTT-Y
Message-ID: <CAOuDEK3k6Xnev_QUihv+XDMd4YDY5fz+6U7qewo=DSyE7duf_w@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] xhci: sideband: add api to trace sideband usage
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu, sumit.garg@kernel.org, 
	gargaditya08@live.com, kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, 
	quic_zijuhu@quicinc.com, andriy.shevchenko@linux.intel.com, 
	ben@decadent.org.uk, broonie@kernel.org, quic_wcheng@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 7:14=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 16, 2025 at 02:43:03PM +0000, Guan-Yu Lin wrote:
> > +bool xhci_sideband_check(struct usb_hcd *hcd)
> > +{
> > +     struct usb_device *udev =3D hcd->self.root_hub;
> > +     bool active;
> > +
> > +     device_lock(&udev->dev);
> > +     active =3D usb_offload_check(udev);
> > +     device_unlock(&udev->dev);
> > +
> > +     return active;
>
> What happens if the value changes right after reading it?  What are you
> going to do with the value?
>

Currently xhci_sideband_check() is only called when the xhci platform
device is going to suspend. Given that the usb devices should be
either already suspended or being marked as "offload_at_suspend" right
now, it should be safe if we ensure that "offload_usage" doesn't
change at this moment. Let me update
usb_offload_get()/usb_offload_put() to achieve this.

> >
> > +     udev =3D sb->vdev->udev;
> > +     device_lock(&udev->dev);
> > +     ret =3D usb_offload_get(udev);
> > +     device_unlock(&udev->dev);
>
> A "raw" call to device_lock/unlock feels rough, and harsh, why doesn't
> the function do that itself?
>
> thanks,
>
> greg k-h

The design is to align with usb_offload_put(). For usb_offload_put(), we
don't need to lock the device when the device state is
USB_STATE_NOTATTACHED. Hence, we put the device_lock()/device_unlock()
outside of usb_offload_get()/usb_offload_put(). Let me also change the
functions to usb_lock_device()/usb_unlock_device() for better coding
style.

Regards,
Guan-Yu
