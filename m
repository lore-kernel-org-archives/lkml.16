Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211361F4CAE;
	Wed, 18 Jun 2025 19:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750274655; cv=none; b=B3oeph3Iryc/sco2aEmW7yBy9K8TyWKbj4pyQs8tOHwubq7ZC1D8vHtdKU+UnmAbxJGAmZUveqSQWObZVcKTEN7CPI+wkeQt8LHJjNlvNgy2oIf6sNMlAWZWujNS8Q3VieZtxAvnI9dBqrc/8Uyknz8j2ozHNGvesJNTDdVE0Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750274655; c=relaxed/simple;
	bh=0B1AqIh7XaT96Qz7mgiF/9cixkNlDiA1iViFQK2gYs4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aRaOWVuKrB/70EuAwPAqabGSJIriWMJm5pVM/1AXxpBONprGMej8gIiCiBn8iunHFYUotFkEmDtTNIOgWOt5o5DBxwnKH3B0VT6mkf03ia8uIe7xkaDN8n0N72R8qsTdDC78iRtAV+WsC8JNiDOd1FlfvUF/CgSHNldGt4lTL3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnkT9RJz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnkT9RJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE6CC4CEEF;
	Wed, 18 Jun 2025 19:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750274654;
	bh=0B1AqIh7XaT96Qz7mgiF/9cixkNlDiA1iViFQK2gYs4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nnkT9RJza11P1108ZFZQQbR60kDdssVI6SRGhuBkp1onGLyJ+27ShAiQPWjyM5aHN
	 BSIlZVu+gs57RAtjxyWwmB/velvo4q0R6H2FD8eaXQOUIRxEH15bNc0XBi26Dy80P5
	 4vhf5pOHx82Fz37X0MboY5pV68Y/YI3EHj/GBtRujwU/wJ0LEsMEnCmSkzR3RwhoXj
	 Ppa1DhWdv7ro07e5u8zdRyVeFmke3NumBy8EfdRlWnn4wrKXUlNdSNblMStJtEcGwv
	 up3wnPlQp1GqCUy22Pco8yokKs7ThNq4ULn/0ZjWRhOHORk1ZXEPM3rGPMScr0NkRQ
	 8NyIWaYc1K0mw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 21:24:08 +0200
Message-Id: <DAPWKX9V8T26.315LG5OZLLL2M@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
 <DAMHWN6ML8A1.2AUE4UWR58KR2@kernel.org>
 <DANR43CR8X87.1YWHJK7P75TPQ@nvidia.com>
In-Reply-To: <DANR43CR8X87.1YWHJK7P75TPQ@nvidia.com>

On Mon Jun 16, 2025 at 8:41 AM CEST, Alexandre Courbot wrote:
> On Sun Jun 15, 2025 at 4:16 AM JST, Benno Lossin wrote:
>> On Thu Jun 12, 2025 at 4:01 PM CEST, Alexandre Courbot wrote:
>>> +            #[inline(always)]
>>> +            pub const fn [<fls_ $t>](v: $t) -> u32 {
>>
>> Can we name this `find_last_set_bit_ $t`? When the upstream function
>> lands, we should also rename this one.
>
> We can - but as for `align_up`/`next_multiple_of`, I am not sure which
> naming scheme (kernel-like or closer to Rust conventions) is favored in
> such cases, and so far it seems to come down to personal preference. I
> tend to think that staying close to kernel conventions make it easier to
> understand when a function is the equivalent of a C one, but whichever
> policy we adopt it would be nice to codify it somewhere (apologies if it
> is already and I missed it).

I don't think we have it written down anywhere. I don't think that we
should have a global rule for this. Certain things are more in the
purview of the kernel and others are more on the Rust side.

My opinion is that this, since it will hopefully be in `core` at some
point, should go with the Rust naming.

---
Cheers,
Benno
