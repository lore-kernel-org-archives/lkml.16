Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EED7262C;
	Sun, 22 Jun 2025 21:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750626328; cv=none; b=SlEeSjrZjyoeOUCXZjKt1U3GSe9q6lNUdTjF/JWtSBxYmw+OLI0kxvgyg6s/fYgNasiQnP1FShKVb7X4ifsVeaoMt+rDCMDzC+FtU1qww4n7pfvQ4SbGdekSaCngf0hdWQtW4VjZInDct3sCl32t/IJmrsNxVK1/nn5TKP9yGRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750626328; c=relaxed/simple;
	bh=KXGsiCcxvJEz00xQ2OZixbsrcar3B71UqawKSxkF7Nc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BRohXYgLL7dFjl5rI3lGp5CV6pW7qPa3JwwnRgcyXA1tkFcc9p0GbZdnuWc7lDc+hPbb1CpnpOsImzT+nj4kWkLf0VLtgiVwZk+eOsAskIs3r3X+qXvDi9455/E9KQ0EDu4LZYcNRwA9XDfkb6kWC1NwD3gtVB/M0f8URB6/mbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcnoiiR8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcnoiiR8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25579C4CEE3;
	Sun, 22 Jun 2025 21:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750626328;
	bh=KXGsiCcxvJEz00xQ2OZixbsrcar3B71UqawKSxkF7Nc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=GcnoiiR88VTISGNdpBA46mn+Nom2RFmOHKHTPA5/2kj/a3VmoFaVO9Swi9V6Ofvzw
	 mw9XVEmf4kopJUdiFqvjW9s7fIQ1vowlr4lsisvFYrzfkMhKtS1FdNlhP1HSGYlAu+
	 H3rwNr61pPO1qPsyKHM8P2pQx4RiiWGBq+5C1YPj1SlkXhXNhz5WvuL3hGQdIjctse
	 LAHI5MScieuFhpPhywbHHpwiMajH66jGU+yIssroJ41P66xHEufWIbe3OqG/XCw2ev
	 ttqEuvDuKqhDdTt5lO0apR94HxPF9q24lxVGm+jHe3Fk6kRW+ZmA7er8EeAOQhPxU2
	 Yaj+NdbPQQekQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 23:05:23 +0200
Message-Id: <DATD8MLNW17U.IESO4O1MWAPO@kernel.org>
Cc: "Will Deacon" <will@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Mark Rutland" <mark.rutland@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/5] rust: make `Arc::into_unique_or_drop` associated
 function
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Tamir Duberstein"
 <tamird@gmail.com>, "Xiangfei Ding" <dingxiangfei2009@gmail.com>, "Alex
 Mantel" <alexmantel93@mailbox.org>
X-Mailer: aerc 0.20.1
References: <20250622125802.3224264-1-gary@kernel.org>
 <20250622125802.3224264-3-gary@kernel.org>
In-Reply-To: <20250622125802.3224264-3-gary@kernel.org>

On Sun Jun 22, 2025 at 2:57 PM CEST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Make `Arc::into_unique_or_drop` to become a mere associated function
> instead of a method (i.e. removing the `self` receiver).
>
> It's a general convention for Rust smart pointers to avoid having
> methods defined on them, because if the pointee type has a method of the
> same name, then it is shadowed. This is normally for avoiding semver
> breakage, which isn't an issue for kernel codebase, but it's still
> generally a good practice to follow this rule, so that `ptr.foo()` would
> always be calling a method on the pointee type.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/sync/arc.rs | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
