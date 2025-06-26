Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF9521FF47
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979716; cv=none; b=bOqXa8+TI1VbEOHXnq6LdD0Px+AC4oM0VRJPNgTgJo3tOmRvz15BKBUA/oRVqgXEOy4JhdC5arLz3GQouK9+H2KOei2OzKO0cW/coe7Nx6O6HPqhiGmE1aTscfkkwc5hqFFXQSGWb36fGl81+IjR6ExvZfe3sVcVgU1v+6Pd0dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979716; c=relaxed/simple;
	bh=wXyb3r/wYy/Y9Hgwgzs3s/yZzKiZUAYUWUjkVSdaEuQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RsUl7XWjEKNukMKSytrdIL34CGQv3y+bUr3sXBV78Kfb+vd+Y7hk9f57Tb2Djzt6CE0fAAkC1r1qIppyCgE+UECrelEhDRDNtPgFDsipFY5DwvwXjupYYCJTEhQlzNKto4lGb7Td8Kl89x4KqWm6hOKa3xs3ZM6ch8QJWNbwRls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBMt9D9A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBMt9D9A"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ9pfx029529
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeT2KPHrUksQXiwOMplqgsQ1U+N6FD3AUDW54YPL3YM=; b=mBMt9D9AHbPZZiji
	faXOHKt62udd2axM3q32Ucb92G+lELL1Oa3JZ2koioi5bPvr1PW2LpxV04ip1guA
	N2+9TNgFFVK7neMnzujzfTq5CTNotq+Q0N6pqg/HopAtaGEjqOSz5XfHJ7YrGo12
	Bla6Q4Ucc9rvXinev+qe88PsfS5iRl2NIc3Ht3cPwpSdj399tvXSPlhRs+KtLG5i
	QF6u3YxRUN43XU6xWx3Kke2ceuQ/gDxZ8xA848qtZjWTONDkGloblGmaNMb65vga
	cHRoCR/pOWs/a36pLw42+CBI+tD8LsqqSLhMruZey+vL1kB8jnC0sYdEeQIRr9fX
	EY3uSQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4x3nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2369dd58602so11741545ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979713; x=1751584513;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeT2KPHrUksQXiwOMplqgsQ1U+N6FD3AUDW54YPL3YM=;
        b=YzKCvsnf/+GtTijbbyn9SmDnayO8McppPsmz9r8ctq0hdiqpHhuFbtuC707Wdy7/sR
         Q1pyHJiDpokf2LlsfiXI3s3oD6BFdD+ckAUv+MFf439UWBEQMcjEbKOtXbVLVGE9sloT
         KhI12fFBDX4Djrg65t/Gh2VO7SYHjDnhoZCWGNTIpwqE3QQ3S4ItJTsMT1EVNYvr5otW
         O7tBC1TZWsRTDMQgyXgHT1wrOrafJxJo4eT2GFyJHOoAskKtADp+RiDmRpQacajoUSk2
         S0Mw1G+TgHXTB7PfybH7bnhgSUxh54jG7eMcxspJ4NuoE1WC+F0iH8nG2HRcYY/j2ZMB
         M8yg==
X-Forwarded-Encrypted: i=1; AJvYcCWSOR/ZbE0AaMFPoUwgrScXEn71K4hLGCfJjcaeon1VfOWNMM/eXEfOVHxlHgLQBFgfUxLUnSOzmc/UjVM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs8H5KZun0On2bk+4OBUFKaaEUJLTU4Sw0StkkGihp5Z/jK5fr
	QC7cx3MdVcJ7nvZD7vvVmTKQsL2uoIgylUkYgHJcQ0ejK3yKc0/RuncTscy1rwChVT9IFDXhNW9
	4voF35MhJt0wO/Ro4QBS5x2rA4aQ5Du2pgWSi4RyifCmS7r9BJdJneTljyW7oTFrKqFA=
X-Gm-Gg: ASbGncsRteChV2nDDuV365zEiO24O7pqIll1/Ce2j2mKzBOckmvjlVcyz9QnNCPUpMW
	Uy73JoHnK6Tad+82FYjjCBWh5L0ipSYWdV694LIhnlZfuycv/DtC+4uNGXqp2D86VHFr9cBX9Ie
	JEG7vw5t23v6edENEc4EjcQyjWY+UOi4lQ7GsjI1/K4vxXW3N8lHXK8VkZkxXdbrzENaWq755sA
	UTH19ugX/94jYweXBReasPS01uMNj0zbXXi2NJYAJBLa15rlzw4YuGbwHafs70xT3Nsxn13BPbe
	o7D5FEqSSKF15iuEP1ix5t50+IhQyBAa/PsatZIP/rsi0QNBa51Bd5L/nSE=
X-Received: by 2002:a17:902:e847:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-23ac4605d70mr15054195ad.37.1750979713398;
        Thu, 26 Jun 2025 16:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjZM7kfjryOD1GdR5F9TG9re8seWvkCufqnpRGD5s0uPS8B0Ynib8/JhBBMrDAQYW3NoGGrQ==
X-Received: by 2002:a17:902:e847:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-23ac4605d70mr15053705ad.37.1750979712970;
        Thu, 26 Jun 2025 16:15:12 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250624082022.15469-1-johan+linaro@kernel.org>
References: <20250624082022.15469-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix suspend use-after-free after probe
 failure
Message-Id: <175097971224.153431.11379630143491274753.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685dd482 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: tAYCggW5IWF-4KJvNBoJHwGfAwKdbCBr
X-Proofpoint-ORIG-GUID: tAYCggW5IWF-4KJvNBoJHwGfAwKdbCBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5OSBTYWx0ZWRfX7snKXeoCLf6k
 jq8OAV57suQncm3SFxiYIzzhAdKoROEG+kIMngdc7SJT1vF3ElFm8HnM4bEx7pWZn9wzyY+20y8
 c9bLmQ37CF0ocGZPGnaPtiTxgXcq0WYdMmai8zKBDZ9EMA57OxDrV0c0c+sLksLy4zgXBIleJiv
 v7YOpAqwj9+nO0lHogdqfq2DNepLxxzW5DmdrgOqNhaQ8UflsRzeKpCI/bh3fIuchDoRkFYU4yG
 9ujcWHqbQcawJxsDKT+ScpPYm/iXk0JPtOCvkaVi7mUNmrZxMpToKgmkxy3ZObH1dfYpfV29Zlh
 WpgApFZHKPeWULEZ0G0H+5OyxGR5cKbU/NZ8/Igyq5bhNWK0x7qyWtogqodd4EJP1Nu6wT9jaXP
 NmhclYLYr8u2EUeWoGMFj+Yss8k/iIE8BE67NACnMxGwWiHhH3kQYvKcYdNiREr7lFvnY1xP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=986
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260199


On Tue, 24 Jun 2025 10:20:22 +0200, Johan Hovold wrote:
> Make sure to deregister the PM notifier to avoid a use-after-free on
> suspend in case core initialisation fails (e.g. due to missing
> firmware).
> 
> 

Applied, thanks!

[1/1] wifi: ath11k: fix suspend use-after-free after probe failure
      commit: 8f9480451514c065dc8296c0db6e26d6c467fafe

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

