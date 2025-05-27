Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032051F8670;
	Tue, 27 May 2025 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748367208; cv=none; b=oscqhFUG+KkDENLxLwajxUKCyyaOoC+iJGG01aH9VwvxgfyUW/FVgPq3dqZ5kyVHnOWKxlHwxzQuNT9gPXIkG7VpN7pAONC/Gn6aOR9IUzmavuaC44zkwpqsiG/6MctH986d9/uxnw0FAXFqirdAB5Qg15DivCL8eEbzaBobA3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748367208; c=relaxed/simple;
	bh=p4e9seUtzY0nO14XS9z2ccwP9+DA91CnjzICq7NfuFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyyCYWi0C1l7EYJFJCSR0tfobwOluySf5MJeDjzLl7gA1cvNl3wFaB5KrftV3Iomqo8o26z+DQ8tXibOE+BC4fZEin1lSp+nUeXJ9cmvVgZFLm+kTr2FL0yd8wNlRgE8HfsZNpieLCDZIM2iA7xmogfs8tXdUDwDtoOpZRj9Qbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVdheUQB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVdheUQB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78465C4CEEA;
	Tue, 27 May 2025 17:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748367207;
	bh=p4e9seUtzY0nO14XS9z2ccwP9+DA91CnjzICq7NfuFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVdheUQBocOHoypYqCFDiatm8kFdMx7zNwaGW+aRcVegDcyagoBDSQ/qEMH3BdKZn
	 DDRF1mT1tFgVEjdNDk/BlZXE6mzFrBOycG4bLtMJxPfzGEn3lHqf6s30KVbXmbCVVe
	 WJhFWC7EwmASxE1sX4/wof03cDPymZ0i20WSjb8aKjdLozg3UpLf0O85s/RRExAgbp
	 iS/KDCK5Ix8N3c8sxAYJpjYeVX/TLpTyONzCwBCYFaRHYnqQp8H1HXUlyuz4dL8/SO
	 gP9vFoAJfHjdm3zu2RL9fg9c3s0koiBxt/FDrhMpWGdsEY/q1IWW1iPmlz5JwqwO7x
	 lbJk9g0Nl76Cw==
Date: Tue, 27 May 2025 12:33:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alejandro Enrique <alejandroe1@geotab.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: gnss: add u-blox,neo-9m compatible
Message-ID: <174836720496.787055.8832272874859848122.robh@kernel.org>
References: <20250523-ubx-m9-v3-1-6fa4ef5b7d4a@geotab.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-ubx-m9-v3-1-6fa4ef5b7d4a@geotab.com>


On Fri, 23 May 2025 13:19:52 +0200, Alejandro Enrique wrote:
> Add compatible for u-blox NEO-9M GPS module.
> 
> Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> ---
> This series just add the compatible string for u-blox NEO-9M module,
> using neo-m8 as fallback. I have tested the driver with such a module
> and it is working fine.
> ---
> Changes in v3:
> - Remove unnecessary example, 'items', and blank line in the devicetree binding
> - Link to v2: https://lore.kernel.org/r/20250522-ubx-m9-v2-1-6ecd470527bc@geotab.com
> 
> Changes in v2:
> - Modify the binding to allow falling back to neo-m8
> - Remove compatible string from u-blox driver
> - Link to v1: https://lore.kernel.org/r/20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com
> ---
>  Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

