Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081F825DD01
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805624; cv=none; b=YarTwtvBqlwjUiRedKr5N7zKPWRgGCc220XcQcU/FV5K92ra8usR1niMEJVlwIh+iqAygZJMz0THV7rMD6sj32mRg2gJ/x3M56h2B+hKrTYCLzN4Lq4/bOxLXh8O7hWAxEzVgKkqP1JxyPm1vsxrh/yzTVJPYtHJssDz1dZqX+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805624; c=relaxed/simple;
	bh=wwPgZquGtv5ruN02X/fEQJ5qyMWldQS8yZQEL7GHlMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEQegM7t7imK6Gu+Tn3NFdjsTNQwgvjYwsRHUPwnHDNCrQZCgv4gce1LQeqkm+z/ZrM10txAQacMJlqMQ3t/ldxAvV6QhulK1CX0ohQiAM/FBORTVLrHdSkzhst6wAjO2rd+BXJ6QNpxQUrli1cTtbrH847EVFCUi62AKhsloxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEPgoDpG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEPgoDpG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OF3rnM015714
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tyyvulGuGpaTaUXvNlB8/sd2dCkHRiL8Dbbs2iTh6WI=; b=gEPgoDpGvLojpvmN
	ferkvyLbtO30MbcEM/UDeq31z2HtlUTqYLcGGFCbiqhn20mvxejazf9F/RL8ngGJ
	HhOCacnvpHcHC0MvgvMpdt6lwmpqc8sIBZrRB3qkhL28BbRfRpxtmWKuqNCmL7AY
	Lu0vcVtWZMoDhWtX+lEzqynmYDvJ3I/V6N+iVFdyc/pCEjONTR9+mQzh/1iyn5LH
	ouk39fIxE1HnWOXD6yxv8IT6FG+bzU9sNYyFtrLQJBflUfES9yTX8DmH9KDkFK5J
	SZ2fh9a/WactcTF/L8qKm+Nm3bWvLvSMjYizxqsA26vSZWR0ylXKH2pfMNThL8xE
	uSQFoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5pwws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d413a10b4cso141220785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805621; x=1751410421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyyvulGuGpaTaUXvNlB8/sd2dCkHRiL8Dbbs2iTh6WI=;
        b=h/H4Afne/RSeA0J+HbebqK8svIj+l8DgnfSwmH1owLD8T8WBYGwcmRoIW3gJCA4TD9
         KtyZF5u42H0LYijDbtjCsHe54XHP8vt2M8YqUKDm5639JA/wwlcLxQHe1yX4O5EfFZZq
         Yps//9CtBJEGnPhskgk4PWEHh+4JhqfnINx01jpxMVzWtzCJlkJVn46xWYsdUoCJbrwq
         JfFSPq5sX6Z2WXTW2gQ1Uih11mXTQprPVF8PTioVQ4Xk4+VEcN1rU703Btf8j9n2t+Nq
         AjyzfzmqKqO49QgPDuSGH+1U4u8wHkCGPmxfMq/zH/GW7UWgMxqOMZc0c5Lu8xp2W2tF
         3uoA==
X-Forwarded-Encrypted: i=1; AJvYcCW1PjOPOgo75KjWG8o60JRs3dnQOiYLzfk/IQjXurG253xZCY83TTQWWN443shZON4tbWqYcfLcHuUNuKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBxxQ4zu1Wt1V8Gj9+kQXmH9JwSVyBGikTnAuZiB0Wju5QXwgC
	LjGRuzg7HD1llHeaAnHf8xJ+9RrddZZnHlOn7A6aZYI/ifch0Ii+A2uBdm6UjMRAAAYKxZE7Dt3
	pcjDuOvNcGCaGlnjYBPMB1ZIHTWiS4ZBkgczo1IlyRvrm7WqKaXmUoKW8AlvilU2JAoM=
X-Gm-Gg: ASbGncssEUBLQ9jUO1q1RFVJ4Esgo/XRXp7S9twcBVxS3U9fYDQAniuF3d3YaESbgAR
	+6FSDiMfN7DLDxuQsXuWQYxhl+otFdC2KA86QoEatwlciHSa8YBnpVRin0QOhK3zvAHn21jSUzD
	EH4r6/VVE5rNB3qf57Y46zS8rSQ81Jor2CJs4CeFQ/W/pvTcmvfljoubPXWFpwtsmZhVhOyu4hn
	/jo6Fjbwk4N3hDcDowrtPSngIQ24NcLlE72WLzfgYUHOiNxUGTtQOVqpWl8EayhipDlnOucORqQ
	DBqZzQVG3LVluEvLC5wIwVtUAXWM22XA8U01arwTam8H0gJMr3NPPPTpv7zjXkI6QW3TrNhO6dv
	/qkcu4o/bK3E3jeRn7bX7xkDoLm7KGpFXVh4=
X-Received: by 2002:a05:620a:27d6:b0:7cd:4b5b:a202 with SMTP id af79cd13be357-7d429660f2dmr101679085a.20.1750805620734;
        Tue, 24 Jun 2025 15:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9xF1syLAiuEsqu/heJ8lpyFR46117M7xKVjAZCzFveTqDxwrpzUPLXqhhICzq+lLpzCaIFA==
X-Received: by 2002:a05:620a:27d6:b0:7cd:4b5b:a202 with SMTP id af79cd13be357-7d429660f2dmr101676185a.20.1750805620360;
        Tue, 24 Jun 2025 15:53:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f5980bsm17843851fa.7.2025.06.24.15.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:53:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 01:53:27 +0300
Subject: [PATCH v4 8/8] arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix RTC
 offset info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-more-qseecom-v4-8-aacca9306cee@oss.qualcomm.com>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
In-Reply-To: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wwPgZquGtv5ruN02X/fEQJ5qyMWldQS8yZQEL7GHlMM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWyxjU159/FTOyS5BGPqQoUzEdLnGP1il44N/x
 nc515L+9muJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFssYwAKCRCLPIo+Aiko
 1VmMCACerDOGChKCDcExtpZQRx5lJTaSBwEz4xFhjhGd/BKiRHyF/9eb9hrZB7qJg6JKmZAYtIb
 9CHm8W3pJwTyvM+GG6WKaI0CUexK2Ko/4bg0NHIiaSLaLJqmjq96/0zj+zThY5gves/Rqc4L6jT
 5LS0eQKJKYv6JfZSByY0HqD8epocnxMQaEaZVzlRViknEzKLVt5Xa9LQLqsGY5FOj/rOA1dqDwg
 LlZGrH+BpA7VVzXnU3fDiC9KG7BHfVVOPqxDyCPfdD9tEnuyFNFOIS6DAvhNwXgsZdn+gHGtRwp
 ThQyNVqtrtELFswd9kF9hoKFAMnkdKyEM9xun3P565ZyKOks
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: uQcE-f2ZQRqwlZf7cOWDhFOufcZsChlN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MiBTYWx0ZWRfXx7VQVImXdUCh
 Z52gSLyPlhUOMTCgY8CpiAzKGknWiiNt56NRBFpkmOZLZa2aQUpxG3tWziMHYApscr2OcEhDkBP
 bQU1TbAgzYAYCRttpFpjFrqmXbBrxBLgl9G7sAqquKAeovIGXdEE7Z2JzGIhUuxnG1d4NgttxH4
 rjmy+IiseNVlFmYE1/nxn0/kARnO6SBmbevp2vo3gaco6QaeV/s8oj5vZYlMEYdWns8zUmd0dTg
 okyYl5tAQqw+8PS8O19+L0ZAOVB4Pq9AW8psMWMGONW0Y/X6NBM/TvfIiz5U2/bQFEm/Gk8yLsz
 +4IEIIAZ5s3dFzmlo0ix3QLSe8t9UEBruWeWNEHMRsluDVdqxrTqrMd+nOFCxU+WObIT4zcvwWk
 QVcRVZRIL3Xx5ipjTEJlSajGckpGqQlvuioA4j9CmrwV85rGqWAgq1fxiyAdfnvPiGg8xPIH
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685b2c76 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=lpcYNmPcDvg0ODyLRbEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: uQcE-f2ZQRqwlZf7cOWDhFOufcZsChlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=982 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240182

Lenovo Yoga C630 as most of the other WoA devices stores RTC offset in
the UEFI variable. Add corresponding property to the RTC device in order
to make RTC driver wait for UEFI variables to become available and then
read offset value from the corresponding variable.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8998.dtsi                 | 2 +-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
index 3ecb330590e59a6640f833a0bf4d2c62f40de17d..50b41942b06cf1a3f43f9c754b3bf2e1eaa4d353 100644
--- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
@@ -101,7 +101,7 @@ pm8998_adc_tm: adc-tm@3400 {
 			status = "disabled";
 		};
 
-		rtc@6000 {
+		pm8998_rtc: rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 8ef6db3be6e3dffe4ec819288193a183b32db8e8..c0c007ce8682cacd1cbfe816ddb975c0a099ac89 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -592,6 +592,10 @@ sw_edp_1p2_en: pm8998-gpio9-state {
 	};
 };
 
+&pm8998_rtc {
+	qcom,uefi-rtc-info;
+};
+
 &qup_i2c10_default {
 	drive-strength = <2>;
 	bias-disable;

-- 
2.39.5

