Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0796193077
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837298; cv=none; b=U9mvBsyUOzHK7fCz5Q6goMCgGDl1vFEr9XucdqMvml/z5U9RDYWL7H60zsjBbqjHTUujokAJctiH+Gj5pVoIHxOBh4Ir8DJNPjN16fmHI7FE+PYpEwO5JUZDiVoAB8TYEkbHn8IlsT2gU+MrWti27qvbxRMoyTNRqrRXmJBBYRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837298; c=relaxed/simple;
	bh=6YaMRruSKDhDVQKJzK/GHN7Jqje7g4DJLjL3B27hCKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oo9OYdu17ohW/TY0cMY3pXTUsgb8/XR41LIJe6qaYO1eZrpRrCtb+tMQvHeFoUvrqiSiXbgmR0hgDD/Mj647XGMOGWdRluTv7JguVhmrEYfUM2sEWoqfHETZe9b/Mnjbzsc9aDqAyZCM+xRX5BxoZpr17g1vsNNxQD6FIKtoiNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5TDMBOq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5TDMBOq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACQZI027117
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F0m7HB2gG3d25Nu5nZtS4On6
	8RruYWwoqBowuaqRdr8=; b=W5TDMBOqYoXDyP5lHzeOn9yiu4gTNjj15jNoyxSs
	aomryXUgcHM1mshkNRSm80p3tw7N0Vb1WSVbdPbXpYx2ax+uS9cXPtEkG3PxXikm
	uiqtO+xSdjnECA8dtfMpJH3mvwNYVzH9Kkoqy5ZcUI1oo0maWG3fgzjpmzOYR2s5
	UHk4jLZeOpAzdl+BsyeNwaPkApe5N5PvlPyxtmPhOgGvXoMGzfqtBvrCaqfNIIY9
	ufxPc8/m2WGyK5lF7wMu2aV7cMWHCjf8y2EuMV95fKPxdl708thrCZwNuZBMjMXn
	RPwqpr0Wwzp/cyzhfRRve5XIfEyl1RG/OFF0RTT1gyDZdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwru2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:48:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30872785c3cso7168466a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837294; x=1746442094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0m7HB2gG3d25Nu5nZtS4On68RruYWwoqBowuaqRdr8=;
        b=H7di/6aisjgmTr6GNNmVoGDp8/EZWZVtAhcAixKNyBG9BDE8RK2dszL++eH8JhqOW4
         aDYOnhSMBh1YGydBPEKZK5AisT4Ce5FRynUT0efB0UHrDF6Sb++2f9ktv30vA+i1aoOk
         DuGLaVQFkr/GGig4mB6K6loBXkhpqTVtl7a/92DU2U6UJ3Op+Cu+XnI1Qb9xxs8YKn97
         HZ43QZkBPoMHKfI04NTEgjsg/SllKTTPyiDzFtRC2bp7Lm2Vbnn3rDuihEk4d8caJb/W
         h4/Fqyl/q2uFnEuS1nTs03ydJuQpCGX7DNVuOQt3FkhHfC3kaPgxYA6yDYoasSWcwDOz
         wvVg==
X-Forwarded-Encrypted: i=1; AJvYcCWdXorQJgs+HaQzQ4p3giKm+P+os4nguSPOwN5f5LuHxHk4jOUQMFu7XdDU2cU/iQfCUqJZqM80nBvRUwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWUCAFsf/vuejL2d3uL3/Jk+PpumF6pJmAZwdmfy9jBvWyFVcV
	Y3ZidR+gvCvYmw69uc16TEKX4vcTr1tRppSsV8jcQZxnd8K7DRRM4VIBvEj9ZTUwwDVWEpfDGzb
	Sj8mpOiM7FLgitKRyck53W959thRrMYgHTaN9D+tDnXw5OI90NjPYJajLAx1hY+9oiQ41bsyXA5
	K2iD7+2dDrVGT3WSxYvlcUnIb7tgpKSDldkdrcUA==
X-Gm-Gg: ASbGncs+5HfkO9WikunxzNsxxK6uw+BfdiRL0LtidwAldRBEah3h1rfL+1XYan0ssLI
	LoNzIhCvpMSx1bAb52Jw95RBuzyARKiSzdeHupduKk+5BMnQHGomnmaZFZkcgZEsmQDvc2cXsMb
	1gGsDx1ZdyKeDjqBFZdG9Okaul
X-Received: by 2002:a17:90b:544b:b0:2ff:6f8a:3a13 with SMTP id 98e67ed59e1d1-309f7e702a1mr15271327a91.25.1745837294043;
        Mon, 28 Apr 2025 03:48:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ59/NEfTDF0sONov5/AlmGKX/lTawDzVwJVYT7OQJ+dbZoKTjdF2IlugQryRmC8LINKDjP08T1i4NIbEwqaQ=
X-Received: by 2002:a17:90b:544b:b0:2ff:6f8a:3a13 with SMTP id
 98e67ed59e1d1-309f7e702a1mr15271296a91.25.1745837293691; Mon, 28 Apr 2025
 03:48:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
 <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com> <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
In-Reply-To: <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 13:48:02 +0300
X-Gm-Features: ATxdqUFAaKexOX2IHkjlmnbJ-GEkMa25-C3pZEEy-BC23E_yx5Vsy9avMqPA5p8
Message-ID: <CAO9ioeWaPKXHgNGPx5q34+RP59PMLD+EVK5fQsN89KC9A1ca-Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
To: neil.armstrong@linaro.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: niDPF_4GnWYj1kLjbTS1-8FLNNyR_zmD
X-Proofpoint-GUID: niDPF_4GnWYj1kLjbTS1-8FLNNyR_zmD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4OSBTYWx0ZWRfX9ZLJ7p6REb7c XTzD78bxuLztjmPwbp07nChC2OHiq3j6wL39pALb9mNY7+2mEBVWj+pe1LdkywkhkW7YfZgkB2Y ArdJoc7WujHYOQOjkAlfNMBahL5G8JfiXvfQt1+Q3gK9ifLSJQ30m5bsdvmZlNz6OL+XdpkKzdU
 aKcRK0K1kx8qCrUNEM78TLyj75OeEdnjTaxPjegnQicZibHkGUVdhSurzgr3NanlLXs578ICNIL hi1GCyFHgOSuhmJzlsTdmEWtRK86nuoFxrsaWjZ5LwVeVW1iFkr+xSmBgl6Hwj2zI9IPc6ft5A6 feI6r3ISuEO+JhnvI7lAoCguPVuSkj71FVvnKEiSZOGVxqaMQjoRsRT/E+2kJxRBWcJNQ8TfwmY
 mf5jNICOoa/eafDw2tiCxGS0SiCmxF0EC1As7T1ojP5V3xVv9CSIpBLAVl2c0wKJdnzzOXBc
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=680f5cef cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=M_VgH1IvVxprlxKqiToA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280089

On Mon, 28 Apr 2025 at 11:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 25/04/2025 23:49, Konrad Dybcio wrote:
> > On 4/24/25 6:32 PM, Neil Armstrong wrote:
> >> Add DT entries for the sm8650 iris decoder.
> >>
> >> Since the firmware is required to be signed, only enable
> >> on Qualcomm development boards where the firmware is
> >> available.
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >> Changes in v2:
> >> - removed useless firmware-name
> >> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
> >> ---
> >
> > [...]
> >
> >> +            iris: video-codec@aa00000 {
> >> +                    compatible = "qcom,sm8650-iris";
> >> +                    reg = <0 0x0aa00000 0 0xf0000>;
> >> +
> >> +                    interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
> >> +
> >> +                    power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> >> +                                    <&videocc VIDEO_CC_MVS0_GDSC>,
> >> +                                    <&rpmhpd RPMHPD_MXC>,
> >> +                                    <&rpmhpd RPMHPD_MMCX>;
> >> +                    power-domain-names = "venus",
> >> +                                         "vcodec0",
> >> +                                         "mxc",
> >> +                                         "mmcx";
> >> +
> >> +                    operating-points-v2 = <&iris_opp_table>;
> >> +
> >> +                    clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> >> +                             <&videocc VIDEO_CC_MVS0C_CLK>,
> >> +                             <&videocc VIDEO_CC_MVS0_CLK>;
> >> +                    clock-names = "iface",
> >> +                                  "core",
> >> +                                  "vcodec0_core";
> >> +
> >> +                    interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >> +                                     &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> >> +                                    <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> >> +                                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> >> +                    interconnect-names = "cpu-cfg",
> >> +                                         "video-mem";
> >> +
> >> +                    /* FW load region */
> >
> > I don't think this comment brings value
>
> Right
>
> >
> >> +                    memory-region = <&video_mem>;
> >> +
> >> +                    resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> >> +                             <&videocc VIDEO_CC_XO_CLK_ARES>,
> >> +                             <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> >> +                    reset-names = "bus",
> >> +                                  "xo",
> >> +                                  "core";
> >> +
> >> +                    iommus = <&apps_smmu 0x1940 0>,
> >> +                             <&apps_smmu 0x1947 0>;
> >
> > I think you may also need 0x1942 0x0 (please also make the second value / SMR
> > mask hex)> +
>
> I don't see 0x1942 in the downstream DT, and which mask should I set ? 0x1 ?
>
> >> +                    dma-coherent;
> >> +
> >> +                    /*
> >> +                     * IRIS firmware is signed by vendors, only
> >> +                     * enable in boards where the proper signed firmware
> >> +                     * is available.
> >> +                     */
> >
> > Here's to another angry media article :(
> >
> > Please keep Iris enabled.. Vikash reassured me this is not an
> > issue until the user attempts to use the decoder [1], and reading
> > the code myself I come to the same conclusion (though I haven't given
> > it a smoke test - please do that yourself, as you seem to have a better
> > set up with these platforms).
> >
> > If the userland is sane, it should throw an error and defer to CPU
> > decoding.
> >
> > This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
> > would prevent .sync_state
>
> Well sync with Bjorn who asked me to only enable on board with available firmware ;-)

I'd second him here: if there is no firmware, don't enable the device.
It's better than the users having cryptic messages in the dmesg,
trying to understand why the driver errors out.

>
> >
> > [1] https://lore.kernel.org/linux-arm-msm/98a35a51-6351-5ebb-4207-0004e89682eb@quicinc.com/
> >
> > [...]
> >
> >> +
> >> +                            opp-480000000 {
> >> +                                    opp-hz = /bits/ 64 <480000000>;
> >> +                                    required-opps = <&rpmhpd_opp_turbo>,
> >> +                                                    <&rpmhpd_opp_turbo>;
> >
> > nom (nom nom nom nom nom)
> >
> >> +                            };
> >> +
> >> +                            opp-533333334 {
> >> +                                    opp-hz = /bits/ 64 <533333334>;
> >> +                                    required-opps = <&rpmhpd_opp_turbo_l1>,
> >> +                                                    <&rpmhpd_opp_turbo_l1>;
> >
> > turbo
>
> Ack
>
> >
> > Konrad
>
> Thanks,
> Neil



-- 
With best wishes
Dmitry
