Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36E2126C1E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246919; cv=none; b=AIW67cDHu1O+dUcQqzq5FbXScznTI8cVE3RbkmuPtMy8PRoLeuVm+pQmPu080XKWU8bCck2YgvM6Owmypki6rtnPAuMpTO+NIu2Q/bHpQsMQ/2PsIGofLER8IGiRgg6S+1wF5IY8brSmbdZDRuP2sgy0tUIOq5bmnudTf/fZp0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246919; c=relaxed/simple;
	bh=jQ3hPyo6MvdIOwOXtTsaVk7R+i4esjZYB9+oxnCFFtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkaWykBEyvf0ZWsC94VC4nTysGW6gldNF18Kcp+zXyv/24pmcSNMJSUpKoNXefgNSjnEUoObCQTJf8iI8xIOPAHK0f4erv5n1rH+9TtYDzwKR/GD0blGlo7g7oM8j0BH6Sqy3beT/wddujp7tshOanly270DRtmw7KxeZTSm9UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iHc4jTFR; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iHc4jTFR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-225df540edcso51476345ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745246917; x=1745851717; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zSfLQ0ZocQ8Cc1F+LLIj9Qo0IKOtbGFRHofDF9JlvyI=;
        b=iHc4jTFR/JNHoHS7/Wqis/yR5fkgOpScoRcy/Y5DwDECNtXqIzbykCOK193WyrIhF8
         G6eKH5ts0t5PW73PMbsv3TqIEPKS+o0rkaNcdPQDr99g5cEOvHxYZX3aQB5p0LLFo5gE
         pNVaHOLtXUuJBuD1dl5ncBLaPKdkpcb8O5bfwdPRyb8qBfpvvQ4AwOS/SDzccuexgxzL
         kBGLM8tOkQmXClk6HEIS4MPsvXuGGKlZoL3Gb/ZvRrZ28wt1HYtJQ/Mmsr2KK6yW9uMZ
         KWkToafLlhjQMJZ4wenVU55WxhLa+s2HATrj4IPQHKzr5MIvSemcj2vYa6AJz19c4J/I
         zylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745246917; x=1745851717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zSfLQ0ZocQ8Cc1F+LLIj9Qo0IKOtbGFRHofDF9JlvyI=;
        b=LbeF4ak/TZmnINstd5fLTQCSsLGqXR3u9OgfqRRtCSlWOCeKLjP6ppmiJpx943Y7U/
         bmNM7DEY7VzAFK5gqft7TZN0PiKy1ni4ZHgN90fM4P+RcT0Uk1OsGF9fHSMRRxYwJxOF
         0Jbgejv6N0UNt//CWeU6GaSXXKlBNErNHnIJW1JYmjDWKsgMpPc/Zief67H4D9ymIV1a
         lAUlpCeZdrrMZ7d/2nd1aSXlCEi73aVxkg9FwmRDayGJVyw+0PMLoJWz70Uaktdl3mnU
         QoRYLPDlYIHmw5z+6fq2LBgVX/wSxeE6+tKLjpWqD+eOyw4oSnakJINWPT6BgMuuNofL
         RZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCXl6BVOx7zsX+qhJkHNEfoqq4Zw4lNLPJsb91zWI+Zgf8srNquM60zngIJa90GDYKEOKNBvz4EqReW62ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhK5MW0VwY4xeyqpnIo7qvxn9+pwJPZ+ky4F/m8qyFrc0jCpwi
	sEfViJMoWpFLfFyjBCXG3omDaF7cZAQnoNy1o8mXOY75lQw1OpoIDJ8rAVO1gw==
X-Gm-Gg: ASbGnctyiLp/2LubbotA6OWjWzivAdmsKC3AAJcBQdb+obHwetPQtYjB82Vu2ZwBGE8
	7/iNriknR0R0zQFpHPnpGFxIZk6iCjBWJa8f7TEYL/SZ+BirrhdZc48/I8PCugEQqRO/yZMuWcx
	Zz3JDoVW80yAFi+0Al7rQ7bgbEmYQdYycjDSpguUzTle2xe4Wa3+TR0k+ow2ET2+rNXWaBzA/vv
	7cerLIIclsUIPaANrbXhE4WfruAMnR+gEcfwuqH/O3o5Ri+7s7jn8yxwFziQUMTsXGLsRUnF3pD
	ay4RRjbHFLxKT5rAXd/8ODyOxDNtdlm54RwYp/yrvwbF7S0UeaqsOUP0Fxjf2K0=
X-Google-Smtp-Source: AGHT+IGLyVgf/HQ4DSOk1F1wHKJSkand7jXIg3hSIBpK9iwhMih+xeFlCH/OD/y2+M6k4Dl6AH84vg==
X-Received: by 2002:a17:902:ce82:b0:224:3994:8a8c with SMTP id d9443c01a7336-22c50befbf2mr187120275ad.8.1745246916945;
        Mon, 21 Apr 2025 07:48:36 -0700 (PDT)
Received: from thinkpad ([120.56.203.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfae9e77sm6662709b3a.160.2025.04.21.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:48:36 -0700 (PDT)
Date: Mon, 21 Apr 2025 20:18:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, heiko@sntech.de, 
	robh@kernel.org, jingoohan1@gmail.com, thomas.richard@bootlin.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
Message-ID: <vtb7vd7xbdoct3k2ck6nqngevq3os7t6iof5vyxnfoutingjpl@juhcjyp6qstp>
References: <20250416151926.140202-1-18255117159@163.com>
 <aACoEpueUHBLjgbb@ryzen>
 <85643fe4-c7df-4d64-e852-60b66892470a@rock-chips.com>
 <aACsJPkSDOHbRAJM@ryzen>
 <ca283065-a48c-3b39-e70d-03d4c6c8a956@rock-chips.com>
 <aACyRp8S9c8azlw9@ryzen>
 <52a2f6dc-1e13-4473-80f2-989379df4e95@163.com>
 <aAC-VTqJpCqcz6NK@ryzen>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAC-VTqJpCqcz6NK@ryzen>

On Thu, Apr 17, 2025 at 10:39:49AM +0200, Niklas Cassel wrote:
> On Thu, Apr 17, 2025 at 04:07:51PM +0800, Hans Zhang wrote:
> > On 2025/4/17 15:48, Niklas Cassel wrote:
> > 
> > Hi Niklas and Shawn,
> > 
> > Thank you very much for your discussion and reply.
> > 
> > I tested it on RK3588 and our platform. By setting pci=pcie_bus_safe, the
> > maximum MPS will be automatically matched in the end.
> > 
> > So is my patch no longer needed? For RK3588, does the customer have to
> > configure CONFIG_PCIE_BUS_SAFE or pci=pcie_bus_safe?
> > 
> > Also, for pci-meson.c, can the meson_set_max_payload be deleted?
> 
> I think the only reason why this works is because
> pcie_bus_configure_settings(), in the case of
> pcie_bus_config == PCIE_BUS_SAFE, will walk the bus and set MPS in
> the bridge to the lowest of the downstream devices:
> https://github.com/torvalds/linux/blob/v6.15-rc2/drivers/pci/probe.c#L2994-L2999
> 
> 
> So Hans, if you look at lspci for the other RCs/bridges that don't
> have any downstream devices connected, do they also show DevCtl.MPS 256B
> or do they still show 128B ?
> 
> 
> One could argue that for all policies (execept for maybe PCIE_BUS_TUNE_OFF),
> pcie_bus_configure_settings() should start off by initializing DevCtl.MPS to
> DevCap.MPS (for the bridge itself), and after that pcie_bus_configure_settings()
> can override it depending on policy, e.g. set MPS to 128B in case of
> pcie_bus_config == PCIE_BUS_PEER2PEER, or walk the bus in case of
> pcie_bus_config == PCIE_BUS_SAFE.
> 
> That way, we should be able to remove the setting for pci-meson.c as well.
> 

Sorry for being late to the party!

I agree with you that we should set the bridge's MPS to MPSS by default. But
doing so would have an effect on almost all platforms. Also, I'm not sure if the
BIOS would've configured the bridge's MPS to a sane default (I'm just
speculating here).

So IMO we should limit the change to platforms having controller drivers in the
kernel. This way, we can get rid of the MPS hacks from controller drivers (like
pci-meson) and also make the change less invasive. If required, we can make it
generic for all platforms in the future.

Let me share the diff I have in mind as a reply to hans's proposal.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
