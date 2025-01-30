Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B520139B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738229141; cv=none; b=SkvSsUoQ99EzhKsTMHUVIt3Js9pZ6lfy+gyp5t2oZP0GrsAU86MPvaVr7hc6L6MlUkrd8tJptQcq5ktb9mXyDedeiu5/g+yQsw0zbb77DgyitZ7RNGn8WIaSouPNfvn+tV4/2odfAgLthKnxNT7H5eVsiZShFM6HXPpK4oLRIQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738229141; c=relaxed/simple;
	bh=KbpF/GXDpnzgJ48ChC3iLYxhq725lhhd0xb+cKjAT4Y=;
	h=From:To:Subject:CC:Date:Message-ID:MIME-Version:Content-Type; b=BzqX1IZ+AEFL1T/qRaCDEwCdKOWY8gaU6dtQnre0oFV9SqjQnZBrWQ8ROBBTXNabljce+BTLOqPVI9ehdzTDekMhVCZvRlEb/rZXzUUmrElXMQe5tkphSJHblYbwkjBbwBKPYarRQdkU9VUxRqo6WBHrj7TRXDueu7NZM7RVobk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OccbLQ3b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3b/ogrd7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OccbLQ3b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3b/ogrd7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OccbLQ3b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3b/ogrd7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OccbLQ3b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3b/ogrd7"
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id AE4C520D83;
	Thu, 30 Jan 2025 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738229138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=60vaxQ07mmbPiwElb15dQhe+W2ORrBdREjdkh0TLzjw=;
	b=OccbLQ3bB04rK4tMLPHJxrrIEY9Ax2k6nxepRUeg9I+N+w9rHwuDSaldYOo1AjThx6j4Ux
	o07VF/8iUjaVS6EZmrieU3By2lBeqj7YplXFgBfNNNmW9oLLMx75wyS9nD/fVRLVyUj/lq
	lnQOAgZRudjT6kg8AeGaIWSYLyxJ1tg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738229138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=60vaxQ07mmbPiwElb15dQhe+W2ORrBdREjdkh0TLzjw=;
	b=3b/ogrd7PC2IozXVhtO9sgs1x9OlnOnDZCG3S4wVCActuwqkfAGgKQCUUn2r7dCTTMRv6M
	U+HPMm0ASNlU/RAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OccbLQ3b;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="3b/ogrd7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738229138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=60vaxQ07mmbPiwElb15dQhe+W2ORrBdREjdkh0TLzjw=;
	b=OccbLQ3bB04rK4tMLPHJxrrIEY9Ax2k6nxepRUeg9I+N+w9rHwuDSaldYOo1AjThx6j4Ux
	o07VF/8iUjaVS6EZmrieU3By2lBeqj7YplXFgBfNNNmW9oLLMx75wyS9nD/fVRLVyUj/lq
	lnQOAgZRudjT6kg8AeGaIWSYLyxJ1tg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738229138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=60vaxQ07mmbPiwElb15dQhe+W2ORrBdREjdkh0TLzjw=;
	b=3b/ogrd7PC2IozXVhtO9sgs1x9OlnOnDZCG3S4wVCActuwqkfAGgKQCUUn2r7dCTTMRv6M
	U+HPMm0ASNlU/RAQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 6AB444A056A; Thu, 30 Jan 2025 10:25:38 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv/atomic: Do proper sign extension also for unsigned in
 arch_cmpxchg
CC: linux-kernel@vger.kernel.org
Date: Thu, 30 Jan 2025 10:25:38 +0100
Message-ID: <mvmed0k4prh.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Level: **
X-Spamd-Result: default: False [2.59 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: 2.59
X-Spamd-Bar: ++
X-Rspamd-Queue-Id: AE4C520D83
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO

Sign extend also an unsigned compare value to match what lr.w is doing.
Otherwise try_cmpxchg may spuriously return true when used on a u32 value
that has the sign bit set, as it happens often in inode_set_ctime_current.

Do this in three conversion steps.  The first conversion to long is needed
to avoid a -Wpointer-to-int-cast warning when arch_cmpxchg is used with a
pointer type.  Then convert to int and back to long to always sign extend
the 32-bit value to 64-bit.

Fixes: 6c58f25e6938 ("riscv/atomic: Fix sign extension for RV64I")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/include/asm/cmpxchg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 4cadc56220fe..427c41dde643 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -231,7 +231,7 @@
 		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
 			       sc_prepend, sc_append,			\
 			       cas_prepend, cas_append,			\
-			       __ret, __ptr, (long), __old, __new);	\
+			       __ret, __ptr, (long)(int)(long), __old, __new);	\
 		break;							\
 	case 8:								\
 		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
-- 
2.48.1


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
