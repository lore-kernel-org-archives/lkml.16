Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14DD2063CB
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738657703; cv=none; b=OEY7odqiP7uVTo6xS6GIiOWLOZr6Y5Mm/OdTdqDcGrh/HwSX1h+rLcaHUL0i3JOfuzI61DRKN2zi6o61NbtCVvaBsznpHs5mHCxMHeyecmc+oCQtXPpEya9w8+zBdBxl3NLsCwUIQmuXdTnzN1e6lNWQPsz3eytAdlc0BWMaZEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738657703; c=relaxed/simple;
	bh=CsF4+nuf/AM/OsVv+FH2FXUaB/ofkCk5+2D3gpm1St8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LHsHJ40I5RHK9Z6ars2E7EXJysgFAW3DS7UbxznTVeSXg7HFOclU+W1WUhIGgg0XIoTPioTE9D1XuCnbdxyx5Z/qb+JvoMNy5VvykBAw8bunqH96vg4WqNuY8dulwn4/1oISSm6uog1O8uJpk+ogYHznN/mWve5En+baZE9d5a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dFv7EHfm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cDFUmSHW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dFv7EHfm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cDFUmSHW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dFv7EHfm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cDFUmSHW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dFv7EHfm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cDFUmSHW"
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out1.suse.de (Postfix) with ESMTP id AB8C021102;
	Tue,  4 Feb 2025 08:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738657699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ueZJENhFmqxCDCfMr0f5hMTIbOvm/X56I5HrFFhEOPQ=;
	b=dFv7EHfmYh3C3Jea8QMhoMa9cE2WwgDaJWHdZx7304SlbraygrFKWmEP/YY9Qix3hUnL5O
	UlcH/m6AX4AR2gcxBKuSySQc4ZY8iZ2muni7cYaSeVi+BpxFusNlq70PMcDcIHngGuFNfS
	iHtUt8QrdHPxmFPKW5EqVPc6isz1eN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738657699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ueZJENhFmqxCDCfMr0f5hMTIbOvm/X56I5HrFFhEOPQ=;
	b=cDFUmSHWzMp1a5BZmIvBbVG7eAHrS4yWLyk7hogKeROH5sp5sh/oV3DMVnIR44M6lIoTsi
	aPK8e2iZG/bAQYAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dFv7EHfm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cDFUmSHW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738657699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ueZJENhFmqxCDCfMr0f5hMTIbOvm/X56I5HrFFhEOPQ=;
	b=dFv7EHfmYh3C3Jea8QMhoMa9cE2WwgDaJWHdZx7304SlbraygrFKWmEP/YY9Qix3hUnL5O
	UlcH/m6AX4AR2gcxBKuSySQc4ZY8iZ2muni7cYaSeVi+BpxFusNlq70PMcDcIHngGuFNfS
	iHtUt8QrdHPxmFPKW5EqVPc6isz1eN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738657699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ueZJENhFmqxCDCfMr0f5hMTIbOvm/X56I5HrFFhEOPQ=;
	b=cDFUmSHWzMp1a5BZmIvBbVG7eAHrS4yWLyk7hogKeROH5sp5sh/oV3DMVnIR44M6lIoTsi
	aPK8e2iZG/bAQYAQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 927364A0517; Tue,  4 Feb 2025 09:28:19 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
In-Reply-To: <A31D967F-B057-4C6D-B403-B4FB3973F185@jrtc27.com> (Jessica
	Clarke's message of "Mon, 3 Feb 2025 21:25:00 +0000")
References: <mvmfrkv2vhz.fsf@suse.de>
	<A31D967F-B057-4C6D-B403-B4FB3973F185@jrtc27.com>
Date: Tue, 04 Feb 2025 09:28:19 +0100
Message-ID: <mvm7c662jx8.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [14.38 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	NEURAL_SPAM_SHORT(2.09)[0.696];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MX_GOOD(-0.01)[];
	FROM_EQ_ENVFROM(0.00)[];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Flag: YES
X-Spam-Score: 14.38
X-Rspamd-Queue-Id: AB8C021102
X-Rspamd-Action: add header
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Bar: ++++++++++++++
X-Spam-Level: **************
X-Spam: Yes

On Feb 03 2025, Jessica Clarke wrote:

> On 3 Feb 2025, at 10:06, Andreas Schwab <schwab@suse.de> wrote:
>> 
>> Make sure the compare value in the lr/sc loop is sign extended to match
>> what lr.w does.  Fortunately, due to the compiler keeping the register
>> contents sign extended anyway the lack of the explicit extension didn't
>> result in wrong code so far, but this cannot be relied upon.
>
> GCC may guarantee this today,

It doesn't, that's the point!

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
