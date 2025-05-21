Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C419A233728
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832141; cv=none; b=aSrq6fPlRvVEPzSQkB7qysO0sfiOsI+uUz8/UeC5F/3l9g+MdcffTCuaTeLbXe8/If1WRPltxV/mxmQTtwHfXbcuGvvpKv3gEbAWPhozYhYi4jVmboNNn9vLcNEg5/BD9BwQvVnUAyXtxubfXemQzGC5sKxtDLC80YLq9dqDd70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832141; c=relaxed/simple;
	bh=dVeZTI4ANbqPLAk7vVWJmaDi/wWRegogvggZf25+oHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGxk9V1nc95nlvPNnDWNyGtmRt81veKzRmBMntJQ0Ud7E+Px0wjXVnZb8y0W48BuH7fYkwbuwABR1gwTWbqYzYC083VAEzbLgxbn9xm3m/5FFSRCrT05lOuUgIaNgBQ2/IZ5vcsB2IkDjWu4MSLP0e1GxF2ygh4AM4Bh2jvJ7C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6mhUKxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6mhUKxj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XMtU024821
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tKAI9l5PcEf+JViDHozLfx+m
	cavirtg/fHrR9QMjeUg=; b=B6mhUKxjNiWAT2SIGHmJSbed8rrI9GnViY9sOxL+
	P/qwXOBNs24WmwfB4nzJKWEPwObfS4HTDUnRujmp+62oyZQr4nX8uU8ZeLfWM/kZ
	z7R7wCWJ3AeQD3maH0eXGoHv1TFh5jPrkLGUEfUQc3p7gNKyuMxJzD3XmkkWRiJe
	VhML6sQi64wWy+erx8W8ZEOxqTtIQyr1RJt510jbvYBcC/etTaMGXLXvwtC7gA4Z
	7x6muuLAs6ZLm+H43FPJPPALjIZC+AS1JYwKG8FskB7O1FfqDY5OGEgaeaQbNlwB
	rDJ2bloDodKZNV/gXHdCi0x89jqxUz9SUFSWJb0tOVTlfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4txr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:55:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5750ca8b2so1000006185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832138; x=1748436938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKAI9l5PcEf+JViDHozLfx+mcavirtg/fHrR9QMjeUg=;
        b=YdL4WnjSDY+sJKVErvCG7Uh6ZE14Pf+3xAlOXSyzjyGChcDmhCCG2H5I01Ptd+nlUQ
         T9EiefCECVTmQWkiqzuSi6vt1KUm+mHk5+waEEgcbojwoDp61ByaFpZm6IksmYwc8aUm
         70VixctI8DzqemYsrLwShfsUtjpPSGZuxwdlJ4eAAcq48HfRzRUFlQiURDsL6Hb1GYQR
         vCaW24bN0AIrVQ0SfSGS3wrOypISUNzcuCBSZLrw7VjLDzWehoImbRkx4kgHiHNz28bI
         OK6Mtw5rfR1Rr6bEIuQPs4gvhnUSpkJzxtVgDGt4hTlS7UsH0gIGNDgac+dfnLPsg1Q/
         cQiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPaw2xXotmDkE1E2hVrSVK7xQx8IDpwhFrqMj838MYHI1bSXfTbGKxbUFBub7fd1yj8R0Qh+YlIwCTyO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX/mmrI5ecOKSOLrxm6oZKl5yp5jfTc4+xlZHHvdPbrJt9E2xN
	2uY/MP3XOMpHKcTaMIVNyP34B91LwbVbFKKD3XDxhJLxwyRGAQfIXgEP5all/QHvjEPzeyq5Ndy
	zD2qfvzIT58uFcGXLd5lxC4lbBBUqch3r0V/O0sb2Mk7b+rxPV6ljodIxZnyGGZ+/boM=
X-Gm-Gg: ASbGnctw1v4ch91XyowxSjZXxCISyT5wx/jGPXuvWNDAIvD6NWe2R1YIU+/Bkin4NkJ
	vF1HL8yIPZqzWCZpuXuPR9MSd0AF/w4gYUTtfcvlJHQsaTv0Umzs8epvzwcFIUK/Z4/M2s/JFg9
	JEuz/vBt6Dm83wfpeCVvm9VnLgFjs0+N4cr5G3gc9qPxYjKVDIkPulnQYavnyM/BnrmS21cacUd
	Upcydk8ii5Jgioxt3bUv9KM/werCjTBpy2AQDLfXpNJZjd//wjysm+5r/XQT5alE7/5iXOl9DNf
	0N/JhC4U2MJOEQ6PYrmMUjKgtfYTXVeIGVPcfl4Vj48PnPnciZCG6n/9ctT8qwW/q/SEGKcefLs
	=
X-Received: by 2002:a05:620a:1923:b0:7c8:39ea:5166 with SMTP id af79cd13be357-7cd467af417mr3368958685a.55.1747832137723;
        Wed, 21 May 2025 05:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsRCeRgD/B3Foav4M0OQSyuJeHudoVNith0RuRKrEcTmsJP5u3ejyMw9gC+t0sd3ETrAbsPA==
X-Received: by 2002:a05:620a:1923:b0:7c8:39ea:5166 with SMTP id af79cd13be357-7cd467af417mr3368953685a.55.1747832137265;
        Wed, 21 May 2025 05:55:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70406edsm2864319e87.258.2025.05.21.05.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:55:36 -0700 (PDT)
Date: Wed, 21 May 2025 15:55:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_narepall@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
Message-ID: <ehgjdszjr34xppmkrkicb4pnq326nor26tqu2ekop6ew2j3y3h@pm45aiipzuc5>
References: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
 <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq>
 <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com>
 <CAA8EJpoLLDXFQk-ViuaioKrECzMV0aUrcOj4v+Ufs4oHY53mrw@mail.gmail.com>
 <064d3eed-c2ea-4b41-85b2-d2a5a922f8c7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <064d3eed-c2ea-4b41-85b2-d2a5a922f8c7@quicinc.com>
X-Proofpoint-GUID: Aakmh8sCXJVpPTIws4JUpR2qq-uVztsS
X-Proofpoint-ORIG-GUID: Aakmh8sCXJVpPTIws4JUpR2qq-uVztsS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNSBTYWx0ZWRfXwIo2hxLWDRuT
 OMS1ONTHrnbBOg65COvEy0YD0Yh8ckTYUrCmkU2NwK4r606GFVmAEX6v7w4Q+az7ERHUYgAx5hj
 +bFnYrPmzJWglbrFVhk3r/IQYEV1erOL/NE1g6pybADYXnNR49+vj2Vk87gv7HrpidFk/5HADkt
 CdA1kVSSD2IgcC5CDPwft6iSOLoIW+UB4jyILGH/37L+QSzZ8VEaIa+ENWrnD7e6imaU6qM/ZFL
 nbby24gtGgFD6B41atIjVIbHN+j95m0j3HsMuBNpjYJXggoOOmBL9VbtPH2hDdPQVRoZa2gNldo
 +G3qsFMfLeiHwrk9eYa52StJ1vIdoZXppcyfJ6a67nw8D1oPNSAzr5M3y/tI6gjsXiio07tFK/4
 byN4/ty0nbrWntR80TbbnJ6MctbHK3tsZSDk1C6eai92sahKtR/I1tapQ/XFGKNjubCu1PAu
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682dcd4a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=4I_ifG8pwFw1aE3i0MYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210125

On Wed, May 21, 2025 at 12:46:49PM +0530, Sarthak Garg wrote:
> 
> 
> On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
> > On Fri, 15 Nov 2024 at 12:23, Sarthak Garg <quic_sartgarg@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
> > > > > Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
> > > > > This enables runtime PM for eMMC/SD card.
> > > > 
> > > > Could you please mention, which platforms were tested with this patch?
> > > > Note, upstream kernel supports a lot of platforms, including MSM8974, I
> > > > think the oldest one, which uses SDHCI.
> > > > 
> > > 
> > > This was tested with qdu1000 platform.
> > 
> > Are you sure that it won't break other platforms?
> > 
> 
> Thanks for your valuable comment.
> I am not sure about the older platforms so to avoid issues on older
> platforms we can enable this for all SDCC version 5.0 targets ?

No, there are still a lot of platforms. Either explain why this is
required for all v5 platforms (and won't break those) or find some other
way, e.g. limit the change to QDU1000, explaining why it is _not_
applicable to other platforms.

-- 
With best wishes
Dmitry
