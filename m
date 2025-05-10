Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E4A1D7984
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 06:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746858698; cv=none; b=XJedHYKgHVoM9VpcDYGX+G/Y1wwj5bN+eJqOH1fs78ScvefMILr/icGmMVtlAqtXJ0jhws+peMw81sL/j7DH8CMvfJn1Gc3GpehbvBPQ+T79RYzNgJxbowgBXuB/uuzpcwVvINLeKYkFDbcad6Zx61ABug+bbTErKL2HgCRpJ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746858698; c=relaxed/simple;
	bh=/CUWNCKJLlL2ZUz9MqaxNPY5UPyrCzuEVCDqSKKaiwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTCNn5hJFBEsZQqvuZL9KMRfkQ8GkqMM8QSI0jEhJnZN0fKtThqMv6uSwd4cJeo3/bvMNOZ3b34tbL1f0wv5kFVT7/feD3aIdB9NW3BjNs8OUpSMqa87ZJNfs7UOTHpd0YswrGZwIzWYwgwXduIHff6fWKYe+V8Mdtxunar/FM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MVXIBFaN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MVXIBFaN"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0be321968so1522887f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 23:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746858694; x=1747463494; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=al12x7untsw9gT40SLDOdxEjze2k19FQIlHKuwT2kqQ=;
        b=MVXIBFaNTzcJH/anR5qym88MwkABM+Zj7KoL7uATZcH+BcrAecC9frL5VeS0sVdzdi
         hUJv3H9ojh1IGvebhzIZkbD1w/6ZixvlV4Qdke2ddT52SO8kUrjsCP0L+sbHUuMy8TPq
         OBLL8tROouoczzulH4wuBAmedzNO3y1XAiQes2ZVN4UmKsvhAns6yiyH9zNA5Y7xWcPy
         6NHTOR3EB4XXbB4UwUVIrXFzK2zEPnVyWg+8b/S3HHkmOxwDIHsLOIeJcExhv5WjdvEm
         2RcvTRvBZxupHzftBZLBo2042CXYaCwZXXcKWUj+CSvLlBgMUTBWrKI/zRN15cBJrU01
         Pl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746858694; x=1747463494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=al12x7untsw9gT40SLDOdxEjze2k19FQIlHKuwT2kqQ=;
        b=kCA80/4KKnE9MHvCOJckGV21vJ5hVbI2teuqz873VvTG8hpwokUeOhxq+zzz6LUV4J
         PGltmaDiO3kXmU8hJS1KCtpcoKd+fEp1SKau4CW1SNoUOjsofH7eUUTDcNNwGt1TDWAN
         SB/p/uJn/pX4dEBvBdUEchvwLsssnq77no6Mgf40/AsN3HoZOe+/hoJ0Ar1ajXy4Gp6w
         Z4vLNHH+ExCmQBqVh0opZPDMjsAXPCLc6i9/PFme0xIolh+SB9thVym/Fevatvu+8taw
         mwJV1I3KZT9arIhuiSL2vT1TS6EqVyuWhKbNJ0kU4qh8M14gtvVHFQGY7hrwzH41eDs7
         Sebw==
X-Forwarded-Encrypted: i=1; AJvYcCWnXlVpG0JwfqC/PxEM2oDXATEcvGzNl8dH8AmYMThD3frdVA6d72Bz1fS+vpZFVuiWufFTUlSInbdixP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCe/m8j7veFw9VugkvyD4IKZNX8Dh9GPd3Z9+Xpp2PX2nXqBzW
	c+rT0MboPkzclbQ6r2Z5yAv2JI4iggguWG6byyH4tbU8Uj4FAC+jDP3k0k90iw==
X-Gm-Gg: ASbGncvo6JUGkxhIlzSesbqln2OHI52Yfvfq4BNMrhNtbIyBOBXGU5Ls4eerebf7YC7
	+d67GPzOJtlZlPBG2k/qVx2gKJgLzdgax4T5AbwF/Y0gSF2lx21zE53rqcW1pQ5eqg0hMNxb4Pr
	RcjDTjLmCC04s5yx7an0wVOORdEiBeqcB2JJP5Kebk+XfjkvPLLHKmdadhBWoTA5oDXWMeG7WAd
	GwIs4N8QCRVvjagJD/jLH2cSs6LvpszFh8xZ1N/vhFL4OenF3zFULw6COhbQCAx5jHeeSOjUw2P
	wsw3iYGrB/7XkJDdr82ZC6PCNmt8L63MmNYJoOhyy1T2myRGhe7OXyaxicM+Hvxjc3zbPVX2dfV
	NsGMCYWjFZ0plnPJn4ZTrpeD+68KFyJunUw==
X-Google-Smtp-Source: AGHT+IETPcny+oJkB2S2QRPRO7MBeUeS+pHJgVEZyOPsrPJBO7sk8jq/SJTSNUR5nO2ekoZ3PrRZwg==
X-Received: by 2002:a05:6000:22ca:b0:391:454:5eb8 with SMTP id ffacd0b85a97d-3a1f64b5c99mr4768988f8f.48.1746858693887;
        Fri, 09 May 2025 23:31:33 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c583sm5351182f8f.84.2025.05.09.23.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 23:31:33 -0700 (PDT)
Date: Sat, 10 May 2025 12:01:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>, bhelgaas@google.com, linux-pci@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.14 382/642] PCI/pwrctrl: Move
 pci_pwrctrl_unregister() to pci_destroy_dev()
Message-ID: <tfil3k6pjl5pvyu5hrhnoq7bleripyvdpcimuvjrvswpqrail3@65t65y2owbpw>
References: <20250505221419.2672473-1-sashal@kernel.org>
 <20250505221419.2672473-382-sashal@kernel.org>
 <aBnDI_40fX7SM4tp@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBnDI_40fX7SM4tp@wunner.de>

On Tue, May 06, 2025 at 10:06:59AM +0200, Lukas Wunner wrote:
> On Mon, May 05, 2025 at 06:09:58PM -0400, Sasha Levin wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > [ Upstream commit 2d923930f2e3fe1ecf060169f57980da819a191f ]
> > 
> > The PCI core will try to access the devices even after pci_stop_dev()
> > for things like Data Object Exchange (DOE), ASPM, etc.
> > 
> > So, move pci_pwrctrl_unregister() to the near end of pci_destroy_dev()
> > to make sure that the devices are powered down only after the PCI core
> > is done with them.
> 
> The above was patch [2/5] in this series:
> 
> https://lore.kernel.org/r/20250116-pci-pwrctrl-slot-v3-0-827473c8fbf4@linaro.org/
> 
> ... so I think the preceding patch [1/5] is a prerequisite and would
> need to be cherry-picked as well.  Upstream commit id is:
> 957f40d039a98d630146f74f94b3f60a40a449e4
> 

Yes, thanks for spotting it Lukas, appreciated!

> That said, I'm not sure this is really a fix that merits backporting
> to stable.  Mani may have more comments whether it makes sense.
> 

Both this commit and the one corresponding to patch 1/5 are not bug fixes that
warrants backporting. So please drop this one from the queue.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
