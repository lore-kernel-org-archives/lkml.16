Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3F428F959
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315208; cv=none; b=iDZW1Qy20JQdz9WHiGj1PPtYSoAVnjDZSc0T6y1RVFulcz1+LIc0bvJflTlV4lqiRw05AGQHbzTuhdctDZW40BWE8fC8/fAw9pCXKul5W/A8LkA5fdM1BGZLI4eIKkMAmXOdfrAj8o5OPatu3QraSX8HWLLfdxfbgvvjsk3GL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315208; c=relaxed/simple;
	bh=4rkEoKO7cOpPwalBZQ0NDwQXAXKjo95y7RRThGYk3HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTJ/32vwsVgaBHOhlIE8CsCvnqkxWlHQGggGd7lMC1cm7wbg6WQX9LdboBqjPUXtLFe9pyP9VT4ECr4F1i1qaS08rNLzladv16PIjCXoKuvd0le7Q9CjnZSSxlHCS9YD6xE8bJa+JIqXLdBpTHyboB9J1eQ2vD5QlzYLhLAZyKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A59ek5qx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A59ek5qx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGG3Xa032542
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wNOMTHHhh84q2ykF2gFHwWOs27+2UZ+5K0uavlTb4U=; b=A59ek5qxIIWSti7h
	nWpKemMgWinIJ7C0yo08N3L7BjrHadcpKO7HlTORiHD7e4RU17C2TkohpaO3L4O2
	R9QQEk81o0l/DNTFE0exm2YOtwE/AeZHjKlzS7I8doYJMEpJGsGU8s0fDSAzMt3i
	7KORbelMo51s887ncKQwLslvJE6Q2YTZUtoF+e6MBgNib6pWUMvvArdMRbPB3YRJ
	3MZPZPPOio/+JTGGYNjJWj99ztiVgO/rJGEc9dRI3E+hF9jhIQSDEvscUCMT72ev
	1MWlc8gxap997qb7onH7knhyo3mWmiWUqGMMN1eowCmAw9U2WdMdMtfkGkXzI4LQ
	5xF5rA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkr0dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:00:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so264391585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315203; x=1744920003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wNOMTHHhh84q2ykF2gFHwWOs27+2UZ+5K0uavlTb4U=;
        b=oH6C1f1gwj9RwEN5DnNjBxK1yVDiB0rGWc1itk6KgWt474P3xoF9/i2M0WhisYMsj2
         tgzOojKGgecemviyS6HGUyrvwdfxs+OvBwUTW1xj9Pnj26imhugQVbmoLkuYHzUm3Y04
         OqjvLdI9F7KtYfknhks1Sbu/e3XbbHgTH6k5bJVfe8skJYocriCS92o0B1S9SLV9nsVP
         r42UQOmF00m9Me/axDqtNCMFAo9BrbRtIbBNxpztLY0gFeh1pEJcTZznw9DgbfzJq7j5
         gqnuztCqCH3fzu/rD1M18MfmgxchYTxiyuNPTXZyuZ+UXGzQ15Ww9WPJzXW1F5EvZ+6h
         TViQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwFt5yam9bm2Jwd+QF+qj181hNlrUeaUPJWYtfSW7ov2ResDjs3h1gCJ7mDw+TL9sFQ3n+hnSof+H1u8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyckMqKzoEGuDueOy3q4MpBrGf4sPxzvAHPdHmGOooiKMxzrTSl
	icm5LJ0x1HL/8wkrNw4vyvgI5wT4b5Czdp24B9FwFhiEeAx5RFyAccc6pVM2h1SdQMyMf7dp1sX
	2pRQq0HFaf0/EdFpfp5Q1vHdfF3B9mTb73mkrrvh8U356zAnSVewcGVNVyueYVzxrekurKLU=
X-Gm-Gg: ASbGnct/83TEPPLo8u0Mn/ez93Ydo4FS7cnMiQrTmMDWW1uqXbp/5nta/StrVOyWOaj
	57nP2ksV56mp+T1EsfeDV5uM963afJ/JgPZYuXa5xaknL2qpscDLgMen3r8AiE+StPWaFgRC/Re
	9dHut6LTfUXVJFG/07BlwB+tBDyvKaF5cXUDZ1x7mAW7G4loXsFGBQQr3rO1QeSTv1R5mfeJclX
	37TmgAxzY6KQJ4ksGDpbtp+h9Rl2yajolAkafXvTtAUNppoa+L/lzQlKYwhZ/6CMl9oTZWuQ7Zh
	TNCp5si/zqKGZDSIiIAfiGewDE10KX0MkzMdJYv60dnOP/vcpLfs9RD1e2VPr+MCdkqULVXtxKQ
	=
X-Received: by 2002:a05:620a:1a18:b0:7c5:43b4:fa97 with SMTP id af79cd13be357-7c7af1db11cmr41769185a.53.1744315203646;
        Thu, 10 Apr 2025 13:00:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK3o7FedoTJpZFRy9lS2yc7XNbDtrGzgkkOWmS1wXzrIetzjvuwh9/WyYeycYPnX4h4dKBnQ==
X-Received: by 2002:a05:620a:1a18:b0:7c5:43b4:fa97 with SMTP id af79cd13be357-7c7af1db11cmr41764285a.53.1744315203328;
        Thu, 10 Apr 2025 13:00:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d50facbsm233911e87.162.2025.04.10.13.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:00:02 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:00:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, kishon@kernel.org,
        manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Can Guo <quic_cang@quicinc.com>
Subject: Re: [PATCH V2 2/6] phy: qcom-qmp-ufs: Refactor phy_power_on and
 phy_calibrate callbacks
Message-ID: <xn2oexjb6s7pdh4lpligc47jlyuxvwvuuh6obvr5z3ggqi2qsa@xjttnszx5eq3>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-3-quic_nitirawa@quicinc.com>
 <ab3639e0-61bb-46f0-9e54-f1bbd034b939@linaro.org>
 <c35c37c9-ff5b-43cc-afdd-fff509415ca6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c35c37c9-ff5b-43cc-afdd-fff509415ca6@quicinc.com>
X-Proofpoint-GUID: zFKGbd-u_vt7jMz8LGOlO1Tf6OM7eCoD
X-Proofpoint-ORIG-GUID: zFKGbd-u_vt7jMz8LGOlO1Tf6OM7eCoD
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f82344 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=_dewA8zSobTcTEY47J8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100145

On Thu, Apr 10, 2025 at 02:43:52PM +0530, Nitin Rawat wrote:
> 
> 
> On 3/18/2025 8:39 PM, neil.armstrong@linaro.org wrote:
> > On 18/03/2025 15:49, Nitin Rawat wrote:
> > > Commit 052553af6a31 ("ufs/phy: qcom: Refactor to use phy_init call")
> > > puts enabling regulators & clks, calibrating UFS PHY, starting serdes
> > > and polling PCS ready status into phy_power_on.
> > > 
> > > In Current code regulators enable, clks enable, calibrating UFS PHY,
> > > start_serdes and polling PCS_ready_status are part of phy_power_on.
> > > 
> > > UFS PHY registers are retained after power collapse, meaning calibrating
> > > UFS PHY, start_serdes and polling PCS_ready_status can be done only when
> > > hba is powered_on, and not needed every time when phy_power_on is called
> > > during resume. Hence keep the code which enables PHY's regulators & clks
> > > in phy_power_on and move the rest steps into phy_calibrate function.
> > > 
> > > Refactor the code to retain PHY regulators & clks in phy_power_on and
> > > move out rest of the code to new phy_calibrate function.
> > > 
> > > Co-developed-by: Can Guo <quic_cang@quicinc.com>
> > > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 18 ++----------------
> > >   1 file changed, 2 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/
> > > qualcomm/phy-qcom-qmp-ufs.c
> > > index bb836bc0f736..0089ee80f852 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > @@ -1796,7 +1796,7 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> > >       return 0;
> > >   }
> > > 
> > > -static int qmp_ufs_init(struct phy *phy)
> > > +static int qmp_ufs_power_on(struct phy *phy)
> > >   {
> > >       struct qmp_ufs *qmp = phy_get_drvdata(phy);
> > >       const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > @@ -1898,21 +1898,6 @@ static int qmp_ufs_exit(struct phy *phy)
> > >       return 0;
> > >   }
> > > 
> > > -static int qmp_ufs_power_on(struct phy *phy)
> > > -{
> > > -    int ret;
> > > -
> > > -    ret = qmp_ufs_init(phy);
> > > -    if (ret)
> > > -        return ret;
> > > -
> > > -    ret = qmp_ufs_phy_calibrate(phy);
> > > -    if (ret)
> > > -        qmp_ufs_exit(phy);
> > > -
> > > -    return ret;
> > > -}
> > > -
> > >   static int qmp_ufs_disable(struct phy *phy)
> > >   {
> > >       int ret;
> > > @@ -1942,6 +1927,7 @@ static int qmp_ufs_set_mode(struct phy *phy,
> > > enum phy_mode mode, int submode)
> > >   static const struct phy_ops qcom_qmp_ufs_phy_ops = {
> > >       .power_on    = qmp_ufs_power_on,
> > >       .power_off    = qmp_ufs_disable,
> > > +    .calibrate    = qmp_ufs_phy_calibrate,
> > 
> > Ok so this will break the UFS until patch 5 is applied,
> > breaking bisectability.
> > 
> > Make sure UFS host driver calls calibrate first, and then
> > do the refactor in the PHY driver.
> 
> Hi Neil.
> 
> Thanks for the review. I have taken care of bisecatablity
> compliance by making UFS host driver calls calibrate first
> in latest patch set.

_latest_. So if this patch gets merged first, UFS support will be
broken.

> 
> Regards,
> Nitin
> 
> 
> 
> > 
> > And either all would go in a single tree or either PHY
> > or SCSI maintainer would need to provide an immutable
> > branch for the final merge.
> > 
> > >       .set_mode    = qmp_ufs_set_mode,
> > >       .owner        = THIS_MODULE,
> > >   };
> > > -- 
> > > 2.48.1
> > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry
