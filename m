Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFF6219A67
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320023; cv=none; b=mtqKsy0FemDu4ZonbNyMRgEW3y5eeIKQYZOTRCdpbm9wTW9q12dN/d3X6L7OgBU8AMzkpzVwKKax2EcNwUt8E5MIhwMUegrQABJNU2mWINY/RY4VkmnkjTKTGiIe4QnHnW26S7gczEbvG026nhDsfdTpXquwBsCDhVbyP8Ka2Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320023; c=relaxed/simple;
	bh=wMaMYUd6M4iPUB+6W02x9RPOUf1vRDMFQbyKwn8OqgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRiRLJaosyRDIChU5L/Tz/CtqRpfLPeHOL9fF7sEkR1qsTbHTixLQ+/qx2MkXXpMp9iV1B5lrTfpp3Bo1efXsz3V+PzuvUGRAo6X/IEDhbfhL6RK3QNUGcl+lG+LTEx4iiyNxN1U/4s8TwckpQZbWX+hiTBMbKI0H42IHpdqEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niyOCXat; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niyOCXat"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J2FVXt008372
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBolN5oacxC0P41K6szANjJ24uE94hXebudQ19uN7Vc=; b=niyOCXatXE3NVwd+
	Rkwixu4yq9sq8U/+eSIBixS3OwlbFzGe4GgFFfmFHCs6i/wlpOBmUZ6RX5IAAuTm
	DakOpqraIU4clXJSyAl3RygvI8raZpmB0kCqxjAPvj9RHPZbp2b6yuxikIQ5EQY5
	dBUt9PRwY7lSQGzo2lHQa+2K2xTTpIW+gj9vlZYiYdHmcpWDUEgxIKaU63FEsLTK
	pkOBtkAFLW08p5YWRm3pABxJ56o+hF+poh9cCLA0Mu4Dk+F27WP7ZcvmodhxwTM5
	+rrw+7t4eDDkeZLQj9YPVCPsKzlObIHll42SgrcTSZxFk+/Yf7Rq1DV/YEL0xfYv
	PvZbbw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c9krrwpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:00:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-740270e168aso499540b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750320020; x=1750924820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBolN5oacxC0P41K6szANjJ24uE94hXebudQ19uN7Vc=;
        b=KBuxr3iX3Q04rqqCpbtTUBRobIFp3si2ShHacWCsdlHPPkExpUMmES4LFshY6IkECS
         Qk8QPcDYbNrhKLYvmrpmZRJd/lzA4q4HVfcjTLWIVOfC3/iiWOQqgD4Mrtk9ug7m+6qa
         xB26xduXBdpvMyCjh+SCXiCGGibGnCk+0qYBJyfqQdH1b4Ga1ZRp45frLKPJhphAC8aL
         QiD4lGS0qX076BuFyeM1SdmbThPVdakWc98VGO5U5g4MKBkagyHfW+MZMahqtiXbosHK
         wyDRqnhSyK/mQdZyMtd3nv37OiHd3/Mo26IS05ca2Cc2Ietwyx+s1PXJ12hgV0dA3zFV
         1FPg==
X-Forwarded-Encrypted: i=1; AJvYcCVltyekYPbhn9hn27fV827r06hM6vBwcc/yxjRdMKI940jQ+z9Vb62hrJAIrgzntRO6CAY635Sf+W6jpY0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4njjo0g2LjcasfD3bcmwoPvEsS5xxXJeK1419fJ2kythAHa5o
	+UTMlmeXpAaw0WGnRbdilt3vMxm8LsjmrKc8ujxTw99ZdNyFyjbWEY1uug1rtyL8EIDC1BBHZ+n
	58OwQ5Ft30nqVF/0alYNcmnNOXsbNX2eQZ+kn23W0Jzh6hyfEOTBfm7w11TkBesk2D0Y=
X-Gm-Gg: ASbGnctK1ZizZjpSdUgp+UlG0YJwXugcPm9qLFs/z8zl0LmBR5/6XghGlMpil8I0Cx8
	QPflgoRpTWZIOHhB7sdGV63jbeFOn/YvfDBfrJNFDcN0jMxdjylhCCWJ1HUboAxQkFoww7vQsfx
	KlatUJkziYYPey+m0fiyakq/ee0rBVxbjZk3bbMm9PUK8PYhwG0yXCCx1WilrebPuCPTKNNlqsx
	RBOqehzJKGGeEB3Jun/Owd18i/aC2zDBVkWl9rDX1NEHVvpIh60U0YZXcpiFPW2BFjTPGD4QUkF
	YTlkQmlEgeNPbXE5JZRVxQ4layCeWKaiaZR9QPXg1Ie6OerbuLPpfyXx2Jx4ar4kB4P74w==
X-Received: by 2002:a05:6a00:228b:b0:748:fb7c:bbe0 with SMTP id d2e1a72fcca58-748fb7cc2d2mr2896536b3a.24.1750320020200;
        Thu, 19 Jun 2025 01:00:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeXph0uurb6f9i+olydyrvX72jabH9v+6bXULYDipT8b9iY6AU8w1map6IEpxVIXRkai4iyQ==
X-Received: by 2002:a05:6a00:228b:b0:748:fb7c:bbe0 with SMTP id d2e1a72fcca58-748fb7cc2d2mr2896469b3a.24.1750320019594;
        Thu, 19 Jun 2025 01:00:19 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ce7adsm13061762b3a.149.2025.06.19.01.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:00:19 -0700 (PDT)
Date: Thu, 19 Jun 2025 01:00:16 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, krishna.chundru@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] dt-bindings: PCI: qcom,pcie-sc8180x: Drop unrelated
 clocks from PCIe hosts
Message-ID: <aFPDkFUEE4BzdJh/@hu-qianyu-lv.qualcomm.com>
References: <20250521-topic-8150_pcie_drop_clocks-v1-0-3d42e84f6453@oss.qualcomm.com>
 <20250521-topic-8150_pcie_drop_clocks-v1-1-3d42e84f6453@oss.qualcomm.com>
 <qri7dxwqoltam2yanxicgejjq3xprd6cunvpgukasmtt7c5lmh@ikdl24royen6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qri7dxwqoltam2yanxicgejjq3xprd6cunvpgukasmtt7c5lmh@ikdl24royen6>
X-Proofpoint-GUID: M5dYz6w85cEf2bgh14mae5N023MQMUkU
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=6853c395 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=3eHYEclfckd1VWwzELkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA2NyBTYWx0ZWRfX++Uku/pI2YA2
 kbot8j7+pNn3dmyj0/ZaQ1GydHgkhvsYzS+yRDz3MuBvrdy8O2abv0wpCvEmEE63e8cmsCr3F4S
 qKrZrLuYBemFkHjEPLdC7TQUp2C/igqJbkQwl+yntXvh5GvZDPE7bQyUo893GPVeorPT4diUyjq
 pJ9SrdxtgP5Uh9SF94wwKO7x9sZXlzW/2+QS3rZzX2nsxgR1dKGWdgGXMMTDdXCJyKopff0ghp6
 Y0M5dXyODgnMWl8MjpdHRx9rEsqWRGPm3Nsgq1/+UMO3CBEhjGcpf6sJqs19jCSaTWHDlfvSwqr
 kpN49vF+MxxwYX7NIiqhBM2s2vs8HzWor4hDw7r4YKWr/uU2rh9QdZxcq0EA2ZOvCWBhyE/Ajs7
 NzetQIJ9cuNm+qqjr7C9sJBjFgCTm579Ksqo82Mkab+5MyIXSDv657lmCkWE7MuKYz1X626w
X-Proofpoint-ORIG-GUID: M5dYz6w85cEf2bgh14mae5N023MQMUkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190067

On Fri, Jun 13, 2025 at 02:43:38PM +0530, Manivannan Sadhasivam wrote:
> + Krishna
> 
> On Wed, May 21, 2025 at 03:38:10PM +0200, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > The TBU clock belongs to the Translation Buffer Unit, part of the SMMU.
> > The ref clock is already being driven upstream through some of the
> > branches.
> > 
> 
> Can you please cross check with the hardware programming guide (I don't have
> access to atm) that the 'ref' clock is no longer voted by the driver?
>

CLKREF is required for PHY. Since it has been voted in PCIe PHY driver,
omitting it here is reasonable.

- Qiang Yu

> - Mani
> 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/pci/qcom,pcie-sc8180x.yaml         | 14 ++++----------
> >  1 file changed, 4 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.yaml
> > index 331fc25d7a17d657d4db3863f0c538d0e44dc840..34a4d7b2c8459aeb615736f54c1971014adb205f 100644
> > --- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.yaml
> > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.yaml
> > @@ -33,8 +33,8 @@ properties:
> >        - const: mhi # MHI registers
> >  
> >    clocks:
> > -    minItems: 8
> > -    maxItems: 8
> > +    minItems: 6
> > +    maxItems: 6
> >  
> >    clock-names:
> >      items:
> > @@ -44,8 +44,6 @@ properties:
> >        - const: bus_master # Master AXI clock
> >        - const: bus_slave # Slave AXI clock
> >        - const: slave_q2a # Slave Q2A clock
> > -      - const: ref # REFERENCE clock
> > -      - const: tbu # PCIe TBU clock
> >  
> >    interrupts:
> >      minItems: 8
> > @@ -117,17 +115,13 @@ examples:
> >                       <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> >                       <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> >                       <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> > -                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> > -                     <&gcc GCC_PCIE_0_CLKREF_CLK>,
> > -                     <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>;
> > +                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
> >              clock-names = "pipe",
> >                            "aux",
> >                            "cfg",
> >                            "bus_master",
> >                            "bus_slave",
> > -                          "slave_q2a",
> > -                          "ref",
> > -                          "tbu";
> > +                          "slave_q2a";
> >  
> >              dma-coherent;
> >  
> > 
> > -- 
> > 2.49.0
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 
