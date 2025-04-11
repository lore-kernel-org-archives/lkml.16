Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A395E1E835B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369696; cv=none; b=ue1zOsc1++kgBAnAMrLCZR9JSGS3mK1XCzrRHBEUx4EPp9lxF7tQlD6ENVBUevouw/eHtGTJEcXmq9nbpv6IMh2xFLO7bMlkTjQsBUYCD1D6RQdbNy4ZqBFG66m75RT+KhSmUtWjls71xBQ3gZfRm8HW0MibsRz+6O/wVl4oXBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369696; c=relaxed/simple;
	bh=N0GXB+C5Gv5I7eS4k2UF2d0jnVsjtmVVLypsJwgAhGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baiuyWOiTfeX0RE7Mdw/xa/i8IsitcnsUnKlIlhEsoKRwK+NnNAcSC8ELIur0RMrTRFQrIdnPlZGTjFkiQUIBWQCz73fevZXR5KYADj9H8d45mS/NEpz1bFqw13oq2P8imrwqCn6bZZ89YJpZUx2KmhxnS4P66bjCTI252kmvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgoEfdGB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgoEfdGB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B214lr006861
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HBQbeYzw6APWnZi84F2a3pRK
	I27ywQZAd06trqW+HaY=; b=hgoEfdGBzhApDqkndDagZESVBWVwpZ/iqvKKQQxC
	y2gB8z7IqWB6wIx+6S/nOb6/656IDPDwAJ5t9TUiTTnfQ6S3lChfLWwq0Tg3AUsS
	rxk6oCE1TcpYnWuxhuMuMl+47rK3yT7YzAGmTnedFitGpSi4AaL3UhoK0/PhAfDJ
	FCaML/lGybf5cN3Crh0vLx6VZS5ZAIUikW7cfU8nvUqe0mdROKxtuJ6zXhezsarX
	n7IYpVXNTJKB6kNSn7ZJgPaa3fST+1+YOduVx6+xSDnEcFIcRLChXTRCncDXbfKv
	1i5UUvNsdeZC7aL5gPO5m22iwuEfCBcgUe/5hvv54IaHQA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3k5wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:08:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af9564001cbso1268017a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369692; x=1744974492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBQbeYzw6APWnZi84F2a3pRKI27ywQZAd06trqW+HaY=;
        b=Qq/AKA37GAhzJ3HeEb8lLouneXt1GCP0jY6ZgqCy3Run4D1kCDsFHQHhPGygGjlLte
         RK0SQYoMs5zOfZOG/paKDx5olLUHuptWq2IokWQ+xHzQTk3yfBvGpMraKDYjODseuFWs
         SwR6SwQiIqkkq9jGZakFJjGvixQiDdymyuMAY2C7+lkRdN9K9QfAz1KzmkVbRaE/v9L2
         zm0nEG9vvzWA6t1jopkYj+nr0nONyG+/q8g87AsTF7qBb4S/EHxU4npKcoA5feMJAfVg
         9j1nDmZXwi9X0EZbC+DOFZjcDJ05wrdsvRRrMNqN9z2kbsN0pNf+DwueQoEnDezwKxxv
         OmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUidQ07Bgf2pMrIVCtO/1a3qiVPB0QvFMFEofXACDheLYRZ0Bz509+rCmnjNvWezzNGVi88YTvpUqdwh+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzLrif3lwCFvDxCYuoLG4UsJ9wQJVCSRo4c/1wRriMT2DStP2K
	LmOEqy8S9cKIEoIOAR7O3yO/6/PKa3e8E1Yi3aB3U3bHyab2fL6ibsGjSgdEJ/0LmrDJMXVtLT2
	QheJOA9GG/1geOqCBFllIviD39dxNZmTwZBmywRhI1b8Xrg4r1ViWJprfL4SVXOiAldYavecOeB
	POjP12vFjMYoWzLnH6UJ0/3X9QO2j1iH5gjy9dBA==
X-Gm-Gg: ASbGncsSfcp326+M3Yc34GCFMD6c+Ql3CrVsp4eSYDVxVi+Gz5Heyhoz4j5BX6nC4eB
	9VhdzARFJmmDVPZrIed8XeC9baxaTptPAp++RsKoxkg69p6if3Nm8mkVQC7QyU9rNEjWc
X-Received: by 2002:a17:90b:3811:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-3082367cc82mr2897076a91.25.1744369691848;
        Fri, 11 Apr 2025 04:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd0I1GCEDvpAi2gUYHugQoIfK7apTzqTjmfre2S/d62z+yjx0led5IZyjgEwQ9RSEWSP7216G2+nVwkEiP3pM=
X-Received: by 2002:a17:90b:3811:b0:2ee:c2b5:97a0 with SMTP id
 98e67ed59e1d1-3082367cc82mr2897046a91.25.1744369691461; Fri, 11 Apr 2025
 04:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-5-quic_nitirawa@quicinc.com> <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
 <317faeaa-3130-4e28-8c5d-441a76aa79b4@quicinc.com>
In-Reply-To: <317faeaa-3130-4e28-8c5d-441a76aa79b4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 14:08:00 +0300
X-Gm-Features: ATxdqUF-X8GJOlAeUkfYE-Sg-FfqieiSk7JqgrP2qo_5nFBO6uleE-ckDhQQcvo
Message-ID: <CAO9ioeXnnbNzriVOYPUeBiWdrPfYUcMk+pVWYv0vZpJbFeByoQ@mail.gmail.com>
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f8f81d cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=DRp6rjHBX2g6hxItOtMA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MriJMZuQ6fOCIemgDIoUWBqU9-w9xrVc
X-Proofpoint-ORIG-GUID: MriJMZuQ6fOCIemgDIoUWBqU9-w9xrVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110070

On Fri, 11 Apr 2025 at 13:50, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>
>
>
> On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
> > On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
> >> Refactor the UFS PHY reset handling to parse the reset logic only once
> >> during probe, instead of every resume.
> >>
> >> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
> >> qmp_ufs_probe to avoid unnecessary parsing during resume.
> >
> > How did you solve the circular dependency issue being noted below?
>
> Hi Dmitry,
> As part of my patch, I moved the parsing logic from qmp_phy_power_on to
> qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain
> about the circular dependency issue and whether if it still exists.

It surely does. The reset controller is registered in the beginning of
ufs_qcom_init() and the PHY is acquired only a few lines below. It
creates a very small window for PHY driver to probe.
Which means, NAK, this patch doesn't look acceptable.

>
> Regards,
> Nitin
>
>
> >
> >>
> >> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> >> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> >> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> >> ---
> >>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 61 +++++++++++++------------
> >>   1 file changed, 33 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> >> index 636dc3dc3ea8..12dad28cc1bd 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> >> @@ -1799,38 +1799,11 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> >>   static int qmp_ufs_power_on(struct phy *phy)
> >>   {
> >>      struct qmp_ufs *qmp = phy_get_drvdata(phy);
> >> -    const struct qmp_phy_cfg *cfg = qmp->cfg;
> >>      int ret;
> >>      dev_vdbg(qmp->dev, "Initializing QMP phy\n");
> >>
> >> -    if (cfg->no_pcs_sw_reset) {
> >> -            /*
> >> -             * Get UFS reset, which is delayed until now to avoid a
> >> -             * circular dependency where UFS needs its PHY, but the PHY
> >> -             * needs this UFS reset.
> >> -             */
> >> -            if (!qmp->ufs_reset) {
> >> -                    qmp->ufs_reset =
> >> -                            devm_reset_control_get_exclusive(qmp->dev,
> >> -                                                             "ufsphy");
> >> -
> >> -                    if (IS_ERR(qmp->ufs_reset)) {
> >> -                            ret = PTR_ERR(qmp->ufs_reset);
> >> -                            dev_err(qmp->dev,
> >> -                                    "failed to get UFS reset: %d\n",
> >> -                                    ret);
> >> -
> >> -                            qmp->ufs_reset = NULL;
> >> -                            return ret;
> >> -                    }
> >> -            }
> >> -    }
> >> -
> >>      ret = qmp_ufs_com_init(qmp);
> >> -    if (ret)
> >> -            return ret;
> >> -
> >> -    return 0;
> >> +    return ret;
> >>   }
> >>
> >>   static int qmp_ufs_phy_calibrate(struct phy *phy)
> >> @@ -2088,6 +2061,34 @@ static int qmp_ufs_parse_dt(struct qmp_ufs *qmp)
> >>      return 0;
> >>   }
> >>
> >> +static int qmp_ufs_get_phy_reset(struct qmp_ufs *qmp)
> >> +{
> >> +    const struct qmp_phy_cfg *cfg = qmp->cfg;
> >> +    int ret;
> >> +
> >> +    if (!cfg->no_pcs_sw_reset)
> >> +            return 0;
> >> +
> >> +    /*
> >> +     * Get UFS reset, which is delayed until now to avoid a
> >> +     * circular dependency where UFS needs its PHY, but the PHY
> >> +     * needs this UFS reset.
> >> +     */
> >> +    if (!qmp->ufs_reset) {
> >> +            qmp->ufs_reset =
> >> +            devm_reset_control_get_exclusive(qmp->dev, "ufsphy");
> >
> > Strange indentation.
> >
> >> +
> >> +            if (IS_ERR(qmp->ufs_reset)) {
> >> +                    ret = PTR_ERR(qmp->ufs_reset);
> >> +                    dev_err(qmp->dev, "failed to get PHY reset: %d\n", ret);
> >> +                    qmp->ufs_reset = NULL;
> >> +                    return ret;
> >> +            }
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   static int qmp_ufs_probe(struct platform_device *pdev)
> >>   {
> >>      struct device *dev = &pdev->dev;
> >> @@ -2114,6 +2115,10 @@ static int qmp_ufs_probe(struct platform_device *pdev)
> >>      if (ret)
> >>              return ret;
> >>
> >> +    ret = qmp_ufs_get_phy_reset(qmp);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >>      /* Check for legacy binding with child node. */
> >>      np = of_get_next_available_child(dev->of_node, NULL);
> >>      if (np) {
> >> --
> >> 2.48.1
> >>
> >
>


-- 
With best wishes
Dmitry
