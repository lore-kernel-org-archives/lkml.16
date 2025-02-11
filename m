Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D641B1EE7B7;
	Tue, 11 Feb 2025 08:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263721; cv=none; b=E+eQNDKJfFO9iT/pnrOWGj5vYBGnlegM3ZXjerV9mFHxkqRac7FQdnAzvJpHz95hBWsiF7YeUvVdMUxVeC3wRtNcYRSLcwJt/jTsf6uZ73tkNpupkmNB+1jgLkpTUkON+siu02I/ufWEcTJVFGOS2FtrwTQJaVJu5Snr3NcRLxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263721; c=relaxed/simple;
	bh=aJjZbm/TVVYULmFdNknqyvYMz98ycVAYskAOxthr1DM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbGkFVAwd6/HiWsYAkBnklU4z5zQreQpjfFDaVj3r+WM02koRmy1xhIjGPYDx3E2gwpRvOM2I9olGiFTuZqmX5Xla/TRMQwtv8eZsv1jT4OIiq/Mm0gbM7vUjwkin2PcbwmDzopoJhS5x6OAqm3Mdjkn+54nC91j8kr7ZrSjrRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=L2HN/ohs; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="L2HN/ohs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=wYaN1C80ulJlmrPA976aztO+qWkAhsYsZRG2qTlgq+g=; t=1739263719;
	x=1739695719; b=L2HN/ohs0gurnjnOhuJJ3fP/qd2HMt7fGLshTApro2YuLZbStLT1JUa24sOTz
	ma3NxTbzRs68R854sWdX8lpd5sP52VTUy7/b05RTY5NEZtNBXpC5uBqgdpjmNSbydmTBhV7LKb2eS
	dDkTgPEQhJgSCt7GxvAYLNM1mdKhVQOlsuM16RnoQx/3hfH91HhyY0WytirbvGZYWDd6XTXN7oxAE
	aHxop5pDQZeg5jgKkNSSUA2fB70QNmcbvLIqg8YF0TtxuZi3QV5h8P8giCYC1VGMS7OJMIv9MBTyK
	H8eGRFXkfxUbMisXWQTsIyEPdYhAUzxOLdUXMrTFVcgRHzd7RQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1thlwb-00B08d-0j;
	Tue, 11 Feb 2025 09:48:37 +0100
Message-ID: <8b87b297-b68b-4276-95ae-e04650c3360f@leemhuis.info>
Date: Tue, 11 Feb 2025 09:48:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: clarify rules wrt tagging other people
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <588cf2763baa8fea1f4825f4eaa7023fe88bb6c1.1738852082.git.linux@leemhuis.info>
 <87y0ydzn1q.fsf@trenco.lwn.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <87y0ydzn1q.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1739263719;97e15bf5;
X-HE-SMSGID: 1thlwb-00B08d-0j

On 10.02.25 19:12, Jonathan Corbet wrote:
> Thorsten Leemhuis <linux@leemhuis.info> writes:
>> Point out that explicit permission is usually needed to tag other people
>> in changes, but mention that implicit permission can be sufficient in
>> certain cases. This fixes slight inconsistencies between Reported-by:
>> and Suggested-by: and makes the usage more intuitive.
>>
>> While at it, explicitly mention the dangers of our bugzilla instance, as
>> it makes it easy to forget that email addresses visible there are only
>> shown to logged-in users.
>>
>> The latter is not a theoretical issue, as one maintainer mentioned that
>> his employer received a EU GDPR (general data protection regulation)
>> complaint after exposing a email address used in bugzilla through a tag
>> in a patch description.
> [...]
>> Jonathan, what do you think of this? I felt somewhat unsure about this a
>> few weeks ago, but I guess I was overly careful. If you think this
>> change is fine and shouldn't cause any trouble for anyone, feel free to
>> merge this. And if not, please speak up.
> 
> I have a couple of thoughts, neither of which is sufficient for me to
> oppose the change if there is consensus for it:
> 
> - You're saying that people need to grep email addresses out of the git
>   history before crediting them in a tag; that's not a step we have
>   required of people before and seems like a bit much..?

Do I? I don't think so. The phrase used is "name and email address
according to the lore archives *or* the commit history". I'd say that is
no extra work in most cases, as developers frequently interact with the
same set of people. And when not: most development happens by mail, so
all that is needed is a simply simple "is some list archived on lore
among the recipients". But sure, if you deal with someone in bugzilla or
say gitlab.freedesktop.org it becomes somewhat harder.


> - It would be awfully nice if we could provide this advice in exactly
>   one place in the document.  This is one of our most important docs,
>   and it is far too long to expect new contributors to read through and
>   absorb.  Avoiding making it longer and more repetitive would be
>   better, if we can.

Well, in 5.Posting.rst that was possible. In submitting-patches.rst that
conflicted with existing text in three areas, so some changes were
needed; in one case the new text even got a little shorter, but overall
those changes did not add a single new line.

But sure, the new paragraph added a few lines. And it is identical in
both documents. But that is a more complex and existing situation this
patch can't solve. But of course I could avoid adding the new paragraph
to submitting-patches.rst and change the "(see 'Tagging people requires
permission' below for details)" added there already into "(see 'Tagging
people requires permission' in Documentation/process/5.Posting.rst for
details)". Given that people requested a even more detailed paragraph
(see the other reply I just sent to Laurent) that might be wise; OTOH
submitting-patches.rst right now AFAICS tries to be stand-alone, so it
feels wrong at the same time.

IOW: both is fine for me. Could you let me please know what you prefer?

> - I wonder if it would make sense to say that, if an implicit-permission
>   tag has been added, the person named in it should get at least one
>   copy of the change before it is merged?

Hah, that is where I'd start to say "that seems like a bit much". And it
does not help, as the cat is out of the bag once that copy is out, as
the name and the email address someone might prefer to keep private
would have made it to mailing list archives then already.

> OK, three thoughts, you know what they say about off-by-one errors :)

:-D

Ciao, Thorsten
