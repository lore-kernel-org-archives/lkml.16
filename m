Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62641252918;
	Tue, 11 Feb 2025 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287372; cv=none; b=B9o6TLv5HAgT3qNPmWNvZ+Kn0PGmZS4fHzlz8GerHRu+SfLtSE7G0iDXl/nN172F9k+Atn72d2xUdu4bC7UrWTvalnf1ZkV1a2SUwQFk5bayDxo7zUPl4eDuwmaZ3VuWu9ZkB1Epvk09B9IeWQHRm7cddpaZP2CwFu0xRKwx7eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287372; c=relaxed/simple;
	bh=3CNF3xNRfUyRu+M/1GcnWuSysIHi3jp2C4gsUX+rAQo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=guHlpZWenmiGVzkqMjgV1Gea2J1TDGDsLYDUCXATNfxV6b8JYgNDJPfttnh+z7gPB+spFW9T6qAz3VNV33gB7CL9jcih6ktkYimpRgitEsHOyuSS9x7Ld+CMkw7cOyFGy4NNOg79in9SZrwtWcCsq/FTy51HCWikAb4duvxzz9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=CGQoCIo7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3BDNW4jX; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=CGQoCIo7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3BDNW4jX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="CGQoCIo7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3BDNW4jX";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="CGQoCIo7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3BDNW4jX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7633434E92;
	Tue, 11 Feb 2025 11:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1739271931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a1i6HiwoBRawjCwK+/3RGg6JT6ZR37cdSroEOg1BbeU=;
	b=CGQoCIo76NvEKDqJNqVmzIG9jyvt45uKuK+Qw7jE7cmQe94YYu1g3NCzt77Hw4B3YlSNCW
	Ok1MMWTckSJ57PDCU+Yv0DZ/mlVoEWQ99YhmIyhGRr7UmguQMjY3x6DqIFGNYIoge9GPea
	CvwZ4bmWBmLzqBZ4KgVcIKCerPnBdjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1739271931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a1i6HiwoBRawjCwK+/3RGg6JT6ZR37cdSroEOg1BbeU=;
	b=3BDNW4jXuYaOAO4FUxzlEt3zqE+lD4tpMcZPEzhiOlvNV0cdBEYypnjqfucEQbsixWmLlA
	qvCzED0Wq6A1kaDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1739271931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a1i6HiwoBRawjCwK+/3RGg6JT6ZR37cdSroEOg1BbeU=;
	b=CGQoCIo76NvEKDqJNqVmzIG9jyvt45uKuK+Qw7jE7cmQe94YYu1g3NCzt77Hw4B3YlSNCW
	Ok1MMWTckSJ57PDCU+Yv0DZ/mlVoEWQ99YhmIyhGRr7UmguQMjY3x6DqIFGNYIoge9GPea
	CvwZ4bmWBmLzqBZ4KgVcIKCerPnBdjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1739271931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a1i6HiwoBRawjCwK+/3RGg6JT6ZR37cdSroEOg1BbeU=;
	b=3BDNW4jXuYaOAO4FUxzlEt3zqE+lD4tpMcZPEzhiOlvNV0cdBEYypnjqfucEQbsixWmLlA
	qvCzED0Wq6A1kaDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5717C13715;
	Tue, 11 Feb 2025 11:05:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4Tf0FPsuq2f0BgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 11 Feb 2025 11:05:31 +0000
Message-ID: <cd48e5d4-8925-44b1-9195-93b9c0a10d15@suse.cz>
Date: Tue, 11 Feb 2025 12:05:31 +0100
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
From: Vlastimil Babka <vbabka@suse.cz>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>
 <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
 <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com>
 <6ff32b12-7113-41dc-80d3-e729cc15a5ce@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <6ff32b12-7113-41dc-80d3-e729cc15a5ce@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo,linaro.org:email,baylibre.com:email,perex.cz:email,suse.com:email]
X-Spam-Flag: NO
X-Spam-Level: 

On 2/11/25 11:59, Vlastimil Babka wrote:
> On 2/11/25 11:48, Geert Uytterhoeven wrote:
>> Hi Uwe,
>> 
>> On Tue, 11 Feb 2025 at 11:32, Uwe Kleine-König
>> <u.kleine-koenig@baylibre.com> wrote:
>>> On Mon, Feb 03, 2025 at 12:13:16PM +0100, Vlastimil Babka wrote:
>>> > The subsystem status is currently reported with --role(stats) by
>>> > adjusting the maintainer role for any status different from Maintained.
>>> > This has two downsides:
>>> >
>>> > - if a subsystem has only reviewers or mailing lists and no maintainers,
>>> >   the status is not reported (i.e. typically, Orphan subsystems have no
>>> >   maintainers)
>>> >
>>> > - the Supported status means that someone is paid for maintaining, but
>>> >   it is reported as "supporter" for all the maintainers, which can be
>>> >   incorrect. People have been also confused about what "supporter"
>>> >   means.
>>> >
>>> > This patch introduces a new --substatus option and functionality aimed
>>> > to report the subsystem status separately, without adjusting the
>>> > reported maintainer role. After the e-mails are output, the status of
>>> > subsystems will follow, for example:
>>> >
>>> > ...
>>> > linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
>>> > LIBRARY CODE status: Supported
>>> >
>>> > In order to allow replacing the role rewriting seamlessly, the new
>>> > option works as follows:
>>> >
>>> > - it is automatically enabled when --email and --role are enabled
>>> >   (the defaults include --email and --rolestats which implies --role)
>>> >
>>> > - usages with --norolestats e.g. for git's --cc-cmd will thus need no
>>> >   adjustments
>>> >
>>> > - the most common Maintained status is not reported at all, to reduce
>>> >   unnecessary noise
>>> >
>>> > - THE REST catch-all section (contains lkml) status is not reported
>>> >
>>> > - the existing --subsystem and --status options are unaffected so their
>>> >   users will need no adjustments
>>> >
>>> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
>>>
>>> This patch is in next as c1565b6f7b53ea1ea3e757538832e12d7d13d949. It
>>> breaks one of my scripts that I use to semi-automatically determine
>>> recipents for patch series.
>>>
>>> It works as follows:
>>>
>>>         $ batch-add-recipents audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks-through-cl.patch
>>>         #!/bin/sh
>>>
>>>         addrecipent \
>>>         -t "Rob Herring <robh@kernel.org>" $(: maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
>>>         -t "Krzysztof Kozlowski <krzk+dt@kernel.org>" $(: maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
>>>         -t "Conor Dooley <conor+dt@kernel.org>" $(: maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
>>>         -t "Neil Armstrong <neil.armstrong@linaro.org>" $(: maintainer:ARM/Amlogic Meson SoC support) \
>>>         -t "Kevin Hilman <khilman@baylibre.com>" $(: maintainer:ARM/Amlogic Meson SoC support) \
>>>         -c "Jerome Brunet <jbrunet@baylibre.com>" $(: reviewer:ARM/Amlogic Meson SoC support) \
>>>         -c "Martin Blumenstingl <martin.blumenstingl@googlemail.com>" $(: reviewer:ARM/Amlogic Meson SoC support) \
>>>         -t "Liam Girdwood <lgirdwood@gmail.com>" $(: supporter:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
>>>         -t "Mark Brown <broonie@kernel.org>" $(: supporter:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
>>>         -t "Jaroslav Kysela <perex@perex.cz>" $(: maintainer:SOUND) \
>>>         -t "Takashi Iwai <tiwai@suse.com>" $(: maintainer:SOUND) \
>>>         -c "devicetree@vger.kernel.org" $(: open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
>>>         -c "linux-arm-kernel@lists.infradead.org" $(: moderated list:ARM/Amlogic Meson SoC support) \
>>>         -c "linux-amlogic@lists.infradead.org" $(: open list:ARM/Amlogic Meson SoC support) \
>>>         -c "linux-kernel@vger.kernel.org" $(: open list) \
>>>         -c "linux-sound@vger.kernel.org" $(: open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
>>>         audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks-through-cl.patch
>> 
>> Hey, that looks familiar ;-)
>> 
>>> the output is usually redirected to a file that I edit before running
>>> it. The additional line in the output of
>>>
>>>         scripts/get_maintainer.pl audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks-through-cl.patch
>>>
>>> with your change breaks that script.
>> 
>> You forgot to list the additional output?
>> 
>> I gave it a try with my script, and with one of my own patches.
>> Example additional output is:
>> 
>>      --cc "ARM/Microchip" $(: AT91] SoC support status: Supported \
>>     --cc "QAT DRIVER status: Supported \
>>     --cc "ARM/ASPEED MACHINE SUPPORT status: Supported \
>>     --cc "MELEXIS MLX90614 DRIVER status: Supported \
>>     --cc "ARM/NUVOTON MA35 ARCHITECTURE status: Supported \
>>     --cc "ARM/RISC-V/RENESAS ARCHITECTURE status: Supported \
>> 
>> Iff this extra output is good to have, why not include it in the comment
>> next to the existing entries with the email addresses, so it will be
>> handled automatically by all scripting on top?
> 
> I've tried to do that in v1 in the form of reporting e.g. as
> John Doe <jd@example.com> (maintainer:SUBSYSTEM [supported])
> 
> But it seemed noisy to repeat that on every line involving the subsystem.
> 
> When you say comment, what kind of separation for the comment would work
> regardless of what's used for postprocessing?
> 
>> Now, as both Uwe and I edit our generated scripts before running them,
>> we can delete the unwanted lines, but it's more work...
>> Thanks!
> 
> I guess technically your scripts could detect first if --no-substatus is
> supported by grepping --help or testing if passing the option results in an
> error? But yeah it's not ideal, looks like I've hit the limits of automagic
> heuristics here.

Hm maybe I could add "-t STDOUT" to the heuristics?

> Or we make it fully opt-in but then most non-scripting users will not learn
> the status at all because it won't occur to them to enable it...
> 
>> Gr{oetje,eeting}s,
>> 
>>                         Geert
>> 
> 

