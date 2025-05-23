Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05EC19D890
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748036770; cv=none; b=owDOyhCb5+Ja5YyXr749MuTo4HwLIvYz7ynb04m9KxdzfzHnYhFJTIVHDp6FjSgXhurkA5XwB8fJF/2MFV0Vfn1BjkdPklLjCITK9rDCpcXKjlqZauEKw1+YKReJOfvYbgONvcNsmiftC/urtUYxBsSGZofIJ4ZirR3MRrpqjQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748036770; c=relaxed/simple;
	bh=A51K5xpUMPokLjesXE6eLxcMndNUwGr0B0lfZyozeKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3WUlojEgbIJTHYTnhIPPZRQwSoTpZX1OY+mfpDpnl5do1MwtH68wcBaDbwWKSvXGLbuNkwn9puqW7UJIvKKFNrzM8Xw/0mnmxvCOOPCcWyqplyO5b6eHrhiTxSYd2EqZY92IFDGd8WTIgDSvpYN/V6C8BIpft+xhC1Gov7kbQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PL1jbfw+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PL1jbfw+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NKqESN001686
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 21:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YG4viRd+J1gzU3tCz8abXTyB
	kGIHyRuIeHUgXDp7eMs=; b=PL1jbfw+LKLtOs2zzBvEF0XU/8hYi6C0bic4cTPv
	U+qDupbcgkokUUiF8pxbx1BBk957jn/MITWdwvjI1/oA4IniBzKpxovm1cXkJL6H
	o0+ilAqG3AqauWdDUZxp7DdBcC6sl6qBgWR+J1eArlUYvpGPegiffFYffSL+vDi6
	sFsaMCunWn8rxAGSTR1Kx+VbWWtp6bJFdc2QZFHDcYhCYBpDYbLMhzSjnuFsM/Ef
	lZFg8aSCWJz84DpGq9/jpWIz4Q6wRKRY5TE3+CeavRpZhX+r9j2XcORnaoMzP3Qx
	+y1E09AozHyVH1GJOHyO7DVyj8UYwMZVwJcNsXlj2TmsMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0ud8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 21:46:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so78614185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748036766; x=1748641566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG4viRd+J1gzU3tCz8abXTyBkGIHyRuIeHUgXDp7eMs=;
        b=U7lUlGNFputWc+7KUw3zhJZvxbWzQypPCmPsi8yUALNNNiBsy12mxp6Q03ZuBB4X59
         TP2T+b7mwiaJqpkYsF4P3kTpA+fgNkVOYgmde+tifXtLrnPw4UZ8TThGrTz9C7VH118d
         JhmyVFamHXwb2+Xd1CKdwkfNbchnabs5SqxgGjiier3vaO4oM1vg2bjwDvKvFpbUCNv1
         vO3Uaqsn4eSlr92WW3l8NyNs4emBAKVYd6FHQHvMeZtK1eL4BtyQYr+Sf1DpFHGh4BxC
         rcgGuF5E9PJNxvxndVZnqt4jp2GJ6IL6hMw9T/V0oQQ+zGo4POqQ7r2NkmTVIsdtlE1l
         RpkA==
X-Forwarded-Encrypted: i=1; AJvYcCWEHndnSYyzhV3lT/dy+kzD98RoJei1q34bJErFonv4jBaMwBtc1S+zKQhYaEVxgnk0vq1xl4Kd1xQ1XGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmZqeWdKx65xhIEcv1CYWrbNw2HXjsPsQ2cRjFMLiCLyUGqtB2
	Dm9u54rlL1tSa7/JY0hvbOVTCRPSay6oByHPLL8vjfQLabdQnQLm5EyGEHDhzMpjIjQQMiwaeCT
	pdqKbuTax1grEyZ5CPm3Fs7N/lMPe7NQhr/Xs+ZDWgzOZlMSeQ83SFR43dr449APljZ4=
X-Gm-Gg: ASbGncuWNfVRte9ze13rkmfvrW3hic5HwH9xysaZth1lOvvykECoQNZwIMLLD9umzUE
	88U/rP91Alf7Y0RCNMQZxuT2uxiC0Dgy044oRh/VmK0sewoRNNbjKx/rhdQyJoX739ntnvYwc6E
	tKP9NyZ74vOvkAjhO/+qycY/pFR+KCVk4tbIR8HfErwonh/JcPc/oBegCk+bhqVwMHPtihYVhDd
	sAuCuk/ursbIC/sDF0an6Po1Idq7WP+lGlio85jE3xNNj7oLX9dOO9RoHIkVOQ/chbpXDPmjUZH
	lyzKg3S/Pun74xLZfrJV3ePU5XVIGXYdeJ1A8XN8DXe5FdtnAvHslNkqi6/pPF5QLHnRC/EfhM0
	=
X-Received: by 2002:a05:620a:27c3:b0:7ce:ca97:a6bf with SMTP id af79cd13be357-7ceecc166b2mr146501785a.41.1748036766398;
        Fri, 23 May 2025 14:46:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtKjp4VMExAhHDbSXwWDUa9R+2e6ssRs7xky+iVHD5hTNFkKSYPwh2y5Pdk3RKrIoEHeQZ1A==
X-Received: by 2002:a05:620a:27c3:b0:7ce:ca97:a6bf with SMTP id af79cd13be357-7ceecc166b2mr146499685a.41.1748036766120;
        Fri, 23 May 2025 14:46:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f34d56sm3971854e87.80.2025.05.23.14.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 14:46:05 -0700 (PDT)
Date: Sat, 24 May 2025 00:46:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/plane: Fix error pointer vs NULL bug in
 create_in_format_blob()
Message-ID: <r3rars6vn5wubijcixmpb753dv7vrg7h6yukbpsgl2svn5pudq@xbnkzn6euh3u>
References: <aDCdRKZHmCPwaJWp@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDCdRKZHmCPwaJWp@stanley.mountain>
X-Proofpoint-GUID: TqKA92Vi2Z1bMK7JepH_pCaYACJ8M8F3
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=6830ec9f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2C2ebHZnuNSfagipGo4A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TqKA92Vi2Z1bMK7JepH_pCaYACJ8M8F3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5OSBTYWx0ZWRfX6sG3T5OfZSBe
 jYUn1+lKozwc2ZxO0hU0s3KXysvmSJ+lFH9KglQQjCZLybdxve1sboXj/F56kJwSBAgDi7WbxF8
 cleaNX1aECDXLzjNUIZr9cK7K1sN3y3hE0OJ2HZgzWALEKuSZl/4CxvWWOkZAt915e2B55VnrCN
 whM8Fryerpkx65mWP5A7nVhonghTen8QZYn41onrI42+VGzPpP7MSJTj3b1FfQggYm44w6HgdiO
 mlML9qp35ITvnZ9gvVALhRO6vM7vCJvv5u/6lLb82mQPZIxPOtqR9LaKQdzIJZ3RRAeTGb8R34f
 9xFbyDYJYwQiuk6OwswuJNDI5KlDn7PWm52wvyAWYYndoMMLJ8X8VedRqwj2tiFgzdy407IeZ07
 zq7hIXzsChf8ycYjSNbQQfP84BLaX6etIJ6DfUlmq43C0i6U6FJRAIPZPxOTWUsMvbBC4X0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=831 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230199

On Fri, May 23, 2025 at 07:07:32PM +0300, Dan Carpenter wrote:
> The callers expect to receive error pointers on error but
> create_in_format_blob() returns NULL.  Change it to return error
> pointers.
> 
> Fixes: 0d6dcd741c26 ("drm/plane: modify create_in_formats to acommodate async")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/drm_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
