Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FBE270EAA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115936; cv=none; b=DobUVjAgqvQBO7LPgD/U72YIEbmS3at1p1XsNRa2Wqn+T7BuGgUfnZ/qao+yd51PVBDGWni4ifJl5nMvSzj1sMmxrIfmYxrnkYbSP0VvbQYi/RTDFV0yHcKv44qnA6cFaJ6kpX0bguQkydy23btZEtiU9zjaPcLq903ZA07F0Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115936; c=relaxed/simple;
	bh=tWLj6hCTsUsy6skIxsCU1gYwVX8zNsVwBhJlCYL3OzY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b3/6MRFRkhdyECDj+mUM0czvCDDroWqDbOC8HkWFuAUkSoOqVs8VFgBfP/Irnz6LwBbClBuI7tYehE4Q1isefOo246kt/+pea1IW2bKKDg5y+jbUqsqzBdEmjTxkOi1Uh50mm+UoHTkxHcX9fnFLZWKRzBrnQUvkRDkPPvTvOUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i38pXdN3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kKLLycsG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i38pXdN3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kKLLycsG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i38pXdN3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kKLLycsG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i38pXdN3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kKLLycsG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0023F21180;
	Tue,  8 Apr 2025 12:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744115933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8voFhDCx4f+vOltHZnCvK7t+rzaa2lYXmMfMaNjmzDo=;
	b=i38pXdN3uxy6/fiJwvPf3f2kVzSnCVr91xkJorD68qkbF70+Nr6jto02WuC6YwX1gFQgZK
	vvJv+fGbmS3V3ZB1MWrbQU3bKNWUyvpnqgBB1jl9veaqQFy16jUyfSEtCKFMAlrwdZKSvw
	pQz9bsY7F8daKNkaufeCJvoV7RtMfe0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744115933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8voFhDCx4f+vOltHZnCvK7t+rzaa2lYXmMfMaNjmzDo=;
	b=kKLLycsG5O6YoetIWEaS+haiDd5Z3u+cabWxbBODL7ujKZTz/G/hiezsBVOkw7o82oGCj3
	LIv6HP8Qww/OEoAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744115933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8voFhDCx4f+vOltHZnCvK7t+rzaa2lYXmMfMaNjmzDo=;
	b=i38pXdN3uxy6/fiJwvPf3f2kVzSnCVr91xkJorD68qkbF70+Nr6jto02WuC6YwX1gFQgZK
	vvJv+fGbmS3V3ZB1MWrbQU3bKNWUyvpnqgBB1jl9veaqQFy16jUyfSEtCKFMAlrwdZKSvw
	pQz9bsY7F8daKNkaufeCJvoV7RtMfe0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744115933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8voFhDCx4f+vOltHZnCvK7t+rzaa2lYXmMfMaNjmzDo=;
	b=kKLLycsG5O6YoetIWEaS+haiDd5Z3u+cabWxbBODL7ujKZTz/G/hiezsBVOkw7o82oGCj3
	LIv6HP8Qww/OEoAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C976A13691;
	Tue,  8 Apr 2025 12:38:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ejmYMNwY9WcXIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Apr 2025 12:38:52 +0000
Date: Tue, 08 Apr 2025 14:38:52 +0200
Message-ID: <87mscqhlpf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	linux-sound@vger.kernel.org,
	kunit-dev@googlegroups.com,
	clang-built-linux <llvm@lists.linux.dev>,
	Pei Xiao <xiaopei01@kylinos.cn>,
	Takashi Iwai <tiwai@suse.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: sound_kunit.c: error: address of array 'card->id' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
In-Reply-To: <CA+G9fYsNUbN0PsDQBqVAoUSjSXa5igOjntBFh_TF6m8A4FNDsw@mail.gmail.com>
References: <CA+G9fYsNUbN0PsDQBqVAoUSjSXa5igOjntBFh_TF6m8A4FNDsw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,linaro.org:email,linaro.org:url]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 08 Apr 2025 14:35:21 +0200,
Naresh Kamboju wrote:
> 
> Regressions on x86_64 build allyesconfig with clang-20 failed on the
> Linux next-20250408 tag.
> 
> First seen on the next-20250408.
> Bad: next-20250408
> Good: next-20250407
> 
> * x86, build
>  - build/clang-20-allyesconfig
> 
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
> 
> Boot regression: x86_64 allyesconfig address of array 'card->id' will
> always evaluate to 'true'
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Boot log
> sound/core/sound_kunit.c:271:31: error: address of array 'card->id'
> will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
>   271 |         kunit_info(test, "%s", card->id ? card->id : "(null)");
>       |                                ~~~~~~^~ ~
> 
> 
> ## Source
> * Kernel version: 6.15.0-rc1
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: 7702d0130dc002bab2c3571ddb6ff68f82d99aea
> * Git describe: next-20250408
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/
> 
> ## Test
> * Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/log
> * Test details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/details/
> * Test history:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/history/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vQpM7f8SQvntzGG0Tdgxj2amGb/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2vQpM7f8SQvntzGG0Tdgxj2amGb/config
> * compiler: clang Debian clang version 20.1.2
> (++20250330123306+5ba194972878-1~exp1~20250330003423.94)
> 
> ## Steps to reproduce
>  - tuxmake --runtime podman --target-arch x86_64 --toolchain clang-20
> --kconfig allyesconfig LLVM=1 LLVM_IAS=1

The relevant patch was already dropped.


thanks,

Takashi
