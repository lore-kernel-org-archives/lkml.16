Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEDC18DB2A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747979512; cv=none; b=cjB7fqY08t9Kd3QW80ImHi1ykEz/qAd/YNcMjmtY7gVD0QXl5kMVZitmwv/xNBR8ilhNS2aVNhNNZc/3VlrDVdz+6IOvucHVpidHN9Zx6P1tQCddqCRIGm9f8gJ4E+UUZD+2XZGX0AnbUsM5xk52v8SSQQLqCAamc4UhTvOj61w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747979512; c=relaxed/simple;
	bh=+Vr6IE5YP6gSNF0sYVXBQDOOTdCJAwKBdrwjzpIKREk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOAritIUqATiIZfkNt1ExNO0Mq2sxfQ/W8SLa8BpOgVISdZ5M0Jn3KuSwvbswar17fb1GrBxPz3Wwj35XrTFXGK6oqgStU+lKgIMcyBueZavoPGROAQc5gaEk5VzlMghTwRtzqmspR/yYfrUk9dQrU8JotwTVqBwvZdgpBZ+ivk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jW0B5fjS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jW0B5fjS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N5BFl7000896
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QXrNGmCmt2zhECBpwtfjdX/H
	WyQDRPapxMVv9gaUZfM=; b=jW0B5fjSeWzuzpVhQfTMEJLldza0fotTojG+Sb+O
	lxtSBi50yJOCtd1O/xHB0GqFcBKvjgZZNYFKRFgu2QWSy7NwdzqgFoMy4JrXP/mo
	p/U0swFqGPIDvL7p6KbFT8pCEbUc3FzmmQVCmUs8EDD6c7qCGtqoV+3VD5SQHwJF
	vsn2z8+gHnQa0n0U4gjR48SoLNoFWd5HdHnWzhZWq5Lbmafns9i6dsLigfvpFxUd
	Z85ffhpy4Z8vbER5omrEEUTfA4ASVVHJIU59js1cQK0MXJJo/cVYbE3yiWusaZG7
	otKao2r0n+LJosEdZB8N/5El1J4P+BU+EaNtYIMYPHH3UA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tq2p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:51:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d4461e7bso57096346d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747979508; x=1748584308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXrNGmCmt2zhECBpwtfjdX/HWyQDRPapxMVv9gaUZfM=;
        b=qwjpWlBAi/kSbXbKkXAfLgApO4x5tAKcTw7owp+8TD9sK27DBjxSZ1ZcwFR3DfH8/i
         d6fBG0V/7Sw9cepzRazjjYwHESL+BgnjTsZ7nbyoHkSyEsVxygmAJmq9vudHDLsMjk0K
         DF2PozSpMoO6VoMj6gWjUT5foHJvbZlLIRzoOJyJafoYqnlG2Bx7MszgXTtVadoA4DcD
         mmtYGiSPvF8VjvF/TmzpIKYtHSrtoX014yYyDhdIwtZKzQlEpeHjHmDOpecMLV+pFZvx
         f19D6gQQHunSszpZd9MbeVEY0G+sxUNtUYtRU+YxhHiRs/J3pjgnbRRIo4/e+U9prc6z
         Xq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqu8wcn4UK3BFUC5Q2SoRFYLE4zt+niDI5o5aQN854TdgmOuik65U2x8EnbPn64gPAo7EsxFm37eZy0+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLrn83jbbBsq2B+ZG9pWf8ZLv5HbW/f+FHpja7X7oKpjpTWXdn
	YLl3HlWcI9/4GVl3JL6hM+pdMbWmqdECI9UqE9z31eI2SQah+NTy368mbPiLCba3gEzid5L84PI
	YDv+tCrbtQjVPwna3to/5d52qhYrcxab9xIXGeTO4dOtPrunC0+yZWb6CzIhNBUtrcAg=
X-Gm-Gg: ASbGncu6en+i6YJG2Qb4VYs4I13lMY3MhYpVvRcKdoJltsU0wHEkwR7tcuYJIET4S7A
	00Iy+yIYThmJVRxmWLpqhFmxKXq9H14THC24TfbNFTzctoYj3LaQS8mNbyOuDG4UK3qRvkWlOeR
	FoiaE2KeCvhu/5nCbQrr+QLYiY1Cec3pq9abVtJ0EUhxXJGMNGzI2jWveckgvvBh+/E6ymVQ9Ib
	DxmcrNksS3A6ziZ6bF4Gsb76KP/SPdGxlybBEGj9J8B5C+824ViDMluiG3lqEeQJ6PmJwovz/+L
	xpDBlCUC3MR2Mb7jGMSENjJvDyGqgIZfUBwXfIskRkxjXyEObSY7etRGRA3cruOe9Yv0V+1ZPPI
	=
X-Received: by 2002:a05:6214:21ea:b0:6d8:9d81:2107 with SMTP id 6a1803df08f44-6fa93a3cf76mr26276006d6.20.1747979508623;
        Thu, 22 May 2025 22:51:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFezhd1t/DrxIQ4E+HtvXS9OGyRKywlZu8VfL24fR/uLLWgaowbUpflzX+MwS4KemgCK5nrPg==
X-Received: by 2002:a05:6214:21ea:b0:6d8:9d81:2107 with SMTP id 6a1803df08f44-6fa93a3cf76mr26275736d6.20.1747979508218;
        Thu, 22 May 2025 22:51:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fdf900dfsm1724630e87.60.2025.05.22.22.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:51:47 -0700 (PDT)
Date: Fri, 23 May 2025 08:51:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/10] Grab IPA IMEM slice through DT, part 2
Message-ID: <j23rf3rjfv6rh73ce22ka6g5e4tujeeg25fmobvetpxo4kth7p@rvi3krl5hvwh>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=68300cf5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VhJxsdNJsIdQkEDcdXYA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: cVb-sOc1OjAL7LnX8fUyV0ycI7MDiH0k
X-Proofpoint-GUID: cVb-sOc1OjAL7LnX8fUyV0ycI7MDiH0k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA1MSBTYWx0ZWRfX1wdZ/vCR7owh
 t3PxIY8djMIZ29hH8SlmHml1yuXQVJqoFewVXLUwcR20hzo7bdJHIG8TAO5wUJnbRAtb0FNZSyV
 BB237Kfsf4O1/0EPbAHij+UWobiJsPkOhQu9zOYksdyqYIGv7abVt8zd4K4sz5WaJSGyKULHR2N
 CS2d4iSt+vdPWvsxl6H5leQbg5kehA/jkrmQoneNXXqBhzj8+o8PpgetKk5qeIfwjVBfjbjpvfl
 JFW4oQmOJivWBjvPAWmJwJBuYbl34wVazvKQK55LAkD2zCFpo2gHQYCYbOsQTd8YlwWjJovQHLd
 RqANGzQYWXwDBRnVZIKO3CnKlu2UwonNhz/UuUwNXvIaWFLQd8GMcMWcx9vgqf3EDgcaaK28Owk
 PMQ4iDJiWjPwGXV1C3LVc0EYRxVqXRruEgzz8S1lmCuBQxb1DSQicNgSyeYF3VH41tB/S4RO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=870 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230051

On Fri, May 23, 2025 at 01:18:15AM +0200, Konrad Dybcio wrote:
> The IPA IMEM slice addresses/sizes are hardcoded in the driver. That's
> mucho no bueno, especially since the same versions of IPA are used
> across a number of vastly different platforms, which invalidates that
> approach completely.
> 
> This series wires up the IMEM slices in DT on almost all platforms
> (need some more time for SDX55/65) and fills in the necessary bindings
> holes.
> 
> Tested on SC7280 only, FWIW.
> 
> Patches 1-3 are good to go instantly, the rest must wait for the
> bindings changes that were submitted in the series marked as a
> dependency.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (10):
>       dt-bindings: sram: qcom,imem: Add a number of missing compatibles
>       arm64: dts: qcom: sdm845: Expand IMEM region

You've expanded IMEM region for SDM845, but you didn't add IPA slice. Is
that expected?

>       arm64: dts: qcom: sc7180: Expand IMEM region
>       arm64: dts: qcom: sc7180: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sc7280: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sdm845: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sm6350: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sm8350: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sm8550: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sm8650: Explicitly describe the IPA IMEM slice
> 
>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 13 +++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi                  | 16 +++++++++++-----
>  arch/arm64/boot/dts/qcom/sc7280.dtsi                  |  6 ++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi                  | 16 +++++++++++-----
>  arch/arm64/boot/dts/qcom/sm6350.dtsi                  | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8350.dtsi                  | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8550.dtsi                  | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi                  | 16 ++++++++++++++++
>  8 files changed, 105 insertions(+), 10 deletions(-)
> ---
> base-commit: 6add743d2854d744c3037235b87c1c9d164fd132
> change-id: 20250523-topic-ipa_mem_dts-58f5d73a1f21
> prerequisite-message-id: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
> prerequisite-patch-id: f6aa0c354d434ec11dd88b93528c05cb3a45bb07
> prerequisite-patch-id: 89f72ef0c3d3f29753b0cb9e290a4036ba380cc1
> prerequisite-patch-id: 330c94ac7c2b42dd86c5f763b133f0d2598fda40
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
