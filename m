Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62A52F005D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195695; cv=none; b=Pgh9fm9iEO3E5//kIxdgq773OmnYWGBA5fE1AqbyBLtX95E3uaknD8wqJoMmJDiw4ZSQyT/0oICzUwUziVcMwZHDDUz2ITPhaV9uRvDlXrf1hBBgMGVQUYN//wv5mS+N9ZggBbSfOl6Glvwu9IpIkVimH6ZeI39bCSJl7f4Pw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195695; c=relaxed/simple;
	bh=K3Rbkpbbmv50zU+wBTjmxAX1i3UJp5nwGfq7f7SR8+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3hLt68dU6U29i2IVAAbRiM8P6hMIsNX/RDMiii7WGIfF1sRMCn776TixrwdzZ80iYIu9KfkpXMu/PPVb0N8PlnTVSdc4oIKXR3SPKFS4xuhgiRHOLCMlg4YuzowB1z+GwAfZFzE1yVYOeFqlYtuKvdXIWOgdp3kQZG9pGnZnh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgXIPI6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgXIPI6V"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HD0oNM015004
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNEZ7C8YHGpeeltsPa4+wuCabkqTlEwS5fdzn5tK/Mg=; b=DgXIPI6VKLBrpwEN
	iY4T0zBc4RypKh/iFoDABekZHMO/Wp2GBgVz9GO8g1ebFHYRtVkqUcedVJ1KVhdx
	xYwS2nfENApUzk3UMMUcRPOV3y2d1tiVmzC0oJcjcX5P/6fp5fNv9ZfgGVeyFyCM
	rpUbP6W091GerYDP8p3yJzxtWtbNdeMt3EZyFHx/o8cllfxkST+9h3PhsYwn+vvu
	p5oc8sYQ46by2ohXYUyZyyPmlDmN7R4i0EwSdDQxQmKSl9OcOJT0d26rKwa0/Qt6
	qHtjBWphmlhPzjNCr8f2I1fyRuwwbIH5/Rt6RSqKxG9QM67O22D0PKsDwgKoVY9q
	eiIGFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h99rwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:28:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d21080c26fso169576685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195691; x=1750800491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNEZ7C8YHGpeeltsPa4+wuCabkqTlEwS5fdzn5tK/Mg=;
        b=Gdi9IiJ78OSDICFE1O9VWIeHlA+AtUyeo7nCZWdrw2koJPfEdt57/RSVlkP9Fsr4TF
         Rnw9StR68l/+cWEi2d/5aaC5I4LAVFy92coU5/TKkENf/Z3JeTcT7o5AxAvRp7evUGX0
         FHVRiAjsC2ixKlwz8b0sOUg1FRYh7Xx6I2y3mGoLd7j0JX5aIglqr84UIw6JcbDPtj49
         azOtGRoy0o+bF1How/vpsHg4PtiGLN5Mo74PINLoStBnwYy2rtjGd8G7BqWzmDO6McYo
         PjQOIQfDHv7UK3p68OdyRWiWl+imshHA1Uds1E+vuL9tnDChMLzJbQTWneuhf5hZ8bL9
         WErQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3NSWUU7pNRUbH/7S+XH6816V4nBuLy6MNwOIM0bUv6TwjoQrb+B1swxnlI+G1HSjYq8RlSdmDBKz9Ngs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkSGyeqgpawrJM+pe/Mt382+SJb7Of0YZ2HhOXLOgdltjyeMw2
	B0kj91esUgDbWR7z5Dgjg//V9fJffoNmiPbIM7AOILrL/vaHHNKRVRmu6GQM+YAfli8gHp6Q7fZ
	8jbf75w+2k0kr4a4EogvyEq96r94drFZZUwtKx0BmrUWW7WvCsfuAcxnHdGRk1uAqIqgJTk2IMP
	g=
X-Gm-Gg: ASbGncuxLvsDpalIy5BXtRTYWmLTmYEQ4MJz3fGN+tGiIfhJaIf06K2wxPwBkayGfBt
	nlGBrh4Fg2SFU+s6kfqXHAY8GHyTsbGWjPbHNqKKh2F9VysnJ1Q2Bu985JoG/lv0XPAggb+dMPP
	QcwtoEXKTmWVMzafzd8wUu5cwBlJiXXSdjrPku75KC31nQRudmzJNn7ADLnCER0qq9Onk4rbfqh
	tAtwBubAo8PocACdIoXQYb/iQ6XDsx3z64oJVO/IHLbpMHAacdII8jJt4aw54lDFJAF50eBXIC0
	Dy/8yjFD54qdLlmt0XBh/vcxWobiI9X8usbdsdxgX0+bHDqgxKilOEh4brQG3E3MKbrAGYcRPGw
	dWcw=
X-Received: by 2002:a05:620a:1a1f:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ddfd8928mr305912285a.15.1750195691118;
        Tue, 17 Jun 2025 14:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+9JVqw+7sJ1yLr0TsiHGtmuvpSxCBi5IsiQMqBr6H0uMPOHWLaMsMFaud7fwVkOu69cbpXA==
X-Received: by 2002:a05:620a:1a1f:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ddfd8928mr305910085a.15.1750195690728;
        Tue, 17 Jun 2025 14:28:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf9d8e1026sm788094766b.74.2025.06.17.14.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:28:10 -0700 (PDT)
Message-ID: <b8f5c24b-d9f2-4a3f-9dda-183dff203003@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 23:28:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Don't leave BCR asserted
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com>
 <20250606001139.jaods5yefjccqni2@synopsys.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250606001139.jaods5yefjccqni2@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SJe5deVuwDn3XB9931CaNfvHxQ1FnBFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE3MiBTYWx0ZWRfX3HEaZhtrcLV1
 QGg/FuRi/r0wrChUt21mJpS9IGrrRPPgkFIE/tlpko/nmUPMVpc/gb4kZU/LsffLMC/B6JeiEv3
 KX2y4wbvqFQSAKxzI4YAiEBRcZ+3eWsVBf7RcJSXPipI4U8VwJjHgMAjMm6OFgpk7kIA6plDzY/
 XxPxOP0UxT+GVU1zWwpP+C5sz7YLs2pX/q5BkXys14Lko0SnW9geOKdcN+DxFOxp2MbIptnluy/
 1oQo0DXCfR7HMBpBu088A6xkaEFCRJqxjkQceTrrnhbwzkx2FpFnWwjRFT1xAI7IUeYl9OieknD
 QKTXijj68fE0R9+zDKE0sZJrnZ1+kd4gPGE6bhT/cNOXxwB9mVP93+qylsh5LQEgDOs/SARezgB
 N1znSP/KIjGBin9NLWlEnuiqYCs6rsHGZ2EABrtqd4ia688rjfO305pKrr+/c4Xq28pAQe89
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6851ddec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NlVYDTfvjE4WcsnVEWYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: SJe5deVuwDn3XB9931CaNfvHxQ1FnBFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=673
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170172

On 6/6/25 2:11 AM, Thinh Nguyen wrote:
> On Wed, Jun 04, 2025, Krishna Kurapati wrote:
>> Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
>> blocks any subsequent attempts of probing the device, e.g. after a probe
>> deferral, with the following showing in the log:
>>
>> [    1.332226] usb30_prim_gdsc status stuck at 'off'
>>
>> Leave the BCR deasserted when exiting the driver to avoid this issue.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Is this a fix? Does this need to be backported to stable?

yes and "might as well" - this file was re-made last cycle and this
patch won't apply without the recent 

e33ebb133a24 ("usb: dwc3: qcom: Use bulk clock API and devres")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
