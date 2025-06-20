Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4232E6125
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750439266; cv=none; b=sgwO+ACqrl1gpyq1YWaqt/DHmxI1Wwn3MQcTTGQVrIlwoyWpU4Ff0+AJDmeXEFnqyBPlFcGvnsEytAwroJt9jeSMfXkrMaYuQkym7UnRJuly+7WEkOni99YywI0psRSgWG6dHRea6Ftk8YFZswgGbuNtOlwU4bJdBzZcjsC7XTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750439266; c=relaxed/simple;
	bh=TJoa2xPImS4wAM1uUVWoOFg2ZyzLr2gFfx8eCrn+wM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a14Kns4wt1F2hCg0VhGrztKwvDlELDm/AJP/lcAlk4jKrWe/ghnDTksMTrtLwP0lNKSvrE7trI6bo1TxGZmx4Tf36YLemVDRbiEjbbARsZVeSZPmbxrDKOY1D/yhTUWXKPNZtsiEK3j9UUen3Vz/fE+L71IYg46sZD5U5Ebu7So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGFbBnwr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGFbBnwr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFUpcI028193
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKKwQ1dKYiwuL/gFRwwSIgyThK0XHURSCnVrX9k5gJg=; b=jGFbBnwrmAaYrBWh
	0xzZGscS1uyi5Kkfttcn23aT9G8l2Rm+6h0wVa2FWYAxlCSHsrN+K6+AVY9Vo3i4
	B67RczhwXtXSPBUggERRf2kSNESIGDWPQ4bN53te4EnYjnLbLzOoC2LoLrIMAQ5T
	f4zz2zR5SK2FeIj62BUGC3ly6O1DF72RH9+wbt5Cfz96BOJaHz/4AznNj7EAVMj6
	ESsiyHmo0bWm5zfZJJ7eL2W6BfwOhcPoMp9Z3p2np17DhKDPhQiaTe+rJSvcuyiq
	qiDF1RABlLwmL7Ec51bOyE2nVy1mWfhM+1oUc3C4LQnBPTSrH21iu/J7V/rVMB2c
	zdgdHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9kxaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:07:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5a9791fa9so5791311cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750439263; x=1751044063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hKKwQ1dKYiwuL/gFRwwSIgyThK0XHURSCnVrX9k5gJg=;
        b=KjNhLAEcJxyNxjGB+Kwn1Y5VAiFagQ2onFWB3g21xfFjA5RMlT0D021A/uDS1HYaT+
         0ExQ3IRBLjPHWdSo2DmYULvs6rBAVtGv/YVEUpSWk0FcFx/kYUgVfmXNuEqL1VA8p4G9
         P37zP7iLPfIBphDwABVYaWJMc0BBLMGPvQR47WMvbPUx8nUspBWzXOmKzG+TQkXM3gbG
         vxLKQyrjlkXCTXuae4nbfNRTwm+E+ka2QcvUYHSlFgblWVW2Gb6lUoi4Kc6u2HFocUEt
         zZZ+j985FFEo8do6nRyIZ6LKY6FTy9FqjxGWrhd9mvFIlgtPLyswSAKmezHb9+kpvLAK
         N4Iw==
X-Forwarded-Encrypted: i=1; AJvYcCW1Im22YPc/os/FJfUFq4/oqLJsWMeFQ19ubpebF594zBKLb06lmwgZFs4Sv604ZEB6gD8ekNXEPuGdMLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuFdVwZfebgDqIUgLXCm5wLvLci/slO57HTYAeNT6IElbsaXhR
	dusbGI/V6CKGn3f4gRN8oPzvV9UI89u6ohxpjZygd79awKFihEl123xGFBeSKQl2PtsPHOCgW/n
	9zQ/p8pRo5zkY+PgWKCdr2D9HmjqkoV/mwMICH0Kig5i2yUmHetlTWIk+KoKZajcOEVcaEXWJRs
	0=
X-Gm-Gg: ASbGncv4l7LBt1MDbGe0LgfbtSuqQwjKFsFXQDDfmj32SHlrdPfphsamWqIzcCAzbWj
	eEAawHAYsTHh1lAKJ6IGYgCwxSBISiBw3iXvU3l6BBsFbY1Nq3aYhsmfBsjAZXtv9pTbU4OF2hn
	DbAIopPj4a0axcqBA7mRusqWBGOhK6jUNX1Noq400rh0Lf5gNeBT+lcpBR4biJI4orhGYY+xJ8k
	G3+TvRKMVOuqUDtAl8qQRQHgLMfAwQ5dsH1bmTHtajl12jwGAdL+qg80tJvsv98vyAaPw1wzG0U
	SX9DyCbpbCyMiL+kk6+5qFdouJY5vKuoTnngJLRFYN4x6ynpJ1Tq1WzTt22w17eX3TZiORV6Vav
	bQ6s=
X-Received: by 2002:a05:620a:f10:b0:7d3:8e88:dc0a with SMTP id af79cd13be357-7d3f9916bfamr156998585a.11.1750439262661;
        Fri, 20 Jun 2025 10:07:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVSWLQFC0kpw0PBqz9gCS9IFs8NVF3u0lcuSEdXmZtlYNC6FTQskFyKD9xoz9LSWWobdlLxQ==
X-Received: by 2002:a05:620a:f10:b0:7d3:8e88:dc0a with SMTP id af79cd13be357-7d3f9916bfamr156996185a.11.1750439262103;
        Fri, 20 Jun 2025 10:07:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05433aa56sm188279866b.183.2025.06.20.10.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 10:07:41 -0700 (PDT)
Message-ID: <efa03e46-35c1-468e-a188-8e857ecd4b8b@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 19:07:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] power: supply: qcom_smbx: bump up the max current
To: Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-hardening@vger.kernel.org
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-7-ac5dec51b6e1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250619-smb2-smb5-support-v1-7-ac5dec51b6e1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I1IeePGjorVzi1Q1YbgcjkWiipjFuFz4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyMCBTYWx0ZWRfX3M12BG/8pYvB
 8Ys7tCey8wTNiLY2Q2Pfnhvkhr4Y7l34PaWI7T9VfrNCOS+DquvHVhNCDg+Nvyl6MjDNgUNVS9m
 V/EHPLsW6914dIuEn5S/5RKz+x6jQIInuspGfKz17RNBp30N/0nlJxcCiBjy7OHTYth6F209i5N
 qOlZrgXgIxPBRpKQ79TyP17kJDr8KRQtw00foJM4KofTtsy2PaRHbcQT7fFM96RMZp5IEtvTK/8
 /IUF0BYOg1AaSYASVJRnH3XTv6k7tD1k1gi88KhvFRnlbZyYUiaKxXxa4hxprhtQNzJa6ISSyfF
 JIuKYlqqpJpcFYIOSWY7m5xkz3LdYCVqrcpZtO0AI7z23/IVHiIaajzjhQ/l2ozzzkefSOD8S/a
 TUW0HA8bR2tfpLdNCC9pX1H8cqr4oqI9ySEihNVQ+AebTRi4iqqCvnmsCRusjYnxojsdKk7S
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68559560 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=rhSfmRiNZEirnHGn6ZAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: I1IeePGjorVzi1Q1YbgcjkWiipjFuFz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200120

On 6/19/25 4:55 PM, Casey Connolly wrote:
> I set a super conservative current limit since we lack many of the
> safety features (thermal monitoring, etc) that these drivers really
> need. However now we have a better understanding of the hardware, it's
> fine to bump this limit up a bit, devices can additionally set the max
> current via devicetree instead.
> 
> Since this is common to smb2 and smb5, move this write out of the init
> sequence and into probe proper.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/power/supply/qcom_smbx.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
> index 7fc232fa7260a7422ac12a48686cd7d396edd9a4..d1607674d291d6ef5762d35acd3330e2116f41a3 100644
> --- a/drivers/power/supply/qcom_smbx.c
> +++ b/drivers/power/supply/qcom_smbx.c
> @@ -875,16 +875,8 @@ static const struct smb_init_register smb_init_seq[] = {
>  	 */
>  	{ .addr = PRE_CHARGE_CURRENT_CFG,
>  	  .mask = PRE_CHARGE_CURRENT_SETTING_MASK,
>  	  .val = 500000 / CURRENT_SCALE_FACTOR },
> -	/*
> -	 * This overrides all of the current limit options exposed to userspace
> -	 * and prevents the device from pulling more than ~1A. This is done
> -	 * to minimise potential fire hazard risks.
> -	 */
> -	{ .addr = FAST_CHARGE_CURRENT_CFG,
> -	  .mask = FAST_CHARGE_CURRENT_SETTING_MASK,
> -	  .val = 1000000 / CURRENT_SCALE_FACTOR },
>  };
>  
>  static int smb_init_hw(struct smb_chip *chip)
>  {
> @@ -1029,8 +1021,22 @@ static int smb_probe(struct platform_device *pdev)
>  		return dev_err_probe(chip->dev, rc, "Couldn't set wake irq\n");
>  
>  	platform_set_drvdata(pdev, chip);
>  
> +	/*
> +	 * This overrides all of the other current limits and is expected
> +	 * to be used for setting limits based on temperature. We set some
> +	 * relatively safe default value while still allowing a comfortably
> +	 * fast charging rate. Once temperature monitoring is hooked up we
> +	 * would expect this to be changed dynamically based on temperature
> +	 * reporting.
> +	 */
> +	rc = regmap_write(chip->regmap, chip->base + FAST_CHARGE_CURRENT_CFG,
> +			  1950000 / CURRENT_SCALE_FACTOR);

In surprise to no one, I'm really not sure..

1A is not a bad default value if no other information at all is provided.
I'd say deferring this to DTS would be the best, so that if the programmer
knows that e.g. the batt/skin temp sensors are there, it takes an explicit
addition to allow more current

Konrad
