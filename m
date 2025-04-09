Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66CE265626
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217808; cv=none; b=fnrY9Qf35tgtX404uS5UIHicfKSvVQBy+wEzkbIJYWZ71anoVlGOgRpvlgaZPmMvm+3UICtKgNyDePhXmtn04EUlmkSv9klvYuuDcGqXwShshXn+Hg0l31HR5qoi/ImSSCweEGU/LtW+qjZSbaoVCpGA4o80TpQ3VDlyeConsas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217808; c=relaxed/simple;
	bh=Bqdf1Et9LwlA+0JPynFGPhGeW3rXhOgyuKTlk9gJvKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roF6Te/o+UlKuFl7FJNjLD8Cix6aj4husMeSiZkw4Memwz7BLeQFNNbHUuxp+9nxJaPcP84FuzabSnBKCiyPa+e3QdsBn6I/5QOYWsMGiffteJRJBJ+3y0ateKXkSCPTFHdw92FiprCuOnjttNZfawprpCkxNsS+FT04JUf9UXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYkQpO8f; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYkQpO8f"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227b828de00so71313655ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 09:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744217806; x=1744822606; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+/H0ybkUq7HVu5uBj7V7TDncclF2UN1EMmyx3scUCw=;
        b=cYkQpO8fa3uXJq/wthZ0SNVpl9yM/Iss25zef4xWFjF8MxnKw1KwvjYSeSz2evzwGr
         uXWzznU42360YZkpyUzV/iFw6v8aqWd7iWwt8aUh86U+W4+Klifrdjz3RXzfxUoh6u54
         CRMLrmysltdT56/27tINIV00FdE5uzx6Mvuf+RWnhbJKjc6qSwPMNm9thByAJsX07/Hp
         QIgY1QgtPnFN1hOroUZnBMQZnuio2aBjhMzM899s0nPqLp/heSOGo69ojKrhSlu0zqgV
         sYpLXmKIV0//skFOM7eZc/54kp6DZZDcN5lBM61Gcx6eYC1if+FfTzxvrjKDbmV2ZzB6
         HtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744217806; x=1744822606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+/H0ybkUq7HVu5uBj7V7TDncclF2UN1EMmyx3scUCw=;
        b=BmvzosM1csm9uhfjIYno8ojalDSXzx7A/66YOZb/LnstI0dRok75RAJk27ZBM4FpK1
         xRTkfljlD+6HvuWPVZA6ozDz/57urvabqwPJuDPoqPtdtosLL4A1/FBp1x7vsL14s/27
         U2i9FHOzwZJDKu2Ie6/tCg2RT0o3zOPrHPg9QSYhr9YQIQC8QcQFHaFjofrnN6VuCaSZ
         PK6LGYSdMjxpM8R+sqEzyh3COL6WKwez2e++x/LWS1Jw3Pe4/2+bZoAuiBm67tMenoJu
         PP3n6Q1srpZCMq7tgnpYllshlJ662evRHWb371VUIcJHkGc0FCalE/kXQ/gvYrXNdPTJ
         2WWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnH21Oc9fw01dsMh3h1XgzyOh9gJS1K8TvGzJ/TV/HmfhcK5HeN5Wnk4dmW6JsS+kJ9RSJUX4ZcdoZSsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjLr9emy9v3rC8N1gMIkLlOyXRmQ2smT3oKjmL71vGE7RxRQCw
	2SIf2z9jviURNguc7d16GnUGYlUexseOkf6JZZHCJhu4Kz8JuHQQx3b/vWjOhw==
X-Gm-Gg: ASbGnctVU3p7vDuPYq4Gb1stiKY1UuIxiPv4D0KeOvO2YlET0pITiIz7AnlgRbIDGBl
	xGBpJ0u/W9AEc4ZcZCOLYDw3U3N4o/526eT/vj3k7fuXv1eX1R9xG5TNng13AF2/HzDz+uBCDcs
	spioqEouMNaMOgq1aH0S5EdOiRLy4iA9nKvdfLc8qkpxFCc2G6w7yk165LKribxL9InTo3xhsgH
	AhP3N0nRtkxyn2L1ON/eS3U+uLEdrQOXagu6HB5Sp7L2dmaIt2D+hCLdanpMW4TmWZG5fxD84Cd
	SiHMccQ2/uL0Bu+kRJ6viAKgUHgkRqpRW1MJte2CZ6n1RmIU4J8=
X-Google-Smtp-Source: AGHT+IFz5w1COIo2PYC62wmrQx0adK5Tc3rBe8Psp1oZp/1xQGb6NWLXzX+rUW4TKFX3JOsAMmmtsQ==
X-Received: by 2002:a17:903:1787:b0:224:1220:7f40 with SMTP id d9443c01a7336-22ac298441fmr50556105ad.3.1744217806079;
        Wed, 09 Apr 2025 09:56:46 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cda517sm14384085ad.250.2025.04.09.09.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 09:56:45 -0700 (PDT)
Date: Wed, 9 Apr 2025 22:26:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, vigneshr@ti.com, 
	kishon@kernel.org, wojciech.jasko-EXT@continental-corporation.com, 
	thomas.richard@bootlin.com, bwawrzyn@cisco.com, linux-pci@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com, dlemoal@kernel.org
Subject: Re: [PATCH 3/4] PCI: cadence-ep: Introduce cdns_pcie_ep_disable
 helper for cleanup
Message-ID: <itmjxj5kuy7cloeplhwqxyumcx7rrzvdudxilg6fswrtxqcl7l@oa2uvswe2ups>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-4-s-vadapalli@ti.com>
 <20250318080304.jsmrxqil6pn74nzh@thinkpad>
 <20250318081239.rvbk3rqud7wcj5pj@uda0492258>
 <20250319103217.aaoxpzk2baqna5vc@thinkpad>
 <Z-vN8_-HJ0K1-1mH@ryzen>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-vN8_-HJ0K1-1mH@ryzen>

On Tue, Apr 01, 2025 at 01:28:51PM +0200, Niklas Cassel wrote:
> Hello Mani,
> 
> On Wed, Mar 19, 2025 at 04:02:17PM +0530, Manivannan Sadhasivam wrote:
> > > 
> > > While I don't intend to justify dropping pci_epc_deinit_notify() in the
> > > cleanup path, I wanted to check if this should be added to
> > > dw_pcie_ep_deinit() as well. Or is it the case that dw_pcie_ep_deinit()
> > > is different from cdns_pcie_ep_disable()? Please let me know.
> > > 
> > 
> > Reason why it was not added to dw_pcie_ep_deinit() because, deinit_notify() is
> > supposed to be called while performing the resource cleanup with active refclk.
> > 
> > Some plaforms (Tegra, Qcom) depend on refclk from host. So if deinit_notify() is
> > called when there is no refclk, it will crash the endpoint SoC. But since
> > cadence endpoint platforms seem to generate their own refclk, you can call
> > deinit_notify() during deinit phase.
> > 
> > That said, I noticed some issues in the DWC cleanup path while checking the code
> > now. Will submit fixes for them.
> 
> Could you please elaborate quickly what issues you found?
> 

(1)

dw_pcie_ep_deinit()
	-> dw_pcie_ep_cleanup()
		-> dw_pcie_edma_remove()

But dw_pcie_ep_init() is not calling dw_pcie_edma_detect(). It is called by
dw_pcie_ep_init_registers(). So dw_pcie_ep_init() and dw_pcie_ep_deinit() not
symmetrical.

(2)

We are not calling pci_epc_deinit_notify() in non-PREST# supported controller
drivers. I think this could be fixed by moving it inside dw_pcie_ep_cleanup().

- Mani

-- 
மணிவண்ணன் சதாசிவம்
