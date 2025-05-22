Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3A9279902
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747904005; cv=none; b=QheltrnoCE2bKsSay33yc/AA0z/kwUKC9fpHRiFNh5PihI688WH+23RwA/BpaI3Fg8ayVs9q/8KCKqyA4RXuSKstEpB2UkfVEcctgQ74ikOf6KTvn7YeuuS33pXzb+pf2sdZ/AwhpUThhAV5kYRskYDcH5PgppetzLTM0pGR3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747904005; c=relaxed/simple;
	bh=zU/z3bLOlzuSQkcMtTCVJsX995ruiIR5eHpPKYALmb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZBXYEw7zTqZII9kGNjXXuzZ+an968h8tm5m+BEbjTLOiQqtBaoRuniqbZBjWEJoKXinhwT3FLdjXOhUcCYS6TBFh+WeuQh8D/Lwqco19WuRkYLJ/KgMOT9kYgdS7mNtLaqU/7YNG3dIRlV43NTUFIz8WDZsk+neRWyKhvUiZ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RnuX/zGR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RnuX/zGR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73712952e1cso7172549b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747904003; x=1748508803; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wE/Nk3n7Qj543anMoi03EY1HELsp/mGZ1M/Gx4pgSIs=;
        b=RnuX/zGRB42yAzoOnJoC9hdHdh+bsle5+JSaKcpc2ibo+JJMx9xPSbBjo7nrpIzpQc
         U/4wrr29Xqbb/Eh5aIfwAIR4+CKP8YeWRVbx+SNaqvBoSRkPaZZ+XhmJ76Z1HY9vohx8
         etjvMKtG6Pzrou0QopWMHprnOih2psTbhlWbnaE1O6jUfOchpt+WikIFQDJHhH1Wwdqj
         qkIM1cfDz2WMVl2B8LduEdfOpsmlaf0kmAzVjYtpBRyl7QfIpmDDuTu2aT2w8aJUtemD
         Iln4cfv8nqW2DHJcdbnEwX/wgqgPmHkhFdzRGbETKIpzKZAlbzI2fLhFqSM4plgjCKos
         +BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747904003; x=1748508803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wE/Nk3n7Qj543anMoi03EY1HELsp/mGZ1M/Gx4pgSIs=;
        b=LPPKH7HGfYyMQ2S7aCU/QbNCerrXbE92fM1j5PNYh+7Mi/Qfm1lpyjSv+2gLEdhets
         MkbVrgY+9LEA6s2mPtA6t0WZWR9Kxs0HQt4twBxdD5jXuJXziDQLkRjeMUnH62JQUyme
         d5QaXKmBMBHFqsxmF+QM+y0QdNGpL3LwDDG+Q/DLLZIj9thZsnGVaczNgYxLtZMLP7+u
         3TccfYjT//+zCb8L8In/9c9UyxQXypHmLW4gK4BNthECJNa038jaPPpxn5ZrUXE5sH0z
         RHw5TzigQoa9gWpFd2+r3lDJprAto2aoMJ+ZvXh519Rk0hXecilyOt/eCjhe97s0miJo
         si9A==
X-Forwarded-Encrypted: i=1; AJvYcCVcxCi/tHK8e59CHZk622zvcIzV/Yhrm3EBuXAieFBu7JcLFeptFRobCk9QyGsxdI0IY6rMD2SkYv002ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrDpIKqA5r/oLV0WBl5cvW0wM3ZVSuabVQrk/qaG4MgtflbKYX
	Px2uFeuMyCI07Bv3FlAe89VLv/uOocKHSUeUUwYgrRx+Gj/kTdW+FRIBz38lEWL3lw==
X-Gm-Gg: ASbGnctx6MpmIpa1qlqPAPKamqk/51GK163BXt7h0/L8epdGQGZNo3ctD+AWpuVW9zu
	eNGCpI4u2l19TkJrHxOVgSyBdpM58PBvbMKKihUalvs2Y8Ir5NJ78rRlerWdHtGlLnP5fPjC2Aj
	Qdwzrw6rQCqfBfim6HTmHVQxrLPEqv6KXkfq4tKzg3Lw9f7kpTUYyvoY11qiHCoRUX39rXXE5dc
	ZbtGGvbXQoEWJvhk6fOebV1jj66FVj0s1W4ctBxl8Tnf2emkXwLl6ROYlqB/p7M6990DPpCs9fy
	a9pEV5eKF/jo1pJ4qZLr7QfBUqzpIp/bfBDa+28L+5+5XpnnY7kXB3VUwUtf/g==
X-Google-Smtp-Source: AGHT+IF5uWmk4PnvIThnJSvV0zNx6s2lAIFa7Qq/vftR90Qhtr6lQ7tpJ/xet55CCmVXUt9jRfsojQ==
X-Received: by 2002:a05:6a21:3385:b0:20d:df67:4921 with SMTP id adf61e73a8af0-2170cafa33dmr33994739637.4.1747904003020;
        Thu, 22 May 2025 01:53:23 -0700 (PDT)
Received: from thinkpad ([120.60.130.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e589esm10810267b3a.9.2025.05.22.01.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 01:53:22 -0700 (PDT)
Date: Thu, 22 May 2025 14:23:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 07/11] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and
 Inline qmp_ufs_com_exit()
Message-ID: <qrope222shpeqvhe2dnh4p4jmznuu7tr3jh2zujwbbd3khg4yo@wm2epj5ydefc>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-8-quic_nitirawa@quicinc.com>
 <untqxy76skl53c55bdjz5usk4seuypjqbxkfub2qeqz42mewqr@r4cutmkvy235>
 <79d2f373-ee53-4cd2-b228-171daf3adcb7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79d2f373-ee53-4cd2-b228-171daf3adcb7@quicinc.com>

On Thu, May 22, 2025 at 03:49:12AM +0530, Nitin Rawat wrote:
> 
> 
> On 5/21/2025 7:19 PM, Manivannan Sadhasivam wrote:
> > On Thu, May 15, 2025 at 09:57:18PM +0530, Nitin Rawat wrote:
> > > qmp_ufs_exit() is a wrapper function. It only calls qmp_ufs_com_exit().
> > > Remove it to simplify the ufs phy driver.
> > > 
> > 
> > Okay, so you are doing it now...
> 
> Yes
> 
> > 
> > > Additonally partial Inline(dropping the reset assert) qmp_ufs_com_exit
> > > into qmp_ufs_power_off function to avoid unnecessary function call.
> > > 
> > 
> > Why are you dropping the reset_assert()?
> 
> This was not aligning to Phy programming guide .
> 

You should mention it in the description.

> 
> > 
> > > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +++++--------------
> > >   1 file changed, 5 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > index a5974a1fb5bb..fca47e5e8bf0 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > @@ -1758,19 +1758,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
> > >   		qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
> > >   }
> > > -static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> > > -{
> > > -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > -
> > > -	reset_control_assert(qmp->ufs_reset);
> > > -
> > > -	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> > > -
> > > -	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> > > -
> > > -	return 0;
> > > -}
> > > -
> > >   static int qmp_ufs_power_on(struct phy *phy)
> > >   {
> > >   	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> > > @@ -1851,7 +1838,11 @@ static int qmp_ufs_power_off(struct phy *phy)
> > >   	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
> > >   			SW_PWRDN);
> > > -	qmp_ufs_com_exit(qmp);
> > > +	/* Turn off all the phy clocks */
> > 
> > You should drop this and below comment. They add no value.
> 
> Comments are actually provided for each operation within qmp_ufs_power_off
> which actually facilitate understanding of all actions performed by the
> function which may not be fully clear by code. Hence
> I thought to keep the comments. But If you insist i'll remove.
> 

For complex code, comment should be added indeed. But for
clk_bulk_disable_unprepare() and regulator_bulk_disable(), NO. It is obvious
that they turn off clock and regulators.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
