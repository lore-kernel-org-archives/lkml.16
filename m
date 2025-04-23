Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAE41B3950
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397582; cv=none; b=IFuSUy300BlARMegE64KNHd2e/zMTePCP4wty+Wk/XhLNU72G5KxVm42WfmifeDIY5tBmsDk2VOAn475mbCmHVT1jjIHBCoUMx5iWXmJTBrp1PwVNhSkST+S2yqkVPKLgFEFqfHj8wgZzlPLdMqMKTbiPcfdAq1imRCvdaBNF1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397582; c=relaxed/simple;
	bh=grgPkLeDaak7FHXRcZ5Lz333Opab1u40+CL8LBRoWz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otqWPGxTBr5wQTTA0CKKAl8BiRpOf4Nu/roWR/WZMjt6x+w5/d5t6QBWWqnG49xpz+w+D9mkxtHkB75Q8akNT7ZpDItbXE0M0qqsZ9p9F6QTG5Je5955oOKsuX9o6fLacFmjzWB+VMkBkaLkICaBL690NKURqVX6de7chL1Zruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckBh+lOx; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckBh+lOx"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54298ec925bso8984388e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397577; x=1746002377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grgPkLeDaak7FHXRcZ5Lz333Opab1u40+CL8LBRoWz4=;
        b=ckBh+lOxNwBZ8KeFyLBDbbEqYs9mXUgi0OsWzs+ALI6xvUSFcyOhn6zKqs8BIFci5m
         zGrvwOrbsl/JOmBeFTziO7lRv4DbaDipvdzLJ8yFTd/TUYy3ac6fGFDti8vFyfQBUgOB
         kMvx9mKf4YFb5MZPY8WJjLnQ3tUBh4OWoYpRulNCCneovQM40qimNnDlzzanfM/byWd6
         Q8VWvrzcgRrlWX4WDSoRHcpBkLPU4IB8iCyhHsbNaHY8dTpoaCD3VXvu3Kwomjl1qIXa
         CyulGC/2iqTUxYNYBS/DIAliu9vQ3L5fcY7ngT++jLbxlSp2hlWxdmLekMJd+Q85V4Ug
         q8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397577; x=1746002377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grgPkLeDaak7FHXRcZ5Lz333Opab1u40+CL8LBRoWz4=;
        b=O23A4jtWfQIcQ8Tsf8Wau0ETo/ZMFMTiQGHSy3x+eEvGTnU5OCpky/QO9EU56bViOM
         wqGoP7xkaPco8/4IO0cwld5FvTFVnuCQRMyjovc5UM97TovQKxeTZtbnG9hHdT1RL9OM
         l8qgMjJWRnmDc5H4nX6wKLElREKL46vlSXU0XBuskAPIcRJpV+oJlKbTJL5h2w5znvlp
         52/sWknmRzTgvtJYXDZvKQJTRStiCfBwuY6fLTYLnML8BQ4e03irapjG9xn7OGbVl1/l
         srXysz1TsDfrizl9VzkQNsnsP9B7H5AsPay6t5VX0dWK2aIdYc8XlnuohvsKaoN42VLP
         Gmdg==
X-Forwarded-Encrypted: i=1; AJvYcCUgXdRgujz8JHbbH7p0CN+GZaGtoU3DrkLHlYH0j3ra389K+4072CeRlI0jT3LnGhFQFFw6SiMYFG3xTf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZICuRVQjPNgkBecA06aWt4WGGcl6igXNvRYROxg7mRS2u4YTr
	iGv/oAX7toqBAD7Gm1mKKeDsnv+pXbt5VqxT06ZnTGhqHU1pMfN/Gwu3SuDBOmn1+FjLM3jT7n3
	zVJUPHeFixLwy8LUM44GOSYlFclR1roICxeLaCQ==
X-Gm-Gg: ASbGncvZNp7HeVVpyk78sGrhUWN7gZkr2LQQTXtD4dXXn5f1Q8otRZE2OD59s5YqkmX
	UXILlzAx5YRNdu6rWcEg1btN2l089e5ZwqwTG06frzpiaKoE+ETL9lDZLLhmN0NIJhhtOjr9wd5
	O9XTiR/0LXYac+DloCI6rWuA==
X-Google-Smtp-Source: AGHT+IFZTOoQ/SIoYXTZQ5HrYq6ViTZKpu7Uh98dkIsdaRSVIhl5RakX+3hvzmtcTmlbY+w9Vf4quwvNHMW9rpoPCBY=
X-Received: by 2002:a05:6512:3d8f:b0:54b:f10:fe46 with SMTP id
 2adb3069b0e04-54d6e633c8cmr4512868e87.25.1745397577343; Wed, 23 Apr 2025
 01:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:39:25 +0200
X-Gm-Features: ATxdqUHd2AvWX21KS5yncubJtaT0PJGEz4DTRXuWL1cWY2BMp_E6mT4BPCkdw64
Message-ID: <CACRpkdZpHHvbu41xkK2n8-Hzf0euU14T6F42hXLsM277LJA29g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: spacemit: add clock/reset support
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 2:15=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> SpacemiT K1 pinctrl requires two clocks in order to be functional,
> also one reset line from hardware persepective.
>
> In this series, adding clock property in dt-binding, and activate
> them in the driver. But for reset, making it optional for now.
>
> For DT part patch, I plan to submit after clock driver merged.
> This may result dtb warnings in this version due to the mising
> clock property in pinctrl dt node.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Patches applied!

Yours,
Linus Walleij
