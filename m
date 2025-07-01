Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705725B2FA;
	Tue,  1 Jul 2025 08:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751356895; cv=none; b=cEk3PnvjUUkThAUyTdwn/Z7SXzBH3F1kAC5JBa7kBLWffeDk/To1SjuhDi3s7wHzzYOj+pRIVpdzsmXSeZKTap227n+JG5sgF8VR72FL2X7Ghp85n6OV88R4Z/H0y/LbVKrNzGS6JU7gsRZfseK5ZShuUJ8M5hrJWPl6sZqAKd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751356895; c=relaxed/simple;
	bh=flj4fS2hzSbhewFfFkU8Bbvx337T9Ym1TWMAI95LVys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acOf8kjzkzTwbGjYqPr89jfxsiYbxgxF5HjRaDAsRyNmhSuY1GgGqsGvsA61Z1Tmn/kK9QqrcMQwKnmkP7Cldr0/8GVoIGuWvo2g2JacckztgIsYVy+nwiQumpPsjTKMGdwEg2PN5pjiMZhGsthybss3z26geDgBXnTckw1uW88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpUd6Q3F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpUd6Q3F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A68C4CEEE;
	Tue,  1 Jul 2025 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751356894;
	bh=flj4fS2hzSbhewFfFkU8Bbvx337T9Ym1TWMAI95LVys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FpUd6Q3FzQIH/d0HABVmFXjdmlH8ben3MblG8WyoAyvJ5nln8szxPLGaFymeqYQaf
	 h/yd5AKwn4b8pZp1ntfExdNNe4OMoI18Js+3jXsCS4bITvoypxSJz9wX0sub8vBIOI
	 +8O1vmP7qcVDdyIROejnJ5a7qkU6UdHk05+9a/97KwWd7pAW4BrMZZIpltLU9RCdD6
	 rb5nKjvmCduhe1m7U8zPKtCoLGAE9sYOM0DuXHuKSQD/YYJa9Ft5MflNABXrQ23dKf
	 B9hRccEDcj9x6yZ7/jGx1pTzWpQL6wru447C4wPYJyiHiFunMlhznmHyow5Bjf9TjP
	 o1wfJ4kfZ89Uw==
Date: Tue, 1 Jul 2025 10:01:28 +0200
From: Christian Brauner <brauner@kernel.org>
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: kuniyu@google.com, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Lennart Poettering <mzxreary@0pointer.de>, Luca Boccassi <bluca@debian.org>, 
	David Rheinsberg <david@readahead.eu>, Kuniyuki Iwashima <kuniyu@amazon.com>
Subject: Re: [RESEND PATCH net-next 2/6] af_unix: introduce unix_skb_to_scm
 helper
Message-ID: <20250701-reklamieren-randfigur-8ae368250813@brauner>
References: <20250629214449.14462-1-aleksandr.mikhalitsyn@canonical.com>
 <20250629214449.14462-3-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250629214449.14462-3-aleksandr.mikhalitsyn@canonical.com>

On Sun, Jun 29, 2025 at 11:44:39PM +0200, Alexander Mikhalitsyn wrote:
> Instead of open-coding let's consolidate this logic in a separate
> helper. This will simplify further changes.
> 
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Lennart Poettering <mzxreary@0pointer.de>
> Cc: Luca Boccassi <bluca@debian.org>
> Cc: David Rheinsberg <david@readahead.eu>
> Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
> ---

Nice simplification:
Reviewed-by: Christian Brauner <brauner@kernel.org>
