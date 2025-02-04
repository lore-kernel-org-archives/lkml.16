Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0BA16B3A1;
	Tue,  4 Feb 2025 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667037; cv=none; b=WIGB7t+UfjnkBSaICzOhno9bJqDQLBAOgL6TnPfEQg5SvQChdVoBTYsdbIPiMz4LwoOqYMKwjJfWTFyy1mstsZACyPwlz42/L4Zw1tIBO8vnz0er+/yDVxZ5lWchOrhGFJSZ4fTKnPNnUebgzi9uhlhrLA0Q7djQJFGFnMfJj4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667037; c=relaxed/simple;
	bh=Rba8810OtKU+NnpF6c/K3i6RDqKs+qiNz1cG/DK/n64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYRYYhXQMEcjnxMRCBGgyizUewMGxiRLqb69+G2Hgo6JcIl8Z5OidkjggW7Xc/7/j1JLCTFxobpSstlCFD8eIYt4pgmArO1WnB3xzyyLugmYtOqw5wMHwyGIdV+6kscQ48xs4PIAjVQsXEzKRz84Zu8sOopl4B7QHo7fyO8HHqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZBGK7dB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZBGK7dB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C09C4CEDF;
	Tue,  4 Feb 2025 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738667037;
	bh=Rba8810OtKU+NnpF6c/K3i6RDqKs+qiNz1cG/DK/n64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZBGK7dBxWW3oEJC0ITHexJJfI9nBFo6er53O1WJOwrKvAcHtqO3IyKIK7ZPEWw5I
	 mUDcuOOhBJ3KizKGe8GZlgwuvqml1VMPPlT6G9N1pnCSmTDeaubV2l7m/HToIfP9Fu
	 3x/ec5uRgfaIdUf0d8GrujoQTia/rZRIyrHWRpY0mRJcJ4MHT6Fw+f+8aw93PTh3bG
	 pGvyogDTd2f9DBtGLpKj3DQCUjVMNwvzChv3NJxaCLilwCxj9fDhmQ43VASN6DiAPF
	 adQZB+xlr80T+dNL6yZB1cxRQe7Bl69vF2aXJyUtAGfn1A3ir+xxLMX+05V8jPJQJ4
	 OIp94JyEMGnCA==
Date: Tue, 4 Feb 2025 11:03:53 +0000
From: Simon Horman <horms@kernel.org>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: qed: fix typos
Message-ID: <20250204110353.GQ234677@kernel.org>
References: <20250203175419.4146-1-algonell@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203175419.4146-1-algonell@gmail.com>

On Mon, Feb 03, 2025 at 07:53:24PM +0200, Andrew Kreimer wrote:
> There are some typos in comments/messages:
>  - Valiate -> Validate
>  - acceptible -> acceptable
>  - acces -> access
>  - relased -> released
> 
> Fix them via codespell.
> 
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>

Thanks Andrew,

I confirmed that with this patch applied codespell only flags false
positives.

Reviewed-by: Simon Horman <horms@kernel.org>
