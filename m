Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A442EA47E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945356; cv=none; b=iFA8sXHWmkepnIFQYtSwHGmSAJ+QorOAPzj1bB8W5Ls6bdu0HKSntaUIf/4RnDsAiWCsFSlc4VUKSyzlSdEQUlTWBR5KXRavqd/3PVqk0+kBCDd62KGPfFLsmaUvYOcCrv0BRxNw8XlyZK62jsigoHhr1YpFRnmofHg3fsvlPAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945356; c=relaxed/simple;
	bh=w15P/PQBicPWdOby0zTbVfr+DY+39BuDdIlOJm29TiM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WOBF7u4gYh6Od+htQlXuGp0SKHqfaf2RIc72NQc8ZygmKWyeJGc1040ajm6Srmtq+jMvt/yzcqJKfD9RPhWU6KqVvUNDULlOseV62p4K/7r+XZAdym0sotVtjmcerw2P/h3lYh4Y4JCfWrgj/4UZBnp9KXgpRk3eK9g7Km09phM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KTc4vahT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KTc4vahT"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4537f56ab74so6567435e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750945352; x=1751550152; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hl3fNVnAsDqURU0FpEqnT2FFnl4Elpb08ixBMdGUI4M=;
        b=KTc4vahTg7iEyEcJUleLcOsjZvpJ5COtGcRfgiYiOqQ4+XR0RBs2bnAJpeGuss5kEN
         7/znuhrvwldyb9iUx4p1TLIxR7cdHBfbUJe9NJPKw+YwaVIbMzj81o7OAHvK5c8Wkb1i
         GbAYzvwFf8YPsDx+0y8J4ChAk0uM3uvP5fr/OipNXnQkV8vYWKfGy7sNS+2q00KXVmmg
         DWrRwIJ7i8QOh0aaUp9Cv4qj69HK15pBNeTC7K5agO7PfipM47u4I2G3LOQrIkAnkdY9
         7GSdiL9XHRSoST/9vQi73LYDYfydRryDIfEAhD38c+AN9aT5vqTd4pSbxn8cc0hye0Py
         VnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945352; x=1751550152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hl3fNVnAsDqURU0FpEqnT2FFnl4Elpb08ixBMdGUI4M=;
        b=Ij+wG/IBCvs4qSZGO+uDp53D5nRYK5kCgZiGDUPOZ5e885WhWOsIv5wIBjorQhwiUn
         AYPsmy+ocMZ1/2pyLtquisFvZnA06azISdVzQ01XG6/o7b+l2FXRI8zcixciR0GA5aUt
         5FHwRCjtqxdwfxaiV0xppyU+DIDciWjWiBGkbVrNc3C7+LmwaR+36mecY+qw/PkF+pHw
         GWRypJQjWPacqg71zrrTEvsJKxa88uVzp96+v14KGhLQc4gFR1C2p+m1zpW2I/zesYzx
         1pveVepDVfUSCZziSxF1x/5bVHHfM83BcThdgFJ9/Ki96mtIg01CFLXIKQQiLvl3aFG0
         7DDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9lspF2KEaxv0f2tCqfGGqB8uZNNvygZ6H3mBT5MeBiFBnhuJR+/QgJn42p/4zk47CdrLq9c9NqAEHf3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnhkDawjLIEfSgSYBHOtBGaj5bKFCDFKqMsxeCgufwTfyR1i3w
	bXleZdsB6hcP/DWbiqPvnPg+qD41lNc/70FFUzluW8BfItkFeb6Zz2yHgS4sE4bOChH43ezPa+P
	EU5OBZw==
X-Google-Smtp-Source: AGHT+IENWlCXe8zC3L+/iHXjmM2xaIYjroNIQok/FPBEWl0gkEtFHeIYnHyQb7vvDlNbdrCSTkiUDCFE35w=
X-Received: from wmbej3.prod.google.com ([2002:a05:600c:3e83:b0:453:8ab1:7b7f])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3590:b0:453:6ca:16a6
 with SMTP id 5b1f17b1804b1-45381ab7e02mr85008665e9.10.1750945352580; Thu, 26
 Jun 2025 06:42:32 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:41:58 +0200
In-Reply-To: <20250626134158.3385080-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626134158.3385080-12-glider@google.com>
Subject: [PATCH v2 11/11] kcov: use enum kcov_mode in kcov_mode_enabled()
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Replace the remaining declarations of `unsigned int mode` with
`enum kcov_mode mode`. No functional change.

Signed-off-by: Alexander Potapenko <glider@google.com>
---
 kernel/kcov.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 1693004d89764..62ce4c65f79fa 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -951,7 +951,7 @@ static const struct file_operations kcov_fops = {
  * collecting coverage and copies all collected coverage into the kcov area.
  */
 
-static inline bool kcov_mode_enabled(unsigned int mode)
+static inline bool kcov_mode_enabled(enum kcov_mode mode)
 {
 	return (mode & ~KCOV_IN_CTXSW) != KCOV_MODE_DISABLED;
 }
@@ -959,7 +959,7 @@ static inline bool kcov_mode_enabled(unsigned int mode)
 static void kcov_remote_softirq_start(struct task_struct *t)
 {
 	struct kcov_percpu_data *data = this_cpu_ptr(&kcov_percpu_data);
-	unsigned int mode;
+	enum kcov_mode mode;
 
 	mode = READ_ONCE(t->kcov_mode);
 	barrier();
@@ -1135,7 +1135,7 @@ void kcov_remote_stop(void)
 {
 	struct task_struct *t = current;
 	struct kcov *kcov;
-	unsigned int mode;
+	enum kcov_mode mode;
 	void *area, *trace;
 	unsigned int size, trace_size;
 	int sequence;
-- 
2.50.0.727.gbf7dc18ff4-goog

