Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D60F2989B6
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747077099; cv=none; b=XBviLLQ19g/27y1TuzdRrkFnXEt2Qvyxnsl6omZTNrXjHsRf4xqKBQlzD3IQacGIPzOj3ZBqD2FAlYfnNKSNzB6sr0vnQNxOi1gqQVyi0lzFssdw9n42oy5YD1IZpu3PRzA5GoLBTIW4i5BEHZD/2RPI0EoSVRnqjFNlPuRPU0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747077099; c=relaxed/simple;
	bh=k2nJHzJI79JTiEUmZ2Lm7CSeKjm3kcKUtV1vGbAlOxA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mi2mkBteT0SqGTvCciNrsLnr2tFnpFijVxyufv4/xAL+/GJYMQV660FYlh1vR7/Sn9l4w3ewKGBmITmggmQeO/mwjxv+pCwoGNl+buoF0FveFHniumqXvLPV9No8L4Tm/UiClZeVZ6kPpznJNA13p6g4i1LK8FU98G/a69dH58g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=24NcXgf2; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="24NcXgf2"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a0b2e56da1so1851082f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747077096; x=1747681896; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2A4QOYtd+e+YapxsnA4mVLLZLavidWLily5bwA/VPvU=;
        b=24NcXgf2Yhi02ZD9tByE5DmymhLuZgiGgs6sMg0cwnyhfeYi5+eFnMunDr18BOYP8x
         65vohHfD2HiAiqbTcEPVb0AaI2YolCUHuEr7s0p3u2WWzXvC0zFk6kC8OGx7F8l7hnZO
         IEroOEkQ+03tW+7iUXE+c6xo08odB5gCk+jE4MPHrPjFEtfIjDqOa+85eKdCrh3DUcZa
         I/iEP7qDVNmYGsUSPuq1ry1U1WG23Su+PypvzV0xJze8pjWm4N0I7vwTQHEp+Z0w9d0X
         H7HI3Zt84UKXtAY2akYr9xOFnQy1TTXRl+S4+NzlrsDMG432Da6+dC64Nctvwgk2t1bF
         lOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747077096; x=1747681896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2A4QOYtd+e+YapxsnA4mVLLZLavidWLily5bwA/VPvU=;
        b=gI4rp5CdcgTIIROOv31NTqRwRvbZUvroDykfWwgRYo6E56NUGFkzPy33auKr1oCZ5a
         QvuMijR6QuX8co7VSePOjDtPQOZJqDV4NfCBl50EXgKN4vE5L6tdOQ+nUMNyhWrHu4GJ
         IO4vzww6nFqSnUvCJVYYybbtLwcER6rJKC/roerYpbX1zpl9ropv584hapmRPujpXiFz
         RWaRxr39DbJmSfIZYjN3ZAdqyeVODHNNRpZFtHy38BWeNb0U2ilcxrL6dG1pQ83jXUSB
         FiBzuaXTAcFwMdHy9SNq6l4JaUXtRU/CK1yDgtCXKPh6OPSPEMrIz4kNe6Cl7euiQaNp
         1JUQ==
X-Gm-Message-State: AOJu0YxjD79zJ596bEyKQJGOva+OFzmLvu8LiWLr/+48/lcEGJ43MXJc
	nQtlhc24I0RZdy3/p8sVwf23id6wgo4ZOJz35E38peT9eiQ1Wd02ZWUMO1HWJ2QuOsx9UIqExAP
	rlYnOVFw2n1n978zEG469en+MMydlTWYPdc3tRBCZyu8fdUgdnHJ/CuPVeZJItsm+2d1/8bqujX
	kjXBFk1JtwjKDkk3KV4irG/G+WcOJDAw==
X-Google-Smtp-Source: AGHT+IErwosD9vJ9JrYgrLx7V9RG6j5DmK6Fk3l/BmDVN9yfDorOHyQFkGdzbGclKBnt8rsqb/4LW6To
X-Received: from wmbhh12.prod.google.com ([2002:a05:600c:530c:b0:440:626b:cdc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:240d:b0:3a2:3b9:5c97
 with SMTP id ffacd0b85a97d-3a203b95dfcmr5365332f8f.10.1747077096579; Mon, 12
 May 2025 12:11:36 -0700 (PDT)
Date: Mon, 12 May 2025 21:08:37 +0200
In-Reply-To: <20250512190834.332684-23-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250512190834.332684-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; i=ardb@kernel.org;
 h=from:subject; bh=etgeXANbrFUuOBqj8tjP9eeHGfbZA0Naim5ziEeTbkU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPJ3WL9V9YldTk75PhN3ZKf2BtO3vD1eEvn01X7nk5SU
 d4e6Xamo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzENIyRYbUlq+7P21pvJ/Bq
 MUd7Hvd7Od/uZ/+5tak7UtzPTNKtB6po5okQ/rjIvX/T6rpmpnu/maomGwYkzvk80/3c95Xc240 ZAA==
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250512190834.332684-25-ardb+git@google.com>
Subject: [RFT PATCH v3 02/21] x86/sev: Use MSR protocol for remapping SVSM
 calling area
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

As the preceding code comment already indicates, remapping the SVSM
calling area occurs long before the GHCB page is configured, and so
calling svsm_perform_call_protocol() is guaranteed to result in a call
to svsm_perform_msr_protocol().

So just call the latter directly. This allows most of the GHCB based API
infrastructure to be moved out of the startup code in a subsequent
patch.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/sev-startup.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/startup/sev-startup.c b/arch/x86/boot/startup/sev-startup.c
index 435853a55768..a1d5a5632d58 100644
--- a/arch/x86/boot/startup/sev-startup.c
+++ b/arch/x86/boot/startup/sev-startup.c
@@ -325,7 +325,9 @@ static __head void svsm_setup(struct cc_blob_sev_info *cc_info)
 	call.caa = svsm_get_caa();
 	call.rax = SVSM_CORE_CALL(SVSM_CORE_REMAP_CA);
 	call.rcx = pa;
-	ret = svsm_perform_call_protocol(&call);
+	do {
+		ret = svsm_perform_msr_protocol(&call);
+	} while (ret == -EAGAIN);
 	if (ret)
 		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SVSM_CA_REMAP_FAIL);
 
-- 
2.49.0.1045.g170613ef41-goog

