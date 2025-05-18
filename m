Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C762812C470
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747561756; cv=none; b=caCM1qEE4QU/Udq5uab16nvNaIdbkNfG55Jz39JRkP6GPNHORlj3A6qCZnH7KtoY+6+ZYqhorNd4L+RRUOP8U+r2hrqscaxffUhgqKLsSb5AK/37UzhlNQpvSso1BsSSZ3+yQgjr5PBg1R3k3USCaV/HCNE7B2LgCdqcqR9hiAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747561756; c=relaxed/simple;
	bh=r1V0tWeq5DjXIfQxjDdeZCv9giZY0qneW+xe8LaZiWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9tQm2iT+xaC8omT8VazBgHHIEbfQYwPj26FnsR5+sfMswjVRVRjLRazXyNoee+OHdQm4z4VGeOgH55saiAk7UQYuEjjLVf1TXCHUK0LM1tcIUc1dlwBbipPJSj2hOyAK16nKPkUXntJ6KFfGNpAaK+qXsSfiMrSn3bY/b9RBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZJskLuk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZJskLuk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8ljSc014013
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uk3XmHMtZKL9KyAJ7vLCOFV9
	j3YnYGhoaY7wPOpdmB0=; b=SZJskLuk3du1Dr5b9j+Qx/OL/HjANFbrFfMOvLM+
	MjZBpkNAfkD9uYjoiNuhUK3h84+nOZMc1L7apJUbwMCHEZgYYr1dqz7sb1HoW510
	buGK5tnwdDMPLgJutpw+xW3X2S753YuP0xmpgyTRkFLrvok9kf6oLNi0ErF40cx6
	Ayp6ro+LHOtpCC5yahNK2umqdiONQBThK8Kn2gVivkhJ5igg2QyzvHiDUozfcgrI
	t8m9pIX0PVVlM6zmCPnxLgnbr0pROpTpkyKpAKWoKbmR96P+t6eNSlikNFeoVKvR
	rbXnMx2ucGqRZOj3wK2uwBdz7C8pRnUNZYrZyTvVng7ypg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4hsw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:49:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8c9552514so15992386d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 02:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747561753; x=1748166553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk3XmHMtZKL9KyAJ7vLCOFV9j3YnYGhoaY7wPOpdmB0=;
        b=ckqoidp2YIVGISM7UzlCyJWQ+z8SPwNsWq762uI1ZlBNyLWY0Tkr1uVnk+qLTLPg9l
         rsxhboC89gWmQwrpUu4oCCquDYG/L83EfyOQLJyf+Gffj1febr4GkB1fluQAm/ZbcMr3
         WZdaw6/mJU79O+mk8jBVEGY6DA0K9dniu/u6GPU/La1ea3lOz0pwH1M2yoKRmd5emShU
         pwJ4tOSI1a6lSILi5bpOYfKIvVaHAb+0ZDhxJS8aocBstR2FWdmI8Nqt4A/vRFHoa6hJ
         L8zE+8WBvJX5t7mHbd9u0DLyauxu7A3q0F1WryPMVzD4jWWSOMrva+iFe4bYk5dAz8df
         bTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6yQKaFbs8xfptH8x2WMEBXZ6DCHVaEj3SsumtkJrwP5nMxD3vrciMTc7xKxu+A1ZvD6eKQ1Yg7zhdEXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YySYe5ZNuOY4wJ84Q6uDJEe6Fsow/mlmVcmT259aQMUUJMRwMR2
	WhAFpZGlKCyq56nXt44Inf1znTly2sw4xpyKonw/yGSwRN7R9YsKO36Omr1q3iWfMyTMoHCaZ2O
	nByAdjZF9yhetvIYjmXqErXgi3EV7wsWydmmmCj/N7wGKA3RSeJqAAQwi1VvPpzmXDOY=
X-Gm-Gg: ASbGncs2iBQaf+opgHsoOozg+PRXK7oqrdcjZ/BLVplLfvgKt8uSCeWCPc0R4Tzdyh9
	YNgyhIYbv4s8otopS8908c/b1OhrKRH7DtPWMKeAwc/0Xl+IgJoeRrcFDL2ln9tHbB2FYptjvPF
	mmxAVZBSm6qciAo2dUNozz1vjkQLTvCA37eMRL2S0dXPK4vBaLkgtM3jQ2jfXVthLHPh/OwN7hY
	AMY660ZVwLDMMXr3e2YK3H9aORltO57Sri9ewtsDq3f7QzvklGv2Jcd6YTjf7aeDlXehTBlzzDy
	eW8yf3c9ZNuSZSw3p6pCF48L/qz10kS8RAU80mKs5ck1c0QLs91F5ti4x6Fzrh5sLjpE0uuCAGc
	=
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id 6a1803df08f44-6f8d03572a0mr30939226d6.15.1747561752739;
        Sun, 18 May 2025 02:49:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB6cOXuCp6Ea8OwMdD+YYtA9uX4ETpwrWWSJ6+rASNTDgvLSfjQDY3rF29CklGqPF6j+ijsA==
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id 6a1803df08f44-6f8d03572a0mr30938976d6.15.1747561752424;
        Sun, 18 May 2025 02:49:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f16584sm1356425e87.44.2025.05.18.02.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:49:10 -0700 (PDT)
Date: Sun, 18 May 2025 12:49:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 09/14] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
Message-ID: <6shba2twwvusoud4grdmagparzg7bostkhqnrohscqd6bik2iv@gvp6t6lklyk4>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-9-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-9-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CHE4iFmjhp5MFQ7EvJbiUxVU7puSes8t
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=6829ad19 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pZ1cKns8_n0M6c_4lVMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: CHE4iFmjhp5MFQ7EvJbiUxVU7puSes8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfX4g+vy1e8rYK5
 p0jlvc/YhJDLfgjHkAOjBGNEIYnOdxHuMngKvT6hHbkAHjwAY5wLo3f77v4T86IR5ojUgypL5FA
 HEBkzXEtUkGAjvsHKJt6AhqTMyqnXc2B+SZLhO+Om5LevPzKEHVIIGIxpVDujp0wHgWL91qrHOW
 8gjE/jLATcOz/yB5jcs+fSN3LGIT5OmMIJtTGqnozaj5/yfHMqzCAdk964+eq9zi3FV0EmQG+Kr
 jX6P6EZOjN059EWN4f+EjOGhS+/0708lcCg6CdGKJwPNu7/6IYRVSqkYy9KVMkXCwd2i77ghbv3
 6Uf+A1N/Te1fWazaaFOEYJwT2E3/TpmsbXXriZ+PizizfXvRp6U+eeDFpDklcCiinJjdNYZcMaD
 HewnDq4YnaoUHy5JLI5p+3ntP6OwZ1v2eeJnzooz2XQrFxJA6QWkthXnODM0DxIwglsqFc2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=779 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180091

On Sat, May 17, 2025 at 07:32:43PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's supposed to be on when the UBWC encoder version is >= 4.0.
> Drop the per-GPU assignments.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
