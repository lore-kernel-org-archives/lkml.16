Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FC01F1526
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870065; cv=none; b=PND3ro+dHosmuJ6sMAAN1MZ5OiNJuIZVPcJt8QX2y27uRDfJQyOI+JAI8AR2CR2TtogoTi2Y9/kV6S8Fnmjy16xIawABaYwagyA8uFop8CCLGuiSlj9RSM8KsBoZODfeu+J9OHTyDDXFCVKYOeL4GEsiSppT+iZvQlWShRxuSek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870065; c=relaxed/simple;
	bh=SJ5pp2PEFU9Mosrf8HZCUtQXVnazURuiUC73cKCZalg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OB9xLh8XVoME29354bgpSf++2mzQ4cUjTzk4sp+VkPk40uCLP3ci4UtqKlBocl11YLZymOEIjVK3wATX+QfMaGOGZS9YOkIjLxi3jLLWH1EiH70Bl/qCTrUGsIpUNEVsmhp2tjZa35Z1vnYSKytmAmHL5sLvEJEbkux/zdiWJP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B3L/KVTG; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B3L/KVTG"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso331332b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744870063; x=1745474863; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pd6OOWCuIIKAwnNGxCiRtg0jiUDcshaa45Tlc/bukVw=;
        b=B3L/KVTGfswXOANfd8zfHIHCi2/25FkO3qJf9/Ju8b8fvrUzjuK6ZjErL1neYzsJXz
         dkVU4OnqlgHmFjbuMxHYCH+g1a6PyR9lJflK+CeI3lJE/xrycUNIaMaPgQ9WHiAHf7wp
         EEECLJa9tEVoKrBqTmq7lLoyeFhpJgXbogr3Pw6iR+sSI0nuRaORIBEPih/lZgaeITf1
         ZgTODtNrugc4IU5cZ0ZFkiZGVES8B4hc9UYznpJlwJPZ815QBKbWQ3XfF+kE8bER/fnR
         YXrCAfCuh+43sZxbfFxOaQ4wqX0h7WqPjbIruEc4NgzvX3+CSLegN73HNAZY+VMVdb+4
         UKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870063; x=1745474863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd6OOWCuIIKAwnNGxCiRtg0jiUDcshaa45Tlc/bukVw=;
        b=uG6P7VEO8LYLSHKCCHjgCmHF/DY3HuYfWU739rC+ioqBGTsPp/BShpvNInP2XU2B3C
         fIKfSPNS+cz85DGVuqpvRJ9mVcSbV9rHRn2FxebLbf5PGiCJyNUDTcXnUjtSrACyeYFh
         nvpU1bdT497QkyUjxp8bNfmSRnaFl39pJW0eTY/LZdQaxVFRM3uEXHELLLtM2jM1/zhL
         cHV66wponDHVN71X+KvLhBwDCTOm4CwoMHdK6/MjnSo3R2EZ89pqU2y+WHa/82Zi+3QO
         gbRD9PrAC7V/yBZPoqsBntdBCFmFAWJpLQWQjCm29nYS6O0mGkttSvuvOoU2oYyO5Pd+
         Dh+g==
X-Forwarded-Encrypted: i=1; AJvYcCUbilpqZZ7gfuyn8tMEs7ktLGbQSEGm9UrFTv54TIvSdv/iOgnxlGTpWNz26Eswwd/UBw5qMkFg9jDEPmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE+owjn91Dh9i7vNYQEeja4f7TPVYyckgnNiHTgD3grhCvrrsp
	uUhGWiL1uYYBrage9btrMlevwVhhgFiGwMvZmBGBCa/Q4p0WAIAM6c3rbrsDY2yRKvV/tCHgYGM
	=
X-Gm-Gg: ASbGncuTKNVRw1rwlV83839aDiYlzEF0gSso3dhvHvOV4p1sEHuYouT3caoKFoaZgBa
	OzVh56zTIiwL8hKbJl+DaNCD5HxsJ1cLet2sG927wiuoXiw/ZJ2dIA+Mlyl5GxTUn/+k8Jd/5tn
	dEg8po+/OSC65Gqj7BGf8+PZ/wvIV3prb/L0IA62r4sWOY0nrJawhiYP2ypYYC0pk4Yfb/y5qj0
	kIGQxHpRh2ENxPy271rHjfmsSlndbLpI2FEDwHeqxKBcj/CbmDPSN8F+jlVy393UXO5sr3sXX4z
	GH1uxXdCEWvdvH8dXVDvM3RNLUrwbyTKxeulN3H6J8M6WG8K
X-Google-Smtp-Source: AGHT+IEGKe8IgUll51m3XVZ/pKTgzfl3xR85lF+5Mw9zim0JsXl11h/TRDH0YYgMcdLUzmlGXqar4A==
X-Received: by 2002:a05:6a00:240c:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-73c266b5fcfmr7618028b3a.3.1744870062780;
        Wed, 16 Apr 2025 23:07:42 -0700 (PDT)
Received: from thinkpad ([120.60.54.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23351fbsm11902923b3a.171.2025.04.16.23.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:07:42 -0700 (PDT)
Date: Thu, 17 Apr 2025 11:37:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com>
Cc: Vivek Pernamitta <quic_vpernami@quicinc.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci: Disable runtime PM for QDU100
Message-ID: <o7rv3xgg3btaoqjlzfenbfkrp3fuw54cx6zqojclcfslfg3ha4@c3sqaqqdjdjv>
References: <20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com>
 <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>

On Thu, Apr 17, 2025 at 10:00:38AM +0530, Veerabhadrarao Badiganti wrote:
> 
> On 4/14/2025 1:17 PM, Vivek Pernamitta wrote:
> > The QDU100 device does not support the MHI M3 state, necessitating the
> > disabling of runtime PM for this device. Since the PCIe core framework
> > enables runtime PM by default for all clients, it is essential to disable
> > runtime PM if the device does not support Low Power Mode (LPM).
> > 
> > Signed-off-by: Vivek Pernamitta<quic_vpernami@quicinc.com>
> > ---
> >   drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > index 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -43,6 +43,7 @@
> >    * @mru_default: default MRU size for MBIM network packets
> >    * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
> >    *		   of inband wake support (such as sdx24)
> > + * @pm_disable: disables runtime PM (optional)
> >    */
> >   struct mhi_pci_dev_info {
> >   	const struct mhi_controller_config *config;
> > @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
> >   	unsigned int dma_data_width;
> >   	unsigned int mru_default;
> >   	bool sideband_wake;
> > +	bool pm_disable;
> >   };
> >   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> > @@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
> >   	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >   	.dma_data_width = 32,
> >   	.sideband_wake = false,
> > +	.pm_disable = true,
> 
> |no_m3|orno_|m3_support|would be more suitable than|pm_disable|

Yes!

But does the device not supporting M3 only or D3Hot also? If the former, then we
should prevent MHI host to enter/exit M3 state in mhi_pm_suspend/ mhi_pm_resume.
There is an incentive in allowing D3Hot if the device supports it.

Also, is there a way we could probe M3 support in the device so that we can
check it during runtime?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
