Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36531B3927
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097339; cv=none; b=NNOz2Ot+bbrwoeZw2JzTd8vgQCfqZiR6E3FuMUXO2AKZb11Iz5K48SQfhoPavYFz7hk9z36f18SO6uRWKleWxtxgonLcWKpakq2GCWtWCOrcXWU1ZasAnqk5UQJgY+YIi1P4zk3Rl6+D4IAPt7MvZ5beUbvEwrqT9znYTLLUSuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097339; c=relaxed/simple;
	bh=Pn0FY6CElyCYc5B9NO953XBLE4Mc/rR+/JOccRSUwKk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=f8tsqckaVt+jLTimgqkj49GcOPk9Xp9MwkopcrFZte2pJ7sh71dFwQ367rszItYCWcpX+UvogGfF/EFTz5jtNBs9zgtkZMQ9S1e5auaJxqwnujsFVqnQeW5YnK4B/8HOV86FyRxlIp2iK/gzVXMRNyelAx1sDTYYWY/SWOAUEig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aJs7kKSl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aJs7kKSl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2824420f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744097335; x=1744702135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0cTQmfSj1JKjmotOYm2ZctqRJNrdyoR/IHdMM1ZjqE=;
        b=aJs7kKSlr5LcGrLZFzxWW+O9pACPwPD27FtPUt2syJC7m8pG1EdU09UjBSwyYMzZDD
         BzRT5cqPxbvIwPM/vAKTuEeAY31geaLMKmjohUG6DHh7E7z6c9ghvzL8T4mub9TP3LQ9
         e4aRIqhQfnbeX4trQAu/XWW6G0tatOJdBtDHhE7TtVtqsqMT/71tl9G0tiBLGCZFtio0
         rz51750qAcgBqurs4eh8zUcOtJa14pjkopYzyuYqwm+b9aReTNzlXZOWYlHFzeD2JVYc
         6fFSPd0NEdoxkoaj4uHFXMuCc/wtgYkKal2Fuc68UVZU5E8O+izoxQ/4EEFTu50mglDf
         aV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097335; x=1744702135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0cTQmfSj1JKjmotOYm2ZctqRJNrdyoR/IHdMM1ZjqE=;
        b=ka0KFgPyZ1D/VYDWriB/9zvjRTrvns9swuDnD78hLnoj0UQCYETBmvvt9uLCumZunf
         y/hkTcEe7wRTcmFASAmDgcf6eCch7GqjmxfDcdwtFyrQklb8+DackqJk/TnRF+nTYpB9
         TLqSoKVyjJF1i0SGoPGNyF2x9RuZSJLFrhzRZi3kHdvkawXu5jpkQXho89fq3YWREJlk
         b/UXHgKfPWR4HPO1VqzXhFdS0HrFJsnsEAhm/Vm2GlUdqw86W4XOkC4QNj1hHrPQHkXj
         V5pZGuMzG54BzfkBO0eA9NUe1f2eSV+igUlxpu+F/3a1NP2hdTX2Og2C+IUZq6CIOOBL
         kcbg==
X-Forwarded-Encrypted: i=1; AJvYcCWAsdSVsCBrWm1erxpsDKN0YYML8fI3BoX1ncp0svf3hI6/B3A9K5ff2paxvtb4vZD4uTyY3wf7OqmLq0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3iLBTZTE06gl5QCqUnyNZwKsdcrodgPGR+v+wFcBjyAIEUL6g
	8Dg0ur8xHApnNzGec8fibZV9HYp1lPY73cyn1DFrOxFKzS48xUBdULzopsRiA94=
X-Gm-Gg: ASbGnct/dslQvJ6EbP1GiH7EH0Fhqi8++4QuA/PyVuDWhq0IknfA25UC6s6JR0F2hlv
	/ZE9FaWfowNSuKU/dcIgtK7M/F2lr5uA9DaA9PPMiM5XkY7O4RFoxwyuNLvoFbrmZ0axkTD9WcL
	PKb1IzLu5gVfJ5EOnEbSZxkCRsy7i3vFozG0TE0YTnapplfLdJGWXGJYE0WqfiR0RWhYrfimcpU
	3pgvrWr07bY4DiBQewx90Qk5o3zW0BqAf+FI1sgEeX0JlOMdK+DuOlH0UxrcdyQdio8suHWuwFl
	HNl98QEZHAbHqu104bl9N1ClIOeI+veM1CrfXprJxyv9xyuoOq9UI2mBvJGNBKQKRTMum9I=
X-Google-Smtp-Source: AGHT+IFz/8BWGlvn1oOub9ouIswew5ujgXC35R9BzFfnCHHdvTVfj960TEGZ4R6A4fumlfb695WeYg==
X-Received: by 2002:a05:6000:40da:b0:39c:3122:ad55 with SMTP id ffacd0b85a97d-39cb359703fmr12528490f8f.18.1744097335011;
        Tue, 08 Apr 2025 00:28:55 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:5b46:8918:c917:7872])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226da7sm14444737f8f.98.2025.04.08.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:28:54 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3] scripts: Do not strip .rela.dyn section
Date: Tue,  8 Apr 2025 09:28:51 +0200
Message-Id: <20250408072851.90275-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The .rela.dyn section contains runtime relocations and is only emitted
for a relocatable kernel.

riscv uses this section to relocate the kernel at runtime but that section
is stripped from vmlinux. That prevents kexec to successfully load vmlinux
since it does not contain the relocations info needed.

Fixes: 559d1e45a16d ("riscv: Use --emit-relocs in order to move .rela.dyn in init")
Tested-by: Björn Töpel <bjorn@rivosinc.com>
Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Changes in v3:
- Rebase on top of 6.15-rc1
- Change the fixes tag

Changes in v2:
- Changelog modification (Ard)
- Remove ARCH_WANTS_RELA_DYN (Ard)

 scripts/Makefile.vmlinux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index b0a6cd5b818c..85d60d986401 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -13,7 +13,7 @@ ifdef CONFIG_ARCH_VMLINUX_NEEDS_RELOCS
 vmlinux-final := vmlinux.unstripped
 
 quiet_cmd_strip_relocs = RSTRIP  $@
-      cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $< $@
+      cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' --remove-section=!'.rel*.dyn' $< $@
 
 vmlinux: $(vmlinux-final) FORCE
 	$(call if_changed,strip_relocs)
-- 
2.39.2

