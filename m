Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC6F267733
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033351; cv=none; b=alKbB2UnUZ8gISMsDVoOrakcrZSoYeFyJ5UiKpDZnVaLhVwegF3ShxdYySog21mCNibCu0sEJ42OjUGLrfUTD04FZ+9yTlKsfzmxnQj4sgdLI33mAEhcluDJp5VS2XEBGGfqErBedOQWoS0mlRtaUXe9elxR252r93xHblGQuNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033351; c=relaxed/simple;
	bh=0giGEwbxakAUv76u37w4z4HZNA3HR28IEwGrKloZfbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=rCXRS2zjque6A93ttQlaur8f2SwCKR9cYxIerABC7OEH28UH2zFjDyJUJ7kEjJwU2cCiv3PU8oFiEHphK1eAepdQbeJNLGECA11mjr2eKnXyVlQ3mwyq+88t+e0CfyjnJk9qlR39sPrm6gEL7Yj5MTmH/zyHfyt3BbvJyxKk8UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x/1N4HOn; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x/1N4HOn"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3032f4eca83so94732a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746033348; x=1746638148; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOjn9I/CPl6hOGWikVl+PEhxM6YNnhs+3iDFhqJ7e1Q=;
        b=x/1N4HOnrjhrEuaC+/BduGHIgnd9t3WVz8bjvEjk5WlhqqB/SUKujBNRP82AaIoGh4
         Ff7UaID+dL5ZEtcYQwTdhCtgL2upjme2iCZMjxTx6kaMSl+x3DxoYAphKIA5KBJt1lVM
         PpcUX9ZRuxu0cK9yAH9f+L3GLwIjjaVMQae3ly9RoVz+A8K/OQkw31erSbj2MhLTBx3q
         ySFOKrO9F4A0skALa85MX5nPUE1yNhPZCsySMZQlT3S5aM41jJ/jkf1Au9hX/KOrRGHp
         TbrESs3eF1v/rWS0Jleuw32xBUsyKX4DG/Uw0p5Ff/c7arWfU3TSviZThsFnchfh24Dk
         HXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033348; x=1746638148;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOjn9I/CPl6hOGWikVl+PEhxM6YNnhs+3iDFhqJ7e1Q=;
        b=jwNCKz5mGDVCtQMSDiaUljBO4625WB9BfBxWo9JyWQzjlIWBmDFv2szJW5Hyc0QJ2+
         V8OSptU+tyE371aZHgztFxE+0d1ujSbwkeMLaIhIcMpzaoKFq2JYl7RepaQGu/h2tDiX
         z4FgT3s7pd+tgbuj59/9rNt1Zrmf27A5NAK1Gww1TSQTwPOmjdkv+4GEunTW06zEapoA
         CC+PXDHQHWaUpgE2I9Q36vgCO5Et4lELLvo6Q+Vok5hzAk1HngVy3xINyG9DBOA8RBgb
         SvrJ8Y5zVFnGN+hLLoxC8SE4BAkTcfdzKgCkgsfB8gerh1tCb2ID6702P7awTUi8b95l
         +bsw==
X-Forwarded-Encrypted: i=1; AJvYcCXYlSwAw3eifl6QZqUftP02+i7iKm5CbUnIA733BA+ng0g41s55Zy4BX8Epexl4jPWK/jZldmFQi3IFhAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwT8XbGExqigxaFbqgkLmnr/oJOu8IqVVu3grnNOXl0JbFf9i
	UKznlhQdXUEUDher/muRILCpOiOdCQG6cHzDoMfixd5pAD8wHv+6kbXgxWB0sELUZLd/phH8B0/
	gvCO2SQ==
X-Google-Smtp-Source: AGHT+IHK97p3d4624e1GJoE8HKE9+msldMS/AyxZk3q0FqC3fhWjqcopfMGNBtO9wUuHcIl2vdgL7V5NAXJ3
X-Received: from pjbsm11.prod.google.com ([2002:a17:90b:2e4b:b0:309:f831:28e0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4984:b0:2ff:796b:4d05
 with SMTP id 98e67ed59e1d1-30a343ffdcbmr5747063a91.11.1746033348290; Wed, 30
 Apr 2025 10:15:48 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:15:33 -0700
In-Reply-To: <20250430171534.132774-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430171534.132774-5-irogers@google.com>
Subject: [PATCH v2 4/5] math64: Silence a clang -Wshorten-64-to-32 warning
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit. This isn't to say the code is currently incorrect
but without silencing the warning it is hard to spot the erroneous
cases.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/linux/math64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/math64.h b/include/linux/math64.h
index 6aaccc1626ab..f32fcb2a2331 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -179,7 +179,7 @@ static __always_inline u64 mul_u64_u64_shr(u64 a, u64 mul, unsigned int shift)
 #ifndef mul_u64_u32_shr
 static __always_inline u64 mul_u64_u32_shr(u64 a, u32 mul, unsigned int shift)
 {
-	u32 ah = a >> 32, al = a;
+	u32 ah = a >> 32, al = (u32)a;
 	u64 ret;
 
 	ret = mul_u32_u32(al, mul) >> shift;
-- 
2.49.0.906.g1f30a19c02-goog

