Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB58380
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749666928; cv=none; b=OM4njnaGpCNcaKiDdW0Paq8vW8Ir7Ngzl9UeZMPF8CKU70ugmiRRTZY/VrR8qe3yYplZ5J9cEWkSCt3WyB6ICRbkfvetw5PCi69BfFyCYI1mU5x3WKjPF7sRzjZG/sbWaVQDX0Jnmo/ci+xes7E382jBogJ/+QqX2OANKiHwUVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749666928; c=relaxed/simple;
	bh=PX+uFi2TRcTAZzkDxUG4RPAgbW201ntMO7lrolf22Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhBaU4ge16siKLkZ043n8KWyabNkbd8ArFyBF60Qv09JAe+QG98Ku/0QHig2offvcEZxY6PXZIPEaRt7LB6NcMWwRNibOn5t9ggGAFnhsSXAayfu0fvrMxN6fawGTRBKHqoccHJyr/4VpSZ9wR3mFr3UxHNLxPY4fV1ea/1gmtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cyIjYSrA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cyIjYSrA"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5534edc6493so95992e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749666925; x=1750271725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LW+JbhkF0pib1AA3WNg/XYx3vRhJwNQnFgWXrNhyNI=;
        b=cyIjYSrAJH1R1hXlam7zN3LLMMDxZHP24QopSPL/8Vc3nhvzvG0kzGQTJEr/xC4iIn
         MYPyNNGR5AxNxvKwTcovNsPMaiVOSr25914rkuN8UaZjIfKe44gACe5vh7fBwPZpQABN
         ZQI9AiJQ+/HDurb8lBqqhUIcGY9hTs6LcZTcPm1PwfUeYx0oJL43wnq/6wLGPWUhwJK+
         SMcqz2C3rNHAtCTVwTJGc/ZMFSSEn1o52/rrgbi15aG4oAYF+UHpC7oI2bhB8dzs3iBA
         4IRpB9GvLfHD4lCg/0bM652hcFWB4oVSAGC+w0puqBT6m1BQyp+83EIRfuuFLMU1uW0z
         FPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749666925; x=1750271725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LW+JbhkF0pib1AA3WNg/XYx3vRhJwNQnFgWXrNhyNI=;
        b=tc8zcowG0h+WN60+LZVLm+6IRk1c7Q/dPjXmC5/0iowSRAfT4pxDZlEUpP63zqy8rf
         4PL9C18417a1ZqPEBmi6z4d3scufWfemQUv71bSQkdR3t9OQx9e0X4t86qXN5d4xWATE
         jz8A83CYaqwgtk9AwRzKFOIsFIUBIb1ULCLuVT3GoT9hkg+LB94KBOIuzBzE7srGoTRq
         4LYvn9UwMvWxRstS23L63wOFklZYFf9ZrZcwNHdaEogMxBBo+3vKx1JHZSdPueXfGESU
         UQoweYe2uPxrvyNPkMzDIOTfd5sC2992aNgqfUAELy/o6C0c4AfFZxKksx/fadXF7qwC
         6Nqw==
X-Forwarded-Encrypted: i=1; AJvYcCWWEGqHBTCQuWuOtDrCXrVk6MCHOa3tUwcsLNn1yllUGC6Kv3TLXNCLVErMiHkVLcMe8SxiCBuhl1R8YgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPLdEWuCQNZa3fU0suX6CZ9A92cOf4bXQhUmSXnK078X+nNO/Z
	AcFkqGI60ngKYUhdmvTE1g9EMgqYQ0hsKDPeqtb0ihKCpSt2gECYNWHi0dpJLaCa978a1KyzFEK
	gmtSKcJZ/vIvMvbjA/BCKdxPYV9Fwg6YByJ3bFgo=
X-Gm-Gg: ASbGncuIfODpZ0JuptnNIXs8UQPpwFKFI+f7FYNewpvXaQdho372a2UWJT2wIzVkKXy
	hZ8WsNIeWwxATFWrGNiie03s+rMjc78JJ+ApZlnB13AuxRjGzngiVlL0wF8ChZqY0OAAovrIXge
	lZvUmBYI/vU7J/MsH+aV1ZNHjqW8ZUwqzB/rMkTJeU38fRxu5HCSiAfFJ8vQFUYrNwfcqiToY+6
	mGnHz7a
X-Google-Smtp-Source: AGHT+IHhJ2bujyaLwyGfM62GuB4nxlpb8VRVfrxNgScBPvK+ovW5Gr8i/lmdjCY06YU1YK3LOhGiWRzZ2Ly5ZcPlDyQ=
X-Received: by 2002:ac2:4bca:0:b0:553:3916:4e1c with SMTP id
 2adb3069b0e04-553a556785dmr144689e87.2.1749666924953; Wed, 11 Jun 2025
 11:35:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611104506.2270561-1-richard120310@gmail.com>
In-Reply-To: <20250611104506.2270561-1-richard120310@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 11 Jun 2025 11:35:13 -0700
X-Gm-Features: AX0GCFvxFuyx5v9O2yGfkI2Uej1mipIc8heSHC46LTYcnHRLUpOAa2r2xFAgXhE
Message-ID: <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code size
To: I Hsin Cheng <richard120310@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org, 
	jserv@ccns.ncku.edu.tw, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 3:45=E2=80=AFAM I Hsin Cheng <richard120310@gmail.c=
om> wrote:
>
> Simplify the procedure of CPU random selection under
> "clocksource_verify_choose_cpus()" with "cpumask_next_wrap()". The
> logic is still the same but with this change it can shrink the code size
> by 18 bytes and increase readability.
>
> $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-18 (-18)
> Function                                     old     new   delta
> clocksource_verify_percpu                   1064    1046     -18
>
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>  kernel/time/clocksource.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> index bb48498ebb5a..ab580873408b 100644
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -343,9 +343,7 @@ static void clocksource_verify_choose_cpus(void)
>          */
>         for (i =3D 1; i < n; i++) {
>                 cpu =3D get_random_u32_below(nr_cpu_ids);
> -               cpu =3D cpumask_next(cpu - 1, cpu_online_mask);
> -               if (cpu >=3D nr_cpu_ids)
> -                       cpu =3D cpumask_first(cpu_online_mask);
> +               cpu =3D cpumask_next_wrap(cpu - 1, cpu_online_mask);
>                 if (!WARN_ON_ONCE(cpu >=3D nr_cpu_ids))
>                         cpumask_set_cpu(cpu, &cpus_chosen);
>         }

I think Yury submitted the same change here recently:
  https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com=
/

Though, I think he has another iteration needed as Thomas had feedback
on the subject line.

The bloat-o-meter data is a nice inclusion here!

Yury: Would you be open to adapting I Hsin Cheng's commit message into
yours and adding them as co-author via the Co-developed-by: tag?
(Assuming I Hsin Cheng agrees - See
Documentation/process/submitting-patches.rst for how to do this
properly).

thanks
-john
