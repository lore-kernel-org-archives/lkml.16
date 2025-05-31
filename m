Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30E86EB79
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 03:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748660860; cv=none; b=HPlLLwkeolKQjCSIqEkVVfzjLVHDxSuQ+Luu5qjXCJOg+7Ma07Drns99RZqe3hihQdu5pXBP7493pVnj6M4l0l0M4pYim64wMgXd4jmiHQS6gOlc+K5AnvALnPtLx3Hz+t71qiqI8WS3Fsc5WQdmNf5ngiAkSWIRddLsjZPZCd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748660860; c=relaxed/simple;
	bh=Pa7QASLrlHanWCuLBWQc+fuuQ+WlkS5nnlAKVp+CeJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Er8Tqjk7apDBFNuaInoNpR6JGz27F8j5bqWHkWYJVvBGjGXCMrWw2+b5XG08BvCirUjFQyLVM1MVo/ed8JQqnCuVps1PhcfSD+6KHPnwJfgy+2JjUX4PRYB0yVtDkB2VPU5VJlfI6dbpawM482wHsjyGIcw901WbMUXeBVHQ7eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SAwzr5ZL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SAwzr5ZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748660857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdGqR+lbsdF+ZAaQYj0xRCvZi4FVtrfoM9MTXbgsC4M=;
	b=SAwzr5ZLNCaPcpORJJI/waeoZwDOswOh9/aFB5SO6JFnt0suYmh39Txl4AYEwz4dRdv1cF
	g4jhYc9ibUZsfgOVEb0bSSqyp10snBtHeoqAntQbL6V63Xwqky8301eAxrjTw5XyDsUEA0
	YmYYnnDQY1EKe2U4UOxs72TpMMptMrQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-153-AHJaUM3uMTyH1NJ00ykJ1w-1; Fri,
 30 May 2025 23:07:34 -0400
X-MC-Unique: AHJaUM3uMTyH1NJ00ykJ1w-1
X-Mimecast-MFC-AGG-ID: AHJaUM3uMTyH1NJ00ykJ1w_1748660853
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E9AC1956086;
	Sat, 31 May 2025 03:07:32 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.22.88.10])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1DA701954191;
	Sat, 31 May 2025 03:07:29 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: cmirabil@redhat.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v1 1/1] riscv: fix runtime constant support for nommu kernels
Date: Fri, 30 May 2025 23:07:25 -0400
Message-ID: <20250531030725.798945-1-cmirabil@redhat.com>
In-Reply-To: <CABe3_aF0U5ej6ctQ0TQzecZ+ayaRSzJPTv5zf6kcD9U95rQXxw@mail.gmail.com>
References: <CABe3_aF0U5ej6ctQ0TQzecZ+ayaRSzJPTv5zf6kcD9U95rQXxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

From: Charlie Jenkins <charlie@rivosinc.com>

To be clear, I am suggesting that the following patch to just rip out all
of the if else stuff would also fix this bug, but maybe the perf gains of
potentially inserting nops is worth it.

---
 arch/riscv/include/asm/runtime-const.h | 33 ++++++--------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index 451fd76b8811..da47253a89a9 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -179,41 +179,22 @@ static inline void __runtime_fixup_caches(void *where, unsigned int insns)
 static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, unsigned int val)
 {
 	unsigned int lower_immediate, upper_immediate;
-	u32 lui_insn, addi_insn, addi_insn_mask;
+	u32 lui_insn, addi_insn;
 	__le32 lui_res, addi_res;
 
-	/* Mask out upper 12 bit of addi */
-	addi_insn_mask = 0x000fffff;
-
 	lui_insn = (u32)le16_to_cpu(lui_parcel[0]) | (u32)le16_to_cpu(lui_parcel[1]) << 16;
 	addi_insn = (u32)le16_to_cpu(addi_parcel[0]) | (u32)le16_to_cpu(addi_parcel[1]) << 16;
 
 	lower_immediate = sign_extend32(val, 11);
 	upper_immediate = (val - lower_immediate);
 
-	if (upper_immediate & 0xfffff000) {
-		/* replace upper 20 bits of lui with upper immediate */
-		lui_insn &= 0x00000fff;
-		lui_insn |= upper_immediate & 0xfffff000;
-	} else {
-		/* replace lui with nop if immediate is small enough to fit in addi */
-		lui_insn = RISCV_INSN_NOP4;
-		/*
-		 * lui is being skipped, so do a load instead of an add. A load
-		 * is performed by adding with the x0 register. Setting rs to
-		 * zero with the following mask will accomplish this goal.
-		 */
-		addi_insn_mask &= 0x07fff;
-	}
+	/* replace upper 20 bits of lui with upper immediate */
+	lui_insn &= 0x00000fff;
+	lui_insn |= upper_immediate & 0xfffff000;
 
-	if (lower_immediate & 0x00000fff) {
-		/* replace upper 12 bits of addi with lower 12 bits of val */
-		addi_insn &= addi_insn_mask;
-		addi_insn |= (lower_immediate & 0x00000fff) << 20;
-	} else {
-		/* replace addi with nop if lower_immediate is empty */
-		addi_insn = RISCV_INSN_NOP4;
-	}
+	/* replace upper 12 bits of addi with lower 12 bits of val */
+	addi_insn &= 0x000fffff;
+	addi_insn |= (lower_immediate & 0x00000fff) << 20;
 
 	addi_res = cpu_to_le32(addi_insn);
 	lui_res = cpu_to_le32(lui_insn);
-- 
2.49.0

