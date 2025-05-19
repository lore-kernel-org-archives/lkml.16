Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78D21F12FB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747682766; cv=none; b=pGkks2OuX+FqGq8SAxC7HrjiGVedRC4XQ1rZ7NDoxEuR2N8FeKgNfsTLqfxXYtSJAOH3faDUPlSVvIUBHxvMlakqUa+bdOh7S0rS8+A8+ECwYFaEheEz/z6j8Um6ok5lNn2bWeIiYWFhK8m4JNlZeSaV5hr6ROieWSGZ/lqvIXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747682766; c=relaxed/simple;
	bh=9xuGA6fBDxFhENDH1SondD0iCWhT+zg49bTQjeSgZ+s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ak9Pc7iUrRGB4WuJXm5YDC8vN8mcpeAJwoDcybCBooWhU378IbgAjiIQnfTpP4sJN3aydMr1vW3DvUt8tViqpLTJdOSMaXUO24Fp23Y/RZoxL7cnzxxpSL9R8fb++DSAxTEcT7hZj62ITk7nb44kkl2Q2twket13BaSlchJA7BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5Im6j0O; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5Im6j0O"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so5698899e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747682763; x=1748287563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+u2mOvp6gwGiK4quOZ9KpEErRK+CQKraF/9fsG4d2Bk=;
        b=f5Im6j0OxeJsLA7+5Vk7MSrKaSMVT1+c2/oNpNddk5XVAE8uOgHIgSZ/WP1l16wb3y
         jQzyTe7KcNeIe2KWu9BSPosgnrUtnt9C8GsrV0FwDlckpOBtF0IaSk+0G9SH0Qud/rCD
         TRWRcu3i3IGGrWN/5wqol2v9xa5tae/8VuDeyJIebCRmiFg49sGkrZN7nkw0fvX6Dhm9
         DcX4NKmjsI2/0lml1Fb2q+uVLImHelCHALuC9+iO0cmzRWFRKAZEhiSGjICMxaK5uu1f
         Eq4BojHXju+i9lNrGaoEU+CHeq+exxNFKZ+Y0GLM572t5gnGFFiZZLWcRGoyOpTANHGa
         /AKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747682763; x=1748287563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+u2mOvp6gwGiK4quOZ9KpEErRK+CQKraF/9fsG4d2Bk=;
        b=KzRStf90CoU4v911+rLNjy/BJv9xmuroVFs4KoNyhS8vVt3d2OFDI0ByAhIdCrgbo0
         u4S7ZFHUmaAHxM66klPIpQE1F5JvrJYrqjXRBqTUOTXFr52eAnLpi/oGTi4PfY22xkMP
         rNUSTwQi4usKza/iSFvOWz8YpSiudz4mVygniRD/+c7IKMVmuuD5zcw8oWXOTW2T3qBt
         OGMDq4nrRewxiTykuPJQ9Zm3l93C/Jbk0sHqSx4LonJoq4b5xuMGgSM9SFosKtqFK0Hi
         hJZRERBdvPo1e63x+Ghbdt3Gb7V66+uyuWx6rhEvWDnf47LV5LdZMtPMx68ifISfRPmE
         6ieQ==
X-Gm-Message-State: AOJu0YzaEu532m/ofbZJExLMTcONon5oLDi7RNunyoYt/jjPcgkuxG36
	eRGd/syljS1Nu7RqRHDBeDhXcBG8R0PlnR+v9At7dsdLvSyhLds8xObhsHIaIl5d
X-Gm-Gg: ASbGncsBtKvoif6AfKiiVx8p9M1qeufAhXs0eEccmKxEjp+dgeGJTgY1SaKeOf69hIP
	SqugJ2sk6pFd4i3WD8fE5AuM+fA3+Qn8TRZRYNOjf+IKCu5/mSN9sXGNoazSvNyfZFeZEnXcffw
	geIkme30McWfaGg/A7LnQcYIrakNpVMr4SyP6lYBFW82F68XUNJnA4EoUmdTCl8RAq34F7KbxNO
	Vp/kbZMmRvbaEJB03Jcq24iqXdPwSNgNLgckXYN/YzcC2+Cnl+zy7kDPoMoRqDezQafJr/XXq8c
	Q74cR3oNlY4QQ52lGvrBru9qqj9i9YS1C+0Ng7IhqKG7dp6kPygBqJrmYNmhqsa/LWHbtovdsyX
	6oNO4MGxV9itnhkzYJltF5bHcf98R
X-Google-Smtp-Source: AGHT+IF+MDeZP3QIBEJzINtTXk6BXFYjgitD8BkKJznP22b6VtQvUEg9qNjqR89fCuy7utStHaoGKw==
X-Received: by 2002:a05:6512:2216:b0:549:39b1:65c2 with SMTP id 2adb3069b0e04-550e72443e9mr4107818e87.48.1747682762396;
        Mon, 19 May 2025 12:26:02 -0700 (PDT)
Received: from anton-desktop.. (109-252-120-31.nat.spd-mgts.ru. [109.252.120.31])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017ea8sm1998021e87.113.2025.05.19.12.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 12:26:01 -0700 (PDT)
From: ant.v.moryakov@gmail.com
To: trix@redhat.com
Cc: linux-kernel@vger.kernel.org,
	Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH v2] tiny-printf: handle NULL pointer for %s format string
Date: Mon, 19 May 2025 22:25:57 +0300
Message-Id: <20250519192557.1505924-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anton Moryakov <ant.v.moryakov@gmail.com>

Avoid NULL pointer dereference in string formatting by printing "(null)"
when a NULL pointer is passed to a %s format specifier.

This change makes the behavior consistent with standard printf()
implementations and prevents potential crashes in constrained environments.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 lib/tiny-printf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/tiny-printf.c b/lib/tiny-printf.c
index 2a7a4d286c0..df5f6829db5 100644
--- a/lib/tiny-printf.c
+++ b/lib/tiny-printf.c
@@ -307,6 +307,8 @@ static int _vprintf(struct printf_info *info, const char *fmt, va_list va)
 				break;
 			case 's':
 				p = va_arg(va, char*);
+				if (!p)
+					p = "(null)";
 				break;
 			case '%':
 				out(info, '%');
-- 
2.34.1

