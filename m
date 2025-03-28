Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FE323CB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175768; cv=none; b=o04Pkn5rWLZmWDaebBsxTADPFvh8BZEaKI9F4aAE9Sf4JFWRKHP2yqrgX5wkBsZ1jksBVXeVNnpCKCVquGyKMFYls49XTX8cZsM0lBhhrLfcnW8Ah++yXhjF1jwGNKGWFdVlMpcsJGLU7B3mintwaGwKBE3g9HAEP5lB4Ni9gEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175768; c=relaxed/simple;
	bh=Esah5xMf1Y4fqhvyGpEu7DBB9aaBn5MzDIfByQYZENo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAZHVluQNaMZwimAeoiPfEOe4aIFLx7xkWoqglospdJh3gYoNmw1widsw1y/Sv6SNCT6aJHCSIIn3ic6cO6iLlh5odZaxMz+lcQp2uJJE4MOKQqQ5KJwXsQkcwbLuROpFy8qjHnotR/U7vJLNhRu++hViNIUnpWJMIRNmMy5Ew8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OPTj0dgd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OPTj0dgd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2255003f4c6so46996275ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743175765; x=1743780565; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IYCnbcPMvIBhsv94ihZF8U1oztg1CJ+LRPesf66C380=;
        b=OPTj0dgdaaAAlv3plAnQEDDEDfq4lmh7YZGgSGdeR4e36Z+T7fMO86CVDOCbrVaGVt
         MTwEiaMjz4k8n1aUt/BeN29fkT2mvdfGnpO2Qo5c3brpkv4tcr1QDKuWJRDThOuohaNw
         TRGecp+KeKyPEYOvQJgqcTpfnaelWAxCBdDrs8YhhXjaHGwqc+zxr1Rx+/DeJt8tW6X7
         skQiB/4QlnsG6xFl8IRCXCFD1KW4Ib2dAwdO3jbhbrIqdPHav77GR2DB+UnqkfmInuwD
         mYriX4km/XjnbhOm8872HxO9+DM2h0XW3WqwurKCmlf8Uo1/CMzFlSOig1BnBSfQyAkC
         lnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743175765; x=1743780565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYCnbcPMvIBhsv94ihZF8U1oztg1CJ+LRPesf66C380=;
        b=e28MICOuI2FlWMEkctjqqMhgeH/2dMDcAFGnROCpQ5YyKymcymJKgMGzlWNBZThFHC
         fICVtkXjsF+PrAmoPkCQD95+Kz/0b+WCyImWwVmZcq0xIlpWDJpPQvHXbr958iaAV15q
         kf54mC744CQ6nYfUiRrw8p/3GK0bm0v9AEuqNyV+6pu2xZYwhSRRzcJK93ZzF5tADs8o
         gLkZznks6D/m79pKuUD+CHIArsRr66dEEfJKsJrlZnMsxKoKT2Wx7He9jRs4ytzT0Wcm
         n+ovVYyjLZpnk/vBitl/1lw+MeGAR57PwHAebKApdZvbLSlriDMYA1aoEBoaYnhfA+t0
         Wxpg==
X-Forwarded-Encrypted: i=1; AJvYcCWksOKI4IyEY6EigKdSQr3jpMdmkqBzQoSvt8T6JlLaoguLanR0IlKMAjyo4uBEJqvO8wyyNWXs2NJp9iY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfMfd4/JcQ69H2YD6TRzFl75iNZgnpALqOOYMAf2s8XDsknFQy
	TlXI4+xXNJLk0ZXE8jNpLvsmM1ZX63DbJirJbOA4bneqP2csC6rCmGtC876bbA==
X-Gm-Gg: ASbGnct2oSb8rxKxT8ywGW7fcanuUW9kZg9XVdMVCYx0nRIEKxtIfj01r1B1Fg+iSq6
	LINkTRNJrq5IvUqdQ9W6+8BMYd/2T8M0pt276xxCzdXjoxX3vIZyVfuLYRs9vwrn1ONHPIT8hv4
	pchjBT+piF1en6+jaU9JnMz3d8ldMuXP9Bw5jIlnWn+H0WWthlsX9oT98bPa18L2TEc8Afu4HPr
	jMn9fdb/z4AQhfZMviHC0ZkouooOv6TYUkFTfKjrhRRLOBBIvES04d6MqhGhCHaMhop95X2obBH
	GpFMe75iV7B8jvW/bfoxUZL9Iq7KFbs/ofbx7/TN6lOTnY8AcSdk3FU=
X-Google-Smtp-Source: AGHT+IEAJ52gRuM9+yEtLSUreGFqyPZZrBJBfaOK3GPxOZtzCWytAsWECnhsP514Y15I0lQb6ZqHqw==
X-Received: by 2002:a17:902:e550:b0:224:b60:3cd3 with SMTP id d9443c01a7336-22804869b5dmr135224235ad.19.1743175765098;
        Fri, 28 Mar 2025 08:29:25 -0700 (PDT)
Received: from thinkpad ([120.60.68.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0bafsm19535225ad.90.2025.03.28.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 08:29:24 -0700 (PDT)
Date: Fri, 28 Mar 2025 20:59:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com, quic_vpernami@quicinc.com, 
	mmareddy@quicinc.com
Subject: Re: [PATCH v5 1/7] arm64: dts: qcom: sc7280: Increase config size to
 256MB for ECAM feature
Message-ID: <f44tte5b3hlm7ir6lyp65fnl6ylq4og5wrvllwr47xdvnhqscg@t3tsy3c6jypw>
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
 <20250309-ecam_v4-v5-1-8eff4b59790d@oss.qualcomm.com>
 <3332fe69-dddb-439d-884f-2b97845c14e1@oss.qualcomm.com>
 <0cc247a4-d857-4fb1-8f87-0d52d641eced@oss.qualcomm.com>
 <h6bnt7ti3yy3welkzqwia7kieunspfqtxf6k46t4j4d5tathls@hra2gbpzazep>
 <090572fa-7c4c-798d-26e9-39570215b2b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <090572fa-7c4c-798d-26e9-39570215b2b7@oss.qualcomm.com>

On Fri, Mar 28, 2025 at 06:24:23PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/28/2025 5:14 PM, Manivannan Sadhasivam wrote:
> > On Wed, Mar 26, 2025 at 06:56:02PM +0100, Konrad Dybcio wrote:
> > > On 3/11/25 12:13 PM, Konrad Dybcio wrote:
> > > > On 3/9/25 6:45 AM, Krishna Chaitanya Chundru wrote:
> > > > > PCIe ECAM(Enhanced Configuration Access Mechanism) feature requires
> > > > > maximum of 256MB configuration space.
> > > > > 
> > > > > To enable this feature increase configuration space size to 256MB. If
> > > > > the config space is increased, the BAR space needs to be truncated as
> > > > > it resides in the same location. To avoid the bar space truncation move
> > > > > config space, DBI, ELBI, iATU to upper PCIe region and use lower PCIe
> > > > > iregion entirely for BAR region.
> > > > > 
> > > > > This depends on the commit: '10ba0854c5e6 ("PCI: qcom: Disable mirroring
> > > > > of DBI and iATU register space in BAR region")'
> > > > > 
> > > > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > ---
> > > > 
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > 
> > > I took a second look - why are dbi and config regions overlapping?
> > > 
> > 
> > Not just DBI, ELBI too.
> > 
> > > I would imagine the latter to be at a certain offset
> > > 
> > 
> > The problem is that for ECAM, we need config space region to be big enough to
> > cover all 256 buses. For that reason Krishna overlapped the config region and
> > DBI/ELBI. Initially I also questioned this and somehow convinced that there is
> > no other way (no other memory). But looking at the internal documentation now,
> > I realized that atleast 512MiB of PCIe space is available for each controller
> > instance.
> > 
> DBI is the config space of the root port0,  ecam expects all the config
> space is continuous i.e 256MB and this 256MB config space is ioremaped
> in ecam driver[1]. This 256 MB should contain the dbi memory too and
> elbi always with dbi region we can't move it other locations. We are
> keeping overlap region because once ecam driver io remaped all 256MB
> including dbi and elbi memory dwc memory can't ioremap the dbi and elbi
> region again. That is the reason for having this overlap region.
> > So I just quickly tried this series on SA8775p and by moving the config space
> > after the iATU region, I was able to have ECAM working without overlapping
> > addresses in DT. Here is the change I did:
> > 
> I am sure ecam is not enabled with this below change

ECAM is indeed enabled. But...

> because ecam block
> have the address alignment requirement that address should be aligned to
> the base address of the range is aligned to a 2(n+20)-byte memory address
> boundary from pcie spec 6.0.1, sec 7.2.2 (PCI Express Enhanced
> Configuration Access Mechanism (ECAM)), with out that address alignment
> ecam will not work since ecam driver gets bus number function number
> by shifting the address internally.
> 

You are right, but the ECAM driver doesn't have a check for the config space
address alignment, so it didn't catch it (I will add the check now). But with
the unaligned address, endpoint is not getting enumerated (though bridge is
enumerated as it lives under root port, so I got misleaded).

> If this is not acceptable we have mimic the ecam driver in dwc driver
> which is also not recommended.
> 

You can still move the config space in the upper region to satisfy alignment.
Like,

+                     <0x4 0x00000000 0x0 0xf20>,
+                     <0x4 0x00000f20 0x0 0xa8>,
+                     <0x4 0x10000000 0x0 0x4000>,
+                     <0x4 0x20000000 0x0 0x10000000>,

With this change, ECAM works fine and I can enumerate endpoint on the host. I
believe this requires more PCIe space on the SoC. Not sure if SC7280 could
support it or not. But IMO, we should enable ECAM for SoCs that satisfy this
requirement. This will avoid overlapping and also simplify the code (w.r.t
DBI/ELBI).

- Mani

-- 
மணிவண்ணன் சதாசிவம்
