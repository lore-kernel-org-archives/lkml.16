Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AE32F29
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546882; cv=none; b=YjoabOWQgX2LH0ineKN1q+Y/AxJU/ivPxUHZLiav14YPEuaLemwwbcQRLTNVwkLRkAewnW5HZAaLINCeM1GLrnATlsVL8OjnM4LBDGCjI+OPSbxlM4mXXgWRXNTGg+HJ/VvWixaY1LpQmH3/vSg44Y2RhsAQC5mmbFo7D8Ijy6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546882; c=relaxed/simple;
	bh=BYSgqPMWSqws0dE3RECbmqxtjHxktPw8T34WNBTAzO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/wu0dnZQclN7Mfz4CYeObEqkU8QEcexivHhPYidW2T6tQM2ErRyXKWR2UVlI0gKaH01cE+4eXNaV2thIUYwTlMV1Uw+gyq7qQ2SjGe1mvsowYX94KaC6m51g+4HWgimueRIzI3YPRkrgNP2G9OZ7fMCgc5NYvSsv0bP2lE1U2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hdD0oNuL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hdD0oNuL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5636GIc7007732
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 12:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+aS6ZTI1Pe+36r1Nb/3WOL9JZ9jQNaAFbIEsCvpPlk=; b=hdD0oNuLPyQbHKad
	+NvDp7dVxLQGLwkvTnL2MolY4D5Jy4R/IahhfhFsyWCNgJoYOvTcZKfaP8A+jD5x
	Y6HveFvbSMt0/hLooQyvcD/tAuxGkKhguO5hB9rDVWYIRZ2EuvS0UGi7Ma3FWp8P
	85wbcR9bvD5HB+TPn8zrrwMBlin4OJz1PyMUZES6Cr4SDmuYRbtGUWzBIQYFBiwA
	yrGdMJKpmoTuuFx8AwVcwKyFKTZyPkxBqOgdfC1er80CC5AkfekrB2tNue6BJ+4j
	sswuB7ulTGyL7Gy4Q5EyLBcLtoqx3HDA25MrK5XWFQNbN6FllqzgShnRORfiH95G
	obEmGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47napw2qf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 12:48:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3ba561898so101396585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546879; x=1752151679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+aS6ZTI1Pe+36r1Nb/3WOL9JZ9jQNaAFbIEsCvpPlk=;
        b=McnaVo5mDahqT8pqPnZPu5D5s8Y1XtVUzV2g4gZXCyAa/Wr8edo+DM+Wg0gGdgd8TE
         lX8H203D6joWFyXM7WbkudFdndZ0SNYiR3ohItYcjw4/FPJmj15ubkhCSUOZ8VyQ0fur
         kX7+7ZbthHVNjO7AutfECV+AoJIHKC7aktfUcIlWnTosEhTUmrmFFXdV8mmFFFcy/OlU
         Wnb+vk4/y5p+0g9DmXcYqvq+H8mBJQFotX14C9RsQ6Aglcr3CRTOH52jgGnxX8M91Ogw
         CCLUr/ffuDXm6vuMJFiMbfO0abrZpmv9XQthOJ8LTxuHR0Xhgc+vFzzih2ZeDW7hES3/
         plBw==
X-Forwarded-Encrypted: i=1; AJvYcCU5hPL33/jrl0ExEr8bqdLD2W/cf9Je0hIyz6ZFPXW7qissbYDsInjyFZdYbd1jUHp1cFeXk/GrJQuPw58=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhzG5W5vMUTMlyhhGjn19Ort02yEu+0fX4236Le+lfNpMjgHE6
	yC4I+ntWiIub1xcrlccowrJN8Iny3qsq6KfvSzFIEdrd4zN0geO5TBvNFf3TkQ5FKHDyfHblqqM
	pZYxy78Isdc2kWNis4xea/2Je8PEwEVXlHtTeUz8NK8kkq3ADjDxVMNz5VXmXlxkECkw=
X-Gm-Gg: ASbGncv5JxUBIwFaN8nbObxQUzvSto4DRhoL3VZk5c+VbxRBDju3HHXppilPIZbhxjM
	xw48IisEeyGb5V7wChUkt5+bF3j4gG5iiDFhzy0Qb9FfBj3nZyXwB4vn5J/gfQFaUVelGV1kcvL
	0ZCD3ZJabL1aWRePL/qtnh+VXTjHkTv+7Di4pJfrkYvT55rrij6Wn2WPcTuosGVfFGKhXysc4FM
	3oh7YRXS/deDHaBlcBkyT+Oxsh0R8xlfRBBbHfbQ0b7yjZlsp4F7tHtAyb8x46zAaB7rXvLNVpa
	4yuFGOPGZpJ1kYEaCZCFropLT7+awD5lMujCPibCc0ABdwa0AOU/M1ApM6qQJUARmn6HzK1eW/F
	Uh6A7YUPD
X-Received: by 2002:a05:620a:31a8:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7d5c4735193mr412014085a.8.1751546878995;
        Thu, 03 Jul 2025 05:47:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0/eK/DxumW8pE3KvS0NJ2lDX/WeN9meK7j1zTOfG3RdMslCa3fSmCPgMrEa9zMAGA9A5MhQ==
X-Received: by 2002:a05:620a:31a8:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7d5c4735193mr412012185a.8.1751546878497;
        Thu, 03 Jul 2025 05:47:58 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae362cbf19asm1158218266b.128.2025.07.03.05.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:47:57 -0700 (PDT)
Message-ID: <e6227bbe-3949-4bbb-b01c-9ac97abcd91b@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:47:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/3] arm64: dts: qcom: Add eMMC support for qcs8300
To: Sayali Lokhande <quic_sayalil@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc-owner@vger.kernel.org
References: <20250702085927.10370-1-quic_sayalil@quicinc.com>
 <20250702085927.10370-3-quic_sayalil@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702085927.10370-3-quic_sayalil@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIKmmPZb c=1 sm=1 tr=0 ts=68667c00 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=MtGlpxXrABCotuZjxh4A:9 a=QEXdDO2ut3YA:10 a=I8LdOwYyl7IA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwNCBTYWx0ZWRfX/Bb8+QD0aCAN
 l6OdqRyTiYlcMI+4f+zrOlY4NjKXS8J2PRiyYgBg/vIEqiDDHDR4kXOkFW0DMtUaQzZjMMXV89+
 L02o4T18Lx1KuU/6+8TMXtyThjc7VWFYAKJIqr2ZMouUK38vF9G0Qn2DpFYloBG/wcL8p5qP8FI
 GEmhJ0/uSWQWZf5qeRLJ99VXAGTY2wGfXsns4IS+SYfpCYQ/Pmr9BSh9n/CxQe4ZzNmypplBFrf
 1G86+H600xPG/0lTquVgpsoLdI0uzam+L2DBXXPvcTxLPVRgL78qIDcTjrDESayjqUVwZXDmXWC
 eVsQDyWLuOWNNf68NhpfRgBxh5HhTEGvpMAHUm9sSs55wlsJjznrelsqM+FRRU/GJgJ+jnQVsJI
 Ah7HiofYp03NwLww2HRaugbpP3XUgv0fIDIqenFHYZry6m3MwdhbXyt4jtvJtdYoNdEBhvCf
X-Proofpoint-GUID: E0t90-tBakFxAZ3jERIi35vspo1eVIq8
X-Proofpoint-ORIG-GUID: E0t90-tBakFxAZ3jERIi35vspo1eVIq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=750 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030104



On 02-Jul-25 10:59, Sayali Lokhande wrote:
> Add eMMC support for qcs8300 board.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
