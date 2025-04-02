Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992B035949
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614482; cv=none; b=qOE9SOJfFjA8SvE+kkibM4keV6BVbYI/mXxKQ27FjG9BoXIRXXcyEIf6YZh2K774MCUURMou3lIgY9tQjmZRJX2+G6D2cABmxeqdlc+mN0v+D/htmqaq7jUvutF9g9eP9mYb1o9FZx/E+ODNrfXEgEKLJujkUH8sv4P8ElJog6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614482; c=relaxed/simple;
	bh=k5xDm6mGlZ8vuRoeZQT0VetoI+YvlRo0/tJyonyRNUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfJ33yz/1ErPy4uFc0Ptc1ctVslYPNwbj2JgK3FUIVTighotFLEj/Szo8fxf/SyN0DVn6AHDX9IORkxCyMrA8BuZyrSx8+6ikNcogLFmSIkh9uRN8HmN/upbsczWUwC9taKd56rMF3fbUlO4vuqmQq0nzBQeoorTqWCTXa8hQC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JELKvDst; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JELKvDst"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so2428366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743614478; x=1744219278; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O+oYmiVP18Gxif9XyRPLTYtLtyscgQVNHwN3UpMY9Ws=;
        b=JELKvDstcQylsNvewhdZ8fOZxfmNtZQdkxu8LOBhkxgoy9Em6Igp71x7zRe1AkVzLe
         v+SAeP5/YKjvDYl6g84nl4rCUVr4kU3+++Yf6Ko7qdHCaB9HUe5pdr1SIx6ptseZzwhr
         t0ktWA2xiemw9/6JZVAz+A3ZHgtCQjq0rKSCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614478; x=1744219278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+oYmiVP18Gxif9XyRPLTYtLtyscgQVNHwN3UpMY9Ws=;
        b=miNIHsni+uk510UnGSQoTwu4ibRW5P+OzyxVwc4yCIMd6rKffd11fmJG68dnZ2lljW
         oX+pcGFgr65zDCO4ssqZC9Se5YmIqXhn54vIjKQvEqIL9gCfNr3GhjTB5LzLPLtNK/V0
         +erRG71QBsCMfkbznTsBmpPiDGt2zMfnV4vSNVVAmHE6OcQqnERIobDo6haxnuf9NdMd
         lv9cN55Ux59U5MUKyO4M0wOX87uPxWfp3ENx/kfUPrl/B5BL1+qtPJeHuqXyk7l0m6Bs
         ZPOOCXpO6AW4TE0UldLLhSTudZ/YQe5IalvrzO/Cdysy6E8n02LCbX4bgX3Z19WANBUu
         dGlQ==
X-Gm-Message-State: AOJu0YwMtbKGbkmCYtJueS977exit75QRyp12rlEnCTzeAzzI4C0RENv
	NqapGrl1IhsT8FcQwuMcleW8cWWTnr8KuqLGGMtVi0ZPyPdS4HctTQYKf8GWfDVV1jFZgO+0/eZ
	2slo=
X-Gm-Gg: ASbGncs+pha0J4SLK1KKHk2GfKtyVIEl5ZusRCZ4gMK9blE2IvvH19MzbhULwec0C5q
	K9CO6DIys0/WnEsOyEdqOhETmnJkpmBsObvspRktD+qn03aZIu+eAW9WnyAt6b+O9vkYnZ5wqlp
	oTatbi3KYJsCNCocthooo1KSj0wisFuOUgSqdaXNSkGkzt4WdMETV90zpNuzvrrub2lUP5wTRz0
	QQSDBEkp79nKl/TjqxsztXMi9wtZZdzjRb3HWfQpdxBXTP1ScH4+zRrUh7hRHz5C581GwUZlpdM
	V3id72dz4L693xyLxBt+zCXXYA006jVh7dotZWcXLQxzlM2F8BmML7hlZ8FgMhX/tNNCdQRsp20
	KEv7zXPJ5fUEzXsWs87A=
X-Google-Smtp-Source: AGHT+IEYsrfsVAgNQvE01Hbxat7G0tFOlhpSn30qNvJwKmRMQXrg/hZazxlZ2ZRFtYyozBfWcar36g==
X-Received: by 2002:a17:907:9693:b0:abf:6aa4:924c with SMTP id a640c23a62f3a-ac7389b834fmr1690568066b.17.1743614478457;
        Wed, 02 Apr 2025 10:21:18 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967fc94sm942593366b.139.2025.04.02.10.21.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 10:21:17 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so2422266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:21:16 -0700 (PDT)
X-Received: by 2002:a17:907:60d0:b0:ac2:88d5:770b with SMTP id
 a640c23a62f3a-ac738a15161mr1476492366b.25.1743614476524; Wed, 02 Apr 2025
 10:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401225811.008143218@goodmis.org> <20250401225842.597899085@goodmis.org>
 <CAHk-=wifCDa6FfRKzeioYuEqJFTeXnYQ1DpeuYsmmn59NWuakQ@mail.gmail.com>
 <20250402125548.02cc57d0@gandalf.local.home> <20250402130337.5de5a8cf@gandalf.local.home>
 <20250402131431.218d3458@gandalf.local.home>
In-Reply-To: <20250402131431.218d3458@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 10:20:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh8=QAC0jjcjDRnmsmd2xDf97j8h25=aSFGeh9x+1X8UA@mail.gmail.com>
X-Gm-Features: AQ5f1Jrj_v-ToJ_59gXDObEDMdyMiGgQHzUwM5XVrTzGa6wjo_Apt9gesD2z3sg
Message-ID: <CAHk-=wh8=QAC0jjcjDRnmsmd2xDf97j8h25=aSFGeh9x+1X8UA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] tracing: Use vmap_page_range() to map memmap ring buffer
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 10:13, Steven Rostedt <rostedt@goodmis.org> wrote:
>
>         /* If the buffer is not part of the normal memory, do not allow mapping */
>         if (!virt_addr_valid(cpu_buffer->reader_page->page))
>                 return -ENODEV;

Honestly, virt_addr_valid() is pretty much random.

It's not really a valid function outside of random debugging code. It
has no real semantics. The comment saying that it validates some kind
of 'virt_to_page()' thing is pure garbage.

> As the buffer can come from anywhere, but we only allow a memory mapping to
> user space if the buffer is from the normal memory allocator.

You should damn well keep track of where the memory comes from.

You can't just say "I'll take random shit, and then I'll ask the VM what it is".

Stop it.

If the address came from something you consider trustworthy, then just
trust it. If some admin person gave you garbage, it's better to just
get a random oops than to have random bogus code.

                 Linus
