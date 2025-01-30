Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962F71DDD1
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248734; cv=none; b=ATY5Hk3Wn9xvB2pMdM0gaVv4Mt59PmXfaw9KJ1/yBTQh6JIvwemBlPDE3sI2edkiOJqpr+b4ST3vAxDWZgMGb5fv+DpNl3XHiJPuSmerEtpW3b8oDyYEh1t8oFvvbsE72Hw2TaAbsK54VkT8eUL//ZrAUYDuPiCR5CRJphg8cXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248734; c=relaxed/simple;
	bh=zeoggCMS+X+9feZ0gl764yPeUUD79s2jdGQKWtAmjxY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Lw7KSGpSMmDeAaGl7jS5aGmwndFRfTYFL1Eg1qnbns5euHm/AIl4ZwYfV9GQS9fU5slqWuyK8BfU6PuRkUmIOG1/nfAZ4XwxqEiiQRXGx/pNyJzya2ZGBmfUPLeqCUHPiJGKeNm+CT8HXbjzw5i0Emu339kKsaO+tfng0DRcx+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zu+LCcRG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZlNBkuYV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=elIz4k7N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xvQQ0L+q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zu+LCcRG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZlNBkuYV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="elIz4k7N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xvQQ0L+q"
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 3C3191F383;
	Thu, 30 Jan 2025 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738248730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hhjXRQBcL+Vc8yB+vfF7shV11ojC6g+eIdGRk4/e074=;
	b=zu+LCcRGwpayK7X8rIG3sMIQ53MV1vsXD3x/1mZdiX61LoQWBTrAfaY22GCv6Exi57xuiB
	K+Ul7riIkr3DUQ0BCYqJ6uEhhC5SP+ORQNZaD9zT6u4M+vsJtANnla/RnYOM+XRJUCcq7g
	CNLIMkIkv6t6dJeDN6KZWIy57lJPsbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738248730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hhjXRQBcL+Vc8yB+vfF7shV11ojC6g+eIdGRk4/e074=;
	b=ZlNBkuYVRgI7OyK18RhCJ0QMZ7X/MYm6vWi2G2OH1Ggb1T7HimjlxYHlXwh0dTgd5f9dsO
	MgOzu7SAOrQR/hDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738248729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hhjXRQBcL+Vc8yB+vfF7shV11ojC6g+eIdGRk4/e074=;
	b=elIz4k7Ng3fqf0IoYQ9FbXQI5bCJ+UBI6MFkaeOUcBmGfRp70lgRjP6rt1lDqkYsxy+22x
	T66/oEE8U77G3acVGTfH+tkSapgsPWCUzQflb42EFsOTYK4Jvi9yY7MFtxvSHppZ3XkY6G
	X3AEu8NSR/LyGJlKR+sG596FJs+xYPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738248729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hhjXRQBcL+Vc8yB+vfF7shV11ojC6g+eIdGRk4/e074=;
	b=xvQQ0L+qTb3V+8jEEJFMhOU6TIhgNliVkND+JbOgnM0ePy2psgMZqa7TVHP4+Y+Pyebsmu
	DuPeFDh1tiXZZBAg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 0D8694A03B1; Thu, 30 Jan 2025 15:52:08 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
In-Reply-To: <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> (Alexandre
	Ghiti's message of "Thu, 30 Jan 2025 15:18:54 +0100")
References: <mvmed0k4prh.fsf@suse.de>
	<c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr>
Date: Thu, 30 Jan 2025 15:52:08 +0100
Message-ID: <mvm5xlw4anb.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Level: 
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,bootlin.com:url,hawking.nue2.suse.org:helo]
X-Spam-Score: -4.20
X-Spam-Flag: NO

On Jan 30 2025, Alexandre Ghiti wrote:

> That's a nice catch indeed. IIUC, we have the same issue here
> https://elixir.bootlin.com/linux/v6.13/source/arch/riscv/include/asm/futex.h#L89
> right?

Indeed, though it doesn't result in wrong code currently.  This is
because the compare value is passed unmodified as u32 to the asm and the
compiler keeps the value sign extended in registers.  That would break
if you would add a cast to long like in commit 6c58f25e6938 as that
would erroneously zero extend it.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
