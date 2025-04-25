Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392A828CF73
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745596661; cv=none; b=WiT73TZeKDqAtoIsJq0vvwcGdkpGTutUSmcdWF3qanZdYyB0Y4d0ogOad7kohX6m0WN6MWWNIP8Mr0Tf1nJcBZcsVkLSxSxqBAA6CZhw5s4WL29sn3FB8zj1EKzC4A8me7LSeYewA3BX/HdJ7S8Ay5T4Pw5vuXcKG5ObVHGfliE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745596661; c=relaxed/simple;
	bh=GrbOWzhD8A9EcQ9/oMNEwl0tUg9WzmBru/yKPO/Wkt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnCZWxJwPk8IWFeck/7VuEBwqLyclKMt5nADHPf2wYXcQ6rOyd7c5vHQkGPANH8l9M9OsNmdZ4P6hkqjFRtsGk+aaoXUsObWUQEY7ir8VkeF2AdWwRrG1YsMnHKl3ci6dtoH7cJHgSanrIoH1OyvCkEGrwxfcNsqYhahPF+0KQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J0oI7sat; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J0oI7sat"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739be717eddso1954534b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745596659; x=1746201459; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=utSRlvWwaJPUba2da6V5YeBrAL7QiUQpMkQtkrVxrps=;
        b=J0oI7satcWS5kMz1Pr/ksuZnUF9RXWls2CiZDEPvzSmesUlm6HU4g04ZWVjviV1Kfg
         fKgax+rfKN+wfczorKW9S0PiSXxEQ8/7DKgqay5tT1jJI48bF8MCIHxiZZDwXctLteFc
         4S8iUfhenJWhcINUT/eK/mpaBsReqSFlmvYUMpGtnaj0amK0k+OPfK9G4/TZFA38cpfX
         XsEC9CCFnjke1OJryLa3/torC7IjSjMNfTmL9VZ8wcc+zNSfek1CfvXzywJUJei0TXP7
         FNuI7Dg48ATDukh4fR/bsR37huZ00nX0hWwjzAw3LHy3rah3HW4s+4T4DzpbNh9Hj+uM
         dysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745596659; x=1746201459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utSRlvWwaJPUba2da6V5YeBrAL7QiUQpMkQtkrVxrps=;
        b=AoKwdt2DXp1GNvN1bQ6WiIJLGMzmvWYG+3Pk7sDaYpKezaHmF/5Tvxd4tc12LVBDCs
         9pr4Gu1y+RAhm4PTvfunpEFhA41ltFpPPJbc6nMQE3WcmV7xN+8pVLKAyISj7wy57MxZ
         HWCd/z7hejcedR+6sgzNQMiA+2uLsag7D66oILvUQS7etjGej02EINqCbwEy/TX++Q3i
         QOQjSnDgOhDcwW7nZ8ZwEHjQ9Evh/Nxp/wo6g+QKCHPJ1XDejDTg0IUIyJvPa5nSQwmA
         /Ik0qE8xBPiKB7cJqUa17OxDptxm/IBnUILepj20Rb5N3Nf5owswAzDZAoHwhIujapdZ
         86VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUToU5dpatT9MING8lxVXnlm5Fg8PddayIQEizLu8vexFJuK5TiCeJsLupnuxNu8n81VJq9y7DVxeWuMKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp6p566/R0vh+4Tq/PKW65AL61xQ/VgAKMRRo75zG2LJ6Z9qPu
	FwAAjxzU570obqB2AV5Kb/JdVYsdGozljb/y5JgkvONDR2SpnXnnyeq9Z+O3oA==
X-Gm-Gg: ASbGncuDzSvxu9SUsBaNNc5U4CrCDswbqRmAkSS5NZxujDdIo8iTyZhvZp2OLl6T3Gz
	a0jxbAkUfa+bKf8Bn0bIH5woLgwPEuxAB1wmGGMwP/sT3wcVwSkLWDC7mrZYgDXOQ0+humDxj9v
	MurDEIHNZxo2P0wmY211OmqfXqHFO3PbQcr15ica5wrfO8qEJCNLvEBkbjXbG5G4a8BLsZcdXT6
	1xvkkesDWNIns1UWQ3z3gQmyMSbn1EwgGAeURkornoi8RlVpVaNXeYl3fWBuGYB0mMgH9DT9t/5
	nb8NDRZBxu/8LIy1VQTNUOjSWM1bD/K6mxA7T2Z6YL/v+AoaAJoe
X-Google-Smtp-Source: AGHT+IEv9WTyD1hNXstYJB7wgOh80HyepKndFk0b9Nsc+PbCz+wAO+jxkDebi/3q0xjNfV/24gj4Tg==
X-Received: by 2002:a05:6a00:b93:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-73fd8b6be23mr3721308b3a.16.1745596659476;
        Fri, 25 Apr 2025 08:57:39 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912c94sm3344436b3a.3.2025.04.25.08.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:57:39 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:27:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/10] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
Message-ID: <7njsbucxngxc2eninh57oexywiqsyysrbesyige5zwr4pmxf7t@rw6657lheg4j>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>

On Thu, Mar 13, 2025 at 05:10:09PM +0530, Krishna Chaitanya Chundru wrote:
> If the driver wants to move to higher data rate/speed than the current data
> rate then the controller driver may need to change certain votes so that
> link may come up at requested data rate/speed like QCOM PCIe controllers
> need to change their RPMh (Resource Power Manager-hardened) state. Once
> link retraining is done controller drivers needs to adjust their votes
> based on the final data rate.
> 
> Some controllers also may need to update their bandwidth voting like
> ICC bw votings etc.
> 
> So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
> the link re-train. There is no explicit locking mechanisms as these are
> called by a single client endpoint driver.
> 
> In case of PCIe switch, if there is a request to change target speed for a
> downstream port then no need to call these function ops as these are
> outside the scope of the controller drivers.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
>  include/linux/pci.h       | 13 +++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
> index 0a5e7efbce2c..b1d660359553 100644
> --- a/drivers/pci/pcie/bwctrl.c
> +++ b/drivers/pci/pcie/bwctrl.c
> @@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>  int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  			  bool use_lt)
>  {
> +	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
> +	bool is_rootport = pci_is_root_bus(port->bus);

s/rootport/rootbus

>  	struct pci_bus *bus = port->subordinate;
>  	u16 target_speed;
>  	int ret;
> @@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  
>  	target_speed = pcie_bwctrl_select_speed(port, speed_req);
>  
> +	/*
> +	 * The controller driver may need to be scaled for targeted speed

s/controller/host bridge

> +	 * otherwise link might not come up at requested speed.
> +	 */
> +	if (is_rootport && host->ops->pre_scale_bus_bw) {
> +		ret = host->ops->pre_scale_bus_bw(host->bus, target_speed);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
>  		struct pcie_bwctrl_data *data = port->link_bwctrl;
>  
> @@ -197,6 +209,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  	    !list_empty(&bus->devices))
>  		ret = -EAGAIN;
>  
> +	if (is_rootport && host->ops->post_scale_bus_bw)
> +		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
> +
>  	return ret;
>  }
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 47b31ad724fa..9ae199c1e698 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -804,6 +804,19 @@ struct pci_ops {
>  	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
>  	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
>  	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
> +	/*
> +	 * Callback to the drivers to update ICC bw votes, clock frequencies etc for

s/drivers/host bridge drivers/

> +	 * the link re-train to come up in targeted speed. These are called by a single
> +	 * client endpoint driver, so there is no need for explicit locking mechanisms.

You need to mention that these ops are meant to be called by devices attached
to the root port.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
