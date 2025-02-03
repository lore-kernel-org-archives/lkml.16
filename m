Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95442B2D7;
	Mon,  3 Feb 2025 23:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738623663; cv=none; b=Ixj99vlWhW67fHSs+FSOJLNM/ps98XoVpNtJyVKmlmwBDQNNim3RO7yCj6VyjRGIOGIkSU9xb4JVqVRjoDqOiHzZHpxiUjqU59Tgo5SxCMf0ceQIIWBry2IZs/uWGooME9WV+X5RyzoOg2oUptmF1BHjqHEQA2Hpwp3s74xEt5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738623663; c=relaxed/simple;
	bh=SYLHmixviQoIpESsL58YplO1Ev5dZ26Prpu2dtnbuok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhYpoEq5RL516zlu36bSuaLRxUtGXs1AhDRZwDU5w7gGdMu+L/UNNGEla2zV7kCt2EUoW8/GQM81HWsytNpZFrBIb9AymTYf5FNPMELo+nVNz3cUIJ0md5567QQjhubXFC3hzpc9T8Bhdof8f138ocYCVPyu1t+hzLm1aNsG1J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jq3YEzbM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jq3YEzbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E9EC4CEE0;
	Mon,  3 Feb 2025 23:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738623663;
	bh=SYLHmixviQoIpESsL58YplO1Ev5dZ26Prpu2dtnbuok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jq3YEzbM5g1Jc+vUThYy5+MzRuB3bVDl2bV+KXfIhcBq1SqkHDVZR9uF0PSR7edhq
	 OK1TgAxRSETSpJzFvxPYOl+oP1HA832d0+fnt3JI8B28hmqSm7pEj2Bo9UF/0q+ffB
	 0LaiQCs9mwJe1NjKFNZTIOGLJ9PWJdvCiHlVBXn9cHEkoWTWyb4jX8dVaz3X7JE8ND
	 1AsIJGnFPLRDUAdcKEytwK/kuThZp/5uartgvC+gZhFCFXIk24+Nhmpw5eJNIYc151
	 DRJcf/MRWOWVmFN4UsWAxVEQNn/yXhie7sRS+ugRGHEtyaGZRKDnj1kTcNDug3lIPg
	 4Vf8O/WXy2GCw==
Date: Mon, 3 Feb 2025 17:01:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Quan Nguyen <quan@os.amperecomputing.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>,
	openipmi-developer@lists.sourceforge.net,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Corey Minyard <corey@minyard.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] bindings: ipmi: ssif-bmc: Add property to adjust
 response timeout
Message-ID: <173862366090.502195.2408290922979845637.robh@kernel.org>
References: <20250203-ssif-response-timeout-ms-v1-0-6fe279740181@gmail.com>
 <20250203-ssif-response-timeout-ms-v1-1-6fe279740181@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-ssif-response-timeout-ms-v1-1-6fe279740181@gmail.com>


On Mon, 03 Feb 2025 21:09:13 +0800, Potin Lai wrote:
> The SSIF response is handled by a userspace application, which may exceed
> the default 500 ms timeout when the BMC or application is under heavy load.
> 
> Add a new device tree property, `timeout-ms`, allowing platforms to adjust
> the response timeout based on their specific requirements. This helps
> prevent timeouts in scenarios where longer processing times are expected.
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

