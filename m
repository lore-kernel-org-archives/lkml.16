Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396FD9476
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748576830; cv=none; b=M6dCFhPczc9TCS/NcmaHmxOTDPKm5+jDp8NbabHMlPdTXiHPD85LYAayz9uwBNVtLRAr6H3VJGfuet31C4R3FdRLEESb3d6YXsWA3/vjgfkaTN7lMCsIuXECOHizIns/Gmq9zMCF/RopZJfxoHeKE65I01qECU23677TDACkCfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748576830; c=relaxed/simple;
	bh=c3oROZAnmot2cTBZHDWM/GZvhkiifzhaYpmj0YJf/qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfBEnkDDDBGMHcsofxVzObaBcfFrJWVs+K4KpLUVO1m66LgcX9SOd/jOT8iO9lw1AWuY80+fTymop1KCj5Q9t2skgjvIch7smvkvwJiHnCOcQ2Jj44aIz49+YyJ9gvpBVR3bWDYIR8oObf9KiDFzQ4WXBFd/46bAJgEu/HPpHqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y5ZTjYkU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y5ZTjYkU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234c5b57557so15925905ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 20:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748576828; x=1749181628; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zYT+yS9DtEtNjftxWM62aj+gh1F4QDHmOM8kYqFz3TY=;
        b=Y5ZTjYkUqM0sAka0QBTlw1e8PjTchvMbArvtvC0NNzlyiZ6jHLkxfeN+wKPMpCZbyv
         DD0/88ISc8ZrIJdG5C+waHncCkxBa5UMlk1a5XEnRjbivugUXzw2QZgx0RepPtawrrfO
         0ws9MBOJp5mrsfO//q/dxDHDEfL/6vnLQszggjRcr5J8KUpp5RZjuIXZKb5fiC80UGoY
         7zxlnvBjrccpZPGmiApSxBtn5vjDPMJuxBBExgj2vq1LsyjkBmr1bIs9s89hvurJHktZ
         SftkG0XEhrJSaSlRelwAsHWphRmPuThhaVlsJZQb8BiAywEytE0uD5p6M73RY1g2ZlTM
         0/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748576828; x=1749181628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYT+yS9DtEtNjftxWM62aj+gh1F4QDHmOM8kYqFz3TY=;
        b=VxlGx3jf7+pNR8gEDyXXoPUwWV6fDmoXtxhfRISfxVCdcvGekRieN3Eh0GV+HKuaDH
         pgdBm6f+a1a9qrmlK9ef1c+yi6TUecnhnAhmjV8v7cq0hCb+GWg7Y4pHDB37t7cAulVL
         TUtsrgkBXJHQd9OzW6hfu9dtRVo7TAyJvFvK6hJH5c4sJBU/Z77W7szRF99H4DVrIqqJ
         87jEqfVTB3J5fEGfUY0WnTRDrq5l1my2BEMC7KhMXj/412qurvRg4QuMx9fXGAyAb4Aq
         Ts+i0K7JX9Npy68dwvIr1VEeK/7hxeQg6GtVQHsckbj1fLtdnd5yqA9hoCrO22vtc5JS
         Y5ew==
X-Forwarded-Encrypted: i=1; AJvYcCVa1S4GUya/k8u+NLNcxheb5iqUv8n5QRqs0IaLAEkKsPOLx6Pnfp4AJd21NgVfFMKj5CJLzumcKQYlIwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+HIF1/Qd0+m7Pk34l5eYyj4T9F7lVLgYJVKUODlEdxqXdNQhm
	AIDGNqTJr5nAOxWm0eTY/uDur0pQ/L84DaJPQpW8JtaLshYFmR1rKNAIarcD9Wy7Lw==
X-Gm-Gg: ASbGncsreXyhednkbu2JnS8qaqL87D0c4tD0gBQ9MScTqC+elDxsO+Ks7QRp1Ol0nbx
	2NyYSqjPSn9S6vkZ0aoSAdv3c7ywFgVZrDEhI6F4oACkCmXGzB11BQ7x0SAu3B0MNnjPbOl1h9l
	eQDl7HmWwHhRCCJ+7W6NiooYd3FIVdXqZtJwDQPKd/IEEqSzNqOWrD2mHHzK2QKlVfZ/G5ZAF/u
	8ZNV5XOyw+q6BWBXVcFDL/KcCo61q/HldE5IkwrFKdUVn0+NBSbT+xzd9kyKgCNKnfG/DHa5UQ/
	HtBTDFtV66pCZ07VBfQpsSsWd6OBNQ64pqI8x92P0MbBVX0Kdp79uvB+lMStfw==
X-Google-Smtp-Source: AGHT+IHUystiPvDn8wtXmAxatZwAwM/wyWA7RAF5uIDmvCTdpWPCHf/AgW9Un8RMnzAXGJkMNGGi/A==
X-Received: by 2002:a17:902:f711:b0:235:1962:1c13 with SMTP id d9443c01a7336-23539563146mr10695205ad.14.1748576828510;
        Thu, 29 May 2025 20:47:08 -0700 (PDT)
Received: from thinkpad ([120.60.139.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3c236asm327042a91.42.2025.05.29.20.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:47:08 -0700 (PDT)
Date: Fri, 30 May 2025 09:16:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
References: <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
 <20250528223500.GA58129@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528223500.GA58129@bhelgaas>

On Wed, May 28, 2025 at 05:35:00PM -0500, Bjorn Helgaas wrote:
> On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> > The PCI link, when down, needs to be recovered to bring it back. But that
> > cannot be done in a generic way as link recovery procedure is specific to
> > host bridges. So add a new API pci_host_handle_link_down() that could be
> > called by the host bridge drivers when the link goes down.
> > 
> > The API will iterate through all the slots and calls the pcie_do_recovery()
> > function with 'pci_channel_io_frozen' as the state. This will result in the
> > execution of the AER Fatal error handling code. Since the link down
> > recovery is pretty much the same as AER Fatal error handling,
> > pcie_do_recovery() helper is reused here. First the AER error_detected
> > callback will be triggered for the bridge and the downstream devices. Then,
> > pci_host_reset_slot() will be called for the slot, which will reset the
> > slot using 'reset_slot' callback to recover the link. Once that's done,
> > resume message will be broadcasted to the bridge and the downstream devices
> > indicating successful link recovery.
> 
> Link down is an event for a single Root Port.  Why would we iterate
> through all the Root Ports if the link went down for one of them?

Because on the reference platform (Qcom), link down notification is not
per-port, but per controller. So that's why we are iterating through all ports.
The callback is supposed to identify the ports that triggered the link down
event and recover them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
