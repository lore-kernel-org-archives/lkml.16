Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51267248F75;
	Tue, 20 May 2025 19:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770457; cv=none; b=OKHvqTNvCSS9CsPvg9fpIwIJVD4jfdlBS7FOjHllZ1k7nf0LFRkD81y98xW+hSsAqThgXwWaA8pLhxDFO2xmMY+ZFeG2VshrCVzWtczHeURXUAxIlUbExAnPbdQ+WGvOeMqD+/58FpHzlFASGkutVDb1PoKPC48vOiuGNIP6FQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770457; c=relaxed/simple;
	bh=u2+2B1TFmtIoF/6ikIJcbwKUmQWnJz7ZnbvYpWBY0E8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=G31Pf/ZlELselHRqteD0VHJjmWkny9pIDyrNz1VeeO66BWVP1CSuJkW8+vyxPAc6PNiWVsZQvF9NZxGikVPUPSb4rEl1vxl/UH46xCwFReA4CV3lptzC3s4HNj+uZDBjkXZgLCOwQDERyzBWwtJiMtcPWJ9epcvDuRSYGxeR2vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXDCZAPi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXDCZAPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2981CC4CEE9;
	Tue, 20 May 2025 19:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747770456;
	bh=u2+2B1TFmtIoF/6ikIJcbwKUmQWnJz7ZnbvYpWBY0E8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=pXDCZAPiXWb9rL7+2RbtiqllPoL7sI4WJDCSiKV6sf5vRC4KcK2gsv9JcLekV+aNH
	 Wttsbq5H0WLq/KHu4bfB2SqnpSBVPj5wDbfazlmxHHtWsw4nOimTypQDDMj1xCgPPc
	 /pnZOU/KoZYW/4DRWJOslTANSMeCzCTgUKfI8otMx3TX3QSIasd/zVDOCDLaTK7cvK
	 SzMVcbCLRm7H7/creNstQAXAHkobNCeQMxz2mh+UCPA0BKXwmRN/8nU8sZIjFURMUh
	 UmdOwCmVlDV3dkjGadzOF695dHndEZ6MMWSxNA3hD8VC31cDHLcCYHNC9FjSr0fSTl
	 gBxD17956Q/IA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 May 2025 21:47:32 +0200
Message-Id: <DA18X1G7DRJE.1UENBX2ASM6Z9@kernel.org>
Cc: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: add `pin-init` as a dependency to `bindings`
 and `uapi`
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250520192307.259142-1-lossin@kernel.org>
In-Reply-To: <20250520192307.259142-1-lossin@kernel.org>

On Tue May 20, 2025 at 9:23 PM CEST, Benno Lossin wrote:
> This allows `bindings` and `uapi` to implement `Zeroable` and use other
> items from pin-init.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

I also forgot to add this:

Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topi=
c/Zeroable.20trait.20for.20C.20structs/near/510264158

Will add it with the new version that also fixes rust-analyzer.

---
Cheers,
Benno
