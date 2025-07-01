Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A5326FDBD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365707; cv=none; b=MQJBcmH3KFv19M27Vv5wJSFwBt8pKYl/bjgL+c/fAOG/yvAuqNKMtwZ1fMBHGYR1wcK0+4kuxvkgKxtg23zB0MzpgFJj3cb36qcKxRVA4cSBIMYhYWzhCTg2g8zLtsl8eb8nKvKfJKpD/WiMQCR0SF+h1QyCV1QEt1yXLpgQbNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365707; c=relaxed/simple;
	bh=f2XWGKiM7b+TGOOPspJgljAJ4yzKonLygpgJj4Akdnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6/GhENGSJ3zjTMOTJNvmh6QSZ376F1OCdf8G0vGrkUddl92Qt26TwRCLVcZaMo4pRiz/3wZ1iftbSXDFFV16luoxYfRTCkLu3XnPmBhRi8aqm3HvhAsMd2LFNPu5pKsfjDAAmkVreSbMXhDe6cFdbjxUU6SXmm7C0953vU5Q5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gg9ow7Fv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gg9ow7Fv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A0U3H024794
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 10:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahl3B/k08YR6OfktkmU35JzJSNtv/TiPDQMy/Jz+Kco=; b=gg9ow7FvvFziifqu
	Rxc4zZKMeityJWr+ycQEwY/rRlAsUdikMsURW7fiiVy7U0K32hrLkhQ9ggIxWEVL
	s72oZQeaEN577VLQbERnu44izeC8fAlq9fckpeXuPd9hTREVjscl9CDN1N5QVcA6
	FWwVzNz5Kjg90tavHzHyu3R1Xkxun9D4j9EhvLTD4KckXIihBSzORkgpm5B9n5dI
	guZ+sH+W/qtsdYWfBxqagwCGMlyFRk9gu1RhwTXc+DMHFIoxZF2EdhBzkiZVMMkA
	G3RLwRauPDVNaevq8EWuqYzBjmOn+YYd33qTAQXWaQBS/HAMeZtoLyZPlcUkGcgk
	/FWSBw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9gdnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:28:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-702ad4ec207so162496d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365704; x=1751970504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahl3B/k08YR6OfktkmU35JzJSNtv/TiPDQMy/Jz+Kco=;
        b=TXvJvG39hQNgF9HfnDaQhXWIKMU1/rT3WKoWflJxBcInugfSHIax+qhAMmfQyJi6hS
         HhUI5Kk3S81XQo42HIQ819kh60p5N24sxtIt5fVUZOtIitr3cY4p34l0XKsSjEq1nCAL
         NmEyX/2Hi9v0/Xf9Q2Eh558HqLuJR9aa0xZyYaTvC22nAVwu84mttf1VuDnz8PnxJOi9
         Z3RfuOdm3dvNBWje3Ske+66QsM6kE5To0Ym5xcuIM+WaerLA3fPrJEG7HIZ4sb0PXn5e
         NNwn3KJBP2xMokLvFBgK0JMCvrmUu0W9COxifZnpwSPkU+OJ5gLL5birsYVYtKzPG7fz
         10vA==
X-Forwarded-Encrypted: i=1; AJvYcCWT7WX9PrzxhMdMc6a5UsPvlOcbspDcc9l6EhZmHw/xry4gMBOt8zHnprFhPakm4dg7soNjKbJqpBqDWPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14TkGfYeWl3+h4tqkJwDrmLjorp+1xzDP6lEwXfSK4cpn72pS
	rdFQ/3/IMtgH03G22Exre/L2cUfxBfvO/sBwlcNXpPAfcT2215gl2jg0cNH//Q8+Nk/k8DBRohx
	7xV0Smx6kTvonE9O9yT8+8Sv/nw0R76rliw81VrFs6JPlFgmdvBcieRDOcT4gl/bcGGE=
X-Gm-Gg: ASbGncsKDRdMBmXgoXOPUwNxVkMQvL0FtIMqaJW9+I/bBRE44fF5V7MkNE8XD3IvKSq
	dkacswkxr1O+lezc5mYkbuSI1YcluAoib0d0MdvxfLyrD1Z1gy5GV5jBpyPK1mGvfa9R/PqepfM
	f3CuE1UTd3r6GY+koRXBghy4ml+HKT2WVe6zRQO6I9pWHNmx1hUvk6dF8JvcIBY54FBo8qmTrkW
	QlxngpLxL+So8n0eC/mGrM8AA4yJw/PIjUYJfEmW02vPhhUbiAUhnER6EjitDWC9oUPH65oJuXg
	dckDh9zFPW/U4r42QBLYidifLY4aop4CQ4AYX4IGo6rD+9IkgH1X/kXfw29jfPGFmkqS7bKTGsU
	+tphyslmh
X-Received: by 2002:a05:6214:1cc3:b0:6fa:ed8e:372c with SMTP id 6a1803df08f44-7010bc9deb3mr13521706d6.1.1751365703529;
        Tue, 01 Jul 2025 03:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0w75dWyDaxWtTa/al20E0z24mhzbw2+kJ2JCM/1dBoXrMVhR6R9EFXx+tAfk5goL1sGyTXQ==
X-Received: by 2002:a05:6214:1cc3:b0:6fa:ed8e:372c with SMTP id 6a1803df08f44-7010bc9deb3mr13521546d6.1.1751365702986;
        Tue, 01 Jul 2025 03:28:22 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb60fsm7327077a12.3.2025.07.01.03.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:28:22 -0700 (PDT)
Message-ID: <c0fa0222-6d45-42e2-8dfd-8160cf0cceb6@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 12:28:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574-rdp433: remove unused
 'sdc-default-state'
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250701-rdp433-remove-sdc-state-v1-1-ca0f156a42d5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701-rdp433-remove-sdc-state-v1-1-ca0f156a42d5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6863b848 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=usr-Xeseo6RQML_XfW0A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: PPPUL8X14yjjdFqUTgKC58Fpu5BNvNjv
X-Proofpoint-GUID: PPPUL8X14yjjdFqUTgKC58Fpu5BNvNjv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MyBTYWx0ZWRfX5Lq9tUMsKddE
 EXZ+dhbh9DQEI04EZ5hBb42drVOCJKO6m80Ixm9jkZJwug8KFlc6ih9qA7ofjGIt2PrqYVnQK6L
 lPUxgBoTcUnddMCdKKb7NAoXL3mr1awodc/1oHZRY2/6VyfZxpA02ulyynkQtvQVBlvblWtAoh8
 B59eKjUi9iLSKia02ihvL4NzSAQczSEzI+I5u6gCpYWNB5b+sYig1MfP3EvZenG+jn7aJDRFk4h
 AFZ1Pzgej+NvnSTpdA2kpOD/uheVdAWUJrC2Sgyx/fj/gjMkgoZPlJHEQAi/K8vmu/1haVv1gPp
 DDbbUwuS/2CKn08+AWWF16lpiaAlLYGswUslIHdfDGp52dL8GbQVMYg93llB3qn7hEaTLtZYrL2
 5/eal/napeHwBHZpy+r+IV1o+ZEcaEyP0NqJDOLLfufzvCZDQt1Mk0iKyePkcrTTGqvylFBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=870
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010063



On 01-Jul-25 12:10, Gabor Juhos wrote:
> Since commit 8140d10568a8 ("arm64: dts: qcom: ipq9574: Remove eMMC node"),
> the 'sdc-default-state' pinctrl state is not used so remove that.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
