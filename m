Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7B26B0BF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965392; cv=none; b=sG+AJ98NhsX/g6ReburNEZt34VtQPFkD7TqVnRQrI5IsDEV0D7czwKnJV/Hm5fqWGtSlIWEKM0zKDVyVU/EYlb5/GhHCvJtt5RM7BTdwnt2akIOj/hDm3+IQNbaKvMicJ9eNg2dtw2mb82bTJDdqzHnEJA2SXcuEe9CmLYQanyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965392; c=relaxed/simple;
	bh=LUkyc/BgQX9YR/2tc5k3KKNPguD1blkucYPDKasBHFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M03x/BdlEtSTh1gUa8Yx5/5qsh96nZYg2TaPdBKAUvVTjg0zzYJ26bHDnAA5pZzbBj1755msLV5Q02pEN3/FRM4s74uaTjSIKEPUh7hg1FcGwhjxJ40rTocDPbORf4bbRYSynhJgJC3Xap4meQeeE0Db0v0oOmxBaXX4vxMrIJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LGm6spvE; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LGm6spvE"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227a8cdd241so21040955ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744965388; x=1745570188; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tsPJ7r05GCU8U5IpYvKGSTH/BPi5kWm5knrn6+oWvqM=;
        b=LGm6spvEjriy1udH5Mg/CIBE7fuNlLHG7fNFugdxOIl1fKCnp624YUjUE70ReJnJ55
         f/cHezvRgOYRsm5dGU6feno5s/J1HkhV+UTu0x0VVQuap1tRTEuiRLmQ7rAGrQCoqOdU
         nExQsjp2KrBC2pLoEA/mW7pL7J3bCogXsqVJKeBpMBSeVhqUGQS8t1utTQJpsLAnQTOB
         4C743CU9D53M5/0huLUZ3oTU/XSFRtXnyr0iUoo2rSz7r++U5qbvtEKdXFCPJLbGPhTO
         501f/NA3BtmjZqChnZIx2qOVjpswfR0ZPJQSNpxySk8Nr97wZiKh9bFkTboroaMAowqU
         hUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744965388; x=1745570188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsPJ7r05GCU8U5IpYvKGSTH/BPi5kWm5knrn6+oWvqM=;
        b=bXnrSE0IseW+l8u0bLRU9AzM068YVkVtIIi+3C3jns++uVFuVl02uYpxuprwYxSEq9
         NqDbI7aAPrzy/G+ORiD5Irm6MddLGB+lkExcWo/jECcfNjTivtR/D6ETheeKFfXGFI+D
         M0XoeUqykvV5fM7muPFbjXDtqDqTXqnqPvEjnBd+5VNjAognSJlchmXiFz2W8Ert7fmj
         ibaDFMd5tc/SppC9pe8NjZvwEgMHR47Q5P/Dtd5v0qwSQykNjBqnPFIkCfmCqth61OaH
         CSBORGr+VbiDpkFt/dR09CC+0BDURFIi6y0NYX2aZHEAuoKSLH2k9oVooBU/0PzJpQ6h
         Np1g==
X-Forwarded-Encrypted: i=1; AJvYcCVsHJonqdavspY80JAneLNqF/hjrS9FY5KvFk4frPkCbeglI6Tds66GJANNnRs+3Oubj+ahJONuDljFojU=@vger.kernel.org
X-Gm-Message-State: AOJu0YybWJGCgNzjNnnh6S0M4ewwqnXDzfgnlytMm8INznV2sFD/7pgU
	qiAbebg+UvGy7w1OvGwBSZg0Ge25IXfdKjaYdiltzRewyf+yxVYhNQLydvr21kaarpEEjW35q3U
	=
X-Gm-Gg: ASbGnct0Qs81RLarm8ppLOmfV2d1G1hJ7FBiuhVwA55fMfWbkHml9+YJqLI/+rhY0s+
	tDxm8+V2T7LeEwAtsWxYTdR42XC5qtzu/4lGApWkiJeJyZAWyt+sLzHA+qHTJrenQtqQwNHH+Kq
	C4uUzD/y6uZJkNXcIUiGaMlvR33rxRKN/Njrt84oIGPUeOE+tWtXHaiDPPg1qdF3z6kcsXSb3k6
	UAIzSANtZWfIQpJEJ8THp2dGy5gU40La8inurKqTer8+QNbLDHwOurjBMJNUkfgH/yVzEdwfDHn
	2lRd6JXAzt1xk4r2D94eQxMGtluGnPXHggwQPv5S18aELtRasQ==
X-Google-Smtp-Source: AGHT+IFLyewdVLNunGSr5XLsO/KxZg8Iz7L/FhZpjjgmaKyjexZSMUlGGQgBTl9NsTgGtdYk/Ywm+Q==
X-Received: by 2002:a17:903:24c:b0:224:1074:63a0 with SMTP id d9443c01a7336-22c53619da7mr24538145ad.34.1744965388315;
        Fri, 18 Apr 2025 01:36:28 -0700 (PDT)
Received: from thinkpad ([36.255.17.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4622sm12135005ad.108.2025.04.18.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:36:27 -0700 (PDT)
Date: Fri, 18 Apr 2025 14:06:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci: Disable runtime PM for QDU100
Message-ID: <qrb4ozkj3zxfpo733mf6xf35tetfyekytkty6sq7civhycbahm@c6s3wfvmdycs>
References: <20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com>
 <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>
 <o7rv3xgg3btaoqjlzfenbfkrp3fuw54cx6zqojclcfslfg3ha4@c3sqaqqdjdjv>
 <c8699f79-54cc-4adb-8047-b37a69e69d96@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8699f79-54cc-4adb-8047-b37a69e69d96@quicinc.com>

On Fri, Apr 18, 2025 at 11:55:24AM +0530, Vivek Pernamitta wrote:
> 
> 
> On 4/17/2025 11:37 AM, Manivannan Sadhasivam wrote:
> > On Thu, Apr 17, 2025 at 10:00:38AM +0530, Veerabhadrarao Badiganti wrote:
> > > 
> > > On 4/14/2025 1:17 PM, Vivek Pernamitta wrote:
> > > > The QDU100 device does not support the MHI M3 state, necessitating the
> > > > disabling of runtime PM for this device. Since the PCIe core framework
> > > > enables runtime PM by default for all clients, it is essential to disable
> > > > runtime PM if the device does not support Low Power Mode (LPM).
> > > > 

Not true... See below.

> > > > Signed-off-by: Vivek Pernamitta<quic_vpernami@quicinc.com>
> > > > ---
> > > >    drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
> > > >    1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > > > index 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797 100644
> > > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > > @@ -43,6 +43,7 @@
> > > >     * @mru_default: default MRU size for MBIM network packets
> > > >     * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
> > > >     *		   of inband wake support (such as sdx24)
> > > > + * @pm_disable: disables runtime PM (optional)
> > > >     */
> > > >    struct mhi_pci_dev_info {
> > > >    	const struct mhi_controller_config *config;
> > > > @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
> > > >    	unsigned int dma_data_width;
> > > >    	unsigned int mru_default;
> > > >    	bool sideband_wake;
> > > > +	bool pm_disable;
> > > >    };
> > > >    #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> > > > @@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
> > > >    	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > > >    	.dma_data_width = 32,
> > > >    	.sideband_wake = false,
> > > > +	.pm_disable = true,
> > > 
> > > |no_m3|orno_|m3_support|would be more suitable than|pm_disable|
> > 
> > Yes!
> > 
> > But does the device not supporting M3 only or D3Hot also? If the former, then we
> > should prevent MHI host to enter/exit M3 state in mhi_pm_suspend/ mhi_pm_resume.
> > There is an incentive in allowing D3Hot if the device supports it.
> > 
> > Also, is there a way we could probe M3 support in the device so that we can
> > check it during runtime?
> > 
> > - Mani
> > 
> In QDU100 device does not support M3 state, D3_hot will be supported. As
> QDU100 is an accelerator card which needs high-throughout, LPM needs to
> disabled here. So we are trying to disable runtime PM here, without M3 ,
> D3_hot will not have effect in QDU100.
> Also in MHI we don't have provision to check device M3 capability, so we are
> trying to disable runtime PM here.
> 

Even though PCI core is enabling runtime PM for devices, it also prevents the
devices from getting suspended unless the drivers explicitly asks for it. So
this driver is using autosuspend feature to allow the devices to be suspended
if PME is supported from D3Hot.

If you want to prevent the device from getting runtime suspended, you should
just skip autosuspend.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
