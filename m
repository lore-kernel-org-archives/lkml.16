Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8902CA6;
	Sun, 18 May 2025 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747577175; cv=none; b=CVjqcv0D6ODIUs2LRM2076HxcT7+g4pw7iQjibnM5/+bPG9rqXXFiGSrDe2dqYYGDpzCFX4c4N2TryT1XAN+obUbvt+W/0olXIFMYezcULBTJ4aTJdDfzST8ZZQIiEPqMELWhp/zFu1sqvymtS+IzX4vq7ZZ63wAxipcsYCnsrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747577175; c=relaxed/simple;
	bh=Y6RcSOJ3TT05BAGmCI4tHEBMtVlV33BvNPwwrPQrwdw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=A9GlBZNiLhnyW2U2SRAD4FzqVxTvFuns7/PDLe/UxtPbXe6XVQaPU51KOHxcosHCs4dM1/UGk3d75mw0+RCxZqk7kZPRE3RuiKBfouCjc2glj8mLfK2ulDFKW/5k7A2D1F/AsfdBWGDi6P/9ltqguH/p3DDPWTP5ChbmfotmC/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9YUaH1a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9YUaH1a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E860CC4CEE7;
	Sun, 18 May 2025 14:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747577173;
	bh=Y6RcSOJ3TT05BAGmCI4tHEBMtVlV33BvNPwwrPQrwdw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=l9YUaH1aBItBRjrd3dy8XIY25AGKBS/3Bl3FM3z0SWsjUxEombiJX9hvN541fLUu0
	 20h7r58cjtkxSGLdtwHVrokxkuTBmb9/sgbY77YkV0ZWSmQo/b1Fr+XfreKR8x0JSu
	 Ef2HDrvljCi+jFAxmkX6aiXgblZhmSHVeeeXa7MCnq7cpbtnY6fhfuRP+4xaVAgTwJ
	 OaOUZ68UR5eVEyHFmfZVOqA2aIV4Viqz7W7U+al+vAUCBtRCvYFPtiMEGSWBdqSyE1
	 sxJtdI+Y8Y+XsDLRexYI9m9hgXIaSHpv9Xbfk1VCYfyy8uHr1Gtk8guDBgctjxU8to
	 veciyOVhRQI+Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 16:05:42 +0200
Message-Id: <D9ZCE83VYX50.3415QQDCN4R0G@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
 <D9Z59JWL4BTC.3DTN0LWCJX5AZ@nvidia.com>
 <D9Z73XZUSYWO.R0P38ASITWR7@kernel.org>
 <D9Z8PLIZGSJ6.254ICGG44E4PB@nvidia.com>
In-Reply-To: <D9Z8PLIZGSJ6.254ICGG44E4PB@nvidia.com>

On Sun May 18, 2025 at 1:12 PM CEST, Alexandre Courbot wrote:
> On Sun May 18, 2025 at 6:57 PM JST, Benno Lossin wrote:
>> So just let users ensure that they always match each `enable` call with
>> a `disable` call in the `Dynamic` typestate?
>>
>> That is ok, if no memory issues can arise from forgetting to do so,
>> otherwise those functions need to be `unsafe`.
>
> There shouldn't be any, the only side effect would be that the regulator
> stays enabled when it shouldn't.
>
> It's also easy to implement more behaviors using more states. For
> instance, `Dynamic` just proxies the C API. But if we also think it its
> useful to have a regulator which use count is clamped to 0 and 1, you
> could have another state that includes a boolean (instead of being empty
> lke the others) to track whether the regulator is enabled or not, and an
> `enable` method that only calls the C `regulator_enable` if that boolean
> is not already true. That way you remove the need to mirror the calls to
> enable and disable, while only paying the memory overhead for doing so
> when you explicitly state you want this behavior.

Aren't we then duplicating the refcount from the C side?

---
Cheers,
Benno
