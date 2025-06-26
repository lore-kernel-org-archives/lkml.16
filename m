Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E0223DD1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750981079; cv=none; b=Gs1W/14mwDudXq3NqM80KFV/kSMLGTJcXXTpiB18kpRFNH/gI183LoRuslwYRR6YxoF3S5CGltuhVJdy6ue6r1ygEUGOKHu3LtC0puc6Tyt0UjuRy1B3hFsSnuZBM+xJBzS8W1ggs96CQiVug+isISua8R74oF1OHQprjVIhFn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750981079; c=relaxed/simple;
	bh=EGpeMWLKnG9VFthSqSlUF2fQOm9eZpsV2Fv3d8hs0zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPI216TXOhmCiKW1rlJn9WS4p6eS4cPbFKYdztuhWvpJ9qf37mEa5i8nW0vP2cIpwOjKWMOlr1CQFrQ2AsmyMhVk/sM9Jk3BJl4Jul6dU4skVYm/UJUUOOySPGlr+fo+TOt+84Oc6YnST1J778QJ2W8id/FYOpgmqXdiKhsrOrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHmDmM5p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHmDmM5p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ0SFD021532
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oNGoQxfq9BmzRNrHBiOpebN0
	WGqD2gPosHFTzl27EH8=; b=NHmDmM5pPEOobkbBiDC814/nRYzrdpLvgK7ea2eq
	FYpbxy1e1ZpO4SHYQ3XyaUP6nCMkstPED78kVJv7N3ZFR1on5T2xOnTuKyheFU2R
	bGqMF+aj/qW5GiBLHPUVObEZB66DGEQFiFSrU4JRIkE9jDo93dS42NW0U3y5g92w
	cvTXUhCODMsPWAXBzGo0FSdfNTvwsPKDc2lICs5YIwMUmxlLSjaME32E4iLbuqJW
	tqgRotBh99dZXW+Aodukbat+q63nzO+QxXmQoFc0aZlRGvohXhBbo4nR/rfjzZpP
	KaTtyIq88R3q2QTId8UIOCNLX4uX+a8SwS/k06Wx33cOBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx368j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:37:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40185a630so261578585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750981075; x=1751585875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNGoQxfq9BmzRNrHBiOpebN0WGqD2gPosHFTzl27EH8=;
        b=bqD49vWf/uJffpjAja3SY/vQG/bvxyg1MvKZFhEC6QMemrjdP44X5Hqvgh+Pa9Ysc1
         s+E2m9aFu/997GcEZL5bnoKztJsPdt3dyJYeXt3ZUmugTqfgyd297RqAx6OSsFIldECw
         urge0oox/5whwxkWo0bSQDO2a2nutuNUyM6CvzgtbWbJ0NfgV/iFqE+Yod9jUS2MLHTU
         RIJq4ThBeIjpCCkUTQzQCVMGWIac0xi8dLMOuy2GxN5LRuJe8swKho5CC8IzIZHxaOQx
         VDADHi/+DnRvFdeRQ287hiEyxmP9A6JYxAlRh/mF+NHze5BrEK2Lbo0K80bpWnh3yJsJ
         R90g==
X-Forwarded-Encrypted: i=1; AJvYcCUM8GYWJYwR+T4IJDfHdeQQ9WjzC1lKEboVUwC/LbFD0K5L1m4CWtJ27cpBUqXs2CT1Whl7mDXVsY+P9cg=@vger.kernel.org
X-Gm-Message-State: AOJu0YybaozSdlmLDZE8a27HxXOwWH6rzxmjUrKbnDPLk5Ik4i+4Rrmq
	EBzq1JMFw+mox+ZpjGRUlriq1UamPJORy7pUu11O30mB5TcaF+3mME+120fOvw+gpwdWDB40Qxw
	V7lONXV46fXCelNfsNePQeSFXhtxo4VWn0woC6pBLFx0+VNCOWe31i+QBWIUL6v1LJ6/bh9OO/W
	6uUQ==
X-Gm-Gg: ASbGncs0QdLlsstHFL/hmRpifiZSmyFDbDlLnfo7BuYlBTZrSm9o0ZW2MuW/ys/K5OU
	SMlunNCI9I2WshApYiJ5SaL4ulOp/e/pDl73Ncc7Hq6olZWTxk7/5JcXmR+Bz5l5WwwIRUL4YKs
	ICt7n2aGFpGSVIqhfzD61QJRVUMdVw45EGYJfPO2zNhd3verbZxsj+2dBAbTvLKYkWL/ZUFYSOb
	xRSaPL8orh9X3cjiXfWlV7lAULAw6I4/rIooOh4iONxIdqvgEUOo8AuchIiDnJKG9e4Qf9XRG5N
	rHyz9WxHxDM4X5OG9lZuL/Vh0HwOQ+eaLZnRPf7Dstg8F2T61sJEmwaslj5sqoovc4S6opR850C
	wgnyQBj6XgLBQ9dl6MT2eoGHCS7MylvFUC1g=
X-Received: by 2002:a05:620a:1b9c:b0:7d3:f0a3:d91d with SMTP id af79cd13be357-7d443988248mr214252085a.52.1750981074917;
        Thu, 26 Jun 2025 16:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtdY9OETvGBAKYL+WWZHvWwuSqbMuPgwVoPJD7Cdt12Xn2UPw8ZnPr9A16Kk7BI7zL9BsGfg==
X-Received: by 2002:a05:620a:1b9c:b0:7d3:f0a3:d91d with SMTP id af79cd13be357-7d443988248mr214249485a.52.1750981074540;
        Thu, 26 Jun 2025 16:37:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2403edsm201771e87.14.2025.06.26.16.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:37:53 -0700 (PDT)
Date: Fri, 27 Jun 2025 02:37:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc support
Message-ID: <id45mfkotz7g5xyuoumlx7oqkprwfue34bmh3plefurvmznq5m@275kadhyh4ry>
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
 <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
 <3dd39700-4fa7-44e6-8893-b46c601d772c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dd39700-4fa7-44e6-8893-b46c601d772c@oss.qualcomm.com>
X-Proofpoint-GUID: ijahNqiAFrAkCcYyf0KMLcaWjsLQoEmv
X-Proofpoint-ORIG-GUID: ijahNqiAFrAkCcYyf0KMLcaWjsLQoEmv
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685dd9d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=-dTNQW8ulQ0M454dHoYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMyBTYWx0ZWRfX1CZFSMsW9C5+
 YT+nPY3ETekwWqbgscj7ACRJW+yX0P0F2s3VEntKSQPITHiZtRPmYd0v/rG7fKK2VVyjHwCetRf
 NeGTpjwEplPCkld8JGLbCoxc0K52AGuzPE93LmcklEv9o19xFEjB86Ac5JWlzgEjsK7D3S2RiLy
 gab1FMwJf2dm8EZBwXMIuDUbhK5jyjtbmIpMTqp1aq2mNhUBFTOWkDh3dqtquJp/U5cDtgQRVzM
 mV9dhXdjnp1s4ZIA5q890ojt1MgePDc3OHqKQjLVrGhEcfiPj9lpFbisI/pudidEGJerpWQiX9J
 80lqlnL+E6zgeH15+EHHQ/an60g1wE5o1XycSFEyLxycW77xX60gUMdbmwT/nAN9Cjzy/zr3Ovb
 vlGsbfC4olPEoNtRAHNFbsnKVU3wBe+Ns6gMzSFw9s9xmPNjNINMzG7kpkOnHIbY0lveoZl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260203

On Thu, Jun 26, 2025 at 09:20:28PM +0200, Konrad Dybcio wrote:
> On 6/25/25 11:15 AM, Luca Weiss wrote:
> > Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
> > WPSS.
> > 
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index b306f223127c452f8f2d85aa0fc98db2d684feae..6aae61dea8d0dbb9cf3ce84b9dbebb77b5aa1d52 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -1261,6 +1261,26 @@ static const struct adsp_data sdx55_mpss_resource = {
> >  	.ssctl_id = 0x22,
> >  };
> >  
> > +static const struct adsp_data sm7635_cdsp_resource = {
> > +	.crash_reason_smem = 601,
> > +	.firmware_name = "cdsp.mdt",
> > +	.dtb_firmware_name = "cdsp_dtb.mdt",
> 
> I wonder why we're not putting MBNs in here..

These should be .mbn, yes

-- 
With best wishes
Dmitry
