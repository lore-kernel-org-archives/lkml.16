Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD0429ACC6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651573; cv=none; b=IxRLaWl5Aq+Gxm6Uw0mFx5vCQs/ZeB/53rFoZpPP3uJFjSsaxtXRQuMdRiN6Z3KEe5k3F3RJeKEormy2E7ZDOD3vPYfETBpocaiRhylP3VT0Ngtwrt+atD34L0HRB3xwcMYLxanZrpgssYtAJBGSR33wb/T4TMUkuCYwa4qKdsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651573; c=relaxed/simple;
	bh=UfnHdSKZ0T9IHQZh4HA/F4jJyg+5+9FOJsW1zZ6W8Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzlVFhOxbtKEawKXqoRYH1FdB5l3uIHQZN65WBdOPpYrSnQMkVBDhNsvkkJNdlRJBktRANHGJ3pYL2WinO5Y1e74lNuwguaZ58yUsXec0biWLFbqhfrgE6PpRY0xkIevp6RqQcJq8hTPYZFfe2jt7s81wvtaFvOcNCm0eSecfrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1sgz+rH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1sgz+rH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DC4d027238
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=874Q5YVFPtejmOnGeVJRP8KZ
	m5kEcEGmP2NS8rGVaww=; b=W1sgz+rH9iaGWziEFkvmzRbJOZ1/u+RfoZOJNjxC
	vLez+0c9NEeHtJclxnRVEXeGByYrf1UfJt5vO5oYxAPlQcwzm4930nv9G/ls7FXO
	sBL9Z8XJWt4sTSBODjMi59Ke8d9pI//8NMN+vlvWHZvvYdsCJNIrsK76XJ1HdQqs
	TINgf41whSBuPMl79Qr4BE8FEV7C/P70bCx3K0u85WiWkpqJ8mXXAP+DfsJX7NeR
	y6y/RIhbbzf6mMk1+i7+qyzmKm0Gf4jJ+Q4VB2CyPasVIDxutrCc3ikJAyb0A1DC
	d+YI6EGIWDX4r2aQCXfrFLMHiNiDfwHr7C8vNegGCHQ7Fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhc75c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:19:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d099c1779dso1178358585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651564; x=1750256364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=874Q5YVFPtejmOnGeVJRP8KZm5kEcEGmP2NS8rGVaww=;
        b=KXrik1v5W3JVSg5JThL6FZSPDizQUhtygQ3PI12aCgyauZZWvhbzIRCfeqdGF9boxd
         JrGm4y4wZMfclXWynhjemQMp90/D2X459fwL1I4w645gh57g6c10+4rIpOeyQskThLO3
         Hj3OfTo/oFXSSdtm63YQ28xIIAB82LuFx2zdRVK3PS6yEM+QzsJybtBPW/l0ReYiJohE
         yMQpUv3hMzkjfQB0/PgallKl+/tgqMlejgvxQGlmEVLJc8581HchhmngUiowyhIMRUJW
         /RcwoautZrX4B+DdKIQrLbte0XQdiKc95IiEoeWz9j1xNP+BMxThPsLWYOzVDOsBHByX
         dAFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnaDE8+VkPDrIKWOw19pzZ41aElSwhG13Z1XrgweNvQvOHTqVIj74E639Lu1t6Wp9KnniGNL5BxAwQ7j0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHCVIDLEYD5wbH2AjnscjIlj6R96X2PZPt4j9EwwySG45wQnKJ
	msBgwlg4XQPTQ0ROJSKjSseExPhENPZkaTgqW6//hYuaitq9cBFlBT1KNsfboeovFDg13KzzdmA
	/zexZJ0BG2UDJJX3MWSazpImMuDqN3p2lTcnOnK3HVSv4L+wSFemhtTHpjoiY7PUGBCE=
X-Gm-Gg: ASbGncuBhjQsV7+fwWpZ5MHhS2i+qc3BmXRgVvgZUaEti5ESE7jtqin000XDEokQ9Su
	H2NSQKty6PMFUwgOKl/hWz1y5S7Ld9P7dbusyi+K0w3+TmrrXOL3tzRSYLccV9P/hZwmv7TKpJ4
	fIzI520cmiWIlk68agDjgPdqq+FoWSKQoWoWw8EDVxaC+PdyEKrzgSlYcZzbpkBeqvUfKHezr0A
	MadII6zHD4f99QxwzXhKeAUOejFXbxOLymZRIZTw+XFddqZz4YRQojXEXs40vb297sT/BXEXjXG
	4iUm+vPDgIXpN6a81jhKiBa/FU+b53GwNcdoxi+etDI/j1USF2EWYWRl1gqvMg9h8eHJCMCtUAY
	ZhqYcxhrEfLwKmjeuZgQqjSZ8ujNH0c87qDk=
X-Received: by 2002:a05:620a:1d07:b0:7d3:96ba:78d9 with SMTP id af79cd13be357-7d3a95d7ebcmr462331885a.29.1749651564651;
        Wed, 11 Jun 2025 07:19:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAaOi73AYWlSbDOB5FoX5maZieuX6BK9CyazXK7gUyraDN4tNP1BHcDiW8mhiwHO8YmQIfKg==
X-Received: by 2002:a05:620a:1d07:b0:7d3:96ba:78d9 with SMTP id af79cd13be357-7d3a95d7ebcmr462328285a.29.1749651564172;
        Wed, 11 Jun 2025 07:19:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1cccad8sm18806571fa.80.2025.06.11.07.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:19:23 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:19:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615: Enable TSENS support
 for QCS615 SoC
Message-ID: <x2avlatyjo7sgcjubefexsfk6gerdbhx5dcug2kszk2hukcusm@srs5dwuc2m22>
References: <cover.1744955863.git.gkohli@qti.qualcomm.com>
 <1758b5c2d839d40a9cb1dd17c734f36c279ac81c.1744955863.git.gkohli@qti.qualcomm.com>
 <74b017c2-7144-4446-969c-8502fb2cb74b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74b017c2-7144-4446-969c-8502fb2cb74b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6849906d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=fHpipdgcYPiT0vFNL1EA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Y-yNIJOHlnNnxar3AWHNiuQ6F91EZuYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyMCBTYWx0ZWRfX+Q0S4pZnxLxG
 x1r53N99xN+SeMxT9mxnAacby9GjtGpZAsP6OVXn6Un94KoBA4oqmDnbOiGZAGMQMkYBsUeGHoQ
 O2M7DAkBdv/2Ujq+/OQwRqbOasD+FQOjOCKv6/wo7zNA9vvO5E11kMyoPsKaLp9ikSlY9mno4Gh
 LHe/FmvvzovaSCXg4F8jLhvgWjGy3qVr3lPj6mmboZf0j4l8YkoPwA/K7DW+p2lP+hBkPYpf+jh
 s5R2CBE17D43UfsACGac6NghBva57D9hikQrYLV48NzhFVWSFup+P8fU2G8QNMyWaphm8/hoB6r
 ZDmybzAABzSP/lpzFknOXGeDClS8t0mABQRmTes6B5AHJNZ6TFwge1zzkgHFVNK0eCNzNQTV9no
 4YUzZdlrnTtH9fyAcvfKxZVi9dERpnNqHj7EqO83JDq3NXmXEQIlh0of8HPxPdNfD5DUhvtK
X-Proofpoint-GUID: Y-yNIJOHlnNnxar3AWHNiuQ6F91EZuYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=745
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110120

On Wed, Jun 11, 2025 at 04:08:57PM +0200, Konrad Dybcio wrote:
> On 6/11/25 8:37 AM, Gaurav Kohli wrote:
> > Add TSENS and thermal devicetree node for QCS615 SoC.
> > 
> > Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> > ---
> 
> [...]
> 
> > +	thermal-zones {
> > +		aoss-thermal {
> > +			thermal-sensors = <&tsens0 0>;
> > +
> > +			trips {
> > +				trip-point0 {
> > +					temperature = <110000>;
> > +					hysteresis = <5000>;
> > +					type = "passive";
> 
> All of the passive trip points you added that aren't bound to any
> cooling devices should be critical instead (otherwise they're not
> doing anything)
> 
> otherwise, looks good

Don't we need cooling-maps for CPU thermal zones?

-- 
With best wishes
Dmitry
