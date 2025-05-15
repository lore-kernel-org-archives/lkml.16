Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F69D218593
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323737; cv=none; b=NCid27TF7jwpz6En0Pbi84FeD6LuzvK4FPe/aixWkIJdIjTFReJ4b26xjVN9HEK0UaM4Myx+k8tfpQaf/mw078C916mIWA0OmIYUCXBYWyM5kiMCOw4TtQtkVpXkk7oom7wXLOL0CC9nRppzPn7c179j5mRBrtcOIvaWx9Ms6HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323737; c=relaxed/simple;
	bh=HuDMhaU0RATL/TD57a38UuSJoa/rxM9NgiPso9Ov6Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8YqF9fx2ox8UAiXqRL3kNYj1ABThK9Bn/KGicJJFm0M7nwxAA/onxe+0Fs4Nmmiu+QC5jt1S0aAvGOkDevf2GRk9TdarY0nKewiuY5virw52234/e2mk7GwZaKwpEBan/u7jpFkAmScRoNd0jpkTTpDn81O7nbXgdqjOHEoH+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWa4vlyv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWa4vlyv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFLY4009277
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhRouZS0uvAg73VXrnNZeOxAr2zt9QiKx0m+FD9Zv8w=; b=lWa4vlyvnSPQQmqa
	7j46ZEv/0SyU1wEOkQQiNsDI4q9s+OiavzmxmsyMvL2eDdvAGc43N4JC55229SRe
	47117yV5PyO7xGUtWIyseVTVXCFo5FWruiZA3Qm9ZZBvp2Kf/yKqnGdgDV5ZFsed
	8gkkodiRVqBwcJhLHfH1JW/ldydFhRyYFDQF5PlYrNJojQQDNhm0S4RHi90HVF7+
	qEOtG/+8jXxc2FMAmp5FiUQzIURlKn/+gpHOWM5IfMMoFOmTLIbsVl2Hqdcw3SQ+
	mxf0p3dgVJnsCqOpZ9yhqeZHUdmXb/Hv2N1OInQMRatyuBChYvrileBjq0WqMBHz
	pvzj2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex6pey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:42:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f89a2df0deso3295436d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323734; x=1747928534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhRouZS0uvAg73VXrnNZeOxAr2zt9QiKx0m+FD9Zv8w=;
        b=SN5jIsV3/DOc+njivlhwKAaua+gQnimGVFAsAFiAjSYUrvm2sv/hdZ6aYznms8jLi6
         XRrJ6LKHuBFaKmBtaVpQy+R611oe0g0YH6aXS0HoIf9N2Yw0jC+yorDeIkhRXzBRBlzJ
         1sXo/os21HRHoBouDA4w0MhqUDaQyhotwWXGH0MeC+DXX4EEyNHXBjCsLKCGGovfgLnV
         sFFEZOqEN6LTrRrzUrCbr17ddSDVF3Wu3jT8UpT524o3X+JkqlvZOb49cHiaXImfd7w8
         lxiDRW4uf/oAVYh7u+9OLQ38lIYb0DaPvlarYDeP62tuCwEBFK95zBUiXkxHYibEce6x
         LyWw==
X-Forwarded-Encrypted: i=1; AJvYcCUWft2pHkWBMfJy2ZXJyx4uIFl7rN0curE1ZCcLNRn8bj17aq8poQhAdPEi+jJKBXlaIoXcrFh5AdUvvmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YweML3aicEx4OqTGDgFLYvvyvrK19J95UrlTcISs8m9MEaX3Sni
	VEc+Lez40/bvWSKVjGqW3BXH7YWflalKL29JSIjGGZ3e5c9jcRYo8E91UtbdHLxn7BkxHx83FUu
	ePZoqsNfjJuxyjdgb63jCb53wHvQYlmhuFPMFu3MC1SQLpSntCxK5W+7ghK7BpMwN00s=
X-Gm-Gg: ASbGnct/AU2Bok4C+J8qImptDYv8ZNBFXyb4oRTVxjuR6aVIah0/gqAHFMNUYwoS/S8
	zpnqibXcVwqVr01EyxuOFRXp7UJTkUi/TReDGBOjMxPF83lEQA/MjhQfsZ3iS0Uh74pazwzZcFd
	0Z+yWv7HTz51R9VdgosOQp/8+ZdBC8eogoyIKNspfVUDWo3ncM9QiT6dq+SG7UJMQFSDHXQvjM5
	cqoAA1Ae4zGswVHxgurGFkQb+xSb7BNkRVwHWkPm25LUOHNwQjkk8+a7NFz57SXffwvbl6Gyt37
	5XuUlyOUZNPTFsO8+MFS3Thkg/F/01V5eNTCrzuK1MBiu52zvRQNuJ5pd8T3vnbPgA==
X-Received: by 2002:ad4:5c6b:0:b0:6f4:c307:5e3d with SMTP id 6a1803df08f44-6f8b06f0c57mr1592306d6.0.1747323733814;
        Thu, 15 May 2025 08:42:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfvUSwb5Jv+bvNmLGRlaYTg/YTUTg0whxG7ImoPz57t5jBTuwWR5hdCmSnWAgzP4lkq4fbRg==
X-Received: by 2002:ad4:5c6b:0:b0:6f4:c307:5e3d with SMTP id 6a1803df08f44-6f8b06f0c57mr1591996d6.0.1747323733310;
        Thu, 15 May 2025 08:42:13 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d442069sm5528366b.103.2025.05.15.08.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:42:12 -0700 (PDT)
Message-ID: <62964e6f-3b09-427c-a71e-58aab3e22e42@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:42:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/18] clk: qcom: camcc-x1e80100: Move PLL & clk
 configuration to really probe
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-12-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-12-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX6v13MyinOun5
 MYcfUKUb0/ER0K5YU4puExa/qGVSxyHElGjxtGOABelg1xBu0NRZm/M2pr9bkIqUcOTr5H9XeEk
 EFaHwkZlkOn7uVWYErwji/DZ6U6HelNvpJANUysr2/Q4X9o9dj1mD832hrFvRqAkSBtZTPooosj
 6j0HxFEcjyU3cLPH0TCfIbjP0wQcf0IKcLY2zU6GXmG+RaqWmpQCIJ0E2RZNl80hD9cRVQdbQBW
 tb62u++vvEUit+8b6NVFkC/0ExhRtgedOAmOrfD4qLCvRyFcTftU8RJyKNo7pFq/lSwyAHm6uJF
 0r2QNDEsYbMZ2invwaN8yABxvaAqSXJhmvQG0MgR0VyrB6R/rq2Bx6P6/TKFwzX9VHe2+ma7pYS
 4dKEA4evDKxlNF9CLqebYU9eLcf82FgTgMSLs93vmSmciMj4Ye1rrUlKUxFwbMcJiWF/WYSJ
X-Proofpoint-ORIG-GUID: qkxll4YZ3-F0sOqaitJyCpHEDXV-ucKF
X-Proofpoint-GUID: qkxll4YZ3-F0sOqaitJyCpHEDXV-ucKF
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68260b57 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=R-MJ-YjwOO2PQHfhffwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150156

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Camera PLLs on X1E80100 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Dell Inspiron
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
