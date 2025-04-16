Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E66818FDD5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792845; cv=none; b=KwOSeBNh67Ra2afZeCq4jZvcXA8D7ID8ySLvTSn9EikS6HmF5DashG/llYHLdZT4aBkObwZ8yZmdBA7pkoITXyqYNt0yq3CidutGyb9NdoQvVB8VSmmpoEw78Kc6m0SJgTAamQghwvXlMClEvGGavrdwXDpv4h9GgaoW+AZNLLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792845; c=relaxed/simple;
	bh=PHh/aRfY8+wUypvKP+e4vTp6hWiLK4jdDrHqCsUKIVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hi74YYTBJSGZrVw/whAslXdMTlzOgHib4mMHd0IhQjop8SnpgX9n04eY7k2A/zrGTp/gJMEntvx/MKObkD4g84rn5BA7eMPiXaAHGAwRJtp9GWT1CKh3SzzwsTln2+60UgS9pKiwzo7N7L5zGFaq8IkuKxCC5dijIp5ORHQlDX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWtqMtqU; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWtqMtqU"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30c091b54aaso58186121fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792841; x=1745397641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHh/aRfY8+wUypvKP+e4vTp6hWiLK4jdDrHqCsUKIVs=;
        b=TWtqMtqUbnndlZXrcmqxJo3t578XoneUttraopgU45wThvOwP1PIciuUVUUb1wFmca
         gLOk0Au3Ocb340W11xPvUNe7JQpwW719P2vRDLwCY6sxtyGoVTVQf3v2T1wmXv/YvGtz
         N06BMHcxnzD71/SUsFTK5qjehpJwGLpn9nRp5DN8aXP7hT3B23pg2Pcybt/Nt2aHXAFz
         fSRhYU9MpmF4lG7jngZjXLg4RwoybwhcFUN5Ay0+iHABt88gBeYsgdp8WTHQFEhDrDc3
         fXXLqNI28Q4rwYS0jB3Rh/aAS4MdRvWd7o/MWCM5U1Bl9wlJUa4xp8uKIszjLBptdyxW
         F8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792841; x=1745397641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHh/aRfY8+wUypvKP+e4vTp6hWiLK4jdDrHqCsUKIVs=;
        b=J/UJ1zXeuPKKCF0pVp8egY9OJ4+Kku7hc+zh72KsqHPSXLvG3HhyZEUZ8EVyoc795y
         B/DnOL3jjRUDF7DSyIbTcV7qHG1PuMs+Oj029ZjcNKxn7r63cuVOkBi9GH6S3o65eSCH
         oRxQZ1OQeaOgRlL3mA3kazk1K9VC4QE6K9SjysTVC/HaEs3mt6BPn+pb3U+2qAeA1+bF
         D/sEQBDhJVy4s6PmE7Jr6hb1THgauiwG2+2e5auHK/H3ovR5YnDoijbDkIX9EPxnFEdy
         eL1VeIZfK2QcbJ1Wuq5uUKFLvUEG1w1RjGRWrdibikdbEpco6vgWtARyGrXKrlgp7lsv
         f3wA==
X-Forwarded-Encrypted: i=1; AJvYcCVnQbBPnYxY+AtjjbCx19Zjo59z5FnGLgI/4Z30Ne0i1qom5oPhDZcWTco0ZuAk55KjN77df/0+VnznMx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW2wlBoaM4ly1RY8W9qjImazUO8BmKrU3Yf/syZeqP46AXbiCc
	2IxMdOQJcVw8Ki3EmCPkP8WqHB0AbnX4os6MfSnmO8iZFuoPtJrhiAvmnZMJQUm/6jPtj1WBGog
	b1GKjSGUKl/GPfSw6FnyXnyNKVhNlDBRBOAaFkw==
X-Gm-Gg: ASbGncvw+ZnJ/ZoaGYzqjjn4+XcivCBMqEK/MGmLXOHVzQhNkRrxK7yvpZy2n/XVaQw
	uXYxLSiWNuEbjTTssxggv35wxIdcpA+ZTmC/ZzCrLsDBY2ZV1BZ5eGuaxYwCy4SJkyNDkUxfv5K
	KwPE9rGzbWysfMEr3aJpp1gQ==
X-Google-Smtp-Source: AGHT+IGXJGhNz+mk0TZsHepSj89HZ4QI/X4KU0wcHP9b9BgfARe2HBEH65LiLbnFi6YoSiuC7mQMfBNes0SrZS9sbw4=
X-Received: by 2002:a05:651c:1449:b0:30b:f775:bae5 with SMTP id
 38308e7fff4ca-3107f695229mr3732551fa.6.1744792841610; Wed, 16 Apr 2025
 01:40:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:40:30 +0200
X-Gm-Features: ATxdqUEgZrbGhdEVx341NHRm2q6vw1HK4P4Z6_t5Dx0MHtFEnd7bfBAyLDkiym8
Message-ID: <CACRpkdb7uS2fGsjeeLsZeBEpqGnCOeotdkTd50DGr_sWC_ZEGA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] gpiolib: Print actual error when descriptor
 contains an error pointer
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Print the actual error when descriptor contains an error pointer.
> This might help debugging those rare cases.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
