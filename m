Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1C325B698
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210131; cv=none; b=nhlZiGXZDmoZQhoKq3ih1cd/UoyXIsIPjCRoxzWeVJah9WLPuSdrOZBW9A935lZTP1aO/Mf+lqL2+tz7GEsHgRtHwwnb//z3VCf7PKwTHps/W5enF8tzUF5udpeIfBkjFEgJYC6Sgbyl2Lpr0XMIaUYXyK72v1MDNytAeW74shk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210131; c=relaxed/simple;
	bh=Xtuj3LhBpTfDYY7N35r6nKZxVkwtKPfhFYvYKZx69zU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vx8Y7r/Oex1n+0lC6UqOJTGSL7Z0ukDNgxq3nozMwTmTFncCZINwzs1K/Q5ysNfeQ4bQTEO9kVjW35i0nScqKbtvVLvGmH96qHXvPHlQijD5yE2kzIR8d8hljFRhEZ/kyWf9mxJeUwgiH+6Q6mqM0vLflFR5kpceY3nJNosPadk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EW8jg51k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EW8jg51k"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9lLef004958
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwmP+K49vLFoWTm1+BQsLhgb4jcUsR7Wv1P0YiFY6zM=; b=EW8jg51kZCQm/06f
	g2LBdx7NdR7L7OV1GKmHFyEag4o2a0uTgf4ctuAWkB47fMZEtA9kJI/4iI9aRy28
	fiX45OqVlyeDrMWjGWtc43Z8u8+NxQddZ0iFWHoR1eV1POutocxhPg6Mg1/CpXYf
	HG1i8FtCaNhNG+KC8OROw3p7hxCC+Tc2BWtET/eHjXN/0y8G3R57xzDRuVD+ZAws
	ppvne2fkf+nitpFVGmQCePEs1oU5gWWOYy6uGBqPRRteh1M4hvE+WZ/E4/hkTZhf
	WdpOUudWlj4vGmU/qIh2/6N8HSytIBzaFDLLE2G3M/9yVX4fSNuLPtwzVxtJv9VB
	j/1TVg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxn7nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:55:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e444e99f26so4606896d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210115; x=1739814915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwmP+K49vLFoWTm1+BQsLhgb4jcUsR7Wv1P0YiFY6zM=;
        b=HgR23cR/a68Wi7CJo6kmPVKrzpuq+vkLTJZ1mbNE92YAuof9ir2BYgZ/21npWDjeoN
         rpd7fqRtTTx+uSONFkWrdcIcf0/mfWTDPud4hTsoBTqTJ7cbKXhoplKkQACuobzPLFQB
         1wNIdST1pREFsmGNecX5MQbnQTsm5V10d/o1Fy0InZGK4L1ISkaQd3CPBmfeZ4Is9qXT
         PBn0wcJ3wo8XdelpNxO0yxkqFsMjpxWyYfve6sDvVjXQ0rvwFYj5p84pFPm3/3IjAw2l
         ozbzSnoNyZNjuJyGmAYGqdwwWTylC2N4ewREvJx19fsByja0g4wtf30Yb/oor5zjTqyC
         iabg==
X-Forwarded-Encrypted: i=1; AJvYcCXvR4YkW72ErJyzXz7/Q9uZwvss2M6LbAo+WhPeMOIHU7uaSb81QmbNhCBfehey0xrywLwW6g/2ZCPBd2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPcAe8PXKGcpYxkKzb4xDUnSfLQ7Io7Hmt+R/iN7bEMlQPYyQ4
	N5Qq9O0iOSkXeRu2NYX6SmJgpI7kXz7g+y1eEAlqWn+AXGDUqOUc8QhsNzXEwBeyaVLUTfRlM4V
	IWDSP1nsBTvZa5Ce1OC3SiqjYz6bjkefJTTrOzldRasozDa1b1CqKPFB2aQq1zsk=
X-Gm-Gg: ASbGncuntJPh3pp4uikrDQmMcSqJtT1iXnDTPRK7mOQe6bcgiADhGc55EQIPLgfz1yR
	EnkvjLSipYb9mq/Ny6hBXuXeKXM+6KXQG24W5f7a8pLfY3rtSHRLTuZNur8/6dYpc5ffiT+8kaY
	m438CeJi17HBdOGoPHTxHGyyMk17AL+2r4MAB/Cbo/PlSJ5D4JcD9lumvKrL5xicI8Ol/tF6BDS
	6rNwWBD3DPEEaeaBARxQNC4gyjcGtgvp0rHSJnT3Lt9LmmEpBOV0LoZ4KNoL68+dh0pgvRZZJAa
	yiFLws5yxpP+xolwBM5CMyASIE4c7SrrQYfTV/pFxtUgPn+uzfkoYn7YQcE=
X-Received: by 2002:a05:6214:57c1:b0:6e4:45ab:4de8 with SMTP id 6a1803df08f44-6e445ab4e5amr71563616d6.6.1739210115226;
        Mon, 10 Feb 2025 09:55:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcQI77AtK3XAfbwGcc1HufxPK/2pOXxHvbUx2968NuCHJKTTrF1581V6eIEUMTwI2i68TdlQ==
X-Received: by 2002:a05:6214:57c1:b0:6e4:45ab:4de8 with SMTP id 6a1803df08f44-6e445ab4e5amr71563496d6.6.1739210114868;
        Mon, 10 Feb 2025 09:55:14 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b12d5f49sm415599866b.73.2025.02.10.09.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:55:14 -0800 (PST)
Message-ID: <8d23002b-64af-47a8-8b41-e533e3c13223@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 18:55:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add 'global' IRQ for PCIe
 controllers
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org
References: <20250209153940.3489-1-manivannan.sadhasivam@linaro.org>
 <173920411963.477096.6458317590653327676.robh@kernel.org>
 <20250210165802.tbvzx4qjygzdsk2f@thinkpad>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210165802.tbvzx4qjygzdsk2f@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nJIS57a41AphEao0nJwBdfmz-s2NXM9v
X-Proofpoint-ORIG-GUID: nJIS57a41AphEao0nJwBdfmz-s2NXM9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=817 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100146

On 10.02.2025 5:58 PM, Manivannan Sadhasivam wrote:
> On Mon, Feb 10, 2025 at 10:22:43AM -0600, Rob Herring (Arm) wrote:
>>
>> On Sun, 09 Feb 2025 21:09:40 +0530, Manivannan Sadhasivam wrote:
>>> 'global' IRQ is used to receive vendor specific events from the PCIe
>>> controller.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 10 ++++++----
>>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>
>>
>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
>>
> 
> Ah. I didn't run dtbs check. Please ignore this one, I'll post along with
> bindings change.

I'd be grateful if you turned interrupt-names into a vertical list in the
next resend

Konrad
