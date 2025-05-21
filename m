Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA51537C6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835423; cv=none; b=UShG1A8kyEDM5oVXE7gCfMtBcpeEpzZcwaoWGML3kZ5i+mXA38Pz/noa+4/GXN1k+BdaeC64X37pHYAQSSLKPYrh1PSAtr7kuBaeh0QG9NYA+zTAObpfjD3MU+xHqu3PTZcAnmcS63hX7mHmPnN9hDx4MQi51ed1Ax38649J6oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835423; c=relaxed/simple;
	bh=dINc/wQptmShY0mwOEHtFWIvstwWFCTzk6X6+/JBI6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRp33Git3YTevinVX/ouF1swPZJkq71TsSv29iFf5/u1bCAtwthKAkyXjM7FLIqrAmqVmFRhHG7QdpLWPJZuCI38Ejg2QXnHjOOPeAAHYpjtA0S2Doi2HyClj/BPh80KaqBjppBKDN3mDunhvhDtM6I7tM+Q0NdJNlK0qn5IWJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3qPqget; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3qPqget"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b1a1930a922so4725624a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747835420; x=1748440220; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/dGaJJt/HUGpCICV62UDPM8z7U1rRYbsKxH587Gzyjg=;
        b=b3qPqgetEf3GiDwfbGcdsb4hqaAY0XrK5lXwb4LPWkYhbGL2gob9EyNbBai3BDOHie
         BzxD6cqRcez38Au7gNcjK8uCvstsGHoVWZT+U/7qrLk2h7spwvM7yn6t0fuTHK/VAffK
         yurm4euX0yVSs1U0hXIfY6dBAYQUYZlF1Kq8LhKjrUxuIQ7aYCuyUOWDQtbZ6ahrHHlc
         hUwAss6CSnrKVaxKAiH6aT7xHtv+YNDmh8Qdo3rn7b7pPUPr1xTL5I5F22XiXffZBTCk
         VWG+2sbcDPo5lhO8iWB66em6oAlEHPUJahXiprR50K3IjhxY+bQ31wnD9itLgqREraHs
         d+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835420; x=1748440220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dGaJJt/HUGpCICV62UDPM8z7U1rRYbsKxH587Gzyjg=;
        b=jgQUZWk3LRk2kv5SMU+YvTwzFISB9V5k7doN6qLARBAA5j0y7Xj5U+U54WfPlWH2qX
         ehi0fSSbW+RlgmkEOjrF3jN9fQZodcjIduDUgmEbE5FZE2WMPjteghEXRzPPUgcKB+D6
         m6PjDmeecl3geJj92bJlrQ1lEVN8GTwABmM7M8LDD6chxrYsxxJmJp91NdNGJ9WK/nXp
         xmTYda2FIvl91oWAjjb33Aiirnux9TnohT6NOkeurTJ9TlfUitsdax3qRJwvJQjnd1pu
         8PWy+5gJYaqCt+F3O0rc8u7N3e8x2usxRDrbkiannex/UuJ6nfadH+rGUNVrv7dgq2F7
         k2QA==
X-Forwarded-Encrypted: i=1; AJvYcCUiGQqT7OpT1asWbDNGpGP2/hghVRxzq8g9JEkqhXf0XUGDEBZWhlwEFeWamA9PogsEGkIRHLutY4CGgxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc2y3vyV1Wd799jMS97xMgoty6YBic3JRj0h/7DEXRDaMLqTW+
	zGSmq5cYrt59gvLIby+IuG+V2tk0+6NNkYw5mQlOopan78qMYOmXW3p+gqOdQqmjoA==
X-Gm-Gg: ASbGnct+n6pECknRd9qm+GcKA/FIqbg0KsJlQZzEm9Sktrshjhb2Dta913qaxtTCJt6
	bz9mA6gygLAlc2y+TFFCGnpYE6eQnV3X+MDiarDv1i03Byld2N0QLj8wDja0VDyYLIB5oEiC6hg
	X9EVeibEHcyx8Qkw1N91TXpzrRU5VLsogCbjy8gu0AmGNvhV4qoVFpSTjAJCp8T7W/kJFtJMx3W
	DUc8D7txNwXqKR0lz7VyOrYX1kU99PuKNPCjfAmxBpcWjHWlpA4MwvhRLk4ZZ46W4j9jsAdoosy
	2lt9oNvlIYMXszxA7k3UKvdKTVyM6Xoh1rKWPbkdoc4a9+nvdEmqehoMr2Qo
X-Google-Smtp-Source: AGHT+IGfMgSZ1dyR31dRP9yWXfsiqsI0mIJuLiXZvdVwQ7ECl4Z67oe/m7O50OQnSlM0QTvqwXQ/Jg==
X-Received: by 2002:a17:90b:4f4e:b0:310:8d9a:eb1c with SMTP id 98e67ed59e1d1-3108d9aeb4fmr4087282a91.21.1747835420269;
        Wed, 21 May 2025 06:50:20 -0700 (PDT)
Received: from thinkpad ([120.60.52.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b22a9sm3660292a91.6.2025.05.21.06.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:50:19 -0700 (PDT)
Date: Wed, 21 May 2025 14:50:12 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 08/11] phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
Message-ID: <heork6adpw526tfljo2cpexevplpjrlgjgeyobidvzqlsubzlc@6vn6jykxpwqx>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-9-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515162722.6933-9-quic_nitirawa@quicinc.com>

On Thu, May 15, 2025 at 09:57:19PM +0530, Nitin Rawat wrote:
> In qmp_ufs_power_off, the PHY is already powered down by asserting
> QPHY_PCS_POWER_DOWN_CONTROL. Therefore, additional phy_reset and
> stopping SerDes are unnecessary. Also this approach does not
> align with the phy HW programming guide.
> 
> Thus, refactor qmp_ufs_power_off to remove the phy_reset and stop
> SerDes calls to simplify the code and ensure alignment with the PHY
> HW programming guide.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index fca47e5e8bf0..abfebf0435d8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1827,13 +1827,6 @@ static int qmp_ufs_power_off(struct phy *phy)
>  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  
> -	/* PHY reset */
> -	if (!cfg->no_pcs_sw_reset)
> -		qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> -
> -	/* stop SerDes */
> -	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL], SERDES_START);
> -
>  	/* Put PHY into POWER DOWN state: active low */
>  	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>  			SW_PWRDN);
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்
