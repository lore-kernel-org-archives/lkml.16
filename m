Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F064A932;
	Wed, 18 Jun 2025 03:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216598; cv=none; b=iHGm7pNoj7voDOk6OTx1mhzX7cY5rTtW37EaHB3ystety26f7yScO4gkyks3MKven1sPFmAcr1aF5X0KpSAdA6LPCd8sayNBMyBqpWKLpasIlpCXC+NXh4x9Q4Fd3+6oZEM1m+a6NwLqQB+Dw6f21pm+AwCW6IyNQpaOxV44VG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216598; c=relaxed/simple;
	bh=mO4bX51LKNX5EEgsyUopGw0LWqy2fcUXFuyIbTyu3AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWFyT15C1zP4c750GLYdP8Opg7s4VphehUrf/g1ukq6uC2YSUFPgDQR9AN2vB5OKhyHjFYkJqRey95d8VQEUCif0fpS+M2XBvjUq5hhKBwnkU/cXroC7rcWmNYck/LJc+t0GznckfLq3+sz6MKN9uFcQ7eUBXrUi4v4w9csOVbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=seo0w3q3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="seo0w3q3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD01C4CEE3;
	Wed, 18 Jun 2025 03:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750216598;
	bh=mO4bX51LKNX5EEgsyUopGw0LWqy2fcUXFuyIbTyu3AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=seo0w3q3u3UK6Ruz4gJ28sl0+l/YBW10C0wfIiQS6ojTYQKZWSnWAT/hGxJVJcI6e
	 fDS7a4XUb0bKww9sJ2lbuW1rE8jpvO6i4g6qPk9IlBYKmj98OuHNwzH8UmLc+QL/zT
	 /h4d1DDD391oKdNVzqAUuqvDYeWaERSNiIX0o1ky2IL8bv0AqDORfs2/nH/mvTQ+sH
	 tJdaqcuaU/bCphKwyWg6wjTnxOCePSE00+V6GV6XZ1sgreRCEHaQA20DLygq2JOccV
	 63aH+XSdtbnbcA41jbS+K5BKc4ZhSKcUZdRTgBzfT9W7SE5+AgR9XR7TvT6miVbPLE
	 P6idJjoInMDPQ==
Date: Tue, 17 Jun 2025 22:16:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] dt-bindings: arm: Add qcom,qmi-id for remote etm
Message-ID: <ugxijerhh5yfgpvmuaatvenh7yrk5uoiracfp7xknsxrb73dcl@hwsatze4rjuq>
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-4-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424115854.2328190-4-quic_jinlmao@quicinc.com>

On Thu, Apr 24, 2025 at 04:58:52AM -0700, Mao Jinlong wrote:
> qcom,qmi-id is required for remote etm driver to find the remote
> subsystem connection. It is the instance id used by qmi API to
> communicate with remote processor.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> index 4fd5752978cd..947fe33738a3 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> @@ -20,6 +20,13 @@ properties:
>    compatible:
>      const: qcom,coresight-remote-etm
>  
> +  qcom,qmi-id:

Why isn't this "qcom,qmi-instance-id" if that's what it represents?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This id is used by qmi API to communicate with remote processor for
> +      enabling and disabling remote etm. Each processor has its unique instance
> +      id.

DeviceTree describes the hardware and firmware interface, so don't
describe properties in terms of what Linux will do with this value, but
what it represents.

> +
>    out-ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      additionalProperties: false
> @@ -32,6 +39,7 @@ properties:
>  required:
>    - compatible
>    - out-ports
> +  - qcom,qmi-id

How can this suddenly be required, did devices described by this binding
up until this point not work?

If this is the case, make sure to clearly describe this in the commit
message.

Regards,
Bjorn

>  
>  additionalProperties: false
>  
> @@ -40,6 +48,8 @@ examples:
>      etm {
>          compatible = "qcom,coresight-remote-etm";
>  
> +        qcom,qmi-id = <2>;
> +
>          out-ports {
>              port {
>                  modem_etm0_out_funnel_modem: endpoint {
> -- 
> 2.25.1
> 
