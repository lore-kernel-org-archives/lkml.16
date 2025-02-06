Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF71B21AA
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866866; cv=none; b=WouWfMlP5B6GQqyf61F4sLl48aKZ+R8R4qDuZX7n0q9Oej/qNSwYQYMg7Mmz6XuDAoPM0fXXxCd1+xofUSS41zP6nIfixP2A0vyRFUG1EorDF4qdJeXgcH5lMWUWf/H7QhH6xbvVZTvIx2S6NnX48SQcEurEAwlu1SYruzqlqqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866866; c=relaxed/simple;
	bh=Z0UpJ7EKA6bZEYQzZnj/UmAdLN9lPHDs8IUGbD2Ej84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BP+SDxAI/IKU6W+51CcC7vWCCEyLAXtlzA6ddgEyRAc7UhT305GdQamYivVAGcgFkD7f6uC94s9uHqjtkmqLpaxxq+R8qTEMMXZ00b9bF/GOT1TqwgQpCTAEWyjRvmTtbk52PAywY3ySCzyGUu7EPB+xB/rOuPKC8f6tMBalrdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=AU9KWyFe; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="AU9KWyFe"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypm3G45Z7zlgTwF;
	Thu,  6 Feb 2025 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738866853; x=1741458854; bh=VSCPWAXNUHFdqBkP4YrUW65Z
	8TH6AZeQV7NNr3N5wNo=; b=AU9KWyFe7MY8ErpnV7qmPAYXo4w6tjW/Zj846x/P
	hOP8VJxjMt8hMRcygxlIwshROdRG1FyCUf768NSVI9JJt/79Li2CRD+G7pUwD9mo
	l44ePXv0pqwLdUuPWA69HqdxeNgjfehzqJoT+eMjxs835mE//2vTMh6VpX2uPaaY
	EgSWeGDASkTt/C2Xf7c4J8FDz4D/izMDrTCIQcFMkWRQ9uvPoa+0r6kcI6c4aWYY
	uPYBGB7YY+VNwUdUE0bLLzQfdXG1DJJjohZrYodFNoYw24TDNcTaBKqpRUnevmNG
	boCCEsloh1TgNJMRaZnNrelpv1b8uRA26R/0XQHhPDt/ew==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id wm-TBsG1t9OO; Thu,  6 Feb 2025 18:34:13 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypm372JbCzlgTw4;
	Thu,  6 Feb 2025 18:34:11 +0000 (UTC)
Message-ID: <90c7a807-b0a0-4b42-866f-f74c5d1c62e5@acm.org>
Date: Thu, 6 Feb 2025 10:34:09 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/33] Compile-time thread-safety checking
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/25 10:20 AM, Marco Elver wrote:
> Combining approach #1 and #2 may somehow be possible, but it is
> currently eluding me. Clearly, based on the bugs that Bart found, some
> way to do tree-wide analysis is very useful!
> One idea was to have "capability-selective tree-wide analysis" (such
> as mutex only) be controllable via a Kconfig option - the
> implementation of that (without excessive ifdefs sprinkled
> everywhere), however, most likely requires compiler support.
> 
> Depending on the feedback that results from these RFCs, I think we
> will be able to plan better which direction things should go.

Thank you Marco for having explained clearly and in detail what the
possible paths are for enabling thread-safety support in the Linux
kernel. I agree that there are at least two possible approaches (maybe
there are even more possible approaches?). I'm interested in enabling
the Clang compiler flag -Wthread-safety across the entire kernel. Hence
the choice to start with annotating struct mutex only and to make the
necessary changes across the entire kernel tree.

I'm looking forward to the feedback from others about what their opinion
is about how to enable thread-safety checking in the Linux kernel.

Thanks,

Bart.

