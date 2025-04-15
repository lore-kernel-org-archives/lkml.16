Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97F027A938
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705981; cv=none; b=MyyNy3ceiAf8AmMRVt6hidYhuI5scAHJO8Td/ZDr+S+VIXkp0lD9QiABxk+OEgljimw10uJmsv88tT0xJzr7hubGtM07fq8CaA9kUNHGGC5OpVW2bUhGHgo2OJATK9wjf/m1z7B0LQDqtNLDGV5UqI7CD0Lg+arCpTMGc2bpDM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705981; c=relaxed/simple;
	bh=p/sfemeB3+3AkoNBn983i9nv2fEhv2yg6yOcdLv/+hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHBYZxYYEzoKMFjEQ7dYh/JVvHOLhYsHuibKL8Jg/Yhv6aegK18QScgOWyHS4uRCJiZ8MkXU1/czh+eFh9YfTCuZ8wber6UtGewb6a9ocmWMKtSMLHsvE0OU48Wto7dkwu0OLsDYuv/e7znU9O4MVwgFNZgwffQRSd7BEc3SGWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0nkpvfg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0nkpvfg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so5517377e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705978; x=1745310778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/sfemeB3+3AkoNBn983i9nv2fEhv2yg6yOcdLv/+hY=;
        b=Q0nkpvfgEMZiIYM6rWgOZhHhOiEvBFZyxS+X+MwOlT5bjg6uPCqpdltlgAnIw/42mr
         Fb/c1o2yflo1ZqaZNaWRk71JzfNcvr4jwKB/CikUjIGDwKkiplyRcB46lbNMv4iFNAed
         SnhAS/Jpw+wsxE9iZmo7T0nIwdYsf0jk465kEOoaL4mPPv+/hm/JitKyghn4m86nEZt/
         VmpiEjAFUl8X9EJgErZm2vMMqU5OPChGlrqB41fpaaiAfNVopPfTbq2VICULqBZi2ibU
         AtW34RDZQoTDlIB6HgJ3Tl2xm5qKp2WfJUnl+t/b+7tt1CjWwJ6y2ZOh3DDV81UNkNq+
         6DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705978; x=1745310778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/sfemeB3+3AkoNBn983i9nv2fEhv2yg6yOcdLv/+hY=;
        b=oixJr5XpOH7rco8UOx6KHFxUtctKswxBYuNh+cNzsSubWMdM//PgS6r4kHRE86DMUI
         G81AY1XftFMKUZrIWsH5/yAref73fnnQwymWK8A3kSJWkC+TuEgfOmzeIX5a/PlvO0u4
         ZcstiChRujrwYQ4ay3c4W9yprq71YYs9QjeuqJI5IRePhfqg0T2TSdYVffYRkTJfGflP
         pV/lw5GrjGazt17MKamoE7Zih+keRzTesop/p6TPisNs4tPRQVMuBleDNYtRfS2SvgRv
         dBzqH+ndfRpQ+xJi5wiPqsTOUE5+D0+/uwMxc7KAPxZ8qbzGNMYa8lI6mOdx0VWQ1dFU
         xCFw==
X-Forwarded-Encrypted: i=1; AJvYcCVq6ye9tlXcRsqbyvuSiPZd5R72gjZBDUmCOCx872vVUaJB9cudNgLES+N4oKOu/kGZs5oKAUauM7Krzj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztp5jsixKhpEYiivb3Bw6NNOGThoCXrbzdcXImfrvgURgeYRSj
	eX1625obNB4mjDuc4Bpy+S1yjEYCG/YJl5AePcst3XtJgyJJujuEpxfGrGYF+pFtWP/G6t6w7Od
	X4rpVJi5tb6C4vm7FOOabAzqCJTVMPWxVIdwWvg==
X-Gm-Gg: ASbGncs3MX1Z0iurN20cSmg9IeYGZV2XAp0QbxNTsL+rIKNd2fKqWxU9b30P3RD64bt
	SOiHs1r8bNyjc9WDl8Rw+Yjp33jDjv5AfHOdyawNdSInyFSf9FF9XYYBH40iX4/2LbjxftqehTT
	kjmMgyGdX1zo/fnkRla9eNog==
X-Google-Smtp-Source: AGHT+IFY4mxWjOvUJ45dJSrLBON1zaTvdnLpGG/sPvryWvonle0qbT8VZTQ6lzHhQH0TveUlkekm7lMiWhkJTsAbCfk=
X-Received: by 2002:a05:651c:1597:b0:30b:acad:d5ce with SMTP id
 38308e7fff4ca-31049a1acd9mr52007071fa.21.1744705977861; Tue, 15 Apr 2025
 01:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:32:46 +0200
X-Gm-Features: ATxdqUHStbj-Ti_vRnViTaRVrQ8zaVNPZsXG8wIEFb28PzUwDvLDxspkFk2FCi8
Message-ID: <CACRpkdb0RHqYejNJ9w5HzvX0nkYCJRpdzsp3=JankRkJKYXmdA@mail.gmail.com>
Subject: Re: [PATCH 0/4] MIPS: convert board-file GPIO drivers to using new
 value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all MIPS board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
