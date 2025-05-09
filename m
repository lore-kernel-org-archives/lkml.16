Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264725E803
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820173; cv=none; b=d08p4dObtB1+AOTlvZRs58mpXAfmx+m8Fw4LrF1wHEp0TF4uBmKxI8+vLojxLy/iAfd/Z9J2qpxAUlvgDl40/WAZ70J30oljpFGqTEIDSYxFBFklq8L8sOiZOTMuB5T3xjaGVUra/daiyVLr4PDJXUON+qRYsmi8ntWZH9wJkFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820173; c=relaxed/simple;
	bh=ily75yK8xjS4x174faSzLC0rlvGeHE1RtwEY9NZzTgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6VRym8W/EgOXHlZnuHeLZjq78ehNNPEbds/1hsFj6Xs2g52PFmvQcxeBHxJ/SIMGtvmB0UHI1hTMPBtcvYIEmoFSGHmahNoKJkYRiEWjOUv7ZqMTxtqTurykY3vfjYAWA8dDjGmTGQqnnComHx7NzMwBqmknE0RBc5DuR9Ie3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+Evd/Ii; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+Evd/Ii"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Ci7ZN022873
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 19:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q6twRJ5MGk2ljnr9shqLaEC/
	wfAfOzln6nkhsqQ2b/w=; b=S+Evd/IifCtsqJ/LX9eE6ot8dXL+KPd1RR9NaKc/
	7Z7/yXASz8+kq8SOyfJbw/oEt6glV1Ut74eIjZysFZ9bAYrhwUAF8179xGt/aKRx
	mUep2gQ8Q1DMGZmNEJ+q6wDOdotVr3XHPY4arBIrBEvKCLZPQJZZ9vGkSyE9KV9I
	ZmZGuB5IjNxADd4lRp40rPi94IApFqNw5UPZZ5i3Kk7sBBO4oPoBZ+epB+0i9J3H
	j1WJxXhidV8qjtzZKDZOwwWgEawm+PtzOP4glz87lcqyXBOBMYG1Ld76BxHzcs2e
	xjxFu/2mi1v6ELigc4dF6hjsTBmtV0uJ/EdPksAsqEgtPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp85rd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 19:49:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b94827so369974085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746820164; x=1747424964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6twRJ5MGk2ljnr9shqLaEC/wfAfOzln6nkhsqQ2b/w=;
        b=OXnTsdqbJZfqqOIjrEfpN7Ixp6VYlFOzUt2tUCcx7f2o/f03HmrbYvAdLnxcdsy2KQ
         9Q7+qhpPXPcO7JwhIRQbcNtsZo3XayXY8Pj9S7PPGiKscPE3iYGwp5DDEPn9XIgVH/MQ
         I+4pQteknicTHmr7vZOK/YZs3JS7j78PIJQypAa9mwdB6KdDXNSFLOV1W5OBWKnftjmq
         cmMZ36hPrSedUYcediXw4qEt24Ri+ECAXTDHh+dRn+rFdCSix82qL4m5pjPIvMwVcZ3c
         YUFPgRnW79TAiETS4cPvlyimwRTWb8lAxCa1Pn3X6imr/VI2LYN/AXtKG/R1mSD0abSr
         EyKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJiJHKzIJ2nySjnWGL9MEoOn9SQ0jT+k2sl3IRcjiiWHXhWPbq5OGopH7wieZ8+i+qR4g5a3zVdoEqApk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXj7qboESL1E/O+UlqkKRzgZPsfa+i09FbtQdpmmK/Is94Cgh
	COo17wZUDKs/p1/QXsMMT8ZrVY5skwq+4oUg1duYQqIhIWlbZuFrUPOit4Sp8Quf9hcn3rSwOII
	4O3K0nzN2QbI/PwtbsvdVxO7HFL9rOlr9xdhr97hiXPwvba3UtTrtHf8a9MmZSYA=
X-Gm-Gg: ASbGnctUh+v7VAM2X0TlZ4JHqXXMdOKdXWcgvbFgmdLy+GgbJoqyuV2soMpb6n0Lrz3
	7DLmtKQnPBsn2WTMXsGACg4iP6RqUENFPs7dyYz4wjKhR4H4nVLhKKwsbWmjHpeGVtLIpZiTsg5
	wiwFbGFlVlXL555iD3wCeVpRLVRmiNuDLCrsfi/GPmJnN78iKQLspNhal3TiH8y7n6AwcPhBIAe
	TX/6KIFCsRX3O/qdoz8c78GjkZOGqyssjlMPKjgPaMIZSNKAM1cMGfWWNJylIoO+ZvQaROQgb4W
	GjqgVz/qcgeiJ7TtmSDWLFFslicftAgCIrAytSqVkCvHVbIUNhX3EYuzxlG+6hBbs9QV1rF4NOk
	=
X-Received: by 2002:a05:620a:440c:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7cd01157d9bmr777999685a.44.1746820163801;
        Fri, 09 May 2025 12:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4SbNZ9mAxpct98JyjHGJQGPpYXjkLoNs4MOsUEaF/4x4x9oUNXOaY2cOSWncyzhmRx3b0Mg==
X-Received: by 2002:a05:620a:440c:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7cd01157d9bmr777996085a.44.1746820163421;
        Fri, 09 May 2025 12:49:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c339a241sm3385071fa.18.2025.05.09.12.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 12:49:22 -0700 (PDT)
Date: Fri, 9 May 2025 22:49:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        quic_ekangupt@quicinc.com, krzysztof.kozlowski@linaro.org,
        "Bharath Kumar (QUIC)" <quic_bkumar@quicinc.com>,
        "Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
Message-ID: <pzlsbznxpfsbdsxlzvcbdy7wwba4z5hoya7fyoacwjadtpl7y4@qajecdvs3bho>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
 <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681e5c45 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=yetcnpw8gU3TWa0XJlAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hijXgQEHoDRA-ajadf4bVwuoia712Afj
X-Proofpoint-GUID: hijXgQEHoDRA-ajadf4bVwuoia712Afj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE5OCBTYWx0ZWRfX60ybidUTbOX8
 vKuSeCtSvaAYH7HV1NjErPyDInjl3cDNpLZ66yk1ed9tUgpzhM6jtv7KboIFTVMZ2q+zGgjIt/m
 dcP2A66M/veauhqiHkA+z+fvxOKpFSFRyjH845R+B9nBgqVZbtWQ0jVNlZhW8WfYOp2/XOAWv+j
 n6NyJaEtIMCZDYv8qqrOH4lyCGXfYbAFnjG038RnJxTcrGJtcy+brZy8r6L0wzBWEe51jvZS6ZQ
 Cr4RZyczT/USSH5+k7EkCAaRjoAyY+VsfgwRiUqnmSfipsWkAq64zm/wstajexAm2r7euRuKPhW
 20cez+opgWaFdwgrtJwpNuAsJvTH5BtP1iCDc0QpxwcUGYy4Irn5TxQe3P7biWHh2DbiNK1V6Oq
 2R7Yr11M/SnY1i/GbVz+23NRHPafd5E5mJw2oDLbWUKv2uqyaWSAh6QMvz4js9Rwsf2150Bi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_08,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090198

On Fri, May 09, 2025 at 09:12:30AM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
> > On 5/9/25 12:20 AM, Alexey Klimov wrote:
> >> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
> >>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
> >>>> While at this, also add required memory region for fastrpc.
> >>>>
> >>>> Tested on sm8750-mtp device with adsprpdcd.
> >>>>
> >>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>> Cc: Srinivas Kandagatla <srini@kernel.org>
> >>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
> >>>>  1 file changed, 70 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>> index 149d2ed17641..48ee66125a89 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>> @@ -7,6 +7,7 @@
> >>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> >>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> >>>>  #include <dt-bindings/dma/qcom-gpi.h>
> >>>> +#include <dt-bindings/firmware/qcom,scm.h>
> >>>>  #include <dt-bindings/interconnect/qcom,icc.h>
> >>>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
> >>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
> >>>>  			reg = <0x0 0xff800000 0x0 0x800000>;
> >>>>  			no-map;
> >>>>  		};
> >>>> +
> >>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> >>>> +			compatible = "shared-dma-pool";
> >>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> >>>> +			alignment = <0x0 0x400000>;
> >>>> +			size = <0x0 0xc00000>;
> >>>> +			reusable;
> >>>> +		};
> >>>>  	};
> >>>>  
> >>>>  	smp2p-adsp {
> >>>> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
> >>>>  						};
> >>>>  					};
> >>>>  				};
> >>>> +
> >>>> +				fastrpc {
> >>>> +					compatible = "qcom,fastrpc";
> >>>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> >>>> +					label = "adsp";
> >>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> >>> IIUC the driver only considers this on the sensor DSP
> >> Memory region is required for audio protection domain + adsprpdcd as far as I know.
> > next-20250508
> >
> > rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
> > if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
> > 	// ...
> > }
> >
> > maybe some driver changes are still pending?
> 
> Would like to add some more details here:
> 
> Memory region is required for audio PD for dynamic loading and remote heap memory
> requirements. Some initial memory(~2MB) is allocated initially when audio daemon
> is getting attached[1] and this memory is added to audio PD memory pool.

How is being handled for the audio PD case? Could you please point it
out in? Currently, as Konrad pointed out, it is only being used for
Sensors domain (unless I miss some obvious usage handled by the core).

> 
> Additionally, if there is some additional memory requirement from audio PD, the
> PD can request for more memory using remote heap request[2]
> 
> The support for SDSP was added sometime back[3] to support SDSP usecases on some old
> platform as there were no dedicated context banks for SDSP there. On recent platforms,
> context banks are available wherever SDSP is supported. 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1273
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=c3c0363bc72d4d0907a6d446d7424b3f022ce82a
> 
> //Ekansh
> 
> >
> > Konrad
> >
> 

-- 
With best wishes
Dmitry
