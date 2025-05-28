Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF403BB44
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441747; cv=none; b=ZqfLaSPypx0BF2hyG3muCNKxzJX+eM/J9vAlyKviVq22P7WWKR3+WNRyoLU3npCztz8JgGXCRrFbz4Mnwtopl+3SV6EZrzQdEfCcnK6PmmkmJmcFRB9K+fiBmramfOryNBoy/VE3z9qeSHWHuIU2kPLvZGKuSv9h6VBQobo9wNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441747; c=relaxed/simple;
	bh=oH5seIgO7GikF7klnt9IfbiX24eWzPldETBsqQsbdgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jn5AlRR2duUpaqoJ2Vh3HECgADd1rc/MejV4Ue0raL8TeelFG45ZlRwCjx0JGInaU3j+g0RIq1JZuufA14gY4VEQoOs0ZVAwuS4KdMAL5S6ybhMZYlsZRoSSkfyIKqWBP0TWborlAEYDq+9oMSHyEE9W3GsofQnsnj6Ei/4+5PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHUtPla8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHUtPla8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6XKk1002117
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PKKIFVUFjBYMIYlOdCe4wRf/
	gEEm+3cc8dZgEMLxB3Y=; b=OHUtPla8m4LJ8EO6FaK2J/jO34HZo7XpCdeRqzZI
	+85e80eqy4DYaXc166F9v9bHMULmTJzO/vm3OT+ECGY1sF/rsa1sgCW0NkxW1KVX
	5hS9E8cAAlqLwAegGxNzciC5i6/CJyTSnIpWiX/vRhdnVcj+d1SrqxD94V56PrBP
	5if2AJG2tm5HBCF3/j6BQfNTJm3B87B7tQ//3qJstJotYnePjPhAMrxiPYLh3a5W
	MtDPDGkYf1t/4Ebb6GDZZS0hqn7plCK00DkYhu+Wq7jX1e0HxIZeB1fGQxM02tfM
	pZiITSdgaPzglE4bBiaXpe61OKXuSjQgwXxo1Gk6efO0QA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkv8c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:15:44 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dc8ab0ac67so79087055ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441743; x=1749046543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKKIFVUFjBYMIYlOdCe4wRf/gEEm+3cc8dZgEMLxB3Y=;
        b=vAR11XYT95ljFZetCbpGsntxiMqVwy+xbE49Pe5l7dqx3Ij4Vddts+p2JHkflE/xbl
         g7Dp3Z2kH6d69p+969GvmOuANw21U64rWDnyaGCL+quavSiDP525QFO47aUppF9Q9Gme
         0XMTujWm6ymVNExRGRCGXBRJBpwSIfQ70Z/n23lsp7R31Z9xhY07zl1Dt9ht4mhRkXUV
         QTzwjLx97bvq3dtJygNkofE1VBiMK/ltw+invglLoZv/70wDZPZ88BuPT7Z4tXEMqPDF
         MBpzP8ilwMY2BKJBJspUuLIv3FDy/MuUp+havALI7mQxUdPRGb+Xn8BnvwMcATaFzJiJ
         5x/w==
X-Forwarded-Encrypted: i=1; AJvYcCUJdK4lIO2NCji1DNV/pBTNmUQbkW6haaFgerqPgzAwDo1md13+avqMYYIbufN1UrlXgakSRRYhwJLiukY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNfUfOG6lifZ1lsSVtwpC+yJIOajytQDpCRykWqoCDIhGgFN2s
	Sj3TIP11vNOFlmes6QkhHY9UWLJmWDyWmqF+cEOP/KjwYkUtY5sJk5JBkWOksgrYTKKj4KTPquS
	FRIvmDMAKiSJV2jwMbStTpqPMeIStyVxUV2sQBt+lcdx0fQbKTYLXIWpiLn6Dl+0PIjI=
X-Gm-Gg: ASbGncsuRurd3O/KidVfIb6xIm0fZXRrL4eF0uTYwZWN4l85TjGtue9KpI96lR/alMw
	zn0x219CxekQcXh802G2K1W4ydzstP69AOBvwZP0kt2z2gbki1VP2wGDvZ2FmpsUrb6KWGw3Wr8
	1iIvmMVeAgB+q6603XRo4o+tF1ER80NoDEWTnAQQqBf9HEpFxdoZS+fg2/xtT1apNUDTya+dPbq
	khj/ihkBXQhJ8PgBo7muhMuO6IDHKUHh4aNhH7tmAPMIWfYbEI1tYg0BKo+wwLBHPVai8EibY8z
	o8zcPJ3J3+ihMGuBNQQxyy8OFKyJliY0Ue5UCrFhSX/fR2uj22uhBqPiPtq+qf7gJEO1qtSaTuM
	=
X-Received: by 2002:a05:6e02:1c0c:b0:3db:754c:63b with SMTP id e9e14a558f8ab-3dc9b6d3b48mr187418835ab.12.1748441736797;
        Wed, 28 May 2025 07:15:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO/qLKlIuHWvcnnRm0piuVuCFI+VpDYEPSMU6XOu9GU61UnMzyorzXe9JnyOOAIzHoUfmr3Q==
X-Received: by 2002:a05:6e02:1c0c:b0:3db:754c:63b with SMTP id e9e14a558f8ab-3dc9b6d3b48mr187412855ab.12.1748441732235;
        Wed, 28 May 2025 07:15:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a635sm297843e87.86.2025.05.28.07.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:15:31 -0700 (PDT)
Date: Wed, 28 May 2025 17:15:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 0/8] Reup: SM8350 and SC8280XP venus support
Message-ID: <d7gvn7awccrhg4ie2c3vicxpknqteo27rxnlh4lfsecobz2zpp@vpwug3qhufkk>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
 <it3njgklhnedjzojafuxpjy3o5zfulgdclweyobv7kjgtpjmzx@6opje7yms4yg>
 <1dd6e03d-09be-4853-741a-4fb47b7619a0@quicinc.com>
 <70891a99-d2ca-4fd3-a88d-2f66a9a78f66@kernel.org>
 <aDWZmJMIOVyzu1Lc@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDWZmJMIOVyzu1Lc@hovoldconsulting.com>
X-Proofpoint-GUID: j8K6mZk0xqFX5l18x5tXIS6FZWQ1TDdd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyNSBTYWx0ZWRfX6YBwuDep2d4s
 3h5ZaQlUZh9unRZR6nVpL8FP/9OdXQ8hqzAeQ7TI17tDhcBUyfYTZxjQbFq2WTZQkMNxY0F/mkX
 yEOXtGvl493nlXSJzEQ7mEa852qDru8RQtOpExB/K8GcqA4xMPeVOV4KS98P+P6gW7mAzQ01zbS
 Ww1wSYJ4olUWzzKlxYwX34S1L2H6t46DcKqsjqo4ZqpuHadlbmjXo5RLMWn7XFWpJDsszsatdV9
 Y15Z90tdHilywUgFT6fcJkNudY2DJsYIljeem+SzP16iEd6GKLMtIZfMmHMMTxltXjouj1lt8Fj
 nOcZSaBbBRxMZ1cwEPtVFTCq5KzqhUvpxGY6rFMq+rc4nikhWOEJmLPFHOG+sTbdqps2B7DXNY0
 l/uHoFMEdX1qB4kFXStQv8vEHZ2WyvKc/f3txp3A7cJ68oK8CciMZkUP7HDP9pPxhKxlPOcO
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68371a90 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=kLdZMHmJudiyi1bg_n4A:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-ORIG-GUID: j8K6mZk0xqFX5l18x5tXIS6FZWQ1TDdd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280125

On Tue, May 27, 2025 at 12:53:12PM +0200, Johan Hovold wrote:
> Hi Bryan,
> 
> On Fri, Apr 04, 2025 at 10:02:47AM +0100, Bryan O'Donoghue wrote:
> > On 04/04/2025 06:24, Vikash Garodia wrote:
> > >>> How different is this from sm8250 which is already enabled on iris driver ?
> > >> As far as I remember, SM8250 support in Iris did not reach
> > >> feature-parity yet. So in my opinion it is fine to add new platforms to
> > >> the Venus driver, that will later migrate to the Iris driver.
> > > I would say, from decoder side all codecs are there now on Iris. H264 merged,
> > > while h265 and VP9 dec are posted as RFC, there is one compliance failure which
> > > is under debug to post them as regular patches.
> > > If we are mainly looking for decode usecases, then we should be on Iris.
> > > Preference would be to stay on Iris, otherwise we would have that extra ask to
> > > port it later from venus to iris.
> > 
> > Right now venus represents 9/20 - 45% of the patches being churned for 
> > sc8280xp.
> > 
> > https://github.com/jhovold/linux/tree/wip/sc8280xp-6.14-rc7
> > 
> > This is a good debate to have, however my memory of what we collectively 
> > agreed both in public and private was to continue to merge new silicon 
> > <= HFI6XX into venus unless and until iris hit feature parity for HFI6XX 
> > and to continue with venus at that point for < HFI6XX.
> > 
> > So merging sc8280xp - HFI6XX is consistent with our agreement, the right 
> > thing to do for our users and a big win in terms of technical debt 
> > reduction.
> > 
> > I will post an update to this series ASAP.
> 
> It seems things may be moving again on the firmware front, so could you
> please respin this series so we can have video acceleration support for
> the X13s in 6.17?

And thanks to Mark, we indeed now have qcvss8280.mbn in linux-firmware.
It would be nice to get driver bits reposted and hopefully merged

-- 
With best wishes
Dmitry
