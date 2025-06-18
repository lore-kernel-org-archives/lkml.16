Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BCC25B1DA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750247871; cv=none; b=l+h6LFaeo1t8jRIuOoT018cXR0ZKlqpudIzaFAaYFtmdUyalhJJ+8J4jDDBjgb7Y1mLtVGJ/B6ygzBPXg7kf+EbcsoDDNzcxu9iuTzUwzAq5cv8up/exHtT+6J/JZso0dy+7n5w+Zmox7njR+jqHe2Tph/gVowyOHUO9yi+p8iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750247871; c=relaxed/simple;
	bh=vXnEOwfbKTy01z7cobE4+Hk1SMKWVRbeCD9p5sV/Oz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQCsUJQ0FpZJzp5fIDgW+2bZjoPKQivfh+kftrCrs8b8V41QfOORPDTryAUp726of6wyHPoPXtBw1DfmScOLaDc2zoYIMdjBr4dH1ijmGGf3E+x5QJ8dDPW1ry9RMFtPsqEOh035CYXN21vz+QUTtk1gcUGZkMEcKAZ5UKHSW3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2inLkLS; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2inLkLS"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32934448e8bso56779651fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750247868; x=1750852668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXnEOwfbKTy01z7cobE4+Hk1SMKWVRbeCD9p5sV/Oz0=;
        b=c2inLkLS7uGMLLdc1vIjANQFCN+KjvLGE0lzx15n5a/kdBh6e6fgOgAs6X82G8szrE
         ERff8kCPgF9bM67uZrv+RLnANOldReYE5+mQfj7YShoMIKwvkpu462a0TiGOIuF6f8e3
         fp06/R+ytLUpdJ5qmOI46Urdi08IHS6zpFSpVwOHO/D1pjmICqT8EdbIEXRc2Jz4zoue
         yDnLfAEMLWp/I6K57JSdJzcIeQO4R1YAPNRyKcumwkhGSEukZzB3Ysa4TY4AzEz+p/3t
         pHIxftSoZb95mqOo8xfgwhl28AYTftoblB7l9+8oorIetLY9mkKuKz2HNGf0mBQLaYM+
         Pz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750247868; x=1750852668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXnEOwfbKTy01z7cobE4+Hk1SMKWVRbeCD9p5sV/Oz0=;
        b=WkKldIq4xJhqZOGf7escusxone6Iy6xZSq+hptyShBPMAUvB51eJe1HugNBku7pvAL
         c+WEoPP1X5sBk7XK5PYgK7ytABxpenfHP3LAMDdP+hMaMxFD46lKUxatsHN69eOn1LtE
         AfvTEm3MtIhvBgIwRhaDcz0DfNaCBYxnM6y3CA6Fwj8vMWdmBhTI/3pyKEbE5og2pwzp
         qlad2obQvbfjsNsx6hSu9hhQwAPHNra5CKPfd/z0SnM1acpwxKD0AqayOepuQiH/lzPc
         ClspC7CM2xUaZezujBnDMNzSUqJlMAV5SDcbOnNXWzuhYBJuwnlbY8rtkl/03J/LO727
         eHTw==
X-Forwarded-Encrypted: i=1; AJvYcCWJWw8YDY4PYYeLqcWWtfvBD1l7jj+xEii8iP0BIMmUJGGU90lxYbTFFoTmqPq3KUT8M3VZbxrqgh/XjsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYcjow7BO05SYrhtZMbjcgxq5Roj00u+FbpT7ZNv3wtgIzFVo0
	uzN9IE1ieuytfFXtdaSFnS+dxP19aBzyp54n3n1oD+3tkG0l175B9wRm8NZzZBNrwt9FiGN5NuY
	ZXGGegmNHTYw3Qq2OGLmxAJqJ7YSs7a9ds/hzQ1aFdg==
X-Gm-Gg: ASbGncuOq3FZi0/nDl5IO3K38oVJNFQERrypwBIzrs241o3B/WPjSRc7Sv3LMxqLIcq
	+vtP+xa/eMf+AK5Klvg/ajG+GTO/JcXi+Zkz8rAnh2nnibnHdDTWX1k0VDc498p/bPVdWM2tLAL
	Xm8ijEdGJWFNyE1M3vywANaMeBqLaHHh1QGClsGDbdpo0=
X-Google-Smtp-Source: AGHT+IH7vnMyWvDeuT22AfjJ72jh8AlElSg/X6zhBdg5qjqst8eEHaOrlL3lefZJep/KKAH4d2AwxAgcyFjM7bagkmM=
X-Received: by 2002:a05:651c:b20:b0:32a:847c:a1c0 with SMTP id
 38308e7fff4ca-32b4a0c5893mr49570841fa.6.1750247868176; Wed, 18 Jun 2025
 04:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612091448.41546-1-brgl@bgdev.pl>
In-Reply-To: <20250612091448.41546-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:57:36 +0200
X-Gm-Features: AX0GCFtRDJgqMbmd8SADniLZIBDm0lbd_j7zrP-SEcNHH7wJbISn24C8wb9wJDI
Message-ID: <CACRpkdb9OkfBS49zjo38L_0zouz2SJmfJK3EaH+YZMPqXacODw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: msm: mark certain pins as invalid for interrupts
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 11:14=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> On some platforms, the UFS-reset pin has no interrupt logic in TLMM but
> is nevertheless registered as a GPIO in the kernel. This enables the
> user-space to trigger a BUG() in the pinctrl-msm driver by running, for
> example: `gpiomon -c 0 113` on RB2.
>
> The exact culprit is requesting pins whose intr_detection_width setting
> is not 1 or 2 for interrupts. This hits a BUG() in
> msm_gpio_irq_set_type(). Potentially crashing the kernel due to an
> invalid request from user-space is not optimal, so let's go through the
> pins and mark those that would fail the check as invalid for the irq chip
> as we should not even register them as available irqs.
>
> This function can be extended if we determine that there are more
> corner-cases like this.
>
> Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij
