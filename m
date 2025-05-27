Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58EA215F48
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384530; cv=none; b=ikloSL1WeTMwEn4ODkwqn0NLgpIM5dZbq5lGnuCeRsfs0GOMpVgKeVOJ2NiYQT9FSxsKev252HZWhWTqenKUicn3DLTQSsFrGg7F/MDWFany0IWrLzr4cXW4ySzX9fwAfvCVN6TS5WQTs1j/1A3WutEXevA/ey62Ad7Bbotf23M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384530; c=relaxed/simple;
	bh=oWBAuylOevnG14A3o6B6U+zMilcjaHUpvqHHM3GDbSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G8huy05a2eaxBHt/cc5z28eY8+gHy7LDr/rUgKbeVAHe1IAioF2Two3jyJ7yQR7zDxZ6kwy7xkAbJC3pnERJitcpF5pLMDpvY4BoIgo4E4uifVzStQKZLK6bJ1eAqFyZ7cwYqVzpL/Sv/jizvR3pJKJi2zYQDlVag2oL52DaTMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B61rgfbF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B61rgfbF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJjcXD020171
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	co4RwX7fyamGEB9Zn9Nbjwa2/IhbSm6IfT1PpDPhJZs=; b=B61rgfbF7Hxrv/HA
	U859kjzYiEU2h8YPkR74d73ZqKG36WRePqQKoyOQZwy+gkNs63KJLy9QiHf/TE0R
	2NgKKdLreoDJGbiUtY2QaSP+49ahCE6kBVxbk1mpom15XqxMBukMKh9DVYMxr4x/
	Gz0IyJZPgho44gSsK/PDGba4rdo9Ox0GUoraT8Vtz2JQTMyBQCJhbEewMrtusbL/
	pkDpQmvai8DFSjMFh10nuKlkByF5NAEKdKf/sBdnTl0RMY/LqoXArhLOtY+pmEhO
	tW2mqZoMEBf7WmfFTfyJnwkViWv5ZWvk/pQM/shUhXpgMXKuQwy5ytp0o/LSnfdc
	R8WgoA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq8hy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:22:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6faa0435aa8so9708086d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384525; x=1748989325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=co4RwX7fyamGEB9Zn9Nbjwa2/IhbSm6IfT1PpDPhJZs=;
        b=C2DqG+LcpeiNV3hd2AMZ7cno68s3JUvxwQf8uSEaYsCdcIHL9nAKkqY3tAYVcGdKE4
         FVhmr7UbSvVh8SDdR6TR8lz0U1igkwi6goiSaoFxpYydq+4Yp0auBZqkUNAZ23mSHZdO
         mgIIQocsbhfKMJvBL+D8l6k7ajrKDeuZ0SdnOZSHxOQPed/W0IPHJIfZuy4ftT0xCwTR
         IhZnye7B3Gj0H5KQu5qqg6IunMwA60HiTUkex2RClSVHRoTWAN+K3TWYsJ8s51CTmkxu
         9wRjsiDsHt3hcgpMEYFnanFHFBvK1yt5O2ovVUV2Ac8iZkkF/u2OJZoWoTYrJD2hjqMX
         VMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxcRczeW5IKR0Z/0fwnqotCY+k2MaB5leiartYSxffw12+sJgZ0AA8NBCtMRTjMU9rt/OY2ti4kGIv3Ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRdiE9AtJUwqe5R4h08Nsu5HIbQoaP894TzBprWIS31OStiLn
	nq5Pga30v6YK43RYyXTkYzzmA5XSG0Rz9d/3didNglZ41adujyLZBL1fq4tq8fjeRpospbcavCB
	gfh3jd9PdEwsBkoTYGWKVrQD1NssrEx6tF384nEvxmB0P8e5JB7jyR+0pjNH3BdyUGdw=
X-Gm-Gg: ASbGncvqsNV3cj/T79kJlXKaL93I3JXSpVctlDlTdmMwcvVjLZikIo1rRT9vscLObhN
	rcnRyAWXva6saFf3I7b++CZFuK6vWeXnbUtWmMK7kDHJGnzlWQOT806B2naY2duxD4O1kWAItf3
	5tVnRIaV+Ct7PIfACCgfERtxwRjrivhagi9G5TObuxEJetevBHGl3fyKDN5RD8cb0wadqt5eg26
	x9tIn2MD3QDLK845Lx9RxW35w1EcXsYdgng/x5Upx19/A1UgOXYcOOwGy4vsQyyuvPOylrD+mH4
	ybIM6qbQUk/rCIyQFjuxuVWDs/02i/A/k/8/KeuCq940tNg28E0PEdS2+5oaSE02HA==
X-Received: by 2002:a05:6214:21c2:b0:6f2:c9dd:353d with SMTP id 6a1803df08f44-6fa9d2baa17mr114438566d6.10.1748384525592;
        Tue, 27 May 2025 15:22:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPdM04AdWocnf2vMjTqsH3Hq3s8MdMYiX5o9329a/ATt3+6/aInv+e1DqCUlQfmpR8ii1oeQ==
X-Received: by 2002:a05:6214:21c2:b0:6f2:c9dd:353d with SMTP id 6a1803df08f44-6fa9d2baa17mr114438206d6.10.1748384524734;
        Tue, 27 May 2025 15:22:04 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad89f225f7asm18968066b.117.2025.05.27.15.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 15:22:04 -0700 (PDT)
Message-ID: <7f464eb7-469c-4350-a43a-3b99394ad689@oss.qualcomm.com>
Date: Wed, 28 May 2025 00:22:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] phy: qcom: qmp-combo: register a typec mux to
 change the QMPPHY_MODE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <20250527-topic-4ln_dp_respin-v3-5-f9a0763ec289@oss.qualcomm.com>
 <itmvwhcf37bmnpadcyc7kdt7wx3eljyjwyv64s24zwhbr2e45g@76uzcpjqzx22>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <itmvwhcf37bmnpadcyc7kdt7wx3eljyjwyv64s24zwhbr2e45g@76uzcpjqzx22>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6sE-uPMDofe5OKU80eKPUgwBh0ekonkL
X-Proofpoint-ORIG-GUID: 6sE-uPMDofe5OKU80eKPUgwBh0ekonkL
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=68363b0e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=L9oCjnS6bectiR9KkwQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE4OSBTYWx0ZWRfX6cn4LgIcv4Ns
 EJOW/LtgP1Tt2QOTFDup54YmwjivgP622AUqXLpxgJtp/pOUaZGiPfr2QY+BHH8qxl3n+tValaE
 Nh0AhGvTiB0OdDOaavChZy+G8LfMnxMxOexG2jF+RIszdssAE41tJOdWNvvKXaGk6g6Q/tqQLnl
 I8ghCkPwzd8ulyuLkVt9Q3gDtBHfwdoq6jORtVVw1mGQ4m8Ejja9tAEHflNdTIYfTWDetLx0clt
 GaTDDYfEggoFDOKJuEjjF8VF+IRBl0xSR4WGWuSAKFU1FNthhHDcwcy0JwHmkFNQiciVtIfH5qq
 Y9tNc8aAk4DI2AVVgDfi6s46QH9IAWE2Yh5wlPkO4Y20YkHS0aYCwgdi4K/YARaCUlhjFY3STSX
 7iYHm6EGtMjyqFjXjg9XmI7kIW8Gg4ymloTMu+Qu7N3hXMg43lHhNYKBrawB1xw0KZ6r00wK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270189

On 5/27/25 11:55 PM, Dmitry Baryshkov wrote:
> On Tue, May 27, 2025 at 10:40:07PM +0200, Konrad Dybcio wrote:
>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Register a typec mux in order to change the PHY mode on the Type-C
>> mux events depending on the mode and the svid when in Altmode setup.
>>
>> The DisplayPort phy should be left enabled if is still powered on
>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>> PHY is not powered off.
>>
>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
>> will be set in between of USB-Only, Combo and DisplayPort Only so
>> this will leave enough time to the DRM DisplayPort controller to
>> turn of the DisplayPort PHY.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> [konrad: renaming, rewording, bug fixes]
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +	} else {
>> +		/* Fall back to USB3+DP mode if we're not sure it's strictly USB3-only */
> 
> Why? if the SID is not DP, then there can't be a DP stream.
> 
>> +		if (state->mode == TYPEC_MODE_USB3 || state->mode == TYPEC_STATE_USB)
>> +			new_mode = QMPPHY_MODE_USB3_ONLY;
>> +		else
>> +			new_mode = QMPPHY_MODE_USB3DP;

To be honest I don't really know.. Neil chose to do that, but I don't
think there's a strict requirement.. Should we default to 4ln-USB3?

[...]

> Consider the following scenario: connect DP dongle, use modetest to
> setup DP stream, disconnect dongle, connect USB3 device. What would be
> the actual state of the PHY? Modetest is still running, so DP stream is
> not going to be shut down from the driver.
> 
> I think we might need a generic notifier from the PHY to the user,
> telling that the PHY is going away (or just that the PHY is changing the
> state). Then it would be usable by both the DP and USB drivers to let
> them know that they should toggle the state.


If modetest won't stop running even though there was a DP unplug
(and therefore presumably a destruction of the display), I don't
think things are designed very well

Konrad
