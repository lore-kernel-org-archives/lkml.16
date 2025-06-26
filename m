Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C4B2CCC0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955901; cv=none; b=rXTs41V+MwVNfExOuRfome01fA5BeE/BnzDfSdqFL/PRr5xgE5/0vm2DjdcuOW7/2xDY3rvi8S495ha8o7Ta4NMWKkunWJXLYN/nFdBqc38U3bVPkSzxdrsULsmjkvOqDnwH3DxngTconj6rwyd6ovuXONxj7LtQ9+PyL5BTaWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955901; c=relaxed/simple;
	bh=otmGiPyRcsaRheCI210PDw5jFdN/YH8ewWhEyPAqHN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWxm5i5rGjjRWMpp6i3kqpnTWLoEZ0A9TAJPkPRzLMchR554qhOjew6+vKeuoAESxN6Z7Ve73R6ueZTi6ryNAB0ZN6vOAEll7pwjKbJWO0OeNoqlaS9hGsbZ4iEkHYZJVb1BEHSiYOK8BNZB6CRNPMwS9mzljj20QFPoOL0qwjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxtsjcMA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxtsjcMA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9nIa4019071
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ds5OIBbeNrEMt6KG9DFB3gNzCj+lz0ilvqEPiQA344=; b=CxtsjcMAZ006oS80
	533AEL//NhGDYWiQFz+DwVSvXZ2NRcM4DbBX5KhjKD8atNKwTTw/88uDrqkrDQFq
	CSRyzMfeiYRKQfJzhEGgqxPR3XJDACPMaXdCN/dAQ2Ofj4WWwJCD8P49lM2vyaNp
	wH87FM3YdqpNDe+dn4ZlVIqLygRGdcRT57qzEC8OKaj1wBtuyYrsLLm2KEIPFjMQ
	h8yOP72lw3VXNpDGYMhKhje0essOJkkLSqw/WP5D/rfM6fGARwnhJuyE/4wsAuAJ
	DXIqfMHytujXUYPNbEmFOSdt8zKS6VGnUwBr49i3LelR7qQCkcLek7gz7zqSjSQR
	ISeGFQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26ec4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:38:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-237e6963f70so17105875ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750955898; x=1751560698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ds5OIBbeNrEMt6KG9DFB3gNzCj+lz0ilvqEPiQA344=;
        b=Bmqg8GoS6nZZWh9mfuhhJOBigh6mvuqs1cKXzSpDgyI/qzd0YX2H0I+ijUIaOgvz91
         2klcQg1oK0bp1wMHPF8v8Qdv8DWmC2Og2Gq5vvmUQpJ/ZT9MuMJVojtPc9BWIaUSbDAl
         uoIcKPmj6TXbsgB2CcUSvTZwXiDdUmbDxkZezOwPxkiH9udDraSdcp2lT/atgbdqGecJ
         SD1J8P60PiKSKt0LBt96mkDWoA+xvtPJTenVKbDPLWoyNk3+2kAj1Bn/yGjc2nKzCIGZ
         BFfnQi/94vtaogkwp8xiO6NyY+AbYluo2dFMYLlosR2Qd7xkj8kIrqQPZJruB5+HjBpt
         yuzg==
X-Forwarded-Encrypted: i=1; AJvYcCUZC8TrO9obdGnur/J0Gizpl7/w5AG7UaZSb3xyt2fyrrNW1U8IMeHILKjw3m3WmRT3KToloI7/tlO/KGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCJMOWM5eegu9Hk1y9WzqNHY4iAI9PDxcrbhMIY4pkIH9XOZR1
	2HQNJCPBzski1E2ChqboDYZwyugwEC3q2wV5MJXLsYDxBCbHWhh/iXgb7J9gWKBU43TQ8Yi34tv
	ap46XK5hUdUN2MxKg5ki8mFu4pvI3HL4yrN2AJj5dSyfkJ6F607hR/GYy9eO+ksSvluA=
X-Gm-Gg: ASbGncsgjKmDSeTVmhofndhrjQXPd3AS6wTSUtYxO4azUDB7vcKgY5s07dJLL9rs1M7
	uCTqWPtOkERP3OLeytTDD5srOr7IVghFy5+0dhI7dZ3PTj/T4JVRQV9egToEQpchXRzEK0dVgYM
	xxUh6Sk1la1WxtDU9xZUrNAhL6htl110/NwQAPPPRdqmqDV7YZ9pl/vW8S+K7l2DOeypx6gTwCk
	rgTzB9WIizniFO0Fxb6wZge6zmYiN/NCRYCk/wXvAtHNb1atFxAcLc3BscH8ulGEYphliFNQbLL
	xwmxtSoWQFZ77f6LGNxs478hIA9V4e+j8Zfe+i4c8Srw6oSgJ/MSXCnA+K49EYFkPNt6rwI=
X-Received: by 2002:a17:903:2985:b0:224:24d3:6103 with SMTP id d9443c01a7336-23abe462f3bmr5850485ad.35.1750955897887;
        Thu, 26 Jun 2025 09:38:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHTg5bU2RCynjfPOJov4HiYgc9/oR7gcvFmbmqvfPAlowElQPIS12aIx/PZTAcUpaQOcITUA==
X-Received: by 2002:a17:903:2985:b0:224:24d3:6103 with SMTP id d9443c01a7336-23abe462f3bmr5850115ad.35.1750955897475;
        Thu, 26 Jun 2025 09:38:17 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.255.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe3daf4csm2003995ad.112.2025.06.26.09.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 09:38:17 -0700 (PDT)
Message-ID: <8625ddf5-d362-cffa-efd0-0ada8e547700@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 22:08:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH][next] wifi: ath11k: Make read-only const array svc_id
 static const
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619082010.1834109-1-colin.i.king@gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250619082010.1834109-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE0MSBTYWx0ZWRfX/EsTw24Cpf5i
 LJdWyU8Jdulv/fXUir5S+y39V64dXUu+gaZ8w3k5x7WuUL72snBfQIeOFQ3OxC6F2QZzopL/cd6
 kp959giCy9wf6lTmyGTIu5urll50eePThvpSFwInde4sqTf0rHwgXhM23tkMETAXRDjxhwfXMwM
 KDHC8DDCoAt4L7rBfOs4S1lpwJ7qBd1LPCca7xxl4jTEuP1/fdWNwerXMIoovBQhYQ92ubXxITs
 E5PDWs4xWyR5RkUara+Sm9HVSTWkJPN4ve501mQDJ0IEVb8n7VbLyn7EQyT6pkBLFkofVFypRri
 GTtLfCrq9ZA0TfCXhhyeoMEhIegjm8WfgRskfljX+JEtclulxLHkdV5XnvkDHuVMiyTkZMboKyd
 +8NdVjuGugpiITsCIrNgxgZ/NS8EqTIMS4r8AMMgjzo2+5uMEnAoCInIJHB/CDeVAHnSm7mQ
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685d777a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=/xG1ZwzdjF5UbGEDupzz2A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=8b412UgErZc1wa3ZSjAA:9 a=QEXdDO2ut3YA:10 a=LXDWoPVop_EA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: RtrzpZmGs1XJQSC8xcXBOqWQzMhxnDWm
X-Proofpoint-ORIG-GUID: RtrzpZmGs1XJQSC8xcXBOqWQzMhxnDWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=802 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260141



On 6/19/2025 1:50 PM, Colin Ian King wrote:
> Don't populate the read-only array svc_id on the stack at run time,
> instead make it static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
