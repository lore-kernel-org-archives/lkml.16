Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F67725A357
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188802; cv=none; b=WoXAIwH+QvIz9+1qyqFx2YYFI5KXg4eqgyxGb+Jzy0pbEwWsN1Y1v39uZ7XPt454pOBPux5zU1rVW54F0GU++rU46BUTD5S5g7A8NSZT7j6G4BBC7MO/N46GXUSeRYUJv7QUjp1trfLEVxTkll1c+oZ/9UR2tWPjIIt42e8brLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188802; c=relaxed/simple;
	bh=5LtHgusi0DYB4k8LoSlQMj6591nPND2Az8+N2UCeyUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X59+3QyNDwoM++mwM03Cba2BYwfQ3B4ZL9NDgIL10MzofPEX740smRlGUwSYxjNAbM2USVPNWa20tDSbVuuVcWDisDO5NCfd0q1oeWz9op8kPRy34lrjGvrfYwXtwJ3R6Q/imp4NplN/V7dJxFzVklsrW8KSLu9jrPmUW7r5qDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFrvJyQq; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFrvJyQq"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5242f137a1eso2741130e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744188800; x=1744793600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LtHgusi0DYB4k8LoSlQMj6591nPND2Az8+N2UCeyUY=;
        b=QFrvJyQqIjsJF6mv8+8cJHuk7vILfW7diUmUYDo6PoiATb2qZZ6IUrytl5zc33fULa
         ewnwFxsk4ckKsP7dz5s+lgvosUQRmOn5npsHOqLZNMwfaFNEuNdM/VcgzcpqgfZM7kG6
         u323XambZ3h83U0zGJ1XMFC+t/TqIQ1oRfERS5ZdjLf1JIFFl+kaaKgF3vooGZ7X6pe6
         yUUz2ysD2Tvzmf/+EY3+lvdsL/wPoST1qykAnG0gocHvNLtPf4vh9cXV/f5D2xpgWpVk
         D6zlvLdfXJBfUlYDQXoAPSbJ/1m8LaabiGAbMi+2YUKZ22yHJji6taus3o48SJ2F6Jch
         OxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188800; x=1744793600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LtHgusi0DYB4k8LoSlQMj6591nPND2Az8+N2UCeyUY=;
        b=Yw0nMRqnxpthsShmt+1Puh5NjpT4pIUby/uBuvbMcklWEDvCMofgUpNjDCLgv8Z1uz
         QG2jOalS8PKiMOny45szRNbVFXfii0oQrfl75L3FZLs36IIdFcIifRmhtCitqdSUcSN4
         L6k+1RKES13kdLr9bcCZW7OqU+A4zgu7tBtBvrq1fY1UpDnCEZYDHsHGVLbrtv3WRx7r
         H8Ixpdxz0wx4mKVTmCMkQrurEwwW3PDY9ubFjgdkp8gFLR4U/LTI25vU9ruGDBnZ2ecV
         kDvjp07+8Rw1/gpG7Bg1uFOUqGFe9k567OATKMq8wfk1eM3OhGKEUMQJs48UQe9Ttm8d
         vq6A==
X-Forwarded-Encrypted: i=1; AJvYcCW4prkH/c18bUUnOOAFlC4d1z7Y+e4P+GDLCEjOeR8TaL3IeEJ1xFGRqEzSTRBNjcsjUM75AaCR9gkXjRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnp0/u8fEYIqVuEiCs0/rpQ675560I4TOBpdzsqmEZEd9pH8cM
	0IpyIesZxBD6hLXwRvY9FDW0eTbcNn2DvtriEB2FxN9CWr/ZJI6JD/oIHtrBBdaZt6PAEi0w+ep
	6kscxGvbdgMmv5DmD2fGwoFKKbnk=
X-Gm-Gg: ASbGncvY+iGdCIifpHVbiPCmlMw7AMXiFDRxD1f4128MogEh2Rbwxogmy6E3UvpIMc2
	7Yl8orShienH1X9HYb3RGtkL/I7CZ7LCEL7FukJNnEJTw2BNYwE9HWBjIdO+YUSI977r5E33JYA
	Mbq43HpmUCEyd6HyyzybWaWPO2
X-Google-Smtp-Source: AGHT+IEN5uVmKF5wn9rZf6ilGSYyjwAo1pIYlP38TLCCIxdf4qZXt+sHLcFubwYXct1iytoDjzKBUGC6aEskhftJhJo=
X-Received: by 2002:a05:6122:da7:b0:526:483:95fd with SMTP id
 71dfb90a1353d-527a9e12274mr693131e0c.10.1744188799915; Wed, 09 Apr 2025
 01:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744126058.git.abrahamadekunle50@gmail.com>
 <Z_V70-9Bk-aZ914y@smile.fi.intel.com> <CADYq+fanYZR1UNJVR0iapynQeXTVEe1xPMMJHXHHCGc-Sc3B_Q@mail.gmail.com>
 <3878cce7-1a85-7f87-70ac-722cfa9d3e19@inria.fr>
In-Reply-To: <3878cce7-1a85-7f87-70ac-722cfa9d3e19@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Wed, 9 Apr 2025 09:53:11 +0100
X-Gm-Features: ATxdqUHbg2WozVzGaSYlAbtv3kgxsOyEjlEPeU5hvICINksNLg2KiyM6lqEiz0A
Message-ID: <CADYq+fYQHtiQU71w4-4V2Rts7mEHVxLEYbxJp7LnCQQAoxycqw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Andy Shevchenko <andy@kernel.org>, outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 3:11=E2=80=AFAM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Tue, 8 Apr 2025, Samuel Abraham wrote:
>
> > On Tue, Apr 8, 2025 at 8:41=E2=80=AFPM Andy Shevchenko <andy@kernel.org=
> wrote:
> > >
> > > On Tue, Apr 08, 2025 at 03:41:55PM +0000, Abraham Samuel Adekunle wro=
te:
> > > > The patchset adds spaces around binary operators, breaks long lines=
 to enhance readability
> > > > and provides clarity on sequence number wrapping by using a modulo =
operation % 4096u, in
> > > > place of the bitwise AND(&) operation & 0xfff.
> > > > The patches are required to be applied in sequence.
> > >
> > > You missed my tags I gave in a previous review round.
> >
> > Oh, I'm sorry I do not know how that works, please.
> > Am I supposed to add them to the commit message?
>
> Yes.

Hello Julia.
Thanks for the clarity

Adekunle
