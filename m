Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0600E1E1DE8;
	Thu, 17 Apr 2025 06:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871108; cv=none; b=pomv8DdIyQTQyJnsZoPtfhhzzf2Xyf0Ev9X4yJ9I27cfbb56aJLU8DphKcnc9aGqUE5OwGcZ6ZauY4CtsihrCNqzP3uhO6XafAB8vcJ7Nf2kAEcD+5QJByIYXvDLWJ7VSAtXle90Sa9RGHXEA5uyiryatf1H0h5OGsodI2tGHWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871108; c=relaxed/simple;
	bh=Rpjh8Lqls1eestMqHgra8ah6xBmfTl+3tzrMDUdJI2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4sb3HlA37UM5LoQFemWfzF4IRbLRMn/sHgB8yEY53PHF+qYLXoDEVhVV7pFpFCPDpFgE4qzdrfDsNxPrb2PVMdgsuSE/DpDdfF4gvxF8yrDjM44TSjlKeWzKhK039fkVhE+eY8nvsWJqPiPxpKQernv1u8E4gUzyCnFsYz2ycg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O65eiq2s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O65eiq2s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E38C4CEE4;
	Thu, 17 Apr 2025 06:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744871106;
	bh=Rpjh8Lqls1eestMqHgra8ah6xBmfTl+3tzrMDUdJI2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O65eiq2sXTc1TIMVnNtAyarpb3gipRHvr4DeIJjXJ8JI6dBKjao0xLiQZnbkioack
	 aFPuyUQv3X3zCI4D2W9mfuAr6bOZhcBSHtnkie1dnsFABvDCq5wbCBHWSSZY0qQBKc
	 NkRgXBjTUUL024pC5G5P8Y8p+OAXPO6YkKvuVBkYrEYannSdRGf4DMlMkm1IVvlN+d
	 Tso2DMYnz4/w9E2edelZkEeSSVxtTlb9kPlFKosOyQqQYzIH8ExQ/64qFKjIQhigrL
	 Uj4w2GHarT0lOBLIzea0HZOwmjIkuozQah4EG5d+jxWrJO63e42cxz4XGKoLob3PUY
	 AGqznLSRTBhTg==
Date: Thu, 17 Apr 2025 08:25:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: justin.chen@broadcom.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	florian.fainelli@broadcom.com, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	jassisinghbrar@gmail.com, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v4 1/2] dt-bindings: mailbox: Add support for bcm74110
Message-ID: <20250417-scrupulous-noisy-finch-272f7e@shite>
References: <20250415182826.3905917-1-justin.chen@broadcom.com>
 <20250415182826.3905917-2-justin.chen@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250415182826.3905917-2-justin.chen@broadcom.com>

On Tue, Apr 15, 2025 at 11:28:25AM GMT, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> Add devicetree YAML binding for brcmstb bcm74110 mailbox used
> for communicating with a co-processor.
> 
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

