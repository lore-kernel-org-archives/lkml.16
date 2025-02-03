Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4EA3594B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738577165; cv=none; b=fZGOuMJy6FzWN20f7V9Xyx3O3RPs6ZtkhWLsspsRhFkW5KYoyt2hYcuMITkBljnqG/EpvqAu9XgbQ8u7KpuyiiC3q/KaLazGd8HWzfLulD06iKZ5ltt0KuTmmFme+PfdHTGRwpZgsokiPEcULv8olC1iVQ53q6gD+VwALKgvLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738577165; c=relaxed/simple;
	bh=OQwvpo4lOimhGs7WsqqCcM7Dk9AgaTXqK9gZIR6Yf6I=;
	h=From:To:Subject:CC:Date:Message-ID:MIME-Version:Content-Type; b=mHU61l0WyLFAg57fPDnDwDNDoCeL1ULzY2EAqvajAqLTmyTsWhPPWGWdWl/fYXgVs4vfc0zE3vXdPJaYLFkx80qrudp/mQaKvCfV4o6QSmoDDctZB/qoPe280a4fHdJSfuwFN+uvv04hhG/g2SEZdC/TquI+ZiIdbdmQ+VlWgpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k+4MV07Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jL0Yl/3s; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k+4MV07Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jL0Yl/3s; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k+4MV07Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jL0Yl/3s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k+4MV07Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jL0Yl/3s"
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 405A81F37C;
	Mon,  3 Feb 2025 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738577160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=z8WWUCewt8GWdziJ/b+QfhI909T7AMMSL3etFAdSg5I=;
	b=k+4MV07YEKE3WVQPcdYfmNRLjGuoGcSkZzHx+QMS7dR+v39cN65qC/so+uYHTvBymFW36W
	1kp40fddEGEyg3Hk4Fw3WSqWCrTYrXTVL07d+iUcZsXc1AFut7DoXGgnqIF6xF2uhRGrRR
	1/JthrOVxXwryIlRBhcpcHJ+XILZpaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738577160;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=z8WWUCewt8GWdziJ/b+QfhI909T7AMMSL3etFAdSg5I=;
	b=jL0Yl/3s3T0ZgX1pPpyYOZ0LVh3jtpm+ZmNeR/2Xi4vykMTKIethMnzqQacrRgrOSyFoG/
	cvCib8sF75tQO6BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738577160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=z8WWUCewt8GWdziJ/b+QfhI909T7AMMSL3etFAdSg5I=;
	b=k+4MV07YEKE3WVQPcdYfmNRLjGuoGcSkZzHx+QMS7dR+v39cN65qC/so+uYHTvBymFW36W
	1kp40fddEGEyg3Hk4Fw3WSqWCrTYrXTVL07d+iUcZsXc1AFut7DoXGgnqIF6xF2uhRGrRR
	1/JthrOVxXwryIlRBhcpcHJ+XILZpaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738577160;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=z8WWUCewt8GWdziJ/b+QfhI909T7AMMSL3etFAdSg5I=;
	b=jL0Yl/3s3T0ZgX1pPpyYOZ0LVh3jtpm+ZmNeR/2Xi4vykMTKIethMnzqQacrRgrOSyFoG/
	cvCib8sF75tQO6BQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 3224F4A0551; Mon,  3 Feb 2025 11:06:00 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
CC: linux-kernel@vger.kernel.org
Date: Mon, 03 Feb 2025 11:06:00 +0100
Message-ID: <mvmfrkv2vhz.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -4.20
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.986];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

Make sure the compare value in the lr/sc loop is sign extended to match
what lr.w does.  Fortunately, due to the compiler keeping the register
contents sign extended anyway the lack of the explicit extension didn't
result in wrong code so far, but this cannot be relied upon.

Fixes: b90edb33010b ("RISC-V: Add futex support.")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/include/asm/futex.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index fc8130f995c1..6907c456ac8c 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -93,7 +93,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %[r])	\
 		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %[r])	\
 	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
-	: [ov] "Jr" (oldval), [nv] "Jr" (newval)
+	: [ov] "Jr" ((long)(int)oldval), [nv] "Jr" (newval)
 	: "memory");
 	__disable_user_access();
 
-- 
2.48.1


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
