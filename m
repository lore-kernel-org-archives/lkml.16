Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26262918D0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558525; cv=none; b=WN/4YVdS9EweY+CmF+2mvWYjYi4j7AOT+EnAB20/0tk3yeKxP8wo/MPKPws7o2OyfuCoCBR431WVJPHTsAKqXh9FDbzYGHoiOe4MxPaJ3DW53VxCUHyBxXXbfYplMUSjcQ8pTV6S0Owbz3jDVU1oRnmb62yJYc+1I11BTQeLd3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558525; c=relaxed/simple;
	bh=qpvt2l7UUTiMSp9Nt2nHtj3uisD8+uoR1/1D3UNyhR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nx8+o/FVcCcEsKGWfUVYHWnMkQREIMBiMkSF1KY4HJ8czNuCguqmkNQfv8t5USAWtGa6nmXo5Dg4p/QiB32ElaG73IznR2PYdaVIRzj9cwqkLegiZ394Lf71Qmba9lvPWBmqk9xDc75cm0ZeDM5Ys0dUevKmTqcPShgsLbhKptA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LKRL/wkh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LKRL/wkh"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso5614607e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749558521; x=1750163321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsOrVxtqepjy8J80Lyog9ns9pzcfAzcmyvDrXuJUtgY=;
        b=LKRL/wkht4QnbzCRHU/vBDVUMjED1jaa0jjtHJvHAlutsaNYecC4eFasiWryepV/ll
         Y+x6UvmsgzLDvOy63wAExi66zcdfI4UprmZHRjrCTCJ/NnR6BnF00ZdbNmmHRBfHVYO9
         lWLg9r8eTokbfiRRDSvEtZYWuMy7aHJo7eRcD7SjlZdfPA44U5FxPAfJ93xS8n1BYKcy
         6auYsn14kfIvYNwArTOr/uYnz0/wScCoxMyRnaHEzg3ptihTotOJsyhwdS+bK4JQXH1m
         0NrHWXJKb+ErGqTlxIMavAM8R9dzm575lfhqDHPiUGwPrj6dSeEkdfYRjxH9sbW7ZVzJ
         SQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558521; x=1750163321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsOrVxtqepjy8J80Lyog9ns9pzcfAzcmyvDrXuJUtgY=;
        b=lr4KbEnMm2Jgozi298if8uF5Wj7nF1Q8klbWbClARwXIkUd7m0DL1G42wbvHBSpaT7
         +WINhxCCPkUUvnLTym4NEqB/afSUo4AjPoPlk0ignXxRbrszbM9doVfW4oFKIDG3hgSN
         tHm++naefad2XRjsqlP1NdjP/G3rghbjrDpx9x1z53haK1Siwfv64y1ciwQrCIEnqNJh
         +/Vt0d4aXYNJofKxL56VHC1scCdXaLxFWuTPd85ENFByGg13bc2l4vHKooYDNfpSjYsV
         vvaIPp9T+bjAqajUUOSP046NgKDrjnLytQs5r8Z5Vq8AdXwIuwcUDfXdZIT6pdYIc4LZ
         KB5g==
X-Forwarded-Encrypted: i=1; AJvYcCVAL9h18Hs9g5TtGxxMpKswIXJfSq+1HzGEZE6nKrb3DXWZrpMPLxWtBGkhIpkffQj2i9cG845EFBIIG4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdNiyn+vMYow4afA+cItzVmIs1qnJqlnZyiZF2ON2DrkPOWUwI
	p5h8g5c1SMOr0nlfCLIpI0vFfyjUGdEnI9nXwbZG0MgXYuJb7i7yqWko6vTd7pZADhEdar0aJcL
	8uE8tAySQUq+tD4BcUfFmh7wxMco8S73b3Nar08BLCw==
X-Gm-Gg: ASbGncs9XaJBDhpexAxv5RKHMVzB1IW69Km5tr2xPj7SjwsbzAamlsn+z9T/g9fMrxk
	+jUa2mLDrWn8F7ZvXaBUZUutT8zI6ZB27x9U3eIhGsW8Iq/p+M30KpJ6LJ2mvXg6CmR1lZlrPSw
	MzFGfWBOto8h1ZYmzzbjc5YAI0tSq7lSK8TTGCMbwEjrs=
X-Google-Smtp-Source: AGHT+IGIP7rndrIqf6RWqLJPp4xdoAE+TRSEB9XlMrQhxRf3kV/JruNVdV2IPEdtEosg+5E6PSBoZ/3/v3lz/smQsyE=
X-Received: by 2002:a2e:a595:0:b0:32a:651c:9af9 with SMTP id
 38308e7fff4ca-32adfd5e7b1mr45162751fa.37.1749558520672; Tue, 10 Jun 2025
 05:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-dt-bindings-psy-monitored-battery-v1-0-7f755ff75218@linaro.org>
 <20250604-dt-bindings-psy-monitored-battery-v1-6-7f755ff75218@linaro.org>
In-Reply-To: <20250604-dt-bindings-psy-monitored-battery-v1-6-7f755ff75218@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:28:28 +0200
X-Gm-Features: AX0GCFs14D3DfdKPGW1oWe6McnWZU01oPtzxcnEFGOdPnt5cB-b18SjhfOGEaq0
Message-ID: <CACRpkdbMFZmK3oUapXDrJjtfhBn56shGu9uoFYPT2_HesTF+Xg@mail.gmail.com>
Subject: Re: [PATCH 6/6] dt-bindings: power: supply: Drop redundant
 monitored-battery ref
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
	Casey Connolly <casey.connolly@linaro.org>, Jakob Hauser <jahau@rocketmail.com>, 
	David Heidelberg <david@ixit.cz>, Dmitry Osipenko <digetx@gmail.com>, 
	Tobias Schrammm <t.schramm@manjaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 10:19=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Bindings reference the common power supply schema, which already defines
> the type (ref) for "monitored-battery" property.  Drop the redundant ref
> from individual device schemas along with obvious description also
> duplicating what is in power-supply.yaml.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
