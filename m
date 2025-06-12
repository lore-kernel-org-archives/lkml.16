Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F3918DB2A;
	Thu, 12 Jun 2025 08:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718173; cv=none; b=RNNRgYhqOmLmBykbs7Z0jrjCjwzztECcH1aif1BCkFPqt1bdoRlNL0tnDwZKkXX1kLQNA6aI1C2Y75+1kwzNDF+ePQvNGUXC5Bb1mZdq14+I1fJReQreUc++Hms5jYKVcUj9KbPk2x06pZ6chLASjLhz9VyI2E7gSiNgGfqurv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718173; c=relaxed/simple;
	bh=WtcGkG4SPQLs+jDi9qM+USKYU9A+fu0BSpj4CY+8pdc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=kHeFHMwGnTLVTCtiwDq6crNfnNEcKTrr41a4TvFxatTRi8K7CNJ97GOWxqWGraHxTWD21oqEquRqX8AA+/DsALwKJAVt/LfLxfGYs4DljH7LUCp2V1b8Pq86yZCw5BjvYkRGiHPq50cFxc/xj/ByTLTH3dZd8T7plJ7vVUDHJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcFhOE+V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcFhOE+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1BAC4CEEE;
	Thu, 12 Jun 2025 08:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749718172;
	bh=WtcGkG4SPQLs+jDi9qM+USKYU9A+fu0BSpj4CY+8pdc=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=rcFhOE+VlqvcSa3cAMvGxCDzadS9emHxxzQU0wT9fsrSp0giFfJd5Aow0KJTWNdzW
	 H9/sokcRQ2DGBWphMwdqOpNt6wCAYSRVqh0KSz1RO3Yz+mN7lOkm2QE71nrVGsuv5y
	 zrvTxKDm4bdD8wyY1eUuL/YFI8lNDqudfVEofCyjZHjGUsnlRipcIJsMOH+nouawZW
	 MeP2bJ7AcC2Y7CZsP0iswke6zC+UiK8f3g9//DkkcgEx0KXXvavogHjE26FcEAGg7K
	 26etePuoBWMxk7PSt7VP/PHX/Hn2/PoF1dg1RQBdLZ1C6SVGs6KPmw8r1+k7ySjqJA
	 yQp0ZwPXSt3RA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 10:49:28 +0200
Message-Id: <DAKFBPWTNSL4.28PA3G5BAIB8T@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: devres: do not dereference to the internal
 Revocable
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250611174827.380555-1-dakr@kernel.org>
In-Reply-To: <20250611174827.380555-1-dakr@kernel.org>

On Wed Jun 11, 2025 at 7:48 PM CEST, Danilo Krummrich wrote:
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

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
> This patch is based on [1].
>
> [1] https://lore.kernel.org/lkml/20250603205416.49281-1-dakr@kernel.org/
> ---
>  rust/kernel/devres.rs | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
