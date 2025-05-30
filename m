Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADEB221578
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602391; cv=none; b=mwPEfdkSclu/XwwuE89P+RfHanfVEXdbriB+gBRlOjtrrUHMtLrVJDKcrBdJItGenSwcsLLLcekIPwm1PxmqGp/JxX3IEWyHcOsaY/ze89vyacalYPy42VnHgk5Q9o5WB9CLb5P1hTyrMkLwcspRFQAZrpTZux3McWRo6ljeT08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602391; c=relaxed/simple;
	bh=BNi0Dd7a3ZFPlrWRHPsWBMyWUo7j4A0e2Uy8Euw5WRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWTppZ/T/V1kNKpCrwmuVCOatqkbeO6X0MIvNTLIPSyG8+b4EEZTv84iVHKDpG080hgnLsTngSiPwSjAfca6/b4AeOzk8AqxjvSt2V7tja5uZB7+wyucOJx9hUz65L2nTHlhlhiLmsbsnr+BisBoUFCzFSePFRFPihyBYBlLQ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cg7+edd0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cg7+edd0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U1KCaq006932
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJVkXEX6v+g4dW/IugxFRNgld89BKF2lz5ziU7/jd94=; b=Cg7+edd0D++haUPz
	yKYCe2CmofYUebqtRccBKov60xcE10Zn3zxUZErfbuTsxCtXi4x+TDNaCmnWR6db
	hduWyepm//Ybez64ovFl6q4yE8nGudUfuVdQjOZntkMBlIUAk/TsmdoP7KfEt2i3
	HA9Oh107UCQRoX6KSfx/IZ21541DT9G5PrwJ7ePg5DD1dGHMrHZbwAvreqyDZ4kb
	Lv0h77qJTPrOXQeYRf/P/JsZ5VZOoeBqJDm74c6STrhUYou0sj2cQs+dZ3O/+mKw
	RqomKNqIFBl/xu00X1HjhH1R3XU/u1KE9wNrUtUwR4w8VTNrEk9RoB4jsg8HGpXi
	K7dU3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqgvra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:53:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5530c2e01so40261885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748602388; x=1749207188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJVkXEX6v+g4dW/IugxFRNgld89BKF2lz5ziU7/jd94=;
        b=ansRbmFoX9i3vkHTs4eC8fRD9eY/KUBMWXcgQQLXXoA6JmXv/iG1AAGaC958ic2DXM
         LEJYRlz1g2ZeSdA2skUzBdGD+jZjFN+X1zgm/aj6HRV7NqVE++FXGDIZSyiV41+OXtll
         GDWdwi67lzCFm6NgbpS3r2Jx4jnO02CCbLmgFoEI8J3cwfR+FkwJwB6hCbnaesrOsjkc
         Nwud06TnXnegHQYHcwebhzbEv6YJE4ojV2YncAfZdH+hpPbcuUMghhX7iWdAsKsrwhSE
         JajCS3Zl3+6q/X8pS2AwcJZTNZCcbagW8peYbLG08Heu0C3WCMpvkBmAsYXlwYAVa3/F
         tS0g==
X-Forwarded-Encrypted: i=1; AJvYcCXIthQzLt91G6+Svf7Zb/7WXWegNLGqBcunFA7dFo7Fi/LGwOe0aVOFzDggG3owlEPQabfviHrhVHalL4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbo4WnLRoWfOhxMSKIHKE/RwByHOwVrrZGFbVjhS1x2h/8Poyi
	2zZLz7WXtb3OiVdvHOj+GSMsPpum4Z1434DCPopCWbJfTBanuKCu75BMTqdggBJqeYWO69TtWmP
	nyz8lxkQDncm0YqbSXEwKplMSTRorXe6+Nusz2r14bHhHKaFV8QYFjuOWoyziSgBLnWA=
X-Gm-Gg: ASbGnctalrpxn82+l+nI4yJnPxpjfM90c1yBovzdrej2sSP9epyYru00/FxkSYcZSzw
	uYSz8gNDgEKdnwcsz0B3q7PT+mrR5+b9FxZRuRVPDzxjB/HZHd7oiGdF8sWsZg4vCUSB1hykvuM
	5wHs173LmXykNEkQXrEki7P7DIwYGBbkQtvaCsrzMpTfNMu+oMl4TFDHSdTi01PkwJWRCJfHsHs
	NH7eib/H5FDTM58+vRfKh745EJNRFZ4gL3TUmDOrdnTJgtjBnAE94LFmc6ycxAfZ4g6xh3LQyAK
	Ij1GEF/obR4by8xUsjE3w4ejleY1j/jrFf5SLjdudDGMs402M5b+W16VrLJqyRXtfQ==
X-Received: by 2002:a05:620a:4110:b0:7d0:a0bd:d7ae with SMTP id af79cd13be357-7d0a3d7b291mr118256785a.5.1748602387869;
        Fri, 30 May 2025 03:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX+kHXUt2C/VW9tIjiRdPMxcEe2FZaJPTqu5+DoHzPVF0zM8rFm0up4eW5BqNb+FKxTf0v4A==
X-Received: by 2002:a05:620a:4110:b0:7d0:a0bd:d7ae with SMTP id af79cd13be357-7d0a3d7b291mr118255585a.5.1748602387501;
        Fri, 30 May 2025 03:53:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e870sm306935466b.53.2025.05.30.03.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:53:06 -0700 (PDT)
Message-ID: <bbc8522b-b261-44aa-9b8d-bb8127a71dc7@oss.qualcomm.com>
Date: Fri, 30 May 2025 12:53:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
 <20250528-ddr_stats_-v4-1-b4b7dae072dc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250528-ddr_stats_-v4-1-b4b7dae072dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qoJgFfa2fznkeL2P8yQyYesIJTEvxUqK
X-Proofpoint-ORIG-GUID: qoJgFfa2fznkeL2P8yQyYesIJTEvxUqK
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=68398e14 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=qHbP_aXdX6d-WoeHiv0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5MyBTYWx0ZWRfX8CIXzzZVTOKg
 ZbZC2lLaEvEurTNPE1JxnTsC5yaUIG76E3o5pZhH9JlaCj2LZ+Nl1Rn1HxMUhA3+D1TI505o3Ov
 F/Wd86CMPmC2jS5+9DUK/LMLMjGzR6ji1Amv5Bw1Rx9RchP2kMiaFd1biKw4SAWnEzrwtXFFHFv
 ABgb4o0eSAi2b5P19ZjUJ1q3sc72AUz5RPtjLANim9ilRxa6Ff0LLSBE0sRmxXYPQBA+8Dviyvg
 VFVT6w3pIe7QyaQUfDX5N8o5XvhrDM9h/a/rZSPll3KszsZlEduTPJ5rSyVQSD+7e0Eb0ZO5BJs
 l1Vljp/0W47H9FdadAc2lhiYyjSZNB0aIaLhBPDgoryqhObH1LtETZzwVO8HJr4/ANqt1jtJpaK
 zog8KlAtt1gJNlVGpRcaFo4J+JB3eMwqG8RC1sttc6x7ZgXaeM9fx4y+MaPD/Vd+dY8duVjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=805
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300093

On 5/28/25 11:21 AM, Maulik Shah wrote:
> DDR statistic provide different DDR LPM and DDR frequency statistic.
> Add support to read from MSGRAM and display via debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
