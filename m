Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4665D28A3F7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628857; cv=none; b=mspXNSeUdE2mfiUG2qlkvjDtf+uF+wr+KhGCGOW4Hb7vrT0t5S1FWz+vdP8UkuMSmrLm6dyxcuHaG4GpC9VHmySsSQTfb0zIoEUS3G4MvLBKg9+cRt6PIuYEa8hU9k5/vUYJOxf05tPgt2nEtMAZhe0ALryt+qSL0VgJSgqrF0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628857; c=relaxed/simple;
	bh=8V4ceruG5PBgZuLKk3o6878Go2CYJK67IJGXeFBYrDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEs0R9sRjZE/WOxSQnGe59/uagcTSnBz6sfuleSFxZhECJfqvIpvRd1jqvtzhrGulhBLv9xG8Sfadpn7iCpq5MtYp5+TZha/BbhMRbawGan5g4okiejmlEI1g6b3GOO/9thctajj0oh6e6VSIiFzhuRtPWD9dEUuK/d5kE6wVXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DunaRyoB; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DunaRyoB"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af9a7717163so4331402a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744628853; x=1745233653; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zFEHcpXAxg/GC10Ly7Ug5qKPKL7Q2jtqdYskUyHbzxU=;
        b=DunaRyoBd3M/pwedP13T+U0hsvSp+qVKtSN9Z18TfFY2g5HlivOl1SMCzfa/y2f8q3
         9sm4qhncPvMMiWbuektaUNIGGzJAqQeMIRFd4CMbN3nntyx1TPdrQAutBoZBfFedpntl
         27CaQ/o1kGIFHDtJ3ApoAbxcclHUzgjO+VOonsJi3oX6+zlmERzY7puyY9kq232WiW+Y
         qjdsmmjNEQRrAE30LW8Q3kni5B7fZzKo3mjyDFFss09cduE5/IGwo2eY6+Miogcrkfuw
         +WUXafnT7YELn6Z5C+TfuGPNijjadhzpFEvuGETNBAU8DiMqYv351qDtUaP5DDZl4beT
         uVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628853; x=1745233653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFEHcpXAxg/GC10Ly7Ug5qKPKL7Q2jtqdYskUyHbzxU=;
        b=Hyp8MAiUwuUZrZmeRBODZLDYsu+PfBZytGRWnqwtOVrWSbWW+SAwUm53J3L99P5qi4
         blLpWm2aaKfU/W1D0Ltf3QC8KT4RlUVcGUGSdZhi6curr1PAC7u1UrPuUm8Bt8AX8JwF
         8yGVOw+YPh+K0gMr/YmD3kI03c1J39lkDKXUp6TbHuGIxFbuAT2TUz0TxLO7Fw0R0iOO
         Lr4OSgleWkZ2VtX+pMtP2PNPoQSCquSifW1TVDdowfsWGMqXYoouyjE9MGmKyJqIauDD
         xw2ZqTdRMnpCwRg4TX/a6d9W5wbBN2T5cZ14ATY99Q9bUwcMjpym3KvW9SPIYpq+fKHW
         TQkA==
X-Forwarded-Encrypted: i=1; AJvYcCW/aT31KWdYCbIrqXofB1o/KO1tWLgo98fXuxIuYz0YbrOx/UFAZIiWQHAiWtNEualipST50wOjy2VeckQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzERNxymoUMBZ81KFgc3vn0sha3R1BDtGA415vdlxuAUbMNPpMy
	BP3P1XzQphDZsaSF2EiMwwfjcWYy3VP9j8nsfjteVETf0hp7dSadZ/5DGFyY8g==
X-Gm-Gg: ASbGncvgY/6A6P2BUVsLdFEMhjcEZp03JGLC/Fz7B3L6o+DC+WpCrGgjMXxWK+FEVUo
	lLEiyNINVOOTrDYZ9eSnWPMpdz7cOIq3fIs9gPPONwcSp+MVilGhAhwXaX5vp+CYCidry+Wbphu
	6t4mPqTE4rf7b66Z3qlqNmTfYcHIHqhtyleXzLGitBu5JcBazAjgh1/GVtgSNogxE303/mUksgk
	yDvo7Bt40kg38UEuFpiXcpZnREUlxwhSxoZGDauBAejRtwpoO4IGE8gbIYELL6gc09HZLnc1WVz
	0zhH5foaJV8ZdMqzWKFF8wDPrXuR/xz9EkQATx6lk1kFbc5yMpaz
X-Google-Smtp-Source: AGHT+IEG8eqgQ0Y8mpznX22CMbhITM96DhKYisQrcLo2Fr6NqPnURcoiXx+TnDQ54ctIZmZC2+bn2Q==
X-Received: by 2002:a17:90a:e7d2:b0:2fe:a79e:f56f with SMTP id 98e67ed59e1d1-308236344famr15907930a91.13.1744628853242;
        Mon, 14 Apr 2025 04:07:33 -0700 (PDT)
Received: from thinkpad ([120.56.202.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b62dsm12164634a91.26.2025.04.14.04.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:07:32 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:37:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org, 
	Tsai Sung-Fu <danielsftsai@google.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [RFC] PCI: pwrctrl and link-up dependencies
Message-ID: <uivlbxghkynwpmzenyr2b3xk4uxeuqf6dow6ao4mptcnzygrw7@ylfqavr3ry44>
References: <Z_WAKDjIeOjlghVs@google.com>
 <Z_WUgPMNzFAftLeE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_WUgPMNzFAftLeE@google.com>

On Tue, Apr 08, 2025 at 02:26:24PM -0700, Brian Norris wrote:
> + adding pcie-brcmstb.c folks
> 
> On Tue, Apr 08, 2025 at 12:59:39PM -0700, Brian Norris wrote:
> > TL;DR: PCIe link-up may depend on pwrctrl; however, link-startup is
> > often run before pwrctrl gets involved. I'm exploring options to resolve
> > this.
> 
> Apologies if a quick self-reply is considered nosiy or rude, but I
> nearly forgot that I previously was looking at "pwrctrl"-like
> functionality and noticed that drivers/pci/controller/pcie-brcmstb.c has
> had a portion of the same "pwrctrl" functionality for some time (commit
> 93e41f3fca3d ("PCI: brcmstb: Add control of subdevice voltage
> regulators")).
> 

Yes, the goal of the pwrctrl driver is to get rid of this clutter from the
controller drivers.

> Notably, it performs its power sequencing before starting its link, for
> (I believe) exactly the same reasons as I mention below. While I'm sure
> it could theoretically be nice for them to be able to use
> drivers/pci/pwrctrl/, I expect they cannot today, for the same reasons.
> 

If you look into brcm_pcie_add_bus(), they are ignoring the return value of
brcm_pcie_start_link() precisely for the reason I explained in the previous
thread. However, they do check for it in brcm_pcie_resume_noirq() which looks
like a bug as the controller will fail to resume from system suspend if no
devices are connected.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
