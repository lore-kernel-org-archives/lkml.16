Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C88E2AC17;
	Mon, 19 May 2025 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655683; cv=none; b=ozOy1c+PhBac0pmW52kW889Nv0KUz6N8ZgL/m+SVqB3WUoQZURw9POlO4uXArD427QpwHzTGmgGmsS7SF2DP2MP4Tvmxduu7MaRjjeTeHdj+7MNVxZcLnKYZOLE1YQ4zmiuC1nB1tUJegDQ7dp8TjFsv2hwq0VKj5Ss63ese4Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655683; c=relaxed/simple;
	bh=q0IaF6UsrxyRjjnf7tFg8zeXdfpGE28jKiTqv/WTi+Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oPZLepG/ht63U7/FNOB9Zpel9wmJxfkUdgfqaEPI1CmVAXQNA5dscNV9Vn9YEGuYi80/+coFvgNXSz2xLM35RxXVuedG1YXq7SrW7XAezgMma2GenV/BzThDV1MHZaHPo0VbalE/ou4KqVYOkqpyuLpnYzo+FzLbmLkOaeWVCQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaG6FFLC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaG6FFLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC11C4CEE9;
	Mon, 19 May 2025 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747655682;
	bh=q0IaF6UsrxyRjjnf7tFg8zeXdfpGE28jKiTqv/WTi+Y=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=JaG6FFLCAcEmET7AU8BuWu/dAZTev/cwwZNejhQL7FDl+WVP7K+Zu4nzv/6WI5xrJ
	 iNUMtFrEj6L04IAwmRfYvo6Ag1NxILXAAZ4AcJVP6HZvDEGzd+o/xf//u/JLhwgv/o
	 ykTVFwKkL5POE3BaOFr+ODc/HDpdKmp3SeMt+swNahgzTp/hOuoPxea7N3gZpNGCai
	 dDuVTcxGKNT333QcBP/XR8uU05REFrl/d2mYEfqKNrrxhMyTpQkI221SRaL2/3l6Sx
	 9dCum3nWkf4afPdKFT9UtO/aDbEyRuK/4vJo/i5L4/SfNUielFdRSK5rfVP4sJa924
	 h1xUFeM48cz5w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 13:54:37 +0200
Message-Id: <DA048ETXB1Q1.3KVZ2FHENWKDL@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <498AB71C-58EF-487E-8D9B-C7C113862948@collabora.com>
 <D9ZQUUA4FLXD.19MJI9HD48EMZ@nvidia.com>
 <8517D6F0-C1A2-4E38-8E62-57DCCD5E58D4@collabora.com>
In-Reply-To: <8517D6F0-C1A2-4E38-8E62-57DCCD5E58D4@collabora.com>

On Mon May 19, 2025 at 12:52 PM CEST, Daniel Almeida wrote:
>> I just mean the cases where users will want to enable and disable the
>> regulator more frequently than just enabling it at probe time.
>
> This is already possible through kernel::types::Either.=20
>
> i.e.: the current design - or the proposed typestate one - can already sw=
itch
> back and forth between Regulator and EnabledRegulator. Using Either makes=
 it
> just work, because you can change the variant at runtime without hassle. =
This
> lets you consume self in an ergonomic way.

Have you tried to write such a use-case using `Either`? My personal
experience with `Either` was pretty horrible, since you always have to
match on it before you can do anything to the values. It's not really
ergonomic.

I think we should remove it, as it also doesn't have any users at the
moment. Anyone that needs it should define a custom enum for their
use-case.

And effectively an `Either<Regulator, EnabledRegulator>` is just a
`Regulator<Switch>` in Alexandre's proposal if I understood it
correctly.

> By the way, the reason I'm pushing back slightly here is because you seem
> (IIUC) to be trying to reintroduce the pattern we had to move away from i=
n v1.
>
> i.e.: we explicitly had to move away from trying to match enables and dis=
ables
> in Rust, because it was hard to get this right.
>
> The current design is a simplification that apparently works, because at =
best
> you have +1 on the count and that is encoded in the type itself, so there=
 is
> nothing to actually "track" or "balance" within a given instance. Multipl=
e
> calls to _get() or _enable() on the same instance are simply forbidden.
>
> Can you add some pseudocode that shows how this doesn't work (or is other=
wise
> unergonomic) in Nova? I think it will make your point clearer.

+1 on actual code examples :)

---
Cheers,
Benno
