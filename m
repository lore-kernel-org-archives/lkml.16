Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F120F098;
	Mon,  3 Feb 2025 18:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607282; cv=none; b=i/CF/cylkS1O9o2AkmqdSwEYYTxmXprlEa2wVzppF8ifSZc8RJ6sq7tTGuqdOF99unwyY8wSY4Qoom0dgPtNsJg/ITKt6zkN1UvyANxMvL9QJyA89OxUz7PF1/eLLk6P7apgfdKwQN/fcdomVCdSCZNgc2o3xg1aff6VIiK/pfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607282; c=relaxed/simple;
	bh=j6QY1ALFobq2N/DPHsWZlH3iFEMeCCQWmy90WW7dn2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F89VCBHg+BQwLrdHhM3PTVr4To25vcshpyZdo4l2PCpJqYWlNKF4F4KRWzFHHPLIPg+Q/iU40hxM+iftSOlKZzTY963yZO3tjUsZG4nHdAn6ZwBvumzOLop8qP5L/+7sjqTybzBrfMcjtoR2ZMUXqPpcDG6f2+rD2fzf1xKsQ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hnbbm+8d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hnbbm+8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA4EC4CED2;
	Mon,  3 Feb 2025 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607281;
	bh=j6QY1ALFobq2N/DPHsWZlH3iFEMeCCQWmy90WW7dn2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hnbbm+8dCFdJki12PScz0Xj4K8W3cpni97cZY48MKKCvm7A0fXXY/fGXjPsIlTKc7
	 9++SiKYwLFw1xi8l/+HEPpwTh/utHMczHLtONvMwnfV9cjGh7vTxl0EtqDhBbJ30Cb
	 cCzx/Db6rXfU5K07mW/8GAMyoD+XH+5bmFWgN5PphmDOulC5rCk1DgE2PrmckCBGtT
	 dStaGDzsbrNVfjNp9Cd0HirGfgLxMMAJJ8N32JL/yYr4C9GNUR1XomebDo9OSv9ecu
	 zOKEtdvyf1VBzxYtbJMXT1TiKERAT8Q9DTY80s7TIEoYcGohUdkpkbZ1lwNGA5/zGr
	 513x/O4iV5XjQ==
Date: Mon, 3 Feb 2025 12:27:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de,
	conor+dt@kernel.org, praneeth@ti.com, vigneshr@ti.com,
	maarten.lankhorst@linux.intel.com, s-jain1@ti.com, simona@ffwll.ch,
	airlied@gmail.com, dri-devel@lists.freedesktop.org,
	r-donadkar@ti.com, devicetree@vger.kernel.org, j-choudhary@ti.com,
	aradhya.bhatia@linux.dev, linux-kernel@vger.kernel.org,
	h-shenoy@ti.com, krzysztof.kozlowski@linaro.org, krzk+dt@kernel.org,
	jyri.sarha@iki.fi, mripard@kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: ti: Fix compatible for am62a7
 dss
Message-ID: <173860727794.3352453.14301718625197300615.robh@kernel.org>
References: <20250203155431.2174170-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203155431.2174170-1-devarsht@ti.com>


On Mon, 03 Feb 2025 21:24:31 +0530, Devarsh Thakkar wrote:
> Fix incorrect format of compatible string (comma instead of hyphen) for
> TI's AM62A7 SoC.
> 
> s/ti,am62a7,dss/ti,am62a7-dss
> 
> Fixes: 7959ceb767e4 ("dt-bindings: display: ti: Add support for am62a7 dss")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V2: Add Reviewed-by and update commit msg
> ---
>  Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

