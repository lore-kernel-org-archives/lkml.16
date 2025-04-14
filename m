Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AE1259CA0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616606; cv=none; b=G3DqYRYAjxSRHy58CA2p6w0tEzYCqWG6BNfjxWldTNx7vgWQ0xCpco4jqGMZ5lMa/+2F9SkahM9lFcBBUFnYXMlxtq/YMbNpCHSGRac8mg6MtyRWo3hkTv35mSmk1pZrGQuysUR0plHwJiTh8MPIIt7cw/RityKXe4ILmVLzHrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616606; c=relaxed/simple;
	bh=slvBVC6hmkYGxoROIH5HdxzsQjsj+FPXh6qtqyS+NEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fd0ztzTdujcTsZ6/WFoVY6K/L7lAhF4Y1N+ZVTf8fhrP11rh7rBFZuQp70YP+CqBBOpRPVaqCq9jxmfbFO7UsJL1v48IJ2Qg7rRfZZJq3PWheDCd9gE2wqigC5HhJEkUMLZLNtjDQ2ArxWHQvbes4CTd/L+tbGOVH5swYuz7DwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvtWch+Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvtWch+Z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DNK0Yr004059
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Um1Ee0fatfSrCr9mgfrQaagy
	x2fBqusvxToSaiBP3Q0=; b=kvtWch+ZdYjXuycHx3pXD8GetCiRqYKLmtbPNll1
	EUrbuB0WMT9iBY0LIWApw19lumo9tkNyOj+7SSgvW0WXCM+Jp35Cc/f+tD0WpJD5
	HGhxmLzX3Je49Yb2zdWdnmTkB7T2IcFeoRjMP+ivOibKt3ggrXqoaI18mWZoPnjY
	vOeyZ/SnDj82DoBh4e3MNTLjxVl1N5xa1BtfqPJsbLhruLrQVH9tpjHC/ijIUnD1
	WoScX45w96aaA48CkqPh2Dsn8XYIc5n7kvjgdfSy1CGpBOuqPZ7RueLIcH5NP+Mt
	knEU20PwYBJM/TW9klPLZoJZeZxo9uYVyu2wrbfmaU2WTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjumcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:43:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f876bfe0so672572285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616597; x=1745221397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um1Ee0fatfSrCr9mgfrQaagyx2fBqusvxToSaiBP3Q0=;
        b=U67lpqUd9PO4Q3lxSOzXqSsIUq5MKYZneaOgbJ6Vl0/Idn2GkJeyXBQ/K5F+Q+VBwH
         rbB/MTF7gAFodLcuW3M6WBUut71fkvXM3qU+s6DFaTL9Oi7Ge/PnvRTeMjIZz83ho06R
         E1Vfu9K/ld3h4dDNsCY2F9kzrF1RFnVAHb8v1ciwevctsxdRyVbhFHAwZ0EizlG8FYzU
         NSPedMmd02bVWGoeFIEFJmn1Qd12CWyg6OY0NSZOpf4Qci4PZynh0aRZ4fuH9e6RLvvm
         E+Hvx3tK3E9Dc9EnvKHGB2Ak5mqUk3oey/iB4ykCEkKEp1D3qTYCL/T/RPJH5tW3oTny
         SgXw==
X-Forwarded-Encrypted: i=1; AJvYcCUkaZsxyDka7mpkblwOY9XoSE+rt8f+tVcnYpvSaH0dhSFv96JP/a+MjPuPzUc/a5oJnFuTtgnDGz4LUCk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx87QECEPanzm6eLG4JU12sB84c2RhYsPHfnn/SW28ew/OqyZfL
	sZpT/wGeGQdEa9LFAqZub3JFk9KHtZmYMnHgnRf67gWm28ud+jR7r5ZFekrW17TRBPOufV02vEe
	wtiw0vq59rF8vpWm8zXmsLJpIasMsSqADlP0lBxeGkMXnHk2tGsWSJ46VPsE6Tq8=
X-Gm-Gg: ASbGncsbuBREFWf4swaiB8FsZG5xFmt82EyR9bCGQ41atThzX3VQxl/VJuZTZ/kBmQ5
	Z/cu3ifMxG52xkUuMDryJrZ866W1uWYc4lfgy3n1pJMRuMB0ofM+u7BByy777fUY5ilpSDvWzx9
	R20v/VREBua6Ia8INNxqBtxbhgxKvsj6PBNZvdequYUgKUBP9BhNCTig4w+S4JCwJN6UjqzvAcm
	eIONXpAX4VVzGVB0X8UmqrvlBT/+gvvozHR/PLYuALkXK/DWIRtWcCOiYpNYyFaIb0Szyw3kX3J
	KIRrNuGEf9Zcwetbbkv5hs9qdGiBawcVm6/o9YxvTJewCe91NunwH91REvUTADRtzPxdsm+hs0A
	=
X-Received: by 2002:a05:620a:2901:b0:7c5:49b7:237c with SMTP id af79cd13be357-7c7af14b0ccmr1859507185a.27.1744616596720;
        Mon, 14 Apr 2025 00:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPTDvjXIU4+/YUQdJ7lFbDzmq8UiSQ+ZiaVzIf5dqB0Tzb8PIW8irySrnFsWhJsN4u3ncKaw==
X-Received: by 2002:a05:620a:2901:b0:7c5:49b7:237c with SMTP id af79cd13be357-7c7af14b0ccmr1859504585a.27.1744616596134;
        Mon, 14 Apr 2025 00:43:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d514csm15946351fa.78.2025.04.14.00.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 00:43:15 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:43:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 5/9] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
Message-ID: <sajcoh34gyfcvhik3yairil65guvp2rt2xdmbmlpmlcjvst5ci@qojbxhmrnrxj>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-6-quic_nitirawa@quicinc.com>
 <zvc3gf7mek7u46wlcrjak3j2hihj4vfgdwpdzjhvnxxowuyvsr@hlra5bmz5ign>
 <4557abf9-bcd2-4a06-8161-43ad5047b277@quicinc.com>
 <CAO9ioeXyDWOhe1cbGO_tR=ppZd1aC0GSdeMzQjir4XmDRMQ3Jg@mail.gmail.com>
 <64216a90-e2e0-435c-87bc-388c72a702c0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64216a90-e2e0-435c-87bc-388c72a702c0@quicinc.com>
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fcbc96 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=JfrnYn6hAAAA:8 a=COk6AnOGAAAA:8 a=IG52YttmCyEg0bf6y1UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uITyhO4OESFBaqKW7M1ltNBlLZYFcq0C
X-Proofpoint-ORIG-GUID: uITyhO4OESFBaqKW7M1ltNBlLZYFcq0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140054

On Mon, Apr 14, 2025 at 12:58:48PM +0530, Nitin Rawat wrote:
> 
> 
> On 4/11/2025 4:26 PM, Dmitry Baryshkov wrote:
> > On Fri, 11 Apr 2025 at 13:42, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 4/11/2025 1:39 AM, Dmitry Baryshkov wrote:
> > > > On Thu, Apr 10, 2025 at 02:30:58PM +0530, Nitin Rawat wrote:
> > > > > Simplify the qcom ufs phy driver by inlining qmp_ufs_com_init() into
> > > > > qmp_ufs_power_on(). This change removes unnecessary function calls and
> > > > > ensures that the initialization logic is directly within the power-on
> > > > > routine, maintaining the same functionality.
> > > > 
> > > > Which problem is this patch trying to solve?
> > > 
> > > Hi Dmitry,
> > > 
> > > As part of the patch, I simplified the code by moving qmp_ufs_com_init
> > > inline to qmp_ufs_power_on, since qmp_ufs_power_on was merely calling
> > > qmp_ufs_com_init. This change eliminates unnecessary function call.
> > 
> > You again are describing what you did. Please start by stating the
> > problem or the issue.
> > 
> > > 
> Hi Dmitry,
> 
> Sure, will update the commit with "problem" first in the next patchset when
> I post.

Before posting the next iteration, maybe you can respond inline? It well
might be that there is no problem to solve.

> 
> Thanks,
> Nitin
> 
> > > Regards,
> > > Nitin
> > > 
> > > 
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > > > ---
> > > > >    drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 44 ++++++++++---------------
> > > > >    1 file changed, 18 insertions(+), 26 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > > > index 12dad28cc1bd..2cc819089d71 100644
> > > > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > > > @@ -1757,31 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
> > > > >       qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
> > > > >    }
> > > > > 
> > > > > -static int qmp_ufs_com_init(struct qmp_ufs *qmp)
> > > > > -{
> > > > > -    const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > > > -    void __iomem *pcs = qmp->pcs;
> > > > > -    int ret;
> > > > > -
> > > > > -    ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> > > > > -    if (ret) {
> > > > > -            dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
> > > > > -            return ret;
> > > > > -    }
> > > > > -
> > > > > -    ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
> > > > > -    if (ret)
> > > > > -            goto err_disable_regulators;
> > > > > -
> > > > > -    qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> > > > > -
> > > > > -    return 0;
> > > > > -
> > > > > -err_disable_regulators:
> > > > > -    regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> > > > > -
> > > > > -    return ret;
> > > > > -}
> > > > > 
> > > > >    static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> > > > >    {
> > > > > @@ -1799,10 +1774,27 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> > > > >    static int qmp_ufs_power_on(struct phy *phy)
> > > > >    {
> > > > >       struct qmp_ufs *qmp = phy_get_drvdata(phy);
> > > > > +    const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > > > +    void __iomem *pcs = qmp->pcs;
> > > > >       int ret;
> > > > > +
> > > > >       dev_vdbg(qmp->dev, "Initializing QMP phy\n");
> > > > > 
> > > > > -    ret = qmp_ufs_com_init(qmp);
> > > > > +    ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> > > > > +    if (ret) {
> > > > > +            dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
> > > > > +            return ret;
> > > > > +    }
> > > > > +
> > > > > +    ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
> > > > > +    if (ret)
> > > > > +            goto err_disable_regulators;
> > > > > +
> > > > > +    qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> > > > > +    return 0;
> > > > > +
> > > > > +err_disable_regulators:
> > > > > +    regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> > > > >       return ret;
> > > > >    }
> > > > > 
> > > > > --
> > > > > 2.48.1
> > > > > 
> > > > 
> > > 
> > 
> > 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
