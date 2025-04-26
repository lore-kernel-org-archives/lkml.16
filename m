Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0531C2046B1
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745680676; cv=none; b=mN9ez0hVATW/7P4FpMCdYb+JrcyA2TtvXvbdydqZ40hby/OGQXBNWYz20ZhFJmwwGUR6MXvsNKQdVWyjhuXzg4tDdrHMfwnusg8pcTTr6Z0J1DKcF3STHctY+5Z1kIxyRIgIVV7hYaY0aChE6VmUnz9KFeEgMBy2oCfl4wvxu40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745680676; c=relaxed/simple;
	bh=lwUT3Iv8t9p6mwjxLMSSqUxpKJyupbTKnPyyqPO3ZNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca0fXqlqU05m/R15N613opIBTHG7YhgIqkZVT1Oz7Gq/ovByhvbLdDEgwVrbw+k9cSyYx+KDBMT07n037CSRRV4TZQ3LCluy7zL4M4ptING6EMIHih/tUkpTHiwMPj4iAaAK0ZfrECPEReHFKHEriG15yKtDobxc63Gsf9dwMws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GFfa5EIf; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GFfa5EIf"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so4310918a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745680672; x=1746285472; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=;
        b=GFfa5EIf2St03hFCcTCErav4/8fHMSzg55cjpzu3/ZspmEy+9eVcq35NWPidR5F+Nr
         VIsnUMp+Y4v1efVipXvyOyex6WrKfCgyN2QI9OpQegIjcVDtkfpi6M3ssHBKhYJNRMfi
         SRZVMg7aXPANkyWImpE8OzEUYf64QvhEbdsIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745680672; x=1746285472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=;
        b=kg0k5ugJbSR9B2zdQUGPO8vA3ixJOgI1mbynJ+4/t9t6Fpi2NmdsbFHHR/v+5EI1nJ
         a4/idxSDG4d8IZvPlUog8zCmhnx2WRBswrKzV4rS6cKQaGkJpjp78Y4IGYQUdx7uS4vZ
         +lo5+GkK30Dzg5DZ550p8PXDF1Xt8YuMT9tuMjHdQ2rstQ/9w/5vmlFO35gt8jWliDRb
         3i1kzEaL9jWdF74iXwNE8k9iH4616/vDp3aUiHYGAS9d6fsUSPLrihd6Z+0S2e29lWSI
         /XSJNxtqvevyWeS+q3huDU9CBJP9QDfiHWb3HGM25TmOSxMxmvvxeEDJbgR6u7g0UcoY
         h63A==
X-Forwarded-Encrypted: i=1; AJvYcCU/Wd+EDxP8aJkTIuheRRhSX6rdsBHSQbNVKrA+OFv0teYGvYijCdhcnrxo0k/z1XQz4cR+GzW75nLfEAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YywHC68vSKLqrDwGvhEcKGcwQ359bVUpHw8N7ItCqeLxrWnmYRc
	x46xwqt4vChMtCHat6LOp2CXCoNgobOQBIBYFTnkkscHAEofTdFr547cLmhPn9GZmXgL+Sdjp1b
	UXPM=
X-Gm-Gg: ASbGncuBKBj0WxuBSuZTyQhSODOovnciSkNanMj3oL+PhQteSv6MnVfj2ODwpp4tdgB
	tOPDyRagGtSJI8bt/amfjpoPMH9A7an30IZd3IAHeuNivWSuv4uEpO60OYiVWTxJKcK1ZIti5iL
	hqtGHvdjzg/JFNXCY6NFrp1hEMZILi3z8L+Yn5H7AEX7CTKIDle9Q3AjVAm2Ye2KdosHzCXTtWL
	su2+NPWjEGzwP6nfRvOTKBCOdOYZyuqlfpBcc5LUmIdAKQ2EXGezD+AcirS1RMfWfaJD7SEcSd6
	OLhyeHY9cZQOmVGOwk4014YkaqcLzUDxR5lPefPeuxfta1uqA0qNzl2VQz0G+RF8ckBenBIIwXZ
	0siyzwzL46cwI63c=
X-Google-Smtp-Source: AGHT+IFENmSr/Ly7EBWT/vW8p7MUvFjgvT+OJfumw947k7vj2A5d8Af+b1xXwk9ObN+iZgKjfd0sTA==
X-Received: by 2002:a50:c908:0:b0:5ed:4181:b03e with SMTP id 4fb4d7f45d1cf-5f7395f1b80mr1997407a12.14.1745680672184;
        Sat, 26 Apr 2025 08:17:52 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f70354654bsm2768725a12.60.2025.04.26.08.17.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 08:17:51 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso4555728a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:17:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrTjfZELnNYhmT+WyAbcDpZMnwlF6aG78ekJinPG3L9+Ex/c3ZnretZS/QjeDqyyGcxQx0tedKMFi/i/8=@vger.kernel.org
X-Received: by 2002:a17:907:7e95:b0:ac3:8895:2776 with SMTP id
 a640c23a62f3a-ace848c0439mr259814066b.5.1745680670908; Sat, 26 Apr 2025
 08:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426065041.1551914-1-ebiggers@kernel.org>
In-Reply-To: <20250426065041.1551914-1-ebiggers@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 08:17:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_ArMFL9E9SehR2Z3pfV5QPut0XwbJs9mYWkRvcZcSRw@mail.gmail.com>
X-Gm-Features: ATxdqUFbLPq86s-2TFMi3kWckNkp7TWtoBPlYGSlRtiuXxSXCOJQKui7bzYM-j0
Message-ID: <CAHk-=wg_ArMFL9E9SehR2Z3pfV5QPut0XwbJs9mYWkRvcZcSRw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Architecture-optimized SHA-256 library API
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 23:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Following the example of several other algorithms (e.g. CRC32, ChaCha,
> Poly1305, BLAKE2s), this series refactors the kernel's existing
> architecture-optimized SHA-256 code to be available via the library API,
> instead of just via the crypto_shash API as it was before.  It also
> reimplements the SHA-256 crypto_shash API on top of the library API.

Well, this certainly looks a lot simpler, and avoids the duplicated
crypto glue setup for each architecture.

So this very much seems to be the RightThing(tm) to do.

               Linus
