Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E8F28000A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544905; cv=none; b=lD7jrfz6FOSmiUnpDct0tTF5G4IbZC+3VxAPHKY7c1VZzOnSGN26w2nGNz3XJAN/elYl5DpKYrt5R5a2V1x6pL+xJOpuPNmNP/zvmsXsPYMCTXNsY+cWl5nF03MrpnvvpfjLcfVHCcBHGbcFlx981IWLtljG702x5DuhZdlSN4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544905; c=relaxed/simple;
	bh=Q5rzGJxgYYGUJYSn3BucfvWcD9ZpOZ0TQF0QhdLktaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jjIuOK7y5eqFysS7BfBwHKYxu3EGtHw93h52mlV1wrnHXw2DEprNlJdeNgQYAgXG12nQqiQmLoytwzXn8j8gvhuqePD6csVtSZ5kBfroVpgRXulbVxLVmazQ0WkWOOG3gQhoDCYgeOGWTIOc5TOAt5j7Y+/WyuAl7cRLVwYSVws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cQ776wuP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cQ776wuP"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a528243636so3085052f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749544900; x=1750149700; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGW8iJAI4d8ECYwe0VR4sPZslEWIE655LfOuaiUIB4Y=;
        b=cQ776wuPq1OG7FH6KQx9N/d1sJfVBGcvHwF6DPK/Fapu9NZZD+kUZ4XbSEiSi6xxqM
         UNMx+HXgtpK7+bI1jbevKEDGfWPY7kBLnAi4SDBCokvl5SAS8TLbsepGtnDG/u9OjeoO
         QyI+o6TroArNaYdjL/EDpqLAKmfOhql97be6TNgO8Z+2XyN3xcfU4SN4PgdFVjZEEwio
         PoblTu0BG905lb6r4m3qMiXj+Nn1AzcUw91LssJpjg6jpRBL5OTnmZQt9HqQhoPAcHTg
         EfCMo5XLJO9bv59NQAkUoDLsV9X3SiumPvzAUza9ZuFrSVYdkv5W4KzpSBuO6DzcOXbn
         Zn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544900; x=1750149700;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGW8iJAI4d8ECYwe0VR4sPZslEWIE655LfOuaiUIB4Y=;
        b=MOKDfEFPp41yJWvnc2syIqgB7Qlzp31wF9mFeM6MNkJeAx30K+cj9NC7ljIQfhms7C
         gWqfCkKTFYCkVq58RH5L5DTL6JFKfdxGBrbujQ2JdSVPAvBt4L85yxy+7xPApQQ/Ss9y
         FRDVcUaqMEvdC/aHrgYjSG5nmaReitD69tm6eGEC1uDfrh0FkMNmturukQ70dup81q6B
         BJfsyIFal/Ev3++3C5enW927vJ/StUQRX/dc5scwI388QFKCovslIrpxdSu3Y2yIXh1S
         f5xnZ+trOoWhRfv0QHwR2TDsiIkbCfXhO0E6YmxzYHEp1EJ0yQneZ60MhhLSyuC/wZPu
         F7sg==
X-Forwarded-Encrypted: i=1; AJvYcCXg1Aq4gxHqfov3haNInn51bcLuRlTMxzan8hcLQrcmiP1KUijKVuFNQENa++fmYiAh2SEwFsvCF2+GA5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk6mq0EgemK2LkqH42cNMcIdNLSSoQD9VceNnMQMDZAJLBHFEK
	msNgdtNH3Ow38mFYK8DR/CiDFbAX2AUDKlSgMT8hnRoq4R3ShAR7truNrAUlomXiylSXtaxuv/+
	j+PkO
X-Gm-Gg: ASbGncu7B0618kWHV/1KVEBHEwDXEzo0CpSETp+2KjciFWy8gdJnOWssDbJGVx533fB
	el5WGJcFzwD412lcqpGw4MwT6DkKMzyv4MFRp9yMPovCWluLsWC09+clLaO7WlQQQjfkOnzvTj0
	VdfI9diugqD6BNyJnipxG6ui1AoV/SMMwHCX6RxnQTJaMyWBeVu0+a7yaaphHjB7aKq05QrtX3Y
	kYVB73h4Q6QWs1DYnsTlLZJmCkdaTQ9H93h7QaWvOVatGnLVa+gpDJsL0ckv1a4tzTszpLJmlef
	70yUYEjyb7tZty5fBABwz/KS1qLLfHXeXaQcnxrbttr0rlBI1VyctDZQEuV374YQoIP594RfpHn
	Tx3N+b+9MC5w=
X-Google-Smtp-Source: AGHT+IF5Hy+W7eJEsz9nfiEjDp4g9V2OouL1vq4RYWNSfJAncW0esLQvk1Ns6l9ob0WZXNoLO5a6pw==
X-Received: by 2002:a05:6000:240e:b0:3a5:2dae:970c with SMTP id ffacd0b85a97d-3a5319b466cmr12384021f8f.37.1749544899900;
        Tue, 10 Jun 2025 01:41:39 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:d157:fe04:6aba:2e4b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4526e055d2asm132685545e9.2.2025.06.10.01.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:41:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 10 Jun 2025 10:41:07 +0200
Subject: [PATCH] platform: arm64: lenovo-yoga-c630: use the auxiliary
 device creation helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-yoga-aux-v1-1-d6115aa1683c@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAKLvR2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0MD3cr89ETdxNIKXWMDc0NTA2OzRIs0EyWg8oKi1LTMCrBR0bG1tQC
 9PpsgWgAAAA==
X-Change-ID: 20250610-yoga-aux-30715036a8f4
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Q5rzGJxgYYGUJYSn3BucfvWcD9ZpOZ0TQF0QhdLktaY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoR+/C6z2Vh5l44BmNOBoMv+oUh35AAjPUM8A4w
 39sxFR+y6KJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEfvwgAKCRDm/A8cN/La
 hVTgEACF8Ne+oA8t2M8ZxaBgZ4VFlxy2TmHj1B8emzUJTRhbLVe5lvPX93ccYQL7PRYVW/UOXaZ
 kfV8t4mXrQc8x1QvfK8k5Xhf/PI8B7GO3Ugtq2PtSlSdRN/V3QpGn1AVVh6loKuSrlxBK29MWHF
 JFX0gaADWcNeD55dgVKi4d7WHsotg98repPBYG/qfBOLzfZ+xsXIzPEKE7t59rhsyysfsaahkED
 ePMF7lewyxp0qAPWWgtPT/Xw/hSOf6OaQjGrt3NKLAN8p1D3sw3FcxSqL5VGvZ/wNP2Ms/PRIgz
 aS2r+QddQNLsNeiKvC3RcGiCShs5osHsNiSsqulwU1n/hH1NhMp3J/5SLq4oYY1GWaJWMGQbHwI
 pO9DHxE5t0MhJNCA8PaJd3+aPoCpthMy41tWCzXMVqyeJMEZxbuB3hmcwSzgCddzuiy393VkwjO
 AevoJbhUMmfAhXfJoig5/+zLY1kDrBawWff6AgbPJ4fmAJsBYSRajFugb9NClg8KjZIOBfL5wYX
 huXTk3cfXNeBS2LrmCh/cf90mehUeJ9qw/yveqy4y89jzV/jTD4uYCIA91K36XHBq+j3ykkTFvJ
 0o6/fXTKQec/5GbiuRFd3Lfvy3evJTnySIYf8nGsxVHYAwcJfotY99VjWuxdpv8b/SwKfiOXbjL
 N2TRLG3kONhZYbw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
This is essentially a resend of this change [1] which was sent a few months
ago. The necessary auxiliary bus support has now been merged with
v6.16-rc1, so this change should be safe to apply.

[1]: https://lore.kernel.org/r/20250218-aux-device-create-helper-v4-4-c3d7dfdea2e6@baylibre.com
---
 drivers/platform/arm64/lenovo-yoga-c630.c | 40 +++----------------------------
 1 file changed, 3 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index 1f05c9a6a89d5ee146144062f5d2e36795c56639..75060c842b249c1b4cab21fef943266ae0b31d32 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -191,50 +191,16 @@ void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_blo
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_unregister_notify);
 
-static void yoga_c630_aux_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static void yoga_c630_aux_remove(void *data)
-{
-	struct auxiliary_device *adev = data;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
 static int yoga_c630_aux_init(struct device *parent, const char *name,
 			      struct yoga_c630_ec *ec)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	adev = devm_auxiliary_device_create(parent, name, ec);
 	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->id = 0;
-	adev->dev.parent = parent;
-	adev->dev.release = yoga_c630_aux_release;
-	adev->dev.platform_data = ec;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ret;
-	}
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
+		return -ENODEV;
 
-	return devm_add_action_or_reset(parent, yoga_c630_aux_remove, adev);
+	return 0;
 }
 
 static int yoga_c630_ec_probe(struct i2c_client *client)

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250610-yoga-aux-30715036a8f4

Best regards,
-- 
Jerome

