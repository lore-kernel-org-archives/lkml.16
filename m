Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEFB84D13;
	Mon, 26 May 2025 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748293855; cv=none; b=UK66nae/HypmxHPKynbWjpXRQmaoIWSYIqssIoyMqYkKUnhw7Cfd/rNXHLCu8vF3QGoCHOBWH4jRgUBIHNSv2yeTrYjcnxzvThaNoaFsPRgSp9/ozXTd8V6awwGW6Gydz3ZKjdCVRxpc8xooi+LwzJsk6Jaf4bmbWqALgs9FOBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748293855; c=relaxed/simple;
	bh=NQv95qdsZDm7Shp0KvjsvOQwl+iLO5pD5VPSgd0VJI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcGfWEx0ubZ2X0udMiYAC9uUUFXa6tHuEXdQv++6m0dt0djYD15TSMZRmEtkHCGjxkm1brhl0pTKpAwtGnC2OeCOS1N9gb439MLBg8Uk/qX+CcgHHoL6QF/xP7wBRkpiOyiGpiRXWn6WlxDaELqYYAcesIMzCTI6hMchasphjaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeYVi+AE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeYVi+AE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf848528aso28122005e9.2;
        Mon, 26 May 2025 14:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748293852; x=1748898652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBGIx7uWt3EonOMrx30eCVRGWzbw2WhynVite24Hqeg=;
        b=EeYVi+AE0qH0ZCjzKQ8iHvXv7cprRcTow33nbdlthJVxHzW66fdJTu2GkRFpuDmuvs
         CMidSdttr21i7B7+pBjf6DYxJJEwE5DJKeREcxpUd2ijO7Ipo/6DGs7F3OLmJ3CDKijS
         ekEtVZTbdIQd9svWleMMuPgcCRPHf5RaG0c+Ptb/Tz+RnEC3Ecg3GE95xJiSfeMYAdFG
         qhyVLs3NGNw29jON17WIA+Om58yzxJ2X3cNgOiY228QvTnEysfD4hcxVRygiCX1kzvbb
         Azfw85rFkrKPQFKeZgcA1/hjWSFrKzBbWz+++S/2JlSIs/1B03jYybJlZvE69LNX4Avk
         +6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748293852; x=1748898652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBGIx7uWt3EonOMrx30eCVRGWzbw2WhynVite24Hqeg=;
        b=XM4GUE1wZrSr7CJY3luIClYpE0WBCcJ3thgoHSMATnROOED2+g5lbWlvxbJBnZ3+4P
         0sllMMy6aBCMf/67aigg0z4xFzaFFhncn/Qf07V+XED2P6vA9yS4XruKFA2hIB6pIYLm
         D+/DIsGcrC+KS6ZqLi4+K+Alov2FU8XUZyhQuasiDEc7NaYhBSvqHIqaObpqT8nxgPhI
         8G7QmxhGNBUwQsjkXNxL8LxW69LTgF9xC5Fn2oNsbOaLpt9xH3zP72pXAQ+sudYsfEvA
         0MvurAckOXusfNUBt8vTFMhK9qHVALtgvBZOlnJv4LVE79Yh9gIHW1l/2g9cxO9xN030
         lgVg==
X-Forwarded-Encrypted: i=1; AJvYcCW5h3+SuQJ0PLo+Y3/bG9kCHcm8tykktfj+XYO8zMZ8JyIS/X18e6o1fUOvhrLqogHx8eYbJOdFOWew+2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbZwc4pwFzqvwNRJLxbNMX97FxXwdkWwC4hl4SDA7fE5xz4gIG
	k6AilndlzX40KuBQBLeijqKAvczrA16LUS+3FjuungFBorEZefsa0I6yrPNRig==
X-Gm-Gg: ASbGnctk7JxYVHy1uqpgaZbIaGePAzp6eCB7tSBfD44zh9b3N2CNCRAXBAeOJXx7IV7
	F5cOI27KwcbFivJIt3LnEBTNql+dFKEtSVRvwjdQU03vSkDInuJTEVxTHAd8pMYNJ3dInWH0KKC
	BDW2mwOXnlqXkMyEVQ2Q8yy2dBJ0sloJYW+20wizS4AHj9elvySd1O3JikCzP9gF/R6AqhvnJGG
	E3YfRmYhQLxoWBW6/ZpI4HUZHdUdlEuQRue0E9qd9FF9h/CB+TXV1TNlB5zS05c0vP2eOyqQF/A
	oz6GFd2dZN9SNNQ5nI9Z/akP1K/aV0EtqSjtFbTrnJhS84fpTJPHQ8cgNvduWG8+qF2MK0iyx/B
	W+UPbkqH9mCY4
X-Google-Smtp-Source: AGHT+IF+FFqC1DQtqV1gqOYkFWdXPnoibRiEGnuA8xYE/v2oRafxLw8d58e0YatLVI8WyHR3jm9EBQ==
X-Received: by 2002:a05:600c:5618:b0:441:a715:664a with SMTP id 5b1f17b1804b1-44f840b38bcmr16410075e9.20.1748293851445;
        Mon, 26 May 2025 14:10:51 -0700 (PDT)
Received: from localhost.localdomain ([154.183.23.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc932836sm8728503f8f.39.2025.05.26.14.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 14:10:51 -0700 (PDT)
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
To: linux-doc@vger.kernel.org
Cc: willy@infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
Subject: [PATCH v2] docs: symbol-namespaces: fix reST warning with literal block
Date: Tue, 27 May 2025 00:10:39 +0300
Message-ID: <20250526211039.163449-1-khaledelnaggarlinux@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>
References: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a literal block for the EXPORT_SYMBOL_GPL_FOR_MODULES() example to
avoid a Docutils warning about unmatched '*'. This ensures correct rendering
and keeps the source readable.

Warning:
Documentation/core-api/symbol-namespaces.rst:90: WARNING: Inline emphasis start-string without end-string. [docutils]

Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
---

Changes in v2:
- Use 'For example::' to create a literal block, suggested by Matthew Wilcox.

---
 Documentation/core-api/symbol-namespaces.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index f7cfa7b73e97..32fc73dc5529 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -85,7 +85,7 @@ namespace cannot be imported.
 The macro takes a comma separated list of module names, allowing only those
 modules to access this symbol. Simple tail-globs are supported.

-For example:
+For example::

   EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")

--
2.47.2

