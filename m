Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0492367D9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749846634; cv=none; b=BXWiKe8/7CtlOnxb2CwZYj6bsuW5RTa/AWiA5W1ax9wSf9YRrr3WKQ3ZLaQmssSuSF0ZAlaVOIMfsEMtvxRnktY0auHAxzan1ByMlRjDvboeHxQuwGKz4/c5eaeKUcjPubeDS4ZEdxNTQrF+hAIBHjrhxd3w1AChEyxN/ZwXx/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749846634; c=relaxed/simple;
	bh=6hMvnHrlDGmIsq+dHiAUFLU63nbpFzoG7BlKtAAWUjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t1zO3Vnr23C/7jMso4U/5HlpRo5wgE4l8kEgThg32ARf6vowXiRy/ZSoS4cKD+27Zk04Seqi61Ord833Oyy/bGrW0RHqmsTPkwR/1FeelevN20WOuVED4GgBAdcfGnRxzYd27+1nxuffKJdj7H7hh4Y3DL3SzUjfEaHXgUZryGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3AABrSp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3AABrSp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so2465067f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749846631; x=1750451431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6gxnPqEZ3rJPOAZK/e5c7eolLEIOuidR5IiopqFvaw=;
        b=X3AABrSpzXyCphUFVLSdRepaqzHHfrh1wgUyL10IRMj99KMchZZiI6pk1qmtGOHhJG
         E8AMSxgw98Wnjg8NpJdILz/KeX4AoVoOkh4QhdcGkY3UsJOjl9SpxCQ9kUdrI2cP/Orq
         xWoWzR9yMZFggcd2hn04XQpISVmP04mVR6K+LhsoIPvyumyzR2xqE3HGj656eOvcKN18
         DG7qM/4RN3+UwFeeggZBZAVCCIovGNPVjxCGgoJHWZOYpYUsUs7h1hZxEl2zC35tQBY3
         ZSrOI/cWPwkMQkVd0Nwo3PXKJ6MLzzymzvGHknjBgkSXuUxOsj9Wni+U1c1xYNb6B2Xe
         +YRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749846631; x=1750451431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6gxnPqEZ3rJPOAZK/e5c7eolLEIOuidR5IiopqFvaw=;
        b=aWTlxYt2RS+3SqLpxXeS7k9tO3DfYFGlV5EYsLWs3Ewr63GYCjBXsMcK+IMBqipgMs
         5QWJJVvwFm410sIett5AGrO3Q7JOeOPNwZyzaOYvLsQ5Ike38FC7Vl1nv8mxKOPhPiDF
         ivFCaqiVeApOSIo176vOGrbr1hxjH3F29A8XQijvbMSdQp5AWDtlCo+8PU0JVCCvQ5AW
         nFJqXTGirJRb2DT1VWwbkYyo6UAOx4Ps8+HQpilkgEgdHL8sLYti1b+VjXJb2Sjr2XMV
         ez0s6ss0R4Ds5EOfk3dxkar8hcBCZlbrsleM1wibC/WA6TaMu3Z5vVtoviF6mjEaZjHL
         OgQQ==
X-Gm-Message-State: AOJu0Yz+CSJ/3x4aNqdG6bsGTdv47X/MC1iE2iEhoSt1vQ9ttcjk14x+
	GkdXd3ukSwy0HWIVnslUMFAi3whKFdXcdKM+AyvNfuRaMXTkTMsUuWsPH4Xhtw4B
X-Gm-Gg: ASbGncvtTxtUrXebO1LctMDApuy+ye0BATKbRQXOheybdak83AgCSp+gZCffHTNtomR
	0p/tSI/KQSdmP5goGqbfjaXfsQ6ys7AdGhhToLtsu0gEypY+ckzSqEPYUoGJsoqjl2W59ioKksT
	Z5kZD1m04EDZkPxgSVuaPaQ8G6MDenAUq7YNhPvz3s001QKNSUxkoRgd2d+KJNhDifIuqwoqRux
	wacrbJAy3ymI6cFvkYoJdeorxDefOL7mB7DgHKdGGOkYnfQpHYz+H5Uh05nJr7xxnZjI/WNF0sz
	443u61YUQ561UNiqW78jZlwU5n+8k/8ii1zoTqkt6eU246HwCTgSTVN9Pm1m+Wm472Jk+69269q
	U
X-Google-Smtp-Source: AGHT+IEDjuQsLnKawdR179gPNxjs65VEiakJVNIb2Tu9L+ChyqkN7o042MQHiuqMO5RKVjxKiaqvWA==
X-Received: by 2002:a05:6000:2507:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3a572398d8emr1099000f8f.1.1749846630570;
        Fri, 13 Jun 2025 13:30:30 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8f2e0sm61628255e9.8.2025.06.13.13.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 13:30:30 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel/entry: Remove some redundancy checks on syscall works
Date: Fri, 13 Jun 2025 20:28:49 +0000
Message-ID: <20250613202937.679-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Jun 11 2025 at 11:43, Khalid Ali wrote:
> > There is a redundant checks of thread syscall work.

> Not really.
>
> >  After we read thread syscall work we are checking the work bits using
>
> We are doing nothing. Please write your changelogs in imperative mood
> and do not try to impersonate code.

Sorry, i guess my english sucks.

> > SYSCALL_WORK_ENTER and SYSCALL_WORK_EXIT on syscall entry and exit
> > respectively, and at the same time syscall_trace_enter() and
> > syscall_exit_work() checking bits one by one, the bits we already checked.
> > This is redundancy. So either we need to check the work bits one by one as I
> > did, or check as whole. On my prespective, i think the way code is
> > implemented now checking work bits one by one is simpler and gives us
> > more granular control.

> That's just wrong and absolutely not redundant. Care to look at the
> definition of SYSCALL_WORK_ENTER:
>
> #define SYSCALL_WORK_ENTER	(SYSCALL_WORK_SECCOMP |			\
>				 SYSCALL_WORK_SYSCALL_TRACEPOINT |	\
>				 SYSCALL_WORK_SYSCALL_TRACE |		\
>				 SYSCALL_WORK_SYSCALL_EMU |		\
>				 SYSCALL_WORK_SYSCALL_AUDIT |		\
>				 SYSCALL_WORK_SYSCALL_USER_DISPATCH |	\
>				 ARCH_SYSCALL_WORK_ENTER)
>
> So this initial check avoids:
>
>    1) Doing an unconditional out of line call
>
>    2) Checking bit for bit to figure out that there is none set.
>
> Same applies for SYSCALL_WORK_EXIT.
>
> Your change neither makes anything simpler nor provides more granular
> control.
>
> All it does is adding overhead and therefore guaranteed to introduce a
> performance regression.
>
> Not going to happen.
>
> Thanks,
>
>        tglx
Thanks, for the response and noted all your points, however i spotted some minor details also:

First if we are talking about performance then we may need likely() on SYSCALL_WORK_ENTER since 
the probability of condition evaluating as true is very high.

Second syscall_enter_audit() missing SYSCALL_WORK_SYSCALL_AUDIT	evaluation, aren't we supposed to call
it only if SYSCALL_WORK_SYSCALL_AUDIT is set?

Should i create another patch fixing these two points, of course if i am right?

Thanks, Khalid Ali
