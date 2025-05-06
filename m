Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC923269B08
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525182; cv=none; b=SAMPlHGWlfzLaaEekaSsEOu6qs9Dcy7XoOFYpfz5QTzVDfY8R2DJ8vkwjfhrThImFQkyIW6ibzPcK3FUAhRAbB846CrrWWxish/is6DPc9RRSHB4Q0E4Jk00FhAOLlWtEKJcUE9c6wzYgH7zzfup3sY/LdY0ZAJ/o1YJPzfHw30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525182; c=relaxed/simple;
	bh=CbHRAffdNjucoHpZXlzmBTKwF5V0Do7COpLf3OhpD0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZTL0IrDewlJcBJs6gaS4N0onjYgErWpcEv5bY/kOG4KjPLoLtpc7jav3rvf2x8351dGh1hxN9Etg+9469T2IWdD9RfcTSZA2jgCSH3I0aZy75eNVVbKJwjUYFx8+VI3jvt+kPGP/6acJfz7izuI2ZbQhSKyDTFbN2euLKOl3Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RXqv3cK7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RXqv3cK7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so5421035e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525179; x=1747129979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhaFKze9VG1/eFCN9G58dM2RFBh4W36ZYcYCtz7qr9g=;
        b=RXqv3cK7rRFChYbgFdR43xbzz/tnvAGl8gWurpyzVTyR0O1qtiEd1TfWIc3Pr6pjqV
         6eHAfCEZ8d8vMMQEavhveavR6khIB7Kc0gKp0g7bOZZGrC8xjMOSRqaK9hRj1F/uMCkt
         3I7S8hVGdg4orYl7PVIRl026+dO5TBeZ9qOwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525179; x=1747129979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhaFKze9VG1/eFCN9G58dM2RFBh4W36ZYcYCtz7qr9g=;
        b=JTxlGcZgspvUZcin7mtZ1tja3bvtPM3IDthgXnqWp+p1ZfF3LiChjURuW/KTCf8VLa
         OJxFaun/RE9FgdB17ALAD7PAJlSbdnscoFa7W45QgKiCAWHSiVeRJz70fHDAkMnP4/3g
         WVcmVWClDe5VbY34AqpQKRE7mmuQGAeQqtipkem8sPClJ3qK7lXcdTjrOk8vJQ/wNKDz
         acmDr3haV1/PzHuPSQcGaBLmafFbI7MQrbjujvzc3yNu6bymQjpmaoO9sMNT9xlm0wy3
         6nYZv+gZ+/yaIpQZH2kYQxR/PkVFNsABXZF2Flq+jyUFiRXxsrQH38Ts65enfryqM3Im
         f8yw==
X-Forwarded-Encrypted: i=1; AJvYcCWd6C+cCn29Dq56xl+/kWO4Txdo5RG/Q7aN7yIDH7dF0Te1iPJm5Kdrv8VW0KYVxLZSTAqFFK6NONnP3fQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Vy6Q82pMsoE3p2Ht3py2tHQpv2766qGxgcNWUzEprnIoCeQI
	0wo0Qt89cWBlFFIaD+tgRGtabHepFbGiNS7RvWujuYv1n48kz9mO8ZCX90sa4g==
X-Gm-Gg: ASbGncuBAclNW+oz19Vp6FnUOeuDVidxU/LhGlXHfO3NF8EsKe7Nq1bnlhlUbKixmBS
	aqqVnWWT2phk0KrdGbrxTcFfeKUCAIyFhZ/5kpg6cIC3gh6zn/2uSEjI2Th4WmOCrzqwKPt0/5S
	ge3qniz1BJ3LymXc/hPwEcXBbVfVfKnujNJ98KdkGw9pcySISbhjKpsTPrOFU7zMmTqLeaDbuj7
	70FwsfCeJRCV3Y7dBHkvJOatk35QfpD9KCv9vybdf0XbuS+CcaAk4okSKGwOPzulZOAiVAAsi63
	8YlEgrksMXFImNaK6XlmbvC7VoUz7xYmjxLkfUtFHLgOwWA4S5N0eJ45
X-Google-Smtp-Source: AGHT+IHeK+dFXjh9OrxfzRPfPF/LOpOuNNkj7QNpkKx/cJ7vvnj2X+5i334G41Ez0rqAejsL1kXepA==
X-Received: by 2002:a05:600c:1382:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-441bbec38b2mr52734125e9.3.1746525178968;
        Tue, 06 May 2025 02:52:58 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:7196:3093:b0e3:1016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm12879860f8f.44.2025.05.06.02.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:52:58 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] mm: fix VM_UFFD_MINOR == VM_SHADOW_STACK on USERFAULTFD=y && ARM64_GCS=y
Date: Tue,  6 May 2025 11:52:21 +0200
Message-ID: <20250506095224.176085-2-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
In-Reply-To: <20250506095224.176085-1-revest@chromium.org>
References: <20250506095224.176085-1-revest@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On configs with CONFIG_ARM64_GCS=y, VM_SHADOW_STACK is bit 38.
On configs with CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y (selected by
CONFIG_ARM64 when CONFIG_USERFAULTFD=y), VM_UFFD_MINOR is _also_ bit 38.

This bit being shared by two different VMA flags could lead to all sorts
of unintended behaviors. Presumably, a process could maybe call into
userfaultfd in a way that disables the shadow stack vma flag. I can't
think of any attack where this would help (presumably, if an attacker
tries to disable shadow stacks, they are trying to hijack control flow
so can't arbitrarily call into userfaultfd yet anyway) but this still
feels somewhat scary.

Fixes: ae80e1629aea ("mm: Define VM_SHADOW_STACK for arm64 when we support GCS")
Cc: <stable@vger.kernel.org>
Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf55206935c46..fdda6b16263b3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -385,7 +385,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
-# define VM_UFFD_MINOR_BIT	38
+# define VM_UFFD_MINOR_BIT	41
 # define VM_UFFD_MINOR		BIT(VM_UFFD_MINOR_BIT)	/* UFFD minor faults */
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
-- 
2.49.0.967.g6a0df3ecc3-goog

