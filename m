Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D068E111BF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750656078; cv=none; b=tTnMieuPqvLVYlLLHpSr78y5ktuFAcbUsmeGig8R+LzsVlbRN9OvyrGJEEH6e2D2xGwfHF3bT3InAm5uuFvNQDKrlEvetFQwo2Wp3NsrvaJgQ3kbK0y15wkW08kBxy8EgKotA14VQerz5RFUAFEMIUu7f27QIwgrR6UA1eY8OR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750656078; c=relaxed/simple;
	bh=DIfUU6HEAalsVnlWwF6xRido4ZwXWk6Y8RNH2/T4heg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cknyk+tWoy86b77MA00CcG3wzIoGev48b+0b8A3zcsoaUDjDG9YEnJh/Io1O/7O9UeHgs5XugoqWKbwVco/42bgmrKGwBrIyCrwJpW377CzGSXFWEEooFq2x5VtVO523xfb+g9VlZ3NXjw+lCBMJkXj5oJEwqDSJ76hDWThVZSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TownxR+u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TownxR+u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MNO2rm025954
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJaUpKWaloU/fOL7e/dgz5PF5xRAJF3ZohSH7tC3q8o=; b=TownxR+uzJuqqY22
	KoYUnXvx8s+YZ/yUUriG9339Eb3p/1eyAHQVikqRlU7uZRzzW44XI732s2ouzWw2
	tYWef19edun8URilL1g2xE0izHw4DsA1jjjwKRwcAv/z2fBTkH6VWOFSiYhWglb9
	Pzo5zBurDSCljsmldDyb2OjoinnGpmeH/VywkkHmMwTDlwGO9OiCfkTKdAWcohNM
	SFbEOqf9z9ucvXefHh/SZM/5lahrAvJX31VSaI80ZD1HrtTRjORs6n/S1QTWQpVV
	HrUjB6apVTGDGd6AelslDd68uv2rVtARtF55Wu10+xibS3p/bQFwGirPo2TOcZGJ
	nofbyg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmh08n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:21:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31e1ef8890so2350599a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656074; x=1751260874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJaUpKWaloU/fOL7e/dgz5PF5xRAJF3ZohSH7tC3q8o=;
        b=tA/Eb64UQr4UbFEZN9btpBWfnnFKGloamRfqDmma10GhljdqfE2heuyxCUb6phea7e
         wdSu95BcHVUJSZxrTyaEx2vwJ2GA23H39L0KwH4EXWOaWejDEGY1+VWelPfL0Uh4bl4P
         YPQWq0kcykDeH2FfwE/ikVemVuqefRbyNnyueyc/C1kqv10jndQCivGZMaoxkGlYchl8
         ZnG/CtyWpkpID4d1atxEl06vRE7uRweFODqpDzfpkUWeOoDMt5elTHQFq+LFOMALep/D
         p22l417+hL76egQe4/dXfEZumezsXXwVtpiwLTP7jKLCVLJ8Ywel8/Ixmp6V7Ei589Gr
         i97Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/jKjpelPUTQrE4Qk4yBCrmd52WZWqWyshf8sM4n041IGSiGtS+tgf5w0uwrnffv90wyoKjawx9Qyi/f4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+sBPcDD4oAcmZT55S/BEAX3IE8Rc5LF2vvKii6u3Dsfvd5/Y
	ssdTarGvwRqGfkjnnjAqeAJrm2EYS5r4PnQRP1whNE5FwfwU9NI1WohfV/mus5S2wfWaU5vyanQ
	v+9vI+8lWeeXpzE1DhJV0AceFeleWxJM/rni66R9y8TJzGNeXFV817juolEax/4is7ZA=
X-Gm-Gg: ASbGncu2KJvR6/mezZW5teMIC4gF4wz09qXTPcawSrLKYxugcB0Qs89E76WSSKbY0Ms
	ipPQiFb+GNHvydiwR1x9oTtKzmub9uYQ3lM7Y6KH/8/BB35tHVPsOsY8JrZbEyVqcVwlehTNUar
	KrSfRP86E60PNhpM3q8bkF/M+vZcuFknahkAmssR8VsR7XL+7ERydZU31cDaBHNUgK7gTvyqtpJ
	3qvwxak9FLT1eAMQ+rK4Sh6Jwr/RodSKlHaF4fNTLyfxPDFb/CCgDCThG3cTxIrLIvsTUp08pT2
	eFutpCCHp4EnHeJNSl0gYTQSwOdF0rftdQPnhLhkZR0nVtD+0xXr6N5fZuYUe/oI
X-Received: by 2002:a05:6a20:438c:b0:21f:62e7:cd08 with SMTP id adf61e73a8af0-22026d62492mr16734644637.8.1750656074021;
        Sun, 22 Jun 2025 22:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN6sXlv3E9PXQKKHrhj7infmrUZxL1XGkkL3NJcuzzaEVBliA6CDYcfDWdSI/EDBJMpScx2g==
X-Received: by 2002:a05:6a20:438c:b0:21f:62e7:cd08 with SMTP id adf61e73a8af0-22026d62492mr16734626637.8.1750656073657;
        Sun, 22 Jun 2025 22:21:13 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b32075895f6sm4116924a12.21.2025.06.22.22.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:21:13 -0700 (PDT)
Message-ID: <aa9c4dfc-5b70-3893-73d8-ef590189f937@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:51:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 3/5] wifi: ath10k: Add missing include of
 export.h
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
 <20250611-ath-unused-export-v1-3-c36819df7e7b@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-3-c36819df7e7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uDbvq4ggQmv3NJmrt6ySHuIfXGJuJQYi
X-Proofpoint-ORIG-GUID: uDbvq4ggQmv3NJmrt6ySHuIfXGJuJQYi
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=6858e44a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=U89tM0JWt6iRefauG40A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOSBTYWx0ZWRfX1vyTJkkb9EMG
 DLsZlfHW0beRHSdcryJ3ww/a+a8tkJnNqbP+MwNV8BbPVccH8EcAzFvJdo8qgPPw6kSsXNOJiFM
 6qT1lXJikMftNzl5lRfO4zTEH7aH3D4swED1eRYnZNlVnR1gXH2gGJlNihViVzIFKixGNEYJOBl
 KB9nbKvWs8LqSGffkLHZUOMFsQOsqY6AR6nC9EBOun4jgMP14+ncaelCEQwC33w1pu4FIU+hpWd
 UE6NtxZrqhKk40fLrnTtkTdyJnHXgP0Yhnuyrqkc2jV8EZBvne1HssG2EfXpTuRdVAU+m/oel6y
 w5YbG/9VkPbZTF1UEHpnGjmAJzn3HIVkbVFwiu5rddde46xi6HKMSvXNRyB8J/4PgWD8V1pIUjM
 YDbygXcIe5gIk0gcEKJDTx6r78FNZgeFzx2uZSzUZmVlmlbf8GNj5+8jp05LIEHmXGa0X4H/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=960 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230029



On 6/11/2025 9:43 PM, Jeff Johnson wrote:
> Commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") introduced a new check that is producing
> the following warnings:
> 
> drivers/net/wireless/ath/ath10k/bmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/htc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/htt_rx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/htt_tx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/mac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Add the missing #include to satisfy the check.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
