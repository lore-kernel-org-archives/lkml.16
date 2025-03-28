Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F26E21ABD1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162494; cv=none; b=C04FobU3/X0AWB8LBH2FrHwIWms92Jad8skHvSg3rUMfUF8BB982znwTStEkihHIA2UL9LxjXd4E+5m43c3bEe11e4wzDJK17JuWP1Z1htg7z1qqwrC9z0OJ4MZVCTEmJt044F318FWm/9Zddff8dwswSA2dlck2CU0GB3yR8l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162494; c=relaxed/simple;
	bh=cE16fnSOvZivKFHC4zQdYYvzlgv6Zjj6Dj+eXgi5qGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRKKXHbf4HL7y5wWQqByaJXjPRMKU36Y31VpoCT3fIU9zrA+v5gKejIvAftosdwd/d/fmXGf13V1yngZ1hG0vjzBbZAPaarfydYQDc2sJ8ATjSEJNkTXrffaSaaeT4GhkEgF+a1nqD61bfqi0c6p/CibhOKsWMeQTZA4853nQF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qerq+QpF; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qerq+QpF"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so3682207a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743162492; x=1743767292; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Td2A/QQBRN6mIkZVEPKhOMec4rSaELJjaXeK/AIS/TM=;
        b=Qerq+QpFPNuq3OG7h2+SDzsnOb0G7P+pejPEpDfFIPlVNFlBhoxyedQK92JbQNC/1g
         +N4rXb5M9ZCVaM+4zYnWlgjsElM3lFnooZVkkcS62Ux7hKCH4yS5XYi96axk1NQTvQaD
         0o6XmRMAHt9Msoz+j7iava6YOfUEuH4EoV3IP2H6BVDkRl+wrYB/6UMfWiH8d1UecpXX
         J/Ce660t8RZmKihGNJBKsG+JsrPi1Tds2belHNHfm0K0+SLMNUSzijgwMb15p0uMCarF
         ipvWwievVPzTmU4+MStRK36IClIYI8yi8w49D59vkCcnpfwCI0iM4SGBuQp8OUzrI7Yy
         AtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743162492; x=1743767292;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Td2A/QQBRN6mIkZVEPKhOMec4rSaELJjaXeK/AIS/TM=;
        b=D+156ot6Sx3O8Jeuok0/rWX8kYMA/JUD5BTZ/+7GaHwtNkkA7H8vmgh3FveZuyrKjm
         EcVoN8gSyn4RJPbdSupMWGmM3BJGSgG/QAFT+2Fin+ckiBlJfpXg3b2+y/cUPw0G5zbD
         VO0N054UJyyitqMU5oVm/oo++NR/74cVid6gzLfhR1lcGi+gPPm0VMXUnGhO8FrtvmWy
         TFUSMLLGJM6GSK0HVWadJDewyb7wDs2PhfW7klUyjoQfl+SJzT3iReVboFmoyqPtuXry
         9DmUoXCJat7m/C9l89Iy+FFqqIORH5at1w6j10ZsgBISMHM0Qt6Kdmbx6vGTOHpJOxmA
         pO5g==
X-Forwarded-Encrypted: i=1; AJvYcCUIXqZmqeD+u/xU1xTzT/qKemE3FnddqCuhLog2m4ErROoZoohsx1qAhNNAlq76h5zScLx1Xe8VJ5qZ8Co=@vger.kernel.org
X-Gm-Message-State: AOJu0YwplbhIfxPieAFtBQajFJtusE9FGxqeclvUpq6WNNo67HpqUz2W
	gnwLyNFWMZash+STQfF/HiHyWr7SVoUy9FaYvnmBBDZqIoPQDigGRQ+HeczPHg==
X-Gm-Gg: ASbGnct4dqTQdfTdpjwlk6j6eWMarrUotGwDFutrN1iXOb6jXxn1U+0dwqdgwUgj7KU
	VdQVQ66+v4DDj6zG+XFzhqDbKJYmdfgwnRMc8Tfzc+kzTWNfcIo71ObrF5aq/xKZhfb/nfKDeyf
	J5n41Pbw5IVp57Abs4vQ4yABxVAlWNMJJ37vXYIcN1hTagqWJfE/JRi8BSv4Dljai1I/bwesnNx
	9Ti72qyvf9Zt2onQgoo4Itr8CRfwaIRX/bGE/a92LGDV2w29A2cbQbLPvG2qbZV/EC5iBPvBEyq
	swV7RS1wDBmF2FpWp9Wub9t+tF/GCAgqCjzoGGqmEnKdtAjk14dX2uV+/ZTTJ9vdBA==
X-Google-Smtp-Source: AGHT+IHkFyrQLO8ThGmZA+vIQj3/oOedMM4lGeaL5SeGczjykX6lPC7XrgIdUY3TMx68guIRyMVfjw==
X-Received: by 2002:a17:90b:1ccd:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-303a7d73279mr11051363a91.9.1743162491754;
        Fri, 28 Mar 2025 04:48:11 -0700 (PDT)
Received: from thinkpad ([120.60.68.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4ba4sm3942816a91.31.2025.03.28.04.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:48:11 -0700 (PDT)
Date: Fri, 28 Mar 2025 17:18:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com, 
	quic_mrana@quicinc.com, quic_vpernami@quicinc.com, mmareddy@quicinc.com
Subject: Re: [PATCH v5 2/7] dt-bindings: PCI: qcom,pcie-sc7280: Make elbi
 register as an optional
Message-ID: <23cjiqtpyzuprvhezrrrbayxweahazlnelswkv4axrc772lpra@tgegltyd2355>
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
 <20250309-ecam_v4-v5-2-8eff4b59790d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250309-ecam_v4-v5-2-8eff4b59790d@oss.qualcomm.com>

On Sun, Mar 09, 2025 at 11:15:24AM +0530, Krishna Chaitanya Chundru wrote:
> ELBI regitsers are optional registers and not been using in this
> platform. Having this register as required is not allowing to enable
> ECAM feature of the PCIe cleanly. ECAM feature needs to do single
> remap of entire 256MB which includes DBI and ELBI. Having optional
> ELBI registers in the devicetree and binding is causing resorce
> conflicts when enabling ECAM feature.
> 
> So, make ELBI registers as optional one.
> 
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Wait... I never suggested to make ELBI optional in the binding. So this tag is
completely wrong.

And the change itself is not correct since ELBI is indeed present in the hw. So
we cannot just drop it from the binding because the driver is not using it
currently.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
