Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F84A275846
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593423; cv=none; b=REk2nOPjB8DjqdP5fZYnnbYU+MO2iLTcq6a+r+ieFSD+xmZmMqxwZKUETYmIe9IRKiwGfJNgqwO7so7qbcKPzzhWrzi3E4odlIe7YxyzHfyQgWxoEDr4ryiHj2gtULswOt6xO5Jlaj2Jv4knuMXHHL0uMjnmgdmnX0ZRgIGMjH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593423; c=relaxed/simple;
	bh=4NsuCs21FfORtH1DAcJU346wyrSVbDZYpctIUxODfi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7w2IPIeeKH6LlLwd8oCMBImFCn8nrEgNitSZFJ1tWx5ICL8kVZWWTxXk7zMRhshOBN6fP/C9NogSPx7jvTk2O1/IGEjetauYcAvLoHXDO5bCJ7zntTQpTAFlQHxR4gG8x0L/GefYpqjF+adTEyGQTggxnx2tPmXMZwca3etd5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MsZJqPCD; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MsZJqPCD"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32a6f5cb6f9so28752081fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593419; x=1750198219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NsuCs21FfORtH1DAcJU346wyrSVbDZYpctIUxODfi0=;
        b=MsZJqPCDWHYDtofYtQG6eQy/p+YGQdRbc8TYIsRmXnBooRrU9JXaSDAgs2y/oOznPz
         22DT/qCW9UwOxfpjlGGvHOk8dtAQTAjedtIqyRKd9G5KL8r7wd3WpS9sYwAG7DkY1JBd
         ewzM19b44Dguv4A2BMkJKvB336xz4ajAtc/36gKaBZzpQWDqlsuVfDCWoe55d2BtIHLo
         /vvtcOq4Ix7FWucSTCsFDPXWKaaWa4WAYLNqqLpzPd7f1xSkV7bTFRSDkmoDoxGfkJyZ
         pjqHbbRbCMKZIN9yU4rc/wN7FI5MGkt7BkU3NJqkorpotIwk9guOqdK304/hXEOroGXw
         +fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593420; x=1750198220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NsuCs21FfORtH1DAcJU346wyrSVbDZYpctIUxODfi0=;
        b=gZuP1YgwsWOLupvbrCNw2clFzQn1G6eCuNHadmhXFR6+nVU7AJnIrbVL9xF2Uxo980
         q93C3aRubNbvggYummi+ymCwO0aPqyH+ITR/9oXaCXny4jUgScvGbYRtrShUkouaDXXF
         OhZlQ/vV7rT++dKz8qILADQTsgjo79V8yDbqf6JZgvfS1k024gh5DHMsWwdWYKaVDqj8
         RxM0HCV4u1sFfHfSa8h8zb5vObDGNHDq064a/+KxJ3CJXpJPPWLNMEEppeKKtd5cefDb
         dScDayYZyvP6DC5BMCGH+B8/htR6+YIZ3RtSwjpFpkk/KVA9Bv3XWmo3ZkMvuaKmSW5J
         KNqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWufCucRJKL1KJ9Lz1yA40n+qeX2xg9fmh6ZRn67gDfDWCVm5JQ0ICj6TBFRmGODz098ZUa3IwW1ca7m2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfRKwwz0/pJBVFtox4xop23xUgqsPGsjVgTzp72wfiKVZuJGuR
	hSUIaNMGpL9QvilbiNI3emjFj6rCGUjyHttlYuNRtk84qz9xah+FcfNC/U0XYP6D/zRcwCm1X6O
	/jlImuvUhcnGBUVH2wBGNocSlEx5ljcswGjD6lGtGjw==
X-Gm-Gg: ASbGncuAhiYwtSZcnQCJWXH3Hxp9Mi9bQ5UUdmUvPQI2ckm9ELHP+lMyNPzeZff8G8E
	8f8xpYQKMLw/IJWGA/RYRx7oUUxWijLnrngwR66PQ4GcGJMYPlieAUv2v1XYJ7e+rjNZ3Mk+90m
	3RXYQoQ99jj8vHcS+wUwcLAzZb5ZLKoEmoCQJ2k6VSMSKKimazquhLxw==
X-Google-Smtp-Source: AGHT+IFXxwww3rRneN2BUjxLNPNhg4yAnXFXP/2lKFW4OFSo8Ks3J3g+tSHPB6GX39sicVQXDwM/c1CXLqu6v3dqFFk=
X-Received: by 2002:a05:651c:1501:b0:32a:864a:46eb with SMTP id
 38308e7fff4ca-32b21926dc7mr2464121fa.0.1749593419575; Tue, 10 Jun 2025
 15:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
 <CACRpkdZpn5xy+6yb-mQd6wDs05X0QqRCQo7QpL6=aEWtyU-zTg@mail.gmail.com> <ddbaa399-6bad-4c97-8456-b597442e5be6@bootlin.com>
In-Reply-To: <ddbaa399-6bad-4c97-8456-b597442e5be6@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:10:07 +0200
X-Gm-Features: AX0GCFv2Yttg6_a--xuQp4PbwFHmH30QcrKQqT9QjOj8bCT3ACO4rWmYyV62F-Q
Message-ID: <CACRpkdY-6UeRai7AVO0uA_3JGtGNips5C4GtSFgw0SHky3ozcw@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:48=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 6/10/25 14:42, Linus Walleij wrote:
> > On Mon, Jun 9, 2025 at 11:51=E2=80=AFAM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
> >
> >> This is the seventh version of this series. Only few changes, the seri=
es has
> >> been rebased on v6.16-rc1, the pinctrl patches were dropped as they we=
re
> >> already merged and a fix was added in upboard_pinctrl_dbg_show() to ha=
ndle
> >> the case upboard_pinctrl_pin_get_mode() returns an error.
> >>
> >> Best Regards,
> >>
> >> Thomas
> >>
> >> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> >
> > Looks good to me, some testbot was complaining about something
> > but certainly we can merge the majority?
>
> The export.h header file is missing in gpio-aggregator.
> I can send a new version today. Or I can send a fix later.
> What do you prefer ?

Just send a v8, it's always easiest.

Yours,
Linus Walleij
