Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1CD215062
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751807836; cv=none; b=r9EYkDcXMAVERsIsXw+YdhkEvJApauBC9AFcrVj4R/aOiTQlGbB00biOhfdZbkwFokF7z+DQxGUar4SpWu71MZgFuDAVfz7B/QmtfjiKjD7glHR7rUZwggD2P8PCUwuxVrjcgSOhklKG4AqCVrbNg46YHUofREUmuI2bf9F3d4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751807836; c=relaxed/simple;
	bh=qTTz9nPQxiJwRdpENmjn6LsyPlXW15ajO1SLMCtaUMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJGVL6B0pouty7lsIfV/WyuVNdROAeTSyguC2dLuGQORqtrOwnMxmcibcb+c85r7Mcl4SHtL8IQX8JS1NymwzJbQO8IP3THesugs57m4v/wMo8GT4z9PwAPsS6WVmngY5TRV/Gu3/TPwCYYUqI/gOEB4Zlsqq4hF2ZpWtu+bBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NfFVCm3b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfFVCm3b"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566BhETr016303
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 13:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EMu8D2urkSnttwu+eBSYfOFZ
	ChWl6OEMNQLTQc/BZm4=; b=NfFVCm3bAqCLeEFx8tbQdxy5LMQbfjsyd3BCCTIW
	57n4/QGTnma2PdGDKa9w1yxSV0eIvEHgudsaXT2ewHe9xxw5gRVMN5tSIlN2bhCs
	4vK3VIzN0LtBHUn2Fi7rtYsiBjao5MRw6wIIvTA+lmlMPaY0c80OsmuMtYSZfg/x
	PmAMPoMuKxpFb1lNAfF5xY7y8jhLHDjiCSYOQqgZxe0ct5BBGht1bg0m+FUi53IZ
	SXycJgGYJBDLOq+5NUxQjrFH+Yu3dW++5cXHFa5pE1YOscADutgMELLXCkRcVp+X
	NiQIxB1WuiuTbH8LJkfz6Tn0+DWgFfy+g/aXZQ3NWYOmXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97480c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 13:17:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3f0958112so338258085a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 06:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751807831; x=1752412631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMu8D2urkSnttwu+eBSYfOFZChWl6OEMNQLTQc/BZm4=;
        b=n/NsovbajU19bzfkjbF1GwDsclJXptrC7jM4aWf/NZ2RNpjxGZLHxAhkgf5ttXvM0X
         6ZYQxAsKB4HB1zawM9LW3N4Lr2Ds1fhPOS4L375+OLnvmhBz+pQ6KIa88iVPlsSOAAZd
         2ZDOUg3fn/p6E5F9kHNo9Epn0ydWRvpWC23TiRWd61RJp5FtCYpuS7eZhjNEL0x2i7qk
         5PbApwt5GZ9rRnmt9Ym7h8hRx05AWuyorLAk0tSXUPsGz20Tq06oCcCkj387IVBQcYIj
         D5C5Caot1E0s095sWRzU/XTkx2+MqWC4PyO8Be8VT2pr9BX/D8VVZgtJ/9P6fCx7+ESJ
         YUyA==
X-Forwarded-Encrypted: i=1; AJvYcCWWPUBK528wTDT7wxPVi8b/OwYQYzElGYrk+iX0LR7d7EO6tkm6dLfgw8ffa3cnpRwmqxLWsbNMGOEFYs0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jqSHaMPkhfBzkXblShN0ZwUdnYf08fryGvj1e7PVBeoX5kxk
	7C7QLu5NdaWDJvGM6vKQThqc0bH7MncwsPc6b6c3DiEelm1NpDl9NLpjxr2MCkx5OJNGeUubAAG
	rGNY58fQaftu9LV+bKSzAlUxomv1GAz9XJy9hXBwsBjxdQTqmVQBAZB2vB/j0+VUH3+c=
X-Gm-Gg: ASbGnctJOsn4COp2MblNg9eSwv5IDU12a2wGPOs4P3d58DYuyeV5JPlRkXexLIdqTLS
	Af28SyGYVbfbUriEyAMgznPLA6XGRg4cYa37kk/WsyEFh1XjT+p4zlsN2/I94BZ/MUeXumghNka
	CtALPm/3vcy6V7a4EvWQQGRriH6EACzYZ0KOmnTF3zJ5IfrcHrebN6v84lVSXpEkfDkn/OJVAAh
	blS6xsaImVfGi7TFZVdP4qhM4Pwt9c7pfv9zpa1u1QTGfkSFUouiJpy5mVz2CNqJL68YMfhi249
	/onUp6r5EtEmgNSQh+er6u3YO9tcgfPY0glWdvw3Ms7SCcBWVzsGYXO/IFH/wKA5ADiA1d6yIti
	twyqu48qUfMPiSvsz+cyfu6TnvjJf4oT81h4=
X-Received: by 2002:a05:620a:404e:b0:7d0:9505:1797 with SMTP id af79cd13be357-7d5f0a3bb12mr606566985a.4.1751807831303;
        Sun, 06 Jul 2025 06:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2HuT065tZ8I8BaaCuYfsYtZ4vVgMbrvNo6D9ps+z/dQZyU/3GSde1crlgPLIHhFHrrRmZ1Q==
X-Received: by 2002:a05:620a:404e:b0:7d0:9505:1797 with SMTP id af79cd13be357-7d5f0a3bb12mr606562385a.4.1751807830714;
        Sun, 06 Jul 2025 06:17:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494d37sm953233e87.117.2025.07.06.06.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 06:17:09 -0700 (PDT)
Date: Sun, 6 Jul 2025 16:17:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8974
Message-ID: <huvsqr3hxkeerjevhvjobfyxzfjldoawlgj6xgmdgf27kwbea4@ijh6gqbsa35i>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
 <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
 <226fd16c-8071-43c7-9ecc-9bd95e319aaf@lucaweiss.eu>
 <znv7ish4ufkgnzfwyxjt2ercdvemxh644zwpqthj7rtf5gb4fe@auvbeemdlbtk>
 <6733d2ca-f73b-4332-97c3-ba79377538c2@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6733d2ca-f73b-4332-97c3-ba79377538c2@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686a7758 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=dlmhaOwlAAAA:8 a=tkrKlJn0stcreqTVr-UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA4NCBTYWx0ZWRfX2PAT/gVa5eE0
 U+rXYhsIwYKtBKOhJ1BroEcwR7PiZ19iEMw+xbBKWy/xLVtyHdgy/EJSqeXCldF4twnQPXAiR2Y
 mcyP6ZrJzMmjABt1MQJ+nI0hYJKcmBW4uYl98bq933z5jdSLcCQywr4qNQv83zdbhVfWGIxjL7x
 +A9r1bIqhFS0EI/7utdB8urdRl1TVcvkIuklXPHtlriiL80FOj96D6i9nW2ASoeBW9BHS+lAWdr
 Nt0kJyDwxoDkzQugSddnND6js8Sq47sCn16rnsFQrevkNkZ1GMfb2vMuaeuWWhfAZrsbNBwVEMX
 1Q9d4uZQCB+ig6NfRNK7dhSaf15YIcUITIRf+2bOQqSoNMvuecFr3QfY6mBpmS5n6mD4cWnCMoC
 DQKZ581GzpkQOrfGpQ+q+3OfWRmYOLTqfJsS36/EV+z5hqXoga9XeN7QZfzN6Z1yZACYO5jZ
X-Proofpoint-GUID: CbEW4MUNtjbs60x25VlMbOVcKInW7-ob
X-Proofpoint-ORIG-GUID: CbEW4MUNtjbs60x25VlMbOVcKInW7-ob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060084

On Sun, Jul 06, 2025 at 02:32:26PM +0200, Luca Weiss wrote:
> On 06-07-2025 12:08 p.m., Dmitry Baryshkov wrote:
> > On Sun, Jul 06, 2025 at 10:31:38AM +0200, Luca Weiss wrote:
> > > On 05-07-2025 10:57 p.m., Dmitry Baryshkov wrote:
> > > > On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
> > > > > MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
> > > > > which has cx under proxy_pd_names and is otherwise equivalent.
> > > > > 
> > > > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > > > ---
> > > > >    drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > Hmm. You are modifying the ADSP configuration in the driver, but at the
> > > > same time you've dropped CX supply from the MSS remoteproc.
> > > 
> > > The qcom_q6v5_mss driver has this support for .fallback_proxy_supply, which
> > > are used in case the power domain is not specified.
> > > 
> > > So no driver change is necessary in the mss driver for both old and new
> > > devicetrees, but the adsp driver does not have this fallback, so that's why
> > > the adsp config is updated.
> > > 
> > > Does that make it clear?
> > 
> > Yes. Would it make sense to implement fallback_proxy_supply for ADSP
> > too?
> 
> Definitely would be possible, but I don't see the point in doing the work to
> implement this, to then carry around a bunch of legacy compatibility code
> that (very likely) won't really be used in practice.
> I don't think any platform apart from msm8974 are going to be affected by
> this anyways.
> 
> Still same argument from my side, I think breaking compatibility here for
> this one driver outweighs the effort/code of implementing compatibility.

Ack. You have my r-b for the series anyways.

-- 
With best wishes
Dmitry
