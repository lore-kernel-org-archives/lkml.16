Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D90D27C85F
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140141; cv=none; b=A5an11XzX/h6kK7VE1M9tyA1uOUv1Z1tEAQrC/f6pGyhtRjgTJUn4YfG2Ts6aas9R/3BUE1llpe0dDbwdauQJe0MZqB5g+KOTRKfLEf2vAwMDpdcAi6u3Xj2l7XN01uYiYxeJ4CiMq36jcT8lkYImlwy9WOILF/otdaJ+Tr7aCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140141; c=relaxed/simple;
	bh=CsxLAbbxWshFp9zlTp2nRf9fDopWRYtGfolxlTOVHic=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AX2Sq+SoGW6Rx3Sv/m50ZDt+iqQmYfBvN6iaA+PXTm6bO761kx67XZqMNpWKCJ/P3/1U0m3ezv57pRvrot46LMsl50IMJzQTmoF62l71jhnpmDzkbkpIpUOBdAzxgzyu0KxU+BVwh5Hzdz2O/G1k7Znf6ZPqGY/zl4xgTl66l00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D86EBb8Z; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D86EBb8Z"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7375e2642b4so1019481b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140139; x=1746744939; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujMS9iWtpwLq4M2KQ3ZYriDJ1LnUAH7y3qXjsm8QUUk=;
        b=D86EBb8ZrS+Lf3OKK8GDhrq8e5nCJZyzZxFMWnQ588SHYgQRZaUXa6LNy6hGxyDa7W
         hHyKNbxS44weY88cSqy4WwgxzXLZVqo5YQV+CxtzLAlc0CvWiCkxmS5t9/tsHkMhOZmH
         1kWUaD48PMWE3BXbdWr4ZPPul55fCjWMluw7z9705PZxbp2le7ITaP36kkWGJGLT/nDL
         OMcAGUjuhR5OKiuhdIFK5EiBCxy7qRc542jwYbDRPLxqtCF8bzh7jlbnKWky8zjjT/+0
         7hHl6kgbjugNjE6y+wTWddzZ15H2heu2Xay5dRPLsd44hdYPZHMptI4MEPxyURC3QjNS
         WnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140139; x=1746744939;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujMS9iWtpwLq4M2KQ3ZYriDJ1LnUAH7y3qXjsm8QUUk=;
        b=g4FxoAY027E7zcrb4BdbQ+zd35jFN+A4Fwo8hrmEqLl+LeEhMKj8MIMCApKOQOepdV
         woHhmSxNe+0Bn57LTx1iBlPKR9+ZuJ6EuRsB5mUoiq+EskPTvqoJPzZyuVkNn5Q7wyhw
         nn6YTd4FaHCzDDFrfK9V5w316zAi362+8ibDGotgFhCSEyoGLaY0Ri2XJ7srTu3+C3ET
         xvWQGEwk/BW5hBrfo8TmBS0tjj/GdZF4OsXLEYXit/x5s7PhoIJH7KdcNGGm93KHi9ou
         8J+8trVUiR65YhwwDvFtoQdbsYz9qohC4puwhaiCD2zNFBXAS2PFe2s1qNSL9CqVYjI9
         pF3A==
X-Gm-Message-State: AOJu0YxCl//QBpyzdZKn2vJ20Dhseod4JQuU0q8OiT6kmOeslLkyxkmd
	ftqyuV5hVE0Fg5NgvwzKo7jOdvTFHDWUshas4GXuc5jBhOwxrihKvIbIfgJIJxdOpxlgnbWDsdQ
	1cPVQaIxzRZD2eq5CPkwc7I1FQlFk2hsajv60UJCbCifNH6ZA5dbMEOvn/iSd52lG4H1267fRxg
	Ha+sZlG1fj+nZEMJmRPksrSNE2t78BHpiXX4nojJB0KkznF0M8jWDXSP8qxQwm/g==
X-Google-Smtp-Source: AGHT+IF0oG06110pxn+L6jvF8pwIbpphgmFF02eErozRfp92F0qjSunMQwPjNURzgPwihWmQXAZuVLeHG4Y3HL5X
X-Received: from pfay11.prod.google.com ([2002:a05:6a00:180b:b0:736:e626:2741])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:ab05:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-74058a24c08mr880321b3a.6.1746140139284;
 Thu, 01 May 2025 15:55:39 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:22 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-16-changyuanl@google.com>
Subject: [PATCH v7 15/18] x86/Kconfig: enable kexec handover for 64 bits
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

Add ARCH_SUPPORTS_KEXEC_HANDOVER for 64 bits to allow enabling of
KEXEC_HANDOVER configuration option.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4b9f378e05f6b..d1fb81ffdaafa 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2029,6 +2029,9 @@ config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
 config ARCH_SUPPORTS_KEXEC_JUMP
 	def_bool y
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool X86_64
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool X86_64 || (X86_32 && HIGHMEM)
 
-- 
2.49.0.906.g1f30a19c02-goog

