Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788112E611A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438879; cv=none; b=ttpaOfDOb+Ewx1MvUHszaPYSIRmr7JFYOAS+idkUTf9mjv+ZGarwYPqfm4opgK3Od+RxcHvp7OgAdIkL8jtTBfGkXkFpH/iwQztLKFh4Nyb+5Qs0mForUjTCUJ9kWZFYSf7hyioWceaGiUuqNKB4OexLpPvm6zNqhNQNDfz1RwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438879; c=relaxed/simple;
	bh=XAukmnt5QjBdMQI+xuahj+iBwVBMbadMcYelH+EV8+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfwvpnFr57XoR6SWoGDwkNjE/cEhauq5y7JP4rBlXl35yAb1K4ur5z7Gv0/RShdBYun1RV+vSV5ZEuQ3oXDnl5n6HYJZDhrd9oLfKGJLfltA2hBhcmzNqUBOxfIyOsyGxa7d4K/Rba+EsC9GVIvoRQ4sCFZV28NMiXICnBtfkKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXIuSAl6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXIuSAl6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGVAlb029044
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fpu0l6974H5V385jR1/L6yeOq9JUIfEhJX1r1r81aaM=; b=LXIuSAl6/qDRZB8x
	Rou07E5KSwJ2siNkOf3nRzeATHpXzlQBkuSyYIHUDMWKbO/ceb1UGe8aeHw1tRuV
	+ALWNpKymXnEnJc8yCtBdXL71yc4l/lHODXnx99U3EOQAd/yeavU40JDasmldLF1
	bM3fUiy0kAAIffnJB+O1IZn4sWUH3LQ1XxgIdenwpQ9ryYTqloVOQPrBr8MNlpfY
	X11lR/oJ87wYWKTBtLQIs5+QdYm8dYMDDSKWxDJQMk7VSYu1TdVoOC3rv0YG6Ih5
	7NR0cEOC7gKJL+/PCCh+FSb07j0Fcdsv9kOuohxSs25CEBa75BaBeWCJSDo4lTYM
	K97zFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47db82g22n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:01:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d094e04aa4so58755385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750438876; x=1751043676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fpu0l6974H5V385jR1/L6yeOq9JUIfEhJX1r1r81aaM=;
        b=AAB8TXHUOyxI1PY+NDEQ81gtfT76WkOjUewWeDR5nkt+TgCr+1pDD8A3KQggP0RiaC
         KP2KvyyRn7pzKC9TTWUjDdHahY1a6sYtfbuOjNUlOnGbXUfD2ud0QL7wYy90VRlJ/5mq
         nGR9DnXElF22kSegphyqAcrv2onvihb7wx7rDW0I9hMK11z86dfUzFVo5rn9YiokZrgw
         5DuoDiALRyx/GNa2kQQI4PYPIsWXfDMJZFkXARh5aU0nR6p7HO/wLtrxPD+lAo7A789A
         2IP6qkt03t+XsrHYvhXpKn76/lLuYNxgBAP26SKRL6M4MX9ipMxGSHMYY6haeyX6Ch8Q
         ULIA==
X-Forwarded-Encrypted: i=1; AJvYcCWNclnExkhWWS99qEkKdLsP561fUpBAP0Y9ZUm8HWnjv79SAs/cQbr9xA0wXcZuVLsT53edsVGH42RyEeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR6pOl9/chk9dXhLrZFNhKxzXtFbq8EtUeM8/4iXRpPUZpi8n6
	6+sNnsNcxdGDBTJ9U6PNFtOsv6LSU0xEkQsNRAh0aAtlI+bRGyWAZCi6sxujm76P36BLrUcQP0Q
	HNL481B/SJ/S67Wzw6KU6PU7SSZOFMOV3cgmCWhJbWAIIGRAWBxc6ixh+/LIXj5g2URc=
X-Gm-Gg: ASbGncst1Krf4NklXuyftG79YQvgl2tPQOSkU3+TgxXRl1vArv+TjW9g7X8r3TUbeI8
	UNjt0zsZX7QkA7/txSNcBBOyxFnZsv/YVei05XhYC4GOXmKbi2q/RTY0o3SkDmJbdjN4OYZrAnt
	MVK9KwolLv1tW4L+0iKOEvSQP7phJ+CpaLXGQceKnY/HcPdn7Ay++1ilGmXJdUpDQp6Fl0fZh/+
	i7w7Zq1K7uFwO2wozfEGVSa90Y+ViGyCZ09Zlb6y8l4sF4h1oDCC93SEm3pI71wbi1LIAdDQZkH
	/COW62TF+QqJm2Y8fCWhNb6XTWzEpJWd8GNUEHpXH5K5ZhVPx87A3BnuRqWpl/5c0E8ZEB0ovW9
	bUXU=
X-Received: by 2002:a05:620a:1707:b0:7d3:c69d:ed69 with SMTP id af79cd13be357-7d3f98ec727mr193722185a.6.1750438875916;
        Fri, 20 Jun 2025 10:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG16STpHVdEHhYbxIqd3DOFgM6T+wJ9+inbvmdt4Ws0DP1ihUKEnE1P7W/LjHT61a5uRN3b1w==
X-Received: by 2002:a05:620a:1707:b0:7d3:c69d:ed69 with SMTP id af79cd13be357-7d3f98ec727mr193718585a.6.1750438875323;
        Fri, 20 Jun 2025 10:01:15 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a185797bbsm1647747a12.35.2025.06.20.10.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 10:00:46 -0700 (PDT)
Message-ID: <2d3ff07d-1cd8-4eb6-8b3b-2d0d6f64445f@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 19:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] power: supply: qcom_smbx: program aicl rerun time
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
 <20250619-smb2-smb5-support-v1-11-ac5dec51b6e1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250619-smb2-smb5-support-v1-11-ac5dec51b6e1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eanhK0u7RXMSZYuPiabtq5yuZpT7AvHf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyMCBTYWx0ZWRfX2dIESbFFSfvH
 RK2RrhEheDiy3nrO7Dd7EwswztjIfHuMVG2vjmxxn3B/x+3FT46h0GpsyBI+gHPOCyH2XFZjg30
 F9Be9Vvyw/0XOZqvFBGrDUd0qduluLHvVhsJ8iTzD7BfpnM0WlzRBkJB4h7Aw61ephBAfHpz4wP
 XZ20WpQIMC7WKqI2U5dXg8ORm6koFo0gzx/uIjApiKMjLQapgUWsVXZfTR37xTa2cJu2bzxQPUq
 dQStJ9l/O7LgXYnCAlmmPoAZjdI2V1NsS3XwSaVxbeG/Eat9+rDpriKJeH4Le4L5iJzPATbjI9i
 jvhCEOHS0u6dDLKELqpabWc8ZqX0P5qBZpItKfMLVcgVOBjbKdofHdcMGxOPJUCshvCDyhDjFiH
 l6h9RWnHt4WNij34EpCH3RlX0j45H9FwgX+eH7orrpQzM35xHpyF982ufPctxkguoAJ2syKN
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=685593dd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=tPfAkDRKdS00ijgZXEcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eanhK0u7RXMSZYuPiabtq5yuZpT7AvHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200120

On 6/19/25 4:55 PM, Casey Connolly wrote:
> We don't know what the bootloader programmed here, but we want to have a
> consistent value. Program the automatic input current limit detection to
> re-run every 3 seconds. This seems to be necessary at least for smb5.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/power/supply/qcom_smbx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
> index d902f3f43548191d3d0310ce90e699918ed0f16f..b723dba5b86daefb238ee6aae19b1b7e5236fce3 100644
> --- a/drivers/power/supply/qcom_smbx.c
> +++ b/drivers/power/supply/qcom_smbx.c
> @@ -1091,8 +1091,14 @@ static int smb_probe(struct platform_device *pdev)
>  	if (rc < 0)
>  		return dev_err_probe(chip->dev, rc,
>  				     "Couldn't write fast charge current cfg");
>  
> +	rc = regmap_write_bits(chip->regmap, chip->base + AICL_RERUN_TIME_CFG,
> +			       AICL_RERUN_TIME_MASK, AIC_RERUN_TIME_3_SECS);

FWIW a random downstream clone I have sets 0x01 which is claimed to
mean "every 12s" instead

Konrad
