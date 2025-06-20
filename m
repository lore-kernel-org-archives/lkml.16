Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F029C1F03C7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438519; cv=none; b=VUEG7ahleds5VCqAdq3lTeAK2WFSdldqAN9hzOeMyEwe2ojAORZWN53z6pWL6DBbgkbEwrNiUlNhedQG4pSwXQlHOFYNVJsOBjWa+pHPUTmbDkaMFcM4lDJC25Hlv6qMhmTifhHjPuRkChD0+wbAUjZHdC6XZ5Cp8usPhrk/XOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438519; c=relaxed/simple;
	bh=2PjTMHy5F3iPIngcSswDszD1rmfKQu+pVIhzm5QlxFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLuEYXogVnX05+PrXLquw8jttjsKx5GLym+Q54lPUluH+6r85T2q1bCkoJ5WYJmEQkHGcz7t3o6EBtwdkqJcD8KRrOlyWAgBgz7ZDaI1+yzb4qyzlfX+LcsHoyUxDgha5tF2oScn2iGlYZFZ4WtU4gbmlqkWamAwQegPE9gzekk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mL52/1Jg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mL52/1Jg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KD2KGW018588
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y2I2QseFJ0gr5gYIqnnWqNCwwaaSonPDD1prW4PD/A4=; b=mL52/1JgJoGggS/i
	4nE0Id8O6uM8LFH1ZMyXi7NeB3vdT6P8lbIFSEnmBwu3rzG4TnYW0rxA1xFxS3+W
	A/Tgk4sn8UFRyQIW5n1uqiNNwDDdajBTWa2ZlgRkISB42kKMQHJ5ABp1jctCXIGQ
	YCyslYKe/DLbQDQqKginB7+66PmR7fFYeEEYjqFvt2uuK+TectPsye++pn+Qq89H
	pREE28Mh/QbYDV6DvduAzzu2dEf1oMN8lpyGHtb1hAol/MKMhteC6rA0/WCCOLM/
	PbJJ4dGYl6lVD6j2NN6fzToXbDNkYYk9QsolwWP2uYfkXWPXr9N+QEwMRSxULpk8
	UAx32w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47d0pchy22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:55:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fadeceb4c9so4196486d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750438505; x=1751043305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2I2QseFJ0gr5gYIqnnWqNCwwaaSonPDD1prW4PD/A4=;
        b=KU8edNsh8x/DP8RPmBnDKxQWkkNRbCuvM/l0LY6Hp+bDZebrinIratceGZLYIbodMg
         nmx/EJIjyoIWQMg9RgKYhG7QvME4HYRF701WXnTIR5O+2t/sH8TWTIl2UJHOFJgEiuzw
         85P7fVVX65Rt66+hWb1lDNyr8Q/qlatmD0OGFwC0oxHqonXKi+jWNs5PtY+DLvm1HuFw
         YlKXW+8N2yaJb/RfRda5/KCMnb8WQtJKSUMhpGIgwIdaBXSK7Jlt8Z508qKuzF0WmqJw
         9/xYXN+XlXNZKHl3GKTb38zs9mBmVoVXc9BgwYJ1RNKKrWXsBHFpcYNN8XdgmRLzhtQb
         3MSA==
X-Forwarded-Encrypted: i=1; AJvYcCUzsw9RkYjjF7Rfo8t1eBIJFZRgPvrUtOXHUs+aSxtaJRDZK0HzNUYs1f8RPxMfxu5Tilo0CoS83fz3A1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH+v65e25psh2pNMsz/n/epOmxMo+Kc0IU3DVzsJv/3kNvcsLW
	dWz1CNACdCg40KnNx9/T4GeLZZanAyOQpW8kuA7i+xCzZcILsJCS12y2IHrRINivEQYmqeMJSBo
	YWZNqqRli9SPzZZUhcIxuwMK4lUJUc12SBDdY/JjAAjx44h8beCbR1CRaHFVhoUlDG6M=
X-Gm-Gg: ASbGncuiD5PStgWLzBvBG+2NGKH1j7q7EhGtMlKiGDz9pT+lKZlIPJfdKZoFY6Cx2XK
	gdTt4bakiwsw/8zrRUfPaL6fljyNLqTINLTSa3E1F94olEIk2eCPXCJASOqWEaXUAD8sL2fK963
	ybXqOpK9qJaSFUtrmdN/X5JPkMGD5hfJ+hGuLfferOU1oeEs2yFDnTxRuOAt/vTddkgc6aiZ1LM
	9M+qLxMj68ycbSd0LZo6DPHTV7DM2lhBs1ki1fUNEq2Sdy8JTj4IsZcrH047ibilYyljPuBTMht
	zsfJFTEupQgrQM9K66AvInd7zTLDxDSHY29CGYSHJmoSuZZX3SeUXxumbf+yhjTLPYsBnHKyy3S
	l90U=
X-Received: by 2002:a05:620a:1a84:b0:7c0:c42a:707d with SMTP id af79cd13be357-7d3f993a910mr185107085a.15.1750438505172;
        Fri, 20 Jun 2025 09:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzroywSyK0lLak+kmGhL7I4nUbTDl//l0+nE20iSxOE4K84JZ9jklmLuZwJGAH+b1r8H4Iyw==
X-Received: by 2002:a05:620a:1a84:b0:7c0:c42a:707d with SMTP id af79cd13be357-7d3f993a910mr185105185a.15.1750438504725;
        Fri, 20 Jun 2025 09:55:04 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a1857c124sm1603889a12.36.2025.06.20.09.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 09:55:01 -0700 (PDT)
Message-ID: <2864033f-5f1d-4026-9bed-6a79ca917701@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 18:54:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] power: supply: qcom_smbx: allow disabling charging
To: Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-hardening@vger.kernel.org
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-5-ac5dec51b6e1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250619-smb2-smb5-support-v1-5-ac5dec51b6e1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TDoJaWw6fUM6TJebgeDK1VgYheI4eJum
X-Authority-Analysis: v=2.4 cv=YKyfyQGx c=1 sm=1 tr=0 ts=68559275 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XZI00cIVyT1STSWTZ2QA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TDoJaWw6fUM6TJebgeDK1VgYheI4eJum
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExOSBTYWx0ZWRfX+R3dx5aqwJhd
 /Q6g00aqGjKHpBFi8QKGkLmq0SK37o9I95t+z7zSnLMKB7FQ5+CHb53g+QWm7iM1K7yZVmXok00
 3RyPlL1AJYWIHrLNT+4m4cS+4KEmIIZvc0s+nj1B//K/C5SzcXn0Za+CsI9fBbJfBPS5Y3MrD21
 PjQMRFgy50fRiTbBaC0tHxyIvzKDGhgSBFL8P4KkAz4q/AM8MOhHR4lhsH+tIkNqhmQx4bN7TIK
 N9I8QMCMkVkOqu6fTsa4I642Tttrz43oWSgdmtsUps5CQsXKd5ZBiHLcq7PuPZk/Qb39fCvFKNb
 AoVJ07OclTjcCpZYMWf3ZMoJZ+AyNeGV3R58FaGhdBJUt8tvGnxyq/7zaOCK82kegZeRMEYjb2h
 bItHIivw8BzUoSWLOnRAWy31u7cnYTwiPANRl+jZjA5GRA8jOUipnmPDfST61rUrlOlXkkXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=803 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200119

On 6/19/25 4:55 PM, Casey Connolly wrote:
> Hook up USBIN_CMD_IL so that writing "0" to the status register will
> disable charging, this is useful to let users limit charging
> automatically.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
