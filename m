Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CBF281356;
	Tue,  3 Jun 2025 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748940394; cv=none; b=tNFS93NLzbn9sOsgYwq2votedGH4pOzEu9yydXUZRGi5OqwP7yvoN3jmQuAGhMTrG+YfOCThEkyxClgM5p2tGjzOxs5X1WnoiKK4fKbDFVNsltBj5gl/d61flFpD0zQ44EjXbiRDYIIiNYhXjy2U4xhs7b1Qucd27cLU7xOYmO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748940394; c=relaxed/simple;
	bh=LFz97GGrXjWAWsO5RMuTD/kfw8sj5af6GuoPaqymOlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4ssGRo3PTetmOcdBQnFceR8SPDF+5dzSBhU3bDod93r9E+mvtZgml7MCE6GlKfVxoivbN8iMJNQsBZScFy68GYC8q8BTZmY/PPQa2EKcA2hd7XpeibJnaDg+Q/1S4wFd91DcnP0Iy1UrM7FG8X1wXacGbziieoi0h1VDdd4gCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EU/Xn7u5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EU/Xn7u5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E217BC4CEF0;
	Tue,  3 Jun 2025 08:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748940394;
	bh=LFz97GGrXjWAWsO5RMuTD/kfw8sj5af6GuoPaqymOlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EU/Xn7u5cUhPiquzi/rd7uYTgeD6XfWXKchE918IFUg/0Vun3SGBMVzBdjXFjdVsW
	 CWynyRUI4haZSFEBPj0Z2ZAww6sO3kGnUQ0lNHnEEI2av/2JWpTiEg1t4l0tw2Z9hF
	 zLRV2kNF9c1kiP/+5WkBRQrNNN7jkgMcLfTSsucdz6ukhBkkmuDrQlf7Yt/+PksgTs
	 TKPzt+DPDlFqOhIw/Vfm00d/XLGxn6WOC+jjkL78nIwzoJlKABDdJwc7UYjIVwl21k
	 r4k4y+A0qnULLPsCkeUZCtOuqbQw1/UYT0heCl06Jy0q7+6+anZg63c3R8xa1pfiTg
	 stgAGvD9FMvyA==
Date: Tue, 3 Jun 2025 10:46:28 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
Message-ID: <aD62ZGBwqXxTroeX@cassiopeiae>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
 <aD3PCc6QREqNgBYU@google.com>
 <aD3f1GSZJ6K-RP5r@pollux>
 <aD6yOte8g4_pcks7@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD6yOte8g4_pcks7@google.com>

On Tue, Jun 03, 2025 at 08:28:42AM +0000, Alice Ryhl wrote:
> That optimization sounds like something we definitely want, but I have
> one question: is free_irq() safe to use in atomic context / inside
> rcu_read_lock()? What about the threaded-irq variant?

No, free_irq() must not be called from atomic context. Hence, it's not valid to
call it from within an RCU read-side critical section.

I assume you're confusing something, free_irq() is called from the destructor of
the irq::Registration object, hence it is either called when the object itself
is dropped or from the devres callback, which is called after the
synchronize_rcu(), but not from an RCU read-side critical section.
