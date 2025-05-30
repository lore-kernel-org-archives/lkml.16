Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB79221277
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597506; cv=none; b=OvngwBkZtECJsC2Q0TXkDpyeteN2iYhBNvi8PQ0cZ8PbmigsCDM58GT8lmyySxB9hrCWU3DyeTycq80uleRsAnpXvCLaN2OFHbxCyEBcDDVEYLQj3jPAHVHdtg29wRv54Z/HATUie78c3ZLzIWe0WCVPcsJG6DERU+9OXzqP/gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597506; c=relaxed/simple;
	bh=zjDdMcJo7Ja3I/WBhXEJPi7Vf8GGUIfVIusJmH+sQRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JO3Scn60DQJG+epi51OQjHNL/HRJrrRQ0ijv/POTsmPh4eeq1HCh0QSMxvh7ZJoH5jxzS80VqWwgv0K7b8CHb5mNFm4lwlkNJ/1+kCLqLh9e6h1YqlJijqb6lPcvXMmt69hDQyrExSxwMfkkNOCBWj1cxZ+Cc/SRuqH6iehW+ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7G9f4sB; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7G9f4sB"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e75668006b9so1673881276.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748597503; x=1749202303; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nl25XztXyY+91TCe2znVYLQyRFe3A02EIrzJh6x7GCo=;
        b=a7G9f4sBEY/YGgHiyzGfQtcl5WwSScKP5t262cYRu4yvgwRWO9SoLXiW9BrGywzoYP
         en2jB2ZZrJLDZXKGRBwjZKU2IzeMHq2Q2B/cdLNOS/g5z6WwCzJSBHmEXzF6F7gQcJAD
         qJvCEjWHh++ezR3sYbYR2h9+7UgMUgX0E2UXBJtvH52TziCwzxe/iYQ7PqWg/kJPHtn7
         WklZyDsFHsyOKXYknJx1Oa6RhetNNgCw0ZN4IjkRiw1MJUQsTDKtuLSakphPQ0em8wfi
         XfUfHrbAPLNhkEAldnqqsuDHaXRSV40TjZJops9Kgcb7Y6yfi/H6DTsOYZJYcKvgAMty
         2t1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597503; x=1749202303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nl25XztXyY+91TCe2znVYLQyRFe3A02EIrzJh6x7GCo=;
        b=bWs+5cSm+drV8N0GUT8+xrOUlUBN4vXffswxIb6WsEAQ1YoyKNIK4UG5BdjGVH5OJp
         6OM2zHY9iG3WsJ77ivgo9bjXohb7m/6CO+HmUG1QDK9AD+3/I3OB6t5c8d6iOEE/zisq
         H0nmt/1dVQxaK1r/+gCulFunapMBmPVJePh7hI1TxwMGxjAxn7ELbfO4adXgEz9vO4qR
         2Ee+oo8AtYbyBaouW28YQv4c533CvrOHzVpZy5/le2sk4awnHRBu/MJ2AFegmRSbFFqq
         u94w2s+ILeRK8aD0CEczaNfcxpo+MED9QKt0InJix0Xq/Xe234b3qD2NG6i34So1xkcD
         eY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgtJ9jbKU5PbquVQJVVMzNytpVF61D6bLoQYMW/rPFu1ZsRn/bW+dLQpxB80Up4Xzc4aVaFhB8YD/ctno=@vger.kernel.org
X-Gm-Message-State: AOJu0YygsUMF49RXZwkXGnBDZGImybrSJYGq5Kq9WlkOpIRpdVm+Mq77
	W2MiuR4F9AQR2f2OWRadeN00wqt1+apQPb9DASNr2sC5z6FsFHsyskbdX6Kldga/QFjh+WTx7Q+
	BFdcWrlzDxEDBzIMiFIhVR36IKbIgAHCrmcdacuhoTQ==
X-Gm-Gg: ASbGncsMkNLS3962e/j4SQlPzkE4Kh0V1rPRZSlju23TQKCSZuqSfsoAusEz5Zd7EXL
	xuxRykW75TNooWJWhyVH9HDpMIm8lhtOZoi9eS5QaPEefkLUV0buTbwwsNnxxP+6GUZ4YR8Qw04
	4SUF+/dY4MdX7XEfbnLtAQ5f9c5t7EOhDjWMQ9Av28H+dRI3TYbRUmakc=
X-Google-Smtp-Source: AGHT+IH95Myawh7TbubfOpFEx22AdElqILjS1RFSDs37pv1ARTzzSoQyHKeRwabQyQ3x8Rz9anZLL/Bb5eyOoF6wyYc=
X-Received: by 2002:a05:6902:20c7:b0:e7d:c9f4:952b with SMTP id
 3f1490d57ef6-e7f81de0626mr3793584276.16.1748597503389; Fri, 30 May 2025
 02:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-pmdomain-hierarchy-onecell-v2-0-7885ae45e59c@baylibre.com>
 <20250528-pmdomain-hierarchy-onecell-v2-1-7885ae45e59c@baylibre.com>
In-Reply-To: <20250528-pmdomain-hierarchy-onecell-v2-1-7885ae45e59c@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 30 May 2025 11:31:07 +0200
X-Gm-Features: AX0GCFsDY9QpXv-TDLaqMDwAZXQiaP-2ORBs2bXkP6yJWXm02HY-f6aS5ywCE0Y
Message-ID: <CAPDyKFqs=EuwzBodoh9-tnuDQP85bv3UnS5eoekCpjUbictfBQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/2] dt-bindings: power: add nexus map for power-domains
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 May 2025 at 23:59, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Add support for nexus map to be able to support hierarchical power
> domains for providers with #power-domain-cells > 0.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  Documentation/devicetree/bindings/power/power-domain.yaml | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
> index 8fdb529d560b..9f099d326aee 100644
> --- a/Documentation/devicetree/bindings/power/power-domain.yaml
> +++ b/Documentation/devicetree/bindings/power/power-domain.yaml
> @@ -68,6 +68,15 @@ properties:
>        by the given provider should be subdomains of the domain specified
>        by this binding.
>
> +  power-domains-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Nexus node mapping property that establishes parent-child relationships
> +      for PM domains using the format defined in the Device Tree specification
> +      section 2.5.1. Each map entry consists of child domain specifier,
> +      parent phandle, and optional parent specifier arguments. This property
> +      is only supported for onecell providers (#power-domain-cells = 1).
> +
>  required:
>    - "#power-domain-cells"
>
> @@ -133,3 +142,29 @@ examples:
>              min-residency-us = <7000>;
>          };
>      };
> +
> +  - |
> +    // Example using power-domains-map for Nexus mapping
> +    main_pd: power-controller@12370000 {
> +        compatible = "foo,power-controller";
> +        reg = <0x12370000 0x1000>;
> +        #power-domain-cells = <0>;
> +    };
> +
> +    wkup_pd: power-controller@12380000 {
> +        compatible = "foo,power-controller";
> +        reg = <0x12380000 0x1000>;
> +        #power-domain-cells = <0>;
> +    };
> +
> +    scmi_pds protocol@11 {
> +        compatible = "arm,scmi-power-domain";
> +        reg = <0x11>;
> +        #power-domain-cells = <1>;
> +        power-domains-map = <15 &main_pd>,
> +                            <19 &wkup_pd>;
> +    };
> +
> +    // In this example using Nexus node mapping:
> +    // - Child domain 15 (scmi_pds 15) becomes a subdomain of main_pd
> +    // - Child domain 19 (scmi_pds 19) becomes a subdomain of wkup_pd
>
> --
> 2.49.0
>
