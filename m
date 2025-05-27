Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A603F8460
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748317545; cv=none; b=GJkri5zSa6XQHQyw/dABpr66eWrsxx54cS2qV/OUBt7mSz6lOH6qMeKrk8LT39RaeU31Z68Zo0k0FMahPAHo8I58+3qKGvNmc4ra+kYxeQi7rvpajjRFXRwLPYQtt34aXJHrfbHrY1t9gEwoFaPSmqFzNwrnavI+69ML0/SFR8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748317545; c=relaxed/simple;
	bh=iIhYXxZiXzP1nOmODNSrHuhwjAVawSq7mltuOEeOpLI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=kX+hdEsyGTyGaxs/mEF9tLoRqNRAca66CTf98ffVHcEgeFUOyTYkibs7X8LE5jmgnwAMYYIu+URfzLlRod79ga44alFGJiOF/G1MJSoOn2ppatSF2XagHGDfeomkZSq/gTy6YQTgZOTeW9643DeXQiR44ZmyAdChcgynwJ9MLro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=abMzPC8u; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="abMzPC8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1748317532; bh=HEP8M2++02Q2nGa/KrIRO1wnBG+GhLuBDildhfq5FJ8=;
	h=From:To:Cc:Subject:Date;
	b=abMzPC8uq56dmpSaB67tu6Q/EiSdeV4RkWZHCfQDWCAjBqYYKO2X0wXTj3GFbgbib
	 05qyKXsLU2ixS9h7v5O2NyTY478Tdcu1pk62tsAJ0pFCBx1XQglbPAJUaXiR8PljnF
	 P9JWM8uVP8hFp9LQSRRqJCb7aZwC4Vw56VC1FckI=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id B5D2FA08; Tue, 27 May 2025 11:45:29 +0800
X-QQ-mid: xmsmtpt1748317529tcvff8lxm
Message-ID: <tencent_27A451976AF76E66DF1379C3604976A3A505@qq.com>
X-QQ-XMAILINFO: M3vv73qU6a4uejIKGc9BXxeApuz7c/+QvRfcumYJyl+UYV7/OWQkZ+N1K7rnJE
	 IMb3bxs0SYYtEEtlJVuZZtCuMOHB2fY4tbMAB6brpaysGwS1n178ja3qMOB6/dYbAntTIQxhyApR
	 DfdZfWF/hb7UgL2kqhLuW4oeBdUgsR9/wgrLIxHukiBYDrvvLFgxFitIN5aTm84XySybcwnaEoOC
	 r5N4szUYp9vhGrTbINdh94ZGYt2eaRGAEmeDAUcUiyqu6GH+605vnnjxNrvd5k4Wo2Of/yPxX5IH
	 YQao9JY2yQHM5XwqOxmwHiie7xuNqzY1aX2NK/za05icVhfjRtMIk/sRNHZZydJMH4qZjIu74FKo
	 MhxNbDeP80E0k2MJJVDY3EjXsLTfKDKyUEAJtTR7B5YgjW0GSbLcdqsfuebU8Z7B3GKMr9st1QSY
	 25RcUP7leAT9M5/WOlV7/1T/CvQMbJULCwiS2som+ccSNcCrVZopKhEn6buHML8JPZHGdB/YA6CB
	 9D8ss5s7YiSEwTLx/9Zvi9dVNqTHzvuDg3Wv/SQgQmfUK6GVqmxV0J9kFNl0s12xfnQG+8D0nyZN
	 eOA6azqfbCpRCtksOhqHaKMT7YggejLBR9Gf4gfgGo8WQ59A3sD3wwbxS70ZCucUpCLfGUdFgtSj
	 NAipMmThc2+ya6JXEFSd/40sGtfwhjS4kvfUIBK1CbRfx8T019dS9OEO3pRUQ7kmzhA2J805fV4Q
	 t0CT1nLYXTn+JiHazHx1f8wMWC9l5cpFi7AzNyEp1XJoMPAEoCBYSjPqfUvp3aS6G0AASXyTRdGK
	 +ac+MGSc9ZgUX0STx4UAuy1XxrBCLz8LoEt2HzwcJ9WMVZqwhbLpqh3mX4l2OGoAP/MvNNqd/n4W
	 rLyqI/v16tafQPnHyTDRoAlZ60+oLSlX6NQE+cr2nU9hj4YY3UOvAt7iJVam8r+Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: seanjc@google.com
Cc: pbonzini@redhat.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	binbin.wu@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH next] KVM: VMX: add noinstr for is_td_vcpu and is_td
Date: Tue, 27 May 2025 11:45:16 +0800
X-OQ-MSGID: <20250527034515.1569758-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

is_td() and is_td_vcpu() run in no instrumentation, so they are need
noinstr.

[1]
vmlinux.o: error: objtool: vmx_handle_nmi+0x47:
        call to is_td_vcpu.isra.0() leaves .noinstr.text section

Fixes: 7172c753c26a ("KVM: VMX: Move common fields of struct vcpu_{vmx,tdx} to a struct")
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 arch/x86/kvm/vmx/common.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/common.h b/arch/x86/kvm/vmx/common.h
index 8f46a06e2c44..70e0879c58f6 100644
--- a/arch/x86/kvm/vmx/common.h
+++ b/arch/x86/kvm/vmx/common.h
@@ -59,20 +59,20 @@ struct vcpu_vt {
 
 #ifdef CONFIG_KVM_INTEL_TDX
 
-static __always_inline bool is_td(struct kvm *kvm)
+static noinstr __always_inline bool is_td(struct kvm *kvm)
 {
 	return kvm->arch.vm_type == KVM_X86_TDX_VM;
 }
 
-static __always_inline bool is_td_vcpu(struct kvm_vcpu *vcpu)
+static noinstr __always_inline bool is_td_vcpu(struct kvm_vcpu *vcpu)
 {
 	return is_td(vcpu->kvm);
 }
 
 #else
 
-static inline bool is_td(struct kvm *kvm) { return false; }
-static inline bool is_td_vcpu(struct kvm_vcpu *vcpu) { return false; }
+static noinstr bool is_td(struct kvm *kvm) { return false; }
+static noinstr bool is_td_vcpu(struct kvm_vcpu *vcpu) { return false; }
 
 #endif
 
-- 
2.43.0

