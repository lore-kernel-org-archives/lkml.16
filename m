Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCEF2D46B7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629792; cv=none; b=kYVUVlyLxk+fgSrr1tY4ZXul+f2YveDJNhPB1rcAb7YcTt+5BUr6CT2wE7LuJrOdCyU8pP1QqTNmyqiuvK/vMl8fbvMkqNjh9n/YPzDlFVST7NZemszVD6OsuB6THpEonef7Jg+avtt0DQhqRWorovJTTyaD5IwqbB+JvMJ1NA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629792; c=relaxed/simple;
	bh=NGP/PxsNGeZTUuNXz8VGwxDIzM6lHBs55ktSaJciH38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+gO19k+Z4OgdIWEvrJ2XAGPHLGybfjbyN8mvG1iPfodKFjRtTxsbXJXuBabFwa7ax7CQBT8IEFkYH5osbXI+qLWuGLC4LcFWjcVnRG9Az5er4dTOztJqVM3CO1qUhWYE8ETC5BYP+t6QqQa538wS3E2fPgbhhrzoJGFBscyM9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4d3ecNn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4d3ecNn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648lKTa025163
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 11:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	laCGrQ9GAdMtdm/7wwEuGkeVS0NvClUE8xbKk5q6Ipc=; b=A4d3ecNnXnHFTbMQ
	IyQgaLylzchlIfHifaweut8ZRDoJMoL8+WaisvwpaXQclkNOFwJ3UalZOdgY88qa
	4uSR0/9nnZhFNKGbvez0EbHo5SovfXOdTqg74BxuxBhDWtH/tcpT45x1/nENzvM2
	R0PN43TEcrIpguUcF8PyQQg7yilzUH7P0ngKeh0Qe9yykSjDI2B2mkRp42hl52Nz
	LdRtIeLWo9O9fu+rhELjYpgUFFAkE0UaIj3Pv8Yj0cSLrZhB/bMiD0kbPNM7n0Ly
	bM0bSmTbpuOtyX3QNZmmgosTZAdjiHfU76hLSZ1KRrU5Pyu/vZV+40IqnwGvJnTs
	ehr8Gg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd650vyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:49:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso1503566d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 04:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629789; x=1752234589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=laCGrQ9GAdMtdm/7wwEuGkeVS0NvClUE8xbKk5q6Ipc=;
        b=oTHpaW2xtsurFinmWDD6d+KSGoMF+jipixz9XsaY5Kg/BJQ3MFINE840VnbT2BIErG
         ycQ8YSvlHeARHOCljPZHtL49n5R3KsoYaGyo0kDBGVWMgKGdkwpaYo9eOAmGYYT9XiMp
         hYIlwNw58eaXWMYMLqaLNl5rZEjy69EtMr36H43KiHXYYYQGwWU4j+LsIK1AMk3rQ9QX
         NL+SK7O7e0DL+fQNjyWVw/DOPfo4g1j1xgZcvnRPU3IieDGZ0yTY6sG5e/TFFP81sJLc
         sN9WUVr1LhcNjVtHmAuRYIgF1kx4EtEF2BpNyrk3Wr+1e6n2TfgJn/zfE+dZBfweGFkd
         SFew==
X-Forwarded-Encrypted: i=1; AJvYcCXvaB6ZTJ54D1tddROULSqhkIgrVYgFhVlvTK07I/V6BWNhaVqJPposc7o+e3Lbo42c548LboI40mwSBTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQaKpMuxXlkZVi035hdGfqynzILL5LRFpUDczAIyEY1tog+V1Y
	un9KXHBG45hmkYrqtfm12nDPL3QPdLs/CfiP677bxmlPqu1WY/nwz462lHKkOCR5Iw1KwufYAVP
	KIPwRYMl2H/qT8mZx93CIoupkeUzYZHOUNk0XDu/7mefd9TIoxRohlztCVs6KYHVhDjg=
X-Gm-Gg: ASbGnctjyEA1UN5Ph3tMkmUF2IkK5KkPeC2ZaBB6kKCV+PeXF8pHlHIOjeB/zdCrsBn
	01tIqhy+hqrcQqKmMDfZHXAVXdxrgO28JNDFoePmFgwao1nm4qzGMTxn05XojkbFJArYUeJKb9A
	F8Agzt7kmE10meCLDWkRGcK5p/iulaDBFTabsey8cYHP4ss4eSERr9wNy4vdvFa9QUaW9yT+UUc
	IsQYh+J2/P5z2aZrc+ePvsZ0hxGWydj3EM3UORGhtfM/VJz9B5Oz6pj0QnzW1xh/VCNUDIDq8mx
	b36YMxh328HZknUcrSDXOKyodqrOmBlFOQxRe4e3Wk5+x3ZBbgJb6QvzCP7rxHilA0MnSbAWRGL
	Iq8tPZA==
X-Received: by 2002:a05:620a:8806:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d5ddb72782mr92365185a.5.1751629789203;
        Fri, 04 Jul 2025 04:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiAjmWRPkiKpR+S4VHXoZ42jF+KSMtl9uggu35JvLmzo6Fa35B6gQezEkVOBYqn83TEjdRAw==
X-Received: by 2002:a05:620a:8806:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d5ddb72782mr92363685a.5.1751629788540;
        Fri, 04 Jul 2025 04:49:48 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5f37sm156568266b.87.2025.07.04.04.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:49:48 -0700 (PDT)
Message-ID: <1ac0c729-0e6e-4004-a8fd-f58644b7682b@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:49:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: spmi-pmic: add more PMIC SUBTYPE IDs
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
References: <20250704113036.1627695-1-rakesh.kota@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704113036.1627695-1-rakesh.kota@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6867bfdd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HFKg1oX6Bv6CssycSbcA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4OCBTYWx0ZWRfX31IiV1xyrxWe
 K+KdChZn7pOh7XBiwllqC4a4rCOzuQgnTU+Sn3g7OLAM7nR4HsLM+U9JQSovWYai4pFusEA4kit
 oNHaetko+Nl+Cex8AS7OypWwayzty7MoY8xAr2xvCO+LpHDRw59zI4WMqXZ6j34KERxxvcmdIOe
 ijv15nlzFMlE/sxaVus2cFnFbifqvCMfnOF0umkqlfhSAPaJRItD/WbcX8R4uLbIC//xaFOhOeA
 r7WERTr4WwC1MHOeteJXZ4OmXRrFbvq+LBVjCkj0wtun6c27DpofBYgM0/8BhLWaJR8I7D7ghZR
 4upr/Nm4h+GZy5nrt9KnBFcDHvsJ3GI/YwSyw48x6EeVR6GoJNE/y070FFtEUGwpH8g8yGp7AE/
 PfdTBJIJRbKoFULwRPf/gCPE27gad/9TGRALgOmiSLwUDxFgglDYOOgPKES1ImFR73Fc36Nm
X-Proofpoint-GUID: B0JMIuAIISUUcVN13EnUm29LApFQxDMJ
X-Proofpoint-ORIG-GUID: B0JMIuAIISUUcVN13EnUm29LApFQxDMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=592
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040088



On 04-Jul-25 13:30, Rakesh Kota wrote:
> Add the PMM8650AU and PMM8650AU_PSAIL PMIC SUBTYPE IDs and
> These PMICs are used by the qcs8300 and qcs9100 platforms.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

As different as the second one is, seems like this is its actual name

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
