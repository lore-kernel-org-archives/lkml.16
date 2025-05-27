Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CB528E0F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748341431; cv=none; b=oB4KQ2GctBCbKpWXda8AnMMCaH6R040xGHiTF2+I9La1lQMuvlPYFx+rR+m9HtGzt5fltaLqsLWQOUY7L5aS4n4sQvYMlIpLdABgUa6Cu5UeRCdhRnchreGmd9JbeYv5k41xUV63OUTFXpHvJ7dfSjfZwCU76P0k9CiqrEJCKaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748341431; c=relaxed/simple;
	bh=d5oYTkyvM5Rfr5kvW2WiUShV3782Y2zCoHdD4qgRIfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lt7qno5z6MrL++X72uOHFmetUL+IpO05RBkPIaUkUamc2xjzoJF6VAOX/leU5qc1Hq446uin7LJvqJL6dw3SWY4ba6Vyc3kl4+zCQOmBR3iJWK2gerS9e76xwlJNcVAL8FpfB/nHx64NC2Eihxy+YGGPjUPcy0w5YMixl7M6kQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmj/ibiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmj/ibiF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R7jHoF029201
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s62TShu5x2yVlqUVBhpvVO8xAtnVMjqzkvJEdtCK5ak=; b=cmj/ibiFw5KtQZdD
	gY20Lv6I08SF/k1hfGHiwrgxzVoHLl18xqKsZiZxqYZI1J+LsW8B2vGFSCP5Pofy
	XccvktVt3znjzanBVh78MQlQt8WkE45RGV0vCgEr4coqdGljmJFOxzMbotC3ShtY
	yibo5Onhb7WC0z/HiRz1UVyFcPxoAs+w29DFnSB1ZQTgaFK7/ZFdpuKUqlmbeLZb
	QghGczkBzWCspFbFQJtU/tFvnxnTNcS1ZmP6zCE2SXeyz2EqFYFh421jhrLITKM1
	qXvd7oS5JBtVtOxenGkyAkYyQjMMhAEFF2dNJPVlD8WBq/s49+l2HeyE7cJpknOz
	y+B54g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992gedg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:23:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53d5f85c9so99468885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748341420; x=1748946220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s62TShu5x2yVlqUVBhpvVO8xAtnVMjqzkvJEdtCK5ak=;
        b=EtiHNIdaxecQwtzfIGE3TtfCXM9PuwUKzUlKPECN/Haawoo8AKO/sPkWEcHEVl6Z6D
         EnYiDl6mdEu8pLs7/TSecFtFjYd8HKbr+hIcSw0aTv8dxcW8a6MV5oJUzrNURyyVJuSw
         Om5oCUrGKlVCFT+lsI2ZhYXiHo4eMSsLqG5ER6mEDg8bNraNXnJLhZyVpC04VsMkG+XY
         t8C3ncmQYYRhrZ70mKw2pBdVhkbBabh3E1hxORtnuHhS6sJOf/Crenf9/+6hf6gY2ual
         PwGAcsOXBrGPQVVafgF2Wb0DLwZvs3LxG93fKkX3VT7hs1suvv5/9IcJgN5SQBzILyG1
         zmGw==
X-Forwarded-Encrypted: i=1; AJvYcCWWmf3hKKtGMODlDCdSNOvHYYb3fmBdNOH9ntf3bF3MeGr8+5l1HP0Cs2bbPeBeDmHuhwoBFFEV8lGG748=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIoYQN8w9b03qGtxhjK59AKGTHDN2YabUqarrQDZ9cyT4UQgGI
	Zp9YxpA9nzSJ95JC0wMCDZTJNW+7HA1laJWK+jHTFp3KYuPVkIB6ZYptTtzVDfvGyOggCEi+er7
	CnlkD8xLBu0uvoeRNxjEhSgVUKbNo0UJKMjxbRwYYhM98MeCCgIX/Sm6a5CXTEuplylo=
X-Gm-Gg: ASbGnct4hBQur5I+GOje+lSzN048/kCjOAlB7W4BvHK386y34hpbjCjdyWHcWm8XYpz
	ADKkAYHzv0lAAT+WSmPKMIuekiPt2bV9KGof4PrvQ/9z6Wp565Ca0UFWUNcdgt03d3OQt3KtJtq
	ZUwvswGHBxNeCxSsx/v1HJGii/XoeZXNwlbvB9YvGuKEvaLcVXDjT863ErD4eHOfkLwVWMZhIJ7
	Bs6BXjaLmmc9qDkzwUB+EhwjO4gyi5wMx9FaQk6C6Z9I2VXmETWHy5JEoumCFpQ8c5Hn/vZAq6v
	rNIRZqwVs3rFrFZ8WT+MUmfA/TCrgWhs48zgp9mjpfiDrEzr3TgJhuEae0t+bSnJYg==
X-Received: by 2002:ac8:5710:0:b0:48a:80e5:72bb with SMTP id d75a77b69052e-49f46055e2cmr72004491cf.2.1748341420352;
        Tue, 27 May 2025 03:23:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbnFf4IFSyFhIacoOMoDM+QdVT9dgMuaWvHP1dR9WzcAFqNAZ0pAaEKt+/hMSM5QRmaJ4iKw==
X-Received: by 2002:ac8:5710:0:b0:48a:80e5:72bb with SMTP id d75a77b69052e-49f46055e2cmr72004311cf.2.1748341419928;
        Tue, 27 May 2025 03:23:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6045a890427sm4231193a12.49.2025.05.27.03.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:23:39 -0700 (PDT)
Message-ID: <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:23:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the
 camera block
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4NSBTYWx0ZWRfX/3p7vdraO9Ix
 +W1CfScsZqLJcTNJE8uF/FyKL8bk7O2Jz9jjjCh04JE6h2921oVpzhS1CqVO17rXUrgMaF9Acwh
 jYgnY4nSqE4Lh+ipEv1f2B82R57XPp/zGNo4O5IjFSEK0yX16kSruQ2llsBe9JsCNovER+KSBdu
 nhZuMcfSNuyibVxgxez0wYVJz0oqWKDS3s35e9BY0X8dEky1K7+AKrgJpGBy9YoViKW56d+93Ye
 4ey6Wjar4uGwyFZgnszKkUWrynkuD/7tB46DgxUxIPYFchGyFOJwR4YbLOP2smI6N6mzllGvN8L
 eIEQ7/12OGwh4h50Q2RhERqz9k/pivnyxs0s7oEv2rnxEISm5NigptD/uEfBM4hMs5TFDL5ghDW
 xBc289udlp3GEncXo3g7M/EiL0Pkco0q36qpEjvcI1DFOoGgWXO93KJ5Ahoqp2uaX2rz9lEw
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683592b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=vltdqEpKQTMQQ8pm6BgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LgDqAxpU9Pq0kO8t1x2TxSpGnitrpGsi
X-Proofpoint-ORIG-GUID: LgDqAxpU9Pq0kO8t1x2TxSpGnitrpGsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=514 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270085

On 5/27/25 3:52 AM, Jie Gan wrote:
> Disable the CTI device of the camera block to prevent potential NoC errors
> during AMBA bus device matching.
> 
> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
> through a mailbox. However, the camera block resides outside the AP domain,
> meaning its QDSS clock cannot be controlled via aoss_qmp.

Which clock drives it then?

Konrad
