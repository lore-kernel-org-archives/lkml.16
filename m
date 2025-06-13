Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E91547E7;
	Fri, 13 Jun 2025 22:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749852360; cv=none; b=OWRZYkh5l+qf1w23UwFiOgX88Lqz0mECOHSTVLNlBd15svxXSE6lhil9e2KqCVybQ1n+NQyIbyYyJWFBXAZcmj7gihenfzN7TZ0GsKSKe7CCIks7X4TwWOfZMcVfrq6NMsm8Ve5KGxC9PdfO71lW+YwPg9LQlCFQ3lR4ON2lxn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749852360; c=relaxed/simple;
	bh=hednBUfpfCBxN+niUW2xCDVgQY/Se1Tg7ShZ8ACX4u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdxmLrpoTeVUCpUitEfHZxr+Au+4yu/GvIh753iL0X28+L6hm0G4ICRKJqXDmKMWO4c4Vko6q660fNHsXOi8QjM/hV2NTN0jRsokSTMNXGq3xcf/HlYjssqqs5P0BzTrJ9Y9wBeHjwQlspMVe1OyBbFg7dvtv1uE0Vu5Ho7t11A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+xZqJtw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+xZqJtw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902A1C4CEE3;
	Fri, 13 Jun 2025 22:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749852360;
	bh=hednBUfpfCBxN+niUW2xCDVgQY/Se1Tg7ShZ8ACX4u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+xZqJtwbMYW+3Fx7e4IYHQALL714A/WoBH4FwJJbdoGmLM4aJROiwRxE1R0o88VL
	 iyStG3/oZmcoJQDoeJuNEmeZnOi43sVIy0uzdwin9qA3bUhYyX7KZeDOUb+lVQ1e89
	 9LGOnpISUEIBarCr4F51HWYm/syuLpmwd/uxM6k0KC2riIKNe8PlBjarupiSI4LxxX
	 SotxR1MCrRqaQLSINZU/pWbiowZuEiJTtsvKbHJjOxKVdGz5ggLqVOwK/yvqWZf+1i
	 8OpMJmOqelmi4kNj7LUdi0gfJqe/RJgaguejQgC1QDmEU0M703+9puf023uFba6ncQ
	 9Pc3K0faVV1tw==
Date: Sat, 14 Jun 2025 00:05:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: devres: do not dereference to the internal
 Revocable
Message-ID: <aEygwt12Wk87iyUw@cassiopeiae>
References: <20250611174827.380555-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611174827.380555-1-dakr@kernel.org>

On Wed, Jun 11, 2025 at 07:48:25PM +0200, Danilo Krummrich wrote:
> We can't expose direct access to the internal Revocable, since this
> allows users to directly revoke the internal Revocable without Devres
> having the chance to synchronize with the devres callback -- we have to
> guarantee that the internal Revocable has been fully revoked before
> the device is fully unbound.
> 
> Hence, remove the corresponding Deref implementation and, instead,
> provide indirect accessors for the internal Revocable.
> 
> Note that we can still support Devres::revoke() by implementing the
> required synchronization (which would be almost identical to the
> synchronization in Devres::drop()).
> 
> Fixes: 76c01ded724b ("rust: add devres abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-linus, thanks!
