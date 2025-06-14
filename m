Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1256A14A4C7
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749901588; cv=none; b=G5yTPqES0f5vjIBvOmBdrRthlR/wTQBw8qThzIFfHRPCW61b9fb4cy/hclfumf748pFscIiy1WebM9x7LH7F+ICxPBGoZlVnOxKmptG9w5WJZ5LHBHBfWvu8lducAZESoZoomK/Yo9hfUOVsx4tkLxo9X6WSpgxKZbANegjOix4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749901588; c=relaxed/simple;
	bh=xLc0vj7OFrQH+O9FN16pSuwmlrI45l0qVpwVd/1LmGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAAfeB2CJWy81+BFGRDsCppTz4uH8UJK98l+ipfcNx0kbPCQC9cy7zdZhdBlQIprFc3iIsOI8LnFVDkNvA9TQKEYZn2BlZASdTPqLVZblCBFrwdtEAiXuEWN14kmv6qgbFzUdk0XH87r3Kb2UZbiiJLCJjRkvFiSgRj5XIhPKC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpAg4T4h; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpAg4T4h"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so4336179a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749901585; x=1750506385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L2rY/nP7yGnAUJEz2fdJUWmgL1DrXzdGK/HmwdSxXU=;
        b=XpAg4T4hp1xAg+WWyeBwjdarnvYIljC+Z3Y4OA/kXFHgjU+7XKpy1n5SLU1hjzTsR7
         flqLA6/QSEwDuGimHqnugSHlZw1gwp+2yDWBBkzZvSdcEksqk1kF+N/LErZnIBF92rBm
         GNQoJ8OhoPUSQ5T9mfnvS+QixLyK/v5lSVyM3Cmb624s4wHG+oZ4cCaZgjJX3LDSIfwq
         AcffSf/kV+5/0+UTSSSaTgrlr1nZ4Xkqwe4l7XMyR+1p2FZy4mrsmW/TWQ72tWAy7Fj3
         PJDdcu/aJiaL+Ge3dnwGP1e6O3GjsFPmd7KZjwCmdjE4q3T5pAV33fiFIHvFOAkxrUyc
         AaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749901585; x=1750506385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6L2rY/nP7yGnAUJEz2fdJUWmgL1DrXzdGK/HmwdSxXU=;
        b=wBVBFGBvH/FWKEfNyUqhtQafRVZhs14DW0G9E0XlHneiFQYpcGGDHEe71LmMV5FvLx
         U0vmpI2CzkS7vKYlcDBK9IvLQYXnrKDCbizxa86+F2nIUBcHiYRT8Lua+RREG7nSZ4wy
         wgHOTdq3tm1D5TE+Ho71wImPkdxAIJvZwta7Zhn/zMjx52RCRDk5FloDKX7qq4jYThxv
         1wx3i158ZbfCr3BQ37d+puo6bL3fyZM+TZ4xbZZdTnOj33viY9pXOGfnAkwP4sP7AKjn
         R3oZAQ1Q/XBRgQuAzwwOoIbkpkrnT8Gntai8NT/X/Dsy/xiw3d5wY5cN374jFTF81+En
         kHhg==
X-Gm-Message-State: AOJu0YyesaOdZl4bBpTq0SRXT8Yq4MkEc19MMEbDdlFlUPCOf3o1Fx/F
	uipRNTfcrZjR4gdzQ38bt4uErt+kaFhFrbgxsyN4U17/02ShYs3PlRMR
X-Gm-Gg: ASbGncuMwtThkrM5Q0QfzO5GaBHcuGUmCEFZ1ArWR0IKW2XVBpR2UUfp4O5X9iZ/P4T
	k0Z++iN8RaSJBpjJmhZReaSR1LGfnwR7xzfZYl1k2wy42q9xyzsdKz80UdLj1AUlU2qPNsM5Js2
	4Vs9UwVsWWJ9sLMu5p1QyqHjCAa3oz3+zN1aBZI4tDY2eh8cn1/Xb188lchlO1LVrYZovDADyO2
	oT3ofPWJ+vxb8zx5YpYH6YnnDxBst/KjyJcO1/2dX3UJuw60ib61Ep/I0Akz5/eXkCDa3Oav9lO
	NploD/VtlbmmSh7yQndBgXqjObwfyJCsbOengXaCOUTShtiXGJn6Gfi8MC1KqBRduznn32oaU2Z
	VjQ==
X-Google-Smtp-Source: AGHT+IFiCb8NOEMWM31ERdu+MCI+WOJovIwZB5pBeP+4tSLznwIhyNVnKsjUI+5dcmXsd8hQqNwA7Q==
X-Received: by 2002:a05:6402:51d0:b0:608:47ef:46e4 with SMTP id 4fb4d7f45d1cf-608d0948630mr2349225a12.17.1749901585160;
        Sat, 14 Jun 2025 04:46:25 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48de106sm2724230a12.23.2025.06.14.04.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 04:46:24 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] include/linux: Fix outdated comment on entry-common.h
Date: Sat, 14 Jun 2025 11:42:56 +0000
Message-ID: <20250614114514.808-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <87cyb6q1aj.ffs@tglx>
References: <87cyb6q1aj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Nothing is redone. All call sites of syscall_enter_from_user_mode() have
> to:
>
>    1) invoke enter_from_user_mode()
>
>    2) enable interrupts
>
> in that very order.
>
> syscall_enter_from_user_mode_prepare() is a helper function which
> combines both. It was more widely used in the early implementations of
> this infrastructure, but it's usage got reduced to one call site.

Please try to understand me before you make malformed responses too.

My point is simple and it is, why?

Currently neither you nor the documentation explained the technical reasons why 
syscall_enter_from_user_mode_prepare() was ommited and i was trying my best to understand
why?
If syscall_enter_from_user_mode() is doing #1 #2 when syscall_enter_from_user_mode_prepare()
already doing it then why it is not calling it. This is why i said it was redone.

> All other call sites invoke enter_from_user_mode() and then enable
> interrupts before calling syscall_enter_from_user_mode().

Honestly, my patch and my discussion doesn't involve about it's call sites.
My discussion is simple, either we update the comment if you disagree with me and the reason,
or we can simply use syscall_enter_from_user_mode_prepare() on syscall_enter_from_user_mode()
if you don't have strong reason to avoid it, then nothing happens because syscall_enter_from_user_mode_prepare()
internally calls enter_from_user_mode() and enables interrupts. syscall_enter_from_user_mode() also calls
enter_from_user_mode() directly also enables interrups, so if you don't know please check on your side also.

> That has nothing to do with instrumentation_end(). See
> Documentation/core-api/entry.rst for an explanation of noinstr and
> instrumentation_begin/end().

This one i was wrong, and i understand now. So forget about it.

My point was clear, the two steps already syscall_enter_from_user_mode_prepare() did and 
unless you tell me a clear reason instead of "we ommited for a reason" which you repeatly telling me.

> Did you read what I wrote: 
Again, my point is clear so try to understand as it is, then refuse or accept with clear reasons.

> ?

I don't know if what i asked you is hard and shouldn't be asked.

You must understand i didn't come here to argue with you or to annoy you. If you disagree with me these points i 
proposed to you and also disagree with the doc patch i said to you change enter_from_user_mode() instead 
of which makes up to date as i think because you didn't tell me why neither the doc you provided did. I think maybe 
about the doc just good English is enough instead of putting unused functions on the doc.

what are you proposing then, maybe you already have some way better than mine? OR
Tell me what are you expecting from me then?
Do i leave it like that, outdated and let mislead document readers?

Thanks,
Khalid Ali
