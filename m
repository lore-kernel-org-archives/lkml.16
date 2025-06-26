Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683862BEC31
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930728; cv=none; b=NiISsr0jwM9u+nS1yIQBHxyXrJw7DspvHywSYxrBmYhLe1T7iQA08qnydX32XWZgR0nh2UgWgdPUf3Urgzn2jVt4Wa4bpPXU8wTHW8EU12RBtqjc4iEyIXqN2b2KXaoswek0tGhYqoBattNOlVO1Ie8uRpeIpmCKAuRb1ctiKBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930728; c=relaxed/simple;
	bh=e6BYYN0RrbPQauR2xmIcMIc/SKh6PKKv9oYpeF+Oqd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGpBQ13A+EmdLHsGL2o6nesEiteYmNX/TR8uAY0Dsry0Ej/7vIOt7jaTBU02D4BgycG0nRt82mQ2RoXVeTmbj4YDS2dEAhGipk6r3zhxW++1rYSx8Iu8p3R5/g/J+z5DUleykntrI80x5LMID90fYyMFhD/BC56TeLoj26FFm1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KsIaojvX; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsIaojvX"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e731a56e111so667220276.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750930725; x=1751535525; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pMUIQ5YDyeNXFe3b105yTgr62Ww89LPKr15AiB8c878=;
        b=KsIaojvXzRsFuFW8AdaeLjDtWqbVsB9KOLmyXWBGqHa0Faylk2+kFq3hPdxjN6OvP/
         9JFJdCAQ61WNWESi3gn5SXG1ZUj9r3OBQufANaYCpeyzCxzu6yxINMvZ6q25Dlu5l3KW
         tHEFFw0PiH2ZT54usj2wEFK+hjmmYf2bkyQDO7ki1dELWwQaAykOqB6DZAhnEctW1KxF
         /rFw8uF7BJnjJqSxvNECm6hhGvEZXe+4y7tb5vzhtXHF/yHlKt9v1s67ZEqJONb4muXZ
         JzB5w6PQ960IdSmJzZqi62JxGctdGlpNrH0LdBZyuWRR5nOKhMSB5NhOkcgRjZp5gaen
         bf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930725; x=1751535525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMUIQ5YDyeNXFe3b105yTgr62Ww89LPKr15AiB8c878=;
        b=G9TdWOYDCc7A84COH/5Lr6buIhSfCzBRpeOHFyibrymZGUOVqZzufLkr5ehWM3s1Z0
         A1yc8hRH/B6VzPaG50t3bLIHOCO3SwQ8HOlsCMgNQ1KvlR9PQUum+3gCsFRFS9Fjq0wM
         U5rE5VjyYh0L8+h8m0HN+cxPvkJYSn7nZAk4ZYkLcVyDn/WDQ6puz2iIRW5JpL7d057l
         ie5iphezAbUw1AeBQddVyLLsq4ou03iKRCXRV467Vuib0S51IqKl8g2nsnF8wkTuX7S+
         bb0p2PCmm3OG0IHm/1hWr3CikOWgbO14PK5qwnQsRJ4vt+L9eUmP2mh/4ZOR2X1X13wK
         00Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWlc9uPN19hk/fK2QpGF+qBA7u196SZX9kjVphlrOQ8Xcl1FRu2Xj/C8WSMt0+kQl5clZh8UZbB1zp48W0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKpp5FzF+clDFfhN1wPFKDE2/+OwAKVBtivVXcD9paQCHvhhZA
	Q3DPUrsWiWxvMtXJkKwE//dBoX0gqEUn0SRy+CJ7uT+633mZv7enOSAamDkdiSzCAMUDtvlWyYO
	4ZrvnSQ6FNGaPY/+ocAHd3IY1Iy0zFtqVQiA/Jcq/GA==
X-Gm-Gg: ASbGncvuJNnZSWEh2KBeGZrY7xAU2zFZxGxX2JI8rENndj7+kBXP0XSB3/+CBdpFVOe
	WZfuGxlKrM3e70PaQZIdZmTTFdUlZAxuEnoKjvYTrJveGJ1ScnPQLJT09cj/CkFOwM3m5tjOOnN
	zi3CE1s52Ezg38Thuf1fiI8jAWxvYBl1SyL4mcT4cuT7fy
X-Google-Smtp-Source: AGHT+IGrpanO/3GvZtkdw+zW8xGsoUTA6H0Q9aX5hZ9J/rpREkBRKcp+Slx0dssooKyIYA59huReEPP3hAYYC9tyJtU=
X-Received: by 2002:a05:6902:168f:b0:e81:52ff:b40 with SMTP id
 3f1490d57ef6-e8601786020mr7981913276.20.1750930725237; Thu, 26 Jun 2025
 02:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <22759968.EfDdHjke4D@rjwysocki.net> <2045419.usQuhbGJ8B@rjwysocki.net>
In-Reply-To: <2045419.usQuhbGJ8B@rjwysocki.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Jun 2025 11:38:08 +0200
X-Gm-Features: Ac12FXyLItyotFSiFfzbcS6RmKm69PO701oLuNAu0WjTraC_1HAu9CP21xq8fYM
Message-ID: <CAPDyKFq8ea+YogkAExUOBc2TEqi1z9WZswqgP29bLbursFUApg@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] PM: Move pm_runtime_force_suspend/resume() under CONFIG_PM_SLEEP
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ACPI <linux-acpi@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 21:25, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Since pm_runtime_force_suspend/resume() and pm_runtime_need_not_resume()
> are only used during system-wide PM transitions, there is no reason to
> compile them in if CONFIG_PM_SLEEP is unset.
>
> Accordingly, move them all under CONFIG_PM_SLEEP and make the static
> inline stubs for pm_runtime_force_suspend/resume() return an error
> to indicate that they should not be used outside CONFIG_PM_SLEEP.
>

Just realized that there seems to be some drivers that actually make
use of pm_runtime_force_suspend() from their ->remove() callbacks.

To not break them, we probably need to leave this code to stay under CONFIG_PM.

Kind regards
Uffe

> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/base/power/runtime.c |    4 ++++
>  include/linux/pm_runtime.h   |   20 ++++++++++++++------
>  2 files changed, 18 insertions(+), 6 deletions(-)
>
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1941,6 +1941,8 @@
>         pm_request_idle(link->supplier);
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +
>  bool pm_runtime_need_not_resume(struct device *dev)
>  {
>         return atomic_read(&dev->power.usage_count) <= 1 &&
> @@ -2063,3 +2065,5 @@
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(pm_runtime_force_resume);
> +
> +#endif /* CONFIG_PM_SLEEP */
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -66,9 +66,6 @@
>
>  extern int pm_generic_runtime_suspend(struct device *dev);
>  extern int pm_generic_runtime_resume(struct device *dev);
> -extern bool pm_runtime_need_not_resume(struct device *dev);
> -extern int pm_runtime_force_suspend(struct device *dev);
> -extern int pm_runtime_force_resume(struct device *dev);
>
>  extern int __pm_runtime_idle(struct device *dev, int rpmflags);
>  extern int __pm_runtime_suspend(struct device *dev, int rpmflags);
> @@ -257,9 +254,6 @@
>
>  static inline int pm_generic_runtime_suspend(struct device *dev) { return 0; }
>  static inline int pm_generic_runtime_resume(struct device *dev) { return 0; }
> -static inline bool pm_runtime_need_not_resume(struct device *dev) {return true; }
> -static inline int pm_runtime_force_suspend(struct device *dev) { return 0; }
> -static inline int pm_runtime_force_resume(struct device *dev) { return 0; }
>
>  static inline int __pm_runtime_idle(struct device *dev, int rpmflags)
>  {
> @@ -330,6 +324,20 @@
>
>  #endif /* !CONFIG_PM */
>
> +#ifdef CONFIG_PM_SLEEP
> +
> +extern bool pm_runtime_need_not_resume(struct device *dev);
> +extern int pm_runtime_force_suspend(struct device *dev);
> +extern int pm_runtime_force_resume(struct device *dev);
> +
> +#else /* !CONFIG_PM_SLEEP */
> +
> +static inline bool pm_runtime_need_not_resume(struct device *dev) {return true; }
> +static inline int pm_runtime_force_suspend(struct device *dev) { return -ENXIO; }
> +static inline int pm_runtime_force_resume(struct device *dev) { return -ENXIO; }
> +
> +#endif /* CONFIG_PM_SLEEP */
> +
>  /**
>   * pm_runtime_idle - Conditionally set up autosuspend of a device or suspend it.
>   * @dev: Target device.
>
>
>
