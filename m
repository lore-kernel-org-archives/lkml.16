Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19751A0BFA;
	Thu, 19 Jun 2025 01:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297338; cv=none; b=e8so/ye4rrn+zO3JwQDACptQHxcupDnORzYwEI6NiSUg7xhFqueMioOl/bcQoYtByHMsJWKUqDEeGe/Jakz+fLNFKMql4TEhih4/x3X4Lkkkn5ICOkAqp7aDVk3qudQzRciyNzHInuU7B8kfaB1pXlP2PJeagXyZjm+KTlJ5nqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297338; c=relaxed/simple;
	bh=n2zXSWIT3wYzIrkNPT4skYP+3UWxuYQE7BnLQN+gLIQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=t0TpjT5n9dqP2UGYrODHtvoCV+QUIX/LrxplXBKlsMptQvgnLOcR7C0Mx7tprNYIKaQDMya5JkEBdxI3bYqKF02QEhErfKT/eBn8PGHrambeY8ayQ0QP6oVmioH22Qg89dvwBd71Enfs9Ff4MmPi8UxrBqu8P+I0hGpAd9kU7Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YE/KPswT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YE/KPswT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986EAC4CEE7;
	Thu, 19 Jun 2025 01:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297338;
	bh=n2zXSWIT3wYzIrkNPT4skYP+3UWxuYQE7BnLQN+gLIQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YE/KPswTcFEtbwhPx5kUyuGG9YhK4cDwgE3KOY2Hi3pZLGoT6oa5GPIaRlHoCuHCo
	 61Vj6At11d9Cj5UFxgeEO8OaGn6s6q7Nyl3RCS5KHCOQi/CAq28l27APnRVEdQZQiI
	 1RE5zOI347hsHSwujj32yN2BMPSdC5YVHxzJ+KgZWqHoNeDe3tDrey3XT3bmVGqltF
	 HN2dHvWnjz/oZPYHTM95l3ZNVPgZTrIKz4y1Sxs16xTPZeAO8hfnkZulvefTA+OD6U
	 aL7U95s9fbl/DdJ0Eyl83KqYpl/SPq7uhqSLqwTXo5txDcaJy9vfxDYH1ch7XfeiJg
	 VTocbo2AYAF8Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521004712.1793193-1-robh@kernel.org>
References: <20250521004712.1793193-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert alphascale,asm9260-clock-controller to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Oleksij Rempel <linux@rempel-privat.de>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:42:15 -0700
Message-ID: <175029733585.4372.4389089557331084216@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-20 17:47:11)
> Convert the Alphascale Clock Controller binding to DT schema format.
> Add the undocumented 'clocks' property which is used in DTS. Drop the
> clock defines and consumer examples from the old binding.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
