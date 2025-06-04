Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B79418C03D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028547; cv=none; b=XlLMUkkYCPVCh79iIU1lwoqYsJf+i1SuuoEab30nyo7sJysGeoVl5/j55PHzvd7yYfaZKHF0SnjPkhbiAJWZMQlAY5LTMZSwwXKPB6Kjj0nS0Y9QCP5H+Wiwvtu9lxBAYRJUWc8nmOUHt3vXBXCNsjpq/5ykP58tEY/9gv1254c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028547; c=relaxed/simple;
	bh=wtbK/c960FCVkZdDZijesw0w08Lsk96bzznoaXRvUIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNYkDpW/h+2uOb+VuLerk0pLm4h2/uIStcbr3EXY8vdEIJK2EuJrca95xnJK6jgiPc33SddC68mo8dpoKmbT4apwhkgBiefXFDbY0FFJyiZg4a11gkAhfT63iMYWs7ojPsTrBXXgwqYVTpCx25WlN8EH7fz04F97dr5mWZHupQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYQVe0Cs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYQVe0Cs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55497Fr1013107
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 09:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPPFsiJy+20CJQxcYQxqsy1auSOoSM4WU5ICkQfU8Ik=; b=fYQVe0CsdVilowuY
	OtobuCzUw+CnRbC++SF4DuU9Va9Eu+OTxOXcS1buG/gbWuKVbWLUZNBDZpoRrG61
	VBbThzHVe4eMuCLToa1ss9SwSCZ6IPDpEsyT+oK5Y48SF6Uj8Y8NeAjj59IuzOyb
	1RDxtYkOnmC3Pz3blrt/1yJ94cQec+uH4OQT+kmwD4vXnKFzOULi8ySf5nFsh0L3
	IOuWN5w0wEoTFf9u2Bsk6QmHZZOnszQNkbjsthCIQkgF3aZpM7Zy14lukLAAQdhn
	mbThkmyZurTUl7r4Ce8lCbviLw7gnIFrn2DA0aCedQGL86UXsc2jOm7CS7d5sZUA
	Co5tIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wb5n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:15:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fac216872cso127342286d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028543; x=1749633343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPPFsiJy+20CJQxcYQxqsy1auSOoSM4WU5ICkQfU8Ik=;
        b=JzC/NNOzKOK33xU0H/sDVaYt7i9WEg6uHvn0QJzE7cBt7SylKkGv6ICJTqaao/zyny
         xIwH2kfUTUM2/DUWucqYXNNexxcnJ1YylqMjsRToL7WJACmzfPP10ZHMgLRA2j5Xxa4k
         nQnNgcgimPbsLcMDwHViJuFttkOk34kiQkc+Znet4qIHJsurlSW13a5mZ0IJP2Ak/kwF
         v0FgystYTZLe1kOOM1ovvD6kMChnG/a3phndJLSxQKVtYTeQc/MuzJd/jQaH46vk5Zpf
         ++YiDe82mcolxYEFEa6vPMS3cwuIECftrHTuAeduQWNBnB4x79J0S0VfpW3DCfM1LgS0
         Ke3w==
X-Forwarded-Encrypted: i=1; AJvYcCUXdAICS+V81kdLhvQP/T2aubwk+jevpuvH7fK0fHg3z6uNbTdOLYhE3PddCiGyAM+bR2MChxrqLL7INFU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9OfTnupoBfFMfpyLjdctHRO4TeYOCoRs8YjLukS4hKXpWLH3M
	vJOLFlk9qTIQmkp8ZrjQiD4h+XbAdqEgtUqnm6E77sxfSvQdcZKHyywVU5/l1+lVFVaGdmJzmRt
	zIe3LnoTK1EpD21SyDcpvuEejYNRD16Eg87AXKeR5qCGJaRu5dEz/Vw56P/ZrqnHwW3o=
X-Gm-Gg: ASbGncvxdYkaB4a4WLmjwf1448/U0EHBmmw2rvCn1Zn+hyWHklwvN9CROvEpkXDAG8Q
	6KEWbw/VFxllkjvFAWrTi/ZSscrF2otNrAF6kUOK0wWBZK4uzJvljn9DJTpzhFEy8xNvWA7jvOe
	YDIRgpSkpehu7TCLbi9BFzuLuLvFp3T/jFkTTapEnlJaE+pkIbzyWr3+5+10SuNI26XXlCBdHTi
	346R7pxoQ0Lf5VJaB+mca/mutGqV2sCTgNU43Lgug1DdwKlRKUUBx61RBgU0CNR8Z0ZNHq8x/GE
	xv/xNt9NtzepuVqy2KmyBA5m3k4YUh+hv3Vsa5TyCez+9cy9SBHzljIdBvOarvCbl26FwEF5hFM
	=
X-Received: by 2002:a05:6214:2a48:b0:6f4:b876:5fb8 with SMTP id 6a1803df08f44-6faf6fd1defmr26946326d6.1.1749028542961;
        Wed, 04 Jun 2025 02:15:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAy3lVFCTyFps38PYh4Cu1wvRMN2LoHwLW+6LfbUHP84/5730hlAgclrnqK6LGU+oqn6V+sA==
X-Received: by 2002:a05:6214:2a48:b0:6f4:b876:5fb8 with SMTP id 6a1803df08f44-6faf6fd1defmr26945926d6.1.1749028542461;
        Wed, 04 Jun 2025 02:15:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b55f88sm21033831fa.55.2025.06.04.02.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:15:41 -0700 (PDT)
Date: Wed, 4 Jun 2025 12:15:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org,
        manivannan.sadhasivam@linaro.org, robh@kernel.org, bhelgaas@google.com,
        krzk+dt@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
        kw@linux.com, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qianyu@quicinc.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v1 2/4] dt-bindings: PCI: qcom,pcie-sa8775p: document
 link_down reset
Message-ID: <34dnpaz3gl5jctcohh5kbf4arijotpdlxn2eze3oixrausyev3@4qso3qg5zn4t>
References: <20250529035416.4159963-1-quic_ziyuzhan@quicinc.com>
 <20250529035416.4159963-3-quic_ziyuzhan@quicinc.com>
 <drr7cngryldptgzbmac7l2xpryugbrnydke3alq5da2mfvmgm5@nwjsqkef7ypc>
 <e8d1b60c-97fe-4f50-8ead-66711f1aa3a7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8d1b60c-97fe-4f50-8ead-66711f1aa3a7@quicinc.com>
X-Proofpoint-ORIG-GUID: 8D5PdNhsoR7XZRyAjGob9Xm4DmIwQ2nx
X-Proofpoint-GUID: 8D5PdNhsoR7XZRyAjGob9Xm4DmIwQ2nx
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=68400ec0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=JfrnYn6hAAAA:8 a=COk6AnOGAAAA:8 a=nH4wTwwcQCLCZoaC2lgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2OSBTYWx0ZWRfX0de6PpiJ0JMb
 cM/79626h1bkKzToiaRIEWksdej7GPaPrWa9b+Ey3VizguLvwIn1h/cAoGbND1zccVltrXTHmQg
 veTILPc2zhgzlX5DdGYtYZwYcXV33o4eeJEBjWSGq9HAO1+m6c6ueT0yZIRs+UuplIoY0OOnBso
 UMS9VPbdCN6A/qRfYrrHdAx3xXvN7q3Bkcwh2jEY94L2PAmnsa9t5hZiywSlnqHP60PkPhRlAUD
 L/7B/RuUjrb1vO39qoGwmK9SpRaO1V4mu7XzQ6tjDrk6Z+M0RJdV8+Tus1+tBoYdL+HBnkoVmPx
 Fr/f69GI2ZiDdV7kcP8003yrrXSSF68zjUdu3wpJCXMOEkhrAy6GBSh6rWoDFjI5XmXXeNKC6MM
 oCJz9qxh+sBldb9XxpNuO3JVUKMogLFbjS5+d2yPkUbd2pYRuH78HcmvhSNUYqDDYE9mscsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040069

On Wed, Jun 04, 2025 at 03:58:33PM +0800, Ziyue Zhang wrote:
> 
> On 6/3/2025 9:11 PM, Dmitry Baryshkov wrote:
> > On Thu, May 29, 2025 at 11:54:14AM +0800, Ziyue Zhang wrote:
> > > Each PCIe controller on sa8775p supports 'link_down'reset on hardware,
> > > document it.
> > I don't think it's possible to "support" reset in hardware. Either it
> > exists and is routed, or it is not.
> 
> Hi Dmitry,
> 
> I will change the commit msg to
> 'Each PCIe controller on sa8775p includes 'link_down'reset on hardware,
> document it.'
> "Supports" implies that the PCIe controller has an active role in enabling
> or managing the reset functionality—it suggests that the controller is designed
> to accommodate or facilitate this feature.
>  "Includes" simply states that the reset functionality is present in the
> hardware—it exists, whether or not it's actively managed or configurable.
> So I think change it to includes will be better.
> 
> BRs
> Ziyue
> 
> > > Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> > > ---
> > >   .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml  | 13 +++++++++----
> > >   1 file changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> > > index e3fa232da2ca..805258cbcf2f 100644
> > > --- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> > > @@ -61,11 +61,14 @@ properties:
> > >         - const: global
> > >     resets:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > Shouldn't we just update this to maxItems:2 / minItems:2 and drop
> > minItems:1 from the next clause?
> 
> Hi Dmitry,
> 
> link_down reset is optional. In many other platforms, like sm8550
> and x1e80100, link_down reset is documented as a optional reset.
> PCIe will works fine without link_down reset. So I think setting it
> as optional is better.

You are describing a hardware. How can a reset be optional in the
_hardware_? It's either routed or not.

> 
> BRs
> Ziyue
> 
> > >     reset-names:
> > > +    minItems: 1
> > >       items:
> > > -      - const: pci
> > > +      - const: pci # PCIe core reset
> > > +      - const: link_down # PCIe link down reset
> > >   required:
> > >     - interconnects
> > > @@ -161,8 +164,10 @@ examples:
> > >               power-domains = <&gcc PCIE_0_GDSC>;
> > > -            resets = <&gcc GCC_PCIE_0_BCR>;
> > > -            reset-names = "pci";
> > > +            resets = <&gcc GCC_PCIE_0_BCR>,
> > > +                     <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
> > > +            reset-names = "pci",
> > > +                          "link_down";
> > >               perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > >               wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > -- 
> > > linux-phy mailing list
> > > linux-phy@lists.infradead.org
> > > https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
