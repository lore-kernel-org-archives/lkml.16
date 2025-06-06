Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4241027D77D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205077; cv=none; b=aGw69wKsNmlq5AxlfRhxx/FajLDH/53KgDT/gPsnuX8KZbh/aOgoA6Z76vCGvaRhYNoqOEQt1Ht9qvfTe3tDxLIDcU/elYAoagy+Ix9+XUqFjCIn1YfUCdFhs+czd6L/kCe7cXNVGlo3iX+/BgynlI/3qppT/4eM2GooTYgitiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205077; c=relaxed/simple;
	bh=SVMCfylbwM5vuiB3Wx+PhHek76Iz+RwCcFIRJVgYp/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdXeSQs80JGqZ4/4QXM/U8eoqg+2SE9Glhyj0IxoGr68ji0ARI5WP2UwWvdUTugaYS/oFKIzZ7HxaS0A3ivzTSFJcwqHH6yNPcQr8xA0wc4qzKpNXbb+kBZ/FjIOAh7+TywzXvjMAylxaNmLKdCe3pdA2T9Ik653V1Oe/jts+S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/8NzpW0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/8NzpW0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5561CCwp013895
	for <linux-kernel@vger.kernel.org>; Fri, 6 Jun 2025 10:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MUm770nsjTk7RKaqGJXS/UXM
	bcC3CLIfXaIBHht8qoo=; b=W/8NzpW0F9AfIenOSQKcaHAtJd6pwGHnLQ78YdyZ
	VRa0/MQkCsHkOd05mCswdst64V2qpJjZbOf0Hqh3w1gjcq4siRG8fCEIn3blroMS
	AkU6oTlRt+c8EZI67XOllofobWQ7GAizeV2l0rhhTYLVFLBgoR9AeS+wYaGtjIZs
	GKv7HFBC3/J0UBIqyRIUkIwcTf9VnkN80hEc31kIUThXYYeJaXqWN7oUSgKMSGQG
	V0VvQfcTJUMkssvLnMV5MO337dGkbpNd8wFQom6S+aZeqHf/JYdAaNeTDY8zq3mM
	rofkJBm+IznBjcgn34id9RcF4n79GuZ8Thl6QmmicpyZaA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv3659-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 10:17:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235f6b829cfso12431985ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 03:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205073; x=1749809873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUm770nsjTk7RKaqGJXS/UXMbcC3CLIfXaIBHht8qoo=;
        b=pJybFLIHgEUPOZGROdSLsvviCO7YmyA33ionnOfT7PFs423qJZcrMUzjJ2OztEZ6Wv
         nOgP/F0J4tA1uFmdMkiTwbN0fxGqKV+dGdHHZMepBJhUGqdQdYP8H/W/SMh8sROC87J7
         mbw3fn72s0q/LC8kT0lGhQjB9uIwPTn1UVxz2zaUPJKTrkQDU+6uobSPdM53kuxcNV+E
         vZjUrtqFOnHM0TpjxZtCFimHOK4EBc0MapPTo2xYJfOkXTtLWT56euAOwwG+xw4uCxbp
         bYlbtOVCstnRzpyewW4WbAMafRsxCCTqgjvo5E5lC47Od4n9t9s+IWTl3Z6RKD919e19
         gw5g==
X-Forwarded-Encrypted: i=1; AJvYcCXSHk707NLkdOcmiAkgphDIrVAiixKZ3tuR6RS1l6CEwltx8HkIjLcCfsehUTQ/0uzmG+yqb4WFczZqtr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5CWrF+4q1XQWjP18V3kjk7jFDa4Ilb0HQwxbC70esOohHtjaV
	m3qVoMeeGkRC3MbAKKgIMOm2ev6HPujgAKvED2j6NzaqY1VVRmWZ1qCNFOwfmeaU9ByvIwLahLq
	zLwA44NxqLU/4XQ5dMItOs9YMO0qmcb9hiIChSS7HJ+GKjJp63YW6Os847Wvb/R/tevY=
X-Gm-Gg: ASbGncsfBBfDDUUKXXM/b0bGSJ0YVshQ9y6+B+n4MV0eMwkZDB7Hru8zBl0wnjzImDO
	+XneVWDvi0iSdm6cGNLstbybpCtuN/im4jT/lh2B7ngGZAsNO1dnpVkM4v3yU61M5pYwZ5fMkU/
	N77/pg5szT8doyF+5xqXUL9tBNHmLap7AzOqZlI54BQqmrIbPRUnVTx4J6cliNotwknFKiXtWI4
	e7tv36rUfr+myZ+bRARNPYUdTQ77cC2o6atkzqzmS90pAumF2QvgnSXLn74UDzJv3xyzAvlmra/
	PnnMNm6AmosJ8zDSEiHB0AFMsIl7rtttensaFQFwIV2DAf+DImgpqVspXAc=
X-Received: by 2002:a17:902:e5cf:b0:234:d7b2:2ab4 with SMTP id d9443c01a7336-23601d038c2mr38586405ad.17.1749205073605;
        Fri, 06 Jun 2025 03:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWEq5utuN+xciTxdEM9oY6Q/JAcry9JQaMjmy2DyusLiUkQ5pFcrFEA1HGQcbYN9+4KF154A==
X-Received: by 2002:a17:902:e5cf:b0:234:d7b2:2ab4 with SMTP id d9443c01a7336-23601d038c2mr38586135ad.17.1749205073233;
        Fri, 06 Jun 2025 03:17:53 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077e9dsm9466565ad.1.2025.06.06.03.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:17:52 -0700 (PDT)
Date: Fri, 6 Jun 2025 03:17:50 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com, Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Message-ID: <aELATuLue/Vs8lHz@hu-qianyu-lv.qualcomm.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-6-quic_wenbyao@quicinc.com>
 <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6842c052 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Kn45tV52aVggcf7Ks3EA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=xwnAI6pc5liRhupp6brZ:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: g9QqLKCZ4K2c2zJZ23oIVFqpMT-qs_TT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5MyBTYWx0ZWRfX5ccbmkXolF7j
 j/DrpaliSTJJbNxuaO5Y7ZgcnkwJLcfg1VJ9I0PJmXaGHwmCsx3zJqtF0hlK38vu12ws3jzevzQ
 pM+tcSeDQRuZTAHjbdI7qSoSyYfeubOy3OakQtxXmNnyk0EWBnpEd2ZqkyZvChRTCa96aKDDH4M
 8rjDtI8/FDSPeiCEkpq0m3Pdo0MKxXjxsStecJE/ZUTILHnBTUuBmcWBU7sCbqbBhUf+IeL8UOT
 57x/MOlDcd9zlM1YEA1RKSgEdbaMZoYE0DJt3VpIhKrrJHZ9VBOVBPIafAG+pjlA3fYSIQb+xV5
 JdtZvYWMYcbyGvFOuTeN3Mcv+UmN8kPYEfmRtotx/Sfms5rWJzzfEg/H4c+ErMTMv8dQSeh9gv3
 1A5fVcQfDQit2u9s4sQfy+lF6ur6QXrwA2aDP6brknK7U5b6sUJrmpVJYZHHMkKczmZXsCWI
X-Proofpoint-GUID: g9QqLKCZ4K2c2zJZ23oIVFqpMT-qs_TT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060093

On Wed, Jun 04, 2025 at 05:10:19PM +0200, Johan Hovold wrote:
> On Wed, Jun 04, 2025 at 04:02:37PM +0800, Wenbin Yao wrote:
> > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> > All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
> > clocks provided by the TCSR device.
> 
> As I just mentioned in the thread where this is still being discussed:
> 
> 	https://lore.kernel.org/all/aEBfV2M-ZqDF7aRz@hovoldconsulting.com
> 
> you need to provide a lot more detail on why you think modelling these
> supplies as PHY supplies (which they are not) is the right thing to do.
> 

TCSR_PCIE_xx_CLKREF_EN is not always in TCSR, they're custom
bits to enable pieces of the distribution network. We always classify them
as "TCSR" even though they're not always in that module.

So even if we put the QREF supplies in tscr device tree node, it still
doesn't describe the hardware correctly as the hardware itself does't have
a unified structure.

Since the TCSR_PCIE_xx_CLKREF_EN is only required by PCIe, why can't we
model these supplies consumed by TCSR_PCIE_xx_CLKREF_EN as PHY supplies,
treating PCIe PHY and TCSR_PCIE_xx_CLKREF_EN as a whole.

> Also please answer the question I've asked three times now on how the
> QREF supplies map to PHY supplies on X1E as no one will be able to use
> this binding unless this is documented somewhere (and similar for other
> SoCs).
>

PCIe3,
VDD_A_QREFS_0P875_0,
VDD_A_QREFS_0P875_B,
VDD_A_QREFS_1P2_B,

PCIe4,
VDD_A_QREFS_0P875_B,
VDD_A_QREFS_1P2_B

PCIe5,
VDD_A_QREFS_0P875_2,
VDD_A_QREFS_0P875_B,
VDD_A_QREFS_1P2_B,

PCIe6
VDD_A_QREFS_0P875_A,
VDD_A_QREFS_1P2_A

> The fact that you so far have not been able to provide an answer
> seems to suggest that these supplies need to be managed by the TCSR
> clock driver which can handle the mapping.
> 
> > Hence, restore the vdda-qref request for the 6th and the 3th PCIe instance
> > by reverting commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> > qref supplies") and commit eb7a22f830f6("phy: qcom: qmp-pcie: drop bogus
> > x1e80100 qref supply"). For the 4th PCIe instance (Gen3 x2), add a new
> > driver data entry, namely x1e80100_qmp_gen3x2_pciephy_cfg, which is a copy
> > of sm8550_qmp_gen3x2_pciephy_cfg but uses sm8550_qmp_phy_vreg_l instead.
> > 
> > Fixes: eb7a22f830f6 ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> > Fixes: 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> > Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
> > Cc: Johan Hovold <johan+linaro@kernel.org>
> > Cc: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> 
> NAK, for now, and please don't post any new revisions of this patch
> until this has been resolved.

OK, I will remove this patch from the series if other patches require
updates and submit it separately when it is required.

- Qiang Yu

> 
> Johan
