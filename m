Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F59929DB6A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564565; cv=none; b=MT/Rk1M0ZBJNyF83iR9HjWf7zz6bs9E0ZNcTFT01jL4swyMRcCmoV9+u0uj7qUWAmU7l9XcgeiNugAKfBh4HswJdQL6zagHjVBfujEwvdxehonmfAyfDXaZ0did9XE3LDLJcVgBSQiVRB0JmlI11m1UvTu8E1j9ABzmwg5EttB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564565; c=relaxed/simple;
	bh=64oL1IuUL6LDShJrW7z+kKTXElQQl4FAWK8vmLE6BNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbA8drADkOLrZDc16VCvFoRwS2a77UPOFdct800n1fE90ssBS3YwfJk6FlUzZJ91Xbftf8Uv86EHzjpeguanW0NLXVjfbZkZSlZt+BOU35HVAycL/kNjGp1PXRxt4OlylaAwZmDSFdIWJHkQ/uQ75kURolPH2L49vmrU200xR98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBIx6CtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBIx6CtN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9j2lk024239
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gP4Jd0wZuukS80MSwtMl4EeLp4f+KtIALdhGXarYaPU=; b=XBIx6CtNaZzvB0WU
	a6Jyu2bBHjsjyam2qsljk1cGYDp644pMzaMwezxnE80cCmN2AduJtDXRYv8JlN3d
	sanK5mMNYey47Fqu6Fun4HV5HL39fM2tNcGMVw+/5xlKEfMPCQhxm74xutYPbjNk
	XaEpffomlc94SLryZ8Sgxw5dAuy0uEoiayVkyTL3DLwitAVhSp9g3FsK8BEQzr55
	2WDTdwu/va8MPQfarXvqzRC6cJ/Pv55DOcA+yKixkpExrBoeubw/VjaYwPhI6HKM
	HFNSWPnH5yaVGejWAFrw+7/alL5b6Zvab9F5NB2G+/VG43n2h4cEOh+c7fsifZKv
	p/+c5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y4g80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:09:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a517ff0ebdso15650561cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564562; x=1750169362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gP4Jd0wZuukS80MSwtMl4EeLp4f+KtIALdhGXarYaPU=;
        b=dbiTM0d0wLxAvl3QTJgQLABE19cpYgeZLBygKjiN3gFa+RFu/MnoskdIQSmUWTnEOO
         0ghy+jp5FU2NvPBd4nPu/R4V/Eb3SAEjQQVHk6A3ds4ev9S5L0Txpn/UdpEnoNP6C0oh
         fGDeWwwf6+GqnyiMVHzbuH8WetzNmiqKPCOV0iEwrg3uOjd3h0sEnNRZmZLBgP1R2vvq
         79bDhbiG0ChA3xHwr8ZzoeFdgwcopO9HWsFZX9dG85xhyRx2iNPrV1ZYcYCydPhr1GHx
         +Nz/BuyOeH8yGxirKWto+SX2F+xEzKSCldQmjJwzE4qk2YSU/Uau626ODPQNl4yo/XDj
         yzRg==
X-Forwarded-Encrypted: i=1; AJvYcCVkEUcoOOP+E84r3DB9M/ZLjXOgvZ8UMYDYwWi0dIE/4Qy95Wx4Z0HVu7jSE6UANdphJ8AoU9AbD77EmUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfZ6G3viKJl92Z6qe2MVUS5pyluzoqOs7Oqla6He07jgIBh+Ks
	rYF7qYtKDILLeGzk043ATf5dmW/eh4HJmugBHStvk2I6KqrUGmXZcX/0E+nGiUF0Xxq7Yq6ToP5
	LqDiaXasO2OXSrffuvSKAjajXwQm3BW73jwxHzCfohqPzQSx269u+nJc/iaI1SpszYBw=
X-Gm-Gg: ASbGnct3bauk2/W+eO9FqPJTgrKSfN5uIQCFBLLMpU9yAsCjwmMkA/g2mBc+PliCgNG
	OTq8zf8/zEmoXW7hGK1tYa0mgdM9LdmOs43lX3qlvoBbnSkzzuGtAFsxkxK43ZJrg6lq3Xmyw+C
	gpGjkEnlVyjhOd09U5qg26U8wG51okR4N1mmmKhfriJvM5ZTjn22oIp1qhXO1r/j/pFCTZjzyjY
	Zxonv1eX7d17rKFSPmT2QW8d4dciO+P8ay3/MiQuYBu8PNH7M1kkuN76ZwnyxuyZwLPNwfiOfNw
	Qbo2kKqK0nm0EzYBEKAxi3mLbl1gVAzXgjItwf+3oFVs8aZTBlZGSxi5PsVz3EdgTrpMQLuFmb0
	Q
X-Received: by 2002:a05:620a:294a:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d331c11a81mr969895785a.1.1749564561923;
        Tue, 10 Jun 2025 07:09:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERgZgp2y5pYp48AInVGbjIfwav55zx9yDpitn4roraA79eZtpYgR9Fcxn3XP8O4dbac3evfg==
X-Received: by 2002:a05:620a:294a:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d331c11a81mr969893985a.1.1749564561524;
        Tue, 10 Jun 2025 07:09:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7e770sm729541666b.183.2025.06.10.07.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:09:21 -0700 (PDT)
Message-ID: <73e2881f-b899-45a4-a59e-47593283b63b@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:09:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] arm64: dts: qcom: ipq5018: Add tsens node
To: George Moussalem <george.moussalem@outlook.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250610-ipq5018-tsens-v10-1-3a10a5a2642c@outlook.com>
 <f123294b-b944-4723-bd74-713970468d51@oss.qualcomm.com>
 <DS7PR19MB8883BEBE4168DD1682F858749D6AA@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB8883BEBE4168DD1682F858749D6AA@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExMiBTYWx0ZWRfXzoBmj6h9KlSe
 NawoXAaATwQsBqqC6fzngWnBTfIMAN8WWpMyoPYZS0ZRuv6mZxPGOvrkuSIWf4JrtagGYmcs6YQ
 Lxh1ZEX6+WM8sjJAWmg+/ZY1iD1T6rzedNgKNkpHw4Pb0jVe4dJ3vuW33GoVP/9R+Q6/946wlEt
 46rLl31mhK7MyaeLaZqKVE1ZmqcuG3L6QrriS/7Rg/OML6c3rvHP8AO7jxziXVUfO8b4Qekgb9Z
 o9qsgj/xpC3ilNZ44JlJ7HxiS3OweUGU7txKGmes6jcjc9RNBA1aA7mfVIttljzBpmRdY/E5Dv/
 Z5NTPy4AQIK7T+xfYZ71jIMx3q2kt8KT1Z3E8QoIZLtjAQubWvm0NcJ3rwiK+etv+jgiITqFP/C
 HJa28XiGzc2FvpnAEGGx6jQbliEZZ4p8U1SJchY2k+dX85KqfWYxorSY0G7gIFHuFehIvs8i
X-Proofpoint-GUID: CcX0z1F2DI7gBIVi69FJrwq9QAdtVAQF
X-Proofpoint-ORIG-GUID: CcX0z1F2DI7gBIVi69FJrwq9QAdtVAQF
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68483c93 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=UqCG9HQmAAAA:8 a=E6Ly0PRcfj7wCC4qtTcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100112

On 6/10/25 4:06 PM, George Moussalem wrote:
> 
> 
> On 6/10/25 17:08, Konrad Dybcio wrote:
>> On 6/10/25 3:03 PM, George Moussalem via B4 Relay wrote:
>>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>>
>>> IPQ5018 has tsens V1.0 IP with 5 sensors, though 4 are in use.
>>> There is no RPM, so tsens has to be manually enabled. Adding the tsens
>>> and nvmem nodes and adding 4 thermal sensors (zones). With the
>>> critical temperature being 120'C and action is to reboot.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---

[...]

>>> +        gephy-thermal {
>>> +            polling-delay-passive = <0>;
>>> +            polling-delay = <0>;
>>> +            thermal-sensors = <&tsens 4>;
>>> +
>>> +            trips {
>>> +                gephy-critical {
>>> +                    temperature = <120000>;
>>
>> I'm not sure whether there's any firmware/hardware measure to shut
>> down these beforehand. It's better to have a software trip at 120C
>> than to not have any at all, but you may want to try and find a
>> case_therm or so thermistor for your devices..
> 
> these are the temps as defined for the critical trips by qcom. IPQ8074 has the temp set at 110C, while IPQ6018 even higher at 125C.
> They've also defined lower temp trips in the downstream DTS files.
> Should I try and add those? I could check if the driver supports them..

you can register the CPUs as a cooling device and add some sort of a
trip point (see e.g. ipq6018.dtsi)

Konrad
