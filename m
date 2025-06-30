Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A80126BF7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281589; cv=none; b=Mjxi4eJ47+ftchWYXSQEft04h0Sd+nwqkUgbuNizsxqKVZPw8OqlrCS10KRGq3+e0T+Orn0caHq+gW40ozmb6VlXN3AhGpAtU0i4d39NIMZtPIs6QgBC7Rxx75ZP/INPKnunz4Y9OEvI/4lCJFtW+ppKIrgAk4VU848w6tIr2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281589; c=relaxed/simple;
	bh=hkFqEHYPHy2Y68W7tkW11hTV8RVM9jdiv36TLl4g8kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fmijykm+wWx0L7lLfMmGFP809xuq4gRxdQhqjQ6mTE9WVborxq8DfPIfITt+FO3kvtsPECMNWEIxKaqxl4q5XhsL2QuVxrkKtjfd1Hw0z9x1dsBjflF6FuQrzmNsQ4baeXL5aj6pTN4DoTlqpSvIKT/nQEHjk3Po7InVw9Ohjzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=UYL7nR9H; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2Eha3Uff; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Jt1BJgEP; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2/dRnm/W; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="UYL7nR9H";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2Eha3Uff";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Jt1BJgEP";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2/dRnm/W"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DEBF41F451;
	Mon, 30 Jun 2025 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1751281585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgOsDb/evucy8q5GbAICoPJb1hC0VbCheDAQASWacj4=;
	b=UYL7nR9H42HxhQuYY75ssiVv2vvZla16XVgFb04+Ym/m3J0Z6fxo2LGoO1UmuUoRkkD4MR
	UkKSwMN1EKP3uVmWDysMpDH2zBgaM7j0OJ8B7b6F6kX5i6uT0kSXsltUiI1DQwKxLr1Muv
	a1hf2S6LTIDT4JV07WWaRd/va7YBSjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1751281585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgOsDb/evucy8q5GbAICoPJb1hC0VbCheDAQASWacj4=;
	b=2Eha3UffbxJfztGmCmpUnh569R4x/f3dD/8IVM4AHxBbjz2CvCyb7heKx+GC2bzAMUfjwM
	D/G2REujslsggUAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1751281584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgOsDb/evucy8q5GbAICoPJb1hC0VbCheDAQASWacj4=;
	b=Jt1BJgEP/yoBa/DK1YFZtNEP9E6JTU0b+q1OCK8iXpA4dlS/J9eIdzb8WRg1hTPjN80tYu
	oRt3MV8qkQC7/dzcGST26EQ9UQ3yBYMffjisaPEsY3MUDE2isuxE0DTop4nkaRyGNSsb5P
	/z4jAorkShdQJ1OJm29vwqeI0kKPYS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1751281584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgOsDb/evucy8q5GbAICoPJb1hC0VbCheDAQASWacj4=;
	b=2/dRnm/WKs49XeY4AOMqIUSL40DQ5QxvYOSsWT5/qPSHNDNpA98LKtECPnXtNmrONHSV0x
	ZJdrZArVDhQfzEBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D432F1399F;
	Mon, 30 Jun 2025 11:06:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KdjJM7BvYmjJLwAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 30 Jun 2025 11:06:24 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 50FDAA0A31; Mon, 30 Jun 2025 13:06:24 +0200 (CEST)
Date: Mon, 30 Jun 2025 13:06:24 +0200
From: Jan Kara <jack@suse.cz>
To: Brahmajit Das <listout@listout.xyz>
Cc: linux-kernel@vger.kernel.org, krisman@suse.de, jack@suse.cz
Subject: Re: [RFC PATCH] samples: fix building fs-monitor on musl systems.
Message-ID: <7fuj7wev3m7t4asaz5nn7kkwnzderzy33lq6s5xe57zrjmj3f7@q3ltze4tb75k>
References: <20250630103011.27484-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630103011.27484-1-listout@listout.xyz>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,listout.xyz:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.80

On Mon 30-06-25 16:00:11, Brahmajit Das wrote:
> On musl systems with make allyesconfig fs-monitor.c fails to build with
> 
> samples/fanotify/fs-monitor.c:22:9: error: unknown type name '__s32'
>    22 |         __s32 error;
>       |         ^~~~~
> samples/fanotify/fs-monitor.c:23:9: error: unknown type name '__u32'
>    23 |         __u32 error_count;
>       |         ^~~~~
> samples/fanotify/fs-monitor.c: In function 'handle_notifications':
> samples/fanotify/fs-monitor.c:98:50: error: 'fsid_t' has no member named 'val'; did you mean '__val'?
>    98 |                                        fid->fsid.val[0], fid->fsid.val[1]);
>       |                                                  ^~~
>       |                                                  __val
> samples/fanotify/fs-monitor.c:98:68: error: 'fsid_t' has no member named 'val'; did you mean '__val'?
>    98 |                                        fid->fsid.val[0], fid->fsid.val[1]);
>       |                                                                    ^~~
>       |                                                                    __val
> 
> This is due to sys/fanotify.h on musl does not include
> linux/fanotify.h[0] unlike glibc which includes it. This also results in
> fsid not being of type __kernel_fsid_t, rather the libc's definition of
> it which does not have val, but instead __val.
> 
> [0]: https://git.musl-libc.org/cgit/musl/tree/include/sys/fanotify.h
> Signed-off-by: Brahmajit Das <listout@listout.xyz>

Thanks! Added to my tree.

								Honza

> ---
>  samples/fanotify/fs-monitor.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/samples/fanotify/fs-monitor.c b/samples/fanotify/fs-monitor.c
> index 608db24c471e..28c0a652ffeb 100644
> --- a/samples/fanotify/fs-monitor.c
> +++ b/samples/fanotify/fs-monitor.c
> @@ -12,6 +12,9 @@
>  #include <sys/fanotify.h>
>  #include <sys/types.h>
>  #include <unistd.h>
> +#ifndef __GLIBC__
> +#include <asm-generic/int-ll64.h>
> +#endif
>  
>  #ifndef FAN_FS_ERROR
>  #define FAN_FS_ERROR		0x00008000
> @@ -95,7 +98,11 @@ static void handle_notifications(char *buffer, int len)
>  				fid = (struct fanotify_event_info_fid *) info;
>  
>  				printf("\tfsid: %x%x\n",
> +#if defined(__GLIBC__)
>  				       fid->fsid.val[0], fid->fsid.val[1]);
> +#else
> +				       fid->fsid.__val[0], fid->fsid.__val[1]);
> +#endif
>  				print_fh((struct file_handle *) &fid->handle);
>  				break;
>  
> -- 
> 2.50.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
