Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C92046BB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516714; cv=none; b=Ob1pd2L3WIK8/aoXhB33GpfwjOVQC6Q5BHJSAN35MpHFCQbkVL54mHy44CbbF95iAZvPpgshv0yC8Yk7Ca/TEBJ6XDio5pyq24IT8eVFW1hgl5R0hxNyfM58YQb82mVoLL1L01tk4D+pBbdCtFTReGc9JDMzbBhzSJUwqCplUnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516714; c=relaxed/simple;
	bh=YbunYiIfPtvKAcY2+sn82S8+Oomzphi+OmkpdLWSus8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=my79vrbLqVZ1ocEPjrStHYdUaB23alfqr0lu0HahmRMVOgsCbsYUEZaJaWk4P5AFDYQfojrJIHo8yMkhiAAEsTT6LedPaoIjngLOXNWDXfUz8yAMUe7kgGZCDR6Y0GWOarQddgi3aUJxw2tP46SWPzyoz7CvmQe7Wsk6YiDx65g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aMhIagR6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fQ6Fn7IO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aMhIagR6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fQ6Fn7IO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aMhIagR6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fQ6Fn7IO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aMhIagR6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fQ6Fn7IO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 423B3211F3;
	Tue,  1 Apr 2025 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743516711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K75sT1uOE2o2JxpuzJK0ApZypw9om3Mo5Rbs9DxBWvg=;
	b=aMhIagR6HcL2s1dNtPineA2kIKgnebcZC6J5FJ2AE87CDn+j47OISMOq7ASVn+8iZB7WHM
	kMaZPxe1K+MmHE4z912HZcnpvkUZjf88hAApOa8PU1o94kK9gRTiD2/+Nj4BnNTsunXyxv
	djrt78yTTrJW+wYpfMa44tpuP3UYGCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743516711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K75sT1uOE2o2JxpuzJK0ApZypw9om3Mo5Rbs9DxBWvg=;
	b=fQ6Fn7IOyJLaoFncWAx4DD5C2/UvUox1o1Lg+YsHn9Irntk+D/M2MeTbr84D3vi0fmttT/
	vCM8Y8oLMaaz2uDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743516711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K75sT1uOE2o2JxpuzJK0ApZypw9om3Mo5Rbs9DxBWvg=;
	b=aMhIagR6HcL2s1dNtPineA2kIKgnebcZC6J5FJ2AE87CDn+j47OISMOq7ASVn+8iZB7WHM
	kMaZPxe1K+MmHE4z912HZcnpvkUZjf88hAApOa8PU1o94kK9gRTiD2/+Nj4BnNTsunXyxv
	djrt78yTTrJW+wYpfMa44tpuP3UYGCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743516711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K75sT1uOE2o2JxpuzJK0ApZypw9om3Mo5Rbs9DxBWvg=;
	b=fQ6Fn7IOyJLaoFncWAx4DD5C2/UvUox1o1Lg+YsHn9Irntk+D/M2MeTbr84D3vi0fmttT/
	vCM8Y8oLMaaz2uDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E09AB138A5;
	Tue,  1 Apr 2025 14:11:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aKUmNCb062frXwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 01 Apr 2025 14:11:50 +0000
Date: Tue, 1 Apr 2025 16:11:45 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Baoquan He <bhe@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
Subject: Re: [PATCH v2 4/7] mm/gup: remove gup_fast_pgd_leaf() and clean up
 the relevant codes
Message-ID: <Z-v0IRYjisOuNnMZ@localhost.localdomain>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-5-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331081327.256412-5-bhe@redhat.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,localhost.localdomain:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, Mar 31, 2025 at 04:13:24PM +0800, Baoquan He wrote:
> In the current kernel, only pud huge page is supported in some
> architectures. P4d and pgd huge pages haven't been supported yet.
> And in mm/gup.c, there's no pgd huge page handling in the
> follow_page_mask() code path. Hence it doesn't make sense to have
> gup_fast_pgd_leaf() in gup_fast code path.
> 
> Here remove gup_fast_pgd_leaf() and clean up the relevant codes.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
