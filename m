Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A6B22617F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745625215; cv=none; b=V4Cayx+j/AYA2NLJ7gfAsHUNpAxkdoJRgE0zz8q8idmLrlqkAiqH7J7tywTLUJ8cwvGL1eDDcylQeoX0lB8VH63zcIU3jZ1VxKfcNOBWu4qGim8rlktsgjrN04CKe5V7sMYscHkbkiNLQvHLLbK4lnaT8kykOBd/vuWJrl/KlLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745625215; c=relaxed/simple;
	bh=eBXewnsOKI4K4+//+oxVyZ1X3o73mEYw593zS5ahIgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5ETNKyljUO07zgfLE1C03+d6BrWL9fbIGWhV7M0/FIHgZRgFsCgeWzR8+utB7DzKbUK+l3ALpvgnfmIKjY8UGEq3iFDeTDl1bCB1EksrAg1icPfkZplfei7ILMxpZ74T2FnSZcSzDXd8xCY+8dpJvCHp4uZ4kwAdS5UE52L3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcPLe8IL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcPLe8IL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrCB011053
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5JA/JRfkegEoA/bNjXfpbssKcj7RMaw9LRjevAHWTRE=; b=AcPLe8ILiwex50wo
	5igqbBQ9kZkehFOIXo4NTwUfw/Zif28WCmV+dZo6ONofXeOGlyvv33595j+Y96+g
	eNBcXMT07+AKuOl9e+EbewVSCmrHA2hogxiYvvNoylfvAdKr5p3NQ4i/psN/b5Km
	4ZBgTxDHd3sK5EC+xDsom+rw6VQ+exJzich8BczmQhIcAeBVWN7k7+H41lfEPctp
	UjHvuSs1ozj9i1V1QxCh15Bn+YujtyPYduiPFF4uUZmQw5ZAz2wHPPKqo/itx8Ro
	SgKlB2zumOS5VN6Lsb0dtHieh8BRE3Z+b5AbT2JLKJneVG4d6U1ihLkJkbbjwDP8
	fUARow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jq7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:53:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-227ea16b03dso42236085ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745625212; x=1746230012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JA/JRfkegEoA/bNjXfpbssKcj7RMaw9LRjevAHWTRE=;
        b=Jg6HI0IJoaDBpFUhpajQ5ynqa7hLff8r1Rv/sLDTSBnUd1ZgjT2PEA7+hLqqRAM6gw
         P6KwGX6P3OZPzDuKU6q4ilDwvp7vGTtLWVHazdydaRtKIZPMuHVl99h+HBMPDjnBIGge
         737Gg2mo3uY8Fdgk4TZrCF8VE1/t2GznTfXCuQKthoYoKjp+CzSinI2qArHKrbdhVel+
         9N/gOf7WYnQ8PakGGa633FHXy2AAi4x7QK3SflKCQqvhlVD9AgRlH/S3XR057JHk1XKa
         EeaBXiUA0fCeutKmQR9jHYGPbauI+XcjA2M4SND47TU9MnwQPX0dq6obSRBoEhKTkbiM
         c83Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOA/TniYWCJd0iSRQ05wxUiFRSuWrwN5sKbPylX/T4JvXHahpRsHqy8kchCz7/Ovk2T75AbpRZjR3R/AI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo/ArfO3jgjIOVVLDm03KyRkHANhfQJOSw6w9gGLpqrhqOsPps
	jZ3IrjAsoPCLbcWvMQTVVwFNea6chYrvPKHVXJEKJlThFDlKODOcz3/BHQ1vsWgRIaxkA+RSZL6
	IIKAzDlsb5TA92lveomZrXCRZCtzWNNb+c0dhBx+tmFQYSf/0ww/KlN7/QGVxt5E=
X-Gm-Gg: ASbGncsLXfLZ30Ab3gNMFmdWkgMi0aX2/xyY5oHGpsKHVNxNZojF8gapWnZiuBSfbWH
	3si+/1dI6sTlh0D8a/muTcfL/9S2kVc6HC83fn1a+iNsHwOUdDS/RTmR5LFEMUM3WoETh/T574o
	OK8H3QNyN9cwega/982SWSp1rB3OR+qchnHLA+gkbN1QIVmRDr6jBlQ1rTdGFFe9YNUZkjGwT/F
	cCKuyxp2cvMHr/QJmj0UN9Pf9OkJwMUr/pVCk0cGaLz+hzNhggC6KPN64A7WvSHAGpVPLmBHcEw
	qb8KtCaulSGwsZZF67nK+vbgf9lOS4gCSTEqQFJbfVdq29hpDfAFHeC9pCZpAmW05XKOjCzbYrI
	s5Y+PSYgPtB2Lt+jy5rLjs/E=
X-Received: by 2002:a17:903:244f:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-22dc6a879bamr17996275ad.49.1745625212634;
        Fri, 25 Apr 2025 16:53:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjTQbuYB0h08FyywNE89k6t5ET6EqyeNvF40HkoB/PVt5Ya/IJipEZ3S+h3c3WQsL0LGxgYQ==
X-Received: by 2002:a17:903:244f:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-22dc6a879bamr17996045ad.49.1745625212236;
        Fri, 25 Apr 2025 16:53:32 -0700 (PDT)
Received: from [192.168.1.61] (syn-047-231-130-155.res.spectrum.com. [47.231.130.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76fa2sm38986015ad.19.2025.04.25.16.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 16:53:31 -0700 (PDT)
Message-ID: <08643d25-1ee8-4793-b44c-989fd9a27dcf@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 16:53:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: firmware: qcom_scm: Fix kernel-doc warnings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
References: <20250425-fix_scm_doc_warn-v2-1-05a4f81de691@oss.qualcomm.com>
 <7ba896eb-6d22-420e-a289-2f7f650fd39b@oss.qualcomm.com>
Content-Language: en-US
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
In-Reply-To: <7ba896eb-6d22-420e-a289-2f7f650fd39b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NC9Nf2BwVI5gXCuxWGly2G-XikL5_huk
X-Proofpoint-ORIG-GUID: NC9Nf2BwVI5gXCuxWGly2G-XikL5_huk
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680c207d cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=s459L2JzXmrPe6crxkjgRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=WkNl45-9boxfKL6T0bwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE3MyBTYWx0ZWRfX+lMP2fARvUV5 InBnWpI/bF3G3p25vyjjLTa+oUMEjqyjKn5XH4XPrhKjgckQrIzRmR8DYUpE/GPJEAwxNV7EYJ1 YBVisZrx4z31PQbjuUvsMqh0vLjfe659neTtSRSZzwnSk6wlQybWW2nnJ/pKO8WfQeGdN4Mbq50
 kmGYLspZbFFqiBWDHsMPOLLA+qof+TPwrPxvGuyZktTgRn+Vxv4p+LjD4xcbvSsput0/mk45IzT WZU9hU4m66B+IdSEIn7VArYzSQgrTiq2z7KwbmCGIilzXPqnh4dfzGwAvjKUdt8xdVILyGUh0Fq pZzVAEDwubfFM+KW70WkY3eU7Jmwk+guh3sqkBQP4kHv7pWLOgWkZJLpaPN6ZGrDVie+PvGQroa
 2ZoVhO7S8AFQUWdnI4bPQK1Id3sY34aw9y8H1Sl05siuLGsVvDn7+C9AAY6SsPuRPa0xftak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250173

On 4/25/2025 12:17 PM, Konrad Dybcio wrote:
> On 4/25/25 7:32 PM, Unnathi Chalicheemala wrote:
>> Add description for return values and other arguments of a few
>> functions to fix kernel-doc warnings.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>> ---
> 
> I only noticed now that the commit title is funky (unexpected "docs:"
> prefix)
> 

I thought I saw a commit that had the docs prefix in the title but I think I'm mistaken..
I'll fix this in the next version, thanks.

> Konrad

