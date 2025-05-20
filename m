Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32921D3E8
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739005; cv=none; b=kAfAy01Pgz7mQEmq8qKIRWHInpoq0vSA1M37uExkCE6oF82IdFYW5IK876jfQ8YZof8Ver4cdWszAaF1jHOQ0GAqYnqy62Ml3FvJr0i5UDdnoz0/VXMNr06esCJ/91zr1TxWTnbb5nfq2CWDR5pOS2YLUzc2Gynm9pqswlx5jDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739005; c=relaxed/simple;
	bh=HASfEQbYU5nw3DzOLjgQQ5wPQXIzEj4uBQ47tMxhs64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iXL/BsvcPX74zSSCsZ4HRCuyjfnwCZ2YIH5PrkZwVdAUUTq/WpqbCKX9D2LQBCxLqBduqcMscmFOkKU44moR0FyqBEJ2+xmKEUingtgLvwLbuir77B4fNyThwxna9jCRql2nsfraRk4/YDfjdY/cmyzP9n7TrIMPesX565DCg9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0YIMzu0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0YIMzu0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6k8tk000481
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HScz0u+Llm93qijaunpm9s3ySMN/5Pt+kU5sMHKjuGE=; b=e0YIMzu0M/p3LryV
	zXREBg6/u1ASGZsH/hYYEt06tH/XHECsh/OF5v//CNfuWDGbHhQDE4x961grjHDm
	RfU/wlP9E/MJiAa7xIR7yNGMp0yE14BrHijFARg3v/KwNX78Bup8b3jRmuc/+G8Y
	9uEObGdFQnfRUzlvIVImOGRc3sLbG17OqDxQXkQeMb8nj71ZjUBnAkLroDqGSDeL
	KmHCN09mgaWDkcuxG67xDUWEyEjW+1RyuWZwLn2ZS1oNh9o0OOwR8cUQ/DXByqDb
	AXIvMwgWJMGXvG/1pEoS73sjNACkWnC5cuR9wwQ1kouV73eU/zeEcbfjEnqdDG5X
	huiMJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9yg93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:03:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so155968185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747739002; x=1748343802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HScz0u+Llm93qijaunpm9s3ySMN/5Pt+kU5sMHKjuGE=;
        b=EEaF+bAJlyGp3kPb2ze0qJ/28G7j42DgrDv0Qu0qFQsUx6bp5THEKhUGTkhr4nfvHv
         NMHxSXbUcEMzZd10G5Fvf94DOZbXFIU1kH1+MsLxXr+79qnQCoQfOvktc43kHHrpXMrN
         8kK5fduFPnW+SdEOSauloJcQtZDm2G7mtc95cQfAES7T5M6btajaZ+IpRyq571HdpWuo
         sZpwZle7aXRvMirzgHQ5bxqw6AHqDa3nv6q2NZPB2EnmtqzI0+ZyaHQf0yLblgh4IWKF
         F+00uVR+ghVf6XupeXufk3AmR9fcYSnMt4Nh1ZWu4bmKvAGU6rpY6rAh1FsaKmvn4Xze
         EMKA==
X-Forwarded-Encrypted: i=1; AJvYcCVelaz1jaXj15tMT3izwhOAzBqdLxLJKADm0FDmVR6F7dVfzRBmW9zSsD8ZVUg3hJu9R/gdElpBln0yi0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeLvCT+dhsCUBjtKtLlh5eRaME4B/KCH+u02/Wf8ZKB987A5pZ
	8kr0yhzULChMA9NX9Zn60pLstysXhdhVACdgR4FZKa3X75GC5hD+2YBS7zitqoT0ZfK/pFRKS+s
	nWA1sgyqnP8Bpzb3KcccVNI65QGZKQYfqKsK5eyexVCimaZdh0i5ISDcxJVPMGvDzApY=
X-Gm-Gg: ASbGncvcCOiUvis9jliWM426kTOcc5QDk2Hd/I7QKrO47cE+9zIfRSN+KFuQnI3yw3K
	vw8YJV9TBKJ/+52dZPS5Mpnn55Zsf/8v0llhH6pOYd+csown+WqkOuKH2BzasFIgfBZ+cqg4fn8
	uS5JxaZUj7vzfn/pRibVzUx1gdlpxzU1KJm8DmC/ELcUrvyb8z0u3EXFJes/SmYU8L1lYvph86S
	imzqpBQ/Qlr5kDh3PQQ27/9yUT1c0y35FOQhEksIXv27PZkbV5dmg9PbBFmmpMGi1bHkoan4LIP
	GbMZe2fCQ7hzoTwBcoPYS0gW1pAxhMCB+LW5cVGDKnNd3PxURB7ovJ2jHv1EPWHsfQ==
X-Received: by 2002:a05:620a:1b8a:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7cd4672f622mr1130275085a.5.1747739002113;
        Tue, 20 May 2025 04:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL3+EcEBMCFUs5rn/uE71zSGiY5smfjbdn6K4KuMrGJ4AUyjWUYi3XwmVrvc3D2YpXLTwxvw==
X-Received: by 2002:a05:620a:1b8a:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7cd4672f622mr1130271485a.5.1747739001540;
        Tue, 20 May 2025 04:03:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6016d193ebdsm6673791a12.57.2025.05.20.04.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 04:03:21 -0700 (PDT)
Message-ID: <8b3ab2b6-4180-4560-991e-41780658cb52@oss.qualcomm.com>
Date: Tue, 20 May 2025 13:03:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] phy: qcom: qmp-pcie: Update PHY settings for
 SA8775P
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-1-d4f319221474@quicinc.com>
 <8e900d20-009b-4cc7-ba1d-52582e414402@oss.qualcomm.com>
 <CAMyL0qPmMVt1Wd4fkQsf_pt8ggJhpR=u7GbXtifczK4Xp8yRJA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMyL0qPmMVt1Wd4fkQsf_pt8ggJhpR=u7GbXtifczK4Xp8yRJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ePwN84QP9eh4TAUnXbObo411NJvFgais
X-Proofpoint-ORIG-GUID: ePwN84QP9eh4TAUnXbObo411NJvFgais
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682c617b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KnjBw1EjzzqmsG5sd9YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA5MCBTYWx0ZWRfX83CvLnkDLC2n
 ISS0olzp/k/s2f57CeVej4L7sZ/lrw3XwOSLyV6dmJT8sZKvsEZ5u5apkjT00sJayMX/UP88YgE
 1W2RM05UrzfVlVufSeCwLxc36oTKdMTPT4j1dWkpZEyHHoCoY7uir6nqApgTQXzye7iKzh8waFR
 AqPZmHSC9emKZln8wg4NBf5l2Iy8mXCb5dC81kUZsB26WWQhQVpTSYh5jHsGhbCmJXf6RbbOydg
 1XckNyZrRKHID6l2gEPLoiYQGhyqTWLHI4uvzIPGnzLNiEZGunaIXOakM3uf62hGyJnHzURSUUG
 2SlipkyuyzGoLbewJNNh8gUI+UWKbO0pzUDAUM9I5BwthtYf+OUfmUUCcUR/uo2YeJ8UuuHsOXP
 nozhJsjpDA5GLa6x+pWncxvZS1XfqN4+RcJ/XJB8AYAzm1h65Xtkp09VdAotp2HXGtA4B5sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=567 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200090

On 5/19/25 2:25 PM, Mrinmay Sarkar wrote:
> On Sat, May 17, 2025 at 11:46 PM Konrad Dybcio <
> konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/14/25 1:37 PM, Mrinmay Sarkar wrote:
>>> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>>
>>> Make changes to update the PHY settings to align with the latest
>>> PCIe PHY Hardware Programming Guide for both PCIe controllers
>>> on the SA8775P platform.
>>>
>>> Add the ln_shrd region for SA8775P, incorporating new register
>>> writes as specified in the updated Hardware Programming Guide.
>>>
>>> Update pcs table for QCS8300, since both QCS8300 and SA8775P are
>>> closely related and share same pcs settings.
>>>
>>> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>> ---
>>
>> So I took a closer look and please re-validate the changes, I
>> checked one write randomly and it turned out to be inconsistent
>>
>> [...]
>>
>>
>>> -     QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x08),
>>> -     QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
>>> +     QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x03),
>>
>> ^ this should be 0x0a according to reference v1.19 for RC mode
>>
> As per v1.19 for SA8775 RC mode I can see the value for this is 0x03 only.

Ah right, the docs are structured in a confusing way..

Konrad
