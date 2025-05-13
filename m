Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C6F205AD0
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128197; cv=none; b=Xa9pvoZrEN56hGxIUS7U6sLlMHh0vE68V6pH4eWpTRUAhEgV8zzzaqHORKz8WAf2B50uu3QoKnR5rjQkxoqNbByCe1E6fzJoXzWSpAozkeNp6Q6B7guReKvydm5tY0zfha2/rzwGsr3Ccxw9oyOcQLzjauYFmek4PUUzb7hhcPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128197; c=relaxed/simple;
	bh=PUZdM1h8WI1vqC/o9GJnYO6sqlQvrPktbx07wyl5Imc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpKwI0bfyDCt620Is1tmlRlIVjIDk866m+YC3A2skxgZaJpZ9kQ57C8pe+V7LTXSEglKYv4nRh4eNukXZ1Kr814ydZ+KdyW708dY+kLi9MSLZqVkwfvAr5t6x1g7FD6/hXEyWLPj+E8B7tFGNjKyPI5UityMMrQGDNZP/YU4CK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8SnbIPY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8SnbIPY"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b10594812so6683601e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128193; x=1747732993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUZdM1h8WI1vqC/o9GJnYO6sqlQvrPktbx07wyl5Imc=;
        b=X8SnbIPYMfVAzs5kZ2Hfs7BjnVNEnljduCrMqkyWSt1XZQK8XQinlzhXx0CI0smPFk
         HI+JRIG+4b/ktseLIMSa7UgpZ4ycRWlTk2OOjfSMiYp2nX9Pr2W+KfUeOTFI4cDYwS9x
         Qn0/jrdmRct7fglUKE6c4/2/ALpNOi+dHhwQbvJfjaoOx152ipOTyllOi1FrjdXYcOQn
         jipBemN/GHYO6xVNnNNfRKo6zLUA01Ppj16jpBa82YL/Y4QdBMtscjc5Wdb1FhD/VNUR
         AniHqDQaujOSNMHZNkc9q7eEnXko4LVEats/oP7UZBe5iTbFpTZu5r4RdpnDYu5Q0oI3
         bmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128193; x=1747732993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUZdM1h8WI1vqC/o9GJnYO6sqlQvrPktbx07wyl5Imc=;
        b=VGDtJr96drUQZNP3QyzsMjjPQwOqfCf/t+93KHOfEVJXjMeMwonVP+PYJmwCYrEg5n
         g9d32KVzaAUYO9FRu51hJJvp1Qqq7Xn+R7uRyAU2g1bu65yWd5kgW/2I1ZFvL4+1wgnu
         GS2cEFzoq0RaBUc2lBmDQfs0dThZJLd0W5Fcxn+lBTZhDGv8ly0gGOf4as0NHdVsyQg4
         6Hyv/TW2R5962nqmn6U5CGeGGMpBkhuotvfGzqMXVZMW6k8YsRa8b2OHQ0fDqXMaEAQz
         QU3r3/zHgUUwNQJvwfKNnFufFDdyNFabWvxXrn2JTWKuobcgKUGtrvUJcE41Qqnrrb5o
         DHGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTpTYtnmhA356GyajaAsyfTnNugaWqoyQFM/73ApAVJGyqlVpAtmNPRn9ylc+yUTTxS47dbq2/5J3GeM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCR7ZE4q6k889UR7SISDU5lsuIiCD0ifcAIZxJIuzqSBwNHBIv
	g1gXAlBQFs6Wq9urUynGsMbgQELYha7pVS9cQJlu9PnBPwoFWUwbbI9R+4TX8UUyGJmL7Sc88Dr
	yHpdf9/D8RQhXeVNlkd+NX/Z5tSiEzdqgNlQZtQ==
X-Gm-Gg: ASbGnct2k1ardEW1sUx0gk7/nQ1UBxfNUBEbJ4JJ9+pv1k17d5p7SyC3V77S05qG9yw
	8dDbvl07ZuyhVFVKWHgluFxKHBYBpeuw0iKt5SO1Xlx6/j3x59WIkrdPd9Z6Q5yLvClwYIitBEi
	9/63tfAd8R5MUR5bDjvS8YemOL7d60nx0F
X-Google-Smtp-Source: AGHT+IG3yJ2I/gSRbNR8Yc9mQ5D3H3jOM524XFmnhYp45I4Txi2GP3DWvoHzF8HaXmyZuGDfMmUhius5uFgg07Xw0xs=
X-Received: by 2002:a05:6512:660d:b0:54e:9c8d:bdc3 with SMTP id
 2adb3069b0e04-54fc67eba75mr4238045e87.49.1747128193339; Tue, 13 May 2025
 02:23:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5889368.DvuYhMxLoT@rjwysocki.net>
In-Reply-To: <5889368.DvuYhMxLoT@rjwysocki.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:23:01 +0200
X-Gm-Features: AX0GCFuBGgsy8OIbyZ_iRPj1JK6HiLr8l-sZYvuduHVP_RhHrCBW63Oul_hd7iM
Message-ID: <CACRpkdY57K7_rhQiXKbOpTGneQRvpJ33E-fG8ejMHzcBaTQE9g@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: amd: Fix hibernation support with
 CONFIG_SUSPEND unset
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Mario Limonciello <superm1@kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-gpio@vger.kernel.org, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 8:27=E2=80=AFPM Rafael J. Wysocki <rjw@rjwysocki.ne=
t> wrote:

> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> After recent changes, pinctrl-amd will not support hibernation when
> CONFIG_HIBERNATION is set and CONFIG_SUSPEND isn't because it will not
> register amd_gpio_pm_ops then.
>
> Address this by restoring dependencies on CONFIG_PM_SLEEP where
> necessary for hibernation support.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>
> Mario, this is on top of:
>
> https://patchwork.kernel.org/project/linux-acpi/patch/20250414203551.7793=
20-1-superm1@kernel.org/
>
> which is currently in my bleeding-edge branch only.

It seems the prerequisites are in your tree so take it there!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
