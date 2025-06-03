Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC55813C8E8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748956677; cv=none; b=a9SzhcO/4wjB4acGJnTpqsJhu0DVajn3GR6teIvcInmgC8GPB4GI95nzJNZc98yBHG+vHjnFSBvOdw91x0fwJ05aLKM7CwpalDOrXu41OXojt3L9ah4iUuJDlj8ftagZCkTIlAtkjuA2TRul/fdm1LgNDd41eE6hMQvvFPwObiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748956677; c=relaxed/simple;
	bh=6iBvI7K6Ap7MSOEGbalH5RS+2DAx3UXzxMrsuLUjNuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOQCQcdyricNIrtYODdavX2snl2Km5tXI/9iF4YKFcflPtaM1gTvx0j/yGKaESjtOlhg1XRkpM03ar8JqVfr/ad+bqojxCbI8OlvzjKOjW288bZHcciAHjgLr3MBsFgwR92C25JODinhdiRK0+Nh1UpukL9aNdfQBjYJgr5Uwz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQMBemuQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQMBemuQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JfVP010767
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 13:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JXGMMgDR2GMRgvSQcH/bx3rG
	d4l8acpfk7Qd16JoTBg=; b=BQMBemuQF4dBmNLN6f4xYX27LftVRJZ4ntFZVPvT
	FbR2s6NAnc8ID8m0sOJ5xURsYPiBILlb9WHsjdzq3coeOQp/SLA5Lprd3bVXteeD
	1fYThUZZzomTy2IgV9mCX41/02ggPVuj87Bqn0QapEhA3SDoX/Pl+UDVjgWCIvI/
	D9nAyj03JwQLf6olY1tNuu7RtGbLZgL0LUbM87RNsWDo3U9IVrdyqiLp7hREtFnh
	0fh+zL4Z2F5NOkWSH5+XPm9ECZq3vEte8cYtKXEUOCXMF1usrkX3VT2R5vqfCJJ/
	hHuvmNB+sYBaLDdcSyfcU0b4RkT74D1xF7OaeM/b2G1JiQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8yjmec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 13:17:54 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-735aa4b1572so1487508a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956673; x=1749561473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXGMMgDR2GMRgvSQcH/bx3rGd4l8acpfk7Qd16JoTBg=;
        b=PV5+YdVdmfpbabnHW8Vx+Y+kae1vvBPSH69zOY6YufbqJFwAptPEKsFVk/gqK2paHK
         O1IAC8hQMHr1mlks1KDCjXANt3kazY/tJEKuy+A7Nal6Hem48MWttlXWSh1EgPKOaHXP
         0MesEBNzbDVWhTReWidv9PczcE3KsWkxBw0mG9lvLlaM1ifCcWHUZ3mf0g3Szv82IEVy
         tnTA1+nuN3hYSHtA/B1KfUHh4atzaKz4wODKnj8AGs5lo/gk7Zxx22PE7OUKx4qCJ5Fm
         F5CkzHe2PKcVe6EesbtEqDvW6EX9qFrs+/94QU5aRlK0Xx7ybjYzU8BWHrjs6uYprTOH
         dcKg==
X-Forwarded-Encrypted: i=1; AJvYcCUFGf7fSSr9v92I6he79jl4FO34tbKN4sp3pJdcDVIW/KDrNcklliuRAM3n/im/wo8a1Q5QvzneOenq6Nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YznE0BQ2aN1DdQMBI5adqqM5Pt9bmsQ6NwNM5Nqjur3uL9DgwrP
	zE8EhgUvjIUgg1d3YufSJtDtdXbUiauUbMHil0+7k3JdCUO1WufgwoJJf11nJYuDHu2Svvtto3q
	lR2FxIAjBoKf2LmXtsMUkVkv2J0igLrRD55M3z45ZAhzNMk1S/Onjd1lJXtT7QtVgfak=
X-Gm-Gg: ASbGnctfaig8fgSspHaN7V0GqbfD5ICqEbhY7BQvJMA7LS9v9F3EQjeLDMYACaD9fmC
	I7PeGie2bOWx+VgZNm+72e+aBNHJ5JaqS9o0gf6SAtLwTSTgKRDpJzkK56F3napppQQ5FZOPAC2
	VKui1sljlnJdqIMeEnpjhl9ZlFnkENc9qoEHBFi2JeJpGRJJLmDn/mhfETR2BJb0WN/fqcpDMey
	vMAP6j6YMFe7POCimlIB3HmWi2PHYvxCp2SuX0ESDAfv8ePht+2aL2xDU9po6JmzQ1PQ9a/UYc5
	i/xXXObwSj1IOE/7CgDm8u4Ev2QXTzrAJ4nS8SNBRvc5ffm7UxwIf1J7ag4CiMNBJjzroEYH9+U
	=
X-Received: by 2002:a05:6830:6484:b0:72a:449e:2b69 with SMTP id 46e09a7af769-736ecef9188mr9330703a34.28.1748956673461;
        Tue, 03 Jun 2025 06:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJzNn7xzYSZpmDzRz5bR4WkPRFG/MM1S0QGnUE/tMoDRu36FwucQVvMhTGP/O7jMEzHNHQUQ==
X-Received: by 2002:a05:6830:6484:b0:72a:449e:2b69 with SMTP id 46e09a7af769-736ecef9188mr9330676a34.28.1748956673048;
        Tue, 03 Jun 2025 06:17:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791d105sm1905969e87.209.2025.06.03.06.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:17:52 -0700 (PDT)
Date: Tue, 3 Jun 2025 16:17:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
Message-ID: <fhzdhzxdwcoiuhx2eogpshwt5cxagjkrygrefqikmfbx3cfcov@awmhgrvurnfi>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <styd5gjksbsqt7efylpfn6bgwgyvt6zexxiooihjsnmp25yigp@unq7dor6gso2>
 <447c3b13-8d6d-4bcb-83c1-9456b915a77e@oss.qualcomm.com>
 <inpfuxskvmrebxitqtqwzvpnpicibo6zakgk4ujpcrqrpef2vw@nhclj5rg7axr>
 <9037fefe-aa40-4884-97ee-b81ff8346944@oss.qualcomm.com>
 <htufwjvfgdtav2gtgrytc356py6xqhrffbwjg42sgo7k4zzxof@z4xaf35qz7kq>
 <aa17d7d4-b77d-4a0a-88c3-86255dfbc29d@oss.qualcomm.com>
 <75dde9a2-3c0d-481b-bc73-089ba89a77e0@linaro.org>
 <71196aad-6d80-4356-bbe5-3070f6b74bfe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71196aad-6d80-4356-bbe5-3070f6b74bfe@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDExNSBTYWx0ZWRfXxDVhvOyVLEmH
 io5+lv1xPcd/BjTGNnV3Bip/iL10KK0r1pOJzryLxPxHutbiWrTqf9ee3Dmkd2b7cF+iVxOq9tV
 GVmJ8k2eDbfMpof9Rl9GJJkqCUJTE5P5vniYZkzNaHLW23JJcA06EuD9eckPlPOp6ab33tMNcWf
 MY+f4wRF0px/No4k+5nzW8Cr1ERv3gQwVTcb2jM4KB7/ZYqwCXF07hDBuBqrcaoiOa4NnQ07Scd
 p7Nvw+SXnYhVj1ZY2EbF/Awi+lPZRTtJOdXSPjrOjkhtKCGbqYkmQuxrfePZhZqv4sKuKpIhFT1
 1i5ZgzFYKyG4b72GBNgeIhLcEetDNp/gwQW0lOQCWegRuDgn4XT3/FvYEoZVUiCxLU+1TmwGmlF
 z8xMssfE36Bp9cOnwlTa0PcCJdsamqEx4bufunuUGaPsomzuATuXxXxM7K/wW/AbWyi6xkgL
X-Proofpoint-ORIG-GUID: v0Rap_uwYcnDgEgeLLmUicrD3Lr2UD24
X-Proofpoint-GUID: v0Rap_uwYcnDgEgeLLmUicrD3Lr2UD24
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=683ef602 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=G_5p7y9kmCDjZpQMCqIA:9 a=CjuIK1q_8ugA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030115

On Tue, Jun 03, 2025 at 01:03:11PM +0200, Konrad Dybcio wrote:
> On 6/2/25 10:55 AM, Neil Armstrong wrote:
> > On 28/05/2025 18:56, Konrad Dybcio wrote:
> >> On 5/28/25 1:22 PM, Dmitry Baryshkov wrote:
> >>> On Wed, May 28, 2025 at 01:13:26PM +0200, Konrad Dybcio wrote:
> >>>> On 5/28/25 11:00 AM, Dmitry Baryshkov wrote:
> >>>>> On Wed, May 28, 2025 at 12:24:02AM +0200, Konrad Dybcio wrote:
> >>>>>> On 5/27/25 11:10 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, May 27, 2025 at 10:40:02PM +0200, Konrad Dybcio wrote:
> >>>>>>>> Register a typec mux in order to change the PHY mode on the Type-C
> >>>>>>>> mux events depending on the mode and the svid when in Altmode setup.
> >>>>>>>>
> >>>>>>>> The DisplayPort phy should be left enabled if is still powered on
> >>>>>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
> >>>>>>>> PHY is not powered off.
> >>>>>>>
> >>>>>>> This series doesn't seem to solve the USB side of a problem. When the
> >>>>>>> PHY is being switch to the 4-lane mode, USB controller looses PIPE
> >>>>>>> clock, so it needs to be switched to the USB-2 mode.
> >>>>>>
> >>>>>> I didn't find issues with that on X13s.. Not sure if it's related, but
> >>>>>> on the SL7, after plugging in a 4ln DP connection, I need to plug in
> >>>>>> the USB thumb drive twice for the first time (only in that sequence)
> >>>>>
> >>>>> Might be.
> >>>>>
> >>>>>> But there's nothing interesting in dmesg and the phy seems to be
> >>>>>> programmed with the same values on both the initial and the subsequent
> >>>>>> working plug-in
> >>>>>
> >>>>> Please try using a DP dongle with USB 2 passthrough (there are some).
> >>>>> Or just emulate this by enabling DP PHY / DP chain for plugged in USB3
> >>>>> devices. Would you be able to see the USB device on a bus?
> >>>>
> >>>> I only have a dongle with both display and usb that does 2ln dp
> >>>> (I tested 4ln dp on a type-c display that I don't think has a hub)
> >>>>
> >>>> USB3 - yes, USB2 - no (but it works after a replug)
> >>>>
> >>>> Are you talking about essentially doing qcom,select-utmi-as-pipe-clk
> >>>> at runtime?
> >>>
> >>> I think so.
> >>
> >> So after quite some time playing with that, I noticed that the USB2
> >> device was never actually kicked off the bus.. and works totally fine
> >> after connecting the display output (2ln DP)
> >>
> >> I was looking at dmesg, checking for discovery/disconnect messages,
> >> but the device was simply never disconnected (which makes sense given
> >> repurposing USB3 TX/RX lanes doesn't affect the D+/D- of USB2)
> >>
> >> I also read some docs and learnt that what we call
> >> qcom,select-utmi-as-pipe-clk is suppossed to be a debug feature
> >> and is unnecessary to set on USB2.0-only controllers
> >>
> >> The USB controller programming guide though doesn't talk about DP,
> >> but I'd expect that we may need to set that override for 4lnDP+USB2
> >> use cases (which I don't have a dongle for)
> > 
> > Yeah basically we need to:
> > 1) power-off the USB3 PHY
> > 2) switch to UTMI clock
> > 
> > In the following states:
> > - USB safe mode (USB2 lanes may still be connected)
> > - 4lanes DP mode
> > - DP-only mode
> > 
> > But for this, the dwc3 should also get USB-C events with an addition mode-switch property.
> > The flatten DWC3 node now allows that !
> 
> Yeah, I got even more confirmation this is intended..
> 
> I hacked up something that boils down to:
> 
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index 7977860932b1..e5a0a8ec624d 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -464,6 +464,11 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
>  		break;
>  	}
>  
> +	if (dwc->mode_fn)
> +		dwc->mode_fn(dwc, mode);
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 7334de85ad10..ea56f5087ecb 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> +static void mode_fn(struct dwc3 *dwc, enum usb_role role)
> +{
> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> +
> +	if (dwc->usb3_generic_phy[0])
> +		dwc3_qcom_select_utmi_clk(qcom, role == USB_ROLE_NONE);

This part is a hack for devices with no USB-2 passthrough, isn't it?

>  }
> 
> 
> It was easy to tap into because there's already mode switch handling..
> But obviously it's a hack - should I register a typec_mux in there?

I think so, we should listen to mode changes, instead of host/device
changes.

> Should it go to dwc3-common or dwc3-qcom?

I'd say, dwc3-qcom. Not all dwc3 controllers are USB 3 capable, not
talking about the USB-C.

> 
> Konrad

-- 
With best wishes
Dmitry
