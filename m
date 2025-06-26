Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A052D1A83F8
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750916914; cv=none; b=NGBaviQEW5HfaS9tucFG+yD7YFNitfCilzOqTfnz9IoNLZa4ZOV3ZCYKGb8cH/tM0Sj8/+BCvmE5yWM+yaCCOyNmMOTKTkTWMjLXABjTTLVyfHOkewBHOxrUWDNLaEu7khL8SHEeTAXuDRRYdL/+cT0mdz3EddxYzNfYFdcMT8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750916914; c=relaxed/simple;
	bh=7iXNVMFOhItaUCoOVD5EO9MsC8N+X9oJecc6TOl/S6Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iW96eD6oGgNpnU3fCeF3Fl2N6QZ8vGcaNTthoxBPiR7krowG4b44U6TnqXhYebs7O+xjpuP+fP+r0z4XgAW5S/M7Gsy8i5aCYBH1GV5xGbnCz75qxmhwGB2B2/JuGH4ZcZ/4V/sSHLdrproYONvVc3CsyMYeaMrlTTEOPc3uR0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GSlS5gnA; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GSlS5gnA"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b31c38d4063so340992a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750916912; x=1751521712; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hYtEj8pZ1muLWRPDDlQVjZ5z/iyi7EezXJavrUzUbMc=;
        b=GSlS5gnAROXngFUoSdgQ+L84YdByphWuLrkbDN18dE1/xQwqrO1b2WaOZcEVDTYJxJ
         Gu1UPy89E1TlqVfEKufgQyZv+IBhxBa0TGOHA4UR2CEZdbecT9r9qUJVaeLpbT/ZlsJI
         ucet/fx56KdtM5iTr0LTV0JAgO/YCxI0hVMfJvxpVOAXX5A14EzgItgCdDtXWlD6ATmx
         Rp9jF2Ta+p8/nvW/5Pq0U6r8K6iHdJBJislaNfw52mbJ7Gp2Q4y5Mv5f8ey+H8rNpVsF
         1pmVKiFeiUHfTVRatVdOGMHA+CV5VQl2NVFP7jWWIkoRJ83KpT/OWt2pZb5SvvkkfGJR
         BuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750916912; x=1751521712;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hYtEj8pZ1muLWRPDDlQVjZ5z/iyi7EezXJavrUzUbMc=;
        b=CaFeZcCpJd9ieCKHdAg/EJrchr4DpQmSCreihIAETMwNJR36V+aADRynDvCm7BZUal
         /az2biVF5uzsNRnp7oIZ8UfHalmO+YVW198zdf/9vuCxnEWspkP0qZKB/NkAot+xNwmc
         bJxRuPDJQVSaIHBBeGH0Q+iv6IHALWkYLdqIQZyrUAyBD0aqRz9QLu+IHBohTfLrpeFD
         FDi7OCG14bnBkS3AeNHtN0kxYmCU16JQwRi7yBZZB4wqeEoe2xpgrTy22cxEKWO9cJLm
         D9vXJjuGn2DV/3hxVMmmw7d11+0rkGbG/89swYOYS93O6NtGyjK1PZxU0Bq5y/AtXhMv
         K5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXL+HVrYTfdvh9vYhgE4HtjHc1Sll1yVJ21mlgAJwRVdm+wGpJ6XuEcw4Hd1L7hIXUynA93ezuwF3GLEGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZmbK4Q858O4FNneCIvP+lsMqZVyBCqM3ItKxuSuScRdlrQ1M0
	QNtq+0tHQmdlG9vBMKbjMS5AAwoEhKCeXrNpBXXAgzzmc6YveQddY0EmD96SY/Z95/39Fqxi70M
	cUkvcoxiv2Q==
X-Google-Smtp-Source: AGHT+IE2YaB7ChZqsFi4NtfmwE6lkqlm8623UWb6T2LdxoK83rw4khrQNSFo1gWCa8kj9s1R2l6C72a5inWs
X-Received: from plez10.prod.google.com ([2002:a17:902:ccca:b0:234:aa6d:999d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a83:b0:234:ba37:879e
 with SMTP id d9443c01a7336-23824065f5dmr101279415ad.38.1750916911844; Wed, 25
 Jun 2025 22:48:31 -0700 (PDT)
Date: Wed, 25 Jun 2025 22:48:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626054826.433453-1-irogers@google.com>
Subject: [PATCH v3 0/3] Switch get/put unaligned to use memcpy
From: Ian Rogers <irogers@google.com>
To: Eric Biggers <ebiggers@google.com>, Yuzhuo Jing <yuzhuo@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The existing type punning approach with packed structs requires
 -fno-strict-aliasing to be passed to the compiler for
correctness. This is true in the kernel tree but not in the tools
directory resulting in this suggested patch from Eric Biggers
 <ebiggers@google.com>:
https://lore.kernel.org/lkml/20250625202311.23244-2-ebiggers@kernel.org/

Requiring -fno-strict-aliasing seems unfortunate and so this patch
makes the unaligned code work via memcpy for type punning rather than
the packed attribute.

v3: switch to __unqual_scalar_typeof, reducing the code, and use an
    uninitialized variable rather than a cast of 0 to try to avoid a
    sparse warning about not using NULL. The code is trying to
    navigate a minefield of uninitialized and casting warnings,
    hopefully the best balance has been struck, but the code will fail
    for cases like:
    const void *val = get_unaligned((const void * const *)ptr);
    due to __unqual_scalar_typeof leaving the 2nd const of the cast in
    place. Thankfully no code does this - tested with an
    allyesconfig. Support would be achievable by using void* as a
    default case in __unqual_scalar_typeof, it just doesn't seem worth
    it for a fairly unusual const case.

v2: switch memcpy to __builtin_memcpy to avoid potential/disallowed
    memcpy calls in vdso caused by -fno-builtin. Reported by
    Christophe Leroy <christophe.leroy@csgroup.eu>:
    https://lore.kernel.org/lkml/c57de5bf-d55c-48c5-9dfa-e2fb844dafe9@csgroup.eu/

Ian Rogers (3):
  vdso: Switch get/put unaligned from packed struct to memcpy
  tools headers: Update the linux/unaligned.h copy with the kernel
    sources
  tools headers: Remove unneeded ignoring of warnings in unaligned.h

 include/vdso/unaligned.h             | 39 +++++++++++++++++++++++-----
 tools/include/linux/compiler_types.h | 22 ++++++++++++++++
 tools/include/linux/unaligned.h      |  4 ---
 tools/include/vdso/unaligned.h       | 39 +++++++++++++++++++++++-----
 4 files changed, 88 insertions(+), 16 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog

