Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0C921FF31
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226654; cv=none; b=bCSuirBlEYzNrR0tBr+q5W0ZQhAozwb3MrvwhqQXJmTOuCpaHIqlI0kI++BpqHA40/ZsCTmNqsxGd3XgHpLEoF9oK/ChRK0oIM0l/HCnaNqtphfiPe0LvS4VCIpJ+W7RKeyuJiRiR2VEQtXp7v2zrJABGY3Y7uqzGVTh9h/pv2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226654; c=relaxed/simple;
	bh=6oi1d7L3dOM1r7BbAPAT5Ksm9yveX6Z64T2a7u5u2qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgGEVXpBAXJKszCgTH2S7zwU5dMOWkYmCEc2YTZzIg+5NU1fpUYrTXktj6pOhYKl7cK9g0a8bZ6BaGcnYofI1T8mwvNJe+fqOxqSrhQAKpM2eNLXTRv8MgozRomEbYrvd+KQJlsvRwkjVBQjMw6iUdVPwgsJW9tK78rmUjb/gpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3ND3PGJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3ND3PGJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAra8022480
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 22:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nNKChsHdf8IXoQprYYi5KKVigp5di6ek5Hz3xT2EYKY=; b=W3ND3PGJ4345fspW
	+mmAeDizYMPX5a5vl9TlLIRa9kiRhHeNj9B3HpYyzLTXkWsDj8iHhqEWDYy+PSUl
	8UeUMDiEbg5HjQ9vioIWQtzd5UNKdiFZBTPys1Z0s95Mcn2T8gz21t8oO5SFyKrv
	Z8Lth+pA852Wi3JgeZdRFIYR7j+dkd6Kh+xAZLLddlokUgDu1voHxJH8WFYkThTG
	ACFalp9zKXv5X3IQJdECjg3hSCVnSNQMTmfHff8V6AN7tUN6iqNx/aXN6CVskpu0
	n7pqXWmVlo9jqermasEgkNxbiCP6eNJvp4gY3IWIvhKcQhySEV7hozN22aMkGTOQ
	tKr9Ew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4hkvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:57:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c547ab8273so51269185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 15:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226651; x=1746831451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNKChsHdf8IXoQprYYi5KKVigp5di6ek5Hz3xT2EYKY=;
        b=X8ENlFc+RPVdJ2NMaTjfXoz0Qs+pTWBAYHVXyHx2jyPSyHag2UpfH7FAiND4slHMNB
         xMpGTu2e7f3r1sFI4BbrsLkm/7SeRLxkGIAr2zR7TWQqIE2k2t4afYM2aJ9BtjKma6H6
         SlqPW/qmKk2O9Bbd/SMhTXQiHoCNu1zzDhHnHuN/v7pWx5RNCDRQU0Jeub+7ktj+iTC4
         zT6/DPKhjxD6hhl1ch6V4C/5mU863HOgPJKsT3CapLYF1XEzfwh3kpaj2zMtmKVmdaMX
         /q8ZF2qcbrSSB2F5njOowEyZzF7afVzbyETcrGfLcq+7SrdPu9bvNqXvjIx8aygkKxwG
         +tuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVv9y1z8CJFduV5ftqCjYdoZSgG1gQ7otX0EqMfcaZ2rlcmcuu+uLURoVtn96I5WbNG7CB7mi6ugncx2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Wn6TydUy4nTIsvdstEzMR2XlK4LdZGnVSiPIo+ELH6acOBbf
	/CosqxcvGaL6F//7xDXVzOHYElpu9vFnyKX/J7M/jcSMLgrz7IiN1xbmc92t2b+QfSoe8v4OcLj
	Hm+8+FYppfAIap2FriBCIy58/V4SVAPCBt6pNykZjhe//8+3AC4GBpDW9qJfOJa4=
X-Gm-Gg: ASbGncsvm6r5+JivYCHhiHhXkWkM/CVmV9CjARd1dudvSpBNUSxMCMgI2/gl/Rzcktd
	Y7BomaGnqLYTsSblbSodvA3dFPWwLz2GqcjjE4oimJ1AnkfCMgJKsHrCyuNm64LyoQGlqs/kxOz
	0l62/E/4qYUBmGHOSs1EDrdCUjdyRT7s9yQb8g1vvHjA6zJoAZTxZLXINjlCvxJwh6sy8xzJ2fo
	15yHrpRBQrlSpWdRQ2XPGB+AubLEKsrCdyHW4lA7Ak2whnJrrDw5yg4cIPD4LKI4xwWvzZs/gBM
	RIiz9OdhL9gGME/RWwpo0Hz0YM/G1+0PAhren0wJnio9lLXa/GsOS9wjLFcTftVccZ0=
X-Received: by 2002:a05:620a:1a04:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7cad5b35ac5mr203475385a.4.1746226651412;
        Fri, 02 May 2025 15:57:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqMMtF1+Riq0SuaiuK3gIeYBYE+/iUBZrjYNrfHWu+zSB4KAYTBvY56L6TqJmfl1HqCBJgnQ==
X-Received: by 2002:a05:620a:1a04:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7cad5b35ac5mr203473785a.4.1746226651023;
        Fri, 02 May 2025 15:57:31 -0700 (PDT)
Received: from [192.168.65.170] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557c4sm1789165a12.15.2025.05.02.15.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 15:57:29 -0700 (PDT)
Message-ID: <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Date: Sat, 3 May 2025 00:57:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
 <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dEZYbcDVDFgJHo1sEtyYeTv8AL4p9txJ
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68154ddc cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IQSbClYQ3koHTJNU0SQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4OCBTYWx0ZWRfX5mGjFO9qKq5u za1A707ANJRXkB77XV9H7w2VUyL7WObk7eLN+fhtB8WY0kVjILhzz7J6/qTc4a1aba971uoVyNM GbSvnF87iE33Q6uTrWW5FcJX/3GrTfrs2fj85fjXFOZHrgGIxF1zL4RCB7AYzg8bXUFgdAb68Sy
 zfZ32EQfIq0B5+JiA/fLjPnK3mx9XcYhUFV9x5/kv2ZFf1q+7hdpFKOHUgo3ycNx1vUr5pPMgKI 9MGVTndt1xhonXGQ2PjUSt9JlflcVNhDEsMlwbPEZCDo4cWVQFBpPLrN+HbhfStkVNCfSZMeVii cW8STakK42c+L59XSYhB5klV5CZJBMp8IaLh5iyoUC9uw8Q8dzMq5OwP1nk6qEJvdzKvl541/7/
 F2PgWVrCDVKvNm3DGzZnqNT8X2L/gcE3U40d8zSTOHaNmJUO2Yw70HiiwRlel6y+oiudSGV6
X-Proofpoint-GUID: dEZYbcDVDFgJHo1sEtyYeTv8AL4p9txJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=723 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020188

On 5/3/25 12:55 AM, Dmitry Baryshkov wrote:
> On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Have your tried enabling it for X13s? Windows drivers provide
> qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.

Forgot to mention, it powers up and exposes the expected qrtr
service on the CRD

[...]

>> +			glink-edge {
>> +				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
>> +							IPCC_MPROC_SIGNAL_GLINK_QMP
>> +							IRQ_TYPE_EDGE_RISING>;
>> +				mboxes = <&ipcc IPCC_CLIENT_SLPI
>> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
>> +
>> +				label = "slpi";
>> +				qcom,remote-pid = <3>;
> 
> No fastrpc contexts?

I frankly don't know how to validate them

Konrad
