Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC922750FB
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748639680; cv=none; b=WgfWuW4wK7VYJIlpuORir6Sepe0/I/MWq1jS/WKSaUynT/oWJWslpLP873m+QqzPBTI4FQNZlB/O7qgbl0zlZcUfQSk42rGJrw9WNUADhj1evy2o1pun8AGURhrhleVSOMlyrsg4c0Rh0hmNeYeP+X4Y2stR2ou53dOz6zJfSqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748639680; c=relaxed/simple;
	bh=M5sXiHRHYFtbTq+LRWVGsgwr6H5EyRmUdL9EKsh/mNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C2myedUzSyhyeMiyUkpNllDufgJpvzhyAbKmiwoFLucTO8lSjsZxTcUr7dfaMX8iUHacw7Y09KIGsOydl4m7UrRimKPRXHQBZutHBTRvQY0I1VZMffV2ccbX0WtcR9v3R0OadANLruMnPjw2wb9mBdP3Z2thQnqbeVKMjItOPgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z95LLxNg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z95LLxNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748639677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qhq9bo/wYck9cizayDHbjF7+ytasiyxC81vAjAy8SFw=;
	b=Z95LLxNg0NxwTSAGaU9kRw58PCynZwIompmsSEf7CKWax8nMYA/z2kLU/LpKRxRLMT2MYb
	eOEoFnJhnHZG2/y+lHZgcfxh7PbCgK2VyWXlvVSyLZUxiFuGFQPlxwjWEaTBcKnGEf2IpK
	gYCtiLX+ouj9e/xQxuR2mzyN9XEA+0Q=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-245-v6Y8huZnP7mj5vdh46LkQg-1; Fri,
 30 May 2025 17:14:33 -0400
X-MC-Unique: v6Y8huZnP7mj5vdh46LkQg-1
X-Mimecast-MFC-AGG-ID: v6Y8huZnP7mj5vdh46LkQg_1748639672
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B68A180035F;
	Fri, 30 May 2025 21:14:32 +0000 (UTC)
Received: from laptop.mht.redhat.com (unknown [10.17.17.210])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D94E730001B7;
	Fri, 30 May 2025 21:14:30 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	Charles Mirabile <cmirabil@redhat.com>
Subject: [PATCH v1 1/1] riscv: fix runtime constant support for nommu kernels
Date: Fri, 30 May 2025 17:14:22 -0400
Message-ID: <20250530211422.784415-2-cmirabil@redhat.com>
In-Reply-To: <20250530211422.784415-1-cmirabil@redhat.com>
References: <20250530211422.784415-1-cmirabil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

the `__runtime_fixup_32` function does not handle the case where `val` is
zero correctly (as might occur when patching a nommu kernel and referring
to a physical address below the 4GiB boundary whose upper 32 bits are all
zero) because nothing in the existing logic prevents the code from taking
the `else` branch of both nop-checks and emitting two `nop` instructions.

This leaves random garbage in the register that is supposed to receive the
upper 32 bits of the pointer instead of zero that when combined with the
value for the lower 32 bits yields an invalid pointer and causes a kernel
panic when that pointer is eventually accessed.

The author clearly considered the fact that if the `lui` is converted into
a `nop` that the second instruction needs to be adjusted to become an `li`
instead of an `addi`, hence introducing the `addi_insn_mask` variable, but
didn't follow that logic through fully to the case where the `else` branch
executes. To fix it just adjust the logic to ensure that the second `else`
branch is not taken if the first instruction will be patched to a `nop`.

Fixes: a44fb5722199 ("riscv: Add runtime constant support")

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
---
 arch/riscv/include/asm/runtime-const.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index 451fd76b8811..d766e2b9e6df 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -206,7 +206,7 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
 		addi_insn_mask &= 0x07fff;
 	}
 
-	if (lower_immediate & 0x00000fff) {
+	if (lower_immediate & 0x00000fff || lui_insn == RISCV_INSN_NOP4) {
 		/* replace upper 12 bits of addi with lower 12 bits of val */
 		addi_insn &= addi_insn_mask;
 		addi_insn |= (lower_immediate & 0x00000fff) << 20;
-- 
2.49.0

