Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0771E49F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750984056; cv=none; b=WAS6PblaAemalykqRTCLINfzsEo3qN43ahhKEzoZ2KoEYW/PRv+Ue0IUUA6eCHevA2woJFJPXdws6rtC6xd9/EYprfDmFqc8J1CWQ4Nk+kaho7P/lDAb8NB0t2sr2vTZv3ysSSIgvlDZQ1S2A+Ob24k3YIyCFnwdnzeouyr5LjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750984056; c=relaxed/simple;
	bh=FLgR1RAVwQuARNNhUbrWo4jLrjd2p+X86Xi8nmksNs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQvpEZUqc6j4rph+yMiibQ7QaPwN6s/2oh6XG97J/GgtnO5IB7nwEYRb4Qj9W1Hwx7vSmJV0Bd3g4KNlN6EU0IaK1eWU6wJ08guykAvQ9SbZFrT5MJEfsWyUDvbpzdZZpOA9vC7I5sk5YYT7FbbXflSrieTJrcMb/A+0HTJ9svY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0HnS/Ui; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0HnS/Ui"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QCOUdA010573
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/yyQh66OFWOTcOVBQEZDbZWDtw0lJCwMvCv/hgMGZU=; b=k0HnS/UiKJbD5yzS
	M/5PnQKJJNXz892+Cqd1alpRMF7dpaRVesfActI/hxJ7d/XiLJCsbeHUbgl4gJyo
	zy8L3VmnwE3h5E14/63vS+ejWy1JavUUKIb5fndNV2cFzy0MwwBCtIa2KMXEd7+O
	K0+ahaLqgrW7h6QRC+K4cwqXUnjVztBynpSVrPqG6MR7HLIbyuh72dpldId37ee2
	+RfRPnB96QHDw+mUnMx08KEqdQhXEWXkWCzPc/cULhXs51jbA8tRTfV1alO/mMsA
	3a0X5muwZ0LAsBSyErQsRFdTjVrMZzAKpmfYNcwOoVMdU4t47yqGdXyoE0gs3m+W
	gt3Qgw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88feq29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:27:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a7767c5df7so449491cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750984052; x=1751588852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/yyQh66OFWOTcOVBQEZDbZWDtw0lJCwMvCv/hgMGZU=;
        b=YREEbdfAw3RHV8ZidGRuOlMjhCxLWbG+Hb2JJAa6BnMMaMtwvycWJsrRM5r/AZYNiY
         2URTL0m+cEPCXCB66wRB/6M/GkDrdtNOrcDgiY45psn2+h747mCuO9x6ROZxyAPtitn6
         NXgpSGwCuGZ0fJdKCZQlg9+Xx8jKfXydHJ6fZcT/Jc8XlW4Cq+LieYvf+60rnfYoCZTT
         l3bKjzxVD5R+QAcMgdvdmquzW3RSgVulzai7KnzpTnGBHEhXrNo05bE4Xioou3L5psnm
         ri0EGxW8Ty5Cmpj8RIsd8uS+sMoA8lDl9ZY5iexDQLbr8MonpPcVwi60/iATmsToAzj0
         m4Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVWxYhK933afWLwNa+9mB4uFGdw7zTUi7L7Vk70RtwO8uwoAFmmB2Munnd1JnP7tRJAa3rO9LziZ7tkZWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtKAffcnciWkUdNOr43dJlrqIbDv56ByhS+cjfcebSLJPmH7dQ
	D/8YjwI46Z+SUo/QH8NGPj2JePuIoLEEcvk3Fkq3rwl61tNRZcfuIGhfH2cxuSGhy/Kvhtcb3o+
	xUn3XuCeQn0KYb00hLHyzeX/IrYHZgS/FMeyyN+Nxp8nuIbnNAcR0Dsyg1leG+Z2397Y=
X-Gm-Gg: ASbGnctszFvCeKsD+WDPd3iq+rsdT4Zz1a+IrI/r+rJZoqsra1+A1ZVO6/5zz83Y9rd
	tMTuw0EsYS407wxzmWEDJII/7I8N6bfFXn/RPKpEsJxAxI0QjtDdI4+3jRFE61jEykV/VjU1mNu
	Zf93o/Cs2dkh2DZqi+SmU9nMPHAdCEPFG6qTmdzCMJlIir8HYW496K75H7yOU+rDcrk+XbEBaWD
	7qQLNngNo69DwndE2utu6oLKbeaWvduP/0AHNttUoxWCKCusAXHE/FDW7oZgqjTjvgplM9O2U/M
	M85yl/voWWDUhjJoOaqzSag+lTqeGvaAJVNLbdrrzdiu+IW+5ruZZgXGpU+t7XUSMiO/4gkDWeU
	dWMU=
X-Received: by 2002:ac8:578e:0:b0:4a7:6586:8da with SMTP id d75a77b69052e-4a7fcab4e4dmr9723891cf.11.1750984052216;
        Thu, 26 Jun 2025 17:27:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf+Fm2VsB3+UMV4et8MXVrn8NnN+RwmgZmsOUUV51chV+bVe/y/ao6xi3CeF1iYXaDIwscOg==
X-Received: by 2002:ac8:578e:0:b0:4a7:6586:8da with SMTP id d75a77b69052e-4a7fcab4e4dmr9723681cf.11.1750984051724;
        Thu, 26 Jun 2025 17:27:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8320b5aasm690791a12.76.2025.06.26.17.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 17:27:31 -0700 (PDT)
Message-ID: <a703a581-dfef-4ead-b5d3-7ca75424c898@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 02:27:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
 <20250625-qcs615-v2-1-0f1899647b36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcs615-v2-1-0f1899647b36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAwMiBTYWx0ZWRfX1HLy2dV2F5he
 sMQLWbAQ1OzxnxFx38G6N19OR/BJh3Q3KKkx94Zo1X2iEFhNPmuRZuAwFEW4Lq7YexnmYdMhJAw
 Gl5Jd8hgj5suoEkpyUC2wBjMQxUIyYy2kBbVrw5v979YCVPDyr3ktg16SUMbNEZfs379lSAFbvZ
 qriGqvgJ7JNGaIyPKvBgGigJ9dWTWz2pt9xagqbAJKVB1l2dhJdxVqsDGOU1MSAOVBSxuOupZZF
 l5v3ugtJ2oIxo8KnyqjkDdWXHH83VooHqrjcvwXAGsrjQnN1QcNc/qLxBK+1PkTyPaq60ygOjxv
 yCmeBVROZ/KDDNGq27fl8q+viLBXXA6JApXQ6I6QXrEJvoyS/6+JZDIzbXZiCGUNululbFQCL94
 a4P0axeiRoykqPKlc5tX32jHYfJ3C/9KvAdko6xcxu4eXUaIprFh1ZBgnm6lnaLvQvxVvgJn
X-Proofpoint-ORIG-GUID: 5NYGEzQApTdCCpNtFk7ATbLZOeY_kgWA
X-Proofpoint-GUID: 5NYGEzQApTdCCpNtFk7ATbLZOeY_kgWA
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685de575 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=BecDG5H4cdSP3E7N7P0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270002

On 6/25/25 9:55 AM, Yu Zhang(Yuriy) wrote:
> Add an original PCIe port for WLAN. This port will be referenced and
> supplemented by specific WLAN devices.
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 7cec7f643a84bd59dadfc4f7b8d95f52fc81c7f2..c996d5a9e31ce283109d55fb61db8e09d7edbf02 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -1181,6 +1181,15 @@ opp-8000000 {
>  					opp-peak-kBps = <984500 1>;
>  				};
>  			};
> +
> +			pcieport0: pcie@0 {

If you're going to push another revision, please name it pcie_port0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
