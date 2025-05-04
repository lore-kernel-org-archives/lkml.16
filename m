Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EF81B4242
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746352404; cv=none; b=sWikF0hgOdskI5ezpyCQYQE5jMyftNrCr9R/Z4DBwQAphw6qBJJV9/FndhUB9hv0xzhuhhEfl/h0N13fatV6ZMmINHqFSftgk/OF8mOnM98j0p3Go4ZF0oEcKglNBZhia3RJwnpnvr2Ty+Y21gSHoghXpsjbDK6aMpJEiLNsCK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746352404; c=relaxed/simple;
	bh=W1ANImcDpd+uTiUUIN+N3oqFLIGNXO0Quh9RJ0+Di5M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jIqbtyZJCsTaI+ZTpMuVCHlg8X8vOVQc7rgqIRgwbBgk1OJKMj/t2IUCjO4i0F+AIx41+J4lCuE9kxAAUOoULaa0QmDSr2eHYY/Vu7SbA0osJNszYuTKzu6snhMVxlr5oEZkTSsTW82d3A+cF8+kl9NKqBA7+rIZ9KQFoqfVOG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n/D4vNMy; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n/D4vNMy"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-44059976a1fso14666985e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746352401; x=1746957201; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMlO4D1Qq+GHqs6fBTMVEjatUIBm7+dezuV4a9YlkXI=;
        b=n/D4vNMyvhgy9yLwEVIE1c1l29IGwSs4hYBssaQyoTI1gY8eNU1tAWDrAcCqwj9QO4
         te6BLpLzwY2ZZGS14rAfZPiD8wx6Q2347MgnofXhGF7UgjN53ja88/G8se0fMvpNLTGp
         HWnSSz+AEMrpQZ7407wbAJHr6irano95+NXNNYHqFIvkIQNUIkDZpiG0c7ZQoI2RKSMI
         zFJXRIJuh5Yf5ntCbMYoOcFueg94YxZ45N3Erxkx9RZml55PYKkR8furz8KHG/82dDDb
         EJEgjxuoLbkaaJUB0rsILe9eM9G8zX7fuRBxp2hxoBdE0aDTgy7CerGvYNxN+ub5hz6O
         g2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746352401; x=1746957201;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMlO4D1Qq+GHqs6fBTMVEjatUIBm7+dezuV4a9YlkXI=;
        b=sHO6g+JgjM0NG/aXKT6aN5xth2kwuHUlgCqdA/7mVqUD+rKeMWfqc/BBHK53jX6GCy
         QjW6FkHH9zweDabxKAQw7Ro0ksA0VYBqIrQpTJqsII0tJsOOGoUBZW724YV6imje2tF5
         tQYo9dwQ0ZLtCFILpnYRzin7WqUvLf2qsW+BhgZi1J5EL8uBL9xm7pQluM42NaCNLFRw
         TBLK0EP5MQ6JRUJ8Q5bNuWAA/VT51GrHdmZ3o78ofQs8jUcRHeSHyevYQQOIgYkKLDCE
         9NuYIVtMI9qx01cWivVfdceeqJwtGqakBSFVCGy+6z5HSaZ22u4w0UNlyjw6QxmeJ9T9
         QdRQ==
X-Gm-Message-State: AOJu0YxRSs//nKvxykN/ePc/5RKqCQB8uRya2qKrP9KkNGmShJLoAGqA
	HYG0A2eNxXEpYR2C4FRQVxwuxV644rkvENZHmaljeS18ZUTOzUD4yiDPB3gi0AjCmAi/n7rKPqb
	7TWzXCEEEJb74+4Odiu1Is4xCyFS1/z+xfn9F3W2d1juA67yr9/GxO0m5oryLi1POrZZS99ESNN
	tRmC2FLpP0SoC4yfCp+I3qIiwHYCYH1A==
X-Google-Smtp-Source: AGHT+IE1Daw2zJJ96MU5LWVcGK7VzrYPVT92nrQxCcKknFvAnfrQZ+3dSIOn7g9+yUY0RB5OD0d9jfW0
X-Received: from wrbhb13.prod.google.com ([2002:a05:6000:490d:b0:39a:be15:381b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:59a4:0:b0:3a0:88c7:47d
 with SMTP id ffacd0b85a97d-3a099ae91c7mr6832921f8f.38.1746352400875; Sun, 04
 May 2025 02:53:20 -0700 (PDT)
Date: Sun,  4 May 2025 11:52:38 +0200
In-Reply-To: <20250504095230.2932860-25-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250504095230.2932860-25-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805; i=ardb@kernel.org;
 h=from:subject; bh=5yrr0SwSIItxka+ivl8Mm8JUpubwLhO1mQq4KuDXpLg=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPc4mXj77CKK0zTbogpXfTujfo0O7/Z6mWvpMRcr7yf9
 o6PrQ52lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlMu83I0LpBcHaPidfcxbl/
 y8LubmP+wPMuLTp53trCUsOnbw49t2Zk2J6zyEV2b3NREN/JnXenrVU6HJHoUxUb+qx++XWhgkm PWQE=
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250504095230.2932860-33-ardb+git@google.com>
Subject: [RFT PATCH v2 08/23] x86/sev: Fall back to early page state change
 code only during boot
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The core SEV-SNP page state change code will fall back to the early page
state change code if no boot_ghcb has been assigned yet. This is
unlikely to occur in practice, and it prevents the early code from being
emitted as __init, making it harder to reason about whether or not
startup code may be called at runtime.

So ensure that early_page_state_change() is only called before freeing
initmem, and move the call into a separate function annotated as __ref,
so that the callee can be annotated as __init in a subsequent patch.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/coco/sev/core.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index ac400525de73..fd5cd7d9b5f2 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -501,14 +501,24 @@ static unsigned long __set_pages_state(struct snp_psc_desc *data, unsigned long
 	return vaddr;
 }
 
+static bool __ref __early_set_pages_state(unsigned long vaddr,
+					  unsigned long npages, int op)
+{
+	/* Use the MSR protocol when a GHCB is not yet available. */
+	if (boot_ghcb || WARN_ON(system_state >= SYSTEM_FREEING_INITMEM))
+		return false;
+
+	early_set_pages_state(vaddr, __pa(vaddr), npages, op);
+	return true;
+}
+
 static void set_pages_state(unsigned long vaddr, unsigned long npages, int op)
 {
 	struct snp_psc_desc desc;
 	unsigned long vaddr_end;
 
-	/* Use the MSR protocol when a GHCB is not available. */
-	if (!boot_ghcb)
-		return early_set_pages_state(vaddr, __pa(vaddr), npages, op);
+	if (__early_set_pages_state(vaddr, npages, op))
+		return;
 
 	vaddr = vaddr & PAGE_MASK;
 	vaddr_end = vaddr + (npages << PAGE_SHIFT);
-- 
2.49.0.906.g1f30a19c02-goog

