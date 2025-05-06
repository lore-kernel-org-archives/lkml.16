Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07A622256A;
	Tue,  6 May 2025 21:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567377; cv=none; b=X1PNBzea3mdr867S/UqQzeFK8FU7Q/jCuXYMtdyIp03KtzOm5PeYunxTv4MLFnNRsrrm/lL+QnJjiaQsRW5h99Pyw49Kr2IbVT/Zbhe3qoCaIQn/FGefdklfXJGP7rRVCmsneajzAhljKI38DguaRePBx/ujyJnnXHzwMYzA2do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567377; c=relaxed/simple;
	bh=Wwcbe00niw89+rixh1Cu5Jp/hALwR+0+AtLW+L9AVgA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Jsic7ZI1iA8atvzkuYBc4H3CJ5ZNljSYaekuDOmzTzKcvT6rz4D3pLpzbqVtZot+OMDCviB1SXn6eiHGYV0CReAE/q+oJa8WoRebg4TAPZ6EsgHQLq1xxIwxbAvtDB4eaU8l1uozU7db2of8SdWfh6DYK33cRvekKJEq7FeuxcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkegdnYz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkegdnYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B6BC4CEEF;
	Tue,  6 May 2025 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567377;
	bh=Wwcbe00niw89+rixh1Cu5Jp/hALwR+0+AtLW+L9AVgA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MkegdnYzzkMNZYT1+CxWSrQ3IX4GxpJTZFYDjUbOk1Ctr4UYQRIAT1FWDjKoLPJHc
	 kdydtvIBP2MlajMWnNKlbQXNJJ3qcp93qn2SiI9zFSEMea5TIVrRxzwA9gtkJ4Y9l4
	 hqacNj1t63GpMVH8zdGDwFs3JwwtZlii1qVDZSxF/VfPa1AMnR8FfD7m1tKQn5Igsc
	 V4dTif4pm44J3WinOvA+BlN2KcGfv6SckC84/RNGcK3DQsjOphD1uw8+qHbG2VneTw
	 ak3xzOu0O5iv4hYf+nFyohJSgnx+zGZf+Xhomui3p4RFPyhgOWiybtxH6vnhExQlvo
	 pJ5tjeF2fqsSg==
Message-ID: <66005c5a24e9ededf04734f26a87fafd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250505013545.359745-1-linux@treblig.org>
References: <20250505013545.359745-1-linux@treblig.org>
Subject: Re: [PATCH] clk: bcm: kona: Remove unused scaled_div_build
From: Stephen Boyd <sboyd@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Dr. David Alan Gilbert <linux@treblig.org>
To: florian.fainelli@broadcom.com, linux@treblig.org, mturquette@baylibre.com, rjui@broadcom.com, sbranden@broadcom.com
Date: Tue, 06 May 2025 14:36:15 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting linux@treblig.org (2025-05-04 18:35:45)
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>=20
> scaled_div_build() was added in 2014 by
> commit 1f27f15258bf ("clk: bcm281xx: add initial clock framework support")
> but hasn't been used.
>=20
> Remove it.
>=20
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---

Applied to clk-next
