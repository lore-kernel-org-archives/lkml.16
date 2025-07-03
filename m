Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBCD142E73;
	Thu,  3 Jul 2025 08:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531091; cv=none; b=Riq/zAvPHlPL+2S7LxqYTNOECkfiSy54MIv3Bdu3Md5gaXvBzKa1R1dPm2szVlhjb3QvNhNQBu4JU9MaJ4gQyrKnRJ7QNAsWC7ITCFYl8uoBQpVTTZnWZvp6gJYeKuukCP84mVWhKcqPwt1UX/RtzDe1FyGmT+722jI2/1ujcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531091; c=relaxed/simple;
	bh=2g1z9Lo+89gJyejgACQ+2xNbf+MhUSX6mK1HfGuQ5K0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ZczDkYDxN6tvAQbnsKw50vpfmO+SkcAwedTKmGNVv8+hUwEKfsNB2xjvRErBR3S0upX9SdjkNWuhgPe5/ukRIdahgga29iKMgGBzj/lujQOl9rapEKmCY7OY+/D8OETpl5l70StIS+bBtpqRWBLLl2BlJ49hovXN0RW9zOpSWcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4F5rdDx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4F5rdDx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D73C4CEE3;
	Thu,  3 Jul 2025 08:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751531091;
	bh=2g1z9Lo+89gJyejgACQ+2xNbf+MhUSX6mK1HfGuQ5K0=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=C4F5rdDxmdPdW71ZgIPdlkQ8VXK5Vh8uxRpFu/cu7EFBHzyWPUfhR2pbLhfd4KVDe
	 aJ6eTXirOZBTCeFJSmm8h9NOGEBxZEnTJIN5+pQvnB8Y5a48z+Pf+aJF/cxHDep/kF
	 fdmkkQ8ZwkMMIJkihFMWZamzblmj0TO2qOOJvlkMkRLbHA1kdaygz/jcSq6R4WB7e8
	 LBofvjai4Rw0sOrxGflW1RqPaoInmy0rgMyNuISnZpXvZax+1qgh+b4XZC3i4T8Txt
	 dMtxB75suheIUbY9H1ytsvNqrH9AsLEdwylHbp5EjunuC9RrTtlL13EMxGMDAgx/nA
	 +nHLI1AuKy29A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 10:24:47 +0200
Message-Id: <DB29Y9LUF90V.90X56SDRG8LN@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <rust-for-linux@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v5 1/2] rust: revocable: Refactor revocation mechanism
 to remove generic revoke_internal
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
 <20250626165927.66498-2-marcelomoreira1905@gmail.com>
In-Reply-To: <20250626165927.66498-2-marcelomoreira1905@gmail.com>

On Thu Jun 26, 2025 at 6:59 PM CEST, Marcelo Moreira wrote:
> The revocation mechanism is refactored by removing the generic
> `revoke_internal` function. Its logic is now directly integrated into
> two distinct public functions: `revoke()` and `revoke_nosync()`.
>
> `revoke_nosync()` is an `unsafe` function that requires the caller to
> guarantee no concurrent users, thus avoiding an RCU grace period.
> `revoke()` is a safe function that internally waits for the RCU grace
> period to ensure all concurrent accesses have completed before dropping
> the wrapped object.
>
> This change improves API clarity and simplifies associated `SAFETY`
> comments by making the synchronization behavior explicit in the function
> signatures.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

With the patch order changed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheer,
Benno

> ---
>  rust/kernel/revocable.rs | 48 ++++++++++++++++++----------------------
>  1 file changed, 21 insertions(+), 27 deletions(-)
