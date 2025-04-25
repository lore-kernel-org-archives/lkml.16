Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C537D1BD9E3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610092; cv=none; b=XIbuSR7M6OV5dSo8aN2Ha5ris/qa+Z9K2nUGhba6EE82+GRFaXScSOZWq0qlVEcnQRFg3d0Lwq3+4+elwIH36Cr8wh1f4OElxSvkvT6/f4CgHLuOpwRBvJvhLaRsLlUMTtYehWmia96qEIltcikrwp/xBfjBuU67n5dybw1Az2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610092; c=relaxed/simple;
	bh=GFu+i1orFNKNYqHrn4ARi1x5CfHjfv9YX4NAVMnrsN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRuKzbhNDJOCr/REltCZV8BOa5UDp652q02lYqcrzF4qVM2rM8tS3H4Re2yT7jyeIYS9YP/a/GJmfh4bxFXdkAjIkLb2z7eMZfk5Qo0TxmyFQd4iKOzWHTMLynPK4VG/AH6nClC3QI9Owgret3FE5s1ZJOevRDlqGVK6KrraTlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igVIqDtl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igVIqDtl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqfq031934
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GL3IxQbhqkxUKygiLbe+Fwsj
	kd3BgGNhLCaIxaMVpwQ=; b=igVIqDtlqvStpH+Ee+it7NLTTTa0+IeKzLD1wLbx
	MHwWda4yv4boL6lAWbdBSxyO414TigFiJ8XmHYSQv6ot55IcQr7t5biJ8ulue4ZR
	WwudKym85y7tLLx653GOgodNqZq6308tcQRnjjgCF04jG/+rSKSQ+oTXelNocw7u
	8Kmdmr7yHVvdCvAxvMrb0tKYzYTCUS4wXQ1azwTh/pg/5pTv0oCi3TweVEOE1XhD
	ugeZRUaa1QvOrChMc4iN6YK3hAfnGtRM39pDZMyS0fwzclCYmIBzcDGG4QKs8qFB
	O10b/WjPZ+VQuJ6AaRM6oevvsAsuToQ1WpMiAQXY9A6O0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya3ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:41:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c9255d5e8cso461261985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610088; x=1746214888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GL3IxQbhqkxUKygiLbe+Fwsjkd3BgGNhLCaIxaMVpwQ=;
        b=CZhhTXnfawn1ZM3tlnjhukkvFHW7M+a5roxclzkRefdGikVa8RNDJKYUnuikFMjQsW
         y08yeySTXjgZNBMc0X93nxycxzM2Cr7bviNeLHBunIxxUWx63ZA7t2q7osM+lRzf/q85
         XTL86QdcMUGZ043bF3kHBdRGIbqm7wpCUoY1VAvapXzEUimsFJkIwSnpMCIfSbk+zTFy
         W1eNSmNLWfE35wSAS/UMiUBIloBCE2hmCYdWFQpYYkNn1d8wad93MjVTtVqqIi+rIPV8
         ncGL7SwUx4/nH71d4M8Vr1SyKv6awQNAy9qVMm1hT2QMj4haIib79irXoMVqoXOptUn3
         iAeA==
X-Forwarded-Encrypted: i=1; AJvYcCXgqeEj+FZcLkPC9/oNTIqv30DQEXx1rQ2/W068/SKJhJC4wNoAv5P7AQqueODLWrCUoEE2eJRChTtIOrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUjLKBkPPe+YlQm44+W4lU9n5Y80Tnf5jlQlVvryhNeZ2XUQej
	o06Of7tGYeK8OHr24W6iATT/FBkAkIPcYRK9p+geUQxwhrPcoyfuM994HIai/6L54iqERZKvIfk
	uhqU86nAwA8v9CRKJVzX4jsbrxpx9twwW6/FXBmFr4Gg2JihAquxbZOJL6Az4Hg8FgGJolJ4=
X-Gm-Gg: ASbGncuVaE+dv5HzkbTy6y+RKGHVVecucQF+VFHWQBZUA3qkns76qx8nK695VyKLiAz
	rl3/3U8y7+TJ1IujxQvC+Y9GptxtAsxQ4/HiUgaoubX3BQOTXc5MeU4lphbZcNue3EwrwLP+4yq
	iQDWXkse4FNikqQdVPharadpk3peFr5qZByH5rVfQ81cINdvs9HxNNa+YUCstj7Ed8+Nh6iB3R3
	tscuVGEZV+DKkV4sHHd/yS3BRj7aYhPS+xMv1m1DNMiaHgzewzGBmWqKRJGpoNK0a78NL2rDbm7
	w/YKXuPy3Dfgojp9Pn0UI4+STnPdNbK1iW/t6cFx5uOc4Wx7J0wTx8H3zy0+ByKueV9DZn4df68
	=
X-Received: by 2002:a05:620a:24ca:b0:7c5:dfe6:222a with SMTP id af79cd13be357-7c960793e41mr547095585a.42.1745610088064;
        Fri, 25 Apr 2025 12:41:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9sXFC5qtgaAH+0BpznCYCLWqca8xyr5lGiw9XprZM90nD/EbobhyTqGKDtHjNqLHN2anmIQ==
X-Received: by 2002:a05:620a:24ca:b0:7c5:dfe6:222a with SMTP id af79cd13be357-7c960793e41mr547092485a.42.1745610087717;
        Fri, 25 Apr 2025 12:41:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8a03sm704272e87.259.2025.04.25.12.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:41:27 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:41:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: rework
 reg override handler
Message-ID: <q6zqfk3l2khp3tkodxd4pzhufiesyjcypl66zoqzslolwoveyo@ltrw2iulrkqs>
References: <20250416120201.244133-1-mitltlatltl@gmail.com>
 <20250416120201.244133-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120201.244133-3-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MCBTYWx0ZWRfX6MOtS6lVwIbX +1vrX4QcSyemmYdXKkHakK1K3EG/NeoVxOJiXnDvlHZlMQQ+IQY5OfgBHA5wXPkx/cL+cKSug92 b7p+yWB/nKipYKoY6ZuvxsrbgUXQbTQZAphpMcvZrxixLsjW6kxAjO2rXtGOIEPRoQOP8spzaMp
 kwHXgCA7CSZQ18apBMQKxEQMICvpO5Jo/72XYO2s7t7rrjrdkHorh/BDe+0WmKAuqa+4zZol0b4 E0NSex8YhY/gpRwfaYqYspKZ9eLX2r0FAITxZ8FDUuhrAEenyElSwti9uN9SAgroT023oUEHa3Q DE4kY/gAbwGvgW9BjyPY5QrsUDMFir57k3bzKMwIxNj43+MJBN5a668vzdK8wWPg+jgkGZe9z1o
 HtyvKmsSHXhr+FnO+JSwhYt5DWikU94mUPSTGGU2d1H2odjMYRWfr+yj2MWjL3hsz4Fk/fcb
X-Proofpoint-GUID: Snv9c1kSsCarTqQttEUugb7voszWoQOv
X-Proofpoint-ORIG-GUID: Snv9c1kSsCarTqQttEUugb7voszWoQOv
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680be569 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dnmzA44czj2E3hsaG-QA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=834 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250140

On Wed, Apr 16, 2025 at 08:02:01PM +0800, Pengyu Luo wrote:
> In downstream tree, many registers need to be overridden, it varies
> from devices and platforms, with these registers getting more, adding
> a handler for this is helpful.

It should be noted that previously all values were applied during _init
phase, before checking the status etc. Now the overrides are programmed
from the set_mode. Should you still program sane defaults at the init
stage too?

BTW, is there a real need to override those for the platform you are
working on? Could you please provide some details, maybe in the cover
letter.

> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 105 +++++++++++++++---
>  1 file changed, 92 insertions(+), 13 deletions(-)

-- 
With best wishes
Dmitry
