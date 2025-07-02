Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C622FF49F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477125; cv=none; b=DaEhW0G8DDxEK04qiF6NCFit0DUDoM1W0JiL1FKJrf4NvWw97ivBSjCYaqp6Z7JkoRxaEaANe7OfKSAoXTm5HZhgTfTN9XxXtanJKlZ2FyghBYTPC7S3nvOHV0hXY3yjZbEYFfkik/7AcmQGiOUZUHiY2yWGoFl0tRK6q4AJ9QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477125; c=relaxed/simple;
	bh=WZyYTlWdSGjfbQpzDv1VK2XsfyDqeUoKt+82ACxQjtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDhrUvOZOv8AkNQcWt1DBaXhsrZIUZ7Zu5Oyv9WZCqLVQvlbGc2a+0gDsyMie7prqhqSWNA+MYXITGpqdtd7/dpkwjCU+gPAC0H4R8XWlisq5zgup764ECqmuY1HA9DqZoW7BQNHOM8pTSApmE+/yUVz5iuJ6DeE7U9jLe0Mp8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QI7URzgI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QI7URzgI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562E6QpQ025364
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 17:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZyYTlWdSGjfbQpzDv1VK2XsfyDqeUoKt+82ACxQjtA=; b=QI7URzgIoK97WDeU
	W7XfEdAkMALd2S9JLF7oFTq42JWw60Uf4B7wVXDym1R04OBPUAMbW69dS+/XPfFW
	ymM0Pe6IVAethNd43a2dPwLwJEAQIY0MRZyvMgfhwLnAKRsn7OaJcq+VI9fKWGgX
	6zANcbxt51nX1fS32u1P0Ej3xEXbVn1rJbKtEYtCTu3/HvsKjXJF8T8TZrYUehUa
	jaJ0w6/QcNm1fAe9gGJjnL1MLFehJlGVbzBtLd5/V1eIEnsoaL7l3cAVvT/U+T+b
	05e6ySKYb4RO1/vHqevrVNWv6rrbeqemzKR6ZVlflSFhrNcL/5Ck4bQpBGL1KxTv
	o+cwug==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64tmpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 17:25:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748e4637739so46752b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477111; x=1752081911;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZyYTlWdSGjfbQpzDv1VK2XsfyDqeUoKt+82ACxQjtA=;
        b=w/Nwz1D6VBBFlbtela7PIoyFh4OkWXmx3zdZ0e/JOTkAXjJpLhPoHd/4MT3x2cy0YU
         duMRWdUBr8RBfAehO0ufhFgANlRf8ePuDxxMwb8vI84pslJScWuW8RD4/Dmyteb8BTvP
         Gy0NiDsihM0d5oX/ki1AGvTuv9hey0LAh9UCEz582amyzogPmgpRHScvu+QAra/rP21c
         yzumEKvXYLy3tgezFWER6FZavXfhympGN/c/z5+aL0WHFr4mfRMndJBEfPEYFbpKuS0Q
         z5LBN2lrQ952A3e3bORQzWA+yTI3mp4QgOYb0yI3oU0AiNIqQFP1j/89AN+rrvrX7i0O
         sQWg==
X-Forwarded-Encrypted: i=1; AJvYcCWvxjTIVzQnbEEDIpY89eXk7o8XrSGScaV0rXI09lswxDGdstkx6I2nD8T0fjEsDWPDcZdkDHeqy4/RsYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGH+XIwieHqlg8J4D71DwjzhYNMWBLb1J+KJw3DHWCt1NvcL3d
	AomuTmLmW55CzykUigcOkOYzEQOQjSJ7jfaqpeDC7LgSzXP09rbvNxGf4b0l12cQMga/JbuGGHP
	orGVtFzgAefPmL3MR2Nebg+v2JP7nTVIcFlcO48V2WpldAq4TkgMRkCVYKD1k+l3VM2Q=
X-Gm-Gg: ASbGnctkQLJ9+BA97cTL6EF9nlgL+Wg0Nd7LK1jOUTzrQPebqvjrJ8vy0yfLhV6IC7G
	CQNQ1ORQh30sGx+Oyo68yiyYkhv6qwucsJBT0+ILbxiClHUjd5ToBmd3uRiQrXO+WLWrDdu8arv
	FLp3Rk7CZO/LkZNh6pz+KfPVPb6PyTIAXWWhHQbTxNTUA3xyRgJEb9DcaerFEnFfJ86OOQvq9dn
	XZDgrP3H2gubXYOaau2B48TVE7tyZfvx/am7kmybHp9ZZUTwnjCGREHCYNB//V/u5BhCKgyIqLw
	sELKNOyk1QUmuyhI4jTW0z5/B1lYlhTwVhu8+5G6CFkSqYMopvqRdYSbcIwt5yVBlSpvAFLrp0l
	O51aYj2p2fsrxc5I=
X-Received: by 2002:a05:6a00:1488:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-74c998b115bmr395824b3a.11.1751477110640;
        Wed, 02 Jul 2025 10:25:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNL+mjpubj8oTFu+kPvG+vg07PpxKV0Dl1sFm81HYHH53fukGuY5jdbk7k4o7/GpFwTLHvZg==
X-Received: by 2002:a05:6a00:1488:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-74c998b115bmr395756b3a.11.1751477109849;
        Wed, 02 Jul 2025 10:25:09 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74b548a1fbbsm2105715b3a.81.2025.07.02.10.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 10:25:09 -0700 (PDT)
Message-ID: <e38dc5db-7c7b-413d-9ef8-8dfae7feeb2e@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 10:25:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
 <855ae20a-3675-4cce-b87d-6f25fb69e0a8@oss.qualcomm.com>
 <defad9df-e248-48d2-a3b6-3f057c6f0b76@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <defad9df-e248-48d2-a3b6-3f057c6f0b76@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68656b83 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=7FD9jUKyMsHjXuVnl2EA:9
 a=QEXdDO2ut3YA:10 a=Sn0URPYyO7IA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE0MyBTYWx0ZWRfXzQO+v8zUcQH/
 mEaBZLtfvm2NRg9sFZHEW7sBrRPyKBPKVkuIfZ97/037y0xaxxlDYVQuduHPTC8M8g+W7B3pQuJ
 8LiDryyBJUEcGmPwalyoMzk6tp5OYwZtxSXVg8qQkvvcAI4cDJLVKk3H/sinpXgZI40Fd4IcXj0
 TFy0NfofE+6XOOpScHMJMPyfEJpQmCj43yHMGlXd1003fOu8CiypvEg+UJE/JcF8WlyE057MgHg
 TKgwZbO9ZjS48z9QiLRLjP4upsv7vsAlGjouD/CtcL9cb5vb9aansowATXSRi2XW21CzEuvCnaB
 iFE1pkqTxvQvUOYTLABQqJYFD5d1zkpWIVMqICTa87IKcVPC6jFQnv5XFNBzd1HiRn0pYzhV1OT
 q+wTebmypeQrhqd/eIVXgrT6ehQq1fC6V9NizpETR73sN3IURG8vbrXG8WVTMP0LVKLffoNe
X-Proofpoint-GUID: 88Ral23-gn-ufSdaVsVikJmk96uu6wXl
X-Proofpoint-ORIG-GUID: 88Ral23-gn-ufSdaVsVikJmk96uu6wXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=775
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020143

On 7/2/2025 8:28 AM, Muhammad Usama Anjum wrote:
> On 7/1/25 7:49 PM, Jeff Johnson wrote:
>> On 6/30/2025 12:43 AM, Muhammad Usama Anjum wrote:
>>> the same memory allocated from dma when there is high memory pressure.
>>>
>>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>
>> not quite the right format since it is missing hw version and bus
> I've been using the same tag from last accepted patches. How to construct the
> correct patch?

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/submittingpatches.html#tested-on-tag

