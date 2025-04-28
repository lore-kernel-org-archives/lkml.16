Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053DDBE67;
	Mon, 28 Apr 2025 07:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824692; cv=none; b=YBrpTY4j1kr9UlgAS/oCUNdpGbrFbzfcF0Mrd888bmpLTwh4zg9nfknJ8wRtrSWba6/UPPWdt184UqoolhxO4RD4LYUJKLzrY1o/FV7quh5Q9t5UcyJvo03tDDd5ItS0+ge592q/pc99JqT8+U7DLHZ1s24kxqz8oST7RjMOx4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824692; c=relaxed/simple;
	bh=/0xPqEi4eGB7ZunkNZvmwTimsz0kANTHGgLoKeMuoqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8vawX6OHU0DmUNw5rqnebyuJxmJjbvtS1ZyNAwzbjeCXcUwph2TV9uEvjNMV0VHWgfspCuWBg3zZm8Zhf07n5vT7FFCv8gx6z3JtorS4Tt9nk9biAL0R7ljX/fqEMV3YKdXR/yV5bK5kB96UuZrzPnNoHMR7KyqnTFet/SkPDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwTJQr9y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwTJQr9y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8874C4CEE4;
	Mon, 28 Apr 2025 07:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745824691;
	bh=/0xPqEi4eGB7ZunkNZvmwTimsz0kANTHGgLoKeMuoqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rwTJQr9y96C4JJI8SsaD3r2Oo+hM+AZaPvjhjKbfHV6aiFs+V7TSR/10eiXqUHDKI
	 ycX5ZC8uWeCbSf2VlQ3jOb/9UfGPSNjB3j9S2ukYb3jtGTo6mjogkvXQ0vLzWq4aYU
	 Vhg8PnkG9Fb4GEjyzq812JAfZKWGZeDojY8RdPaJ2s3dhwmHSSU4EVHIA+eZrgGN9x
	 FRxLZcAV8wXlecHWk4wRxPLQmiZQRyeaOhl0hbxWa4TvWKd8k4fHMEd+q5kSl3Xmnn
	 W3+umR7NY0uYJN8Hjjf8R36L0cPcWqjLY7Fd8Y5FPHRqF16nNFqifCsXox5MoDCkuJ
	 7B3GrmOnBesKQ==
Date: Mon, 28 Apr 2025 09:18:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: fsl: convert fsl,vf610-mscm-ir.txt
 to yaml format
Message-ID: <20250428-sticky-thistle-booby-fab337@kuoka>
References: <20250424030305.3868637-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424030305.3868637-1-Frank.Li@nxp.com>

On Wed, Apr 23, 2025 at 11:03:03PM GMT, Frank Li wrote:
> Convert fsl,vf610-mscm-ir.txt to yaml format.
> 
> Additional changes:
> - remove label at example dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

