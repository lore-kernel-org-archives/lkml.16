Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F99F1F78E3;
	Sun,  2 Feb 2025 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738505513; cv=none; b=k6y4HtRwQunZc06bLIe5F+VG3jEarzGrCCUo/vdRmVhjHoe473hAylB6AezaujXDCoWCHWEATk8as6WB+xE9uuLCyDCWtydrmkAGOqPjt9FYpunin0p4YOeZM8M12iRuw8Lm4H+GL6q+x0083W563NG0Imb7/Jq8oaYkHVlb1bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738505513; c=relaxed/simple;
	bh=GxGKkCq152L+BGstMeNbJkHCsfMZjetej5nLZT8h520=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUTjMckeAEg/NdhxGNlxcBU1hlChuP+ZQqFlT7pxgIILi8NIad90mA8+YZl4urvNyCpTcANyQP0edBhRATk6gkNTy1viW21hQnAbrOTsJa5Bebr+v0jq4/yk6wNrex8ukDZfa0QyXSPP+FDvmL9KOeEMa8k5hQfq8GUNYKJLdZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgLco62D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgLco62D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFCEC4CED1;
	Sun,  2 Feb 2025 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738505513;
	bh=GxGKkCq152L+BGstMeNbJkHCsfMZjetej5nLZT8h520=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgLco62D4r1wZZOUScV62A5HDmmpwGMRm+MxK9WnnA+yUYLbgkFGYyjbDyF5+g5o7
	 3JhgePbqmx3H75O5zu/zbAZY17+96ChGbf40VlgM6IvEUJis/NGXMLLEY4Glkank0w
	 kVpSSTw0rfmasZNbypUcOHexFiBQ7uXe3k1uNDqbvkHTOkp0R4kVonZhMRhHq3BuOJ
	 Mww2v8mqDd3yBglEDkFDAKOzpDCT8bTl+AEN10gJOWHsi40pCIX6wx/iwzXP3tGXT7
	 bkm2ce3tIPCIAY8V2TiU8iMm/i0FKPoVX6xGkr77jLaRY8cNa4txcb6XNw8e7jpzQM
	 /4d/vYL3MJjQw==
Date: Sun, 2 Feb 2025 15:11:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	felipe.balbi@linux.intel.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	johnyoun@synopsys.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, jameswei@google.com, stable@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: snps,dwc3: Add property for imod
Message-ID: <20250202-purring-ambitious-axolotl-4c6ff4@krzk-bin>
References: <20250202035100.31235-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202035100.31235-1-badhri@google.com>

On Sun, Feb 02, 2025 at 03:50:59AM +0000, Badhri Jagan Sridharan wrote:
> This change adds `snps,device-mode-intrpt-mod-interval`

Thank you for your patch. There is something to discuss/improve.

> which allows enabling interrupt moderation through
> snps,dwc3 node.
> 
> `snps,device-mode-intrpt-mod-interval`specifies the
> minimum inter-interrupt interval in 250ns increments
> during device mode operation. A value of 0 disables
> the interrupt throttling logic and interrupts are
> generated immediately if event count becomes non-zero.
> Otherwise, the interrupt is signaled when all of the
> following conditons are met which are, EVNT_HANDLER_BUSY
> is 0, event count is non-zero and at least 250ns increments
> of this value has elapsed since the last time interrupt
> was de-asserted.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Cc: stable@kernel.org
> Fixes: cf40b86b6ef6 ("usb: dwc3: Implement interrupt moderation")

I don't understand what are you fixing here.  Above commit does not
introduce that property.


> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  .../devicetree/bindings/usb/snps,dwc3-common.yaml   | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index c956053fd036..3957f1dac3c4 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -375,6 +375,19 @@ properties:
>      items:
>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
>  
> +  snps,device-mode-intrpt-mod-interval:
> +    description:
> +      Specifies the minimum inter-interrupt interval in 250ns increments

Then use proper property unit suffix.

> +      during device mode operation. A value of 0 disables the interrupt
> +      throttling logic and interrupts are generated immediately if event
> +      count becomes non-zero. Otherwise, the interrupt is signaled when
> +      all of the following conditons are met which are, EVNT_HANDLER_BUSY
> +      is 0, event count is non-zero and at least 250ns increments of this
> +      value has elapsed since the last time interrupt was de-asserted.

Why is this property of a board? Why different boards would wait
different amount of time?

> +    $ref: /schemas/types.yaml#/definitions/uint16

Drop, use proper name suffix.

Best regards,
Krzysztof

