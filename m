Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA5927456;
	Sun, 29 Jun 2025 15:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751209724; cv=none; b=oYJoYAFoOlSESuh67PWhyML4obQ6bD8TQ22QESYD+lqLAVrca+wMVMbz98KaEIkt5KIThz2Y6nLG7eUqwSJRHsfo985PAnJ5RsHjUI3D4ofyJY2WUE2+Jvzz2E/qR1YgNMYsZSOSyPjpdzu0znaKt19ADJ0Q+hIKRNWj+z7DMzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751209724; c=relaxed/simple;
	bh=IqAxO6aa7wTiMZS6kcscadztrqSEzge5sTPfk8h63gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSaqfYJAA2+EonuGRQ67Gh1ipMGhil5VtI/67DgeiKec2zn7GzIrDpy80B6noa/weGHU8IsAtZzwXDcwgbQ2uGRFbUe/Dl8s/yXMDrW1/QctiTkY76HwCA1N0nkem66uLYqex5bT22+dtz+UzXxPSL5xkdrk+5KIWJ9eIN4pKrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqdoJ8vj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqdoJ8vj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBAEC4CEEB;
	Sun, 29 Jun 2025 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751209722;
	bh=IqAxO6aa7wTiMZS6kcscadztrqSEzge5sTPfk8h63gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqdoJ8vjcPk4tUp3kn2x6SDHSNWaY0MAGJvDgq11YENCoxlOA+1KMW8b7cBMH8ZJs
	 Z4ekCSly7mfEzTDt0WkhJWzl+VeKIx9ODNhNbBZpUDYQClbzN4yp54wrGUZ9y9fpwg
	 wDx3wuRMAb0CJyZUrs9xFpJxfulEVdCAdIjeuCynMEX/YOIZJZwA+kd+AiP1B8lrNN
	 0eqafGKcATZsO2Hdw2+dIaayOFLk04+/wupzYBwRqhj330KJWOkWTneIvWP3Z/nWli
	 /eQz1IJeyRqUUlOD+VptdMKrtHP9nEfAVDMBpFlH8Wq+rRGJCtNsFn6NZ4HIQEnzAg
	 Kv9plWCLUB4bQ==
Date: Sun, 29 Jun 2025 17:08:37 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: devres: require T: Send for Devres
Message-ID: <aGFW9QBfV3wQVbuq@pollux>
References: <20250626132544.72866-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626132544.72866-1-dakr@kernel.org>

On Thu, Jun 26, 2025 at 03:24:46PM +0200, Danilo Krummrich wrote:
> Due to calling Revocable::revoke() from Devres::devres_callback() T may
> be dropped from Devres::devres_callback() and hence must be Send.
> 
> Fix this by adding the corresponding bound to Devres and DevresInner.
> 
> Reported-by: Boqun Feng <boqun.feng@gmail.com>
> Closes: https://lore.kernel.org/lkml/aFzI5L__OcB9hqdG@Mac.home/
> Fixes: 76c01ded724b ("rust: add devres abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-testing, thanks!
