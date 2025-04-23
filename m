Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6CA79F5;
	Wed, 23 Apr 2025 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423010; cv=none; b=s5jIUmYqzzWck3c6GV81dBiFuEfW40sEFjmB2kAL8R5u1Laz6qkAd6ZabK3odp3ndQaKTLD/Rh5cVbayEEJyzBIhi6q9edv0bS0zD0w1JI+7ZN4MhxRCQhuarN6MXdtRfuojBmVUE55G201dUD/1Xz8ZNR0lm57oi65pV5AKXyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423010; c=relaxed/simple;
	bh=ssY7ST5iazLsi96Tqvu4S0HIOKZR8jCoJKR0Xsh0u74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VntVkJss6sFiAkLUsjzcPsuhiJr8dpkJFHQ7LKjXGcMRAnRrHBajSzPMgeFWGj5pC/FkKj45Cn02xCYgF0B4mcCj+u+yONTsGXO99TsX4wGKAYzc9/q7FmlLc4UE2LCPkaepLdqJ0PGYwVZfkty3WnZosFUBXwDaIQMH5CvS0GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXT/H5i3; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXT/H5i3"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4769f3e19a9so45144981cf.0;
        Wed, 23 Apr 2025 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423007; x=1746027807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dvEbMYZC7h9hdSPfZirwVppIxgbewmNlUntIutHcto=;
        b=IXT/H5i3lh4ggIpXeYsSHGHj8F7N5e22GfhWKm0TtmQZVZoJOxQRj5tjVIPNGD9br2
         I2gd8YwDVhSjCxu8FUezXqr8F0PdSHtVBhcRJGEtKUceXi+j7yT61J1+fYDf9h2kdI4l
         l0t2EC5MRFPNK9ExAMEkex7NW9TiIhwGJ/0yIDu3AnqiGT8iXBSjxPBzva5Oz7biIm6v
         mdX55bCBkYJvl/KhaG3bdkJwGpoBT08g4zZdoHp8J5LaHEmMBbBNlJbr1Yk63goik96z
         UsbcGkKNcKVbGu1DoKRwYHyw2MT9ZMWugavyRM4hlsx7A3zYS2N38N42y+wyHciyxx/L
         aJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423007; x=1746027807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dvEbMYZC7h9hdSPfZirwVppIxgbewmNlUntIutHcto=;
        b=MN0pscQRHuVqLVkSPrtQ7j8tH7G8oIGjioz/Mj9522pQqjJcRktBub0ZVX5LS2WrLs
         mbm0sjsAtz3Vyp+0LLHc1mahoa3qMGc4pbvhrgO5tVl19vBGIti317Idw/jCUN+ngIn7
         rOEMMJBHtYspdAtJ9j25ETGToTonz9a6Tz1Vg+eeVCvj95KG1MkE/U4KiOWNlolYPsEU
         lgDvNxAf5dKzS11IZeqsSAU2TRfh17uPwz09CI9367Rq3oQAXubI8SS8Llw3uYMOrqdm
         KU0CXXxhaJOjz4MeFSqJezB57Lxg8+2IHl3M9drO2TzCd20qEGV5zmavUiGzkbstm/bg
         HP2w==
X-Forwarded-Encrypted: i=1; AJvYcCVvadbpHd97DXAzbP5mSJzjKw5Gcp8TkjOJ5juyZUSeuzk2NgbYjqWHcc2JvFAWbm8mWaiqC5wFJg4SgRK+@vger.kernel.org, AJvYcCXKpI9fquRyOqjyCu712Kks5eRbQgQBvmNP7/iKBZuLLQ8RnQ6UmpPTGKtkb0vmZU8+iFR9xZB5a6ZS@vger.kernel.org
X-Gm-Message-State: AOJu0YziYmAh4kMYmDJwPm/Z0IzlObRQ8KEx1YJ4AZv67ZCh/+t9pXrl
	C94+oIgLxT2VKtHG64CLV5LBtm4tPq2K+TWx/pC3NKOCEix5XMTB8JTOwdvTJ2jC/Nw4GzZMjCt
	l68Sk+BRmfVsNJU579PQysqgEtGw=
X-Gm-Gg: ASbGncuggB0eTGZg2T5rYl6kb9x2H/shgu9/6RH/WO1qRacdhprMbrPu0s+N0FVKDcj
	ekTT7tjt/ZXoP263Pzxd62tGYhR28A9zfUYOG96HhL65nFhaiGkj1QlvGk2SN9s7O0Ncd0mVWgr
	bSKpUnq4gi8J+beMDsHhHpCMDTVkl0WMU6ItcSMaERoVY6O17scZM=
X-Google-Smtp-Source: AGHT+IGdz/NzWj1aEvnvgg90NCdRbUnEKeBpXHV/ehEUITidqcy1/33fajsmWc0TIu1ipHhyh6QNeEGMqWqYe+Q0HxE=
X-Received: by 2002:ac8:5890:0:b0:476:a6bc:a94a with SMTP id
 d75a77b69052e-47aec3923d9mr333870471cf.8.1745423007634; Wed, 23 Apr 2025
 08:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com> <20250423153505.GA561193-robh@kernel.org>
In-Reply-To: <20250423153505.GA561193-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 19:43:34 +0400
X-Gm-Features: ATxdqUFih5A5ETgoEVEVx22tVbPmblZ68v4pMBnuKdVGysFb-8q6QbGm_op82DM
Message-ID: <CABjd4Yyiz0A4cSDmS7Tn1B03Hcoi+wTLXZqMTo1qRy-vWG0rvw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 7:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Apr 18, 2025 at 07:24:25PM +0400, Alexey Charkov wrote:
> > APC Rock is a development board based on WonderMedia WM8950 SoC
> > released around 2013. Paper is the same as Rock but lacking a
> > VGA port and shipped with a recycled cardboard case.
> >
> > While at that, put myself as the maintainer, given that Tony is
> > unavailable as of lately.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Split the series from v1 into separate bindings patches so as not to
> > spam all the subsystems with unrelated changes, per Rob's suggestion
> >
> > Changes in v2:
> > - kept single-valued compatibles in a single enum (thanks Rob)
> > - dropped the empty overall description node
> >
> > Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-7-f9af6=
89cdfc2@gmail.com/
> > ---
> >  Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++-=
--------
> >  1 file changed, 14 insertions(+), 9 deletions(-)
>
> Do you want me to apply or you will take via vt8500 tree?

We don't have a dedicated public vt8500 tree right now, so if you
could apply it would be much appreciated!

Best regards,
Alexey
