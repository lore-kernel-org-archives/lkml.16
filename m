Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C6F247290
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755436; cv=none; b=CpAeNzWzbBeOWZ3Ns1QjGLFEIb7atWkmMt5vLnMOiJk2sCFn31pDiQ+41CYZvxfQtfXrun1cGu8ABfjVivxQOfopYaVHu/WVFrrQ7IUZa3a1U9NbWbElA9kJvWrDgd0jke28pbc2MnA7cyOy0YtZTbfHAH1b5lZVKTKNDm0rqio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755436; c=relaxed/simple;
	bh=ELBPuQq50T/PZTUbYhxSitilB0Te7fVHk6fN2KTVz+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ff+ysdDw3/ASuoSiWVfEntsmfNF50DtY2d63faDYPT3zlvVaj7iDmgDuGoJAKfbIxTNFW4Yk0pvAYsNyflJYzXsJkMf1xJY7oJ43kdMrIEoHBG9xiW2bpqUWGNLE+6acFMLPBAB6d2KKLrMBGCe6TG4B+oO3P3Y2fXXDL678d7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEhVCghx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEhVCghx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7uN8W011101
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhEAo2ohpYy+s9p58ERnvB+5oPpd7tVavgY4j/ZM8Ck=; b=cEhVCghx7L+QW5Dr
	I9grPLQylJ9mG9uNLscznPh9dAnY6EeJLSuLtnzVCuSWQCbvSnvyGbJJGWSSP1td
	dHCWQRe1R2F5Y42lY/CHooNo1LF6sZqjL9IHMroEZu7gSNUSZOAmvEM5vQ5+VUUG
	eJoj738U1E/3Uq2HLi+sLqif6pBGC3pYl7gAfQICQihMsn7k7RJgAW6LC62ClAMi
	wrSPE7HRN8XW3L32KNfG31pzuY2LoFTbbtu/DWZxqkfyjqtEeTXfVDNHhWOr0IVI
	/yARk/gZMWf6hBuE2QP4e/cJAX26xGHxnDImu+SkXp/7cdAQGnC/XSlL/n8fBIYi
	Y793nQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rbt22p5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:37:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f0c76e490cso14770246d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747755433; x=1748360233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhEAo2ohpYy+s9p58ERnvB+5oPpd7tVavgY4j/ZM8Ck=;
        b=k4zF1LbwhbcEzkGfjZmdMnvO8PpMkdB1OYikVxp7K4kTKJvqM/s565YhR2ThzCo2K2
         UiKfXhAgqn8VDIgkM7Yj7gyUqENAVDJOClYMC5E+fVXYl10UvSqwuTMFhrWY7dPECBD3
         J88r4MMLOWVye6/+NNfSo2kys6dh+vtEpWqdmNOFwXB5qxFh4BBowF4QFTgVNkCg5jdp
         Il+9/yNULXsCe9rYef8IoqjarbMdPrYFAuzuqo5xYYqlTOKdwRgVzRbnPMoFO5X+FXwj
         M/B7PHpIiDQTDe6uMZD192Q+aJpJdt8HjuopLxpIEV+HQ+X/UBJp3iWdBZRB94T3f9Hj
         bMNw==
X-Forwarded-Encrypted: i=1; AJvYcCXDNTSvEg71JZnpBcOxYhEqgGgECRkaziKYdXn0WouFkDTXTkP9VO5UJUbNeum7i4mP2jWHt/UYk3r4giA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGVSieXATqMqSl6PwXdczSrzk+G0vgE79X2KtQBU7OFkkNQTsr
	NYJtSeqDJuhQI9zYWDx5yRtwp7v82BaaAYjFWwgIfsTp9YFcOqXTU2268Y9Frx03wnmSc5AwDaN
	AkRgqoP3GNOYL5/qQLZeIti/N7fgKpUZwbzIxtfbr9N6nhOf+cYhxGI+UQDDdMsnqhbc=
X-Gm-Gg: ASbGncus3TRGmu1qSzCZBlg2qe3WVZ/Q5cDLLMEScXsd8ayqITxoSlou8i6CTkBx4zt
	dXMHCjAVzcX2Sg2crqblCsDCmqIxtEySL9hZuezv5vrmUdwHYwwvfalZ9dGRCCwKJNjlQHeCmwi
	qyXzGz2EgYuI+Q3lsanBUvWyQUhl/o116q/3jP9DEFif0AciE+JMa0yCFRCjOl/O1O+ItEDybzp
	w+cXfOIyzeJLM6zkvnoy+2p//Yc3eR2S9eZbq8A8Z4sOzM1iBSmnmALnaN/fGFfS4SH3clZZD21
	ilpR83rqzZ0kIbyLDpV0CPqdW90r6qnV2eBCDA+zDtHel2rOZ6jFJatx6A0wPlrXZQ==
X-Received: by 2002:ac8:5359:0:b0:494:b641:486d with SMTP id d75a77b69052e-494b6414bc9mr69651311cf.12.1747755432668;
        Tue, 20 May 2025 08:37:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET1f9uwcNCHTx/i/nFsTl8x+YLo02Ldn6Gbz+flNBJJyuFT6UR2fkNYRpveilNC0PD34sd+A==
X-Received: by 2002:ac8:5359:0:b0:494:b641:486d with SMTP id d75a77b69052e-494b6414bc9mr69651171cf.12.1747755432336;
        Tue, 20 May 2025 08:37:12 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d501f7asm7319908a12.19.2025.05.20.08.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 08:37:11 -0700 (PDT)
Message-ID: <1cecd74a-2711-4c29-ba39-b4cd1d4d70bb@oss.qualcomm.com>
Date: Tue, 20 May 2025 17:37:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
 <20250520062618.2765109-2-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520062618.2765109-2-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEyNyBTYWx0ZWRfX9iFwNdl/Wkha
 vcs0kCBeAeiMQLOfXg6Qwd4fOLbXw6UeScPuCTsES+QOHijWbkPdUdhymKVwKMD0PD/Wn/dPL4N
 HDZVF566IOTBLA2swBzbyswcKXgDa4NhSjqTkM2+rnMYTZjz93D6MdrSJAIifV4jBA7UrT6xVt8
 jpqMn8jO5hEFLs0zMDG8Pt6owqcONXYTjfPtLiDP1hPpRIfRQVUt47xuTH9zkBWRlzhQvuLN6Dh
 R1E5fyhnJdGdhZ4RJYGUMi+4RAMBwDMfGPCpCm+5/VDFyzEYHEEHrim8Dbd6c0p9Urp8iZZIr6C
 A6UFNArBCIsdeRgJHhcXuEhkNRw/Lz4IPX1uia2JNVp70u2Q1V1ZIrvLhmHW4fFNC+oTZfCQ+Zn
 7F6jnkEKWnicdSZQeJBZ8pxCN0Mhaccg0lM072GVJNssU+FjEylnAvE0CyxFjoSEWvCcGMJH
X-Proofpoint-GUID: 7m05fmMOgr7O5lKEAzjPMrt07RlSBNtL
X-Proofpoint-ORIG-GUID: 7m05fmMOgr7O5lKEAzjPMrt07RlSBNtL
X-Authority-Analysis: v=2.4 cv=dISmmPZb c=1 sm=1 tr=0 ts=682ca1aa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ftiIbRw9aD-W0CiJHUEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=801
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200127

On 5/20/25 8:26 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
