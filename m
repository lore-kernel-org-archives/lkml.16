Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AA01DC9B0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496990; cv=none; b=Dtp6RhfdqfBxdtIvcCR6nqtMlwEzHNteZM/zB+3ThBfeuvu7W3Mqfw/xsr8Tm1iRtFmsD9R7a0xQBHTojqnnC3gP9d++56fYpkPKfAf2kgVUavqblMN3fNlJVnP7/RpKe9rQFxhHUDMDhbxfsR4QkvTzFyvGTO7OuMfArq7AX5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496990; c=relaxed/simple;
	bh=eAyulgNwDugXHRNPeWxQlca5IJS6fxeG7RYNHW4gZNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJDy9hE0Mprq47Q3PHrTlL+ZWdbSig8HrsQxsqqA2lL9oWE8qk+QfXumY5oTe1wqXdFR+eI1vgFVO8PO3Nwi6kTbfBbYxH3PYa+Ew3+AEGQtKVY/oPGOtpA8FZLYXh4SWMnjqVIMxrIHP+3QDyDuAU0NmAiNeK+Xs6LzwKX4Obk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ldqhGzSy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ldqhGzSy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227a8cdd241so14791815ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496988; x=1744101788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW4RptpbO/MsEel2xtnMMoJ2QXkHyUdyfTKR4GsWHh0=;
        b=ldqhGzSy6RaU4Om1Bfn4pChhNBfj+NzRZ4fDCh5eAphzaUvsWD325OOJb4seEKTt5i
         FNIOg+CtS/dB/XCrgGf1G8e6MIiDkKYY5jC/mthp2BmTYGiGVEfpde8QeSNGm5OLuuvG
         426p9IdzyP4Umy/MHbd430GABj0j4qOCZDghEqV84ibj+puB9hey0fVRUYh4zuiDweSr
         Av4No17P2vypwWM4KM4wx0zi+HoGLHJeRnMpO52OPozDR67x9p0am9W15URl9EthfkaG
         qJ0qUHhCC/3ebfMVFb+8/3sZUtmQNMGxNwOl7rtcQ5OHACKPwgTeF+QPu2IhMnviSMly
         Lk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496988; x=1744101788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZW4RptpbO/MsEel2xtnMMoJ2QXkHyUdyfTKR4GsWHh0=;
        b=B7l82MvAxFL8B3aOxrXMf99VOVj6zFkT/63r8gnyZ7Rony3GpOhBu+JMOVnqAWmSX5
         h7ycHf3kz/HNg2iPQ3pi8yFV3HkAg1OB+uHunSZkZ40ug4w8v65gTn322FmDJ6wu/lxf
         6iKFnEWQhpla0i65+nLpaSmq/DA/rLOhQvt+T2o+8CEqWud4DDrljutTgVCSwt9B6Uc6
         arhTNBGg3D+umBWsf5/5mbLyXqjvK/saH5cIA1BdgMPMh+hVg+Lw2lWUlZ2DGT41FRMU
         5tQmmj2E/eMG10ipEwg5FWuXeRxktRKgiSMbvsZjtJbP2yP2kcE0NTiJznuCtzBdnlds
         kxHA==
X-Forwarded-Encrypted: i=1; AJvYcCVRyU74kvP8HIat210O/iIsli+TjoqyhXgcPwJvED+6DCk6AtYbRYzIxixBfCxLEaBk22d+CHbN9oHyS/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyw4GQMXWZ7KDqdvwTCdcLpS9Qx9WP6ScTr6NKhSDA/7aLnTFS
	RbO2k9lkY/ih2IrprUS1kepBPCB7LxPhDbC96TgE+k1lmnLCgmQORxckRC2NP3E=
X-Gm-Gg: ASbGncvlNz41QDScG646fF2vNPUwAGW/TGa5p5+Bs6a3F51eD/5wks4E6w/lS0D8MhY
	qO4ME+i4s3wXALeeishfFf5zqhshm93xfoKyjhB1ejji6dFHcH3aJGGrcdeppztctKAbZt4NA84
	2zN26aJKSfvMUcear9lIlJHSZccV7i1CxdrJSO5pilLDpx3h0R32HNYYFs1LCTRiETzmKfhwwJ4
	DjJLSR2bDxkXaJKj7IE4M6aWskj4PAl2hsQUYcNWzgzBnDqAIejdr1S7vCWUVq9V8kx+7g8qfCL
	VJUSzXcGc+GUhoA2OOzIYk+npu3IEZ5vf3aFVU/PAqJLfg==
X-Google-Smtp-Source: AGHT+IGfWZI0lHW9gqmfyGE0TUy3057d/eSS3S8FL2AMcp3BOyfnLTFlpo4ryW3cDKuDszcFg3ziVA==
X-Received: by 2002:a05:6a20:9e4a:b0:1f5:730b:e09a with SMTP id adf61e73a8af0-2009f644c21mr19182247637.20.1743496987833;
        Tue, 01 Apr 2025 01:43:07 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba10da3sm7574276a12.66.2025.04.01.01.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:43:07 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:13:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v1 04/10] cpufreq: Add and use cpufreq policy locking
 guards
Message-ID: <20250401084305.setqyk765dwo6jqk@vireshk-i7>
References: <4651448.LvFx2qVVIh@rjwysocki.net>
 <8518682.T7Z3S40VBb@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8518682.T7Z3S40VBb@rjwysocki.net>

On 28-03-25, 21:42, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Introduce "read" and "write" locking guards for cpufreq policies and use
> them where applicable in the cpufreq core.
> 
> No intentional functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |  121 ++++++++++++++++++++--------------------------
>  include/linux/cpufreq.h   |    6 ++
>  2 files changed, 60 insertions(+), 67 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
