Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1183527F19F;
	Fri, 30 May 2025 19:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633493; cv=none; b=FqBA+q7XzpILbKydcielx+bhU2+RFhlVJQsLxc1TrMRW47PrdtgBZL7OLw6ss4RMnLgRtKJtozm+60kSHr4jndKM1xHUX7AzXldw3R+eU3yNkjMe6aE+nn3/K+r4WFxhIyDAXkk4kskqQz3b+ZY8akrdwee2WbZeQ4Lga2BjVgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633493; c=relaxed/simple;
	bh=PtFtRy2gjAeePvHpOTZx+VvlxJP9Rnr/J6k1+7IUhHg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ormrTzMgKOGQeqPx6TS5mcQhcdcL01G1k3/QwfKLOPZ7Mu8BvsvRjQwtomsUIOdmMphyXJQ84ajtX78gliRFoxqFpd+QDne+iuezrEZUs2OunN4tz6LhnjjKOk3ZxAUZ+ghJKGZUWIYPe5Lstb951JlTXxCGjQv4v9S2LfK29p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EypQTTam; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EypQTTam"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93851C4CEE9;
	Fri, 30 May 2025 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748633492;
	bh=PtFtRy2gjAeePvHpOTZx+VvlxJP9Rnr/J6k1+7IUhHg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=EypQTTamf8eOk9A4qFS8NxaMrIOdcLeZH+5tjv5MH0lM8feBo8G65DNKTZWTqv2OC
	 65nWoQyKJf8gC1d40QN54kZfY5tPvBuUOJZmRqPm6c0wC5xGBC2gbyWVSZoyITW3E4
	 sQVZ0c2BNKEISiqPmYfuV0PobdyhtvVrnfsYusgvfvwBMAMl91EzHbAOhRbGHN2QdK
	 T+MnAXTFyue0lQdBpNqH1ZHoRr3ZPqcjmoS37kPIFTVPTX/3crfxBwwFC8Q92SjEQ8
	 zNfhMcbhvTOa3deQ1gH5pvXsDHwPYbF0c8Jrhrn4Cc4oGJbcC0ss9k6s6UfWB29XdI
	 SYgyizFsJ51bA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 21:31:27 +0200
Message-Id: <DA9QU6CVOBS6.2O87E6ZJUUBUV@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] rust: revocable: support fallible PinInit types
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <chrisi.schrefl@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-3-dakr@kernel.org>
In-Reply-To: <20250530142447.166524-3-dakr@kernel.org>

On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> Currently, Revocable::new() only supports infallible PinInit
> implementations, i.e. impl PinInit<T, Infallible>.
>
> This has been sufficient so far, since users such as Devres do not
> support fallibility.
>
> Since this is about to change, make Revocable::new() generic over the
> error type E.

You could add some information about the design decisions, ie choosing
`Error` & asking for `Error: From<E>` vs just using `E`.

> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/devres.rs    | 2 +-
>  rust/kernel/revocable.rs | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
