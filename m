Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D9C20C469
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999085; cv=none; b=c5gkNCP/ortMRlBHgI3C8aL+VHV4q+zG6mpw3F6mjEnCNmLhMMxsHmMR4lEMqbPyyODb32QtrbSOTSpJcmz3t1RPYQEE6AoiHHlRq01qS4LAF5lGXfYHqmDujVRDws7r5nHDnd6PT7D85KQ/QyMYpg35J7AytrBVlQp7SSD9jUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999085; c=relaxed/simple;
	bh=A42gFtPb7FTzSMPg+Q5mJePTmhVsYlKhNbcc6egkFiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLgF1Y1GbOyhqOYPYpHOn+j1RcI4xSwslp8dP2HI75xq53LHKfN8I0O8rcNBnocaln/sH2dODy73oqajWdPzVDRKqQcHv6MiR16nldXIZp0dUEBni5ToguNaQTSlp3DlxQmZIWX0k2xSJvN4Vq6q3nw53hb7cS6d0yjJIwbIQek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1TN7jJa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1TN7jJa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLb65g001708
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msfsOgppW2HKZWbTRUlHuCGDYI0vZuab6NikVOg4XAw=; b=O1TN7jJa+OgDF4m7
	/RlyxbmkhA6eLCwMUfJMbk1kUE52pcCEmy0VMKDQ2Do2R0aACW/Pm8HgUePITibD
	cbM5iotqrbNQlUCa1ipUhi1p3K6aHo5ezf4YP5+XqDlQqhlVOpxTnLr1U87y6I70
	trQaF5D3Uz63pO3Y+pKYRSO2V64pHJ8pgPbBs+VltRUq0H020ZXRwsj9ENSNTTtJ
	nATXac0HxglKOMjcOyu6ti79T8BAuGZDbOTn9xAEjSyhn/djGJ5nttXw4k8fPouV
	BquUHHJR12Xs849zV3GuKOF7RtyyU3SME8511VY5DfHIfxnKa7BjgzmBiR1CWSr5
	z6Y6ew==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u298ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:44:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476695e930bso13172981cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745999082; x=1746603882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msfsOgppW2HKZWbTRUlHuCGDYI0vZuab6NikVOg4XAw=;
        b=QQ2HJsFvV9fwt4OVJ4wzibZCR6JS1X5jprRyWJkqBYXfkttapD6foilc0MZ2wOZ7fr
         HKNI6TGtY99sc9CBwq+qEeiPQULGmXkxd0B/vg70gukZmKEnDMhsOjVQd2dlFXviCHpR
         BwEH1U+E8GkAIJr6XTdcpzWaqAECIhWDBsCLfR8Pnrff2GoHiRNTIM9N14fvmTMoBzZ9
         fLiK9NH8/RnLMtz71PUrGbXiUu6w1QBQsQR8yxh2ncshTxC+s/7P/EiLp+xhPn6kHo1W
         P2HQPZOmd8BfVZyAjtu4z7ciTGRzFsGjYWQO12/3yvcQJjT+jL8bOb6ZdBdwKu+Nnq7p
         ebsg==
X-Forwarded-Encrypted: i=1; AJvYcCXllLdIHtLL8f4wSigaqBepxKgKOJmCAacWaX+Ywkudq6gdSO/rwflp0UkYNHZgB69X6PTWh5eaAS+O5j4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDtqdk4ATIzfWy2Aj6K1k6Po9u4ga0XqomKLpLdjWgIfwKan3R
	8gg95iaAoWhupVEusDer57k3ECLCUXEJVg8p3V4ktVSWCSsUDNq/46Fjfvy7KVAplgH8JZ7benL
	tTUCnwDhAXPduZ9QxuMP2I0g1VWouN2FADcKMV+IpGTcaEdrwPCSzwu937VAfrFI=
X-Gm-Gg: ASbGncu1FnFkNAGMrviOiVCZj52GW46TFHf0N5MLkcUKIYPYXJFhYmemTHdO+oopGcy
	IemgrPFOZYHb2ufmrhI5+lnQq69expxlyIoIpuUmfS92XtetqR3d6uO3yMrbxU0Q+rhM91tM4Mp
	674nDPFlLz0fEfJZoO4oNotS8T1DUUDxzjZOrkm9ovqWCn8t1C6mfwqKKTBO1AhJspi4jh4CCDT
	IeH9BIdDPkCxNANvKf05JtbV3V+x7dCCXwrm045nqoNvTqeL18GNm2TBDOr5Ag/MATKlsRZtgfj
	WO8HcTKYVtmJZENuRL4BeC4Epfgi9kiFzCjaurVUA0Gf8qDqOvAa7gLejhuwX2ej/ls=
X-Received: by 2002:a05:622a:553:b0:472:2122:5a37 with SMTP id d75a77b69052e-489e4895c0fmr10092781cf.4.1745999082370;
        Wed, 30 Apr 2025 00:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo1dYIeJcz0jJ7vcVbcJqQIkLiiqS+23dAXyaATFUK1XcfVJdGVclBCqOfMpVFlYmhdkBuQQ==
X-Received: by 2002:a05:622a:553:b0:472:2122:5a37 with SMTP id d75a77b69052e-489e4895c0fmr10092651cf.4.1745999082027;
        Wed, 30 Apr 2025 00:44:42 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm8387284a12.22.2025.04.30.00.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 00:44:40 -0700 (PDT)
Message-ID: <033b67e2-5d48-4992-87bf-97665228f4d3@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 09:44:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs8300: Add cpufreq scaling node
To: Imran Shaik <quic_imrashai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das
 <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250430-qcs8300-cpufreq-scaling-v2-1-ee41566b8c56@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250430-qcs8300-cpufreq-scaling-v2-1-ee41566b8c56@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7G7wKGdqQZkS_I1v12KIdrPhsMUUgyyl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA1MyBTYWx0ZWRfX9F43xuGLJztQ bWq2lc+gQj6KXPSbWWX9ZUavLElhahyC2ZM5KJWN0jhHxiyoKSmoZotjA3FO/uMZzcaQJoUjCdK CXvmBNlA3sR70mtGt9iGSgiEJ0+eSW/AVKWjd8dA4YxNZK2zW+QJf/wSausGkuHBdHzBU2DyO3T
 zfoYgpzCnpwSpS3dyctvO1EdqALlTB8VzeLemmh2Q5EX92ehzjCX6nD1VGZgYVfu/6AdSdy66n0 BqBgpDdEUhJHiPlBJ8k++htbd3VyrAGYMTczRJ3QezvpZPAik8smWsSqiKArJsE/oeQP7QuIYET wTI8LPBSqpSAOJL3gDtdmBQyjUWhoJkb1Rszi5wW95/gzrWeSM7XiH8N+QjD1U5Plq2eIuWhWzi
 9CBAJxAk4EToneAwdH0uoccD03MM/aZTjNRH6GFaWtkU1JJ7iVZ8uPvblLEZXGj1UoNZZYNh
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6811d4eb cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=PtKZ9L8PhvXPVooKrVQA:9 a=QEXdDO2ut3YA:10
 a=4E5sS38rZpMA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7G7wKGdqQZkS_I1v12KIdrPhsMUUgyyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=781 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300053

On 4/30/25 6:59 AM, Imran Shaik wrote:
> Add cpufreq-hw node to support cpufreq scaling on QCS8300.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
