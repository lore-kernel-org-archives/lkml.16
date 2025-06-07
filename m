Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D11F03D6
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749281050; cv=none; b=Gs2XWm1cIjI9pZXWRU5F4NyvrHu+2BP4u/1PlMwl0UQivp59HT9/eZ4Rrwql3xsn0mt6AdsR4KYGWCc7jDVB2zTSmqcS6sp2bjWvh+SI8iYCuVvhMzP24aHEGb0ST9OjRZddbTvoKKW6ldIQvcjCc0LtbpsL6PB1Nfu4/B+o6jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749281050; c=relaxed/simple;
	bh=16eY4Q37W87AE7+7IPuiwlaJANL22ydz0WuzWFglYrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SDz9HXfQ+YYWONB5YXgT3V3llY7STuExapG2k5vS4d/+cWVxBfDvUQRJvgx37DswG+fdW27dim1h5a9K8HRG/zpnRtHyiAWVK7/E8T1cCsbpLSUtq3ZyQwQR4Fbxz9ffN2zYGwjHXrKTOmsli4xAQa7AI0RwgMSJGdOelhXC8EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lAxpthD4; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lAxpthD4"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5574SpNb028869
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 03:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=pps01;
 bh=9/Ah1a6QJeItIomhPID/8HHa+OcL6iGpQOdUx8HtaqM=;
 b=lAxpthD4SMh61Q8yT17hUP5XWAdFt3Xcl92rPuGD48YwCuj1O+cFUawOzFdNOFKW3Dhy
 +0JQRjHlqJoE3an9U9XG0d+YPeTai1P2xYSnEVsHbyH98KGQhnmgU5cBmmJXr6E78aDN
 E908VL8bxEanNsED1f6CbezlXmtnhvcHBlCeTPRT1FxmHAaMOiMgiYIdJf7EJXqlBNEn
 CW3veU51fR9pNBin/4sLoj7Ip8anQp/10bpKpOyVtAveifU+rjkQQuHACe+vRozerjhs
 yUx43McE4dZtyiGj/hNO6QC8eWaBQgOABcsvD6IpmupIM15Ot2xZRXx7l+4SByz4i6IZ mQ== 
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4743n0mdsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 03:24:07 -0400
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a581009dc5so42481981cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 00:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749281046; x=1749885846;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/Ah1a6QJeItIomhPID/8HHa+OcL6iGpQOdUx8HtaqM=;
        b=Zfohaa7tq54lK0pd21Avq5btbRLX0YCI3PvGRH2ShajMjMkiDOI2Tq5jMY3hZnXibW
         RKbZRqwJWg3wWRFshCVsoRVVD2YZV3xoxUcu+7Ex+Z2r9gk8CAPc2fhuvY/Eeyh25J7E
         L9E0sNwiz/MDA/PCsQVJQE6OiodaGDvCBvulXcly+fDlEkIt3YTD+LSlGGrgzdgxFQII
         8pwcO1f/BFU6L0YWymwMlQe46XkVHWJlQ5OxZbRqIBfV9wMHphqcFJMxrCILMb3fQnpx
         7QiQlIrqntrIUYftkBhxvjtw0wXyol0TjHvrCLeW48OUGKRvNQFiOEK5qr0c7+gaNTYK
         AQfA==
X-Forwarded-Encrypted: i=1; AJvYcCVCKCR8RcwkTHTFEouXXL4elByj/rVP/6rSiPFFASCIj5Ug95JU9BXJJAZOJJg6MTGejU3TYtdAOskc570=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPJK4vuPWjzYcz4yr8Fz6wdjqFeJ9m8xhd2N+stFPhnOKOwfF+
	VeVQJE/A6kERzKudQEVABaV0FhGlZOhS7fBCKmFMEqw3mt/HRh7b4T+sxPTQuQ1O8YaYaYY+F4O
	wAEa8+NisvvCqkeOttyMFDiyDzaZ+8X8abvCwH/BBXeoFqeqaAHmK3C7d4oXnNA==
X-Gm-Gg: ASbGncswv8xerxXwUgiOUUU5v1Yg5rie62NTTap7gxUSry5MzoIUrPB/MTzd7gPFD+4
	bepm78D0mfrHCW+AKuSiXly/+fM29fe2CMqmttJ1LpylzkaPepkqJv6jpiKQr3+4kCRI3JSjRhD
	jk3FuHUrxKMNM0DbH0oeHeKHQVAXeiI7rzLYpOU9OdbL5qrFTteKfm4bTmegxSfm4WaGT4lTDRQ
	8x4nXlKds9Bl8nnfiMNvlTqurXiXoomCVd2i9Q83NgDYHv4NNS7aB2shf/8yBNX2N0ksruvH/Es
	cnoymQqLJZzwFxSVihsoUNWtp9Tx2RzS1kkaGJjAsrqBuJHFXjyW2q/p9JEJPIzJDwoS
X-Received: by 2002:a05:622a:5c0b:b0:494:9d6b:620f with SMTP id d75a77b69052e-4a5baa708e1mr87716601cf.14.1749281046649;
        Sat, 07 Jun 2025 00:24:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwL9hwfVdWoMF4IGdKHkISR/GP0DzgccEFU2YWHlMpkNUrVKBAw6X+nLvOrgmX/JAATQTXPg==
X-Received: by 2002:a05:622a:5c0b:b0:494:9d6b:620f with SMTP id d75a77b69052e-4a5baa708e1mr87716401cf.14.1749281046215;
        Sat, 07 Jun 2025 00:24:06 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a61116b780sm27203511cf.19.2025.06.07.00.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 00:24:05 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 07 Jun 2025 03:23:55 -0400
Subject: [PATCH] compiler_types: Remove unnecessary indirection in
 compiletime_assert()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-compiletime_assert-v1-1-a8991a9be729@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAArpQ2gC/x3MQQqAIBBA0avErBPMSKmrRIToWAOZohJBdPek5
 V+8/0DGRJhhah5IeFGmcNbo2gbMrs8NGdnaILgYuOSKmeAjHVjI46pz1YV1vTVKOiH1KKDCmND
 R/U/n5X0/bTfh22QAAAA=
X-Change-ID: 20250607-compiletime_assert-13dc76f26a92
To: Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org
Cc: Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749281045; l=1526;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=16eY4Q37W87AE7+7IPuiwlaJANL22ydz0WuzWFglYrU=;
 b=qFIcHqxMg84veGfkTU7JX+PAUZ60mZn7l/lsUDUeC3j81QuWKvJ8kgNFx9UVvA52DSzyS/r+/
 tF0ucwqkOK4AO0XGsqzXgSYS0tXdZIOhE4dAXgCnAtzR6dyJSrIM8WS
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA1MiBTYWx0ZWRfX0qE+K3YRxAtx 6iPHfCy/fmpJa3IcbA3CmbzCxryrQyN/NynfxUYP4YrYcpxkyiMMCVIiHjbZ/XLW3cWpKLvyh+i yQ/mfOp6lRaxBjgrQylJmwWYNVIr0SSLXGiSFjigHSRmQ2Bb42uHC0stJgj6j8yoaYAyE0izgB9
 bjKDbcYtuk3Bz0lwAVLBBH73G7keEu8v35VUvsJHld6BJgcGlBw8WXHduf+aAFhyx+TwIGJL+k5 6nEcMGQhvLqlytur4wqlKg/G6ik9s2Ypgt3CzUMv+T4KzWsaO7Jklj4TBm6Onxr7ABPunzjqPOl 35FgUrMUlr3tO45CEr61g47N4zx+B7PFHzRHvlSQDZ0hRLjEWjj36dhCRywpTnYG6ayPwhrG8pV L5vo//AG
X-Proofpoint-ORIG-GUID: AXd3-HailpffNnfkYgRHHDl5xjCsL7dT
X-Proofpoint-GUID: AXd3-HailpffNnfkYgRHHDl5xjCsL7dT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=10 mlxscore=0 lowpriorityscore=10
 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070052

compiletime_assert() is the only user of _compiletime_assert(), which
uses __compiletime_assert() directly with no modification to arguments.
Remove _compiletime_assert() and use __compiletime_assert() directly.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/compiler_types.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 2b77d12e07b2..60d4fc8a89e5 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -552,9 +552,6 @@ struct ftrace_likely_data {
 # define __compiletime_assert(condition, msg, prefix, suffix) ((void)(condition))
 #endif
 
-#define _compiletime_assert(condition, msg, prefix, suffix) \
-	__compiletime_assert(condition, msg, prefix, suffix)
-
 /**
  * compiletime_assert - break build and emit msg if condition is false
  * @condition: a compile-time constant condition to check
@@ -565,7 +562,7 @@ struct ftrace_likely_data {
  * compiler has support to do so.
  */
 #define compiletime_assert(condition, msg) \
-	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
+	__compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
 
 #define compiletime_assert_atomic_type(t)				\
 	compiletime_assert(__native_word(t),				\

---
base-commit: bdc7f8c5adad50dad2ec762e317f8b212f5782ac
change-id: 20250607-compiletime_assert-13dc76f26a92

Best regards,
-- 
Tal Zussman <tz2294@columbia.edu>

