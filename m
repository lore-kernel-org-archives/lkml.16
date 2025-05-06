Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7790427EC91
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533303; cv=none; b=kGje9IqvPyU8NhjXM9eNNxcFatf2hsJuA7xNE9vAOsSPA5k/QqGDnrqwtcAcES41FP1/7oJUTPKbS4o4yh14X3J8VIlSjs/6jrON1hpe46v7wDprA/fWJkkUfbwlNImdhmVYTNT94W2gzIF95BY2okK/0CY/h2tDa3QsuJkYx2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533303; c=relaxed/simple;
	bh=DdbmmhonCetUBZsFTlekD4aubGPPFIJ9ItkmtXG5bpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9EyWwC54lUwvRISgnJS6071X7S/3cPqHZ+O6SwvHlxRzUDBhhEpSu/nus014/yrhWGEQoQ3a+4oNtGwM1nCa3H30b9PATGFQJgvyMUWkV/JHuCGrZxcaMz+tbRCssQFbQtnvFMoI+IBvJSIemQk8eS8dBtfiEu4wSetU+HaIfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3J1lOd7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3J1lOd7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54690i1G002690
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 12:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GD4lMZs5a3pKzd5cggQ3wq6Y
	VdqPYIs1t4O/gynZcKE=; b=E3J1lOd7/umRoIoyHPXx+HWv+BhAjFG2wgSGRs3h
	4REjvf6kVGrZ4z/9aFucBCebJg+hkZWhWeKtJ/pvf+eXKNYW8Mz+Hn3TVzzCPHVr
	GpAiYsTReVbH0TfZbMWJ79HPUWDamy+npijq06Fp5wgSIAVsSq6mriISUQUf0wxh
	FAbhD38u1N9kQRyH1+3iWKXX8pau6ucut1uB5RlTSn4ARqo4fSLlpfn7HFPpdpzz
	LGTFLLo+ghwWRLGOLbyHoktz6neYZZJ4G3o/ZGxEy5OYD8PShvIehuJJkEBe/smm
	Qeg54HJborZn1OskGXcRmpjNSxsuhHjqpLVx+sXsCKbWiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w3a4ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:08:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e6f5so1434968185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746533300; x=1747138100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD4lMZs5a3pKzd5cggQ3wq6YVdqPYIs1t4O/gynZcKE=;
        b=h6maistFFLoSo85T5Nl3vgrvWw8Vxe/W4/YYUTq1IhQqFjSMt8ie/i0NP/4G2b7Sev
         l/+WONCpyBS82eY2AwyBjzsnLeR/jF7VNgVEe8rDAXuFMmvsG8WJQ8crLERQLYq2+ZsA
         CUpJdQ9HdHLRBpTcwCM1xdO6+58p3MYb+BZe8i2zLJHJpfBjksYCxvMT0WbVdcZglpXB
         Rc1APgz1wAXsy0TUCfJtohPDhvuS8arKOeVcHn+svM7sakvRAMWO7Cc5U/w9IfAqz2tr
         dXh8kxdQyQ0AEPstENBHE5OAdMTYySBT2ylZo6gtADQ4rbq6zUL9eUzlywQotQ8v+jxQ
         yzYw==
X-Forwarded-Encrypted: i=1; AJvYcCWfiDJ5PF9CXWCqIylV63c62juxo5dWGrzWhyDkskmnkaC1pdtocM52ze9colPki2OA2HZZ/pWL2pY+htE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu5Q56PFmMByxg+E2nTWJSu1epNDz87oLnbifRS55LW2HVS3N+
	ipGzgIOh1SATOg/zbE9ch7OdWOMt7dkYRAByB6ixEt9W0HFSd1Aux3uoLM6X921z3trbD7KV9zc
	D8R2TL+1lx54CgvK4yUrnOQqy5E2Bpb0Po+Wq3+v6JZEPYsiUnKHUKhHNOVsfeaI=
X-Gm-Gg: ASbGncuncFAh9rTlRRxt1sIOMz+9Qa86oPtGa7N6yw1K3FnAXgSAg8FgcvvPcd/US6M
	vyAaTbLspoopyue/+NSbHnDCyUzSfstl0m9Nuvgytcn9SpUaU2VlcmAV5+a3cV29VQ4bF+OKtYR
	bmGmZs8tpkhMi+TRZfmKWp950qMJWIghCc6dahAlMMzt24VJBhCayiwJ0FZcH/eV8blVRRR+0QL
	NhVrUYg2YV4o7b5oautWZfUYcnfUDW5ndgIv70Ey/5xFhF12PTLzOKZ7X9z8KBExOXTjM9UDCEq
	RYke97C63tDyleVx7sB4S1W81Kc63BCIaXyy2p0S0cgrzJgdSeQZx/Def2qrljp2XwqZ+I1B7FA
	=
X-Received: by 2002:a05:620a:4629:b0:7ca:df98:2f6 with SMTP id af79cd13be357-7caf09bf07emr524577685a.43.1746533300208;
        Tue, 06 May 2025 05:08:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz6fgxkf8GCZyugOKLOyYO6nxMMiDaVer/gkboErci2Inurno93UgLLdfrFIxkKoZ4FWDdkg==
X-Received: by 2002:a05:620a:4629:b0:7ca:df98:2f6 with SMTP id af79cd13be357-7caf09bf07emr524572085a.43.1746533299797;
        Tue, 06 May 2025 05:08:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32028b38e2csm19391601fa.13.2025.05.06.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:08:18 -0700 (PDT)
Date: Tue, 6 May 2025 15:08:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <vr3q2c47ht5iebf7nvy3qywoxlquwma3p2tffswrefpmxqy24h@wrfecu6mcqcn>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-5-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229152332.3068172-5-quic_wasimn@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExNyBTYWx0ZWRfX6gnjMs9ZYTOD
 BQ6l/qhcXlVMB5NPfmeoJOjbQl7+lflrWt1PqC3y+HUH29Mv7boEiKD31n9ykU9DotrATEGeGDe
 LZTCqXkl0BRLnD3ESTBejjApVMzJtuIg8eovAggpmMB8PlHnoPVJZMUHLEouKVAc8u76H8Oiztj
 xQ5IvqnnwjrBYhMmqjBowC9802dcHyG+EoDAlsvNZ1DACwV4ggeG+H3AfMIVnOwcovA6U7MqKA5
 vjh7qTpUKeNEaSSbgBoWUrBe8DRcJEjeHsIyuuO2Rb7iFRNXQpFxjwsairrnCrHBxz1z4A4X3kI
 X3eiTZK4Zgif8+avpF0AA/hPbKhBCY6f0lYRoqGV/qvYkyKaN4IQEnKBIhNffWevK4mSmurLxR4
 o4hnbjJGLuGJSycx5wEOuKiiqAVbRkooiFLhlYpo9pntSZlBwRAxxI7xKrqvGLOMUXUaazNq
X-Proofpoint-GUID: AK-Ojzn5SHrqGPeegxXMAUYiIK88klbR
X-Proofpoint-ORIG-GUID: AK-Ojzn5SHrqGPeegxXMAUYiIK88klbR
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=6819fbb5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=q-whWVftEaYGax-JpAIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=800 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060117

On Sun, Dec 29, 2024 at 08:53:30PM +0530, Wasim Nazir wrote:
> Add initial device tree support for the RB8 board
> based on Qualcomm's QCS9075 SoC.
> 
> Basic changes are supported for boot to shell.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 281 +++++++++++++++++++++++
>  2 files changed, 282 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> 

For the next submission please include at least the UFS support. The
board is pretty useless without the actual storage support.

-- 
With best wishes
Dmitry
