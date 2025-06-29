Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5D224AFB;
	Sun, 29 Jun 2025 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202889; cv=none; b=YMNkq90ve8/4j7YF76x/BZQXMtb61QBr6YP34rfKIS9fvhTntSgQI7YXdGKOkSaK6xilqGjUOqS/ytBADEOSQHjUyAEDFcqOqtUJ3WRlZhdFv1D1miv0GiOsI2AzProFTb2Kc20C11yuXfJ7l+Hwx5JUZbu7Trmo1uJUem3GKtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202889; c=relaxed/simple;
	bh=WMRI84Xignjt8gR0NUqBgm0jb9KGCKVV6GOBqyJYv3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D0l5VMUOB5GmYKNUtB5DWuzlGjnrDZllKbIC9QD+0JUxtjKf5IL0ZjBPcE0JtHXjnBCyY0dlKVZkb0GtuTMat/X9AYOkeNHNvuf4O8op8r85YtC+MEyMEXNSc4sQNw9bK+M9iJxcVSlw7MvdONcWgP4Aog3jZtKrVvidoIVUNrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJONMp7u; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJONMp7u"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d7b50815so8103065e9.2;
        Sun, 29 Jun 2025 06:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202886; x=1751807686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHgLJcoU0LPMw5A2wllDN+DVeE/H5DxKAogK6F++XI4=;
        b=GJONMp7uIic11RLEIgaMHtsparnrZQ38nrLmISKDlxFAEjyeB+x+aezGVhCu1JYIAC
         jcU8apqJgthCwRRDC0nLYU9s1UfTsW5lc/lJsENYrDAlnvKhkzEXDl6iLErO4hTl6F6c
         mYWwJIL+ibBTBhjdHwrsvNfq53EyxUT280LmDEa6WRctW92CwoLmRyHskF3rCrC/r3zn
         w798FHfsXgIQoZFurojZ0chVUhL059flEmD4WU41waVjwEdBoVLltnCevsQtA4cytaA/
         h8xiGaALtoa2ZU3dJix8ZdzJhSfHij2E/HAqooQBcH9FuN2m22tWTj6S+jStvSiPAHVY
         +MQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202886; x=1751807686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHgLJcoU0LPMw5A2wllDN+DVeE/H5DxKAogK6F++XI4=;
        b=jmiSayK51fsPYcfMqukbEqR+Be9BvtXcg1LZ1voOzoTuwyrcCAaoubBi56quJk93k9
         QaTG+7O0ZslLhkTS2iCRwlBzs5eU3XDz7DLN/x/D4NZi+9zmokJzCC2xbfMvXSZSPrxs
         7e/HyKhNl/pYhL7uc7JQk/1LTurbs6oGhw3PVmE7mRZo7yg5LeZBPHAiBOTHjJaCq1Ie
         upSIOtGGxpDjuLPThp9uER2x1hx/virsFL+E+wVzPAowTjbhDHFy9UxwYmmZMsns3/Ut
         JeXyqBTqgtfUoKY5VnqLXt41VvUd8cVVJze3OLC46TB4RdAwPhh9XU32Dg+6GvrEIBnq
         pksA==
X-Forwarded-Encrypted: i=1; AJvYcCWj+znJ8xo+F0T3oan1uDLyzGgvfgbqUUhy8EWwX0O+HkotnQ9cT1VrsFfwbl2f6uP4hOX0+X+9ITRD8ZjQlA+s0aii@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ER1HMY64HTAX/LfvC7CUiqXWnJXXN5qYGHjnD3FL7VRqAfuX
	mIu1U10oanhQveLwpzSDOeGF95I+vc28Ho4105V3hOKPKzk9cn4D/YW3TllswQ==
X-Gm-Gg: ASbGnctsvRs+GC6HRE1wYxJYmKvWml4VMFNnX76RZWggnnveGKNBsh1T+i48EAP1gNG
	+/peVupQCWDhH9eAILF/lqRqPGjwBFEHmfI2FsmBkU3AMgQFYLBoj3KvDJm81wATTp+THAo/GQf
	5+S3ZHpsNa46qbXPYhGsdwF5sNoLwI1Pz0dgZ+oktL9Jm+204NDP9Lem1Sgkld6D/qvwMgcBDgi
	UBRsZCNhR0Y7xCIuXR7qZ7lmtdu+0UXNv1Y3M++wp0R3hYV/Q027nB/q1EI27oNJtNdZ5sGo0sK
	oXT3QYM0L7T9AglgtsP7JesNpe969+fZmSjMXBHBz20uxg1vKNwIiXoPPiRVVSnGajGQInk5Mw=
	=
X-Google-Smtp-Source: AGHT+IHYYHhUa2IXkIv3ocCtZf9L78v2udC+H5/y3Ky1HRKLtDafGP+bt0Nv0p6e3ZWfesNA7DJeqg==
X-Received: by 2002:a05:600c:6383:b0:442:f482:c42d with SMTP id 5b1f17b1804b1-4538ee39977mr99914635e9.9.1751202885724;
        Sun, 29 Jun 2025 06:14:45 -0700 (PDT)
Received: from denis-pc ([151.49.78.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm106301495e9.30.2025.06.29.06.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:14:45 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	"Luke D . Jones" <luke@ljones.dev>
Subject: [PATCH v9 6/8] platform/x86: asus-armoury: add screen auto-brightness toggle
Date: Sun, 29 Jun 2025 15:14:21 +0200
Message-ID: <20250629131423.9013-7-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629131423.9013-1-benato.denis96@gmail.com>
References: <20250629131423.9013-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Add screen_auto_brightness toggle supported on some laptops.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/asus-armoury.c        | 3 +++
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index c94643138fbb..33d71bf64468 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -733,6 +733,9 @@ ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
 		   "Set the panel refresh overdrive");
 ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
 		   "Set the panel HD mode to UHD<0> or FHD<1>");
+ATTR_GROUP_BOOL_RW(screen_auto_brightness, "screen_auto_brightness",
+		   ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS,
+		   "Set the panel brightness to Off<0> or On<1>");
 ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 		   "Show the eGPU connection status");
 
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index d356dfe5ee7c..72fd2fc88bb1 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -83,6 +83,7 @@
 #define ASUS_WMI_DEVID_LID_FLIP_ROG	0x00060077
 #define ASUS_WMI_DEVID_MINI_LED_MODE	0x0005001E
 #define ASUS_WMI_DEVID_MINI_LED_MODE2	0x0005002E
+#define ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS	0x0005002A
 
 /* Storage */
 #define ASUS_WMI_DEVID_CARDREADER	0x00080013
-- 
2.50.0

