Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877A6166F32;
	Tue,  4 Feb 2025 16:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688114; cv=none; b=OxdWsG3o6RKzic7m28FcG8VZlahcDcNhXqpycvYtGVDZU4+z/VYBc61JWrKadbfdQERNk3ku4KDXbsH/zTMRM77wCUJNvPIxBPiFLyYrxCuk9IxOfyM+pIjhjiuiS/nYhIlyYLe/7z5tniXWTs0sySo5eif1CkVBe/HtxJW/P00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688114; c=relaxed/simple;
	bh=to453eG66/g4wMF0GNH9a3wSQdt12Y1VV0wXWJSv8Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CITHciZbbpuKyupJWLq4obTjWY62jKA48FvWNbxeSUyrymcgcEX+AYraaWp9E8JMQ9e5/0EUYln3vb8JhPEZKWSRXFIpcHSv5P/6hz8geiG0K+XLsXS4U5ACvXRZdXyQG27MKrNFmeEtO7KsaV3FuMrwbxXwUve3X4zItx4WRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8tnrL7N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8tnrL7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9015C4CEDF;
	Tue,  4 Feb 2025 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738688113;
	bh=to453eG66/g4wMF0GNH9a3wSQdt12Y1VV0wXWJSv8Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8tnrL7NHhVsuCb2kK0mIAUXpnCK+H1H4pCOoawCvTyPA/BmfFA9pRKfw2WQjg7Rt
	 dR9Fyrn+CaglAPeDCfw2JUAZjLxqKUUsw+c8iIstOzWfe+OOuq5spjU+HQavvJdhrM
	 rFogwdcFIioZmuXRTwWtjHLxhq4Zm43G1cMjc6PXXSqlTlstcDLDfT9NcvTF156Anr
	 QgTv4pBdruoHj6H9b4DyTrMvqOnKM1RoJTYkXyOB2FWc/C/ErL3jamj/hUAjT0+xcC
	 WtMsZly0taeu5ltFBGSB/u8x8s7exgjE+wW6cisjGlQuenhkuxTph82CfO9VkXeOG8
	 wQcXdJnlzoUbg==
Date: Tue, 4 Feb 2025 10:55:12 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] dt-bindings: nvmem: qcom,qfprom: Add SAR2130P
 compatible
Message-ID: <20250204165512.GA3000561-robh@kernel.org>
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
 <20250109-sar2130p-nvmem-v4-5-633739fe5f11@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-sar2130p-nvmem-v4-5-633739fe5f11@linaro.org>

On Thu, Jan 09, 2025 at 06:35:49AM +0200, Dmitry Baryshkov wrote:
> Document compatible for the QFPROM on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

As the user in the .dts is already upstream, I've applied this.

Rob

