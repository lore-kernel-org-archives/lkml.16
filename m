Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB1A2798E6
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746283183; cv=none; b=h7aUGlGZGwdSBtC3xL3Pkmc2D0k5Kr0ipfg0kl9zVoAVOJ/26H1MX1zcYYEgGtI7jbk3aYyLduduS4SKhHogXRI/mebpwGd4kBsqyIUK4fnMH/98xR97CAX4e8SmiMRhr/5reY5me53dQcTI/LW3w3fcLRlX0TXYBvxL7SrewcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746283183; c=relaxed/simple;
	bh=Y1Ih+B7V3riu0tf9b1r2d+GpHBiYz/f+IiY2sNEbobg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hjmtYWuRl60OhkSUJ48vI2IJMfGysPBGPzexS5bh8ld5od7RDBcI/rJsKwtnVUvGdGvFNpc7oFBX14a0OlX0o/MG0qzNHGOU7rfHL3Y3hoIl2bqguDf8P+pcsQsFiqvMMuiJ9/JM1dOIqHZeeeWZiIOL8/iB0Xys8QoIgyApmD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FXMVcxfQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FXMVcxfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746283180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=j0kJYhfu8vF1mjLFoB0t+CIUCAM73kbVIq1ExPK13dQ=;
	b=FXMVcxfQDcUuirZJS9fYvlQazcsCvmS5hMbKA+TpKhA9JOhfvaJKn4NDWUf10ToBBnrLXg
	y+JgNJ4yAmo3IP+bTq3rmlpcEGqPYeT2QyryhZkJVFL6/OtXiDWZs9rWEFEpxBjy1BjLpr
	1YB8kLEmiW/oYke5OpebrnZnI0DUdyg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-yQZtQixpOzmbSMAQrDQVxA-1; Sat,
 03 May 2025 10:39:37 -0400
X-MC-Unique: yQZtQixpOzmbSMAQrDQVxA-1
X-Mimecast-MFC-AGG-ID: yQZtQixpOzmbSMAQrDQVxA_1746283176
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9BB93180056F;
	Sat,  3 May 2025 14:39:35 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.23])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 53F9D19560A3;
	Sat,  3 May 2025 14:39:31 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat,  3 May 2025 16:38:55 +0200 (CEST)
Date: Sat, 3 May 2025 16:38:50 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>
Subject: [PATCH tip/x86/fpu 4/6] x86/fpu: arch_dup_task_struct: always use
 memcpy_and_pad()
Message-ID: <20250503143850.GA8997@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

It makes no sense to copy the bytes after sizeof(struct task_struct),
FPU state will be initialized in fpu_clone().

A plain memcpy(dst, src, sizeof(struct task_struct)) should work too,
but "_and_pad" looks more safe.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/x86/kernel/process.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 7a1bfb61d86f..d01adc028274 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -93,11 +93,9 @@ EXPORT_PER_CPU_SYMBOL_GPL(__tss_limit_invalid);
  */
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
-	/* init_task is not dynamically sized (incomplete FPU state) */
-	if (unlikely(src == &init_task))
-		memcpy_and_pad(dst, arch_task_struct_size, src, sizeof(init_task), 0);
-	else
-		memcpy(dst, src, arch_task_struct_size);
+	/* fpu_clone() will initialize the "dst_fpu" memory */
+	memcpy_and_pad(dst, arch_task_struct_size, src,
+			sizeof(struct task_struct), 0);
 
 #ifdef CONFIG_VM86
 	dst->thread.vm86 = NULL;
-- 
2.25.1.362.g51ebf55

