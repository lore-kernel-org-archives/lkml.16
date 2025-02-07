Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC61B4F0C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919315; cv=none; b=DCe9WXxpJlcsWKR9iRKQrNUkUKClVEAMhka4Xwegb+pehoYP42G1aOA53eMHpGwwqNkJcP1z4VsoTPJjiG6WML8cICU9BKUXuHBk6yLIJAj2ATav7T+hm8tTnI+2l+nVYxnSB8mCQ3j+UE9pYTsemOu/4UdNzsl2wWkspbgX5xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919315; c=relaxed/simple;
	bh=b+WE6Tpw7bUCCeXlC4waYtJAdzq3f5M7yYceVjDngWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwTFxPKTEgZA/JSDK+cWRAK9Wa0yNBztxhToIkTKrQDaukEDqqVu9tdIQZJB5UiRtgDMC/F3wZc5/iB2RD1WVjNONZMsE3LSQSLj0vryF1PZPKym/ROqo0KM8I8pjvKuKraP6MIdgKYCvp1qMLVqL6cvah0GQ0j887unzj2iDrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dfdpdj/N; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dfdpdj/N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b+WE6Tpw7bUCCeXlC4waYtJAdzq3f5M7yYceVjDngWw=; b=dfdpdj/NFuH150gOiVVXhXhS/m
	71yF9Pw5fRazqPDTiA0ZO2XuT5BRDyJg7mZ1Lo7K4jzQh/Q3jvzppvngvJLOiEMRilwK9sxriO51X
	h09zMtRFq3P/tFLr4ure5bcGhqlUF6tKEopeUkNYtV7OXg5/vjs/TNZpScXY4dSmJcCubiJg0409R
	SkP8eNXheOsw4dMCd+s6Epmd5CFOClyW/dRCqtarbyP9rlC5JI97rtI1vi20kZ3wta2iKhPzaX7hC
	8FWBCMSQ6TqK1pSqORQ13jFPb3kQvgHYuJQyvAMXaVLaaocFjbpwlhv6sdAEfjTsfSsHqhxUFaKar
	U66Qw33Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKLc-0000000H9Da-0Zx6;
	Fri, 07 Feb 2025 09:08:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4523D300310; Fri,  7 Feb 2025 10:08:27 +0100 (CET)
Date: Fri, 7 Feb 2025 10:08:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 00/33] Compile-time thread-safety checking
Message-ID: <20250207090827.GZ7145@noisy.programming.kicks-ass.net>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
 <90c7a807-b0a0-4b42-866f-f74c5d1c62e5@acm.org>
 <20250207084223.GX7145@noisy.programming.kicks-ass.net>
 <Z6XM6zjK3mtqYfan@elver.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6XM6zjK3mtqYfan@elver.google.com>

On Fri, Feb 07, 2025 at 10:05:47AM +0100, Marco Elver wrote:

> Yes, you can add multiple guarded_by. But it's just going to enforce
> that you need to hold both locks before you access the member. If you
> want the rules to be more complex, the best way to express that is with
> some helpers. E.g. something like this (tested on top my series)

Oh gawd, this is going to be a pain, isn't it :/
