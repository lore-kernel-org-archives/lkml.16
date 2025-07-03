Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94D72EF67F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555395; cv=none; b=Ax1yQNs+tSjaRKM4+0+h/7LZQNHkfvluLYfKMUwUDD6jPPzV8ehVDJ+6d8wkksRMuyfth97SFxiHb7F6CQuMHgbeeH1w+O6MZK6zlMK1mZqfGMI+a7ITmWF9LQamJOgG1cJnwRNnkRIFW+Qu4KaEYHeHleTsqMoEap1QRFapZ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555395; c=relaxed/simple;
	bh=Wsw3m3WVgS2qsRwThMHxPLJn/WaYhLMQQfJFrjeEZQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXONxgyWrJlsq1pBIEEIe7iWZCsg7yOEGvkxWxZTmIGif+8bOtDL4n1cU3uJksKqYZvQPeUs7NdAcEl7dT9mdCx9wn8L1/zSr/GxXrffpYv0CsgV4RLt/QTrLkbtcCUULrky+zmzspEplEmRXCPh5oZtmkx8BsG3QXO66dttgM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H0HNrWDT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H0HNrWDT"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so4986321f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555391; x=1752160191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4xswAcOCiDxtwue83ObsxfZ7pep/Cfzt8s7Ua/cbyI=;
        b=H0HNrWDTAvxJpZcod/ekeOsdb3y3KQH++bQlyxAOeb0/2gb0tacPilTW8Ml64bTE7Z
         dBwhndgBO0gJKNTiixNuroxEPLKJ0yjdz4ZFo3FjYI3MjLjoaKZfeXf3iltfFVCB+8p+
         F8rPpNmENNVQsV5MOTgB0yaPr2R9rDSIgB4sZxenBv5aMBG1qniJgiYqn+iucZRofq0P
         I5yRrpo+QKgbcD54oKNxcsUw8rusdjkK2Am0IQDcMjV4yGWD5+yXqon9okDIFzacN3GR
         z9TwYztMhikWhdt7t5xlHXM2NnxBofv/Os9jbBGHbjNM8w0w8fl9VpzdiegftE9yOTz5
         R59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555391; x=1752160191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4xswAcOCiDxtwue83ObsxfZ7pep/Cfzt8s7Ua/cbyI=;
        b=QBxmr7kQuBH2aAyjvTjQeNsEd4loEGVEXm39dYpFJXooWBF96iUxjEG0p2C3Dh2bOr
         Y8rIHzTrGQKJWB6FM1MUYMzLh/HCgoBZVPfKmR6KPCescr7jYy1dmRMneTKfDsiuHkwt
         qH4WfeleUHVCkWnz6aZ4RwtlelFmJ5ETn3itw7xRumkgRExe8wDlFWgbZwD8zHg36579
         nJDs9up7KmRK3m8F1xfotfg7+ZAYgBPEMAsCHOkxXazILSaIyhujCjPDdFm77/IXgyl6
         hJBk1UlNUZRB9FAMyH/pSqOfdqxprCkUzNsjAhDbhCgwhgi93WfiIV5CvLOqqtyb8Qi5
         9QoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxhfA+7YkA5qsig3IyhgDLu/HEaevnvNxnkAp83AyctzVIlMS+j2VeXc+Sq15dfqNBLMo18xcRtizLys4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzozblRWK30/x/+m19UkwhYQfqbN8cz1Zy+Bb5c3s0EV5+1TK3l
	vGXMn/GsC+hcP6xyKZJVxmFfjHF5w+C0Jk9tjnraq/+x/pf6X6SIMt92HcI1lg19xXk=
X-Gm-Gg: ASbGncvo52HMupyVn3QMZQ6/huP3fVdwON6iT3Nqf2v74Y519wXiXM8eDcSDstATJyM
	TMuonV2ADMS5lIJ2pGttTvVmliFY+ppqfHgLg2v4IYSrJRh8ktFHaWy4edq9DWHrtYaM0Zkpm2t
	w0qUk0+SUS0aludck1sbDP2laWJZeqb5Vr0sBkVy06DlZcXU5PkTN+Jacs8NvVi8DEEj52NLLYc
	8Bav2gjxnGclC0yRZ/E7v4c05sPMklhVUfBmhhBszPHuA2lV62DLMQ3c7/aAy6zSaNVxk2tLNPU
	YnWUvhs6D1vYN6d7j0FZX6tbPIuz8Ha9LJR1eR3hmFIe3521CXSRLfnjs/I=
X-Google-Smtp-Source: AGHT+IEmRzbd+GUqMa9EtpxZkxLu0N77USju2BDfKfk5a8aVAGwl1ML9f6DqwUQeD0xjX4cStIATAQ==
X-Received: by 2002:a05:6000:23c9:b0:3a4:e7d3:bd9c with SMTP id ffacd0b85a97d-3b32bbd66bfmr2181064f8f.17.1751555391014;
        Thu, 03 Jul 2025 08:09:51 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290d670sm10712164a12.30.2025.07.03.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:09:50 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:09:47 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Message-ID: <aGadO/7e4ndjK2Wg@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-5-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-5-b378ad796330@nxp.com>

On 25-07-03 11:40:24, Peng Fan wrote:
> Add nodes for LVDS/DISPLAY CSR.
> 
> Add clock-ldb-pll-div7 node which is used for clock source of DISPLAY CSR.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
