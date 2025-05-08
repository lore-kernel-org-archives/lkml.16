Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2039253345
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714432; cv=none; b=TFZAjUjM8fqsz/TwNYJ5XS0a4XmN6KC/db+/n5yM5luqKf1nPF1xSwQuL9afwOFAs7ht6KvWhBKaCbRa29e/S7lfaZ798FGzQRxZnMk0+Fj4nlkwtAZ2z/4klMskbgVjE0LPZvxZxxHcdGKXP2pPy+O2CRGzxOXswRsM5GldbRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714432; c=relaxed/simple;
	bh=zkds43o5L5B/f6HNVac68bbzTS3DCgZhRIDrIzr3LLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nA2pNSgxLhWWGKeYlest0fjab+qhbSZAbEvUK7kbp8TCOpDQs88jpm0TGIktCEYh9UF/e2nzTJGVXcuFhkXGhYqlEQKLBoelzR+Naq/KH3da253ElNqjnB5Mh2vyXQxPnCsN+9P1BSQbHJBzga9SDN6WFIAoVdWNOSgTKtrQeaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJ+vvhv5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJ+vvhv5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D2dkJ016320
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 14:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Mep7YcpH9mzwrz4fqg9kB+zrqpI2pfxnFBXIq+LfRk=; b=YJ+vvhv5wxf0zoE+
	FRCfleAoKhwz/ZkxHGa7gIFdg+hImF8d+4z4jqa58MSCjADTch7h5e7j6kcO53CA
	+u1Z7UIt/pzYSvriICYPyOvGLh0SE2qPFXwMyBl5y2wmW8D8ht2IixG2yIXQBjNe
	7TSTZelW0DKwGJkTfF7NHntZZudKkmoQV6Ts8lsJrFXSw+IiLHLjHFtafjPAZ+7z
	U7qsVYO5xaDHf/pODUmle7MKIrCFNIzLYqufBDYav66HZwewUr5gWLMDphuS1LuP
	Qrij5s3zu5Z3thxgI9Tof8rRNJolzGcYyO0Qtw6mG0RMMEDkisgNLm8pd7slh8LD
	Hbnq0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8sjwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:27:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5560e0893so16389185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714429; x=1747319229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Mep7YcpH9mzwrz4fqg9kB+zrqpI2pfxnFBXIq+LfRk=;
        b=r6Mf9vpEr4zgN48Z8AVNm0jHKT2jqLhRbCINJkBd+x5258nxl8IQzo8XUBh1Ha4k5e
         9C9LvSf3sLTmH5UHGkB9gNturAfiB/kE3kPtXs++VAyNE6Jobz/TW6LMroC70b4eHE1O
         A3hKdNBY2BmwyTFSRvesePADbR7JP4UFJZleKSJ1vlQWmh6Fu89vRgdEe6tjOvo8eX6L
         apFvh9NtZUxwsAVWJRnJHbYtWs3lGUm4HxelMyqE35Y1cC2SFfDtnI4jrZ3BSF9raRa0
         WJUUN4t9oaWZUaW2R9q2SPMiVV4mK1lMpwwjqn0XcZvEnWtKTq2HcOYVzsfp94mHkZQf
         dmNA==
X-Forwarded-Encrypted: i=1; AJvYcCUHMY2SS7KMgAgdds6vtqWUoJsBNnH17u4PvArywYyd0YoXMuRr9P9sJLB2olHmpUqFgg8ilnD7zs/jcuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo2FhQIlh97AF4/+NfmEj8mcIX0X+Um1n2e5MnQB7Zaknky1bc
	JcvnthOO5HOpxnGL49xv78WeIWcnSq+ylcYkLSaQdUOpTnv6tEzr6VkZXFNUe+ufurq3f+AHU4g
	sNHOomcJMNyjWjxM7qfkq0RGQ1TgtZ5roiicYHzY5v2ABEqTOytnwFioq14TMWRY=
X-Gm-Gg: ASbGncsc+/q8h66+LZoics26ANnt+4nFDLnGEUdXf83AHb1nN6XshpAXee5IQGhEVls
	vdOH1BPG0spNCNRK2fpGDcZlS0SCdtueLaN07S5Nf3FFnSCcgmNAZqqXSAL2+l49buJLKkAebB4
	3xsMhfzHgwD7JDL9wEPEAriSW8lrsn0Vp0dm+7/1eiSQNj9d26PlBF7GKvpQ68jSixCKWav9IGb
	eqax89QbCuD+1xP127TNFpgXnpeoDJiMv1DyV0YL0pt1DynkYtai87sW7kVklFA/nKtvzYcbr8O
	G41UIySaWyangEiNqH5sEeo4sN5+BHr1yX7L7c/eEUdbyN83GqdYyp11CwqkX8RLLgg=
X-Received: by 2002:a05:620a:3711:b0:7c5:687f:d79d with SMTP id af79cd13be357-7caf73aaec5mr405295785a.8.1746714428658;
        Thu, 08 May 2025 07:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvba6HeUAx7OKuoCqvOUbDJe875HzP+f08GjIi6W0s7XmhXMvoMzNxaPmK3JIBmw9hSJ9S6w==
X-Received: by 2002:a05:620a:3711:b0:7c5:687f:d79d with SMTP id af79cd13be357-7caf73aaec5mr405294585a.8.1746714428345;
        Thu, 08 May 2025 07:27:08 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad20d048485sm55528066b.127.2025.05.08.07.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:27:07 -0700 (PDT)
Message-ID: <f22fe0a5-d39c-4a6e-9363-d02a6b17f01d@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:27:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: qcom: msm8226-motorola-falcon: add I2C
 clock frequencies
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <5a8191e3758e0df78b4213102f25ceadc28cd427.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a8191e3758e0df78b4213102f25ceadc28cd427.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x-YP7Bw1-hYF6ECA44PltUJSwECbwuBq
X-Proofpoint-ORIG-GUID: x-YP7Bw1-hYF6ECA44PltUJSwECbwuBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyMyBTYWx0ZWRfX3p3CSrAf4FsP
 yt4Rc1ld7RQQbqKjgbuTHOoPiKxCSlY3iLdRPDcVePL+2YpnFCs1hX9dAZ+LBj7IwBR3Ashq1S0
 r/VmZ1Sn/dvreNdbN1+TmeRZhNJmGdhJFRXdw2AmSs/J/BVWiKbYYdqW75Y1lEsqSiB1kp/auRD
 SmYWkPMX6p5v2CJ+jd8UpsF4RSsd4NuCRx54Q6QT2eKFYCr98rs2BO7bpp2GYOwPUPhRDENMAMh
 VENlJbpj6jqheclyASkkqVdoBduVvii+Nh2z8kYASe3rqzu2nHOuOzGNkcXcK8bxbU35H90nki+
 APEkMWZz2C9gzSo7QHZNRGAzZoNSet05KSgJmluAJXVNfOr7dLLueltAXgSab+acFlChls5Sl5T
 9zs5pFaMftiYnQvoJ8RGXOFEP+ZJeIquLwTNbR/3TGkoYsxOWvBtQeAJhT1YZ5kE6seb4ItC
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681cbf3d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=TrkI-WLm7CqbamwRmuEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=754 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080123

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> While the currently supported hardware works fine with the default clock
> frequencies of 100000 on both I2C2 and I2C3, downstream sources list the
> frequencies as 100000 for I2C2 and 400000 for I2C3. Update them as such.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
