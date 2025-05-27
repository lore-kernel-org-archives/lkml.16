Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D7E189B80
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748369896; cv=none; b=bJPQ5radv4gW1PYmxoAg75NcE7swZmpQLriFimIajOiqIw+8yiYaIpL5cCz+4F3rTIM/xfaftL6CLPbCMIyxbgDZ3XY867/ruEboRRBQ5hYyVj7+IPGpWABrtQ2zPiZTkmLaGI6ytaJwy3xXGlHz1RQlaNYY/rJM0NP7u686iTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748369896; c=relaxed/simple;
	bh=YpbGPLy0FhKibJxBQ1UKHzL4fvYwX6zXmzNtF+S2JYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=as7D1kfFMt9PqnDWzMng9QVKf6cCGjd6VeMJ07dnF4bDg3IY469+ccgP5l/LkJQgh+YUNVebXNRIXtjAUvh8tqQuzOQUJRKlaxRayBLe8i/ZBMqIM1HCgbwCAz8Gg1CBI9WXXLIAnV0upl6mDYNfIQBsheD+vDmxYsmeBI2JvL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDO+A9d8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDO+A9d8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBBmoG023081
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJK/No0r5bmIrq7qKNYSje+ho/5oIJXFTmaB6JBNteM=; b=oDO+A9d8kppoieny
	ZhcsGWMELZvAJW90tQ1UmkksiU65hFPRSg4HWllxPz4rTTi5OdO89rKMzy6cq4Mp
	CMevBZ23UqM59R86BC25+r2+K6452YHByy0u6lBEaWNlY3y2qK3/D4RywTY+qzfz
	xBBVS6EWCPQHIGw11lHDHDRR2Y/NPBkFjUDuCx82kDKqR/cX3QtpvpIirImn58V8
	O8gFoEUesFa0g6WuYgPcJKMfxnR/nZtXiLUTb7trtDQFxSiO45TTxwfruIOxSva2
	HyKW8VA/Xr4Ua5YXqtnQGES2eJ3A1nCIrIRBltbGLaPnkdWHylYfNFV70wJKeVpy
	Hi/rbw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjqtx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:18:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faad1f2b69so30680516d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748369893; x=1748974693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJK/No0r5bmIrq7qKNYSje+ho/5oIJXFTmaB6JBNteM=;
        b=DYms+FLv87iBCojewu5x1XpUaEzpGDfKpTVgDTcCeRXhDq6hQZf1/4pLJ9UFJ7Er0a
         Nki/kcMl3Mjx4FvwOxaa/J+Oe2UnpbI9DnL58J84aKwi+p/0pEuCRYmrt22NfnmgAwKW
         S23Nexz7yAgl2tx08ADU+AuWtimxyXguuQJY4GvYpafDvSpLh/WTL5nV1G3OfEZhEqBH
         N00S/afqeQK9TobupiTxkvq/K1XefZ5lgRb7UAUUVBF1tl6nWKsIbMAuCdOgcb7GSWc6
         K0fambFMx9/dFY7vk5KYsERrlHnNkPUR1T7e68qnyxdUtfTNjmWc2zgHn+nq6kIKcScX
         IWbA==
X-Forwarded-Encrypted: i=1; AJvYcCXoYmT+JxZ6n47g1qDlY8B+3UPTaYRxAVGV6TUS242blMSae2ICXhGX/+1Y8G6aCGwVndueZM5r+cvpUkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUWUGJXcOD13PZuC0PRFgnZ32nLS37Ur50FowKoANoor2CKguZ
	5RFHd94YEp/bee7TdOH5MM60N63FQYc+lc2uBICzJXuf6Ww1iQn4LxKoGULePM07jz+xtW7qxcZ
	0mHL994ggHOA6iklw8lx1p5NB/dQDuWPhaK5Zvs8oQ7aZGUN0Lstu0Iv5Aqi1RDUDhBY=
X-Gm-Gg: ASbGncukdHC/pxBDdnMIBF+gRexvRiw03zcoPztBX9iEP5MSCn0dbL83NsqRZNIL/gx
	XyRlJ9oqAmgYqT56fo8e4FN8RKMQEAe8hnxt/UYDdOLkgK7L9xtI25ncZ8IH+qXO6P58pWvIyZc
	y3l2XqaY58Hg9QOl4H/eqIFqIwV5ixOtMabOXnlUFed/739QSw3UTon+9v+t1ywDoPX0mjCuypL
	qW3zimY56N+qs8hbf4f1wCGVOqJF1vxpiIDUlD86XI4oFCTqYhCIQV6kE3c/hnmFjZ+a8YE6yQ+
	arD6gnsKfFOEe8xZHehR4L2VneQStDv9hRtoL38JwAVyOLMCEyJgAb4+Ru2yWfdHGtCUMjrpj2Q
	=
X-Received: by 2002:a05:6214:2482:b0:6f4:c15a:6215 with SMTP id 6a1803df08f44-6fa9d296321mr220834936d6.39.1748369893356;
        Tue, 27 May 2025 11:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAS6tHMfJZsNl49VnqIOuplxsXW0akPiMhw3zGTdfBngOLfU+1DjVOHBRktmQQvvZoL0P2nA==
X-Received: by 2002:a05:6214:2482:b0:6f4:c15a:6215 with SMTP id 6a1803df08f44-6fa9d296321mr220834346d6.39.1748369892842;
        Tue, 27 May 2025 11:18:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532c01542esm239678e87.255.2025.05.27.11.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 11:18:11 -0700 (PDT)
Date: Tue, 27 May 2025 21:18:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
Message-ID: <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=683601e6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=J3uWmJ2zRmaukYy432YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: OHfE8iGoPbDNRnlLK_kVgP8IxpY1MtiU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE1MSBTYWx0ZWRfX4y4PGjvNVuGm
 UAmENpsM9yA2l+qxEnDImAdfTmgj/CCcgv4oEfRcej+hdi+xkF2zSjoTSaIcJaFzd7g//iiOeEW
 wsbKuN6j6IPrMhNKY0CMtc4EL25NSmtSaHqgR0VOwPb3svzzNv/i2MAwNf3t+X/vqdCOv4O9LHH
 sMHicR464QN6l3hD/77Tl7POTrmZpTdSaakehMtrBi+QUlGzppy+Pe4T87euqhKdJtpiL0NZGFF
 rQdAhlDhW44Na4GewLebnGxz+ZeeNFEPb2HbmCRjv+EUreQAfzxPP8rFqEQYfXkx8VWVDVY3WqJ
 F38ekw+6JGlbl5LWaRZOnQvPrhQ3iapykYgoWMMI5SqlUCwoyFbRmMO/GC6R67KqskxS8duXxE5
 VLmvYGgLMoPpjQEtcdQaQ8ygZkxHTHXzRjcX74Y4UPryvSanUdrSYk002cvEFqV1jF/yGJaL
X-Proofpoint-GUID: OHfE8iGoPbDNRnlLK_kVgP8IxpY1MtiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=813 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270151

On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
> On 5/26/25 5:28 PM, Rob Clark wrote:
> > On Mon, May 26, 2025 at 1:36 AM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
> >>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
> >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>
> 
> [...]
> 
> >> Yes, please. Don't set okay status for the GPU until it gets enabled.
> > 
> > Drive-by: Shouldn't the dtb describe the hw and not the state of the
> > linux kernel's support for the hw?  Ie. if bad things happen if we
> > describe hw which is missing driver support, shouldn't we fix that in
> > the driver.
> > 
> > (In the case of the GPU there is the slight wrinkle that we don't have
> > a gpu-id yet so there is no compatible in the dtb yet.)
> 
> My two cents are that it's okay to enable it, at least in this case..

That would most likely make display unavailable as DPU driver uses GPU
as one of the components.

-- 
With best wishes
Dmitry
