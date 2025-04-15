Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3402224CEE4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702834; cv=none; b=WHRSDkkyeUzyLDmFczk+A3erV10Oc/a5rgnh3Jy836K3ZukOmQhau3aG6ipcWXTH/rlFg42uiNYFquI6Mylt4XHEQq4Br5lOiU8dFwJth2toheAG/tnvQ741Fe4MxnNnvZ1JNuyYhMGAjqXETphsZmE8O8EdTsnxkU2SE7ZZXFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702834; c=relaxed/simple;
	bh=bPPsVA86aRMmKsehM2IabqFVi4bzGyyaypZ1MvkVduM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cehqTmBu7lKa2xTjg1PambfCSs4z1irw4n7vxWxA+SmbPla2rq+a/0EEgq+AF7lqB2HAxmZfQOGnBIWcylBRv5qtFpfOSeDHgSgoQ4SbBd1j2mColLGrQy3Cc5okgWduqUFbBHlt67SNZgrM99XX3mu0NDx5oo7DBOR7KGd6lzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cB4JSxG6; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cB4JSxG6"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfed67e08so51188881fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702830; x=1745307630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPPsVA86aRMmKsehM2IabqFVi4bzGyyaypZ1MvkVduM=;
        b=cB4JSxG6BRqYZ9ZsnGMSOWDfp9AmdWXX24vNa53PUvyUZYNBjWdpxdbkdCLHeQwiw3
         pO83lLqarymylP/z0NgPUlDiiCuLSW3w4NzlQfEZ2aGKF3EWsYTOM7493Zbiv9edKNDV
         OGJz3L/5cMCRU2cJrSZtoL1U6rNqg6M/1zMhV5RLI5uAUN/h6rd0c2f7aXGxFbJWLLnV
         7X634LQvqQfSvXkXJUYyN4ODk458lKJfsD/i4gIET2HzXI0hHI053zX0xfMlzrGAzKGo
         iD3hxRAdrx+iBYRs6OZbF0zrC3K4VmpVFBRAqQidjT9PIivuif4EY1vsZmYfkm9hawlX
         U+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702830; x=1745307630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPPsVA86aRMmKsehM2IabqFVi4bzGyyaypZ1MvkVduM=;
        b=E5sk2kU5JsAK6oqbiGA8txE+GrmfPImk3zeNakQE55/Ey28Rxf841TaWdFtNixfQ5+
         iGuzePw5hO5THczTi0ngs5dp7jJMEcjW45NI8j4Jc2wZWFtcOBMytNqEv6lyFgCGSjqM
         8ruXb8PyM1nAsUpHIFa7facLbPyQqo5hoDcFmDNhucqN9zFLDCawBufQAZtsMi40+2yG
         szDlvKPlmKhG6kelA1wrvSIAV/LSoOlGWbTH8QT6dpl/8tau5Jfdp7G9RaUnq2NVmiWj
         LTXoYPBK3TuWS34dtGBcceYBWW8qIFYLcl4s3PnBOghi/35+71aH+3aK8Gf+Ly3XXCUW
         u7Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUWAElYWm8+x5uU46uc7r+rHc2l9ATXyLU4/sE/2kt1AoQJ8YYziVTCweQ/s2+VwX6HsLieGc6rv8j/ZNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwikceurvDCm2+dE2K8glnXR2SYWEy0lHvfQOXfw+DjF0VyNGCR
	z8ng3oJfJiC7O4AGIWq9qIjCYG9W06710ik0B4QRs0pZZ2RlXmIgUbZ3HKSSDVY9bmHgXyUlDY/
	CTsqhpof7pbCAtjsAdBIy0yD16r46j4RJBB9TTA==
X-Gm-Gg: ASbGncuFvmVVoF5pr29ixXLB8efAW5bnFdO4Hdg26iKT0ECXLqpXt7fQMIa4rBFRkro
	dwedxtwPL/1s+8zwOtAWkirpwWc8TRmaIOVoJ+TpWuOlWMQRc7co7+JUDtNILvDvTYBv2F399k+
	/KoepkU+fSuJt5Gqgg5c1F/ndgXF8lo4wy
X-Google-Smtp-Source: AGHT+IFWYF5PBFz8bdBMKs/hFSmP9qdyePV80JdSmzpOU6YbNPT0plMuK8UpwqvumIMhMZzLrddrNlq7JqXr9GLcwmY=
X-Received: by 2002:a2e:9214:0:b0:30c:3099:13d0 with SMTP id
 38308e7fff4ca-31049a01919mr40215891fa.21.1744702830214; Tue, 15 Apr 2025
 00:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com> <20250403-a5-pinctrl-v3-1-a8c067e22295@amlogic.com>
In-Reply-To: <20250403-a5-pinctrl-v3-1-a8c067e22295@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:40:18 +0200
X-Gm-Features: ATxdqUGH5zAtbvjbTyVv3OZBDQWbnPFIqXVT2OLZ9OTJTUgQ_9-qW1g1gPLhhII
Message-ID: <CACRpkdZATVbE8nrk7_B2jE7MOqqeruV25mRdZaXdGNJ_kh1S1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xianwei,

On Thu, Apr 3, 2025 at 10:33=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
> no need for an extra compatible line in the driver, but add A5
> compatible line for documentation.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch applied!

Please funnel 2/2 through the SoC tree.

Yours,
Linus Walleij
