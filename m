Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C4C17597
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746370329; cv=none; b=pggYv8/k0hTT0UUfSaA7PVBCzY6CTktrvpVxieHObqMVzoyvh+KMOCd+loDMFinbVtIW01JlhTxCcjKWUCX5yl/BUETUt1E1Rt9R64mg7YQ9gApHl3tmPvDe2kN8H4hWKUSdu86EyO5jsZENOU7ai9LMrUMGWIX+1MHNa5YezKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746370329; c=relaxed/simple;
	bh=cCQU1JvKA5nSLiAdJUlKkfAQRunXcvgEAyvWc+BTpH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXeBTOqBZ/t/ExFjdJmdMofGDePIrJACf0sxCWOY+fCcg1JZTre/moungNBFa19QQSJjStMWD7Bbt7WrDWTKpyP7ybK0Z57HHNl6eCikeo1XB+vjjOaKOr5xssOr/RKca6vSV5lEeXHSoJmBf8xoDf7qQML0+IPE1GKT/B94WWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAi652JY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAi652JY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544BXVH7029640
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 14:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m83SZdAydqLM2NkATe6eUZ2F
	MEFy1GeBKkXmBHJv2kk=; b=OAi652JY7QUssxZTbVts4KAOO7G4CJcC02XGcJFb
	gcXteM3NLwPmXuEBHjmTLwRcyYJp9hyXMR7pmbif4VIh8L9OdHjT2hSpBadd/v9f
	kJE2CdtEEMkeCX7rMNKgdSWGrL0/InS3q3gBdhBz7tNRZBidKD4VCc1h+gJNehQk
	lWawK/o525vAdYGqyndFJf9LwnCSCQNu/SchK3mBfj/WgrcdnCb99Cy+13l/aTLf
	LAG0CFtvARdOM2dfE519ik918b3FcH2XPW6JdlbUjzhlUXiE/1O5xFwxBFcp5S43
	pEWpye47Y7y64pKfctrIYBMGY2l8BuiiOQOqS3G2fFOFnA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55t489-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 14:52:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c77aff78so327018585a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 07:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370326; x=1746975126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m83SZdAydqLM2NkATe6eUZ2FMEFy1GeBKkXmBHJv2kk=;
        b=qguw+IL+CSQ0A6wyDBD5oN5J0TEShfzTy8yFaTsMi8Q+0LxVPzcdZFLDffk67zjrCX
         1WUz8G1EX5SaFj/O9PxWplcW4upVBPHtrPfZn8qzrUC7UZHo5tHVxbdfQ4YhvW4bCsDS
         X1X6m3sg1tH3wQeJG0pHDBldpZKsSsiLCj0nhSn8QYdvjkwBMdC30JVscNwz0bvIrHiW
         0nWINNRUmzSgnmK6iC3GVT9JXsQGWUoJDt1OSy7AvHtyk2CRKW6v97FuDy6qxiUlGdYF
         ubxCd98k7F+FpVOPNC3yV1iQ0zzXDwoM7uEf83sA7l/EhsmdmHnOUk1XPEKfYJzpZD7q
         F+pg==
X-Forwarded-Encrypted: i=1; AJvYcCWX6kPu+CQcvr45EX8kQkkBCPfVaxbJU7z8OzqVWyHMWZtlZdkE6dRnzJpjYLCisICUJFX26qaKEj8ea1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL2HrrFCiVJkEz/WUWmwKarj2D+LcFD8KediwCbkhalEH41xL5
	cYQ9A1mXqg++pAUBVPIqFDnQ1VKKzAf5/1nXwKEb2ZEwurYvtTHDGYzZf9c+4hBIWgBPmBrjxJY
	Ks3Rw6grwTIjmcTryYuHjVRGnytPUUZKVbDxgG/XUlqRIL4sKj3qAjvzhqNjQBac=
X-Gm-Gg: ASbGncuTqEbXdI85kZKNlQ2xrD7cQO6MmikLx+UsIxi4oPKRxDi5r5YU+98oG3XYtcp
	WlfcKduv/Es092CJGWdKhH/r3A+i942uGEbJwnMTgqD3VV2fWKF6FsliDqwOBsR6wMRYpVRQElB
	l9ExY4ST5POCoTwWaWfDTqHhw0d48HJF1lwDqH06A54W2vaHeIZFVGlyOjF9XK2sklYKU9+C/bh
	lMfgvo1bM4JF7upLyigg6H9kmFTKao45xPwRZmRdI0oqVWW4JMxnw29QAmYFDo49IWy86pNDNsT
	tVng2/szMjokl3LKc9GFxLVRgGTon36PXJvNIJtzw+BNDwRcTgnfEjIjnEpGJDeyDQQ5tCFNOog
	=
X-Received: by 2002:a05:620a:2b92:b0:7c5:5339:48cf with SMTP id af79cd13be357-7cae3aa5b75mr725688785a.30.1746370325769;
        Sun, 04 May 2025 07:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjMPjtNhpIyjrKZzrhJw9j9z9DzHZIYlT7MKiqysN0RLMW7cC90IIwrON1/tFp4KvpBkcPoA==
X-Received: by 2002:a05:620a:2b92:b0:7c5:5339:48cf with SMTP id af79cd13be357-7cae3aa5b75mr725686185a.30.1746370325494;
        Sun, 04 May 2025 07:52:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94bf03dsm1267630e87.66.2025.05.04.07.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:52:04 -0700 (PDT)
Date: Sun, 4 May 2025 17:52:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Dang Huynh <danct12@riseup.net>,
        Alexey Minnekhanov <alexey.min@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sda660-ifc6560: Fix dt-validate
 warning
Message-ID: <2bftieu7mnct7lp5cz6flhuc2azz4enubm5dkecxzsgwhswu33@xvghahkj6qrs>
References: <20250504115120.1432282-1-alexeymin@postmarketos.org>
 <20250504115120.1432282-4-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504115120.1432282-4-alexeymin@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDEzOCBTYWx0ZWRfX50j6Lhn7uyKQ
 f7Av9i31QkYsn4aNGxS6VsphX6DwgtUJZ8TlLXLpQdJRnD9O8yYDaOYOgTEFIb5h7WQxIpPJ4uv
 akeTo0AHKwMpdRkXXOx2ZRKQiWSZqoUMnjZpXKnBaZHtbcT0Ev8cdRju1Lf13E5Vph82OSidmIo
 G/XLKeWYELmJeQY6bXGsioi0Al91KJJshWVvJkGTD8euNWur9FK8ijVPwpTMVlvjn8QuCvVYNl4
 rGhdkjrWeGUTrnHcrfj7B/p1PLiCi//QF1FaOl1bkGl492UGOp4obn0cpT2Abl667ReMMkSLGiL
 STW64seLndNVXUarrbSHev0/cT4O/ZWYpHLPKLEajqr2z2RfV7UaWV8x5tr7PbvPUf6Zemc78sb
 0/rSOwrTcLO5Ysvxpe6DbeHs4tc1WN2neU/0P9L2GyaCv1vqG0mfZsfFN7ZND1DaBrfUTHCK
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=68177f16 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=dCBGrzmRZM4nFyVncTUA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: ZC8To5OkHxX9zAMD9hWqHKSqNLKngxX-
X-Proofpoint-ORIG-GUID: ZC8To5OkHxX9zAMD9hWqHKSqNLKngxX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=475 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040138

On Sun, May 04, 2025 at 02:51:20PM +0300, Alexey Minnekhanov wrote:
> If you remove clocks property, you should remove clock-names, too.
> Fixes warning with dtbs check:
> 
>  'clocks' is a dependency of 'clock-names'
> 
> Fixes: 34279d6e3f32c ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
