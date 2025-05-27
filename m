Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0867D20C000
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379258; cv=none; b=AbxJCQ/D61mcibn/NqiDceQlcVHA0doF3v/WjkuhYgLirmuOUznLY7hcO8kyxDB1ik9ywli/5H3F/BzySHSW5WIm+ydwcN+gk24Pbeeo4LGHyqb57t/SU0YogEJGePaebI16z4FQcNkjOhW2xBrsmDl+9Z7X94XYjwOfvUJ890M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379258; c=relaxed/simple;
	bh=x8NuGzFOSErHZizOdXNvwT7+7fsWsegwkvk18Atp71g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHqVXOf0wS3ePhBSwsj5DTLwcUfjZSxMBc7NRbAhNndjuiYlkjUJ9XMNZ4hQiaKFwwkN3cGhh403YE/W1kl4ckFu84jPaKg1VsCCncQYo3c+aCCLnFbhh3OfAjtTIr3hzILNhQ7B5JkGCSzLi6H0r/Cb97KYRMtCkAuhC4my/bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnfr5HV4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnfr5HV4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RKhnQn013744
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0MLzjuuVObqloiYcLgpMb9z9bl17fMINDWXVZxXoJGA=; b=hnfr5HV4p5f6kB27
	zMMPvQ+SM2fXgJPx9ZL0sfNCqCfx7/BqdpaU0WyhXFXTGSsc9Tp9QzwrxFHIOSLg
	l4Pxj5cQnjSXi5uVebfuz/hHFhKYa6i8zgVVzXxFs/1LRku4iFAEhIqgiRhC7fw5
	7cX73LATCmymNkmWK3YzkOWByW/6tMlNcOBpItRI4rGiQ3/mu/NiGXKFdlid1BbL
	3odRKH2n0X1Ai9ryDC788zNa3DMlwnhPKMF3Wm7O6J5zZhy5wA4yNngwQf2n6OAt
	fkoVVBBHke1yeBWRfvJvvSb+zgTdOyvJzLVgWYK1vPg8gka9kJo3kfzf7nwaAMUk
	Smi3Ag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691ap9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:54:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c555d4ad75so32895885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379254; x=1748984054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MLzjuuVObqloiYcLgpMb9z9bl17fMINDWXVZxXoJGA=;
        b=I7i341GV0ZvXdC5rfJqJhxPWvcW93k0cDe1cRyyP2yQkoPxLcIc/4ZH6QnxjfZZtcT
         UR0cVyL4UUgmKZbfU2Fk+O9Pl8KNRXuWxs2M6flMVCDASsH1AfzGLXYV/mujFAMCXZXj
         7+fyOFDs5k9ItykJWYeITmT0j4QvSuVhzYj/UwU76gHa0M0mIEV96V5w0464jztNsTwm
         Ty6npE8RLQllM+dx80ueiTa1aW5kBv79taLVP5PgL23GuqbVOcEgj1opUT5+tmjnELPX
         sYKTeQsKYAt4XslpYeT3GgFxOwiutOP1Un0zXWeWIWZkz0g2Vntg9rMdzfST6DtwQulr
         a7Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVWV/UdPqTVax3SdwoU+eV2CtMcIEktXECQSdlbgF4ht4Cgg47esey5ZHNG5S1wc3vweg3kM9JNDTVQxto=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPk+tROjuT/H3OAyhegTtkiXOFmNOTvFDiHyVkKeFGw2YBKe+8
	+BEDVvDWiOrPHrgdaWDqyCQha56ez5iUvB3m5VBzbM5BYVMILBEwMU1kMem/4cRGx2bEx2Whd85
	yj7lJjoBxa0mn6BuPhuFTttT6KWsMUq1CFkqU7rraXwudqadmx0+WrXXthRCAMvPALng=
X-Gm-Gg: ASbGnct/9kUV/t5UkPTcGEsTOScha3X4Q4KODrXLiobyqFj0xetIoyvb+6vo+jWLk6J
	sGdokbGnoEKpRPXxJm6THLQkS9GTTmC5BmqU0R/jv5VB9gm52zeNQT43sUl46fZV5O7MuGyfRfK
	4T6oFDsa5iBxmM31suaR0R1pUBqnPqk1jdIRnBizJ55IE0ZLEM5e0ZEwKYZIulbEVMRjnmMlJ5c
	gmcxoO4708L75naLglK/Jb6jPs7kmuGuO0rkD9aP38Q0QTMuICn0uP9v0acIg3VBmc09/+YJU8t
	SnF/o31NvB2V9zY00rFJ24uQcIJPURjXmCeGrHiTLefpMDgGbFINbpuIMzXAqZGGtA==
X-Received: by 2002:a05:620a:440d:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7ceecbdfc9cmr770966585a.2.1748379254573;
        Tue, 27 May 2025 13:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzG8DcC9twuv8rHM2dj/oNwnD60Hpxn8j63dRlP2mWIaLz8ggRGfIMDRDyo0xryvLC/8IxuA==
X-Received: by 2002:a05:620a:440d:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7ceecbdfc9cmr770964985a.2.1748379254085;
        Tue, 27 May 2025 13:54:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532edeadfdsm25975e87.80.2025.05.27.13.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 13:54:13 -0700 (PDT)
Message-ID: <9b6de058-d3a5-4cf5-b91b-0593f7e32950@oss.qualcomm.com>
Date: Tue, 27 May 2025 22:54:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Add Bluetooth support for qcs9075
 IQ-9075-EVK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_jiaymao@quicinc.com, quic_zijuhu@quicinc.com,
        quic_mohamull@quicinc.com
References: <20250526054228.221095-1-quic_chejiang@quicinc.com>
 <ecn6rv7ase2h2q3qjseunu5unftgicynvvrshd23j6ctxzd43p@bge5fhiq3cps>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ecn6rv7ase2h2q3qjseunu5unftgicynvvrshd23j6ctxzd43p@bge5fhiq3cps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=68362677 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=e1eoD7e-lMPM1RtsuzQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 20yQUG57hvkH7RoM-BfAIvgwKQ-oyqZ3
X-Proofpoint-ORIG-GUID: 20yQUG57hvkH7RoM-BfAIvgwKQ-oyqZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NiBTYWx0ZWRfX/gDYzt6hwd/A
 D9CBW4/RR9Ilasmp2dTn9gAmtwXRhRhepMni5qHOpweiJjAXo9EdR+h8UKVvU0sygvz9z9h9AmF
 AcNnTPQQSXVKHfrQbHV5i85tBe5DjXJq112Ja0yscrmLD8m1mt1YVO4THzmpMKvncL5/TpkazdE
 c9fBORUELwWubnOit3hbO7rjm0I6KCFEwbPeVyfvwiMeTDvqQQ2wGiOShIqDqDV3tQZCIjzWUL9
 7nwT0BVOWzQNvhYvTI503oB8tbiGV7I4hD5HxMNHOuILERWoUUe2mCrcBIeRMC8uCmvKdne4+U9
 FOXVkwvs1YO2tTKopwj5UTAXsjBDvQGsFizlboLvenBIye363k90xi+u4OpF3mmN9jAk+CbWti1
 eTVEia0qe4sYdIcw3yYpce5tNz69iWs4X4zD5q/b802jRPbk5N3oel4WB6Tcn//BV9CZRO/+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270176

On 5/27/25 8:15 PM, Dmitry Baryshkov wrote:
> On Mon, May 26, 2025 at 01:42:28PM +0800, Cheng Jiang wrote:
>> Add Bluetooth support for qcs9075 IQ-9075-EVK
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 42 +++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> @@ -273,6 +300,21 @@ &uart10 {
>>  	status = "okay";
>>  };
>>  
>> +&uart17 {
>> +	pinctrl-0 = <&qup_uart17_default>;
>> +	pinctrl-names = "default";
>> +	qcom,load-firmware;
>> +	qcom,xfer-mode = <1>;
>> +	status = "okay";
>> +
>> +	/* HS UART Instance */
>> +	bluetooth: bluetooth {
>> +		compatible = "qcom,wcn6855-bt";
> 
> NAK, missing PMU supplies. This wasn't tested against schema. Please
> read internal docs on sending kernel patches before sending the next
> iteration.

Moreover, the above properties depend on an unmerged GENI fw loading
series

Konrad
