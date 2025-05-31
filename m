Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7587E199FAF
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748719305; cv=none; b=s9ecjVoJNsHAVpKoZXvsvxXpzvMfZT8IbhX1amcp/AEkL92O0wPHFwDWbBL4mL+5PDatCCH0NpOxiKZHltG9sSWjR1kA93YY3961FCxb5H5tQJKBjC92c7msTDzapwQ4zQeu8/H2blccIWBZFq9JgbjC4efwbWtJ+KZhqX16Cqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748719305; c=relaxed/simple;
	bh=KTU21gCk3/eglpPFsPrKfZ+Gc2f5WKIicJOerDScCPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjnI2KafzXY7lM6ZfpSjyJ2mFWnAoYImWhMHm2JTpmn2aR4ia2SeG0Ti1i4BYoAdeI5uoqobU4uEW0pPHgxOhNbGqS4JliM/0mOGBm/m1nYVdp0EDjzd5j58jZLNPN81YyZiZfERgZawAD9Ri6/JKfZ95Iw9d1bHr4A/FarTTzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FEDeIVeU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FEDeIVeU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C17C4CEE3;
	Sat, 31 May 2025 19:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748719304;
	bh=KTU21gCk3/eglpPFsPrKfZ+Gc2f5WKIicJOerDScCPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FEDeIVeU4wcOX5lVlEuECAvMRkxxj3r4/lf9epnC5Jg0VVBMxf7GVkUFjWn4yxMYl
	 tMjQTI6nGxGr2D+FJIcFF6wK5zrKWRQlSdXi6uhyIJMAaptkXA1BDHay6FAk1ytIMD
	 e4DUqinfZD95l+wHl936KUvboOyP1t0QgYGcdhso=
Date: Sat, 31 May 2025 15:21:35 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Ingo Saitz <ingo@hannover.ccc.de>, 
	kernel test robot <oliver.sang@intel.com>, Marco Elver <elver@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <20250531-resolute-glittering-cuckoo-b6cd91@lemur>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>

On Sat, May 31, 2025 at 11:20:20AM -0700, Linus Torvalds wrote:
> Konstantin - please disable Kees' account immediately until this is
> cleared up. Because this looks *malicious*.

Account disabled until further notice.

-K
