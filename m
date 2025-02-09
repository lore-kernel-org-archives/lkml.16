Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0871F95E
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074687; cv=none; b=RqQnyP8L4mClTrRIejTMoQRoch0eHZJYe87W4mzrxi4GUOuKpGN6iPKX/0rlaQrNgMt5r1DqKgsT+ZDe0apJmZLxbXwaRQVpS+AcKpAGguNF8j1tVpi8mVL1vJBr6vtmu7lHH+7zjO/KYQ1+MgVfk9iRqtQUZb8UFGAZ/S0/0eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074687; c=relaxed/simple;
	bh=rPuSUodznHcDcnkXovmaVlnFXIC34eH0em4djJco3jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OG5wD8CrAs/Xh874cYByIFumjywX5dmHuVPKOo67Vpt6ih0EP1LWiuBFeWahr8uO7emry2uPk+G//8eblUB63aJXQ81p29cXCAfmcSvKF0cdSpqQMDKZHbj1HNXaUUVP/c3cAEKMxV0IJcZ75RFyoSmQvhIT01grQ8YBmFo2C34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QCEajN/Q; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QCEajN/Q"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fa1d9fb990so4654473a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 20:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074685; x=1739679485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=QCEajN/Q6ofboe3F3JBCO7cxSKQUNh/HtMikyj8w0gXa2lSU2xymFNt83bbWeP3yWr
         nkeWeUkf88aiXJIoNk7jJ6LvySA8qDbc0YilRUOfXRW+7c0KnlysMec32888oiVQpxUm
         0lz6kZkfbzHrsOX9kHjvc7W5mgG+zqJfk18dn/40e13toYIy5wEWiXh+XXeSans0dB2w
         SVKRkxHwsbHV8d1apmJwZTnm5jk7F5Dj+vZNPmjN4bEsLZo6xeQiuRd7sSedqXh6p/6j
         b2EbppodKEpiIxOiotvAZrkXby0slpNDP3UvoDkQaut34aT9sVg1R80+yTV0eFXMPgXI
         HYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074685; x=1739679485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=koOU9EQTRcbfftxgs/n1MUItxreFejiTxBVeFQFdqVnWOtGgwNy42/guGBq0ZkeI3A
         Qljhl9pOloU6+IIJ0o/madQm/wRivh8zNY07N7kxiN7Cswh+NDJey6id1A03HqUnvEZE
         otWUz/5XVfifyUoLbbJe3YQA2K+JGnDix/Q/XGiv6rvvgw1ZF+TEBivbVuG6hZP4GYH3
         JGXoKrJb+R/A4LUJncyhliIX0eastMfRzeI2srANVVIRzkmVdfKc9Cs6uoy/iCtRNa8g
         4C4KR6Y1uKR/txfhi7J9VKK1LJ/RxPFShg4+X+O6VDNhwSTLb3bjCphsoQ97ZyfVhseX
         X5QA==
X-Forwarded-Encrypted: i=1; AJvYcCXELdNT5MaQrpFsLjVd4S8i0RKr3On3RL6pXrjROXSNt0FbdDy0e+BxXyfMl00spFFhpD9AwX+GL/wpxXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsEI4qetSsaKhWtlY3FOP5dOd04dFIWsWuSxtJXZkr94ARS2BY
	VKojCOdi66OMLFYuGVykYoY5SMo8SooObD8wCNSEp3Q9TT2osdBmEvbRz9Um/JU=
X-Gm-Gg: ASbGncsJO2ogxy/PJS8E41FAqOdlNwSokhFfV/U+Ba4td2R5h7y/0uzbiH2tlAwpdbm
	l/bMlFx8Xd9GukRJAhgzdE1m7qvVNghMogLbf/58RFfNDdhL5q2xfgd1lJkKoWsA51FmJ+CtO4K
	w2WYGmaVKSI6vanEErHx3bxrubw5ycjZfgEXlzf2Lv/jWeZTGuWZnL/WGtzD4UpTEbbkWwT39pp
	jXyUpFp1JcRgauw+A2JnKkTGDxwCg8J7v7VQ5GxaPeNPmftNYQBQuVr01OXCoS6QvBOFs8h2WuC
	lYyROWWp8k+NTNDlbq29n8yTag0mIzq65w/gpq0EM2Fv65Kk5oGA/1E=
X-Google-Smtp-Source: AGHT+IHplK1Odn1krUBJui9aJ3bXui5w4fG7ychKlkG3JoJ8qZ1jCX3WfSDt+grELpA1vaZRwG2+1g==
X-Received: by 2002:a05:6a00:178c:b0:730:8a5b:6e61 with SMTP id d2e1a72fcca58-7308a5b7c17mr217952b3a.2.1739074684846;
        Sat, 08 Feb 2025 20:18:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:04 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 06/11] genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
Date: Sun,  9 Feb 2025 09:46:50 +0530
Message-ID: <20250209041655.331470-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option is no used anywhere
hence remove it.

Fixes: f94a18249b7f ("genirq: Remove IRQ_MOVE_PCNTXT and related code")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 kernel/irq/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 5432418c0fea..875f25ed6f71 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -31,10 +31,6 @@ config GENERIC_IRQ_EFFECTIVE_AFF_MASK
 config GENERIC_PENDING_IRQ
 	bool
 
-# Deduce delayed migration from top-level interrupt chip flags
-config GENERIC_PENDING_IRQ_CHIPFLAGS
-	bool
-
 # Support for generic irq migrating off cpu before the cpu is offline.
 config GENERIC_IRQ_MIGRATION
 	bool
-- 
2.43.0

