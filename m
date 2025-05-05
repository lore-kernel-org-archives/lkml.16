Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68209268FF9
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461692; cv=none; b=ryFODMEGN8Baa3vLJ/uhVDF8Z1zmlGMVlafXnpAa7SQonU391FEFev1ReQ9NlYN+FHxo0mBznJLptEfC+iKDGlm958EwRiVFmAZNMYJZ/pPp7mqZ9bVD3t/uy/qtVYjk743XDY8l1xkqfRQln1JB1J7Gb+PpPARd6+REv/yMpQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461692; c=relaxed/simple;
	bh=uLrzbdahsUmod1H0JDtWBWqN4XVQU2rX5062gbNEroo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgptEq6eJeCVPwNQYEdppx8ka9S3lr3I6jEe0lOB5QdfaOk5PwiJLa2biG6x4yJK0f42zcHwVRUQ367nRHvPMOkwuOgVNN6h+lf2rKTBvU1Ib/6aoYnnynaoX5qgd/8l4HMGvP/Pk83gUxZ4moawJxaHzDcJPDx6Y61rzMpEvPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=As9c624a; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="As9c624a"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736c3e7b390so5338774b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746461689; x=1747066489; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWvry4KDZapMEnULakjmTiQHQSX4k/taW1KwMUhJXLA=;
        b=As9c624aaiMVAKB+VJ4z90aQeuIRSig7YQw6b2NSQ1m+SxpqVnzrzd8tkvAlY0tXEd
         2Lxo9X1X255L2SvYRrsbuRTKZyOjWFoLuBcfFArQKhXwhU5dTOF4Jk/Zwi9U/eZQpxBn
         9Gnwf9zhrL/ot9XyIRUkQpJ5p1d6ecqPhaYONVWUoXr81S6wOB5+AX7C5SWWnwIYhs0z
         V5JyEhexCWicPVKm/vC4Kay72Ubo9AoqKm4J6YF2yyt7rKHApAccXhHd6W5AJif9Gcn1
         RcplOuXeiSYRMDDD7fsRDnY8MNKHTGhthQkgQWNlqt1ZTq+KGtPLuRNBkyWQTdLb3jSm
         wq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461689; x=1747066489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWvry4KDZapMEnULakjmTiQHQSX4k/taW1KwMUhJXLA=;
        b=mpCxeahfLQWbrt93oyqXLKgxZC6+dVze3W1wsk61yFBhsn00Pq39qCgS1DET4YkvgD
         oXijpPoNM3Rcy5ab6tC5chkSX82GMvVzzYhd21Gq+Hk2ZViR0zomWn/eLSQUKZuK8VD2
         YkDq4oYc9+lQC3iEFrL3SAphfikf/u2bJnFQaqmQMVwZtcSBHqyMGIGGewCbINdbJrNN
         6GR3n5vRdOQ1OPp+36lxf1ZiYMw91PZQHxWB7bMXn+j3Ki5nglO1J1d2/kwPFY8FNjCT
         p0iy+UJoBMHdCpwGznzsugFk+HF9II7dELESC55e/gnHxHKGK4IeVRemkhmUPsYqqHSB
         VUSw==
X-Forwarded-Encrypted: i=1; AJvYcCU8cM6kMM9fAi9IekhSStERW4rK+ZJPKy1Hm5COHT/3cCctN55iA5niQ+4R0Ki/ZAGamQoYfHUPq86AIKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvIJJ1QTSHA5KnK9QMxMSgSN/rokDYyhpXAB/3CXMnsXBp3ENN
	q2APVyBlW3qVQTriIG9R30A2PYPCyml0X5M7DpKSnyw4HsmFdnVwwNoXREzQyg==
X-Gm-Gg: ASbGncucSLA0/rnRF6dxdF1rKT+IwXNyxLRdbAvCXPq4eB0srKy3h7tgfMdrmalWGIR
	evAfpOozFSJpbGX7FRpJPhZx/EA2FhuuzTk4Nw/hLsi/02UtDO7AVhi1h9zk9PleIZlz0HIhQTe
	ZI8bFVx7pMhBu5X0ddAZrlHrRGUihVQUzIfX3dVWOFcpJovuPhe6pSvX1MJX9ha8MPeyvh7N0IY
	E74z1Yxtge/GVMBG864vNPzKLlzKlg5o5yKtFbkevsVlCm0QfeuUn727ISGj60wbZxJOa1P0Mfi
	6nwexrUuoS0XRQz8OTjPJ1zh3uzfwLAZgOj/BMMo019rg1SNiRU=
X-Google-Smtp-Source: AGHT+IGDlihVIhUXhK0fIymH88F2X8FV0rkQuFidNrc3Roi5FkXvbM1MtssO/KpT/pJrJT2EqnO02g==
X-Received: by 2002:a05:6a00:9095:b0:732:5164:3cc with SMTP id d2e1a72fcca58-7406f17ac90mr10027660b3a.19.1746461688655;
        Mon, 05 May 2025 09:14:48 -0700 (PDT)
Received: from thinkpad ([120.60.48.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a1c09sm6964138b3a.168.2025.05.05.09.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:14:48 -0700 (PDT)
Date: Mon, 5 May 2025 21:44:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, wilfred.mallawa@wdc.com
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <tflie6ncttih5jxn5xg3zvktidqv5jaqsnsuryy56qfq7pghxd@ippj4lhsdqme>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <aBjTpglI5_P2Q3Aa@ryzen>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBjTpglI5_P2Q3Aa@ryzen>

On Mon, May 05, 2025 at 05:05:10PM +0200, Niklas Cassel wrote:
> Hello Mani,
> 
> On Thu, Apr 17, 2025 at 10:46:31PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > @@ -1571,6 +1652,9 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
> >  		pci_unlock_rescan_remove();
> >  
> >  		qcom_pcie_icc_opp_update(pcie);
> > +	} else if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
> > +		dev_dbg(dev, "Received Link down event\n");
> > +		pci_host_handle_link_down(pp->bridge);
> >  	} else {
> >  		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
> >  			      status);
> 
> From debugging an unrelated problem, I noticed that dw-rockchip can
> sometimes have both "link up" bit and "hot reset or link down" bit set
> at the same time, when reading the status register.
> 

That's a good catch. It is quite possible that both fields could be set at once,
so 'if..else' is indeed a bad idea.

> Perhaps the link went down very quickly and then was established again
> by the time the threaded IRQ handler gets to run.
> 
> Your code seems to do an if + else if.
> 
> Without knowing how the events work for your platforms, I would guess
> that it should also be possible to have multiple events set.
> 

I agree.

> 
> In you code, if both LINK UP and hot reset/link down are set,
> I would assume that you driver will not do the right thing.
> 
> Perhaps you want to swap the order? So that link down is handled first,
> and then link up is handled. (If you convert to "if + if "instead of
> "if + else if" that is.)
> 

Makes sense. I'll incorporate this change in v5, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
