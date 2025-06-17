Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F09D288CB5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152252; cv=none; b=b0MbQ4KohLN5Ebw4cYkNi3iqxMXweswHiPxhil/Gli61sUcnppqqBUBB6a/N4RM1hGmiNHobxGa4W8MnE2YC8Xr7CTCizXqMEr1ICp6OENV5mlDYovywojzb3ciuz0BFiWu5XRZLzqsTo2Ngum8GAUkpio1z7FmDh7fyt4qbpes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152252; c=relaxed/simple;
	bh=0FVH0nf1hFWs5snO5t/bUXQFon9Yjbecd6o+YdwqYHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0gakwZ/ia8O6DIRztRC7rMVZScq9bP5DvXZ7V0G9/rcoyv2eVwWTJtFPnNhl89uXpS4KlcyrIW+FSkagYMvrPNEGw8q7HdyKg1K0llf6pgzK1GevHRlPLiYEb1I0uFFAOL6KE+7LwxGgRFhbb+6hDdMStnJAhdCxOYiKfzfEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4sK07r3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4sK07r3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so1386571a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750152249; x=1750757049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qmCi5AjNmyApPkeggD1UBIutb08W79XxmIwYywNdyI=;
        b=j4sK07r3C3B34LEq1JlcgfnUK/UE/dCLXuO4dz8YQQJGIno2LQys94N5/ZyMTCAFOh
         MGcyy2PEMp8eBZjP0jJMMQ7Ij3t/OnoPzEWbh6/Mactd2fke2/MYh5e80Bud7d1yBJMf
         /zpP8SbMEIEdZnfEz0+XyiSSsqLhK2f6FmOLhS0P20EY9hVBFW15w7z3gn8N+ScU0N3T
         L0d9Tv6ZDkNjXSz6pY7nUFgRItZiDVe9Ua9MfiE9Bh2LeV9OBUjRUrebINV3KPPLNE/9
         I+IENTwKfwK38QsrUHY+lM8foI9HuT2WUk5YufntXLPKd1TtHZxuZtc/7BbZg1wY2Uu9
         S+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152249; x=1750757049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qmCi5AjNmyApPkeggD1UBIutb08W79XxmIwYywNdyI=;
        b=iPNEqPQV/l6SjWsOPngjHe5cIsaf0qnkxRB/HaTFrlvU8E3SHz1CDTCz3YrFKuYq3F
         xH0sFJGFT8pQGCqsacfYWZipiUMCkD8crsDFuoL5JkW1LH/8wk4j02uC1HMljrBiR2jx
         FvLWq8g47ja2Zsbv4Kyfy68jP+MH+fRW7hyq8wn95gC/zew4gc1PDLuSlCg7mbtyidmm
         7/iXM4fpdr1963oomKOieLVC0GwLhkGsQaZ/s6MeplQDjniextwLIaqVC4MRfC0IRB7i
         qNORNTdL6Pii4mbfWNNgKSkwDkusGEB2R8vtjP/jSJH3eqYINSVRsuLg1823nGXQMLqx
         n6MA==
X-Forwarded-Encrypted: i=1; AJvYcCWyvXOb+2I7dlOg7VSEFLjBfYrU5aHnNMTKTxGdnZqtb3/MF9NWkQqvoTjudx/HaJmHEqOlK0V0XZwf65w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiqkLRyV3ngK4uTdLMhI4zwpLzHTp8J3BQ+k3CmuGmffbWI9tP
	9fjvezYJDa6TkSrwSNovEB/pc+GZ2VInsDtUb0ZU0UZXQN9DJLqeIRfa8KrycZMj/WA=
X-Gm-Gg: ASbGncsO2n+CsWqAVGKb3UCEFEISLViWrTMhimsBSfdv00d6DHeBI5MymBdfDFs6Apq
	nveubRnLSNFx12E/wGmEmWxRcRujNYfBwUfF2fIUvEsn2UgpHaJxq1WT7Xi31yJEGh3KHKu9guE
	SPvPfaaYwLsXigFFs+AE3T06AC3RdfpkdUxR7rhB1jMc5gKqrXb270MufCt4n8ZKAgLMPRGrD6C
	tITVIzjsg/mQWrXON3E2befTpwqqCIrcEzz6VZJSIMzrkHxRbJQxNRoo03wJIzqUpzM0+DJdja1
	FvuNccxi8qKgdlgwA4LSXZyQ4jHmTw5i4Q2ms6RT7W1J9g/HtJf9e48PZe4=
X-Google-Smtp-Source: AGHT+IEnQHxM84ovHQi50egnS9UEgVOz9GmXYcPlKnLN4jCfbnYv7EbdDH2huGe6x+oNGIph9jx7kw==
X-Received: by 2002:a05:6402:34ce:b0:600:129:444e with SMTP id 4fb4d7f45d1cf-608ce49deb8mr11863903a12.4.1750152248723;
        Tue, 17 Jun 2025 02:24:08 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5b6a5sm7931639a12.40.2025.06.17.02.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:24:08 -0700 (PDT)
Date: Tue, 17 Jun 2025 12:24:06 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: Don't
 zero-out registers
Message-ID: <aFE0Nu8CKFBlCCrd@linaro.org>
References: <20250617-eusb2-repeater-tuning-v2-0-ed6c484f18ee@fairphone.com>
 <20250617-eusb2-repeater-tuning-v2-2-ed6c484f18ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-eusb2-repeater-tuning-v2-2-ed6c484f18ee@fairphone.com>

On 25-06-17 10:26:36, Luca Weiss wrote:
> Zeroing out registers does not happen in the downstream kernel, and will
> "tune" the repeater in surely unexpected ways since most registers don't
> have a reset value of 0x0.
> 
> Stop doing that and instead just set the registers that are in the init
> sequence (though long term I don't think there's actually PMIC-specific
> init sequences, there's board specific tuning, but that's a story for
> another day).
> 
> Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
