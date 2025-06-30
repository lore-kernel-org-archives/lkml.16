Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1A2E11CF
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304363; cv=none; b=p6QN6dUQvZdb28ZkfTlYrw9OqmjFw9y+dYsrq6cea2TaYinBrFu8sGkvSfLiKaFbSfJHp9geGqhSlHtmIvv7cLwu/NKPXVyKsE+8D6swQT7QVhE91jzYDLmcY3t+5xHewFXO4PcJnhDogfEHVRGaiQC8j/PIe+o2yHqqivGkUjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304363; c=relaxed/simple;
	bh=RKLmE9OopTDP3cDIv9UafaAGfHR1Ncw27fpbfMQVZW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/tDlgO1D8N5EY+1NSzJukREgdHUWRZADf+9bcmFxXwwd1seMAWl+cbN1BmxLGOKw8IB7Dk1cIS2c6dC6jIe7sGovRMMscytLWznpa1cDSk9ANbjK+mRHuyvxuY4rlR1DhtXXWahWCCZcS6uTo5cNUdjfnwhvjnveMd+at1yFXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsn8DnSB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsn8DnSB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFTHS8007345
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eb6RGBwtGwTEMjhKa7qwq8iOnfUnQEEqOjqHkByNNI0=; b=gsn8DnSBJ2OPHHDp
	pIiMKixJUsPFbU62X1TjUACSHdNrR4nact67Luyb3HHbfBkCQIvHYpTdZAwRR/ph
	4lofHxFzd1RJ+PmwOAjS9mR//u/8pgFj6sieW7zriSUOS+0s1EoqUgGP3ZsZRmkI
	Y4wm/d+sHKYSR4+2AUDefx4HVNjh7vGMI/JMU5sqd1F8ohllqTzp7lXJnzpgQeJB
	fWiLiT0nZsBr2R2Dh4oNfDxZXHenL+dNvznHgDweNQG4oNb9Q4SEJEZ0LFa580ku
	1sgjB7OPkfFS/joI22vFNUfWccgE1q6GQ2DDJzrZ3TWyyRf4V66jVzD90xYjus+Q
	Y68R5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5ja25j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:26:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0979c176eso117257885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304359; x=1751909159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eb6RGBwtGwTEMjhKa7qwq8iOnfUnQEEqOjqHkByNNI0=;
        b=byVRa+Qu6OEHVeIswuFGqKYNDFRDRLjy4gW3KYzo3CBJFa126iiawYzWIPSnmG4x2I
         5Z3k9SCSY1gz74g0OWvYfO8AgRSBOS5Wa5QNiKrs64fJMqSycQULvBxJmjebwvrK9IVf
         bqAv/VppU7lOmECozfWyXJ83htDerOzz5Ro0ykhJEkJjHrZDg772d0S750F91P1eVt/X
         I7sFM+5w17DNMiYz8hDNGTOcXBwdnc2reqYt/+aiHPeIiBK4IMNmT1AwzBrBzxy+oHJ+
         C9mXzRKESQqBtOCMRYNwdnv7qdKsw3TcTaRPX/xw2MC2r0kEu5oFse5sYU0NSVW4Zq3G
         Yk1w==
X-Forwarded-Encrypted: i=1; AJvYcCV10cWyap9VcSkLTHVRoJkzwVEOOhnxjsLABUEMfXS/9SJFAtDKmx6G5og9OZOyyhBPZOXVWUrgpcNjZaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUvF0smmNNoVSOGxEdexuT+3i+7qd5rFLtThtxP52e8lmPXUk8
	kNC8nxiSz9aLQYplCRXJAyVxo/bGqggAd5O3BkdjjrHvSvMY0xX//SAK8a4rbA2IdjMIxRB72jN
	qCwzx5NfzCgr7FmJs/W5f6K752+woblBACKB31jXHKmRuPVkLf7G7IxuFoHDNjrVvdbvsBWQPIs
	c=
X-Gm-Gg: ASbGncstsRIDZc6DdaLeU/YMvgCo61l3tA8Ei4P2/eG/Zi8+gb4XqXp6rL7Sq2czPyT
	QGkHj1yjmxZvApbbbwgkzPTjgkUcFYfVHXxz1Z/J6o9VQJs+iVZFoptt4aSYaqXHGPMguUfViUz
	eht6L/t4cpL482xxpgQPgyvRFnB+RjYUnJ7NJA5wmaIxJf6DzZS9xKS0STagToTdy9HTHaNloGD
	PSmNFIhYLHDbQTplFZzzjI8mSiP3zT7+OaCzxJ4N8pwPCbtPZnpIYLMhEVQhjKIV03qDNhrdEmj
	LwCPBdbesAh8nmmlCfAWuhkKb75C+nRR/Dq6fbF6vz4tpB5Kuetyn9tigeJNAtPmYwKHOUiBYaV
	6e0UNv1Lc
X-Received: by 2002:a05:620a:248c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44c26d063mr463619485a.11.1751304358932;
        Mon, 30 Jun 2025 10:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb9DlBcpFd5BQk8Ta6Hv/aVwuTAid0h9o086ihbCHZUqtNdSGoEN128bZOwaskTt3wjs5XBA==
X-Received: by 2002:a05:620a:248c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44c26d063mr463617485a.11.1751304358317;
        Mon, 30 Jun 2025 10:25:58 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01620sm717355666b.103.2025.06.30.10.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:25:57 -0700 (PDT)
Message-ID: <563db91f-3080-4a45-ba0d-04f415ed90d9@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 19:25:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end in
 _driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Agustin Vega-Frias <agustinv@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6862c8a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=IpJZQVW2AAAA:8 a=0kSur1atOiepxKs-vqsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: k3hZBqyZ-ITMzO76s6H684ZFDGEzLf7i
X-Proofpoint-GUID: k3hZBqyZ-ITMzO76s6H684ZFDGEzLf7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0MyBTYWx0ZWRfX1aBJD68vM5fG
 IQSdLK1BWbL6nK4aLUObUSSO50cDBInK9dl8+nlzdAtHZMZvd+vGLJ1Q3hiCEAP77VksDm00Nu8
 0XplLYxORunBiFfUtWC3PkAIlBhs+niiyZ00h3gkKnba/VXW9KGa9WfFOCo4ZpbYMb0Oz6D4r1D
 kBQbcQe5BPYgVqdNFAZv31iO8/un/eWDUMBPZsPMiswLq8MaKEam9u+MlA4oLfYEkTdQ/sZktdT
 ccZfa1Kob9rJCVF+4XcE/mje3QkgJw1QsWaGS3OggpeGJJLI55yIiF0R7sEWVhQih5VbeY94y20
 3kaY/KDfu2JLZgdtxC6SUOn3xGYZn455RoaHgnOa4GpiakQnSIl3RZZH0wlGZhN9LAV0dtLv6uj
 xQYK3vNXeDpCLvxb0sqoFvXk4nNHbS79SXQhDIpPRTdOO9xhZNDQDXVTq3YiCtrZj3WATMrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300143



On 30-Jun-25 19:23, Uwe Kleine-König wrote:
> The modpost section mismatch checks are more lax for objects that have a
> name that ends in "_probe". This is not justified here though, so rename
> the driver struct according to the usual naming choice.
> 
> Note that this change indeed results in modpost identifying a section
> mismatch in this driver. This is not a false positive and should be
> fixed by either converting the driver to use platform_driver_probe() or
> by dropping __init from the .probe() callback. This problem was
> introduced in commit f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner
> driver").
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I don't know if platform_driver_probe() works here, it might happen that
> the driver is probed before the matching device appears. As I don't have
> a machine with such a device I won't create a patch fixing the issue,
> but if you have questions don't hesitate to ask.
> 
> Please consider this patch as a bug report and better only apply it when
> the issue is addressed to not result in build regressions.

+Jeff is probably the last person on Earth that officially has one

Konrad
