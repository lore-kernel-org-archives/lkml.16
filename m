Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D49199FAC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985660; cv=none; b=hpzSr0vXX8OTl9xvt2bTi62xaMQ7EADGor/lFq1g2fJwwj99RuwLeVagN+Z/rcVjY1sbogKol+QcA/CvpMoLdoQucptuNXkb2fhdD7ERErRjQ1qIJdtz4/m1UCGDE9VZFuTXzKv0NALJ4bqD2X6qSaWogSK9MT+XTapfwzXd/qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985660; c=relaxed/simple;
	bh=P8pu/9E1xefDMZZYc1QzgyDKcdk7pIPUuqOP8rxmA6g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LUpusZ10g016xPPASa12B9Sq4cygAUIWo1AAIiw1HNxb0V03U7I0xVe2kfwGGbwjO8D7G/0VmXFsuuPEwL0QcRXEXeOyqvCrDCrvRKBvvo3As0T3fKZ9Ypq3Dr27HWLwJEBb9y0QmIgKF05SXq8KG1GPIJ9GDL/MR717heAoyHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XAtTnivV; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XAtTnivV"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf446681cso10194565e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744985657; x=1745590457; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fwq5+n4TNOnJLSHAnNrr28KvD6+ZPBpkE676KvwvyKw=;
        b=XAtTnivVR5cDqWBOxE9AQxqO8CBsM3dMW8/eRljW/Y1wg8ulzlXbcyiEv6ktrPZSAF
         zuaDWJ8FY6A7n7mMefZukmjALERpRUlHuJTSShDpa1kdY38eXxhiDPVYMLdSBRoXPP3Y
         ZNHGWtFTkN1ex6my4CDoSR6W/KtmZsLV+JsMuNilmzucqubRCnV6N5/4inJxr73SIBx4
         MT4aEtWs9i2H853NdX3vJjA9TtEgvDL9ZM8cBsTLeLQtZ4g+HwoFdHglvyoZU7Stldj9
         D1r04n37wFrrHyPGTYPatLJCsHMgWajee/bECTPcIVnB5fQjI1W575j5Cb/W4dCJFSDY
         uPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744985657; x=1745590457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fwq5+n4TNOnJLSHAnNrr28KvD6+ZPBpkE676KvwvyKw=;
        b=j7sgH8xQCmlW+g28pQTpbdbY3dhNZ2CZpIAejPDWzmvqYjDwHa9ILWJJWWbjWw659E
         ZHLSKtHrpNJFJEKte6I5Qp4qaTlmJv35t6+APDM9A9i331+jesms3dKDXClF4H/2gko6
         jJkl3OElKqG9eCEbwt05q/tbBzBTDZ7rFiHsYb3VwMkP1s88f22D52fDzMtySw7nNrRo
         8DjZj/7G2W7FA180AUM5NsDsDs3etcI+8I/8PZE16AlKsJsCX5KpLIz1qL05g2QlixrD
         mn2rr+tLAuL/oD9JUIvMq4RXxNKVr4rIbINqVL5maZBq0z8a5N6S9NO48OOLn1exhVfY
         eNyA==
X-Gm-Message-State: AOJu0YwPKZQSGxIml6kRj4g8ZG51qGVFLDqbTgxWY96ClKntERT8YdFX
	BhybO/+cBr9OdstwkKNG6zJTZ3Cct6NKsvnPtn82GY6kfTJ1K0XnsJghPy3w5ptSYFaW/l7hPhy
	Pc0RYiSnXLRCchAEVP2/V33fam/RIazmQlMX/R4ZMqBaF+7QaKqXCmLPSWVIDsnHc37rPWmdpNq
	crqOoXjcsamiyJNoq+1AFdSbCVREFbhw==
X-Google-Smtp-Source: AGHT+IHQmR0+d0SQj+FIUVGlBmX/KKxhLHvpdzBymx/b4+HbD3xXpMpSHJ1AAbFfWRrXjjGskSBwIeNL
X-Received: from wmbhc5.prod.google.com ([2002:a05:600c:8705:b0:440:595d:fba9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:47cb:0:b0:391:4674:b136
 with SMTP id ffacd0b85a97d-39efba5c519mr2112808f8f.29.1744985657393; Fri, 18
 Apr 2025 07:14:17 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:13:00 +0200
In-Reply-To: <20250418141253.2601348-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250418141253.2601348-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=717; i=ardb@kernel.org;
 h=from:subject; bh=QeUiQEC4SC9V7bn5Rj098gGbfj8IuyRML/M6fUHi+QM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYMp9t2rMxZpvq+mvHSYFMW+40lNl3Og3P+LTUyPGLIqY
 p+uP2zZUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACby9QPDT8Yr12/eyoya5nby
 pvoLjSkXVnAGPrpSbeWa6LVjcsGV5f0M/6z/9tlcaj0Tyt/6V2BFpdafBKVr7z1NnnmrCaTzPGj ZzgYA
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250418141253.2601348-14-ardb+git@google.com>
Subject: [PATCH v5 6/6] x86/asm: Retire RIP_REL_REF()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org, x86@kernel.org, mingo@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Now that all users have been moved into startup/ where PIC codegen is
used, RIP_REL_REF() is no longer needed. Remove it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/asm.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/include/asm/asm.h b/arch/x86/include/asm/asm.h
index a9f07799e337..eef0771512de 100644
--- a/arch/x86/include/asm/asm.h
+++ b/arch/x86/include/asm/asm.h
@@ -120,11 +120,6 @@ static __always_inline __pure void *rip_rel_ptr(void *p)
 
 	return p;
 }
-#ifndef __pic__
-#define RIP_REL_REF(var)	(*(typeof(&(var)))rip_rel_ptr(&(var)))
-#else
-#define RIP_REL_REF(var)	(var)
-#endif
 #endif
 
 /*
-- 
2.49.0.805.g082f7c87e0-goog

