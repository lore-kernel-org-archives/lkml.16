Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C966275842
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538949; cv=none; b=YQkXtPoawPYf+Ko7HQsxPYkO7AaoOfl4H9W2NrisVDq5j5hTT/MipHfEX78lNjPh8EKaUyhkKiFfcHNZTxXHlb53QTYGJV+EDFM9wI0cEKYStX/dFPnI4RYMju3QiKqSNNLbiOHnUjBHCHhzEPoWn33hp9OD1yZFwdRsfCCqwrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538949; c=relaxed/simple;
	bh=JseNVTS5cyJQpI/Mfz9vsdQjjHZ+PMPgo17Lr4qAjrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGKej5cOuckmBk+rWP/0Xj/upfkCcnjDiQxBizsO0mir7OolbnW1bcD2AbmZHkbw6CmYBX2rSkrtXHIGa+8GyUZP5Up9/mERUsn3L1t6dhm8r1KnT9+UXD0Je5nP3vkHaac8Xq5XVKgkCWWG795b2kWFutVM4m7Ll/8YS8Dtcoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com; spf=pass smtp.mailfrom=lessconfused.com; dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b=HeXbKkpt; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b="HeXbKkpt"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30a894cc07cso732325a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1746538946; x=1747143746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JseNVTS5cyJQpI/Mfz9vsdQjjHZ+PMPgo17Lr4qAjrY=;
        b=HeXbKkpt1qIQTa3tdXetfK5FROdbIsq37GIZRK1WNfszcfTsPnqtO5Fo0aM7q8zvU7
         NUdOMVwgEM687AenZ7TCjIlYdnaxc/0reivxktQVTxSq3TF+pYq8YAklkd36bbe9tvoI
         fxu1aJcaNnprAG36yprMmmg+cAOM0cIhNjAw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538946; x=1747143746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JseNVTS5cyJQpI/Mfz9vsdQjjHZ+PMPgo17Lr4qAjrY=;
        b=ohM/OjPHbhMQkxJMEbwVSWdVRtVBa3A6zYKm+pbfcrffnFLDPSb915ZlcKfOfuiFDr
         4ohrmuSTE1zR1qLq1/MdsmghdgO9K2rLxritg2roUgC4zq07ZFyUfFe7pOtM557k2AFE
         z1WyQS/IdJeW0mKiDoVlXQhdHXJfbW63K2ngJIE7SLOXeBAoh2AABqkLJWoWxkP3QWAo
         c+dtjc0FD6pb98hKxS9pRk2vefykveQ0hU+oCVQ13p1Qt6AmmmZZcZ9QGnGzfky0Iw2a
         76u9dAGP5ndMDWy7GgC4uqWwOASZ+gpBBRQ/hUnz8aUUDhJuCVGTTBZfjmYuHnj38Ygx
         DysA==
X-Forwarded-Encrypted: i=1; AJvYcCVBLNAgboKwqOzqJI44BCeMHaj9BiygsBA1v02htFitwk6K5z/2oQTd5KQ/bHBwXiYgXuHss+vNcpOmr4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz94EPr1sprSNjCYf1ZMfZtJOwIQZ2G3B68aXjHAc9HQlDVI+Z9
	v/RfYmH0SjTS6bntMgVDkqO2vg4WscEWqealZ+ymz/BavTTaqAhwbUAJLbtTHIUDVpaZWfsPBsh
	JqUqqqKnSuLxR9okWOWixXn5CpcIXxX0SrH/0BQ==
X-Gm-Gg: ASbGnctlG1PJi2yPFNVC8acZWtrCUIz8SDZsOxUvT/qz1zaS/lvtfKPuaMKfjNYl2WG
	EdAThrz3gDbZNofCvdIOUBhXIZi4KDe/Ze9xfwabe3B/J04fNF7razRFJd0Ofmu4gNYSFjNW5Da
	xoHgoDu+D5fPByX6QRtXBgXcJK3WQr9eAYk0fyhIYgDs5M5KwpK5eZODE=
X-Google-Smtp-Source: AGHT+IFMb+lrclQ4OPHCAh1lzSkIMnskyJOofZ7Kk/Nmt7sTAKcOTEwR67sDgAeExPy9dKzAQGA9Dqsm1s06dVSJZYE=
X-Received: by 2002:a17:90b:5446:b0:301:a0e9:66f with SMTP id
 98e67ed59e1d1-30a6198e12emr19037686a91.14.1746538946445; Tue, 06 May 2025
 06:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505143700.4029484-1-christianshewitt@gmail.com> <CAFBinCBmBotJL=wC2=oV-o7piGckoBvN3S6ofYh20fEP9sn4XA@mail.gmail.com>
In-Reply-To: <CAFBinCBmBotJL=wC2=oV-o7piGckoBvN3S6ofYh20fEP9sn4XA@mail.gmail.com>
From: Da Xue <da@lessconfused.com>
Date: Tue, 6 May 2025 09:42:13 -0400
X-Gm-Features: ATxdqUHU86InfKfq52zvNkEmca8096lqpeIdB0VVbLy3DnspBF4H2KEICm4USso
Message-ID: <CACdvmAi3JbdLstkudF=Fb_O_P1GGADuubKVS6s22hvC93qz3tg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: sm1-bananapi: lower SD card speed
 for stability
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 2:26=E2=80=AFAM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Mon, May 5, 2025 at 4:37=E2=80=AFPM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
> >
> > Users report being able to boot (u-boot) from SD card but kernel
> > init then fails to mount partitions on the card containing boot
> > media resulting in first-boot failure. System logs show only the
> > probe of the mmc devices: the SD card is seen, but no partitions
> > are found so init fails to mount them and boot stalls.
> >
> > Reducing the speed of the SD card from 50MHz to 35MHz results in
> > complete probing of the card and successful boot.
> >
> > Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> > ---
> > The same workaround of dropping to 35MHz is also done with the
> > ac2xx dtsi; which has a comment about CRC errors being seen at
> > 50MHz. It's probable this is the same although I forget now how
> > that diagnosis was done (or who did it, Martin perhaps?).
> Maybe Jerome helped investigate/debug? I can't recall and at the same
> time: if it fixes the end user experience it's a win.

We had an issue too and ended up disabling MMC_MODE_HS_52MHz | MMC_MODE_HS;

>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
