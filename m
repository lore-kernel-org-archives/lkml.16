Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450EB25634
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146952; cv=none; b=buThOWC5t+otEsMTKDFX75X+Sz2Rz6cLOBEgKyPt0xlj24MD3D3u7KlCQBc9ONo0p4jy2p+WZvJBZWQ0MGlJ85cUZQ8mFTYNDyrUquwJ6/6r/YcT+L7l8ctv2iAfuUHo2jZrr35gw8a8LVOORnNKj1FpUmzROWA7jwUHMc7XYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146952; c=relaxed/simple;
	bh=K1Jt/PMyy3R9NjxblrEwux7XcHTEGSGgj5ti5f+Hh5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E58drbgglOA+IdBx3aFgjXDr/DZrumEViAn87PeyUyxyKgX5E1duXzanLGIVTkkyno0FMsWNcoq1ZRb4LrxgO/tWa+G2izj2q7chdsZpaRmPT19BBO8AAgTJg/Fsw3HyeSZ6ovS5lATpjA2lKyQPn3hyrIGLrlUhszsS8Xei/mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f6scww6H; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f6scww6H"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0be50048eso4354878f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146949; x=1747751749; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgyk97IfeYVOskXq3/ZxZBDTiB8IvjRjENNa45XTzuY=;
        b=f6scww6HEtiLebqKoFy3diiwc+NdgKBHhqE+fD1j1tTTx0jCGDINFPKA0h4/Uy85Xw
         bl2he21NNgJQPZn5jJmvElJuVGq+yIeHBRo53Nl9uNBm4q6RbqH9TidPULR5PKMszjBo
         OHXw3EoSXDmslwoOj3CkmOMS5wj/Yfq3me00f3qXi9TFzutYJ9kZrpYKVzuKUazStDy3
         nbKMoseCQeu6xfU8pK2bksGWtc7wNKXuSrvQ183nCiAzGaeFT2tWx2j0EwrQ13+Dzy0I
         4ZyG07SvA1EGWCzIaeVJt14OOAbXoDK/xGXZaFg38aLl/TS7a/WEMoVonUMkz1+whvZS
         vt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146949; x=1747751749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgyk97IfeYVOskXq3/ZxZBDTiB8IvjRjENNa45XTzuY=;
        b=XEq9zBaN8rTSA2BG2vUt/IN2nwK+436UITVPMY9WFyP9WJCLbkpTyXFLT47G9VmLkL
         p7iTdSLlnQ4osmXzk1KKHKRLeMhhrDYVVFA5V6omzUK4WConVrvgR9olIH+3MmRgM7Cc
         ZrSA4V14A86gJw07r/e916jSvpd9dDULFVJHl9GSOUOLyQ4dd/bM2NZs46iQYv64BCS/
         qUDstV442fU61FCggXh50UmqHLMEiZxA0WOERI9kz1AWMZBZzCHGd3nkbt01PKBcoC2a
         FG/1U07Of5l9m+rxYXwokfpZohas586jwVh5BdQbRx/AVmcFOGECZ06u9Dp+auVyOdq0
         TtNA==
X-Forwarded-Encrypted: i=1; AJvYcCUJMB8T+eoFD0VB8aGdRGWDHsXZg/uzu9mz41S1RRXmqzafGaGeEKicT6h2ac4yPrGrQPZupAYU0deiv/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz00KGRJ4WjA90IkSLnZOJvKnrzY2rGWj7WA0AGi48Z6mkCwzq1
	jbcKkxa1RC1OdYQ7MCdrSAvMuzxQdXMlfaxCbxbwq3brV71GadiVUIGF2ncE2yk=
X-Gm-Gg: ASbGncu0UV+yPnntF0IxppY+Njy/M9OY62JwX7FuhmctAeXVJYXD+5uOSRMlvhC+uz0
	UmQR9MXI843f8egIpdSB6/YhHBzXeWHemMLRD9FeJNGCDjRQdKtojvFROSVKskpdI0I3mOixLD1
	hPBIGDKWIv1R1D6V+LgirNVqrz1q8DipMXK30fcGfV3I7JsnBYko4yvKwMybbWwyCnrdA6nLU0/
	k0YfKEl/SK+PDLE78X2CvfYooVhS+gRLBZVU4n9RQTz+hg/WgSkZD8FVb/yDQofDOavUoOV9qyd
	+PJMEOVDDDbk+MOWqkow9NHm8Tc4wMK4YhFqoEwo9m0LiTdtXPALCRSjjsTj4S7opgIcpROioCY
	DzilTwFWT479vMQ==
X-Google-Smtp-Source: AGHT+IECI9WPDGbN1PKQdBTuC0zojDWLobQgT9+jZfgetVRbIflVKBhtcHxhKo9cRWHWaWFom3XPPw==
X-Received: by 2002:a05:6000:40c9:b0:39c:1f02:5409 with SMTP id ffacd0b85a97d-3a1f6424053mr13007915f8f.9.1747146948656;
        Tue, 13 May 2025 07:35:48 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca31sm16559682f8f.65.2025.05.13.07.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:35:47 -0700 (PDT)
Date: Tue, 13 May 2025 16:35:46 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Convert arm,mps2-timer to DT schema
Message-ID: <aCNYws2IeRm-D8Fg@mai.linaro.org>
References: <20250506022210.2586404-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022210.2586404-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:09PM -0500, Rob Herring wrote:
> Convert the Arm MPS2 Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
