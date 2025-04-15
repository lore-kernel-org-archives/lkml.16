Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5366D24293C;
	Tue, 15 Apr 2025 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744603; cv=none; b=biHNTAXj6b+9btq7Yd+SxvnTgpVBAmM60P15DVdUp0jB+aENMRIIvdxuYF8LJE5SpVk3FnMPjmAtpQUB4LuvHAKTPErbf/rsl6l2P9BaBeYeE/DpB+j1kzk58Y2U98o69qnXrK2WKdbf0FlHo8SvGzgQ0as7fwmhJtkGhY1QREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744603; c=relaxed/simple;
	bh=MflXTqys6HJWP+NOX4G/u4i7B51/eL+CWgLhzzKn8Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvLogIAbcctFgfFWgOgiP5YEkqwStDX5YHsPcTR6bR0k140pZ3O40yNj0/ZIrSfoRGpnsVvZQyZzneqHCno0uM3LzYRywFbbL5tEbIYtD6dls5denwS0jzXobjjykLlmlV11hbr2C+SxyOMcMhu5oXFqiTJyq3Q/EZrDs7n2tSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqMZ5o8U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqMZ5o8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D313C4CEE7;
	Tue, 15 Apr 2025 19:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744744601;
	bh=MflXTqys6HJWP+NOX4G/u4i7B51/eL+CWgLhzzKn8Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqMZ5o8UaVlfbFjfD4nOGKNtEiFXSy859sVi6f3fdd6o1u8E3ZTg3NT53QkCRvrvS
	 bksYzyLLeiS4pLwg+EFzuIfow/z/Piam/pSOpzKs9aFCLwyy7y2fKkSO6V7Ly6DU3I
	 QAuYy77YC/OKcn3gB6TG6MctJ55upddFG5UD4kAue8Ng8JUu/+9srM42dpQyss1MVS
	 c9p7TTxPrMJIjxhlXvhnL+MmoQCJ4y/2uKbX3geQZMRDOllOOko80E3nYki25A16gY
	 ygFLioPm1Izj9xbmtHu/wi/Oa2I0vHO8hQ2xG/eLFwtV1JEA2yaZNXNG+ekvmInucV
	 LSXMMzHnGofsw==
Date: Tue, 15 Apr 2025 14:16:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] Revert "dt-bindings: clock: renesas,rzg2l-cpg:
 Update #power-domain-cells = <1> for RZ/G3S"
Message-ID: <174474459922.828239.14816147248352723282.robh@kernel.org>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-8-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410140628.4124896-8-claudiu.beznea.uj@bp.renesas.com>


On Thu, 10 Apr 2025 17:06:28 +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> This reverts commit f33dca9ed6f41c8acf2c17c402738deddb7d7c28.
> Since the configuration order between the individual MSTOP and CLKON bits
> cannot be preserved with the power domain abstraction, drop the
> Currently, there are no device tree users for #power-domain-cell = <1>.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  .../bindings/clock/renesas,rzg2l-cpg.yaml      | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

