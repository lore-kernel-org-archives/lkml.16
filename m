Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4481728E5F2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514905; cv=none; b=FxoZdqGgA68jlqGgZ8bn3WCG5RsvAJKYIDZgMPYGRn8aKu21FixDaaMDb4zNmqWoTHXxaQ1V1w/RbUKA1BjhaIqOSfj7YHxlvKwb6g74vC0VYX9JQRq7YTGT15Ez6c3XTdiQNuKB2xZC3rj9rbllrBnNUCcVvWXDcI4PpE2Bzf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514905; c=relaxed/simple;
	bh=UhUt3ao8pozoBaRx+y41ElAHV9S/D/UZDK22mXi+fPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7GmTK6htI0ZjNHNXvuAntub6cWE/R6ov485MoxeipuaVpmSaFeq7FZDu+6Xz/MAhYDiaWA7qSAO3Yv/OxGY3C+7eJqWf1EbkvWGPNQJVmk17BZZHCxIdhY9G57uM3cUDTSe1B50wwao+cXTUGxGh5txKVw+p1jLyeIN3cxLOuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2hZyWLWf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Wn+UeLPQ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2hZyWLWf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Wn+UeLPQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2hZyWLWf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Wn+UeLPQ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2hZyWLWf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Wn+UeLPQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4FE371F443;
	Thu, 24 Apr 2025 17:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745514901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jA/Yq2sLS38l5G8KlTT+Pd1kKyunnmm3yQ5Qp9zrVQ=;
	b=2hZyWLWf+UC9v/ZRtwrwRlkE2JY6xC6F+61YKo3LnHoCWrvu19loWtL8lKPTvZuqWff+xo
	2k2jCatOwyPUh55FiWku+4u65fFjytOQUAoBhVAHHuVqvbjrHwTBZxMRhlC4tLcjKcfATU
	JPeKzjmgE3NvXWdGPeHeO+b3U4bJDlo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745514901;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jA/Yq2sLS38l5G8KlTT+Pd1kKyunnmm3yQ5Qp9zrVQ=;
	b=Wn+UeLPQNIiE8LoygUPcOnHfVxls+Q1lG/TeKDf9Psc7K4AsGjmDMOFHCjS26t69miUX3k
	P/kw/osTi/vpbeDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745514901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jA/Yq2sLS38l5G8KlTT+Pd1kKyunnmm3yQ5Qp9zrVQ=;
	b=2hZyWLWf+UC9v/ZRtwrwRlkE2JY6xC6F+61YKo3LnHoCWrvu19loWtL8lKPTvZuqWff+xo
	2k2jCatOwyPUh55FiWku+4u65fFjytOQUAoBhVAHHuVqvbjrHwTBZxMRhlC4tLcjKcfATU
	JPeKzjmgE3NvXWdGPeHeO+b3U4bJDlo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745514901;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jA/Yq2sLS38l5G8KlTT+Pd1kKyunnmm3yQ5Qp9zrVQ=;
	b=Wn+UeLPQNIiE8LoygUPcOnHfVxls+Q1lG/TeKDf9Psc7K4AsGjmDMOFHCjS26t69miUX3k
	P/kw/osTi/vpbeDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 342D7139D0;
	Thu, 24 Apr 2025 17:15:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S9xtDJVxCmhhJwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 24 Apr 2025 17:15:01 +0000
Message-ID: <691b0ba9-7587-4663-8aa3-8ce63ef509c6@suse.cz>
Date: Thu, 24 Apr 2025 19:15:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] mm, slab: fold need_slab_obj_ext() into its only
 user
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>
References: <20250424164800.2658961-1-andriy.shevchenko@linux.intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250424164800.2658961-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gentwo.org,google.com,linux-foundation.org,linux.dev,oracle.com,kernel.org,gmail.com,quicinc.com];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On 4/24/25 18:48, Andy Shevchenko wrote:
> need_slab_obj_ext() is used only in one place, fold it into there.
> Without that, clang can't build kernel with `make W=1` when
> CONFIG_WERROR=y, which is default in the x86 configurations.

Note that gcc doesn't warn on this even with W=1.

Is really clang + W=1 + CONFIG_WERROR building ok these days except this one
unused function?

> mm/slub.c:2079:20: error: unused function 'need_slab_obj_ext' [-Werror,-Wunused-function]
> 
> To solve this, fold need_slab_obj_ext() into its only user.
> 
> Fixes: e33b7ae3d802 ("mm, slab: clean up slab->obj_exts always")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks, I've folded the fix in.

