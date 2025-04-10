Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5814E202F70
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315426; cv=none; b=CU0A4C/Q8jykcrAg3MU+vtcyzeoLZROKfo7q8O/2wQ6z3ujcOj5FKqTdvzNTJ9OWrhakT/AjbO1h/xbJGQNXycUDbFQKXx/edIMrufClScjuidepH7djj4fqcgpMkDhdKW08m3bRYcIyPeeWKNuzRoENhY6HxH2IL7zOMTJPj1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315426; c=relaxed/simple;
	bh=NWcPs9dJlr4e72gBYoopMHmE1Hy8Lc7icWGwbBWFask=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzvJGFWZ2RO+QLPAGlF294tYuGWQIJ/++ik7aC/o/iiKp3lIg0SNFkV6oAprZIU0hgFQmsYC53ZrhW2by3lhtVDVTkiHD06dd65oEPDh7C9moCtKfVHgqgEiJugPvB7ImmHnTJRF5trQ+w0QY1WQIQ2+V+bxZBZWcZZHfTRS4x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnkCpYic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnkCpYic"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFwvIR018376
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kkt93pGWQtZDGdDcKrtGNfoL
	msIHhPGO8JKGQOAKQVU=; b=nnkCpYiccI/XZjH9JnufUDAcgWqucI6WANSAKpot
	zfLpHaFRrCKNPYrkkwYY78e2LSADXdP8ovU6GqRAV1b/bNpwbN1sK7KGCjz/GIJ/
	QC0oR5i5XL83I20E+ZtyA3tIDx41jz493ieotQMaRV1Y8LWepaE32Li2vJIe5IfS
	An0TDqG2VwIC75eyfO/Br23b+yykzJkGMxzvm1EbVGvPW25IseKJClBMjjBV7CGB
	xPgXo1P8MQuFq3rbU4UKaH0/tKhKtctdAc1TmRr16Zna6u5o6/Ow7ZMOsiGwWw8J
	NpwNk/61jFYbDvjXsJzG/5r4UhvqBRTc3bhwfKt6St5roA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb8ajw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:03:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so264988585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315422; x=1744920222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kkt93pGWQtZDGdDcKrtGNfoLmsIHhPGO8JKGQOAKQVU=;
        b=PdH4b9AM1jlc1OmcrxjUPO1uikNM1HGPT7XtHMpNYk3mFPI4AcOw8R0HwU7pxtQWDr
         RLIn+QeB7PdPNlbtCZdcXtLgKGSxdKvfaalIMaORgNK2WbQ3alpGjwdKZqcFbkts+f3y
         aAMiJK9hNtoaLmQxvZ0wvrBD6T8x1T7MIp5k7OndyOjTsNaHUteG3aBnGXILu4zJCK6y
         f/M31ccC7JOiC0vyD4tjN8E24CXzC8fnX5FeC9IjHX0AjsjNUcP5Y4SfgA8Jx5lv7DTr
         vrd2M5X3Q/QeGZRjXOOYM5JRBoUxocGujLqYl0NqFlKKUUtBXpDk6ruTCmsyUZ+QISUX
         ComQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+uYrGEgAu6Q1ITrVLYUaduvi0QQv4VWUN/YHVdhmaOCEsy7gZoa7oKt+ZJLY8/CJkwYjQfsoib7pUS8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwexZjeXk5KcgIfPB/azNQ1UKAGd5wdo6j8EZfEs0/HwFDB9Mz
	f90tZY4EusFBby5wnTFdO9Pey6/7Rm/1CWYk2olXxk1bI9Oe0neCcz4u18h1i88hBCYLPmqTcHt
	2TxSkGRf+0sQS8SZcW/d+VlxNRQxv5hIgzpV6cMdb7kHj0yo6eDS5VNRX5/qnzfw=
X-Gm-Gg: ASbGncu8eM4AvmU40NItl1Je8Z1wkjrW0kWEolXTwL6fSHGG0xeyQey97MhiUXyEva/
	d6+Qx/j0vM+GBXEta91sYqeuq1//ZEQ9MdumTbhFXVmaMFsLwNvE0kbev5vS2SMKRNEwBkzWrgX
	pU7Utax1pX6tPbhcYA8w0uXhilI3bOU1CNeFWV36NbufomA0PwJOccP+L2dpBape57f6vIlSTwz
	tjpBYeJry4FqC5bHIpC+XVKC44hW8qBSfqWidfWHU7VwOKumJhR96oNj0A/MXnDZq9BSoYKe3Kv
	PCkS+AFs4yQSYUiI8hZsmT6duhXGCK9CIt5HydHImwJEdL4bjrZNWegpTy5Ta4Pt7cpWxZvse0w
	=
X-Received: by 2002:a05:620a:31a5:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c7af1cab68mr44907085a.40.1744315422245;
        Thu, 10 Apr 2025 13:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErzArwpma2b275ZwbVv4rcYzwYFQlldzDqMMZoZrFpYHV1BBbany2XaU1T708C9/2OcW/Hcw==
X-Received: by 2002:a05:620a:31a5:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c7af1cab68mr44902485a.40.1744315421903;
        Thu, 10 Apr 2025 13:03:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d234204sm233356e87.54.2025.04.10.13.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:03:41 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:03:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/6] pinctrl: qcom: use new GPIO line value setter
 callbacks
Message-ID: <cpgwcuj3msm244x3ivchkhrvdwzpd7dzre4gbbpcskjxkuduyj@ioazb45ybzc6>
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
X-Proofpoint-GUID: 0hLUFjOyrbkBGiyAZ9mYFwMQ797CmkZM
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f8241f cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zO7X93q5r17TlLPyEqMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0hLUFjOyrbkBGiyAZ9mYFwMQ797CmkZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=553 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100145

On Thu, Apr 10, 2025 at 11:34:42AM +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. Convert all
> Qualcomm pinctrl drivers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (6):
>       pinctrl: qcom: lpass-lpi: use new GPIO line value setter callbacks
>       pinctrl: qcom: msm: use new GPIO line value setter callbacks
>       pinctrl: qcom: spmi-gpio: use new GPIO line value setter callbacks
>       pinctrl: qcom: spmi-mpp: use new GPIO line value setter callbacks
>       pinctrl: qcom: ssbi-gpio: use new GPIO line value setter callbacks
>       pinctrl: qcom: ssbi-mpp: use new GPIO line value setter callbacks

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
