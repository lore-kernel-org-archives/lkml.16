Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E92224256
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990674; cv=none; b=KfBHyGq09rhq6sjEBpTMdDnMLj0loyCMdCwgKBLgwsjvT8vQwfKwHRB1p/iAH0YLOYmqMUYTVEBPNPtRJbBa1ibFvO1ekhc1mNw+f5XSaJ8+0HEc3VPvpjDFZxBBXgBJPbnYgLLDrCjBnYZAvqLx9fed1k4ihSA/AgYWFd2gZHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990674; c=relaxed/simple;
	bh=Uxjfr+Ub4f1VRaMSrEvTbK3K+sT8HFGlfYeD9IWevQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFetPooyu2oQYd1P6AxprWf9kZwN7VNIQwjnB56OPqn2iToa0L02VqwLrC2ICD2jurQuf8oruHh4ZJzml4HQUQ44cu+VIRxstMz4jTLJ1OxqQNO2pYV1cEzN5S6zJ8iapp+xhmdU3uDfcGMa8OjNItXtcEJP1A0Whi3taXlV2+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sQENiLuc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sQENiLuc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso112163525e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747990670; x=1748595470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RfFKMGjhmwchkhht92h9c+OKeZQO+vdRnItyg0hwoco=;
        b=sQENiLucUDZhCBiGFvqhyzVAmLgqIzfulv7C9A6hA8XV4Jta+iBMd7PqdJ42jtaxO+
         pEZYUWjFLqdcX5/vtRwGznALPoK4U7J/WPCfdgLGICG9rlRpLe5sAObVx41zp7lFlsNt
         GVEkwXQKPFl2h+JMRtBh+yBLO0Q4Hp7u3MiwvLFCVi7V8AFGCV0AsPnaS84kReF3n9Xg
         tFE0BKBM4oXEnZ2X2CPurAmNlVmly13eAyQom1yw+kl9Lvb1jZ/ouQn/iBOjIWQ+OC+p
         wf994kqF3KkveptiCOtQS1MK33egmeRrHSM99iRKv1kM95wukqApOdctZbxJ19tzXEwH
         gAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747990670; x=1748595470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfFKMGjhmwchkhht92h9c+OKeZQO+vdRnItyg0hwoco=;
        b=L4HSS28GjwKgD4xKJYeCjzBbed+8fv//YjRpvW18RG8mopGRO1sT/EGOjCR2agS2T9
         NkEExRgbK/0cdyLhV4eZJ0UX34PGebVlQ8L0Z0ZZNbs8qIs1w8EptysudJ+w8Q4V9z8o
         8AvC3ubX0w7FESnEPJEvsRRRCDpHJ9pRTUzCEVQWkwvChT0L0pT2CGCepjqzaLxlcKSR
         Z1/B/tVHqCwSGI+zuAAgSdUbDnSIvkfpDYbsjx1ifMQun4aBC90SxO9WrQpfiwqJfpV0
         NSxMoK7VcmteZVkgt4rjQ6A9+mUe7JaZBbuxNRGBbXWLqHMWD645o0efsMCcFIRwlLCI
         DxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGUZuqHNmUl/rjUGbhz4OMSX5fPUiZnTUPQboB3M3/0FC9Jah7cWGGny7AQRqZ+TuPWWKLLgI/U8zmUWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWA0VI7jGUtReVOBP8mvhOvHvHW1R+PbEX1Hs9SSR2LwjU30Tq
	4pR53lDMdW/D7QbNgoFOnHg58Gds881Bmrw4ZDdTF106yzsmaGvEJmd4zQ3VH/yNzHA=
X-Gm-Gg: ASbGncuuGd0Yt7fqD64FziqIoFN/ZC8JTICWgaU03MBa+QOu1OvMfboCAPEK4xuRCCw
	eofJ5crwtsDqUA2BVZuxUtA4QYdMGgHAul7gpTFjnMvHSnamGdatW8UrVGnEONB4rwZ81R2LrUn
	qZ9r1W27k/mbqVWxvu6asyM8painAQAs/U6pDR577SIXsrPyGq8wGwHBjPkTBQT7V3UeNT3J2jy
	Cpe8HHCxP/YCE8/UywNCaqnZT/HSaJRzMjOofWuBrztp37ycNs73FuLkiyV51p9/+aJy8zL2bas
	TfQT0Kn8W2Np26dPS4w4cDAE1kr3oPD7qWxUb53fgNL9eBQw
X-Google-Smtp-Source: AGHT+IHHxrO7RmsC0W9xvWaQ+dC6qT3jdE7nDzcMo1MJLtWEWcqBIqZe1g/PlkKdlnZgRPJUP+bVdA==
X-Received: by 2002:a05:6000:1ac6:b0:3a3:685b:118 with SMTP id ffacd0b85a97d-3a4c20f8e89mr1885140f8f.24.1747990670494;
        Fri, 23 May 2025 01:57:50 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23c07bfsm134127175e9.23.2025.05.23.01.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:57:49 -0700 (PDT)
Date: Fri, 23 May 2025 11:57:48 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] phy: phy-snps-eusb2: fixes and cleanups
Message-ID: <aDA4jM0bb9kR7TiO@linaro.org>
References: <20250523084839.11015-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523084839.11015-1-johan+linaro@kernel.org>

On 25-05-23 10:48:32, Johan Hovold wrote:
> Here are a couple of fixes and some related cleanups to the recently
> reworked and renamed phy-snps-eusb2 driver.
> 
> The clock and repeater imbalance fixes are not marked for stable as the
> first issue was introduced in the recent rework which is queued for
> 6.16-rc1.
> 
> The repeater imbalance has been there for a few years and
> could be backported even if this is now complicated by the
> rework/rename. Since it only affects a resource leak in an error path I
> decided to not mark this one for stable for now.
> 
> Ideally, these could go in along with the reworked driver for rc1.
> 
> Johan
> 
> 
> Johan Hovold (7):
>   phy: phy-snps-eusb2: fix clock imbalance on phy_exit()
>   phy: phy-snps-eusb2: fix repeater imbalance on phy_init() failure
>   phy: phy-snps-eusb2: rename phy_init() clock error label
>   phy: phy-snps-eusb2: clean up error messages
>   phy: phy-snps-eusb2: fix optional phy lookup parameter
>   phy: phy-snps-eusb2: drop unnecessary loop index declarations
>   phy: phy-snps-eusb2: clean up id table sentinel

Really straightforward. So for the entire series:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
