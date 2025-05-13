Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360AA28F946
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143137; cv=none; b=HMueiOuaKyca1RTHiKs6J9QJ0JSl5FCNZSWPyhJqBpyn6oEAsBLl4fF2MY6R6Wf2b+U1aSvT8XZdrUSB19aWLln0Xdg7JAnq8/n2bhlRvPu46wxufheC8rDW0oWybp+j9fCwop/9suAgN6lDoKJtaFz05YWwX2fghGkDR6PoN+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143137; c=relaxed/simple;
	bh=DolSbnwhb7CK4zMm/bekFzKF/EXyrPh2OwEX9Ve2GUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qe5KWXtv8DmtRc1JSCwozsE2MKHlesf232BAPqaTTD+Cvi6WmZsLR6QLYFC/1p0QNR4EfkY/mN4DR+PeQdfCm5sEWi7ZLra3sq35WTeLsSVz2Po2Sx7QTvRBL+SPmo/eqxmleBf/gmRomzm5tXOXDfXwhE+xn97o9fEU81ho1uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dAt8weXh; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dAt8weXh"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7b391ba504so106690276.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747143135; x=1747747935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DolSbnwhb7CK4zMm/bekFzKF/EXyrPh2OwEX9Ve2GUk=;
        b=dAt8weXh0arOJtMNnoYiywf0sJy528l/UCJBJNqlL+htWtGJvosdcJ6rUaezvoRt0j
         x7bVBI2LxC6szHZgs8a8/xtjD3NXt4ZYxD8SsBIouGHsrWapfcp3CPSQFtWjwiR3lybK
         1OAnBozcYoZ35pQEO/oobXMxHqs98GHDFhCtpgw1IsrjG1VysLdrpjQAm3lH5ZABdSXQ
         RRPuKx+wtQs54lzZbgEusD/pvsxL8kkqyMHuy33aNRXKuWO1Av6PcdeX3wHatlKemzKs
         vuODq6t75u+v+frXUxexB5ejwe/Z5jLbNoKCchiCvRuIjXF1zZ7/vlYYfdr1KOSQ5goc
         Bcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143135; x=1747747935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DolSbnwhb7CK4zMm/bekFzKF/EXyrPh2OwEX9Ve2GUk=;
        b=Zr1XwN32L0eFIYLxkhYrkwxpTVXs7urRt+nvKceCJxQ8T1zHqihIL+UM2VN+8WqBjb
         bmIZlPDkGOcKJf5QCr5Phcf0UbAwMRtCXxye34tr1x499Lyz4HQi4FgMkeMNX0b77y+r
         /POOLrUnFnUvRY3uBTqVtEUOiihKN6hU6tYvK80bfFnJ0w4l2Ukliy1bQTmEBesF08jb
         xHRgfn07+qsb3Ei6QIb+vNhQmXQF7TtKmoOmdl6M6Xgja2a3Os08Xqz4vwLQGhBL6Ygg
         o3EogxsatoKk0rfVjkgIjwlNYFZ5H3BAv5KGG5DbmT8rn1OZ2tf0/XJ4kkegwbo3JjKa
         ZI3A==
X-Forwarded-Encrypted: i=1; AJvYcCUqUKwmT/hV4HzIl+o3k1qJhOnDWIHiltmWq9AyXs/rEgAuth07NJy1LbUR0U+PcDunlyw8zDL5BKKnb7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpAV0/SYfeQDjbSXXj9+1oKEeR5yxv6mVxDmb3jcsQ7zEH2Tq1
	MquPPEs5olVoHhvpJQFuItn9rhl+k3LyqUiSEC2un3fEGT8ivT70Lk8fyKn0YI9l/hxXM7gPGns
	kDCzXI3JoBQ4wsAXABJ64W40ZoQ5my6NjcBvElg==
X-Gm-Gg: ASbGncuRcVSPkJRlVtYeLe36OuS/fDAesHlu8OmeCj9lYXJqwl3u3r6X2PoDInYUU4B
	PIuXbrD4nfopMwyirRWwGtKzpQ87lvg0GhtChElDmAEI4i5avKNEyQQTxbDfyKExrytDm2zjkdy
	5hVtXAHe2Zt3h/Mt5ZmBndeVEmxV/kecLF
X-Google-Smtp-Source: AGHT+IGiybJfQ+z5Jn7pmSBhMFaRx94JyxJ/gdqDm6nzTQPskCAu2xeEpG8J7Rdc9VcKIJc2nXp+xlFh+U2qXZzoTJ8=
X-Received: by 2002:a25:a063:0:b0:e75:607f:434e with SMTP id
 3f1490d57ef6-e78fdd2ddc1mr16588046276.36.1747143135013; Tue, 13 May 2025
 06:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com>
 <20250511-i2c-pxa-fix-i2c-communication-v1-1-e9097d09a015@gmail.com>
In-Reply-To: <20250511-i2c-pxa-fix-i2c-communication-v1-1-e9097d09a015@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:32:01 +0200
X-Gm-Features: AX0GCFtjrC7TvruGjGxJFmXvhSkIZU0U-gCg7r4ao7poGNibGwZebdwuLG5fs_4
Message-ID: <CACRpkdYB6sjp4PwHumkj1kj48oUzSZOUFQTX1i==P8V2DJBx1A@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: add init_recovery() callback
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Robert Marko <robert.marko@sartura.hr>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sz=C3=ADa Gabor,

k=C3=B6sz=C3=B6n=C3=B6m a patch-et!

On Sun, May 11, 2025 at 3:31=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:

> Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
> and modify the i2c_init_recovery() function to call that if specified
> instead of the generic i2c_gpio_init_recovery() function.
>
> This allows controller drivers to skip calling the generic code by
> implementing a dummy callback function, or alternatively to run a
> fine tuned custom implementation.
>
> This is needed for the 'i2c-pxa' driver in order to be able to fix
> a long standing bug for which the fix will be implemented in a
> followup patch.
>
> Cc: stable@vger.kernel.org # 6.3+
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Clearly, since the same problems keeps appearing on other
platforms as well, this is the right way to go!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
