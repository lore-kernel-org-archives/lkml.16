Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B633085CC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269164; cv=none; b=lA//ZfM0tnwRcWXKDcSabO7Uf4lun6oLbT3lqw+qybxrRA60BkRIwqgQ/ZKo3ykDSvY5wbpVtV1sfl/gYIbxZBnH8warppUJPKm2kj86FfdSW56nxjKUUnjETh+dO/cFC4XkQVhRKzCBJkw49m8oaR3CCMee+pXOJOpwm6MetTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269164; c=relaxed/simple;
	bh=y9H/LE+xIpHZ/6sGJEJkqEbtfi7uc50nx0i7lJUVD8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opZQh8JlSqalmwx0tDcqwhBq85LkHOpv+0yF3g8AtQSYT3qO2wreiiE1OBn5ZFKEHLAqDMAamrBsuUayvYJxW4EIk9QSor1cMhCJxZVk1kzITV0a/RfkUMVEjIsnX/lmLaDeMhtQl29Q0rnWM2FHdlFVYliKk9+pVby4nT98Cjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YBYXIm9s; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YBYXIm9s"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad89ee255easo1315218966b.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750269161; x=1750873961; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kygiEEUFulB3nwwpk+ux/04z1+ZqdUaQ3pGhL4WTR/Y=;
        b=YBYXIm9sqa1E3lWzS0loCYcKuSyWGDPHT5+G2o8jiuvbEKLLAPwvUEF1Vat23QQCmK
         78QHxIH0BZE36sEH0cQwXiRQII82pCEQntlglYmnk4F6B8eyI/eY9O6SgZ3sPJyEDIwo
         3jvJSvP7mRxCg09AOs3/gCYP+s0DMoXOhNss8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750269161; x=1750873961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kygiEEUFulB3nwwpk+ux/04z1+ZqdUaQ3pGhL4WTR/Y=;
        b=M4rkarGfprCLBkXR1rP+ckfTw6XWOxtBoOx0p6tNxRqre8Td4j7hxCn4/XjuZVEt2n
         UpvstfGPzbrbyJEDB9FkJEW+GJlLDwvUYZUjca7/qO4IcGV64ZfAr0DhOWRvpYUgRG9i
         +vrsxwqEtKg1vDzsnlZRixX3WeHqBnacjZwDcfGeFXren5depAfdQrflhVG6nsAPlJQQ
         VkWzBT+6q0wQD5drA4nQ62HZiZaubSg+ToM6LcXBzUB5rSA98PVZe2qDwSIu17VOy/os
         3xdVRpV3/imnzEeU/bVQfc1KiUnqa9z+wwq5WD/GSHKBUP2X9rMJO22fBO8D9bgmI8SG
         3OWA==
X-Forwarded-Encrypted: i=1; AJvYcCWWEUkmuvYnXqUGn7DCAktX3Dnro+eQTKDI2nrvgDVNyoM/VTChB8OemZK0k5OtmKCw89qUd7L/AEVlaGw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/3Fiw/9Hi3TNeHrpNuUowv9g6tfiSjSgEk9Ss/xmtna4iUKtg
	PEW1igoHa5KH6FWgT6ye+XjDA/cDS71g+jpKkg34/2PzCoHbpY2M+bxJqfCYQ6BPHATcjJkUaTk
	PlcwQAkY=
X-Gm-Gg: ASbGncvARMOjxCoJ8x6nQE1JrWcQKY0GAHH7auXZ6k5cmFjnvY43sK82TlzRN1eaLLm
	GUPzH4swqlRIC2bzKIx2qYL6891yjEm0WcLsVia7xsvDIESA1l2ypWaBtL3l4mAg8uOx5iYZ5Yl
	ZnZl2TAVVK+sXPU1+XHqxCsx0JRQ1dnMKErkCGbnEtR3tTW1nWquUyyegVJg19fg1IGylpN8L8s
	z7S3KLI+2hIJxPcZne4lblrTm5qrIBtUX2Oiz91sLKpQkh5oKShJCKTUQODvFTfJupgX1F20tHF
	OrGLXD3twYvOHiORgz47JvUA05QrJVkd/AfuqDjzQlV+2DsW4PDOP4gsnarqhJgmHhViNvRoHRv
	GcCSIY/Wv34FNQ5zXC6VIoCA991ZjL+fGaohG
X-Google-Smtp-Source: AGHT+IF/7F9MVBEsSIm69uDCqjH5VV10EixvWcU6wfQhgLTMjxZ5OX8KXs578VkZIsHK/59RE1mUoQ==
X-Received: by 2002:a17:907:6e9f:b0:ade:35fc:1a73 with SMTP id a640c23a62f3a-adfad686483mr1818118366b.55.1750269160623;
        Wed, 18 Jun 2025 10:52:40 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfaf697964sm924653966b.18.2025.06.18.10.52.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:52:39 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so1425425966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:52:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHTpWfGpLkuKFnNzV/W/dKJVruBOGQz2DbQxYsWIDHFkHC22E3dsRnGEBzkOkltbKEwkKfVqxPnxRztMc=@vger.kernel.org
X-Received: by 2002:a17:906:9fcb:b0:ad8:9e5b:9217 with SMTP id
 a640c23a62f3a-adfad60cb3bmr1891902866b.45.1750269159066; Wed, 18 Jun 2025
 10:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611005421.144238328@goodmis.org> <20250611010428.261095906@goodmis.org>
 <20250618134641.GJ1613376@noisy.programming.kicks-ass.net> <20250618111046.793870b8@gandalf.local.home>
In-Reply-To: <20250618111046.793870b8@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Jun 2025 10:52:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=whGWM50Qq3Dgha8ByU7t_dqvrCk3JFBSw2+X0KUAWuT1g@mail.gmail.com>
X-Gm-Features: AX0GCFtVJDBhnv7J2rLeWOvRjD7ENnpnCnae_NwDFoiDlVyU_VzUYIzxqy3Sfo8
Message-ID: <CAHk-=whGWM50Qq3Dgha8ByU7t_dqvrCk3JFBSw2+X0KUAWuT1g@mail.gmail.com>
Subject: Re: [PATCH v10 03/14] unwind_user: Add compat mode frame pointer support
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, x86@kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrii Nakryiko <andrii@kernel.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Beau Belgrave <beaub@linux.microsoft.com>, 
	Jens Remus <jremus@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Jun 2025 at 08:10, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Don't we usually shout macros?

Not really. It's more about "we shout about macros when they _behave_
like macros".

So typically we do all upper-case for things that are constants
(whether enums or macros, actually) or when they don't act like normal
functions.

But when it's not particularly important that it's a macro, and it
could have been a function (but maybe it was just simpler to use a
macro for whatever reason), we typically don't use all upper-case.

In this case, I have to agree with PeterZ that this just looks odd:

-       if (get_user(ra, (unsigned long *)(cfa + frame->ra_off)))
+       if (UNWIND_GET_USER_LONG(ra, cfa + frame->ra_off, state))

why is UNWIND_GET_USER_LONG() so loud when it just replaces "get_user()"?

Note that "get_user()" itself is a macro, and is lower-case, even
though you couldn't actually do it as a function (because it changes
its first argument in place).

             Linus
