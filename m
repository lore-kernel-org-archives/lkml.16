Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B1D21ADAE;
	Fri, 27 Jun 2025 21:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059240; cv=none; b=D9S35McDGuz6ZtwRopKwBVkZq9N3SVmgUqU6DN1YwXu1tWG5RAPE1XrnOgIpbwfRa1RupRE7um4dmPqtAzBabU9sk5SAhczDtj+6Xm8Etv8/PtcNo+G6xT7LwOgXmPSvi/60O5j+89BUbDSDA4ADqGiVMaJX45oerWg3UDzF1Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059240; c=relaxed/simple;
	bh=4J16U+mJuSFM5IHsFfFhTgaXdQ+EuBLNNii42LozHp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOhd1bjCVmmLDBJFVw/tQLHVnxnBqOZDZa4i3vZWay9P9CuACzDN49Y1tdfTuClaQd1s3PRMWUPGNc33ayaTNtnhp1tsTarYS1mWVMu1Ox4H95WDMvApT2wn2TW09uafv7hlffRIwUP8naAXIwEFbZ4tFbPGPYPK/l1jhCfn5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wf52Y4dH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wf52Y4dH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516DEC4CEE3;
	Fri, 27 Jun 2025 21:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059240;
	bh=4J16U+mJuSFM5IHsFfFhTgaXdQ+EuBLNNii42LozHp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wf52Y4dHyxFBJfkfDoz1mzvZGGkii1Xvc2cJs9k2+fGFPBXQcDlhHTybVbqCI93sS
	 oOJllPgFpQMFxuQuC3cQ1qpCit2+VjXMC1qSH6SJkvONDN7cIkRtandeD2j6sbJ5Ku
	 SjWlQsZsFX+B9lHquH1EcITt6noZLzyZa7uA98rw2hgMZcsNm5Tgip5IDs6oFRZCOG
	 nKo/uRrZZHXjlb/UjUv11ns/TFYhfKzmm5sLETXRnwxeqMQSLkw8aTf6RdYMKlvoE6
	 5WO/gfqxDxsYT2P13F28n0zRs70PQHsOAbqAMDbZVDHw+bZ9ntC3nErEqhsUJCjqah
	 0WUGxhUxYz4eA==
Date: Fri, 27 Jun 2025 16:20:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: John Clark <inindev@gmail.com>
Cc: krzk+dt@kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	heiko@sntech.de
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: rockchip: add FriendlyElec
 NanoPi M5 board
Message-ID: <175105923912.162854.13501826277820249376.robh@kernel.org>
References: <20250626054728.4882-1-inindev@gmail.com>
 <20250626054728.4882-2-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626054728.4882-2-inindev@gmail.com>


On Thu, 26 Jun 2025 01:47:27 -0400, John Clark wrote:
> Add device tree documentation for rk3576-nanopi-m5
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

