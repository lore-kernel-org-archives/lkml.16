Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBC0213E87
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593086; cv=none; b=KZLFYbAtinC3AGF6K/F3Yf3aREA71Gv2L0nrTJCIbvRL1OqwjSNOQ3hZIoI16kODLCeQCId0uZD4ERwLbQ3myE5KF0fgba99u4otD/M/eGd3miBM3Q34g0aiv4eMtKNrBZ1XD/zB8iPBiAhRWbi+64EXTQUDHimHN1yXIR70Oy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593086; c=relaxed/simple;
	bh=DQrineTon4oBDwNOMF4wAf5CmVWaPXA6hctLTPhSRGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OeUu2LRRu1Zm0bJ1lNJvwSI0bqo/b9Sy7DVJSntg/oTOXX3UOuSQH6Mb0SIqL+5AOmDlhhC3XYZzAJ5YBFZwKA1GV6/FE/U45BYCJvASix3YqFp6zDipzbnF1c/y6F5t/NGkav55bsz/YFmw974DYZ9uxfKuZ43Qt/iJG+RvNm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zb+GY5TI; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zb+GY5TI"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3043e84c687so38518311fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738593083; x=1739197883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TVDFcnyLh4wiaaDr8pcIi9tA5w30/ZdPI8YjayS2Hzg=;
        b=zb+GY5TIhM2nbK06gYj/ZNfnr2LTdO2txfz9X/A5chWrBFx2IU1ezNk9jPmQmSTxtv
         R8r9XlKzhmL0FqqVP8KgiDOZ4RLYBz6RTKPYeiaWb4MQ65p43NrBNtWzDB9vZ3um+ISA
         v179MO1PyEWcugimeTGIjyZQUFThabrzPgOpClQRrliD7Nd8xCZ3Yrvvkr9VBdnHjW72
         nNJJpFzuBSqn+TNQ7YfsG6BRHAjiEz6rhXeSWzNWIoL/woNu3puY+Ra10miLTNAwnj8/
         CD+i/kr9EHmNkfWqMre4Ja4JCl5z6jA7CetlwjY1GZr3w1qtdY44jFRrfS605EjY8TaS
         FQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593083; x=1739197883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVDFcnyLh4wiaaDr8pcIi9tA5w30/ZdPI8YjayS2Hzg=;
        b=Xbp5tRusGm3z1H1Gkwnc99QC/9YK/DPf8sLj0QpgVf+L5FwOjYvJMqroPniBjDHbEh
         D9Nev4yqvYr4/AC4F6baPZvDMa5WlOb7gKTmXb9W/cVaFHOyyxPpCQHLW+RIOavCvDV2
         4aSuUcN+KIz1VZmZUkZBw2AexAHGoaFbLQDig4wMM7sw8VfgZNSa6zMVl5QjGMRSOLmu
         PFmNPyAqT23aQUDLkf2HsJna9W6ZZfCr7B0IM7RTiljBKiQyUown/wslJhRk5zDc1qT3
         Uwv95pkaBiYkYqMYiYIuwnXv7xo3Ecw7wFNF9riQTXXnEcvRZcRNXbnPb1RFlXNO2G3/
         adfA==
X-Forwarded-Encrypted: i=1; AJvYcCUjyFOuUZzMyg/4VosrYE9jFNTRs6FaVNSWCdgKKVd4sAPGcmZfTeLQcwkPiPu3qAHJn2FBwKlYB4hIADE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtw+ROXB4wAXfois97fpe/RiX7waOZqO5AOTm7CJcSrgtKua+p
	HHnEvBOfSSkXFsMSNVqp02jp6Kld6+ihrqGM8LLg9KJptwxbJFT1TPIUpuqVKIc=
X-Gm-Gg: ASbGncuXpxpzfb7ECixkLdj+wVBqEDF+jUtgw/JooV0gO0d+KPEGj6HdTpedSioKWCt
	cFqv1N+W0wagmKLA4015iwOBwnsDGhfsPn/QakV9nZjrFbzm2D1P91BYhvItlA4wsNBNnnxPVua
	jOUK5+J/cai4heahhLxnRKjrEtC5R3CzZMU4WkZ+yp9KooaHdeLz6TfUKYiomQMldZ/wjeO56OK
	z+zO0f0bFrOCmB+jtsCzCSvzA7ws5dZIEcniKA8TfilBNaBICbOFPa8Ml0MAAEB+GlMaMuWmhQB
	l6mLtM8OR3R6qvMDZIfOowNCxR9e+HnP1fqqZDagVws5d8LUm71EI/AVf1230wVweT4fE3Q=
X-Google-Smtp-Source: AGHT+IHUghVJimpcvkNuryRp2QSiMsGJ5k9kaBv83gYo738k+5t/tc8gK88ES/UIqhPDyfIJKtVIKA==
X-Received: by 2002:a05:651c:508:b0:300:33b1:f0cc with SMTP id 38308e7fff4ca-307968fcfb9mr89069701fa.34.1738593082745;
        Mon, 03 Feb 2025 06:31:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f7cd2sm14901271fa.65.2025.02.03.06.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:31:21 -0800 (PST)
Date: Mon, 3 Feb 2025 16:31:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qrb2210-rb1: add Bluetooth
 support
Message-ID: <ajojztm3jr6iciwqhlbc7xnndlhrq6z7z6bvbbnb7sjlybqjqq@e6sdxcjolmd3>
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
 <20250202-rb1-bt-v3-6-6797a4467ced@linaro.org>
 <a6fe746c-c5e2-4c39-afa8-46b225256cb9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6fe746c-c5e2-4c39-afa8-46b225256cb9@oss.qualcomm.com>

On Mon, Feb 03, 2025 at 02:50:52PM +0100, Konrad Dybcio wrote:
> On 2.02.2025 1:16 PM, Dmitry Baryshkov wrote:
> > Add support for the onboard WCN3950 BT/WiFi chip. Corresponding firmware
> > has been merged to linux-firmware and should be available in the next
> > release.
> > 
> > Bluetooth: hci0: setting up wcn399x
> > Bluetooth: hci0: QCA Product ID   :0x0000000f
> > Bluetooth: hci0: QCA SOC Version  :0x40070120
> > Bluetooth: hci0: QCA ROM Version  :0x00000102
> > Bluetooth: hci0: QCA Patch Version:0x00000001
> > Bluetooth: hci0: QCA controller version 0x01200102
> > Bluetooth: hci0: QCA Downloading qca/cmbtfw12.tlv
> > Bluetooth: hci0: QCA Downloading qca/cmnv12.bin
> > Bluetooth: hci0: QCA setup on UART is completed
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> 
> [...]
> 
> > +&uart3 {
> > +	/delete-property/ interrupts;
> > +	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> > +			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
> > +	pinctrl-0 = <&uart3_default>;
> > +	pinctrl-1 = <&uart3_sleep>;
> > +	pinctrl-names = "default", "sleep";
> > +	status = "okay";
> 
> As you're going to resend, please add a newline before status

I thought I added it, but it seems it got lost during the plane landing.
Do you want me to resend it?

-- 
With best wishes
Dmitry
