Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FAE2F30
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743133409; cv=none; b=eGz4Q73Hq9ZusHYhW8aF4O5gd5BtdifogaSD2yyukEusMYfvrYOVGQ9+kga+hsgUs1Q3iSLxa5Ert/7soKHOv72ySqdnIDaVO6NVzAZRhYrJkcXJqS6EuzKca5ls+BrRK2WECclhljMC6n9y1tF7XFCslDlR8o9ZUCB5pBwI2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743133409; c=relaxed/simple;
	bh=5KizG9U+nymCL1zxruIsU1WfoyjYbMQzPHIHfuQOoLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1nrzuyQgSNYNoqLtWGWREduTPIQYh3oHdYm5Ri0svz9G1qzTaqn7MsX8pVht6PDY3MHf5uXnu1JKo+wYP33cmW3vMV+ZYCtF5ndUM69t+q7Pr6RXbdORkDG8dxh/sopSCva4BT8tXkWmgFOlW/T1rrZshqKbwqgq9q7EQ4LOZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LCSxs9ji; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LCSxs9ji"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab771575040so546073566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743133405; x=1743738205; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=15SzzbPNLw8wKjBJ1OqnK0PG+zgLlP/9UcbfuOzMaPQ=;
        b=LCSxs9jip+KgPY8NqzpgCpm9kXeL3GBaIscYpBsCQUw23uIZxV6GR6sMhBl76Qn3z5
         5R6yf0YiPHNitR1OxCx9eQhcwE7oFcOZWX1XZf4cE0ThTeT4GcDus4cUxuAldxUJjFtt
         LBzG7f8ZOHZIDR1v9MneOHM9QAQWHDxU6y36c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743133405; x=1743738205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15SzzbPNLw8wKjBJ1OqnK0PG+zgLlP/9UcbfuOzMaPQ=;
        b=E+GvXE/Nm83rBxu2pP6rxYEMAJCsRlIasTtq2bqvZfkoRPMNip5g5G9Jgh5/mTNd5W
         R+8oVfvOoUNMYvph76+VDyC+JqfbZUS4NjE7L5BrAmjannR6TQ4pPMUvvT8fW4ynoyvK
         B8tIL9C92eoteLyzK8FLTC+b8DZ15ZjonDSWN3Ga7iBhrUfD0e7QaRwy1E2A0vchMXlr
         fhD8vdH1lNA9s25nT+P2Nmrl8N3xKvGMo+7V2ExRMMl5o+NRVg4ViDNvi6AKt8FMh5dZ
         C3LZSBkjJpWTIsqTNg9trREO2ee3nBgads5YJBSEPbLQ+ytt7z85RQTzWgsSQi5DS/48
         bm4g==
X-Gm-Message-State: AOJu0YwlBjUtxn2fIuBr3qjwEUf10Frb5N9GhQp2Qbv8x6V7Tq5fbmHN
	1PxApAOpbhuyatICKMmVSsF6PcLmoYVp/HdIbvKyEau5pOOPNCbhfmOWMNVj6quHiOwYORuXH6d
	Xrzk=
X-Gm-Gg: ASbGnct1Rkfvt2mlaLveGX2ddTKH0fqa1cieLdVBXZEPFvwP74SWf5S0lO9vZP526sj
	NSYeA3vXSQSZDsCzFze0Zu3oFm+HRd1wgfSDVZ/tRXDts4C8cV7WSTuWvaGhmJtbUbdGgkoTUGC
	fpiQ8KJO3YMzXxax9Dy8vlnLlnVhgbMBMWQPL+8NxkOpPcOw06Y++I3MxXE9Ay1Q8ljJHuFanlD
	xcJV+2tJMzEhV4E9neRRyP0lOxJlYmWhzYr8dTgkCcvo+BbWtliU1JMECzza1FI87c6L85YrWqS
	1wur9W4JUufcNKeuBbC5sDlkLDNHlVwPRjT2wvV/NdUbmv/R4/iI35LF8wn5sOUMpBDJrlUUXS9
	d4Mo8fS/Z5x+0RrVrFY4=
X-Google-Smtp-Source: AGHT+IEVOQXSgHW1PIpM0wkaF8GPKD5dUgYu3zPJdVrQvPqXSRXfV9n/sqW65fOkougolGhGkM0TKQ==
X-Received: by 2002:a17:907:3e8c:b0:ac6:f5ad:e96a with SMTP id a640c23a62f3a-ac71f4e4116mr88697666b.24.1743133404781;
        Thu, 27 Mar 2025 20:43:24 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196f56a9sm91257366b.173.2025.03.27.20.43.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 20:43:24 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso307506466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:43:24 -0700 (PDT)
X-Received: by 2002:a17:907:7e86:b0:ac3:8895:2775 with SMTP id
 a640c23a62f3a-ac71f47b90bmr99969866b.13.1743133403881; Thu, 27 Mar 2025
 20:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327171037.032bf7e7@gandalf.local.home> <CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
 <20250327212447.24e05e7e@batman.local.home> <CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
 <20250327220106.37c921ea@batman.local.home> <CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
 <20250327224400.304bc106@batman.local.home> <CAHk-=whzQAYKuoFm9WGOE-QJJ47xvh0VN+RW1EEPCHTERQntQA@mail.gmail.com>
 <20250327232729.031be0b4@batman.local.home>
In-Reply-To: <20250327232729.031be0b4@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 20:43:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZ_OyyvRFuMkW8RPR_Hehm=sX5dYs1R_uF3F6Y4MnXow@mail.gmail.com>
X-Gm-Features: AQ5f1JrMz-QJuBaiUde5oeEJk6ZOiChQp9WMYsqHihHXrbvpYki3hAphtksoqt0
Message-ID: <CAHk-=wjZ_OyyvRFuMkW8RPR_Hehm=sX5dYs1R_uF3F6Y4MnXow@mail.gmail.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Feng Yang <yangfeng@kylinos.cn>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 20:27, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> So you are saying that you want this to save the page struct directly
> then. My only concern with that is the added memory to save the
> structure when it could be easily calculated.

I think with the right amount of clean abstraction work, you can
probably salvage this without having to do the double accounting.

Because I did like your rb_get_page() concept at least in that pseudo-code form.

I don't know what the actual tested end result looks like, maybe there
ends up being problems with it..

         Linus
