Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F09F1D799D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745477371; cv=none; b=G0o3aJvkHtXF0tHvg0fR3YlioJxnwERWKDNfSI9Qa3squc6wxh1LvAp0qHXceg3l/vWa8EI37Sgmih0oS+OIkqeppy85iocVmGsE7BXSdzqCGhqtVdBwsiiNL8ySYdOlvEgET2aQ5UoKr1Gz3gn9Mu/6z2g67nqvajXCuaq81Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745477371; c=relaxed/simple;
	bh=YY05EULblqpqOJ20Ca2qJAkFfKoRl4Lnom2DVdns5cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCGUEGnOJr3S8QT8pq58eWf3LMnG65nialu+b55vFZlpCzqOQhKLQ+yVb1mLNPabAIrgoWD+5GRyVimrDcQNGdEg622yaTpLMt1Jxi8/NcyWNPIBLyogGOHmlt4VPLB7XjxV0XfiEja9o+3x7y7vcIgwfctluMAnH4I9IQQHCNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ohRDjLKo; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ohRDjLKo"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso1232662a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745477367; x=1746082167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FO96JtbCvJe3mUseWa0OQALrV8LUqckkiAryhK/dOSI=;
        b=ohRDjLKoZHrt860xcyNcRM6ef7aY/SfxsNBLLKF08fD8KNCh8idbIfQvUHp3wO8gwQ
         S98QC6TTnRRvc3o4JzKbpAwKdux4Go5riFQxnKm3mry9CeGkdHqbtJmUdTXzFJdS9CxZ
         eGZPRYD+6rLhnYkSHx9+/07//pIViq2NszbbDxrlHwNTl5CeEwgZuQC/9uld1voGxxJj
         9Kar10lAE6M9j5mVkjqOFVum48tP400eacu2ixJSENA+lDK4Um07RYR3WmFWkAT5waDo
         /HJ8H7CQhWZ/V7kG4EPT/ib1mRgNzfd4wX6jKFxa5VXJtViAeAJQG/zCCoHzaxP+YNVK
         TwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745477367; x=1746082167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FO96JtbCvJe3mUseWa0OQALrV8LUqckkiAryhK/dOSI=;
        b=LJEZCGvYkXRO8DsbCW+LFLZr9cmBO8O5Xnlro5ByGeGaPvrUgS/oOVm3LrceQQOCBZ
         VgtSa6ab0DGR8LdC6rVx7pk7dWObBZADnHy3RoDu8TCEzlZTkBqmQWmrKJzGp8jE0q3j
         4G/AdaaQ50C6qCSU/7xhJIJeavA3/8gWgbH5pXvkATsDdzA15wm82h9SJp5ZgxzVDQKN
         BvEJPtINfD1H4tpr3ThdqGz8/qOM4Vt4Bg4g4OstLm1wjRewdwkkINSAZALPgckjnS9R
         bGeeWGbWEufk3P4l8XtFa+XSqe1k8a90jTT4OAP8b5QuZGFOHxRIgi/N6o5MAVpbv+zS
         50ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUiyy5Ge/BDjSbF6VsqM1YXlxZXW4CLUBKaQA25SgJQz3cApW+vDp2ZfQXfiXV0jhtG5jTTH3Txh7QC7mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwINhLZ9pS13BtNvYk3ImhLIp62TyTHXFlC23cgkOWyJMVNWCKd
	lTn43BZz+0wK7p75/n43wvP3l6s8WH9U87nI2jK8CqAwyfCahIvr3cU/l7XsrjA=
X-Gm-Gg: ASbGnctLZANDX/37tf3rdrHE3JJ0bZnsj9qNuKxauKjmfhrrTfIK2eHKml+pMUW2Gq5
	kO5EJWZjY03fql29f7oY4oQuGuZBTIbIxh9xEbPJ8nOZfSGGvazGlY4wJzgJekE7BkSPAMrFRfX
	Z3vcsV452YbxAXMxGy25RFPAkqJ4x2JxnrKcT1i+G0mBuV5oHs44P3kcBxQ/2czq2Fdg0zPCrVJ
	oWV2zkJ/o8Y/Ok3A27jLK4q4cazGyYHGjyDcu/DNzdQZDCxK5TiHB1N4gcO+Y5nQYIplM7uwIWy
	/kmexPSqZbtie8e0CW2s3JH8T4TvCnW4ExDQGA==
X-Google-Smtp-Source: AGHT+IEfj/5HzaH2h358gMY8v05hd2yzGKyunuo5psGHsXusc1uw2LNAuC+EPj7nse1eDky0duEC/Q==
X-Received: by 2002:a17:907:1b08:b0:aca:c7c6:b218 with SMTP id a640c23a62f3a-ace570e0d55mr131378866b.1.1745477367496;
        Wed, 23 Apr 2025 23:49:27 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c261f4sm56013866b.146.2025.04.23.23.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:49:26 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:49:24 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: x1*: Fix vreg_l2j_1p2 voltage
Message-ID: <aAne9K79PNfdQc8h@linaro.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>

On 25-04-23 09:30:06, Stephan Gerhold wrote:
> Several of the Qualcomm X1* device trees upstream specify the wrong voltage
> for the L2J regulator. In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is
> configured with 1256000 uV instead of the 1200000 uV. Change all affected
> device trees to use the same for consistency and correctness.
> 
> In the other device trees upstream, the voltage is already correct:
>  - x1e78100-lenovo-thinkpad-t14s.dtsi
>  - x1e80100-dell-xps13-9345.dts
>  - x1e80100-microsoft-romulus.dtsi
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
