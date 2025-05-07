Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA0A289824
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634213; cv=none; b=AV5X/lhAg7RR18bWvWG9QBHUeUKtALTLvQY6TutF55ZEEV/RI0MRkXjK8d5wzxn+8btN2O4JKfCoTDTfwjx6tRDYZg8Wcl1wb/dWz+36arIT8BlRrGd4FCelv/2wPPBVZExBpAR5eFDEGqS05zb1n/IP1zvK4HE72VLUZsJtVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634213; c=relaxed/simple;
	bh=tEO4wl5q9mnSb4N1++fnfe4GPrIhRxfr9Re5c9yeDJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtzLgmdMVxxqYzmZuKhQPh5drKyHDh62CEKgF8JahIHSMug1Yv+bkfdf3YE4Tu+kZuG6uGYSQqnmuyFKFSi9wHM8vZHNGafeDYDr+i+Q1S0e7XPxSWV/V5W/6tUDLEoGxpk+Lao4dRI7xjHpHS0NBLgJVYfpnWi4JFZLh0DlCFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3aH8hCXp; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3aH8hCXp"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30828fc17adso118722a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746634211; x=1747239011; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NP1IWzAxZPWttfk70bAFVVWLlYvnNyqULPRz1VjxJ5A=;
        b=3aH8hCXpC15FdvyKlxryItBVMt/rg+aHZpLoZFvBwZzdkTvK4Aghk0+kZeDc+wQbst
         UvNLebKVLwYhA+APZv/GY9S4iupbi0D3lVxGEw5+bUyfP5eCUs+DCYqJyoEWxGXbnytL
         DL4qeOaGcpEV1BEqeLMeCqUxDDzwgYWnViopJaVfVR1SAsFAk9X7f3Km4tyVAcPNAHg8
         ouqK6pNXIByYY9zd38EzuirjkhDJoanuhagF4qSaos7nRg1OUFVteBBcQd4Xye1G7be3
         6QiId2mZaVWdrEdik87rUoeExJITY19gbB0UqN5h5hmc8IBHtDa+AGUP1jWyQvgxxupT
         YaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746634211; x=1747239011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NP1IWzAxZPWttfk70bAFVVWLlYvnNyqULPRz1VjxJ5A=;
        b=WBeRyHTC5OxdyCY6ijrw2nWL+2zWCSYbX6F7eRdOext4DhJnaWVELaMPsipJJNgYDM
         n+Fh4zEm6MLHKZ9a/GNBVO5qS7cjJfGhIWbFDeQbo7tr+YvX/cfGNtiFTVT3aGBSdRDT
         aEeRxHjegvlePEz+Bx3eugMgymPWvkr1k29nijeXp9m4WDhRtp9zd8XG5CSmSGLo/bsU
         xv6PaZhohOh2I4Xb0nlSMsCRXJk8DEotX11KXsKFFcCpyq4z1yNvnjh5TdQpySlocjJX
         ntM91gVX2qXzxXVHUPSmZFnIa5bGYpsJnBdW40NPlZQoUeABl5lSd8Y1F3vTbRczU58z
         mCyA==
X-Forwarded-Encrypted: i=1; AJvYcCVo8ypjuPHaHI/1Lk2hQyLIc/+fA5YwkDDHeHxJQ+J8hiLfxlDElIwDVcXxSVp7A5xBITCq4at35W6AlRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF31vM3apc0zXUSveahpNaOLaoY7sW/ido0vb+4r5VPcoMP9l9
	bYIgb3q6P7uy/geRqAXXrk5ShSaEm+9uiqRYC0rArqOdE/Kqj1eJJsCmY860t2Zrg2PxSwvu0+1
	RIJAVxk1rFRobA35pPYnpD7uZG/q64A7ga7ln
X-Gm-Gg: ASbGncviJ5Pl9vp0D5fjqoQyw5R5Ex43mFqderLe8mn+8kMCrjxYAbowwEDTS+mZ1Xf
	lcyVw7OvBZ+W19p8fTkEhSvbJZflRwZ02m/6v3tSlQIix0Aq5cZRiYqWc79DHedIwOZlWzoib0n
	N+wIY1CL/EwvIP8wM4/vjK8c3zDMnFc9dsRpYMBXfRIUjJV/uNA6uhug==
X-Google-Smtp-Source: AGHT+IEt1JF3O5B91bj2juesU9JM6Yd55FTIMTna/Naaihysq1FxBbSRBU74eer0m51bUQ3W6roTe9w0s7kWHR23baA=
X-Received: by 2002:a17:90b:2241:b0:2ee:f440:53ed with SMTP id
 98e67ed59e1d1-30aac2483e9mr5433231a91.31.1746634211085; Wed, 07 May 2025
 09:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160012.3311104-1-glider@google.com> <20250507160012.3311104-3-glider@google.com>
In-Reply-To: <20250507160012.3311104-3-glider@google.com>
From: Marco Elver <elver@google.com>
Date: Wed, 7 May 2025 18:09:33 +0200
X-Gm-Features: ATxdqUH0mWSb1W8gFSOo12rKgcriXJX1rwTk1Z3Qj0HHv4T9Qymk1NFHYU5acZo
Message-ID: <CANpmjNMZos17oYAZsBqhhYuRRiGqsG+aLBpk+had5aWi4YA02g@mail.gmail.com>
Subject: Re: [PATCH 3/5] kmsan: drop the declaration of kmsan_save_stack()
To: Alexander Potapenko <glider@google.com>
Cc: dvyukov@google.com, bvanassche@acm.org, kent.overstreet@linux.dev, 
	iii@linux.ibm.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 18:00, Alexander Potapenko <glider@google.com> wrote:
>
> This function is not defined anywhere.
>
> Signed-off-by: Alexander Potapenko <glider@google.com>

Acked-by: Marco Elver <elver@google.com>

> ---
>  mm/kmsan/kmsan.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/mm/kmsan/kmsan.h b/mm/kmsan/kmsan.h
> index 29555a8bc3153..bc3d1810f352c 100644
> --- a/mm/kmsan/kmsan.h
> +++ b/mm/kmsan/kmsan.h
> @@ -121,7 +121,6 @@ static __always_inline void kmsan_leave_runtime(void)
>         KMSAN_WARN_ON(--ctx->kmsan_in_runtime);
>  }
>
> -depot_stack_handle_t kmsan_save_stack(void);
>  depot_stack_handle_t kmsan_save_stack_with_flags(gfp_t flags,
>                                                  unsigned int extra_bits);
>
> --
> 2.49.0.967.g6a0df3ecc3-goog
>
