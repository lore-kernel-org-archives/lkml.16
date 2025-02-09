Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C201DF98E
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739118594; cv=none; b=FFRT4z6GMpn4zccWlcDhU5nbX4HEBjPBXJNLR5lC6LeYaPmH1NbD5/vOQC5zp57TeyKY383Q+iJY/ZI96ofGgK05XRHc7Zw59d1BMAjvM8Scq1lFtbkVdSyezieisSX+bpzT2ifrYwljVOsvFlSsqs9qofn4e6OjpoC+Cu67Y4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739118594; c=relaxed/simple;
	bh=DtQdODobD5Mx3g14PsoAutzDTfvkFPnqEOr4yL6UY8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmKQSACtPXSyZZX2CmjKvWxChJKziIKcGhQk4ZVdt2FJdnz8c2WtEVPN53pGyZYQ1ZHIBoEAG8aJmvvpABiTmdJS5j8YRonyv8qTb0je9dxKGbCq0yplnuxQTaDizGOtyWP04kzScnaXm6cDxAriJQ+XZsRbdluSejTb+Ywl9yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lu/dJc34; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lu/dJc34"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5439a6179a7so3865410e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739118591; x=1739723391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CBBaxSpqSP+CW1UdUykgwYZL/97FlmN6t4SFUigusvk=;
        b=lu/dJc34nlf+tNhk5b65pDeHJahy0uc6eYaueWXMoF7Q5kmZ/bYqfGVDIiiHrQuUo1
         Sc60EKVpjPpiWjcQ05eIoxno2/iNrERr2GWkY9laSYHFxkcB3wuAV4gTG/CO9kgW/kTc
         d0FI+jpQQw64qcWYtlu5bNjsaI7vyWqtudByuf46RYi89K5tlUJXyX2kXbvjMPSHl40t
         XLIvIANt56AVNDMJfdh4wIk90/oqfsLxzhKsbxKIXrOBSm21ikQZLpwUKg8obFzJm5Bb
         ZjHA1B3AlL8v9d10mu9R2ZIWstsb6zma1pTkkXboeKty6ZzJLjQbfUvgtIxffMsaXHmg
         yV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739118591; x=1739723391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBBaxSpqSP+CW1UdUykgwYZL/97FlmN6t4SFUigusvk=;
        b=frQPYriw4BFLgbHsG3BQ28UrVjwK1QJs0z/kqgeUF+snS50TGUGYdSnpNDd1tlKwfL
         1a9XLviut7vFVbVrdKa0nnxvWM00qzHrFIMq5SsWvp4YrEBzzDDTteBkOxcNlLzfOHHN
         5nArU+H5dT9dYSxY+RpYdksZ7R4xnPhS3xUCohmiKEBBLYSlIsMZf+0/nlmr67lC7prm
         +PvLoT613iZkbOPmeY7IvW/S8k8gg9qLRTgYus7LphfBoUj82loZ7NTMqIADAD1TAJ9Q
         jLyddhSuRI6VLEaEDw1iypaAfc6mUrULVhX4wE+v4SHQZF03oh3k3AFVLrMZhak5WrNR
         9SEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0qSPQlPadJweQslj9kq9x2ErrhwJJ9XBgbTbbrODx8oKSeT0nZv4WzC0dapAGW2YFG++hfv+xccSapPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIToKynjBeUQ/cLDHWhY/fHrYT0GMP0Mjs/dgcgmhnqNh2A4o1
	LzgTqvdWMoMpEjPjkQAwBreh9yFmyqjSoX8njs2NlSi83eOAQAoSaLy8Vxeqp2c=
X-Gm-Gg: ASbGncuqec1kOXahnmRwGvMkbDX86GYJtX/eMtk7diSiXLFRCSKYxSjiP8vEAnu1FqC
	JovBz1ed4Eu8XYoJcuhw9x1bQzbCkGEGPOcgIAw1RwnWgGeUrF0q+IUDBVdliuMBLmwACiUGWqO
	EmgWXAo1rjleoQBkLwzNsKomlXNy5wBBUEKQZEBq9v25obA61OqxxVcDTS9fMfgmXqhV0L7U0F1
	XQHHzsidNScAH324Y5XnTve+E1lQYHqt8AZHCK+4OH1njzoChG1AxGAmgrmtN/LOYdho35Zr86A
	kg6B5i9QY/ILdfT57tC5eXSkIgXzvayTWvwM6lOlkTue91qSGlwd79NM7ZMKRG/+hGp572s=
X-Google-Smtp-Source: AGHT+IFzize2yKjpIdEHEa0CzVZP+PJ8P5Q3H+Z4nzXrwEuHJD8mwDugjc4mCpltXZ8b6WnzCOQMjA==
X-Received: by 2002:a05:6512:12c7:b0:545:d70:93f1 with SMTP id 2adb3069b0e04-5450d709519mr22207e87.11.1739118590771;
        Sun, 09 Feb 2025 08:29:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450a76bc6fsm182100e87.241.2025.02.09.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 08:29:49 -0800 (PST)
Date: Sun, 9 Feb 2025 18:29:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
Message-ID: <ah6nusoouth7ziu3iscxmafm6cxuwwebxt44ixsjmesp5adwc4@e5lnbztds2xd>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
 <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>

On Wed, Nov 13, 2024 at 02:18:43AM +0530, Akhil P Oommen wrote:
> On 10/30/2024 12:32 PM, Akhil P Oommen wrote:
> > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > 
> > Enable GPU for sa8775p-ride platform and provide path for zap
> > shader.
> > 
> > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > index 0c1b21def4b6..4901163df8f3 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > @@ -407,6 +407,14 @@ queue3 {
> >  	};
> >  };
> >  
> > +&gpu {
> > +	status = "okay";
> > +};
> > +
> > +&gpu_zap_shader {
> > +	firmware-name = "qcom/sa8775p/a663_zap.mbn";
> > +};
> > +
> >  &i2c11 {
> >  	clock-frequency = <400000>;
> >  	pinctrl-0 = <&qup_i2c11_default>;
> > 
> 
> Bjorn,
> 
> Please ignore this patch for now. This is probably not the right
> platform dtsi file where gpu should be enabled. I am discussing about
> this internally. Will send a revision or a new patch based on the
> conclusion.

Akhil, any updates on this?

-- 
With best wishes
Dmitry
