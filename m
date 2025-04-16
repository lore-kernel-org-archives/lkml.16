Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDF41B415F;
	Wed, 16 Apr 2025 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822354; cv=none; b=ig9ugrKxgKDcl+J8ndHbUjt7Z4X91FyA/YALzHQ8z8FSTEUzNxwrpSszqFzjEun8/hSEEXvR9160H76koNGwKS5cAKoAImY6raYv4mgVBrJnOLAY8bVvc5/JWvX9lV+0t2XvIxxN7PAAVODgAmuxK+NQN/tFNa+Av9AkTfmjVQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822354; c=relaxed/simple;
	bh=IdK2+5qGsdGM3SO0IxHfMg481X+Kuem/Une0Z8qbCYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfTeARWNaJSvRxKDRrgHsSETeQjgg3gqq9EzaIm00ydUqhRXSF9bq+/W96JPU/3N7OMZqdE9nbqXNamL0uZYYxAuDAn6NboUkR/eZvKZV6EWPq0i9HQ0j4EPzEwVvns4d6a4uqhAVxBxG4qYG8qrl2gFNa6+99WHZ2Md4nTqBM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWy3iDmi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWy3iDmi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206F0C4CEE2;
	Wed, 16 Apr 2025 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744822354;
	bh=IdK2+5qGsdGM3SO0IxHfMg481X+Kuem/Une0Z8qbCYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kWy3iDmi5zxRVqVY1CSrvNB+TjWKOGlPqwMfwWak+L2NEqK6fvp9vxuZT4+v0sPER
	 ZursCOt15TYcH+xEUdbfLFfQo0OG1jt1zEHNIYRDgIJ9wmD3Qns/BaprJphgRj8n/q
	 qJAfKteYISoQQex2rc/wYOhTZxvKl/vg1wT9xmc1nZMMaeOSIRF5G3jSFOqfOZyg/C
	 msJ1KlAkEW1+QL+ay1gjs8qFIKdwiD932NN/5mOVYwMtwBlsyi3WZm2WIPlXXMjTe+
	 gCrq0Q6c1VVe/olfv/jhKJ7/bXAu8Xd2b5gsps5t/R4u6EaePGeThcb3DcFC8G7QF9
	 8VkCXVsRhKxww==
Date: Wed, 16 Apr 2025 11:52:32 -0500
From: Rob Herring <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: Introduce usb-hub.yaml
Message-ID: <20250416165232.GA3327258-robh@kernel.org>
References: <20250415094227.3629916-1-treapking@chromium.org>
 <20250415094227.3629916-2-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415094227.3629916-2-treapking@chromium.org>

On Tue, Apr 15, 2025 at 05:41:58PM +0800, Pin-yen Lin wrote:
> Introduce a general USB hub binding that describes downstream ports
> and hard wired USB devices for on-board USB hubs.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v2:
> - New in v2
> 
>  .../devicetree/bindings/usb/usb-hub.yaml      | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-hub.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-hub.yaml b/Documentation/devicetree/bindings/usb/usb-hub.yaml
> new file mode 100644
> index 00000000000000..34cd248fa43c2d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb-hub.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/usb-hub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic USB Hub
> +
> +maintainers:
> +  - Pin-yen Lin <treapking@chromium.org>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  compatible: true
> +
> +  reg: true

Drop these 2, already covered by usb-device.yaml.

> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

Drop this, already covered by usb-device.yaml.

> +
> +  peer-hub:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the peer hub on the controller.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      The downstream facing USB ports
> +
> +    patternProperties:
> +      "^port@[1-9]$":

Only 9 ports possible? Should be '^port@[1-9a-f][0-9a-f]*$'

> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +patternProperties:
> +  '^.*@[1-9]$':
> +    description: The hard wired USB devices
> +    type: object
> +    $ref: /schemas/usb/usb-device.yaml
> +    additionalProperties: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    usb {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        /* 2.0 hub on port 1 */
> +        hub_2_0: hub@1 {
> +            compatible = "usb123,4567";
> +            reg = <1>;
> +            peer-hub = <&hub_3_0>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            /* USB 2.0 device on port 5 */
> +            device@5 {
> +                reg = <5>;
> +                compatible = "usb765,4321";
> +            };
> +        };
> +
> +        /* 3.0 hub on port 2 */
> +        hub_3_0: hub@2 {
> +            compatible = "usb123,abcd";
> +            reg = <2>;
> +            peer-hub = <&hub_2_0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                /* Type-A connector on port 3 */
> +                port@3 {
> +                    reg = <3>;
> +                    endpoint {
> +                        remote-endpoint = <&usb_a0_ss>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.49.0.777.g153de2bbd5-goog
> 
