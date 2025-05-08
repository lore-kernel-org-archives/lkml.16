Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC20221568;
	Thu,  8 May 2025 06:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686682; cv=none; b=KiBRDfHadoFFeGIl8VwTGuIx7HLa9MwFwNlPsUSu6E1nI/QsIkLQdOjacZgEEDOjYZxxfxrWljfY6wO3fa3eEOOnqlY08UiEzU6MLOSMOCF7PW/jJmwtaOi7QEnBx0Zohf6RlybcEzk7HKWuK1O7QZ/RLutQQ+YNHuIxNQQbyfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686682; c=relaxed/simple;
	bh=Hy0g0Il8Xl3COvvl59eRO9qYPHsgZeK09RVf7oNgihY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmK5JiCHab0XVM4z9eZ4bmbsD29T0JrydsMfPTzCPslEXmrGzlh5eom2GgUyPcAzQCbIjtmOyYrgn2LCtmAD5+IF1ej0+dnklP6QDaFC53d6XgVpUHhEz2I1o7YGX2z3sZE2rkQdfBMnSk/RkxT9qKogrVzEs0tD+6XbU00lZwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHP9aykz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHP9aykz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0624EC4CEED;
	Thu,  8 May 2025 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746686681;
	bh=Hy0g0Il8Xl3COvvl59eRO9qYPHsgZeK09RVf7oNgihY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHP9aykz1rHNs6oq2hKLyC5C2+8wP9LG4iSrr9nXjIyEhmw9OFG9hQtAqQLIXB20N
	 o6sIhgvbqs6cHu1/gFRf3kB183UzoYLtyGKL4t0OdefJ04kg3sNXLlJhnkWH/OgjHZ
	 3IaFgb4oYDKN0mOKWZqaMHR+ndsS45T5DYyg0Op8GKDqrTLupVLHDrojyKPa6isDH9
	 SiyFNIGTHArebJytVBbTZEtVeui2PhCme/4oTyAYq8HSx/nAJGmNOiBA2iEluf6g5P
	 1wg9zO+DuTQoFPWfHLCBZzWCccoL3yr9WPiRgQu0V9mvlNfi2dVFEi0bshRZ06B4fc
	 nXdrcIHiCw5tw==
Date: Thu, 8 May 2025 08:44:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in
 $id
Message-ID: <20250508-determined-terrier-of-tolerance-ad0ab1@kuoka>
References: <20250507215903.2748698-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507215903.2748698-1-robh@kernel.org>

On Wed, May 07, 2025 at 04:59:02PM GMT, Rob Herring (Arm) wrote:
> The $id value has a double "//". Drop it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Fixes: 9ca5a7d9d2e0 ("dt-bindings: soc: fsl: Add fsl,ls1028a-reset for reset syscon node")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

