Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B01474CF
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738374932; cv=none; b=nol9tKWr3KnFZOSYfN+JGDQLLDPOaGNohH/98vnAbVfE5LLEO+tvLQqnZLrhUM2LTo9H1bjMVXbEPujAYfpe3Lhwo6VHuwSgLHS5Xwzf9cF4hgmlMVM66sy3mONT7cEM4oXauKTe+zV043ojhWcWmQFqLVZAAbL4Rw/swxRYuJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738374932; c=relaxed/simple;
	bh=UVo6Z/4dhiFoOhJN3891jfwkXaQHO7XmA6oXNp4w27k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M8TqozYOYHW7iaaqtcDUTvMw9wacJQpx0KIR26ubuNQvKNajKN7lnL3ZsEQf0BUm9fYeWmCzfIiWoMieLAWlHEwSjfjyNBpPdjbqyxdkgXQ7DxL2zi8NfkN1ViK4BLvEpDCLeW0X+VWMgV7vHbWJ4AAVesfTNwsIsgZca4qGfdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mzEZ5Vs9; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mzEZ5Vs9"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2166855029eso52187725ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738374930; x=1738979730; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0INf1hRV37RA1+YvoWbzTJR4dkVI99fKTSGmyPC5dJU=;
        b=mzEZ5Vs97O31l/9kt1fkZuYauIIbpjCeKMbgYDDnqRfI7tAH+JqYZ7JiGKepum6kSi
         sMsAOjezG5AT61e8Sg8y7+ftKjTF9N/hO2BQ75xLpS48efhBTLhQkwkxAZMLFcchmTVo
         ouFvVRijd2AWPVIlEMouW+lTPLJNoVKec7+QduM6BMSgOY/8SXx+1SC+RHtBqguaNAK6
         AGTM07VsC/rThvxKV81U6zKgpmlzJUnIRPi+2244yPkt9VGKLBichYKOALxXe314sncB
         uz23Qfyz4miMcqqCCghzvIECRTgmtlkXasa46tNwY+J46+quTwNxPw+9hwKmOdRfLxCU
         gy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738374930; x=1738979730;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0INf1hRV37RA1+YvoWbzTJR4dkVI99fKTSGmyPC5dJU=;
        b=VNNlKfGqV/gnrxZksQ+1DsifkHZq1lm/Q/7xNHNyEYr+BBgyFvfvNjpYvfDgHazGVe
         PP4/ZQTijzNAZQgPiU0effc9ONcZAjhnt8VXBUCK53AfPR8ONQyp8rOU6IxyJIST1rMe
         /baLLJt/iOeH0RZiyCJ2HiQ7iVTa8+9fMHluioQBNj4vcUIdGurkzcK7NNN931AQ3cL+
         tPitCKI0UG/gNInNnjxLgczcrJgM/MovC+EK+jWWdAGoChGklWWKnax3ZTYsSx7xmD3i
         wUznHWcuSXkfMdMjevZ1/oawxPJMGmVRF6U5hMju2M6KD2EHk0ZFSjp6kpLfpCzaUVYC
         eU1w==
X-Forwarded-Encrypted: i=1; AJvYcCUXzg4ttXLI+gnZXY/wtbPB+bSsFY3FirGugC4vA1u/iemNwsvVj2BOT8yu+yMYasvW+DJXbNIgTSK8ozQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi2eKdlyNiJYbhJn1NGcXiX4uH8SGMU4Wd4bVDoMppurlOMgpe
	EJTpU6kV6lZzTc7LYzNatwJwH2pyimwzvz/tqNr8FXKbSebk0oOAYPD8wtF4UGXorbYVkV9UT8V
	rnA==
X-Google-Smtp-Source: AGHT+IGLVsvqFq/nTpkDat1Ox1psJO6hj3GlefNPyyLrelICESYBuGk1uv8jjM8KmSylaMLfqRUmiTgQ0Cw=
X-Received: from pjbov11.prod.google.com ([2002:a17:90b:258b:b0:2ef:7352:9e97])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d582:b0:215:19ae:77bf
 with SMTP id d9443c01a7336-21dd7c66949mr218457115ad.19.1738374929971; Fri, 31
 Jan 2025 17:55:29 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 17:55:13 -0800
In-Reply-To: <20250201015518.689704-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201015518.689704-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201015518.689704-7-seanjc@google.com>
Subject: [PATCH v2 06/11] KVM: x86: Plumb the src/dst operand types through to .check_intercept()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When checking for intercept when emulating an instruction on behalf of L2,
forward the source and destination operand types to vendor code so that
VMX can synthesize the correct EXIT_QUALIFICATION for port I/O VM-Exits.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/emulate.c     | 2 ++
 arch/x86/kvm/kvm_emulate.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 0915b5e8aa71..ca613796b5af 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -477,6 +477,8 @@ static int emulator_check_intercept(struct x86_emulate_ctxt *ctxt,
 		.dst_val    = ctxt->dst.val64,
 		.src_bytes  = ctxt->src.bytes,
 		.dst_bytes  = ctxt->dst.bytes,
+		.src_type   = ctxt->src.type,
+		.dst_type   = ctxt->dst.type,
 		.ad_bytes   = ctxt->ad_bytes,
 		.next_rip   = ctxt->_eip,
 	};
diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
index 73072585e164..49ab8b060137 100644
--- a/arch/x86/kvm/kvm_emulate.h
+++ b/arch/x86/kvm/kvm_emulate.h
@@ -44,6 +44,8 @@ struct x86_instruction_info {
 	u64 dst_val;            /* value of destination operand         */
 	u8  src_bytes;          /* size of source operand               */
 	u8  dst_bytes;          /* size of destination operand          */
+	u8  src_type;		/* type of source operand		*/
+	u8  dst_type;		/* type of destination operand		*/
 	u8  ad_bytes;           /* size of src/dst address              */
 	u64 next_rip;           /* rip following the instruction        */
 };
-- 
2.48.1.362.g079036d154-goog

