Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CD9268FF4
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746283189; cv=none; b=ZNfL36+OlCMYfu0oErmwxdTjTLqf9ZxEyMwqza47dAy6MIliz7X8rreF+opw6/3iEuBMNZyOEDHwqnzfUKKgEyUqGhdosS1dB75M7Dn6yRwK8RFl6Yovkf4TT9Ed2DUHHPSovQIzdQobOYNNnt/sY9yev4OMT2FJ9eQCvhJImSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746283189; c=relaxed/simple;
	bh=X2H9vXmKjO+gJWdzLddERjKxcXf8lPOxIeoMy8671J0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Dqoi/e6fE+57uBcJ9sGT+HA+VcP0J8/zTYa0CGT12oAmAC1+8rDrcIQWyr+wpIfjCVHNc9fUHhKtwVhYOwze0pRXji6VjDPbeelaYi6XjL610Ug6pjXxDA8bW5gRVUYJ99d0DkdvF4b2uGIST5QCNzZYDdEMvF9LCiUbHOp56FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ibhq5zxa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ibhq5zxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746283185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=+DmxfC8rGy/UAYF1Q6xSBguY0xVPIRYkk0B3H71yht8=;
	b=Ibhq5zxaMsbKX0ISG3LaiNhAAScZOvIo2MP8fssRgXgbpvPL7Icg+M66pfTAxTUAXmxIi+
	jGj/fEPSXzOlMFaozgQqEzVIY55uUHtl2nVAqAfKQJcQabaqsR8SDxLOmJXUX35X+Q790l
	CDILmHJYLE14vd1qT6zooweCkrcr64U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-43-Pck23KyaPW-2geQtqQnEvQ-1; Sat,
 03 May 2025 10:39:43 -0400
X-MC-Unique: Pck23KyaPW-2geQtqQnEvQ-1
X-Mimecast-MFC-AGG-ID: Pck23KyaPW-2geQtqQnEvQ_1746283182
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4A4219560AE;
	Sat,  3 May 2025 14:39:41 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.23])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id BA51C180036E;
	Sat,  3 May 2025 14:39:37 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat,  3 May 2025 16:39:01 +0200 (CEST)
Date: Sat, 3 May 2025 16:38:56 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>
Subject: [PATCH tip/x86/fpu 5/6] x86/fpu: fpu__drop: check TIF_NEED_FPU_LOAD
 instead of PF_KTHREAD|PF_USER_WORKER
Message-ID: <20250503143856.GA9009@redhat.com>
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

PF_KTHREAD|PF_USER_WORKER tasks should never clear TIF_NEED_FPU_LOAD,
so the TIF_NEED_FPU_LOAD check should equally filter them out.

And this way an exiting userspace task can avoid the unnecessary "fwait"
if it does context_switch() at least once on its way to exit_thread().

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/x86/kernel/fpu/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index 8d674435f173..fa131299c7da 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -693,8 +693,7 @@ void fpu__drop(struct task_struct *tsk)
 {
 	struct fpu *fpu;
 
-	/* PF_KTHREAD tasks do not use the FPU context area: */
-	if (tsk->flags & (PF_KTHREAD | PF_USER_WORKER))
+	if (test_tsk_thread_flag(tsk, TIF_NEED_FPU_LOAD))
 		return;
 
 	fpu = x86_task_fpu(tsk);
-- 
2.25.1.362.g51ebf55

