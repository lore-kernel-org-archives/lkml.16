Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E7C219306;
	Wed,  2 Apr 2025 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604319; cv=none; b=CzS31G/ytiTOiwEfH4rAHL0i6ti14rUjkC/7f874sc6PlSHjt48nnlDdGPkg+UXqQvuhn7O3yweEScF0s1ixeme5vbURWwUyxGwoG/CXmIvyv17jZfaWCjpzB4v3YRaNSt8NKULL8pvTvLmOQEWcReeYrxnNDRH2cvyJkQyLTis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604319; c=relaxed/simple;
	bh=d3HO0by06NGB3AnL1TDQXs+J5kO79f27JvV/QUX6/qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwfTrLYY0SXzJHWlvLRjyqxmT5Rws4XPtemgX+79SS1aGmjLomSasCER3gDgUQpUzbMhmVFgokXLWc6VWhAP6EIRxGdkjnn72Ej+nwGjT5fPd36W4IcMgXWzlGsSQ3SgfdVx3zA2yIDTTqpNGNnWRW5nR7W1/4uI4nmKuS7g8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSUx5PNi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSUx5PNi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFF6C4CEDD;
	Wed,  2 Apr 2025 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743604319;
	bh=d3HO0by06NGB3AnL1TDQXs+J5kO79f27JvV/QUX6/qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSUx5PNi/HCgEaurtM28iXWavW1rSrYdA1ZRVSe8HouTPdhy6PezxIDO0/fxCSXbJ
	 ijuQUGu9m9dscRURCmHx5HAnPtZnxfFaQ7f+buvP6zLvOcJ2zXhpPkmIXAMD7JdE+Q
	 dg5qQ6ProLWyosHNDJgn6OST2bAOY1zZ8IaCdVB/y3UbwKMJojEhBajKryvzwCKv6w
	 8n00cvWkNb+SRhMNlIY28aKzS83MYCQujZVN39YVrvwJ1AY7kJhEx62f1TTYwx425k
	 ylTu7EoQmBPzHp0KkjxPubM0gKSg0JWWh/UaGwi/+77oo5UwjXf/k7W5WGq+XfKTvp
	 nGUrUnSlC9QIA==
Date: Wed, 2 Apr 2025 09:31:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Farouk Bouabid <farouk.bouabid@cherry.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: amc6821: add fan and PWM
 output
Message-ID: <174360431679.216370.1049216368114674934.robh@kernel.org>
References: <20250402102146.65406-1-francesco@dolcini.it>
 <20250402102146.65406-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402102146.65406-2-francesco@dolcini.it>


On Wed, 02 Apr 2025 12:21:45 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add properties to describe the fan and the PWM controller output.
> 
> Link: https://www.ti.com/lit/gpn/amc6821
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v4:
>  - add #pwm-cells description
>  - remove useless first #pwm-cells, that was supposed to be the instance
>    number
> v3: https://lore.kernel.org/all/20250331155229.147879-2-francesco@dolcini.it/
>  - explicitly describe the fan, use standard PWM and FAN bindings
>  - pwm.yaml cannot be referenced, because of the $nodename pattern that is
>    enforced there
> v2: https://lore.kernel.org/all/20250224180801.128685-2-francesco@dolcini.it/
>  - no changes
> v1: https://lore.kernel.org/all/20250218165633.106867-2-francesco@dolcini.it/
> ---
>  .../devicetree/bindings/hwmon/ti,amc6821.yaml  | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

