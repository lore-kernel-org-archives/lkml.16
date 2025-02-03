Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CE11863E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572126; cv=none; b=bKcAQKajHg0YmcgiapsgbxcFPn3xSUb+VHq7AVHCaSLJlxKNrr3Wyt2iCVWM2ziVA/qDhVQVS6Itdtf/6tfLh8Se0gb4P7jJBUa3R6nKs6x266A6Za+zgw6Hdu8q+fEOeNDeuOxXOJsJ8Nn+b9g99FGUVjTux9q2nlD0ulzd8OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572126; c=relaxed/simple;
	bh=74fw3xdv4hrZAr9Oj60XyR0wJAQXEZ9u8tR4pi6ZN0Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=owwJS/CcJsfe7YDI9tkAAncdyOswhV+1qdQZrVXOSpOGgoLSrrQC8awDdNka6WcuTvGHKfGZxniF5FwnqRlWjoJQS7YWFkBjTTxFW5ZRF6+GhSBSTN5F6a787En62MRuHPjOp67FZPOqhkU4c9T8lcgtR1tPC45+VcZg8b0inTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dMrAk6Kj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5C2qnMQt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dMrAk6Kj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5C2qnMQt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dMrAk6Kj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5C2qnMQt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dMrAk6Kj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5C2qnMQt"
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id BC7812115C;
	Mon,  3 Feb 2025 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738572122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMhCIlOH9NIe7h5EnD+8+3/+PiMl7AWO2+4/9VnEWp4=;
	b=dMrAk6Kj3CzFRFp8ks+pDXOWRYOzLtTvurvFSjv+oYhLr7GRihr7nAkj2QEtUdQf03hGxf
	oLsp9PiBcLttWy12cRiCFvmwfJjiU8eNV9u3fay48O+3QXKhelO7vFfUW460QsJv2ekoHd
	dCGXp8eck1ptZnUMInRegnhMBi/93Ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738572122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMhCIlOH9NIe7h5EnD+8+3/+PiMl7AWO2+4/9VnEWp4=;
	b=5C2qnMQttcfXV8+R0RukR0YGvicOCV9/PY00IjDdNsMe+XRTsMneOsi8FTqE/OT4pW60oU
	uh3/nSNKu/zRPPBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738572122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMhCIlOH9NIe7h5EnD+8+3/+PiMl7AWO2+4/9VnEWp4=;
	b=dMrAk6Kj3CzFRFp8ks+pDXOWRYOzLtTvurvFSjv+oYhLr7GRihr7nAkj2QEtUdQf03hGxf
	oLsp9PiBcLttWy12cRiCFvmwfJjiU8eNV9u3fay48O+3QXKhelO7vFfUW460QsJv2ekoHd
	dCGXp8eck1ptZnUMInRegnhMBi/93Ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738572122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMhCIlOH9NIe7h5EnD+8+3/+PiMl7AWO2+4/9VnEWp4=;
	b=5C2qnMQttcfXV8+R0RukR0YGvicOCV9/PY00IjDdNsMe+XRTsMneOsi8FTqE/OT4pW60oU
	uh3/nSNKu/zRPPBA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id AC2614A0551; Mon,  3 Feb 2025 09:42:02 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
In-Reply-To: <20250130213504.285b4675@pumpkin> (David Laight's message of
	"Thu, 30 Jan 2025 21:35:04 +0000")
References: <mvmed0k4prh.fsf@suse.de> <20250130213504.285b4675@pumpkin>
Date: Mon, 03 Feb 2025 09:42:02 +0100
Message-ID: <mvmseov2zdx.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -4.19
X-Spamd-Result: default: False [-4.19 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.964];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Jan 30 2025, David Laight wrote:

> On Thu, 30 Jan 2025 10:25:38 +0100
> Andreas Schwab <schwab@suse.de> wrote:
>
>> Sign extend also an unsigned compare value to match what lr.w is doing.
>> Otherwise try_cmpxchg may spuriously return true when used on a u32 value
>> that has the sign bit set, as it happens often in inode_set_ctime_current.
>> 
>> Do this in three conversion steps.  The first conversion to long is needed
>> to avoid a -Wpointer-to-int-cast warning when arch_cmpxchg is used with a
>> pointer type.
>
> Doesn't that break things by discarding the high bits of a pointer value?

If you have 32-bit pointers then the conversions are no-ops.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
