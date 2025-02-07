Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E958479
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950405; cv=none; b=iifLcjGFyxpElqjjBGkasko/Jdoq25gLfedBRxNW9SaAQ/EHHUZMAGkkvqDOCKXettbp5tlShWpqZwnq1lAfKqIp7O6ihY/t1NSogxHocDyoV+veruPbFh/8fAKt1OigHuYFx+U/ps3LeBQislqD84F9hizhbHLZ2boo9ct/l1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950405; c=relaxed/simple;
	bh=WvY5bGb6US+fjVoH7ycDafdwd1CWU5+uiCvekY76wY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJjzAIuaQNzDdaxkolWBnY042TbZUY8XMGd9cTfTya1mmp+Nsiy9taCKFOZoMSBC1jGP1INgucw5dB9bemPOPA7Dd42j5ulf39aZ1fG69FdRKpj56wm77fMkwWWW4LPxeZSdnRg83iPZvQT8oTzFiA2HZOWr6lEQf/LU9K2Uaws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=RKwzyY2y; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="RKwzyY2y"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YqLxt30VSzlgTwl;
	Fri,  7 Feb 2025 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738950397; x=1741542398; bh=Kk9Jj/avA8J1oASKyHDrwC8e
	RHvb7jBheDGjgcYfKUw=; b=RKwzyY2yvxxXo4W3mQyIqItoZrHtmCtZ6QS6rNBo
	qHKUqNASdQtiBsaRLOzUyyfjIGmBWkpC8PTwMAK0VCTgK2kJeB/5AS5XcGbF6Qu2
	SUyUF9NyPLh5S98RklOGUxRdQhWC79oRc89RpjhYO8BXeznMFgPEvFdbhOMfaU78
	yH4PrMJq629MTSSYr3DkSzjUAklf/U6UEnq1SQWLaJ/25cdlcnOykqEw/lOyhjqS
	Q+O4GmBtN3u82Le2K/LlPe1Ozqe6XIw3ktMP3LdwnXDK0pTae8WiMH9RpeVO3axV
	dPkSGP2wTMB0ErLCSGtlO7vODaLyULP1F2odUk++Z17Svw==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Zl5C0Nm-mq4s; Fri,  7 Feb 2025 17:46:37 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YqLxl3T3mzlgTwF;
	Fri,  7 Feb 2025 17:46:35 +0000 (UTC)
Message-ID: <94fa4f05-929f-4be8-b2d1-0277826984b1@acm.org>
Date: Fri, 7 Feb 2025 09:46:34 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/33] Compile-time thread-safety checking
To: Peter Zijlstra <peterz@infradead.org>, Marco Elver <elver@google.com>
Cc: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
 <90c7a807-b0a0-4b42-866f-f74c5d1c62e5@acm.org>
 <20250207084223.GX7145@noisy.programming.kicks-ass.net>
 <Z6XM6zjK3mtqYfan@elver.google.com>
 <20250207090827.GZ7145@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250207090827.GZ7145@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/7/25 1:08 AM, Peter Zijlstra wrote:
> On Fri, Feb 07, 2025 at 10:05:47AM +0100, Marco Elver wrote:
>> Yes, you can add multiple guarded_by. But it's just going to enforce
>> that you need to hold both locks before you access the member. If you
>> want the rules to be more complex, the best way to express that is with
>> some helpers. E.g. something like this (tested on top my series)
> 
> Oh gawd, this is going to be a pain, isn't it :/

The Clang thread-safety annotations are used widely so behavior of
existing attributes must be preserved. I propose to introduce new
thread-safety attributes when useful to annotate kernel code. As an
example, the Clang try_acquire_capability function attribute does not
support functions that return pointers although this is a common pattern
in the Linux kernel. I think that introducing a new function attribute
to support functions that return pointers is a better solution than
trying to annotate such functions with any of the existing Clang
thread-safety attributes.

Thanks,

Bart.
