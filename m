Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631782206B6
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128228; cv=none; b=h8YknLhOXcKLnyD6DdPsy8X31CacAEgIWH7BPmuRPMkJL4hViT5mVHb3C0dEWT+uEogDgCmbnJ0XWy/GuAFYR00VWtFs+wIvMt8donOB+b09yp8pmj2WAFDeu0UcebW5/hpDdx0qZ8l/Yrvk1pzxN2F4I1EMeFC1TPqO2pc5eAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128228; c=relaxed/simple;
	bh=U0JysBy8eKyfRaxM8+abK0KKxGJq0+6TwjxqMraY8ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJPEb6UiLqbrd6SMe/5TbbUP2GrPSJC+NYljJ08Mg4LeL9Mn2l5pfxEV/pcHOTZQLh87pCWOP6Co93iF+/dSy57yQjXCI0mvk5HDK/7xzEAcyLOkbDEngKWFB3liAs7262v1hUMqUejgkGpIpsLKrsDDlXT7P6VHAnc6pTokO+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I80yEN1F; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I80yEN1F"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-326c1f3655eso41399301fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128224; x=1747733024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0JysBy8eKyfRaxM8+abK0KKxGJq0+6TwjxqMraY8ao=;
        b=I80yEN1FiPn+nLZLd9/p+FSh1/UlX+gcdmy3KhA1BC2MNwVa4ngu2xnEUvjmpU3ezq
         pS+xfbg3upBeUaZ3KjM2Gofu5lqIER0GN9zaTPMdFaPgp3zP15ehAKwvWkTT0wJfZy1u
         S3xk+zxw6bA4WDk7yKLoIEluPk200kbnPhtY7V71ZqWyLbYjzMjnPj6uCN7/KGgtJSxF
         NcT57G4eTViY0KGvS5sjRb/z/LpdmtaK+IoeS3Hjq9iBAJtrj+0zSyZXm7XBJvatTOBp
         TmTfJvB81LdTv6X8LjfaS9IkKyT3m4C4yI4yhclBDEVECxi4zf9xYKJ2zppwDkisBno0
         juTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128224; x=1747733024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0JysBy8eKyfRaxM8+abK0KKxGJq0+6TwjxqMraY8ao=;
        b=XXlIQ6fvaDVv+sBmTy8LXGFsFA27WfLZzd5yd0ct+FiYjmeRx9YZLyyYo1oivGgjo0
         GCzGSNaxwHvW3n4RnWXIE8etx0jb0ShhTLegV8Spoc0xdBr2/9OSM30hpIlutaaijpXS
         hfEk8cCAaptLyPMfeIiHaEnXhacA0ZKsLyqeBrFtU8x2PeQrFckqOjdA7Ck7DO1/MrM6
         V6ZVaqkAtc92+O2xmwwSqkusc3AUJm6gbtLFyAYZuXp7iRfUXPc+mageuRN+yrsr2ktu
         liEj0cbMdZdJoAmqJZbLKHLMPiDYCIF/KHQEftgWmu15sYvQ4jyOpXYKRwkLIcyI4Wbw
         2HlA==
X-Forwarded-Encrypted: i=1; AJvYcCU8H9N8ZGjoXhmvLr9OSmL4N9Kc3O6hBMs2hs+gr+5HRvmuOiNhZrGSY8DsY6uoKIYrG81i1LB/1w4k6YM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzBMlkiXyhDNskt8CRvQ3L5T5a641+MST3wemWqenqutOjwGz
	7EFFGmOZVUNbpezujYWbIELwLVjliIx2TzAYM0aEts6VXGNr2PQIL0LDNfQahQpaa3kZn/Ltzll
	T9gQ0qznfbc56Q1Bsh6GiMnSLJysnsVVVmlFtqg==
X-Gm-Gg: ASbGncvODZvBn4L9uSH84bsjZUgg1PnrnLSkvF4W1OsAL5faIVt/Z0g15QZOuTTppxl
	PBfoNVxEPYWxde7gdJnoGyqDMQ29Qyt8xg480sYK0BlbYh8aTqCGsd9APcshTQ/D1WcwCb+rey9
	HH8mu2Zwy/o09VkYMdJp64/S8JiD3fWn5oRgwj86iGPRA=
X-Google-Smtp-Source: AGHT+IE9sGnGDBaDyOnYm93k9UkhcaHZ8PfclbuY4E3mgnB6Q8BTRsZWrBuS2rmfUo74klAfDLhA1ZQzmF+YltCFggc=
X-Received: by 2002:a2e:ad10:0:b0:30d:895d:2fa5 with SMTP id
 38308e7fff4ca-326c457bbb7mr53536871fa.14.1747128224539; Tue, 13 May 2025
 02:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:23:33 +0200
X-Gm-Features: AX0GCFt9vVmetkirZ6Xw9vmZM_a30I_l4q58kXaT1ovnCBgyKNlng_Y20L--BQ4
Message-ID: <CACRpkdZjGNxjhgC4X+e4GsMpc8qphFkHAdSvmXg-ttrVJgN-UQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] powerpc: convert board-file GPIO chips to using
 new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 10:59=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all powerpc board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
