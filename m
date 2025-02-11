Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB0A1FCCE9;
	Tue, 11 Feb 2025 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289710; cv=none; b=PIXNJzLM2tjx/XVANGHQHRzDresgQaFnpSdxVIsi79OAVNQadQiS3DhkIg0y0OvJF1ssGaJR8tTOzN6+YTD2f606xY/talH5XxoDDrfcr/Wig8bKsFqoC15d/5k2IZfjQ3/wwWpTmn6jJtdd05UYIx3KJfy8KOxCfDeEcNztf3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289710; c=relaxed/simple;
	bh=JC1moW9rwjZjSkm2Pv/ggDPoGk3Jas15+WEbS4Mz41o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/13QGhqloVE3Or+SHPlT1nXO5uc6/kTBXDYLYS9zPYNwyZpUw18ftji8f+x7bEQLcTs3JtFbX+SBO0MXOKDFQm2mtlcZigDW+nJIyE+Pt4hD/A5gUzw2iLEQ8JNauh5ipr5sR7QukS74elhiF5r3J+V464+T19F0IOQg1Occjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vHuH4kAT; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=DWlqphK5; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vHuH4kAT; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=DWlqphK5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vHuH4kAT";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="DWlqphK5";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vHuH4kAT";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="DWlqphK5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 50EAE21D88;
	Tue, 11 Feb 2025 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1739287246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E65niO7TX6YRWHTs4kLzCXgNaocnwwXLNsOZNIUGo+g=;
	b=vHuH4kATjWOlV/D+oAtHUgH0uOG2S15XPKvFHOzYHTedJ8DALiZMKsy8805aZnzQZU5i8q
	Xge0eKYC9NoLoHG2YbI0haxMyVv+DakYiDO18mBhjj6TlXoGYYYAxCDHNIV6lwGKyCDtWT
	7yJJFRMDGLVEiHcFQv+ZL6d1ElJcYHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1739287246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E65niO7TX6YRWHTs4kLzCXgNaocnwwXLNsOZNIUGo+g=;
	b=DWlqphK5OuVN4GnySBWkK/BD2dwm/nNVQgDkqWN8vAEKUwl4MTfolGzY06aFJXHqZQNOIw
	2mu3dkL3FkjsDODA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=vHuH4kAT;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=DWlqphK5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1739287246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E65niO7TX6YRWHTs4kLzCXgNaocnwwXLNsOZNIUGo+g=;
	b=vHuH4kATjWOlV/D+oAtHUgH0uOG2S15XPKvFHOzYHTedJ8DALiZMKsy8805aZnzQZU5i8q
	Xge0eKYC9NoLoHG2YbI0haxMyVv+DakYiDO18mBhjj6TlXoGYYYAxCDHNIV6lwGKyCDtWT
	7yJJFRMDGLVEiHcFQv+ZL6d1ElJcYHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1739287246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E65niO7TX6YRWHTs4kLzCXgNaocnwwXLNsOZNIUGo+g=;
	b=DWlqphK5OuVN4GnySBWkK/BD2dwm/nNVQgDkqWN8vAEKUwl4MTfolGzY06aFJXHqZQNOIw
	2mu3dkL3FkjsDODA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E1A313AA6;
	Tue, 11 Feb 2025 15:20:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rCvoCs5qq2eCYQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 11 Feb 2025 15:20:46 +0000
Message-ID: <66c2bf7a-9119-4850-b6b8-ac8f426966e1@suse.cz>
Date: Tue, 11 Feb 2025 16:20:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
Content-Language: en-US
To: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 50EAE21D88
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:email,suse.cz:dkim,suse.cz:mid];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 2/3/25 12:13, Vlastimil Babka wrote:
> The subsystem status is currently reported with --role(stats) by
> adjusting the maintainer role for any status different from Maintained.
> This has two downsides:
> 
> - if a subsystem has only reviewers or mailing lists and no maintainers,
>   the status is not reported (i.e. typically, Orphan subsystems have no
>   maintainers)
> 
> - the Supported status means that someone is paid for maintaining, but
>   it is reported as "supporter" for all the maintainers, which can be
>   incorrect. People have been also confused about what "supporter"
>   means.
> 
> This patch introduces a new --substatus option and functionality aimed
> to report the subsystem status separately, without adjusting the
> reported maintainer role. After the e-mails are output, the status of
> subsystems will follow, for example:
> 
> ...
> linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> LIBRARY CODE status: Supported
> 
> In order to allow replacing the role rewriting seamlessly, the new
> option works as follows:
> 
> - it is automatically enabled when --email and --role are enabled
>   (the defaults include --email and --rolestats which implies --role)

With the following fixup, the above changes to:

- it is automatically enabled when --email and --role are enabled and the
  output is a terminal (the defaults include --email and --rolestats which
  implies --role)

----8<----
From f5523a85c742065fcb88a8aa26831f9dba9faf15 Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Tue, 11 Feb 2025 16:16:11 +0100
Subject: [PATCH] get_maintainer: add --substatus for reporting subsystem
 status - fix

The automatically enabled --substatus can break existing scripts that do
not disable --rolestats. Require that script output goes to a terminal
to enable it automatically.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 scripts/get_maintainer.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index cf902417a52c..4414194bedcf 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -317,7 +317,7 @@ $output_rolestats = 1 if ($interactive);
 $output_roles = 1 if ($output_rolestats);
 
 if (!defined $output_substatus) {
-    $output_substatus = $email && $output_roles;
+    $output_substatus = $email && $output_roles && -t STDOUT;
 }
 
 if ($sections || $letters ne "") {
@@ -1086,7 +1086,7 @@ version: $V
     --remove-duplicates => minimize duplicate email names/addresses
     --roles => show roles (role:subsystem, git-signer, list, etc...)
     --rolestats => show roles and statistics (commits/total_commits, %)
-    --substatus => show subsystem status if not Maintained (default: match --roles)"
+    --substatus => show subsystem status if not Maintained (default: match --roles when output is tty)"
     --file-emails => add email addresses found in -f file (default: 0 (off))
     --fixes => for patches, add signatures of commits with 'Fixes: <commit>' (default: 1 (on))
   --scm => print SCM tree(s) if any
-- 
2.48.1


