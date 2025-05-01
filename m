Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DBA125D6;
	Thu,  1 May 2025 16:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746117534; cv=none; b=n2Sp/5bmoZ3LQ9L1JKzkH7e4J8vvZYBK9MAIMiNcDjlonpFP0dCHHnG7ghjFCNTOtExiBf1uU+b975gntp0cn6rcm/Pkz8HplNuGnTil0E0nB2oKnVBWJbc9Aau70UyKE3a9G2U9N7aqds+jPl9+CUmLSBtgt3uKF68G52midiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746117534; c=relaxed/simple;
	bh=VpS3Cs/1qJceLkOsR+8zrrFDNlIUcwis3jLCfRjmg4Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GwL43Wosw47khPx6YHS4Kedq5pxvDTFtBBuAR1DcvJfkJZsE4MkEpeqTP2koijMmWA0kP1vfnZ2akdM+2Nx5ev9Y0xYJCeoE68rYplAL78OehdQDXamQm26mYOHz/bVRjP7TeXmDXCc1Fb1wpnL+5U26RSrmDc7PUYjCexeh7+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJb8F7tc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJb8F7tc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5634C4CEE3;
	Thu,  1 May 2025 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746117532;
	bh=VpS3Cs/1qJceLkOsR+8zrrFDNlIUcwis3jLCfRjmg4Q=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=FJb8F7tc4ubVLX+DEwYcySXhs8k3NodYmKAD7kgG4O0T2scLsEyHxu6HhHbkjgDKL
	 BxUbhRs1mNhI9U2TPasuXi1E2ZkDzQN0q4xjUsh9SkfkiB0x6I8Ocubplnv4YIXAiH
	 LCooB4/IDnawfOzyJ8wV2WI3g88wXlbGelTxGUg/eKM4P/HcvZYjvbbBhjtgcMkN9M
	 sZdDMVBhbPUcme7aqJc5luHKGfGn7fs8LM0202VOPvvvPAbgP73MNAbxiAtAd4M7ro
	 w0Tb6kTj4fvdjkiYATG6dSt6gzNqn23aSJpc4dZHFP/F34gT/py3p1JEBzUufjMmgt
	 6lIfZ9A/Ezj5w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 May 2025 18:38:47 +0200
Message-Id: <D9KZ066GO2JV.11GV4HKA3BTFD@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: pin-init: fix typos
From: "Benno Lossin" <lossin@kernel.org>
To: "Benno Lossin" <benno.lossin@proton.me>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250426083901.13289-1-benno.lossin@proton.me>
In-Reply-To: <20250426083901.13289-1-benno.lossin@proton.me>

On Sat Apr 26, 2025 at 10:39 AM CEST, Benno Lossin wrote:
> Correct two typos in the `Wrapper::pin_init` documentation.
>
> Link: https://github.com/Rust-for-Linux/pin-init/pull/48/commits/fd0bf5e2=
44b685188dc642fc4a0bd3f042468fdb
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Applied both to pin-init-next -- thanks everyone!

---
Cheers,
Benno
