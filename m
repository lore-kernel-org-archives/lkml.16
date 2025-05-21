Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA7023D29A;
	Wed, 21 May 2025 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819649; cv=none; b=A4QjpdLDSjL3CF1677ZXietfZKfTSgF3H6mV5jK72/7Gk72b7f5Lg+BG5SRR6pYz+RxePoiWLv+CtV78yAiV2gdDBKo1GNQZRTsjmOS3xJRfDvd4lyub7uBnSz+X0KmLR+FCH/HQVTz5tDAtg+DgNILekierpGkaVHq0kUlU2kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819649; c=relaxed/simple;
	bh=jpIOQ71B8uL6kn1/azTQ+K9S3vdBIXwX0L0/UC4eifU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpYN1KsmZGUtz406RrvquHOOt2nDDKzEnpHHfvGVlFK8i3nJewECT8TeJKniiWK921sutF5rOCYrFXa9OGLjkJRv1NQ9yMNjPf83dGQUitHRUpEw+QRXtP6h8U1HqBI13J62fTQKNmeEvcdhDsRPLdOajNhedLyDVJYXQqHuFvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cje40TS+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cje40TS+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CD9C4CEE4;
	Wed, 21 May 2025 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747819648;
	bh=jpIOQ71B8uL6kn1/azTQ+K9S3vdBIXwX0L0/UC4eifU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cje40TS+YMTlJJTFCJ5bQLFmAyakrEDBxVUYKSwb+ohK4Xu5k8yHUYBZ2vKf40mwW
	 EE65JdJj72iAmbpGkyYfS2x3No4yiOgJ6Wv4Zf1wsBi2ZnIhClsFjohW9lLS4WYleI
	 bqnpBHozKHrYPYjYNyr8Lnvmc4U2wKT0D1Nf2Anpjuuvz6Nmr9idpiUQ+z9L3bbqXs
	 z9PnO/na4cX/uRqdD8K/775pPxVU4eMkZyspz9eXwBiBZKinAmEkMbxFVKSA6K++0C
	 RbhQ2EhXfCFb43I3NtNbYaIWqmDTr/7kq8AZjXQDk1629VdXto1eQLUB/6PWJAcyBI
	 1i5JT5rsp+ydw==
Date: Wed, 21 May 2025 11:27:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alejandro Enrique <alejandroe1@geotab.com>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gnss: u-blox: add "safeboot-gpios"
 binding
Message-ID: <20250521-qualified-smart-myna-bddfc8@kuoka>
References: <20250514-ubx-safeboot-v1-0-1ae771335356@geotab.com>
 <20250514-ubx-safeboot-v1-1-1ae771335356@geotab.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514-ubx-safeboot-v1-1-1ae771335356@geotab.com>

On Wed, May 14, 2025 at 03:54:41PM GMT, Alejandro Enrique wrote:
> U-Blox M8/M9 chip have a pin to start it in safeboot mode, to be used
> to recover from situations where the flash content has become
> corrupted and needs to be restored. Introduce a binding to support
> this safeboot pin.
> 
> Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> ---
>  Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> index 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..16d922279def99257c194520a7ac820f2a26e9c7 100644
> --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> @@ -32,6 +32,9 @@ properties:
>    reset-gpios:
>      maxItems: 1
>  
> +  safeboot-gpios:
> +    maxItems: 1
> +

You need if:then: disallowing (:false) this for 6m and 8. Move entire allOf down
and add there new if: clause. (see example schema)

>    vcc-supply:
>      description: >
>        Main voltage regulator
> @@ -61,5 +64,6 @@ examples:
>              v-bckp-supply = <&gnss_v_bckp_reg>;
>              vcc-supply = <&gnss_vcc_reg>;
>              reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
> +            safeboot-gpios = <&gpio 2 GPIO_ACTIVE_LOW>;

Thats 8, not 8m?

Best regards,
Krzysztof

