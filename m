Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4213F18E050
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950238; cv=none; b=dqxzKleSxRzGuk3dPxjnGqvloJgacf542u31HNLu68JaJkAaDKUNrfpL/5/J/qjwvWz1q8KGVRQc/Sy8S/J5J+iDe0hvKfT0kAWCFXEVQhvt89E+jhQnKwdpz5h5eeLpjLOoC4Fevy+tuM4VX1GSJUBm9NfsbGDrtgcbA2tgjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950238; c=relaxed/simple;
	bh=c9BG+dddiuTYPj3MATPxipFhaT5LiNMb0S58a/cOgpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbb2zxq8MWtyLv+JUNg/Wvzejpc9CB+ccTuspZ3ejlEq7R9jxEq0OlD1o+0NVnP1aozrsXppmUCTB/qD8xVhWikfjzhjENUrLm4CMs5ToxNAa904uy4CP3Mx0XnHnYED64mHAdrYVh6cpPiadwVn5k3VJExSq7QWwxzPKFHZtzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZL4hG54x; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZL4hG54x"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f5a224544so9903845ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738950236; x=1739555036; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZvlJDdsD4/VUKIsEz1kRWlYd5CsK3CkVo9g/8YQ1yzY=;
        b=ZL4hG54xQZak2kakYfgjXZk8xudhFzKpCPidZri6R1Zbb4fOmCg3VjuO5pW8IUP/nx
         2bLCXHzhJBFhPVuHL0zx3MRHbE1RqcpY3JtoWr8tOHNdQjeP+oSR+qFvmk49MVPdXSmE
         MaYCV95BRJONU5nZoYtlixzfncO0em3tNgoP/iohlYRew8iauHdZv1bUYgamsXVFGJ8x
         xzq4UBTQODIdKu7etG2ZzuDz+7JBmTulsIjelipANzuhm69TYcF5eQI8EN6vtTAhiYXe
         FpOshCbaE52WhSFUZVk5/roxg497teasvtTRG9bFWfGoVxmrH3KEdWQxpK0mchyRvad3
         VgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950236; x=1739555036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvlJDdsD4/VUKIsEz1kRWlYd5CsK3CkVo9g/8YQ1yzY=;
        b=ZKLnrxPtSTnzPaFKuHN1cwUevJ1UkIPZPSPVImfEHEpF7zGR/r1zEnAAvrUkgB6dqJ
         EtRQkHIsErTHrI6kgCR5s97SCjvAuG6tE5I4dmo1k0C1YOoD+vv6YWvQ6HCuISQZxuHv
         68uO8xSc9MYs+ztIOZ+lP6IgLqC4KeV8A52co6RZ/ocyfUVlp7ptwc1lgBZXfi//oMSz
         1VRYMX8l448HoLDzjmrakhuN/LOpcZ5tVG4DmqYJ8HvuU+rZQB/R1KAQlpn6OM4MFSEB
         aMFTj+1gcy9zZXIziVM0ATneUwrM0b+CMNmtnx5FQD3seytDSwt0dmPDHjPmzI+3dpzr
         5LgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDiLF9YN92Z+XMq6xMe/2ghCroWcfb/zloiYs5O24Wi+bYNzAsIC0Dfl/DvHeuaSVgpwkMN/8kMfcOfK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNKWhxsNjESMBF18LdDIB2/Hvodjq25aqPK5EM+KBkt78OtRP7
	yXEE1WoVcWEL3BDev3MvnN0Au/RswzjoXBil6rjqmPspfcdPmENKp/SH88UUsg==
X-Gm-Gg: ASbGnctqvu6AWEr5em0Y3wGIR5lkgHcAiehJ2Fo7tsuryq3ixPQbTLliCpURxHl3YPI
	lWsU2fpUD9Gw6ow4wTv/np4P+QnNYV9nu6S/ZGC6vrJst2aguGI5lYG4VeyYcsFh049LPlB7pIg
	DWjJC3L7PFxo5Nn/r74JHGpO5ZvGlmfnBxPaCyzWgP/2fxYAciDRSSQnX585CqCdXva3tgOL2se
	cPNm0XRSg2z2SRFzJYv/T78sn9IwXx4x8PR0HUOPG85QBZiUrwO9px+WARMAY/0GX6EjV+kXVxc
	iyyz3b1QG9qLODPXYjxZp0B6CA==
X-Google-Smtp-Source: AGHT+IFYaPnu8nAAzI4VlaiplnIV/qm5sPf037YcNY/ispLSCgTlWlOwIEh32JjPqZCnATuTeyyZqg==
X-Received: by 2002:a17:903:1cd:b0:215:65f3:27f2 with SMTP id d9443c01a7336-21f4e6a5767mr52384765ad.8.1738950236602;
        Fri, 07 Feb 2025 09:43:56 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368a25casm33325135ad.218.2025.02.07.09.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:43:56 -0800 (PST)
Date: Fri, 7 Feb 2025 23:13:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Remove unused functions
Message-ID: <20250207174353.rxsxblcrnkieise3@thinkpad>
References: <20250127215859.261105-1-linux@treblig.org>
 <20250201160721.bgfyi3cwilvibl74@thinkpad>
 <Z55eWunU1NRkV2QP@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z55eWunU1NRkV2QP@gallifrey>

On Sat, Feb 01, 2025 at 05:48:10PM +0000, Dr. David Alan Gilbert wrote:
> * Manivannan Sadhasivam (manivannan.sadhasivam@linaro.org) wrote:
> > On Mon, Jan 27, 2025 at 09:58:59PM +0000, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > 
> > Subject prefix should be:
> > 
> > 'bus: mhi: host:"
> 
> Ah, do you need me to post a v2 for that?

No need. I will ammend it while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
