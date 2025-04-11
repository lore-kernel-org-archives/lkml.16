Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E6B283684
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357419; cv=none; b=fySvdhEuriFsOHlJ4tZbaXF2eQ44JV+fUjB6SpLkpz/a+PWAiRLusapxUQFigzMkbB/INZN22h4iNr+eULWXujXXvfe2ZIY6zVQO0jLJNOuUS6peSMdL2YgUASDoXYHScyjUQFpZtX/2Qu6zRmFEsYMLebXronX8lRJanwkUQV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357419; c=relaxed/simple;
	bh=H1iNItrNAcVVubh6PQ1XE3t0Tvyjo+jQ6fDUAqtrHTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWByURRpEeGrs/ZoeUDOJyfROPY7qopzQwrl2hYNHI1qxjMFsoNVSn9dwdg7+rBEaJ6gxQIIl6z9RcdcljjcLMuuFWXO9+Lw8heoqZZcCcUQ1EsxFqRYwFiq4c9JZM4e5vc0mYMDMP7nTUT8+sO9DsjKyazc7+DXSpO/2VvpWMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xja4ahKU; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xja4ahKU"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523ffbe0dbcso1819592e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744357416; x=1744962216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1iNItrNAcVVubh6PQ1XE3t0Tvyjo+jQ6fDUAqtrHTs=;
        b=Xja4ahKUdEvYzuY1rbV9OD+ZghUSrMtUoWVWiM7tJpZKzJH4KLsIzIKTHv1GNYvwzv
         NVXSF0yh+Pr/3ukBmu6+JGrr0m3lkaMwFBTfOOyQfwG7g0c+On0vkYuUzF+iREQgwbex
         XL67WCnF7AsF0fzklo5dAMRAcVM6vHv5QPToethxB+wt9zogXipapmkMyXMIPoLvCLmG
         d+iQwBw5CxldqVYO+ZTDeLhkzFwtmEjMZhUssrEjHsOh7vCylWtC0HZpHHxEMyhfjlEE
         8MgovoriVoCyQE2OYcxvLHBIcHj65Gl1a/oMdoa3BhQYBB5CWd2s1Dd33PYjNKe7Q36v
         iaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744357416; x=1744962216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1iNItrNAcVVubh6PQ1XE3t0Tvyjo+jQ6fDUAqtrHTs=;
        b=gGNAUgtaXrRDM1k4aoi0XdKKJLqYBtOQ/5JHK3vSuPwcowCceKUkv+FVkF3E7IEooa
         CRpdLk4it42wOmk6BBhS1u0DL8SOdrhR7UgnS4lkF9WYD1aqL+Llpd5GIMBV9aCS9K0c
         GpCeh2EMO2AtiWYJSRWeWQ8pypY8m3Qd23jmtupNxq3y/k/6t7OKiF4OzLGa/VsFGyzL
         n8UShXJSD3Tzy8sDyTFmJrhrfT0ONZIbH4n8WuMwbsssbjoQ72yM2gUCfYcy7XOeNQXt
         OxnOQiNi4Fu/xVUXSF+j95bgRrnVp04/1NENJTqpYSwXL+Gfx3RzQVK9QpY3KXhTQ8oX
         T19A==
X-Forwarded-Encrypted: i=1; AJvYcCVnCR6tiCqqlHSXesYigFz7RckxDVev6wi5X11REgVdoSs2LTehoYyaE+xi2MrxDUsuyH8hj+5dJljlavg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Vop8OiJCjrCo6hyWe/Rpc21e2Aj77c1Jx/FSG7V/Tykp7Alb
	jmdUJPvauGWH4flIQZwnkwgTGdvUDmhEpS6LJuo2zwdnG/VQ91w7mRa5JaJIsH3pb/DYthypsMU
	5O8LmFwOsWeFdk3zVHJP6shXjqsw=
X-Gm-Gg: ASbGncsgVp+RBfdTY7YFpm3AKTWvxRFUPNRMkHffkwqEOdWfWMf23BooS4M3wKSo5Wk
	mlHzKkqnnLZHa42ikziJ6874Bx4yZ0vA2YfSVbaobudOS+1Zk+u5sS5llo7+dqhpQFZtU8WuqSr
	K9Ls8nttptKM06joPUCFYZHZM=
X-Google-Smtp-Source: AGHT+IH/nsZ73n13m8DI++AjCwNN9ubVsT2FQykIFqDBIKtWwVSP5oMfTX1HJz9BRPnYe+C2so6tCNeTfV+2Pz4BZeI=
X-Received: by 2002:a05:6122:1682:b0:523:7c70:bc9c with SMTP id
 71dfb90a1353d-527c3516e4cmr1056591e0c.5.1744357416465; Fri, 11 Apr 2025
 00:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/bA4tMF5uKLe55p@ubuntu> <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
In-Reply-To: <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 11 Apr 2025 08:43:26 +0100
X-Gm-Features: ATxdqUFBakkl6mnloP_SLGH7-FzGtLRxl3pEfw3W4Ceoh7Jl3zD2F5lST2gYKcA
Message-ID: <CADYq+fbHCUigvrTuCLiF1TXN=VEBO42PvHQqvgfmTgJejLqS4Q@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
	dan.carpenter@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 6:44=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Apr 9, 2025 at 9:48=E2=80=AFPM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `& 0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation `% 4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the
> > sequence number cycles through a range of 4096 values.
> > It also makes the code robust against potential changes of the 4096
> > upper limit, especially when it becomes a non power-of-2 value while
> > the AND(&) works solely for power-of-2 values.
> >
> > The use of `% 4096u` also guarantees that the modulo operation is
> > performed with unsigned arithmetic, preventing potential issues with
> > the signed types.
> >
> > Found by Coccinelle.
>
> This should be folded to the initial change since it's the same driver
> and values most likely are related to each other.

Okay noted.
>
>
> > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > $ cmp rtw_xmit_before.o rtw_xmit_after.o
>
> cmp is good but not good enough in general. Here it shows the 1:1
> binary, but in some cases code can be the same, while binaries are
> different. To make sure the code is the same use the bloat-o-meter
> tool instead.

Okay, thanks for the suggestion. I will check out the bloat-o-meter tool.
Adekunle.
