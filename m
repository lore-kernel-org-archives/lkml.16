Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0031221DB7
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736824; cv=none; b=sZVle5hhdNKBSUzyJSSt9ZlkGrTNrdqovBro38ZZNB3Lqt3B9tE+SwsnxFwtGDkMyycCm/IPsQP9C7jAb+YgfRk2YpY2r3o0lwLNYhGjVM/sGZEQ7rPxYy7ZWeEvHd3YLvgR5oEQHhN3UM+v+y0+pAihrl2Db7eS6VaJgKfmSms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736824; c=relaxed/simple;
	bh=AhHF+Zg9P6AUlvNG6nBBUhRwMQWQDJSBWU7BJowAgTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CH+ppDLX4ytN4knPfUmP2ZxSqgomY2TugC0DojOmQ/2/JhRpcyYm+LTw6O81myau+Z8Se4NWuzukMXs4lbnEYw4hQcGK8WlD21wCdQl2vD9JVbntJUGz3fbmD0UDGLo82gG3rDqtYHJVmkKa4iELq5aiLK4OM8CmaMTwHZaHNmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8KokouO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8KokouO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D1BZU008816
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 20:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhHF+Zg9P6AUlvNG6nBBUhRwMQWQDJSBWU7BJowAgTY=; b=b8KokouOyCVL8bxG
	KIpe85dIDDbXhz2GGZlm97ukbmHTrWJ0YxPx9qzf0bA1mmtyhl/cAdXsWWdX3O1k
	/5RqlykhyHJ/yRfbQNJ5a1pxs7Ns45ARUrw0b464PLFlYW26PyTsaI29CZOAGO8s
	Ee7KT8c2/0+VE1ytDQ5MN3ETBHiBsbxBzs+BQykGypAqzJ1dGa0TopiSOGD6I+2q
	M9U1UcT6fRWX3iIFfWJ1QfJFEzhSTnaP2DmIv0tlk6fQWZ/PJiQIUgFAGUoWBVQn
	exOmSLqMQu/UyOdDxuKqmYZ1e/M1oAOgJ0yoiHRpnIjUITCMqPC9/trR6c7oSux1
	JSTmyg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5ah5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 20:40:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e6c82716dso9666395ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736820; x=1747341620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AhHF+Zg9P6AUlvNG6nBBUhRwMQWQDJSBWU7BJowAgTY=;
        b=TnPqSP8j+2kNPJJb7q5fAP5N8e53hO1McNm9REmNVQLbz5UI7LLNlAwU1zl+QDrcH8
         k5Fo2cL4ddTlIiN1gi8FPUy+UzBoQVsT69+x1nmVTri6znP6P/6PDFptLla+lnDbsU+p
         NRneEbxmRiMHdgo5NrASXPsx5ZWgdIFWf8R1UM+9n5uEQWNYUzMvR5bL2FqwKXMMY2jP
         Rx9a6fgf+sOdi5rd2Ifddd8zFFvc4FGE3rwyzfmCs7I3pjdeqjYkLJhXVQGLhHGxmpa+
         eWaRRR9zUSOhs7nRcZuuu2+TeBOwaJ6Dh278kJqF0IHJOM3AC8N7QUMGCjqBO4Okp2t6
         +EBA==
X-Forwarded-Encrypted: i=1; AJvYcCXGBH9foc+JL1WPPuwW8VASfw9xIoR7VE146+DAsJdcuBZjVbjHzEp8yEu/tblu8j7oR+B8FuoLa4ftV44=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhylgbEf0CKpPlFyaAYcanlMRqFv7IDbV+UJ22Q8jlKI+7YL66
	55SQaTqfUaoj1P77ghm8ow+BFb+qGedzFXj5eW9JmjvICYc7ciBfpV1ZFqvLbhaJEmkmXibeX87
	gFaS0gPXKwdNqjGWNH2wz/D/DpqS8ad83WR8rchRgAt3pGm9sP76s0HFHdHfh6q8=
X-Gm-Gg: ASbGnctYyks528SkLZ8aP7QoVuCY8Jn1m8hO64tIXiJi+AwVn3NxIpxUqxKLzARTnt9
	mEWsuznswaOD9L69mz4CfaWVbQUzlZpJ7jgy80W3pFwBKx0mopPtPHm9A2SEqNdX0htXrKOCVpB
	3DQGitRppvunqacnO0efszOChmj4sIMIio6liwCTU1RJh8ryqRWl6qCuILo9qEoEbGLR0qzYXBT
	pBIIuHopwHAGu5M1nftoMer5Ap1dfkfnuDe+GmKPoKviEG6jlRkcsRLwWR72I7MMyuuRioP4jmS
	U4SFlkjGfOQVBEpLs9wZp0guayWFf6ff9EbVo+dJC8ROz6pC0oOD6zO+JwxaYpeQg9c=
X-Received: by 2002:a17:903:2307:b0:22d:e57a:27b0 with SMTP id d9443c01a7336-22e846e080dmr67100835ad.2.1746736820183;
        Thu, 08 May 2025 13:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoX0i0ze/m/yNJGb+SqmO3r1KcN2VR3l7IPxJUQFWcGhzOdj0P7XfpBMsof0CFauO/d6kk8Q==
X-Received: by 2002:a17:903:2307:b0:22d:e57a:27b0 with SMTP id d9443c01a7336-22e846e080dmr67100625ad.2.1746736819783;
        Thu, 08 May 2025 13:40:19 -0700 (PDT)
Received: from [10.71.111.209] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dc8accsm446266a91.7.2025.05.08.13.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 13:40:19 -0700 (PDT)
Message-ID: <ab93bdde-1889-429a-9235-ed4cc53b5010@oss.qualcomm.com>
Date: Thu, 8 May 2025 13:40:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] soc: qcom: socinfo: add SM8750 SoC ID
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681d16b5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=J9Vk1PX46GMNcKasQmoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: DB1B_XgwITOYSiu1iyPdb-gNulu1CbdX
X-Proofpoint-ORIG-GUID: DB1B_XgwITOYSiu1iyPdb-gNulu1CbdX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE4NCBTYWx0ZWRfXziqBKIsdU6eP
 YQmI8b6jt0dc4f54Ui5rHf+jHTu+I2zOuCTKgYMm636q1/vWK1oDTefw9LvcV42348x9ZXhGsD6
 Aau7e2W/O4qSgzLOKvVRNLN/OEi7F+OuJcWf7rTXzTVbIqaDjnzI+9M5bv2Ou8VlNJKdOmv+aPe
 m3JpCBjTtMr2OBZruZIyMkgauozEWhTqElZ4ozfAmkOTuWQBICNMcfrfVg4qbakEYjh2DfPM+zN
 5a5tWu1xtiiw7f5GavCLEu8aL3K4GkI4pLlvwaF1EInskOpf5R3lTJSRYdyl1lM8ss57oVD01IR
 ZNSRR0hyNmmKi+FrZsxgJ8/0WsGOpVO9mqmqW0kjdWNCl8kJ6ow08PysnEXaS9JxJE6SKo4DaSo
 q6yRWSyMHVgygSaHTVqm+a49AGOks/Ku1ulhytSgV4PlADvfEwDdsodoIbICDX8h7L7zi2FH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_06,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=667
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080184



On 5/8/2025 6:46 AM, Mukesh Ojha wrote:
> Update soc_id table for the Qualcomm SM8750 SoC to represent
> SM8750 machine.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>

Thanks,
Melody
