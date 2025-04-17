Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0CD22A817;
	Thu, 17 Apr 2025 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889670; cv=none; b=DE3NkFJKnl5Q9XYAFze1MWyGs5/OrgkP248nmcsyLAnxwFEliSvC8j82RKAZzQlntXQDrfnENC5EmH6wzKVXzZ0WDUXWpUct+BHmZqAOakMFvrAr0hO7u2PaChGiNr6yBaj+1Ia02AOL5rR+jEAImKGO+7EinzFlvtShfvQ5DxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889670; c=relaxed/simple;
	bh=0tjjgUAnEEAjdyKwpBvPlI7JGc/WRi7c2NJQQRLizME=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Y7IG76YQfyuHY/5MmfP3yaYZpxNnME+nTh4VdmQ4feDifkPSzNGkxf0ZNRRtiTmdgDNMokSwb4xja+GKJEHzN9djbu5ppCDNwl2SUg5BXwK9mQWIeDufVuYIqnWECjCFo3g/l+vVhOKLu/I05wZ4dhFng7nz2i3f7jgKDOi4X/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEdtg1/z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEdtg1/z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so3442725e9.2;
        Thu, 17 Apr 2025 04:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744889667; x=1745494467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eqWMnKkaXdGwN+/JBraZONeq03exS42vX6IgHNRCd+c=;
        b=cEdtg1/zZ4t0um+ByxD1euhZ2D/m8qIoblP+1z9pSnvVeWnJRXQQh0z09kbt+l8NH+
         V0Iy+jBhMZcfyapL4Cywv9La+xEw6Ei8pq/+xxQFGo4c90+fpj3+STCtQFIFy+aP3mtQ
         FhIvZJirWcMlkTedOcqsiWf3+wU6W0cTYpdVaHK2n6vwGPrBScXE2rU9iXMpXhq9xyhR
         kG/AxtqoOd7MRaJ2TMbDcR2bPLNMvctoc9d05+V2RMjtM2HBHicxbyuq5+Yyaz3STTgn
         FD4+AcHltVKiqX2g2GLsUBkeyJ5xOhc1oiWs8G0QHbOW+gM544YstdjBuPU2bwQD/N5i
         sIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889667; x=1745494467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqWMnKkaXdGwN+/JBraZONeq03exS42vX6IgHNRCd+c=;
        b=r7jEwZJd4Yyjas5NJmdHbBc58zFtvU/Vz/YGwP4xWmEPlZHLpa3V8vimyeaDNd5TtS
         fsbLImAIRAP1yoywqNvnh9sHXlvu6UT4TCTA3j1S/W1DkxItkP6YLM5rqkLJvximH8Mi
         Njjc0KWwGpDpiY6qx2IfcNTnwM0fHb2iqARkiMvQjAtoQfU0pgiZvGl/F5ZIC8x536O+
         N1iENjSaGEW26Abm5mOztcgsPTI3DteB4iPA/6A6STloCmCfs9U4KVlvg6OewK2OAPqN
         s4VCYOWjTIkslgPEg5wJJVI5d+wyZgO0q6bq9ka1gpGvz/1CZE0k6U2FJHIIwklb0mbf
         BwoA==
X-Forwarded-Encrypted: i=1; AJvYcCWUqgdhgZLCTzv5EHN4oARWrTw49YpPyoKkr1cqX9MKWhAx/x33kMpNpYRcbzhweghUX6DVQbsrl9/hZU8=@vger.kernel.org, AJvYcCWixfCKC696OGDBmrZzs+h8j06qCHBBEIQ6+ZWUjphnHM66hCsVb9a5++gcwGdvXBPX7L2FkbVIEikKE8qtY/EgIKDcPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YziQkSKB7qfUKmYnOg4B1n8IzSNq+12jY/tUtfv+VS8brNuLIeC
	8DWZnurVLfh9QWYkaZQqo46SiNRSzsROOqfq4g8CjUdPrMjqDIZQ
X-Gm-Gg: ASbGncuivpxfkGlimG6F77Y1M3JRbxbxeLcaSMM7+/bQAS2DiHGwVhyUy9ScENU2dpf
	s0CW7BJ/gw+BRSk+Npj5PCslgy5WYyqmdfmjuBmV+KbL7Dyk9krciLoo9BvnlhLw81Dyp7cFRw2
	UcfsHwWWqJmUeW8lsNsP/3YEB3bgLwOGusIuT8sMYgnyLyhfdSwgVId2P0zjAHLWgTPslAEzk5e
	5Qme4hr5Y3c0Q4dSiFuCUe3Sj46EkKbczcMPerAF7cwoOl/SqYz2ebCbzHjU5Y606f3c8fx5l2M
	jCAIND3gGBQyUA1UuQ0sIjBVFtmaIwy2ItNAvAfFBuYFE4iAudIx9MB01r5Lbg==
X-Google-Smtp-Source: AGHT+IHbUvxrvUyJ+ZvN2Hz9IGalSzk1zDU1XzQwCPPGTRb1kEXV+2PCjQJoJPRs6Aa3tIzwnVLHpQ==
X-Received: by 2002:a05:600c:384b:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-4405d5bdb1cmr61804955e9.0.1744889666856;
        Thu, 17 Apr 2025 04:34:26 -0700 (PDT)
Received: from pop-os.fkkt.uni-lj.si ([2001:1470:ffef:fe01:b721:35c:4932:2a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c82fesm50724055e9.3.2025.04.17.04.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:34:26 -0700 (PDT)
From: =?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
To: ikepanhc@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
Subject: [PATCHv5] platform/x86: ideapad-laptop: added support for some new buttons
Date: Thu, 17 Apr 2025 13:34:19 +0200
Message-Id: <20250417113419.110856-1-gasper.nemgar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Added entries to unsupported wmi codes in ideapad_keymap[]
and one check in wmi_nofify in order to get wmi code 0x13d to trigger platform_profile_cycle

Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"
---
Changes in v5:
 - Changed performance button to KE_KEY 
Changes in v4:
 - Changed performace button to KE_IGNORE
Changes in v3:
 - Minor changes
Changes in v2:
 - Added more codes that trigger with key combos (Fn+N, Fn+M, ...)
 - Added performence toggle in wmi_notify()
Changes in v1:
 - Added codes for buttons on laptop(performance, star, ...)
---
 drivers/platform/x86/ideapad-laptop.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 17a09b778..320ce9d2d 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1294,6 +1294,16 @@ static const struct key_entry ideapad_keymap[] = {
 	/* Specific to some newer models */
 	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
 	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
+	/* Star- (User Assignable Key) */
+	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
+	/* Eye */
+	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
+	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
+	{ KE_IGNORE,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
+	/* shift + prtsc */
+	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
+	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
 
 	{ KE_END },
 };
@@ -2080,6 +2090,14 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
 		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
 			data->integer.value);
 
+		/* performance button triggered by 0x3d */
+		if (data->integer.value == 0x3d) {
+			if (priv->dytc) {
+				platform_profile_cycle();
+				break;
+			}
+		}
+
 		/* 0x02 FnLock, 0x03 Esc */
 		if (data->integer.value == 0x02 || data->integer.value == 0x03)
 			ideapad_fn_lock_led_notify(priv, data->integer.value == 0x02);
-- 
2.34.1

