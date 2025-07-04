Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A540414D29B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751640463; cv=none; b=uyJjEp1fxif4eHO+rhr+AcQgChTjeBskmtnvUQz4tSPDG9nX68MfY/Od8pA0+EHaLzntZYGvXEcln4Z3lq3poZbVsgKV7ioU4pm6XMb/cv7dyure5IfSixUHCPZkCA5mQU9TnjHvxY57QDrUls7eC2gjPRvLwusQAb8yxm/VDtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751640463; c=relaxed/simple;
	bh=eKKBx7o0N5OUou+fjRI0q8kwinzpESaXSwSaLCSZZ3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JHR3c3eIKr7IFJCsgV3h+6pPr+IfsaKLp3Iz45DTGl1hwRjZZ+0Vj0V0wDBOU8RauxxWMGPqhirr/T+7blAJAIKnxeyx4r0lcwLiH1kn5fWFjTWyW87fls4+7XAPOD8ccP/r7HmHnZQSuCuJSW9kiYTOjgYlbPlEtFgfCajl4yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T8Ikp5ZM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T8Ikp5ZM"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso572108f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751640459; x=1752245259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcqBYfe0a8O+cCCxr9qxFOZy/LUGrHysRh3pGTlrgho=;
        b=T8Ikp5ZM8w79RcackrCaWMd67e4b2Y4b6rB2ZasiijpOmsU86hJsr0I0Oi3RbkGi6J
         XGSY6w8m6tJvttoONFLmF46T4l/LNkJTC5ngKejlKDTmVUlWId21nvAWC7cVbG5Gfhoc
         HMIVv7EFy6LkGYEyUzohMO7jXovTAKjI6YM+3p25kDY2cXBQ4kMfRIX8WIoGrCzR/OIV
         Oc3B97sKol1IZj1XvtNVTV09gmkqhrWy4ZsPsqXdRCAcDAR5FB4fD5PoisNTflXy4B0I
         d1DKpgTXmlA3xTUbzP78/u+fBuVMk1B4bdb3OC/Y2Y7MOk1jCZQrRf9r+bXeu3tEI5oa
         Tq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751640459; x=1752245259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcqBYfe0a8O+cCCxr9qxFOZy/LUGrHysRh3pGTlrgho=;
        b=KFLnTPFz+AvskNhr8336syMYC38O+u/0pX3aEuJVXJRv8xeeGF+J3cGg0mj4tjqSDi
         D+i5HdEg27nDqRcR+vhchlhPpzqLqo8X0UgsGOrKabIlOP7dUpilAUD1XweObJxluBB8
         az+yo2wJEwPfNxx4d6Q3fkmf+CjnXAewLBOvydtYlQDxDlm19BwHx4O/0lC91dDi2SXi
         i26pDSmTFMq/lwkKWmc4sevegejlRGIBuKl09S5WWV58PSW0xyFC1eC44VbEIIeulM1+
         lqbNlvBPb1JeKAbZOhONb9cgtrchHWnaQUCrx21JOIYIEwAQsOB4fm9C8lSEJMp8gD9l
         2z2A==
X-Forwarded-Encrypted: i=1; AJvYcCVA6myvvt+3jGQ1GZw3csVW3QF1mjCS5VvA0QKbu3Hu1YX8PYDdaH27YnVs6UoKadFeympItMSXuhMtNVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbTLAxbNrXwJmA1dM8UA0yBrId+E/fE8g7zZNd8cyDgynxQUOM
	V7p8r2BXY0RAX3UFrJZd3w7DlAfQyX4rqm3EVQdvDjbn33E8E4LEq+BtcVsPHpMq90s=
X-Gm-Gg: ASbGncvTlcmF7mTdCl/p+wn0PJRycMDcNUHPALP87r8XPkPdEGAarUM3zPewzqnFMt1
	T73GQekXk7QLnTzujirMfdlZf202SC7zJCsuZFz5Jwo3EFRbk77LGSA68p3zQX655wLKzutqAsG
	27BTULIwFGtH/xuY6inGcmwG+wCYOObEsbp1hjt2Cw1fudoyNSAglgRToaE7OpVXgycGg7wiggJ
	jpFc5zfbKpMuCIa8AVj6Uw5zqx8kkj1YINUx9StZ/26WpNRN9e6aq1CA8RzSWz2JVXJvGDOKsvO
	TxUq1Nyv8J1Yv8ETdBReXfUqCkYGvCjs6MT/hAZKRJnjvauHsx7aZLkBDvS/aQ==
X-Google-Smtp-Source: AGHT+IHGtZCWjPLCd8ll7G0W0O7rhS5w+RvGTT6+ns5X11cAJVZ2tzPWQuy6V45xzCWyz1JvOCsyhw==
X-Received: by 2002:a05:6000:2004:b0:3b3:9ca4:ac8e with SMTP id ffacd0b85a97d-3b4964f7b7emr2517650f8f.44.1751640458912;
        Fri, 04 Jul 2025 07:47:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm2721539f8f.11.2025.07.04.07.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:47:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: Shuai Zhang <quic_shuaz@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] MAINTAINERS: add a sub-entry for the Qualcomm bluetooth driver
Date: Fri,  4 Jul 2025 16:47:24 +0200
Message-ID: <20250704144724.63449-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches modifying drivers/bluetooth/hci_qca.c should be Cc'ed to the
linux-arm-msm mailing list so that Qualcomm maintainers and reviewers
can get notified about proposed changes to it. Add a sub-entry that adds
the mailing list to the list of addresses returned by get_maintainer.pl.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fcc77c93f8db..7fee3d38baf8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20441,6 +20441,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
+QUALCOMM BLUETOOTH DRIVER
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/bluetooth/hci_qca.c
+
 QUALCOMM CAMERA SUBSYSTEM DRIVER
 M:	Robert Foss <rfoss@kernel.org>
 M:	Todor Tomov <todor.too@gmail.com>
-- 
2.48.1

