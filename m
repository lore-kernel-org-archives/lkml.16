Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55667286403
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 23:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748646047; cv=none; b=le42VPu0/HxiCDbqmgEZdI311THMKfA+JDHi31uLcXBtN6PmD9EVt1jN4YxouzoaCFYnsGvfOJQyvvkXnX064ji30Wy/rtJFmr7VMRzjvSlQhJdCKK8z3TLyOojG0pqh8jSjCL0uEgGfzzHgT5UC20F+TyMzXqleifOhuYv1D6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748646047; c=relaxed/simple;
	bh=LMN2CJvWjnSp1DFxtqbW5/P+SkmfTosLclftY2KufBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFKqgXB38m1B4xsDCOfM4Plm/hw8Soa3LR8ddbO4HyJJE4hxf40GxSKo86Afr+z2jt03bfjJrLLaIHkJaS+DT1pd7R/xbt9uHJ0g4ElJTOO/faS4kuCh+MIQ+gQPLnsScUcSNcm13MLnmwXyHvAcfqieF1W6UAFVKg8Mi5sSe58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXEUZzKe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXEUZzKe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UMEDGq013815
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 23:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	616bsY/nEBSBHhfZUGqUyy3WTHSx4fm6iqXWJiW0Obo=; b=LXEUZzKenzxzgwZV
	ppg18kMac9P4rgtAoSlwTqc1i6HLV9vI1EPx0iTdMCTP88OZO9REiY00KL8s4nWM
	5SnUZ3yVFjpIoDFH2PzVoQH2gyfQ3JnxOBUK2qscR18DQ7fPaCvhS8LlPBhqzyyn
	A8gIfosnLPux9ltX7pqiV8elH6RitpidT+WVhdf3ycTdChUiCwv7TwClyaOLmvMY
	l31kRPKfLmVJ+KYC7qq1Tjaw505hO9Of3kYUHFtcH+dCm5WnusRq2oJQeEEOXyZa
	3txNbhGnbonm+MZbUbJ1jfyzo7Bu02BUKj5HVsMMNJn0yYFjRhIjxQLL8OesYDdE
	MfRVLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm4m8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 23:00:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a43b81f624so3393921cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748646044; x=1749250844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=616bsY/nEBSBHhfZUGqUyy3WTHSx4fm6iqXWJiW0Obo=;
        b=CaGrZIf/wRe+tx9Bk3EMNXGVnLqN/ymGx2IWwCZMA7tUyhmfEi+2E9hXOFjCKAVX3B
         /HAyq6WKvfiaBmeyjlr0KZx8xZkuUrYLwjc35qaCyOmUmD5nB724tYauTq0LWV71pZhO
         8cTKuCpjgF0ijrlXM2lliqHBac8clTuZkOQhjGMl2d1dGpg5YDQ1ZEqLz0cZZCoEDzFD
         bCzml4UWaDnto70ZfqTfO481/kgLJ/+CbuDsmeuHy+ICvB0A6lCylWu5xn/5Q8GOEYil
         NbyBlF9EcH788ryM4KrlDyunsxIerjerk6xAQy2sGJBhX07WdChnyPwa6mf7fg1aD8+8
         NQyw==
X-Forwarded-Encrypted: i=1; AJvYcCUgo6a34bc5ewklxxgP3gjP7DCOqOcZ2hfXWlkU3VzH0OUvlnxER1ji2AvoTo09Iv+4a9hLMpxtWrYwWrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPezyCnH2apKmseZo9LgvNgJBB5XnnUq9kcWtlx+MBniBeFq28
	2HmTMbZal3Sfr2jdDaEKsfuiTmKsDouZeDuE/Z1AAMTtLkYisWbY+9ZcBAhWSJdPH7MrToQReKO
	ek2aEicrs+8+cE13DOEVwao1nKuN0hOgilN+WJqMBWhZ9MebniZPDUajliehwyAASCo0=
X-Gm-Gg: ASbGncsQbELl0ZWvZrXSY8SvLtJtPS7350YsX4boBi7Dhol0K4Vuh+96cBWRnglVraM
	zfCVXukdBnkOInU7iAyitEWh68F/NffG2bMeOQ44EIFIGEp1xSwBs7z8/fVz08Yfw2dJ6DHkNo2
	RQbwNUz2QiB52nmGTkUxmtIIfEqDrofmnCbmBLNsdED3XSj9CSMujCHZfvtPYyqebtf0ISiPuw/
	Ptb6uIrmWQsohKaa44MhwqzLojD/MX6W+nBz/1eMSy4vhTsSd0Hd41cyer8OR0xC8KVD4RoPumE
	b7Wss4Y9u6OlvObZ6ZFCq4avR1yk8FTC+R5HNvP+Kptn92tkr1eA+qW0kdzj9e1gxw==
X-Received: by 2002:a05:622a:1995:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a44319ad30mr25043041cf.9.1748646044074;
        Fri, 30 May 2025 16:00:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK6iok0uvIVWvqpCOyLIDjws7FdwQixOfUFwlizxjEFvY61uTtRtd0YSIs0q8n6c4uFb7yNQ==
X-Received: by 2002:a05:622a:1995:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a44319ad30mr25042591cf.9.1748646043455;
        Fri, 30 May 2025 16:00:43 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c2a7bcsm2304464a12.12.2025.05.30.16.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 16:00:42 -0700 (PDT)
Message-ID: <4639636e-0544-44a4-a997-2969f4661bd0@oss.qualcomm.com>
Date: Sat, 31 May 2025 01:00:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
 <20250530-videocc-pll-multi-pd-voting-v5-6-02303b3a582d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-6-02303b3a582d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U4ubrL0UMr4GCAsflSLY-zkkcFsNHlOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIwNiBTYWx0ZWRfX5wkVYkZBJM15
 ju/nBhN0Vwdw504H/W3P6JTaf9T9I/658wQX3tqgqcXh40HgIvmtEEC1WzA0CmLGn/JQzJDyIPD
 uS682nJzEnMDJIMM20TsWZiAlLCBadCUu2eEtSHKIayftbfHr45OzkAn8SWYpmHwjYXvvQKyc5I
 O4gQdVSkoQc38fIGesq21pqxM8ERvi9utkp1l3jIDdT0xmrhtU0w+GsWURedGZsfKJxcEHkTYzd
 fkdoipOjz52EXvG0SZ2zydEAK7mupsj1RDsWvkv6Rc2MbdlSCZIk5NvWAfwQ1JKb/4NXUhwLNfh
 1oqdZcfROzf68pXZ47AnKZzhkshZujimpB1jeN0GCqZ8xtG9c5F2RdMrq9QUPGfrZPETvz9Q2J/
 Xy8+j9iudKKSn9DWg3epHMTrcoD0AQP843AZEWHLEVSbEWfPGRIG9XRDFY9Z7uafU8FsYHFq
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683a389d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=zrwMVDrAeVkrMBg2wiAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: U4ubrL0UMr4GCAsflSLY-zkkcFsNHlOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300206

On 5/30/25 3:20 PM, Jagadeesh Kona wrote:
> Add support to configure PLLS and clk registers in qcom_cc_really_probe().
> This ensures all required power domains are enabled and kept ON by runtime
> PM code in qcom_cc_really_probe() before configuring the PLLS or clock
> registers.
> 
> Add support for qcom_cc_driver_data struct to maintain the clock
> controllers PLLs and CBCRs data, and a pointer of it can be stored in
> clock descriptor structure. If any clock controller driver requires to
> program some additional misc register settings, it can register the
> clk_regs_configure() callback in the driver data.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
