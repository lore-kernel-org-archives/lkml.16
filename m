Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A091421579F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704620; cv=none; b=d0anxUT+PKbjJXpdBXk6rq4GItN3jEQb/JBBsoZUP1FlHH+NMDrlDlMz/u1pqs6ITZPCzaX1F3WApn5PT0E+qCwa4+a2eG6SywqZUvxVFAsdNGW4BDR45jEFLcl3e7ne7wlbW2ECu+fOfXENv205uRlh2UR0yq6jjqDKf6BER8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704620; c=relaxed/simple;
	bh=iZGdAP8k069QqZE4HGEZg4XHozbIpkc7chinkmsYwqU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Z1J9K4RVAEYM1F/WNpyh5oTl4Si9X0uAqKWYyqKrntWi2N9XVs/kOQw48wZXN90apHW30ULDVqKNGRzlt7BpoMx3pTj0GdEksmp3zhUddq7+CFE8ELskZz50IkKHAOupZjr40ai8fFJZvRy9RRspxlKX+tjBcQXDBO+4MwooEi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xfAcMC3U; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xfAcMC3U"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so6382355e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746704617; x=1747309417; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JUVOAN/lE8yELnQQTGRDJV5f4/8O+GkNaNEOlMMcVxo=;
        b=xfAcMC3UFsLf0ocYqj7QI8eAfUUzLT/jJXjrZDvktC9NSniD5vCqgS74TB73V9VDPq
         9udpRCHedLNVOP84flTwJFSVKCOsPwjZVF16uwSFn01mZtUTdCd/LPw/qqWpTerNFlbc
         CumBtYsX6EptG0Byfb447V0PvXTPE0YKllSR53CEgM+ZQLnjgksPAPJE4gC3lu2MT0aW
         wAXX2U5TGxCSOtPSpL1HSZaPCBxNLBSY+C7IMlczUrNKNUPPZ/gnWxaPlrl+JyfBYmXa
         LYLvoN/69m8CU8fbcT0aL8OSZf6cf6ylzGReW2swQo3cg/evM/Knv+aNRdUquD7Rn6hm
         5PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704617; x=1747309417;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUVOAN/lE8yELnQQTGRDJV5f4/8O+GkNaNEOlMMcVxo=;
        b=VOXPk5b+vOnnK9pN/QbXSz3oU9zAsRfCawSah0Yx5MbC8tGdVfRcMgCuAdB6s472UQ
         ytEi66Y0RQnkzu8uJhB8gMihkm0vMV/8I8fAX8kaQS/ZsnLUyfWhPzKXjgiauXCaNQSS
         3HgFDe7GvKhoUBaDhl7wqxOj+6uu5vq3FXl998B5RYxR/Wr3WRTj1twfw/dkm5k/pkkY
         Yd4rjwzsOzMLL/Rcygj9FxdxNzlx9GbqGFvgjUqYPgbkQF3337kg4b9ShV7f9WAp+c6+
         K6sDoYZ3E3xyWfCWAxcPcMQiQTsJy/tJWt8ZpXxScfG7GqYvs8/jAtVh44YZj2LC2VAR
         aGpA==
X-Gm-Message-State: AOJu0YzyRm96jkzptRSU6MSLNfAhW52z6YsE4oB4xKDTOYWUfX2umAti
	vCXK2aSWZ6ddZiDQSOip0Nfxf68bWlg3NqiqlKFXt1qBFDD7IukkDDGvK0g7N9Tb8HNF4Q==
X-Google-Smtp-Source: AGHT+IG4H5iAdGKlLqepoRH/2n93zvwiPTTakWNsjOIkoD1Z3teFjqJjYwm4W0BX7GPmeos1NJ2pT8AV
X-Received: from wmben14.prod.google.com ([2002:a05:600c:828e:b0:440:626b:cdc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a0b:b0:43d:fa59:bcee
 with SMTP id 5b1f17b1804b1-442d034b35cmr21697185e9.33.1746704616992; Thu, 08
 May 2025 04:43:36 -0700 (PDT)
Date: Thu,  8 May 2025 13:43:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=ardb@kernel.org;
 h=from:subject; bh=JvQMOLfERFcsyndXsuVGRgg+XuD2P4TkQz28VCGTX/k=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNmxsPiW+6tzkb3t95qlrhj9GQB+5H6jZf2aMz3rZH4p
 vyXRe1FRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIkxsjwzkHVi4PnTiNq/5a
 VyPunmYyCfi8YbNEQQinopbkodwpmQz/cz99/tBV9LmP7bbHc4FO7X1PJptOmH659OTqF7EL5y2 4xg8A
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508114328.2460610-5-ardb+git@google.com>
Subject: [PATCH v2 0/3] arm64/boot: Forbid the use of BSS symbols in startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Move any variables accessed or assigned by the startup code out of BSS,
and into .data, so that we can forbid the use of BSS variables
altogether, by ASSERT()'ing in the linker script that each symbol made
available to the startup code lives before __bss_start in the linker
map.

Changes since v1:
- fix build error due to missing declaration in #1
- work around Clang complaining about the ASSERT() expression in the
  linker script

Cc: Yeoreum Yun <yeoreum.yun@arm.com>

Ard Biesheuvel (3):
  arm64/boot: Move init_pgdir[] and init_idmap_pgdir[] into __pi_
    namespace
  arm64/boot: Move global CPU override variables out of BSS
  arm64/boot: Disallow BSS exports to startup code

 arch/arm64/include/asm/pgtable.h |  2 -
 arch/arm64/kernel/cpufeature.c   | 22 +++----
 arch/arm64/kernel/head.S         |  6 +-
 arch/arm64/kernel/image-vars.h   | 66 ++++++++++----------
 arch/arm64/kernel/pi/pi.h        |  1 +
 arch/arm64/kernel/vmlinux.lds.S  | 10 +--
 6 files changed, 54 insertions(+), 53 deletions(-)


base-commit: 363cd2b81cfdf706bbfc9ec78db000c9b1ecc552
-- 
2.49.0.987.g0cc8ee98dc-goog

