Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710964A00
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 00:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751533; cv=none; b=ngwZRDJtoXqeDNZk+6hgzjC2MoEL2I0JoYmZXwysX1vzK7LLofwgxz393ei1GPyUUBZC6uwT2OFv+Tzr+2dzPp35RiglydvOddPjfOo253Q1ot75hGRR5RUbpE4c8bxX3VPtO+JPzV7EDVK++Y+ZvrEKv2KCiX41ZFxrjcu6+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751533; c=relaxed/simple;
	bh=F3SweCz7MNyTIf7Sl/mcYdgcU7AYtp1zXA98lgPwocg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jg3557KD/VhVddFltqsOPK9719CdXcWbbVoW1+vnwtnd+f2gKL7XGuJCrUoSna98GccZiBIumDiyNJI4kERrYF7QYw5OSURi2rvgmEL6rNxxvnPUhM7dZBVK4YLTlkRgH83NNnsLcUvqD7ZjRkfxWjyDSalqeORS1O+ji6RsbjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mcL8jVIt; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mcL8jVIt"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso4386a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 17:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746751530; x=1747356330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjvcmTMj9iu4CCyYeVFkuY5AWCE78eTuqkHvMFVALIQ=;
        b=mcL8jVItCNaFX8//1hen7k/z2gbaNcuLxn1QA6h0kahFdpLWC0o6EhE9hXyYrkLBIF
         y1RuR7e8x/m+k5YFvjOVFPTSmI6EIJPIJ/ZjWsF7JXBCQzAZBbBNFtIzIxp/6z3RIOVr
         TSWuQxUUEtGDlqltkdHLPDkzXZ4h7o9d227BhqyEry/7rNBxiT/MjHvUuDI9BOT/k1Vh
         /NoKqfSjDfKvkp0S/53Ky9KEja3fPCHI2ckdgSZhJtYYjlAPCt3F02ii2LOJZYKRPuCR
         DI0NpILaJSHNdOO/jIxJ1ZVTySP2YwSHIEys74XuJcaqkQ3PIF7QBDCZ+dvB3P5qaPd1
         gPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746751530; x=1747356330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjvcmTMj9iu4CCyYeVFkuY5AWCE78eTuqkHvMFVALIQ=;
        b=I8n2zG0xKZ17kXTNQZs5RQCRTZMTw+PDhIUIbAZvXie4UhNJ8VZk/IopMWMvhdY4xP
         08PfO1oYhwbn7yHdpL2yi9CxTPruHntapIh/5lq8L83kocdfpcZJ+RUIaYgkWptGpxJq
         JytGskP9E0/cia5/zza4ul76EGhR6E9G65IYya6Zr+jCvEH8aSco/FFPQO0cNuoc4kni
         SIrYhNPtQjf2aAxxHIFlhJG20AhaiJxcqbzImGY8mK2w7O88tkklwEvL2b9lru6zrzhJ
         pqXXF43Erw6Dtsi/FcWwnJFtpaatiKyKIAHgoIHolrmodeBZ7WHB6AwPBVv9jwJON9V/
         BjgA==
X-Forwarded-Encrypted: i=1; AJvYcCUveF99u6L+EG5t7xlTMqS6qfSagOc5cbX1EnNQFTRT0/tH47Yoen5Z0Nip1O/xAvt+eges0y0pUFqs3XI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN9T8M1BP9WQY5bukhO4u4ffYDBj3tbEW3b8Y6Ua7PsA4HtKWn
	TKA4Lj80i0twixkwwzY2sis3+azz9QWlx0jaBOZEb9vye91k2YL2rGAwvyBG5wp77DOR8ChNEBj
	KHspO8Uh7kqfWDjcbrLUCVd9LzBQzQ5XHJT0I
X-Gm-Gg: ASbGnctJpR3HvyvvHcSmp4GOTRNysZibly9xDzBnU9nGXulchXHRALyS5DSSLJl0tqp
	rVboyXuvMkJl07N4RWLS0vO/RAZBRSGyDvjJI1MR9+yyYcgclE6+F5pVee1ajml9XWiyugDCpU3
	uC/gFn49O9JYfAGB+Bw/hT
X-Google-Smtp-Source: AGHT+IEaOWqb9f2E4Q1/ZcgfLQB0/8/FfCO65qxRTtRUPAIu0zbMTqE+wq4Xy+JenLhKPcxcvnZ1ZdSTxsN7UWTTJ8g=
X-Received: by 2002:a05:6402:128a:b0:5fb:89b1:717f with SMTP id
 4fb4d7f45d1cf-5fca18fcc39mr45282a12.0.1746751529581; Thu, 08 May 2025
 17:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425200541.113015-1-xur@google.com> <174601619410.22196.10353886760773998736.tip-bot2@tip-bot2>
 <jj4fu243l7ap4bza5imrgjk5f5dhsoloxezgphdjwo7sb5iqsq@wkt46abbt45r>
In-Reply-To: <jj4fu243l7ap4bza5imrgjk5f5dhsoloxezgphdjwo7sb5iqsq@wkt46abbt45r>
From: Rong Xu <xur@google.com>
Date: Thu, 8 May 2025 17:45:18 -0700
X-Gm-Features: AX0GCFusp0ihkGqmvl5QTilS2LUpRE6AKPN19BfCLSreyPjsYKxu8ro4ZEyIggM
Message-ID: <CAF1bQ=SBgs6RiOEXakcZ=TaYjwXngMKNrp8gHL9FhfjOodOxiA@mail.gmail.com>
Subject: Re: [tip: objtool/core] objtool: Fix up st_info in COMDAT group section
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: tip-bot2 for Rong Xu <tip-bot2@linutronix.de>, linux-tip-commits@vger.kernel.org, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 4:22=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> On Wed, Apr 30, 2025 at 12:29:54PM +0000, tip-bot2 for Rong Xu wrote:
> > The following commit has been merged into the objtool/core branch of ti=
p:
> >
> > Commit-ID:     2cb291596e2c1837238bc322ae3545dacb99d584
> > Gitweb:        https://git.kernel.org/tip/2cb291596e2c1837238bc322ae354=
5dacb99d584
> > Author:        Rong Xu <xur@google.com>
> > AuthorDate:    Fri, 25 Apr 2025 13:05:41 -07:00
> > Committer:     Peter Zijlstra <peterz@infradead.org>
> > CommitterDate: Wed, 30 Apr 2025 13:58:34 +02:00
> >
> > objtool: Fix up st_info in COMDAT group section
> >
> > When __elf_create_symbol creates a local symbol, it relocates the first
> > global symbol upwards to make space. Subsequently, elf_update_symbol()
> > is called to refresh the symbol table section. However, this isn't
> > sufficient, as other sections might have the reference to the old
> > symbol index, for instance, the sh_info field of an SHT_GROUP section.
> >
> > This patch updates the `sh_info` field when necessary. This field
> > serves as the key for the COMDAT group. An incorrect key would prevent
> > the linker's from deduplicating COMDAT symbols, leading to duplicate
> > definitions in the final link.
> >
> > Signed-off-by: Rong Xu <xur@google.com>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Link: https://lkml.kernel.org/r/20250425200541.113015-1-xur@google.com
>
> Unfortunately this patch completely destroys performance when adding a
> bunch of symbols.  Which I'm doing in v2 of my klp-build patch set.
The patch won't add symbols. Do you mean the updates take too much time
when adding symbols? It's probably true as we lookup the sections for every
added symbols. I did not notice the compile time issues in my builds.
If this is a problem, it needs to be fixed.
Thanks for working with v2!
>
> What was the use case for this?  I don't remember seeing any COMDAT
> groups in the kernel.

In the PGO or AutoFDO builds, we used many COMDAT variables for counters
and control variables. I think the compiler also puts the functions
defined in header
as COMDAT.
The issue I encountered was objtool moved the variables for
profile_filename and
profile_version, but the comdat keys were not updated.

-Rong

> --
> Josh
