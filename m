Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AAF2798E6
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746283171; cv=none; b=Gz207wGz3ML12GGfUQaoKsxJ+KE0Z6/6kNZyRp/znUzTb4nmn0FyCUkArlxD9B3C80ADw5fk1VK/Pa0p8dc5Pirc9pSMRAsTym+IHu3lgeYii6JlOnOIRJZwUoa9pT3QL2u0t0fcg1hXBkmxKWxhxdLNCQuk4ZDfbkpFGhAQAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746283171; c=relaxed/simple;
	bh=oZ79jSZRMT8Kkoom2xxvOFIs5yo4Zgkj4Xkn+LlOXxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OsrfslGUiCxZCVVHiU/Bk5AVdJpJIWatCGnHGfan9O0CfKHN3V3DD2EQOy4nh8HJ3QWtm0/dX1lQMh6cJx7rYzDxBpY/+VTgpgQ1SlOzjM7dNdAqNR7xwm1baGbOHMt3z83tf+D5bJ1a9mMFXuC3qUrlNbidAJCmWE1eo3yxjW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e1E59XvA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e1E59XvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746283168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=faQPsERN80yWW4k1T0Fa5x0gtfy3HCm8A3emjTgbGw4=;
	b=e1E59XvALKlzlj+HpRVYzN/XploexUgLoFOYaHrTwpSPAZSmPsqK2cXAVwEVKPZITSMv7i
	zloM2thAM3UadfB3N1H80tY0lZuYtw0zKDFMJDDN9FeWolBfZsIZZMaLdtqkZmNhVUCafi
	jAEERvkalqY1e5cGI/c5iACKFwz6+Yw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-y7McgesyMCCWTjWUutGUBg-1; Sat,
 03 May 2025 10:39:25 -0400
X-MC-Unique: y7McgesyMCCWTjWUutGUBg-1
X-Mimecast-MFC-AGG-ID: y7McgesyMCCWTjWUutGUBg_1746283164
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2EFD0195608E;
	Sat,  3 May 2025 14:39:23 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.23])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D05E0180036E;
	Sat,  3 May 2025 14:39:18 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat,  3 May 2025 16:38:42 +0200 (CEST)
Date: Sat, 3 May 2025 16:38:37 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>
Subject: [PATCH tip/x86/fpu 2/6] x86/fpu: kill x86_init_fpu
Message-ID: <20250503143837.GA8985@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

It is not actually used after the commit 55bc30f2e34d ("x86/fpu: Remove
the thread::fpu pointer").

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/x86/kernel/fpu/init.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/x86/kernel/fpu/init.c b/arch/x86/kernel/fpu/init.c
index 2d9b5e677559..6bb3e35c40e2 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -71,13 +71,9 @@ static bool __init fpu__probe_without_cpuid(void)
 	return fsw == 0 && (fcw & 0x103f) == 0x003f;
 }
 
-static struct fpu x86_init_fpu __attribute__ ((aligned (64))) __read_mostly;
-
 static void __init fpu__init_system_early_generic(void)
 {
-	fpstate_reset(&x86_init_fpu);
 	set_thread_flag(TIF_NEED_FPU_LOAD);
-	x86_init_fpu.last_cpu = -1;
 
 	if (!boot_cpu_has(X86_FEATURE_CPUID) &&
 	    !test_bit(X86_FEATURE_FPU, (unsigned long *)cpu_caps_cleared)) {
-- 
2.25.1.362.g51ebf55

