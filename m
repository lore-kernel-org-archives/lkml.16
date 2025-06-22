Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F148E1F16B;
	Sun, 22 Jun 2025 20:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750623940; cv=none; b=XIu1bk82czgSljOx+BOvA36FURGMYaa5BTWumcJ8h5dzhnK56IYxOD3mkhFV1Ox7mjmKM+i0uYULJc9ZmNWEtDNa+cXcCUtEpHmoHOEVgUoZL5ct/Vg4vKj2Kk2TS2Dw88espqaTz678nxwN3A6PD5GzXSQn6mxAMqzRkhnG53Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750623940; c=relaxed/simple;
	bh=ChqRRJvpwb+owjWYHrhM3QroseSbV8vG0lDY128JyuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjeYH9iwXAXSVWhqFkiSVxocgxJXgpbqvWPs8cYIu2OeB5iqbX2Ws49ZG1RM0toWoWDcTyha9R26uiwbVHmCYtLa8k8Fns01HkckjAiV30logTO9AXQMsFGtGWPkjUcB4AB0/v9k3qshsETKgWqEKGimvn2NEsLhqp1EiB41glI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7zh8t1j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7zh8t1j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4234C4CEE3;
	Sun, 22 Jun 2025 20:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750623938;
	bh=ChqRRJvpwb+owjWYHrhM3QroseSbV8vG0lDY128JyuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W7zh8t1jL6g/VGLeYXCkQ9pJkGn7i/J8MZGDQv0GvRCqkcE/AQwovp7HqG7X5868u
	 3CGfgzE9sjKYOfzHTsZAVWt21gi4VU1shc0ANySsqawjmPaCpTxTFMBzTX/Cgbe1Zv
	 1361yim5LALFEGleyJinwz4mRDtqNoFq/x+WTqQAgT1Zw3/r5Tw/b1g3nEArt9kxOi
	 OxoCOpcG5t4gHkbHKRjx3G77bAoHGiki/HLDR0O7ckVJimZBlt0Qvujw6xqbm75dYE
	 xt3HXHVCMqxgJCC0Lii1OWnSYd3hRXnu5JfxRmTlcRv8s78x5XhnJmn+AAljRPKQc9
	 omZZ71GcGMCDg==
Date: Sun, 22 Jun 2025 22:25:32 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] rust: devres: implement register_foreign_release()
Message-ID: <aFhmvAmyYzM6AYf7@pollux>
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-5-dakr@kernel.org>
 <DASVTOJU2OE8.GU1NH3MZ3SX@kernel.org>
 <aFf7QVhqE6dhp0m2@pollux>
 <DATC5A2JBHZQ.33AFQQP6V6L1A@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DATC5A2JBHZQ.33AFQQP6V6L1A@kernel.org>

On Sun, Jun 22, 2025 at 10:14:00PM +0200, Benno Lossin wrote:
> I don't understand? When `P` is set to `Box<T>` in the
> `register_foreign_release` below, then `P::Borrow<'_> == &'_ T` and the
> bound of `&T: Release` is not satisfied.

Yeah, you're right, we have to add `&T` too.
