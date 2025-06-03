Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D305280CD3
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943322; cv=none; b=W84hycYxBLmk82oHi/zg/KXWYDWf4gskIAFYiJd2eHr3opprvZ+4F5hxskuIrFxs8AtN0RplaxDnGftCW5F8jKemsh+MhJgX3zXdAQCEIbPvJX2z6W+AV9xQ3yjZTlY/TjvPfQOkM//TdEq46/Csi1gc0LyNu+CfBcdi/Upabqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943322; c=relaxed/simple;
	bh=HiHVn8KM1a38CHqKEjF7hCVjdYq1SEXILXEyXKXUsj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlqWSfRu//0Pf6RiZQ7n7IwUoEIMO9k9BSqaJ+tcF6JTc3+cu8WtbRlL9tHicDyrLwH2K1rJ6vAGcXodEo5TrmmQch8LtWS0p9JR4b2SrR6zjg19jZ8ovcVcLtsYGVcpRLeT/RolrvD1uSSiA7oZlTTP9Va0EELLlRL01kqqKGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cnByDdwk; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cnByDdwk"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7cd0a7b672bso353586185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 02:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748943320; x=1749548120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiHVn8KM1a38CHqKEjF7hCVjdYq1SEXILXEyXKXUsj4=;
        b=cnByDdwk9To2/p7+kPjJgkc90E6mMN2UwnEOYpexz467ii5K/G/sHgmxWWdaHUm30c
         Xp126uJaLD2AgA5xhpPM9OYVbsu6LGj4n465IaYqMOz5na0QPfamNGDM5jF3wdZ19hnB
         4Eq0E0HaeftYmEYF8oiN02tUdK0vOYFEJraySvbrCh6tVbMVH3ew3r9jMWwuWIiJaB/O
         tYTKAunlYDOW+YXBXKaZaplUW9WIcNz8LAc5yyVxz533TIjanA/Qyt9/DGJq24t23j3x
         gr5Zig1swMS1bpG+CoydBwkml3ZsyIwvMNqdY0FDtuApw3GLorjJsfkvJdZVoIqjZIoT
         ieMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748943320; x=1749548120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiHVn8KM1a38CHqKEjF7hCVjdYq1SEXILXEyXKXUsj4=;
        b=sxxWGKxZUqk+fq3ecoj8/cHqF5r5ReuDgUL6qUdHcak17eoM8U7aZJr13LOa6/Ks37
         hLoshFUJAF3bc5CU1zOOjn2uufwXsv8IbGFsc+Co4M2sL/m2tJ6iFfVz1gmxrg2x9LoW
         zKYOCidpiotsRhSJb6RMzkdPP53mw7eKlJIy76M7wZ8GnI/5jTf72hyefwzH294Ke6bs
         1rjTLHCTSe8f4NN8/l2EAkEEJgZhXHBwrAGI2uREFhNDZ8zTPfmBAQj7bXWokjtE7Li7
         2xGQ8vL24gPgoGrN8ZWiLmJPko+lhE3H8ngfvYzg234PS1Ixerrd+WDUehZ53cq57KKU
         8ohQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2CxlfG9ubo9SJQu3/6MqWJKVKyPAec/thxZdZZOp8PzNUO19F6knLxseI0MPRPoKdeG2YtUI67cSjYqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz92MCWAT/CmMtgngZd/46q0/V3aEk+2K5+9QBBs0QPZJz1uLAI
	6uR3bXbD0kiXFbRs+nDKmeTu0pTUnWMrvCpeWDxWjtsl+F+lqZ3NZVzt7xtt30OeQDaiEvt4/UK
	4sCapF7UvuyFgG1Z+MWvAZgF41dnDRfSdLhDeQecr
X-Gm-Gg: ASbGncvFkeL2yQ4PFO/2FK4DbHIrJo+iNVXJpK+rvO6tjbfnc/wk64lcq59UPGZn34B
	dQQf7BCb9e15eyrAE+Jfl3KuKYEoCxCQ9027nL1P8y5sJlvlah6pi1P0TkAITDOFTzS5R2O3Pa/
	MTb37f5o//LiqYhhM+hRONPUPalkox9KqQRQ5bBChw0nyOPWhUyvKp5FhkzoeHbqO750dArNGK
X-Google-Smtp-Source: AGHT+IFyIlVH3O7FJHieoC1xBiNkebK+oueem9JJb54G8kM3WrbPUnrUzZgE8fTuQy0NUMXElznW/1f/MNG3vesxIME=
X-Received: by 2002:a05:620a:278c:b0:7d2:1504:f6cc with SMTP id
 af79cd13be357-7d21504f985mr138275685a.56.1748943320043; Tue, 03 Jun 2025
 02:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603075323.1839608-1-arnd@kernel.org>
In-Reply-To: <20250603075323.1839608-1-arnd@kernel.org>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 3 Jun 2025 11:34:43 +0200
X-Gm-Features: AX0GCFtk4x4wNn6b7UP0VNv0sOlQbYFq-yDz0olLoxl5nq3NojRVUcRiaes1dx8
Message-ID: <CAG_fn=U38uPLKbg6_VArW1k3DGm8VDehdY0fArsqJ75WNuku9Q@mail.gmail.com>
Subject: Re: [PATCH] kmsan: test: add module description
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Sabyrzhan Tasbolatov <snovitoll@gmail.com>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 9:54=E2=80=AFAM 'Arnd Bergmann' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Every module should have a description, and kbuild now warns for those
> that don't.

Thanks!
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kmsan/kmsan_test.o
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Alexander Potapenko <glider@google.com>
