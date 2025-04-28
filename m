Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E2C211A3D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883964; cv=none; b=BYsLEvSkOjlh6MbJ8WLjr3m7jx+xmLdFx5GPi50XiLL9v8gxrn0r2wxvb1AVY9AsrFAECYJKB+dcep9k1F2o9Ck1pSYej/BbajYY6e0psokQBD97iJlxS+RAeZcB0g1oIEUOrRdp4yUleCloLZFpcpYraO6xJ0ei1u1NFrzhync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883964; c=relaxed/simple;
	bh=by91SW8m0U7AG3e8tvW7sekaz3lZRJOY/esWgdxCMJM=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQrh0izVK0JwaqxZqnWYp7Xy0J3Rfc+AM3EuzHMefgK5QT9UTSHA8k498PZfvDKVkULNDNx3Qr2ejLPL9+fQc4l5CFwi+us8h6CedoiezvqM3Nr8BXC6BqHeRjJ/2mlxUeuztScIcXtuA0VsaU52jCEoDpeErxigeSVQV720LPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FUDiRG1l; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FUDiRG1l"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8fc176825so48316126d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745883961; x=1746488761; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VE8Je+jYUaDWSmFxs8ADixhFpj6cC8hZZDrQSJNeCU=;
        b=FUDiRG1lo4/H91J1D8aDQihTEgARVJGqF7zohvZZW1KquyaU/yMAp0KXM7IRHfRrK2
         65Vx5HIc+SSpWeWh1osws/xAHIIhGu+c4jfqjKTZkZntKm6KqUFj6BnTbLLad8v910FA
         isHK0uX+2tc6F/uF0Qbw7tH2L6IjcaZn1SVPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745883961; x=1746488761;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VE8Je+jYUaDWSmFxs8ADixhFpj6cC8hZZDrQSJNeCU=;
        b=fcF40fAI/JKZh4La9jNW6WSbbeKQJwicXK2mlzQ5vsnH92bv1xew8QtAuAK1fmKBOe
         QVQqEWMwHJ2C973UFakYWcJ+yo2yr1BEuwR5b/nioWSD6Wi75urkdu2ApNGSu+jHhegQ
         Fh1o2cJ/y8qzKu+RZuWlHfJUVd2bkc0Nncs4Q1FNQHfP3AWZdtKYmy3zW5vOlCQPA5Om
         Y9kxLMtXmxrnVmctF0YaZ0eaW+Vcox8Pv3FlIwTSxZL8paUS02q2+buGN2tDzQGNiZQn
         vJxYafnVV8LClyuZAM/EnJ/8bUDAYsd3hAbt5PzilMsO7QijShCNYMce+K4AIF+/x09m
         uAtw==
X-Forwarded-Encrypted: i=1; AJvYcCXqxYzNve+eRlgr/94nfboq7ChT3so9pAZsocCqkeqS//0uZKfWIKN6cl6q3jkSVP6HZddVuk4lO+EE7Co=@vger.kernel.org
X-Gm-Message-State: AOJu0YynbKq7F7IgfWH677ZKD41CHF835gpilUBznZouJOw0lGphb7Bz
	v/KnlTENiVEyHQzOx7poG80NJsyReXFV2cpNU1AgHxYTfQLvUH44EoSOe7GEKjZlCIpHEYzozPo
	W8weImjYsjl7EO7io1uFvvicpbLuakioUZ1HH
X-Gm-Gg: ASbGncsT7AoWZijS3Hu0Qmhe9oGT3dCquqgGCtUysvXf24rFpfoW+6Cga5TR2hWYPQ4
	453FzBJL6W8CYgXWSf07BlJLSnQadqF7sGxDl5638tVv8oZ4NKDlQs5eXbrTJgf9s9oZaVeP58/
	OtsRbb4pc9+fbFcJtVJMVa4bOEGQN1FCpZG1ngFwcX2Zex9m+yXQ==
X-Google-Smtp-Source: AGHT+IFT3g0BYPOptg37k21ZoiyICUp9dUnCNnXOjhOeBejDgO2ZHYly94hoOyehQ8LteVC6kVaQQcW7F1AvS61YrSk=
X-Received: by 2002:ad4:5ccc:0:b0:6d8:ada3:26c9 with SMTP id
 6a1803df08f44-6f4f1ba925amr20159256d6.10.1745883961685; Mon, 28 Apr 2025
 16:46:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:45:59 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:45:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250422082957.2058229-4-treapking@chromium.org>
References: <20250422082957.2058229-1-treapking@chromium.org> <20250422082957.2058229-4-treapking@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Mon, 28 Apr 2025 16:45:59 -0700
X-Gm-Features: ATxdqUGhJ84Msn7xBIME_dKVHCYNJ-hlMGgL-TiHFD5bx9lm_Zsl3wWl5GrA3mA
Message-ID: <CAE-0n52cwBxJ3gYzSi1+nNcRRSgbMToYBFLJwdVWSMOxBmUN1A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
To: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Pin-yen Lin (2025-04-22 01:28:29)
> diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> index 6577a61cc07531..a020afaf2d6e7a 100644
> --- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> +++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Matthias Kaehlcke <mka@chromium.org>
>
>  allOf:
> -  - $ref: usb-device.yaml#
> +  - $ref: usb-hub.yaml#
>
>  properties:
>    compatible:
> @@ -19,61 +19,35 @@ properties:
[...]
>
> -      port@4:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          4th downstream facing USB port
> -
> -patternProperties:
> -  '^.*@[1-4]$':
> -    description: The hard wired USB devices
> -    type: object
> -    $ref: /schemas/usb/usb-device.yaml
> -    additionalProperties: true
> +additionalProperties:
> +  properties:
> +    reg:
> +      minimum: 1
> +      maximum: 4

Is this limiting the 'reg' property of the hub node and not the child
usb-device nodes?

>
>  required:
>    - peer-hub
>    - compatible
>    - reg

Can 'reg' be dropped because usb-hub.yaml requires it?
