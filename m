Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F7DAD5E;
	Sun, 22 Jun 2025 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750579982; cv=none; b=rK39yW/TBN6GQtHTUSj05rP5oD7BKsjWIEoIXwOUYvfpZIUIXHrv9+UFm3y2oBHw9lwZnmNX2QR+ybnJ8R2d1lMNVjtdR9Vz8Ex04zwy52Lh/ZNSmRyQjJvTluRygNopUFEmpoLD7UHjhAZQTZ58LEYj8RegvDoAObePDu2znwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750579982; c=relaxed/simple;
	bh=kc6wH0RNf7tU2y9ol86aPp+PBkD6sFsqEFyyCBTJBME=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FyNihuvO6AuCYmRSdUyNXxzimll7H/ND3QaFVFXi7Rp0mJVlWrBcjo7b043357Vj+suBK+fAF7ZUh3AZzK83PobBreVrrVGXxTqBnX+TQdZjTe99qQ2TN0+RzgfropckAcr2mEI1xvsYblKCqOgRsLpXo1C0huO5iwWd8wDzaQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEFuntfM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEFuntfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF98C4CEE3;
	Sun, 22 Jun 2025 08:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750579981;
	bh=kc6wH0RNf7tU2y9ol86aPp+PBkD6sFsqEFyyCBTJBME=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=eEFuntfMo6sPPQRtKqulNwC9lXTb19CPQ250nyQ/u9inIckkj5r1odEPWxEfvEe7G
	 OBl+EIMXRszWfVeYwlgFIV1fwsxK04RVp6G2HSD+hEREcE2tnPufY+8o7VMpetoxY6
	 uGaTxRTni7YAZ0RFlsZnvTmj6n1EJTPp0IiQ0uwHvaGn+XEbtMyG9CND/2zWpUVCGt
	 w6is6jCyuY7d+/CqSeKxL3Ug9cPwVYrh0A6knNoChaXkOU8aDN+VBquzC0cX+LAJx3
	 +w9lyG6AmPqEdinzJCRtjCJCVWTDSMo8YOFzaoKEsP1SWlXe+20OtVA6wwuHHxd5rz
	 1I1kwhxulP4dQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 10:12:57 +0200
Message-Id: <DASWT7I119AY.1B0E7SCZYCZI3@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] rust: num: add the `last_set_bit` operation
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-2-7ec3d3fb06c9@nvidia.com>
In-Reply-To: <20250620-num-v1-2-7ec3d3fb06c9@nvidia.com>

On Fri Jun 20, 2025 at 3:14 PM CEST, Alexandre Courbot wrote:
> Add an equivalent to the `fls` (Find Last Set bit) C function to Rust
> unsigned types.
>
> It is to be first used by the nova-core driver.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/num.rs | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
