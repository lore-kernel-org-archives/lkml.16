Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C721CC4D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750932647; cv=none; b=Sa/x6UyYsxdhNxftXRv+QZdlIUDRGNVMZUyZmOQcII5/0G5eKwgLydQ959m/AGtz5hHaEDjsBb7QRcm+dtNPAEOTx0H05k4qienECmXYsf3tmI1T7SnKSNTXC0ZOefMmwQ9eYqpbnv5dzZW0D2YY7C1ndtgUfV9Iw6gjfKvmjWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750932647; c=relaxed/simple;
	bh=B8L42uYW7SBVGI49Vdor/dHyRQyBsuPa0eVEeRQde+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWOkC3UJTjqEf19kd7PPfEOzHS76yb9Fyb0ysIntLuno6M5LRpWimDumRlmCb8HlgUlDBG4qNEQ96+iMmHe/8iPPXj8vXOnfUdpjttZDtWawID2mGncWzoziN0vA2ouHbxsMunRE7jTYGMDCdtmAvKQ0W3x6GTdFAwBgg7NDN2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xNhqTy26; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xNhqTy26"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e740a09eae0so690799276.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750932644; x=1751537444; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RGpPhbuPUiSKZV2cLRZKatSz/MduhYBSX2W+AJmzppM=;
        b=xNhqTy26NqMOtI0l/BaqO+24iM5Y/HMAyoiTybTwe/cquVyjO9sHaB2tLwwNCJdtZJ
         kDr+VSDWYX+EHhyUlXvt9C/4G3emIDBIPaqDLFQzIZ3eIWlnPDMyEgsSvJ5lNcfdJk7o
         f6Z7Mt3HvokUk74v/gg8NVURwq/pApa3iMcIpBAJUSVKInMjNxo6WvbIhyNrTRjGsuu1
         W6T/9ljDPEm6TXthjCUuOyxo8Fv74qbgfo/Bb6PaZn6Erxyz3XqyvpsORDRLrV7iUmRb
         3dJVsa0CgRgutrMloxPmWRNF7VsPvIo9EU3qSQu/alyh5YMSoifbnguFMvmVMoE0Zrmi
         QxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750932644; x=1751537444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGpPhbuPUiSKZV2cLRZKatSz/MduhYBSX2W+AJmzppM=;
        b=cPTAk5Yo116mMMtvE48Pl1PSKDHIk1Zv96uQyut5qNYiM/y+j4rkuqObjPxb4tCUIe
         RQYjhAOYWRFy5qf8wiuPWk5ZkQ4zXGXEeNSMB9xLOwsdzHw8bTIQOlzCJgMIZEMjaCHT
         PME+WcZzBl27wrA6bN3D1bYi1rIOCxtFbbelJJPEsZvo8akkVAsb01h+7xPpLmaUA9wz
         Ucte908XXYhz+FOPCxdIaptcVD9ffz04KYo6O1tkL2J3biwiw18ACtYfHsL6eDxhvhpZ
         2dHCnJ33SfGDKvhtXfBrPGZm6A8+DIFHf2/9yC6ZRrmxHLwwwcKI3xuoyIMC1LR2twC1
         ve4g==
X-Forwarded-Encrypted: i=1; AJvYcCUns0eI/42BLyn8Ag9zh9jZs4zudi65R3JsICxYE8CvmQVGFGUjLMuYSzIYUUin/9exbZIbO9sJ8II5sPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKihC5YlkhwmCR9rhVK0rRXSZKEgDt0sf8P+siHE5x9JQmIDS7
	WX6KvEwCJdlJz87MfRw3hu4vBY1C6GSnGIUSoXffd4ZWMZwbZY4QiSGMTL0XPLsw8ttZ8DDE3lW
	8cVZz6l/IUAChEkNAzpbUDHF1mVTtfHlLHTHP1V39GA==
X-Gm-Gg: ASbGncuo2wXdAZMKrte9Toa8RkZA9zHhTgfcuVSCJxuyPdgUWHFhWVzTdnc4paWVlfQ
	xLpcjjeaZLYibTE5v/4YWAsUo0L7y+B9G5mVcaFvs7G/G5M/gO75ECjpRmBut/KGXFXaAtWWBF4
	auU1fww02Xe19J9a/rQrXFej2OECyQKoyYWsUCY7Sq8TLa
X-Google-Smtp-Source: AGHT+IH7V0BHGImGWUq2RO4C48YNB3kmbkrWJ44nvQyWOyJ0pUkhrpvVs4zkHxSn5wG/qh/yfZkJEJHOsJHa3ZprjII=
X-Received: by 2002:a05:6902:2e0f:b0:e84:1dd0:45a2 with SMTP id
 3f1490d57ef6-e860177f40fmr7990971276.40.1750932644320; Thu, 26 Jun 2025
 03:10:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <22759968.EfDdHjke4D@rjwysocki.net> <3306233.5fSG56mABF@rjwysocki.net>
In-Reply-To: <3306233.5fSG56mABF@rjwysocki.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Jun 2025 12:10:08 +0200
X-Gm-Features: Ac12FXwF7Q7jxkXkEaRsyFNpxSklkmW_lcm577wfPtPxTWlGaikqzxB0LYBa_fQ
Message-ID: <CAPDyKForsegoD+J6rumvnhHna7W+DVdb5zdKGiRB-TFv27sy7A@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] PM: Check power.needs_force_resume in pm_runtime_force_suspend()
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ACPI <linux-acpi@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 21:25, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Add a power.needs_force_resume check to pm_runtime_force_suspend() so
> it need not rely on the runtime PM status of the device when deciding
> whether or not to return early.
>
> With the new check in place, pm_runtime_force_suspend() will also skip
> devices with the runtime PM status equal to RPM_ACTIVE if they have
> power.needs_force_resume set, so it won't need to change the RPM
> status of the device to RPM_SUSPENDED in addition to setting
> power.needs_force_resume in the case when pm_runtime_need_not_resume()
> return false.
>
> This allows the runtime PM status update to be removed from
> pm_runtime_force_resume(), so the runtime PM status remains unchanged
> between the pm_runtime_force_suspend() and pm_runtime_force_resume()
> calls.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/base/power/runtime.c |   21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1975,7 +1975,7 @@
>         int ret;
>
>         pm_runtime_disable(dev);
> -       if (pm_runtime_status_suspended(dev))
> +       if (pm_runtime_status_suspended(dev) || dev->power.needs_force_resume)
>                 return 0;
>
>         callback = RPM_GET_CALLBACK(dev, runtime_suspend);
> @@ -1990,15 +1990,16 @@
>         /*
>          * If the device can stay in suspend after the system-wide transition
>          * to the working state that will follow, drop the children counter of
> -        * its parent, but set its status to RPM_SUSPENDED anyway in case this
> -        * function will be called again for it in the meantime.
> +        * its parent and the usage counters of its suppliers.  Otherwise, set
> +        * power.needs_force_resume to let pm_runtime_force_resume() know that
> +        * the device needs to be taken care of and to prevent this function
> +        * from handling the device again in case the device is passed to it
> +        * once more subsequently.
>          */
> -       if (pm_runtime_need_not_resume(dev)) {
> +       if (pm_runtime_need_not_resume(dev))
>                 pm_runtime_set_suspended(dev);
> -       } else {
> -               __update_runtime_status(dev, RPM_SUSPENDED);
> +       else
>                 dev->power.needs_force_resume = true;
> -       }
>
>         return 0;
>
> @@ -2029,12 +2030,6 @@
>         if (!dev->power.needs_force_resume)
>                 goto out;
>
> -       /*
> -        * The value of the parent's children counter is correct already, so
> -        * just update the status of the device.
> -        */
> -       __update_runtime_status(dev, RPM_ACTIVE);
> -
>         callback = RPM_GET_CALLBACK(dev, runtime_resume);
>
>         dev_pm_disable_wake_irq_check(dev, false);
>

As I mentioned for patch4, pm_runtime_force_suspend() is being used
from driver's ->remove() callback too.

If such a driver/device gets probed again, we need a fresh start. It
seems like we need to clear the needs_force_resume flag in
pm_runtime_reinit(). In fact, that looks like an existing bug, even
before $subject patch, right?

Kind regards
Uffe
