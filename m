Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F9C28F945;
	Fri, 11 Apr 2025 20:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744404954; cv=none; b=cId2kvK86mLBKKwFrUcDogxzgc4p4Ptsnf7yE3GEDWxRoEe0GGV0LWG/9+QpVmfO4UHe0oLsVjHSZvrUNDC2/nAM3UBzX2UlUi1jYSw0N3YatGYUZlu38ZX+F6BlxhZbvz+oY+2Kwx9pJxQ7DqvfCwQdqsgBFwGvM9fvuTPAdeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744404954; c=relaxed/simple;
	bh=7Yea2VHeVaxxpx1gRMlkSHhWtQIBVwXNEO+gJfxR5hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KaHBlubE0Uem2SXJTJyfguqXXQWZoinJoAJKE/fm7wrEQiqRUYTAgQ/sGz45pCct1zDPRcxzeUrnIoMhWmtJOdLZIJwTyMj75tvqyZViEDn1Rd0aetbB97DxjqpKK1L/ohv8GpSmv7IMv6HkA6ValaCzfjYhykZBKCp1EcRf22w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jb8hCMsb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jb8hCMsb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21CCC4CEE2;
	Fri, 11 Apr 2025 20:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744404954;
	bh=7Yea2VHeVaxxpx1gRMlkSHhWtQIBVwXNEO+gJfxR5hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jb8hCMsbiyAJoGDvcWgHjoGpFeBOSEm5SL7UUSe0howM4JakJL/osjiD5WxVW/oYG
	 k+8ZE/l3t2wnZPwuCkjkhXeBRL9+0ofKjsajluPJj5FCWjAST3DRnz/EsJiV/nTvNk
	 XkLh4bHkJEO3fLfKqcIl67yJVTPv44igRSFSDiMnmFmuPVbWPlbyW65YZei+5RK5BJ
	 l4h9bG2Mwo3lrIWJ74D6k7NqQkZB5xp2FXpliT8mzKT0mI4tMet58DUnFj+hYuD9Sw
	 gEPDzSHqy+ey5d3tXdhyDs1RmanRZERIZQo93Mijnbk0hZCjIpXQ+pnq320EqCnZ9K
	 tgO8wGi2opQNA==
Date: Fri, 11 Apr 2025 15:55:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 3/7] dt-bindings: soc: amlogic: S4 supports clk-measure
Message-ID: <174440495251.3987380.11524726650702785542.robh@kernel.org>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
 <20250411-clk-measure-v1-3-cb46a78d019a@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-clk-measure-v1-3-cb46a78d019a@amlogic.com>


On Fri, 11 Apr 2025 20:42:45 +0800, Chuan Liu wrote:
> S4 adds support for clk-measure.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

