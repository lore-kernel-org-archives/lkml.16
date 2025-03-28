Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89B922E3E6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168541; cv=none; b=IVCmWnQG0BkzBduorLeUJ3eMaSQK1beO9sfMZ8eQ8rW340GZnsmyNfXdZTvmgl4P/IpbdSf8oFeDsFbzTS+LY/2muQi939kF64EqYSaq7W9grg7IriRJ9+w2DaWs7UKNooOqlO9P5IFMPZDbQpRRVtkHc5/rI1WfXLSdz2dzuq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168541; c=relaxed/simple;
	bh=wH93hY2iOLzXDWLc6kNmAFjdkcDsvMoeDOlT9xfdYNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iuTNMcGUdcJ1Xbj10IL6Pct8rDYqsMwz0q787xHTqZNxNp0YpNGJ4wyUEBEPvfS3IERm/VoQI45rZ4rHcIDKgZsk+RKM9xO+rYIeLnYJBmRdwwYn1CTwoRLe3FjppgRRrdYNiwkI/twMKVw2DwB9G+WoHPEw+R8yAEI5uG4d5Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKrIMr7j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKrIMr7j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5B0C4CEE5;
	Fri, 28 Mar 2025 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168541;
	bh=wH93hY2iOLzXDWLc6kNmAFjdkcDsvMoeDOlT9xfdYNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dKrIMr7jotNw5vgcEZszK1Vl5rlEI5P0Eum45e0Hg8XMOMi9XYwcTPEHsC7jfcSZU
	 O13tDjJPRadtuUEfUUeLL1tZF6/G6jZ8/X+Ld+wopDor3Z8VohMf/lGCjE9Mz7CtYn
	 ryFBc0jneR3/NF/1HjChURtwPRtRhlirCEgw8BonmBa32hSTCs+nQruwsuhIbeinxm
	 NTW042GBRyMqH5UJ02FYAqFL5Fhs1ODY7rRPyEMQyNKUVIv2gWY4tjBquXKzpAj2ds
	 9vrNCA1t99hlCQs6jFRVZ9t+9UyLd5zwRwUS6mz5S2v/9Lj+O2bHBNTTnhQTR1Nl6J
	 GIkYpEB6zGC0w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 40/49] x86/alternatives: Constify text_poke_addr()
Date: Fri, 28 Mar 2025 14:26:55 +0100
Message-ID: <20250328132704.1901674-41-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will also allow the simplification of patch_cmp().

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 27f1c7bdd384..5823d4764d92 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2493,7 +2493,7 @@ static __always_inline void put_text_poke_array(void)
 	raw_atomic_dec(refs);
 }
 
-static __always_inline void *text_poke_addr(struct smp_text_poke_loc *tp)
+static __always_inline void *text_poke_addr(const struct smp_text_poke_loc *tp)
 {
 	return _stext + tp->rel_addr;
 }
-- 
2.45.2

