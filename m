Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEC126B2D2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690385; cv=none; b=ZQd70ySyoSsJ9ibtF1nb4Os+WkK33oYKEq2VTp0jUUCFHJhVMi4LX8XcL8hIGyOC9X2/iLky8rQ+jcwJ+qLUrQGQJGB1sKxZyaIvF2pwznitHJEMctDzkuza9VMW1h4tOZDtyJV3OyUWBrw08aiV28TBF1lBpm0zZNR1XadV5rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690385; c=relaxed/simple;
	bh=R/kxzzgiixlukyr+QqYyh1VnuJlvynBPFO8dfuoRIc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZQxs3iEqQ0Ci1ewkxHwrGsJNjjQcdEVfzrhZJ/VGaSnY4oN6784TpHf7W4e4xCXfpyM4JjlAp+DNN3UQwmjdcO/fwq6m2LCUIkTsocRkhtoIYdVrPP2/89PiT0u8U0bJIqvhwmSTMSQXgelTOFOmFM9Tr7p+d22HB7/at65q5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWBxEGXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWBxEGXC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NBaXRP028768
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QjulfjMLVMZNGFwlPLa0QQErOrJoenj2k34tfFvIg6M=; b=TWBxEGXCn82XNsbA
	D6IoejiriZNO2nls1EWY5fETvq9SvbRJRXX3+lZNSwy9H8tnG6TXRfYHqRGdTV4x
	3xmNT3FgizwFi2oAHyviw8NiZIxf/B8+JT8Q+q/jYAqiXWEwZWYMSKsaUdxVvuTo
	VBid3U/L8Ee1ceB/VeM3CWBYw/ELEIle2ojnB0a6qVnsEJ6eCMDwPHdQtWepzTHR
	u98z9Q6zb3DxHjAwNAvsSCcs3p7h6NXHJ5lqpZ+NqY/MbVEx4KeOwmzyMCzu8wgU
	qR5rvPZI+3Y8FGZ5DAw5bAear8Bydf0Ad+laOgAgauUtpXTxRQIsOH8Pb+ieHvQA
	Bkse6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k1tce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:53:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so142157585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690381; x=1751295181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjulfjMLVMZNGFwlPLa0QQErOrJoenj2k34tfFvIg6M=;
        b=wJmyCX+JByTAVDuLbKO77h3g5I1NM6JoA9OTVEilV02rzS9DZoX+7qTgXuyCBRaCWS
         PeWhqqtM3GpgrgFWHaEEMWZANopLRAMFwAyCADHpmkMibmDK6z097xqvAX7zS9H2yPab
         ryj42KOQW/dkpoIxe3O0KPjrTSy86FLZ1mR13X0PHFaFsI3kjUVHZ7366xsYpCbX6LPo
         Q8RJaTvzahmMASjPz6vnkxN7WtsQV7LNsrmaee0Wy+uzkfqFOJeXmLCoUrEtBN0FpyCE
         MYob0kMuCF8EBXo9SavcKT6a1h0FZ+lDoKJJkXOGv/cBvumSlUM3N41F/eYIsIQksjr2
         h8FQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3xRayNm3xKaLrQ4Fb1qDUISy9Rsh4NoHT8efjmfsY66UZp6fQ+dAymMFjZe0Z1XakUUVVNZQ0Rywzdso=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJR9JSsC/Bvgk+KbstgFYsG8gTlhKK2REK4b8sMjiChClvRpLk
	WQthi4U54CJ+OdSTbIt93PIsA1Ml6zPmc1qc8X9zslZQQpZBhXu20UayxCs8a74+xyzzQ/eeSWe
	luC6zs612FZ/6FAwUSo+gKep9RVg37C2IOIly+XfW6NabanuMTEjBdHU9drMCViUVAuk=
X-Gm-Gg: ASbGncsnAdXo9TJQa9bxW9GoKfhL8KoV46euHmzbVkNyfIn+cN/1RU7r5zbZk6pTa8z
	/6TQyEzSO7ZJJZmNoBmTgxHpX+nEOuh7wVhdiMCe0NupH0LgGRpLpViKR3yRWXA8uegb6QyaBGN
	8Kl4Nxz5xBbqEfGZ4E/y0PlpnwXNbbVOAzUy/sx+0hNKZ10GCoc+7ImrG/P9QSrs1/dwPmcEMxj
	lGighj2sVsx2tdOj2ODWCfMreu6o/y7JTepz2rb4bUZC/Nz4kcpxoJ2Mlr3qYcLPjS8Ub/s9CBb
	vyRPdXsGEh8bMh5w6d4Zu9+aubNu2yqJzTcAYhVkioBDN8KTH5L1GiCnxtMSfd713EPbPX/8+i1
	TigI=
X-Received: by 2002:a05:620a:254e:b0:7cd:14b:554b with SMTP id af79cd13be357-7d3f993a79emr683999885a.10.1750690381279;
        Mon, 23 Jun 2025 07:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAVfsfuHGPRp+Rfb6Qn0LbSM6eVDSaSJ4R1Xthk73wPTYr+SBryfjHGfkihaeEDsySZ8l1Xw==
X-Received: by 2002:a05:620a:254e:b0:7cd:14b:554b with SMTP id af79cd13be357-7d3f993a79emr683997085a.10.1750690380752;
        Mon, 23 Jun 2025 07:53:00 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a6csm726628366b.93.2025.06.23.07.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:53:00 -0700 (PDT)
Message-ID: <55624c7d-0192-43ec-b367-f33c96866a2a@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 16:52:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
To: Johan Hovold <johan@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
 <2a37d3f0-a3f4-444d-8166-f85888a27308@oss.qualcomm.com>
 <aFlqGMWwx8ID_SaN@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aFlqGMWwx8ID_SaN@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=68596a4e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=L-5_I4KBUgPuGXmJ_zkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: GX2IwI_kYCP86HeVJTNToMNy3qbqTAot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OSBTYWx0ZWRfX/+bWRgj+8fzq
 sZAAoODBUwG1I4gb371gu0czuz5yEQ6m+d0+txZtBPw41izHWekPdl5FJe0B5UmhYtR0P3VPKEW
 8z4C1EkO0N71p+yzwQFapRNKRXpkH2ZTo2BhiLH/rU9WD+bYElcrILptF8gUO6C6qseDknAf08T
 trYS5MFboGZiUUAJcCoZY2JOjxOc0cgKSdrcBHSdgJTGhdThA3IFBvGJQoeQ7+H3lc5x5Alqsii
 cbL5sW0+iuJfQHNO5KNePy9TZbBrRIAhGgfxk4BG+EWqqIL3HQCvIXMY4hngOIPVNUJxZAbHzM5
 7hykO9EGPo6Lyi9VfxU+klcTgtcdyXXOxT+4ghT8CpGIQpVkdgH63T9FNlOFzF9WYM5cuoGnI4R
 /DDmyBF/KPIlAoR3bI2LacDOAN9GAUoLoegDkf9xvXr+95YLW8N6oOt+V9sT32OSgLNzyqOc
X-Proofpoint-GUID: GX2IwI_kYCP86HeVJTNToMNy3qbqTAot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=858 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230089

On 6/23/25 4:52 PM, Johan Hovold wrote:
> On Mon, Jun 23, 2025 at 04:49:22PM +0200, Konrad Dybcio wrote:
>> On 6/23/25 4:45 PM, Johan Hovold wrote:
> 
>>> It looks like the efivars implementation does not support read-only
>>> efivars and this will lead to NULL pointer dereferences whenever you try
>>> to write a variable.
>>
>> There's efivar_supports_writes() that is used to set the EFIVAR_OPS_RDONLY
>> flag which then sets SB_RDONLY on all efivarfs superblocks
> 
> Yep, but it doesn't help when attempting to store the RTC offset from
> the kernel (since that does not use efivarfs).

You're right, that hole needs patching

Konrad
