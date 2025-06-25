Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D9935280;
	Wed, 25 Jun 2025 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750889912; cv=none; b=stolAnz6S3upv6e0N7oqxEn/SFSolnDzHBfKYLN2G2rAhQovzz9K40S6ewln903ANf8DfxT+eMocTexb6BNcGA9k8FQwoqLWx5H+TweQWGyYQ1H6wKOXbLGtZBRfhE9dHDW/B7SAX7A3GzMvkqXoxgeTXWIorXQPuIqY4acC5w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750889912; c=relaxed/simple;
	bh=jHlQiRg4UtnzJJnBTe3Rk3Red9/nsoYqw9mrUsapWhU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=X7944bdLi55o1JqyIL/cQ/Tuvl55GulviLfMUJNZCls7UBATGEGcIlEWoPT9BqKVUGCrq/cznv919pwh1+DuzOx5YehiZ+NnFjPbArx45DoB4lNs0sWpeE6ZfHxCushmt9KgRg71ZWoU9uU6bW9ZyfYhJVX4fkHJkBzZOiV4vnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGW8CSSg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGW8CSSg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C36C4CEF1;
	Wed, 25 Jun 2025 22:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750889911;
	bh=jHlQiRg4UtnzJJnBTe3Rk3Red9/nsoYqw9mrUsapWhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGW8CSSg6Lo4OF/QY+m0VJ5Ky4qfOPysOi9MfyoUMwPBCwj3b0EbZyepJ/NRIvtOx
	 z0TDfdCJfq2YAkm4iGGPFlXF6ZctZTUPYrPCJa00VwrsDKeyCqFYYC/4FaYYqKbiOO
	 CTAJsDAUYoapUyEA+/tEnFejmUV5/KPyp/3VlFghG/+0lSKQa+aygDU1Y/DnPQXoyD
	 oxcBELTlIj+2Vmjbq/1gqv2IbAEqW9PVlL7kBWK1+drYBkKAmw/zB0me5AXW9xjdsb
	 W+CfKbqaoTIiremq+z/y8duCiuxfwmlLBHKwkOcBU8I+10BOgj9x1D6xLSK9qqZWsa
	 WFfGhhj8/BqoQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Jun 2025 00:18:26 +0200
Message-Id: <DAVYO6S5VMDF.1615DT3F5J6H3@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] rust: types: rename Opaque::raw_get to cast_into
X-Mailer: aerc 0.20.1
References: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
 <20250624-opaque-from-raw-v2-2-e4da40bdc59c@google.com>
In-Reply-To: <20250624-opaque-from-raw-v2-2-e4da40bdc59c@google.com>

On Tue Jun 24, 2025 at 5:27 PM CEST, Alice Ryhl wrote:
> In the previous patch we added Opaque::cast_from() that performs the
> opposite operation to Opaque::raw_get(). For consistency with this
> naming, rename raw_get() to cast_from().
>
> There are a few other options such as calling cast_from() something
> closer to raw_get() rather than renaming this method. However, I could
> not find a great naming scheme that works with raw_get(). The previous
> version of this patch used from_raw(), but functions of that name
> typically have a different signature, so that's not a great option.
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/configfs.rs                | 2 +-
>  rust/kernel/init.rs                    | 6 +++---
>  rust/kernel/lib.rs                     | 4 ++--
>  rust/kernel/list.rs                    | 2 +-
>  rust/kernel/list/impl_list_item_mod.rs | 4 ++--
>  rust/kernel/time/hrtimer.rs            | 4 ++--
>  rust/kernel/types.rs                   | 8 ++++----
>  rust/kernel/workqueue.rs               | 2 +-
>  8 files changed, 16 insertions(+), 16 deletions(-)

For init.rs:

Acked-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
