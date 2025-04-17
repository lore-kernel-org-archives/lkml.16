Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188AB19F133
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874902; cv=none; b=mFSTzl/bQVx6y51Rhea2L4GkfisrTAgJQztAvmKGKeH0du/AC8grE9S5U1i7/CNfu292R8m1VfNZYrHRrc3fssdwZ4At3NcfCZR2b+CX19Y740KXw90o/OKOyWHbZbRnMlLzy4mM9dv7V0+4tp2MCkV/H4UP+mtyPlcmGuGuOsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874902; c=relaxed/simple;
	bh=mCObUeB9b6DaNoG0QvmnjJCXEEJJvJPWP6zrmz0Z40Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZrWC2RZ+Wmnw1Q2Cru1IZZuxVGxRteH783Vb/TRWw7ZkLtsD7yjwm9VNxmn63OhFUq4h2EpXvAMBWi4QA7EhI2ob7C53Rudm3KJylBg0+nnE18RRLceabK5vqB3Zd0y14ZkfAxLQ+yVeMcI4lnCqk8QuiHDWzROQ4nWiZNPdLPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AqhSeuSv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AsmHGf9q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AqhSeuSv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AsmHGf9q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AqhSeuSv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AsmHGf9q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AqhSeuSv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AsmHGf9q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3B5C6211A3;
	Thu, 17 Apr 2025 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744874899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6dSncrwBO8AkU7U883YKLKGYF1Otz1wvxPOVFx6BArc=;
	b=AqhSeuSvdZCHTyRuVkiWNpzqRCvgiUX7jp0tfVUEwzJpktRA88TI/inSuODB9iAojPniO+
	tU/7UXAGBLljRqlvGqKHilNhKfrzbp70IlhkTjy+0YqTHG814ZzY1uxSX43j2fdimaovmw
	IUv/TmsH9MLidxD9hVkMN5uhJh/jtXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744874899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6dSncrwBO8AkU7U883YKLKGYF1Otz1wvxPOVFx6BArc=;
	b=AsmHGf9qffU36YMtxAYWDX1q8xJL/xtH7j6TXHorg6UWvJJfONfBpy0Ls4pY1Lf+pCKCPc
	7aVJ4j12fgYrTCBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744874899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6dSncrwBO8AkU7U883YKLKGYF1Otz1wvxPOVFx6BArc=;
	b=AqhSeuSvdZCHTyRuVkiWNpzqRCvgiUX7jp0tfVUEwzJpktRA88TI/inSuODB9iAojPniO+
	tU/7UXAGBLljRqlvGqKHilNhKfrzbp70IlhkTjy+0YqTHG814ZzY1uxSX43j2fdimaovmw
	IUv/TmsH9MLidxD9hVkMN5uhJh/jtXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744874899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6dSncrwBO8AkU7U883YKLKGYF1Otz1wvxPOVFx6BArc=;
	b=AsmHGf9qffU36YMtxAYWDX1q8xJL/xtH7j6TXHorg6UWvJJfONfBpy0Ls4pY1Lf+pCKCPc
	7aVJ4j12fgYrTCBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C58E8137CF;
	Thu, 17 Apr 2025 07:28:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2F0aLpKtAGjGTgAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 17 Apr 2025 07:28:18 +0000
Message-ID: <cb868bc8-ded2-4635-afbb-098f378f74db@suse.de>
Date: Thu, 17 Apr 2025 09:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
To: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: Daniel Wagner <dwagner@suse.de>, Daniel Wagner <wagi@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
 <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>
 <20250416004016.GC78596-mkhalfella@purestorage.com>
 <3dad09ce-151d-41fc-8137-56a931c4c224@flourine.local>
 <20250416135318.GI1868505-mkhalfella@purestorage.com>
 <df6cd26e-551a-4bc1-bdc6-9c715e502aa8@grimberg.me>
 <20250416225913.GA2476975-mkhalfella@purestorage.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250416225913.GA2476975-mkhalfella@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 4/17/25 00:59, Mohamed Khalfella wrote:
> On 2025-04-17 01:21:08 +0300, Sagi Grimberg wrote:
>>
>>
>> On 16/04/2025 16:53, Mohamed Khalfella wrote:
>>> On 2025-04-16 10:30:11 +0200, Daniel Wagner wrote:
>>>> On Tue, Apr 15, 2025 at 05:40:16PM -0700, Mohamed Khalfella wrote:
>>>>> On 2025-04-15 14:17:48 +0200, Daniel Wagner wrote:
>>>>>> Pasthrough commands should fail immediately. Userland is in charge here,
>>>>>> not the kernel. At least this what should happen here.
>>>>> I see your point. Unless I am missing something these requests should be
>>>>> held equally to bio requests from multipath layer. Let us say app
>>>>> submitted write a request that got canceled immediately, how does the app
>>>>> know when it is safe to retry the write request?
>>>> Good question, but nothing new as far I can tell. If the kernel doesn't
>>>> start to retry passthru IO commands, we have to figure out how to pass
>>>> additional information to the userland.
>>>>
>>> nvme multipath does not retry passthru commands. That is said, there is
>>> nothing prevents userspace from retrying canceled command immediately
>>> resulting in the unwanted behavior these very patches try to address.
>>
>> userspace can read the controller cqt and implement the retry logic on
>> its own.
>> If it doesn't/can't, it should use normal fs io. the driver does not
>> handle passthru retries.
> 
> passthru requests are not very different from normal IO. If the driver
> holds normal IO requests to prevent corruption, it should hold passthru
> requests too, for the same reason, no?
> 
> IMO, keeping the request holding logic in the driver makes more sense
> than implementing it in userspace. One reason is that CCR can help
> release requests held requests faster.
> 
One thing to keep in mind: We cannot hold requests during controller 
reset. Requests are an index into a statically allocated array from
the request queue, which gets deleted when the request queue is
removed during controller teardown.

So I _really_ would like to exclude handling of admin and passthrough
commands for now, as there are extremely few commands which are not
idempotent. If we really care we can just error them out upon submission
until error recovery is done.
But I'm not sure if it's worth the hassle; at this time we don't even
handle admin commands correctly (admin commands should not be affected
by the ANA status, yet they are).

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
