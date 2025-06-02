Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E5E223DFA;
	Mon,  2 Jun 2025 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748885751; cv=none; b=j9YxIwvk8oyNG5gP2d9EFNxW/6qOpyPWEd7tsIwMrN0boZ+4VF4ILqy8oqoC584sdifKkOoWKkbb7kcfJ+mg4Lx++4RSuQ44kpOXkElK+I9X+CjpqORGP7jBpsTa1WCm5GMmDfvzy0ze3hmzR0/RteT19LgTQtE5ijTrL/cIZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748885751; c=relaxed/simple;
	bh=2K17d6RKHpwWtsyakp/VCJ9J3clE4UaBs142079EpCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAFeuq2CpBomLaAC4Tnl4l3wP4FfunRypCF65I0vrRnwZBeNViuG2kFDfS7oJEHwJ2+QpxliN/rwvirGTI+wbSxl2qpRItqRGMeZ8dkaJoasQ/pvky55v7U6cnAKIidSWuYkRqZ6PqG7z2x/DviURefJw6IaJ3mPT/jaGNiBKOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbgYVJNk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbgYVJNk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFD8C4CEEB;
	Mon,  2 Jun 2025 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748885750;
	bh=2K17d6RKHpwWtsyakp/VCJ9J3clE4UaBs142079EpCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbgYVJNkBsao12/g6cjP6ky1L46Qe4iLEoeA0An4aaBUhrV/kCQC0+15u7168vkiP
	 eBIPEjnQl/3DhSJ0G5kPbFaoTWoYoQT93v+bmv/zUl4spBBHoD4WQprma3hgmm+Kj2
	 enJBUjgNnfk9wRHb7+QLS74dofZ4yJvSE7c/9yTeaJhA4yGbwt0z+lLv8pkCgGhaw6
	 tmVflXBdv87KGQRS0ScU232pQdOVNhVMijSCZqKZR49c7uaRtZ1G50RylKlDMkOPJf
	 +K+GZ1BeoODelqjS3lF3GUE7btYbRHjw1Y4R57bwzSrc4I/mZ8MR188wpcD2Wxwq3M
	 y4eVq+sQc2wxQ==
Date: Mon, 2 Jun 2025 19:35:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
Message-ID: <aD3g8P2qqgNsEkul@pollux>
References: <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
 <A7E3A124-AF77-4A4A-B4E2-AE7DDB1CE007@collabora.com>
 <aCXYaCGvO_tI1OOh@pollux>
 <39C56E3E-07C6-44BB-B5F6-38090F037032@collabora.com>
 <aCXh1g5FWNiz7exb@pollux>
 <BEDD659F-B222-4150-9018-3B59126140E6@collabora.com>
 <aCXv86nAARGgoqEq@pollux>
 <aCXxnUdO8--5y8Zo@pollux>
 <1FCFF2CD-9CF1-4716-AFDA-78A5AFAF113F@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1FCFF2CD-9CF1-4716-AFDA-78A5AFAF113F@collabora.com>

On Mon, Jun 02, 2025 at 11:40:43AM -0300, Daniel Almeida wrote:
> I guess the only difference would be removing the handler() accessor, as the
> caller is now expected to figure this part out on his own, i.e.:
> 
> In your example (IIUC) that would mean accessing the Arc in IRQHandler1
> and IRQHandler2 through some other clone and from the actual T:Handler in
> the callback.

Basically yes, but there's also the other alternative in [1] -- either is fine
for me.

[1] https://lore.kernel.org/lkml/aD3f1GSZJ6K-RP5r@pollux/
