Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0422264C7;
	Thu, 26 Jun 2025 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750982019; cv=none; b=TJEDf39u4sZSevHhyyQI0Lyw7QIarjPQlHx5XCyB8kfuCg731flSfcDzrr3M8YRBl6YW1nip+PbUR7EHXk4tzFol/EIs539NIuoLdtrJbd4HUZcgBoJlySyuu3dGH/f25KO0tXSOGkQEOi+bZ2NBWrAde3i+cGlxplB9EIle2eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750982019; c=relaxed/simple;
	bh=N5pKkhGR3QP96XtzFcSDhYGgqn/gFEdccQcQ5m8XHK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLAC8a+rMYxXCr5UAlx3kSVRAX0Wkswtc3GEMGRMettswHuEoNlknMlxVVICk3VJGvIh3BSiZWXsvvjSsAA1ujOJHuuZoTF8IZtq0+aE0w2G1Lgm6j9aElzwfzGKS+Wg3ref1dONoy1fJtAWVbIpyrC+T60opdRkL9e3zmuDWUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2on4yBp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2on4yBp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69308C4CEEB;
	Thu, 26 Jun 2025 23:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750982016;
	bh=N5pKkhGR3QP96XtzFcSDhYGgqn/gFEdccQcQ5m8XHK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2on4yBpfJ10nNsGwKhMughoTXH/b3fP3kRkR1wrgAaZgGvhTlKSSrP3f9gnLYgu9
	 50iuAWupWw9jlzUew/uwqmlnA6u0nFWIEStRYuJlOTwgOCysIYTiJrCGPEogLHQqnP
	 EXmPuT9YtJXqulwi7cp6NfkMFiR7mOhvp9v9+6HnYWa8EgU5IQ6riOGg4fVLxKnKp1
	 +ZO6CkUpLDpZkXvHaHiJkC/fsrGv+axhLjDSLhgAbydDsYeDacaIZfkliZOnzj2ssS
	 FhygtQA+FkKCOUIUxOM9zo9dbjfgNhlfnGvpIOxsiuhAHT7784IzJ+1bPnOgI6tOyQ
	 0ceQLy9fRAzvQ==
Date: Thu, 26 Jun 2025 18:53:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	neil.armstrong@linaro.org, conor+dt@kernel.org,
	sebastian.reichel@collabora.com, quic_jesszhan@quicinc.com,
	devicetree@vger.kernel.org, tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Make reset-gpio as
 optional for Raydium RM67200
Message-ID: <175098201489.1430871.16529661509700275956.robh@kernel.org>
References: <20250616070536.670519-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616070536.670519-1-andyshrk@163.com>


On Mon, 16 Jun 2025 15:05:16 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Although the datasheet of the panel module describes that it has a
> reset pin, in the actual hardware design, we often use an RC circuit
> to control the reset, and rarely use GPIO to control the reset. This
> is the way it is done on our numerous development boards (such as RK3568,
> RK3576 EVB).
> So make the reset-gpio optional.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../devicetree/bindings/display/panel/raydium,rm67200.yaml       | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

