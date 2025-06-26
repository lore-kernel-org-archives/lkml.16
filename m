Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FCF21771C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750981690; cv=none; b=vBW6uv2Tf2pi9gCVNUzsHjtf+oMQZCVxyrfYdvZGvAJYv7iBitZzViob1VavzZ1fGRjlOuLpN5kRlA07EI62l6DNdBCAqIx9tOPBoBMbW+Uz8/EbNbODT6y9ZmvIKSikiBEwbKQ7mQ45s2Tz0wOLxe0nSkK+Kzr6MKrQnI3+m5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750981690; c=relaxed/simple;
	bh=GJeEEk2k+9QDO4GRwoK8rdidT7Hui7V7SG1hw9vaPec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXNABNoGqGg1KM6emz+LwRKwjeTWyQMPSImRY3exVweRuLfglxmH+INSNPXrSgoVUTKgxllDUz3jJqUqom22OrR7yd0KYTHQW5ib2gp/AuIBbwCm4dOW/hsLT1czRobKwQlWlujsbPM0xzCG/or7RkZrSL7FjlU5c+Qs4fgp5fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSSzIlaz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSSzIlaz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QIpxHb031206
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jcqp3+hst16YWzvGdkkJ7rEp
	8MCwqlwyZH1HL9EQbcw=; b=ZSSzIlazO7dpLTO4uSjFpg7YD4GcFkAhKwAyuZIH
	8WrWmXgW1TLFGI4nEwZUHc54LLaU6TRdXObY+7C3k7VpXGVcsDjm4TfpKOGzjI5n
	YZyccFObOU3rlxP5ibsv71XourvsqCTEB5WYPJuxk0Zk67F8Yge2LmfqBjdbMHE3
	gC76Jz66379TiHtY7jhr/95qXos7HvU24jw6ofabRfQ1iSL+EKcPm9G6V7MiVmZZ
	v1xFih6iEd0KTnl3ri4VumAXXRi7AKinj5MFt5s+2fyW9stn1YEwZ6+MF7VFJKiG
	/CbuT0b1ZVil5KY4ggIWZsIOgiHM7HPKmFKi68rI/eIvKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b44spg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:48:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c760637fe5so250165585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750981686; x=1751586486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jcqp3+hst16YWzvGdkkJ7rEp8MCwqlwyZH1HL9EQbcw=;
        b=PYEWRvG1gjfMpTJSofMUu3nNEdBIM8K5vJe5CT8ywNln0spD11k24WztPbbShpodbQ
         WOZ+71Q8z4z1ER8LY+dzLAryIHvJkOVjeRPMoObOIDSaQ+pLuHXPM7MpWQHizxlqWBL8
         Chuc+GYdQa2qhIW4Mu6bMmjkMWpB/wv2Zj15KR/vCijd2cqd04bWghQFwvufiAQ549AE
         padlh84hJGKVlpm1joityNiVDDxfCeC8S/nQ1NKKr5SOCCXkf3hS2/C5eGclx9U1K6Ie
         8D+xVJg5kK9Dt5JchGejMMOCFSzDbRQfN3icRk3lWf4+y97kgeCT4+HtO/Cv8lQgJiXL
         FcEw==
X-Forwarded-Encrypted: i=1; AJvYcCUxTjBQqTjbnhWGcFTRvvD5sVdQUDBre9/34KcIuUgpseeE2svTYweLEJivKMFmxMDPrM8py8X4bTpL5Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YydtcySFD4FyHOf4W8IU6zKtWVYv/IK/Zt9oltIY18PouZ8NoZt
	38k8c6QyG9jvNJi95+b5AjmLQNlH2j9VkjW1EEsisTjMmT/bH8OifDgywXjuRldX++HWUyB2wSb
	0cliDi5QN2p/3r7lv4Ma0Sw4CMS7oDk5abX/VhT9KePmsUdNFVZRkveWqjALiwzzUdd8=
X-Gm-Gg: ASbGncvDo/1J78JdadWMlst12KAH2ftzRAAghaxQfNxRAUDUWMpdP71IZ9LYBCQfFeq
	qTL1hz8o3tbQqZgFQZvuf4AtYb4fBkXVA90J7GrOMiRsi/jf+YFBmRA18H6MVPchVTi3MVWyaa5
	7vzsmRoJZafa2UdPbY0XInpYAN8hJeLYcSK9u4LOlgg6S1wOxIB6wHzspRImI9ck+Kw08tbmeCg
	x2yvobj0kks1aqoAWfCpykwV3mpiBmy7oW2XX2iAOK54neYjGbRwogom0TkJ7cnvcONED1CWV/w
	91i4hDFnAGRgNPI6W97lYepasy2hwG5P+wo7GhwrXSC+VCcjUz9HzV4a7uC3+MiHm0GvcsUOprs
	MCJ5nNKZWtpl+uZE4nw2kxsBsppHODfQEzKw=
X-Received: by 2002:a05:620a:708a:b0:7ca:f2cf:eb8b with SMTP id af79cd13be357-7d443950f18mr219894785a.34.1750981685910;
        Thu, 26 Jun 2025 16:48:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8LImz54AwYU8qJ3uD+qw0ctbfw33heYi7sSbh/STbsvQec9M5PenlZbd9yKarCy9GjAAvFQ==
X-Received: by 2002:a05:620a:708a:b0:7ca:f2cf:eb8b with SMTP id af79cd13be357-7d443950f18mr219891785a.34.1750981685435;
        Thu, 26 Jun 2025 16:48:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550be2a0bfsm126329e87.153.2025.06.26.16.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:48:04 -0700 (PDT)
Date: Fri, 27 Jun 2025 02:48:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP
 CRD
Message-ID: <wqmnh7x7pi3tg5ascnfmy7lzjbe4wbmcf4ycjndtovbxkxajsf@ghayhqaixhnj>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-5-aacca9306cee@oss.qualcomm.com>
 <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMyBTYWx0ZWRfX8vIRHl4USQa1
 Ytn9RBjbmbqLwZDGLsCqxM7UMWS5KW9MNVpSOtwc4cHyxPXNzHDcvxu0G9KKo3ee9BJoShQbiiN
 JIus3LFS4unc7CXEdxMj0s+GhrN08GM1Du5hZYrFsubyX5F/RqYqe3xOq6J7FYgStNh3K8N/H7q
 8BPPE5lhmKDnU+CfarhTQUsV3ize/Ckj1uFQ3MudJ2+2ZJFrGa6asHMQ/qt5XpebbsUKDUD+tnq
 8i88VH2a/gG+8KlxTwX+gtlJVzva5ZqrY+lAb4Sqm1FgmStgrviI2qkeh1jX1Fb5n6ppGDczGCT
 uBiL6e1lv3TZbLr/tZ+a44W3BhkXeiAjUbpc2tBT2A9xafI0a/ZiX0etcpeAVlQbpodbX7QS4uz
 6bFec+b0uk9JoSuqZ6PrUYl7ZG3//B5RQVSW2e/WOlrQv/w+QRAZtAUgh+ABda1AOqqUygZE
X-Proofpoint-ORIG-GUID: Jyf81UJD1ZuGLbQAzex1wnDMt9VGZvdM
X-Proofpoint-GUID: Jyf81UJD1ZuGLbQAzex1wnDMt9VGZvdM
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685ddc37 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Xm4G249AS8QJ8kFCN1QA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260203

On Fri, Jun 27, 2025 at 01:34:56AM +0200, Konrad Dybcio wrote:
> On 6/25/25 12:53 AM, Dmitry Baryshkov wrote:
> > As reported by Johan, this platform also doesn't currently support
> > updating of the UEFI variables. In preparation to reworking match list
> > for QSEECOM mark this platform as supporting QSEECOM with R/O UEFI
> > variables.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index dbb77c3f69ddaa931e7faa73911207a83634bda1..27ef2497089e11b5a902d949de2e16b7443a2ca4 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -2005,6 +2005,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
> >  	{ .compatible = "microsoft,romulus13", },
> >  	{ .compatible = "microsoft,romulus15", },
> >  	{ .compatible = "qcom,sc8180x-primus" },
> > +	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
> 
> R/W works for me (tm).. the META version may be (inconclusive) 2605

I'd let you sort this out with Johan. He wrote that variables didn't
persist across reboots.

> 
> Konrad

-- 
With best wishes
Dmitry
