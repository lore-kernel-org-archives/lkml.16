Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283D8241689
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065330; cv=none; b=Wa5rJfPCisZ6SVOleNE3I8TPksV7QGoNVrUdCAWAoGRBf/pZ5nys/A+1pmR+3QQWQLYT5Um1FTyuBZQ2fYYs7bV8xJgTf8JOFYmNzp7fqdOyhdij8/99JpTwCdeZFekyRPNgoCzhFB/MMprclDrkcFK3lJ5H8wHKE87RkzKp3wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065330; c=relaxed/simple;
	bh=QqN8dyPRaK023Egme6+n+rlqY6YYhXeNAHM5JjPTwpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aot7emGjrT+21S3T0HgByJFko1Yw7YzS7fhHH5xf9Ub9bflPYNKlOqueHDRaG62gfn86P3FtegCoQ/gBWavnlA93mqev2GVEuwIbn5fmsA+aMec+sKpJMpILpDWLIkbS/QXenZfTIhgqlHuUklDTfmBePpzg6askgZIuk0JHFjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BV07Eak1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BV07Eak1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9SRYZ028882
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6E4Yh0Ad0rKvp7JChvNLu4vv
	yu3En+X5pMaxI0jfjRY=; b=BV07Eak1UZa6AjlGxAYdh9VUeA+ziMNNQGxAIWHH
	OBedcQAM51i2LWG7xBffvEZP5U139gYyisFZh8J4fN3XUuCzb4Z3I987fO1aVsK4
	gvXDdx7SHcy8swXLET/TwZ1m2ngleNqawRn0Ius9TEQhoVDL/tzFQvn1okw2mU0j
	txx8M7SjsCifuKuX9iq3lRVmlE7lhexw5auuCfr3VHl4Sb50kje0l9Qc6m/Ndx7m
	RX+OwYjhmGZ+uyRAMLf4i5XuaDDtUHzyuk4g/EhTa6jy1B5z3h61T47Bvkq30bZg
	zQam/bkptzVaadj53Zj49kN7+8Sfh14yNp92zTlSrYsN1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qd5a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:55:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so1184421285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065327; x=1747670127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6E4Yh0Ad0rKvp7JChvNLu4vvyu3En+X5pMaxI0jfjRY=;
        b=CCFGQfXe6cAIOCmW47NteAS/Wpa0jv1XGHcpL+ntbcDJ2YhQhvgkWGtfvqa1696Kch
         nyVpYLnfVhSQJrxzKqNxVQrRbqEMCjztxMhP00ivcOIHGzCuIcAfz3ThvPNWzkCxni+y
         SYsWval1ExoedFdyg5q2RnSv8YgCJa5J2Q36v03SxTsXWIJz8MFFmhXJMLC+aQ+cHwbO
         1O0kiXA+F+RisHCvSBgFcmcWnqvzbB9W/DPIpJYFcKQpCo5mZfaRch8SaXDK1zVPBzmU
         LW6Th5ov8+08aEta5ExJIuh3vIAntGSBYNKiEjTJEVyBTRBpO/poTcggcecXGHmTc3HO
         6Z1Q==
X-Forwarded-Encrypted: i=1; AJvYcCULGnQVD3QBjbZ3gU3C2vQIBO0hyMOVWRuiTRjZZUXLASSzS2UhPigN8+U2Whwj26p0D6YUU2gbxPPX6Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0o6cpAVqZWRJlUSgbaCeHCe+uPxCatGgRfNczvi5oyoLeZIXa
	8teyKv7Nr8tBggmfXTPoeZwgt/GY0XoghTSCQ71Ch0s/IiQPRBwZ6lO96hlsRfR64GoVygu9xPb
	IOuMzOsKFM4AMdly2HWhK9quOP0v4geIhtEaKzSg8vm0Y44EawhOV3a5+lu7MJDM=
X-Gm-Gg: ASbGncvm1wfRJCTGGeU1wE0hs14agNwMEXf4hBQVSfU+J6a5sb9QHPHy7+tXsqduTc8
	ZrKLRJKdXDgnOD5Epvkx21Cw4XkRWEJu5MtmB9Zi5yd/4is4zgvQwIPOjLKboXkeph+8r9SDG8Y
	hg2iGUkarXAbP1hQz71C2F+GIbYaojqfku4o9Ta04U8rFy7DicKNG0ywdbe8X9lccZkmh1/cRzd
	7wcdwGnJt+WixQEeYRN44R1DCmlPNWfNd9N1tOH/EGThHPq796eWYl9FFgxs/mfUoJdo9K57gWc
	GtCHYk1afwDIGVdA1PYe+JdbgcLIlDMgjO00nPLb2GbKNlXPFgbp+SjeARAb7gUdXX3oyBAIlRo
	=
X-Received: by 2002:a05:620a:125a:b0:7cd:147:96c2 with SMTP id af79cd13be357-7cd014797b9mr1707287885a.18.1747065326774;
        Mon, 12 May 2025 08:55:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/zqsVqnMeEhhIgVNklBj/Xs45Lkrd9IJlDu24IM9uupTWjEpGM+U5jrCoQ+foTJDujaQNzA==
X-Received: by 2002:a05:620a:125a:b0:7cd:147:96c2 with SMTP id af79cd13be357-7cd014797b9mr1707283485a.18.1747065326285;
        Mon, 12 May 2025 08:55:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6a25sm1541551e87.125.2025.05.12.08.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:55:25 -0700 (PDT)
Date: Mon, 12 May 2025 18:55:23 +0300
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
Message-ID: <ziko5cxt2cabyu4aimpqhbzcacudfhf3jtp23psobxtjdgi5vg@xcfeush5xlhm>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
 <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
 <pzlsbznxpfsbdsxlzvcbdy7wwba4z5hoya7fyoacwjadtpl7y4@qajecdvs3bho>
 <effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=682219ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=IwuB_wEVgt66hj201foA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PLapcYK9D5Xk7RBZioq_lt39ibpcZgO8
X-Proofpoint-GUID: PLapcYK9D5Xk7RBZioq_lt39ibpcZgO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE2NCBTYWx0ZWRfXxET8jElp35W+
 5sIBVy1VNFOwnGcgdCQCS1p0Bq4mGQeGSgCtvjceRS7UIn72T5QDaq9UJ14qgtawtn/e7iX3fxh
 vfJw5YwBFmbfe9vtP7H206+L6ZFsUQXhCNfgEN2fxz2NhBzF/KWq+BUV/4WOxUJuzkUGHjHJ+8a
 9Z7G5mJDkIHa5aXZlyjdUY7mOdr/DzhN/1rmb3z/A9fncDUA0orR4SoZLGIN5tYrOT4E2XPD7sd
 gjC7Ez9nK0BYGgqFR7BB7FytjskbBQr7ZEELFez/wEfpY76dR3M8QjT9E0+TX1wrzSgreUjzQza
 ckHpABlrZCYEl8qHedXpnTNRhKDF6oVXJipyCtkvKlLqApIaukxhC9VpRu3BHbFAs/XDdlCPJtY
 vTi1mKDg5+Uj8t8phsS/KXhqtw29O1qphLCHur6nPtKtkmClUnFhRLvVg3YeWdGAghvpY/4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120164

On Mon, May 12, 2025 at 09:25:13AM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/10/2025 1:19 AM, Dmitry Baryshkov wrote:
> > On Fri, May 09, 2025 at 09:12:30AM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
> >>> On 5/9/25 12:20 AM, Alexey Klimov wrote:
> >>>> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
> >>>>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
> >>>>>> While at this, also add required memory region for fastrpc.
> >>>>>>
> >>>>>> Tested on sm8750-mtp device with adsprpdcd.
> >>>>>>
> >>>>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
> >>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >>>>>> ---
> >>>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
> >>>>>>  1 file changed, 70 insertions(+)
> >>>>>>
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>>>> index 149d2ed17641..48ee66125a89 100644
> >>>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>>>> @@ -7,6 +7,7 @@
> >>>>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> >>>>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> >>>>>>  #include <dt-bindings/dma/qcom-gpi.h>
> >>>>>> +#include <dt-bindings/firmware/qcom,scm.h>
> >>>>>>  #include <dt-bindings/interconnect/qcom,icc.h>
> >>>>>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
> >>>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>>>> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
> >>>>>>  			reg = <0x0 0xff800000 0x0 0x800000>;
> >>>>>>  			no-map;
> >>>>>>  		};
> >>>>>> +
> >>>>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> >>>>>> +			compatible = "shared-dma-pool";
> >>>>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> >>>>>> +			alignment = <0x0 0x400000>;
> >>>>>> +			size = <0x0 0xc00000>;
> >>>>>> +			reusable;
> >>>>>> +		};
> >>>>>>  	};
> >>>>>>  
> >>>>>>  	smp2p-adsp {
> >>>>>> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
> >>>>>>  						};
> >>>>>>  					};
> >>>>>>  				};
> >>>>>> +
> >>>>>> +				fastrpc {
> >>>>>> +					compatible = "qcom,fastrpc";
> >>>>>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> >>>>>> +					label = "adsp";
> >>>>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> >>>>> IIUC the driver only considers this on the sensor DSP
> >>>> Memory region is required for audio protection domain + adsprpdcd as far as I know.
> >>> next-20250508
> >>>
> >>> rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
> >>> if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
> >>> 	// ...
> >>> }
> >>>
> >>> maybe some driver changes are still pending?
> >> Would like to add some more details here:
> >>
> >> Memory region is required for audio PD for dynamic loading and remote heap memory
> >> requirements. Some initial memory(~2MB) is allocated initially when audio daemon
> >> is getting attached[1] and this memory is added to audio PD memory pool.
> > How is being handled for the audio PD case? Could you please point it
> > out in? Currently, as Konrad pointed out, it is only being used for
> > Sensors domain (unless I miss some obvious usage handled by the core).
> 
> The reserved-memory support was actually first added for audio PD only[1].

Okay, so it uses an API which I missed, excuse me. But then... How does
it work? of_reserved_mem_device_init_by_idx() requires
rmem->ops->device_init() to be present, which is not set for a
reserved-memory nodes without a compat string. However on all two and a
half platforms where I see the ADSP remote heap, it is declared without
extra compat.

> 
> The usage of reserved-memory is audio PD:
> 
> This memory is used by audio PD for it's dynamic loading and remote heap
> requirements as I had mentioned earlier. I'll give more details here:
> When audio PD starts, it expects some initial memory for it's dynamic
> loading and other allocation requirements. To fulfill this, the audio
> daemon allocates[2] some initial memory(~2MB) and moves the ownership to
> the audio specific VMIDs that are configured in DT[3]. Audio PD then uses
> this memory for it's initial operations. If there is any more memory
> needed, audio PD makes a request to allocate memory from HLOS which is
> again allocated from the same region[4] and then the ownership is moved
> to the configured VMIDs[5].
> 
> The sensors domain that you are pointing was an extension of this and as
> pointed earlier, it was added to support SDSP use cases on some old platform
> where there are no dedicated SDSP context banks.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=1ce91d45ba77a4f6bf9209d142d5c89c42cf877a
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1274
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sa8775p.dtsi#n5334
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
> [5] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1927
> 
> //Ekansh
> 
> >
> >> Additionally, if there is some additional memory requirement from audio PD, the
> >> PD can request for more memory using remote heap request[2]
> >>
> >> The support for SDSP was added sometime back[3] to support SDSP usecases on some old
> >> platform as there were no dedicated context banks for SDSP there. On recent platforms,
> >> context banks are available wherever SDSP is supported. 
> >>
> >> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1273
> >> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
> >> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=c3c0363bc72d4d0907a6d446d7424b3f022ce82a
> >>
> >> //Ekansh
> >>
> >>> Konrad
> >>>
> 

-- 
With best wishes
Dmitry
