Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9DB14B959
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 07:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744530288; cv=none; b=CGP/XFis2Wa5Z5EqY8MIFUO6KyV6cqo6Hp5Df5al3JnmsQNVReH8dHyxG1dyS2817T2Y0CBms6F709GucQDkFRyJ3fUZqPRobBWnjTQ2AfDbYrP4G4Y+DLOaOAioPqTyWJ9IZWLyDEvZGRYePVsqKokHy2kqqCb46GHyZxn4oLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744530288; c=relaxed/simple;
	bh=6PgAG3a6aJYKMvrW8AKuzg5k+f0sv19sOJ6k+7WMtVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ih7laDADFT/UyHrW/l88kbsMEafQcj8a0b9EzfX/iPBosDbWDZTvsKztFgTmxJbPvt5jciK0QpOLH/ky0INRS6X8emZ/gA7jF9OkiWSY4JbvSLyxpezlDlX7ZSrYBP7g943BE1h4uhYmmtuJ9ZRXo5wfY/XQgGT8dYUrBj+jd5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M8EcKChW; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M8EcKChW"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6fed0620395so32594777b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 00:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744530285; x=1745135085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PgAG3a6aJYKMvrW8AKuzg5k+f0sv19sOJ6k+7WMtVc=;
        b=M8EcKChWNTJprjY3ewDJrDZFXbpWFF5H0gGQYWPpKUL243thnJiTgcjOy/npJgt5QB
         r1SgiXmKGoL/R1YWYNYJSNUIQz+4QmWTgkxPlmVv5yjA05yFoylekV/pGAl7Gq/eKs/6
         aZTDILQejxHoymQDcHhA3IayrD9KH+kVu7G8GV3opMW3gkM3D0v/xYN5jGAPJd/cnEXl
         hLr0FNcvX4ACRwLPjh5b7HnXb4TO2se/iiZ29kGw9K3HxZHC6rN5EZ1SVUBnI9B3lXFE
         S99ElkDhY9yX5vZg32vpCMScUhnUJ8m/dVNzfPDuRAGATZxi7pedUycWVrQzjy+xjGeZ
         Yb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744530285; x=1745135085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PgAG3a6aJYKMvrW8AKuzg5k+f0sv19sOJ6k+7WMtVc=;
        b=ej+xgxKO1cIzwP+/w22DS2YJzOQCOzJ5cXyR6I6vJUHyH9rA5kavSq02KsL7bawqZU
         b0B8+/f30dJbHkjS3wBhPGsXqCpC/klbu/Sm1izBEcgJE+6Mea3RIkeQCbxyOSEa4KZc
         cawxdR/TKUzrcWBKQaFXFMMORKtq42PXbiAEWrAX9DqM5LBd+8aFVLkzQ3yqqPs+MvmN
         n6oZ7eQyNCXbNBMwA6Uuqz0ZA3mOg7PyCWA41zz4DDtqW8k+VDl/jld7soTK+JS/xBT4
         2UW7NoMzxejfbmN8+a5BgFqW5EcpsfNCGN0nCSIm7zEV9sdfOFFHb/kgI+GrvpOl/dP0
         Et5g==
X-Forwarded-Encrypted: i=1; AJvYcCVaw7mz0dss9K/fG5jB/dJjIxLtql/jc5FGu0g18K/v5OLjgMcTZpJTqd3pTPvNBATP1jvQNOs5ESYiNz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy0K7OCamSkDlTVyZbQJBDXwO0La3mItN22nctANaaPRBrsW4Q
	Y8vAk8RcZMhiczdnMn/V4iFJ/3+joL299DI1PWTiKWZmaagnnE8Aww0/HsNti6BlY1midhDpM17
	3Lkdm6oizZl9lfutAHEnxGJFMcfwV9I8HWHnLhQ==
X-Gm-Gg: ASbGncsQMt8q2HlLy72lAbYaIjMPoQo7RrAPGSi/70c9ZA/AR8WsC4XZO5klk1GXES7
	L9b+kLhSpcSHe/3yin6YwxMP6uyrOhS7ZEcT+pxa7uhMlbapgApbM/GOj4JHK/Zevgrcf7Hs8zb
	UNsYZLUfEFXyogIkYK+CyUI3w7VIgCgPmC
X-Google-Smtp-Source: AGHT+IGnz9t1bpI6ER7ZFzI5vSm/FhKtXl++YREat3fVWg6oOd6RaVuGuUfbNcQOUCtjxGSO5ORRRfip1HP9h8qn3R4=
X-Received: by 2002:a05:690c:4d06:b0:6f9:ac35:4483 with SMTP id
 00721157ae682-70559a76bc0mr139648767b3.25.1744530284725; Sun, 13 Apr 2025
 00:44:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412193153.49138-1-chenyuan0y@gmail.com>
In-Reply-To: <20250412193153.49138-1-chenyuan0y@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 13 Apr 2025 09:44:27 +0200
X-Gm-Features: ATxdqUFpVa63-e840A-rdLE61fA7hjoSmDEuD2aPKLnud3g4T1J-jN0eIIKeXSg
Message-ID: <CACRpkdaai3M0LXx6RO6-E5QFnXtH7s90Qi+HsudSW6W6tk9vUA@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: brgl@bgdev.pl, theo.lebrun@bootlin.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 9:31=E2=80=AFPM Chenyuan Yang <chenyuan0y@gmail.com=
> wrote:

> Add check for the return value of clk_enable() to catch
> the potential error.
>
> This is similar to the commit 8332e6670997
> ("spi: zynq-qspi: Add check for clk_enable()").
>
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 966942ae4936 ("gpio: nomadik: extract GPIO platform driver from dr=
ivers/pinctrl/nomadik/")

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
