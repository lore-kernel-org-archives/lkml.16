Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763372E7184;
	Thu, 26 Jun 2025 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945476; cv=none; b=HSZDYPEKIogS0BFPnMRenFQ7nS1y6Cg4o1cmqNFtNiBEjrBOwScjFSaHsYauSR7MO4IO6+brqNbWd+GseUXx9Ey8eosWS2yb11o4RkoeRf0fn6ln3/nNmOTPoRV53t6gHSi2NYgipg/7IVF5TbWeJ+TIzIYZUhFir/DJcsDMBis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945476; c=relaxed/simple;
	bh=Ny9Vbn7ZHK3/VxaosjUkWXgcjFp6Xt44e+2Vvdj2XCY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=FG9vhsS9k1j41wcz4M71iyIL+SMyn0wn7YHKy7oI4kQWf68Sfyq7jw2JF9unLRVCo3nT7x3Ma+nfcXe/8Vng3CjxsgcPTtiTprbfdE8ppnewEYTTfjNlv4g7iCRVdbAbJuGtQhO2h82n14mnoDv8wBrMQX5uaOil6NmMBwaKzb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IW1C3N2F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IW1C3N2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D584C4CEEB;
	Thu, 26 Jun 2025 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750945476;
	bh=Ny9Vbn7ZHK3/VxaosjUkWXgcjFp6Xt44e+2Vvdj2XCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IW1C3N2FcDR8ZzOhvR1V72f4Kii58ZFIEBwfyV4PdjP7Y7wzQg1IHCHRM1EpSET7V
	 vz3IowCF9c/HF//9z/0vw0apychE2ggeqKg999BpxbmIN/t6UHH8U8cdOmQe6tb6FY
	 fRbAwPTYaT21XJqg41VGO2y6+NN8O5l9yj0oDyj3FrXdX/N9zyMsDo8GZEBpuRGTIC
	 MWzBGXMDMLapfybHAbGr4RhTOh5n0blNVHa9qRLE6eayr86RxyYqfxxoH8PI2bOXdQ
	 nz+EP3koexb89FLQtsdRCyDsVfqIJIfDooBy8TWBQ659AGWBmFdSvb43OHyeXthy7S
	 crYl5mBiUee6A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Jun 2025 15:44:31 +0200
Message-Id: <DAWID96TPD6Y.24T1VWNHUYYLN@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: devres: require T: Send for Devres
X-Mailer: aerc 0.20.1
References: <20250626132544.72866-1-dakr@kernel.org>
In-Reply-To: <20250626132544.72866-1-dakr@kernel.org>

On Thu Jun 26, 2025 at 3:24 PM CEST, Danilo Krummrich wrote:
> Due to calling Revocable::revoke() from Devres::devres_callback() T may
> be dropped from Devres::devres_callback() and hence must be Send.
>
> Fix this by adding the corresponding bound to Devres and DevresInner.
>
> Reported-by: Boqun Feng <boqun.feng@gmail.com>
> Closes: https://lore.kernel.org/lkml/aFzI5L__OcB9hqdG@Mac.home/
> Fixes: 76c01ded724b ("rust: add devres abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/devres.rs | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

It would be enough to require `Send` on all `impl` blocks and not on the
struct itself. Normally, I recommend doing that, because then you can
have types like `Foo<Invalid>` existing when they come up in some weird
type. But in this case, I think it's fine to add it to the type
definition.

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
