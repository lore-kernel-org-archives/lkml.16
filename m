Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595321DF254
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746352415; cv=none; b=ehmIFdLyXHCnAxOh//UaWBteYcqQ7NyrBwioQSsPWQCqnt7bwNVTEZUdNnTdvkAnGWifk/G/E97Qx42dbV7zQ+QY39QX98fR6/06r7G4j7bWAhbszDPBfmxk2fwLH+5k4mcvJTm6/qLWDvQJWrY9Q0Alos9oz8AEzLHnAN88KD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746352415; c=relaxed/simple;
	bh=hjTn1iC1IqN51EiMAtjjKytIMtEs0cf/aZrcEIcCD5M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U1AyzuTVps9KjTv5MSg3Ovtu1vbQE0JhoTQj0/ZIqL6rjnlcZrtyUgB7q1s/rO9x4AKMqyqUXmEpN+OFnrEMOe/hpKWBjNZdSchpjqQ9l53UjXomkLrej8Z6LlMujzrc69zNaNCl+4ihIh5v/Qwskr7HEgRLvvLYrBVVqld2HvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kjaw9ZQW; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kjaw9ZQW"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39c30f26e31so1934001f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 02:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746352411; x=1746957211; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V6n8Ej6Vfc5zcFVzwKiIyzsJGi4r0jcCeV0Mu4Nt7NI=;
        b=Kjaw9ZQWeCmI6JjRWhfAEAIreR8hJDpOClrsHESC0jSJ2NB8KWm27vyZ2Ph4XrZNam
         qW/OaS+o3Z/rKoEmjTOafyPFhRReR02F5QiDZRnI2C8pnlQ+oyF1Kp0a/riDP7abtlGm
         uxTDprT0QNMa3LlCWRmpsA0vW0wS8DUnTWcAMDbFotCxI9C2soAjfh7dA7A8QuKLUte5
         4iNKR+np3suISLKEztDLbMPQwgPpLa25HsvXNgsJW0iRNK90cmKrG++65nxgzlSYcG0n
         xZDpC7wSfZNg/oywnq61f13nvMRu4kSdjKGI263BqVgGLBhnrolaiyWOx4tNV3BVbP4W
         jDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746352411; x=1746957211;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6n8Ej6Vfc5zcFVzwKiIyzsJGi4r0jcCeV0Mu4Nt7NI=;
        b=qhcFSGljj8UGWVYIk8tV1LZ00Kf5vq5BA39nSGslV31+o+G4cg+6u9+3JZYNHMHHzZ
         mCoOF5P32Qr1IrCFtfTQHypp4/OmRf0UPbVwnbAzwQmX6TyCHbUZFTsNC8x+ZtsgPB8W
         p4lDyVnVSRk6KbpZX5OCsNpULSb6aUxpgNPGytmIbMZLcoXIhTKbGFjeXQVOrNMKibPK
         fuSxYboAqH2HALNz9Ql2mYjtA+8BqulvoQ8/+UGng6OJ39SxAdJPxdU934pKqiJrJkwB
         LpLa0RMcwIibgTpWFhau33gZhQpndp4d8st2WC3SfpzRm42PdF5tKeMXDJxmRo8gNDfe
         ldEA==
X-Gm-Message-State: AOJu0Yxo26YgLrimoVBFq9duzgWDL9DTvQuIHHst+lqx6U6vKbeUKp4x
	YaSkzPe9QfECVNYjj0/qju7CAfwSHZKh5gul+bb8r5hHhw7sspPGNAQOBetKv8NjsJF6leaCn3v
	nk149uJSYFsHKX2c6jP2v5lz3yZYYi+ANh7uZK8yZ7pqfGC8redvll9YpXhenL64r+EULlgsx/y
	6CxCUNi6kxZqTfMVYa5ABfMqTqOtdagQ==
X-Google-Smtp-Source: AGHT+IEAQx+886S9LMNHFdxflvzeiaW5o4RQOjeHMaXqTly8oAOoMo9psvzGvfzUDK7SOeb4Nxqg5m98
X-Received: from wmbgw7.prod.google.com ([2002:a05:600c:8507:b0:43d:8244:7f6d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f86:0:b0:3a0:8712:5391
 with SMTP id ffacd0b85a97d-3a09fd6dcecmr2392107f8f.12.1746352411407; Sun, 04
 May 2025 02:53:31 -0700 (PDT)
Date: Sun,  4 May 2025 11:52:43 +0200
In-Reply-To: <20250504095230.2932860-25-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250504095230.2932860-25-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=ardb@kernel.org;
 h=from:subject; bh=sXN2aX5uRXQRstOSIZ62Xtcz/h/qKJPn4/i4S0dGRas=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPc4v2HyGnev0N6anm+JM26ULtJNz6z/53I56jNaqUaB
 skH4mI7SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwER4xBgZlgW/DL9mcOsZ479S
 10fru2/8u3Hs58yL9/7/V/v59HPMzGJGhl8rNp3LLzVKW3XTTHZl3564w4espBaeltqndmjhLub fQjwA
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250504095230.2932860-38-ardb+git@google.com>
Subject: [RFT PATCH v2 13/23] x86/linkage: Add SYM_PIC_ALIAS() macro helper to
 emit symbol aliases
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Startup code that may execute from the early 1:1 mapping of memory will
be confined into its own address space, and only be permitted to access
ordinary kernel symbols if this is known to be safe.

Introduce a macro helper SYM_PIC_ALIAS() that emits a __pi_ prefixed
alias for a symbol, which allows startup code to access it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/linkage.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/include/asm/linkage.h b/arch/x86/include/asm/linkage.h
index b51d8a4673f5..9d38ae744a2e 100644
--- a/arch/x86/include/asm/linkage.h
+++ b/arch/x86/include/asm/linkage.h
@@ -141,5 +141,15 @@
 #define SYM_FUNC_START_WEAK_NOALIGN(name)		\
 	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)
 
+/*
+ * Expose 'sym' to the startup code in arch/x86/boot/startup/, by emitting an
+ * alias prefixed with __pi_
+ */
+#ifdef __ASSEMBLER__
+#define SYM_PIC_ALIAS(sym)	SYM_ALIAS(__pi_ ## sym, sym, SYM_L_GLOBAL)
+#else
+#define SYM_PIC_ALIAS(sym)	extern typeof(sym) __PASTE(__pi_, sym) __alias(sym)
+#endif
+
 #endif /* _ASM_X86_LINKAGE_H */
 
-- 
2.49.0.906.g1f30a19c02-goog

