Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD69256C8D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206691; cv=none; b=bHO70aVmt8RnUcfroazvyywyEovLCehpGtKZfg800s4+vrhgxoyrfy+v6dva4eO+7PNbS6VYcIMdsdZ+UEOOiSWJCUt1WVp0nS0olGajv6e3f+ZAglpN10ETe1F5r0C689i2mbQlF+AiRJsdLEpjgqtTmyYS/ntnBJnKbJLWP28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206691; c=relaxed/simple;
	bh=xDIm/RSePeqjNNKN693t7yZjDUS4PKwecZGP9knv6V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPPDA+OdjP+cR6OzIMsj9WwwVYv4Zb76TYS/QsiSA9uNio0Amfx4KJqwn4ZEwqy7eR3z/N1ouKi8cb1lxCoa5e5igslypReiDxQRdWx2pNqM6wY9ru1wmUaBWeE0iV7FD0una6LrAOR6CP2/Bgf3lH3MmQhSFF8lxOdfPA0NJNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eabQkDZL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eabQkDZL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f6f18b474so30327425ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739206689; x=1739811489; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HXK570SN0hPAje/qFbZ+ZB29I/53fXVG5T36GPnTKYo=;
        b=eabQkDZLJfyvGb+qqDzjR5XknBo09Kxii5C2nJnJi0Zmdsux5A+9ivZMlMZnFkhX6f
         xnFBxSUKf5swEewHz3NOQJUSWDZsE3w6XpEuUIfnL4eseVs3TxFVqG+/Jnx3b3BK1lhC
         CunOZfQZUzrUQ1Wpcuyd80j7KNsjE5WARHP5o6ams3uJfDxclfqcfD/nB4XMHNsllQWo
         lQ7UIslpNRNyAxEj+Ju3XlDkBIF+d2JvIwoDqm7ddDswQywe73/rbDO29Wn8AUjoDH/q
         DLYfmn+nRM5Jw15+FIvCuj4mn+sdO50futhCUJOCkWJk8GRLnOMLoguoS9T2dQAobCzN
         dmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739206689; x=1739811489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HXK570SN0hPAje/qFbZ+ZB29I/53fXVG5T36GPnTKYo=;
        b=d9zUTqXEBqj+5k5AiONOFcg1cPgLHfJ0E2q5wnpI6CM8KXp5WShpba1DMg/vTsn5dO
         azMMoCHKWrWfkWWVtta06Fc6gTABMCC48fF6Y9amrulPGnY5Dt2/tjMq/RE1vp/bZTbv
         rjkksMDjFv5vrObYWPSaYXVC2oC5sLjddNd2mWxxeoWbOHH/C/fEqR3eaNImVd2y6TVG
         yZuw4dQxhyWSOjUD93pusK+X5wSvxfHlIP8Oi3DkIS26e61tjKEc1d3KIOVOLzTkjXov
         1YTrwMiWbad4ixpnt3gJFc7X1W/RPLomJzTNHktdotUuk2JH13/DlOEp7QNoYkB0wAQS
         B9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXIxy8bWAcJQqs0idBTR9SD/F2KkULHT1szN62HXfqpSlWavOidoz55BZwBAQo41LrpUGkmiSN6ylBX6sE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcpSdILZWr5m12XHkYmQKuWErhRpI3V5pT+nY/wuhqfhKtIwNk
	pQXH9BAbxvmtPRDbFC9Y55b3e9wpjhiIoiwwzKNz/SN43VVxT/19s8t6uWzxHw==
X-Gm-Gg: ASbGncv+sLsEw0opiBrI5FER1VtBEZjn5CKSQ3CvMLZgH2izfHd/SPHWRGd5kKPafJQ
	bDxbCqRd1GRlphrXfo7aQK7P9f73ohHY1lMr4QwBtLIh3M9rdWgYW8LgDR+COSe9I036GK2B6Cn
	lq4iqdQqTbliiv3EqpZXVxMCMHRMqU523U+9HxyRCXexKrR6MXxPYm2PMmfEXvwdXUw8vobI36g
	O9NpDkhmG1GN23A6zaTR/OOD6uRwf+zk7M/FaZYz1Es8hamADIUhJYTbspk8UVXVEzJtVI0Y6Oq
	EPw4Pi/LEw1GnUnNIeyqsdY3pfcV
X-Google-Smtp-Source: AGHT+IFXG/X92qZwFcXPEHDQKQJuXIqlaQptvHF4J7uFXPKvpdVbnwkYnUW89gE+sgY0hfXiSW0EGg==
X-Received: by 2002:a17:902:fc85:b0:21e:fe8e:b571 with SMTP id d9443c01a7336-21f4e760a43mr223092645ad.36.1739206688645;
        Mon, 10 Feb 2025 08:58:08 -0800 (PST)
Received: from thinkpad ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d55esm80562995ad.152.2025.02.10.08.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:58:08 -0800 (PST)
Date: Mon, 10 Feb 2025 22:28:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add 'global' IRQ for PCIe
 controllers
Message-ID: <20250210165802.tbvzx4qjygzdsk2f@thinkpad>
References: <20250209153940.3489-1-manivannan.sadhasivam@linaro.org>
 <173920411963.477096.6458317590653327676.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173920411963.477096.6458317590653327676.robh@kernel.org>

On Mon, Feb 10, 2025 at 10:22:43AM -0600, Rob Herring (Arm) wrote:
> 
> On Sun, 09 Feb 2025 21:09:40 +0530, Manivannan Sadhasivam wrote:
> > 'global' IRQ is used to receive vendor specific events from the PCIe
> > controller.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 

Ah. I didn't run dtbs check. Please ignore this one, I'll post along with
bindings change.

- Mani

> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250209153940.3489-1-manivannan.sadhasivam@linaro.org:
> 
> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> 
> 
> 
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
