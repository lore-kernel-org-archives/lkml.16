Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3990221B1A3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913671; cv=none; b=Lo98ZlaqagW1DMYe82FTemm6TM8g6sCWoaplF8pyiaVEJtq3qDaOjI4yKWpCtyLqOy4u2DEZqqfW4/Z3ebnOqLPN1mtmJJ6Iu3/BalEomfjggWndsUaZYFmfZCaW9gMNO+JBVVjP61GcjaPiN3rIXD3Tt/owtrJQudgmb9HArvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913671; c=relaxed/simple;
	bh=QhY1KbOXcusObIDMYCPNe5p99wa3NrdvXzFtQ6z9khQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWNB1eMl2b7EjmucgFit6p1lwMXE4Zn2EiTdbPj2+w429qtdr9qmf2abyA7RDdhIfChqE2evBOGE6KCnB5tgbGHDnKKKVdWRGl62o847dfwH5dnA+SWVtD1DaNOu+DDR8locX8NkP0UAW8zQrA36TzBA3kXJOxP1FB/r+AGAdQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kvNPvlkv; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kvNPvlkv"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso11746405a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745913666; x=1746518466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OcP8IwBZTp5ar0JzK1kHZA+Mjpbv/cp21xOcbsfTYso=;
        b=kvNPvlkvcsgQjlqYjDLdsWF9RbE7W4fEty0R71Qai01Pvy4uftfhpoe3H9B6Pmf/6H
         XeYmcpQD6lKJCAOWRHjIyXqnRuHn9R7RlE3DkfL90zg6tlrILJgk+KFS9zce59Ryl8b1
         gsPG+LpvC+FiYVsusU+W4HrjXrtvDO/Hc0cqC1l1i8jRR2qsjJ2Okc12mlevZ7RzGgVP
         RmJ1hJY8nA5dqt3BwmmIuyYhCiKd/0joFXPpX9BkMsxjcVV5Ku60I8C/wL1xOK72570K
         ZWQiUaj5atQqe18UQOb3eVRiqeQLJPlKnrtChZFRlDaeYKh9sKHoSvUBG+cdgNH87DUG
         SmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745913666; x=1746518466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcP8IwBZTp5ar0JzK1kHZA+Mjpbv/cp21xOcbsfTYso=;
        b=RN19alDdyAvpT2NYmM8CgmgKSiclSfaqZ8k1i/PnKNvVsErYOcd05RM9nGWiAeZ+p9
         2DFfDaSiAzPpLEg9byeeNcza2LEKFj4pMsL1ASdfVT5iwfVN438J/hnYtbC9dd8ygigM
         lClHc88n07RVNEVcgf20FQmiBqPNYF1WlxtBX/lZ0Y+Nj/Y9VsAdRWOgUhB/mBxDzptS
         AGbauD8k1g+Jxdmzwx+Yxqo/DzEoCyIuIXxVfOm+BiQFnNErGGeAHIGC75K2jgxBJGYB
         lbDasi6CL3IBIOQqefYlSGfPNzKxF2iKab94hJFWH0FIPCL9qWnnNjur0K/u3JOYJ+Rr
         cpZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg0FKf5CCTx0bRE2fOUlYLi8x5hRAqGzrvi0oWGBiuIhVgBCud5ZcsOibUHIFWdnnuTcF4Si1g3EioUnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvxjOulqe5w2hzUZ7rhpPQG5MX6dm2RQBaZDAtzyXueiRLfL+y
	KppwLq1zM9Sag2pnqAFFaTLFSGUxn027Xr8w2Sx9+8sgA8GPH0sqoEhbE/vUaKY=
X-Gm-Gg: ASbGnctozfLW5cE7NokomOSSSM9umUmpMl2YrEcP2A3qhTOEO4hq1o3xxiXB+AWCWZY
	yp8aT4/y7MM6ZYsTWozqhFv/iBeA8iXvMD1l+bixpc1Fyb/W5VPMb9mlKlBs3onDvsdC2shdw3h
	xWoWTwZq5Tnua87AsPYTR70DBFkrTMBF69yqTs5ZdsK+5hor/PG9ywlO4RbD6Q7xfNhDNhHvQJ6
	Y/kcXeRuwPCMJ9Cyxwpt9ysTh79YTHNy7ejxWi6UCUfr4X8QoqRk2X66oigeXgZRkQXaDwBYge8
	hxLbnB+uiI5/rggeLHlxt3OjJSwzOW0IKMyk+A==
X-Google-Smtp-Source: AGHT+IFm4kes/ECJKNYrt/xy90E8GMVdR2nV9n1atqpFxaZl68uKF3ym9CxshxQxaw2r6OwDCG0aWQ==
X-Received: by 2002:a05:6402:90d:b0:5f6:fab1:ad81 with SMTP id 4fb4d7f45d1cf-5f8392893bdmr1936597a12.10.1745913666492;
        Tue, 29 Apr 2025 01:01:06 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fc361sm7047370a12.16.2025.04.29.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:01:05 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:01:04 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Qiang Yu <quic_qianyu@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-pcie: drop bogus x1e80100 qref supply
Message-ID: <aBCHQMs8Ct8Ow8JR@linaro.org>
References: <20250429075440.19901-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429075440.19901-1-johan+linaro@kernel.org>

On 25-04-29 09:54:40, Johan Hovold wrote:
> The PCIe PHYs on x1e80100 do not a have a qref supply so stop requesting
> one. This also avoids the follow warning at boot:
> 
> 	qcom-qmp-pcie-phy 1be0000.phy: supply vdda-qref not found, using dummy regulator
> 
> Fixes: e961ec81a39b ("phy: qcom: qmp: Add phy register and clk setting for x1e80100 PCIe3")
> Cc: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
