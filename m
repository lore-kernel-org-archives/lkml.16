Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5185929A2
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738183168; cv=none; b=EjB28jnVrZUKf94XM389OpOl8HZH7InzrMRFPXmLM2upt9aGLy8zPfrQth5VIGr1EvaoevvL0AiBYPr/JRmOTjEFzouh/BGBNGmY9kRLjcql/Jpxwr9gDf0poP8y21W7WyCC49GwIwnptkW2HZjwj0fIrcQeDGT91Usw3ahPn+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738183168; c=relaxed/simple;
	bh=NZzgzO2QfeOwpkt2UjyCcp7AErZndfzK6OYJqPyqGw0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sRruAmWbmBI5B/O5QPficCwFoNy22PWHe8VVHGSe8YRhKCEok4MhZyhBjsWc23ZWZINF1EAUWCKyC7cfjlQl2olmKOCy6cnNfP/lsjhDFvZgIKjpOzm0R5Wm3Ex8a3pk0+xQGXtB8Wvr6F0OfUgLdVmQecQ2iGO79rf24/RTO5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJNtUNwv; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJNtUNwv"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2efded08c79so58944a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 12:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738183166; x=1738787966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9xPFsm0CiACHEgTpvga5kyDZr2nERop/dzgTmhGmOM=;
        b=YJNtUNwvAV/3oJzBJgK1jlMEyijq+iA76Gr1HwaDhuuzvz0eTfzMSZhz2s1pjzAsw2
         T5+KRKSXNIjPkBnlSRvVudCXFBoJjWffDqU+XcdOHxgjg8o9LiyKXGQO8ZVUr8e6DmUM
         xpNLKdVOjIDu7izmExFZ/gjXe16W4Xty3/Bz5vHoCM3ulOK7lSG4CWjQ33TdMpTmizTy
         nXVJu/6/9FMVc6+eL409qgr35JuuRnGswHfEKATbyR0xdB095IBx9dyibqUhjotpKxR8
         c4sJOhFycE8sJ+gDShBSXzXaUPpa5jUn/KVeVkOWGMYSm1xd1UwXhBzogHY+hrpf/ByB
         8hJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738183166; x=1738787966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9xPFsm0CiACHEgTpvga5kyDZr2nERop/dzgTmhGmOM=;
        b=C13Si5y6yheDts4DfML0AsTXHZa2tw4ixIyT0rZig4yZriAfrBkrDqMdQUL0iV8FSW
         VKgEAbgodZc4GhjeJeg7fOJC9P0pf/jtTXD30LUEARkTtDUjzAMgHHet3zxyJguryKwx
         GuS/CeT9rIwMweDwR/sx0RTSqwqyjwa0N5EEXMQ1ug54vKYo2PAXXY8Q0u9NmQfM343N
         ewQzWESQi0vYMn7sAfdMGCH0A4h9LrEApCdNCN92xkoO70tlQhluL0s9jUmYOqllIDo1
         LXXA9fTF9vJPcLEBVVEK9nzzqZ9Fj7G+AZj0AMzXJOvVXdWnESuzGZ/Q0a/rLALLw9eL
         IcQg==
X-Forwarded-Encrypted: i=1; AJvYcCVbITby0cEwV/3Q9nXssOYTRfc+6N9x03R1bXfvLJlm1FqxOnOBQWLpBnL7+QTbnLxt6OfyPYHV2ykblk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeaZx8Vu3TQEKeXBSJIsbfrPOH0xn6IfiEcyZDntdngILeadhn
	IY6baFmN9jlSh9PNAtYCn2uEkDxKpto05gv03bVqPpmOfKsZcOur
X-Gm-Gg: ASbGnctAcdhwOmBgNuoDexmuzR7fe6Qi3oKmLZwiWexrAsF54gWuhUa7XzVXuHJ0Q09
	AbUR9hHbH+K2s5Vww7OTQ2yionz5xXjozvaIUiExPkCl1kgggXcLCjEFIHUKOkDruepRskELKP6
	rddF+LLJq3zv+w+H8HTS9JIo3WEeaXovpX3nHPKyzNYV+D9t4Gw8cRQOuZZYw88OvYFJclsVG8/
	0HQ/ix68B72tub93AcvW0Vxxn4dJ3ZAv8mNbz4D8ADl5/jWjoyrTaJaEuIjiGesiWb3kz94n/3K
	7h8XgtMF3oeVSQy2VB4Aa2KVpHfEKQ1VQKPZOQ==
X-Google-Smtp-Source: AGHT+IH/P2WEy3n6NCJq5a9VrQTr/6ukzXoqXEvnPXyP5dqSLuvd5EP8ueh6qCxGdt4GzAViGJMuNQ==
X-Received: by 2002:a17:90a:e7c6:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-2f83abff386mr7141423a91.16.1738183166470;
        Wed, 29 Jan 2025 12:39:26 -0800 (PST)
Received: from newslab242.. (pc51.csie.ntu.edu.tw. [140.112.31.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf9498asm2252519a91.32.2025.01.29.12.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 12:39:26 -0800 (PST)
From: Chin Yik Ming <yikming2222@gmail.com>
To: conor@kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	ajones@ventanamicro.com,
	samuel.holland@sifive.com,
	cleger@rivosinc.com,
	andybnac@gmail.com,
	alexghiti@rivosinc.com,
	peterlin@andestech.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	yikming2222@gmail.com
Subject: [PATCH] riscv: Simplify base extension checks and direct boolean return
Date: Thu, 30 Jan 2025 04:38:43 +0800
Message-Id: <20250129203843.1136838-1-yikming2222@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce three lines checking to single line using a ternary conditional
expression for getting the base extension word. In addition, the
test_bit macro function already return a boolean which matches the
return type of the caller, so directly return the result of the test_bit
macro function.

Signed-off-by: Chin Yik Ming <yikming2222@gmail.com>
---
 arch/riscv/kernel/cpufeature.c        | 6 ++----
 arch/riscv/kernel/vendor_extensions.c | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c2..32525b69ab99 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -49,9 +49,7 @@ struct riscv_isainfo hart_isa[NR_CPUS];
  */
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap)
 {
-	if (!isa_bitmap)
-		return riscv_isa[0];
-	return isa_bitmap[0];
+	return !isa_bitmap ? riscv_isa[0] : isa_bitmap[0];
 }
 EXPORT_SYMBOL_GPL(riscv_isa_extension_base);
 
@@ -72,7 +70,7 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 	if (bit >= RISCV_ISA_EXT_MAX)
 		return false;
 
-	return test_bit(bit, bmap) ? true : false;
+	return test_bit(bit, bmap);
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index a8126d118341..62f55bc779e9 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -51,6 +51,6 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 	if (bit >= RISCV_ISA_VENDOR_EXT_MAX)
 		return false;
 
-	return test_bit(bit, bmap->isa) ? true : false;
+	return test_bit(bit, bmap->isa);
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_vendor_extension_available);
-- 
2.34.1

