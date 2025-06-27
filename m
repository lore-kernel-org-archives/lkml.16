Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B1B1F17E8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056578; cv=none; b=R3TJYAUFBHjeOEeILA5TDZK837YbWo+2MxoYmPVJR2vwuhoBo+62oBlc8DxcF+C4yD8eGTklcwjbDwMvaGtFtkmdq4kzzJP+3FJK7PmBv1P8clHyPuPcYu8iO9zWlOhYrDALRjgns6pPDG1+UYBUbYQotmd0cFA/pCv2vfcShLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056578; c=relaxed/simple;
	bh=wsoDeNMNkj+hLwQ1DwNHFKqpC6UssNz+leDyWs6Tw2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n5z6zi08kKOr1gLNRdoAqY9hFL2ha2zHEsFCGfDJQgXwNtQr/qLfx+f3yIjhsOh24D7SW2r70BdQ87KsEqzVURt4LhQ3t59K/i6QJUcgqIuzWDm9tKLInYS17tLvWMqsElygrzGMddiyPFnPPeLme+onoPF4m+V6ZurW5ql9i/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LlJgQf5o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlJgQf5o"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBxmSK027381
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dKmlYnBP9zOMxT8PZn1r52h16H/B0zHwpvwe0daHy0k=; b=LlJgQf5o0xsZZxNA
	RYCIxKueCv6zkmlNfPlFNVx+Q2Wdc6us2nG5NjDezr6G3fTqvFTGDbwy5GCVY1gp
	Z2d7w6LerftUaeJ4Jd8mwJEwlEw4w7cvjjGqyZz/igqRkfi6SZZIQd+NzhmTWwhd
	5L7g7yg0EHRV8tqPQv6hSOjjPk9t0Lfo4h9qPm6VfXmJISMXzoRqRptSsLAfmIyy
	dNbABuBECfU9jqU9xEcBX5nX6BKHi5b93F/SVOxpC81UOZPHE0d841JDTRjsDoWN
	O6tH+V3KMne2ALQ3e/XzA+jQ9sdWQ6JxjTHlyBZPgkRMm8NJcAIrfpxH+Jkiq5wA
	tOxCYg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26jc5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:36:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748f13ef248so296896b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056575; x=1751661375;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKmlYnBP9zOMxT8PZn1r52h16H/B0zHwpvwe0daHy0k=;
        b=gS+X67yxY91N8Rsb8to0imuYfiG52VvLLlQlHCc3Fg9vimAgqOfxm4bY5M9ZEQAT97
         0e3UPqzy2b9WAcA4Nz5zyu4MZuZIRjXcUYkVJhPzEQLe2PgEzT6LS09YBtvIhQ23cgLz
         mbZDvBCdsv6vWBC73HSdRivjJJ9PgVJrIb9tKeUuMiQ7BJ/6ikq9I6r/TRTowH24itCG
         b0dpNmUrXWJ8cnudGY49fmQm/M8HhOgd1irj6NM0w6kIFux484HKikCeclBsMefJ/GUu
         7W4YIe5rG8ol+UYv+l4Lt5aDAlQyEjZpHmfczAvS+zsM71EhQkjz0IBNZnR1j1OqHPwf
         X22A==
X-Forwarded-Encrypted: i=1; AJvYcCWcIqzr6l+1vWv7FaTFTwwzSie2keMXzWdY/L9EyizHPHl4sVzYoMixrFUTCc41GtVVyYz1qgsPAlONUYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyry7VSZiVJGVlLoqURKWTS8eQ795wGkktBfjAWqwL7g6AtkP8F
	MHScBxDzbHyaeP/+X5AJN8bs09uGLBzCkXORGo0m6Td1gWMUEzpvlmkGOil6aofHIAj96CkehCU
	UznhwWbO/XKZZD69e+csuBlJutFc0j7LTRR89rRrSjhEcDp60qtnVzfmwmccNsyfbILs=
X-Gm-Gg: ASbGnctPWORce647niBtK0Al1ToW8+uvr/OA4o7axNnmrPvg4oBPAmZkPe3OZ6aRKgm
	1eKDcJaIH6pIdpLL48SaYk42TI2oVxPkhmCM3IsK4aly7m5YuyyXSHJoSxWxHpYjy2owIzmrpRP
	+kaIIGunzfTrnEObtSjlMipanhm0qYOgbUj0xt7QDCcoTXPXjG4PwaJiLTHJubolYXKziM38/OO
	eHtauW+jbzwD5pjbGcm35equMxJaEaThgy4J+VDABNshljy6MKKCYQ58itf2uk7BFsWUR645U01
	l+SmXhJxrVr71OdAJy8et6pRPMazOt4rSOm6Tg8nV1yGOrgRclxSRnrxsDw=
X-Received: by 2002:a05:6a20:7d8b:b0:218:17c4:248c with SMTP id adf61e73a8af0-220a1696400mr7154812637.22.1751056574743;
        Fri, 27 Jun 2025 13:36:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvRRER8EH+IDOvZPMZ8NqWYOV/aI1CaW87KVYa2720l/lwfwzGQgiN3cck/ApDlyzqHXs54w==
X-Received: by 2002:a05:6a20:7d8b:b0:218:17c4:248c with SMTP id adf61e73a8af0-220a1696400mr7154773637.22.1751056574326;
        Fri, 27 Jun 2025 13:36:14 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31bea0bsm2240472a12.41.2025.06.27.13.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 13:36:13 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <20250626-fix_timeout_during_interface_creation-v1-1-90a7fdc222d4@oss.qualcomm.com>
References: <20250626-fix_timeout_during_interface_creation-v1-1-90a7fdc222d4@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: fix timeout while waiting
 for regulatory update during interface creation
Message-Id: <175105657343.1441396.2046714051243602990.b4-ty@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 13:36:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE2NiBTYWx0ZWRfX3WXPHNVgWLTm
 HwmMWwxaQwIOeNdhDgodES+OUXho44qR0OPBi2Li9eZZqx9S5mmD05l3OHwFRrC/OxHWBTF2Iv/
 tIb51lerx1DbPS7qobVQU0EMMC7nZHYYF58YIT4xfZCznxho5i1pNjoJ7re+9a7NnmNP8sN410n
 9ysYItfKCicQ3IvgupUZQpMd2CFY4gDbMlYRJMf7YXY4DwLs6L7SjbLK34owRGzW9rSH29IlU/+
 JvSnz9qq17wVHL9TUTCNZUeUkv5QUy2v4boCQ1DaVzhPzNoZgqvCX6u1jnGG9noZaoeJyWF/YOq
 8tYCJpSn8CifjgUKVzxXe9PEM1nKetH+RoyYG3ic/sT996JofHrs2/m4muEjhP0CYwO6rYDZQlR
 48pY1JTKbwgFIg/bO7oO2Kv4pnkBjq2NWUZmX4k3Ph6p31D7V4OiygbHMrLAjzhfIcSy1luu
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685f00bf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xtsjAY5F9q7pcwWWpd4A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: VKWI6H9zJFX7M2BUMFakzbQln3KgZcqF
X-Proofpoint-ORIG-GUID: VKWI6H9zJFX7M2BUMFakzbQln3KgZcqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270166


On Thu, 26 Jun 2025 10:49:56 +0530, Aditya Kumar Singh wrote:
> During interface creation, following print is observed on the console -
> 
>   Timeout while waiting for regulatory update
> 
> This occurs due to commit 906619a00967 ("wifi: ath12k: handle regulatory
> hints during mac registration"), which introduced a completion mechanism to
> synchronize the regulatory update process. The intent behind this change is
> to coordinate the timing between when the firmware sends regulatory data to
> the driver and when the driver processes that data.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix timeout while waiting for regulatory update during interface creation
      commit: 6e17bbb5a86e6c68d65e38dfc850699e7a0706cb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

