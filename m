Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9149E1A00F2
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 22:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739052994; cv=none; b=RC9JcFflBbVs3S1LOyJsp/EaPfBh1BkackdNiubdH2M5rUOHCI3AAoVvEeCrNFa0ZKl5BWhhtJvgnx8Dkp3bMGTe27Y6T5B3aUTW6WM7Onv6zbQ7+8T5B74m0YGTfZx40D0BCtmtyQDDRxJC/MuyAnzPVuhZWEuXUsEXOH5JRr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739052994; c=relaxed/simple;
	bh=+7zoeW3589FGpvR93VVSVuFjMsE0M0MVBWjzX/CvoLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEzsTc6Z7ah56b4irUudLhRCpjgtvnNQvNEYFiAv3LPDx1CndgMTl7DfqwbbX8/iMNMYNXpuuRPRjUYMACj6t8U8Gn0MgGzgGnF+BVorUibqfxPDAxNqfs7cf/8VoYlQRGp3TMzQHvBU/a3VEnL67j6/J7QAVc5lJ9NyM4/fd1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L94WVeRp; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L94WVeRp"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54412a7d75cso2842689e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 14:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739052991; x=1739657791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y758qolide2lClu/KzTF1R1Skq7/E6pKo00NOQS2OEQ=;
        b=L94WVeRpumetN/kPz+9hcFfHgcjW/pLjw41+3qyLRCQ3LCu96HwluHt23k8kyIuLK6
         WyiDjT45z4Ty6E/Eri2QnNPrxa2GFYm8PPPW8+JzFZBLZ1xEp4wGX1yrGwr1/KMJOJJO
         KGG0R3Z1l2q/dRaQABRj2k+C7xlbXsRXqcTv4so+FRqhr2mTEiwF3z765a/4sHmTLM3D
         5HGU1AW1AqyyWsSClXDKzGVduxsv0EhVOihxSEcsIuzzDNXPjmNpYkAXgJzX7OXPrEBB
         kbakVD6euck8m9wXUoqBSR2nv4Ka7TgCCmJ4MxpnYC+q03KKMmuSerGbYMlZl+2qtB/H
         61BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739052991; x=1739657791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y758qolide2lClu/KzTF1R1Skq7/E6pKo00NOQS2OEQ=;
        b=eRUlsW18Nl77prlwElz2nb1NeBMQyzPpFQxwHpktiVVJDRg1ltGA6iWBgADRgQHJpP
         FCmRv7q7vWetIpCHqVizYYNomQ/bh4dGxDMNoL/1dv+t9UDsgBH3ZfvVesn5VWF7hKcO
         yv3PT0BYVmEkOFUzB3qh+AkeWsPN+8qWwxn+iAJYA+e3Q3aklGDaw9QD2j+0xzpASVWv
         xmeqloqSjCrLQgfOuzqTR3z/0zSmP5vtPlekn+0L8oXy93M4C4CwhIRd0YpE4pPbkRVL
         SGzgxNpr1c+tgHMd6SxPrQ/6tSv80IHnNHVMaqNeq2FrVC49faSKJmSJ8vlp3yYrSUOd
         I43A==
X-Forwarded-Encrypted: i=1; AJvYcCXdKqvh/DGwU3/EVT/7qlScRgFBCsBEyTp22ROg62DqD7QjkdEUpE+PbzDJyZOPXVVGL/gfPV6vSWGY5Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUr9KL8LTnY3h8HOSSRRWBWVDc1ovJJ6alcqh64yvvj3V9zwNV
	iBhui02jOC9uoujymlEBThh69V3Pfe5f7X147x2cXZZ0DY/F13YNgTQHQAxlRdo=
X-Gm-Gg: ASbGncuCwBCbbXiF+pkFolocZnnHnlVXE3sqr5NOrR2uyQI0niRR/rUqvonUG/t5mln
	f1AJ9j1XFqgORR8kDzqJ6wg3A8u8qGylU/aRtDwV5iga5Qg/GXqNoSZvraV4yB0tV+IlpnSWdP+
	x3gvTGkWj08pLi6BoIKqAV+WEMs+PnaJzNyUV+hMtu4rV2vuRsBR/F7uGFinQpS8pLG4xwgIcwZ
	6sNtx4O97ae2I3CfKHfBVJvMWRFBscsN2aAPPseT5VcOZSwJPv37I22xWBjduRnuYXOXUYfY7cm
	32Xw4MTQObNmfl9uFj6KYeKfjNyIf4qPhu45iaMlbPnQfkiirkMnkrDye62gNZS4TglOksg=
X-Google-Smtp-Source: AGHT+IGS/3Gpk50OVCNMUL7zf9y31rF1kOuu6KzsJaL8XToP36wzYhmmlK+erLwhB/gqSa6n86EVCg==
X-Received: by 2002:a05:6512:108d:b0:53e:362e:ed0 with SMTP id 2adb3069b0e04-54414ae6284mr2410130e87.44.1739052990560;
        Sat, 08 Feb 2025 14:16:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544106041afsm830599e87.239.2025.02.08.14.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 14:16:29 -0800 (PST)
Date: Sun, 9 Feb 2025 00:16:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v13 1/2] arm64: dts: qcom: sc7280: Add support for camss
Message-ID: <4ah6z6lsgxgpjdiuyrkkcebpwrqrfpmumklga24immz5mvmgp3@z7bplsu3q6yl>
References: <20250208165232.2371889-1-quic_vikramsa@quicinc.com>
 <20250208165232.2371889-2-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208165232.2371889-2-quic_vikramsa@quicinc.com>

On Sat, Feb 08, 2025 at 10:22:31PM +0530, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

It was impossible to get these tags in this way. I'm not sure what
happened, but please review them and drop incorrect tags.

> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 178 +++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)

-- 
With best wishes
Dmitry
