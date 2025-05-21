Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1F4143736
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834262; cv=none; b=sNHWBMsl5K6Y69hwUpxTHWt0dlgCArpNMWbqA6KDowrEmmOVmqCCnFOID8uUxdyPMgb/WOhcft4+3cFMN9aClJHSsPb+Qip444Erl6Ao0wIFkZJSzP9c8Lm955bJw5GqexPYXNEeyRFYGNbopi/rm/5X5qKfd5A1OFK6fwoo2ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834262; c=relaxed/simple;
	bh=dE8S8U/P80oKy7v+PkEG7Bznl75i8IVoc76G1GRGRf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OygRCc3guDA5ADiDVp5c/IVomFo6XdMNJ7EsuBTZHEykaqnT+o3/0Do5erubeIGYFIQeAUbWn3hhhL1tHhsaPx6zXBlcsGnYn63jNPRl2B9ZKvl4yHzp5Gn3l+5Cxyv7fjyfuArgXaXrzE+GfF9V2UQhvnVmVNAdd44elSdri5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ykx86oHR; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ykx86oHR"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30572effb26so6288392a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747834260; x=1748439060; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z1dbDjgMLEJrOwumrDgSLpVT4yaU17ZjFGTyjnMHOQ4=;
        b=ykx86oHRpqzZLUu/PhAr12S1HWVP3F9SAavNqBFCef9dPiX7Amh+HvtTgtvoe1ghdL
         4ZVunBabZhX8TKIHZ3+BZ0bEs1E4BEU97/2D/rmqHSr8tjKFOfPNVnsAgqrAYXdLca6V
         4CYl0ihbhDn/ckt4ETo0KEkFVqvcfcmME3P4MvrIuwgQZl6AitENJTC9LzKlM48hiaET
         0Ng5X1KqBAgkJGW9rO4J/jRpDvCJdPvEYskDlwpsRdq9UkIzzJmm6xXj+eF+YaQY7j/C
         TiKmXpZ397Wa521vp2cqBqMgl3Abptd3GsDmYjLXJbpFVXJjmX5kcoxYxMLx9Ck8v6ku
         Yk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834260; x=1748439060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1dbDjgMLEJrOwumrDgSLpVT4yaU17ZjFGTyjnMHOQ4=;
        b=Q5fZps04gQOXmgb4ok1G/OxQJpQ+c/W0gmfYUjaLfOe0VrQ2tC355vWfx3+rAtwTLZ
         YITQn5TbUWo0If9THYClTi5Vgf8+UZ8lT7vg64ijWs/TyIoO+vK1U8tozTKnMcqKPAhx
         t6HAWufLNiwl74HinAEO+xntbzBxINWVQocWlpLqpbyWHgC0M5S94khn9rHqotib9MFi
         OYBxXq6uzqrxQ9lY7cAN2i/J1LD7xmJnxOiCCFFZIjYypBw0GFpsQJ2Zh1UHTyTO08aR
         IjK4HxC5IfRzQRIHLc1pINx8S3YxsWujZAcfdP9I8rua5+HVPdPd2vkk+rCuhI37HJGw
         nNMg==
X-Forwarded-Encrypted: i=1; AJvYcCVUO0YDGlDaWo5mkn7A1Ud7RL1fEIazda0Mf4YEYjSW0PTUWmANgzIdaWhrYd5QjGSzDFMGQbQZiYyUXpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPz2FJeI1q4IjQUhz0MDUoK3zvgptfcfbj7EbSRSkPKMc1Gja/
	ZSTqYllhXrYzeeqxOCthysFSCSygLWIMbeeMWEf8RVF2UjLUqSzxdCrQQ66W6FCWTA==
X-Gm-Gg: ASbGncuav6wGggnkQfmztaHfwDh1MWTxZZf5Qnn6IZBfifVR+o33aC6I+fqpg5yZNwz
	ASmn0qeqjDkOgTX5S6LovI3urYn15Xr9mrFnlWUosjRZmJ3teix9stKMON/Bz9PwK3UUdDzAnNT
	dh69pED4eGWjyId2sMr6vkCmCNfoJYVhibxnIu91/TE7iGB9sXxynBydUrzZDy4gha0tuJXmMcy
	5KHDgi8zLMiwHsEkpa0ILC2qXBepDxH1jVIs2OFc7a6ahrHcjaeP/vbP/rU0Rp+ahhuAZadn7QR
	NfNDcFBdPbv30ezF2nqb7y7cZtftK5Vkly+iqCkd3DN/2V30/DgHsw6KhDHW9FT7Q0qCrLA=
X-Google-Smtp-Source: AGHT+IGPKkuMknbqbSMLVX+JBJd/UAyJcjpyOY/yvUsxjBau5eWt4Mkj+OEXtvgnfC9urBGO+cN+Qg==
X-Received: by 2002:a17:90b:2f0d:b0:2fe:68a5:d84b with SMTP id 98e67ed59e1d1-30e7d4e7e1bmr29895277a91.1.1747834260260;
        Wed, 21 May 2025 06:31:00 -0700 (PDT)
Received: from thinkpad ([120.60.52.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f364907dfsm3632884a91.23.2025.05.21.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:30:59 -0700 (PDT)
Date: Wed, 21 May 2025 14:30:53 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 05/11] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
Message-ID: <z3yfou4oolymsgb72dpakwcsmq6v3gnx64mdals7krnxdhpc2a@lsepak4kc2mg>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-6-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515162722.6933-6-quic_nitirawa@quicinc.com>

On Thu, May 15, 2025 at 09:57:16PM +0530, Nitin Rawat wrote:
> The qmp_ufs_power_on() function acts as a wrapper, solely invoking
> qmp_ufs_com_init(). Additionally, the code within qmp_ufs_com_init()
> does not correspond well with its name.
> 
> Therefore, to enhance the readability and eliminate unnecessary
> function call inline qmp_ufs_com_init() into qmp_ufs_power_on().
> 
> There is no change to the functionality.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 43 ++++++++++---------------
>  1 file changed, 17 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 33d238cf49aa..d3f9ee490a32 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1758,12 +1758,28 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>  		qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>  }
>  
> -static int qmp_ufs_com_init(struct qmp_ufs *qmp)
> +static int qmp_ufs_com_exit(struct qmp_ufs *qmp)

Since there is no qmp_ufs_com_init() now, qmp_ufs_com_exit() lacks symmetry.
Maybe you should rename it too.

>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +
> +	reset_control_assert(qmp->ufs_reset);
> +
> +	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> +
> +	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> +
> +	return 0;
> +}
> +
> +static int qmp_ufs_power_on(struct phy *phy)
> +{
> +	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	void __iomem *pcs = qmp->pcs;
>  	int ret;
>  
> +	dev_vdbg(qmp->dev, "Initializing QMP phy\n");

Now, this debug print doesn't make sense. You can drop it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
