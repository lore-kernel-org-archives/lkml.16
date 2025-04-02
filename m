Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155EF13D279
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612142; cv=none; b=YoRw9LoHgw9KiGA4Oh5SOA5Dp8fKRYFjI7nqGglTZbev8MB1FlQxsBRV3XP1D4LaqxEmY1CwSqpfB1ggpxkecmbSC9LyOfeFndusJ8aLWyJZYwQ08JySOmdY8LLG5IGuPxo/hhOiCUY5xwrLcvjnfrzhWi7wlXwjLKcD8BkHZQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612142; c=relaxed/simple;
	bh=jDMS7s/QqERhxp6/24eiwlAd0eMfjngKpnVvj0XkLKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdfyLVziLp1IlOSXqgehbY5Tb9M2bXcsJ7fqalgy55eBS7+bXfY/bHbGbjFZu0TmGAsF7+AgLZGP7SxOmlfRZiGwm3ImFLLHSPCvXngN49NCre3uDVHD6yfOlWjoqTXLl1qfj03qi/j93w9YMAyfZz54fQAyvV8nI03siFvFpyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fUa6MEmF; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fUa6MEmF"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2094577a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743612139; x=1744216939; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PiI+w7mkKlftQ5tbROJbiyp27FCKTbLNo5OCEHanpjQ=;
        b=fUa6MEmFiAFLnnMoaAYsEze4TkUuRyRmrXEqXXIvcFtXbERU058DFbuC8cOVQMARY6
         FgEAFO/B6PLiFVxAeMUPeBhlrs6HNF76fTb+kJgf/SeEjuor8G0iZrxZnDOVCdJqgc8v
         Q2oiB33bia5h6HkTddyrjv6zrkbJbkBeRayVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743612139; x=1744216939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiI+w7mkKlftQ5tbROJbiyp27FCKTbLNo5OCEHanpjQ=;
        b=vy3bg932SIDuIBtgepwgtJFIEPpyKhLd44o8m90cMTW0ZW+o5fn6zFW7J7gq0BkUFM
         Yknre8w0CSlu1fU7K9yNyznh6kg5cuelj7+rRjTuqknOk4jfk1KwE8j8llJV5BlQuhVl
         mBXUOhRrX3G1OhUmna3C0v2E2BfMdYKMS6vquPGRk6FJ0Kc6GhIbwxQiUDNFgRX07wCZ
         XLyLxsmWhEGcV2zqFiNU++ojK+ZSKhU4937wWizkLUtf0DqtrzIMPw3FxYF9onX0iAJq
         bNKuTdSpxRdu1DLhMpIbT2dzvT1F3x9/jJCgDnm5ctv7GzHWKyZ/jS7JhLlCcLKdHYK1
         hhsg==
X-Gm-Message-State: AOJu0YxRfOZSZcFwErzMgRgZfaQxWKvdRvLRvWE2WQ6T0JxcQJ3sbMeY
	JnyQIDW5v8PflJNlc98odpEtQV4TTiu6sUGAI+hPMIpZxHaVDLZ/+snR57Fvxy/hWkc/D+7j9a6
	AWNg=
X-Gm-Gg: ASbGncu1Vj68o/F409X4m/4UZn/C9y/ebmD/CyNiyRP1dv1BHv1yegAEUOBRVQZs38v
	Nw7rfjxeLFerdIPbcJ6h0USvi2hJ2SCOkkzkalIVCGMeEWNRSX1Jm5swKUd7l+NggoDAdkZAHSS
	S+G6rN1jprp64zkeLnKs1WsgvOzJmo8Dv9aJStLGOMBAxEi76dPGcqyai5vnRiu2tzfokBGHJff
	9vapjeMn57yhTplS5CLfw1wbQ6mjz64uuRuGN9Esi38dNmnZkZ4841wxcOMo1Er4//sBlGhkJJV
	0X7IianoDuMSjvdajdyUk755ml3pxGH1rDwDzHLAo/VGRsVqBjW4B3rKg8JwpSqovJ1xKobVQTe
	F/kKe/ZmXfKoLairORPA=
X-Google-Smtp-Source: AGHT+IFZPQwIgZ4ezeNU3EKrYv2yxa0skiOX3qqhiErAC8pOaVU5tpISRMkzq7+t6HrFYU4/Pk/arw==
X-Received: by 2002:a05:6402:13ca:b0:5ec:8a77:7f2d with SMTP id 4fb4d7f45d1cf-5f084157685mr221009a12.5.1743612138938;
        Wed, 02 Apr 2025 09:42:18 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16d4752sm8764341a12.27.2025.04.02.09.42.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 09:42:17 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso2323666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:42:17 -0700 (PDT)
X-Received: by 2002:a17:907:72c9:b0:ac1:ecb0:ca98 with SMTP id
 a640c23a62f3a-ac7b7184e0dmr16775366b.26.1743612136665; Wed, 02 Apr 2025
 09:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401225811.008143218@goodmis.org> <20250401225842.597899085@goodmis.org>
In-Reply-To: <20250401225842.597899085@goodmis.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 09:42:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wifCDa6FfRKzeioYuEqJFTeXnYQ1DpeuYsmmn59NWuakQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jo_6jfKVd2ZZL5O-Nn69rU-B6u26vp9pp03kbk_PkBqnLF3DFsRfWV2_Ok
Message-ID: <CAHk-=wifCDa6FfRKzeioYuEqJFTeXnYQ1DpeuYsmmn59NWuakQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] tracing: Use vmap_page_range() to map memmap ring buffer
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 15:57, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> The code to map the physical memory retrieved by memmap currently
> allocates an array of pages to cover the physical memory and then calls
> vmap() to map it to a virtual address. Instead of using this temporary
> array of struct page descriptors, simply use vmap_page_range() that can
> directly map the contiguous physical memory to a virtual address.

Wait, what?

Didn't you just say that you can just use page_address() for the kernel mapping?

So the whole vmap thing is entirely unnecessary in the first place.

Including the simpler vmap_page_range().

             Linus
