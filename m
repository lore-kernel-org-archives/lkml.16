Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F08524EAAA
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743030620; cv=none; b=e4UvCmQDOu76rVf9p3INPNl8emXYIBH5H1dl/AFmKIks59sAQrvaHhv/UYZJivAAP+iPEhM9HTIFBibe5E9WrG7a9dOye4qTUldmFoU7m8I86Uqm3fTMAQgE9WAArBaXUeIZKvQJ66YviMtZ/1tQiydRjjkmU5c5I8DVE+qIK5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743030620; c=relaxed/simple;
	bh=wc3YVGgFFPukQsTfiZoZotgv1qZ6Vpg2i6m4XEs2Ox0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RuybuzMJDN2IjRUjc15ZF+eG1U/6VLMCL+nlwbPGYEQ565avJEMugRVdWwOSW7IIjVALM4/pnaHiRQ2wFxrVYH02Q+GO+EeyqVwvD0mI+GgWkTxhbR9pVOoBAzgcdNwwyIvbEmoH90KhftLaZVi2KgyiELi/ErnDDOfsqIoKP5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HzrXwAEA; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HzrXwAEA"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e50bae0f5bso4313a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 16:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743030616; x=1743635416; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wc3YVGgFFPukQsTfiZoZotgv1qZ6Vpg2i6m4XEs2Ox0=;
        b=HzrXwAEAd8qIa3565GAgICokY3cP83CrowpXWpznKOGKgB0Xb1SbBaptqv6HwODUSX
         9L+gTr9lIenTqpm07FYsOjlaF+7jNxUXGvNkNCnG1v3Bqlaq0OA0xFWk4VMO+QXhc/kf
         IzZGZVUm0RDW2ugslZ0/vewyqxV35STNqePh5xrwp0zZBiX5x40XYk/X7oqwAhE17JY9
         EakLZ2aAwAyn5IaYcuhbCet0h2NJUu8IS+JirbhNG/HfAWE8oNej26/aKyWP48AL0LiO
         yQbEsE79my1WnOi7iXbTYcK4yOv1ZeSk6NIFAIK/nqsr9JxJ705TE7RNJ/8v65jk0V7n
         5qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743030616; x=1743635416;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wc3YVGgFFPukQsTfiZoZotgv1qZ6Vpg2i6m4XEs2Ox0=;
        b=bCp9ylSfUKeOSr3WSKYRe16w4Uq2JfXZnmgu/5xT7jX/qHbSAnrE8ih87LkaJPryNr
         T3CzUa01xJ2CLnax2dUflToZdKJsXsgPSZDl38LfdL3ZWnZd0cLmNPijhwlLmgBW6a6L
         cvI9zwBzri+YX5JoHR/E2MnZoiv3pNmAe3Ux6rZYqXuPbRko6gjcutTEnNmuclFwKXYP
         Z8tuWZJPXNpiXK3LU2z+/EDMhpQTgUtmVu2Rcj6hEymXwst6FyiSLcBgvJD7PTgQ/3h5
         ikRVSyLYMB7y2bGSCb2swOyWUpQhav9BRJOcCFojhGHODEmD5r+BMHNS1l/uLDDO4wGT
         4yHg==
X-Gm-Message-State: AOJu0YxBdrsQSjOAPw2Rr9Zt5R1Fb/I/1ejtUFM38lPSYPC+yZmMVaE5
	yL9eghf6T0nCUHf15hLao/6eaCPf6KIevyQTmuJs9h6B8Cy6QfbJo4zcuahI+RdAfA7HOhZorJj
	vA3ZRIBvMPbwgD2itC9FxjC8j3ltLdvyh+wjq
X-Gm-Gg: ASbGncvLBjAa2X2KuKrT5SYemL0Zq5fuNN0J97snewV/YCNdNLceYMUwE6aro/x0FW3
	Bl92Ck+ErsVuwUqdC/VpvI5d2il+VS6BuYl41JTS4rA+Mwald6hufOcdxee01jrr5o4VfVqyRRs
	4KsXgbL1V4gwypEdg00OfJJkvG/X9BW/EI80hGU6akVO77ABFAllIxMaw/5kwEXx8GQg==
X-Google-Smtp-Source: AGHT+IFXisS9wWdRUt0uNNuJQt+0RNkIIqbbbT66/cypXTYdXu3uR8mrjkMlVz/TrIZZwushzUnqd5yPMxkuIjOcxew=
X-Received: by 2002:aa7:c954:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5edaae205aamr22369a12.4.1743030616016; Wed, 26 Mar 2025
 16:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
Date: Thu, 27 Mar 2025 00:09:40 +0100
X-Gm-Features: AQ5f1JqVjr6tTcBF7w0LwsC86zQrBaocMPZS2--LfQfER88FYjnvupdq9_ZCZqQ
Message-ID: <CAG48ez2jj8KxxYG8-chkkzxiw-CLLK6MoSR6ajfCE6PyYyEZ=A@mail.gmail.com>
Subject: does software KASAN not instrument READ_ONCE() on arm64 with LTO?
To: Will Deacon <will@kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: kernel list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi!

I just realized - arm64 redefines __READ_ONCE() to use inline assembly
instead of a volatile load, and ASAN is designed to not instrument asm
statement operands (not even memory operands).
(I think I may have a years-old LLVM patch somewhere that changes
that, but I vaguely recall being told once that that's an intentional
design decision. I might be misremembering that though...)

So because __READ_ONCE() does not call anything like
instrument_read(), I think instrumentation-based KASAN in LTO arm64
builds probably doesn't cover READ_ONCE() accesses?

A quick test seems to confirm this: https://godbolt.org/z/8oYfaExYf
