Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E01200B99
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704251; cv=none; b=b+RpHZlXVz2Xu7zLNYqBuMekMusk0Og32ny6qN2B6LWDnUMhH9qozwroaQWlUmauaNQku/eL9dw+NpebPcCcQx+4DELvZD/QICFx8luXwMboiPbsTXHScEXSCPxh7A1J9IcrFCQUY6JlJxc6nDi0YaqMti1IV/1vgoGAn0j1OC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704251; c=relaxed/simple;
	bh=QLWxUOmPYPHLT3lvW8wfZ+nFn5LENG/ShZUKH2xvPcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ojwtADiBK0llU/uaH24L7F4sSXHO4ZBSSCwnrsqO/N+hhdPVGVlb95iUQm/kVxYQICdzbLree8rdhHbFViRQWA3Y3qdznfTjxh42+P2fUcWR7q36kV+BgLu+3nj/G6PvJtJ0LivwttFWUnBec3cid2CQ6DsK8EHOtIdAPCvJznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqGsx7RD; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqGsx7RD"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30db1bc464dso49801521fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704248; x=1745309048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLWxUOmPYPHLT3lvW8wfZ+nFn5LENG/ShZUKH2xvPcc=;
        b=ZqGsx7RDfEaJl2LPEJkgVR3es4UItjz2cIGPCEFY38LsKVo+yFkMwBsgr9xwMkHrd6
         JZKs1LAtFM0Vl39XKRgN7tOgBGnPU5Zi0dic6Tjvp4DB23GDHqh18NJBoljFFBOdh9KR
         x45wNPpuJPWosG/fyqWk5eH0GM65rbdOQIl3na0shT5tp45fH6VqH86v8Xjc1WVNsgbj
         HhFtrcGmHUCsRuSF9qTV8YKaPs0acKz49reanDXRFA58ShnbQD/dWIu+wQBYN1iA4MwP
         5aIB0Yfb0zTjabDyxpsnAB1QJ6oAkbzx6jYPYX24Nx42r5Yg+F1EdWlHvmEYTmPz6d0C
         cfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704248; x=1745309048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLWxUOmPYPHLT3lvW8wfZ+nFn5LENG/ShZUKH2xvPcc=;
        b=LcWj2+jk6Eu8HT0Y4nsaz/Fos3Y+lWXDKYmEath7pCxNYg+SpQMp11uh/VEdzCdUkb
         ETm44qEptcdBn53HSdhzJDQbjAx3vEvMa7kzRO4A/1CO+yl52lmkQcbiN3ELGVWTHHe5
         Kwi7Bdyzi6wVBnEKuMI+duilQlsfuTU9GmcAOqCZIHsSJ4iNvagpQSA2ykm+bmpZq76l
         IGsE2G0ByA71FJYqjs+Gc6Ou4x5BY5VcZB/+kd4C3C8GQPYvpGsjWcuTEE0SjWe/ZxET
         pkm2teNGcwVnnyhUrIqfVsBRizelfsYeVkYcosEuMjhpJI1Iv4aWSfAPeSx/7GDRyl2T
         LLIA==
X-Forwarded-Encrypted: i=1; AJvYcCUqeObjLtcP09EOevhwJB6Tq2qVKSmaqNz4yj3dxxOVJne7AnDR3/+StuGnKnXogglAhLpmDjcWw7lIOOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwltuTfkXRdWM1zb6qcSnDZgJMauv2vA6DQgtKS1Rntosk+AbHX
	2822+wCCbVaw1CWLwuwak31HC+d393oeu0Qfu9K3C/LOC7dcdBYz4vpYvEPR/vVKwq/+ZniEr3K
	3EzQUtjVNqnsl1UElHhXHqK84lFRV0UVC6cBsJg==
X-Gm-Gg: ASbGnctCDincQNa504qFTQ3XhR5JanCY/2qsr+x0ip562O2M5S8yPCiv4SXQPUjNU1o
	BrKy8BbfCocj3RN6fBratFtb3qdObXS1OL3DmqU3c+SpgGdZMyaYo7phpQG1wWEFP8F+WBKqoPD
	9yvY2eBmMgYrgdFGWx9lD9zA==
X-Google-Smtp-Source: AGHT+IHqRSr6nFzZBt6p+EtSPOjYAjNfxngoswBHALYRtjtD+v6Yk7+0wKLy00M7hstsxT3H1VFC+s1jS/5ENL4UGx0=
X-Received: by 2002:a2e:b8cc:0:b0:30b:d0d5:1fee with SMTP id
 38308e7fff4ca-310495185e8mr45959991fa.0.1744704247744; Tue, 15 Apr 2025
 01:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com> <20250402122058.1517393-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250402122058.1517393-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:03:56 +0200
X-Gm-Features: ATxdqUHJ4G86uxn9sLVjJPZ66qyKYlYFDtxUdQ834bLnwxuZ62-PXoSXYTWfag4
Message-ID: <CACRpkdZYKuzziVdbXzrzj9N7CUhtXKYVCQnvgO-527Xx-N95Pw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: of: Move Atmel HSMCI quirk up out of the
 regulator comment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 2:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The regulator comment in of_gpio_set_polarity_by_property()
> made on top of a couple of the cases, while Atmel HSMCI quirk
> is not related to that. Make it clear by moving Atmel HSMCI
> quirk up out of the scope of the regulator comment.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
