Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0029D1F236B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672326; cv=none; b=se2JPS9k+jgjVjo0qzRDRF1TGhtGiwRSZEalOuvKOh7+PEs5xmeDWQl1MuYaZvXmTE6pgpfiphpYpjXCOxrXx/6MVrrMONs+Vt3xEy0hS2D8bW4ZPVU07oxOjgZP7jAoPKicNbjkTUf/vORqDCDtkYseVZZh40sEWrvT74lzrm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672326; c=relaxed/simple;
	bh=v+yXhd3n199Tq6scR0gIFmMZ0TbnnNTcY8LWNdx4FOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O98iXkTfzPGl/7PN63kFLSLfaTxuO4bRr8mi+xKvqlBO88N9gfpLl2mRXAcZYJlFnMSfWBApTu4a34BEScE/uwmruEZ9BjchDdr+P0/FE0vJMFTfR7Z2mV3+smixNKEi+LFudEcoJl9szuGwUkZPX+eSHwPaPV/NDoLEaBQGCIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBYJSVhe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBYJSVhe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53382oBO019895
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 09:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C0Vg33IwnJZ9MdiHdwgCrTwMljCHdTwbcvcaY9TkMxk=; b=oBYJSVheXTxlIFkm
	uDzfSi3C8uG0CcQjjrqJcMSA4rzvzwV5wFDubayEpXv9XA6axcbeD8Iq6WVX/L1u
	IKmemMEUS3BBurt/cBk4NgeUo1XtCkEO3vueT8NPQ3N0z7uTqk8YDfO3D182coQB
	vIZPCyPvj8Ulg62vT2/9AVsOPz3MsObndDLdENaarfPsF3DfpVxHCXPcI8gsKa8k
	hZ0lTc5wyDGpTzRzZp60v52jYX+mQ98/fnQQtSi9IUCVzW2aDJUcXwbSH1XiXN5e
	09jEqO9tSfpLFoQ1cV83h82+YtZw17DIHD4di7BGBOAHuxWQN0CjKx8rteHvCSsr
	mqA70Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a34ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:25:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54767e507so110072785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743672322; x=1744277122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0Vg33IwnJZ9MdiHdwgCrTwMljCHdTwbcvcaY9TkMxk=;
        b=U+8gddqTNyxW5S7yRmjpuwL3TzXa/U1xEIhIr3S1EZYoGsLzZrCycE53+NVqhjFnqb
         FXD0DAL5fTW11zRyEJEmn70YGZnEOjpYbWpH555jwzwFD7My9iYIppPpKX7Va72stfjP
         hXoceq3AUymXrf5sO5QKEpQsMhG3wwfmdC8ZACWgnaK7dtI2ydzZLggycdiZBSj3IjuN
         REYQmuPZ6f5V4+rFf/zP1UDzakSVIkBZxgklurOHDPJ+h1FXug5bS8alluc2fziRuOKf
         TXfqVq80TRS24IghVgeqLf2hb0mhy3pjwU5Chm7Vl1vs+5XrX1lKqBEWB38F6DsNK01z
         Naag==
X-Gm-Message-State: AOJu0YwKwX2dq7CzyfIX2QyGbmlJWKKx7MBasCbR2EGKZeYSvUElfNCL
	wblWH6eApWFevJAfNH0szzukIopbLoTN+EfHp/VvZHj3yNyXpZmC3i39oTHfeUjvQoeqd59tNaM
	pJXqssYgoWgG89ya7nmY22JbeHXeQnIzE87rYuVkKjDhtoDlZjCY8/bQIma9l3GJoByfvoio=
X-Gm-Gg: ASbGncunROuRf2qcEgO9btjbuzl3rPIU7yNAKfK3FBq5I2vTCCy4/xUzvSaPQkdeiWv
	FZp3S48ptoNr3vf1D1eD4CnUWuFkKjqDtp4zrw+4HoyZz9HWM6fkB0xTLZ7KEfd6mWEeBxbdFzY
	RV5qp/b72AxSLCmG37sBLVPkNWHuUh7+VKAHN0vclISgR9Dsam95jaPKVrtX9aapUnHmdal0Wdb
	TVbOXpJ8lSmQiZLPACnOJvUQI+Pf882IA1ZjnuUWVr6X1NxkPnfwGZgcZc+8sN6ZMyzss8+heMH
	hfXgJoiATRzeXRnQDlPiGPy7nyGnXsZ6e11t70Dfei9aAlEm1pTI7tcSlFKBjlVsQpYD
X-Received: by 2002:a05:620a:179f:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7c6865ea96dmr3052825085a.18.1743672321954;
        Thu, 03 Apr 2025 02:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhv1b18a2Pk4OgOo06j00H+IcS8+nfs5vIx/e4kAhfZyohrHQiRNxvA3q/yVZTwLT25KQnRw==
X-Received: by 2002:a05:620a:179f:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7c6865ea96dmr3052822485a.18.1743672321519;
        Thu, 03 Apr 2025 02:25:21 -0700 (PDT)
Received: from [10.151.160.223] (87-95-44-167.bb.dnainternet.fi. [87.95.44.167])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce93bsm1402841fa.103.2025.04.03.02.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:25:20 -0700 (PDT)
Message-ID: <b6e7abf3-b263-410a-8f4c-eb9a8e2efa2b@oss.qualcomm.com>
Date: Thu, 3 Apr 2025 12:25:19 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
 <2025040143-espionage-poison-2345@gregkh>
 <47a3a851-f737-4772-87c6-98613347435c@linaro.org>
 <2025040230-showoff-spray-ac83@gregkh>
 <283ac88b-c8d4-47c8-9ff7-935770eca566@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <283ac88b-c8d4-47c8-9ff7-935770eca566@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ee5403 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=CnknO/h8B0MWpypvlE+5Zw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=MYKY4rXoaqJdCg_V_F0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cH3tiXQG7rKCLaQoh4KZVNmt9_Okeklg
X-Proofpoint-GUID: cH3tiXQG7rKCLaQoh4KZVNmt9_Okeklg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_03,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030033

On 03/04/2025 12:18, Srinivas Kandagatla wrote:
> 
> 
> On 02/04/2025 12:31, Greg KH wrote:
>> On Wed, Apr 02, 2025 at 09:19:17AM +0100, Srinivas Kandagatla wrote:
>>> HI Greg,
>>>
>>> On 01/04/2025 20:18, Greg KH wrote:
>>>> On Sun, Mar 09, 2025 at 02:56:50PM +0000, 
>>>> srinivas.kandagatla@linaro.org wrote:
>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>>>
>>>>> Hi Greg,
>>>>>
>>>>> Here are few nvmem patches for 6.15, Could you queue
>>>>> these for 6.15.
>>>>>
>>>>> patche include
>>>>>     - updates to bindings to include MSM8960, X1E80100, MS8937,
>>>>>       IPQ5018
>>>>>     - add support to bit offsets for register strides exceeding
>>>>>       single byte
>>>>>     - add rockchip-otp variants.
>>>>>     - Few enhancements in qfprom and rochchip nvmem providers.
>>>>
>>>> Ok, I wanted to apply these, and tried to, but they fail horribly
>>>> because:
>>>>
>>>> Commit: 1b14625bd6d4 ("nvmem: qfprom: switch to 4-byte aligned reads")
>>>>     Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's 
>>>> raw_len")
>>>>     Has these problem(s):
>>>>         - Target SHA1 does not exist
>>>> Commit: a8a7c7e34093 ("nvmem: core: update raw_len if the bit 
>>>> reading is required")
>>>>     Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's 
>>>> raw_len")
>>>>     Has these problem(s):
>>>>         - Target SHA1 does not exist
>>>> Commit: d44f60348d8c ("nvmem: core: fix bit offsets of more than one 
>>>> byte")
>>>>     Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's 
>>>> raw_len")
>>>>     Has these problem(s):
>>>>         - Target SHA1 does not exist
>>>
>>> Looks some of your scripts or b4 is picking up older version v1 of the
>>> patchset
>>>
>>> None of the above patches have Fixes tags in the V2 patches that I 
>>> shared
>>> aswell as patches in linux-next.
>>
>> Yes, that looks odd, it looks like b4 pulled in the wrong series, yes.
>>
> 
> Even that looked incorrect, as the v1 series only had one patch("[PATCH 
> 12/14] nvmem: make the misaligned raw_len non-fatal") that had fixes 
> tag. Not sure how these 3 patches are tagged as fixes.
> 
>> But, that's even worse.  Those "fixes" are now not actually marked as
>> fixes of the previous patch.  So that information is totally lost, and
> 
> Its because this patch("PATCH 12/14] nvmem: make the misaligned raw_len 
> non-fatal") is taken as fixup patch and wrapped into the original patch 
> ("nvmem: core: verify cell's raw_len"), Also the sha will not be valid 
> for linus or char-misc tree.
> 
>> again, the first commit here, "nvmem: core: verify cell's raw_len" is
>> broken so much that it took 3 other changes to fix it, which implies
>> that bisection would cause problems if you hit it in the middle here.
>>
> 
> All the patches related to this are enhancements to nvmem core to allow 
> specifying bit offsets for nvmem cell that have 4 bytes strides.
> 
> Specially this check is also an additional check in core to make sure 
> that cell offsets are aligned to register strides.
> 
>> While fixing patches is great, and something we do in the tree all the
>> time, let's not purposefully break things and then fix them up in the
>> same exact patch series please.  That's just sloppy engineering.
>>
>> Please redo this series completely.  I can take the "new device support"
> 
> I can send them but its going to be exactly same series, I dont think 
> anything will change as all of these patches are enhancements and there 
> are no fixes.
> 
> I hope this clarifies a bit, Please let me know if you still want me to 
> resend this series, which is going to be exactly same.

I think Greg is asking to squash the fixup into the relevant patch.

> 
> --srini
>> patches at any time, and really, those should be marked with Cc: stable
>> to get backported, right?  The other ones are written as if they are
>> fixes, so again, I can take them any time, no need to wait for the -rc1
>> merge cycle.
>>
>> thanks,
>>
>> greg k-h


-- 
With best wishes
Dmitry
