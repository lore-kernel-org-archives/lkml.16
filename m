Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600FF220689;
	Sun, 29 Jun 2025 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202886; cv=none; b=AFWPCTLcedZQ2gsqUE0rkr+l5vaUyIO7kSuYFDb+jSwKCNmvN8Mrrzevcdpyu1fR9B+g9JplXLJDG0uJF26sBNSwmbveI+zZLriF7Krcr4BIIv6FJgrrgVXa01Ui9bGTgi4U5WTJm+1hatTcZzgUPVlw1DqXGyAiKrroQDVjmIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202886; c=relaxed/simple;
	bh=n8brHU06/WZS+wxA8k6rtpd/5/bH43akiypS2LMKNjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOnJf43JEYIKAvZua9FBYcBYfy+wnwjC+6W8K8NJKhUfC7nCOfB6ZyexMoCKR6GDR11ny+e8i2BJpvEvnlRuogEk1MuArl6Nsr6wlO7W6LfuKtoCtyQzz3RTj5PyKf3fAEgHzaDtmE90DfJ4aOh5NDskH7iJxAXhUvcPICvcTiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDvukQzY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDvukQzY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso987471f8f.1;
        Sun, 29 Jun 2025 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202882; x=1751807682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fkbgeT8w5iNHuRxX2hKakPaBsIP0X1WqDdO/BuHWEo=;
        b=RDvukQzYVHrcWxMRQhGNjFx7zSRplXb6s5gIOqK25a8tjENQK6/2bNMD5KfLq6OiSC
         AtshqkR2n83VnVtLOhT5vpmgw68G2MUvoQV29JyFBoEFKZ/iNbM0tvL42/wvnnhV8J4h
         oLqj6YNZoE/hTF6VHCWvedvAd7COfnrcqgBUwdeBEoMAF8NCTRm642rCqzApAOh3/c4i
         g1tUq9r6qTpjM1y2O32echMYMea6MQzxTcepSfPMUgd8m/rXwHWzBF0/AKRYFlUzmxQc
         6SpVuw+JM30K78w6VMZKaJ0Tts49juDV/HxifpIRoLmt4uPwmWn0Qu4aBbkwhsOlYbZy
         zIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202882; x=1751807682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fkbgeT8w5iNHuRxX2hKakPaBsIP0X1WqDdO/BuHWEo=;
        b=Bxs9rNNnfp3p9jBKK0S4t31PGLDxJ1/z3xPrsqO2AWtmG+u79boN2hLY0cTgBZ3psn
         U+P7y4Y3ZXU849c0vjUfZi9XqsNKZ0hhhSyZdMHRb/gVNgtjiXGFprgbe3NP81oODNVH
         4YByQwLq/St8AVzbNb+3OiZ6ZX7i7FQwiABTL72RdsgGLUtmV+6sTlZTnG04FUwmSjhr
         AUPQ8zS8uwR/+7cs73dz/jLZd7ndCwHvyvfpuyl2cU+ztO4OjCB+xjXcj601oN96Acb7
         +0GhQbxVYmYX5CH+Tk/0pJTfSNHogOKr+gTs70AAxddkSFX8/9fEFYN/TqGmbEHqoo8x
         +Caw==
X-Forwarded-Encrypted: i=1; AJvYcCXvJzVaxlUwVvLtatAVXT3o8ncKwpu5g9L2Nh+4ypJ+osbm6ksKZBbvrI4P/ICwrrnL5GhkRg5zSaVuGTy+0LpKuk2r@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9XpUUATQxADSNGltOESfvHPUIoZRl9PGocAOb//GBpFQ0hYtY
	nic5cb3z9mX/eEuhQTjUolyJLgpqv6hBNKBhKpRgeYoWLDz7OWE5lpuFbfSSgg==
X-Gm-Gg: ASbGnctx8TrGcfUk3jEmOx6Q+6wYjwoQSKtprB8ay5OB7yBRQL5/aQS8PUaE8t32a4L
	O4vV1nHo5C7DiqmDnPeZUGAriICCXordW7U2finIkuOdfTmzQnXVeJ/gud0W/8lH3vkkekgYCbJ
	wf86/vJczZAHdN4S+xSYWmEhjkKMQo2n249oPrKg8CE51BtijmxJM7Emt6cI7E7hk/jZyhGdfnB
	Uq+IQXtfMmsIV02Wnw/ZG6MOjpNj1tjk/XxX7dmtffBtdKD6IvfyTa3JNzliY/6UQlmVNuqwTJa
	Q2wOYEBm2GPLQkjwJ9+bb9KtB1SBRR+NxoV8ynRo58Rc0b65GTqW8i3tuKbMFrw=
X-Google-Smtp-Source: AGHT+IGcCpFaJNeDwV1xaV6JeMEJOB09rF5HzbJRLIe/23F9vWAFzPDCeyz7yY61uG8G97dunknHtg==
X-Received: by 2002:a05:6000:4186:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a8ffadf926mr7854470f8f.49.1751202882342;
        Sun, 29 Jun 2025 06:14:42 -0700 (PDT)
Received: from denis-pc ([151.49.78.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm106301495e9.30.2025.06.29.06.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:14:42 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v9 1/8] platform/x86: asus-wmi: export symbols used for read/write WMI
Date: Sun, 29 Jun 2025 15:14:16 +0200
Message-ID: <20250629131423.9013-2-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629131423.9013-1-benato.denis96@gmail.com>
References: <20250629131423.9013-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Export symbols for reading/writing WMI symbols using a namespace.
Existing functions:
- asus_wmi_evaluate_method
- asus_wmi_set_devstate
New function:
- asus_wmi_get_devstate_dsts

The new function is intended for use with DSTS WMI method only and
avoids requiring the asus_wmi driver data to select the WMI method.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/asus-wmi.c            | 40 ++++++++++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h |  9 +++++
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index f7191fdded14..e31e0264a160 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -390,7 +390,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
 {
 	return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retval);
 }
-EXPORT_SYMBOL_GPL(asus_wmi_evaluate_method);
+EXPORT_SYMBOL_NS_GPL(asus_wmi_evaluate_method, "ASUS_WMI");
 
 static int asus_wmi_evaluate_method5(u32 method_id,
 		u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4, u32 *retval)
@@ -554,12 +554,46 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
 	return 0;
 }
 
-int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
-				 u32 *retval)
+/**
+ * asus_wmi_get_devstate_dsts() - Get the WMI function state.
+ * @dev_id: The WMI method ID to call.
+ * @retval: A pointer to where to store the value returned from WMI.
+ * @return: 0 on success and retval is filled.
+ * @return: -ENODEV if the method ID is unsupported.
+ * @return: everything else is an error from WMI call.
+ */
+int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
+{
+	int err;
+
+	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, retval);
+	if (err)
+		return err;
+
+	if (*retval == ASUS_WMI_UNSUPPORTED_METHOD)
+		return -ENODEV;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(asus_wmi_get_devstate_dsts, "ASUS_WMI");
+
+/**
+ * asus_wmi_set_devstate() - Set the WMI function state.
+ * @dev_id: The WMI function to call.
+ * @ctrl_param: The argument to be used for this WMI function.
+ * @retval: A pointer to where to store the value returned from WMI.
+ * @return: 0 on success and retval is filled.
+ * @return: everything else is an error from WMI call.
+ *
+ * A asus_wmi_set_devstate() call must be paired with a
+ * asus_wmi_get_devstate_dsts() to check if the WMI function is supported.
+ */
+int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
 {
 	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
 					ctrl_param, retval);
 }
+EXPORT_SYMBOL_NS_GPL(asus_wmi_set_devstate, "ASUS_WMI");
 
 /* Helper for special devices with magic return codes */
 static int asus_wmi_get_devstate_bits(struct asus_wmi *asus,
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 8a515179113d..b6f15b3d0959 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -166,6 +166,7 @@ enum asus_ally_mcu_hack {
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
 void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
 void set_ally_mcu_powersave(bool enabled);
+int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval);
 int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
 #else
@@ -179,6 +180,14 @@ static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
 {
 	return -ENODEV;
 }
+static inline int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
+{
+	return -ENODEV;
+}
+static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
+{
+	return -ENODEV;
+}
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
 {
-- 
2.50.0

