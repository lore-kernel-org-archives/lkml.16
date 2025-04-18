Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC72550A8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980352; cv=none; b=NcFCUhLrNbCdn2STkrgukDb+ki6T8VwUVW5Mpf6uuE9ToV6O2GDPc0Jbaciu73TfTmX+0da+JQDjOqtMeyMV3gLClO9fC+SPTgejh+qs+zamnxSjzeaE8bNGPlpfYqxoCFF9SUJHRX/VHmdvF3/8vHYOqoWcU/cT4EdHNRZjUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980352; c=relaxed/simple;
	bh=eJmcdcasqheQsUfjBkiQdMc04fHQ0iTzJ96GM9qZpd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsi/Win3iBtxYtNm/Gh84l1hTaw2HM5BChp2gcYuQOe6EPas2LEKL6JoTA7LZy4W/BhGHXxjoRaAKb9eqN1TKS71cwtnd0jkHG7NT1nF7we4yLxfDHgIu7dX+D3EYhQ2U8K3dm5ijTSZfm/YN+TncZDKMNMhF2rtQzhs2F0lWWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9a/F9Jg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9a/F9Jg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22928d629faso19691985ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744980350; x=1745585150; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MY1YeGNd6w1Dnai1dYNXkVTuw65HW6WJZU6tne3NRRk=;
        b=q9a/F9JgYYFDNoan2z7TEa9sIGTCCDchRvvOlVWN8NdRXhPXihm1g5HswvsVVQ0Fzc
         FRFxz+xybnj+U/Lmw8PMMI9zs3EUrtMDZA4Z4izGCJV1Ou1xyHFzUb6alOpRrkSoh8Sz
         AkWV8tgMR4e8lo9KrV5kXT5eVTpqUNwzCKjYiP4Edpwh/ahBdlEvLfI5FYrMHOwMtAz7
         kJHhPH6CJtMKKinkTTOGTYJU/Sh/HpyL1c8Wnq1Y9NjHTz1eJ8aoKoUMvKox1GE2vo4l
         9DyeXqfIoO2rqz+6p3016prKWTIgt1h6Sett9zQ9qN0iPMw9YRQ7+0o8JvwKmWx+Q1oJ
         AdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980350; x=1745585150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MY1YeGNd6w1Dnai1dYNXkVTuw65HW6WJZU6tne3NRRk=;
        b=mRSUGnsibACKBHmXMO6aR+C0H82BmV53NjSU/KVCcFY0vnMZSU2uTcWYnOarHaVN0l
         BEwNItw3huKkwACKg3xcWydIawW8f3816ScLQdgHC43lr2eEbFYu/07M5PhWs1KKNlpM
         OPgbJ0xziRM8uFDJxjCDMCLbEYhP5RiqajpjLay7BgS0GhPXkxSeusYIBwM1ZWcYB3xp
         raJvsqS2/0IqUgXHUgwYFcTxlGFKmC6HQcq/Nei/Hva+v1BM53t7KZgZUJwpGVGwKcU6
         g3xPCYzltbi8XLPkKo/DkeJhXEcycEv1uP/rxXUWQay5wATDh03lY/HywNeHhyL0vKvy
         DM7w==
X-Forwarded-Encrypted: i=1; AJvYcCWJMGN9+4Yca0Rya+TmuBSUUrXAVA4SATl5L3MHL931M2kV5vjh75WvlbMXgiIX3PXdmLn5sJygQ9/U91U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpyWuVu+eWR0MgkjY8T28bJWf1PRmYFPFA8oSeE/iYm8oaGsmT
	MZSFkkTw/KvAm+fu1OQQ5ptV1fIhYU0TCG4bWUW7Ex6Ie6+F19iknzvB8Y2Hqg==
X-Gm-Gg: ASbGncvPk4EGXPwcAib2+GRHctd2T7kql0gLVd2Qfske/vmL8CC9VTfQG4e0+T8+cb2
	XlKVknq9Y7K2SBFH8Z9dWH3zL/u4iigZfI1XfttIkRnHP2XenrKWq3vNTxe8iSeQ7DSAcapf+JF
	EKvu4NDO1RDkBJ/lTyxc/iviv5HCI0JYy72vvGAMWns+7/z+Kdfx/L1YsNi1vOsFeKPgbvPCC7o
	jmyl5NEfJgJXfv/yYC4QqW93ERHeU28emjcfTwsugW2+tzIQAcjjivkApoqaP4jFK1FJnNIrrPw
	2VoMkStDf82bH/MIWOU3BiGF+wm36REeg935WzZEfHTs+88YFngcOLL33cqwVDf6
X-Google-Smtp-Source: AGHT+IHeaaTGjZPgOQ9SxEkyin52xIGApRW/zhdV9OBxFloBKDs8lYnW8IxD27iYpLOVTohhHonpig==
X-Received: by 2002:a17:902:d506:b0:220:d439:2485 with SMTP id d9443c01a7336-22c535acc7amr38422685ad.29.1744980349832;
        Fri, 18 Apr 2025 05:45:49 -0700 (PDT)
Received: from thinkpad ([220.158.156.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed1301sm15807295ad.184.2025.04.18.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:45:49 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:15:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci: Disable runtime PM for QDU100
Message-ID: <tbktzaxkgsc6d4ma4o6vkkcpnqiwghxkvwryrm36znepgqjotl@5n3di2ew3s6f>
References: <20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com>
 <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>
 <o7rv3xgg3btaoqjlzfenbfkrp3fuw54cx6zqojclcfslfg3ha4@c3sqaqqdjdjv>
 <c8699f79-54cc-4adb-8047-b37a69e69d96@quicinc.com>
 <qrb4ozkj3zxfpo733mf6xf35tetfyekytkty6sq7civhycbahm@c6s3wfvmdycs>
 <2ab9a8f9-b051-4213-a9df-4b2c2fa8c6be@quicinc.com>
 <09ec85db-cc02-4b35-9939-aea3426d0e0b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09ec85db-cc02-4b35-9939-aea3426d0e0b@quicinc.com>

On Fri, Apr 18, 2025 at 03:40:48PM +0530, Vivek Pernamitta wrote:
> 
> 
> On 4/18/2025 3:04 PM, Vivek Pernamitta wrote:
> > 
> > 
> > On 4/18/2025 2:06 PM, Manivannan Sadhasivam wrote:
> > > On Fri, Apr 18, 2025 at 11:55:24AM +0530, Vivek Pernamitta wrote:
> > > > 
> > > > 
> > > > On 4/17/2025 11:37 AM, Manivannan Sadhasivam wrote:
> > > > > On Thu, Apr 17, 2025 at 10:00:38AM +0530, Veerabhadrarao
> > > > > Badiganti wrote:
> > > > > > 
> > > > > > On 4/14/2025 1:17 PM, Vivek Pernamitta wrote:
> > > > > > > The QDU100 device does not support the MHI M3 state,
> > > > > > > necessitating the
> > > > > > > disabling of runtime PM for this device. Since the
> > > > > > > PCIe core framework
> > > > > > > enables runtime PM by default for all clients, it is
> > > > > > > essential to disable
> > > > > > > runtime PM if the device does not support Low Power Mode (LPM).
> > > > > > > 
> > > 
> > > Not true... See below.
> > > 
> > > > > > > Signed-off-by: Vivek Pernamitta<quic_vpernami@quicinc.com>
> > > > > > > ---
> > > > > > >     drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
> > > > > > >     1 file changed, 10 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/bus/mhi/host/pci_generic.c
> > > > > > > b/drivers/bus/mhi/ host/pci_generic.c
> > > > > > > index 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797
> > > > > > > 100644
> > > > > > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > > > > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > > > > > @@ -43,6 +43,7 @@
> > > > > > >      * @mru_default: default MRU size for MBIM network packets
> > > > > > >      * @sideband_wake: Devices using dedicated
> > > > > > > sideband GPIO for wakeup instead
> > > > > > >      *           of inband wake support (such as sdx24)
> > > > > > > + * @pm_disable: disables runtime PM (optional)
> > > > > > >      */
> > > > > > >     struct mhi_pci_dev_info {
> > > > > > >         const struct mhi_controller_config *config;
> > > > > > > @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
> > > > > > >         unsigned int dma_data_width;
> > > > > > >         unsigned int mru_default;
> > > > > > >         bool sideband_wake;
> > > > > > > +    bool pm_disable;
> > > > > > >     };
> > > > > > >     #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name,
> > > > > > > el_count, ev_ring) \
> > > > > > > @@ -295,6 +297,7 @@ static const struct
> > > > > > > mhi_pci_dev_info mhi_qcom_qdu100_info = {
> > > > > > >         .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > > > > > >         .dma_data_width = 32,
> > > > > > >         .sideband_wake = false,
> > > > > > > +    .pm_disable = true,
> > > > > > 
> > > > > > |no_m3|orno_|m3_support|would be more suitable than|pm_disable|
> > > > > 
> > > > > Yes!
> > > > > 
> We named variable pm_disable because the M3 state is implicitly set during
> runtime PM suspend. Both are not needed and not fully supported for the
> QDU100 accelerator card, so we want to disable runtime suspend for it.

You are mixing terms here. Only M3 is not supported by the device. The fact that
you do not want to enable runtime PM for the device to avoid latency is a side
effect of that. So you need to name the variable as 'no_m3'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
