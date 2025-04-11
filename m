Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA7B1DE2DB;
	Fri, 11 Apr 2025 16:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744387562; cv=none; b=OU2xtpz1yQfqIaIispvdr95KduQgOLa3PQj81Qi5eGWu/cyYWcPGwL1fYLXQsSCkuXJ8ht/vqAQjQKAGhkpbwEQWmuH0SV9+sW+NZfRgYO2PDO6KHMYjgidQP9LZ89/m+ldKd4pU5Gd3c6Ifupb5IjK/8vPbivQ2KXyJeyUrwpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744387562; c=relaxed/simple;
	bh=M99sWfsJPm8fWrF+XjWYyms9cW6zbPtp4LnJwowmtYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elBLAU+/9S/7ETUl29q9Cx4ErVkbjc9IoGCjHEUA55KYxKd/t8/BQtP+KhEkj3Shx8Fm+yKdkhcqNQNORUoSNKwuZWBKVetEPCKENHBDpy8E/yKfAicDmxR/hRQXM+acy5Ze6J7oVH2P/2ua/QJuw0qtf/Dsq4qwnb6G9oyemlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVnFYRwP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVnFYRwP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CD7C4CEE2;
	Fri, 11 Apr 2025 16:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744387561;
	bh=M99sWfsJPm8fWrF+XjWYyms9cW6zbPtp4LnJwowmtYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVnFYRwPABjtS8+Gx4d+P2bEEtWYQCZTSdiDsuI7nlAcUZbTRpFh1hhqNCjPXrVUS
	 FyNEOMUvo7jhWNaHITyuvuG7M2R+hHIL8KSxINBrRFgOpp4SmZoNhF5s7n7TKtdmpM
	 4vU12mwpmQyHTQRtiOjrDZUCHG807KwF49jsV5i6AUHiEt09jqjKmO0AQMPF0Okqao
	 pvqHr1XyjBQhCfRFnJZnZ0NP8UI4AMCE8PLP6au56Jt3ltA6cfhUsv9w43z9xtEq2b
	 2T+XsO8iZwiWV0U2+NT2O/R/y3uI/gyP1MWgHRSdgA6J+jGPnx50jWiWit0zybcZJ6
	 2vPOT7+GWc8fg==
Date: Fri, 11 Apr 2025 11:05:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: Add Boundary Device
 Nitrogen8M Plus ENC Carrier Board
Message-ID: <174438755847.3320605.6458962348055629831.robh@kernel.org>
References: <20250409183730.1972967-1-martyn.welch@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409183730.1972967-1-martyn.welch@collabora.com>


On Wed, 09 Apr 2025 19:37:26 +0100, Martyn Welch wrote:
> Adds support for the Nitrogen8M Plus System on Module and the Nitrogen8M
> Plus ENC Carrier Board.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> ---
> 
> Changes in v3:
>   - New patch
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

