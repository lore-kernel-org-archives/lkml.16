Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590641A0BD6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815766; cv=none; b=gobP2WgV2s5fTpupfIzUC3uNqAyKq4rA6r1KqBxKzH0sHjUc5dZ5UGl+Wifi/nEWdIRZuOkcMrqUGjDmoLyhP0azB5GrLjhxLhjInpV72Bghk2by2wkxdM0HWU5vpYDgfISkIZIpmJBZ3LEHhqA4j8iXeScDxs4CXinDPTg9mcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815766; c=relaxed/simple;
	bh=hFInTPyPvh6zLbC5lO5GPnnZNjactOaCyq570A7yph0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snoGvxWq3I5UOwlvkglBoXwLkyqGuurnBwLqQpe31/ldCpLQ42nQLFoaPE47rpq/loSTvn23mb4w6Lr+r22c28/VOksg7iS4Z4ktv5Rk+UfVEWAi4+10oPoxJJvCFYE5T/zaLHfqJ1LW/A+lZ1eSiwzov/FrO2Uo8aNEjrXDqRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FysPZ0vM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BaoNRmfN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FysPZ0vM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BaoNRmfN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FysPZ0vM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BaoNRmfN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FysPZ0vM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BaoNRmfN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9332421166;
	Wed, 16 Apr 2025 15:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744815762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ahv3TYc2cxIq9Eg3I4DDvVGa/uh3TWWdZ6evB2FK8W4=;
	b=FysPZ0vM8ATkeqo8UVO0ush0elgKrFSsyZI+wZ50g6bMPSFrdCizpm99mLkNjG/2TOZHW5
	UR2fkcxVKQ/mkA/5rO82oD8LmZU0zelM1x7lwACeAbdqNd8K6tCacNFHzUJSbBwwKdE9FB
	N7esezONbFVK34H7Epg5BUhfj075I7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744815762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ahv3TYc2cxIq9Eg3I4DDvVGa/uh3TWWdZ6evB2FK8W4=;
	b=BaoNRmfNhvBiXhuMm0rilF//r2dBzZIE3lMZbeGpL0aFSGQQX+b9qsgV5qVEuUpK07w/tn
	jNUyt6/DXav6dGBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744815762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ahv3TYc2cxIq9Eg3I4DDvVGa/uh3TWWdZ6evB2FK8W4=;
	b=FysPZ0vM8ATkeqo8UVO0ush0elgKrFSsyZI+wZ50g6bMPSFrdCizpm99mLkNjG/2TOZHW5
	UR2fkcxVKQ/mkA/5rO82oD8LmZU0zelM1x7lwACeAbdqNd8K6tCacNFHzUJSbBwwKdE9FB
	N7esezONbFVK34H7Epg5BUhfj075I7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744815762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ahv3TYc2cxIq9Eg3I4DDvVGa/uh3TWWdZ6evB2FK8W4=;
	b=BaoNRmfNhvBiXhuMm0rilF//r2dBzZIE3lMZbeGpL0aFSGQQX+b9qsgV5qVEuUpK07w/tn
	jNUyt6/DXav6dGBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05F4D13976;
	Wed, 16 Apr 2025 15:02:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Gc65OZHG/2eIWAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 16 Apr 2025 15:02:41 +0000
Date: Wed, 16 Apr 2025 16:02:36 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: Add Pedro as reviewer to the MEMORY MAPPING
 section
Message-ID: <g6udo4tvchrav3sr7kzov4xnvu6d6v5iq6elwmdhccsaab3tdi@pto36cgvlyyb>
References: <20250416135301.43513-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416135301.43513-1-lorenzo.stoakes@oracle.com>
X-Spam-Score: -3.80
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, Apr 16, 2025 at 02:53:01PM +0100, Lorenzo Stoakes wrote:
> Pedro has offered to review memory mapping code. He has good experience in
> this area and has provided excellent feedback on memory mapping series in
> the past so I feel he'll be a great addition.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks for sending the patch!

Acked-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
