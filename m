Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A811367;
	Sun,  8 Jun 2025 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749368480; cv=none; b=afLDjjGToBearoiZqQc4e54JRC3+R8jx2jVIRCy27tNhBTAWT8tYP2loPQvkKMTwDhg+4eGBpbqTcW+fvYWYqwumx9ykZJMYNRY/ZWUDzUswOmMu81ttCjiMsdOkhQzhMLzZ8TSRDCYIjBpEFPNp3Cc5y/2bGj0/vp4ke2pkB3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749368480; c=relaxed/simple;
	bh=Ae/Eq0mvumW6wbNzTIN5amb/zidt0s9bSkgBMomJ9fc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=scDP3AIok83Yv0gsmcHV3VbybgYjxLaT2iUc4B1H7+8uQpZaRk5bbFV/u5xyZv0Ax4jDk/t6i/m9aMqSrOXd/OOwdhM+Ph3OAeTRxkuhFyJTxRdJ8pV5pGrQoEUMdO2N0QrOVhYj6gE3V57BxtfcxIqLTlmn7yYvFhHVSVfj0Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFrXyjgh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFrXyjgh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4995C4CEEF;
	Sun,  8 Jun 2025 07:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749368480;
	bh=Ae/Eq0mvumW6wbNzTIN5amb/zidt0s9bSkgBMomJ9fc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=dFrXyjghQ8Gq3gCZBdUIL1+0FoPdUQU0/OwG5RMjMlths9AEONwAwKSa00Y4Ok9lr
	 RXdjvV0u8mw57ddmOWl0iNBTD9hwPqQu56ZMTSudSP68NhF9qot9ncC0zLhOEVJX0a
	 4qDpdz0JLvGDQ7XjP4KdRgSjaen6HBF6H8RtxWqJVadjfdmDEn7fTlTCN2F4NRiVtY
	 Pv9wgT0u2a9rTl0NrLEBmRdxTVHadzxAd5DrKOtWO7qWy3n9MFayjiaEgwY7PQYbpn
	 raQCU0pReC2s+8ZndaNQQuimTD8jqAq18LSOsUAXZx5/rLS+NWguhvQptX3O92e99l
	 j/jjbGPmnoPFw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Jun 2025 09:41:15 +0200
Message-Id: <DAGZDB274O7S.1WW1Y530WRYVY@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add `assert_sync` function
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250607-assert_sync-v1-1-b18261da83e2@gmail.com>
 <DAGEZCRR61A0.30H1MJQXW4CV5@kernel.org>
 <2531463d-fa6e-430c-a3a6-b179654cfbbe@gmail.com>
 <DAGI57J7WBD0.2BOT553TRIXH8@kernel.org>
 <407f04ff-b313-4629-bbdd-f25df14f44da@gmail.com>
 <DAGNOQOY3B3X.MQD616P04I3U@kernel.org>
 <eba1cfdd-3756-4f8e-a2b2-e15b8b8b4a18@gmail.com>
In-Reply-To: <eba1cfdd-3756-4f8e-a2b2-e15b8b8b4a18@gmail.com>

On Sun Jun 8, 2025 at 1:38 AM CEST, Christian Schrefl wrote:
> I don't see any point in paying the compile time hit for a proc macro.
>
> The Error is not that bad, just a bit worse. I just don't really see the
> point since this is only really need for marker traits and realistically
> only for `Send` and `Sync`. Also the macro would create a function
> definition for every invocation which would be a (very) small compile tim=
e
> hit. So I think that we should just add the `Send` and `Sync` functions f=
or
> now and reconsider changing to a macro once/if more than these two is
> actually needed.=20

Sounds good.

---
Cheers,
Benno
