Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA9126D4F6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690128; cv=none; b=PIsfWsKeOeWEJ82YvdPJLrw1sK1+3xm0dYA3Dc2jBUuC85PlhEAYI977Q979pJNUwRI5eEyGEqDHvx62S3vuWt+WalAjVLqA+1EeY9R3ffkMBrBmAdc+pljvCMyezYoeqn938/QlWcOMcixYiYgG1kyUy74LCvyyqts/1PAzlwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690128; c=relaxed/simple;
	bh=kC2JjAxpViZ4gsNaEZ7QLBCHBVX7ZMl25Hmr9XBHSl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RCfAHnLPjrcMxW/irHau59qvu/XGK4k6pXU6VI+mBN66bolvJacCuPIOtO3Aj7CgbAI09csk6vVQSEpadSTzG/J4lq4zl+3/a7T72eC2Ym3GLWuXIiMuGG9028l0KRFh0GrE5QF0SMrAI4xLjiTcMKCNPl6slGJtsBDxkw2oUdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftV3liio; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftV3liio"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9TVlS020867
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smrlmfw7K0HprX+c2QJnRSvyFhrOeWmixWsgoCpa1Bg=; b=ftV3liiohGEg4EIe
	9LQrLfU3FIAFuaLDEg8RC93bMs2UlScy6QyZZ4/BE5ZohLJA+sCLPC8fUZkLxiVD
	my1cJWBY/MU1MShbO+Qg2GXNtsfdwPCcoz4MhU0vn74UY4OR4taD2qRTe8bZkn/G
	w7UbY3l+qVommVSkVilZFEvFQZ2goCYMpKDRrx9gYP5/OQqloi+7dOuBrIRHWxdu
	zIA/GhNJjA00jw6l9QN10viBCj/8Y1MNMixDLsp3uKlYfJX+PahV2aQCQAfeR9j9
	agAQvdRMXu9H59SCExGqAip0KMxwZXMM/WiX9p5mWv7FeRZvGgGI2dZG2e6TMMGj
	/8ahLQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3rvww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-740774348f6so2958490b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690125; x=1751294925;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smrlmfw7K0HprX+c2QJnRSvyFhrOeWmixWsgoCpa1Bg=;
        b=uCbPrLoBClV9EfG/z518emw5h4roEwD4KExaKlYHPk5dsWxs078oOjvZHdqO3yN/QJ
         vOsu1qRvOlZVXnQs2lpUTIi4YT/LGSGyIwFMjRsN50QxvK1vNx35HmHOYpC3LX/KCjoz
         PYwJFyowow9qt2GIkU468RjjXFeFOcmnM201Puigtbh9MihoLlt1fGUrcIjl82WyYhzy
         QIHcEBRTYWylHKXMcHAqg/sRsCo3XNrsQQfbc270g2t6y3S+HkXLmSYLK8QLCXegf//0
         SI57uyco4YgGIIM6BPl/9knz32CL7DOALnQ7NZ4fI+1Zu4SdqD9T7MVPKVL5/UBYt2Vo
         qB4A==
X-Forwarded-Encrypted: i=1; AJvYcCWXoUgqaqOkzBg+iYdsL0GPhEjRScYuVi7tQ1wwa4o+RMkwK0V+/2NI4PHKEZhP2ggGOLTj8+9kIc+cdlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC557HfEbDAuusfTsSUxlEaaJ9JYtcvZmZGJ1xgr8r2jM+wuKQ
	ztOyggi1DPQ8BmF08Ygnq4EiwpSmcWKwQ3bu7vT3iHPSTJm+TsZJ1GHPvYH35gT9mJ8+jM6ub+S
	vLp6Lm7JaRnAT5p+7BIFDHqHGbLOino4bYdf96nQniPtQvvfZDCVbRpewvVkhjTT3+LY=
X-Gm-Gg: ASbGncsgHWhGbdvYUtozvPwKluAJJmfd2WUc1XKoVnEhMDkqD+TVKrRBvEn93dqkWPZ
	xM5SnzOWL4epVJhpQGRPNRGPwfxnlD9XaCkcGv337KRFkze9X7iVcwOanRc9sv6ZeBx61bMZ4K5
	BN8ozPQ6rZUyQLJHxI9G1tSXX4ZASXG2d7vOcxBybfeGLszg+t+RvL6n2LPS2uyok9d50esj7ND
	cI2hoebPGI4SAyVoI8BB7UXwqJElNh/ylhWB1z4ZYBns5ePH1SG9bVOWEXlq/hZuwXMQ+CGRh/e
	JCI/yzlPKhhuaqkuJNJLihIjvpa8Mfth3IkNV6V9rgiUaDlOcPF1vDknZY8=
X-Received: by 2002:a05:6a00:a87:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-7490d7abc7bmr15085689b3a.10.1750690124683;
        Mon, 23 Jun 2025 07:48:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI8H4aioeCCO3BadXRxVD5Z6GQweKGC54MAANid7328O86mBLGyJUYhNGAGHLFEk0y2GC6sQ==
X-Received: by 2002:a05:6a00:a87:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-7490d7abc7bmr15085665b3a.10.1750690124268;
        Mon, 23 Jun 2025 07:48:44 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:43 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250617-handle_user_regd_update_hints_during_insmod-v2-1-10a6a48efe81@oss.qualcomm.com>
References: <20250617-handle_user_regd_update_hints_during_insmod-v2-1-10a6a48efe81@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: handle regulatory hints
 during mac registration
Message-Id: <175069012350.3758471.8696092328804905972.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX8vJ/tycCQAvB
 8/PrhCFwCqE3xIDPjVrwY0ZdNoFkClCXRD2QHqT8b7yfThFs+Sf8PYXcYKkVRyYYoYm3EwBSf9s
 FY9CFXd26OabAvAIhAAYukGGCBcwIhXgfCPO7lsLFze9QpD+Uk4UT2EVXP/Q0++uLUKaFWa2JHe
 MCk6rvk4k6wTqxI81FQac3EnvZHMjEZPhWXZISqwffnEK4WgVN3c7uyWgmpb/RGtGOslrkOZT8L
 1s8PugekLe6bM90U6KFClnTRViFN7aedgHAanzn5gOHbXYSRXkG6m5P8ds1cT3PoVoC4cpEe/A/
 NmzAiAEVoLFRe2Z8cFvE8yIeHgpFOoHtsiiVC+5ncMCB3uEf6+LyUb2D4DvLwi5/WY8AmsawU5t
 7f7B1aTqJWZcIVx/nNPw3StnmpTGNWkX815UUY+SLUGimkFg/m70f2DDC0ezt8Qz7EU7VomB
X-Proofpoint-ORIG-GUID: lS_uX_DzSa7TNzxIGsi2WOhRcIqIvHF5
X-Proofpoint-GUID: lS_uX_DzSa7TNzxIGsi2WOhRcIqIvHF5
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=6859694d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ZM6Ol1wdqZ8AtCD_V_4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=926 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088


On Tue, 17 Jun 2025 09:05:59 +0530, Aditya Kumar Singh wrote:
> If a regulatory notification is there in the system while the hardware is
> being registered, it attempts to set the new regulatory country. However,
> ath12k currently boots with a default country derived from the BDF. If this
> default country differs from the one provided in the notification, a race
> condition can occur while updating the regulatory information back to
> userspace. This potentially leads to driver having the incorrect regulatory
> applied.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: handle regulatory hints during mac registration
      commit: 906619a0096747adbce9415e10b639cfd2c5e714

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

