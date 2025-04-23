Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476C01A9B3D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416503; cv=none; b=M6KlJUnnTVkTTRBSQuVnUa3S/8fVwxZ9/fW8AJTaZsptrNFgp3mHUWF/FrFl17V7ab4JbpOwAjstaZ1l+5KvnsD4BrYnP4iEMAX6AqeG00PUP9/BtbREDJ7Ohv7bxyBXcV4ATyg/CDeEcKNHo8drtmY+DFbcuSQ99hQqUtEOySw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416503; c=relaxed/simple;
	bh=k62o+ay2M0IbQRNfbp10YC+dWMBh5vmDDp0amjZHXxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WN6EMiZzFbFIY5SR1GB1Jz1mAdwanx4UO6Lgoyx3OVNZBdayW+jDcYpT5w1y3Tmr7PskOAoAiwtWVcjCqYIx9ttaCBYpEjepyQYx/kdghQW5CJ+aTaMmbjpiA7P1Xoc1zgb6iec84Pxd9LZ3nr+W+Jpgqkz5T+hIFKO+zX8zxFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mhe/JN8p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mhe/JN8p"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NALFkQ014799
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ch6JIJp6fDzsw1vuIJ2eZ7S5
	WCWU4GzfWZUvcdjbWkA=; b=Mhe/JN8pCtR+E92A8mMd4EhXFKMkh2kZiPy+dN0q
	Mt0QhakfGp0lFBe5ucWHN9RoxBj7DMIYf2b9je+98CsBB7qHlVV8+GCtTX5TPivh
	25f9FZ6nTPnG5fGN1gjA7fugN1lsoo/LZe61BL3aUyckyq5zeuZ4afmCO11lgeIT
	wQpKADPDvbsWamqduJw0k41OZdiXrFVtMZJZr8Gk5E1kJdiQLRpfPT5Sdbh6w6dW
	EHrQNryfSL6ukFxcGoNw97aNpQSlMK3LVTxpUfFrqHU52WvrzcMqlJSR56q+Kkv2
	hCT7Gyvu6nSAJ6FBlyr7eKNBj5LHMzSU+njlPslSKdomrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0ja5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:55:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0b0cf53f3so959598385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416499; x=1746021299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch6JIJp6fDzsw1vuIJ2eZ7S5WCWU4GzfWZUvcdjbWkA=;
        b=b5XONqv2qLp17SczDc9ufn8f/ccFes90ggoVhKRiP2fxGobULo1LimG6qT1y5IHMe6
         trak+eSaOTGWQrlx0QI2CG9xBnJrbaQE4e5KOK6au3bQwc5iarZqoP2Wz3yaFuZzxZ/V
         vN+LcByGs4OSxX5ehoCLXdKJAZ/l/bCcPFF5u7tQ1G0gWi8lHnZuXcUTRGCKZwCSm8tV
         xOBh1O1VZiAumrCl/xFS7RGKYVyLLL9gIuTdHCrAEOkDOJzksdNnSAAERgMy1gDoqGAa
         x49hDStZvqLsnlWxNLjVwMrsnAK+XONoDR/wN+cFCVt+1+05fSeBdh5epJTPtNzqCdY2
         pTKg==
X-Forwarded-Encrypted: i=1; AJvYcCUZaUg8KJZTaOdNRDkCU9160kOTTnghyPF8FTqLeq/FOtX+jzUZooPBFqwMLml5j1rav5d3MnqQZiW45Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhhprxQ6nXX/New7vQdfqJ/8Y+y04mJu5m70yqo518/dbW7xT6
	HqHyb2RuNWuqavC0qYZFkHNiwNx8z8hBZNmCEzrMLTtdPCRtGQexMXJ/8cy4RjTsfpawelzrBn9
	iQvDyMiT1ZVqcp2JDrXrgZuMOetS3ZrGO3K8b7JDL8sZrEUae8I1m6r6Uqdlz7sU=
X-Gm-Gg: ASbGncumj+PvwS6wskk9imgmBFSFDqAXM5woUtifbETvv0jZorsdrl6Y9dAG5Z+cSgV
	y7elv4L2TU/+oOwEdUAGn/RU+9shwgoAK7DTSu9zl3/KJEuEjZh21JNFvhZx9QmmuOgdY1QtXnB
	15fdmHL49rYP327WimuG+3uZNprnGnIKHPtVn/MdQ/ZY54bdSU7R7Tic5zOViyLTz0CozdOIWpl
	tHRZIoCGAbvU6/yrEjKbKU/rMmj33L3/aWdXeU7iuzC8v8jFDMQKHsSQVebxDWEtixBpPtCPgBA
	nB91NnktyVy6K6UM7MIwcfMa8SkWTSlIkPvUQazY9QItErhf6mA/Qia0GIFruTOvh4LdooLRWns
	=
X-Received: by 2002:a05:620a:1a1f:b0:7c5:642f:b22c with SMTP id af79cd13be357-7c927f99563mr2964406485a.20.1745416499211;
        Wed, 23 Apr 2025 06:54:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCYGAKdZu53by47MDLIJhd7FQhQZJw0CY/lsfFM4Rh7noGH96BnMs9HrnTEVjA/8jZt7RYLA==
X-Received: by 2002:a05:620a:1a1f:b0:7c5:642f:b22c with SMTP id af79cd13be357-7c927f99563mr2964401385a.20.1745416498738;
        Wed, 23 Apr 2025 06:54:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907844f3sm18420431fa.38.2025.04.23.06.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:54:58 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:54:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: camcc-sc8180x: Add SC8180X camera clock
 controller driver
Message-ID: <xlueboano26kjqkukhdmealdkzdpxdde57w6v5r4rjegydce35@i3e77s54t6yt>
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-2-691614d13f06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-sc8180x-camcc-support-v1-2-691614d13f06@quicinc.com>
X-Proofpoint-ORIG-GUID: QwkZQh206aNiWbJ0ThywVHzomXlPsDn7
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=6808f134 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TIlaLBFy8nvcEV5Zc5gA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QwkZQh206aNiWbJ0ThywVHzomXlPsDn7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NyBTYWx0ZWRfX4qUU1JfwZH0M CmMj8mq+X8RZPf6WLxWOgvEAJ+vpZ7DeI8vmZSJh2ynMFvr1Y2TfZnBv6eWyCRrBihpmk3ZuZUX doiscQe7Z9QkUQqVpJFosWZ/l+3WL09aTcPY7OSnLUblAnwww7db3DHJUkEFZCZDEQ/eyLCp5J/
 m4Te3TfJXmnWvbIk9CQ9TaKQfZag6xNHQezHTpUjx7a8uDXorZiYPm4LostlDdBjfjQ6h9W7cK3 Sp54zc34l4QG7V5lg+ZUd8YR5R5A8EWyb0jgqei90mcHg6vdNe2Q4K2UYWZn9aIXuhYso/yUEqp 7BhuxmOA3B34cnXJhiMKoyToLbVc5DTeECOgJRb5O6AfxPfQw5HRoqMIsd5JENpbKEcXC8IDn7g
 1BxSotU/3kgzNNpd1RxG7GCd3ir30DvxyfHWHrPykKfd/UYMMlUOonv4zyTgbSmkh0bleTXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=869 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230097

On Tue, Apr 22, 2025 at 11:12:11AM +0530, Satya Priya Kakitapalli wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig         |   10 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/camcc-sc8180x.c | 2896 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2907 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
