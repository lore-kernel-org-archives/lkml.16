Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F3D3C17;
	Wed,  2 Apr 2025 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577347; cv=none; b=PnRVibMR5te2zUASxnVwyDLUsvrqAdK70BvelAjb2+wGGF9tEuZa1JuQW99Sum9E/3Hjl/88BtprwsxVQxqWV/NE0dFIfvuWPhC48OKKA7tkt5bMdR0Mbgk9qFwBjRl1G7/KHJ34rZTZm4AxlrPGnVBZ96+AsdOxyDzSChIOMrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577347; c=relaxed/simple;
	bh=yyALZ4eDYB8PAGvth/fecYYncU0Er7MedCLiK8mFQ1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D12+koWurjQyaZOoCrbONQoa65krJdvm8QFzrIzYjcX9sG7p1R0s6a85bIx8SH8ienjX47mknVKlMqzGjpTG9wX3O5Nrd8FGhF9z2j03auuYQsetCln3WBvH8Pp9kLgCEX/L5GsaMvpWOwXp09DtpBXyWMCD7IQJAGSUqCsfZPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3940BC4CEDD;
	Wed,  2 Apr 2025 07:02:26 +0000 (UTC)
Date: Wed, 2 Apr 2025 09:02:23 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	thomas.fossati@linaro.org, Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com, S32@nxp.com, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: Add NXP System Timer Module
Message-ID: <20250402-omniscient-quick-gibbon-bcea3a@krzk-bin>
References: <20250401224644.3389181-1-daniel.lezcano@linaro.org>
 <20250401224644.3389181-2-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401224644.3389181-2-daniel.lezcano@linaro.org>

On Wed, Apr 02, 2025 at 12:46:41AM +0200, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/timer/nxp,s32g2-stm.yaml         | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

