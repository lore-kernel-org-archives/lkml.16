Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B017DA6D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489965; cv=none; b=gaBq8WwFurQkFVuoqNEllGljj+SEpGAdZ3MyfxazmIbM/JwnYzmd47YHhOpH7tpsTAKWuB09DMUjHZQ+hCNgpNH680mNszMR8YMeoKMutPL5u2dJNx4q5C7SMvvrrS0UYk3XSaphIr8DfwuvCwuX64oGrOVo71G4s4Uh+FpF8xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489965; c=relaxed/simple;
	bh=gZMQkuTH5eS6MID9lI2Ptd6S1ztbvFrHop/MX8doq/k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nMLUk/YLhtGueQ12/XYYBfvnVDlyqDSIrJZIoMpvd+xZkSqVlVKYkU5yIRk/gVWmQSIFlsF6Bqwv0rDLzXLKEVgdzUOH1QDhAFRO0J5rItVoeARS0AhXwxXWVfmdfHN37H0FSxr88YpFq2M/i7EgAFryNoXJMGjIpLabls7k5ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jz5WuAuJ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jz5WuAuJ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3912fe32a30so305411f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745489962; x=1746094762; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=THf/MVT4cQwV13+M3Pb20JJhOEchUgH+Tc6DDI5GnFk=;
        b=Jz5WuAuJZ9Cn9HyW7VRP8pHL5L6IpaoryFRLZyzpjouVK0DisOYrg1+LcXnoMeAKcP
         nRF74v8zlSjOJztLC/5yoVYs30+4qFUtQxdYhO5jpKEiOo8adqcJr102ZlEGbeWTSlVD
         BB8/SsAbC306h8gvyoZZcpgWRohB+VdL64GZeFEU0vKHRTZ960j2WU1L7gru0cTEy//+
         jQHt/L9UFcP7lgmrt/LE1pHdBTY3fi6QZJ2p5kEOgSizVg+xrqtfa1m6ibjcWpw12jNq
         4f3qQOXs053kCycNBwxfMq71aku5LsNy1d03UgGUVJ+HQktHVKZ14XBmASk0stIa489a
         YYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489962; x=1746094762;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THf/MVT4cQwV13+M3Pb20JJhOEchUgH+Tc6DDI5GnFk=;
        b=MdREOjaPNxLILLSauj9peDF/d22m43sgooWtDlZPYJQLfUI9a0/AF4uakfpj8DCbfd
         PLQssuQGRozNuTRkvqNNbJWT9JzRU2madQkfL+MXiNKEd/pRhcgIJKipvy4+yvMO3c3p
         qHYVuzuigsG19NMROeycisH/UK4BntRZIYogOZKdZQ1FmjTPWerM0ySW+iCI64sK8h4r
         qBpWrRoJ27vgdlkvcEgeQqrV4YV2ZykgCprB6UzVI5sPga1lNKvdYwzPo1iKz41EKURp
         kSROeZNlXGpbrz6WMTAU0ecC7aQe6VhyjswPj1bJVgPq1tIYNsr4Il2GQF2ZlrxVtbmU
         A9Nw==
X-Gm-Message-State: AOJu0YysFKi+8H3NoUUwQQzeESwBRqtuaI/9rxttkrXUJANWqD4P1GLV
	72fulW0P4hl4BBrs/LWxbmORVYiIvCnn3ryxMZaQKhbHRZqyX6XqAbP+ypTZkgkQB+eTNi+IDA4
	fEb2ZRoHAh51hA+9Al49z9ahbAbfw2F5qoHW/YyAm0aMQfYYgArqm151QEl15gXI+GC5NQENGph
	qsL93nXD6OysTtX61HrckXHDeu2hI7rA==
X-Google-Smtp-Source: AGHT+IE9QT2YCBnyamrFo/mAoRhbchwidUtlGGNUVHPx5Tx6d0FVpLkhq+w48OTzmO/azn0L8DPTjZdy
X-Received: from wrse12.prod.google.com ([2002:adf:fc4c:0:b0:39a:be9d:f396])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:220c:b0:39e:cbca:922f
 with SMTP id ffacd0b85a97d-3a06cf523e4mr1587553f8f.12.1745489962524; Thu, 24
 Apr 2025 03:19:22 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:19:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771; i=ardb@kernel.org;
 h=from:subject; bh=ucK+ySCXtMGXNmRaMwKgu6ZLmvylzJoP9YoIfmYlA7U=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYNLQE3kC6dIWeDq+KhLUxfdENT207zx5MX/lUmVnu/Xs
 G0waxPpKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNREmf4pyz0SvRJUmj32ri1
 nnILhKqWO/WesDf75fUq9u3Jl0cCgxgZzphF83Ku1Zt4+WLUQ2nBE+kBBhEXHTk2s2ueDPUxqLX kBgA=
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250424101917.1552527-2-ardb+git@google.com>
Subject: [PATCH] x86/boot: Work around broken busybox truncate tool
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, phasta@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The GNU coreutils version of truncate, which is the original, accepts a
% prefix for the -s size argument which means the file in question
should be padded to a multiple of the given size. This is currently used
to pad the setup block of bzImage to a multiple of 4k before appending
the decompressor.

busybux reimplements truncate but does not support this idiom, and
therefore fails the build since commit

  9c54baab4401 ("x86/boot: Drop CRC-32 checksum and the build tool that generates it")

Work around this by avoiding truncate altogether, and relying on dd to
perform the padding.

Reported-by: <phasta@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
I personally think using a busybox environment for building the kernel
is a terrible idea, and does not satisfy the build tool requirements
listed in the documentation. But apparently, it used to work and now it
doesn't, and the workaround is rather straight-forward.

IOW, I don't care whether this gets applied or not, so I will leave it
to others to make the argument.

 arch/x86/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 81f55da81967..640fcac3af74 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -59,7 +59,7 @@ KBUILD_CFLAGS	+= $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 $(obj)/bzImage: asflags-y  := $(SVGA_MODE)
 
 quiet_cmd_image = BUILD   $@
-      cmd_image = cp $< $@; truncate -s %4K $@; cat $(obj)/vmlinux.bin >>$@
+      cmd_image = (dd if=$< bs=4k conv=sync status=none; cat $(filter-out $<,$(real-prereqs))) >$@
 
 $(obj)/bzImage: $(obj)/setup.bin $(obj)/vmlinux.bin FORCE
 	$(call if_changed,image)
-- 
2.49.0.805.g082f7c87e0-goog

