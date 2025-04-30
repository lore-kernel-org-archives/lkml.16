Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC521531F9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991275; cv=none; b=i6SRziEwWldxFjgQroTw18VqQRtd9Te6FE6m2io28gqH0kkl4AWbXIPqPpIThcokg0aUcWyYEWE7YXlQM4lw11C2XppHmubs/11nnF0/fRX45RqdT7pDRbXc4FSf1TqOYY/KvIgMG5Pok5MlFHR30x9OTXZuy4mVT8N91zNHHno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991275; c=relaxed/simple;
	bh=92lUes7XM/q5xT2OTQHGxPHhNKCZGbe9vSaSuuTkEHo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ihhb6H02hZdC/E8L7axmfK8FXogYGiNbUWrVlPRiahRY4JFQIkfhf2kKtgA6WC4+1dVHMdy/6QyuDAj4/lxSUMgtVEvV4CylEpWwo8ThZx43KsiU4wXn6YyzC8PjhlbIp10uSVfbqyaa0D6JE1ELHZ+N5mR7jcY0Ta2Q2hB6TCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiayanli.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VoOzcVQY; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiayanli.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VoOzcVQY"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b1f71ae2181so800819a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745991274; x=1746596074; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=557JNh3sFFdDHMdmAyQM/4hu66WvgSD9XL23VhL/2Os=;
        b=VoOzcVQYyKQGI5mfzLtuIKFjHtKcDLhgeNn6XIfiwbrv7axgYMvIZWSTeQJq1ocUHg
         PrT9na3fBnKfIE23DZFFIfJwkT4mrIO5Lz8w38CZZSdnqsY0YtnChg2rKYZq+qF1isad
         Xwade86NGATNIb3qRo9d6U5Jk2W6tDKv2ve6PNabnjs6INWcKYb0W20qQQY/Jf/HBLWd
         LV0453FWgGQkhSxWM7LwSAaR3hgSOMZB9scnDh38dQRI6dVRradpEuzgHIMzU0Pevh9c
         U7rD3fCvmlxw+rbx6Guk9vIQpyvXcoMK8OhOrDGDA0giv2BsGEw5NtalNpa2jX26Aq3l
         VkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745991274; x=1746596074;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=557JNh3sFFdDHMdmAyQM/4hu66WvgSD9XL23VhL/2Os=;
        b=HI7/wn89o+3yhx+tIJftR5gcJ6W7tCGfDAIsdEUciZq1EnIA8bRBw44/DkGJApBfGU
         Gg5Cw6zfI5LYlqIDPjLbxMLiwwKhJzuWZNB8qNlYl0JXCosaMj1UUMHTu6ngLjRFasxC
         /JYyYJilWOCRlo3MMJm6eXe8BB8rOMOIccjZ6KCUCj/2JpeW3Vib5NEJmFOAP8JPBGjd
         uExuPQshhGPKss+drcBsQJ1ieAhZ4KA3sQQjvkmr5eodLpczW5HgBhirc1rX54VYP8Sv
         zRAa5QwlfM58irJPYCOsSVcJrEmRus/B2O2UMNcMvT9S+znWcDts1rVqdp5opRU+4YqB
         IC7A==
X-Forwarded-Encrypted: i=1; AJvYcCWCrd5aZPNoEj+LPOpttmXSBy0rERKRa87nCtSnVAHaKnOxlwVP6G4yYKHSqyQrnOkX6OwkE/weFQwmomY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPyTWsF+bDdbO891/0obWZ9ykngEOceXa5k4PMDexwJoy5JyYW
	/IgxgW8TldGh1rWK9SGc7OTEVjXGiI2wrLZwXOz4BQfott1BVBx4KwxQP/oeKJ5bVoGab+PQ4D/
	ykCwceUyLlg==
X-Google-Smtp-Source: AGHT+IHyp3akB1mNS8cV1sqfraK817e8968UBZwcda1kNq+ouEKeH1y7xVUyRHGRrBBCY02F3b+ySsZR3GhSjA==
X-Received: from pjp11.prod.google.com ([2002:a17:90b:55cb:b0:2ff:6132:8710])
 (user=jiayanli job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2dc3:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-30a332f6f5bmr2706350a91.13.1745991273730;
 Tue, 29 Apr 2025 22:34:33 -0700 (PDT)
Date: Wed, 30 Apr 2025 05:34:24 +0000
In-Reply-To: <2.49.0.901.g37484f566f-goog>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <2.49.0.901.g37484f566f-goog>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250430053424.77438-1-jiayanli@google.com>
Subject: [PATCH v2] x86/microcode/amd: fix the return value when microcode has
 no update
From: Annie Li <jiayanli@google.com>
To: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Nikolay Borisov <nik.borisov@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Annie Li <jiayanli@google.com>
Content-Type: text/plain; charset="UTF-8"

In commit 6f059e634dcd("x86/microcode: Clarify the late load logic"), the
return value is UCODE_OK if the load is up-to-date in amd platform, which
leads to load_late_locked() returning -EBADFD.

Add UCODE_OK in switch case to avoid this error.

Fixes: 6f059e634dcd ("x86/microcode: Clarify the late load logic")
Signed-off-by: Annie Li <jiayanli@google.com>
---
Changelog since v1:
- Change the return value back to UCODE_OK and adding a switch case
  about UCODE_OK.

 arch/x86/kernel/cpu/microcode/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index b3658d11e7b69..2309321cf6a19 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -686,6 +686,8 @@ static int load_late_locked(void)
 		return load_late_stop_cpus(true);
 	case UCODE_NFOUND:
 		return -ENOENT;
+	case UCODE_OK:
+		return 0;
 	default:
 		return -EBADFD;
 	}
-- 
2.49.0.901.g37484f566f-goog

