Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2C289824
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634223; cv=none; b=H1mXtkrn6Dpuq1vBOH8oW0Qi5lKYb9rUYINvROlLso22EEBwQpwi//OeAcC93ZWInbcu3L+36ngnvYJncGwpHExroW0jc0viTU1VkHuHO6wnjIre1SV4ffTfsfTix3JWO+2rfVnC6nhKwBx8ZXsXp0fO7qpl3QqQTAC4IPBsB+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634223; c=relaxed/simple;
	bh=OyWvh8xgLh9qg+Un0/zpsk9b1nA7F12VnXjVrk/InGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9PchJ18UXSOxsGalD7eMbGAuWiqVjGYUXUzWb/tyqoFK1GuZbc9L+D2BP5GbU/hZF02V/kJPr3CR1mykNijCOp2U16rMT2+2gTBgEO3fFygnFvRAe0IAO4Jm+XR1VkHSupNPBwZDda3EzgXroSyxkKirWAa2RLPx/n/K5btr9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Gp0fSXz; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Gp0fSXz"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-879d2e419b9so6699071a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746634221; x=1747239021; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a4Sd2c8Ti5AoEGgOG/K+kjd1zjv+xJVe2V4gU11HvEQ=;
        b=0Gp0fSXzASM3L0ri5ow4Dj0aVadhYeeEofXmpF1bLhfsH5xyQIfF64np/P2k0AFYZ5
         dlq/TExwgblA5jcVhU29lVVyVxGbyvC9qFIdf/IgHvkGUGhNjphblPIMvuodumuN/eyx
         wD9aJsmB+YmoTRKqIu3EWBFW90x32YBmjSgX4PeQ2AcldiP4f3qpXlXzaoyJUPc6rMcl
         FgBPYHW4gHGcLJhyZRoNHRwVjFM/Z36VccNxMVQxblKjGDbMDJkCASTtD+dSKX2+enxZ
         zPAu07PzGdHrhQbkQAUlQB+CTANwWvEbjcX0XQUnE2nMvhLxW+SGjTQ7XRFtL1QYlTS0
         esMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746634221; x=1747239021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4Sd2c8Ti5AoEGgOG/K+kjd1zjv+xJVe2V4gU11HvEQ=;
        b=OjVJ0WHk0sxk+nD1yIjO9K8YxepDuTZbnr1SHRMaMS7MTftehH4ONdmDStYEzY5/8i
         ePQPZr0UEzMKb2nU2eGhFN/Tp7WN2o2X0f2gJz92nvGYVGQoYOfccXdP639YqWf7H7b7
         8i7bhYBwm2jzgb0YGIlZ7bBLikzvhNv8XeatFWbm84zUepqxSSDxjM2/m7lxp9oIwhbb
         6gLkiUHM6dYQRKJkiX6Isqg6lEsg1yLzD6TgOD52gEnXWbQycP4r/BpkuIYFWWDB0uKm
         SKolrp496d2+SiIi0OeROzgmCoS4rahlxQCXAhQnKA3hI0ZbR+PZtGamtcBqzJXw3+kg
         o66Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+ZkzQ+EE8kmYmAmjZWadiKXllHUhnEpXg0F+h6JNyz0SdC8Fmx8PErUHBzQXlRumDsk1O+nOrPCZqY+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YymDlWN9Y9CbXFaURiSdN2B/iaQojwKoYcve/lzKv/HwkrG9lGf
	Q2P/G5xIHjCFfDmHHZlz82oMuOCXb57C/nBx9jY7UfFN3ZIp65YByOo3XtI04rg0yBwHLMkX9ku
	LxohKZ8L9bVCcQeye2NCaiMX2TTokTa6vgiB5
X-Gm-Gg: ASbGncud2L08mxfxZZ5774NmmdEXJhbxmA4PEUGoykijJ6/ye3uNiaq8X8fbrYdQx8e
	Lgu13UPvUapnIOCeDVCb7f7m+1RrDooQfu9gXHCl7hEYp01rMnInwfvgAZbetp0TfDz39vV5di/
	KM7lQkngNIHzSyORECxLdqMQBnUCkizqwL1rvu8VhIVBLBXGZAiXFIwgA4Zz6lJ2OR
X-Google-Smtp-Source: AGHT+IFTW3+NfXisyiYZOqOvgszqORRvJCEyqSHvKhLwETTDMQzgN1StaabOc/80XDW2ss3KDR0fMOAMx3huH0T6K5M=
X-Received: by 2002:a17:90b:3882:b0:2ee:8430:b831 with SMTP id
 98e67ed59e1d1-30aac185bb6mr6495731a91.2.1746634220697; Wed, 07 May 2025
 09:10:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160012.3311104-1-glider@google.com> <20250507160012.3311104-4-glider@google.com>
In-Reply-To: <20250507160012.3311104-4-glider@google.com>
From: Marco Elver <elver@google.com>
Date: Wed, 7 May 2025 18:09:44 +0200
X-Gm-Features: ATxdqUHrTK7nVqScZrnpkwHmKnPptoRfaqMqa66xS1OVQOUvwLopYzYYbtDamhA
Message-ID: <CANpmjNO6aSwyvsnfcLs1fd8vBET+VaVx2=AX6WcVGJ1tZqcv7A@mail.gmail.com>
Subject: Re: [PATCH 4/5] kmsan: enter the runtime around kmsan_internal_memmove_metadata()
 call
To: Alexander Potapenko <glider@google.com>
Cc: dvyukov@google.com, bvanassche@acm.org, kent.overstreet@linux.dev, 
	iii@linux.ibm.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 18:00, Alexander Potapenko <glider@google.com> wrote:
>
> kmsan_internal_memmove_metadata() transitively calls stack_depot_save()
> (via kmsan_internal_chain_origin() and kmsan_save_stack_with_flags()),
> which may allocate memory. Guard it with kmsan_enter_runtime() and
> kmsan_leave_runtime() to avoid recursion.
>
> This bug was spotted by CONFIG_WARN_CAPABILITY_ANALYSIS=y
>
> Cc: Marco Elver <elver@google.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
> Cc: Kent Overstreet <kent.overstreet@linux.dev>
> Signed-off-by: Alexander Potapenko <glider@google.com>

Acked-by: Marco Elver <elver@google.com>

> ---
>  mm/kmsan/hooks.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
> index 05f2faa540545..97de3d6194f07 100644
> --- a/mm/kmsan/hooks.c
> +++ b/mm/kmsan/hooks.c
> @@ -275,8 +275,10 @@ void kmsan_copy_to_user(void __user *to, const void *from, size_t to_copy,
>                  * Don't check anything, just copy the shadow of the copied
>                  * bytes.
>                  */
> +               kmsan_enter_runtime();
>                 kmsan_internal_memmove_metadata((void *)to, (void *)from,
>                                                 to_copy - left);
> +               kmsan_leave_runtime();
>         }
>         user_access_restore(ua_flags);
>  }
> --
> 2.49.0.967.g6a0df3ecc3-goog
>
