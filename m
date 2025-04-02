Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F662E3385
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607063; cv=none; b=Wun9cnW7PufwhBMYMEbQqxcH0HCl9jqeR/2KxaGSWSvuCyLH0iz8rcSPh7qx1fmBr/iSFt4bdNFsw8qOE2l6BskSszDQKeqmsnkKpsI5ED1P6hbEe/K6N3sFeY3hktj7oSN/4Dhvh4M+9zD/QDuzpufs+EbbwI5a6+t3+qsB1Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607063; c=relaxed/simple;
	bh=bz3rHQ1LEZ5GlZRhjsHjlZAaWas133zf2WZHx8MQBRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuUX0Y+Gj2khE2poxode1Rs4B5z8CSxusj4Tgbexg2WXO5pQhkRXbja7tOpMnnzbRrLwU51LW1b2+92Ph/EWC0uXkbEFdJfQFzAEqFExxkxtQh/zyrOqUeEXtnBTxFzWGNLkncs8dEA9SdRfR4Yoi6xJAb6EyBzYbmB6Frpnaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uihdAEGm; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uihdAEGm"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301302a328bso11534984a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607060; x=1744211860; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A1VmkVlpRc4WSi9FaO0aW2j/f9rNxZ3VMxxdj/njEz0=;
        b=uihdAEGm4PcmfdflyqkzuBZmJG3CKxvzbghFT48jhXFYejBMVyVTMYL99PS9Sbtk+s
         NF1von7CcABHbFDLGxrqNgVV+P4ZHKnik/lMlvczg8lMvOv4xT6SN1w5a0SAy0JTebO/
         5gOkOtwpKjHUTMMBvqhBYlA+nDS27B+0b1IU9VgDpkIMPHq/TdkGj3LsU0Vz1hyaS5Sb
         DeASb8RjvcPYqZWJNB1eKEnyfLY8M/zVOE8xI+WgX5YfcWizXeAbAwp2tK/pz8ipNDvo
         2daIy4zErCe3sVPvah9cNzvjTFJ9DBRscHDUwFF0Eq6OtQt/hVtBINl2NLZJjP3Gz2CC
         NBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607060; x=1744211860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1VmkVlpRc4WSi9FaO0aW2j/f9rNxZ3VMxxdj/njEz0=;
        b=fryQ5EhE2pv27cgOpx4cLUkg6BxCEw/GIwSFY37F0R/IFv+aZ9BBPPLayGkUyVvWVZ
         zf1OW+7Y1wb4GdyVNuR4LvqG+FpTLkqGCc+ZsA94YrpU3RFy/O5oq9y49lPq4qnU3SdL
         Z7+15lhznX9J+TiukxoTc4fxne5p5POLB+tHOj3VZQP6yjqt1YzE8cPSQXDvenAqN12E
         GqUrUzL/6KOgKQ/zF8s9XHtRFGRBkhG7Eg6PZtot+4+u5rz2+vNVAxhFicSk6LxKmI/Z
         HP3q+qPpMJv2EBZF6nN/a33j4cUM2WDfWl5Y87Wsr4GVTxICj0cq03DYAZ7+e57vO3C7
         jkjA==
X-Forwarded-Encrypted: i=1; AJvYcCVXd2pMw7JAP/1aldRo8/rM2/zkMPKQZzrDyyBHtxa7V30gx6JkutGu+LxtGKAN7Z2T78kqOWo3Ww9nEbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRhuYMTUBF0iAS1seiY517IJ/+zu1SC0w7b4GEF6n7A0XRvlaQ
	8djmkZwONk5z9ex61/H0dc5F4XZj2yhKQ/IhYS4SVGD3fPlWdnNDXY6EncpEIQ==
X-Gm-Gg: ASbGncvGlqR/eGnmi1OGjZ/FQ2kj2EETqdlcC0rrp+Del3pg+tvjjibhSrlNQWJvL3B
	FMfKp5rDbRvxmdf1eiD5BewQPJHU1a8hpOdUyUEtsd7pgxuD/VPavpCRrywQnlUtc04XJ+W42gZ
	NLQ5AB9IeJCwU/+nVn37ZSo72eucaducDIdht3GAvgx975Ee0DZv0GgdUfMZIAyr2YP2tV0kkrn
	qbNlO+Pzcknmi9db2/BZL1bTTJGBu+BfunTb/Q0cCSr20FF1frKuiuT26hQx0HSc3XdUFHbZYFg
	hdsVtd1Ck0qYDaT1OETbZISLuPlR750Pcb1WQ6wtd7Jr0GcJsyTFSFVM
X-Google-Smtp-Source: AGHT+IG16MivObzWU33JTwzx5znIxU6+vnQt0ROoOp8Kq1NbarWsZJpr2IHBGg06IH61ZT+KYFb1+A==
X-Received: by 2002:a17:90a:e7c7:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-305320b166emr18279561a91.21.1743607059436;
        Wed, 02 Apr 2025 08:17:39 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedf9b4sm109376755ad.84.2025.04.02.08.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:38 -0700 (PDT)
Date: Wed, 2 Apr 2025 20:47:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit
 L23 ready
Message-ID: <rqgl5jjauppyudgmugp34fillkeli3qkwf4uf2djghi6nslebg@pyi6rbwyduxd>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-4-hongxing.zhu@nxp.com>
 <ovaomfvo7b3uxoss3tzhrkgdy6cvxi4kr2zxmqsfjxds5qfohl@t6kc4rswq6gp>
 <AS8PR04MB8676687332C78840B927E7568CAF2@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676687332C78840B927E7568CAF2@AS8PR04MB8676.eurprd04.prod.outlook.com>

On Wed, Apr 02, 2025 at 07:59:26AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2025年4月2日 15:08
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; bhelgaas@google.com;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit L23
> > ready
> > 
> > On Fri, Mar 28, 2025 at 11:02:10AM +0800, Richard Zhu wrote:
> > > ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through
> > > Beacon or PERST# De-assertion
> > 
> > Is it possible to share the link to the erratum?
> > 
> Sorry, the erratum document isn't ready to be published yet.
> > >
> > > When the auxiliary power is not available, the controller cannot exit
> > > from
> > > L23 Ready with beacon or PERST# de-assertion when main power is not
> > > removed.
> > >
> > 
> > I don't understand how the presence of Vaux affects the controller. Same goes
> > for PERST# deassertion. How does that relate to Vaux? Is this erratum for a
> > specific endpoint behavior?
> IMHO I don't know the exact details of the power supplies in this IP design.
> Refer to my guess , maybe the beacon detect or wake-up logic in designs is
>  relied on the status of SYS_AUX_PWR_DET signals in this case.

Can you please try to get more details? I couldn't understand the errata.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
