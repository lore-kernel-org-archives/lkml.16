Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F0922A80F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203347; cv=none; b=LFQGXPrYtDFWCatP4hmd+rPdAWCRGLFcHmoNB41xQ6lmpayQPoTpybk4Fc4qUHgmIWVFln0gyhWgUMk5LU8jNfp0sZSyn7lPQTjtz7fwN4r9r3ZTJVxIE7uTecj2LKFgikebAmikcgm0GNC+CDcZ0ifEACC/Jstmhxle6UpwKfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203347; c=relaxed/simple;
	bh=WYH9SiI/9OQc48EIzrGzJHbOYo13HPK+Z4Mom0Xb/vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o93+DVKbSfmxj35K0G/wj/B/cDs7i4qbJ/WS1EkeBy2R2fYlGXOz4/Mqbrz2h59LC+o7WvbPkCdhy0vyCzdL+C00Fyqi+CrDwVXOU0dVM16kGRoLVVBniQXTsk23+o6oV5kes6NPAulo1P4eyvKUtrz290h4EIfU9b2BmPpp2i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSjuoatr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSjuoatr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542EaLCj015009
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 16:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Imz1o0ryfSKDi3h4M0Ledl/IY2b0AdaI+0+ZKgPWnr4=; b=bSjuoatrtiJvtPT6
	3Y08+ukmJt2o5+tYZfIZL9UeMc0MsUD2S1smW/eLeruRjtcb9Hqp7+TOLU5qIJYc
	G1R15j45rxv/61jnJyEmRGJ2DpX0gtmzSWcZSXU8DWMeyI5mVG34PDtKliL0Qdd7
	X3d4pJs0ZnQ7NU7Q+jXx9IfOq/erg4CuYl4QtlILNTZqpYGJDZ/KvIP3AP9WUKfQ
	h+LFVMGPwSZ3+LxSKctxB5hjy+c8wDI0iD0CksxE19E0/scGrG5wULa0DWG6Lnd9
	AwJQdXt6thnLIAa1N0NtlZCGtCzwSUzADNcheVzvbAj/tWCC+sHU+gFMygjSmsQE
	Zx87dg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub0skn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 16:29:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7394772635dso1388646b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 09:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203343; x=1746808143;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Imz1o0ryfSKDi3h4M0Ledl/IY2b0AdaI+0+ZKgPWnr4=;
        b=YxyZmf7mjnbakiEtm4tKgDfRHFbX0aQI/ZcBejlFn5dvobfb9CY2DLuMWuL441hCDT
         0TkMhxmLmPKgmNg/bZiHKKyZU6OQdKTGYFUYLLTaejnvtoSpnG6mT4L6wLEFG8qzfwCU
         /ILV/gVJVuiuYDWfxb7OHeTI0dY7KXcxaIYokxP9IVjpsT3++bzA6sJeuJmRqQu3ciXu
         CQmoOa1dQSd5I62z7kRLNJ/BA0dsqDWE349Hu+lFP6Rma/w5FslaTh/IBAnfhDoBv2W8
         3bseoSajdECIjOYR3Q8P5vXaTMWGJGlK7mKFXER2FfhcLw8ujhBGTT/C0T2AVOB6y1tg
         o5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVSyzCYcp1gjUQ7cZEKiEm4KGWry0C8gV/Efi+jmEyrKynUDaLCH9e9Q/lUuJLH+eQ4RZDngcGfOUYsmlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YywpiHJUhGNqZqalQnees5aB32N3Di/Rc2577OS5XpOdzXD+2tv
	0TWV7Tzg6te2QSy4F6zJxsU0cOkCzp3rwF64XRohmMhTfbnSYy6xVeuftGhsFvO77tqsRMXOjb3
	fTt8G91Dta+5fYMb5uyNydXwN5WqSukwhOGGZtFrtrEXhnE6RIuuLR/3Y95DeSmk=
X-Gm-Gg: ASbGnct0heqSis4ray+nbqnG/d0gpD+877FdXhuYlhjxbXip430nXnDENmO0Uv/r0Rq
	6fWiU8LbK6s6zzdsRGy0uCxxsGEXNoujcgjuBCeX3slARY+L2h54AmwcJGYIxF42Uq9IiT+Q3Rl
	AF9o5lyjEiuxF64w0eV1aaypyvro7Cni/2PVIBbcimfMmpAugg0t7nABRZm0tXufarrpaZJ0l/u
	VRpbMT6aqt1kdy1xXdNmhhSBR0ya9CLtr10d3MYzZQnz1yoR/jRkZoRshl8+4+VvNPAm3/bQXio
	Q+Mh6vE8aotwN46FQ9I1KLNJTFFVJpGCkospOlLeaCIPo2vM8Kxq
X-Received: by 2002:a05:6a21:920a:b0:1f5:7c6f:6c8b with SMTP id adf61e73a8af0-20cdea52d9bmr4592367637.10.1746203343274;
        Fri, 02 May 2025 09:29:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/l3hJUPTNLXKqmeVG2ZXFmeMKkNVJ0yJoue1mM9p2VxEWSQlOwIdlLxb1RykHuv6Sn65E7Q==
X-Received: by 2002:a05:6a21:920a:b0:1f5:7c6f:6c8b with SMTP id adf61e73a8af0-20cdea52d9bmr4592347637.10.1746203342906;
        Fri, 02 May 2025 09:29:02 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbcdd0sm1844438b3a.67.2025.05.02.09.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:29:02 -0700 (PDT)
Message-ID: <68d280db-f7df-48c8-821d-f7d408c302ad@oss.qualcomm.com>
Date: Fri, 2 May 2025 21:58:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c2FM-NjgzW_NHo-Q5sL-lvbVR-VcBiNI
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6814f2d0 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=q-cXM-vEBeggpBd9xGIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: c2FM-NjgzW_NHo-Q5sL-lvbVR-VcBiNI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzMSBTYWx0ZWRfXxDvr+l23VLQd +IEHW+kGo90TOjfAjTeGEdOGmxUeEIgODrYwd22Aj9OPzNkHGk2PN/xIOj40oZUkuWeCB98oBkd sifZdhmUvx/KAFuf1LfYETg4TSX3F7DDxU6BKsO0Mwob2fWgjjzbgD3fZMta5wFYAUlIVPF8P3Y
 /bC/U4atUYyIzolr7UFd7AInjjsJ3A0VDWk3jJ3OMjlM0t2ofOW9BBWT8KhN7zkoUa6ngihGuOT 2Gttg4nY8eVkR4LT8KI76niHZ5Hfe2co4c89qecM3i1UzIYe6qBTWp/yv1tWb6iRfsjomSh7y4F fSmt4/V5+zL2fv5IADO6bUAvy3UWYYT4MgTwRwT99AcKOoxb1t2K2/cZOswHndbdC7z0G8S6tW1
 +VbqERmIbhT2tTQS/pD3cwETJ+i9eYgYtZFxIf8O96mMZyA7CdoXXZdcP5CW9d6lvqV1f2m1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020131


On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>> +					const struct qcom_wdt_match_data *data)
>> +{
>> +	struct regmap *imem;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi
>
> That way all platform specifics will live in the DT, requiring no
> hardcode-y driver changes on similar platforms


Thanks. I thought about this API but it didn't strike that I can use the 
args to fetch and match the value.

I need a suggestion here. There is a plan to extend this feature to 
other IPQ targets and also support WDIOF_POWERUNDER and WDIOF_OVERHEAT 
cause as well. For IPQ5424, all 3 cause will support and for other IPQ 
platforms, we are exploring how to integrate WDIOF_OVERHEAT. In any 
case, can I define the DT entry like below

         imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power Under 
value> <Overheat value>>;

and store these in values args[1], args[2] and args[3] respectively and 
use it for manipulation? If any of the platform doesn't support all 3, I 
can update the bindings and define the number of args as required.

Is this approach fine. Please let me know your comments.


>
> Konrad
