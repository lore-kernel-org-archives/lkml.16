Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C428B288502;
	Mon,  7 Jul 2025 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888837; cv=none; b=EW4YX495dqEcYBcMtHju1GiMpK7gQD9ZATZJDeIeUCYxPU4uh13nTJGGGQMje3GuZtHCimGxhavcULgRB4Muw01Ig82LlyGLCQYhyZ3ZePLLp66fEiBAxitluLgzqvwHtctlxcl6im0wNEPxFkgei3dzUUPOScA7qEGV8nYRKjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888837; c=relaxed/simple;
	bh=bgmRsHFXr3fo3AGaLI1p8hckikEtVGcRSofBWPQefFo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Ybp5EIe85f2wuCby1s1jJrKTMUFJ889vhsZ1P9UWf6QvU8ZfTLfcjlzwro4eMmxrF3b/TItBCmkcDux7+N8e0wUkE8SX7vHTGwB8ZofkEBj4G8FV5c+rvVhdZnhsetPPOrtaBBrPgXg+IYF2FAtlfw51Y0mdDTqM2qs8hK+bPIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZ4jQQrw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZ4jQQrw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097C1C4CEE3;
	Mon,  7 Jul 2025 11:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751888835;
	bh=bgmRsHFXr3fo3AGaLI1p8hckikEtVGcRSofBWPQefFo=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=EZ4jQQrwmKLeb8V4cNw+W3x8rgGj8hzjRNvpF2z6Hh0PASWz8W2RUVWADANB5nuYx
	 e9tWDt1sGeomZyzdRn6jCe3jIPfdCDBaeci9B3gZjLZmoELJBnl3gAFmcIKD37fZlv
	 ga4ArZwczuWtehv4j1MOIMVpM6yzcu29BdFIa4bCSy/u/pJBB4gAtySaZZCMZ8tMjl
	 D3pZsXHcXDSP06gXVqytx6WUYe8cvG+Ry1tqVGIfntLuBpaoBIPfp895JvEBr18/Yj
	 cNNeVn7WBM21aLf9ZioPzpkaMGZkakJ/t4hZR2PB3FkLS8qxIrDtihY1olu1VIe83f
	 RKlb1t49XRLiw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 13:47:10 +0200
Message-Id: <DB5SRE5S7AR3.QUF369W9JYGJ@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
Cc: "Oliver Mangold" <oliver.mangold@pm.me>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Asahi Lina"
 <lina+kernel@asahilina.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 4/4] rust: Add `OwnableRefCounted`
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
 <20250618-unique-ref-v11-4-49eadcdc0aa6@pm.me>
 <DB1LPFAX66WG.1QL5JDCWI7RN4@kernel.org> <aGuAR7JCrlmzQrx4@mango>
 <gFz7glX0UIHGffQdm4_vD_XkT5GZEKB0Lx0cd8-TCR8glMzIIY7VBIvppFVr2RURNBnGx9lKJqrE5av7xSUcbA==@protonmail.internalid> <DB5PX74OB3DX.1UNT8MIBWNC2G@kernel.org> <87bjpwqmo5.fsf@kernel.org>
In-Reply-To: <87bjpwqmo5.fsf@kernel.org>

On Mon Jul 7, 2025 at 1:12 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> Ah right, I forgot about this. What was the refcount characteristics of
>> this again?
>>
>> *  1 =3D in flight, owned by C
>> *  2 =3D in flight, owned by Rust
>> * >2 =3D in flight, owned by Rust + additional references used by Rust
>>        code
>>
>> Correct? Maybe @Andreas can check.
>
> We have been a bit back and forth on this. This is how we would like it
> going forward:
>
>
> /// There are three states for a request that the Rust bindings care abou=
t:
> ///
> /// - 0: The request is owned by C block layer or is uniquely referenced =
(by [`Owned<_>`]).
> /// - 1: The request is owned by Rust abstractions but is not referenced.
> /// - 2+: There is one or more [`ARef`] instances referencing the request=
.

Huh, now I'm more confused... Could you go into the details again?

---
Cheers,
Benno
