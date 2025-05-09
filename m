Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B90227605B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776843; cv=none; b=iaBQiYnzygCIlzfBoyye/cc/ctjIJU78b/Z6ugv0DalGiqGKOtFGZe95DsDJ3uH1YxK9kJulMLsydAa5My9IAumvw+VnDqAIKEXVb0yt9uNKV5W2QOQxiYQIWAHWkAMJmvUAwpHYy5bk2toT5k2jkar3i5xiDNsG7+e/w1v0Ppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776843; c=relaxed/simple;
	bh=kSKKgY850CX/ifrD5dVjlw2AkivsGza0IeGifE5IqhA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AjslHtgyl33C88dUVsIYxsRR+5v1ofOP2/onslGISei5OZd8cG05vJ3B/LbsihirfOyhr4jKYIAqxfwstjeTY38Z7ZMO9ajFi/Mnsq4qdJG35dFkgiUGav2qgHJI16Q/mM31RdyNV7IhasxRIyhIkjiw4b/Sot0vTNpHNNu8D3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DUmcRCL/; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DUmcRCL/"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so1185600a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776841; x=1747381641; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTLAwJfpzTnDn2tZfb8KpMGtzN7vq08hC8THCvjwurw=;
        b=DUmcRCL/eY9FVGa9L2ee8C7kOWdNpbg/gcFN2GVVmw18LjLnNNkhdRvkHWBuPKz9rq
         F15bd2iFalMyw9jb5f7B6iV0/m6L/UlQZqCEtFcvPJjJjgwlry6HZGKeWpvhYiFHLHMY
         oS4FnuebRTvocfi+FGrAJE8JtobctZEs8Dm/+NMZzAArfof6o8pwHb2sRDtsx6B+YYS/
         mluEhFFkxDB6A1Xzk0ZZSQ5pPWbEMUzDy16OVjqvYtpGXSxnVwM9Qb+f6jwREkFTNnKd
         SnXqvELAjSj7j6dGt6hM/txNgtcxt/sU1pPFDiVxJ4I4Ss2NTbiueEwQFMiUPk/qRc8t
         M19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776841; x=1747381641;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTLAwJfpzTnDn2tZfb8KpMGtzN7vq08hC8THCvjwurw=;
        b=qeykF84LrD4ADCYb/kB94HroCuemEEjTeyldn6gKH3w6GvDQDi/z7jAFx07WolRA+M
         A35HoKv7MP/NlkHkU7QXuFwK6S7BtJqviOh6Yb7fZCohyLJV3tmuhlOzT3W5wBOL0c1I
         JlEAuG+YNZcYsNL8PNEup2YK7UgbgTah8b4SViE1+G4/kcT8jxfqMfD1angnjr/74ro3
         HHHv86EGL/uR5nwrjGjrLMIwpKv3XcsPwA38nyZ9hpSWaoJ2BVgdsoxo6kYxCeQ6OqVx
         NJAc0sAMRTflwIMsNFyrvfyPyxd23ZhSmVK3Gd7i4tZccjpTXGMUfisZ3dvRHoDKcL6/
         6aJA==
X-Forwarded-Encrypted: i=1; AJvYcCU9zklR7HiJSBKY1IQSXaf6EM0pJqoxXUIv5QMTd+EyVpmVhr8DDbWzyetatsztY/McSihuLCxfkImAxWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDW6Xe3yoIJrba3gCXbCVh72SgkRooiEORkIGYmBIf73J48BB+
	zNHxvkKZ92xGb/rxU4bKKRGAxCvg0g5AHcYK9Foc/WRguHWw1+vjVcsXqPblgQJPO0tRhH43mYh
	uEUM699avOhHX+IMBOQ==
X-Google-Smtp-Source: AGHT+IEztQLwT7ajncZsBNt/V8Xiws9Mgn93m4FZrCV2u6FrzGGzzz/PUz6yE5EWUGsiWeksHLXg/JFNc4GUnrxd
X-Received: from pgmw23.prod.google.com ([2002:a63:9357:0:b0:b23:6a88:a54f])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9004:b0:1f5:55b7:1bb2 with SMTP id adf61e73a8af0-215ababa2afmr3522816637.6.1746776840848;
 Fri, 09 May 2025 00:47:20 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:32 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-15-changyuanl@google.com>
Subject: [PATCH v8 14/17] x86/Kconfig: enable kexec handover for 64 bits
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
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
2.49.0.1015.ga840276032-goog

