Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E37F25B673
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209859; cv=none; b=nQaOfvE4T0C/JICQxuqHlkgsQixiH/EVawcaKkYO74N/zLP4Z0dHADCERRYAfRMhUw1CGACkTFkB56y7IQkztjhmhQ74DZpPM+rzG1M+3VyazoJuZeDpCbsOkypmavcuVYilVeadr+4n4A7U+OYI9ZO9NJzqlk2gGJA0u6flHkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209859; c=relaxed/simple;
	bh=qjygX3ix/T7jMxCMAduPGBq3DaxTTWNMZZOiGqy0xGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgSMZSOxJR77Op+hxSswSkbLwLlwiK7ougVctTAlDBdtEF9Nbkze0DLeL/HoQYN60tXGrUolOAL5vK/T65w79an0s44EpuNpZOswaZefaAk1JsoppFYDDGBPshMZbG5C7kB84gYkAB9R4/7Dz77TwkSbN4zpXtocSidjWzLCQTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJiuqtYM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJiuqtYM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f48ebaadfso76529715ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739209857; x=1739814657; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xWPFKrbvd3HnH42jQjsMh+P9N25O78u7B+hTOvkNtnY=;
        b=pJiuqtYM2XCuY7kFLjlCDTG9bTyoxYH9obNTg7Ow715RLLUScEk3nv2fbGENNcRfNp
         hJaqIrSaKjlP435IvPmSal3MTGw2wV6jTK3qSyweCtnFbrAT7wL5HBDcZkab4X8YGZ3+
         f1g8vSpS1vXyE81Pcw8kvS33CwJdT9GCFfNNeuqmmnxuWQfy8KSKB+c/PRNNNW91m2a3
         vFJMO42/82NWamyKvEq2SoF5TUEaPFKA70s4unyPXCGieea/T0mCCjPE27oMlpW0qgee
         6rVWrdtSl8phcR4Of9C8Msm7RPw92Pr3jX2gwQlfZN00i+PHyw3OvvkcplGiy4ZI6CTt
         kjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739209857; x=1739814657;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWPFKrbvd3HnH42jQjsMh+P9N25O78u7B+hTOvkNtnY=;
        b=b4DnIqVJCUCA+RRhgG+3VU8TWvNEO8KbSVYa5RDSESAczQuFu3oylKgjFOzsay1947
         vF7+OA+H0nO85OBsa7W2AVqVr1odVVaGDohrND4afeUghKhHlM3pAeZiOGmjR8nO3MyG
         0S9gD+h9Ttf0ep8/RZI82EMWVdxNvP7r6MSt2U9lRX9MfjFsMKwbJupRoO9lqm8cdrWy
         tD1FFjUoPJBRMlh9H3QkCcSe83q3WN4Mh0LZeaD8JP4X9mtwGeF9v0QTKd6l6LxL6096
         r3SvKOistNJL9Gbi1cuhupcLM8Jwixm2BekiBWwO7sb1kAkMvszYmtyoZb5+75sjEmNj
         Sh9A==
X-Forwarded-Encrypted: i=1; AJvYcCVbbaPHKZL2mRawucG98Ss+SfiD+pmFyLv7veR8EB1zc+C4ivd4YUTv4QG0QJ6uu9+csjSk0T7xwUjoruw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4XggfvBGAsk4FGIulqaT6mlmBRtLDmnweA1dELTncxmPp7pT7
	suoTheBNvcDhVa0RZ8UGd+pyA9cPo7C+WDzuUa8/4FlvoK6TSi2OggfRrchVdw==
X-Gm-Gg: ASbGncuuZhAqSGIwL+uazGGK38xeE+2b7w9Zma0kSEJJFqaa/OEr4TuyxxQVZTOTxjF
	ehBCDhKZVRkQQghERrMIw8Q9A58rzF+x/GzR6DfMfSmq0nUa4rCL9w4ciZMO8hwe/3EeT6sIVTc
	kMDLR08tyrEJ/qiJjod0UycVEJfOXCq6ubrtgyafsKlEXrK/h1vE5b4DE64mmSRNqCdDecsuKgx
	xABjkS4BK4jEHSbk8rzv6vDoDtDUsSg8vdFxioe6fBoX+QnhQBIfHYSRAmdNxG2K5Lya0wLCMTQ
	bq2h8DpBWrxia5ukrsL73s9+DK/r
X-Google-Smtp-Source: AGHT+IGtbZw/NgP42jW1Z7xgQG1GHDjEFsx1JKxCoQJn6ENkeGLdeqR4hHKH09zZWNuwtrtvr+1Ecg==
X-Received: by 2002:a05:6a00:4883:b0:730:75b1:721b with SMTP id d2e1a72fcca58-73075b17628mr11426977b3a.18.1739209857442;
        Mon, 10 Feb 2025 09:50:57 -0800 (PST)
Received: from thinkpad ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730796baa42sm4348694b3a.107.2025.02.10.09.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:50:57 -0800 (PST)
Date: Mon, 10 Feb 2025 23:20:50 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Vidya Sagar <vidyas@nvidia.com>
Cc: Niklas Cassel <cassel@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"quic_schintav@quicinc.com" <quic_schintav@quicinc.com>,
	"johan+linaro@kernel.org" <johan+linaro@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Krishna Thota <kthota@nvidia.com>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	"sagar.tv@gmail.com" <sagar.tv@gmail.com>
Subject: Re: [PATCH V1] PCI: tegra194: Add support for PCIe RC & EP in
 Tegra234 Platforms
Message-ID: <20250210175050.5htfgtgkyrfcjtre@thinkpad>
References: <20250128044244.2766334-1-vidyas@nvidia.com>
 <Z5jH0G3V7fPXk0BG@ryzen>
 <BN9PR12MB5323E59E530FA1F87DE3C7FCB8F22@BN9PR12MB5323.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR12MB5323E59E530FA1F87DE3C7FCB8F22@BN9PR12MB5323.namprd12.prod.outlook.com>

On Mon, Feb 10, 2025 at 02:25:43PM +0000, Vidya Sagar wrote:
> Thanks Niklas for the review.
> I'll rewrite the commit message add the following line
> Fixes: a54e19073718 ("PCI: tegra194: Add Tegra234 PCIe support")
> 

No, please. Try to use the generic ARCH symbol dependency as suggested.

- Mani

> Thanks
> Vidya Sagar
> 
> ________________________________
> From: Niklas Cassel <cassel@kernel.org>
> Sent: Tuesday, January 28, 2025 17:34
> To: Vidya Sagar <vidyas@nvidia.com>
> Cc: lpieralisi@kernel.org <lpieralisi@kernel.org>; kw@linux.com <kw@linux.com>; manivannan.sadhasivam@linaro.org <manivannan.sadhasivam@linaro.org>; robh@kernel.org <robh@kernel.org>; bhelgaas@google.com <bhelgaas@google.com>; quic_schintav@quicinc.com <quic_schintav@quicinc.com>; johan+linaro@kernel.org <johan+linaro@kernel.org>; linux-pci@vger.kernel.org <linux-pci@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Thierry Reding <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Krishna Thota <kthota@nvidia.com>; Manikanta Maddireddy <mmaddireddy@nvidia.com>; sagar.tv@gmail.com <sagar.tv@gmail.com>
> Subject: Re: [PATCH V1] PCI: tegra194: Add support for PCIe RC & EP in Tegra234 Platforms
> 
> External email: Use caution opening links or attachments
> 
> 
> Hello Vidya,
> 
> On Tue, Jan 28, 2025 at 10:12:44AM +0530, Vidya Sagar wrote:
> > Add PCIe RC & EP support for Tegra234 Platforms.
> 
> The commit log does leave quite a few questions unanswered.
> 
> Since you are just updating the Kconfig and nothing else:
> Does the DT binding already have support for the Tegra234 SoC?
> Does the driver already have support for the Tegra234 SoC?
> 
> Looking at the DT binding and driver, the answer to both questions
> is yes. (This should have been in the commit message IMO.)
> 
> 
> But that leads me to the question, since there is support for Tegra234
> SoC in the driver, does this means that this fixes a regression, e.g.
> the Kconfig ARCH_TEGRA_234_SOC was added after the driver support in
> this driver was added. In this case, you should have a Fixes: tag that
> points to the commit that added ARCH_TEGRA_234_SOC.
> 
> Or has the the driver support for Tegra234 been "dead-code" since it
> was originally added? (Because without this patch, no one can have
> tested it, at least not without COMPILE_TEST.)
> In this case, you should add:
> Fixes: a54e19073718 ("PCI: tegra194: Add Tegra234 PCIe support")
> 
> 
> Kind regards,
> Niklas

-- 
மணிவண்ணன் சதாசிவம்
