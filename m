Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C3B1A0714
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953328; cv=none; b=XHjI6YVQUu5t1TXz8zy/4cSWL0mvzoleRxw7091ev93+TiuaJcWhiQdI7xMy41NNoItg7DTx9YgEH27+apl32y0iw5yDmMAjC6jtU1El0fjOH7LCuXnZfyMtB1uK1ihdPt+ho+7BgG6lmbLokr7NLt53Zk9WyhKGSddqsSFA+HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953328; c=relaxed/simple;
	bh=Jz3OGM3CJwedO3dpuCR2F7sZ3dOGo78LyLyGSTRG7Sw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYM9q8dBvqmu3/IEYll0ddZayO6VqkecZ9O6KfRvYEAWZfMjgdM40GGCsKyH2GZK9c5Q8Y4fDAmb08eTolhlG15zursza8YANdksvDj3xJNTz+Z/k1JcmTAcQUqfCQke2JYmsd9wj2eZF5d9Tj71HxcGjAw1LIhFQJzWsE2k93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=AM+9xSb5; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="AM+9xSb5"
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YqN2020Gsz6CmQyW;
	Fri,  7 Feb 2025 18:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738953315; x=1741545316; bh=+z+uoBXgD2CIF3CSiOPh7oix
	mSucYf+tlsV4tFwo7uY=; b=AM+9xSb5lxEPxRBJuiY4oqN13XFQihHa1ozvU2Nq
	q0ay1LZQ9K1AYekePCQxMU5Y/EY02F3quMj5k7DNN4EPjtU1l/t+YUUPl0aCbKZ6
	oGfevvrTVC+53F1xEyPTh06MVzzhxqKheImbMJmLg4C/hxSMlfk71l/M8j1O2838
	TkUqYZhiDZHUoPkQTBO3fe8eT6rnKXP4DGyppVxCuHEBQwBt5B/u4BW97KN0sdEn
	ThY0xxHlFMAvttvFymW5Lr92SzyUEKDyRDG+3uEVkmei8i15w0GPbEjI2Eoa1YsA
	GqmzfyUlQfx+52qB248NG8xYLGqpkvjpV7Ol2SUsLiIZ4w==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id DZsPFp00jyoJ; Fri,  7 Feb 2025 18:35:15 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YqN1r6qYbz6CmR1W;
	Fri,  7 Feb 2025 18:35:12 +0000 (UTC)
Message-ID: <fa9245f4-c84f-40ea-8a5c-b1a31fee7525@acm.org>
Date: Fri, 7 Feb 2025 10:35:12 -0800
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
 <90c7a807-b0a0-4b42-866f-f74c5d1c62e5@acm.org>
 <20250207084223.GX7145@noisy.programming.kicks-ass.net>
 <Z6XM6zjK3mtqYfan@elver.google.com>
 <20250207090827.GZ7145@noisy.programming.kicks-ass.net>
 <94fa4f05-929f-4be8-b2d1-0277826984b1@acm.org>
 <CANpmjNNX072Uz+XCOuXwF6u8dHHkv+Wv=mN4mtV34AUS7E3Ozw@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CANpmjNNX072Uz+XCOuXwF6u8dHHkv+Wv=mN4mtV34AUS7E3Ozw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/7/25 10:24 AM, Marco Elver wrote:
> On Fri, 7 Feb 2025 at 18:46, Bart Van Assche <bvanassche@acm.org> wrote:
>> As an
>> example, the Clang try_acquire_capability function attribute does not
>> support functions that return pointers although this is a common pattern
>> in the Linux kernel. I think that introducing a new function attribute
>> to support functions that return pointers is a better solution than
>> trying to annotate such functions with any of the existing Clang
>> thread-safety attributes.
> 
> try_acquire_capability / __cond_acquires(cond, capability) is happy
> with pointer-returning functions when using int-literals for "cond"
> i.e. 0 or 1 (Clang's documentation says it only wants bool, but that's
> wrong). I just tested this on a pointer-returning function, and it
> works.

The first argument of the try_acquire_capability function annotation
must be the value that indicates that the capability has been acquired.
I'm not aware of any function in the Linux kernel that returns a pointer
and where returning a NULL pointer indicates success. Additionally,
return ERR_PTR() is used widely. Neither pattern can be annotated with
try_acquire_capability today. This is why I wrote that we need a new
function attribute for functions that return a pointer.

Thanks,

Bart.
