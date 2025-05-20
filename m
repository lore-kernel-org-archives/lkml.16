Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D59262FC3
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740472; cv=none; b=Hxad5e42oVmzBpgjY+G+u48hM/hmMPqVG/1jqAVQNvoZUDXzJP5pvKmdvoENVXV22F4RuuyLiDPptNnW0lSZXvkQRSMMpOTrD84JlLagPPyvInLS4pXICdFMeA/FVpUtAGNhhCl74Tq7YtNwyoFDRafqj2VGLfEnegcLMfSCx6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740472; c=relaxed/simple;
	bh=htrOufTMdVGsQeeVbhln8pYotRbmj4g8NPW1ncMnDGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPmqs1qNSPAwkA9odrsqE6Qevcz+fh9HZTl4mwK7CAM9Y2FblrIqHJf98F4e3okRw/fcp/9CyIouwghD0li51ahxLR739u7bRlQkY6QfLBmWErMm0457ZOxTbx1xXUhN5EW6pq/HO8hF3z9u98+zQPamXzUDcO1lt413T6JqG2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MJwBNzfz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ldVncwGa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MJwBNzfz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ldVncwGa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MJwBNzfz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ldVncwGa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MJwBNzfz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ldVncwGa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C107D22CC4;
	Tue, 20 May 2025 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747740467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UEX7OsHWIEgspZXHE2rRryNwEqISo3yQFkgTMBe/9ZU=;
	b=MJwBNzfz39kZc8JTbFJXl8yw7Y3Rm8uylVwJ0YI+Oj1/iTThe4FXfFLoS2TfgItJVfa3dG
	42Lum+gtJTcbd8Mhtg7/qExni/dcFUL8b+VLL9urATEtM8NPpGhzkDt714hvlE43x5N0sa
	nhxqTwREICsR8uRHyY1f55Cm7SD4ylg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747740467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UEX7OsHWIEgspZXHE2rRryNwEqISo3yQFkgTMBe/9ZU=;
	b=ldVncwGaGAKwS6njNucEYNjBLcjykttvH7UgcT7LrVR1mcciVUll4ZlIV3MkvOJIS7Mhun
	ohF5nwPb+SI7FqBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747740467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UEX7OsHWIEgspZXHE2rRryNwEqISo3yQFkgTMBe/9ZU=;
	b=MJwBNzfz39kZc8JTbFJXl8yw7Y3Rm8uylVwJ0YI+Oj1/iTThe4FXfFLoS2TfgItJVfa3dG
	42Lum+gtJTcbd8Mhtg7/qExni/dcFUL8b+VLL9urATEtM8NPpGhzkDt714hvlE43x5N0sa
	nhxqTwREICsR8uRHyY1f55Cm7SD4ylg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747740467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UEX7OsHWIEgspZXHE2rRryNwEqISo3yQFkgTMBe/9ZU=;
	b=ldVncwGaGAKwS6njNucEYNjBLcjykttvH7UgcT7LrVR1mcciVUll4ZlIV3MkvOJIS7Mhun
	ohF5nwPb+SI7FqBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1FB513A3F;
	Tue, 20 May 2025 11:27:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3l7kJjNnLGhgeAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 20 May 2025 11:27:47 +0000
Date: Tue, 20 May 2025 13:27:31 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Wenjie Xu <xuwenjie04@baidu.com>
Cc: muchun.song@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Li RongQing <lirongqing@baidu.com>
Subject: Re: [PATCH] hugetlb: Show nr_huge_pages in report_hugepages()
Message-ID: <aCxnI-7mS7XzGjeX@localhost.localdomain>
References: <20250515114231.65824-1-xuwenjie04@baidu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515114231.65824-1-xuwenjie04@baidu.com>
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]

On Thu, May 15, 2025 at 07:42:31PM +0800, Wenjie Xu wrote:
> The number of pre-allocated huge pages should be nr_huge_pages, not
> free_huge_pages, although they are same during booting stage
> 
> Signed-off-by: Wenjie Xu <xuwenjie04@baidu.com>
> Signed-off-by: Li RongQing <lirongqing@baidu.com>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
