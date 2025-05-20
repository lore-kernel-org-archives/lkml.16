Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7CD27F171
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737733; cv=none; b=rrC92EsC6wBZqsmFmoivYRVaDG/DDKNuyijTW3ccsa5i9sNBPwsmQ7PWitkaBZCTg8ziWy6e/nqxNAuKGCoWl6apSRCxbvwWBnBM5cU4zMP92T4EH0urtMUJyTzrKQfF3D6uEmEdS4iDvu5J4KQcvU6MbQlCsxek2WJgvGwJqhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737733; c=relaxed/simple;
	bh=lIqPmrEeIkfT9o5Hp9bUhpJ6ilLaftkaOD4ciQyICAM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZW/zF/tJDFhuvkkGEEYjXGGtHO39K9451csMW658o43N0yUrMUQbXysF3BHFo5BFsXu9KKzLOGFGgAtUMMLzMLDRZUCuJWhXaaiRqD+1py05o1YyokuxGJN48q7AdpqRlWJlswxQbpAw4VaCC6e8gWGw5yHeXNd5G9/z9gSfwOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d7PM6UIT; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d7PM6UIT"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a3683aa00eso1449784f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747737730; x=1748342530; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=48HSNwYzS4MdW1GYfppk4qhPWkku6mpAaebKvT0s29I=;
        b=d7PM6UITinggEHOkDN9s4+aVPAaUo2/vAnTeNUMtLWukVRfzG+Ady1ceWN25h0pjcE
         BGGtjWjxTax76PN+26n2Zj7evSqttO4ldkUXuOI6y2CjdXXkrs7m+jBlF8P3DHSJhg95
         doLbp2I95FcWISUDOzsiFLFR+YaSZamepLNHelBYrC8tDyYw5IvbDf26dIiOCeiDZsXh
         BZh3/KQM0KPa/ygCXRDmZfy8yA2oRCG7LMONjiE6ngx6MDp+hFKsuiRP52BPbXaRUCbf
         6YLzbrLbFHS42Y3Cp9t+jxmRkgV2zPo4sXYWQUZbGyx0k/4b2wg8FBxSde8dTU44CjuG
         JoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737730; x=1748342530;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48HSNwYzS4MdW1GYfppk4qhPWkku6mpAaebKvT0s29I=;
        b=KOC/iFf8OYMXdxhjdMqSK1SFRWCEnwaBn38HttOusRqvgLkpwKFBBPQ4gTgwfmHHn6
         MTWURDdTFu7dsvjuncArRLnwB3FCuoUJtkpag5YZcVEfwhQmoeroHnScuu7RmIheauGA
         PiK+w+1JGWraE2D2L2OyQxc0eCDKQ/Ki1y5aeUmPEd6H3NIaKFfuROLh9B2hzQa4L/bl
         bMEvSSqXe6mmcU2OcKW11QeQcoaW5u3ky6b3JJADYoPiyoLVNZIKfEvHOHuBEOxtDYvU
         XvX4ZXU3Cy+ZVJRzb+nwD9f+WoWP6jt02hXzmE98oKkI+iCydqYseaPU5a3IbNN1704G
         lv5g==
X-Gm-Message-State: AOJu0YxqV7oSHVyL4rpXHEsoUAVGkK8ZCg3Let+Puyv1S6ekdArLcXeX
	rCWCXwil9jT55V7CCTkIi9HG1ULDEbn4b29COT/Zww2CBCQweBRHhWwm5+yxOyGBvovQg8xiXJ2
	havmD0C1Mn2+VHHnb6IBZim30Z2P+nyYk4LwYzSr27tkjsMIArxSaaRgUwo2E9NHdaNpx++F4SW
	W2cCNMhXejPsW0bDuhY+m7ruTilnN1ld3Mjg==
X-Google-Smtp-Source: AGHT+IG8GElBuy5Mhy+BcBGRYqfJGH91mMqquZF7EvcN/D8+2f3OWAPnmPAptHQtfdOM5e85CYQd4IH8
X-Received: from wmsp16.prod.google.com ([2002:a05:600c:1d90:b0:442:e9e9:c2a7])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:420d:b0:3a3:760c:81a4
 with SMTP id ffacd0b85a97d-3a3760c835fmr4336240f8f.24.1747737730457; Tue, 20
 May 2025 03:42:10 -0700 (PDT)
Date: Tue, 20 May 2025 12:41:46 +0200
In-Reply-To: <20250520104138.2734372-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=ardb@kernel.org;
 h=from:subject; bh=vLh1RD9b/M3vr5yS8QTbENrmgs8a7pup/j6J3eE/P2c=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMnpsDS4ZWR8J5mV+P2ckcLPqdchxfPk948q07ZIXSjK
 PWLqHRHKQuDGAeDrJgii8Dsv+92np4oVes8SxZmDisTyBAGLk4BmIj+DUaG1k2rrYRf8XxZnRYT
 NVU+xJvzrXj/sjqPsqtMaT/VPF6UMPzPCnK1O1aoYZ0v2SE6fe/W+hzJazI7u1VPZ0xYa8ata8o AAA==
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250520104138.2734372-16-ardb+git@google.com>
Subject: [PATCH v5 7/7] x86/boot: Remove KASAN workaround for 4/5 level paging switch
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

pgtable_l5_enabled() is no longer based on a CPU feature bit that might
change values and confuse KASAN, so we no longer need to disable it
temporarily.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/alternative.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index f3c68b586a95..e39823d8d1ae 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -589,16 +589,6 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 
 	DPRINTK(ALT, "alt table %px, -> %px", start, end);
 
-	/*
-	 * KASAN_SHADOW_START is defined using
-	 * cpu_feature_enabled(X86_FEATURE_LA57) and is therefore patched here.
-	 * During the process, KASAN becomes confused seeing partial LA57
-	 * conversion and triggers a false-positive out-of-bound report.
-	 *
-	 * Disable KASAN until the patching is complete.
-	 */
-	kasan_disable_current();
-
 	/*
 	 * The scan order should be from start to end. A later scanned
 	 * alternative code can overwrite previously scanned alternative code.
@@ -666,8 +656,6 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 
 		text_poke_early(instr, insn_buff, insn_buff_sz);
 	}
-
-	kasan_enable_current();
 }
 
 static inline bool is_jcc32(struct insn *insn)
-- 
2.49.0.1101.gccaa498523-goog

