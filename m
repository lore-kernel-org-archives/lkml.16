Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C62820C8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543863; cv=none; b=sTOnL/jqgQ1BiJyRpxK2jiB3NtlJgCATUi7U+l2FYKmMCC+o2TlI4YQ1stpGXdhlKUUsrwlAMhIclSsE5Re3i6r2dO4lPM5+NRPshK63IEIY0RVNa7HVghejVJmzhNk64O2l9TXX81uj33VjWcpr99HYcx6TQrHvH9lakvfh05w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543863; c=relaxed/simple;
	bh=ILI1+nwSZM4+Hy55FKo6eSUQ8cHxKvK9T5wiE7/VuMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYbXSZ3/rDtTWN498Os2f3ii1+7lkEIT+aFjvfbhAdxCgTrDoNeGFgHznJMWpv8SK+sGcHnap6YBf5hlwUvdR/aG8y2bQHnbJoLwipPFqn1o2ImDDhmDirM+LPrG/9i+iGTnndKN+7vHi/09ZDd0ZbISb1numXncTeLdE376oRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhjRt09Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhjRt09Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559KPJOR018492
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nfQulKshIbOX1jA5bT+aOGyW
	1xi4H37s4R8qQsbLSqc=; b=GhjRt09Q08hUFPIYGEqcaepY0iDSLIDTas4FMMFH
	d18mgT4Dg0CLhe5ijOqmnkJQz+znH4utxJOdffFX9+7H5HDJTpE0DNO8rEXCSxrs
	22qNTtZUe2SVg7FaDwVajp37wF4luiBiPPs9UKl1mrFiYdnPkYhHItKsbK+5DLqC
	QCKr9woxMM19e96UOtT/uSpf7qvVjJUZ/4i4A71i4Y74lg13p1FObwIT+BZxcNHi
	8jHhS3AZoSZPKOJ4F5Sc3fxDgY5nwLjDfTCCjycxcddDBym0OJ9RelXYgUr/zSxX
	SQ1EdzgktaGEaFHhTWIj2XFQiDb1zXptcYPnxqWmf3MHVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mchdta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:24:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cf6c53390eso491512185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543860; x=1750148660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfQulKshIbOX1jA5bT+aOGyW1xi4H37s4R8qQsbLSqc=;
        b=lUWI1xhmtyPuEp8X7man10I4EJQivWnnjw/xmbMvWsHwvxQKLSqX1sMccqq9KdKR3Z
         9TIr4+Jg2M0dgIjsKAQzEO40ewEoRwkZ+lMtZwRyXZsi377vT04FtH9yOVLVBojlPnXl
         Pw3Z6SgJ59nSh7OzSvMASEcwyHPBq3cYlQrGx1s0cLHqeIvTO/Cyvgy3lkdNH/rnQGXQ
         OdEdcf1i8KqS9wBjYGb+tiK6E9/9ag4wSKJIfs48tm4zHtjXBwtIzoO0ak9ls5fDuhft
         HuczgzZgLRI8mSrF8UUHMHp64+rAZoscAy46Ti70COuvX9SRBCHOt2guV/4b6S2wGKBI
         UQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCU0E45sDIyJKTG+rLhLG1ARPs0GOJseTEpJvZct4CbsvZ7zoHBhTW0W3yyOT7fJdOb5E9Myq0W5lGxTR7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ4DakfN+t/yjZUBSoe6OYzo4+N4n3wcocavjGOh5j6e1zdPoM
	HM1iV4AzZezf6SHLd9jAgeyDWJ5Q9mNllxQgy/5QAKfzymhF6iX6kz+OaE4fAcedsuXQ4A4wODg
	s3eg9SY3KS3T8ov4bIPrEi1RcLTBP5ISi1HmxXjsbeOmIOmVO8LOuhkORjSR/Iau/XpQ=
X-Gm-Gg: ASbGncvcpYzBiUoOYb1ZfWZq+4+PYNiaUsYxKc6nEmXrdSsKjUot4BDVV8AFG0iwTNv
	Zt7ZGFrr+f486rRzj0pTMAWnTCy9ZrGsIK1emaTkCPId4Tk5I63rZOp9F35AWCkYB9907o6FGrj
	BSaTNBLUX4u4WXv/SSg7BIElM36kx5xqbVMI/G13dIeYwS7kkLrd+RgyZop0KmKBngLdLsPP9AW
	ns0GfYSOfdDghDAD8o4KITy9yTYhCX5zfos7gDsLWe+JrFMc9oSJTS5gZ05FoUXcAHbL5oy5whO
	Gzkxykn4i8vy+xnYKlDgxJLMkrUdchIY+AyNUnGGXHy/IaydkRkf0M0TQvx1O+Y372grRJS/6XK
	Ns71X89JCtV6uuqT+zQsdTS3XWZhmc13tta0=
X-Received: by 2002:a05:620a:1727:b0:7c5:a463:397b with SMTP id af79cd13be357-7d22995f007mr2469057585a.20.1749543859898;
        Tue, 10 Jun 2025 01:24:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL9F5jqdq84IGa3cZa63QXPXnbFFEc0ZrAe1i+Kt381luyBdFVVtmeQ9rls0die/0j0iLbxw==
X-Received: by 2002:a05:620a:1727:b0:7c5:a463:397b with SMTP id af79cd13be357-7d22995f007mr2469054085a.20.1749543859459;
        Tue, 10 Jun 2025 01:24:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731929sm1460896e87.227.2025.06.10.01.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:24:18 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:24:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: enable
 sensors DSP
Message-ID: <20250610082414.6pfpgqmvdyv3mrnb@umbar.lan>
References: <20250608-c630-slpi-v1-1-72210249e37e@oss.qualcomm.com>
 <e1367b38-875f-4a9f-9dab-9aa9f12488af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1367b38-875f-4a9f-9dab-9aa9f12488af@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6847ebb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_eEkAOlJaxbSRMKEyDoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: X1dx-QwGdpDG8AGHRGyUIw4jSux9e9yu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA2MyBTYWx0ZWRfX0bq9xE829xkO
 8qNtykk0HcdfNADbY9ySRhQXp8cxbw8VuOukZb0sFe1drhApgK938wwP/W7WoGXpCNK71WIK2BL
 i+Uk/QQE4R8VB5rY1k+Iyo4qMSOb1Xt/rrBtUQyeFS15S77UEkBpY0heqe7vn7OErRhNfbrs/zn
 E5GK2PZIJ/hb8YKtLsjKDUPI62z7O6Dvr9hlCnm/g/P70ynZF1Nv1bESqtK3iZEQXKDs+nTobgI
 3DDJsYQK5JXNTgzkf1ZZi2Q683XmIkgcE6NuOhoeEAU477oKHZdMR6P9HAy0ZranTRGFuWIfV+k
 BLzmiqnQXc96J/y0s1XFSmfpTfY4icnyRAIV+2YrFCWoE8iOK/9EyXO5P3xHb7WReViCva1uxx/
 e5iZwhQkVt4S00EfSawB/wQZuFEfbsSdzfzlEPJVpfGD9DccEceHrksa7lFVbnOdwuDf75jx
X-Proofpoint-GUID: X1dx-QwGdpDG8AGHRGyUIw4jSux9e9yu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=538 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100063

On Tue, Jun 10, 2025 at 02:25:28AM +0200, Konrad Dybcio wrote:
> On 6/8/25 6:02 PM, Dmitry Baryshkov wrote:
> > Enable SLPI, Sensors DSP on the Lenovo Yoga C630. The DSP boots the
> > firmware and provides QMI services, however it is of limited
> > functionality due to the missing fastrpc_shell_1 binary.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Check if the Flex 5G's signing key is different (or maybe Lenovo
> had more sdm850 models?)

Flex5G is SC8180X, so it probably won't help.

Also, if we check the later generations (e.g. Slim7x and T14s),
different laptop models use different CAs.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
