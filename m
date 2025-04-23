Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E33628DEE8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745433372; cv=none; b=WfEjlAKjobcUw7P8zPKsD9FhFoaisYH73DxIn2vIqdut6dkZm3Ijs7NDzDNFVRLomncUtmYOSGtqyDvRv3aYmkhMSsF89/P3P7UexRntNh7wPkuntP56o/9TdR4fiplo6NUeG7xIEmGDiqrrLMuBpQmAi0Lpgnrcd0svbexLtMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745433372; c=relaxed/simple;
	bh=CQxwBsqxOevm8XyRK++9ix/s14GbRhhSVJJKe5IIdUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1NDrR4vzHcf5CuEzW4CESvyx2XE6+KvabgQNobgnRRCXlpbXdrdJKCz77Bnx2WYezTI0nYrTVI/w/RGyHQHVa88hO8fmh3j0nHpdNwkwk6wee//Ye0W5oy6zhO1H3UACuHkiNMzVvGSXyCeIz7NAuFgDujEJSg/hOu5COcablg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jTFnRXCs; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jTFnRXCs"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3105ef2a070so2325731fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745433368; x=1746038168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQxwBsqxOevm8XyRK++9ix/s14GbRhhSVJJKe5IIdUE=;
        b=jTFnRXCsW8zrOKUSQHGTcbT2G7+l9u7h6kHoUgyfwDlJ2v7lKWIhJDa4LqSyIGfWhF
         NMcxGj9bfw6PxBVX/YyEjGEPk+TNS4HvgI/sz+zIOwv0/8oDxuKYt36jmbms9giekp6l
         sDAHn5sw3tS1vN5gXmiN/GDiA8+fmjYsSK1xOXvSYWcQELz2K58O/EJePhvGO17bWzdA
         BBtAw6jeI2mx8Etr/OOntYdOEvP7NZ+5RKWID5klvFj3CZIbQEZlDvbdwEFjGxf+uMux
         PS4FsfX1TmJnZq9jakQfExB2b9po6YUVIEgGd8tHPWAWUgGaNTYZCrm1CsBqLyZrX0OM
         GcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745433368; x=1746038168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQxwBsqxOevm8XyRK++9ix/s14GbRhhSVJJKe5IIdUE=;
        b=KNlJ0Q7kxDk+XP3mGoIjpSDWwrT929K2hePtS9L0k6jzR8Iez2hoBnVHYIoh5QYALH
         +Sug4WIaMuW5jKRbschVLGkeqVUx+RddagrODeXwYuxjj5ccQcyijVh3/4uwwwA0m//0
         7eH1Al32VXPhPNTLQrWGw3APYoq+H1rL0C7bjDhWTU/Nexs5tPOGfSLJ9Z4qBZ8QRtnE
         E/3BUY+ntS2UGAxopwFxCLV2Vqjz1pLHeYxbmDlXwGvcoesF+QXUU2GheMUWphCX9wde
         TIlVit5e1cDl1NrzuOrTFEtZrQNHx0g5DWD3mqpxH54k1l38uf0+YsC9V0W4aqB2dsUS
         KrZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOdU6Ef6G7ILlYg+v6NeVjXEZ9ph0mQFyKK/DlXjhTb1FZYfgugMvy4ZPzebnRpTCFOk+0i3nMrTyyFa4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3+4Z3eea0QeCz0AdYLo0pkEPTmTCoGPRYscQPUYpDRHZ9I2OS
	bItou7sJMFaq9JMrYNrS73O7poykxZd00RmxoCJo51neGddnx/TBPQfgzX/RGA3ExaLOQLgnJji
	oOk5Z2VES9YRK7rFKbdv358jhUhmwwCjCVubQZw==
X-Gm-Gg: ASbGncuqN+kjmqaKIIV8w8iDHyM3KBmess6xMk/77zlyInafYQlWMlh8AtBfRHM4NcU
	QLk5nuHv4kKL05J+jxoJ8YLRUdoTsIHWW3d/Ps8ZVzduT5jwrTUK3Dlf7UB6g4aWOHl6Hn7+MOU
	oMWmYrX5qVEXAeNAzd15MPTZENBT0HoIlE3tRkHoo3E8G++GxVjLRDGg==
X-Google-Smtp-Source: AGHT+IEymM2ho6uHtG1Zdu07Wqud8fmld1N+xT1EeRnMqI1j8xJFCO2sGEl3h4YmgUWZYqeXGNDm3XEnhX+HJ+s+S9s=
X-Received: by 2002:a2e:bc84:0:b0:30b:b987:b676 with SMTP id
 38308e7fff4ca-3179e0e739fmr246971fa.2.1745433368448; Wed, 23 Apr 2025
 11:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409115313.1.Ia319526ed4ef06bec3180378c9a008340cec9658@changeid>
In-Reply-To: <20250409115313.1.Ia319526ed4ef06bec3180378c9a008340cec9658@changeid>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 20:35:57 +0200
X-Gm-Features: ATxdqUFDGFpMo4aaci34Zse_W5zMkzP72gRHA5kbQNTJZvoubqTPc2GMnWhswtM
Message-ID: <CAMRc=Mc67rALxbFu3KJBT7k0oMwjLchyackknXbgRD04v1Xaqw@mail.gmail.com>
Subject: Re: [PATCH] PCI/pwrctrl: Cancel outstanding rescan work when unregistering
To: Brian Norris <briannorris@chromium.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Brian Norris <briannorris@google.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 8:54=E2=80=AFPM Brian Norris <briannorris@chromium.o=
rg> wrote:
>
> From: Brian Norris <briannorris@google.com>
>
> It's possible to trigger use-after-free here by:
> (a) forcing rescan_work_func() to take a long time and
> (b) utilizing a pwrctrl driver that may be unloaded for some reason.
>
> I'm unlucky to trigger both of these in development. It's likely much
> more difficult to hit this in practice.
>
> Anyway, we should ensure our work is finished before we allow our data
> structures to be cleaned up.
>
> Fixes: 8f62819aaace ("PCI/pwrctl: Rescan bus on a separate thread")
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Brian Norris <briannorris@google.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>

Sorry, it fell off my radar.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
