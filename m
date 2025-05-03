Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EA978F43
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 05:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746251472; cv=none; b=GpZE06Z32kYtkW94OfOKtYY7UO4gAbTqsY6EmmieNZLNw1Bpb6NaO7lqUR9pR/5ch7o3mfSWOojdKuK8HGMNLTASpnc9c1Ku+hnVe3Z0k9m9T6r0Ii9fc6D7I23iS2dGKhLUPgmzfy6gdFvAcoHEEYFe80DfP21qaw8vy8dxUdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746251472; c=relaxed/simple;
	bh=AxK2Er7e4qbH+VJ2vhJbE6S+jLI7sAd0bDAU0Dmr3U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0AXS8FWMUFYPqtLej8tJPHBiqd6QyM2plxNDXbdxYKy5DbJ547GeIpwaVSP8sLwJvve6VxkYlWCxOpPVE/S9fr8Bl3Diy7zEElbj4Mf7ABrjrT0zude8YbYu2DoZr+dswwYBkg86+LXZO3g5kczqzwR2gD8EZ413tdtVzmr704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zcr9CJyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zcr9CJyD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434i65C031585
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 05:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z7RuyIdhrRBZm4S/CdQ9tNde
	Aw8FFfZxEFL41QTfBVQ=; b=Zcr9CJyDrovL8SU+zmNyOFN2y0XUSicLIlcRrmww
	0swuT9Shk998kPSUfnKsmAe+HaeJwIqaiSClW/rbfyLIb7mrX5ewaac10wQX1rnF
	OJmGmCC74sh2QahqMZdBzJ1WCFHLTyDzY6qDUyQE1Fji6o4dgBssr6/MGdp9xBxz
	2ZA0G/F/867wqKbebyknD18j6alG2aeuCwzERk2SPvFa7A7+qqqc6q5tcyYfkV1j
	mlxn9wuWHV1dX8ZYuDloNl7LqWKLMLsvJbdIEgFA3YP/vK+kaNi9/xmrRTXt1WQo
	mF+gttf71v7SGuWaZCxH8jlDGNAKVUD9Pm2rk1V3ZlBTGQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46daqxg647-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 05:51:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2a31f75so18956185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746251469; x=1746856269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7RuyIdhrRBZm4S/CdQ9tNdeAw8FFfZxEFL41QTfBVQ=;
        b=L8exKC2cGb1xpMB2iWUZ/kP1WpOz9pxKTZa/jb00MVQCy3OgW9jYD+COxFdCA8JlLF
         KSAeecdfk6bDRdmR+PmyEUGN0op0ZLYcnpQ1PLrsHbXLMU3byTDPtO2EfKXPiYGoJ/3X
         GuGsba7q3aiVQKtz5t+zjojTXX2otxSRcaOFbzRf+XA6cj/OXVhLQsJKy7ZI5I/GvtJy
         waR5X3XjRaPcOvJkt5tdsfhBnoljEEruIoC4wzi1ZdIy1qhbGZkJFv4mzQOJ0iPCYnXD
         CuNa0HCzmjGBfzYQoQrLzDZFF8EqgV2HurquGyTp85eBDVNLnkuXPeWFe77lqcRSM9xF
         6aGg==
X-Forwarded-Encrypted: i=1; AJvYcCXYZr0ju22Q1umrSrJR2k1UuhZ87rktRLgw8JCMx4CLOT+i/oG614NOcYteZ3Ai9K5Vd0FAnYmPHmcgDaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjbuapfFEq6NofT1Qf0mwtpBscFSObFL3oPPw7hP5gAXvWkA6T
	MuokV0vPS1Q8wC0X2vGMzwkw1QLpx1jetnrIZOOpgEjMyYQVJvgtmOu3uiXjlg0P6r7O5f2YxSv
	5h951LjxygDTxGOfCb8gYrmpeGNilQez26aBbXZQ5rjLD6C9r3tPDVjbH4WAuHyY=
X-Gm-Gg: ASbGncuTEOfUTl3bEAEmLxG9pwhnob92M+4NNAx2J2WJZGO2BYTTMx8R2LBxdT4Np/Q
	M0Mf1swB4wUb/ut+tufRxInlyBss6JI0ugATDHIocG2z3nQPwH/4UIMQi5XbGAAqir7DKPTCJrJ
	AQ4T1xvUOuNH5+x3yjsgOA+MkVRlYfm8XzNJcme0+ZjLgrx+rieIm/GCmB8pDUnlh0Y1O6RPvg5
	ykDeQ/2+VbZftVV8fWQnlPWJwEYDfw46i+dlRRqg4cjyYc0z3LiEPBXQke/tvkRQX1eaPYtksF+
	kDMOSSohn7C/eRvxID500PkpF51taaRWzxaIN3TKlYxF6O/Jun84PhgtRHl/RXXHELZHCs4AXPg
	=
X-Received: by 2002:a05:620a:8013:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7cae3a5a0dfmr5907785a.5.1746251469333;
        Fri, 02 May 2025 22:51:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU1mh7yhVDqrwrGX92lx5O39gpt1bwUkfkp+UAf/dF55RZM9Isaqsry40YdK6JtOnY5dhaeA==
X-Received: by 2002:a05:620a:8013:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7cae3a5a0dfmr5906785a.5.1746251468983;
        Fri, 02 May 2025 22:51:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f680dsm650283e87.220.2025.05.02.22.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:51:08 -0700 (PDT)
Date: Sat, 3 May 2025 08:51:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
Message-ID: <dc64ygn6pt5bvdgizc2qk2qnxn3on5nv7hes3hhc6qqmiumdfd@nxpfis6disof>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
 <81205948-ae43-44ee-aa07-e490ea3bba23@oss.qualcomm.com>
 <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
X-Proofpoint-GUID: -jzRqXgmaw9msfacpzcSILRBRbH3wPwT
X-Proofpoint-ORIG-GUID: -jzRqXgmaw9msfacpzcSILRBRbH3wPwT
X-Authority-Analysis: v=2.4 cv=baZrUPPB c=1 sm=1 tr=0 ts=6815aece cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=h8DH9cjr6Ktg_wdBaOkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NyBTYWx0ZWRfXyIQOiGiAR4kx
 sxtt33U1FMMKIu9SbUpdrcgKeaG7zCQOcz7FM03fTMhVv4TJ2gjuPeN254rC6UyyEr04XRc+Swv
 Lk8Ba1i97eiarkX6Ch3v4OCix0e84gPba+0rXkZciB7reTSdfnvEdUaivWQKGw9H5xOb14UgI/s
 bHN0DqPLo1ww4kjPsycxb+vQVN02i+ccTaGSbrA0IALVsBME8EU4CuCzmmUqDwk4TrCpRAvPwMu
 K6ICWBZRi6zCk/AXVEZ8WLUJBd8za4aCpWgFG46ivCHGaJZL/XIITgB7atIFOha1gnl2+BIH7jM
 nanQ2bLG/Sfx18H1rz1zS9BiLPvc7Ey7NJ1xNIu4F9E4J/qUOSCrjlEZVWphToCVhRQkWtUob26
 yL2nFCHzPtUtdG/+9BkpyokvDWR7KYjUStmjPe0vIs0E3xrrBTjBkl5QNrl4RQaQCtyB3Rh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030047

On Tue, Apr 29, 2025 at 04:07:24PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/28/2025 2:31 PM, Konrad Dybcio wrote:
> > On 4/24/25 3:04 PM, Krzysztof Kozlowski wrote:
> > > Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
> > > DisplayPort and Display Clock Controller.
> > > 
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > 
> > > ---
> > 
> > [...]
> > 
> > > +				mdp_opp_table: opp-table {
> > > +					compatible = "operating-points-v2";
> > > +
> > 
> > The computer tells me there's also a 156 MHz rate @ SVS_D1
> > 
> > Maybe Abhinav could chime in whether we should add it or not
> > 
> 
> Yes I also see a 156Mhz for LOW_SVS_D1 but we had a similar entry even for
> sm8650 and did not publish it in the dt.
> 
> It was present till sm8450.dtsi but dropped in sm8550/sm8650 even though
> LOW_SVS_D1 is present even on those.
> 
> I think the reason could be that the displays being used on the reference
> boards will need a pixel clock of atleast >= low_svs and the MDP clock
> usually depends on the value of the DSI pixel clock (which has a fixed
> relationship to the byte clock) to maintain the data rate. So as a result
> perhaps even if we add it, for most displays this level will be unused.
> 
> If we end up using displays which are so small that the pixel clock
> requirement will be even lower than low_svs, we can add those.
> 
> OR as an alternative, we can leave this patch as it is and add the
> low_svs_d1 for all chipsets which support it together in another series that
> way it will have the full context of why we are adding it otherwise it will
> look odd again of why sm8550/sm8650 was left out but added in sm8750.

I think it's better to describe hardware accurately, even if the
particular entry ends up being unused. I'd vote for this option.

> > [...]
> > 
> > > +				mdss_dsi_opp_table: opp-table {
> > > +					compatible = "operating-points-v2";
> > > +
> > 
> > Similarly there's a 140.63 MHz rate at SVS_D1, but it seems odd
> > with the decimals
> 
> For this one, yes its true that LOW_SVS_D1 is 140.63Mhz for sm8750 but this
> voltage corner was somehow never used for DSI byte clock again I am thinking
> this is because for the display resolutions we use, we will always be >=
> low_svs so the low_svs_d1 will never hit even if we add it.

Please add all voltage/frequency corners. Think about low-res DP or
low-res, low-rate WB.

-- 
With best wishes
Dmitry
