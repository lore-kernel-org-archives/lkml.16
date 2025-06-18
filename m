Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C88278152
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230446; cv=none; b=SDA+8kgvtJddhlGPAU09kPjOOzokmnjxhczbOd/mi9XHUpbH0D/nLVSqe/LwezfwlsNivH7fI0kxyNvFENyWv3K0/Xvl7oJ5sPY44s0OKzsj9rAqMMD1rnCTZ4AeRR9pnXMt1nRB/j2BPxmENo/9bj7aPJKaXFNCpbgUp2DLwPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230446; c=relaxed/simple;
	bh=rlU2zGwFM9YmTQYQGyrp7lMe42gtVScoKfb5K74Me9g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkJDJun1U0SZsUBDXus7R94y1DThNJwfdKEfq/9T5tn3Alrt5HsQnS24NubvQGvAkmoZU0Mua8LBJwMWj+Fw/B5qIOq69TlkVQlLp/7GMfj8HEfIqjxg/0AqftFQoMQBh+6u9Ainc24y8+n/c+MRJh2G0wxCZe0m27vjz56zMe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzuWIL2R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzuWIL2R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HNLVdd013410
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aJAn7hBjJyszdrESORg2V/IE
	9MPVgEXDSCugj4BSJ8Q=; b=IzuWIL2RK2F0qCMIDOqO6WaCqAy9z2zh0cGcVXTq
	ah2C4p1mcECmCtbXmuWkomnmMTLrt10DOum80uF+YdHDwMH0b8BHDmUQoNakL4bM
	PaCm6D1C2GANqaHb6ATVVUi8DT5ecdK6/ELxSjIuOWN5/xFK7W5fYOsVJDj+LKPD
	ffItu6oC+ANM4dgWK0AXENhswYbXVZ6Lcpnxg4vMnrYa7wX9L0yWys9CLHBCxurF
	xR8aU70OgaHdEpIOoxIuvMvM3W6nHh7eEhYErkKgTjmVDdgNDfrmng/lkaRIhkd6
	gVCBYx2p42a5uVyCDzIG+R4CEVscpHa9vKZf/87RG5T9gw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca362q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:07:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d099c1779dso1115640085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230442; x=1750835242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJAn7hBjJyszdrESORg2V/IE9MPVgEXDSCugj4BSJ8Q=;
        b=QiAvpTVSg5raxLz7+69xyf4Zrl41si9M4hXFby6/po7UZ4lE2e/sLV+xKi8t3qeEmT
         OTKuz5Yv5/P1yGhfvcZEiWs8d1454LLHMen6G2zUlvw3GW1OGM42DzcLCjdpBYrukUuk
         FjcVeXgMIWswtDUptm7deo62xjXcHTUR9ILufyxdBHGKjckw7nZlNUefMFAbu/m7AhGp
         JGOCEaDpCIyGFTz9EGveAjh/v5vEZX7Dkq2qOpiYV5PnnNnd2dIUQgf0hAxk8kQpFcZk
         Fz0MwOCMIj/RfMqXzzgRJSDG59x9hfE4px482ZCxXhOCiU39FggQ5/NE9aWwBf0YIw+3
         zeBw==
X-Forwarded-Encrypted: i=1; AJvYcCVvi68fAgIQdD37Mwy0bO9IXt2WER7zo/UU5GEF3i7+TNi6oETlzoWG6J9pJ7tDNzanaxrCGpSbmYemRLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtnSA0ICyBlpytAK2vI75MsEBYXlNQKFP27rV40tE2zv7QIvpf
	kb5o3NTNia/4tDT98Ai6SuA44ChaI0jiuwpK02mC5q37c2uws81b+EbbaBkYJ50eUXL2vxA6IB/
	COZe9eS6FJoZJ4n4iwyrx236fu2GCAIIjzJ22rk0d3BgrQCteHMYZ6UghmbVrycnpTjc=
X-Gm-Gg: ASbGncvJCt+g0h9v334vcavSgc8MtanLWQc+FgMFTFvXGR8lfVHeO8RJWbk+J4stkRn
	tNe9rqZmhhnPE68emcR4ap+D4xk3FWByaYyxKTPibB7WOvcJtQwRThdG6LRD4PpgqvcK5pXLboK
	+5E2uMepLoCGoCfKsc7AeDtPD+QgfaydEeN2oRHUsF2ClnYNY4WmgqHQJpCBZ761tZQyKOObQ8E
	6ztFHt7PHSmgtap9wuvkoyvzji9KVOyMv1J3y8ID7bwVRt3k6s67Fj7lSjmew156uc0Ed9gUq2i
	CCjadnh7NeUTtZYAkfXtHeFHZB2lqVCFOaHfaDIDbZUX3F3aU2G5GsOXiQ==
X-Received: by 2002:a05:620a:4611:b0:7d3:9288:5c1a with SMTP id af79cd13be357-7d3c6cfb967mr2504558585a.46.1750230442567;
        Wed, 18 Jun 2025 00:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY6o0WAdvfBZgPNZCEmNmaQwkZdoQZkElGREQd18gcW9CllYz/e7O1a74nEW6hnb6uLLeBIw==
X-Received: by 2002:a05:620a:4611:b0:7d3:9288:5c1a with SMTP id af79cd13be357-7d3c6cfb967mr2504555185a.46.1750230442127;
        Wed, 18 Jun 2025 00:07:22 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm16165076f8f.94.2025.06.18.00.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:07:21 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 18 Jun 2025 09:07:20 +0200
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, hans.verkuil@cisco.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Message-ID: <aFJlqGFPrO9Hw4f1@trex>
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
 <aFAVTvsDc8xvwBme@trex>
 <1bdf289b-5eec-d5de-a08b-6c7a772e15a3@quicinc.com>
 <aFA5FpJPRmJ/ltI9@trex>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFA5FpJPRmJ/ltI9@trex>
X-Proofpoint-GUID: SdIxcm9VSPfV4J_1F2O-fZGyafO85kMp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MCBTYWx0ZWRfX27Wc40GFo5wn
 FrNJM79BpmREnQACN9znaqYGKZd4O+/ywj5EXOPwJy5u/pW+u+J34Huzj2+Fgf3NopCXXruAa5p
 B6guVM9IJFjntLDghxBpOP1iOV1PYHdZlcw2++rjk1qQD4c2u0tUC0NO2L5uHf1q6qvy07UpeAY
 SlCqcu/srQ/8aMbahA3LVS8MW/fcCsGZ4LT6/SZ8hX7zxspnLSoeGAzFEjrRW0Wy4TKYW8tXmEn
 S1xVZXYRH8Setz0uesDKtV0mvXl6p10VznvcqnE/KvMDmQV1dC2Xzy4Jmg7j7PwN+PzOUR8xghZ
 PMUEZ5ST3gKYkKr4aCkyhi9MGT8r8fVqhS+512o9i5sA5OS0FJHi4scGm3VOBNxVhnMoBKrgc4j
 Ez9qnfrQeP1Sz3WJOOLcaidI+L4BdlyahTAJsImODgObWx+61OuHF6Wvzy+9BmNrVqQdjFFe
X-Proofpoint-ORIG-GUID: SdIxcm9VSPfV4J_1F2O-fZGyafO85kMp
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=685265ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=X3RmICvlrzrKrH2AD7gA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=990
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180060

On 16/06/25 17:32:38, Jorge Ramirez wrote:
> On 16/06/25 20:14:36, Vikash Garodia wrote:
> > Hi Jorge,
> > 
> > On 6/16/2025 6:29 PM, Jorge Ramirez wrote:
> > > On 16/06/25 17:26:24, Vikash Garodia wrote:
> > >>
> > >> On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
> > >>> Ensure the IRQ is released before dismantling the ISR handler and
> > >>> clearing related pointers.
> > >>>
> > >>> This prevents any possibility of the interrupt triggering after the
> > >>> handler context has been invalidated.
> > >>>
> > >>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> > >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > >>> ---
> > >>>  drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> > >>>  1 file changed, 1 insertion(+)
> > >>>
> > >>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > >>> index b5f2ea879950..d9d62d965bcf 100644
> > >>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > >>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > >>> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
> > >>>  	venus_interface_queues_release(hdev);
> > >>>  	mutex_destroy(&hdev->lock);
> > >>>  	kfree(hdev);
> > >>> +	devm_free_irq(core->dev, core->irq, core);
> > >> Could you please check and add the handling here [1] as well ?
> > >>
> > >> [1]
> > >> https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427
> > > 
> > > hi Vikash, sorry I dont get your point - what do you mean?
> > IRQ need to be freed even for error cases during venus_probe().
> >
> 
> but  this is what the current patch does (venus_hfi_destroy is called at
> the end of probe error handling as well).
>

for background, this fixes a null derreference in the Venus driver -
reproduceable in RB3Gen2 on a particular error condition during probe.

> > Regards,
> > Vikash
> > > 
> > >>
> > >> Regards,
> > >> Vikash
> > >>>  	core->ops = NULL;
> > >>>  }
> > >>>  
