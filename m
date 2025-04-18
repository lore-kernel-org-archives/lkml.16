Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CBC215191
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744995688; cv=none; b=UGuuhskA5SYEvbE6T5+BvN9Cxfw5dLJNWHtUUOCXsPn7VYSogUaUzaYtUcFaRIp7VpvNcvESiVxgLMAUibJpnCeya3G0HmQqv+9CIuLiOrIKysI6UGkN++92XjBxGYgLTMxqGTnD9Zn40R8rHi38GznEWTUjaW94XW8b8GUx+M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744995688; c=relaxed/simple;
	bh=gO8UuUnEL0GdMWSU7mYBXHTLEBePuhrA4Yw2uBuWr2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmfEvAKHf3EwTxK683R3znXHbTp+8X06b2zatHlaVpjFTsnt101pNLxzLGyK2wAU4g8NWQkuP/T9CFzkqTCYWTvAGpLz9gWWU0Aeruec7gyyiyecqovXacZeEcx9ZYxGxnApxdIE1+aMohj5blxcy5Pn4/qVDErqklEWGmWENVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CUxoVppg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CUxoVppg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22622ddcc35so31826465ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744995686; x=1745600486; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fs+FbSr25h62ESmDLvM+DIV5SDJW0JK2umLWA74NAL4=;
        b=CUxoVppgsjWzbqu5DK7X36o10BpcIOEQ9CefD+xSqrL1mmFplHOTNIoRGIKn0edttL
         563JYG5LMoMYQDOpf7HhhkMzQmBGs1kQDS6X8X3q2QhYj8ROaZlklKEJ4LnjPkzTd3Ht
         nBUSgV0v9MdeId3Rz8s3RgIQR3q1AudPUSOrT7ldZjnNB3Hb+baB3se11MJlO4K/lIHm
         Pr5HT8CEu7ROUS9xDkoYpL7SJ5/NS/9n8cKtgYnP9lj632IveqSGlxFDp5zoKxRSr6sN
         BwxkH2qJ6aFrOSstSSS1svkNYkkZZh0G3tPp9Qc5d9xBAOKE0WL+W7BQ/dlrnzc7dEGP
         ev1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744995686; x=1745600486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fs+FbSr25h62ESmDLvM+DIV5SDJW0JK2umLWA74NAL4=;
        b=E2f6ERX3TA2AuCqJY4MguAL0mL0x+bKb0cQ8m6ADMn3ZQLXq9Qn+xaZce7hj8XW5lM
         gvIU/z4MOGXwy1CndVq1KFNpYh2OIrQTDJiOs2zuN4I/GpIlKrw748FRMCMcf41aeEpm
         IpkR8yGegKRVyaakeRNQQygxYDvh4SfpOw2PtXCTJME0mArT71oQEHJirM76JvyWxrug
         XOtJ5PMUy0bKYetMDJMdQeTQk5ttHYlpOfUF50+LAm2AhOarlwjrEuwGimDvnEIj9fnY
         PH0ZzbC4lbuU9x78/k7/svZOLQPFJBKVSgZdMZbMEBf2XLedIeT8fWhklnEv4g+2cKpO
         Sqcg==
X-Forwarded-Encrypted: i=1; AJvYcCU8I+L+lll8SaYa1hF0fG3EvDzwN2yenQdggzx2i2jlCrs3uRrIHUGQheQR4MvkaDp06ypvom0WQAmYO9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx//g7GFfWkRt3zuLay8TLBt/GIZ8/iqyUkOhpXlhwkjJ1WkVya
	IeZ+HxnLCy6XzM4L9CIY+dC0TUaXv7MTbEr4FEOWObjwvUDpL2FwZhCHsVjkfg==
X-Gm-Gg: ASbGnctOevzd9Z2PaQmvAQ48Ht/hgZnrYjZ5LAZ5GlO1CKD6Mbs8bifwo/9ZOVhe2j/
	HKMFCmzc8Lz8I8IjJdyYDOAkq6FuIy1sK5/FGLS1dgm8kh0XjuaERwTwHpQx5WEuySCa5X1Mnfh
	w2vSl39TliQVeUUKXnZNljsMMQU4A2Pqypcy8cn5hA1Bc2SdtQxiipafymvXJmmWXm2qY9YGDc9
	6Zn+s5ZjKiLaQbc029Ae62DQtaHMJxgdI0GKsPh+kW1BkNdQcmToDFhKgxT6UMlNCGiWc0hDpzR
	b4whjXnmKdgcgAc8Kmiqryj/LXZv99kOoMm+b7hO9tgG2R9+ULE=
X-Google-Smtp-Source: AGHT+IEnFAQ5ZdAVrVFVrdvYt5L9ZjZCuO9Da8Y6K9EjBgw5KyuHMkIHZ0L6Nkwt9mqFlQeiQfcWzQ==
X-Received: by 2002:a17:903:990:b0:223:f408:c3dc with SMTP id d9443c01a7336-22c5357a703mr52536975ad.9.1744995686287;
        Fri, 18 Apr 2025 10:01:26 -0700 (PDT)
Received: from thinkpad ([36.255.17.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb64fbsm19040645ad.158.2025.04.18.10.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:01:25 -0700 (PDT)
Date: Fri, 18 Apr 2025 22:31:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>, 
	jingoohan1@gmail.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_cang@quicinc.com, mrana@quicinc.com
Subject: Re: [PATCH] PCI: dwc: Set PORT_LOGIC_LINK_WIDTH to one lane
Message-ID: <gnpoekmyk4elg53xabcsvj6sqacttby6dpryxcdepws3fpt2xj@y7efnnszvpem>
References: <1524e971-8433-1e2d-b39e-65bad0d6c6ce@quicinc.com>
 <t7urbtpoy26muvqnvebdctm7545pllly44bymimy7wtazcd7gj@mofvna4v5sd3>
 <72e7ec4e-6a14-4a09-8498-42c2772da4fb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72e7ec4e-6a14-4a09-8498-42c2772da4fb@quicinc.com>

On Mon, Apr 14, 2025 at 04:45:26PM +0800, Qiang Yu wrote:
> 
> On 4/8/2025 1:51 AM, Manivannan Sadhasivam wrote:
> > On Thu, Dec 12, 2024 at 04:19:12PM +0800, Wenbin Yao (Consultant) wrote:
> > > PORT_LOGIC_LINK_WIDTH field of the PCIE_LINK_WIDTH_SPEED_CONTROL register
> > > indicates the number of lanes to check for exit from Electrical Idle in
> > > Polling.Active and L2.Idle. It is used to limit the effective link width to
> > > ignore broken or unused lanes that detect a receiver to prevent one or more
> > > bad Receivers or Transmitters from holding up a valid Link from being
> > > configured.
> > > 
> > > In a PCIe link that support muiltiple lanes, setting PORT_LOGIC_LINK_WIDTH
> > > to 1 will not affect the link width that is actually intended to be used.
> > Where in the spec it is defined?
> As per DWC registers data book, NUM_OF_LANES is referred to as the
> "Predetermined Number of Lanes" in section 4.2.6.2.1 of the PCI Express Base
> 3.0 Specification, revision 1.0.
> Section 4.2.6.2.1 explains the condtions need be satisfied for enter
> Poll.Configuration from Polling.Active.
> The original statement is
> 
> "Next state is Polling.Configuration after at least 1024 TS1 Ordered Sets
> were transmitted, and all Lanes that detected a Receiver during Detect
> receive eight consecutive training sequences (or
> their complement) satisfying any of the following conditions:
> ...
> Otherwise, after a 24 ms timeout the next state is:
> Polling.Configuration if
> ...
> (ii) At least a predetermined set of Lanes that detected a Receiver during
> Detect have detected an exit from Electrical Idle at least once since
> entering Polling.Active.
>     Note: _*This may prevent one or more bad Receivers or Transmitters from
> holding up a valid Link from being configured*_, and allow for additional
> training in Polling.Configuration. *_The exact set of predetermined Lanes is
> implementation specific_*. Note that up to the 1.1 specification this
> predetermined set was equal to the total set of Lanes that detected a
> Receiver.

Ok, this is the most relevant part of the spec. It says that atleast the
predetermined set of lanes that detected a receiver during Detect.Active state
should detect an exit from Electrical Idle at least once. So this condition can
only be false if one or more lanes are faulty (not unused or broken). If the
lanes are unused or broken, then they should not have detected the Receivers in
the Detect.Active state itself.

So this was the source of confusion.

>     Note: Any Lane that receives eight consecutive TS1 or TS2 Ordered Sets
> should have detected an exit from Electrical Idle at least once since
> entering Polling.Active."
> > 
> > > But setting it to a value other than 1 will lead to link training fail if
> > > one or more lanes are broken.
> > > 
> > Which means the link partner is not able to downsize the link during LTSSM?
> Yes, According to the theory metioned above, let's say in a 8 lanes PCIe
> link, if we set NUM_OF_LANES to 8, then all lanes that detect a Receiver
> during Detect need to receive eight consecutive training sequences,
> otherwise the LTSSM can not enter Poll.Configuration and linktraing will
> fail.

Correct. This information should be part of the patch description.

> > 
> > > Hence, always set PORT_LOGIC_LINK_WIDTH to 1 no matter how many lanes the
> > > port actually supports to make linking up more robust. Link can still be
> > > established with one lane at least if other lanes are broken.
> > > 
> > This looks like a specific endpoint/controller issue to me. Where exactly did
> > you see the issue?
> Althouh we met this issue on some Modem platforms where PCIe port works in
> EP mode. But this is not a specific endpoint/controller issue. This register
> will be set to 1 by default after reset in new QCOM platform. But upstream
> kernel will still program it to other value here.

Yeah, now it makes sense to me and I agree that there is no need to set it to
MLW lanes.

Please reword the patch description to change 'broken or unused lanes' to
'faulty lanes', add reference to relevant sections of the PCIe and DWC specs
and also add above mentioned paragraph.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
