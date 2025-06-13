Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC43B248F49
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845713; cv=none; b=OrOs5IcN7h3b+FA3sIg0ljNJWpVMOxwndknxlAOMo6Xa9TbcO5V2FY4aJhR6IY7Gu1FJCZyj4KQJh4oBUjKH9fmZ5CHXS1YH57C4AaspXRZhcLx0QUrLmshY0ahgDVaJSUfmk2Wh4GXzaphesoxPv5dvPoj6QRGtiwN0fplsxYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845713; c=relaxed/simple;
	bh=JKVvkuzMLeE6PBwW7ovixiV6k6QmHlyUzw0Goxj0hNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+SS5uHf3xPiqJo15+dRHqK46OZYG1lcIXFO6dbFb3nG0ojjArrVMo4cnFjqDN+KeEMvjz+RRFi1uulBKt37E4uKPpu120e8SVRbo6NyMwGzddrJbjfoEZ7lfH1I+yvhgO07BKSs40EQcqS54erttbcVPsc+55aCLjLq6/Zw3Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9J+S3Gx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9J+S3Gx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so1725201f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749845710; x=1750450510; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=akzZe5fRcI3dH/sdeQ9q6t9qEUFP+b/DdnlTQO8uRn8=;
        b=F9J+S3Gx+KHTtMXJIpV1+v17nKRvHsKyE9677QMWmmProsc5usPf03Mj5RnGqdnnM2
         tmhecAD6x1O174jtP3dId/BqCEP3OYTuBKhtfxJW+xfZsQgela4yZdoCyTmVYk2ktGyQ
         /vLSCFaCGQzJakDB+HhDANqGeKNNe3RG9KUYzQLv+ssyNw9oNuNCbSXLjabgEIZ5aQMP
         Xf+hm8nRDHqWRjRw5atuSHCN0lvc6My8VTu/LTGvzdaYehHyOyWv7pMyw9zsfWdLp+QY
         PtWcPmNleCVerDPfucvKCWUZ96DKJ/49piZpNv8EAHh2tTrouxc4qrTWmz/KE1wnhY2+
         PVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749845710; x=1750450510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akzZe5fRcI3dH/sdeQ9q6t9qEUFP+b/DdnlTQO8uRn8=;
        b=NKprYcKLJ/ixQPg1OyXX8d+CzRAr0KLFzj8uFHfB4lOld7dxmkISCjc6vz63RMnmyh
         eYV3+qYAm+5dClur895CxkWi+0GAPjA3XBJnfLz+10Ur8Mxl+9N5O/F4gdfwnuYNKY3q
         hotNC8PX7ygEb+IAav2jZ8l3R6eFFSnJ1IX9t7cl6HPobH/n288qMkr8ldU3ZPnI0u6M
         EeMwVVyvc1lhCg4kK03ARLtBrOXK1lvmv0wWyudvhwZ4QJeCljO0B1hhjvXilrO8XmMB
         ZodgAMGmM85CYrxf5TeRWx1ghgnSWKT/RwuY5RuiXgpr0E29XGKdbVP9fETYYGiZdUt1
         Y5/A==
X-Forwarded-Encrypted: i=1; AJvYcCU1hLkcv7ZPUNTn2oRjMYJ+Z7MZ7b7AT08qbROlTS9K2Va2oN3m1T+zkx7nRpsaghMtVmnSfiUxn6Wzzyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN652zqRxPS8NlVppzH+8lkIlurcugWtgtMZ8jmahjzKMjjHiN
	wYPq8/3BqNF2s8gHKTnHMv/XTtLFyAA693Dd/u2hjqK3pO4aCFtw1ei+K5JbHwLYATUErWvf/Dc
	FJdihipHOo2mgKT6C+XV/hkXjlGCslQ==
X-Gm-Gg: ASbGncsA2sNbe5af9drgmZ/Ab1pC4QiC96WjosuVpELj4ROeRkstg5CAYlzHZuz3zAs
	pT41mzcIt9ePyg4I8PZi8vra80dTW5cjizDkLWV1qZJJqa7/wJUbB0DCyZtLUlACViyewOtX77E
	6Gfck+Ybf4bzjn+9jkjqorLMEiDRkjImcaLuIeySbWvp8=
X-Google-Smtp-Source: AGHT+IFxjyMfkj4e8tJZAj72mtlyMYabyjZbj8kPnW/LYj+ElEsgRD9mREjz2vlpwu8yrMmYc/Dyd/61MJPsnPH4JXk=
X-Received: by 2002:a05:6000:2893:b0:3a4:f6bc:d6f1 with SMTP id
 ffacd0b85a97d-3a5723a2da3mr1155737f8f.14.1749845709668; Fri, 13 Jun 2025
 13:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612183303.3433234-1-briannorris@chromium.org>
In-Reply-To: <20250612183303.3433234-1-briannorris@chromium.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Fri, 13 Jun 2025 22:14:58 +0200
X-Gm-Features: AX0GCFvacs2R6-y3FRqPQawVHZmR4AHOXNdJZCmO2z3NBe1uy7nONO-uEtTmrqE
Message-ID: <CAMcHhXoZo44Qro0g2_For+Yx1uoyAU1d39Eie5e3qzY0FWxtOg@mail.gmail.com>
Subject: Re: [PATCH 6.16 0/2] genirq: Fixes for CPU hotplug / disable-depth regressions
To: Brian Norris <briannorris@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, 
	David Stevens <stevensd@chromium.org>, linux-kernel@vger.kernel.org, 
	Tsai Sung-Fu <danielsftsai@google.com>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 20:33, Brian Norris <briannorris@chromium.org> wrote:
>
> Hi,
>
> Commit 788019eb559f ("genirq: Retain disable depth for managed
> interrupts across CPU hotplug") was merged for v6.16-rc1, but it turns
> out there were a few oversights.
>
> One such report:
>
> Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU hotplug
> https://lore.kernel.org/lkml/24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com/
>
> This series contains two fixes for bugs that I've found locally and with
> others' help. Some of the testing involved:
>
> 1. Aleksandrs Vinarskis tested suspend/resume + NVMe on Qualcomm
>    Snapdragon X1E/X1P laptops:
>    https://lore.kernel.org/lkml/CAMcHhXrT-y3EotxrcCZ0Pj8Sic6wsPSmRiW7NSzdG=9iH8xqKg@mail.gmail.com/
>
> 2. Locally-updated versions of kunit tests I've been working on for
>    various kernel/irq/ code:
>    Subject: [PATCH v4] genirq: Add kunit tests for depth counts
>    https://lore.kernel.org/lkml/20250522210837.4135244-1-briannorris@chromium.org/
>
> 3. NVMe + x86 QEMU workloads, + system suspend
>
> 4. Pixel phones + modem driver + various CPU hotplug / system
>    suspend/resume tests.
>    (This is probably least compelling, because this doesn't use the
>    latest mainline kernel, and it uses non-upstream drivers for some
>    relevant components. But I figured I'd mention it, because we've
>    noticed some similar problems to #1 here.)
>
> Regards,
> Brian
>
>
> Brian Norris (2):
>   genirq: Rebalance managed interrupts across multi-CPU hotplug
>   genirq/cpuhotplug: Restore affinity even for suspended IRQ

Thanks for the fix,

Tested the entire series on both laptops that experienced the
previously reported issue:
* Dell XPS 9345, X1E-80-100
* Asus Zenbook A14, X1-26-100

Can confirm it's resolved. No other side effects noticed in ~1.5 days of usage.

Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>  # X1E, X1


>
>  kernel/irq/chip.c       | 8 ++++++++
>  kernel/irq/cpuhotplug.c | 7 -------
>  2 files changed, 8 insertions(+), 7 deletions(-)
>
> --
> 2.50.0.rc1.591.g9c95f17f64-goog
>
