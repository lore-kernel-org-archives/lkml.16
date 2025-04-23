Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45C5274FFC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406659; cv=none; b=Qhpw9hr3biweZR8r+EQ1BJSMIsftPxWHEXFoDmY0gY0hthrmItvT6HkKzXwpZ3Ymxvl+Dqh+fQeTUulK/JJpo8KsuJtWxLv0OEyCCLDe9FpdEvi4ChqW0xYIgevlZ8hIxXQk9mqcw07MwFQHSrCcIfDjyCzDWFyqrDneJT6V0JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406659; c=relaxed/simple;
	bh=q1Z2G2KOGd3lW3woCaucka2BDMfkf+8/mHBEbUuGPEY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TYUwaeiEHhRHspuyUZVfcaWyignMXz2fZq/raG0xvM9znoeULL+qqm6quY5jGYdk8e3Hk6IbWw+tT6CE62+gT+NW5KKhN52JAfCZkQ6bn5/hUSfbQy7HmrJHRvo4uNOlPkhYMUT10qNWGdZMESWAPd7BVIoeZPYhIcJ7iWwRpbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u0Y0mQB6; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u0Y0mQB6"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3912e4e2033so1982208f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406656; x=1746011456; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E7nNq8tcnHWfg19QVcn8r9DdOppAanJgj1MB1iB8axk=;
        b=u0Y0mQB6rtqNoX7DkdlZIukfsD4FFKHLFdvAO9mqs4JkEAb8iDsICyOA1elEwANjO5
         0LJmaiG1yjqdV/X9+PZIvjWDcmp6m3hvF29axZ7ttOFdUOYiKtvd+Sq/0vhZNYZ3OgDP
         ss+sinwWyu9tkCltr7ikMd8fw4a0T3mfp+4MiPMh1gcfIN01DGKo5sfP/xCNF47xeOBT
         zUcAnjKJkPw64f1wCgM5E59UHl9DQnSRAT9K2xzuvlHH3zTsQzBKVuPVGoH2Ss0EsPhR
         QaxL4NxhjAMK+zNuWL2gBM+R/2vcNMlxt7q1KCQITVv/7RQtGD68ZklAXFgvpv9jrq9z
         0mZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406656; x=1746011456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E7nNq8tcnHWfg19QVcn8r9DdOppAanJgj1MB1iB8axk=;
        b=YBRIPIZn8VWoWrscwLFOA4fFpinzTz9NJegAcMxy5u0Ji+FV5yROf5IcEXR57b9xbx
         vh5XEEPYvFXlCXkJVkJeKWpo/d/6evSFwuV97Yn2XB2RsJ52qTpOKJHXhnpLsyMOLLFI
         /4ZqXIfmEAn5R7RAG7wvbG5NPswhwQ4qzLDdnUteQqyKoWgBYifwjXqQFpjyRh7qjd86
         XmfId+tn/YVt8l8G1MPiZIjRiBfRPlw7Z8b7FhD2t7fABEKMkLmYq6h2Xpp5D1cCMq7T
         ZIJTR3/js5DrRW9jy3uNKkfZDxAG4iDYmPOv9iTFxPULha3MzWjC8Fsnui6gZ+CBsam7
         AK4g==
X-Gm-Message-State: AOJu0Yx0n7blhfDLrLGg1TFk/eob28rNTOJEiEY79OizBEujd4mOOgMZ
	sEr/TG/saauBw+JW/Rp3M4JEhj0NMKQdBLGghfZgnqpoU9t3Llx1FqsxdytAmq75nocDFqQRbIW
	dpUqhHwDpSIVihRIOoZqvt7wcPCFBSj+/vxDewHOCjP0C8wMwXtlvyHRH8+Ggb5dtzgrj/pKzo8
	CzA+tqNsijo2xTPGPGiVC5NPCcmQ39AA==
X-Google-Smtp-Source: AGHT+IFkduK/Kj+NtLDmt3SoaMV5d11uuYbe94PzEimjSNJkMXfTGXRXZYbyZwZOZLv9Nd8Xh4VvyALO
X-Received: from wre18.prod.google.com ([2002:a05:6000:4b12:b0:3a0:393d:9b82])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:144a:b0:39e:f9e8:d083
 with SMTP id ffacd0b85a97d-39efbb05a20mr15497986f8f.50.1745406655773; Wed, 23
 Apr 2025 04:10:55 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:09:59 +0200
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=ardb@kernel.org;
 h=from:subject; bh=HFQgpxJICjKeXXn3m24A7oiYrWljGN4Ov8mm0BxbdIk=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPj1Gx217gNLjfPmvLd3fLuIsPSoqcir6WXfN+wr2uiz
 t2DsWeCO0pZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBE3HgYGbolPzUoue1e4rvB
 5eud8tupOwu3Tvp/xVapq65TyoLzUhDD/7DD+/Ou/tr36ne9EBtL1JUOx+WOhW6nbAXs1L+EewS G8AIA
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-23-ardb+git@google.com>
Subject: [RFC PATCH PoC 10/11] x86/boot: Revert "Reject absolute references in .head.text"
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This reverts commit faf0ed487415f76fe4acf7980ce360901f5e1698.

The startup code is checked directly for the absence of absolute symbol
references, so checking the .head.text section in the relocs tool is no
longer needed.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/tools/relocs.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 5778bc498415..e5a2b9a912d1 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -740,10 +740,10 @@ static void walk_relocs(int (*process)(struct section *sec, Elf_Rel *rel,
 static int do_reloc64(struct section *sec, Elf_Rel *rel, ElfW(Sym) *sym,
 		      const char *symname)
 {
-	int headtext = !strcmp(sec_name(sec->shdr.sh_info), ".head.text");
 	unsigned r_type = ELF64_R_TYPE(rel->r_info);
 	ElfW(Addr) offset = rel->r_offset;
 	int shn_abs = (sym->st_shndx == SHN_ABS) && !is_reloc(S_REL, symname);
+
 	if (sym->st_shndx == SHN_UNDEF)
 		return 0;
 
@@ -783,12 +783,6 @@ static int do_reloc64(struct section *sec, Elf_Rel *rel, ElfW(Sym) *sym,
 			break;
 		}
 
-		if (headtext) {
-			die("Absolute reference to symbol '%s' not permitted in .head.text\n",
-			    symname);
-			break;
-		}
-
 		/*
 		 * Relocation offsets for 64 bit kernels are output
 		 * as 32 bits and sign extended back to 64 bits when
-- 
2.49.0.805.g082f7c87e0-goog

