Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D7C204859;
	Thu, 10 Apr 2025 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277227; cv=none; b=CvcdGq72wFl6O5o9V+PkBoTMo8FFVtsnOix1d3sy8bArXlRuoCpSLmH4FNjciH4DRK3CjeyVkd9r7EqGnYn5Ll/8nSifSvHUqKVO2KjSPFkhffgy17WxM3X61MG3TNEiXMkSzuvZ/hXhTscCNd+UEiqNU9lPh5uhnid9sn/ln5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277227; c=relaxed/simple;
	bh=KspGeLOPCiTHid+2kSxIjeK1u5cGf2Od+QXXtZqsIh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSA8c+FBIH73PjWegCcVaEtqIlJhFrvwTO9R7fguhX0NYi0dTMpglr7CLCdJCES+u5FioYKQdZ3TeQzY7pPqWtCw8JQslma+gk1y6aqV7RdP3eB6a/ETvcq4azqajQQwWjnM49JTRYG4BFwBpMxA9AdhnXltdmCnYaCgqH7pnCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocSI26iM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocSI26iM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B9EC4CEDD;
	Thu, 10 Apr 2025 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744277226;
	bh=KspGeLOPCiTHid+2kSxIjeK1u5cGf2Od+QXXtZqsIh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ocSI26iMU7FdNcrINygQcY7Lcn+vq/yI7C5/UVXKVcI7Q/btHJHf5E4cn/BHo4Yzo
	 mlUjxMKeLTGtqhPFynDu16aJJi4NhBGY/Kz7FxMuEj9vnGVFdEOhkBAlowSKcgKe5I
	 XmmbceVnFkaqjzbON6krUSN/KevxV8ZT4kg8pTzdyik8Ms8HSOTb5HpG5J8GCmcX2l
	 gUw0GU+doh46JotLv+MgBhg7q3yiubjjoVcHBdSjS0Kt5wR36ugc0aKElSWr7CxY+9
	 m+N1J1gUNkP6w8larc8lD2ZwSCMrEtsLWKcJ8GMGTv0zykk28eKsVWOinEbYaFC4ms
	 to5vrzXbFKbig==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u2oBh-000000006Sq-3JDM;
	Thu, 10 Apr 2025 11:27:10 +0200
Date: Thu, 10 Apr 2025 11:27:09 +0200
From: Johan Hovold <johan@kernel.org>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: x1e80100-hp-x14: remove PS8830
 retimer 1 definitions
Message-ID: <Z_eO7RUI4c7NXt22@hovoldconsulting.com>
References: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
 <20250410-hp-x14-v1-2-b4e5ca253ec9@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-hp-x14-v1-2-b4e5ca253ec9@oldschoolsolutions.biz>

On Thu, Apr 10, 2025 at 11:13:23AM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Clean-up of regulators, i2c definition, pinctrl
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

I already sent a patch removing the bogus retimer here (you were CCed):

	https://lore.kernel.org/lkml/20250328084154.16759-1-johan+linaro@kernel.org/

I suggest you rebase this series on that one and mention the dependency
in the cover letter.

Similarly, Juerg already sent a patch enabling the repeaters here:

	https://lore.kernel.org/r/20250319160509.1812805-1-juerg.haefliger@canonical.com

so you can drop your 5/5 as well.

Johan
