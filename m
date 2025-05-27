Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00A420E00C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748383014; cv=none; b=VAMD+aEulMGPJ4qEcIBMvyyEjOTRbLchns+k9fPL98ZWHMrrSDoijpPQZu53HMyK6ZbKtJqUbkqp0irPXnYhEBjoWIfXrNgD28FW0boTgOJ64ltQEeQybTHJdcNS1vI0/KRR8klJnmO5o0ACh1QDTBzm4gzSJUabaqLgQ6B4HCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748383014; c=relaxed/simple;
	bh=H6RdSfdrrWnEqfuvZ74jCpn12+bkjOdAgwdgoViDX0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=irRWPQWr357SOpdlK3Og5Uhsr7CAK3XKzLtPandV5oSWr18RNEoBI6an6eCyWz8bdeZMl0hHl4cMXuHi4/tYGocoU6vKGZZmB3LrbHm0PfDfNZfpQpFCxVoFXh/7sZU8LV5wdzor+0dHNizxEitF53Wgr5zrVd7fCj97LpAmynI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ONsPtj/9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ONsPtj/9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442f97af707so20875e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748383011; x=1748987811; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SgGQJnneg6KUhe9rF0gnPBXorTfQGxnTid6H5S2Xibw=;
        b=ONsPtj/9xvVDlgMSe1pDwakYRjZ8Yt+LWYitdjPCqosifL9gELVhqOe1HHI//v8gki
         8GLDtZzY0ogKiG+ckZiYL2DAs3yH36x+HsRnedf8oxY3rTSUdfftEa4APuyHcvXax9rB
         HekX0+C20pOW0z6c3TRtfcKzpElkJUKDfvvacZ1091MjeVs0iPIbl9XEk101nMOZJ0Ea
         ofdSLs4/kF6ntjD6Dv5tJA/9NrLVZlrziUs7EP+doYg3eDkVlfrr6W4lqE1P1e+yIiQq
         pJiheR7cBuBzGBo30F6bIPGonPK6kR4Tm9O4JOXzt1Sw1W9LVL+DznAIfhGIhBSKfSXO
         GaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748383011; x=1748987811;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgGQJnneg6KUhe9rF0gnPBXorTfQGxnTid6H5S2Xibw=;
        b=cTONirswLnoQc4SOEpppfGcI5LIff1WcHgtpFTouIOscEEumAtA5ZHiA5Ar9WaDfTU
         Q3YoLEAvoHbKEley3qMHtKaQ3AedHuVsJQqZwI59eveO0gsIJFZ+xv2W2H/ey4l+sBHn
         KU6TRtyHHyZTl6d89ZdTgH583gLhtBNI/fM2R/AfwwPphPtAI5css0SB0mMkKNQQc63G
         avRUke6jr7GicUzKI3iV1TpNgapVJPn8vrLivKfLGMF0ynzAyrEyaIlL+RiHXFLoFlUV
         XDYmsp8kjmkhkjjGu3DE7zvILlAAy+oH8KKKFX+qggX1Evd455wqthLcEMo9qX+CFVul
         T8qA==
X-Gm-Message-State: AOJu0YwhsEViK5UcGzgRcGivgX/i2s6AxofSBBGAueDMo2zNYLU7TOxI
	dSH/fq07F3Av615zxYvqqI+U3M9X/Sz0pHjmRhBw/q3P5rkjk2xa+j8oDr1yhlA0Ow==
X-Gm-Gg: ASbGncvMchzyCX52k47HKJe8fmxX47KsBv5JQENc6X+LdhtKKcrbCO+uzMxRdzNu6pw
	NEqjJIU3WsE3EQTNc3miBc3oIuTHTsS1Pp0JDq3h/qSa68u4bXokSsVixY9ru2bedetvdyDD1y9
	+e4O7PUnAmbt+VZgCewXi02NIxe5CXckdLS1HbbdBsEynIN6PMpi1sAOsb9VRXI4KbdxDyjIwDz
	7WqRj6MxCD9jUnVzjFP4TPBUtMqOaCGJrWmM/FFzytaIT737YRsox0BSyXt9wutMTgxVxi+JR1C
	+CZRR2ryaEees4hqcCNY6xac/YIFz4OqFeS6hitgre3Q72bcPg==
X-Google-Smtp-Source: AGHT+IFc5zVbxRie7OQxz5PhnK1JAeCame84zsTiWiDmjtg1n8m7Q8BRoeHguQ3XnLsuaip8xI/4ow==
X-Received: by 2002:a05:600c:45ce:b0:43d:409c:6142 with SMTP id 5b1f17b1804b1-44fd30e21b1mr510345e9.0.1748383010568;
        Tue, 27 May 2025 14:56:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:8e02:75c1:e352:cd00])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450064a1ac4sm1241745e9.12.2025.05.27.14.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:56:50 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 27 May 2025 23:56:42 +0200
Subject: [PATCH] x86/mm: Limit INVLPGB to VA in invlpgb_flush_addr_nosync()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-x86-overbroad-invlpgb-v1-1-64ca98aa2a3a@google.com>
X-B4-Tracking: v=1; b=H4sIABk1NmgC/x3MTQqAIBBA4avErBsw7f8q0SJrqoHQGEGE6O5Jy
 2/x3gOBhCnAWDwgFDmwdxlVWcB6Lu4g5C0btNKNanSHqW/RRxIrftmQXbzuw6Kp90GZdSBtDeT
 2Fto5/d9pft8Po7i4j2cAAAA=
X-Change-ID: 20250527-x86-overbroad-invlpgb-34f903c9e2b3
To: Rik van Riel <riel@surriel.com>, Borislav Petkov <bp@alien8.de>, 
 Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748383006; l=1544;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=H6RdSfdrrWnEqfuvZ74jCpn12+bkjOdAgwdgoViDX0c=;
 b=LlUTfSF9TgfmJn97RSUv3H9eY1zpnykhquCEBz3jgZngzgmAQSk49U/P0fkCjicp83AA7aVwn
 B+TwVhAZt7wDhoAmzDQlgDHXF9Iut3tRFQ6DlYM2mRU6bYj0mgOSl0K
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

The intent of invlpgb_flush_addr_nosync() is to flush a specific virtual
address range, but INVLPGB_FLAG_VA is not set.
If I understand AMD's documentation correctly, this means this will flush
the entire TLB (except entries for guest ASIDs).
That's safe, but seems like an unintentionally broad flush.
Fix it by setting INVLPGB_FLAG_VA.

Fixes: b7aa05cbdc52 ("x86/mm: Add INVLPGB support code")
Signed-off-by: Jann Horn <jannh@google.com>
---
I am not entirely sure about this; Rik, can you confirm if this was an
oversight, or if there's actually a reason for not passing
INVLPGB_FLAG_VA here?
I feel a bit uncomfortable touching TLB flushing and narrowing a flush
there...
---
 arch/x86/include/asm/tlb.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 866ea78ba156..e257201a141a 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -153,7 +153,8 @@ static inline void invlpgb_flush_all(void)
 /* Flush addr, including globals, for all PCIDs. */
 static inline void invlpgb_flush_addr_nosync(unsigned long addr, u16 nr)
 {
-	__invlpgb(0, 0, addr, nr, PTE_STRIDE, INVLPGB_FLAG_INCLUDE_GLOBAL);
+	__invlpgb(0, 0, addr, nr, PTE_STRIDE,
+			INVLPGB_FLAG_VA | INVLPGB_FLAG_INCLUDE_GLOBAL);
 }
 
 /* Flush all mappings for all PCIDs except globals. */

---
base-commit: b1456f6dc167f7f101746e495bede2bac3d0e19f
change-id: 20250527-x86-overbroad-invlpgb-34f903c9e2b3

-- 
Jann Horn <jannh@google.com>

