Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5704A21;
	Sun,  6 Apr 2025 20:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971526; cv=none; b=h32jGp/1sTVJEqKRQnFFZmOSlOgHl2Rw1ws/xt2/j2ybV7LL5iXH8WdRRe/lVu+48HKifBsYmtnb9Z4r+eFWLHTYu4qBKwa0yyVmUU8uq9ghpobBtaSPdutKShg/icaPFptP8NPXtN+T8ypV7pLNo7DJEYN0djfbHxWJP491JJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971526; c=relaxed/simple;
	bh=/QKe2abRQc2yYg8840jEvGySXkfzcfSJKHrjRel0tUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHQIM+eaglI6WYrQy3aYyAIGGHbzsvXNZ2qhp4JwgagXvPnZ5TBZ6hoxeIMu1G7S6vf7wfaX6rA+INFKkbfZ4i8cfPdXEK4n9wuHublXPGuajrGgd5kct1OPWAggS54enrdm69pQZkR4O++mneZuNliLVwi1SNFAWeYZrnin7ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Kfem1MMS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Kfem1MMS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22423adf751so34521975ad.2;
        Sun, 06 Apr 2025 13:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743971524; x=1744576324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QKe2abRQc2yYg8840jEvGySXkfzcfSJKHrjRel0tUY=;
        b=Kfem1MMSgFkpFjaFvRCfwvAEQ5J5hIdto0bXufCDgJUUEURGdT8IibrjmfvOz39qlw
         eekUyqPWqjIPqqfcJ2PJmC+2oSy1Df0bk8Q8uHNGLXwEQ8om5Zqz+PDhAMmkVp2lK572
         eIKMkZzmF5xHSe+rR8+Bbqvjk/3sLq+mR+CR+brT6/DBH5rGzkuDEVYml7ZHoXYVqB2W
         GlO74cWiy98I6o+yXZDo7ir59I5+xHE99CjwDEe96LtfCXAjd0/iHUdSrEwwTWsivfBN
         U23T/u8CmWvpTAf8j8d3COvUDgd9z+Ensxd3JpARRa1vTQNIApZX2bLNU7qZXsaZ7KFM
         acSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971524; x=1744576324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QKe2abRQc2yYg8840jEvGySXkfzcfSJKHrjRel0tUY=;
        b=m0AXX+1amT23H3t9BwGlblgHKImzDpHbq9yQo+x6R7KA2v5fKZPkakKrQ95XMFlhve
         9kPl4Cv7IxG3RTlZrNQJT2l7kTLVwDETou8fi4h3xczhe6tNKFbgQWCsVTZ0bUUfKakg
         vDM0cGQ8ge/VBS2n84B/kBfuxjjaAy9TQZVY/SLehaArngd+s0fu0WAWPpgww7uADUDy
         CaqVl5XiCozx3WfX8g1/8S49BXF+ayMmATdf+6Yk3WjHqymeUfof8t05QIqsFNJWQRH/
         Tssx63CHIMQZm8sbu5EYDT8c7WOl5CjXtmwW1oWQKOqTct7ZgGHqqpMga1tEfg/EPNjU
         1/8w==
X-Forwarded-Encrypted: i=1; AJvYcCVqmdjPjhW3VUK8Eof6pDJn44BoRvzT2fZBD/9PN+evDi82yllnRdzhCG5GydnmCvuSa2/KCYhc/4jWck9U@vger.kernel.org, AJvYcCWQK7CRuhPMsdGGj/MkIfci2B+fTzB+1zAJJBbR57O2OZk6GwiZ637btORSjU8nT/y9MIM9eyiawf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV82wrwgEtTGif4iMdyuydUUA0ZUcrj67nN8mNtCTcNstoKSKK
	lFHrcXGtys/cO36w1xiiNuhMiRrZhawLGop9PV45C8vQBzK6tQl08EX0ozar8QTxJ5WIU2HOGnf
	6SUB/NvGWLhKk4pGnYDvwpRZvlcetUXBw
X-Gm-Gg: ASbGncvsn+d3mt0B77KGooXuu7QwwqsadQoLw9EUV/rinCn5ks4lKr+2Y+GYoQbFDJI
	VVii43dZY3Uy0fcRHqQelTJWtiSAPgs7xEk3tECFY+g3F6U5+TZS7pLbwGw3t9XgSvD+xv9S7VJ
	znXlIPHfwwxdy4aqcQDgFI9tHakPz+Kiij39AsoHz0
X-Google-Smtp-Source: AGHT+IHT9v90+iSAiZXg5CI9I2oqKoRX4lqsSVS1Jifp+TsFpnk0GJAUF4rHe1Z3iO76l1ihTjaQBPryFYN0akQAcDI=
X-Received: by 2002:a17:902:e546:b0:216:410d:4c53 with SMTP id
 d9443c01a7336-22a8a0a24f1mr155808815ad.41.1743971524234; Sun, 06 Apr 2025
 13:32:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org> <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 6 Apr 2025 22:31:53 +0200
X-Gm-Features: ATxdqUGuzCGyUj4WFxWudQ3GalFFdus2VKUZdP35pUaLUbjhJd9NZclZR-cjauk
Message-ID: <CAFBinCB00HsScB6d4UboQkp8HPQ3pbDwbbwnzwgqJOvHwBDSdA@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: meson: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 1:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enabling the compile test should not cause automatic enabling of all
> drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
