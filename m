Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C997F1F582F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452325; cv=none; b=an0v2Ohp45METzPmet/BnJUKil1QELRcQAGCzhLKcO+Vdac6flyzJXEy+nXc0GeqtR/5ou0gTPzqvOLE1p1NfQP/HPKueZjW0fp5G6dvZzQNmUqpGoQjHxr6T9V197i+ikHN8gvvJ3S2l9CEfB+KxuYe5AQZQZhKMz9Dj4TG0k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452325; c=relaxed/simple;
	bh=mkCQNzABaIH80058n352KjxD2Hr+/4MbwnTKSluH7Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mERr950aFvsH1vnsoTYSFGYGN7UgiHSriJR/5AkdOkfo2e1QELtXhIY2U3Y4PNZ7GGD3cOM2rwj6X6KNndNmf4Xdnds284Y/sNrrpw/V9vr28wrhsk81K84JK1klSZLbLvSd5boH6rim+Ke6vzGHi8MaBC/fBezbdlKcbm0EjRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O9y6FtW8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i+1h7gak; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kwfiznIg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0NRMIEZB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O9y6FtW8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i+1h7gak";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kwfiznIg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0NRMIEZB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AEBDA1F387;
	Wed,  2 Jul 2025 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751452322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LnXRBLsITs2/067KqgtslZSnFKkZefWJfj8CgjTubGY=;
	b=O9y6FtW8nY1DHM1oy9AuNKd7KiY1zJ3YgStQc+uJrygC074cfBoI6B4qL0O1+ATqABOiky
	qSVjKbfUcKvb+L9vVVoJLik9ycJCPM/0Z7OuELSo3u/2eAOD6fEtjQcdvebC3cdMOLS1XI
	Z/WGFKVaLLgF6H/J9nt5d8IuhN7Pk2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751452322;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LnXRBLsITs2/067KqgtslZSnFKkZefWJfj8CgjTubGY=;
	b=i+1h7gakAR1yfW0ekTsa//qAVR3SKe07NEXnoJSE6SUsRjJXSLfpHd58QYwnCQnNQ6If7d
	2bSn2umx06tSq7DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kwfiznIg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0NRMIEZB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751452320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LnXRBLsITs2/067KqgtslZSnFKkZefWJfj8CgjTubGY=;
	b=kwfiznIgXEFUyd2YM872BZnJYApyB7GJsjA+XheePxskSk4Y8mBunItjeVmpK3ad2sLj9F
	W3zUxxQr3f6uIMRVkYnIJIB/NSRyhdcN4sNeZRoa+zqV6OpImgMG2HPZnPbcYsAeU4pZr4
	yATVD6+mh9Et6izsBHUUdZjRKrcSdSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751452320;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LnXRBLsITs2/067KqgtslZSnFKkZefWJfj8CgjTubGY=;
	b=0NRMIEZBXNOCupYDARVBLPGUD3EZE5wMOkc99AwMry8oypQXQmiM46t7eVzWwzQEb/OFr7
	5W4YeFWo2bM7kQCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5797013A24;
	Wed,  2 Jul 2025 10:32:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mlEzEqAKZWiIcwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 02 Jul 2025 10:32:00 +0000
Date: Wed, 2 Jul 2025 11:31:58 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] tools: mm: Added modern version of shell quote and a
 stanza
Message-ID: <m2hwwehnvatm7gjxidtqdu235zloay7uhn4lhh7czvgzcdv7rr@omorwgznyljn>
References: <20250702072801.10216-1-unixbhaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702072801.10216-1-unixbhaskar@gmail.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AEBDA1F387
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.01
X-Spam-Level: 

On Wed, Jul 02, 2025 at 12:19:18PM +0530, Bhaskar Chowdhury wrote:
> Three things precisely:
> 
> Replaced backquote with dollar-parentheses ...that is modern way of quoting in
> shell script. Improved readability.
> 
> Added a stranza of missing/required command for the operation,in this case
> gnuplot and that too in shell path.
> 
> And lastly,use "command -v" to search the command i.e gnuplot and the REASON
> for that :
> 
> The -v option tell show shell will invoke the command specified as its
> options.Basically to avoid dependency on something outside of the shell.It is
> also execute command found in the PATH. Essentially, ignoring other similar
> name stuff curated somewhere else in the system.
>

I don't understand what the point of this is, since we're not looking for the
executable, we're merely executing it. If command -v searches through PATH, it
will have the exact same result as just doing 'gnuplot'.

> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  V2: What changes from V1: Verbose changelog, especially using command -v to
>  find the specific program i.e. gnuplot.
> 
>  tools/mm/slabinfo-gnuplot.sh | 44 ++++++++++++++++++++++++------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/mm/slabinfo-gnuplot.sh b/tools/mm/slabinfo-gnuplot.sh
> index 873a892147e5..6c9add4bb8ad 100644
> --- a/tools/mm/slabinfo-gnuplot.sh
> +++ b/tools/mm/slabinfo-gnuplot.sh
> @@ -46,6 +46,22 @@ check_file_exist()
>  	fi
>  }
> 
> +# This variable could have space separated value
> +my_needed_commands="gnuplot"
> +
> +missing_counter=0
> +for needed_command in $my_needed_commands; do
> +  if ! hash "$needed_command" >/dev/null 2>&1; then
> +    printf "Command not found in PATH: %s\n" "$needed_command" >&2
> +    ((missing_counter++))
> +  fi
> +done
> +
> +if ((missing_counter > 0)); then
> +  printf "Minimum %d commands are missing in PATH, aborting\n" "$missing_counter" >&2
> +  exit 1
> +fi

And this seems unneeded. The script is quite minimal and simple, and it's also
named "gnuplot". Not sure what else you need there.

> +
>  do_slabs_plotting()
>  {
>  	local file=$1
> @@ -58,13 +74,13 @@ do_slabs_plotting()
> 
>  	check_file_exist "$file"
> 
> -	out_file=`basename "$file"`
> +	out_file=$(basename "$file")

But this sort of changes are probably welcome, though.
-- 
Pedro
