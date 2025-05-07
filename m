Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACFF10E0
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746577680; cv=none; b=L7sG/uAT2pKv+yunkf0Ai5UJLKmqed/MkhX0okn41tVthcf6H9NbUPy0JUi6uA4hGHNyGq/cMvaOSG4Evg04j6SbKL5vanaORHg6EX8nynYfbjOYULJW/bTobVP/iR0a3M9z3x5bMn0UKGrUWohZWv13vaNo+7aJseafBsvXL08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746577680; c=relaxed/simple;
	bh=rj865xdjUMX7Oh9l0dClpP2tYP9jObD2CLFFXFRiUKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxqdr8nBflaD7sKiXnvLVfNyGWrSe1UBm9dDTISmi6RYev9vwQUJ41PJaTio3HQNTU3jcGY3v6aUH3h60HyaiEiIRa/3oGcDGJW+ja19t4nsvxZyHcgQVfd1PFagnhvNWBKXP02kMPfq5aZv8/Wjz9QQaT21LKBnRr3FZYyKtB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffgn15Mz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffgn15Mz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546HYIcn025258
	for <linux-kernel@vger.kernel.org>; Wed, 7 May 2025 00:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KU+/kQQFaGW5BRBV/U1cUh90
	Qk/YbplfaNVELF2XFnE=; b=ffgn15MzuiIcMahzmndri2EexNsnmtVX80Pplzk7
	363WyTB6btQospff83XAtAkXPmCWslg0h90nzuFfr5DJh/DzWyy0MKP95mxjDsX9
	rRXBRCsMjWyQ4pG3yDv5Ft6AcoUiUEVAJdwhCgUuxxWEKzERRF0yRSXOj/64QlQq
	cnKlwSpOH0d+UURY3urSah55GIxb8v22rmEJKIiO2eJdJlwskRzMvWU+ajLvmMEV
	xo38J9S6bJt7FLlto6OvhflGWXAqXpVeB2JFCY4pCUV8YyHVy+mpfG2M5/WJQKGb
	os8PXHCzpuCo7HGFcWla4BzSh7xJ87C4kI0xS5sO29usug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv40qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:27:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e91d8a7165so107037516d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 17:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746577676; x=1747182476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KU+/kQQFaGW5BRBV/U1cUh90Qk/YbplfaNVELF2XFnE=;
        b=c46Hs7s7v/tBoFnaLCpHSqtPbVMslvKBSpn62n05olwDcc4ZPf6WTbUINSg6Ixvr4f
         NAXh/G9uQ2U4kTDM2Nkk6JRnMCPCaodnWqMPFL9MXo8WZOPROoNFzsnptVQCFiGYl0GP
         u45KKB6EC0pcDaz/BUAvfy/dICNW7QK5jScqltN5bJxuRBpxIzid2fEMVOsgHqnqw/1r
         X2UAThN1gully7LCw/fpYujO4kiuDhhSqCeYXtAtYqUxDw0gs88XfXezuv8y1G7EVPBL
         zDheq/UrfIMzsMOibobNEGh9GBYq1HSxV4w/srXGvOzefBIzpqUjRPVnY8tepWJJS7ff
         O7Mg==
X-Forwarded-Encrypted: i=1; AJvYcCV3zdI0Qxm6U4LoKEBTzDne+Sj8Dt0h0kiaRpN0OxKFWlbTFW5SXf9vXy03XJXZHNJbPLPZzIsFLk0rPZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC4FFMXqSuJKeM6i/yvt/dOEp5goaKn87AGhNb2Qbb8Ip5VKsK
	KsUpNO6mk2r1pjjdFBcUU00cedlFFJaUtlT8pdVhJaYAIrqUFpRfT+THwDNnsp1V3+U6zSpMZND
	SeoiCTv574XikygD9a2AXJBkg9DsPdWP6foTGI0JwNyxjUBuGeWIa9/2qro/Wt3Y=
X-Gm-Gg: ASbGncv59JIgeNKE9clbejK0ifzxGMCr9S5T3gOZCWl1eQSqRryUhJW0b6pmYKQN3bf
	4J8p3vuK1+hS2ajAiicB61CesvpzqCbO2WZbeTz7ynOjKaSFBXcjg0fulWqz0N0KuGF3o6OtIkq
	PpG6TcyRoyg8Q8EuuFnDxv+3zWbareD5MqgVAjU252EDZkeEGfF/YtVYN3B7P8VJJ5FfPTFF1Vk
	GHVs/7jnsCM+G84p7+Xe/AdfTs3Xv9M+p11opD4Jt7HgAjjkCTu35llvULUrw5grA9B6ub1ioHg
	V5ALx2Qv0LQxL3YMU3EGu/kpAuCWfYxvyZFo0BYKK6kW7zN9/LDE1C6JonZZkBo1mcGsdpcLIes
	=
X-Received: by 2002:ad4:5c85:0:b0:6f5:3b8b:9115 with SMTP id 6a1803df08f44-6f542a80ba6mr18417236d6.33.1746577676282;
        Tue, 06 May 2025 17:27:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFRVO19PQwPJMjT3C2BBmJBEkobHD6Z2BgCRcVhb87kuizrxRlLuQ6jxGhdOD5AD8XTBthGg==
X-Received: by 2002:ad4:5c85:0:b0:6f5:3b8b:9115 with SMTP id 6a1803df08f44-6f542a80ba6mr18416866d6.33.1746577675901;
        Tue, 06 May 2025 17:27:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202930cc7fsm20654241fa.61.2025.05.06.17.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:27:54 -0700 (PDT)
Date: Wed, 7 May 2025 03:27:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, neil.armstrong@linaro.org,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
Message-ID: <32ktmnjhrfrvpi5glipex7qfrcxa5hyl26em3f6xos5l3n2zl4@b7rmzx6wpsj2>
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
 <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com>
 <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
 <CAO9ioeWaPKXHgNGPx5q34+RP59PMLD+EVK5fQsN89KC9A1ca-Q@mail.gmail.com>
 <d79790e5-52c9-4135-8f3c-af797145fa2d@oss.qualcomm.com>
 <4lmt5cgg2tanrughooxw73h2brwyyc6ifqgo3ju6iz4enkvkic@umeijjk4ijxg>
 <651f1421-b471-485a-aea0-1b1ef92f8331@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <651f1421-b471-485a-aea0-1b1ef92f8331@oss.qualcomm.com>
X-Proofpoint-GUID: 7j6Dv0GUxPCV_n0dn_WBn1kbOZMrOnsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAwMyBTYWx0ZWRfX0rNF/0zGMThc
 eBWv1xL1Yf683sqEPXi9+TS5cQbjXPAMIiBtL3T/SAx9+vuYELVsOsLSmuJLs7A/Z8dcxNhdNoE
 V9L5NcRvFcCHqgzxLjZrhzPv5yQifAgOhLI0yEZ40UQ44dS6dzuuPLS9LQCP0s1mBf72yAO/4aa
 v6ChOx7cDXg/62RLZK/rxMHiPVbXbJKxJW24UqwrMwuHrVng35QbneC6CvWDN8GHcUpzZJmP1ec
 cuZp2/IqgINf9YUfU8BnS39IHnbJXubTQ5ePXMhBFe58F/lqkrAuw5sADcu2y46GQnQWJcxQNkP
 alhE3LG8RSzeNf83q0vXkrsRpbcV61ZnMXpSvr555Wy6j0sYinInzS+Lri7l/x3MEOjhfdgeykj
 1PEZiWJBqtB9NI3DRD9OY8MzHubTKj+GfL4O8EUy6O3Hqh1n1B/cWhOKiwH+QtQcclIFYvmy
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=681aa90d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=tN5ki1dz_6qGOFmg9BkA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7j6Dv0GUxPCV_n0dn_WBn1kbOZMrOnsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_09,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070003

On Wed, May 07, 2025 at 12:53:27AM +0200, Konrad Dybcio wrote:
> On 5/6/25 10:23 PM, Bjorn Andersson wrote:
> > On Mon, Apr 28, 2025 at 11:14:18PM +0200, Konrad Dybcio wrote:
> >> On 4/28/25 12:48 PM, Dmitry Baryshkov wrote:
> >>> On Mon, 28 Apr 2025 at 11:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 25/04/2025 23:49, Konrad Dybcio wrote:
> >>>>> On 4/24/25 6:32 PM, Neil Armstrong wrote:
> >>>>>> Add DT entries for the sm8650 iris decoder.
> >>>>>>
> >>>>>> Since the firmware is required to be signed, only enable
> >>>>>> on Qualcomm development boards where the firmware is
> >>>>>> available.
> >>>>>>
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>>> ---
> >>>>>> Changes in v2:
> >>>>>> - removed useless firmware-name
> >>>>>> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
> >>>>>> ---
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> +            iris: video-codec@aa00000 {
> >>>>>> +                    compatible = "qcom,sm8650-iris";
> >>>>>> +                    reg = <0 0x0aa00000 0 0xf0000>;
> >>>>>> +
> >>>>>> +                    interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
> >>>>>> +
> >>>>>> +                    power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> >>>>>> +                                    <&videocc VIDEO_CC_MVS0_GDSC>,
> >>>>>> +                                    <&rpmhpd RPMHPD_MXC>,
> >>>>>> +                                    <&rpmhpd RPMHPD_MMCX>;
> >>>>>> +                    power-domain-names = "venus",
> >>>>>> +                                         "vcodec0",
> >>>>>> +                                         "mxc",
> >>>>>> +                                         "mmcx";
> >>>>>> +
> >>>>>> +                    operating-points-v2 = <&iris_opp_table>;
> >>>>>> +
> >>>>>> +                    clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> >>>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK>,
> >>>>>> +                             <&videocc VIDEO_CC_MVS0_CLK>;
> >>>>>> +                    clock-names = "iface",
> >>>>>> +                                  "core",
> >>>>>> +                                  "vcodec0_core";
> >>>>>> +
> >>>>>> +                    interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >>>>>> +                                     &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> >>>>>> +                                    <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> >>>>>> +                                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> >>>>>> +                    interconnect-names = "cpu-cfg",
> >>>>>> +                                         "video-mem";
> >>>>>> +
> >>>>>> +                    /* FW load region */
> >>>>>
> >>>>> I don't think this comment brings value
> >>>>
> >>>> Right
> >>>>
> >>>>>
> >>>>>> +                    memory-region = <&video_mem>;
> >>>>>> +
> >>>>>> +                    resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> >>>>>> +                             <&videocc VIDEO_CC_XO_CLK_ARES>,
> >>>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> >>>>>> +                    reset-names = "bus",
> >>>>>> +                                  "xo",
> >>>>>> +                                  "core";
> >>>>>> +
> >>>>>> +                    iommus = <&apps_smmu 0x1940 0>,
> >>>>>> +                             <&apps_smmu 0x1947 0>;
> >>>>>
> >>>>> I think you may also need 0x1942 0x0 (please also make the second value / SMR
> >>>>> mask hex)> +
> >>>>
> >>>> I don't see 0x1942 in the downstream DT, and which mask should I set ? 0x1 ?
> >>
> >> I saw it in docs only, maybe Vikash or Dikshita can chime in whether it's
> >> necessary. It would have mask 0x0 if so.
> >>
> >>>>
> >>>>>> +                    dma-coherent;
> >>>>>> +
> >>>>>> +                    /*
> >>>>>> +                     * IRIS firmware is signed by vendors, only
> >>>>>> +                     * enable in boards where the proper signed firmware
> >>>>>> +                     * is available.
> >>>>>> +                     */
> >>>>>
> >>>>> Here's to another angry media article :(
> >>>>>
> >>>>> Please keep Iris enabled.. Vikash reassured me this is not an
> >>>>> issue until the user attempts to use the decoder [1], and reading
> >>>>> the code myself I come to the same conclusion (though I haven't given
> >>>>> it a smoke test - please do that yourself, as you seem to have a better
> >>>>> set up with these platforms).
> >>>>>
> >>>>> If the userland is sane, it should throw an error and defer to CPU
> >>>>> decoding.
> >>>>>
> >>>>> This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
> >>>>> would prevent .sync_state
> >>>>
> >>>> Well sync with Bjorn who asked me to only enable on board with available firmware ;-)
> >>>
> >>> I'd second him here: if there is no firmware, don't enable the device.
> >>> It's better than the users having cryptic messages in the dmesg,
> >>> trying to understand why the driver errors out.
> >>
> >> I don't agree.. the firmware may appear later at boot (e.g. user installs a
> >> small rootfs and manually pulls in linux-firmware). Plus without the firmware,
> >> we can still power on and off the IP block, particularly achieve sync_state
> >> regardless of it
> >>
> > 
> > Not "available during boot", but rather "available for a particular
> > board".
> 
> I'd argue that if a device is in the hands of users, there already exists
> some acceptable set of fw binaries.. but most developers aren't in the
> position to upload them into l-f.. And quite frankly I'm not the biggest
> fan of having a gigabyte of 99%-the-same files with a dozen lines changed
> and a different signature prepended to them either..
> 
> > We generally avoid enabling device_nodes that depend on vendor-signed
> > firmware until someone has tested the device on such board and specified
> > the proper path to the vendor-specific firmware.
> > 
> > Are you suggesting that we should leave this enabled on all boards for
> > some reason (perhaps to ensure that resources are adequately managed)?
> 
> Yes, for that reason indeed.
> 
> We don't generally need to load firmware to turn something *off*. And
> most IP blocks don't **actually** need to be presented with firmware at
> probe time (I can only think of external ICs like no-storage touch
> controllers that need the fw uploaded on each powerup). 
> 
> Telling the user "hey, this is supported but the firmware file can't
> be loaded on your device" may also be better sounding than "won't work
> on your machine" (with the quiet part being: "because someone hasn't
> copied 5 lines of DTS")

Then we need to make sure _not_ to make a default path useable, so that
the users know that there is no proper firmware rather than facing the
cryptic error of "firmware something -error".

But... I'd rather prefer to keep firmware-backed nodes disabled exactly
for the reason of "making someone copy 5 lines of DTS", which usually
means that somebody has thought about how to get and where to put the
binary.

-- 
With best wishes
Dmitry
