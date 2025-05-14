Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B2A294A12;
	Wed, 14 May 2025 20:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253179; cv=none; b=QFX/Myqbn1i7u+gHoC97OjRc9wkQ0zYzgkFKi/fS5xuWzfREFfIK854zARvUZNEy+vjTdOonlE4aJ0xRB+7HwZawCPki5I1NC84l3ZsoZiHwEc+6FI+nnI7yIgkKEzjiPOKfkCc4hFJ5nOxYYg0m1pLmmceAvDliHGP6vCAvG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253179; c=relaxed/simple;
	bh=tO68Tjx6no/A3m+CFy/nfa+gvsMGemKc+uI7gSwx310=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=d3U5yuWlakDrj5duvZ7JcCJoXoTRak9fplBu/FW831/ecKmt2I1oF8U/HnjfsireaWuzVDW+5igPAzrIrhX4gAi0JQm+/x/X3+lUR86xVp29sOI7BXQMG4YgeDGZLnexZtDv/GWy7iUPQgP/G0QJsKl9ictDOH58G51BEJhgw4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrO08dmE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrO08dmE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9C3C4CEE3;
	Wed, 14 May 2025 20:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747253179;
	bh=tO68Tjx6no/A3m+CFy/nfa+gvsMGemKc+uI7gSwx310=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=DrO08dmE6TBeaRTNP4FTAsZ9jJZHd+YYjZXJcfsSrrAAL+UL7GpxrKB521KmbTNNF
	 IDD7KjxNE7Bi8xNFf0xOO9J4QA7741vGtzn/SnSDx9ArsmMbOX5dyOwIyIORH0dwaD
	 KlP2Zkeu/VEmB5+Yx1FzvKY2pQujyulSFiL+lR7/HSN76DoWyBXWww0JGk78pMA2M7
	 CqcHgOqnSRfGzJ7jcfpMSKpYbUccdb0+BBLrK/0OorjgrhJQr7kTuh105fF2CBsSqh
	 yATP9K1ov1MqvbqyHRx1be6RrhhbUqdKgk7VhBm138ywRWdyuAZ+XBCAsincIYW5rG
	 xZfFfwOJe4obw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 22:06:14 +0200
Message-Id: <D9W5K3FPJ3SH.1AMA9VYM75Z4X@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] rust: platform: add irq accessors
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com> <20250514-topics-tyr-request_irq-v3-2-d6fcc2591a88@collabora.com>
In-Reply-To: <20250514-topics-tyr-request_irq-v3-2-d6fcc2591a88@collabora.com>

On Wed May 14, 2025 at 9:20 PM CEST, Daniel Almeida wrote:
> +    /// Same as [`Self::irq_by_name`] but does not print an error messag=
e if an IRQ
> +    /// cannot be obtained.
> +    pub fn optional_irq_by_name(&self, name: &CStr) -> Result<u32> {
> +        // SAFETY: `self.as_raw` returns a valid pointer to a `struct pl=
atform_device`.
> +        let res =3D unsafe {
> +            bindings::platform_get_irq_byname_optional(self.as_raw(), na=
me.as_char_ptr())
> +        };
> +
> +        if res < 0 {
> +            return Err(Error::from_errno(res));
> +        }
> +
> +        Ok(res as u32)

This patch could make much use of the function for `Error` that does the
last 4 lines.

---
Cheers,
Benno

> +    }
>  }
> =20
>  impl Deref for Device<device::Core> {

