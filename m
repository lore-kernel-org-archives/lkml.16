Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E991CAA84
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738451918; cv=none; b=CEsRbHpmI3l5Cki1OqDpzpJcZovmV5qdniNy8MUb2j9W4qk9g1mqTj2YrfH+/fM9EfmXNtloCRGaiNnktF6PCt/ocMtvdF8GwiUKAegZNikmjRMcitwmNxY2w4G+Ctx2Xy7P+JU15FKQ8O5TECBkQwjvcJ+8YxUgcrUkh8sRRlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738451918; c=relaxed/simple;
	bh=px3hVcznrT6Balh2mpqYyF108IlrjUXg4nFHrLhwroE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBe2c33imfUgzSSVcViO1BBuAg4giHODyi0EiuA4i3q49URiFcrwFbsOGrKzMfCIslutVSunQBJTgl65pHNWyomPW/uUirEL+oaFTPgaLuX7p0iBG4ds6IZwWVTKyDQk6lBgb70Wz+MQgXNw3NuMfT7J8dnRmB8ETSp4DDrXMK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KC7VXqrk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KC7VXqrk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaecf50578eso643617366b.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 15:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738451914; x=1739056714; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SZLpGznw6NX+7xYT926JUOJVSOGgi/nOeg57L4kVIH0=;
        b=KC7VXqrkJQwbLEkirxipmDP6pDuB3J6TJL/aeZ5sEKpyO1MC2pd2C1cYJNMCAqqN++
         wnS+z/vbOgAYSOU8uOa5Khbo5MW3h7aBDtGcT6Yrz3tGL+Fo3pv0uEO7hxjUnEpOfo9y
         8caSF+8zmqDaF1+nN7m3N1sy43C7kkIuKjVN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738451914; x=1739056714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZLpGznw6NX+7xYT926JUOJVSOGgi/nOeg57L4kVIH0=;
        b=wjvzyUYErOl0df0ZuxQlUYiJMobG7cxkA26WJIvBdPSC/0prFLbsYLW495MLKwIzAR
         ai0i3vQpFGxzsN28XXJy0FwseAmY1oPiJpz42RC8SnrXOuGMsIEfz8R1LfdZpUIgY5ll
         OW92oDearMBg/mr/EazrT8YEJqfllAe8hJyT9b4mKZGyyKXa8bxWgAADSXpHbg66jn28
         AzjBtUfATFjlrZ6MK/itOQPogbAF64sSTJr9jpVvqGynQW2pPM+gw8R9RVP8hgT+hpwI
         DFrWKq5jEZV6EMQQJZuWpyC6fkpD/TRrUveN7napeRIwJXE7c324JV673t1NTjcJb+tG
         NyHA==
X-Forwarded-Encrypted: i=1; AJvYcCWoXGja12SvO2f5vpSWdk2tWVZIzdOVKqQIfAIQI4OpNZRPJgm5Qv4D5IqGU9lN5VQ13v/6niamp7bzbN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdM+0RwqkZmU7qnWJWh0YYJVo5oAlHINjnTprX3o8/vnKG8EQU
	U4gpZMCHp2eVRsWrsSpAaY/n0krdN1TpOiAVWbLjoV1V3zf6rlbV/jI8wjEmBkmLWzzY8CWap7C
	cGlQ=
X-Gm-Gg: ASbGncv75GEwqzmwsr/9wXBTGRrnK1wjPIhY3vdOimBtA4vC2Foz4IXCB2T0zGfilvz
	gAVfy2Z2OQ1Zf4uFEoK/S6g3/MbFhGHM+87x1CGgjxNdG152CYoVdkE8B1aNP1BxP0iX27+C5Iv
	JW7KbbauCTi6N9Jf+RtDS2LFPLYF/GnxrOo8jOT6YsmL2qzKv9Zl3YAC6nXR1Fqr9wihHntEaMA
	bqTroG8F8SZcj3735T6P0BoOctRwGM1qRg7e+TKFOp8BbwQZvVfnYrN94ul/xJbKa3tsIAcPPVV
	itVLk8bm6YKMehdiXldatJfONtjLf5a/dTOXBhxOmc2FTvkWk3yHtFv29Q8SuIz/WA==
X-Google-Smtp-Source: AGHT+IGZtpZF04NwvGHPpqU3mYDiQ6xEt3Ybn7RkvaC7OOXCAaCDh3jpwIELLS4o21He1tLQsKJyGg==
X-Received: by 2002:a17:907:94c8:b0:aa6:b4b3:5925 with SMTP id a640c23a62f3a-ab6cfceaaf1mr1589520566b.14.1738451913818;
        Sat, 01 Feb 2025 15:18:33 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a553c6sm486972766b.165.2025.02.01.15.18.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 15:18:32 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dc82e38c10so3881057a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 15:18:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMQ5T895OszqWxVh3+BCb9P25JZItbkqP3ydI4Gj6CyNZG13UroQkqLJkQNTrW3aefXXXKCn9VRxEA+jQ=@vger.kernel.org
X-Received: by 2002:a05:6402:3511:b0:5d3:d7b0:b834 with SMTP id
 4fb4d7f45d1cf-5dc5efbdc80mr17093042a12.1.1738451912012; Sat, 01 Feb 2025
 15:18:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131225837.972218232@goodmis.org> <20250131225942.365475324@goodmis.org>
 <e83ce086-b55f-431a-a499-f83a434b70db@efficios.com> <20250201180810.1faf4906@batman.local.home>
In-Reply-To: <20250201180810.1faf4906@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 1 Feb 2025 15:18:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgTWVF6+dKPff-mhVwngFwBu_G9+fwOTF2Ds+YPj3xkeQ@mail.gmail.com>
X-Gm-Features: AWEUYZmCClD8GCIsriJ_eXSqgwv6IsNbs7qWhVjH3BZVbVBbtFnqEYYSxzE1ZZ4
Message-ID: <CAHk-=wgTWVF6+dKPff-mhVwngFwBu_G9+fwOTF2Ds+YPj3xkeQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/2] sched: Extended scheduler time slice
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Ankur Arora <ankur.a.arora@oracle.com>, linux-mm@kvack.org, 
	x86@kernel.org, akpm@linux-foundation.org, luto@kernel.org, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, willy@infradead.org, mgorman@suse.de, 
	jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, jgross@suse.com, 
	andrew.cooper3@citrix.com, Joel Fernandes <joel@joelfernandes.org>, 
	Vineeth Pillai <vineethrp@google.com>, Suleiman Souhlal <suleiman@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Clark Williams <clark.williams@gmail.com>, bigeasy@linutronix.de, 
	daniel.wagner@suse.com, joseph.salisbury@oracle.com, broonie@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Feb 2025 at 15:08, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> No it doesn't need to be yield. That just seemed like the obvious
> system call to use. But any system call would force a schedule. We
> could just optimize yield() though.

No, "optimizing" yield is not on the table.

Why? Because it has *semantics* that people depend on because it has
historical meaning. Things like "move the process to the end of the
scheduling queue of that priority".

That may sound like a good thing, but it's ABSOLUTELY NOT what you
should actually do unless you know *exactly* what the system behavior
is.

For example, maybe the reason the kernel set NEED_RESCHED_LAZY is that
a higher-priority process is ready to run. You haven't used up your
time slice yet, but something more important needs the CPU.

If you call "sched_yield()", sure, you'll run that higher priority
thing. So far so good.

But you *also* are literally telling the scheduler to put you at the
back of the queue, despite the fact that maybe you are still in line
to be run for *your* priority level. So now your performance will
absolutely suck, because you just told the scheduler that you are not
important, and other processes in your priority level should get
priority.

So no. "yield()" does not mean "just reschedule". It rally means
"yield my position in the scheduling queue".

You are literally better off using absolutely *ANY* other system call.

The fact that you are confused about this kind of very basic issue
does imply that this patch should absolutely be handled by somebody
who knows the scheduler better.

               Linus
