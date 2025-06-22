Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5F5347C7;
	Sun, 22 Jun 2025 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750586128; cv=none; b=kJP9DtjEhHzLpCM0QwADBz/TxTNIUXZxRlAyMa8b5EFX0YQeqKdfrbZWctxty20NH7oqZc6Ug/VbhUeG6/x/XgNgGsjlwGSuvTI0nxvGV6Z/eyjF7Jy35bAnktW7MDoOuKXJonC8n5DSHrronZ7udvcBRQxM0c43QF3SUEqVdYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750586128; c=relaxed/simple;
	bh=e0e7oIl4ZTo4z+sAifVVdBtbG/Yv4UDoL34UI2WSdyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XN55RBuvgkfY0+nFzBKMkIHmkXdrH4XVlY8k4aAqnv1GZqqhjKW3NnLeONMWCXZN1Lti9kDpLe62MHRuv8/GW4LVUbesvEQI2wdPsORh1DD/71KhzeFa2LXsL1fynr0OLzUIme3oz/9oHrXoCPPzdOazx2r3sSFk3CPWec6Duqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlmfJ8co; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlmfJ8co"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7672C4CEE3;
	Sun, 22 Jun 2025 09:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750586128;
	bh=e0e7oIl4ZTo4z+sAifVVdBtbG/Yv4UDoL34UI2WSdyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UlmfJ8couJRvoGU982r/aY//gNcnO2QezDBDBFhniYPnT859yivRFjD+9EOxdl5xr
	 Eu4M708vWymVhkv/TZNTtv8HV82qJmDza1+8Ym3Xr4t8VY7BNJXM8vp+hbblD8x9k2
	 ESVZunOyY4WIPOxIVacXi3WwCN7HwBne9ZND7zqkkE1U43+dmYbG5yb1NwEwwk4HZP
	 35k75nz1OugLfsTT7KLFujwB4sAXKzRVfpJHF1rnn7get48kTQZ1SGM9kJP0Gau2S9
	 x/zFzbZzto0CJXPhf5ttkbMlqzmV1XAwPzPvdBvQpQAZWTb5CsmM1B0d+L+y1GPRbF
	 dQikgPx4U03tQ==
Date: Sun, 22 Jun 2025 11:55:22 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/4] rust: devres: replace Devres::new_foreign_owned()
Message-ID: <aFfTCv9MrGBdbFOr@pollux>
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-3-dakr@kernel.org>
 <DASIPSH2IFKL.O55ZBVZFPVWB@kernel.org>
 <aFcn51EPcWlDG_YW@pollux>
 <DASW5JYFRE2K.1E5T6FI6KNRQJ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DASW5JYFRE2K.1E5T6FI6KNRQJ@kernel.org>

On Sun, Jun 22, 2025 at 09:42:03AM +0200, Benno Lossin wrote:
> On Sat Jun 21, 2025 at 11:45 PM CEST, Danilo Krummrich wrote:
> > I feel like the name pretty much nails it: it's a new instance that is not
> > owned, by the Rust side, but by the C devres implementation (i.e. foreign
> > owned), which automatically drops it when the device is unbound.
> 
> Yeah, but `foreign` is so unspecific... With `ForeignOwnable`, it makes
> sense, since it could be anything.
> 
> > Maybe Registration::new_devres_owned() instead?
> 
> I like that one better, let's go with that.

SGTM, but please note that this is unrelated to this patch; will create an issue
for renaming those.

> > Hm, I think attach_data() doesn't quite hit the point. Maybe just
> > devres::register_owned() instead. I agree that 'boxed' is an unnecessary
> > implementation detail.
> 
> I like `register_owned` better, but I'm not 100% convinced by the
> `owned` part... The regular devres creation is called `Devres::new`,
> right? How about we just call this `register`?

In general, devres::register() is fine for me too. But note that it looses a bit
the indicator that the ownership of the object is entirely transferred to
devres, in contrast to the Devres container type.
