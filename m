Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C925AF50F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306972; cv=none; b=gUXLc5FoBFbafO6NL7IqkWf+pdinHkBc6s4ChWv/ug6KlZrHc11KBPQcXY1FLfNFnspsOKjwFvd2wd6B3Ssq/3KAToLf8hENTraFaJ88OObqOO1eMG9R8KZt0CNPlESTxBG0mAwMa998HtqKojPjtn0a8t2UHLPrSbWrY+obJQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306972; c=relaxed/simple;
	bh=pxZi8zImTeMgi+8ymq7cCagNtW5K1bEPmu5ezKcUkSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sGuW1pSzgQr3zCxqzWlxngp7S6lwwnE/G/TplITtZzEpMHQpVeS+UpNZravGe1UMXxs6TiKQTbo+eWO8DcumuSmpJ4ZSvxB2kPLdNWxlUZmLslN+J8K13sl07PBtxfaX166vqKLHx/c8vMWaRJ27WRQXEm8aEzKkJsd9mPssNLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gYpCy+NV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gYpCy+NV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43edb40f357so35549735e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745306969; x=1745911769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WE6B9+Jm7K2DIy4AwhiaVSJXeDjFiEqYGefV6SKsX4=;
        b=gYpCy+NVUAWnyEt3Ye+NPqrME6+lWM1jxyRZk9lJ8mEAkHRfxAalXQCM51VxWY4K9U
         Lf66zWVyDWtMQrecOl3kRQ9k0N+jc6qYgWCl+tyKW08ssix3v4jRKJYmGc5zAzjI9Zc6
         jQsax30cmnroSrMRTstPfXN1PvPeZozBe45hTE2pSjo9QgU7qd5JzgTkgalzoYLUp2CW
         Lo5K8srCI/ZdED3VXfeVzZpJ2fmNRAEseQdOGBttPvZmTDO10zr1Cm64ztWDb0GD9Iug
         KgKLSdCRO8vyV9Rs80854mGyiyIu6Up7lgA9l1j0RbnGvZQMy44RIX3/l1JrsapGKWLk
         /pbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745306969; x=1745911769;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WE6B9+Jm7K2DIy4AwhiaVSJXeDjFiEqYGefV6SKsX4=;
        b=IKQ4ZbAB5bZY9ZaHw2oFbPEo44349myij6gzAOGg8AP9/VaZUrHzoEyAUrarZ+nXP0
         THH9w5BlO7mb+5LxDRQxmxXgdZeYx5lxH0G9PYSRrTVdFWAvGnK4ovurEKtKM7Puf+JW
         lPnEwtt7WbIN7VSNGt08CnX6Psq17O+QoEBa6uPwz0nWvWx2kul3ajzcVIHlhLgUyBCj
         mfrvwB7mjIResuU1gdWZzbaod8+vsDOBwGOC8NbAGPUyu1Y8WJfITDw0BCE7JCOim6hx
         gJJn9U2sDnbN41G9IdMSWvpC5RtAFxA5ouTghniGI+N2Y031dV0cULTDSgCh0VwY2mqW
         q/hw==
X-Forwarded-Encrypted: i=1; AJvYcCUGecZR8UJvt4lDlVD8P06dXQUYbn85ERzW1k8oMVX2HK2NTVedlmNOkao/FAzfK5O1/xUHA7ZNJtANbHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO5+VKPJfV0odUqDPVB1scdAWOnP51ndm8UcElWJe8XBw9a3Ek
	C7x1huyIzgIc69quAOaD5/bWMEIvpiA/3wCMkpG42pEfH7/w7/OtCBGY+8Lb5aEFhgcjAqxnmBz
	e
X-Gm-Gg: ASbGncuYNiyIsUDsm8NKCSwXS73mG4mU23O4H1d1UEHGQPXAQ7hhFuw9oNLYwcdXxi8
	eouw1YmnHxsb1bzHto8emLZKK2AK0U1elZLE9eaCjD1zdI+xfDaGP+WLVJTB5/+6bHaJcPcRoOB
	AEL6RBlmghSr1RW/8mEIs7Ou1yza95CQRIc21T+yOdWhUk4/cYFoRgknZd9pxQuaVdgruVgtzq/
	4mQQbX3yQv75GkXdMeYGJA7twRFpI06BqV/XbSiS3pOyA9QFEL4ja7QscvpWEWOVEsEsKCtoRv2
	1G7MhG03g2K+FQNc08MzcwFT8fpPdt5CDIUH+nVd/nih9JxrXdd5RmySp475Lw==
X-Google-Smtp-Source: AGHT+IFz4RTYks1mswTos9a1X656QS1hSeMVBYH7QIElbSw016nR7YtAIfOCTnGOtYvHrLhJYdnl0Q==
X-Received: by 2002:a05:600c:3c9b:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-4406abfbcd7mr111689315e9.23.1745306969235;
        Tue, 22 Apr 2025 00:29:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbcc3sm163166975e9.19.2025.04.22.00.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:29:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/7] soc: amlogic: clk-measure: Add
 clk-measure support for C3 and S4
Message-Id: <174530696864.2791401.11812769907891409745.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:29:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Tue, 15 Apr 2025 10:45:23 +0800, Chuan Liu wrote:
> Add clk-measure support for C3/S4 SoCs.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/drivers)

[1/7] soc: amlogic: clk-measure: Define MSR_CLK's register offset separately
      https://git.kernel.org/amlogic/c/ac2edb9b7bcc34de804d9c034d7387bdeda3fa3d
[2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
      https://git.kernel.org/amlogic/c/e5635febb4f063fba40bcb4506c7fa5704ceeace
[3/7] dt-bindings: soc: amlogic: S4 supports clk-measure
      https://git.kernel.org/amlogic/c/97533fc48892716e5765b390b2f03a7ac633c55b
[4/7] soc: amlogic: clk-measure: Add support for C3
      https://git.kernel.org/amlogic/c/67c618a5852d9066ccb3b6833df8c44839bff5c1
[5/7] soc: amlogic: clk-measure: Add support for S4
      https://git.kernel.org/amlogic/c/bc93a99ba90b06e478a21505d07175a0f66849be

These changes has been applied on the intermediate git tree [1].

The v6.16/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

