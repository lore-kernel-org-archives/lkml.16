Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D04E23C51E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834007; cv=none; b=ms/IiTwY986ABx7NKIW/yCthf16Z6JgawWjEX2dn329xglK8SGGmO2nKZIbOAiw+ZaIEdYwGO0VT3afWMnINwjxdMgdxF9Ey0yd2f9BN4on3xLH1gKdFS5FnBBKvHj9a0SQnBnT4yR5273nb73GRNTWdZA5+1uB5HdGuZ6B8Q+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834007; c=relaxed/simple;
	bh=O5lp2QoEpMPS2MwUPvQkU43TbDUAVV9V0PVY3zVpypM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSxGtC4g71xcW0AJ/YEp+kziMM5zdTb7v54IlNG1f6Oz/WRICaPXzEPM1wuWQCjklCmVH/zicCoHfQQ4eXwGc4BjZuoC3s+kg4tGMwDMAxeyWlaWROk/LCYa64+u0sg/8/hapk6gvz/xh2Cfach1TGWWzokH5OIBYnnatEAjVSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0Oyl3Wc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0Oyl3Wc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23274dbcbc2so20585275ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747834005; x=1748438805; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vsAPeVY9F4Ep0Af1IsuKENhPXpnyEXq+ZRKN1+hGmWI=;
        b=N0Oyl3WctUeeMrQUOfHgkPgudP/EaGpufBqVz9NvVySvCCBe/4NAOVdiscdfhPlz+F
         X8YF+Wa1EoQGvbesgLOW5O42mSIXqshDB95vWEiJDwUZBsjw0OwY4iisW6ZKSk2Z53St
         fi/eFqA57Jc04bcgq5Pj/jayPVRoslPD4uPR3bocnMPJfOhDznwe1mL1k6hFZCHLvo4g
         yP1pzC9VMQQ1R04g8SVzh+5hOItwdcBxjIbfUxCU+r/KmvPwuRlRcIHc96NOeV/pPzV0
         9iLSpYO0/LPPK2rbb/VtcHlXTGD0F0tDvwUtpsYDJ889qudcVgP154GpunRoxGjnqwYF
         kpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834005; x=1748438805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsAPeVY9F4Ep0Af1IsuKENhPXpnyEXq+ZRKN1+hGmWI=;
        b=bOLzpe0ksg6jk2aeBzCfCF6vyqMDev3mEUB5ZW0INo0RzSBIak5/M5hXfeVD+ZclSd
         kMmZPPte3V1Pk251OZSVX4j3wopG9zTVsg4ozJazAnEg0s6Jo4yuUzYMKfqqVXYbtb/6
         ONjK9aIG/QU/nILgeqArSaSLS00Np9uAu6/2bYDdqe1YQWjpsOV0yL0khdxykqtu13b+
         h7ZPql7QILjXHOfxlyBO23T6qzJ35fcRT6IflCV/UQSBUfqe3CuQ7M3ebm1tniJ3ZXpz
         BUxr2o9VH5AGbYDZv0b6o4tY7RaSNzOv2hONrIFUfzmEg6bsAFnklqYjtlc3XTHGTgBG
         Gsog==
X-Forwarded-Encrypted: i=1; AJvYcCUzhoxykDuYr+K7G0VQAnTe1TbeS6qsgxZzLdJhM5P77Ditum8kx1HoU/7X7MsiH0fxUpF5tVaA6i2lMcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2l/3GLgBjznzkrtSlD215sUDMC539Bsa58eTv0qDE3N15ZLuk
	XBLwgnJS96o/hO5eMq3nggUTd+cMkTPm2pqgCSK46Bk93LOtkQs/X8z7bEGCGcG3vQ==
X-Gm-Gg: ASbGncuVXyzbUem8+lwtNy6NgLSLIHdHAtMf0Mz7ZQ45gkEmsttbfk5ZF42qlDiZ6fk
	gKMqcnv7QXYLbSp+T6vXRjyHwnfTe5g+THk+01e1RcUtrOKJl0hqCth+B/1ybUJqoMY85F5mhWS
	IuzqTe7mVhckYiGUL8134zpxCXYgWAJYC872fnuVw/jwsbCG2yKDl2+YUKVJFRrBgQvA9a74dsg
	eklw/Nf/JvuGYBX12pC9ohjNa4shsJ5PuWVBlZ+3kg8KlvMC0u5Eaip104sDzTSY4tZXsoexEgP
	3z5Z8p0NWIPKU/ZUmTT+3CNg/5eBhLSfvYvBvbg6dMo7Rdtw2VahjiuTb3Yl1jin0FooqlY=
X-Google-Smtp-Source: AGHT+IFBDTatb/Wv2ODO3rVWJekx3BLDAeNfQgIP1zt45t6SjBWL/VcQDCAoRuUemYsln1KAeEC4/g==
X-Received: by 2002:a17:902:efc9:b0:231:fc6a:244a with SMTP id d9443c01a7336-231fc6a24a2mr179505555ad.2.1747834004862;
        Wed, 21 May 2025 06:26:44 -0700 (PDT)
Received: from thinkpad ([120.60.52.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm74691545ad.215.2025.05.21.06.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:26:44 -0700 (PDT)
Date: Wed, 21 May 2025 14:26:37 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 04/11] phy: qcom-qmp-ufs: Refactor UFS PHY reset
Message-ID: <mwcqp3mxuheffc6x7w4w5mykqc57ovmvyrmh3ky5czjf54wnag@fxnxgsoi6y2u>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-5-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515162722.6933-5-quic_nitirawa@quicinc.com>

On Thu, May 15, 2025 at 09:57:15PM +0530, Nitin Rawat wrote:
> Refactor the UFS PHY reset handling to parse the reset logic only once
> during initialization, instead of every resume.
> 
> As part of this change, move the UFS PHY reset parsing logic from
> qmp_phy_power_on to the new qmp_ufs_phy_init function.
> 

More importantly, you are introducing the phy_ops::init callback, which
should've been mentioned.

> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 59 +++++++++++++------------
>  1 file changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index ade8e9c4b9ae..33d238cf49aa 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1800,38 +1800,11 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>  static int qmp_ufs_power_on(struct phy *phy)
>  {
>  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	int ret;
>  	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
>  
> -	if (cfg->no_pcs_sw_reset) {
> -		/*
> -		 * Get UFS reset, which is delayed until now to avoid a
> -		 * circular dependency where UFS needs its PHY, but the PHY
> -		 * needs this UFS reset.
> -		 */
> -		if (!qmp->ufs_reset) {
> -			qmp->ufs_reset =
> -				devm_reset_control_get_exclusive(qmp->dev,
> -								 "ufsphy");
> -
> -			if (IS_ERR(qmp->ufs_reset)) {
> -				ret = PTR_ERR(qmp->ufs_reset);
> -				dev_err(qmp->dev,
> -					"failed to get UFS reset: %d\n",
> -					ret);
> -
> -				qmp->ufs_reset = NULL;
> -				return ret;
> -			}
> -		}
> -	}
> -
>  	ret = qmp_ufs_com_init(qmp);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return ret;

This can't be:
	return qmp_ufs_com_init; ?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
