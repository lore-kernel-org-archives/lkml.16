Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3339199EB0;
	Thu,  3 Apr 2025 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662097; cv=none; b=p1n13UECt6uE0vRzgA9OGSEHSXWn3ymqRa7hyJ6gkBtioc1VlwokItvJv2tMYW8WhNHt9/fdwaUmX50GDmMMt84sDEEd3RAy9nZSZA/XFHqhUrzRo51rYVJW72XMd/cRwKm12yp/hP6MG4+ScBciTFySZxPZuarQqXH0jquGucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662097; c=relaxed/simple;
	bh=qRM3eG6gqLVGutDjiR2oQQ4su3EUaT75uA7KTA4luMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YA/Og+Ld7a5+57nXpnFYyp3g3XqP9UvhUiHkh1W+WZRvY88Jl4GnJusmlCn6uGEda0ZkKevQKeTLeuFqIYfNziqIx/S0VyG9gXjoF2HE/wUbU/DGbfzHpD9y9v4yIMoQSHGCVC5rZgue+2LmWg1ye1BlWHXKwYpvfWnBS6CFxLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic7VPpVb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic7VPpVb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776B1C4CEE3;
	Thu,  3 Apr 2025 06:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743662096;
	bh=qRM3eG6gqLVGutDjiR2oQQ4su3EUaT75uA7KTA4luMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ic7VPpVbqDl+foe4m6vFPehXrEaNTdi6Fn3uQKFgASy7+TZXiOAWo9cHZLLtV2uQ4
	 U6A0a4ir7DbesULikeqlrXDugQQXaPnY9xf+mtJfIIlKZsI9HY1+lKnj9jTnKNup3h
	 VISQvK+3JPQzvfUtXTZsZSKlHwOndyyQSxNpUU12qFn891JZOisLp5HkLUalRF4JP7
	 L/9EeEkAB9SApAhYYQpaHOlHCTZfpHs1LUgUqfJXAXcSjQGn0mts8WiQoEmnJwoQ7x
	 NJA9ZmIbnTiFWBfGN2ujLCTXwg4pufVuK1BAWXNz8sD8vSkSf6v2BE7ZKJa6gxkeK1
	 /oN04mr+AN4CQ==
Date: Thu, 3 Apr 2025 08:34:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, hjc@rock-chips.com, mripard@kernel.org, 
	neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: display: rockchip,inno-hdmi:
 Document GRF for RK3036 HDMI
Message-ID: <20250403-first-dandelion-orca-ed9bbe@krzk-bin>
References: <20250402123150.238234-1-andyshrk@163.com>
 <20250402123150.238234-3-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402123150.238234-3-andyshrk@163.com>

On Wed, Apr 02, 2025 at 08:31:36PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> HDMI on RK3036 use GRF control the HSYNC/VSYNC polarity, but this part
> is missing when it first landing upstream.
> 
> Document that it is mandatory for RK3036 HDMI.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - First included in v2

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

