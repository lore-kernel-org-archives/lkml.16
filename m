Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FAE156CA;
	Tue, 17 Jun 2025 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151081; cv=none; b=dFZXuU+MXpiguEedJE6Ww2oWVmcOK0QGo6odYb4USJfRi1ojHOvOCgu5bjHhL0AJIJ+Qgp2OgA+5Y+vQgFPFF+dNu0dvWoRjvusR4sfhOQ5xiG5Rid8xDkuOgCuVhfHNvwYxTaiz/l8b8BqNehh5SFKsW8ss3tsrHGEyRPRnrek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151081; c=relaxed/simple;
	bh=i77lUk5WMIXOEP9D3wHvwa2rpTFSesgsgccYKoyA4OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfWusGbVlV/oEZN9tCEJ30W8v+lYfTIs6UD5Z+mL7/+4WQUOGiOS490DLvxp3SRsdlWnO3jyczgCIFnfP9ZAk8VKtzidLS2lLw2ttJX5wuRt/96e03E8SYlZlmWwT1c25NGFVGJtQq8Og0Hk/yhJ9TIdqnT9jjaXxCWj5aa7pbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHplQo/B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHplQo/B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D77C4CEEE;
	Tue, 17 Jun 2025 09:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151080;
	bh=i77lUk5WMIXOEP9D3wHvwa2rpTFSesgsgccYKoyA4OY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHplQo/BMzDA9ERz8UlEj3VdXQo270fn8VnOFcLmmlcogqD3hEhL0n7JHfCqhyw5B
	 zdNRBPHvP1ie4+ok9O+G+BoFH9FFPRsveyxwdLCliSlKaZAKINk0ERzGyTie1JX92o
	 G3MWeRU+5kWfQ8VFLtgTfxaCSHEd94FbAmGPJnFdXMp9vr6DrCVmT4cwOaxF0xdYn5
	 0q+K3ujyowdEx2zK/2s6Xq+r4oN5hkT9nYKRMFbBxEVh2be8M1xuCRdnoeHgHGMdyY
	 gGvJ9g7C7tX1JN8yd7DcitlkF+0Srt37UUEuP40uqLvaFiYCnyjmeVn4f11HJQKD9B
	 GQ7giRJyJ6OLA==
Date: Tue, 17 Jun 2025 11:04:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@axis.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Nicera
Message-ID: <20250617-sage-meerkat-from-ganymede-846c9c@kuoka>
References: <cover.1749938844.git.waqar.hameed@axis.com>
 <6d6705440a3c28ed4c6746dd570c7a7d8b6d3641.1749938844.git.waqar.hameed@axis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6d6705440a3c28ed4c6746dd570c7a7d8b6d3641.1749938844.git.waqar.hameed@axis.com>

On Sun, Jun 15, 2025 at 12:13:58AM GMT, Waqar Hameed wrote:
> Nicera (Nippon Ceramic Co.) is a manufacturer of a wide range of
> sensors. For example infrared, ultrasonic, gas sensors and much more.
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

