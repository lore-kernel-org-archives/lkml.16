Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3321521883F;
	Thu, 19 Jun 2025 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342451; cv=none; b=Lr/9uRoZtI8pr8i5E9j/axJ6lBGhH1dJLUto2C+FOmSTukR2xx6IJbknbRwWO/zwIVr59yIEGU0OFvZx4EF9EoqBIH43baKVXtatNn9pwP+1AkgxX+eGiL5SnJ7DwGpgk/5rUBLi0eAsoXpbTQ980C4uZejRorbrbmP97JBib4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342451; c=relaxed/simple;
	bh=ujJLdTiBqwmLx05oQHBt6I+p9J9oSCYXFfHSqzgHxuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxOxfpaJkkAlwgqFMTe+L8qjAC4CzAmQ/ZBIGLAOHt5epXs1DYEFj36E7/hVdhEctwqR+NaGpCEpkJbGbRJq23hu3OQQk9UNY8K2zAw/XDrRi89nlDW04lEo5hnULAHzRYXmWYkhIloiN1gpTQEc+igVEmOzfPZq2fZTAgM3pKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=P8EKjNn+; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P8EKjNn+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qQB2XCfNv1mPlDxDY2eQ0xVBVFH6UjPq5fcEOS9JpOs=; b=P8EKjNn+xQFlqctyEskyDgDURL
	dQjN9bwpxdpKweO2HtIpwug2mWfpwd/bH9x4gqaUAGt6bvw4eBcl7eV2GQGdlCI25aVI7lnOUqpxO
	h6MUJfkGL5se55vY0j0O+rAAhQLTEDKfjV/v/GlPYjX/ealsWjAk/f36aw8LktHsGWtXIVvURVmB1
	lDg8nKvpiEKijpXXKkUPiCUELmzMIPMH8EcUVBConlrC3iRc1iZx384tJdFGJb4GBMYQyzRQlgZ/k
	/BvCXM2ez7PlBfmAh5slYdnEUtICdhxkvUvioIA2PhXb/dQ7O0BnvNI0LXPGKWTm0TkvJah9w8sf+
	6K/jtfng==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSG1i-00000004SET-1Moq;
	Thu, 19 Jun 2025 14:14:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 50C2530890E; Thu, 19 Jun 2025 16:14:01 +0200 (CEST)
Date: Thu, 19 Jun 2025 16:14:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com,
	longman@redhat.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, thatslyude@gmail.com
Subject: Re: [PATCH V3] implement `ww_mutex` abstraction for the Rust tree
Message-ID: <20250619141401.GI1613376@noisy.programming.kicks-ass.net>
References: <20250619140656.498-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619140656.498-1-work@onurozkan.dev>

On Thu, Jun 19, 2025 at 05:06:56PM +0300, Onur Özkan wrote:
> +bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
> +{
> +	return ww_mutex_is_locked(lock);
> +}

Do we really need this? In general I dislike all the _is_locked()
functions and would ideally like to remove them.

Pretty much the only useful pattern for any of the _is_locked()
functions is:

  WARN_ON_ONCE(!foo_is_locked(&foo));

Any other use is dodgy as heck.


