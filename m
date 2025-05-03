Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F831269D17
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746283198; cv=none; b=qg2Xdb47Nz3l7+JRMNg40CrBRL+VLOlg4u1007KZpi8z5ATV1Tkowu2FFleYrtoj9WVBB4rVPbn94evOFGmxaQhp0aLC8wag4rukCwrbkq4pqdYStv01W/5b0ooW/qivod5n6Q9iBVMKU3CnxCdr7rzJurYrZTA6EzFwFhsqEwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746283198; c=relaxed/simple;
	bh=b5JPJapqkRDIx21L118l9yq8gn3tc0L4YKehzhlqPqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WBRNQn/syPSwpHfDPrhwuyOkQ9lcYdS3kVgHoXXtzheabQVGKvpPMo9O5j8IVl9QNh/vxttRfosWrSle064EsrlKAShHdr2VMGmFc0HW727hNZOJe+3elXYdWm2+pVHDcvKmz9vcvvp7vkz5GDUTq0BVJQ3gfifOiTfrqXdi2jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGf6FCHs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGf6FCHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746283195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=w53aMIvhRJSZKfkmYEz9W9UqbW6DfFdUeZrPEozRMig=;
	b=IGf6FCHs2oJ7NWnpi8fiL/zdDHkIKwip7yy2TNnHVCQPC39+yl940+LWJpckhh2Y3t3EPg
	q301duS24jOuGmX7m4lMQV0bEyNjYYbkqCody+QvKbi405e6kGcJIuTW0aNVActITmxAda
	q+d3IsKsZQkKXoG2/ocx07mDBMErDoo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-511-2l0EyNRwNU-SxHCLzmEEgQ-1; Sat,
 03 May 2025 10:39:49 -0400
X-MC-Unique: 2l0EyNRwNU-SxHCLzmEEgQ-1
X-Mimecast-MFC-AGG-ID: 2l0EyNRwNU-SxHCLzmEEgQ_1746283188
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0797A18001E0;
	Sat,  3 May 2025 14:39:48 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.23])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id C4FD41955F1B;
	Sat,  3 May 2025 14:39:43 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat,  3 May 2025 16:39:07 +0200 (CEST)
Date: Sat, 3 May 2025 16:39:02 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>
Subject: [PATCH tip/x86/fpu 6/6] x86/fpu: shift
 fpregs_assert_state_consistent() from arch_exit_work() to its caller
Message-ID: <20250503143902.GA9012@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409211127.3544993-1-mingo@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

If CONFIG_X86_DEBUG_FPU=Y, arch_exit_to_user_mode_prepare() calls
arch_exit_work() even if ti_work == 0. There only reason is that we
want to call fpregs_assert_state_consistent() if TIF_NEED_FPU_LOAD
is not set.

This looks confusing. arch_exit_to_user_mode_prepare() can just call
fpregs_assert_state_consistent() unconditionally, it depends on
CONFIG_X86_DEBUG_FPU and checks TIF_NEED_FPU_LOAD itself.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/x86/include/asm/entry-common.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/entry-common.h b/arch/x86/include/asm/entry-common.h
index 77d20555e04d..d535a97c7284 100644
--- a/arch/x86/include/asm/entry-common.h
+++ b/arch/x86/include/asm/entry-common.h
@@ -53,7 +53,6 @@ static inline void arch_exit_work(unsigned long ti_work)
 	if (unlikely(ti_work & _TIF_IO_BITMAP))
 		tss_update_io_bitmap();
 
-	fpregs_assert_state_consistent();
 	if (unlikely(ti_work & _TIF_NEED_FPU_LOAD))
 		switch_fpu_return();
 }
@@ -61,7 +60,9 @@ static inline void arch_exit_work(unsigned long ti_work)
 static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 						  unsigned long ti_work)
 {
-	if (IS_ENABLED(CONFIG_X86_DEBUG_FPU) || unlikely(ti_work))
+	fpregs_assert_state_consistent();
+
+	if (unlikely(ti_work))
 		arch_exit_work(ti_work);
 
 	fred_update_rsp0();
-- 
2.25.1.362.g51ebf55

