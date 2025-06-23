Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EEC24A05B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680982; cv=none; b=kmManMU4H8HnL/xxbyf6exyI4zUnb7SMUbCCSCNCKUsc4VYpuCRNNoe/j0wnpz2h7+V7yIkAusZ33K2qWa8BntfYG+85Oh7SZw0UKqVXyYv7JMO3WsuDRqJF8u22euh4H/5Bpd87IzfpttahfxsqMD5uSIgqATenQQ8WyJAV9gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680982; c=relaxed/simple;
	bh=NkXLZqiJfY/csdYeqd5+JOrKqFd5dWqsdN/hyy/5zL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iW/xHTE7pVU3OPO152kqxXqTt5bFEk8pBxqZAr6881sUMwnTveATyRjXjyw6uXWWevW3RyILjPiVPtwWLQxzgjaRE1W1CCsCmNy7xHDdaxrwPloRRFPDVmtICrcz8bdPWBQQgM0gypc5vRMMUgcrUng8t1vfEDF8WZC+XAgv9Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsL0ov1r; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsL0ov1r"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45310223677so31019775e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750680979; x=1751285779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tI+c5+DB9KdJhJt1LZtd5DtDnbtfkWz+1nzFqyeD/8s=;
        b=gsL0ov1rWp7V8txeD4D2i+tZvViClai0LdlAL+uxdeWoIQmeVpDGeB3dZE6QEd7U8V
         Ek5VjYRUmYA4fB+JuBMYDcJ07XCUK52zRCj7cIjvWVPalb1aSjyTZD2scf7hcFw+S0zw
         SnL+c/ODUlm0H8FYoq/IB6dUusy0FhYndvyfLC6AXB4jmjXFIHIxn+vM//Itvc9QjvZF
         orAqSFgfuMycZKgEMdqzMyF64UwoXzq0X47S7I62DVnT4X01IgF7qXqYIk2RLaCfgxM/
         gEXTxREfJuYaMnucziXNcac+ajtnOytFnaMFPhbkXkHzp4QsuX5R4OS+J1S4HnIFM80P
         M0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680979; x=1751285779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI+c5+DB9KdJhJt1LZtd5DtDnbtfkWz+1nzFqyeD/8s=;
        b=qZOpddrJEUr2AFNmJoMR13MEe9UscuGO9Kl7w4UIJDPr+Kv547E/xHNCCjXQiPZu+0
         5nVXbdVbre2pWuEiucO9/D434r/MtpkurGx8Z1t/46E2jW9QZl41uL0rQ5CighTjpkB1
         8LBh8lEkTY5u9IvusPub8U45AXQvuUH/Eh8v4LyqIQ+qN9IO/6hzpWbHBI3DwrkSYPg6
         3Egmy63OdCfKnQA7F9/Y0m2DcpKbb0KCh5cH2VUCl65r44Zyz89K+6lPdVtWFXU3JBK+
         Uf3BGVC3zDlLtz5hQFeh3oD09/eq5EkqGKJo474fNyW5/T3Wnp2SUNp8SbA8Po4LKvhf
         Fxtg==
X-Forwarded-Encrypted: i=1; AJvYcCUAHeqbhVMSVxwCd+OLbBSAQ5zBhyGDtkYdtsvOnd4hyaqGkaJuxCqWb5DhZBdahHzKTqrYpZ69q8a4XKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBFxILXyngQ6o6bOynYMXkiuz9g3MijBB/mFw37Wcb6AX0x4pZ
	kGK4DvSImGYQmmhexZYoB7EdE32PHzbqUKTwgDv1eAQW/aGrS3VngPdVddhwyYIlIgo=
X-Gm-Gg: ASbGncuqMMhKS/BYCf+byZ+BTEPnNyV2Sx0eM/CanbLR1HLa8T13XFgy8W8/DhV+ZjM
	199nOCELaeaL+0RgwYcj7oOJWZAaVIUXYvA9YPeIPvYuJ2xRBVVfumEWewmMsL3J2q+zuHTGBOT
	ebCXflviXlVYNKlAF5SAWHQIrl9BUbbsWyaqBN8SPZgGgP+S+xknK5IGrdr782evHXcRB+RssbC
	luNBwtExCU52KiYcf6pTmxSdFfx5ff40BdjjBJ8sT3olRhdoYCUidVgiYMUBCJXADWXEwj06CGL
	2RPj5MnuIgalPBzFkqytK+43u8OSSyqarsbgiY6gRIORyLgwI+B3/ZGOg26MTBIM1ByQhZa9Gg=
	=
X-Google-Smtp-Source: AGHT+IFldADGsyYQzcmWOXmHdcApCNvxHXRGgwlxtSHaBSQ6Vsn5s+guD1RaxkhQlgmOC9uJO8RIfQ==
X-Received: by 2002:a05:6000:2282:b0:3a4:d79a:35a6 with SMTP id ffacd0b85a97d-3a6d12e34b9mr11149269f8f.14.1750680978817;
        Mon, 23 Jun 2025 05:16:18 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b3ca:db17:bc4f:ae5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647084a5sm109160175e9.38.2025.06.23.05.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:16:18 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:16:16 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anthony Ruhier <aruhier@mailbox.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 Bluetooth support
Message-ID: <aFlFkD7uNC_lOtHg@linaro.org>
References: <20250610-slim7x-bt-v2-1-0dcd9d6576e9@oldschoolsolutions.biz>
 <fbedfcb3-a326-4357-8d10-3be925e5df8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbedfcb3-a326-4357-8d10-3be925e5df8f@oss.qualcomm.com>

On Sat, Jun 14, 2025 at 09:54:05PM +0200, Konrad Dybcio wrote:
> On 6/10/25 6:59 PM, Jens Glathe via B4 Relay wrote:
> > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > 
> > To enable Bluetooth pwrseq appears to be required for the WCN7850.
> > Add the nodes from QCP.
> > Add uart14 for the BT interface.
> > 
> > Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > ---
> > This patch adds the Bluetooth support for the WCN7850 card on this laptop.
> > Since WCN7850 is supposed to need pwrseq, also added this from the QCP.
> > 
> > This is also part of my tree [1] for the Yoga Slim 7X.
> > definition for the pwrseq and regulators.
> > 
> > [1] https://github.com/jglathe/linux_ms_dev_kit/blob/jg/ubuntu-qcom-x1e-6.15.0-jg-6/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts 
> > ---
> > Changes in v2:
> > - rebased to next-20250610
> > - added tested-by from Anthony Ruhier
> > - Link to v1: https://lore.kernel.org/r/20250426-slim7x-bt-v1-1-d68f961af886@oldschoolsolutions.biz
> > ---
> 
> I'm mildly confused given the multitude of options - but does this
> check +Stephan's M.2 description appropriateness check?
> 

Well, Bjorn has already merged two instances of this description in
x1e80100-asus-vivobook-s15.dts and x1e80100-hp-omnibook-x14.dts, so it
doesn't sound fair anymore to block these kind of patches without
proposing an actually viable alternative solution.

From a quick glance at the Yoga Slim 7x mainboard, I think that WiFi/BT
is indeed a M.2 card there (like CRD/T14s, but unlike QCP). We haven't
decided on a good way to model that yet. It would be nice to have at
least my TODO comment that I added in the CRD/T14s commits so that it is
obvious that there is ideally still some rework to be done in the
future.

Jens, can you add the same TODO comment that exists in the other two
device trees mentioned above?

Thanks,
Stephan
