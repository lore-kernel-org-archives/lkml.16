Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB76EAD0;
	Mon, 19 May 2025 22:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694312; cv=none; b=L5wBN7Jwmi1eb5e6INribK4WaOPJ19sJWiIWsMAWytWHG/JqXCearHoskBrszpBJALy52pkWJhhiUeNaHrx//8aTBvyG515aOy8p6UWppVXFtWCBZ/C1SvKl9fPYk3D7LVxtyL1VFCW2FqmerGzR4Se9jITMmumPnohV2wYhyDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694312; c=relaxed/simple;
	bh=Da0KOdQMtUzBnGH5QcRoomsXSLKckywjI1s4pwLx+KE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ntnFEJuET1U6pLNESET8HTDIerYHUJ/8vXeQJwis8wMWpAGEqqMJw7ArvmVHwxk6gt+U/8vqCAh0FjTsdsPj6m8mxy1hVPqfPasKffyJuDFi6o4Vo2tR1GoCuHfdSa6iIB8MteTDc5rzKE5g5FHMLlgyUMyO3Z1jZM8VW9pwqkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcY/n22O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcY/n22O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A8CC4CEE4;
	Mon, 19 May 2025 22:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747694311;
	bh=Da0KOdQMtUzBnGH5QcRoomsXSLKckywjI1s4pwLx+KE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WcY/n22O0ohjoXRE2ivXvANG0M3FSWqTcFtyWXwnu2y1AJ4bksI+kkaugN4qCxYV4
	 41FJ4dcDPTfr0inJQiyT9/JJsXyAOQUwpueq8ZHK/LaElqs7DUflYH0qrEWuNH96se
	 XpkUzqluQNdTjlt8wmj86++B5mQza8Sai4b214RuaUROy84B6U1wz1dlWSsXY0gVvO
	 Jad42S0i/dubZJLvyadZGD42zocM1/CCQGip3LBy5UH71gmpDYYfVn6hT87u/GsXYE
	 F8pHdf4AlwgCyHfNn0jOm1s4cjvnoY+upwit+J/BV9v91UgfBtlbHEoYkwITe/6tJE
	 nbtMkTuhdvAAw==
Date: Mon, 19 May 2025 15:38:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Justin Lai <justinlai0215@realtek.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
 <edumazet@google.com>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "horms@kernel.org"
 <horms@kernel.org>, Ping-Ke Shih <pkshih@realtek.com>, Larry Chiu
 <larry.chiu@realtek.com>, Joe Damato <jdamato@fastly.com>
Subject: Re: [PATCH net-next v2] rtase: Use min() instead of min_t()
Message-ID: <20250519153830.112e1e0a@kernel.org>
In-Reply-To: <20250519153218.0036db7f@kernel.org>
References: <20250425063429.29742-1-justinlai0215@realtek.com>
	<bb78d791abe34d9cbac30e75e7bec373@realtek.com>
	<20250519153218.0036db7f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 May 2025 15:32:18 -0700 Jakub Kicinski wrote:
> On Mon, 19 May 2025 12:16:11 +0000 Justin Lai wrote:
> > I apologize for the interruption, I would like to ask why this patch is
> > rejected on patchwork.  
> 
> Hm, unclear, sorry about that.

It doesn't apply, perhaps that's why? Please rebase and repost.
