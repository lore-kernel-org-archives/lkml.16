Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A62295DA5
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768202; cv=none; b=Nv8F0Zizmok8kU5os4/dQhSgL+ajlyzJaG/xRr6HSQHrscEubG1x5i3PYzEV+zT/QCczB7m6Hmc2o/Pe2i348XROs/aong7kEX/BYAHTsk2R0oQd4AHSNbJXyMvTJFjpTYA+hLKaIN9Q4tPnbg63L4w/z9rv7UxYmf0XfbI3544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768202; c=relaxed/simple;
	bh=0hX16wRB6R/CkbiIPff+ySvhOhI7/tVpEaAh2GEXg2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhxPN+o5ma29IPH9JsT8+gEzugH6e7OInEBaCzUdakdDaMnmtP38FfnZHTIaRTlW9d5ByyN+TrwVAJ+9teJhelnRwimbnoE5ZJryCLpgCySDdn3oKbCRY6HX38FiIuHXvrU8yN+UjXZFtGKWVrBTHhCeC56dWOy3o54mPqi8DSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzPbs2eQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzPbs2eQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8maQ9014676
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EczobUY8gqhl205jiI0S5ucvxF158i19VACTDqYqsuY=; b=QzPbs2eQNcJKWikT
	niyYMkLdgelq91vI/gR+9cCGKktMsIbg9Z5a/OV5EMqpkUS1IRD6cZ1l87IIdHXO
	j07BucpbXdCo8fPQFmxC/UuGEhVhp70TyhTD1loAw8JsrDnFjXwhsElP7AuS+ZWp
	xhjk4cuJd6bXeX4X6GwthmSN1WAKq/HR4ip/yIUAS2SEcNe7CCnERWnwUe4tTFB1
	15A0hVY9L9kSPv9DmVjzf1enqPLeZphmdzhlKEkKpFEpySGLWW+EmbSmuxMGQ19b
	kM2QvK9TxjtV529THr0socdu0+nBPqfNXCFyC9jy0eKgrZa49NEC/GS+tZaGxrxk
	Yn0m2A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpv980-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:29:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6facbe71504so10740206d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750768193; x=1751372993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EczobUY8gqhl205jiI0S5ucvxF158i19VACTDqYqsuY=;
        b=RacSK0niiipc3B80FckW+fm5wH+KtsNVCR2JZsUL01sZ+z0CgCmDseybHSAd0BOnK5
         8syQv7CCZ61NA0BWxwhhLlVPcNuEAmTZgvI774/aWl7d5twzXcVVtzs1watWlel8Amy+
         tESI/wZVkmrrz65Z439iWYDNiXkKO/tEkOsHrd0JmRrBWlZ4WzTT2CjK3qLv2+oy28bB
         L8dfZkGlzwDDRRk9+PwKrk/7pyEx03WxZ7nNqExMTwKlfYx2U/7ZgsPrS+fjZJfxDuHH
         DUxzWPkgyt64KjAle4wAIKU5PNUICxiFfpGed/XBHWubcUqO7vKhz2aTfKcvIIsPMNcm
         j0HA==
X-Forwarded-Encrypted: i=1; AJvYcCVqHngVXT+tlm3whFsqVjuyHNYX5QEHrlSu1oJD60wKrt5pDV9VcblZtbFJRwlanarcwmhW1rPLrcbg7P0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzacNdkxMB/gBEuqgT9h6IpqTehR3gneefVuRV0SyjTvT//GDjw
	HD0+vVs3Ab7GwRPxxbGaPoGMs+6vn+VE+i4wzk0ZhJeRjVoj+6EQY89cRl8QNh/HrwSwgLjz+cG
	GXnz8Nzd/MAcb4ZKI35e1XC1UnKXnldUmXXlwkoeeNAduFwj7IxkcqRN+stHWLHEPOgo=
X-Gm-Gg: ASbGncvx1Zf0xRief0FjSL333/+6aYBPU8JgJmQoGjsRVbxNaNuUoURJoJqZys+3BQ5
	9dcKhqKPn3D1VgpNkT0NbvYd79cXpuGfXWJNBVK6ssFRZRB4y7wUIPGrvFmmU69s/IzDnQ17BOk
	1zjJpzVSOCBfief0KnPL5xanJ9HdbdGDD3jujAMlvoUXJh4hBEFeeFROE9/G6As3kGxlodAx6J5
	XFUSOWfp9pJoCxlyL/UkUcAQhO/OnR5lcklnSWQaXVkCp8mmoa2++GZ401TBoOAWU15u9S29Ifu
	/RFMJ74621mUkKeitGoZk5l69yBX+DWNBYxwGug2WIFwNlXVKwvaO85OMptbe0R8P9hdCU0PLmn
	wuVc=
X-Received: by 2002:a05:620a:1a84:b0:7c0:c42a:707d with SMTP id af79cd13be357-7d3f993a910mr848032785a.15.1750768193477;
        Tue, 24 Jun 2025 05:29:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAsRWb4D/ij0+5bsZKJQi19Idj7A4icHhoOH2B8P1pQy97MMUcTrNQnVuF5a6HlIArz9h5ug==
X-Received: by 2002:a05:620a:1a84:b0:7c0:c42a:707d with SMTP id af79cd13be357-7d3f993a910mr848030285a.15.1750768192993;
        Tue, 24 Jun 2025 05:29:52 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae08598b7a8sm439944466b.184.2025.06.24.05.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:29:52 -0700 (PDT)
Message-ID: <02c7f90d-73af-4a34-bfb5-476aa87a9431@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 14:29:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <20250624064945.764245-1-quic_gkohli@quicinc.com>
 <20250624064945.764245-3-quic_gkohli@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624064945.764245-3-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685a9a42 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=yCzbmmpcYXQpYh9mHnQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNCBTYWx0ZWRfX8VAn6aGzjdKK
 1c8O5oEBz9AFk75y1S8216Q6p5BIUkXNVRCDtF++B9ly6qOCq+7IIxBnuA/6EjxEXVgXNWOnbv3
 cyRCH4NhnXVghFhvY4AL4l0kpMDDWNw2LB/XtLsrHMvbijw9xw0DZzVMVSBgevO1OvBWLXHGQUi
 QHB0oorM64ppj09mtz8pQLjGEU4AT+eXRg4UjavmQN5wQrnLiWNlNjl9PYBGMSJOmR79N8MxuTY
 jGuc9MUZciL2FmkWMHxUu5g771B4CGPrI2qqBOZCtZApXDWR5TBu/DU00VOZhJYEYfw2W+lbKBP
 nJhDxv2i7/2z3cg74sZyj1x5dvL1ri0XSMn+HqTcXrS6RrP6RGRGmqkolLFQB531vs/bf83anUq
 8vOo38hP4I77oR96UjqO7+rZ2OvD7cHk9wUk17nNOIYRp0EyvJ8WNB/1mF7iD3u5sNQNGiE8
X-Proofpoint-ORIG-GUID: JE26QF2OV9chULn8cBR22oVqy6iHF6Sg
X-Proofpoint-GUID: JE26QF2OV9chULn8cBR22oVqy6iHF6Sg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=700 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240104

On 6/24/25 8:49 AM, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi

It seems you've made hand-edits to the patch, which make it impossible
to apply..

Konrad
