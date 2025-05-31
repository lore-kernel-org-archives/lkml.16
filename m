Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EC92236F3
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748689871; cv=none; b=ju1tla0P81v2PR8LpyfNB1wIajp816DoDum+MRb/OIQCa64FThfuKjOs2JuuIJoNhEziSeiCfgMrvETr5YsNLf6ZNexw0jRkQco162p+1NBNcQRXJ67eA5TnnY4wB4PsjRhgs9DIOq9bdSi+JFZnRbPkvfR3xeX0WDNWA9fi2LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748689871; c=relaxed/simple;
	bh=5b46GiRsDSu/uXYhQaQ/gNjsb8GW7abqp6ixGsVYxaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEmP5ZLjg3PC9Jv5AQWBH483PSr6EOotXiJAni0bNzwXRkipmYcGxzSJbQlELX+BxhzCSl1eFEJOtZBv0165Og4mF6R++84GLn8rBTjtQFqSg9Btd2QUMnWdaU/woyBvtZ92y21C62R4ljo9Il3vH+6vGrNRFUxnovl6XNvAZY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3ravUc4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3ravUc4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54V4MjiJ008158
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZ+vE5pX8HZbB5flVQGgvGJmT1zk4uOzkDXJe6TM4M4=; b=G3ravUc4nBNsbkOQ
	Rjnu9S4rlJRPOyooCSimwQq0FtSVYBF1UVuI43oCa/NAuvo2OC6TXHwTo/dmwamh
	osWY4F5qH82MNUs5wpxux6M7OkpU83ECW8OGOuJP0cbf4+b+eDJX1WLGr2uiYDK0
	JV1I/5YzafEbaXxNJaHtjEuSW3SLcpgSib+cyaSLynzL9FtEDD5ZZg7TKz5YD5J5
	SFEc9TxFrxchAIcVaM1falgXRASIXiKcu1md2yD+/swedlp978FzRN3554PyNYJn
	+t0HETJV2aPW5wJGik0Ld6dq6B0wiFody0HYCf3ESwCb18a0k+NrgwHg5GG5DINL
	E/PiwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytpergr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:11:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097083cc3so62239085a.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 04:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748689868; x=1749294668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZ+vE5pX8HZbB5flVQGgvGJmT1zk4uOzkDXJe6TM4M4=;
        b=F/9xFgbC9a40ZU/bIPs85CqX+Lymxa6VX2rA+Cou3FrdZ7/bTifaH6WiPj9TA9HA3/
         00bK8eYRGdT5fJAAb/9IY9SY7KP7Chg+eilnvICojUQI63PaXqrAivD0jcG/IniijmLb
         qZURcCKAfExiMYeUYUkoV7Bf3R80Z6UqAjhOvV6Vj53zEYYpGBvi8/QrdpCuM2L/h36l
         TfDuYHCnRexghgRcavTA+Z93HVxKZ7czpav673emnyfjkXmiExPCY3yM/MDp+nXB37Et
         yyMATyPzlMEC8SCqttRki43TPmLGPq5MdmMPBvsnt4Q7GBxP4S6i9OXtViM1yfb9iRvF
         IoRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSNk/DtnzoAIwqPo4dADbRx8dOAtNNdb0ToVPpn9hF+w4GBV83TqbTR1S6zz8U8jTj+BUAhAgs2xKaLe4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9bnpVi05KeviePJa2S1xxoaKH11EVD7Z4Ofqo1rvhKaZLVb0U
	+Nde0LgMDlpoZQLvBiIs+QBIZ7i7XN5CRN62SVH/L9cv8CRTJ0RD7/5xI7+nSKcxsq3rCLHEJIb
	7hXstQuLpWpAL4p6JAuhsccVV17OgS4H+74+JE/wcCCVSdCRxeKuPtIVgwZJByQP+jE4=
X-Gm-Gg: ASbGnct5G7yVeJxeO3GHYgwRuJw7CXT/oIbkGd3XRDhfkrU5WGcpgY4UqN7k42Nn7Cn
	BLSDeu8fspwKC6ljoxTZBvuHo/V6dOE2htcWHdBJHBeqgleF30f3UYL7u3NJwSDU4NxQbhwSbml
	yPBJ1QzSKZ7y/zvERwNu2ix5p4cTa8h41QTX9FueEciBKJcJzkuX8pD45cminDrlH56aoe23H6I
	C9z6sxF1upM+prmBAqGnQt0VwKYkUaX3XZa7+YhNIJZd4/KT0lmICDnZjNQRUjRxQelaEdCiBMo
	4dBR2WXCapii03FGiE/JNHGWc06QLB5qWpAh+B2FQqlkCFbAQGvCvY9pdbHgVqOSOQ==
X-Received: by 2002:a05:620a:40cb:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d0a3d978d1mr297824785a.7.1748689867839;
        Sat, 31 May 2025 04:11:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSvAl3+81zPxT8GtGObctxByRCmdXGFKJiq1TFWGEKnxHTfUWMUwJ0OE/8YtwwGaBL7+oiOg==
X-Received: by 2002:a05:620a:40cb:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d0a3d978d1mr297823185a.7.1748689867482;
        Sat, 31 May 2025 04:11:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e760sm486122566b.52.2025.05.31.04.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 04:11:07 -0700 (PDT)
Message-ID: <8c57ed65-002a-4ddc-9056-6b7908c0ff52@oss.qualcomm.com>
Date: Sat, 31 May 2025 13:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: venus: pm_helpers: use opp-table for the
 frequency
To: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+fbw/Yi c=1 sm=1 tr=0 ts=683ae3cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=3ipQxu46YsJ9vmREi38A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: d40uDVtfrn7Na2K_6U4CGALTW2EVV2fy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDEwMCBTYWx0ZWRfXzWjYcEP1hVMl
 sWxIlc9kBDY9Zuw3D97yuDEPHZRnMxAvUJAFcoNhS3tHcFmKZdOf+sOMhqPAl5LkHpYsESC134V
 BaH9u6Lyj28K7ocHCWYcn7IxXCrR1WEtvpnKe2lSWfRQU0JtqAenCn/TRXb4yUtXgBDT/JT9Fbs
 lqMkJhH8rMrt+xpI6aDi7obKbCGlAWtTthrimqG1yK6Orsw8FzGJtzy+rNdXrwjjZ/iNSdeXmZ1
 BdGhp3n8QkXc7PNqHE+bBoVBEV00w1OZCFEQ6AfVgl7xpYnYm1BNJdiv7UMEX1ywPAz6URij6Dq
 7eiqcS5eYIRcLhTyNuJuok6PwDhCs8jGrpAANOPgsxb5Q0QLzzt7JVXIJbn///Za+qT9vS/3foN
 7nqrojmWSZgdxCRlHzj2jV4CezeMhAvET+QMhTyzRYHWThBrNJKT4OXo6DVhdVT7w30GNY8E
X-Proofpoint-ORIG-GUID: d40uDVtfrn7Na2K_6U4CGALTW2EVV2fy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310100

On 5/30/25 6:02 AM, Renjiang Han wrote:
> The frequency value in the opp-table in the device tree and the freq_tbl
> in the driver are the same.
> 
> Therefore, update pm_helpers.c to use the opp-table for frequency values
> for the v4 core.
> If getting data from the opp table fails, fall back to using the frequency
> table.
> 
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---

You can save yourself some error-checking pain in this patch if you
do something like 

ret = devm_pm_opp_of_add_table(dev);
if (ret == -ENODEV) {
	for (i = 0; i < freq_tbl_len; i++)
		dev_pm_opp_add(dev, freq_tbl[i], 0);
}

to programmatically migrate everyone to OPP..

But - tangent - I'd say efforts to preserve compatibility with DTs that
don't even contain frequency data for a given target are rather futile.. 
Such descriptions where we only know the frequency (be it the tables that
we currently have, or the constructed OPP tables that only contain frequency
data and no voltage corners) are incomplete, and if the system manages to
not crash if the driver requests a TURBO/max freq, it's all because we got
lucky, as this consumer is not voting on (MM)CX.

That said, it's probably to keep the breakage to minimum, especially
given this is an old driver for old hardware.. I'll add the missing
OPPs across platforms with an intention to drop the hardcoding somewhere
in the future

Konrad
