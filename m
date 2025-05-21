Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCB412E5B;
	Wed, 21 May 2025 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812428; cv=none; b=gJ8P0/fKHKL64Hj0x4XmGxLiFA4gQOWClA1eSQzQWRgSDy6Z8ypeIU0WQ/v4mI1cNiXbnmwbRuMca6kyfdFxtSkzbhNYaaddYQ+5eFJAypMEDPKcGoaaum1OjiMi0iuKiXrZovbvrwDoq0nAa24Bc1PtwjwDd+B2F6ko+YUW1pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812428; c=relaxed/simple;
	bh=Z/318zCr0hBm/sCk+CgpYwAIF2tZRP6Fx+5l5YhUgLQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eV1EJ1BMukgZVgRkgkN/z/hYkH5LsFYfMSGWYsaMbzwvBO0Htnz4ZrXirpAwhQtUac3AC7NtPclAnK4iBMOHUul936rAcabMyFV7QTPIWfEVZL9AktwRPmoZbM1OAM1X/8znFEL5duGgnDoGv8cT4xnFYEZcyR3uqrfmFpBFAOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtvoSbzA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtvoSbzA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED97C4CEE4;
	Wed, 21 May 2025 07:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747812428;
	bh=Z/318zCr0hBm/sCk+CgpYwAIF2tZRP6Fx+5l5YhUgLQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=FtvoSbzAvMnMEAeMDonY0vRno+M7+kxRI+1W4MeP8ewVnBTuuM+d31ZBS4EutLE8g
	 Orai1mKNIV93jG9yybwvH2pLXYY96JuPUmbnE1cQ7lln5A8C1mZZRC2gnthPRpoxVD
	 xaRevxEPaR4SgeiiijruOPdBJjnAn2D6ZuYeT8cYRfjgIhOv9x7R/RXnbaQqWpSXks
	 SlWbdWFtIwVizX3m6/MJdmbhpm4gCvUvAByacsDoP/+QD/dVBcwgRpHgRqi6c0aHXF
	 MtaLtTvyCL2Zpohjf0DZ0FW0Rmg5TlqxmgojUjxcGiwshepox65UcpMOWuQAL5c0cl
	 T5qj2gjOB8ucQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 May 2025 09:27:01 +0200
Message-Id: <DA1NSLSN2Y04.230YTWZIPO0FR@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 02/20] rust: make ETIMEDOUT error available
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-2-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-2-05dfd4f39479@nvidia.com>

On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
> We will use this error in the nova-core driver.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/error.rs | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
