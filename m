Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38CA2571C2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278700; cv=none; b=NsuYRQ2rHK/eOT+ez5YEWNEBVxVOn4TkO9hiFxjmKnblOCuqwdFndJbnbh03YKOIJhi4krptjOZ2zF2CuoI2CGO7YyRsXWcoCpxqv0NGV2GUPYuU+3ua9XLQ7fRgyZhHKPHKWTlNhZig0u2UoJVzRuDRKvQshAxTeh/3vYgq59I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278700; c=relaxed/simple;
	bh=V268JiYp1qgsriQME2p8Eu+S7bIZEYfIhtv1bRYTaQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7I6XywDCWU4+bpsVyxnNZeYa4qrIAkqyhHVtRElJQR+FXC4nbnmrpsy3cczf0q7dbkwRHObdVwMDY0M7J6OEE0kztatSYc8ugZODk/c2EMVRVJQ4pSaOrwT7KwoCxXcD0KTouuqL+7Np0hxns7hZMjkBzwkyKzRJoftZbvaRRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3i5mgHN; arc=none smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3i5mgHN"
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-30f30200b51so5615031fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744278697; x=1744883497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V268JiYp1qgsriQME2p8Eu+S7bIZEYfIhtv1bRYTaQw=;
        b=i3i5mgHNvJSoKZerzWGBGMarUIhWym6E9IU0tTh+UrAcXmFjeqoh3Dgr6wxgtS2FLl
         yx6wqqvQICgWCB3BpIZJWKd6ssU6XNcTJU9FQMrg4cdIGCnj+/eL5d73m4aavNX0+t84
         XjUOSWFyvs+Re222yUhowfWa9ybydzVgFzF4jz7zCLSwKWIuBXRufTT6Bj5LvoRAmBqW
         aWCQ/Xo2g+ENntjKKDMbw4IHiAHt58Cr99bowddIT5mOVn8WLBjwc8yu2yfLR768sJg6
         IbeB1WfoXtd8EoUcz6TAbiFFI24rOtg4DYa38URma4laL12pZ6Yo2vU86kvJb8q9q+NO
         tl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744278697; x=1744883497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V268JiYp1qgsriQME2p8Eu+S7bIZEYfIhtv1bRYTaQw=;
        b=TMTbw5KIf6JWuusHkzUGkEJ+jC6Hd3KzMS8Ex0XrLVkFQkRpzKLoIcCSUVni6F9Ifs
         EKftTKYbiQOtkzm8i1OjTfYzMjkS4OV3HxMW0JQ3ug0+C01lwc5WwblCrwbVl1wuJJ7P
         SUJzkPKBvlk7eoklfaCBqf5Ae70jWpJsOhr2XPPJmrzD3vA1UsZWjkUiJGS/s66sHETT
         0Al61YjueQBaYfIr4MtCVgG4aWauQ1KpHfTkX+6P5cPpgRRx2IvimSmBJ0uOMgY4LLes
         KQeGi+LVF86GNxN3hbjQa3fg06Xs5lh5dxB56aQGrja3CgJt1Dy+KAyetbm0gkb9gcBb
         /9ZQ==
X-Gm-Message-State: AOJu0YyvUT4Jg2Flh7k1Z1HGTAE4l7DohdIhjLiUegzpGOaE3vl5+9qE
	sL5XNzC4HVus6we0oOhjudHyDeezeQHOPOOVg5Io/DS+NOWLTtOVxZYdOaguduz0b73q5p41tLn
	KIptW5hQf66mcgtxhDf+cfyiwsLs=
X-Gm-Gg: ASbGncssHLLo4jviyXpCQqEry+Q8vZiVVXiHMnQOOVOSZ8TeFBfwfnKtINIWuuKAPri
	tt5XlI0i9yXOM203CnIPXsm4o+qxLJpZaI6YaJuF2y9Ph1FaEBr/o0qIq+mtczlHwZLr4RAFKe7
	XCEhki0U44Tc6hCbuoJeOiWKw=
X-Google-Smtp-Source: AGHT+IGfOLXaLVfkBSOk7/R3b8gAPXiNTlMnDU6ZeIYNK/H+a3/WOqicm0j2YWp4/VZ5yBwLstwjvNzR0tbqWgM8OMw=
X-Received: by 2002:a05:651c:199e:b0:30b:cacd:fd7b with SMTP id
 38308e7fff4ca-3103ea9fe1bmr5195101fa.12.1744278696438; Thu, 10 Apr 2025
 02:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com> <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
In-Reply-To: <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Thu, 10 Apr 2025 17:51:24 +0800
X-Gm-Features: ATxdqUFUuMeyf6c8vrhD4XS_XeHAA4NcbiphF5TdJMy3W3hG76Fx6y4Rr2ARr0E
Message-ID: <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com, peterz@infradead.org, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John:
Thank you for your feedback.

On Thu, Apr 10, 2025 at 10:41=E2=80=AFAM John Stultz <jstultz@google.com> w=
rote:
>
> Unfortunately this patch crashes pretty quickly in my testing. The
> first issue was proxy_needs_return() calls deactivate_task() w/
> DEQUEUE_NOCLOCK, which causes warnings when the update_rq_clock()
> hasn't been called. Preserving the update_rq_clock() line before
> checking proxy_needs_return() avoided that issue, but then I saw hangs
> during bootup, which I suspect is due to us shortcutting over the
> sched_delayed case.
>
> Moving the proxy_needs_return above the if(task_on_cpu())
> wakeup_preempt() logic booted ok, but I'm still a little hesitant of
> what side-effects that might cause.

I=E2=80=99m sorry for the confusion caused by this patch. Here is the
rationale behind my approach:

To ensure that donor tasks can get a suitable CPU and avoid negative
impacts from the Proxy-Execution on load balancing,
`proxy_needs_return()` in `ttwu_runnable()` should return false for
all donor tasks. This allows `try_to_wake_up()` to use `set_task_cpu`
to reselect a CPU for the donor tasks, unless the donor is already
running on a CPU.

This patch worked correctly on my QEMU-based test platform, it seems
our testing methods might differ. Could you please share the details
of your testing environment and methodology? I=E2=80=99ll try to replicate =
the
issue using the same approach.

In the meantime, I will carefully revisit the logic in this patch to
ensure its correctness and consistency. Once I=E2=80=99ve completed the
review, I look forward to further discussing the details with you.

Thank you again for your valuable feedback!

Best regards,
hupu
