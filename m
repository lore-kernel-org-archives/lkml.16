Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5C2472AF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642633; cv=none; b=onsxM1lbRZZ/mRZZUZ/UVI6QjBFuKer/JxCKPeqE49tPGjrk/ZGeWNOv6NccDFUaIfkMqMBlgFliIa/aIB5jbWjiZRDDXQRv70OdFrFGADJBeThNOV2vPiT6QgpCZuAamOlCK7a8iAT8tO46a28QS0k+KRjt6BwGAJ7asug23wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642633; c=relaxed/simple;
	bh=nMVmu0mnqFnI/x465fiej4B8Xi495SXzz99LpPCafAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bfoLWK12gjDjrZrtA/Jk/wKgoDXE/4VA0NTMp0LoXdpyIGi6KQUYFpct6d3I9Pcz6Saiyx58qLapx6aOnx/haJC9FyswYG6pxM10MwtjUDpqD9dXk4z1jM5X2pRY5jfvQKk+Ott8pU42GAYUUOj+peMdznHnSNaWGmY+UojDBAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZylL5Cj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZylL5Cj"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acacb8743a7so646073166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642627; x=1745247427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jbPFUD03S5a+/mIPyYPIOOdYImmpF80z4OIO3LBNPQU=;
        b=aZylL5Cjmy61riDpOt9dTJR3mQYg7+0K1EkuDqr3Of48S5J9mK+wQX4Js4eXThpfzQ
         r60CSwxbJpRok2IV9dvs/AgBpPU0fOqQy+pJMkiBkGz/0ZzNY66jww5E2UX8+DLeCgtF
         l1qd6vYvOwa2kVttOaOyXoMx3EWq68vM2yO4m06iaCiNCXCQI9noQzll9RWR+sb8uqVw
         2ChXpLION5SG+lb8Uvfl6rC+kb+EgoBEmg1D7vuEJTv80MP57e+h+Nl6EYIB/naq3rI0
         n6BXQgdosHV8W0OojCXGUdc4mttACfSwJRKi+ObhKY1+tAnyKEH5pkGG5yJQfqiqQKg9
         W3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642627; x=1745247427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbPFUD03S5a+/mIPyYPIOOdYImmpF80z4OIO3LBNPQU=;
        b=WIELhQnkT/mRUQVJYxnrNwAJst8J+w6CwQvSRwZAEmCnVhjr9DWi6RcYt6cLkoLblm
         wYT3KZx5mguAAIzxwlkk3D1LBXscZVorfPDXEgxSTgngfyBQ+3ApcfhyLxYMcXaik7y7
         H5fd9HzK2c8d9GipOHDKnlUBH25EY7OrU5SgOESi7sC3pJ/gtM4mliwtTh2y00rDUCmW
         9/D1hMfzl+YmfQ7bhjiAJ5vEWx4TDjZx1JgiqX5ZLwEgUY81wHzWlIKRo26luMuVunok
         GMh1O/bo4pC6Jwl9jTwWDMy+Wh39QvzUM1bSyir86WPgGeJ0Fz3cN/oCMn5ALskzdPvC
         kUvg==
X-Forwarded-Encrypted: i=1; AJvYcCX+g8dXNGMueKAljpiIobwzVbxr3sqXLbkrU4zwN84JlRN+VYkffFUgeE+swyrDFkG3ahknc0eSJOnaBhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+2/rMeILFG2S06VTU1Mw0f/Zru3ajkTWFxVk6dgxXfREtfXU
	6o428KWwa6Svd9uFlTAa+h5gyDI771j3ISu+QGywrVW/ctk/PWig
X-Gm-Gg: ASbGnctes5/fLaxK7N43GZXAtYTbhQQE1SBA7DiZ1vqZGw7oxkCxcR8Hhy1jMUbp9oi
	7r8ISoT4quoMszFxCQTbKJosYRws9e/E6nTB7hYeheymB074TSbqxKYFdudtQvtSur9Jcq8K/fL
	8m5CppbXhJp5/RzFg5hF2sZVsbIvOAXCehYlL1JAQdsR557V4pQshZbgBRus8YU+BvJZaUBf6m7
	slZf+2rbs1tuWogLC0cMF2n2BVFcmzaDOQjCTwQ5w6gUUspPs8T8/XoGNL8l712RzVPHC3/urL3
	AOmAvJc8QDbjXSmdSegbCmAuWjxaBqAn5C3ZutEbTxD3ojygFg==
X-Google-Smtp-Source: AGHT+IFQk+j582/Pz24BY7Hge7dbHQW7HWZ3XGap1nVfXL91YVs8Nc6fP876u076Lvogcj7kpax+Dw==
X-Received: by 2002:a17:906:f1cf:b0:aca:c6d5:1dde with SMTP id a640c23a62f3a-acac6d51ebemr1063278166b.8.1744642627062;
        Mon, 14 Apr 2025 07:57:07 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4142sm929983966b.101.2025.04.14.07.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:57:06 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] um/asm: Replace "REP; NOP" with PAUSE mnemonic
Date: Mon, 14 Apr 2025 16:55:57 +0200
Message-ID: <20250414145650.10776-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current minimum required version of binutils is 2.25,
which supports PAUSE instruction mnemonic.

Replace "REP; NOP" with this proper mnemonic.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/um/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/um/asm/processor.h b/arch/x86/um/asm/processor.h
index 478710384b34..233a7a0d29c9 100644
--- a/arch/x86/um/asm/processor.h
+++ b/arch/x86/um/asm/processor.h
@@ -24,7 +24,7 @@
 /* REP NOP (PAUSE) is a good thing to insert into busy-wait loops. */
 static __always_inline void rep_nop(void)
 {
-	__asm__ __volatile__("rep;nop": : :"memory");
+	__asm__ __volatile__("pause": : :"memory");
 }
 
 static __always_inline void cpu_relax(void)
-- 
2.42.0

