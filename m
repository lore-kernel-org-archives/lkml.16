Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117D81A0BE1
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306118; cv=none; b=LamLNqEFdFzbTqwxCTFZ8krRTbWCVHoWdzogpE/ghFgrmz2M6/NujFFxvF8RJ6mdnmLSZtdBfjMnC+u93Bl4nsPaPd1B7u3AkO9cSOry7+wGGq8HRAAK5908hT+9CKZLMko3Yo3pr5KpcicjX5ZKqZDevNCEXz/3ORkFB4a44w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306118; c=relaxed/simple;
	bh=9gc2cmErwt3XqjWLbRuILM8RHadjD7i4EH+6dlra9/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UShKjJ+JO8yj5Q5x/M8FAWYtOJoAdvL8fP6iOyRoExn2Zbk4ozFyQlSjM+CNLvTAMyxyHkVK9P4s3ImOooe0rB/GjoH6XbiQTMJEwEixRWBwkLXmdeJyjnpotBRd8d47nThjXE7zNc7fVeuQstWDO/cR9vmY6WVf2ciy6i6moUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYKDzw5N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYKDzw5N"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543JciS7031347
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 21:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cn80525Sq5fGq7ITOodRe4wI
	Al3PMn966j5BIVBXb1M=; b=NYKDzw5Nd1lUyzb5R76NWM9owHDbbchBvWDfns5t
	TdSXr1YkVvySpPsYOB8a51ZYZcEs9PW8A9I+79qHh6/bNctl9mEvVJ7FCCRD6ol5
	G3FVgH5v5dI01sXAqErjO8c6l5IWPjP2wVXYwHLJlan68iFGy2TMJpkpxJxoJHqP
	dD6u1MkXoYpu/iLjAU6JZuP9s4lZfwpVVi7Rb2tGMCu+KYBc1bfTPu5aUdZxF+xF
	IOVM3jnSJfE5aR6enEwj6neEhgJv5t4RvVNKIK2FgjJnSCh4HRIBKiPdf/31p1iQ
	i8u3x/zPWf4UNra1PESl56dbcECbtN84NBcG/Y/AzLAE4g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg14vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 21:01:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff64898e2aso3157676a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 14:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746306114; x=1746910914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cn80525Sq5fGq7ITOodRe4wIAl3PMn966j5BIVBXb1M=;
        b=qex610BcsIvmBOLySGkjSBQUrhTqcdd0/MJmNEHQvp85K8FxQb2XJO9sYqOfRKm2hy
         hYreQk3u9Q8fx2ip3GO+EbHbYvfo1fwOSEoAJkzEnGXjsNyG68coS1lFeyFkKHBs1Akn
         UZRyFIjkU/of1nY7VWjTo5FwUieQ3opvmC7Rxw89b9rCT/3JbZ4RTwmd79bH5+zWa/dQ
         hORzNIg7lTagUvseNx7vk6dX+xGI1vZq2fshm/gqG+hxsYHIIpsNM1L4shaSweYjGhlS
         0a+Hc04uB6BuCGQ8Kl6tnmhf1kdloYkQBDUGWqg4xTj+qhrmiupa4fAMSpTkeNG5CA0H
         UIYw==
X-Forwarded-Encrypted: i=1; AJvYcCVaUoca3Sgfe6I5yv0TTIftZVMDUM19UrpSrzRsljkLZbWeDGo6MbPQIxka6alSIFRzPi+d/q5Mt09N7aI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlJaP4XSwZnClWHNdHa+BwrPVIoIntWxHJQJz80O9gR+jo/RT1
	Sm4vbx2E/y4vS3kxFp6BiQj5EbCToSPz51iXU0UwjlrLO0KDO+8IokE1Vrq07vJ60upZnwaJ+qG
	S2XsxJy2qzDzrX/VTkdVYPz9Dc5tjvBm2zK+PC3cUg5Od4cS7u3cRHBBOyepVZD/nnoFQ2CserN
	2TupgQiUBywltxvsbft8o2Hu+4dQr8rk7qOMZMow==
X-Gm-Gg: ASbGncvdyWC/LFSGMgaLlVlMGENXM4kEyGs1nZToYQgoqDwSzjXAsc14X3tFx/IwLhb
	pkXCunrQNH4XL2aXSJMWsa/sTTRe/eOdUohkMIL3lMiL81sINlYW88Q+n/PQJKje5Dq+hcw==
X-Received: by 2002:a17:90b:5247:b0:30a:204e:fe47 with SMTP id 98e67ed59e1d1-30a4e238283mr11780272a91.16.1746306113939;
        Sat, 03 May 2025 14:01:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMPD8yryO4aAzVK3k9gU+rNogRSOlsGH1wBDwPmv/JPT86SoET3Mma8EmUZRb50amWkhM6oJtI4sBpmUEyplY=
X-Received: by 2002:a17:90b:5247:b0:30a:204e:fe47 with SMTP id
 98e67ed59e1d1-30a4e238283mr11780230a91.16.1746306113484; Sat, 03 May 2025
 14:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
 <81205948-ae43-44ee-aa07-e490ea3bba23@oss.qualcomm.com> <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
 <dc64ygn6pt5bvdgizc2qk2qnxn3on5nv7hes3hhc6qqmiumdfd@nxpfis6disof> <858be1b7-0183-47b3-97b5-7d162b5748d3@quicinc.com>
In-Reply-To: <858be1b7-0183-47b3-97b5-7d162b5748d3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 4 May 2025 00:01:45 +0300
X-Gm-Features: ATxdqUH-zEu-Q8hx-hTs8Z0lWJcS4Lo1m6nzdFEbyO0oOCxxmfUEzj_5GmMtR44
Message-ID: <CAO9ioeV0H9OnmHke2prWSqB8+oD4PRfD0ph7qPahwKJHOPpOzg@mail.gmail.com>
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: EaAcmSaaKUwDF4b3giJABJCNQN8wnulv
X-Proofpoint-ORIG-GUID: EaAcmSaaKUwDF4b3giJABJCNQN8wnulv
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=68168443 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=E0QJNo61N1AVLolVTSsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NSBTYWx0ZWRfXzTWwkc4qt6KQ
 2O6hHKMZpn1I1lCPNa/IPQSatmYu2ehNGc4DnDmUYhJk1S+D5dg2L0u0jAZCGd59WQ09oZ2R1Wn
 RPyGs1MLccdUTnEJap6bdnh1jQNSDCeP8XnK4tBAiEnbTSgUF/2IVQyNk2MKIpTeixIV6O/k/YD
 esrU2/FuP7dc9apTYq6Kn8EtkJYTNHWRmPK7qUm7tE8TB1vTxXJYsDEQlm+zX7uWPRi8UXrQzQj
 2l1Ddftq5Ug3Go4LQfHIrvFZgCEjrVjA8y7mP4TTFsc30Oeaj8B5zJuwObDBrNAPCS+5rl/qVfG
 5OSZin35gEORFSnHl+aSkWO+XMmAOuhkioWfitklHRUGA2CleUP7T1p1UkKQ4MT08kahhjkzudt
 xGvLlI1HE+JfvHjPoH3r9h9iB0MF2Y6EiKFSRpbecYZSTtkkXHr2PG+hrAV9NsnxEFmciw91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030195

On Sat, 3 May 2025 at 22:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/2/2025 10:51 PM, Dmitry Baryshkov wrote:
> > On Tue, Apr 29, 2025 at 04:07:24PM -0700, Abhinav Kumar wrote:
> >>
> >>
> >> On 4/28/2025 2:31 PM, Konrad Dybcio wrote:
> >>> On 4/24/25 3:04 PM, Krzysztof Kozlowski wrote:
> >>>> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
> >>>> DisplayPort and Display Clock Controller.
> >>>>
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>> +                          mdp_opp_table: opp-table {
> >>>> +                                  compatible = "operating-points-v2";
> >>>> +
> >>>
> >>> The computer tells me there's also a 156 MHz rate @ SVS_D1
> >>>
> >>> Maybe Abhinav could chime in whether we should add it or not
> >>>
> >>
> >> Yes I also see a 156Mhz for LOW_SVS_D1 but we had a similar entry even for
> >> sm8650 and did not publish it in the dt.
> >>
> >> It was present till sm8450.dtsi but dropped in sm8550/sm8650 even though
> >> LOW_SVS_D1 is present even on those.
> >>
> >> I think the reason could be that the displays being used on the reference
> >> boards will need a pixel clock of atleast >= low_svs and the MDP clock
> >> usually depends on the value of the DSI pixel clock (which has a fixed
> >> relationship to the byte clock) to maintain the data rate. So as a result
> >> perhaps even if we add it, for most displays this level will be unused.
> >>
> >> If we end up using displays which are so small that the pixel clock
> >> requirement will be even lower than low_svs, we can add those.
> >>
> >> OR as an alternative, we can leave this patch as it is and add the
> >> low_svs_d1 for all chipsets which support it together in another series that
> >> way it will have the full context of why we are adding it otherwise it will
> >> look odd again of why sm8550/sm8650 was left out but added in sm8750.
> >
> > I think it's better to describe hardware accurately, even if the
> > particular entry ends up being unused. I'd vote for this option.
> >
> >>> [...]
> >>>
> >>>> +                          mdss_dsi_opp_table: opp-table {
> >>>> +                                  compatible = "operating-points-v2";
> >>>> +
> >>>
> >>> Similarly there's a 140.63 MHz rate at SVS_D1, but it seems odd
> >>> with the decimals
> >>
> >> For this one, yes its true that LOW_SVS_D1 is 140.63Mhz for sm8750 but this
> >> voltage corner was somehow never used for DSI byte clock again I am thinking
> >> this is because for the display resolutions we use, we will always be >=
> >> low_svs so the low_svs_d1 will never hit even if we add it.
> >
> > Please add all voltage/frequency corners. Think about low-res DP or
> > low-res, low-rate WB.
> >
>
> Sounds good, lets go ahead and add all the voltage/freq corners.
>
> Like I noted, even for sm8550/sm8650 the low_svs_d1 was missed out, so
> if we are adding it for sm8750 now in this series, a follow up patch
> should also be sent to add them for sm8550/sm8650 as well. That way we
> will fix them all up together and this does not come across as a
> discrepancy.

Abhinav, if you know a missing piece, please send a patch, fixing it.

-- 
With best wishes
Dmitry
