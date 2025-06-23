Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4718F6E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750655580; cv=none; b=hFVEvrTY18HeFxZJhWjckqSTGs2kGtAG0hX1KA9I467zixNRaqeh83tmZk9zj+UhJUVw7BdL/6IxbkRcTwo8cn8SJGWiIDepCanh20JMI7LYXPy42McKqkueNt3WEtei6/VozXxRLV6Lzm5W+TA0UNyo+Oya4SnuPwtyKPzKa6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750655580; c=relaxed/simple;
	bh=A46gpwSEP4kUMzfPWhuitAJbntm/7Pb0F+mQqwos5qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5sVLifPpuhmRslYEXBKLI2IjFbutcPStvdXcwYkotfCnCI28MKNrNgp7BAej6F4XIcRk48Kw4f+1IQ6668kTvZa+yVlTzVEATvFfEVdHa5pgg74/VPgWXmlE6t8ovspmYc+RfLmIJ55aWONw8DDgUuE7hlhU6lxiipcUfMhtI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqYwlgEa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqYwlgEa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N0QSDl017715
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wbAJSs7e+W6DSkxYogWtOVipiGhEsI4VPHyrkWooCW0=; b=AqYwlgEayfWvPnUZ
	d6x5x6d0DcKHTZ7Yakl1X4ScboyOOiAUIHo5U95rJiRPB884V5iCZ8xWiFwuQ944
	ehhEOPgqjdsFzEnKgTdkD6/Ao21w5JPFWbTGm9wAo75N3uOAG7zmm5Q/CdQn4OWe
	bfmkixb3nw0ZUfibCkcmiaqLmAEa5Iq3Q5S4MC8Ps4WGlO8CBkNcIHEgff8h8B75
	jMtKJPwXF6MeVWggcsf6XUXcQRoYotNP+X/Q9bLO8QD7Jp9DxVB5UzTrRCaUBl7h
	SRBREGmbT/qUJ437HGjmjYBVoUqynBp3gj418BiAmOKJGvct9lwXH/z63FclSfCX
	TMOHmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5gfph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:12:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2369261224bso45874885ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750655576; x=1751260376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wbAJSs7e+W6DSkxYogWtOVipiGhEsI4VPHyrkWooCW0=;
        b=QKOi0v787nHDNngecO+2Vh8UMbGqKpVUP48BvrekHHKvNRsPpAQqufgxE3+HFHWiDs
         otsu6DUDLEO/iwmpXtNsdhYXrTUDy00Jh6PRg43A8gHr2vw1JRgYPhRFuiJ8KO1DoFKI
         zyQFq3C9yeoCpbgzHLlH2B2iVg001w2/BUhY/6bhgDQE8G2lp0AtzUB3dNzjUPlApbjG
         x09zHdC3P+dd2IJNyW6vaWQQXoaALOfsAnrDWzvhOCCOAJOh5hPNfHzSZVpCCGWAyPM2
         RZi7x2cLvsugeKPjd7kgWPjoX9XTARrLqtmMUIdgaNLno+R7s8GwuQbBNlakgDnPYcwe
         vepQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCDYmqSk1xME5X5uVNd8XdIQiK4ecwMiyOcHyO9ZovJAKzrv0RIaOYud+zgvv4FogEa3R7t00vb70JMk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz+ipQ55ywx4JoEU4OZOjELZKDDPKK9bQDoy4oxQFrsMRLvtXm
	S/loHcsM6nQDeufCpHAlB7aNDMtAdo7uXtSszIa2ROScD5YUz8oUIRKxCnkYAY6ZmEkR/WE7Qbi
	4Vtn+1kPa/Vvy/opuT4XnTxcYLX0KIJRofM141SM3veNCGiQHd07BPmol9phbGEwD0PE=
X-Gm-Gg: ASbGncvHk5tB27AXf4ypuGTPIXDtBj4zL4EsacG4w9Tb/GZmq1yqcUQFX5TRZjjYDnv
	B8OkMMvXEwHovJIXoTYqF+/GBWClvC7yRhAaKDcNaBav6+gO2WGpjnQbslm8KDYPMBeI88XYpIr
	pZTYTnjJy0P3McUVDNRCLrfLPu+lyWjxQMnH2AIIdMJo5mytQnBgcjhQrVDrt9V2cET3T6wLMF6
	nuAgBN1O+8bMzt4l2jrOdpInErvr2DtdHm9YydJtzea4lkAue21O3aoaSs/qfRffPyYGxl3KJdW
	fkCpSenZI9Gx4iRPXN5CqiXXGh2FU9RJkyYR5fchUOsx9HTROeHr77RpVsDMUuQ7
X-Received: by 2002:a17:903:4b27:b0:235:1706:1fe7 with SMTP id d9443c01a7336-237d9779a73mr171741435ad.4.1750655576479;
        Sun, 22 Jun 2025 22:12:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwMZ1SQmGpw1GCwWrne92h5uRBiJ7YyYVhZ6BaiiirHUJCGrrpZsIAOqwQA0NjRo2sQWgAsw==
X-Received: by 2002:a17:903:4b27:b0:235:1706:1fe7 with SMTP id d9443c01a7336-237d9779a73mr171741235ad.4.1750655576107;
        Sun, 22 Jun 2025 22:12:56 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393275sm74674125ad.39.2025.06.22.22.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:12:55 -0700 (PDT)
Message-ID: <954d3235-0fba-6208-011b-79cebeecc0bd@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:42:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Enable REO queue lookup table
 feature on QCN9274 hw2.0
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250609-qcn9274-reoq-v1-1-a92c91abc9b9@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250609-qcn9274-reoq-v1-1-a92c91abc9b9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Srr94kSOUjddw4dI65kljtck1q2pqzA7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOCBTYWx0ZWRfXydg/n8LrXBpH
 zWKz4gaPiSwmcRIJAzZ+O0xWGAZrUtPOF3eJhQp8xU2rQO+nvyylGJPZSsa+EKpQ8j1+EWy2UWp
 JUa13U1+80RIb6/e8sKEer2mO75rjOVQo/V/YK/0ENgs2pi2OnYb6EGaPl092k7LE9dCumi3Qjd
 XZgmop8RgIm6fdHEmTt4YYtJIuzljWUeKMZhaTtTq896fzKrAIwsijaYE6wmjqZgkAV9SlpHAUb
 dxNjx72KncnldfIcKxvFnLLm4kdynecOCMXKyEqX3u0toEKvxXtYrGMGAGyP9K5UM2OdGEPrQp7
 lZj2eS4cXGjV6qBQhEgI5X+9Lm7EjBblsYOKttM+IUE7gDNjpcNhneeLKh6IEcW0DjqcamvOdxw
 foyizXlXR++f/M6fQ/9fAhwNXaxfc9vhGoQO2fiJwJ3Gx630KI/ruBisCLb5moZZtf+6rzwD
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=6858e259 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=hk8jstzJOELweJxXsYQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Srr94kSOUjddw4dI65kljtck1q2pqzA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=914 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230028



On 6/9/2025 8:48 AM, Raj Kumar Bhagat wrote:
> The commit 89ac53e96217 ("wifi: ath12k: Enable REO queue lookup table
> feature on QCN9274") originally intended to enable the reoq_lut_support
> hardware parameter flag for both QCN9274 hw1.0 and hw2.0. However,
> it enabled it only for QCN9274 hw1.0.
> 
> Hence, enable REO queue lookup table feature on QCN9274 hw2.0.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
