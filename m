Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C3253F33;
	Tue, 11 Feb 2025 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290176; cv=none; b=VYcrdLMvsMkImdJpijLUdSAtIDn2ZEdMJjH11tyYVMUSsF238rLZut5nqVGNni7D2SpB9geEgCgDj6kRIUHC6J6F6qbh/g0ez2lg+Hh2pNUR66leHZhAB2rnO1WAOk4NKfrc92cLCBId2Z52kgKuwcYqf11xdx/+SNH2hkoRiyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290176; c=relaxed/simple;
	bh=qQApPjpim+loQ4ajMtz3MpE/ppKjJkgfuOadEo25WrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFORFpf35LbBrL8uPHYZea/X/p+oMm1NbRyaYTlWmDrDpINGrYNymK2AiGfSuTn6/Qs95Ypigp0AGJLEqzT7usx4aNYBm5YZY9dLD2qPvrBBc/HiyM8VeeWv3HKvLm2qz0V4WupSJeHFnJTK0SQm1lUsOFIAz77Lio3Akgm2mBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=mPBO4lte; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=0bMk4k/O; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=mPBO4lte; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=0bMk4k/O; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="mPBO4lte";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="0bMk4k/O";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="mPBO4lte";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="0bMk4k/O"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6B4A776B78;
	Tue, 11 Feb 2025 15:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1739287849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QDGaOekLhsQFykr8hC2w5GOY7TQaiNC6cID1fErX2eI=;
	b=mPBO4lteNcruHEYyFiNZeG+yaUMWIHs0q1jrK4nTy+/QP+8V4ZhxUbp4FwpXQYEHPavDB8
	Wim7SQv5lb1aN5ygBUU6HGkTOdlEwnphNf2vX+1wHMPn8bYhCauTIpXFydRutWs+jkmnv/
	8NI4x6rStLCPG1P3ZGDgqvPevrXu7iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1739287849;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QDGaOekLhsQFykr8hC2w5GOY7TQaiNC6cID1fErX2eI=;
	b=0bMk4k/OvxdV6FHkWm7Gy/vTxMJr3PwS4zfz4hg2OJyy3OOlo/3xAU3UglKruSmh0IZgM/
	eywnk9vlYd/+fsBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1739287849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QDGaOekLhsQFykr8hC2w5GOY7TQaiNC6cID1fErX2eI=;
	b=mPBO4lteNcruHEYyFiNZeG+yaUMWIHs0q1jrK4nTy+/QP+8V4ZhxUbp4FwpXQYEHPavDB8
	Wim7SQv5lb1aN5ygBUU6HGkTOdlEwnphNf2vX+1wHMPn8bYhCauTIpXFydRutWs+jkmnv/
	8NI4x6rStLCPG1P3ZGDgqvPevrXu7iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1739287849;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QDGaOekLhsQFykr8hC2w5GOY7TQaiNC6cID1fErX2eI=;
	b=0bMk4k/OvxdV6FHkWm7Gy/vTxMJr3PwS4zfz4hg2OJyy3OOlo/3xAU3UglKruSmh0IZgM/
	eywnk9vlYd/+fsBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F83913715;
	Tue, 11 Feb 2025 15:30:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id B801Dyltq2fEZAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 11 Feb 2025 15:30:49 +0000
Message-ID: <68bb307a-26ad-46ac-a9de-bec9b808506a@suse.cz>
Date: Tue, 11 Feb 2025 16:30:48 +0100
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>
 <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
 <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com>
 <6ff32b12-7113-41dc-80d3-e729cc15a5ce@suse.cz>
 <CAMuHMdXNaNPiVXMrqf4YqM-PRC6ZrTgmHtOP1S9PPCP2HqvGWA@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <CAMuHMdXNaNPiVXMrqf4YqM-PRC6ZrTgmHtOP1S9PPCP2HqvGWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On 2/11/25 16:19, Geert Uytterhoeven wrote:
> Hi Vlastimil,
> 
> On Tue, 11 Feb 2025 at 15:58, Vlastimil Babka <vbabka@suse.cz> wrote:
>> On 2/11/25 11:48, Geert Uytterhoeven wrote:
>> I've tried to do that in v1 in the form of reporting e.g. as
>> John Doe <jd@example.com> (maintainer:SUBSYSTEM [supported])
>>
>> But it seemed noisy to repeat that on every line involving the subsystem.
> 
> Yeah, it could be considered noisy... (more below)
> 
>> When you say comment, what kind of separation for the comment would work
>> regardless of what's used for postprocessing?
> 
> I don't mind much. Perhaps just a comma?

Hm comma where exactly? Sorry I might not get it, could you provide a full
example? Thanks.

>> > Now, as both Uwe and I edit our generated scripts before running them,
>> > we can delete the unwanted lines, but it's more work...
>> > Thanks!
>>
>> I guess technically your scripts could detect first if --no-substatus is
>> supported by grepping --help or testing if passing the option results in an
>> error? But yeah it's not ideal, looks like I've hit the limits of automagic
>> heuristics here.
>> Or we make it fully opt-in but then most non-scripting users will not learn
>> the status at all because it won't occur to them to enable it...
> 
> I still seem to miss the real story behind this patch (so perhaps
> that's why I would consider all of it noisy ;-). When I create a patch,

The cover letter tells the story. It comes back to the way the script
reports maintainers as "supporter"s (or other roles according to the status,
however some status means there is most likely no maintainer). Joe objected
to that status reporting would be simply removed in [1]. I also think it's
useful information for the submitters, so I try to provide it differently.

> what am I gonna do with this extra information?
> E.g. decide not to send the patch, because the driver is orphaned?

Well for example you can know that you might not get a timely reply, or
might need to step up as a maintainer. Or you're trying to add a feature and
the driver is "odd fixes". I think we do document the status in MAINTAINERS
for a reason, and one could expect the tool to provide it and not require
you to go look into MAINTAINERS yourself.

[1]
https://lore.kernel.org/all/30776fe75061951777da8fa6618ae89bea7a8ce4.camel@perches.com/

> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

