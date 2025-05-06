Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BFE28031E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746555791; cv=none; b=MHdF2TakeRdXs/jUujKXz/IfStflaS908GJxJT6dFT1JNksz3BKhYcKmjfIobYOpOBQD9aCs26tAUWdL9GTfqxfdaZfEm9+8IZRpr1R1LeUaOd+BWHOf3dq7ror1O66uN3tSlpUvWJ7traW3/iUCSLuPpijLZe/TvnrADRA0cnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746555791; c=relaxed/simple;
	bh=EHGhHhj026yDbs1JML90dP3Syzh+czzpX84xfOZ5Rpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBlQk5+lL1fPAx7DNM+TdHkRswHJ9KfOLGs7O0AFETcBIikke6ki77jq8STLJxsdgTZF8beqvVmME3imxcrJl4KDW9I2M1iv7oFbuS/Jo9U+VrirBjvFlFSBlyKKbQbHWtyZV+brF+qUKb1Q+JzaNoFc4h2pboBL3c/qhTcbz50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aE+QxgFw; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aE+QxgFw"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1069671166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 11:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746555787; x=1747160587; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KHDmSN4L/Nq3W8tIN5ZK3LcAduOgAVmEHiTKfO00nCw=;
        b=aE+QxgFwiRlJFJhpnWNjNVQ2E7pS62W/d6yfmMun8GWjsSZNA1EFfC/WbBwQhR9S65
         BAenUupCchPMArJLfZekEvtxZpUKLJQdc37FPE94gxzuTRsu1HHJD2F956kmroS6tmwj
         m3augLMr7Lvl42nXQw9hpNiC5kz8ovXrWdzuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746555787; x=1747160587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHDmSN4L/Nq3W8tIN5ZK3LcAduOgAVmEHiTKfO00nCw=;
        b=fgISapyFoP16wr2vlc9tyA24m6WYzJtKHrQrP8TeWpDqDsRtMauOxbZ2e09+pAmDbF
         bbAUzlV6OHPpxnDJ1HJysFcIdYA8xnoKygznNDsFtgsDVxU9RJUEkvcnShdmy3CeAuRy
         6YHWaVsk6tcZdHK3siXD+QJR5XFdXOajSEzqxuyMgb5rfd+CeB1rUW+UhdMjtAHf+DyF
         dVHbO5Qtjhas/zLyjsp4HKfQZLnnEZHExayOj81FJjkBG6k2veJWWdXFanRwvO5Ece98
         bceNrNIGfpDyLHJKCG8uUmrdAXhQJQZvJyi9UnJJzQqh+hw3T62uhX1w/MxJlyWo0oyb
         B4WA==
X-Forwarded-Encrypted: i=1; AJvYcCXN/hXuM6cjUf7TUQ3W25DEqd3QCcLQF/NhA+se7jL+4V7rnf4tNeq0iTDyy94JprKFyzAwCoDLbs2DpL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRQoADZb6PbQkWomqyeI3ajeUjQ//uq0ndbK76GFs7J2hc7ZdG
	bNgk0CFK6QugKjzp/9QP89uyw8VQ/qzuGc38F9jlz6ZUz3oNU4cKHW4xZuKWXjDpkIipXySJrZF
	nGak=
X-Gm-Gg: ASbGncuzi5Kr77YXXgHbRLDhO+/9BpXEvVqxx0fwp8em6v6iLJ/1x1zFaMgjn8rilfU
	+X9fnwWTAFQQLDagcQGOeE/JAcBqJHJPuWHKqyTaheNQG2BmJPX7LKQR//IF7GlRwloNuDHfDaP
	QYSoprKYt6sJGkJUkx2yZ792WbGftgmtrXF2XnhuIF1t1R2zv80KEA9245LH2WGoI4o5BJ+wXzT
	kz1TizNkhDp+m4RK6mh3xGVYHJpmwhL39h3WCckS1gNTm3gBTvXPEfU6idyFcK6mQ5jXTj15OZk
	g8gMFIL8c2rRjZVtEx1Xz/Tz+xqiHzwqwIvmpYeac5LcHUhGu+NUXDp5UdwZOYuK2XVYAO6Mnvd
	pctVbJX4wih6o20M=
X-Google-Smtp-Source: AGHT+IH+U5GpwFa1mCx6v/uz77erJ43gKgRU+Lqx4AgY8o3vSOe2E5N/9s52ZJnTPpNgUYyLdpQt0A==
X-Received: by 2002:a17:907:a641:b0:acb:8492:fe with SMTP id a640c23a62f3a-ad1e8d9c780mr44177166b.52.1746555786645;
        Tue, 06 May 2025 11:23:06 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540dabsm747934466b.171.2025.05.06.11.23.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 11:23:06 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f4d28d9fd8so8195837a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 11:23:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3UK9kgZKZW0+e0gH5t1/nOtxbu0LWVJ0pj0o9iihCvPS8Dqmne/vbqQdX2DsbPM6UljvtwzUv762NO4g=@vger.kernel.org
X-Received: by 2002:a05:6402:2547:b0:5f6:252b:f361 with SMTP id
 4fb4d7f45d1cf-5fbe9dbbe1amr291285a12.11.1746555785604; Tue, 06 May 2025
 11:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506165227.158932-1-ubizjak@gmail.com> <F66E73EB-7237-439F-8408-C0C39B1CE2D2@zytor.com>
In-Reply-To: <F66E73EB-7237-439F-8408-C0C39B1CE2D2@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 May 2025 11:22:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=whvLzKeEvw3W0NTJp97jgr0qK=0WGDMgCgvdrbroWq61A@mail.gmail.com>
X-Gm-Features: ATxdqUGAtnLNutBdsv_VJKjnVeUABH1AwvJyKpqTUZsjioY41mEHujIZVBF9PI4
Message-ID: <CAHk-=whvLzKeEvw3W0NTJp97jgr0qK=0WGDMgCgvdrbroWq61A@mail.gmail.com>
Subject: Re: [PATCH -tip 1/3] x86/asm/32: Modernize memset() functions
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 10:55, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Can anyone think of a reason why we don't do:
>
> #define auto __auto_type
>
> ... and just start using the modern keyword right away?

Yeah, make it so. The original 'auto' was useless as you say, and
afaik we've never used it in the kernel.

And the one advantage of it being that historically useless keyword is
that we can't have variables called 'auto' anywhere either.

So it should be a safe thing to do.

              Linus
