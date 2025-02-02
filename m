Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D48A111AD;
	Sun,  2 Feb 2025 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738490886; cv=none; b=McyDGEMPNSaacgLIJCiMwNzbQxmWM8h07qyi3euaOOGVoXkfP3XXRIt8t8m+FyDSogNnxwPlqEDl08cZipkpB89aZoGTjOU3slitaN82dXD6JceVNd1pXlPM8Oi8vRNyXEww39B/HymF8T30DKhRB9SwdILsgrIXHorub4d1fA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738490886; c=relaxed/simple;
	bh=Qsexnj/CP0F5r6ktpbAQfdb0NXCwvVNJghz5UJCF+tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOrDQ8U61iNpDJMNOQkAoYvOViK7kYPzGxb7SeZHDIUbbUXYQ5UWfa1rTpsDJPIWzK6z+03+YgdEmFyUvEsJ4Pznhzz7L5hIq4LtcQSSWPrwxpHFi/SKBZ9vvnHrulbkCxO/GZwQNRqK4b5RXwylUQkmf/uaaxVqwy1IzasLQks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgKzirUB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgKzirUB"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38be3bfb045so2999036f8f.0;
        Sun, 02 Feb 2025 02:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738490883; x=1739095683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jFdoI8Ju1M/PWn7HdIABw+L7KS/gVbS5DzsMo/puQzA=;
        b=mgKzirUBiYnfR874cCKqmUdpTIKiUfqOFs0Gz+PECkbaynjauJBO0FlIgq6evdmzH2
         YdnaUKxyKRlR1pPEUxqvUF3AoetWq99FbklkqpQDGt3ZJk/an5nLDSobCvH4tquv6zDu
         VLAMzhE9c6RaFtpCpKQ/rx6ztxlOlVBQLeE5tRRU06XY/j1aElNq7bmJkz3ROwi6QkYI
         YFNndx4dmW041ZOykIDQbxpfSlC1GmECwvgOjZ6NjjGU6OUuypsyxN+H6Vzn/aENBRNf
         aPLNl41fyA7NkmwTrNMPwBSTdcZnjuPgqgJHRTZ3sERbZSQ5kYLsK0wxIeRk7t1mZTHA
         XANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738490883; x=1739095683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFdoI8Ju1M/PWn7HdIABw+L7KS/gVbS5DzsMo/puQzA=;
        b=p85eZ1Hk5EXnhb0/6DH6porxxW54o6+awu7SabwPcA5//1VNuUP9JiVtjr4ensJl9s
         b4hjUbkD61bJd0770TeHVLRLUFNuqoAe7wPKCQbR7VHkYhraUVLoMuLb423xRjtXKX/D
         SlR19uVcNwgl1KFcIqRyqn9/hDwWoMbrxQmrB+XzPVhOShKFUDqSJCGVU+iYYDgtwmyV
         KYbL2WkQxRYbT+4NsO3w9+2NEMqfw1q1FXH1zjGJmUbElCgk5b1BTNO8MZ2W/JyxhMhv
         ons63yADHM5E2F2V3QC8G/2Fa34x0L+XImHHC/LsENrFJjIJyCVs8u0iS11amdJlJ7NB
         2pSw==
X-Forwarded-Encrypted: i=1; AJvYcCUPsLFMtYpKhXZpa0nmoc1UItImYgi0TpjQsp2VLsPvtlsBswzF3hs36SV/s8EzbfXpLq+4jvyh1Jk6OCY0@vger.kernel.org, AJvYcCX5PkFWmkc3XUtW43ftCZLeIOJwoR28jP61GWPVLtnZy6ZL6IfqPzNPuY46dEuBugGJ+wH9JU8w7YQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YzaEsdcb7MOQdjBdJfE9Vs2hcqAbG4sNrerPafe9row0EHkSjjK
	dbIPJwnEIBvidEux9Jrq7bXCxT5qy+R9B3UloZy2iz/Xtjf0UfA2qhnq3w==
X-Gm-Gg: ASbGncure2YqLUTs2I+P/y/tjBTYKQh/rLosKpesJGp1FYX3i1IfdueOnE2D3+3aT7X
	MGMKqXgwubEZ2K2zD85rvW8IRwF2hp2WGVE0pR0VZlZmRVFXqC6nH3d8YwEfhhtfQVq0wqndn+1
	AyhR9DlRmIXZUvkGhChGhvxei70lLF0CQHLcch3/E1+4Chk34rOuqerYrUsmeJhFFptXp4nM5+4
	CAnTfJmylDpTIsks4qZl7AWr18Fxcjs1CaN7R5eEngj24pTXbY1ZqEh+HGggG2mnsbeD/XuNkiE
	pyS2tXozHzphoxQZ1nMI8MdBCd8Rd3e2ZmnLiVlgy+M7nkvMTmbAjjE=
X-Google-Smtp-Source: AGHT+IGNKkQ6RmFbtSpubVq9TAAF3iwlIDcdrUun9xtcXNmIq2ukjQ9eiZ018uRqNCSUVc1oCXaPPQ==
X-Received: by 2002:a5d:588e:0:b0:385:faec:d945 with SMTP id ffacd0b85a97d-38c5a96fdd7mr11060147f8f.9.1738490883129;
        Sun, 02 Feb 2025 02:08:03 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b576csm9693529f8f.63.2025.02.02.02.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 02:08:02 -0800 (PST)
Date: Sun, 2 Feb 2025 11:08:00 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 2/7] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
Message-ID: <Z59EAM9l7t4Z5Q5g@standask-GA-A55M-S2HP>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>

On Fri, Jan 31, 2025 at 07:13:50PM +0100, Artur Weber wrote:
> The BCM59054 MFD is fairly similar to the BCM59056, and will use
> the same driver. Add compatible and specify the allowed regulator
> nodes.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

[snip]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm59054
> +    then:
> +      properties:
> +        regulators:
> +          $ref: ../regulator/brcm,bcm59054.yaml

Full path.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm59056
> +    then:
> +      properties:
> +        regulators:
> +          $ref: ../regulator/brcm,bcm59056.yaml

Full path.

> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..719621c7f0e71cd9368f4d7243c79aaa97ca7255
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/brcm,bcm59054.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM59054 Power Management IC regulators
> +
> +description: |
> +  This is a part of device tree bindings for the BCM590XX family of power
> +  management ICs.

Same comment as patch 1.

> +
> +  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
> +  additional information and example.
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +# The valid regulator node names for BCM59054 are:
> +#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
> +#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
> +#   csr, iosr1, iosr2, mmsr, sdsr1, sdsr2, vsr,
> +#   gpldo1, gpldo2, gpldo3, tcxldo, lvldo1, lvldo2

Same comment as patch 1.

> +
> +patternProperties:
> +  "^(cam|sim|mmc)ldo[1-2]$":
> +    type: object
> +    $ref: /schemas/regulator/regulator.yaml#

As Rob's bot pointed out, you're missing unevaluatedProperties: false in
all of these.

Regards,
Stanislav
