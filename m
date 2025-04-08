Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522925FA34
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097026; cv=none; b=c0donwD69qinQjIGDG8HcDgerKuzhn3bRVmpGTD9K+KmOOCw1vxEYx9LPmsy4GF3RIeX9S+BwRLiszwmxym44fLHdXoepJ2rV6QE3NUyNqkYz6uOsgHT8TEJEa7LcfE5UR9n3fXxDAPRjOBJmli48r9Il9+oWYPnNKgPPJTDbs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097026; c=relaxed/simple;
	bh=rL5dGpnFjOxWd3LsB+ItQyiyXmnHrcABj2M4ZSlcHDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8YpntAJrqPWmbnA0MayMg5/CYSFOv+1uXVelas6mUi9dLHJtL3p5oeZvjuINmucCI8MzV97Z0ZsmOyr+zDiZQDrJztHBozfP9Uw5JvHBTegus/HgkAqOeUeTT3oN1CvgtDTiU5KOawHLHVS49/g0Nyu6cnV1T3rS8ue7OWXRDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uJbsUz5X; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uJbsUz5X"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224019ad9edso67134405ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744097024; x=1744701824; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVo2aw8e68tzNUEBR5LrT7OG8JEIu/cx6FavvcXXg2o=;
        b=uJbsUz5XeE6hxVIz5jX8ptxHA5XoKb+yTII+mdK+VOU7n1YmxMjAIOqbp7MsJq9tuw
         fE/pRLuWpTe5MEcbttBT+ABUx2FcGa2bF2tRVsjR4IlRavwF4hNN7WtSg3UGWwV39y93
         q++HJR7nkTc3dDktm1oeOggH/r/N/BzIeZIz9iaspPnCWJRkmQqCB7VBKwgXe6B2XTM7
         Nb43SEZ0SdzmDVRkGl0ltxjtUen8jIPMLuu4ZwCgTmxLp9Yw1LQfXutIzg1IRUBLCUax
         y49lXwVhHFZD5JkuBW0QuMlX8DHReYRIz9ZYZTZ+qz4tAZ4KMeFz+VzNHOWncqej62tQ
         9gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097024; x=1744701824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVo2aw8e68tzNUEBR5LrT7OG8JEIu/cx6FavvcXXg2o=;
        b=lrAXh9Y3k73ijQEbxqUk7WjFB82WnXciMlK4PbrJSOqVC5Ji7orT7GlC8v0VCfv32u
         Op5CG+8oKkiNJiNxdwYmMPB3lAqKmCdgXjB1D7I9rjiEFrGGXeV206TJZ3pEVodgKI1S
         r2UC8FeDYMuYJRLH1cu7J1W8FkDd4VU2sQQCmCHSdOWabztvx07KwdJDoEQdP/UQdM79
         OmIzSYpgz/2CuGnOtLIDxVt5kDLpeaYcrg1Q8bQ7EGn+h9tkuSZ5RT/4PBVl4No6pgdj
         hUyLLYL5hjtx0iJ/tQsr8qnRNi476GMrnuyTuzeNcR0Y3BuxSM93bxhfnPySawDRt0Jl
         juww==
X-Forwarded-Encrypted: i=1; AJvYcCV5AJENfpR0vfEoebABsEm9MqovOpUOGs3pDoW3Jb0lDnmkqC5/jscX2VzkYJ74yiPC1Z195Gg5LXlqKHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUIOh2o9EEToYId+RIc/WfzTYDF8GWxOxRchSySr1v1BIH9aCK
	uNl+vtiuwFFFKlSkxN5hj+YYgOL5oZmdDU/BQOdZYJ5oLYyEMx+jcsMip8FzYejv5og/tmgOrlk
	=
X-Gm-Gg: ASbGnct0OgWc8vlPvFNrgFJDPU9noUft9ljhkko+qAVYJDuHx3fjpl++ezWSz8PLJcw
	tBJP5TqcMiXbaImbUtexpqREZOn1sZCWHKrZSWHwFXl8yjwp50WVUoUe3WG1g635jISnj/zOh4K
	zQ0IR6QQqj3lBEsaO23fUQd6XOof3GhNE2yXcus7k6zbGBH3/aXaFgY/4Mkwfa4EX0wqQgVTsUi
	aArtDRxVx7JrdCRr9P0Fy1PhDTpmpKHy1al7l5BSn4zww448pLMwHRoypsQfFgyVoQqUtYhVz9+
	Lu8nFejJO3h4XUhX/rYO7ZtUXXuGKNFHLgiPIuqlibkrEoa4PMrMtZ/e
X-Google-Smtp-Source: AGHT+IFPM9/HimoR1iqD87ojIqSwcwz9XpIsOOx/gkGl8C+bQirMDZCXalGm8Chz/NcPiOQyGMeqew==
X-Received: by 2002:a17:902:d484:b0:223:6180:1bea with SMTP id d9443c01a7336-22a955734cfmr159838375ad.37.1744097023770;
        Tue, 08 Apr 2025 00:23:43 -0700 (PDT)
Received: from thinkpad ([120.60.134.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787776f8sm92798135ad.256.2025.04.08.00.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:23:43 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:53:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: MANISH PANDEY <quic_mapa@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_rampraka@quicinc.com, quic_cang@quicinc.com, 
	quic_nguyenb@quicinc.com
Subject: Re: [PATCH V2 2/2] scsi: ufs: introduce quirk to extend
 PA_HIBERN8TIME for UFS devices
Message-ID: <l6xao2ubcvv3ho56dv6qfr3b62ve3olfbhvywg2is2xdhod27r@2nyjfwinrxzm>
References: <20250404174539.28707-1-quic_mapa@quicinc.com>
 <20250404174539.28707-3-quic_mapa@quicinc.com>
 <hcguawgzuqgi2cyw3nf7uiilahjsvrm37f6zgfqlnfkck3jatv@xgaca3zgts2u>
 <d09641c7-c266-4f0a-a0e3-56f63d8c9ce3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d09641c7-c266-4f0a-a0e3-56f63d8c9ce3@quicinc.com>

On Tue, Apr 08, 2025 at 11:07:58AM +0530, MANISH PANDEY wrote:
> 
> 
> On 4/7/2025 12:05 AM, Manivannan Sadhasivam wrote:
> > On Fri, Apr 04, 2025 at 11:15:39PM +0530, Manish Pandey wrote:
> > > Some UFS devices need additional time in hibern8 mode before exiting,
> > > beyond the negotiated handshaking phase between the host and device.
> > > Introduce a quirk to increase the PA_HIBERN8TIME parameter by 100 µs
> > > to ensure proper hibernation process.
> > > 
> > 
> > This commit message didn't mention the UFS device for which this quirk is being
> > applied.
> > 
> Since it's a quirk and may be applicable to other vendors also in future, so
> i thought to keep it general.
> 

You cannot make commit message generic. It should precisely describe the change.

> Will update in next patch set if required.
>  >> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> > > ---
> > >   drivers/ufs/core/ufshcd.c | 31 +++++++++++++++++++++++++++++++
> > >   include/ufs/ufs_quirks.h  |  6 ++++++
> > >   2 files changed, 37 insertions(+)
> > > 
> > > diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> > > index 464f13da259a..2b8203fe7b8c 100644
> > > --- a/drivers/ufs/core/ufshcd.c
> > > +++ b/drivers/ufs/core/ufshcd.c
> > > @@ -278,6 +278,7 @@ static const struct ufs_dev_quirk ufs_fixups[] = {
> > >   	  .model = UFS_ANY_MODEL,
> > >   	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
> > >   		   UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE |
> > > +		   UFS_DEVICE_QUIRK_PA_HIBER8TIME |
> > >   		   UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS },
> > >   	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
> > >   	  .model = UFS_ANY_MODEL,
> > > @@ -8384,6 +8385,33 @@ static int ufshcd_quirk_tune_host_pa_tactivate(struct ufs_hba *hba)
> > >   	return ret;
> > >   }
> > > +/**
> > > + * ufshcd_quirk_override_pa_h8time - Ensures proper adjustment of PA_HIBERN8TIME.
> > > + * @hba: per-adapter instance
> > > + *
> > > + * Some UFS devices require specific adjustments to the PA_HIBERN8TIME parameter
> > > + * to ensure proper hibernation timing. This function retrieves the current
> > > + * PA_HIBERN8TIME value and increments it by 100us.
> > > + */
> > > +static void ufshcd_quirk_override_pa_h8time(struct ufs_hba *hba)
> > > +{
> > > +	u32 pa_h8time = 0;
> > 
> > Why do you need to initialize it?
> > 
> Agree.. Not needed, will update.>> +	int ret;
> > > +
> > > +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_HIBERN8TIME),
> > > +			&pa_h8time);
> > > +	if (ret) {
> > > +		dev_err(hba->dev, "Failed to get PA_HIBERN8TIME: %d\n", ret);
> > > +		return;
> > > +	}
> > > +
> > > +	/* Increment by 1 to increase hibernation time by 100 µs */
> > 
> >  From where the value of 100us adjustment is coming from?
> > 
> > - Mani
> > 
> These values are derived from experiments on Qualcomm SoCs.
> However this is also matching with ufs-exynos.c
> 

Okay. In that case, you should mention that the 100us value is derived from
experiments on Qcom and Samsung SoCs. Otherwise, it gives an assumption that
this value is universal.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
