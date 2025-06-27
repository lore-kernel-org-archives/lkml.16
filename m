Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0AC2F1FEA
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750987734; cv=none; b=rzJ3hKG8d+Wura3/s7atzRspfIaZvqyHFmsXMGA54ZNBamBUprGNi/ANs5OxWiRQoZCEsPRuKPg3/YaG9KdiszOxGxiZRle+/nDP/kMpTX6gWAtj6G1A+y39HKawytPs+xHaD+1TxvdIbEidpfyEboawDuon3Nsz+DDFkVzVvNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750987734; c=relaxed/simple;
	bh=mLhzT0gbEINjxMyIEBcYQYBQbYT3gPLBbXmxqgDjbXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwNoLi+MVq1FWu0cNNeyp7Yt5BlnKbQfbIh2kMA0unImXovMQMQlIevw9DSzmFzsNjqe+rU7yPH6PmfLZZEjBy9RUPLV04mlFPz5RObJrRmS1BAAMxSRsmAVKiTJoJoL2/l0hCV5EC3fQz8tnA+JgTZhGlpp8YgfsKkRI8A3+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGiJoNa1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGiJoNa1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QHpVHL006382
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7BHttPaz4TxUNQzBLNE+418p
	FfXOu6+pWP6NmmNpoHo=; b=DGiJoNa1uPazrx+2KERUtSEAXuqt4lVnru3pvqJJ
	J2DFGQVD+8mf+Fl2GVyLhAKu35qYZb8sSEmA1WTSMo0Jt+paxrecMa9BzYPO2Wnm
	KYffpuY2cfCquGg9F5QyTYfsJwHHOucH5FURTX31/PKx8gYxn0BRN6Gp7mT7A/lr
	BLtWaRVfMJNeeERQNRTo3utljaZdI1nnWrGe/cs9btcI01h9BslyF+08y0hFXGKe
	THEzYiPVEtomHF/js31JRvJ927aFAn4gc/NwzgfNid+YfsElOPJc2pjMSfsq0avP
	G1UtWR4nTF2oGSSpQ2sGFu9qddblmKuJfXZMEBVXsbUFtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmxu06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:28:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38c5c3130so236991685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750987730; x=1751592530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BHttPaz4TxUNQzBLNE+418pFfXOu6+pWP6NmmNpoHo=;
        b=vzkyj+pxw/ZCcnksS6M+MPuCIQ8LBc0dgGBfbMCwr3Ft5UYi8R5Lx0N/1Ue6eXs3b+
         HenmmKR0GTkfsxluo2DeqP8v2bp7KLIwXrezUfgQ4a9KuSnnkplFxRQKlmvvKdudkPW5
         WuZyUw4LaYqy1Rs87oFITdXVdNnIYEuqJkTa8j0iWq54aHj7ja71RP3pjOpIFTxmwAqb
         z6X6C5tqnkobYx2WxxlhfcgY02fauCzfatjc40irG3Es76DGoQlL54wdSgw7GZnSEUNQ
         SviJAuNLKncIV7Ou+KWY4sculRk8OCz+DoMqU8cNb5MNBQd2+JZ/cZQojPJzTmArc5Y3
         A3mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTjAdwf3OCxn5zxP1WYlqL/QS8m/SHE20H2fs5sYqRg3xuqjM90SJROm5WpSzYWmfHH8sJIkLImYKPftA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8YdrI5RjLznfwlF5/ALeBvl3X7qKQbHQGtfKI3MksUVGhctpX
	+oiwnMKpe3pH5I+/cen795Oi96zlvpjxIFlbKQpAlQaydWSUGsSNiSWhlXImZZ0naFa1RWexfzU
	gXpl7v0kh2+Rml+VVf9qCxoYTQKtohp+x1n5GhwL31r91peZCawWbLdg6JUy9lZMaEd0=
X-Gm-Gg: ASbGncvll6xhZvLx/tTdMbLKSDul8jC7pMZLcSO9jdt2Ufk/lDpgK2MI0BhQn7I66sW
	KmzNhsOLa+QCD2zVFAzTvq0+Y5QTq0YdqKrV4ELti/gFVYR/k7oyZzjUb1irGvfUt4cjKgtqhPj
	Mk0G0mKWci4o01htzDystCWOzaXsmHgjk+ZU3iSE0ftCj0c+RHzot8hQM/7qnzBD7fr/BiwnuS2
	rYE4Wf7yM/lK7BXJN7s5PvdTZMpzipiHTy50l4SE2zpJaQ9Tpau8F4WqVrdXEsfjghk6SD+G5YF
	lXc9if4LdUT7nIHdZXYx8tIBmzMq3ed7+u3jelunt7LIQJfoSXekXUIPlM39y9/4V0uQMo1Qi3R
	iOk0XtlPwlelpSombUJDd2dUSj8JZd1ScNQo=
X-Received: by 2002:a05:620a:198a:b0:7d3:ed4d:f1ba with SMTP id af79cd13be357-7d4439b298dmr282410585a.49.1750987730515;
        Thu, 26 Jun 2025 18:28:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4mM93pJrmTOiGI3AS8mbJSAOrrA8+GDhMNzP/TNmnR49p+KAgomnY2oA+PJOFrHgpx9euiA==
X-Received: by 2002:a05:620a:198a:b0:7d3:ed4d:f1ba with SMTP id af79cd13be357-7d4439b298dmr282408685a.49.1750987730124;
        Thu, 26 Jun 2025 18:28:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ee85e9sm3688701fa.82.2025.06.26.18.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 18:28:49 -0700 (PDT)
Date: Fri, 27 Jun 2025 04:28:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add SM7635 interconnect provider
 driver
Message-ID: <2we5y3aimhhizbsr6rvhpvtfkzl35lvpqr5vlhpxzsdcjudlqb@iotpzxpksveq>
References: <20250625-sm7635-icc-v1-0-8b49200416b0@fairphone.com>
 <20250625-sm7635-icc-v1-2-8b49200416b0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-icc-v1-2-8b49200416b0@fairphone.com>
X-Proofpoint-GUID: m4ieOyVU8psW1YFXnHj9R1dhC_zTgdbF
X-Proofpoint-ORIG-GUID: m4ieOyVU8psW1YFXnHj9R1dhC_zTgdbF
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685df3d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=lAZXaacekHF5OtbiRAEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAxMCBTYWx0ZWRfX1uFUhAr7A3yw
 3IbfJrYuZ7gqfHlXUovIz49DhYZy3GCb5SU0P1YhGs2kFxPUFo6SJ30xVO22JjjsUekjyMpyMPg
 ymSTcANV/ilBY3FP+54q1fIuLSjft7BoQswzS+Un454/dEeD61N1YbqHAsdHvx8pOFQTiy03iuP
 WT6Czxc/GXMAuwNCgBXuZogrV5xQNS4+rsX9hFARcUu7w522hyD05LRYWBL4+6QCUcq0Jz/Gpot
 LcOSkzVFlSDfY0a2pVZNGE7Codb/aI6ct29RyTTn8K2v1HOqpCO++t7ENumj/CH5WmCx0usnyvZ
 IYBTc+s4XTN6EEqe87RtvLuPEfJIDhnUqMmDz2xMKUyr7Vdqz7gw6xp+2KIdbCzgR/YkPgwWVLB
 Xd0eIYQDjanuEsqx2By4EmFPR+WdOXeh8zU4NQBI9+BtvU+t8skUjeFkK7na36SqcfVh0ltP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270010

On Wed, Jun 25, 2025 at 11:13:48AM +0200, Luca Weiss wrote:
> Add driver for the Qualcomm interconnect buses found in SM7635 based
> platforms. The topology consists of several NoCs that are controlled by
> a remote processor that collects the aggregated bandwidth for each
> master-slave pairs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/sm7635.c | 1554 ++++++++++++++++++++++++++++++++++++
>  drivers/interconnect/qcom/sm7635.h |  130 +++
>  4 files changed, 1695 insertions(+)

Could you please use dynamic IDs? SA8775p driver has been converted
already and I've sent series converting the rest of the RPMh drivers to
dynamic ID allocation.

> 

-- 
With best wishes
Dmitry
