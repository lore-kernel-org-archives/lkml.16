Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDEB2BDC3E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749751056; cv=none; b=gseQjw893CkwgJBXNcO6q1rndECSbbgSe00kve+a4mTWOcfSmLsvGcE59bH/bomVa00J1P81vYLOaZTybJqc2xTRVi+JzLwJsszHuGQhI+QC5/QTdRvHEpN5ltDVP+KiSs0qt8jTB0U4bWpCUx/m6cgR0WaaHWTKsQffJxxHMOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749751056; c=relaxed/simple;
	bh=2rzP5TUm+JRajWqIjslt5tlZ6hdbAA9qvgRYJFTZ5zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olhNMuU/hD44Fpf5OKvFXHI1Hgix/SIdd4yLSad85jVuzz9KL6lBIcyqGr3DZD4ht2XboP0P4eRQHIrx363/eq48xO/LF7kdtXVvv8hQETtR8u7E18ENv1TCrCTtJGTK3zCaafkGA7gfcOBXXppBYihe6KHZolW6yAkfiHeE3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wzuh/NUK; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wzuh/NUK"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-87ec6f5e7c9so390803241.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749751054; x=1750355854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AiuSztYKPKbeGeOfe2jiG+1OuDsuMpjn4U/nAD/7gA=;
        b=wzuh/NUK2O8K3fVPoGZArTyf3mXAVIS1huw14nf86GZHcPLKEMJrJj1AgrLowP98W+
         ymKoULu/8n+gU2EIHc6jVhJjYECU7ZRbxCng4x3bmfb2CFWaVLDfyCOOhJugLHilFMa5
         JevjYjyWD8EXWnUCC4b+xku8vGJCHK3TeUTLF4s3yHB1Hl24vr4Jez+6ojBNgLRRrKsc
         4Q1xUtnsJnRDr4dw49iyZhIxfgGwmzrfWfJ3ULDmtM0/DMNIal2VQRlllVIL3LkAOOyt
         BrRc27riN1IfnwBRCIayUONPfRFPEpTVtUQoSkq2xQZszEPkfTHTitXBunsanA/yK2Sn
         tJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749751054; x=1750355854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AiuSztYKPKbeGeOfe2jiG+1OuDsuMpjn4U/nAD/7gA=;
        b=QrcWkInp02LlmUHJCqGxMHQJKa8JGzuNZ4g7LFeUTejM539cjR02Ek1diz9x52o1aJ
         Fy4WY/IFwcDQDSaMbjfDU1inrYfZSC9MGGpenW/gJfa6EYJt1DXgrOc01oQlgfvZJHQx
         smyZB92/e0IV6HMjVhiI8dvrh4e0T2FIUK7/6ac8cPYkaNfa6UZ4KZzPd5uvI+oV+Ina
         pknP8bkVTKCqGDUd4thw59lEcTHSxvl7mqMcZ1CtPE5nha+1+0p77ffFqKX6tYwcEydy
         DrXAhcbG0RHcLlqTTHDEwHaRW01Ktp3oYWbmeimYF/vctR7MmUQqZOiSY8pxlhdhvA8C
         iGWw==
X-Forwarded-Encrypted: i=1; AJvYcCXN2WLXIfqOLLb9X6IjhLTMrQIxO4FE56uvyjum7aOQ4GQ4PQTFxDn1KAx+hoLRQlgZsH5MSdufEDIS+lU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ11cVZ8Wi8E4wciyOMNGJETItpVKmhOn5qWHmTG/dJzgfAKFy
	WW1JudHurMeT90JFTLDaXqhDBh/LaxJIV+Y4aBlDUbSCm1bW/A+xVWk0xNjSaQn7erKerA26tyo
	1va5xMs+Qd6WsncqEEwqARNNHKGcQ9VutkuApY5kZ
X-Gm-Gg: ASbGncvVelB/AWo0xVo5WDwsrP5Ro6SgoR4R4X+DGxhodBo9QYQT6w7tQ0EQtzMZ32h
	kRpvUjBlEaWIgnenh7OCQXgf1Xx3pIy5K01UwJtRDbO/7mbn0bpbxWxEoSmtdDt7Ol/P0P16YzN
	VccEr25IDs3QiTOLXswdAIxLfp88sGJ53PvFS0xMf+SQ==
X-Google-Smtp-Source: AGHT+IGaZUcnCXH+Qe2tMTpBabktqR9W4dWoxFOP0XwT8IwfEVxYQB/9HmvU+nw4/P7dOGGa6Gr7c31sLFSHQtYQGoI=
X-Received: by 2002:a05:6102:c0a:b0:4e6:ddd0:96ea with SMTP id
 ada2fe7eead31-4e7e0fb7879mr1011979137.10.1749751053421; Thu, 12 Jun 2025
 10:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cb354fd2-bece-42ef-9213-de7512e80912@linux.dev>
 <20250610183459.3395328-1-sean.anderson@linux.dev> <CAGETcx-koKBvSXTHChYYF-qSU-r1cBUbLghJZcqtJOGQZjn3BA@mail.gmail.com>
 <a52c513c-ff93-4767-a370-3f7c562df7bd@linux.dev> <2025061147-squishier-oversleep-80cd@gregkh>
 <7d6d8789-e10b-4b06-aa99-5c1a1bdd3b4c@linux.dev>
In-Reply-To: <7d6d8789-e10b-4b06-aa99-5c1a1bdd3b4c@linux.dev>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 12 Jun 2025 10:56:55 -0700
X-Gm-Features: AX0GCFu73POcL4_l4HfI9KMdwt9R050XRJyR3Nu3cTV3q1xTTJqKgvrWmdSnY44
Message-ID: <CAGETcx9E5DB4UtdjjAO2=XfTNXdXocj7uk0JkVZ8hf9YadwNcA@mail.gmail.com>
Subject: Re: [PATCH] driver core: Prevent deferred probe loops
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 8:53=E2=80=AFAM Sean Anderson <sean.anderson@linux.=
dev> wrote:
>
> On 6/11/25 08:23, Greg Kroah-Hartman wrote:
> > On Tue, Jun 10, 2025 at 07:44:27PM -0400, Sean Anderson wrote:
> >> On 6/10/25 19:32, Saravana Kannan wrote:
> >> > On Tue, Jun 10, 2025 at 11:35=E2=80=AFAM Sean Anderson <sean.anderso=
n@linux.dev> wrote:
> >> >>
> >> >> A deferred probe loop can occur when a device returns EPROBE_DEFER =
after
> >> >> registering a bus with children:
> >> >
> >> > This is a broken driver. A parent device shouldn't register child
> >> > devices unless it is fully read itself. It's not logical to say the
> >> > child devices are available, if the parent itself isn't fully ready.
> >> > So, adding child devices/the bus should be the last thing done in th=
e
> >> > parent's probe function.
> >> >
> >> > I know there are odd exceptions where the parent depends on the chil=
d,
> >> > so they might add the child a bit earlier in the probe
> >>
> >> This is exactly the case here. So the bus probing cannot happen any
> >> later than it already does.
> >
> > Please fix the driver not to do this.
>
> How? The driver needs the PCS to work. And the PCS can live on the MDIO
> bus.

Obviously I don't know the full details, but you could implement it as
MFD. So the bus part would not get removed even if the PCS fails to
probe. Then the PCS can probe when whatever it needs ends up probing.

>
> >> > but in those cases, the parent's probe should still do all the check=
s
> >> > ahead of time.
> >>
> >> Such as what? How is the parent going to know the resource is missing
> >> without checking for it?
> >>
> >> > Can you be more specific about the actual failure you are seeing?
> >>
> >> MAC is looking for a PCS that's on its internal MDIO bus, but that PCS=
's
> >> driver isn't loaded. The PCS has to be loaded at probe time because
> >> phylink_create needs it, and phylink is necessary to register the
> >> netdev. The latter situation is not ideal, but it would be quite a bit
> >> of work to untangle.

I meant, point to a specific device in a DT and the driver. Provide
logs of the failure if possible, etc. Tell me which device is failing
and why, etc. That way, I can take a closer look or give you other
suggestions.

-Saravana

> >
> > Please untangle, don't put stuff in the driver core for broken
> > subsystems.  That is just pushing the maintaince of this from the drive=
r
> > authors to the driver core maintainers for the next 20+ years :(
>
> What makes it broken? The "mess" has already been made in netdev. The dri=
ver
> authors have already pushed it off onto phylink.
>
> And by "quite a bit of work to untangle" I mean the PCS affects settings
> (ethtool ksettings, MII IOCTL) that are exposed to userspace as soon as
> the netdev is registered. So we cannot move to a "delayed" lookup
> without breaking reading/modifying the settings. We could of course fake
> it, but what happens when e.g. userspace looks at the settings and
> breaks because we are not reporting the right capabilities (which would
> have been reported in the past)?
>
> --Sean
