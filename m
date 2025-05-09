Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9106125
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805765; cv=none; b=XIfniJ+0mB1FEwKKz9gBIO4kMZuL0pP/7GuJoRdqr4ulOtW9X2FsV3ZF11xln7BiDix4Fi+zaXEoUp1S7rnXveLLshHHuD52lj5OkDcjVH1RNydpZhbZ2YtDbu1tRgXwfmMLS/WAixqx88zkOy7j3qIfETiVqNDeZmHEF7BVLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805765; c=relaxed/simple;
	bh=mvSGFbDLNDYEWHz+LKCdfPK5JWa4rBi7ioquuawqkrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M06NFOIoSaVkzStKSE0xqIp+F8wc9JdzajZR5qEEvKPMjT+thGZG6icaMMLHiUVKddK3P3JE2aNn0epCEQX4WUm6vE1GYkF8JJr3m0A9RHHIDG2kuc3LiEn/HJdQ/Mo2GPyDdai9LbUmTC1ZxtMgJNOLiv9eZp10YfyTZrIKDqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QH3YPafp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QH3YPafp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22fcf9cf3c2so8828715ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746805760; x=1747410560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qh9teHdhlvql2ao90Sr6yaH8jYA82kXsk39D9NS6AMg=;
        b=QH3YPafpBEQuwh2tJ4oAbTAJOh92a1NvpsHZ/4TroCz/mQpSrixe2MqMgyksen85T+
         Rgw9Z87DnTAh1/R/unsL8JDth3TOzTMWpWgCHvvfsc8beHjPaCuLevZk8+cAnYdz6bdE
         M78geNh5QutegeCRWWBq63Jca1XynJtZ8TRQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805760; x=1747410560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qh9teHdhlvql2ao90Sr6yaH8jYA82kXsk39D9NS6AMg=;
        b=AE0NSZO6A0WKVz4uzM6EV/h8Y99M3f+OkLf3kZ+jHre28v80xIeC6S0MQ1ufulQHQf
         eo44c+ZeJE0/71IpbH/Gq3DaCDJBZmyhE7mnfHklTf+Gm68lnI1C58k55rNHjKrlVEHa
         toqtsZ/FoBtGyHTbfXa97Ykrbme8zA3x+3HgVW/MHuK3dVCDua73a/cUkRmNaVQPBfL4
         kNpMwJ0b2pa4N5J5aI3bMOemw/cupnXK2P3b6k/heJs3Jnr5J3tVvJRhwaIM1iQlclNa
         Ca9Lnt5VBsKsEUSN7l13CbxdL+tUKELzm3Ug0PFaB6hQ7vWMnGjoT9EYTFV6lu7J27vE
         YLwQ==
X-Gm-Message-State: AOJu0YwpwdtK1mRRxZoIbpC5TNUc4rkV5tbjW18tFLXxP7Woa1u8wUW3
	fcr+EOWx92fS6PCYOuYr37rXkkufUZAHupEU2iiB+Z87UcFvhob2XiEZwHiidHyzRpvYnkPB2+0
	=
X-Gm-Gg: ASbGncuoIByFca7KDQDd8qh5LsjBNzJku6GYoBjtL85xQMc5V4ewQadUrc2KR1qcMSR
	zhJ0nPFOo0UMgKGgd2RWJLzr1ecs7P9hYr6oDnhN+jkdYkdQ0BHOMX2ASo/1c7PRaon+traZqPz
	WxopW67+vBBHQUQg2fGXKiFu5us8c+0R+GyvPX1VseUJyI6xWx7cJXfQDRjixHsfJdbYjdcGJky
	o+TZIld45GLYwk3EO9QQyPgY5u0esqSnGpvxBb+8asmXrJPuxIYFb/4cuPGc5Zv7xFpYq91/TU7
	krMiylIdLkHSIPBhdidswXjkEsQE/v4sT+JELKRXaxIpJhYh/b3pmlnPQmLyW3vxYzbBTBtjpAv
	TvW6qXnX9
X-Google-Smtp-Source: AGHT+IGJBbx5U4Wrs1YxImEcUNNtLvqRPN9yF6NYrOvmqkjONe+Gy2rJiYmKurGj27moZJP5DVMDkQ==
X-Received: by 2002:a17:902:ce83:b0:227:ac2a:2472 with SMTP id d9443c01a7336-22fc8c83d38mr61570285ad.28.1746805760646;
        Fri, 09 May 2025 08:49:20 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2351b78df5sm1621126a12.63.2025.05.09.08.49.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:49:19 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b12b984e791so1814762a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:49:19 -0700 (PDT)
X-Received: by 2002:a17:902:d507:b0:22d:b2c9:7fd7 with SMTP id
 d9443c01a7336-22fc8b7945amr58222325ad.21.1746805758517; Fri, 09 May 2025
 08:49:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509131249.340302366@goodmis.org> <20250509131316.483054226@goodmis.org>
In-Reply-To: <20250509131316.483054226@goodmis.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 May 2025 08:49:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W_xhfT=oVq9qXvRqUuhG5_Wvi9=mtV+GAh+Nwvp6a7Pg@mail.gmail.com>
X-Gm-Features: ATxdqUFeCcpCmKDATfFo9mgy1FVbhxqgtDvmLaaJ2j3XTLZLDVxIsriIjzQ4X3I
Message-ID: <CAD=FV=W_xhfT=oVq9qXvRqUuhG5_Wvi9=mtV+GAh+Nwvp6a7Pg@mail.gmail.com>
Subject: Re: [for-next][PATCH 18/31] tracing: kdb: Use tracer_tracing_on/off()
 instead of setting per CPU disabled
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <danielt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 9, 2025 at 6:13=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> From: Steven Rostedt <rostedt@goodmis.org>
>
> The per CPU "disabled" value was the original way to disable tracing when
> the tracing subsystem was first created. Today, the ring buffer
> infrastructure has its own way to disable tracing. In fact, things have
> changed so much since 2008 that many things ignore the disable flag.
>
> The kdb_ftdump() function iterates over all the current tracing CPUs and
> increments the "disabled" counter before doing the dump, and decrements i=
t
> afterward.
>
> As the disabled flag can be ignored, doing this today is not reliable.
> Instead, simply call tracer_tracing_off() and then tracer_tracing_on() to
> disable and then enabled the entire ring buffer in one go!
>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Link: https://lore.kernel.org/20250505212235.549033722@goodmis.org
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  kernel/trace/trace_kdb.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

I'm not deeply familiar with the tracing system internals, but it
seems reasonable to me.

I did a quick sanity check and nothing went boom, too.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
