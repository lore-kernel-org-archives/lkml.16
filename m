Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0248F288D2
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743350091; cv=none; b=fUKvWrq2tuIdpEBxg7HYblhrslW6//JhtrZ+PFNXql4ewJZ+IUeXGzsnMZGtNBj3EW5nXQ6DoT6h8967G5sjpeGnK55cTX1uq87UGtcNU0sNz9J2DPIL3f4/DJriFWX2dEAMw8TKq3cCoiyeTg3K7Tgt0A7YSiM3lUA64y/vLw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743350091; c=relaxed/simple;
	bh=LWlBEbR0rue8Ii1q14Xo+2oYD69eGDnHnKTJ64e1hK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=c9RUnwqXzqbm4ELCDx259AeBIHTpFnOVVljWheObQicue30m2D4QpOfObZCMAZNDD3+/+4IFUUuAUGg+LCrhal47a9AZ8lTtwYApTCvcMqz5Sb7JzfqmMTpOjRWebGoGSdyaYK7RABqSNMXJWk9pWE8dmMVrR9O2n7xGUUdHMn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVrVv+Db; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVrVv+Db"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6fedefb1c9cso28575077b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 08:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743350089; x=1743954889; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWlBEbR0rue8Ii1q14Xo+2oYD69eGDnHnKTJ64e1hK4=;
        b=mVrVv+Dbc/AVqqWHvYJWDbJcAfqLEXsQTpxTRavo+t6iCaRGvHfi8tkErFAhHlNReA
         vo6bwbEb+hPo/S65ZsMxU0sHn5wDsq5jv1U+jPvITlkZjoocEoup+cinF2BJrfLup4Iy
         WDjzel9gc8l/v95bwlObN2iQ/b9s65HhuoRbsYkBlUPfmKrCVw36c8E68SaTLYoyz1Jl
         PgZLVBvJEEITgT8whgMZXOa4WvOF99sKhSv9iGJVs01ckmVm9GZOMc6NrWrvbqjwTr0q
         Y6+DqePfoP91qwKEa/MigVvCrbWr/35oTdhg3yu1nSX8P1deIw5fU0y8DnpZMaCj0G3Q
         Qkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743350089; x=1743954889;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWlBEbR0rue8Ii1q14Xo+2oYD69eGDnHnKTJ64e1hK4=;
        b=fyQtQVIqDaM0KLm30TlPVpkhGT3NiLWCVUfY/PYbDENLNuSK4O0GVeTbyhNPhF88Hs
         e54WzvM96s+/jYBZCpro5e/E3LlKVVuQRthC/WQ/qtqF75qzY+iUNGy6WotZHpqm3ijH
         v+7g3G0nyfHCLi65eIg2w0xxr3Q5tGtNVHqT2GSTEk+9Reqj4m34x4JSjCx3Xiz7H3JN
         3FYaslCdPdsgQHSHNXj8O9eMmOVGXXbZq3znEehodQg2ROe6t2JIQVGADNonxbmCfwp6
         +HhMIGAZNnvNEd5c6i9joGRrg7cz4roZkCz/GSXrXQdqg9XHtIqWUzoHZyIUFphwxOB2
         TBfA==
X-Forwarded-Encrypted: i=1; AJvYcCX4oiDDrfJNhG2VDcBYtZ9yzKKnNGret+dScAc1ZFDmD3tLDelQldZqXnHSV+D1JPcR6Eu99Yc1aIIzwfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCBH4DW/StFHlsP213Klmxvd/xYaxmpW6K2e5Q7rzDp+KrAF+W
	vj0+Ib8kAa0ZWwcbUfdrs8UlT1qrC7Zcw7i10/sr6//VNZXlTiXmgAmIf17EZF2vhvuZNOHfA9o
	QxpbWtezHoghMQivZhd/hY3g1Mi6DcNEbNOc=
X-Gm-Gg: ASbGncud0bDIc2qsDA1XrZZfIHdb+STk8ybthv7fIPEj1t1YbjoS8NWKg3SdsBtkUcn
	BbY0Cm2UUL7uoV8JNwV4jbUC6rjTpnZft1NMSunFRzOZEd/A+hX4U4ARi5TOZ0L66KD8GtjqdIl
	kb4d9wZzlFWCHxl+ydoLYE2wv6bt+m5dUrDxgHywMa+yNhIDCgSL7nIItQWw==
X-Google-Smtp-Source: AGHT+IE7FllcBCOS13DEOvR7SgnhqNJPiir8vxUb7WDN/BNFMIIEH5Eh4WJF3wKdt8Avs7cCJgfUjWrljkfTV0xik3w=
X-Received: by 2002:a05:690c:6f85:b0:702:4eb0:6af with SMTP id
 00721157ae682-7025734bd0emr85210947b3.31.1743350088704; Sun, 30 Mar 2025
 08:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-ljeKZd7vNoQZJZ@pampelmuse>
In-Reply-To: <Z-ljeKZd7vNoQZJZ@pampelmuse>
From: Gonsolo <gonsolo@gmail.com>
Date: Sun, 30 Mar 2025 17:54:38 +0200
X-Gm-Features: AQ5f1Jo9abWDsUg5PZzhzQ2IvCkt7cOGQFYBHyRHIq03BLxyIx-gBqLg2_YQKgw
Message-ID: <CANL0fFSUCiedt_V91bmEdDYnqo_DgkptgmYMUAWZPePM2sWzvg@mail.gmail.com>
Subject: Re: Screen corruption with second monitor
To: lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

Second try without attachment.
Youtube link of screen: https://youtu.be/zVbuzxECinI

Am So., 30. M=C3=A4rz 2025 um 17:30 Uhr schrieb Gon Solo <gonsolo@gmail.com=
>:
>
> Hi!
>
> I bought a Displayport-to-HDMI cable to connect a second monitor to my
> NVIDIA 3060 12GB with three Displayport and one HDMI outputs.
> The first monitor is connected via the only HDMI output.
> The (second) monitor via on DP-HDMI flickers and has vertical stripes (se=
e the
> attached video). I'm running the latest Arch with Nouveau and NVK.
> The first monitor is attached via
> Kernel 6.13.8-arch1-1
> Mesa 25.0.2
>
> I think it's the driver's fault because
> a) console works, flickering starts with the graphical console,
> b) on Windows it works,
> c) with NVIDIA (nvidia-open, nvidia-utils) drivers it works,
> d) booting with just the second monitor (Displayport-HDMI) works, and
> e) funny enough, booting with just the second monitor, and plugging in th=
e first one
> later also works.
>
> So my guess would be, there's something not working with Nouveau's handli=
ng of
> the second screen.
>
> I'm happy to provide more details on request.
>
> Cheers,
> Andreas

--=20
Andreas
