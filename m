Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308371F8BC6
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731245; cv=none; b=JIOw+TQWrbYwKG8HR0DOqivBFY55QXFF4BEIi7NNbQMmDBLkr4aWZIAMLiWc8Hoz/lJfWKZsAKOm4yFJa0Qt5U6LaMiS8VVV/xoK3RW0ifYX3/EpMWQNINksexfHamQNDywK0eCuFLeMtpWbPGNoPPBDNDAjE6UjCrLIDD5gVzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731245; c=relaxed/simple;
	bh=t/rZg2mXoS35Z6g/Fc1ahHAw8Dong0aRc6LecgnXaBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQHPSLjE5WcfWZskHJQl14kmxCjbZ3hsFP32ADmhk3iEu1wbzn1sUeVcA+JBczGzXvHfG0Vl2KMijlcmEhRQqpTc0V511ysAwVyOtbQMd22oZ/nczvwq7na1rKf8hFTSC5SCBE5YRhE8ev+mbl5mBuGDC2NYugTLmsN0XOTReZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kfm+e0gX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kfm+e0gX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlHO0015264
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/47YVhRJHDkRQwljfohl4e6sBDrvrN8mrp2H+cyoRUY=; b=Kfm+e0gXMOYuSCQi
	fd7M/lRqEXF8FgVp9C2C9Md0QYX/QC/oUtjvF472QtHC3hanXoUUFxywffpbwxF/
	c9W75VjZVyOVhi9t5RcWwAEpoxUmRaqghmOzRSm8CtFSg9hfkSST3TJFBFoKZ/5Q
	v84SBpLX67FbZHvcRwhQMYXTN0MXLFyGeZ34PMgJY3DGNE7xZirGvxNSQQ2Fn8fZ
	/CRpkV96QQtKDPBrpIPBrcoJNHkmCFiP3fX7B6lrgwCSgsqzGlvQI/TCEJQGJSUm
	3y+d/1fcv+e8Rk7JmfO/cqMdk97kGnerTB7EwQ3r9RQUhCqSVgakgzJZCeC2IOhC
	mTD/3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqgy44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so735856285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731242; x=1751336042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/47YVhRJHDkRQwljfohl4e6sBDrvrN8mrp2H+cyoRUY=;
        b=EV0G5qrFYjNiyXSjC8wA6Goi0w1X2/7UEanFU1HbbKe/JcRa4d/0ij4fKAQ+12JKGC
         xrpRzvpJh4a3BaL06uRW+t5Mut7OjhHae7Rw9dHJjOR04A2TlHCYYX4rqkEW1WK0LDQM
         K9KfBF04rtsoGby8P7ggrbMm+lXZ3w9/u+p54AHjlh+hSEm+1t4iVjI1I/i9XZQ++pZV
         4d/JsYiE5aL8pLHnxfZddEcqmlVX1r2+vVsIuochuh6p5AiBjAPAhHOuIZbdjte8KN7L
         xmEAkRtRn4ZmPxKInRMNklrpyn651G2jaDYJCSH/KeWyzHCNH6qUQ4m9TG+W1y3b2Jjb
         FCPA==
X-Forwarded-Encrypted: i=1; AJvYcCW9YXSw2uxgC8SByCOc6QsLuGN8aNVl9LbFFjVgaiZOZuI0yAUm+F0Nc5iwrlKQmjbnhXFFUuAJbhomVjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVkwmrQVXpQLpSqKvXdaIVW4dH4iPLNOU8r2Q5ftASzRffI168
	9JMy+hnc1DQ1Vu29KDpOiFI5eGfbNp4BjC+hILBourtQOaltCCNlU6N0VkeaHNg8zax776iw9Hk
	0Sm6im7WKau35L9WotbLp/4TBVvqoQ8G7XbThwuUVH1jVgBw4G2PyzRl3nZH2mOR2haY=
X-Gm-Gg: ASbGnctU/dsQc0/jKeFgc8fIN6VASwty4r/EOZMdeKCGqi6nGbahze04LrIATqqSIws
	qyZ+pzNNWXhnVkG9dpBqtSDCDd0VXSHUdLBFk4GO1+qOLquNLo1wrualhUNOiD62MOMx4QmorvL
	Rv6RTiZgyZn/E6IY8EXunOOboRH2fYag3C3EMl1cGsXb5TeoSO9RRYKSrmPStoVnwcYtmHr7lwf
	kuVjIPjVJy3tlDQ6rAC2VauVk5p+T29FN9X1dFzAbbuQOkRJ1rvwhpvChIkKcqttoIKPO/iXSoJ
	aEtCcEQfxhy0Ld5DsW/39nAaPmFLxXXTh0VD74Uu/1kSpuElsW044X35utdOFzvOhk616vx6juk
	NhBRCi7Yon0Ld1G8g5WyIs07RpVlKBwRayng=
X-Received: by 2002:a05:620a:4246:b0:7d3:dbed:869b with SMTP id af79cd13be357-7d3f994985fmr1943749985a.42.1750731242069;
        Mon, 23 Jun 2025 19:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqNvGeq31ZsFPXIO/lQgxlb0Vn2tpiIlaT+TQgY4zyabgD3bBEA+zw9lFvTIbJzIJ89IyVKQ==
X-Received: by 2002:a05:620a:4246:b0:7d3:dbed:869b with SMTP id af79cd13be357-7d3f994985fmr1943748385a.42.1750731241667;
        Mon, 23 Jun 2025 19:14:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41446e2sm1637764e87.32.2025.06.23.19.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:14:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 05:13:52 +0300
Subject: [PATCH v3 1/8] efi: efivars: don't crash in
 efivar_set_variable{,_locked} in r/o case
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-more-qseecom-v3-1-95205cd88cc2@oss.qualcomm.com>
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t/rZg2mXoS35Z6g/Fc1ahHAw8Dong0aRc6LecgnXaBA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWgnlIwD1YOHrg11CPLxY9aW5PbRmv4EaxnsBp
 jEGag+qTSOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFoJ5QAKCRCLPIo+Aiko
 1a8uB/4pt+r79WsfEV7XaHTaHhmQdEWSg55qYh+hYrZtxbNHOACrQMrGLGjC0vOndbSWD5TXR5T
 dP+t2VrJNBLG6p6om4m8idOSq9Uv3Ga79iLTOaKPch4veQwUF4PnciRKG8f4ngPBdJjfD1PzNvg
 VO2EWAQjCbBXiH53lt5Os660fgYfzZa6zDZCXOMQrhIcJq9c9GQ/mHAaCGBleWRILQCWuGcth9B
 cgEC+cVA55MGnOMYZpbE2iOzaO0mNgw1c9lH+8Q6W/bfRPO5RO/+YxPXXoKVQWSCJ08RGIURNxx
 I7rwPZkkwKOL+6wgbNKyoAk+tMmx9v3OEPrkiiuNDvDxd3xW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: E6LBt_bXBZFKoc-UOLnIlK2Ki7mnPpYA
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a09ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=2-Wz6HayXEhRivmEhXsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-GUID: E6LBt_bXBZFKoc-UOLnIlK2Ki7mnPpYA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxNyBTYWx0ZWRfX8bxCy6BnLT0r
 2bujncl9BFeR5rtMLzErh75YJVfi9Wj8zM3PZ79J2tXdb9DM+6lomYiagYTFKzZV92P4y0Kk3d/
 A0rAxGVUPNbbpkwEJwsPPKmHJZmFcgwBVF70RMzxqY5oLW76XwxMb+Bdj+cP4o6opOQ5XWWu6ue
 hEZGKrTU4WI6nNgFwhIb9EIUMqr9lRZ8wY3Nzi75rfMgk1BwmIv+GH3A9AWXDyODCeL1aBV48L5
 5Ydp5sfs5UX4NVc0q6NtzlOSQE8g4bcDF+GeDUetHRaqKlCc6loDiAqPiR/5RvZgxXoMHxL8T/u
 4PwRA4yiZG0TPZnaV79Tr3ur7FPT1Z1wBG7PtLP4nmraRPWJJqL0WO1uvsfuWSDaTTjCWz1p4Mz
 ClT+2Lc7LMGvq254B/6iwMocrrMt+VH2aJ6+Vvx2xHZCiVWD1u7bjC5rOrNrj5tD8tm8LpLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240017

If efivar implementation doesn't provide write support, then calling
efivar_set_variable() (e.g. when PM8xxx RTC driver tries to update the
RTC offset) will crash the system. Prevent that by checking that
set_variable callback is actually provided and fail with an
EFI_WRITE_PROTECTED if it is not.

Fixes: 472831d4c4b2 ("efi: vars: Add thin wrapper around EFI get/set variable interface")
Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/r/aFlps9iUcD42vN4w@hovoldconsulting.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/efi/vars.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.c
index 3700e98697676d8e6f04f061f447391503f9abba..11c5f785c09364f61642d82416822cb2e1a027fd 100644
--- a/drivers/firmware/efi/vars.c
+++ b/drivers/firmware/efi/vars.c
@@ -227,6 +227,8 @@ efi_status_t efivar_set_variable_locked(efi_char16_t *name, efi_guid_t *vendor,
 	setvar = __efivars->ops->set_variable_nonblocking;
 	if (!setvar || !nonblocking)
 		 setvar = __efivars->ops->set_variable;
+	if (!setvar)
+		return EFI_WRITE_PROTECTED;
 
 	return setvar(name, vendor, attr, data_size, data);
 }

-- 
2.39.5

