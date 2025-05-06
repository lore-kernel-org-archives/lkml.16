Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076FC277021
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523263; cv=none; b=j0GeiaGAC2/3v3MKzxdUtBwK4uSQICY/WxCbdM+s4JqmW2YO+fNorV5N4splZTOHpv33RoqZBXW5EfYcL7O6JRSKuZienFvvgY3Zmq9EC68Zu6jF/5vz0Bt1cP7EzCplqmjbnmmZcJYzPWJY7pwZHRjxudmjS6y/RQIKhGgEdo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523263; c=relaxed/simple;
	bh=/mCIQwfL51f0bNbnkSPgQhFHZeS0CyvQ6XwDws26Oz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gV1NRhWB0pOp/ZVOxijwdyjueZx1vA548atXykRicspr/KDPPIXH5sqgxq+RS5+4WurS4/3rFQ5fgzkw87bMNPH1G0lXQlWAcKYWFT4CgH6GjhCdVGj3w+AMtvQyMywYPzksSz49emegS+V05gcUTy8trZtWOAHJ7HzCil8FmNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=KN5RYi3W; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=KN5RYi3W; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KN5RYi3W";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KN5RYi3W"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 76F8D21222;
	Tue,  6 May 2025 09:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746523258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vZ2K2J1ln19F+coajEe0NOzYd5qTlnxqf025hGnVDU=;
	b=KN5RYi3WKDf5r3VtKmNI3YmBwUzGzvePRrlML95vi4X0xhN9peoD1MOJLbxp5vLh1HRu0k
	Q+egWSynCrSzt014lYfd2E9PqTjhVD4ppQzcklbbLLGV3D6E8ObFKQGmNx5Nr1Hz9Sfs/q
	yITmmMV6OT/18+CQ/ixpOIu6S8aXeY8=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746523258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vZ2K2J1ln19F+coajEe0NOzYd5qTlnxqf025hGnVDU=;
	b=KN5RYi3WKDf5r3VtKmNI3YmBwUzGzvePRrlML95vi4X0xhN9peoD1MOJLbxp5vLh1HRu0k
	Q+egWSynCrSzt014lYfd2E9PqTjhVD4ppQzcklbbLLGV3D6E8ObFKQGmNx5Nr1Hz9Sfs/q
	yITmmMV6OT/18+CQ/ixpOIu6S8aXeY8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2534F137CF;
	Tue,  6 May 2025 09:20:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Uz6qB3rUGWg4bAAAD6G6ig
	(envelope-from <jgross@suse.com>); Tue, 06 May 2025 09:20:58 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: xin@zytor.com,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 6/6] x86/msr: reduce number of low level MSR access helpers
Date: Tue,  6 May 2025 11:20:15 +0200
Message-ID: <20250506092015.1849-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506092015.1849-1-jgross@suse.com>
References: <20250506092015.1849-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Some MSR access helpers are redundant now, so remove the no longer
needed ones.

At the same time make the native_*_msr_safe() helpers always inline.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h  | 20 ++++----------------
 arch/x86/xen/enlighten_pv.c |  4 ++--
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 3a94cffb6a3e..0e2ed1604015 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -101,12 +101,7 @@ static __always_inline u64 native_rdmsrq(u32 msr)
 #define native_wrmsrq(msr, val)				\
 	__wrmsrq((msr), (val))
 
-static inline u64 native_read_msr(u32 msr)
-{
-	return __rdmsr(msr);
-}
-
-static inline int native_read_msr_safe(u32 msr, u64 *p)
+static __always_inline int native_read_msr_safe(u32 msr, u64 *p)
 {
 	int err;
 	EAX_EDX_DECLARE_ARGS(val, low, high);
@@ -122,14 +117,7 @@ static inline int native_read_msr_safe(u32 msr, u64 *p)
 	return err;
 }
 
-/* Can be uninlined because referenced by paravirt */
-static inline void notrace native_write_msr(u32 msr, u64 val)
-{
-	native_wrmsrq(msr, val);
-}
-
-/* Can be uninlined because referenced by paravirt */
-static inline int notrace native_write_msr_safe(u32 msr, u64 val)
+static __always_inline int notrace native_write_msr_safe(u32 msr, u64 val)
 {
 	int err;
 
@@ -161,7 +149,7 @@ static inline u64 native_read_pmc(int counter)
 #include <linux/errno.h>
 static __always_inline u64 read_msr(u32 msr)
 {
-	return native_read_msr(msr);
+	return native_rdmsrq(msr);
 }
 
 static __always_inline int read_msr_safe(u32 msr, u64 *p)
@@ -171,7 +159,7 @@ static __always_inline int read_msr_safe(u32 msr, u64 *p)
 
 static __always_inline void write_msr(u32 msr, u64 val)
 {
-	native_write_msr(msr, val);
+	native_wrmsrq(msr, val);
 }
 
 static __always_inline int write_msr_safe(u32 msr, u64 val)
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index c279b2bef7eb..ea3d7d583254 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1097,7 +1097,7 @@ static u64 xen_do_read_msr(u32 msr, int *err)
 	if (err)
 		*err = native_read_msr_safe(msr, &val);
 	else
-		val = native_read_msr(msr);
+		val = native_rdmsrq(msr);
 
 	switch (msr) {
 	case MSR_IA32_APICBASE:
@@ -1156,7 +1156,7 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
 		if (err)
 			*err = native_write_msr_safe(msr, val);
 		else
-			native_write_msr(msr, val);
+			native_wrmsrq(msr, val);
 	}
 }
 
-- 
2.43.0

