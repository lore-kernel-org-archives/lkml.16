Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C3E2222A8;
	Thu, 19 Jun 2025 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329302; cv=none; b=frjpqiLD6V/wLbjwla6RzcZDed3GZfEjreobiyoh2XU8UHcOPdNOSiQJFYP6pDEEhp84QliBA4VO+Gq/D0LTBSMV/CqzUMs/ImYKVnN+jxz2TWeGx9lfODVuUEaLeOfKCZoAkoxpYtQHuyIYOzBjUuR+L1zRf7ai85Gs3pRcXhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329302; c=relaxed/simple;
	bh=0h0+N1isH+C+pxjzTtkrcvgQ2+nTc6TtyEzhuG/4538=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apm9A6Xb08YSzd9QRSd51qJw9vnfWdExcWN5X1DYNEmXCaGNtvLFmg7sv7GoGEONOhLMBYt/Coy5hU6iEDIkYWcq4YujE3Ip5+5cRsPBy1evI9XYFTPSyy8tGmUVFt/79Yj+ntynadBEFcsHWYu9F7/JcvisGr0dsolgmeTiRDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fHMOfdd4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fHMOfdd4"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so867519a12.2;
        Thu, 19 Jun 2025 03:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750329299; x=1750934099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tFpy8FcR1dO6G2aOzeKR5F2wMTpPtGzmYp4B/Qy0FE=;
        b=fHMOfdd4jj/1JYWpjzii3Lf2U45PmB9oZXXiOk8xbjvZ7MSjBbjbKDrDx8YyfvCoNM
         XlcUDTNmXxeOED39ZvamaDlOqoG7rMMPN3kxCoxClIa9rSaHo5qWymQv4Gf1kL+bf0+3
         ZLuGfizUju6o55867qZDUMMFFG1AVFb9pnWrZeS4KHrRBNjM4Eu8ZTo5+MnFy2YzD5Dm
         CcBszxNOES3F/IvXrFXuDm+ozkaRNAtpK0OdeSFhCqdtgLSqtnV2iia6BMW8omfYOwfh
         5InTzOqfuYJJX7yDAwEgyYMJwvzbtfLcEjcBMZWOmKVb52N6/LRoXULx+yA6gFn5oNTv
         Gzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750329299; x=1750934099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tFpy8FcR1dO6G2aOzeKR5F2wMTpPtGzmYp4B/Qy0FE=;
        b=e/7EaKgYqJ2oSjIlzmA+jDKbaCsjeA+GrP7gokBDVFV+9yqQtt6l9yzOa9Oh9nMo+v
         MSOGZZZiwSHwYbilSYFHv/8wGrq5xMjGbp9cGD8BalUQV5RR2pgctJtlRQUUkyVihuuc
         q1A+c2v42hPyAjoLYWdqXNeC0ga7HOVKQKT3EvTpilIF235ocs0ZrxCcD63TkFY4d5dD
         SS/N91WcXxRSZtGJAmO4JF6aUnCEdHDGWT1svKxQ3uEXNfyMhoVQyf+xwYWwvRUAeHA+
         4JolwiuZybSd0lT1g/3jd3zXg60onb5tLRe+V+eruGDXwm9Z/r0Pq621v8drfVWke5lu
         kzYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSjDmDIT59ptxkndMalLTUzAojidVha/PHb0z39izTKRLqjcImbRt+fsJMW7ZvnMuYQMi0bbMXMBBpoOKa@vger.kernel.org, AJvYcCW4aZr6UOxDdRfLBMwCU5yXjvBGmH0HwIRT17CHXkq9v0U6rYAJdTOKMQ8kitYCA5MvrAYrtnYd51A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7W8uaLVxWT+/aVP261Wtu/7kxreOYVGjVqZJfCpOvofthVdD
	51rpOAjS0TPJYAmaGLFiFqW0BTCU5ftfGpI+DPRj6jvvB8jSSdBPvij5cAWfThaRXmZ60QFoNVB
	cBe1AjJIQAadYlTEvtCNKnhf7SUtilSI=
X-Gm-Gg: ASbGncvVFk3rPRFC1tN2GzZsKdcXEnM/3iSEjziBKHO2/PSpt/Y/lcVGgr+QdxK0svv
	lWBSz3uP7OnNvw97rAEeCe133fkOufyEqupG2sG6rzKirtqd+e+ZCk5vfVHf5MLQFHkf/KKFW/J
	54JpKK5WlsDoq/KFRRrU5VWBE0TK/Rfe0svwUWWiUZD3o=
X-Google-Smtp-Source: AGHT+IHXvNpsoIOne21DuwbQFqciDkn16wzvqlhHtJPhl8KY9TMtoI7lbHk0At/5qCzT65a2RswrW3Crj9qSxUdqf1Y=
X-Received: by 2002:a17:907:a893:b0:ad2:313f:f550 with SMTP id
 a640c23a62f3a-adfad412330mr2104736166b.29.1750329299027; Thu, 19 Jun 2025
 03:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618091442.29104-1-work@onurozkan.dev>
In-Reply-To: <20250618091442.29104-1-work@onurozkan.dev>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 19 Jun 2025 16:04:36 +0530
X-Gm-Features: Ac12FXyYu-DLR002n6Oikgbc0Uf08JqMOOcmXIdgOnciEpBVswsmOGf9okVgiRE
Message-ID: <CAOh2x=n6oh1YDjGqiV8CgqvNb1MjOW=A5cc7=nnxwJL8m=eJcg@mail.gmail.com>
Subject: Re: [PATCH] rust: make `clk::Hertz` methods const
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 2:46=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Marks `Hertz` methods as `const` to make them available
> for `const` contexts. This can be useful when defining
> static/compile-time frequency parameters in drivers/subsystems.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/clk.rs | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
