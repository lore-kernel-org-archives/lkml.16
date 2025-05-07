Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C53421019C;
	Wed,  7 May 2025 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618028; cv=none; b=I+9yJSGQcvKw5Ut8NMdE6SwWeaYnlTsMUEMoPC+iaRsB7gIVuu0utOa1pyE20wRQCbqCkAQzMzTkr7lHzf7espPyB3ZP3XsQn7tY43ZyuBvPyOv1nBJ7OdXSUehN4GYzzgmEtHBvOnN96iOgOrbl3lEMaskMSyzi7WIbSQLJZVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618028; c=relaxed/simple;
	bh=MVhGmkgKv9f2GOw2ah3i3lQTMchQP2sRt8YrLvIigHI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HzJDY9GebagkZnoQEfQxUWcd6UQF69oSNxS4Zb5pXwoWOunUsYV+Bb5RtsSLbzqBYWkHfYl2TTMhul9RDduGU3Zwu9C6U0hn4437LUxJk6N/yOIBzdk0KEK4NB4mxp1CMEjaa5IPmAH8V3WlU9GKj3itU5fat12gWFUUoFHyuUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqwQKKzc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqwQKKzc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8076C4CEE7;
	Wed,  7 May 2025 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746618028;
	bh=MVhGmkgKv9f2GOw2ah3i3lQTMchQP2sRt8YrLvIigHI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=eqwQKKzc9cMqacHp3OHOgKVo6GuNu7VuaBafS0/74BwuiEu9X+LbEGNmSZiklzVod
	 W1A6az2JoMe1ea5Gm9VdKTvhWrHB395BVoUemo5c0ib0ftbTMltUCZ4k/ejiJLdXTx
	 SSNAhOAFLXd/xcY/0ioVkCYgHLQOahzzMBqhENLiqUo3J1jBCmiyK+xGKSO5trYqxm
	 faOPHbgWqWYCsmTEbVVh8iyJkytZ8ErjJ11uk3x7+kkFgsqPSMd8yaIlOsssD2cAhV
	 O724FkyOn0JeNvvHWVyrNlRIw2yWHAi4rszzSpntM9gvqubvO70M6VX80OchpEt+pY
	 OX2MhWzBbsilg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 13:40:25 +0200
Message-Id: <D9PWEZPNXD2P.39TR3DPNH4J3O@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 5/7] rust: alloc: add Vec::retain
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-5-06d20ad9366f@google.com>
In-Reply-To: <20250502-vec-methods-v5-5-06d20ad9366f@google.com>

On Fri May 2, 2025 at 3:19 PM CEST, Alice Ryhl wrote:
> This adds a common Vec method called `retain` that removes all elements
> that don't match a certain condition. Rust Binder uses it to find all
> processes that match a given pid.
>
> The stdlib retain method takes &T rather than &mut T and has a separate
> retain_mut for the &mut T case. However, this is considered an API
> mistake that can't be fixed now due to backwards compatibility. There's
> no reason for us to repeat that mistake.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc/kvec.rs | 72 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 72 insertions(+)
