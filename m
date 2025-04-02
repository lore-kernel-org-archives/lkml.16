Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE001E5B78
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615743; cv=none; b=Zp5SL2HsAUXRFWqESrgv9jZyWhMJeHr03CSrLJlAZYBkIYicjWbBzDuX6qGtJezCC1mv2FGL86V7ibQf8DvFHls1HYQnGCfTuQxbF0yq7Ar3YCPhhtWQALKLAvrj1VYTDhsPjfse0ekIOMvZjcCQ6ateJvOCu1PMmnQjS1Wgn34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615743; c=relaxed/simple;
	bh=gFCzRxNPecs9k7iS1AinJ3zcerrYQfViU7GYvlDAdnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJQMHlTARi+hrXMmttMctEMVsWeY5TIfMm+Jaa/0Ysi2ZRQteo8I5DIGLXDD6Ui7qy7DxLzWC+okk2KJhJIrorZm0I5P41shv/A3NbAN0kfylIV4MerOeaFDgKNkEDaoOvnZutYmvwQ43a6G/gh0aTVpgRUA1d9cehIsTjahwu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeXVUAf7; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeXVUAf7"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d58908c43fso505145ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615741; x=1744220541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AN9v4KQ0PiEc7jM3vE8QrHxAiVUi2zmd1sx7ARoRMg=;
        b=WeXVUAf7/3VBCkKZyxX5V88OVVUpjfpHdHpQKMwm0FuO78NW19YQf/kT0Yr8GxzwSw
         np/kEwuYybdb34Z79+IRfI1nKuvzTO910QkPrSzU6WMFk18X6eHpXQ5ABAOkTtTfzqzz
         ck1D5kb+54o8uXE3ciiph/Vt2W5/AmO9GAEMSj3IOWL/Ja8XqTexbhx9PTlRWoQi0VKn
         z74dAqEm3xpFLZDNU5F19Y2HOLHcDPQymWYbLxCeZTJ9D+gHZ8pLP31ZaJxyldQ+KMxZ
         nox3eRKf1QuWqoN/4C7kVq+u4UmM45MLYaIZ0wTsden0LHpCsjaFudTjmBpj0DK1L8eN
         Ywgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615741; x=1744220541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AN9v4KQ0PiEc7jM3vE8QrHxAiVUi2zmd1sx7ARoRMg=;
        b=kUTzM06plhnOmXsBTCg+MVcRuOP9LULoRrzNQ8Sx0JmGElFXpTfaztzKhGeD0KS0g7
         FOlsFEGviGjR4SIVQdyLRhcDABaY8sZOzzoSWfbRCAgTyj0fB88oW+CUuxYcLqXCe8fo
         qFEBw7zHSlYXTAU1GBOgz1aZEDqw0ZRVnUMz7Btbp+4yex4rESkFf1C9QQ8vmVhL0khS
         CMY8gRYXd/KhAjlGmURx0WHkNaoAL4Zcmu/3CUoU9U0ArmKA4ZzMdO762SpzXvY5ogih
         J1ppqKUG2yEpTs6mMw7a6OoClPrauD4p6iBmN8u3OFjhpukoIOCvt8NjZQadyKa4ITZI
         ofgg==
X-Forwarded-Encrypted: i=1; AJvYcCUo7wiUy/j1kLzmWuCl19zS/ARJ5JCPAvt4bvF25J9dR4MKbh/1LcVC58kr7hdV9XufKhWsTp5VJZnUGrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Fg2stN4pf1x0JHuQ4cyjrfTw8JbGfDWOcd8hFlgv3uIrPY2H
	n2ohTr3dzdw92/auZy4kurM0TgXIjFZw7XVnWRVFufnVy57LwpTV
X-Gm-Gg: ASbGncuJf3qvBy8CLFS4p2N5L7WNEwj1iFdQp6J8BAUe1NVxrTiWe7pqD7AHh5kQUEW
	yi3Tttaab5lE4utY9WOc3C+3njVqoTLMXpXNdJ+ggDVmm72pWDjuM196caJwP4VU43JmzvU63S9
	bSIjf7d/cis3Hhqx3bDouKCnx6piCwsruHbhfVNFueluDHmJneaXa3MTPySE25nEmUfyA8B35j1
	25lk4FokfrUVvPO7bWdEIYytJVcFet+X9jOhp/AacxPfzgnUPj02eb6cgaXl1gNKGv6j59qppma
	/qbrsnOlc5Wkp8g87werUBh0p/R0anASlR6bvH3MZYlx7c6Pbkd0xJYeRnIyU9T2TesSZ5tud/t
	gBw==
X-Google-Smtp-Source: AGHT+IH4Y0UWSmgU+NCi7WHRrVlXFXoekgCq0dMBYgztyw3Hpw5BNtpfhLC0O0dU/4LF+BFX2wTffA==
X-Received: by 2002:a05:6e02:152d:b0:3d3:f64a:38b9 with SMTP id e9e14a558f8ab-3d5e09e4828mr192342365ab.15.1743615740615;
        Wed, 02 Apr 2025 10:42:20 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 07/54] dyndbg: drop NUM_TYPE_ARRAY
Date: Wed,  2 Apr 2025 11:41:09 -0600
Message-ID: <20250402174156.1246171-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b9afc7731b7c..ac199293d203 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -107,11 +107,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.49.0

