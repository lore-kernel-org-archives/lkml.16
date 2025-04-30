Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D480265CA7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033347; cv=none; b=VRaUC40gQ/X0VT96py93PVUyfZDyO4idjwN1mXsYcNmg8yzAGmpYk5qzrWFKQteNywdCV6sbpjq9l9hiBnZa+AR44eeOkWma0MqeJASc9I38WNcc76aCAUwldNlVaomUiJ5DD37zQGNglZQ2Im4aMKcaq2Ly47Cw7pBlB06oStg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033347; c=relaxed/simple;
	bh=/nCqqKVIM3lCaTp25K5Y9r9lVgOCOQUHMpBywdgb4IQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=qD4HR1LQ+6bqFO4Y6Xt7IVYI5WwupaeagimsyGkO4Uph4voo2z8ciyqVXrYXVPQFUn1kPSjBO5hCdrZN+R8Ly+NUxhSB25gzrxho+lt1u33QC2w8L308/XiEHsF0agQE+T4qfD0bn1vM7TxlEJ8izSmOSQptp0WsGCDZfZ4xRAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vM8hCfsn; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vM8hCfsn"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2240a96112fso976265ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746033345; x=1746638145; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gN/a6V8QiIvdypmyI6y6Go6q2Ye8wXD3lVvCZhX5yNo=;
        b=vM8hCfsngFt/TKd0/thKvS5ZnmXWlk2O1sYawqKwrBiHW6pWAL+OnD13z11M1Pl748
         tRRVVqNmBw8W/qsr/frtZo6xIWX6BKtvc567rNKJfDwPReGLm/Hzl5NcFm9BN5TlT/Gx
         dS1u+8qbkBYOdH9bKUEnvCvKzIx4hzAQlhD8YAFvyMytGwUjpboIWYp1V0BescE/KiJF
         jEs9q22upl3EoSmxhciTjBA5T18drI/Mgj3gb7tyZiJxcq6N/NFfqbW5vDCR9bZZAY7q
         lKBzKQ7FuVsmNOxueBUqZrbI+8IQr1yrb8y6TXTfTD30ZNSd2Zr6+BnrhUU3EaC++IjX
         YyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033345; x=1746638145;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gN/a6V8QiIvdypmyI6y6Go6q2Ye8wXD3lVvCZhX5yNo=;
        b=IDFzSkToZe/8O+UHI8TQu1HTIII2PA+GPheJRK7kpAZJ2mQWjAapgmuB/zXpcSUSwj
         +lCjjS1j2gg7438RaK9U4G+maZekWkrFVyPjRTtNqpDYKSb3VaH0/Z+NU8Dj8RCFD8CW
         W2FGouixOs5yvFDAHRSNBpZHiLbtzX/Kcjj627clQEvDZz+gT7Ytm4/e7Ed7oXZM0ZI+
         kETmxwNXrNRsCRuhNILYFAwKNNJ53wedl1yzdBsjRDKRR6/mR9wybtCq5TTgSLIjIoI8
         4UFbcHjmoO6fmJGGJnVD0Qsi3aXtPhqFsHAq8eQO97MlvYuAviwb0hJigdHJoFCl+NZd
         60zg==
X-Forwarded-Encrypted: i=1; AJvYcCUW/fFKZvjBkS8HdB9umDJ7YtumSDbjQo/ij/adflHYUnirBvSpJG85mP3DRskp8OLjGYQXeynrPTOIh4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2XuksiSLC4IWcDr92biTo1ry1MrBKn7zrQeJk8an5Mb6hE+TO
	VJ84Ds7VHVlM5BD/IhIUArvwncgkaAPYfaGcOjuS9l74WpRRtn2i68tm0U/AvoIMHcEOiPaecal
	wGVwm5g==
X-Google-Smtp-Source: AGHT+IEyeKPexv1uh48dcAlUBWAzGseOfey8PKS/qHG5wARnrrceWevHm0oXIBRzRj/577/EUtzzAPcRJ5k6
X-Received: from pgam18.prod.google.com ([2002:a05:6a02:2b52:b0:af2:3385:de87])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:dac2:b0:21f:71b4:d2aa
 with SMTP id d9443c01a7336-22df5764482mr52271135ad.5.1746033343976; Wed, 30
 Apr 2025 10:15:43 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:15:31 -0700
In-Reply-To: <20250430171534.132774-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430171534.132774-3-irogers@google.com>
Subject: [PATCH v2 2/5] bitmap: Silence a clang -Wshorten-64-to-32 warning
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
 include/linux/bitmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 595217b7a6e7..4395e0a618f4 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -442,7 +442,7 @@ static __always_inline
 unsigned int bitmap_weight(const unsigned long *src, unsigned int nbits)
 {
 	if (small_const_nbits(nbits))
-		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
+		return (int)hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
 	return __bitmap_weight(src, nbits);
 }
 
-- 
2.49.0.906.g1f30a19c02-goog

