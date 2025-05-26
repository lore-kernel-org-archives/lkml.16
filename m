Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F992E406
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748264972; cv=none; b=MzE/OjX2dpXNK48DHranyM4tQuro6xh7T70UN0vvheGBP9s7FMSyKaJ0XRcuBzpxbuDDy9MJyutiRgMCTC0kH9jUKznFxLrmAJLZurIvlI22fmtUh8a02sTnU/2KEqshqv0OMWdxIe2x+hG4y4WaPXDXnroFy4RTnzG0T/NXzao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748264972; c=relaxed/simple;
	bh=czyUWYdCo0lN4SzicCu+X9GsHklwB/4UHLzlYQlbrao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAYihQ6SjtJqPez9+EN27La3XKj1d72S0yWT5fkyOqD+bqdgG2j4vOz3Ce+H4TI/+e/y/RJY/GqKkmlgzpHAGpRZt9wR2g1fceACBON7JSebYiWkh8QYV4KA2fL3HW3KGIZX56+owsJR/pdkfN+SHuLm8dB+C36y64gIGDDh/dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eWQTfob+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UpFOBgyK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eWQTfob+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UpFOBgyK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eWQTfob+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UpFOBgyK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eWQTfob+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UpFOBgyK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0DA2D21EB0;
	Mon, 26 May 2025 13:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748264969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5C5IGNkYyaWGbP7jsRwdyQSVn6ZmHY7oIIu9YJZuxxo=;
	b=eWQTfob+J44nLMVCSVIO/m3PxuoXbFYrBQ/fu9R1zES8Qsey3S3zVZLI+M8baqY6BNLNU7
	p3zR9Vvx+HyasyyGw4zLTH8E7zPdikfPEwMd4LazL/RynuMd3Y6chdXBua1cWjiUMhLnZo
	pH1diEsZf7SVNTUF/rFAeyfY+apFmX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748264969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5C5IGNkYyaWGbP7jsRwdyQSVn6ZmHY7oIIu9YJZuxxo=;
	b=UpFOBgyKxxqgYFkwbmKnncxuoVhq2c1KK7wGdEg/hN7Km1Od64RSo9+Z8cwnr3zQCiyO+a
	pQ7hhL02hhMX8TDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748264969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5C5IGNkYyaWGbP7jsRwdyQSVn6ZmHY7oIIu9YJZuxxo=;
	b=eWQTfob+J44nLMVCSVIO/m3PxuoXbFYrBQ/fu9R1zES8Qsey3S3zVZLI+M8baqY6BNLNU7
	p3zR9Vvx+HyasyyGw4zLTH8E7zPdikfPEwMd4LazL/RynuMd3Y6chdXBua1cWjiUMhLnZo
	pH1diEsZf7SVNTUF/rFAeyfY+apFmX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748264969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5C5IGNkYyaWGbP7jsRwdyQSVn6ZmHY7oIIu9YJZuxxo=;
	b=UpFOBgyKxxqgYFkwbmKnncxuoVhq2c1KK7wGdEg/hN7Km1Od64RSo9+Z8cwnr3zQCiyO+a
	pQ7hhL02hhMX8TDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8159B13964;
	Mon, 26 May 2025 13:09:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8efhHAhoNGgaMgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 26 May 2025 13:09:28 +0000
Date: Mon, 26 May 2025 15:09:26 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: yangge1116@126.com, akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
	baolin.wang@linux.alibaba.com, muchun.song@linux.dev,
	liuzixing@hygon.cn
Subject: Re: [PATCH] mm/hugetlb: remove redundant folio_test_hugetlb
Message-ID: <aDRoBhjJOXOXk300@localhost.localdomain>
References: <1747987559-23082-1-git-send-email-yangge1116@126.com>
 <427043ca-ae91-4386-8ffd-aaf164773226@redhat.com>
 <347b3035-26fe-43af-8df4-b1610d305908@redhat.com>
 <aDRnE8B27VgCoJ3N@localhost.localdomain>
 <d5d19df8-c774-4c78-82ca-e0839ed0e539@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5d19df8-c774-4c78-82ca-e0839ed0e539@redhat.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[126.com,linux-foundation.org,kvack.org,vger.kernel.org,gmail.com,linux.alibaba.com,linux.dev,hygon.cn];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

On Mon, May 26, 2025 at 03:06:41PM +0200, David Hildenbrand wrote:
> Yes, anything that involves hugetlb only id there is an indication of ...
> hugetlb :)

Yes, I guess that after weeks of only seeing hugetlb code I became
convinced everything is hugetlb :-D.

I will send a patch later today unless no one beats me before.

Thanks for noticing!


-- 
Oscar Salvador
SUSE Labs
