Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEDE147C96
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 15:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738423825; cv=none; b=qSYHxubo1sdEiLGQgrlfg7W1PsGC1N+1IC96wQ4RDQH3lgPU5sF3ABkMdWWhH4uCNxcSWUx9xghr7RxDuxqUkjyxF7H3HAyjMeX110T9qXW1IB/jIUrNO1EzJRwRK38zJVnDllPuGFHtPmVCBZr8RO65r21mGytx2IEh6+H3m5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738423825; c=relaxed/simple;
	bh=jLAFeOa4B/Ui1zQ/QRR3Ay8hxmZN3q4aytmcl4FjB88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j0104LFADb8yGv/7EDLCRzXDfvk35ASnRhcxnkueYU3uxxPjruBttwUs/0YIpzm+nUGT4SzGT/RFbInsoRUXCX/RnVCH1TTHxxUeTfh1WgS68FHRMYigkYFqwlMx2NXGLWRru3G5pYRuO/JBojRiASzWeWTSloDBaGth7gBFap0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=bDdHWCRb; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="bDdHWCRb"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so4707042a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 07:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1738423821; x=1739028621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLAFeOa4B/Ui1zQ/QRR3Ay8hxmZN3q4aytmcl4FjB88=;
        b=bDdHWCRbrJTQHW/t6UBBd+9h89pXdjWvq0qaFJpE6ZI+9VV8kzyTwV6opPwZ5iJHg7
         wnUz9k20njSnj06DSRkKp3JqSjkk3jByiBzMRYSIEUwx9ZW1rNem0XVRzNQPyYwDpEEC
         8RYmHIeaLxSyPkndEO48GQXJ1Bew6Q3pjXanufYccN5QvVDDfVGK38HWzUx8kXDvZ+m/
         ZfTIgPM30npnz3AA3oVa07Uui9I9Gl63/UptwuM5URNm32WLySsGAMk8cQJZcI2APoiB
         eRewXUDm/P/LBhdSPbxHuHesOSBzCettrNMCmxBMhF2V3wx4olZ1yik6Q+KQlj87R6Hs
         xLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738423821; x=1739028621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLAFeOa4B/Ui1zQ/QRR3Ay8hxmZN3q4aytmcl4FjB88=;
        b=lx3EnH4jxKHtE8aA/afmd9ON7PHV9PQfxpcpsVvZfOpbIwLuIzRCIPzUgi0oErDc6b
         1XoDOG0yURPYP7gdUxLNWhsAgqpm/10WrMWG4bSuLEzRSYz4ebl4hw89Zhwi8kiV1b8A
         3gEX3VI4dHcKvM5wjuVWrRjGjd/uKxfwTWpxjHEfd1QbIfZj4ZJxHOQgwCc/iOdzChFU
         X+eTRYv59OsuGacl9TP58XgOFDqPYauu7/t3L9yB6C6DEi+0npINZR/ZEB2wF80/2jwE
         Zgf1+0SoA2KyF1b/LoJUMJC2W4oB+aYePc4s/XPdL4r2bkNyWcwIYHSEahfQkUPGYj9e
         lvvA==
X-Forwarded-Encrypted: i=1; AJvYcCVhXt/t80uGiA8I473xqbOdG0mGaPPOGiYSuUewrt/06fLHgC5tPgF9YBNKWZEW9AGQkMSVhdV7Vap0Dzw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4nlHIMxkXT1kxczVIRk6xMhTSGeZXsvHOPis2N/5QKVZ5wWRi
	VmeVF/g9nkkS2cnVK3jPRsH9DtHCbw2+MzeTY3apz1sgwXv2DZU9RSyRJxv79+xUvCA6WFiL+6g
	rOzARHm6Vt8q9Wn8N6QrBgv4JHnL279Ph+nOMkg==
X-Gm-Gg: ASbGncuW+VqJQ4w0aKbClD6VurTeGFVEjfInCHDfETFVisqrniYbkBUuHHMs/qBb/Hm
	ZX66+tMARiaVjN0JElrff0H8LHv1EGjJvQ+F1kUvxvyOVHMnOLoylS4oMpSJlUSVFLYDwePFRht
	jUeHQq8zSQzq/z9U5mqnu9+EO1qw==
X-Google-Smtp-Source: AGHT+IFFfVIGpqQJoDACtjvcQRkIcsgXRPVYG0JR7kLuxe3GgL7axL6RzBLZ9L8GIQHNcLs2mhYll9C7B+CqrxPawts=
X-Received: by 2002:a05:6402:5205:b0:5d9:ae5:8318 with SMTP id
 4fb4d7f45d1cf-5dc5efec050mr35634701a12.20.1738423820832; Sat, 01 Feb 2025
 07:30:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128133927.3989681-1-max.kellermann@ionos.com>
 <7f046e6e-bb9d-4e72-9683-2cdfeabf51bc@kernel.dk> <CAKPOu+90YT8KSbadN8jsag+3OnwPKWUDABv+RUFdBgj73yzgWQ@mail.gmail.com>
 <f76158fc-7dc2-4701-9a61-246656aa4a61@kernel.dk> <CAKPOu+-GgXRj-O9K1vdGezTUGZS64w5vpkZg2MM-96vmwqGEnA@mail.gmail.com>
 <daaed11f-02c4-4580-9594-fcaef35a35fd@kernel.dk> <a6fa1317-f1bf-4179-9da4-a77f86b7523f@kernel.dk>
In-Reply-To: <a6fa1317-f1bf-4179-9da4-a77f86b7523f@kernel.dk>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Sat, 1 Feb 2025 16:30:09 +0100
X-Gm-Features: AWEUYZmz9mAYxPgfq5lQNW0GlIwU_G0PYShDHmlvC05ISUvP8Ww8dmTy8WqAP3Q
Message-ID: <CAKPOu+8Xi3oBz3zwr1bJx+LN=6cZN5eiBsrvRLZ_vOMJuOpZ9Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] Various io_uring micro-optimizations (reducing lock contention)
To: Jens Axboe <axboe@kernel.dk>
Cc: asml.silence@gmail.com, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 4:26=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
> > Not a huge fan of adding more epoll logic to io_uring, but you are righ=
t
> > this case may indeed make sense as it allows you to integrate better
> > that way in existing event loops. I'll take a look.
>
> Here's a series doing that:
>
> https://git.kernel.dk/cgit/linux/log/?h=3Dio_uring-epoll-wait
>
> Could actually work pretty well - the last patch adds multishot support
> as well, which means we can avoid the write lock dance for repeated
> triggers of this epoll event. That should actually end up being more
> efficient than regular epoll_wait(2).

Nice, thanks Jens! I will integrate this in our I/O event loop and
test it next week. This will eliminate the io_uring poll wakeup
overhead completely.
