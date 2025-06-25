Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA583288CB7;
	Wed, 25 Jun 2025 09:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843637; cv=none; b=FYT9Uw/WSjFAmh9y07JQJQ+XQkv2oNQZV01ugTdo+V+kguComFvyh/TWS4nQwQgZ/oXWoaQTkJxDPBSBV61EUxVNLMU+A/Rntu7iRQsZkwhqiIExr2Kyy9mpMe4HOJ5Il1ESbMiop8ncodnhSmEB0h37Zt9rj6rQbijR0NhwenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843637; c=relaxed/simple;
	bh=XRnNww//X5J02dP5ThrCcag3NVw7SmLrpmju688Ughk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U2SJBQ/WxirU7uD5Z2UzRL1uw2wZxNFN5VYOZKgrJ4mSRGBIK1+GpekD3gO+Pi7O8LVStn9Dn6e55ExNZllKpf7mpNv2vbceTm8QWbvCUrSHOcfptKFEq1F6ZoJ9sNzvUk+GIiqTHH8OkMmYooRGLPDr3x+0cXnPVCVZ4a6KJuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z81UCCBR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z81UCCBR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBEBC4CEEA;
	Wed, 25 Jun 2025 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750843635;
	bh=XRnNww//X5J02dP5ThrCcag3NVw7SmLrpmju688Ughk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z81UCCBRBo9eSwA5hLdYurz5tnymKpQCfbzR4uY+hMsqhjNgXAZG95kSR23E7bWD+
	 zcF0rlBvWlvnVMsu1tpYersWzQGAlJfR5yK8A20AWunGRGGW5xqO/Xg5LYJ+gLRm8X
	 /EAvyIypI3I5q+4hecxs0E87nljEo9OYXvUEW76qoDGeJAEuMzi3N2B9RCUj/rno6e
	 xrcMv36xcfrsPa2lPJE0Ux7XSzj3FYVj3KN3FbApn7Bmuy7rca2RiFxczt08RyCs/z
	 6MxkpCx6Z932UQntA1Fiaz+D/63j+5R6ypfv0zsIxHFirdZLyB9vZ0kPW5wKW9z8jY
	 y9JQFGW56UeKg==
From: Lee Jones <lee@kernel.org>
To: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, lee@kernel.org, gregkh@linuxfoundation.org, 
 frank.li@nxp.com
In-Reply-To: <20250620022537.3072877-1-victor.liu@nxp.com>
References: <20250620022537.3072877-1-victor.liu@nxp.com>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: fsl,imx8qxp-csr: Remove
 binding documentation
Message-Id: <175084363241.4091583.2132416555571651732.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 10:27:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Fri, 20 Jun 2025 10:25:37 +0800, Liu Ying wrote:
> commit b0a5cde57cf1 ("dt-bindings: mfd: Explain lack of child dependency
> in simple-mfd") pointed out that it's a mistake for a child device of
> a simple MFD device to depend on the simple MFD device's clock resources.
> fsl,imx8qxp-csr.yaml happens to make that mistake.  To fix that, remove
> fsl,imx8qxp-csr.yaml and use "simple-pm-bus" and "syscon" as the CSR node's
> compatible strings in the examples of fsl,imx8qxp-pixel-link-msi-bus.yaml
> to replace the wrong compatible strings which include "simple-mfd" and
> "fsl,imx8qxp-mipi-lvds-csr".  Since fsl,imx8qxp-pixel-link-msi-bus.yaml
> as the last user of the CSR compatible strings no longer uses them, it's
> safe to remove the fsl,imx8qxp-csr.yaml binding documentation.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: fsl,imx8qxp-csr: Remove binding documentation
      commit: 28c5e6cc6f5d823199798574e2db0ecf22aa6aaa

--
Lee Jones [李琼斯]

