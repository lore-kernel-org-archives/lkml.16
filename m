Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054492580E2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749797900; cv=none; b=eoG62fc86nnimjcQKnHWYapM2fEOfts50Dh4kme8cXpLT767KVtrNZ6Gebxys+CcMzU2CKw3C2xHmJ1QK2AKprfX8fcdDYi6JaRXLNmh4TzPqKhh1iM1CuZyYqgNmr5SB+KCq6jnXO9bn7+7MDLbuX+YEV+NNJU3il0ZVDqRJms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749797900; c=relaxed/simple;
	bh=N1Q7Yyxv25kh8YbbPEq1f4Xpl9cPz/xmC60ZF02nnis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeKyZqq/VzE8hHUU9K4lQhzLn9TiMqsolDgHfZ7vAShNHdU0LVddpJbTvqe2quEEs1XtevDoDFt9dqSg+3FhpLSuNVsnHm+W6oe2AqOzbL7DltRf90e+TQPr2xE+dXFwjuJ1d844PyJhK6/03GwbtB2Uuzsnd4/4jTzatsX6fQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=JhBtF9N2; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="JhBtF9N2"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313b6625cf1so1456820a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797898; x=1750402698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPp46eZSp7JL4MdOWPUs+dW6gfTxSrmGdnYXz+FMAYQ=;
        b=JhBtF9N2FLyRy6kJaLSipSLeBzJr5/v+eVEOXiOAbvdrDeLkZaVgOe/lUcT1Ddl9vn
         yU/NZ09DuwNG3J3DcJkbMXinrYUpS1+my77++y8hgOE4TWf888P5nYp66mvW3VPPZsw5
         /EuM67m06U4zQzH2nq/boh3UQR+S4XTfGBhMdJRkxMryrHRkiNi6bWLXP0ChiBqeQ2Xj
         I2s17Si7ezP9oJWc5Bz+/5hswj7XoIFSDMDFtpxPeXoReOcpN2q0ZCzkqazVlWkVVjX1
         eVja8zu9IwoCc36OXYmoaOGuVxfYuOmL6WSB8ahr1aJaKlJeooFOi6dkddwYLj08+ARQ
         YY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797898; x=1750402698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPp46eZSp7JL4MdOWPUs+dW6gfTxSrmGdnYXz+FMAYQ=;
        b=WHtDUrEPiVF5cAqHOlb7w6efwx6Vx5exjiKq/A7NaOHQ3unOcaIRybdHDyDAOcNG48
         odq50QfLofso7q3KY7WP2jNVBm8wlW5a2ctwdYeduFkiNxxSvhcKS48NIM29c+Zy5NQG
         Xwn3vqE21v890DvqqXzQi92IBbXNHAQuLwj+eOToRAl14kd5XzoP9Do0KYlkLfNTaSpd
         L27YjoLLj31DRmRJ3YLGOmU/mXm3WZxfxtjuki61nrh7Pqpv/jV4Fk6LyVkYpx+z/GX0
         YQhpuWeW2YiH+/WyJHXBio06ZHYpWOjuocztiK5IaPHwxKW188Tg9kXSXviJH5T2LQjT
         /3xg==
X-Forwarded-Encrypted: i=1; AJvYcCW+5+nc1Be7IsOdo43kzI1GIFYU3Pb4AGosJnF+24lFzvcfjMwNDEpGC6vmYimpraooyZHCVvIyFf1R5YE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzleCSvHPpZXOD0xBJaQKrO1tGnZFj2GpfD28GV9HZ7eZ/KhOV0
	cVeeTgEFb58plWnGuueDcP1pQMFnoH+BOKWIwhIVpFNTHpbGG3uHxvhsqT64OaJUQP7WY0FHqcK
	pi/zULIg=
X-Gm-Gg: ASbGnctkuZhNomzqYm+Tb6+6Gt69rMYZM8mZ1unvM3kzk5lrIHhL8ccepR5HNapjhja
	rub9dlqpaOJq5gHyu/oxI0QXSKj3wwNdppn+JSRFSNfpGUzIyY1v9sU6ih+e8ITCPmoYafg+y8S
	ZH4lv6IFA7Set+zf1CCgmQtvhtW9+UIrYd78og6H2Mn0v/X6mnWC34ACcsK+nxHngF12JzjPeeE
	yWjf/9KWivhXx7v1INapiAs5tQBgrVzQzZ7q9AB+KgLqcZguJejiBhd6wWE4/svz8R4E/j1Wrtf
	4lDLeeAua/vB1J5UC4uaeig8X9+KTDUn/2XxlKbUKjOnLSSdaVLE0uw2U+1dr9yHGJtA0sniDm3
	4WlyGW97SK4Guc5Tidxc=
X-Google-Smtp-Source: AGHT+IHlesOh77cakTH2YhHv43j8zOza0rZEzGZ+37qo1i6wlvyL7TrOfPOjUkpSesJgnyG08PjCmA==
X-Received: by 2002:a17:90b:1256:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-313dc25631cmr1682026a91.14.1749797897914;
        Thu, 12 Jun 2025 23:58:17 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:17 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 05/12] RISC-V: KVM: Don't flush TLB when PTE is unchanged
Date: Fri, 13 Jun 2025 12:27:36 +0530
Message-ID: <20250613065743.737102-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gstage_set_pte() and gstage_op_pte() should flush TLB only when
a leaf PTE changes so that unnecessary TLB flushes can be avoided.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/mmu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..29f1bd853a66 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -167,9 +167,11 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
 		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
 	}
 
-	set_pte(ptep, *new_pte);
-	if (gstage_pte_leaf(ptep))
-		gstage_remote_tlb_flush(kvm, current_level, addr);
+	if (pte_val(*ptep) != pte_val(*new_pte)) {
+		set_pte(ptep, *new_pte);
+		if (gstage_pte_leaf(ptep))
+			gstage_remote_tlb_flush(kvm, current_level, addr);
+	}
 
 	return 0;
 }
@@ -229,7 +231,7 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 			  pte_t *ptep, u32 ptep_level, enum gstage_op op)
 {
 	int i, ret;
-	pte_t *next_ptep;
+	pte_t old_pte, *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
 
@@ -258,11 +260,13 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 		if (op == GSTAGE_OP_CLEAR)
 			put_page(virt_to_page(next_ptep));
 	} else {
+		old_pte = *ptep;
 		if (op == GSTAGE_OP_CLEAR)
 			set_pte(ptep, __pte(0));
 		else if (op == GSTAGE_OP_WP)
 			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
-		gstage_remote_tlb_flush(kvm, ptep_level, addr);
+		if (pte_val(*ptep) != pte_val(old_pte))
+			gstage_remote_tlb_flush(kvm, ptep_level, addr);
 	}
 }
 
-- 
2.43.0

