Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB4122F173
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742895; cv=none; b=BKyYpDWV7XioxP5tTrVV81V0xRRfXQKMoprR9wSShMNZELJJzCHGkvOFvGHE6qzCPhvry5khmS3OF/ARbpm82EhoGqA/Xy6bRj/DBSRthkYUOZeAeuAdr6/ZhDDF+/BF7S27waEIsThWJodeYukpF8ppQ8cGVm6fnIh29jcPD5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742895; c=relaxed/simple;
	bh=jyspZm5GDyE8V8MqM0DVGyy+s9l/GwhLFwsgaQQGonw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2dVbj2Ft451RM8o0H1Jxvxo5GtTt5klCQhPkDkprK5Q2zmZ/HQi0QaQsha2ztUIl4kFYWzo4NMgCo34eH4IOZRdDtcw6HMLpFmCa/OAG75MNSdG3yC0Gs2lgz57Ojl+vJrUxWg/Vo0tZIH/tGuf5dhut+bx8K9qtiHQlMW8+fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=1+MwscUe; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="1+MwscUe"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7369ce5d323so4747389b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1744742892; x=1745347692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=glUhvdbg6jDxSzyhesIM3rd1JyjGcrsNSGuSqUFVHug=;
        b=1+MwscUeTVfBM7bjPdLu6bUneloOL81f/Yya/cT52SsUTCY15XkjAkbKP9kJVSn6pG
         wM47IBzFbvRklbgrnGDSEnHY0APRUns77kG9QBm/lFehrbl4dvpFKQjhFVvMoa/EVlDZ
         W5IEz0GRUuIvoUmLHgQre9ifjnI8Oil1YZGGd3TPD02qm6aSOzsefOt7UvFLcqICue3z
         ZvFN6NJaDsf476XVogolYLzskAMkulEZuSeblXHi9JIePHQ5q9dcsugiq+c9XSEQ36Mh
         V3Uc4P6QXEhXFxSCEleM2ra5orNvvE11i/VaOIKrkBNcUwffOpwNGiFIhbFslHZczUFy
         xPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742892; x=1745347692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glUhvdbg6jDxSzyhesIM3rd1JyjGcrsNSGuSqUFVHug=;
        b=b9BgYChlTJwDGpMUekdZZg+IwuV0fvS3xVKsROMmbcekt3S9xk8YMls+1PTVmx8OKb
         f4BmLR18Psr4XYE9fHc9HSeESAUiQFa+c+fMc0VC1BBher5dIhJHihoRnCFC9MOsdyGn
         TBumIZkuVf9CwI2j8edcDVgEdyVYVCF9uYrGrjhoG3+HzYAIwyl3qhzen7tnQfe13YwB
         AINbNz4QoKUVBkHyl1WcCpxzZj7HPI8cYc8BB7KDSc2FgmgQucmqedmcEvuz1gPiakVu
         UDA40tYoIufOQlvh8d5svb824g4LZQDkJjr32DBRznPz5aOKDc6wXT5JRiIZwaH0NtFc
         8Y0g==
X-Forwarded-Encrypted: i=1; AJvYcCW4LYk7SBY1RhqxRIkSkgry6sYo446NqAa4zSf2iMtZbMSNXGOxGzIwsiSBogqjeKP+/4e+mr23xWWHjfg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj0fDEMkkU/nmPbULnJO0GeuzVaoJ2fy7Wju4pw8kz0KYLO40P
	mepdrRu53+gipZ4qN2CkWtrCWA4Z8dIiJO4EpFdRfAZHi0NXSteAoHUi3imu7aI=
X-Gm-Gg: ASbGncvlzV12u/z4McnCQWMpiFaPIHSBq8y7+9HEdxkkFLcpRCrl46cK5j4SRooMLQl
	E06z8It1NO9gLhp87Gw+XyrMnhh902ESqxMY+x0IPEZG13Vs/gmFAbBn+qJw/Hs33JhkW0SE0Ar
	LRpZGZm/Q7iLgSoTwPwe9FY9i8lJnXdNRQolLsoe4rqtFjAScpYyBwl6Y8dnEb/I2clCu0Uh6X8
	gEOcYdHVwjsTxYVg8vJkDAsTeB2mVKpWk8JMvtTJvO79FmIDMoCJFUea1qEfjk3bk4HQbcmUAA2
	qKkVQOmaOBFke2HqXQA1kl9ziG7hcvhOz7xoSMl4F+vyLlc=
X-Google-Smtp-Source: AGHT+IFU1A6IgDtbE+ayph1nkrk/Xkmje9tzi2mXCLVIUeRmrboHqr3jd6su6fZeet5H41nBKRVWlQ==
X-Received: by 2002:a05:6a00:a26:b0:736:3979:369e with SMTP id d2e1a72fcca58-73c1f8f742emr628913b3a.9.1744742891991;
        Tue, 15 Apr 2025 11:48:11 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a4ddsm9578290a12.49.2025.04.15.11.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:48:10 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:48:08 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, ulf.hansson@linaro.org, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 19/21] riscv: dts: thead: Introduce power domain nodes
 with aon firmware
Message-ID: <Z/6p6MQDS8ZlQv5r@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d@eucas1p1.samsung.com>
 <20250219140239.1378758-20-m.wilczynski@samsung.com>
 <Z/2+rbhsaBP0DQop@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/2+rbhsaBP0DQop@x1>

On Mon, Apr 14, 2025 at 07:04:29PM -0700, Drew Fustini wrote:
> On Wed, Feb 19, 2025 at 03:02:37PM +0100, Michal Wilczynski wrote:
> > The DRM Imagination GPU requires a power-domain driver. In the T-HEAD
> > TH1520 SoC implements power management capabilities through the E902
> > core, which can be communicated with through the mailbox, using firmware
> > protocol.
> > 
> > Add AON node, which servers as a power-domain controller.
> > 
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index 197df1f32b25..474f31576a1b 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -6,6 +6,7 @@
> >  
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> > +#include <dt-bindings/power/thead,th1520-power.h>
> >  
> >  / {
> >  	compatible = "thead,th1520";
> > @@ -229,6 +230,13 @@ stmmac_axi_config: stmmac-axi-config {
> >  		snps,blen = <0 0 64 32 0 0 0>;
> >  	};
> >  
> > +	aon: aon {
> > +		compatible = "thead,th1520-aon";
> > +		mboxes = <&mbox_910t 1>;
> > +		mbox-names = "aon";
> > +		#power-domain-cells = <1>;
> > +	};
> > +
> >  	soc {
> >  		compatible = "simple-bus";
> >  		interrupt-parent = <&plic>;
> > -- 
> > 2.34.1
> > 
> 
> Reviewed-by: Drew Fustini <drew@pdp7.com>
> 
> I tested this on top of 6.15-rc1 and found no issues.
> 
> -Drew

I've applied to thead-dt-for-next:
https://github.com/pdp7/linux/commit/2bae46e3de2a64fe3a619d61b16da0c01b8df2a1

Michal - are there any other dts patches that I should consider for 6.16
PR?  I would probably send to Arnd around 6.15-rc3 or 6.15-rc4.

Thanks,
Drew
