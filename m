Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13741ACEDA
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748240398; cv=none; b=FustckG8NBPo8/oqbU2VDp4faKSFG4s2w3+Tz5GXs0OfaRj1PyPdUGsnpzqpLBXlSYkv8shpRffYQoptOPoJkWiARP25L5CsGVHXA4FgnVl2ALANf0sATcoaCtZQWS8WiOcLFstS5pB7KOfV/7kHiyQ3KC5vAJ8tvobgX0BTA+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748240398; c=relaxed/simple;
	bh=kfKqrjxj7SWq9xEU4Nr35KADHrm9QuM4zBWdzxTlRIU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qoTx3k5Z/ylWcPu+xpqfGiAlk3LG9V/db6cxhkaaZK7pZ9yFeNAVRpiNo3DdFMOKG5oo93hpyGLK2YNrLNDiObfBbkuOSVw5iZK/3eziZpUdql6lLTAPKM5Av/YLSA0aw1L1RxiXfr4d/HrvTY+49EB3AGDXlOB8pn8r2NLHKmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhrzV4+p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhrzV4+p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNFelm005315
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrpH81vVpBiCOEXoQcJthbVv1fuikJmHn767rBuFXaY=; b=KhrzV4+pKtB3HxOM
	uoWDa0wzmqu7cl5SPPw5PVsjzh8XrbdG5x5XTEtVAdlV24GaDnE8ilHcKbmiexEc
	fuL8imxn0TGSlfLn5O7bR/0n0a2AJ0sotBii/PhKG/l/Pq5KykJb2l9shCGzaGSb
	2QP4nPYWeSatrmbDvNOrM482BcTqcVYttDrGkln+NZwMt3F9dYZp1omaAJbZnMor
	27I8g2UC1OQnRS6KBYCFCmF3Uk1IXHnJq+fJAHkimeydKkOjdw1viIyEedrOcooy
	RPtc5bXp/rgH4bY1P8tMMsDOUcnu5BtGu2sCEKlo2Qy5czoR0T4XJwCsHAfezoWL
	rdvuuw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8u4ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:19:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2706b51df9so2470417a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 23:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748240394; x=1748845194;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrpH81vVpBiCOEXoQcJthbVv1fuikJmHn767rBuFXaY=;
        b=KuBVKJH5Nh9KtERLsZLzI2HHPJfQQxir+Ld0zxcQUqrgAJrKmG0KPZBemHJFtVl1l7
         Fn3mRsnJe1EPxaaRy9vrL/m3y9kgL8WpD3EmNScgahwKjcl6wc+f+/KkX8+iN14YXM1K
         HGwhLzo/CMj6CVkof9YFBn2cTmZ8ElSoT/abrOrQZwSM4fu5QFb+wLxLTnhDVBeRCtIr
         uLRZgNSvx6/J3LQ+RrOG7ucXvzuXOXVN0xkPb6FfzTJhPDLhzXWIyTgy5bJBVd8u9Yw1
         ph4fORvGyXArJNQmYTN8nZxt59jX4nS9S59wpL0IpOKjxpSF8qPQnBTGBtETlWXYL/7J
         nYWg==
X-Forwarded-Encrypted: i=1; AJvYcCUIcrJHEEMeBvCoqsUCBFH5DK+PQc8dmWpD+zS5+CxsKfsa5hwskUbAqe94+NrLM1JwPz8tBSq4kq2sjbw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/CrfYAmfZvL+GyJyDOJy/4CF4ix6L0MUPhhIw4ycw1ad0utf/
	mDj4xMw3FgzG6MuOv9CtiH4MwSXQviFMhvz599xAlE4CW+MzS2tmLWHu8jYD4boVMIN38D82Z/B
	A8MboDn9ZupXBuSDSGljJ1WHyntALvlxM9MBlMwxU+RL64wVNSryiaSWGiFYKGRp2Deg=
X-Gm-Gg: ASbGncuvG6iojgKaoYbNmSWTVdvoxIs+KFpJP/Sc5W+pjDxfHS/2TFtRULxgRmxLWaE
	c0tZxIf6Fv65tDID7AblBTyaJ4xRapWP2lLyHC83bjR14E5nG7+al2JT2LwHiIgnEiaZeh84Wgw
	sEkecJ1QUl+1dNUOVd24zU7VOc5lf+sirPxigNEbINpjXpioBGtdRzVr+/+idX1RoNYbgEbmqr8
	S4mLgqOSnwSdjATyOFaTgt0FA7xLb6CmXyDSpxrYNteStDRehRkaUYu+qkWgw9ywVAkSmwZDVwr
	97uo3xokz2dKN6A+LOts0QMkxzlXap3nfw==
X-Received: by 2002:a05:6a21:9a01:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-2188b7186c6mr12136498637.18.1748240394039;
        Sun, 25 May 2025 23:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLnz0uckNYdWgaRUUv1Iy4mf9s2o5p3ZDDG1bu8ljveYmIuLe+S+fQSQXw8/Y/OCC+jguUEQ==
X-Received: by 2002:a05:6a21:9a01:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-2188b7186c6mr12136477637.18.1748240393663;
        Sun, 25 May 2025 23:19:53 -0700 (PDT)
Received: from [10.239.154.73] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm16407814b3a.78.2025.05.25.23.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 23:19:52 -0700 (PDT)
Message-ID: <1b1c4617-0e5b-40c8-9a66-d243b48c0977@oss.qualcomm.com>
Date: Mon, 26 May 2025 14:19:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] power: supply: qcom-battmgr: Add charge control
 support
To: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com
References: <20250523-qcom_battmgr_update-v1-0-2bb6d4e0a56e@oss.qualcomm.com>
 <20250523-qcom_battmgr_update-v1-5-2bb6d4e0a56e@oss.qualcomm.com>
 <db0e40b6-22f3-46aa-b35d-7a8729370ddf@kuruczgy.com>
Content-Language: en-US
In-Reply-To: <db0e40b6-22f3-46aa-b35d-7a8729370ddf@kuruczgy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6834080b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=t2JPyoOaPHs4AGm2U3oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: PemxB-RCGQU25s-v6ztANnJsxMSsq1Rz
X-Proofpoint-GUID: PemxB-RCGQU25s-v6ztANnJsxMSsq1Rz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA1MSBTYWx0ZWRfXzSP7WJ1JOobi
 hus5SEWwn5Sh92gZZmN1lomDa/Z145DF9ShdSelMhwyzd5B6EUmuxAwj30SGVopK11Ye7NI+kkD
 0pm/eIqwoerRz7J/4FwSKClOZFTldBLVkX8Q96vukKyCSWtTqvdt5GimRhMvozY8nCOxZ5j8ijh
 yTMINZoXIdCuLPHh5ZWSXFrh6XulIgzEoxabmthnVkrfDXY88fCROI8NmsUMZtvcMF0xsztmVd1
 YOBTSjcDbBpXHQnpsk3bdr9Cg6f45+/W2RZnGKBxu3yxYV6iRy//WEiUJaaSwI9zIr3BYaYREyF
 AySbvIQSulBuYGgW/akoirWdT+TgdCoRDAA56ox1vta9cAFINGnc1U2KS9CyqQyXP6xgSa63ZH/
 2+O/QCaL9LrskcWYMrfSV7iR892K/awvjVgsmij92SmJylXu4ngwS0Y2ok2ajeLOp8u7/kZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260051


On 5/24/2025 5:29 AM, György Kurucz wrote:
> Hi!
>
>> +static int qcom_battmgr_set_charge_control(struct qcom_battmgr 
>> *battmgr,
>> +                       u32 target_soc, u32 delta_soc)
>> +{
>> +    struct qcom_battmgr_charge_ctrl_request request = {
>> +        .hdr.owner = cpu_to_le32(PMIC_GLINK_OWNER_BATTMGR),
>> +        .hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP),
>> +        .hdr.opcode = cpu_to_le32(BATTMGR_CHG_CTRL_LIMIT_EN),
>> +        .enable = cpu_to_le32(1),
>> +        .target_soc = cpu_to_le32(target_soc),
>> +        .delta_soc = cpu_to_le32(delta_soc),
>> +    };
>> +
>> +    return qcom_battmgr_request(battmgr, &request, sizeof(request));
>> +}
>> +
>> +static int qcom_battmgr_set_charge_start_threshold(struct 
>> qcom_battmgr *battmgr, int soc)
>> +{
>> +    u32 target_soc, delta_soc;
>> +    int ret;
>> +
>> +    if (soc < CHARGE_CTRL_START_THR_MIN ||
>> +            soc > CHARGE_CTRL_START_THR_MAX) {
>> +        dev_err(battmgr->dev, "charge control start threshold exceed 
>> range: [%u - %u]\n",
>> +                CHARGE_CTRL_START_THR_MIN, CHARGE_CTRL_START_THR_MAX);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * If the new start threshold is larger than the old end threshold,
>> +     * move the end threshold one step (DELTA_SOC) after the new start
>> +     * threshold.
>> +     */
>> +    if (soc > battmgr->info.charge_ctrl_end) {
>> +        target_soc = soc + CHARGE_CTRL_DELTA_SOC;
>> +        target_soc = min_t(u32, target_soc, CHARGE_CTRL_END_THR_MAX);
>> +        delta_soc = target_soc - soc;
>> +        delta_soc = min_t(u32, delta_soc, CHARGE_CTRL_DELTA_SOC);
>> +    } else {
>> +        target_soc =  battmgr->info.charge_ctrl_end;
>> +        delta_soc = battmgr->info.charge_ctrl_end - soc;
>> +    }
>> +
>> +    mutex_lock(&battmgr->lock);
>> +    ret = qcom_battmgr_set_charge_control(battmgr, target_soc, 
>> delta_soc);
>> +    mutex_unlock(&battmgr->lock);
>> +    if (!ret) {
>> +        battmgr->info.charge_ctrl_start = soc;
>> +        battmgr->info.charge_ctrl_end = target_soc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr 
>> *battmgr, int soc)
>> +{
>> +    u32 delta_soc = CHARGE_CTRL_DELTA_SOC;
>> +    int ret;
>> +
>> +    if (soc < CHARGE_CTRL_END_THR_MIN ||
>> +            soc > CHARGE_CTRL_END_THR_MAX) {
>> +        dev_err(battmgr->dev, "charge control end threshold exceed 
>> range: [%u - %u]\n",
>> +                CHARGE_CTRL_END_THR_MIN, CHARGE_CTRL_END_THR_MAX);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (battmgr->info.charge_ctrl_start && soc > 
>> battmgr->info.charge_ctrl_start)
>> +        delta_soc = soc - battmgr->info.charge_ctrl_start;
>> +
>> +    mutex_lock(&battmgr->lock);
>> +    ret = qcom_battmgr_set_charge_control(battmgr, soc, delta_soc);
>> +    mutex_unlock(&battmgr->lock);
>> +    if (!ret) {
>> +        battmgr->info.charge_ctrl_start = soc - delta_soc;
>> +        battmgr->info.charge_ctrl_end = soc;
>> +    }
>> +
>> +    return 0;
>> +}
>
> These function names sound quite generic, but AFAIU this patch is only 
> adding charge control support for the SM8550. Is sc8280xp and x1e80100 
> also expected to be supported using the same 
> qcom_battmgr_charge_ctrl_request format?

No, sc8280xp and x1e80100 don't support it. So I didn't add the support 
for them.

These are generic functions are similar to 
"qcom_battmgr_update_charge_time" and "qcom_battmgr_update_info" which 
are only used for sc8280xp platform. Even right now charge control is 
only supported in mobile platforms starting from SM8550, however, it 
could be potentially supported in battery management firmware of any 
future platforms and the same functions could be reused.

> Thanks,
> György
