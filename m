Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D632417C2;
	Thu,  6 Feb 2025 22:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882658; cv=none; b=KI+Qt9A9+XlwHJGkCSi82yASZWHTl6NlTHFt2GHrTunljhpI5OS7j9SoJqaZU1KpqH3SWnXqj1sxG6fUol+y44sZ/iSZt7y0N4GYGL8CghWW1GEf3xKxuiWyDxY1Fuc67N0hFnZNxF0iFNfxvGqIAxJWVkXLu7WlXYto0jYwZkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882658; c=relaxed/simple;
	bh=SKCpGU3U3+4OR7yQ54+uvbD7yw9OxlV27Ag45UwY42M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aeNoNMTxf7io/ywtpk95ctLfu111/RNn3OK/Up1uhqQEkLn/jxqLy25ja3RuyRLL1u0FNcrEd6jnSNRROubTscWmOZpRR8k1F7NOd1b4ZBNQhRqICPPnXf4/mxWbR1LJTF9YrxcCPf616rYqaP32zlKz9Ej6BbyxLyoyPgevqS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e3778bffdso1489672e87.0;
        Thu, 06 Feb 2025 14:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882654; x=1739487454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=744zLEEWocD0C+1Ymbg2RMfIV1Vd1B45VeC2J2Ht/8U=;
        b=bdzEfV116CFlaJwdfAOV7OxAtpGIygHZc2k9utyzKd55nx9nxkljPlotOd9hjuLncn
         M8UEdGWSCXsMWBCjquiD6zaRlZnSHno3yNJbSwiIrqkckvv2rsK5ZGZrNspBB7gbQOAS
         JC3Sq1Jfp5fSRVCQ8YrsG7dvuxa6v9cSwEXZEj3sQzwnZEZD0isDKNE1WD7pYzy6rwxw
         cmcvvEulbyYoEpTHUQ9hgIR55txujubCTs2hudKDb5MP0lJF3brH18pOnGKbmTcSVuKN
         +0FCK9ElagM1WUlmX05PynRDT4lBEwO7UiSgorZWf6TJxCC2DwQ2/x+Ls8XfBZ0qMhDF
         7pLg==
X-Forwarded-Encrypted: i=1; AJvYcCUpu0Eh72eOLC7W8zQFa7r2r/vzh9GgOsAdgf3sWvVm+w6zXyHvRdOTs95CcI0xK9nf6Onr5srXCgdZALL53+YqUU4s3w==@vger.kernel.org, AJvYcCVhZiUPLgdhcG5IDNAQQGU7lyxObzhM4SkmYfzVDZtvx8H2sG3eCHswQ/CBR6/BUmDMBLc5yCWRiWZ8r4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfwza/Jmy1MhS0UsYJK4o6fgaURg5kLpl82T7pTt0L5tjzr6Xh
	mlIu6s/Z8QYZpwfV7xJKAKj1QM6tGGrdp85hGr/U6tbfp4efeQ7UgXXx1AlpImM=
X-Gm-Gg: ASbGnct0GN/kVBZlrEdR0IybuqIv+FMm9XuY57dCp4PEkhdJyNyHJwRXqdy+UsgXwOC
	ENB1wv29F+kCmtzQxGMCvTSrmCpqAL4pqx2QYBFVgSV/QNzU+/h4UXkBKyPW++HgXUwwOo+rgDm
	5OII8aoRxdTDdjLJtukRgR/1oXbnD+AEpxrj70ziTScNm30n/Pjf8HIyTPWnSjY/wMTZTuEGCDq
	5qMazWe6oCQaANuj+0sf9Br6sHT01zy2cJVyWWhyayfC5MOijJx+IBzDyzcvVlFcuuCBPDqI3ww
	HQv69D7d6rTVqHyIXIYhFqrolM4wRDm406MXn1hk2HqM7llfQzC12lHa
X-Google-Smtp-Source: AGHT+IEd+C3AZW5A/bVVj9gxEcmH+plOyGm3pvUpUUfhSAo5KDPX+amMlUP5wVyRpCozKSaBLj/CWQ==
X-Received: by 2002:a05:6512:b9c:b0:53f:231e:6f92 with SMTP id 2adb3069b0e04-54414ae0a19mr208257e87.34.1738882654049;
        Thu, 06 Feb 2025 14:57:34 -0800 (PST)
Received: from galaxybook.local (82-183-24-76.customers.ownit.se. [82.183.24.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105542bfsm253025e87.69.2025.02.06.14.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:57:32 -0800 (PST)
From: Joshua Grisham <josh@joshuagrisham.com>
To: markgross@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: W_Armin@gmx.de,
	thomas@t-8ch.de,
	kuurtb@gmail.com,
	Joshua Grisham <josh@joshuagrisham.com>
Subject: [PATCH] platform/x86: samsung-galaxybook: Fix sysfs_attr_init of fw attrs
Date: Thu,  6 Feb 2025 23:57:07 +0100
Message-ID: <20250206225707.12962-1-josh@joshuagrisham.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Fixes sysfs_attr_init bug in samsung-galaxybook as reported in [1].

Should be applied after
  commit f97634611408 ("platform/x86: samsung-galaxybook: Add samsung-galaxybook driver")

Tested with CONFIG_DEBUG_LOCK_ALLOC=y on a Samsung Galaxy Book2 Pro.

[1]: https://lore.kernel.org/linux-next/20250206133652.71bbf1d3@canb.auug.org.au/

Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 9c658a45d..de1ed2dc6 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -1011,13 +1011,13 @@ static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook,
 	attrs[2] = &fw_attr_possible_values.attr;
 	attrs[3] = &fw_attr_display_name_language_code.attr;
 
-	sysfs_attr_init(&fw_attr.display_name);
+	sysfs_attr_init(&fw_attr->display_name.attr);
 	fw_attr->display_name.attr.name = "display_name";
 	fw_attr->display_name.attr.mode = 0444;
 	fw_attr->display_name.show = display_name_show;
 	attrs[4] = &fw_attr->display_name.attr;
 
-	sysfs_attr_init(&fw_attr.current_value);
+	sysfs_attr_init(&fw_attr->current_value.attr);
 	fw_attr->current_value.attr.name = "current_value";
 	fw_attr->current_value.attr.mode = 0644;
 	fw_attr->current_value.show = current_value_show;
-- 
2.45.2

