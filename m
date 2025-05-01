Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858762777E4
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140122; cv=none; b=awHGLIbMigw6nqaTa90cVcLmsFe+jyTpWLrinDpv0P92mrDuyWmoxwg3hgfsPqitjuo2Nhsu/G1Cv4Ow2p1mb/balMaHi361kkW+nj+nVkmvt53FHdf6sK3RGVN37y1VCUVWowPbWLSZ+LUUN/Rl8zehRiqu7svUjO1kGXABA34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140122; c=relaxed/simple;
	bh=CflS9DpX77LUitaO4DYZ+bquWY1oNNmLL2exIL9Urqg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BstPxrbAJwDgu+nM9K8448dMQZzq5IFbzh3pgMpQXIV9CoONl03iuuPHue8RDmZCThuNd5ZV1ijfKMa8j/SqN57k7UAEEliP6fWkwPGhQZWFEH99zZ18+0q8hHxMdtOpdLpD633ptXTOXgFrDKhOpqNMR8VKcBNUATNE4LTubnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dQgtku8+; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dQgtku8+"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73917303082so1023876b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140121; x=1746744921; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yI2HlkyQFbJOtIn7U2Rd16qUG9dEmKYGc2pG99S8bb4=;
        b=dQgtku8+GarSnyx9JQkZrOWuXvBe/e5v6RlKqjI1OgfxO3gMGHX58vKd4KqjUWif5o
         CreG5eMs71OEh9bNOaqEOSiEcCYLIa92BjkDXMNj5yfTyu64sB148+OLo6Habf7JNedA
         IV6SoXNj74wHhQa1zKCRytT4g6CpH4gaWTRRd6JkCW89SG6VbAPPwYo9kBj0t8w0g/cO
         Y5vK0xU1UfCkhiTMRUiGbsNmy+AnOgnC8brmCiwG3JN1BgBlYDl8oBseKMVdRXD4X4Om
         Xym0HcsEQ2KEFxzf/eDdtXiq7Ge2EKy+3mz6MukSkjuPB+Z2somFbf12WxsCjpJ3cnwg
         eQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140121; x=1746744921;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yI2HlkyQFbJOtIn7U2Rd16qUG9dEmKYGc2pG99S8bb4=;
        b=MKHi88WT4wVL4ZrvqRDPo02tJhJMlKF+EfIvB8tfd4kP5KafHgtjiWlFNbZSfPfyWN
         041p5FmsF/t3+6jtBF45tNyKZXuY4L9CImVyKOYIXb/Hw6bbmt5Ki1+CMS7GLy4N9sxn
         rhJV4qaTxbzTHaeYl/GZE6O3yAjD9sG01Es420GpVpfyxoZ0Z4ErnG6HY80rIDYkMpmn
         sO2LgNffqs5bd07gn/4c9G+0kMeOtUZGMfKis9wVsXF4+illQnQF7MgZ/G/H+t1cSNMh
         sIa8R2EYpOM9oI9JkccfEQdx1wUFCQid7VqarRy8sUSV3RIJUzBU2EoMamEs+Ykrh3wu
         4MSw==
X-Gm-Message-State: AOJu0YymkWV4AJHdgZgl67zOrxBtKQXBvQtoLcwTZC4xdyngwVijSmRg
	nZYV/S+6oOWJxJ37q+3Ar4vZwVtnhBO6L/fLM7hvVu/JQy/nn1zwRCy+bAUFlH8sw04PXljGKCz
	E5V30RPuUe8hA+xrIbXYF4QohYTo+Px0BhCHync2F/+cpfyFn0V2bUcgjI/nNoiR/xlwnyLyA4G
	R10WJBbVWHZayznUk3mFxOm4FXAIf6P/imi3JvKw3397rKSapL4xTlzQN1tVM2NQ==
X-Google-Smtp-Source: AGHT+IGmpHhKcBDrERp6231eQ29+jikWpthUas+M8P/VxY8mf6RZUuVX69nZyHTF3KiG68E/Ho9kug3/UNXn0GYw
X-Received: from pfbfe8.prod.google.com ([2002:a05:6a00:2f08:b0:736:4ad6:1803])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9cca:b0:1f5:8cc8:9cbe with SMTP id adf61e73a8af0-20cde371e9emr787243637.5.1746140120540;
 Thu, 01 May 2025 15:55:20 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:13 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-7-changyuanl@google.com>
Subject: [PATCH v7 06/18] kexec: include asm/early_ioremap.h
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

From: Arnd Bergmann <arnd@arndb.de>

The early_memremap() function is decleared in a header that is only indirectly
included here:

kernel/kexec_handover.c:1116:8: error: call to undeclared function 'early_memremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 1116 |         fdt = early_memremap(fdt_phys, fdt_len);
      |               ^

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 kernel/kexec_handover.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index a1e1cd0330143..59f3cf9557f50 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -17,6 +17,9 @@
 #include <linux/memblock.h>
 #include <linux/notifier.h>
 #include <linux/page-isolation.h>
+
+#include <asm/early_ioremap.h>
+
 /*
  * KHO is tightly coupled with mm init and needs access to some of mm
  * internal APIs.
-- 
2.49.0.906.g1f30a19c02-goog

