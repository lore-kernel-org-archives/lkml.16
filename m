Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F744EAE7
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 19:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748199633; cv=none; b=M6OEHQV+TOAPrbt8fBgdl6yeIUL3rA3q6HtlYfjDr3inonWlHt79J4/45AtLoHdoKS0rj5PABr8969fIaG1XW20s2Kdwj+5bHTHeXXFp1mmNmMKS3+rhPQVC/yHEEtdztLuEogSu/lGCXRUYMw3zPM1kLurjfgC1V9XWpX77UPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748199633; c=relaxed/simple;
	bh=B85VVTyqk8cVv2J2dpmt2w8VDVRnFq3MXX/CJMWFGXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3sEM03IqftX5oOvgXsenqucVjDz7Ht7RSxspXmxdouzhsIdCNEi+YmZiYeVy854pbvsnWoW4L1KPvyLygFNLRBtZd0k+i9yxAQl2/abC3xvmMFiD0f55Pmv3DfRPiDV6zEtT1D41al0f2LIDvwNveBCULupjP0XMtRgtw02RCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pl6BnKoA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pl6BnKoA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442cd12d28cso2061075e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748199629; x=1748804429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RjLFxqY7XnLccRUOwo/zYDqB3IdQnhxagjUTUuoSWKI=;
        b=pl6BnKoAvoIVj5IENAreM0exl9AdT2uP+LLBKx84D+a7UNYesyVkf7aOvzMtThKjAB
         Ry8f7J0BTCuibh9l4Ye6znQ6JzBkXqjcp4pUtQcuRjbh+5SH8OiDJrfSfMNt1wBmjUjL
         EOSibsadJLloRnkVfhxcjfFsKnEBr9m7Jij5L6z1IKDfuzS0i0YqJXzIAm/ucdnyqbAg
         fv8eUWCgKNKirjEthnE5NC+sobgF8AVwLINIf08sQNo2nU765W9mgWNl0KKGjVJrzHoX
         aQGvF/jqWqX7KFjJEamSKwPpp+rsJHIPYHaw+zBB2YESkpANHy+nGkWsow27DwBGOdcx
         HGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748199629; x=1748804429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjLFxqY7XnLccRUOwo/zYDqB3IdQnhxagjUTUuoSWKI=;
        b=eG0fktkKxfXebvXafuK3tSXm1l5yS/RKHvY+w+MHaFjHrBljVD3F1kaCytAafGvIDj
         caVRnB/q1p2Iq22Q7uAh50GbsEBa0usipRfHzuJmN9oqpjHD17nSldP2aPOas6LoPiv/
         0dzVZo3ySmwlzIYPee3+RZjQi+mHCbrOtQDsuw9W1pLJH8lxObyrJECIm0ci36UFlXYv
         QXfGb6PbuQ7/6b4Ul0H1t8mQaKDbGjawjAWbdpwoKlu5a/2vV5RgayLcgKjeSQ0Vffix
         kT6KCFpP3olV93YV7S0Ptrgu8H2XDtvbXyVKSEC1E3V1UhEOsrPXVsJNsnQaadHJJrvS
         Njew==
X-Forwarded-Encrypted: i=1; AJvYcCVXkqpmtzj9IjBfjvDUGp+2ZApA1SiIjivrp5oQpMsFFk8gxY/i0Zwv0lYf1Z6ISU27Ibr9FkYP6deVV9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYcxnBVxYfuQSZ0XKfDaubbXwHrbehrFyuJp0so0X0HMY7N6gm
	fdJFCNN5p/NQ4j8p7JPT4eO59vshm+SdcmdCcxflaQiAFOWLqEZTfrxgRemRome4iGg=
X-Gm-Gg: ASbGncsyn7N2qnnLyk9gQvvy81C+gv5QVva0jASo2pXlOOHMj39gGj3ybVnMvcaMb2p
	fyYWU6g78YxcLz/H/OuqcI8/dRpaQKjZhc2anDXRsdndriJIDA7/OfaCchLSS2liVfHslilxMYw
	viTRMQZlf02cvR6szMw3hEhjSgw9xJ6MjPUC7ZMyJgnRJuCvkeasyZ9QOpS3Cqz/Je+GRaeQfzm
	CysUY43Ztql8qN4Sin+GrxfSBHW5HBUFy7shit9YMH9PEa2vA94AIfYvpo0qPRJJMrsOOLevhEh
	WUBhSzV7dMHWbROkIynN0dVFcZkjo//acuFald+HgWpM9umLcBAkHs3oEmJHv1Z8+A816p/6
X-Google-Smtp-Source: AGHT+IGcJtSyI6HBYQjTOimW44zIP6UUiFecVnILao/qEPMGVovWt4I3ZyyZO/nyuRGDWyrSto3LBQ==
X-Received: by 2002:a5d:40ce:0:b0:3a4:d8b6:ca78 with SMTP id ffacd0b85a97d-3a4d8b6ce1amr319886f8f.16.1748199628644;
        Sun, 25 May 2025 12:00:28 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d74843b2sm1629864f8f.53.2025.05.25.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:00:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] Bluetooth: btnxpuart: Fix missing devm_request_irq() return value check
Date: Sun, 25 May 2025 21:00:21 +0200
Message-ID: <20250525190020.27286-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=B85VVTyqk8cVv2J2dpmt2w8VDVRnFq3MXX/CJMWFGXo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM2jEi82njqFcOjm2ocR19/nY4zOaTn8/mG2Vy
 BgID+c/ufuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNoxAAKCRDBN2bmhouD
 1/j3D/4tNb9p4+zQ6Hy51btWhPjOGB3zxCxwZYTIz2whrJZiQ0sV4AHtn2jBjw1sOIJYf32h/Yi
 +LSNA+ITgfNYVhw1Ye02CL7nCchSnKJ0Lslhih42WkuZo/EAolSglMtvK0AT1I8mYRCNWQi0547
 v1ur1tv9oEDNyQ0ADBScIZXLMVGeLP6x0RhPItq75iCUcpsPK4o4nXwa4CRY/f2uO8waUPhhA/t
 S4Fy0E3uELhWvYTRm7WQkqRZwfeGLfLHqqj6CiNK6TNHvF5Kl79mobzMQawlrOpBekG5dUTwBrT
 yaf4myzQohHYey6aJo/3FV4hV30Zl6BP3/7xm90HnAkHc0PAJ0cstilFgZy6BZP33680diRZ2Vj
 YhGrHZnoq+D2Y/fLGQBP16kvnpSRVvGabhVZssF5tnvq6gFrR2gnn37rGRJ+lqzXg2F7cNtg1NG
 Gcqn7Rkvtcs54N7cjdLnQcZf/oWi8+yo61nF07wL/AanSZ4a2dOWsKpX0VsDbHuJ7QCAbuvjsED
 JFGVMuAnaeJsMv61vo0jzk3tlY/cgEvp9OxPBljFaEIgcIQkBkdm37tJ7Ut+Td6HHNV5b37YAOL
 wUzV4v8MeqGdDoDX1Pw8H+BjiL3csva7JinarnOyRnzUEUUj+keVYkyIMRyX/GEj+fRogJyQko2 V2f8Xhttd+LsepQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Return value of devm_request_irq() must be checked (function is even
annotated) and without it clang W=1 complains:

  btnxpuart.c:494:6: error: unused variable 'ret' [-Werror,-Wunused-variable]

Setting up wakeup IRQ handler is not really critical, because the
handler is empty, so just log the informational message so user could
submit proper bug report and silences the clang warning.

Fixes: c50b56664e48 ("Bluetooth: btnxpuart: Implement host-wakeup feature")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/btnxpuart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index b34623a69b8a..6b13feed06df 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -533,6 +533,8 @@ static int ps_setup(struct hci_dev *hdev)
 					ps_host_wakeup_irq_handler,
 					IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
 					dev_name(&serdev->dev), nxpdev);
+		if (ret)
+			bt_dev_info(hdev, "error setting wakeup IRQ handler, ignoring\n");
 		disable_irq(psdata->irq_handler);
 		device_init_wakeup(&serdev->dev, true);
 	}
-- 
2.45.2

