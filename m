Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F88283FE8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749591777; cv=none; b=AcePKAgpU20fsfQOy/BnajQig7uoBhezOQWR8axdd1OscLKR8soDW9AwV+aUHj08iam9pu93q/wl+OgxRKFLGI25JRY48KecP5i2wxPor2JB8crubtrRWQcqX5pJ/j5olGfb8O1HyeAaW5UarBzSZH8QkBf8blYb7bV4TWt1JGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749591777; c=relaxed/simple;
	bh=hcoENWhn5MN9wwXN8slZpVRJSR1eccf7myfW8wT7m7w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aIgugbbdkUgBgUdv8hOjR19nfqvMmTSrfLeOmTyqYCIvK8mcu1FxNQIsFJiXQVYpBvqBqC3EMQEh8ZTLUGF1jHNJ4j1pfYudX0W22XmR0O4lMMrp2WXNeFcrrEsLLZnQ2prodFTr2o5UGvxrLzjg37y/c0Oj4hCsahPPPTOFr/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j2xQIqS/; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j2xQIqS/"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ad5271a051eso519240466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749591774; x=1750196574; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+51TcaaiRkzim5mdpfrlRtRnh2VRh959hLe5exrajOI=;
        b=j2xQIqS/ZFw3zrmsRJqtVrCDn0gn6DlvmcIaC8H7QvYC3h/taqO9aEdzynIHUeK+Na
         0wDgAvAjLcAnLmECYzBiHhhG/yaiEF8sf0Fa84SBCX0ZPBZfisXkUfpoKP4kwdy7sH0s
         ZbD/eWKokoORbU6c34F+QDHv6rXWqNLOSEgqhZ4KYGmfb5Ak6a54i9aAy5vf97pXLQwz
         XEjEcO6wzRPyQeZD76OIMdv+05GwGYAXGpPxg8pH4O38NeXypmWPKOf+BBaz5ib3UAL7
         SAYZdYK81itg13rrFRA+noTiZZqNgEGiTr5kGRKFsvj4uMr8vtbJ28FCsKdXHaXAxHWa
         xEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749591774; x=1750196574;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+51TcaaiRkzim5mdpfrlRtRnh2VRh959hLe5exrajOI=;
        b=jcVFgVHEjQRQGhLfjU+Y2TcW+XVVT22EzDJVndTH1uqXbgpMSzyBDPY6zI2PCgwrGW
         LffhI96ntedrwj9Vn41wJUwJo0zSlY5YrSp/kkIlo9Fl9NIatOXpyKgG6cmolijeu48G
         X8uC/7VtPF2vnaNNRZvNS00rMuTVTEw13Q/h1Pqc8zXox7HPKdHGzDcBAsnF+msNahXb
         y9AWRWPe+VG1dqLCqoG70PiVtn3BLXZL/Jq3zjIzgxRZ9/+ikVqozftdm/S1dd5NCUV4
         YW+cA/8o7WVAhyHdGC3v0ow3Z0qbIW1f2zP1vOMmvMfUsRxHLNjLVH06k5eLrwCAhE6z
         iByQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOhZIqo/yS8GZUMXFi7fIBXpRARDTu3DyWyMioUplfUZZIr0u6+CRRs3X14trNDD5ik3CRZ2u0fItQILg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPnE7kvRPvOBg1uQfIbhAjCdhDArPuwt8XkL5pUzktqkjGiLCc
	OjN6pyPy+V25VfcbQ8UiSOXZalY235+dX1yhdvTjy5yu8sMTFg37IxVdZLSZsrpEdafsXDyJUqB
	HgcTBS6qFpcEju3dD8IIdmg==
X-Google-Smtp-Source: AGHT+IGuVLJitUdXLEnYw2iyQT1Lpe74A1nxzehAy9ugVQaOO2+vbGOHCc3uxslH10AJPCyZD+89036dGEiMRElL
X-Received: from ejcub13.prod.google.com ([2002:a17:907:c80d:b0:ad8:8cf6:f277])
 (user=mclapinski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3c84:b0:ad8:89f8:3f51 with SMTP id a640c23a62f3a-ade893e1a27mr95388866b.6.1749591773976;
 Tue, 10 Jun 2025 14:42:53 -0700 (PDT)
Date: Tue, 10 Jun 2025 23:41:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250610214140.2775339-1-mclapinski@google.com>
Subject: [PATCH 1/1] x86/boot/compressed: Fix avoiding memmap in physical KASLR
From: Michal Clapinski <mclapinski@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Michal Clapinski <mclapinski@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The intent of the code was to cancel KASLR if there are more than 4
memmap args. Unfortunately, it was only doing that if the memmap args
were comma delimited, not if they were entirely separate.
This change fixes it.

Signed-off-by: Michal Clapinski <mclapinski@google.com>
---
I would like KASLR to support more than 4 memmap args. Do you think
I can just increase the MAX_MEMMAP_REGIONS or should I implement
support for the general case?

 arch/x86/boot/compressed/kaslr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index f03d59ea6e40..4aa9c9781ca7 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -162,9 +162,6 @@ static void mem_avoid_memmap(char *str)
 {
 	static int i;
 
-	if (i >= MAX_MEMMAP_REGIONS)
-		return;
-
 	while (str && (i < MAX_MEMMAP_REGIONS)) {
 		int rc;
 		u64 start, size;
-- 
2.50.0.rc0.642.g800a2b2222-goog

