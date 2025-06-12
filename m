Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679B223DD1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749748082; cv=none; b=Oalm71VNagFKlWWxQ8361ZrCdNNXN25FyxZtU12ynFz/n10973t9r9RAWBF3PSTbDMurjuady5epV3v/g/yrU1Fphr14sgpGzKEMrHjEttJuMKmTIvh5FMYgU+1+KPjfWoKOgv6z+BjrP8nVQTX8zC7I7BFAhqxAcaWDZtl5Aew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749748082; c=relaxed/simple;
	bh=Q7GXlm2e5RgBPG1dGi7/YTqBRYy7c5r++waPcXzg61I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNM02T0T2Ik+9omxiiDe+K7xE6JK11DetcLlJgfKa8rNv/ecYb2elexpQ0BweRjPfCEIaBESgb/kgUeuIi3xBg/k9ZtbhspUvvea0qRnHkII/5lxo1c4BkvbjfZH6K2UOg06+1Rdz/JhmzP0akhy+kkxDZ09EcIvDMo5anOCaTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVY+zO5/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LVY+zO5/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C9aCrY002599
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCUX6pLJ4eKKsw/Jg+nykN8d2JIazB3083QqZVfXDF0=; b=LVY+zO5/secelIHb
	cer/cuJ45Y8xJDHx1dnTtwsMKfXGVTwoZ2KoB5BwDtpAWIJiU5FH6Ny5R5XaxvfB
	CsAIVj33VSTIuCcMDB13C0O2nwTALvSkNjpWTG3jrQcnKXNGT8c2Fk++pVmZF1Dn
	BjGL05gEzDosd+HBbUBHNyFaDFAtUdH30c90em60vvj6X11kagxa1BqGk6Vc5vDy
	HR8D6SnmXoNQ95r8G96FIvhDHID5nGUceYB96ePp840jKkmo5k5128w5mns/ejMW
	e6qDp4a3vWXQ9TmTenmZOwfX3r00vgkcDomWoaXv1yfAboZ0fStLxVY6sx+PjRTn
	Z/evlg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jbpjrws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:07:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f539358795so3045686d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749748079; x=1750352879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oCUX6pLJ4eKKsw/Jg+nykN8d2JIazB3083QqZVfXDF0=;
        b=koSzKiHaij9+dl2JQTPP5n4VKu86JWT9iURL3w/XuCfv31D/GxzWWJN2VjdQ5aFdsx
         +zSIfkMEYOk0/3p6/QhAEttAadwyt++9IV1k0YL2N9NEgY2TTuY3EuDLZ0X7oX3QIt7x
         TE2uV9vc/XgDZsMNGORwg55qoJV5dTjUXA5iVEq8Mbuflx4CFlOY6k9wpAUZ8wWXzEfZ
         IDhFfZ+oZNEujw/ttrM17adBeEtzmgA9tei1RgyoE00AJSKffK8yY2xXDFVb9yPyWPSY
         EcBrS/Nodcjaqj6QR9E40B40vnXkMAm5RTiT4y3O7iJTY0R7oUa0gkhuTneAzEN+FR8e
         4GOg==
X-Forwarded-Encrypted: i=1; AJvYcCV6ts1P2IPryXkONYBQHQJUxKXA7LdXDg0xO7dI/Sm9W7DYcUut5a+PzHKfZxWTqgCD2vnGUAqQrlJ/9lY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuYU4RIuT4UEwDsoQyDY9CCKFksxHb9V6JO4wQyzNWbE0EuTh8
	SjwIqX+ah9gJN6i6O8DItPr6rVNFtptz/zKXq6x/czRzE2JL0gWr9i4DDwX0mbKj8g/cuogSjSV
	08nnU8jPLUybSHAD0IM+nsdVeSgfz4fAklCGxJUmMZiNSRpkkjc0L61mW/U3iz9cD23M=
X-Gm-Gg: ASbGncsy7JDS1oVVmVuJ3LgOP82M4nKfOhvAi6BLrOZcVKyopdQkbz8RCrkp+6zmxJb
	PE4yhBZMlZGD6SeaSGq+4mnoFyk5BfeqVoJl5ekvIyu9qU4oz+zcOAgta83muCPaWTlfp2GbX0j
	i5dfzErynOr+xPubrYd7taug6lz85TwtwhSi+76kwyKF9paUpZq7W/6OFHMFv815/rek5htJ5p1
	Ko77Y05YREqA2W6sNPtdrwX/BwiLtBMInHv3vAhrhWM7NLYdAMJjgRXuQrXhVAUQG0YUWQZN/Ls
	Cbw6YnXEkjbIx1U27veBRHAaw0Kek843Ruw/kgj+06585MGoiUhmultkKSO0Vv8d+s/rO3Hktqy
	UpVk=
X-Received: by 2002:a05:6214:5017:b0:6fa:ba15:e86 with SMTP id 6a1803df08f44-6fb2c25783cmr50670876d6.0.1749748078755;
        Thu, 12 Jun 2025 10:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUVxUe6jZC7/MV4tS+FVdBiQl+jx9Qa8OGDtsq1v0I0wDt4u6bV0IdkUSIiWHVGe4VFxRwVg==
X-Received: by 2002:a05:6214:5017:b0:6fa:ba15:e86 with SMTP id 6a1803df08f44-6fb2c25783cmr50670686d6.0.1749748078261;
        Thu, 12 Jun 2025 10:07:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6086a58eefdsm1474265a12.23.2025.06.12.10.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 10:07:57 -0700 (PDT)
Message-ID: <2d768e39-428a-42fd-8e31-a36fd11ea776@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 19:07:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p: Correct the interrupt for
 remoteproc
To: Lijuan Gao <lijuan.gao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
 <20250612-correct_interrupt_for_remoteproc-v1-2-490ee6d92a1b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-correct_interrupt_for_remoteproc-v1-2-490ee6d92a1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wdtUt5SVd8E1Y3vHcQCyEZkZH8SOYGJe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMCBTYWx0ZWRfXy2XbzIi0bV1B
 UpPcoKmpFFsm6RAr3n9gnJAMgdB9AMNqZ+gxDp8SSAswTFpKjfK+floV6cM8pWaj8barzn5isXM
 9XlQGc0zvA7WfjCZK1NNDLwZPRkQHJbyvIFPtPjKih8h0D39CCZ607BfBlmCmg/v52nwP+w07p9
 Ac+B6Z+fp6XKAyp46b2fdhw+K5qzWqlR2smAl5UEb9hNvpxpUmoR1466XXLSiBbk0NwTGTyCI7G
 F9Gfn4UfkGMAjR7Wa9ojgo3XqdzcuVQyAORHNfjjeDA1+ACd+CZ6SZw7LJGMDUuSyP3XqcBCOuC
 M4twncOwzcX6QsQL2eCvZZWl3vyoZ2okiHXavrsC+ZABJv/mvcTVEn4wXW72tI0XsVfyAQ2PlbJ
 dlknKYOOKj7NF6ikWWUqnXjSm+p8xq4VQTrLmxqVD+5yGmwbgnhkCa14VoiyMkP6F4BLzq+W
X-Proofpoint-ORIG-GUID: wdtUt5SVd8E1Y3vHcQCyEZkZH8SOYGJe
X-Authority-Analysis: v=2.4 cv=OLgn3TaB c=1 sm=1 tr=0 ts=684b096f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wrLjHZacoFgeWOAOTdYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=704 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120130

On 6/12/25 4:39 AM, Lijuan Gao wrote:
> Fix the incorrect IRQ numbers for ready and handover on sa8775p.
> The correct values are as follows:
> 
> Fatal interrupt - 0
> Ready interrupt - 1
> Handover interrupt - 2
> Stop acknowledge interrupt - 3
> 
> Fixes: df54dcb34ff2e ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
> Signed-off-by: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
