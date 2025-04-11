Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E701D20371E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371402; cv=none; b=qybQoenZevnCvtjFEfKWU+Kbtodv9YspAqEe7zKo5nlpv+/sbqCtgL2sCw15iP1/3qFJ36rKRmHazts37v7G6+b0jMliCxiiUlIG70EXfQZwUBuSwTueqHSQaEx+Iy1WpUEXNDz5kgTKCIEZexkZBE4RcILX3rufCxizH2wEe84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371402; c=relaxed/simple;
	bh=zGnF/xU6fd+UG5HzQgAWrDDWXcrOrUQBBZctL7R6qiI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VTbVgyH5/3EquyBo8kcN9ucrS4njhxueF7yLms8BidIRIDdAW9taGUTYKGmo9MqdfqLob15EBuhMHNyB2zgXR/sjCbYhi0pcyj+hGcZUZGppcvTjUdduXRkl9zmxClORz3Ot4wbayO8ld6ywSs2/6LPy2XX/CBKK4z5MTr+2EYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZYvlf1QDGz9shw;
	Fri, 11 Apr 2025 13:36:30 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 13:36:27 +0200
Message-Id: <D93S1SHPJDDU.INJ3UWZUM1UY@buenzli.dev>
Cc: "Steven Rostedt" <rostedt@goodmis.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Rasmus Villemoes"
 <linux@rasmusvillemoes.dk>, "Sergey Senozhatsky"
 <senozhatsky@chromium.org>, <linux-kernel@vger.kernel.org>
Subject: Re: Exporting functions from vsprintf.c for Rust
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Petr Mladek" <pmladek@suse.com>
References: <D931ZH9KRY2E.2D7HN6QWELGFJ@buenzli.dev>
 <Z_jj_8vvmWY-WuTU@pathway.suse.cz>
In-Reply-To: <Z_jj_8vvmWY-WuTU@pathway.suse.cz>

On Fri Apr 11, 2025 at 11:42 AM CEST, Petr Mladek wrote:
>
> Honestly, I do not have a good feeling about exporting the internal
> vsprintf() functions. They have a very specific semantic.
>
> Especially, they return pointer to the next-to-write character.
> And it might be even beyond the given *end pointer. It is because, for
> example, vsnprintf() returns the number of characters which would
> have been written to the buffer when it was big enough.
>
> Instead, I suggest to create a wrapper which would have a sane
> semantic and call scnprintf() internally. Something like:
>
> int fwnode_full_name_to_string(char *buf, size_t size,
> 			       struct fwnode_handle *fwnode)
> {
> 	return scnprintf(buf, size, "%pfwf", fwnode);
> }

That makes sense. I tried your suggestion and it works, thank you!

Best regards,
Remo
