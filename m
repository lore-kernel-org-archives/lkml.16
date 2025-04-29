Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563ACEEAA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918435; cv=none; b=DS/QGcdI2EMB+41f1Lrf6DsfucX/zx4zDycASwSlgUqr2OjTrLGPKRyO8dz6Xn/AueeeyrAQkyF8oY0datZLdNjRInYFILMLwRjag08cXkffuVxKok0I5xanz5HMY6DXJnOYHkAtUmKh3KQGp0VlWtYy3QgO8tODEs/902ilVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918435; c=relaxed/simple;
	bh=ojbFBLxBWOLMeVLLG0/bl+j+vkEZBTO/8Glt+HvSLY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9vJxnpk1GPZpOp0b1kQNdbnEorLy8rRyw6sJv292cvl3J2nlTrORzfIbruLQ6r05Jt2K9Vesh1N0H+qri3ff4pp2DJUN82bv3lkQZEGmqRSdZGMFNHEZvhmC2dAH1Ss6F47KsTbk+65PBXd1WVmDqNwunsYdRsSp8LMRCfeqvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DT+peg/j; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DT+peg/j"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acae7e7587dso846707666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745918432; x=1746523232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JISw0yLJ6jc6YcIfOl+PZCpgyVPc2PxKayyj8MnuyZc=;
        b=DT+peg/jt7NusEASE+dd8vQQuSCdbC+jD2sIMCGJKR3zB9dyV44Do3C/gpFuMPxUgl
         GztEPNwCxm3UxND6+ROSCmQ9ArG166Fda8GyANTPINyh3Qh4QszdanSPNp4E9nSrBcun
         hhKa8d/egWYre9AjziauY+FsG8euA2gmk737x8hIXA0qSG+HsfyPqhXvsQ3BeRRnhNDO
         Upe40DKX2EdpRaohDwDkAOr/0SyMVttciaKE4aA0dahGy4geQBO+C5F7Z+KXuhrk2RU0
         H0CppnE5IQGGpQLVvBT4T+Ai1RwN/WwKLRjoALS6ckb8GlUTmrO4FBdZgvMArO+1Gxu0
         zF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918432; x=1746523232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JISw0yLJ6jc6YcIfOl+PZCpgyVPc2PxKayyj8MnuyZc=;
        b=eCgXB5QrUVQXFaBOxmDCzVMmHNqtaMJM+gGetfJbDO+Liz8LHaQsP466P4qkTH5FxO
         8vAt7//Pknr/FuNABeqS+aLVu8JahQ6wLldDekVygxWAs1FlBUdhOHceoZwhFvY8nxTG
         6Nkj0HyoViyFXrK91QKCLBOnHde0twBVHmmoR0d8eifL3jiV0QxqpeMKDs3sAVuNNRA6
         pXaZ9dj3vAHRjG2fO6eAKfezAp2ztr19C5mkZ8Ix49JLARUfPo2kdpEy/dl+sE0n8chh
         dJxksorUsa7AJ2Q9IbLyxtL2IEdac+bYLW1hFPu3py8iUptI3Nq8pGX4WtloaxMhg2bD
         ExHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVypafgLRzWgAy6Ap/3yTn7TTcPMNGx5wk4hKvUXNyreTcHgvIiN11LfDIkOn0NwqbwCnI/hYXx2/t4bC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzWBfgVRykUjtSVQfIu25wfPi4NuBRgcwgNXqXOtHv3Gy7IqBD
	Q9x0jFqaNjKIlMOiamXhGp6zmKUe10E0m3Thyh9bj6UOTaoAp8TDNDQMQ8AjK7Y=
X-Gm-Gg: ASbGncsiE8ZoTRaFspQYkKDl1mQmtNdogivEKsoOPyESntIopzAuMIuNT4+bn4HBh+t
	E3P0krkZJXTnKnrP//hgHr4d/R+5ZXpbcQpRiNfZkjuKtQGgV08tsueFp8WEO7yQTIG5hQeABQs
	Y0GGTat5oEjPJXa/4Tl5oG8mkrZXe+n8DK8vg8rOmrKqiDM5aSNpax41gIEHzWX/pBeKrGHigCE
	eOEAyVndL4LcvpKbpCYLqhyY+PqpDY7kysFoIbkGiL/EBHcChOW5VKMiewI+3UljpcQy172HfBx
	Sz7BfAyovd1mieTqIGiJw3VvX7jPMatKwAYyTw==
X-Google-Smtp-Source: AGHT+IHXCvI79vYcat7eXaaL38RE1k9oXOfuLxqW5Qzh+w3vq5VGil+ken99T8Fm/ePM4FpoPbzouA==
X-Received: by 2002:a17:907:9446:b0:acb:5adb:bd4a with SMTP id a640c23a62f3a-acec4b41c5bmr311410066b.12.1745918431535;
        Tue, 29 Apr 2025 02:20:31 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec3933a0dsm128713766b.21.2025.04.29.02.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:20:30 -0700 (PDT)
Date: Tue, 29 Apr 2025 12:20:29 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Message-ID: <aBCZ3RpfuK0DsoQ1@linaro.org>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
 <aBCUiIrg3oehMVjx@hovoldconsulting.com>
 <aBCWdpk2HXPaJPlH@linaro.org>
 <aBCYIMdEPrhMzNxi@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBCYIMdEPrhMzNxi@hovoldconsulting.com>

On 25-04-29 11:13:04, Johan Hovold wrote:
> On Tue, Apr 29, 2025 at 12:05:58PM +0300, Abel Vesa wrote:
> > On 25-04-29 10:57:44, Johan Hovold wrote:
> > > On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
> > > > It all started with the support for CRD back when we had different
> > > > compatibles for eDP and DP. Meanwhile, that has been sorted out and it
> > > > is now figured out at runtime while using only the DP compatible.
> > > > 
> > > > It's almost funny how this got copied over from CRD and spread to all
> > > > X Elite platforms.
> > > > 
> > > > TBH, the best reason to drop it ASAP is to make sure this doesn't spread
> > > > beyond X Elite to newer platforms.
> > > > 
> > > > Functionally nothing changes.
> > > > 
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > > Abel Vesa (7):
> > > >       arm64: dts: qcom: x1e-crd: Drop useless DP3 compatible override
> > > >       arm64: dts: acom: x1e80100-qcp: Drop useless DP3 compatible override
> > > >       arm64: dts: qcom: x1e80100-t14s: Drop useless DP3 compatible override
> > > >       arm64: dts: qcom: x1e80100-s15: Drop useless DP3 compatible override
> > > >       arm64: dts: qcom: x1e80100-hp-x14: Drop useless DP3 compatible override
> > > >       arm64: dts: qcom: x1e80100: Drop useless DP3 compatible override
> > > >       arm64: dts: qcom: x1e80100-romulus: Drop useless DP3 compatible override
> > > 
> > > Since this is essentially a clean up perhaps you should have squashed
> > > these into one patch.
> > 
> > I was actually thinking that before sending, but then I decided to add
> > the Fixes tag to each one. Since it's such a trivial worthless cleanup,
> > I wasn't sure if the Fixes tags were worth it either.
> 
> Right, since it's not a bug you should probably have skipped the Fixes
> tags too.
>  
> > I can squash them if the consensus is that it's not backporting.
> 
> We should definitely not backport these as they are not fixing any bugs.

Sure. Will drop Fixes tags and squash in the next version.

> 
> Johan

Abel
