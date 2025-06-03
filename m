Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503301E519
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748955264; cv=none; b=SV5yyEgx840JbSop8Q1lyBd45UuSfo+QRCxpPAICpfUNCQE+61Ljowfbx5QOyAZApeJVHSmeQwhu3GWxnguyn7+cV9AFww9iBxAqaU5B6+58XHr2+nJSrDWiTbmQUi0hW9S3eTNiszg7hmUJR1Owgzo17I/5ydcitl5Is/8DKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748955264; c=relaxed/simple;
	bh=v0qA3KoNuHo1XBKa/7kN16ADhrzUgpMMd0eeO6A0IhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyaqLoMchtr0TLhdEVhS7RSitRxUfMzPfmAepk7psYE7QnbESK0vRtWxfM16dlX+eemlcJtUCr303/h20lY3UQipN9ISxEA3bbiErCng81ksLhhLiNu3jUjLe5BK+iD8cwKaF5Siss5VreYNGuXKkEqt9olHLyKI6hvHBxulcX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xOT/x5ku; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=iX3kyVY6; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xOT/x5ku; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=iX3kyVY6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xOT/x5ku";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="iX3kyVY6";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xOT/x5ku";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="iX3kyVY6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B9711FCF8;
	Tue,  3 Jun 2025 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748955260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ckf9sIkE9tH+E6YfGJjisVjPch/5zybKqzur0sl7SyY=;
	b=xOT/x5ku3OxHcYCLRzQVjjEzpERMu7slZfZH/3V0f2keDYS9WYuGTvCrUcjuiMQ9VpN2Di
	VjSc4FgR/4ydGrY1rGlH7bm8kIrstqXmhcPaHSaIDkLmytUPZGMC2Cv62qMtkm34reL2uA
	0kipqK96cKpKjUd3S7/bPT1SF8CItCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748955260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ckf9sIkE9tH+E6YfGJjisVjPch/5zybKqzur0sl7SyY=;
	b=iX3kyVY6j93XOOgssDD57lmE18uPE3180QhbaD23ReL0v4CwpndYe7iEv44/fxyDJLcHCM
	XQ44rFTgFJs1q1Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748955260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ckf9sIkE9tH+E6YfGJjisVjPch/5zybKqzur0sl7SyY=;
	b=xOT/x5ku3OxHcYCLRzQVjjEzpERMu7slZfZH/3V0f2keDYS9WYuGTvCrUcjuiMQ9VpN2Di
	VjSc4FgR/4ydGrY1rGlH7bm8kIrstqXmhcPaHSaIDkLmytUPZGMC2Cv62qMtkm34reL2uA
	0kipqK96cKpKjUd3S7/bPT1SF8CItCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748955260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ckf9sIkE9tH+E6YfGJjisVjPch/5zybKqzur0sl7SyY=;
	b=iX3kyVY6j93XOOgssDD57lmE18uPE3180QhbaD23ReL0v4CwpndYe7iEv44/fxyDJLcHCM
	XQ44rFTgFJs1q1Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0FA113A1D;
	Tue,  3 Jun 2025 12:54:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xW0ZOnvwPmi2AgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 03 Jun 2025 12:54:19 +0000
Message-ID: <67a02051-f736-4fbb-8c70-208364264542@suse.cz>
Date: Tue, 3 Jun 2025 14:55:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
 Ingo Saitz <ingo@hannover.ccc.de>, kernel test robot
 <oliver.sang@intel.com>, Marco Elver <elver@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
 Christian Brauner <brauner@kernel.org>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
 <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
 <202505312300.95D7D917@keescook>
 <20250601-pony-of-imaginary-chaos-eaa59e@lemur>
 <202506010833.A33888CC@keescook>
 <20250601-electric-olivine-wren-d8c5ca@lemur>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <20250601-electric-olivine-wren-d8c5ca@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.cz:email,suse.cz:mid,linux.dev:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On 6/1/25 7:58 PM, Konstantin Ryabitsev wrote:
> On Sun, Jun 01, 2025 at 08:38:10AM -0700, Kees Cook wrote:
>>> I don't yet know why it wants to rewrite 39 commits when we're updating a
>>> commit that's only 3 away from the tip. If you manage to rerun this with b4 -d
>>> and send me the output, I will be glad to look at it. Alternatively, if you
>>> can let me know the steps to get my tree in the same state as yours, I can run
>>> it locally.
>>
>> This shows the same problem (using Linus's tree and linux-next):
>>
>> $ git checkout 9d230d500b0e -b test/repro/before
>> $ git cherry-pick 368556dd234d
>> $ git cherry-pick eef1355c269b
>> $ b4 trailers -u https://lore.kernel.org/all/CANpmjNPpyJn++DVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F+_8Xg@mail.gmail.com
> 
> Thanks, I was able to recreate it and will use it as my test case. I suggest
> that until I have a fix in place, that you always use `br trailers -u` with a
> `--since-commit` flag, to restrict the range we're looking at. The solution

I think even with --since-commit it behaves somewhat unexpectedly.
I've tried recreating an issue I had last year, that Christian just
mentioned in this thread as I was writing this up.

> git fetch git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4-reproducer
From git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux
 * branch                      b4-reproducer -> FETCH_HEAD

> git checkout FETCH_HEAD
HEAD is now at 8a01634625a9 io_uring: port to struct kmem_cache_args

> git show HEAD~17 --show-signature --pretty=fuller 
commit f65b0043b92284cf7c8e986a476a9b169a132de1
gpg: Signature made Thu 05 Sep 2024 11:31:55 AM CEST
gpg:                using RSA key 7BBBC8411599234896484DF1BBE0B075D245889A
gpg:                issuer "vbabka@suse.cz"
gpg: Good signature from "Vlastimil Babka <vbabka@suse.com>" [ultimate]
gpg:                 aka "Vlastimil Babka <vbabka@suse.cz>" [ultimate]
Merge: 5be63fc19fca 6e016babce7c
Author:     Vlastimil Babka <vbabka@suse.cz>
AuthorDate: Thu Sep 5 11:31:32 2024 +0200
Commit:     Vlastimil Babka <vbabka@suse.cz>
CommitDate: Thu Sep 5 11:31:32 2024 +0200
...

> b4 trailers -u --since-commit HEAD~17
Finding code-review trailers for 17 commits...
Analyzing 124 code-review messages
---
  + Reviewed-by: Roman Gushchin <roman.gushchin@linux.dev>
    https://lore.kernel.org/all/ZtpI27swD1GIC0YR@google.com
---
Press Enter to apply these trailers or Ctrl-C to abort
...
---
Invoking git-filter-repo to update trailers.
New history written in 0.17 seconds...

> git show HEAD~17 --show-signature --pretty=fuller 
commit 01cc2238ba4ad3c940db76f134f56b2e0f082243
Merge: 5be63fc19fca 0f389adb4b80
Author:     Vlastimil Babka <vbabka@suse.cz>
AuthorDate: Thu Sep 5 11:31:32 2024 +0200
Commit:     Vlastimil Babka <vbabka@suse.cz>
CommitDate: Thu Sep 5 11:31:32 2024 +0200

See how it changed not only the merge commit itself but the right
side of the merge, which was at the time from the vfs tree.

Passing --since-commit HEAD~16 doesn't have this result, so perhaps 
is it intentional that "since" is inclusive? I think that would differ
from the usual interpretation in git/b4 so unexpected. Even then such 
off-by-one error (misunderstanding) would still not explain rewriting
one side on the merge further in the history.

Vlastimil
