Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1603317A305
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631249; cv=none; b=jgQtjet59oqPEVTljSBcsLjuTuNE25phmhDRTvFR5ngBQFHtGU1iV5hefVimU2ZpPIgEAUhNifcA4g1jclLWFU+m5W2qpP+BQljCQjeJnODFXt42lGPEUJ0NGm5WHtRIZBXSGd+5u5/EYMVIqvx+XmywCvEpcC0LA34BHhXNKmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631249; c=relaxed/simple;
	bh=zUO6CHdVzqap3LuvQY76AT66CGy4KqQ48Q1KnHG0avM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=kQRPQddRGwmziAOYkgPYQPmpf+acba9aqdn+gnYNdSySbJQIqVBH+m5efFjDUIWh0E6vdHHSah6rou0t18VNURQ3FD63yQgKFDY+u6hHLV86pS5ocyfNp1dfQwgAjbWteX8/K9IwFzJ6olEtC5Y2tYVL9dMSJnn5LieZtKi9K+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Zblrp5x9wz9tLL;
	Mon, 14 Apr 2025 13:47:22 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Apr 2025 13:47:19 +0200
Message-Id: <D96C5R3AENKF.SYMOHIO4NZLB@buenzli.dev>
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Rasmus Villemoes" <linux@rasmusvillemoes.dk>
Cc: "Petr Mladek" <pmladek@suse.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Sergey Senozhatsky"
 <senozhatsky@chromium.org>, <linux-kernel@vger.kernel.org>
Subject: Re: Exporting functions from vsprintf.c for Rust
References: <D931ZH9KRY2E.2D7HN6QWELGFJ@buenzli.dev>
 <Z_jj_8vvmWY-WuTU@pathway.suse.cz> <D93S1SHPJDDU.INJ3UWZUM1UY@buenzli.dev>
 <CAKwiHFi_egfePDdXQEtYNvO-U65O==MosHNQ7Vm4F6iudJs95g@mail.gmail.com>
In-Reply-To: <CAKwiHFi_egfePDdXQEtYNvO-U65O==MosHNQ7Vm4F6iudJs95g@mail.gmail.com>
X-Rspamd-Queue-Id: 4Zblrp5x9wz9tLL

On Fri Apr 11, 2025 at 3:43 PM CEST, Rasmus Villemoes wrote:
> On Fri, Apr 11, 2025, 13:36 Remo Senekowitsch <remo@buenzli.dev> wrote:
>
>> On Fri Apr 11, 2025 at 11:42 AM CEST, Petr Mladek wrote:
>> >
>> > Honestly, I do not have a good feeling about exporting the internal
>> > vsprintf() functions. They have a very specific semantic.
>> >
>> > Especially, they return pointer to the next-to-write character.
>> > And it might be even beyond the given *end pointer. It is because, for
>> > example, vsnprintf() returns the number of characters which would
>> > have been written to the buffer when it was big enough.
>> >
>> > Instead, I suggest to create a wrapper which would have a sane
>> > semantic and call scnprintf() internally. Something like:
>> >
>> > int fwnode_full_name_to_string(char *buf, size_t size,
>> >                              struct fwnode_handle *fwnode)
>> > {
>> >       return scnprintf(buf, size, "%pfwf", fwnode);
>> > }
>>
>> That makes sense. I tried your suggestion and it works, thank you!
>>
>>
> But is a wrapper even needed for this? Can't the appropriate sprintf
> variant just be called from Rust with that %pfwf format string?

Yeah, that works. Seems like the simplest solution - no C changes needed.
Thanks!

Remo
