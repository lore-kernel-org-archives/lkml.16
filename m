Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B1D2FEE2A;
	Thu,  3 Jul 2025 19:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751572549; cv=none; b=gg7d63tV8bxDuMzRwtXaQP6NBehDX1m1SCQLdo2ERzfAv6OCN5GARqON0AHES+O0vGAARcWz6UjqZQZvh9/B5g53Ae4NfzVamv0wL91ZsPwt/VkijknXVmOVRxGmw/fgzyPV9rX8bfabd0AVeKnW9Z0Wvs0CrdfSAoW9qbfljv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751572549; c=relaxed/simple;
	bh=z6ZuFPFQCILhwVyx9iU+iK6Y5gFTaCZgVh9XLzBiyLw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UqlzGBipQGrXOFEaWQBTqgXlkLY/09/l2ed2nU9Jxr4n1J7dSmwHZGMnzh3TjSCRsAhMI+oBuKRvPECcuxsu7Wagxkf1e/OTAIhy40vU5GGRMK8z/iFaDWQTy0QR7aMMkqwxzeHb3N834sf7cIwIo4LHT4vHhAqHfk9gXsGRdrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTHF2138; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTHF2138"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903B9C4CEEB;
	Thu,  3 Jul 2025 19:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751572549;
	bh=z6ZuFPFQCILhwVyx9iU+iK6Y5gFTaCZgVh9XLzBiyLw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nTHF2138OKFv1OkMcPY2aBCfmub1J6Rm9Y3uoFJUAckQ5DoX6+YtCv6h5w0lb+NrF
	 mZidcwHDmy3t5h5Ui4b4YMhoZg3rSGlGjAwE2AHstlS7289H9I+EFx102QZwXqZqAz
	 kIB5FjRITRqTc2XT++wHNP1TKghjZxztfk1NZX5lLQM+3koH5Sl80vNz19Ps3bK+W4
	 sScpdrbE9EM6/7XBGUfCZIopgerTNDTf2Ig1SlLkkX18AEpe3d8qein3ZtKU9X6im0
	 wvsDlVE2r1ytduNxJclJ6jKmDJLlyOgahmKzTJCLp+qLeejuFYT7IGvEMOvZFfWvtH
	 +oioGNeeQmVew==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 21:55:44 +0200
Message-Id: <DB2ONAGQF92H.1ARBZW47KMVV8@kernel.org>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <acourbot@nvidia.com>, <joelagnelf@nvidia.com>, <wedsonaf@gmail.com>
Subject: Re: [PATCH] rust: fix outdated safety note in
 `Revocable::revoke_internal`
From: "Benno Lossin" <lossin@kernel.org>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250703172605.28891-1-work@onurozkan.dev>
In-Reply-To: <20250703172605.28891-1-work@onurozkan.dev>

Something went wrong with your TO addresses, merging Alex's and
Boqun's...

On Thu Jul 3, 2025 at 7:26 PM CEST, Onur =C3=96zkan wrote:
> The code used to use `compare_exchange` in the initial version
> but it was changed to `swap` after a reviewer suggestion (see [1]),
> and then the safety comment was not updated and became incorrect.
>
> Link: https://lore.kernel.org/all/20241211104742.533392-1-benoit@dugarrea=
u.fr [1]
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/revocable.rs | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 06a3cdfce344..5c0b7afa76fb 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -163,8 +163,10 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) -=
> bool {
>                  unsafe { bindings::synchronize_rcu() };
>              }
> =20
> -            // SAFETY: We know `self.data` is valid because only one CPU=
 can succeed the
> -            // `compare_exchange` above that takes `is_available` from `=
true` to `false`.
> +            // SAFETY: We just used an atomic `swap` to check if the dat=
a was still marked
> +            // as available. If it returns `true`, that means we are the=
 first (and only)
> +            // thread to see it as available and mark it as unavailable.=
 So no other thread
> +            // can access or drop the data after this. That makes it saf=
e to drop the data here.

I think this is already addressed by this series:

    https://lore.kernel.org/all/20250626165927.66498-1-marcelomoreira1905@g=
mail.com

---
Cheers,
Benno

>              unsafe { drop_in_place(self.data.get()) };
>          }
> =20

