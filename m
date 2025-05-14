Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D5818DB2F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257340; cv=none; b=dDV/d2KP4V7ezDZyWH2g6WMesadm71W1ydauYFjWcQIEPJTp5ziXgSoFY2Qi/AiFS2fdSjyW/znncbLGpZiws+Ep2pLEATBDvdaXx2VT7c+I+UqmniZN4BTcF+2HARrq2p/WxfPivVNuoj9Rlk03I4MvjXhmjAV06ng3o9RiasA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257340; c=relaxed/simple;
	bh=qvjR2XXCGE2xNkWvFLZrOlDwVcZxNCldkgRm3IdHpgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2PxGCZvYk2ykxxrfkfOwpGRcervjLrk+MBpm7WS3niWSM2SnibZMc9qEhGvJfuZ8pvBQfesd2pKw1Yg6tVEtrUV/SpqbQTFHo9l4AbUjGi8LQdGJ7telReRt0a+x+EuT3WErobIItvlgFNkzP5krM2qy5u64A/VwC/BQ6EHAWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9fObCbc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9fObCbc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKqSDg025593
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CSgSL5tsy6KVjdqsenP3jEhW
	60sG6ohO+Dj54gdxcXA=; b=K9fObCbc9SloZ7AxXu1IgLDoCgJ2LSlgmEZ4PNhK
	+16XHDBk3w/Q8RZu9PCyDfqnYfR2enNvfsmLZzjhzW/W6f7HhMlJvz174jxDpB/f
	pWlFI5HeAwXQrRLjg7mDTn6OPbaMHQXad4agK1kAYAZTmYhGobiYSBEKXlqLH4On
	ANRQAHux1yfL5fL0VsMr1CUVc1Y05gtyITlefh9ITwFput7Grj5F/Xy6IG/8k3zv
	3QzfUGDOr8NE9zdmJY56cgpbYq9/nrRqPWHlY0ygEvOl9XUPQqWRP+NUu+uJNlSm
	iENpWPD4cXg9wZnuIASVIQyXju0TuU9Pb8o/DhrBAfX+yA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew41ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:15:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so61008985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257336; x=1747862136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSgSL5tsy6KVjdqsenP3jEhW60sG6ohO+Dj54gdxcXA=;
        b=gMrcN5f/236VG2RbO3qNev08z/8VG67wBTbAatexYFtPmH+/cpENbCfsHycilN38c5
         +JjKxigzl/jmppNZbj3aLrWHXmgIkBFes/01wDY39e+LH7hKYSs8E1IGIsK0e3/4srHF
         gP8B8Xfu4j9in/Tryf10Wg7RFa9gYAsezKZ4iit7e3kqS7F1lLoOln/lpWFygDkv4Qrt
         ruu9EcZu4cmH1qMsVFpOPARrb0mr+7lNRuJ0PyMjpeM1uyfeLOEveyI9Bkl5aAWIKzos
         A8ub5QvFeU/akSvxKXykR+M2/K2SS/SojKhoPCv1bqk5ztzWuZYTqVhgEElDqvrXuK1Y
         3kjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFxSYhlNtJQ/vLGCkKo9jDHKTjcWaVPpDv/RhHNcSkFDkPHvEVLjhcSMyzP8GwogS/W3iM36WC2pKAsWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAiJXOwJUHBCJ5afxSblcEV8lX/+SwqQPA67VIejxN9Gum8ugH
	ysGLjqNzXNu9exgzlLCfk4pGJvWrpy4MFJAopD5I0Xr0QRbsu8Wc/vl+AToMBUv+adgiizWbUSB
	66n98ptzzXAvTp/tggqYCtI/6YJZktEtIWiu909ZLzuAiYcUvXpc+nPUNbZEM66TrwzM=
X-Gm-Gg: ASbGncvv+AK30HudfgxyeXSYMA9OqcigiOXZ3Zi7E0t+WtHnBhiiNxcX2OovS1UdHpb
	syiDit9NQ2VblGaNNKtTHKGFJpQnu/QYI0ElboL3XhV1HU8uIhlrUOmyykpOxf9gNwY9YAEoizu
	MsQ4+ovV6O6U5hj76Aa5mH2sbDbTxoPr1sE3r8RTjRrdcNc+FVSB6mtnHou29rUhgXcfzzLZ/gr
	aywihzme/8wmd1OfZBSwyivgKKbwUTSuVvHJ8iepvHoooKyAD4oz5Nn39Fd55eY1byixX9TA/jh
	vm4Fc0lb9/6JXECzLvOcILGbt9qLuyAX0FBDolPGdq6/fO7OB10GLfeUQ8w8W45eZ9mzmJyGUPw
	=
X-Received: by 2002:a05:620a:1d0d:b0:7c9:230f:904a with SMTP id af79cd13be357-7cd39de2503mr208510085a.14.1747257335564;
        Wed, 14 May 2025 14:15:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF3yZJxhZiWN3ImsNfTVfdXkr/LJlPTcnXcAxIaHup0XQAdoj0fTfNGu52Ukiv4fTDl8MQUg==
X-Received: by 2002:a05:620a:1d0d:b0:7c9:230f:904a with SMTP id af79cd13be357-7cd39de2503mr208505085a.14.1747257335213;
        Wed, 14 May 2025 14:15:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cd303sm2398927e87.245.2025.05.14.14.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:15:32 -0700 (PDT)
Date: Thu, 15 May 2025 00:15:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
Message-ID: <oogbxu2uphyhknr4fjbc4ato6q7r2iermvxbqezyqd2xwamqtr@cddhw4kh6zzx>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
X-Proofpoint-GUID: v70n7IWzCWc2zE_cLXjQwzCZRYczw5nD
X-Proofpoint-ORIG-GUID: v70n7IWzCWc2zE_cLXjQwzCZRYczw5nD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5NiBTYWx0ZWRfX/p0PaNyPIxQ+
 XI8Xqz4rF1HVNbOdMIo+BcLEBKyWIN6AAzmIGzyDE1VjCckADeuYifDP1lzBkTtCp0/0FqjBCuA
 eKJBb8aeWTLj5iNR1nyjM42M9NUXMxIyQgUnBWRykfZXLHmArF8i6PYb7lEakLaudMOemctezSH
 Owu+hsqSkQUko+SS7/UwP+uVke8JmieamFeciuqyXUZi4+DpvNn5z0cWrJSNH7fAJhjQJc5jLEj
 8dcy4zh3tmBuHNn8SugW8eTGX8IGzkS5CQ1Xj4kyVFmLqKpmW95XSTnBqlBwUonZpm0q5rE7fG4
 DhsYMiwImOmsDCktrZitiBSmBrp6PFAlJgfEBk3A5WZAKb3DivAerg4vJuY1XZf7H1OPDQu+7n5
 c7izmZMDURBAlqjylni94kEbPuS7E3Ih8U0xhEyAh2tfQF8VOZvpqZ7ZGbzXZc6IG23z2CdE
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=682507f8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=SIHCAja6ksQgKCh-pUUA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140196

On Thu, May 15, 2025 at 12:38:47AM +0530, Jagadeesh Kona wrote:
> SC8280XP camcc only requires the MMCX power domain, unlike
> SM8450 camcc which will now support both MMCX and MXC power
> domains. Hence move SC8280XP camcc bindings from SM8450 to
> SA8775P camcc.

It requires MX for PLLs. I know that we were not modelling that
relationship beforehand, but maybe we should start doing that?

> SA8775P camcc doesn't support required-opps property currently
> but SC8280XP camcc need that property,  so add required-opps
> based on SC8280XP camcc conditional check in SA8775P camcc
> bindings.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,sa8775p-camcc.yaml     | 15 +++++++++++++++
>  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml      |  2 --
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
