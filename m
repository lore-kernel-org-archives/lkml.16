Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A4315535B
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426222; cv=none; b=cyUhmQCZEDiM856wl4/qy9Q15wpXX2RNQ9aLE/GPvbB6Ybv9v0J3lu4tjvIUfriZLFH0tM/NQcrc/ZXj/gX+oxF/rU+X2dklQkAC8OKN40nmThaZHxwGGp3Q7nKIL2ELHtGuW425P8SZ8beVqpoa4lJGcu7woIKxjJhF57U1L3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426222; c=relaxed/simple;
	bh=JItcR8CbGZcrDCr9Z8EQprhcdsXHvwANLmyr5FSR5+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNuzErdLvgl1D18BJYBME1sAfxWQdZVTrlwgH8gFuMzM7hJaFU7PDfOdVi8YmHRnl+ojuFaO5ImIFC2JmQZq1M2dT6Sr59TVl3H4Ag37X7YBsfwbsIfTfjAlNDLx/Pz7V4oaOmxcx+VxOKbkAblgEA9cXEummmt9r7Cp+1WFJ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jDTYAN5l; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jDTYAN5l"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-543cc81ddebso3437849e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738426219; x=1739031019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JItcR8CbGZcrDCr9Z8EQprhcdsXHvwANLmyr5FSR5+I=;
        b=jDTYAN5l+x+Ns1mLCviL7XGegTDVIdknplz4Z9rWKn495vgtQ4caxobtKX1LLmGhU6
         iJZz/Wg8CfOnCkrk455cfkAcC3HKSoSZRroFPV19tRJbx9DhD7TDy0ZSJhY11s0wxaao
         a5LDvsDcPLoky6S+RcYpy5l9+iKGkV4Hn68WJ8L+jseR5pFMHvXAfUgkL/2UkSqaSefj
         xhXXllYKa2TxK3fqp8CpDrXo95GUV/NrAyzjIn/BKwAnML+NjR/qEy965IQAv4vZKBWQ
         R4XRy3hm2vtLWzO1coQPpXyeQwqzq72no7+X4SwxKzMn7i2sEA5i8leTDH+Lac3cwDBP
         J4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738426219; x=1739031019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JItcR8CbGZcrDCr9Z8EQprhcdsXHvwANLmyr5FSR5+I=;
        b=u0ZYm+4Pswl7DbMLfBsfhDW0TDcvYsdVBziD4SmOjDdfV6hIsabdB7JR0+DO9ItGbI
         JZLQftKbwwreObUWRUYRoVJ3AkJxducxWAb628hhU2/2s3bz1TxQnnRaCml45/7C/WA1
         9Z3+aT8A+qgK/yM90LsZ43Z1cd46p23qTkuXt34OjBtXfXOVNrXwo6z9gkV8HZmqVLL+
         FGjxOY1OOBPKYxGXDwRkO9ZGfc4etbyRDFclo2Lkh++vc23aqMXgDqoRk6+WzAyVD9FW
         nI9eDHv4ydxlBBq28/J9bfB1oQY54ZJOvYaW17MQccRAZV8CKljGob9qZfVofpeSztJF
         RmMw==
X-Forwarded-Encrypted: i=1; AJvYcCUb1JhQEOne6sQVk8kUPvn/2ofrxbISnjoXLW5d1CVwHg7nz5NoV/6U1zXSXvIVDUWT1cm11VyiwIVtgAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsxRliI7ajW9lt/cSS8uG8lXUY/kdbJeq4R6DoPEQYWCJmG1B0
	BTh3/5RyCqSgqdd9IDq/KRthxGgIqpuqWM2EPPiqvrsD3DYJjLEksNm9X1X0AOF6YaTpdJhUb33
	uESLhuBwiXTEhqwmNexytvJ/o9Cujbd0yzj6SPw==
X-Gm-Gg: ASbGncsvkNl9m1aNmjktLX3duTyFv0tD44Xofpoj9WDyM+fnyjBYzvZAwegP/QHajMc
	kQ3GymYfeWSLsBlFkNGshpKAKAPyYvlNhYYotw2NG1/8G0L0+zQitGU4PWhPINAZnO/nh131X
X-Google-Smtp-Source: AGHT+IGrd88r20TOFapiU3NgcHkloNtM3Li03HGBvF4XYWzPb+4bQd0ojKD+4B2W1f3FkCcaIHamOflErkpVnUpD0Uw=
X-Received: by 2002:ac2:4c24:0:b0:542:2a81:a759 with SMTP id
 2adb3069b0e04-543e4be03a7mr3486052e87.2.1738426218660; Sat, 01 Feb 2025
 08:10:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
 <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
 <rhdrieapetwdr3z7roguf5nex3esazhygjbjx4zklkrjzqrlsv@6vc5zmk3il5e>
 <CAMRc=MeRBABW6JCScGvsRR_4+W6u5QMWJwA7yMB9gj7=uOeD0g@mail.gmail.com> <xrllvn5tmshdbb2mjlxvoc4rpalnefy52wwd5p6s55ehhysl4l@k4w42cd7hxkn>
In-Reply-To: <xrllvn5tmshdbb2mjlxvoc4rpalnefy52wwd5p6s55ehhysl4l@k4w42cd7hxkn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 1 Feb 2025 17:10:07 +0100
X-Gm-Features: AWEUYZmPwDEyLQgRS56YRHOlcMhb2tTSr-oBLgaMMeU7D0d2Gf6qtGRC8OLq1n8
Message-ID: <CAMRc=Mf6FZgTNBGUSsm3H2nSBLbp+DpamzbZiHZ67Xc62F3QnQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 1:26=E2=80=AFPM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> On Fri, Jan 31, 2025 at 06:22:50PM GMT, Bartosz Golaszewski wrote:
> >
> > I too think a-1 is the best option. However, I'd go for line0, line1
> > etc. convention as for computers it doesn't make any difference while
> > for humans it's more readable.
>
> Thank you for the comments. I=E2=80=99ll address your feedbacks and send =
"v2"
> later, Since we seem to agree on the overall approach, I=E2=80=99ll send =
it as
> [PATCH v1] (i.e., without the "RFC").
>

No, please don't. It'll be confusing. The RFC WAS the v1. Next
iteration must be v2 with a changelog.

Bartosz
