Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CAC293744;
	Thu, 15 May 2025 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299055; cv=none; b=es7wuTZ9N8GTzk/cwFr6U2cBgvFDL6/NtM9znq9pbw1RQmOXXG9Hk83ntag8FCGs9xTiDHT6bcnTNgcuNNyp7ucg0hTEpjvlOFeoAZyIk7xE7xKfYEg41GrqsgOsFu2kg0C1bkQbPgA5PWPgNEAPvw4mvnvwi3d/VVQKGs0hux4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299055; c=relaxed/simple;
	bh=OD8uQNJihkgCAC/Q6mW+TSj84arnClVm29wWN6+wils=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=m9VmCO9kP76x9dfJirtKRmSci2xYigluBAchIM01uxn6cgjhj6VKl95QCzISOHR77fmRo+FkFtv5uonZElFbAMLDh1Y5bl+oRQU3QNhSRZwXJcs/MX/hH9MxgwgoDuaK2HOKBmLz3djcngO+gvUY4YKahUothphgBCItQkxHJyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpJqWS4Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpJqWS4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F4CC4CEF0;
	Thu, 15 May 2025 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299054;
	bh=OD8uQNJihkgCAC/Q6mW+TSj84arnClVm29wWN6+wils=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpJqWS4QfUFtBCb8r1pWEhFUVu1OeYZqd+oN6noAP1tCtN+TsOzIrUEFAPSsxoQtG
	 aUk/tkCJ+6KtnYw/qIYifx5+DoPuhANQLj3I3esNHGNjOmujDkIs54i5OVrqReQ65w
	 gBZh5NR0R1ZnuKnGOf65q0aFKm9FltPpV2W4/duoEJ1jGx+Mtn6kuGWDwt5Ob02r+g
	 c9c4d2vSmubGJ4WVKrI20DC8c+diRgCUuGwok+MndjxAIc/vv31XEZ/8QHA9HfQwF7
	 RA2nVFiOZsORsjyi1i/KsQzcSYTugQc5h+v4TEDOHAYAeSODXkcLlMa5yBa5ReaR5B
	 1jzotkm/1cUHA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 10:50:43 +0200
Message-Id: <D9WLTFASYNN8.CDM0HJKG6RR9@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
X-Mailer: aerc 0.20.1
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org> <aCRdNJ2oq-REBotd@pollux>
 <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
 <CAGSQo00Pj0qF90712K7xACNEvr2e0q=98b8-0VUcXLD5V+oDhg@mail.gmail.com>
In-Reply-To: <CAGSQo00Pj0qF90712K7xACNEvr2e0q=98b8-0VUcXLD5V+oDhg@mail.gmail.com>

On Thu May 15, 2025 at 12:08 AM CEST, Matthew Maurer wrote:
> Yes, this is also an issue when it comes to attaching data to debugfs
> if you look at the WIP patchset [1]. If we do end up deciding to try
> to do self-referential structs for users (I'd rather not, but I
> understand I don't have the deciding vote here), I'd strongly suggest
> considering self_cell [2] as a model instead of ouroboros - there are
> structural UB issues [3] with ouroboros that are unlikely to be
> resolved, and the author of ouroboros encourages use of self_cell
> instead [4]

I do not think we should add something that allows us to have
self-referential structs. I only mentioned ouroboros, because in theory
it's possible to do in Rust, but we shouldn't do it.

---
Cheers,
Benno

> [1]: https://lore.kernel.org/all/20250506-debugfs-rust-attach-v2-0-c6f88b=
e3890a@google.com/
> [2]: https://docs.rs/self_cell/latest/self_cell/
> [3]: https://github.com/rust-lang/miri/issues/2844#issuecomment-151057794=
3
> [4]: https://github.com/someguynamedjosh/ouroboros/issues/88
