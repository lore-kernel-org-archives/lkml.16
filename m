Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DAF2264D1;
	Fri, 27 Jun 2025 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011179; cv=none; b=jFSRBrrwZO3iT2LmUoTICR0d5db+mN2we2dDCiZ/2KbTkmiWeOF7FHGBQSUM7heFCQdz9tqaOcvFB88AwcPym668KF5PXtW7BkmQggmM6kWpoLX6XCAEWedMg9eH0wWr/I7KYTlSMvRk0RQd9bBClgDQyfkzPLdM2o+pr8y3qP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011179; c=relaxed/simple;
	bh=Zzx8+3FSywAV6l3OWPdxRe29JrO5RoOhZts0lquDHbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1o3oUX0zjZMup1TXz+V24NPnamIJf56umFN/fuGtXuhuDYaGUEtNpINqDgAtiUNYOs2XvIhs7m5RlUfVAWxC6X+iWlNVhSkinKobT2h50zCZY4Nbpano7pwzbAHSVEh58jCdSL5fAmvpGSXRJOKsBqtJbxWiHaxadpLrvionsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udd3sxba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udd3sxba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05337C4CEE3;
	Fri, 27 Jun 2025 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751011177;
	bh=Zzx8+3FSywAV6l3OWPdxRe29JrO5RoOhZts0lquDHbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udd3sxbaGmJtaEbUcQ/i7RdF4Nbp5nKZ+E0VjRmbLzYgmTWiFHoi0ccvsBpHtbYp4
	 HkLxIkAdgPltP/L1UYbCO0j9zTjBv4VvzzHqNhyA5T61NN8SYOXh53YcVQUKsvjxwQ
	 PD4aMFznMaJhcDVjlrNd/b7oyntnAv3xU2FBMcPiwXRZv7m7SntWAa+rbwaoZwzvtR
	 K0mXJynTZYI3bMimgqTSgSA1wft6t2ImP+f4+AEskTe8XCEoJyy/5uS2wfwRO5Aag1
	 YcYkOIJqkxK8VS9AbeJ2vTnChKPeeJth9+5V5Q04R/4daPG3kqK6alUXUWIJIA6IIc
	 scNfugciHr2rw==
Date: Fri, 27 Jun 2025 09:59:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/10] dt-bindings: clock: airoha: Document new
 property airoha,chip-scu
Message-ID: <20250627-determined-helpful-rabbit-be2dfe@krzk-bin>
References: <20250617130455.32682-1-ansuelsmth@gmail.com>
 <20250617130455.32682-7-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617130455.32682-7-ansuelsmth@gmail.com>

On Tue, Jun 17, 2025 at 03:04:49PM +0200, Christian Marangi wrote:
> Document new property airoha,chip-scu used on new Airoha SoC to
> reference the Chip SCU syscon node used for PCIe configuration.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/clock/airoha,en7523-scu.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index fe2c5c1baf43..bce77a14c938 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -49,6 +49,11 @@ properties:
>      description: ID of the controller reset line
>      const: 1
>  
> +  airoha,chip-scu:

So the scu has phandle to scu... That's not what we discussed. Your
changelog also is very vague here, no links to previous discussions does
not make reviewing it easier.

You clearly said you have SCU node wich clocks and now you claim you
have here some different device thus you need phandle. This is what your
schema says.

No.

Where is the DTS with COMPLETE picture?

Best regards,
Krzysztof

