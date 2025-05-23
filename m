Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8C28EC
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024028; cv=none; b=mdu+0yUiXnD245//IPS+Db80E11a5KoQg0VmJ6hwLeu3rVXg63Dcj+66XCS7VGrUkUJeU75vxENKYnZpI8P2JjqQeAd2UjtOQ+xYE5s8QpaYlXPGhiiagyy0ZfYkGGD7DvFrnquZFMuLVI6lg9iVgCwjSkMhCvKEUBabpHTUO30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024028; c=relaxed/simple;
	bh=4Paog+YoKvP2+bQwGVWBOgtwOdz6A7hOVN1mgB+zfiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sliqrm4+8/+yfduIVd26+6BapZl2yxtGW6YGppLIXJsEE/bZgxmsZHYxWEZK558st3fUegucjVINeghv/qOpMe7mEwzgTUNeSChPEXBpXpGH65CZ1T0vwB3AUjIRHEb6d664vjW+WDNDjj+2yzRgvnWCr+uHFEGhgqaXUTUWzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMUOR2y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMUOR2y9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBjZiZ020943
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GxYGuWGE7teroSpXw9B8EXIpMo9GtkoYzPs+37tNI9I=; b=IMUOR2y9gMKhgXS6
	SlruDTVk9FfgokmM6AAGRhYO7FkmpGIDOKOiJCs1/cfuFrQ7b946pDPP1GbpxTzO
	nLA85WYwUlwJwWBEbHtqG5Lzb9ifzAb//7jYmi7nA60HXuUqUytc7BhcIs+/K8Xl
	a4VLjimqZiwNFY+okLh4oStNNtbzAkzRwfJjN8hiKH9F+iyQfQnMQP6AchO8qls6
	mUQQxlDc7iGaGEW+YGkz1WMW7FAiqagH1Or0WXhHkYeIq2k1P73o1qDmDmMpX6lW
	HMKT8Z4PX4mv77UMXNKMssUUkNEihsvrs1Ok1khkPX9ujeQMk53pZc9aCmDpobva
	T4P8Ng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0b195-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:13:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fa9136c2f2so226596d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024019; x=1748628819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxYGuWGE7teroSpXw9B8EXIpMo9GtkoYzPs+37tNI9I=;
        b=LWZ89enh3po1qGKiuHAVhwce00gwExvBBvOk7nZZgqCnqgroXwZOl+AbR+DS+OA+Ao
         p1ekqQKnPBXG20JbNfZfQONGXUD/ask+7slVBVEAqDog0EyLBk7rPnfm+TM8SkT49gFo
         er/v1i1aH7yPrTh/u87onjVjeYsUMsmOEqTCay2FP3CdxCO7m2f2K5oU+VpNIhosZdQd
         MbmKlpCEzX5l6ZQhW03oXSM1jAJJc5MomoCvcKdbu21LaSHgCd8/a0+TlpKpujDmk3sk
         kaPyvYmGT/4Z1Q89uXR9evuhmVbIAjzJRCkilqt4YffLEUiKm0GDEEsMsWQl2VMHdqxZ
         ze2g==
X-Forwarded-Encrypted: i=1; AJvYcCXl41HIJZ8C3r5Mb/H5ZfQ4x6TwhA1/E+8VwTxXYWwVYQg+epkX29jbfEA78NqOy5RTRh9EPx0F6USHWsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1jjAM77LMGaxfLeY3u5PvtxKorvc7epOr3JylDw/e4hdAmo3Q
	X85qBwPIURb4pBZpkUJbEs2drytOqY3sQ4MDydgg6GiTFvMCX34kmxVnznPWGOHixWyk09+qBnk
	XcHRrwqKzPaSYb7g80uFZtskWg05l1d+PzyaCRFyX/nBwqmbhd2r6H9bwrB1CSc+zxOk=
X-Gm-Gg: ASbGncsWiIoYn8IxvaBIZO613JIcEWfS5UrSVlt7gDyId6ZhXYqZaD1zqn+oL2TdkOd
	C2wXIjzQarQ9RWtyto/f9wsE6q40Ap8cqQgrfjxQR3CfJ/1fh76Qwu+nVhOvni/UI+TqxhHPRZi
	nKzfLLvxJgVMx7FIaczRQPJiBY/yMRcXtqnzVS7hRETkirMBP5XQvsmShsqTJwAabhOKFghvGKK
	VPXn20ZVXb3jf9vFB0CVGADzDS7DE+xt+sB92BvaZePJPdJv2VOBwLtCc8l+Trit00v4SkQ2Bh1
	XSiKp9jlCDA7d72vKU3O/T4MYdNzjFBVqhbnU+mssWdiFnKGAeQSIn4L8JyBQhHMxw==
X-Received: by 2002:a05:6214:5192:b0:6f8:e1d8:fa9c with SMTP id 6a1803df08f44-6fa9d2a6a1amr2331746d6.9.1748024019494;
        Fri, 23 May 2025 11:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv7GPWwXXj2LlrS9GHOVViHjRzQLINpDyj6uWz8zl7Oz/ZeHI6Gl4oFnbSRXMtGdcwoHLU9g==
X-Received: by 2002:a05:6214:5192:b0:6f8:e1d8:fa9c with SMTP id 6a1803df08f44-6fa9d2a6a1amr2331556d6.9.1748024019160;
        Fri, 23 May 2025 11:13:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602c2080534sm391575a12.63.2025.05.23.11.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:13:38 -0700 (PDT)
Message-ID: <81093c19-a6f7-4653-9688-ca891fd2548b@oss.qualcomm.com>
Date: Fri, 23 May 2025 20:13:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: sram: qcom,imem: Allow modem-tables
To: Alex Elder <elder@ieee.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
 <20250523-topic-ipa_imem-v1-1-b5d536291c7f@oss.qualcomm.com>
 <7707b574-6fcf-487d-909a-d24874f9d686@ieee.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7707b574-6fcf-487d-909a-d24874f9d686@ieee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7g2w-lPYSKM5Rrt935B8K5atseiCXjBZ
X-Proofpoint-ORIG-GUID: 7g2w-lPYSKM5Rrt935B8K5atseiCXjBZ
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=6830bad9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JUd7tuONK7MPmK3lb4kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NiBTYWx0ZWRfX0jC12b62bPXI
 YXx20IRBpaKb73ZtCyqGYp9YjzIkqgbftPPDB5HFKO129KbSNUzyTUR9x85z1E4fa1VNoglG9DP
 wwh2GrV5CKY926uDWas7PCt0rBTgKc74eyq767X+wVhyDFCIBre2f5vpDDORm+E33+zBBea8Jas
 QS24wqmYBooJQf1G8M+lb+I5thGS8PIi4ibzi0KNhoQRNy91VMj7snJv4l+K/vL0M2+DjBlZRqX
 /Du9k92tEb+9OMxeANq4LEmuxK+/1A1XblbvP1GXFivKKXVSKun+NOxw6P/pY6JK3WX25RfzKJy
 9gLzw5SLfluV7PvecOt51k+2cRwfOF6Zw2HPSyxx1Fv1XRQPA9Ib3ss5pNxC6JhO0Wxe1SjkIR3
 coIZb3q0JPtkU2lLfCotSAJh69UkQxhcs4eX1qDGq8oQROyMi+LE//wJJ5/I1CPzYt5QHV+a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=939 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230166

On 5/23/25 7:59 PM, Alex Elder wrote:
> On 5/22/25 6:08 PM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The IP Accelerator hardware/firmware owns a sizeable region within the
>> IMEM, ominously named 'modem-tables', presumably having to do with some
>> internal IPA-modem specifics.
>>
>> It's not actually accessed by the OS, although we have to IOMMU-map it
>> with the IPA device, so that presumably the firmware can act upon it.
>>
>> Allow it as a subnode of IMEM.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> So this will just show up as a subnode of an sram@... node,
> the way "qcom,pil-reloc-info" does.  This is great.
> 
> Is it called "modem-tables" in internal documentation?  Or
> did you choose this ominous name?

Downstream. It's hard to find accurate information on this.

Konrad
