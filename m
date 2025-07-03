Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6682D0C8A;
	Thu,  3 Jul 2025 08:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531094; cv=none; b=U/o0jhYx5PAr6Ej97uMNiZ4ZVgR1pP2iStWTBxkfFAPzqYqMJsnDhoPpCgJW62wna4m+CjivsCXOGSU0tLWay1+ex3yTwwGW+Btz3Of9AQNrWm4d0uSqqzHY+MikKG0Ns/l/aNWMxJJwGrHfnXkWC471O030UPK1FxK228MVz80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531094; c=relaxed/simple;
	bh=M4Ov1VXaqpydoTJijiZAO+F7mcgehJ0Rtm+hmVqdK1M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=q9VZCSWUuhd2Ud7rjwwGL8Mfv5ALUXxA9CfxsIwhp0LJg7BIaUxv5ZqoI5cI/abR65yyCsRfy+mBVKMhWqTR2iMvAxe1xmsHI5Bm3s231UW9Eg0PdGfeUV6bgSLpmZNhAIEz/MkfrmpcAcpoCPRaKv2aw0yeOYV5rS5LZFdOWW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2lWhRds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2lWhRds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DE8C4AF09;
	Thu,  3 Jul 2025 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751531094;
	bh=M4Ov1VXaqpydoTJijiZAO+F7mcgehJ0Rtm+hmVqdK1M=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Y2lWhRdsOmzLuubH2Eiq282ZlYPt0wt+WSwNPrzub6usYaUenhIMkygqY4YoFbg9X
	 BFYhnkQXaNBcdccW9WsRVRiXHMBHM3KYJIbDDEa0r7mHWYUx2XGwB0sY0RkuJS3p0Q
	 C41kycAt3NnQncbDNjulhtyWPmqanjaVrhq426mJLEMd5XGPI44LVg2x2nJCaNzntM
	 j3D6eXS9NoiZL7AhO4v1w0TtalxtagC+hNwNn1lFXDhz0yuLMgF3v0ofVLzL/87O4m
	 se2s7NNdfOzfCjBDSZH5qsZPESZIwKXHbWXIaK9npH3FvigVfUgUSSnJn6ov8POEUF
	 YpBx7wqvjgt7Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 10:24:50 +0200
Message-Id: <DB29YAYDK6YW.1NF5I2WSI1BPR@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v5 0/2] rust: revocable: documentation and refactorings
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
In-Reply-To: <20250626165927.66498-1-marcelomoreira1905@gmail.com>

On Thu Jun 26, 2025 at 6:59 PM CEST, Marcelo Moreira wrote:
> This patch series brings documentation and refactorings to the `Revocable=
` type.
>
> Changes include:
> - Clarifying the write invariant and updating associated safety comments =
for `Revocable<T>`.
> - Splitting the internal `revoke_internal` function into two distinct, ex=
plicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_nos=
ync()` (unsafe, without RCU synchronization), now returning `bool` to indic=
ate revocation status.

Could you wrap your text to a more readable column? Thanks!

>
> Marcelo Moreira (2):
>   rust: revocable: Refactor revocation mechanism to remove generic
>     revoke_internal
>   rust: revocable: Clarify write invariant and update safety comments
>
> Changelog
> ---------
>
> Changes since v4:
> - Rebased the series onto the latest `rfl/rust-next` to integrate recent =
changes, specifically the `bool` return for `revoke()` and `revoke_nosync()=
`.
> - Dropped the "rust: revocable: simplify RevocableGuard for internal safe=
ty" patch, as the approach of using a direct reference (`&'a T`) for `Revoc=
ableGuard` was found to be unsound due to Rust's aliasing rules and LLVM's =
`dereferencable` attribute guarantees, which require references to remain v=
alid for the entire function call duration, even if the internal RCU guard =
is dropped earlier.
> - Refined the `PinnedDrop::drop` `SAFETY` comment based on Benno Lossin's=
 and Miguel Ojeda's feedback, adopting a more concise and standard Kernel-s=
tyle bullet point format.
> - Corrected a duplicated line in the commit message of the second patch.

Now since we had to drop the `RevocableGuard` change, its safety
invariant & comment in `deref` is insufficient. It shouldn't have the
invariant that the rcu lock is held (since it owns an `rcu::Guard`, that
already is guaranteed), but instead it should require that the
`data_ref` pointer is valid. That invariant is then used by the safety
comment in `deref` to justify dereferencing the pointer.

Also, I think it's better to reorder the patches again (since the
current first one relies on changes from the second one), the first one
should be the change to the invariants section of `Revocable` (so
currently the second patch). Then the second and third patches can be
the removal of `revoke_internal` and the `RevocableGuard` safety
documentation fix.

---
Cheers,
Benno

> Link to v4: https://lore.kernel.org/rust-for-linux/DAOMIWBZXFO9.U353H8NWT=
LC5@kernel.org/T/#u
>
> Changes since v3:
> - Refined the wording of the `Revocable<T>` invariants to be more precise=
 about read and write validity conditions, specifically including RCU read-=
side lock acquisition timing for reads and RCU grace period for writes.
> - Simplified the `try_access_with_guard` safety comment for better concis=
eness.
> - Refactored `RevocableGuard` to use `&'a T` instead of `*const T`, remov=
ing its internal invariants and `unsafe` blocks.
> - Simplified `Revocable::try_access` to leverage `try_access_with_guard` =
and `map`.
> - Split `revoke_internal` into `revoke()` and `revoke_nosync()` functions=
, making synchronization behavior explicit.
> - Link to v3: https://lore.kernel.org/rust-for-linux/DAOMIWBZXFO9.U353H8N=
WTLC5@kernel.org/T/#u
>
> Changes in v2:
> - Refined the wording of the invariants in `Revocable<T>` to be more dire=
ct and address feedback regarding the phrase 'must occur'.
> - Added '// INVARIANT:' comments in `try_access` and `try_access_with_gua=
rd` as suggested by reviewers.
> - Added the missing invariant for `RevocableGuard<'_, T>` regarding the v=
alidity of `data_ref`.
> - Updated the safety comment in the `Deref` implementation of `RevocableG=
uard` to refer to the new invariant.
> - Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1Mmseaa=
mNYhj9VY8AXtJ0AOcYd9qcn=3D5wPE4eA@mail.gmail.com/T/#t
>
>  rust/kernel/revocable.rs | 68 +++++++++++++++++++++-------------------
>  1 file changed, 36 insertions(+), 32 deletions(-)
>
> base-commit: 0303584766b7bdb6564c7e8f13e0b59b6ef44984

