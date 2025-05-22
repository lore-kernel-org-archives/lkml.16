Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0F72882C6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940960; cv=none; b=JWB+Yp+0dt68NDVBYq+kfB/XHegOaNThcq+P3ZBxmLfTTbjrEkobKqMvOJg1hoE1mfGEuV6UBouxyE6m8c1ZlMIT6x2kqLR59fYgnGRd2RRJdabuFqspvftg1m5ahpv0gpdm2f6bYXHCdgJmwKLDAA9EfZ2QJV/Nh49BylWXPPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940960; c=relaxed/simple;
	bh=iR/ei+4GCGFyzSKBBR0B/UyQeY7n58BxQ7bQCa72dRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ76E0xrqurkZKwz9dmKExu+NE2FFUH3uzexTPGbyuSa4jJc21tKCDlieIxPV4aotzWgx6bGiXNugeZsl3KSX4cP7x9Gr7T0GH3KtBzA63/azf96ca8nSiwKGKfr3Dy9147CBHvHmtfQBjKUcC31i9FOy4pbjXa9dCS4i9RK3o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRhiQbUd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRhiQbUd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MEsRfN013436
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kR4XZ/Uqh0bO1jSX7A4FytxV
	cw2LfMFSByGLKy9VaL4=; b=jRhiQbUdIWbT6Wkk7y3evz5vM0y8dyEA0fiK0T9j
	G1rQcXYKzuGKqxqoaZOZBi9bFU6kyvgj9jQthJVdxsk1CnrdocTadPxjBFZJUFgc
	mcVq5hA+fgCMgJPT+PZagsBs1Ldbt6uolXwxwOUCJpja8EuOX6El8bZDzk0xyZJM
	aqGYidKJTQcVgmq8VXWlSPUSTT+LVNeQTSj0g6ZDHdKrfU+YmxOYdN477QvdjZde
	IJKUSivGoE9bVm/sWr0qblMgC+od/rQlWzt4AlfdDoXc1AtCCnkNgzaZh3Gi5oQ1
	dS7D0XEO8utuAS2hl1XLjhGzkf3su2LC6AHfBGCn24G/oA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5fp7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:09:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee988153so1512939285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940956; x=1748545756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kR4XZ/Uqh0bO1jSX7A4FytxVcw2LfMFSByGLKy9VaL4=;
        b=tsTg75r6CUYo/u7PCg03WcQhsVR3mohXKz1JNrn4lgZO5ttQc0nwLJ1YGIA2p4TFir
         PXZYOWIahbV3t35GsCmNX8XNoPYjq3MF6W66wPZg/OA2JH5zOATGzrDaB8uYRbv8hji3
         lenLnIYY9705KbV0Py3nQndiQvs1A8I8IVEK4CwlpEVn+7EYr6N1XjwwXBcBinAsXDk2
         O2/4hPiP0Xye+mFHzak/IGd/2ieniADqu8umm8zN4PWegrHS2wyTEqaSYFMOf8aDhzm6
         rPJ8iGmlK3HryLKohhcVxvbceFVb2VOvTleqz3R8YVPD9fsh9BUYUOnRd6AABC+BCcLg
         BR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhDb4QBjTF0rSLnrHpk+TsDNswtVSj/Jaf0yUmJEfBvb6t9WO+yYNVKHVpWjGRWIWSa0woyJ+80mZnJjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXgip5cOHwGmqXZfqa6+8V3nE8zfj5aCsnMiwPH6CgWdEJFz2i
	44x51dAPZqfoep8je+jFXpQFctSB12m2NYk5CG8BVQ+IgxXFgKiIY4KbbWwSHLr9N5oNJUS0UG/
	aSZmMKtQOkRNo1ThicEiVYj9TKVu5Xrcl7sGrNj4NGpSEFpn+bj2JukjptEd8+Yjg8n4=
X-Gm-Gg: ASbGncvFCeEJEFW/Uln2D6a7rNzOC+VZ2Ic/Sr8loDZoL3rXa7wrgx0mq9v7rNzZtlh
	JIRyaIXQhtP1OXRzvY3FgwA8b1D2hK7ye9kNOKw63S8rInyT3nX+CpJ8CfQCKupT9BluidADEs2
	I+ZjEQbcW6+rXI7mK6vUr9+ca5Z4XF58wafo5uAMl4GpCJ0Aic5yqfDt81rVRz+JBkebDYpDeCa
	gKA64AZvTAWjaEyKSzhXPRYMhSYpERifwfdqfqXPq34Zonr7uhC828SPdcPtRy2EZQx1GrVi/h8
	q9iYVJz+/F3OI6ZzgpJLqMrZYOc1MPUeQj7CuSbgz6pb6cXgEJdPCi1qjyA9aZroh4uFuFP5faI
	=
X-Received: by 2002:a05:620a:4446:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7cd4608d095mr3152050485a.0.1747940956334;
        Thu, 22 May 2025 12:09:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcwp9Lh575kGkbAvNK5+YIa2S86CpRt5DELbK2TDbmJcyvYQaP/lTl0n4FCeBsrJ+aoxyyMA==
X-Received: by 2002:a05:620a:4446:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7cd4608d095mr3152046785a.0.1747940955841;
        Thu, 22 May 2025 12:09:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6e0sm3542537e87.223.2025.05.22.12.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:09:14 -0700 (PDT)
Date: Thu, 22 May 2025 22:09:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: fix endianness for QMI header
Message-ID: <vf7fb7jxxwy25wzow4pbzvh26xqd7hkx4edqmcts2tzoyrnxqs@u3lev7ergjb2>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
 <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MyBTYWx0ZWRfX4Qc/MFS8ahXe
 aFhRBgQ43frftOBwOC/oW47Z0EztnBpfl2bDxhlFqHSdLJkljDq2GtaDyg6OLKAylT17hgmrnas
 KN/ZsGX0a/0wBBdoMm2WhNKM623LJ9yc/5Ddi+GZyFILe9TBMKftSWr3Q04kGAehgoj6XvrWRUz
 puNguqnZX+lNgQSxeT2nAB6buqs6cQwYGyF+B967lOa1dMLTQK4m+wuMj2A/JA7gMfRD9lqfWdU
 vItyrE6tNlrGK+D1txIZVgp2nL8V9l+M4KlGAyIQ2Ogy9IYx2c1pA0gEQs/vMo4HAdQSW6ZIxWe
 KNE5MRh02W00O2fl0vZxNy//z9asl1UH45Nz+MvmBwuW3/MDybmQUYH9eGOKPzQS2gv3wu/0NXc
 uhiGDqssRwc+8O2y/oMUNKC6+9lAHOQ7NxEjbhjLbb+SY/oNSeEcICMfv+6rk3BP9a0UwZQW
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682f765d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=XW_CCpt8tLB4Xc_L39sA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: 4McG4aZNYdcfIGLxuwQ8aRxkR0a56R7c
X-Proofpoint-ORIG-GUID: 4McG4aZNYdcfIGLxuwQ8aRxkR0a56R7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=739 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220193

On Thu, May 22, 2025 at 04:35:30PM +0200, Alexander Wilhelm wrote:
> The members of QMI header have to be swapped on big endian platforms. Use
> __le16 types instead of u16 ones.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/soc/qcom/qmi_encdec.c    | 6 +++---
>  drivers/soc/qcom/qmi_interface.c | 6 +++---
>  include/linux/soc/qcom/qmi.h     | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)

Just out of curiosity, is there a usecase for running QMI helpers on BE
platforms?

-- 
With best wishes
Dmitry
