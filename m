Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548C1279795
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746283179; cv=none; b=CvFy/BAA/HJCmvwDjMLKhIsn7Loa8Rig26WdgovSO58pa0wK6c/fbW7yAl59rM44vUPEqsVqNQKD7o51armX3ibPRP/S9fDdA1evvyn86JY3lJo9JjpS2EX5oTZPVo9w7Y2qb4SBnbzWe5eVSgqFO2JolknieZgUN7pK6Y4k/Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746283179; c=relaxed/simple;
	bh=bxlcEp3XLloySYmB0umuSp58rBdcgQI2Y7Ls+Su+gOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ajgjj9gbqhYIXX2U6oKACZcaxT3dC35MhmcuKpl5AE02/M8qHfGCtqqgQaJclW4B3T6L6WT8ohh70jz9FKeHhaJDcPXLyDmgHW0kGfDzijQO/vOrh+B+ufp0w9XJI/+E2PQXMOLUo1b81DxIX+bm6Hj5r01+aTeMH0IZY22a+u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rxl3mDxw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rxl3mDxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746283177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=tIHKjKMdn85kvtz0zo6P6CjufT263uyReZrlNc9Pyh0=;
	b=Rxl3mDxw3LfLoQBHwzC13PiuPFSrkaoqlTe3sD3bpRK5nP9RsVds4EhvuR1+mJ4NhZImo+
	dXF2IrHHd9G7DfOH7BQYLBZe8BiiiSs1gY78ubnERHLUsJGzIgNUOL2pKaGKrxW6PIMc3K
	g0ioU4hJlu0fQfyvS7yvt8BuIOqxcQk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-mnEEVaHQPRW1X478oe6eMg-1; Sat,
 03 May 2025 10:39:31 -0400
X-MC-Unique: mnEEVaHQPRW1X478oe6eMg-1
X-Mimecast-MFC-AGG-ID: mnEEVaHQPRW1X478oe6eMg_1746283170
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 827DC19560AB;
	Sat,  3 May 2025 14:39:29 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.23])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 0FEB219560A3;
	Sat,  3 May 2025 14:39:24 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat,  3 May 2025 16:38:49 +0200 (CEST)
Date: Sat, 3 May 2025 16:38:43 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>
Subject: [PATCH tip/x86/fpu 3/6] x86/fpu: kill DEFINE_EVENT(x86_fpu,
 x86_fpu_copy_src)
Message-ID: <20250503143843.GA8989@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

trace_x86_fpu_copy_src() has no users after the commit 22aafe3bcb67
("x86/fpu: Remove init_task FPU state dependencies, add debugging
 warning for PF_KTHREAD tasks").

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/x86/include/asm/trace/fpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/include/asm/trace/fpu.h b/arch/x86/include/asm/trace/fpu.h
index 4645a6334063..0454d5e60e5d 100644
--- a/arch/x86/include/asm/trace/fpu.h
+++ b/arch/x86/include/asm/trace/fpu.h
@@ -74,11 +74,6 @@ DEFINE_EVENT(x86_fpu, x86_fpu_dropped,
 	TP_ARGS(fpu)
 );
 
-DEFINE_EVENT(x86_fpu, x86_fpu_copy_src,
-	TP_PROTO(struct fpu *fpu),
-	TP_ARGS(fpu)
-);
-
 DEFINE_EVENT(x86_fpu, x86_fpu_copy_dst,
 	TP_PROTO(struct fpu *fpu),
 	TP_ARGS(fpu)
-- 
2.25.1.362.g51ebf55

