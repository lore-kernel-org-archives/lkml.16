Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3B28FFD8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793742; cv=none; b=LY8tcGNVdEuMi1Yg+IMrejf7wNe31woyAa9A7jlFa4RR0lQhXz4LQpmGmMHL6876zGwB3WXcXH1KyEmGy/5H8ZtAA/7PhVYP8yefbrFCY1zzqj8I3D7gh351+SSlKUEyqXZtJezn84m+9uyvXhjhnU3SvvVgLi8ZQ5CjnDXoqEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793742; c=relaxed/simple;
	bh=nb+VpaJq+SiYExLWTH9ohp3EXEsphmTirZX72v2mZ4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/xNf31w61l9KIixLdIZJhM0Zp5OUyz9P5LrNtHzoYBjvYx4OYTFAZ68BxnR8eDIF/YyFI+dUZdgHwCMJea+0haWu+sOWtjGYwAcgZm81ZbH3EY+e+cWIOb/qlm6io25qovK2lpxocwuM9v9Fs4FY+uBKUBJ07v+f6UL4tF4kuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4YXDI9J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4YXDI9J"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BPSHA011293
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 12:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzrex/88nnhuYbD7YROGz0GqdTFZd6rHcQ09znuzbo8=; b=d4YXDI9JVT/RdlR1
	GdJC0wS2u069Epw93BWciJUdMIKF3UNJ7Xwwp+e0iyfQJacs+XFNJpL7CH9rJO2j
	oFvLXzNuPJq2ov5je25KP4h2Y/GJS0ZLpSd7jcSq+zh1nOFpSX8113NNCllxYy37
	2Ry3ETq+cJxlP9igVJeqN355DpMucEY0C4iOGvfCKBPS9wmoiLHvPULecANXfHxa
	Om+VQYlM/ZtEyade92RrwGBOqCpgHhwwH4se8hgL8oFQT8VhYhfLQtWkH3nB6zAY
	7BPdecxDiL/ZuFaVNV9b0iyr5HipcNjTqOogpel2QAg/USc/Y3lO4FtjZxZdyLpO
	O9DJeg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7cq88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:29:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47983a580dbso4241761cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793739; x=1747398539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzrex/88nnhuYbD7YROGz0GqdTFZd6rHcQ09znuzbo8=;
        b=oFRB0EKgWkKYax01P82td+k9h/cEv6WQHkCYBPDD3arltvPYHqjgvtWQNCA9bJ9sXS
         RddrGRjI/cSDciX8aZ3YASOk7OEs2ELHdCHH0V8ut4vYEbCRzx56zbOi3+K+k6Nd5cZ7
         L3uWaTIzilMch0urzIJi0uxmZZYEckrI6KzDWsiK+944lYTolrLZ6gr2fpykWcT/6vEM
         aoA3ARmvIEgEWIZm0dqAPl8W7GJqFAZ+1q8P4GUxgpixFpW6Ew+GS7551+osFTw5A/f7
         +DZyzj8KTLK/RIPFT394EaULwDfI04OrHKpkNqbVOoRfLucAK+otuo/u5tSPbeRq3SM9
         mzpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTzrUVx3mrEDdem/5STL4av9gGavRVieTsMVQJaczURnuUxuF59thrKVJh+jyilRswAmvKvRrGMMXrjSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw736Cj1fvKgeiLui12qHstrtBK/svbz07Wapz46UP0eOxFfAAS
	5x8FkV0vdqWY1m24oSfY0ENWPS2Fw2oflIBCy4m8Ed9CgHBMauLCPjs93TPxdd6zt+xjiEwq14u
	GlqL3NYQwsHO8sqifbdnJJAvpm8TECzirmIjKBbJJizAo9qAEQSusrUndi8p62Jc=
X-Gm-Gg: ASbGncsbODX2VK4Y9WAbLw4jLJl+c5QIdmvkH1GJRuESPXJWUdV32r3IGRTGxoWoCqo
	YKks3cj/F3uSyU6BWGe/NQzfeiXKaX9QJ1PZFaYH0ah5Jofr+wkgx2d15pkZ4DBi8iuoehWUkuO
	OpFIVUOMyLzmiXd8g5/1JR2hK2jgUllrKoJ/qmJ/UT5E0s6l17oeezJdA0PuILIfzu54H0Epmbc
	goNYnjHrdZRKm2IAubf8XOeWCqsgrHEhGdJjxHhsYLfTsdOT89SoGtbvhaI24hCVhDjs+6j7pct
	dpqrJEghZljdlKmM3zFpfLhnv/VN4sRxejaPFs6T8JjI7lWC1sMEITc84DjzwuFmiL4=
X-Received: by 2002:a05:622a:406:b0:476:63e5:eb93 with SMTP id d75a77b69052e-494527627acmr19924241cf.7.1746793738942;
        Fri, 09 May 2025 05:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh76kBlsHwWwCEVlS+S1ABlxGBvnfq9t4dYT6eIbKcDYDcf8Gdr8WUiN8ExkgtpWuH7XTO8w==
X-Received: by 2002:a05:622a:406:b0:476:63e5:eb93 with SMTP id d75a77b69052e-494527627acmr19923881cf.7.1746793738374;
        Fri, 09 May 2025 05:28:58 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21947a442sm142986366b.82.2025.05.09.05.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:28:57 -0700 (PDT)
Message-ID: <17431c94-7215-4e50-acc9-7df97558af16@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:28:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 01/14] soc: qcom: Add UBWC config provider
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMSBTYWx0ZWRfX7O2cYPTda/Wd
 m2zw6wZWNrf8hul4uuUDynZwNTSJGm5uxK4b7vgqDBq2dvs9wMTfXqIF3CP6K1Yqg6JkZz0b49w
 Q+u3f1I96j72WtAZLFdEOQ6QX3nIJfmzH4KVRPulx18dehwAVllt90E0WvMyV6Fa1PI0RfWqlzD
 SyEzNt3oE+6rJ534O+SNFHNZZ2BcgmftbavR5QslqqPpgZF8sj5Ojrd0brKWKpZSUyU+VYMwOk0
 8N2SuMPpcd1FD0sR8reS77pL56mfegh7N+r58Zk+acsf6wLBUqv8208b1kwnazD5NihJoTjoniI
 R3nGggK8+FyKhikMZH9JMt10K8V+Khg1mJLoSWX9XX2nLkRrkvUxNK12SRox4UxcLeW4kaie7Gt
 y8fqHT0QqeuKQQtsMyXRjpdM0unLXqlIDFfElr28zGNCoJ89FmZSxeIlBAa6saI44Tzs1xCl
X-Proofpoint-GUID: s8sQFlZ97J4MAzbj5WwzlSUimwOZc14t
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681df50c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qJKz7-gl4_nKpslyRI8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: s8sQFlZ97J4MAzbj5WwzlSUimwOZc14t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090121

On 5/8/25 10:12 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add a file that will serve as a single source of truth for UBWC
>> configuration data for various multimedia blocks.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +struct qcom_ubwc_cfg_data {
>> +       u32 ubwc_enc_version;
>> +       /* Can be read from MDSS_BASE + 0x58 */
>> +       u32 ubwc_dec_version;
>> +       u32 ubwc_swizzle;
>> +       int highest_bank_bit;
>> +       bool ubwc_bank_spread;
>> +       bool macrotile_mode;
>> +       u32 mdss_reg_bus_bw;
> 
> This doesn't really seem relevant to UBWC?

I'll admit I just took it with the rest of properties for a simpler transition.

Generally, we could ma-a-a-aybe just make up a common value and pray it doesn't
break anything, as we're taking numbers that translate to ANYTHING_ABOVE_OFF or
ANYTHING_ABOVE_OFF_PLUS_1 in most cases wrt a cpu-ipblock path.

> 
>> +};
> 
> The comments should be copied over from the Adreno struct. That was
> the main way the meaning of most of these was documented and you're
> deleting it here.

I'll do that.

Konrad
