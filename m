Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD35231834
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748616100; cv=none; b=WGedZSwInnOmhtjv/AYsr3UwrHAJi3w83EbmxWL1O4FXHdqh6YqkXsVcV1nHjVOIKKy1ihzkOVsUnXSqcHotj6OInLk3mj57DujaKBPq//yLitlUtbuMdCQl6AIzsaPSYyCCWsNcwMNin0Q7WWB352xyp5Z0J1KwuLtD0irY0p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748616100; c=relaxed/simple;
	bh=FKW1st2NJc9lopvX5QiY1Tuw4jpZJpc7kvb4kkmbBZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOk6jvepS4Y1GhdTdcH4p3/u9aeiXuoo+/QPHUOCLn5+OW2+K86ky1Gj2qDNCRqMz+mthTuFa+ro3HXEqE4Lj5L2cjFfG7oJ5mcOMY0+RT/4F2XrQ5NEDP39LFvQawGkPmAQtwS94RUVBh7gt5nPM3obSzHNZYTVeCi5MOvPUY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VrC+rp7y; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VrC+rp7y"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so10965a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748616097; x=1749220897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKW1st2NJc9lopvX5QiY1Tuw4jpZJpc7kvb4kkmbBZ4=;
        b=VrC+rp7ysJfstXBBAQMCQuVoY7eSFZRNo2ULwB/+E424PsIzMiq4gG+RXkVeAZs5l0
         LV3tIPiHKpXcEgyYO2gNjuwSkw0DiCOfCrOjcSC7eYSoLa0IWUUgYRBlTGUAOURCldW1
         ecyoEv6pNGRNOvRUkqXD2ay7kQTzqgtLSppVUBtyGFll7fUh4iS40PQfs6qsoBiTeY2B
         YHH+/ZHkYLAC8RBYGGjzxo2C35M+jZzJ0BpOu4S2JepjXRrlP6/RHdWLRawbCAhqq4IU
         QO8LOE2H20YWCBKFs9nbuB/TscqZenJSl43uRatBFAQq2ZRCK9EVVjCk26mUMw5sqQZ8
         Px0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748616097; x=1749220897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKW1st2NJc9lopvX5QiY1Tuw4jpZJpc7kvb4kkmbBZ4=;
        b=ZMQPUHWTm5wJUmAOb00UdvycettymSAUTJe4JJwPn5nWlogRVU3jiDI2Qb2wQxQPpP
         uyquRpWgx1BVvJ5zweP4YICLLJLGaGT5NNzUMUONcszJ5siiAGihqKGVukQNQNIMG4hI
         8Yu48RBdBSEnbQw1XHPSSkqm+08aNYYB+Yl/oxKXTPcAfMoxnTDXwbVPf7k4SsQIR21F
         4FS/Ra1MhdNgWZD9/3Z82vUpmQF3S0l+Wm6jZNmHgT5TrCcXO95wIcGfXOtYU7aMMpDT
         WgU+KRv9wJvAh5d5/cBlwO3fmUkHhhX2hbqgRlySNL7j5tGlnWD0io1xWlkRmvtfwAkp
         NqQA==
X-Forwarded-Encrypted: i=1; AJvYcCXE4uID5HmR2IpYQVok8ftRdSHsXcsK4ezB8aRGUUwLwpAyoFuVAdTcY1iJkzqZQmJZWTN1SmkSyAMfbRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBhG2dAp7eBBkTz/CanP5ukyM6cQCr2WUMu9kfgGuwJj8OQJ1o
	rFODU/7rgTI0E9r1wGqMdBYbEFajslf8Xhxjd6OyatFOarl02EPh7fYsuhSqBL2xGPjNbuU9XSL
	/6ABN/n7R4yuMI4o24m9dYWdoOaN87UATgYn8ZLC+
X-Gm-Gg: ASbGncsKQpmdYe8C+52GpOg4eLRlIPQtTjRz9xRh9ccSt2YQcRirbgILKkRAIJM8Bum
	zKdp/xo3wDcuA+p+d9H18QTZLc63SAXUhoau80G5S6dmQcCZULFz+56DqhHec+VvRkUhh0kg/xs
	ZYWjPHhazWu4Q+2zkpdvfmiQPXRnP2faPRIAbpXp73uFHt90ykOTzV5ae8b/UQR+CWbr649XQ=
X-Google-Smtp-Source: AGHT+IHfSAH1Rt5ln6NCIiDOW0+Td25WW+i2unl+C03KBiv5EQFnOViGfDfDNBXh722+FKNL1nhlyFP/h67WwEKTknc=
X-Received: by 2002:a50:9993:0:b0:605:6567:818 with SMTP id
 4fb4d7f45d1cf-60577a56d86mr80548a12.5.1748616096994; Fri, 30 May 2025
 07:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404021902.48863-1-anthony.yznaga@oracle.com> <20250404021902.48863-9-anthony.yznaga@oracle.com>
In-Reply-To: <20250404021902.48863-9-anthony.yznaga@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 30 May 2025 16:41:00 +0200
X-Gm-Features: AX0GCFvUNLf3RD2IVMPPhCiy_e0p5MPXFHQagt1uA4fg4sf6dY9DDshf7MBKECg
Message-ID: <CAG48ez3cUZf+xOtP6UkkS2-CmOeo+3K5pvny0AFL_XBkHh5q_g@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] mm/mshare: flush all TLBs when updating PTEs in
 an mshare range
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, markhemm@googlemail.com, 
	viro@zeniv.linux.org.uk, david@redhat.com, khalid@kernel.org, 
	andreyknvl@gmail.com, dave.hansen@intel.com, luto@kernel.org, 
	brauner@kernel.org, arnd@arndb.de, ebiederm@xmission.com, 
	catalin.marinas@arm.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhiramat@kernel.org, 
	rostedt@goodmis.org, vasily.averin@linux.dev, xhao@linux.alibaba.com, 
	pcc@google.com, neilb@suse.de, maz@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 4:18=E2=80=AFAM Anthony Yznaga <anthony.yznaga@oracl=
e.com> wrote:
> Unlike the mm of a task, an mshare host mm is not updated on context
> switch. In particular this means that mm_cpumask is never updated
> which results in TLB flushes for updates to mshare PTEs only being
> done on the local CPU. To ensure entries are flushed for non-local
> TLBs, set up an mmu notifier on the mshare mm and use the
> .arch_invalidate_secondary_tlbs callback to flush all TLBs.
> arch_invalidate_secondary_tlbs guarantees that TLB entries will be
> flushed before pages are freed when unmapping pages in an mshare region.

Thanks for working on this, I think this is a really nice feature.

An issue that I think this series doesn't address is:
There could be mmu_notifiers (for things like KVM or SVA IOMMU) that
want to be notified on changes to an mshare VMA; if those are not
invoked, we could get UAF of page contents. So either we propagate MMU
notifier invocations in the host mm into the mshare regions that use
it, or we'd have to somehow prevent a process from using MMU notifiers
and mshare at the same time.
