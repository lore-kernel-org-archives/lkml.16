Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F0D1E47C5
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746271247; cv=none; b=gdtmydIOqXtPaDdrvGeeYMfJ7OLoa4HPF+Cbl9hNZvbPUc/HN3P+REbHET5GL70w+BmgFWNYNE45IWxMhs240/QyDZUhgBEj8MV1g4e3k9XGcVX5XQv2aStOilONtBy8RrA0JPpRi6+z6z8FhuYN0WvknqFjB6wxIJZuS3Q5Raw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746271247; c=relaxed/simple;
	bh=ZZwm4+3kqdZaoUrJVAZp3I6AuMg2MOE7m9ADXt1bIrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhGSiGavA11SMG3aIB205ivl9/mO3BwkC/4pdIpGASNBSe0+ngUxugYaQZNz76PnPccLgq1OYBzIFzunWRaaZlbfIa1O1v7dNLZYAQF1DngdFvYlBU5QnpA4B/8OESBHmgh+QzrCRYBHUiI90qa3ottYSKHSkzHQWXCdo3uCmv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAFPu/kV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAFPu/kV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5438rWUQ028725
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 11:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZZwm4+3kqdZaoUrJVAZp3I6AuMg2MOE7m9ADXt1bIrY=; b=gAFPu/kVSF7z2zpw
	JsmfR/Fl+CYVrdezpvlE9Fu9Thwz3L0nnxqf/tRBEO/Ponq0O360EE6/9Eyn2msj
	aN5xZI/IJvtfIQKnoT9wC++Yqfxw6cbxJ8EIqvKRLZhA3OmQFtOIqUDx3POo2wHO
	5SRfa6/5SeaagKEdvoKuOpBK3MVqirzm4OA6waCPv6MOnRz+xM9jBzGr/Xd8LvTT
	BTfNHC/Fmxm0sNv4L9QIcovlumy6c3UbVcNy0/0Pa4yd02Ol5XV3o9SHOzyU0xnV
	tXDGEPFAYJfPtV3jIOUp/cJrx/ikbgPWrmIy10uFoO3TSiHDr0D7s7qwquKrsUpW
	Jlf3gw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc58gv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 11:20:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8fd4ef023so6873086d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 04:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271243; x=1746876043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZwm4+3kqdZaoUrJVAZp3I6AuMg2MOE7m9ADXt1bIrY=;
        b=l8oemk5V+W97DA2kJfiXmSX5+JWEhMmYxyLuuQ49KQOsIVvBElE9SseruNwZVQ2fy1
         8C8sy8U/XROeGiGJgmYh3+jL1PBlJ7mEZe2Ocj8CXCUFV2dxfNdiDmvxjfmjZ1R+HNsB
         Arvjg8HnJWRptrfsGN0xVwPn228laDmkaLilnBtxtSKJB6k2x4jcfV/NBDMzwdzxoB2J
         8IeJKTHFsf7sTr2pGY89RJb4cVktl1eIN7YmFmKUFSM6LAYRUhtLOVnxeF+DwxRe0fsG
         N6p7ae00a4RgocPyoyLZjdIm5fm6k+Z6z73zbCG6jQZyhwLoYcyUS8393gaFIcbsdUNV
         P7eA==
X-Forwarded-Encrypted: i=1; AJvYcCWIb1GU4JEewZYSDBsMIBUf3AbAVIRu+W0Y1z+6TP73bQpQs8jpUYy2IsBqjeMRq280+5i+Fl8c/Zg+JfU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz85QJPs+0pNsNALJ5BNDnS7ps0hGyH8JtwLyvhf1+IqSNAeNQ/
	PYOGezurbahRXlKl+MaT/fw2/SQQxrzTSkNdZtatGqRD/Hz+x/+M1//XIlS1SelLMVKz0YOQM8Z
	Vcc2pJo+R1g0dl9LVrAaa/7HdZ+LM6drajnT/OZDOqOUOJ1SO4emDffztHvXfDK4=
X-Gm-Gg: ASbGncugGLShO22dPAZ0a8AoNqRAsSs3OG9MsjhP+sNgoVgpuwbun6+FOYnj/id8JvV
	O5KR152CUNUMD0Ki5hAZAAbWchC4AvobWNb4/wa3y/hoapVsJXROoX6ngIhXjn4WG03EokjlYaN
	Hwvgxz46ltR+DMQdpx4k2ZmOdeEqi+YlMD/vv52a6qMh0HgTc6gbVnG8pX9JTfsmco6d+E1if8V
	kUnbYbPIK94qM5cHWUTeGCI+IdGgHB2M4H/RL/u+XTOx2nbWQyzT8VsHenLmufdD1Tzfiz65TmZ
	Mz2eK3T9pLLL1WW6KUn1c8tVCldqZfH/7nAEvSDH80Eme1zVPUS+lszYIsDXj+hMd+I=
X-Received: by 2002:a05:620a:190f:b0:7c5:687f:d79d with SMTP id af79cd13be357-7cad5b4a71cmr328841485a.8.1746271243650;
        Sat, 03 May 2025 04:20:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPb7K6LSDWBZT1Dho5YFFLrfHITP13o2fAlVZXPwohh1JHtEdiAWbk/ZWvd2Xrvglqu4P/0g==
X-Received: by 2002:a05:620a:190f:b0:7c5:687f:d79d with SMTP id af79cd13be357-7cad5b4a71cmr328839085a.8.1746271243159;
        Sat, 03 May 2025 04:20:43 -0700 (PDT)
Received: from [192.168.65.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540d6esm179999466b.185.2025.05.03.04.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 04:20:42 -0700 (PDT)
Message-ID: <64268903-fec1-4418-95ac-665738435366@oss.qualcomm.com>
Date: Sat, 3 May 2025 13:20:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add support to load QUP SE firmware from
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250503111029.3583807-1-quic_vdadhani@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503111029.3583807-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qmRoU44Ae8G6e5BQ1w60r7Oc-NXknjVQ
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6815fc0c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EGseXkZT_eIdJ_7nNB0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: qmRoU44Ae8G6e5BQ1w60r7Oc-NXknjVQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDEwMSBTYWx0ZWRfX47i8P74kILX3
 Mm4mgsZTXonARS0/yIbHqer6zEHYLCvyhsV686j9XFw7ID6lLNE6fXK+5RpcBE6YPkANPOpXP00
 n5PbB1NUYrBj7FSPtbheQizTac6V7snp9IfAk4WI4cw61NDVeFpmRhurchp98DbG6n6V+OSP2Bk
 sBWvNmjquASEsyWf1Z1cZZgCvr8NQP1eIZSSoDNwhYiOi6TnPE+x+KXzYMTEyxgOFQHI+NnMrGQ
 YtForxAO1TC0i0RIVcMqJq7ANi3GHCUCMr2L8ZEBqvzpT1vrkffU86CyCRZThm4lOQyx/c3c/Sn
 SXINfzVkP7HCYtg7WiohSOvuhiBSll0y51WyFo6F/iLFu+Asy0QH+qku4KOu37lV/JznstKHri+
 FwII6bPh8HayLidcwNqFs8moSFWAx1rZ4kUc+NBp1pc3FBuv0l1izm6rNtyLRYXUTTkQl168
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030101

On 5/3/25 1:10 PM, Viken Dadhaniya wrote:

You sent this series at 1:10 PM and replied to review comments on the
previous revision at 1:11 PM - please refrain from doing that, as
you're effectively stalling your submission because of lingering
unsolved problems that ultimately still need to be solved before
the patches are merged.

Konrad
