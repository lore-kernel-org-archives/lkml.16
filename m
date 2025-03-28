Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0F71E0DFE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743187160; cv=none; b=GLCP8XUIVJv6zZHMqUUi3B/DgmpLi6FVyPXXCpwJ1JnXJz+x51W5MFiBeAojtPTMLnuCNgvDzOP42jdcWPXo0tFCh1QBeFAMTJIwJNPMz/57KAjdfgOhimEy03pGp1EbbKa5nheyFY3ztFXl7IhviMEW4JowTVQyEE+ZR27uACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743187160; c=relaxed/simple;
	bh=1zdodyMlrFORk+ZHUT/WMS+Bgi1OHksWmLDQfkjhwG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=NY1yAQA1nmHpl696MXnhPCmZRsQe6ETL5t/BKfjYxjZD4xhJrxyl/KfC8xWQD8sxdnnJeC8R4boLuZSNdo2biMTI0qCQzFo2+e1jhezkpaMMh+m7Pi551ASxxkyPToe5ldd/hoJBiHG9n0XZuQrenLgY/L72bj54yVc3C+xKUs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iZHXnmFI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iZHXnmFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743187156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UZXtYcY2hkO3QOI4CXVGceWuHO84yTnOursddEVHNyA=;
	b=iZHXnmFIWnbQjdS8YkSARw8j10aiPSa6eBkeA/Y0ytwxOOuP/Ve+SWXDXA3B2s7kZJZae+
	dJzMTUZIjzvcysyiYKeEYjS0xXJQQ6k3YW3xiLCRsfN9377SRj09537nKoIrK3wbBhN+JJ
	m+ViteVkse6lv62LsC+d7rt23CPWyqo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-TKLCtV9sPISlz5wJWljMVQ-1; Fri, 28 Mar 2025 14:39:15 -0400
X-MC-Unique: TKLCtV9sPISlz5wJWljMVQ-1
X-Mimecast-MFC-AGG-ID: TKLCtV9sPISlz5wJWljMVQ_1743187154
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e900f6dcadso45774536d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743187153; x=1743791953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZXtYcY2hkO3QOI4CXVGceWuHO84yTnOursddEVHNyA=;
        b=E0PHVgaL4Zrpd/8l29p/DsRBOKEIXH6nYELoqQmYfZJBo1egBXQvNEDFhYJ5fsZYZw
         oMlPgGObBrYR9VJ3X3ly1x3wLEtJtCoKF44tnIsazRIfeToMT673CkuqykkmcbFDFBwp
         +NejqWOz+7Q2ESm4uAKuKll6C+uvkoq46lPZdBB4aLrNUPp0/ULP2DcT0b9Y8Ct5y2ts
         SB2QONa2E+KI0ZgPD/mMw/JctEXBq9glS+sBw35MBTkNkKAZ+97rmp3Z9P+L8HW0hI7X
         hvuGXmPuUY9QlXsxX7lOEKgNj5aO+cLmw/JW6mw77SFEhDICjSd3wPiqI4u7hfEb1JI1
         fa0A==
X-Gm-Message-State: AOJu0YytZWC9+/eOnNe91dFBkRmY3gDVbQwSHagmAkkjDM1slY5gLMUO
	r0ds84ByOj9cXZxngqx0kV0tJu6wgiQFS9UO7C84Sg9ktRrjaDedjW4r4Xyp5xTRmbLjqEUlNZw
	24XDusjfsyR1BichN7pINVz3RuvHzW5fHR6RBsoTNWsdALzw6wU0ji1teaeg8d7Y5e93FtxTL
X-Gm-Gg: ASbGncvLQIQY0f6kjp4Ke3WPIC244ZPCLaMZw1Kosx4ensVPiG2MewJMjib1XNnnZJY
	8yPkChzK6aN6BW+D7j7ea2B/QCa67N1xcdy9TeQMKUCS0eJbX7v9ElSsthZvAAiA4Y1syGd50tt
	BLQ3EXiERtEpd+/RmJr/wnyuKk9sa9XB97bEL09A/JzFDv3E+frN0Uzmmmdo0TvPiEcMAEy+af4
	4NMU9qVwh7c+MIKpG9baiwz7X4Fg5CMDjckfSPTkU+mU6H+HLNi/GZMb+M6bJGHIW1FW6GScjyn
	jRwP4f8qf/2uFC7g60acQpLuVIR27ZX9New79jLZEw==
X-Received: by 2002:a05:6214:2507:b0:6e6:6c7c:984a with SMTP id 6a1803df08f44-6eed629b621mr1059216d6.29.1743187153297;
        Fri, 28 Mar 2025 11:39:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmaGUFo3C+EWgEgC2Qjw1O8SLn5UyR5+uhBzYEK+WvHlqvjwgDG2/+08yH13LN7hZFfbo2iw==
X-Received: by 2002:a05:6214:2507:b0:6e6:6c7c:984a with SMTP id 6a1803df08f44-6eed629b621mr1058826d6.29.1743187152801;
        Fri, 28 Mar 2025 11:39:12 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec964649fsm14276836d6.40.2025.03.28.11.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 11:39:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: mhiramat@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	aruiz@redhat.com
Subject: [PATCH 1/2] tools/bootconfig: allow overriding CFLAGS assignment
Date: Fri, 28 Mar 2025 14:38:57 -0400
Message-ID: <20250328183858.1417835-2-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328183858.1417835-1-bmasney@redhat.com>
References: <20250328183858.1417835-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Allow overriding the CFLAGS assignment so that the user can pass in
an outside value.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 tools/bootconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index 566c3e0ee561..d2713902ca5c 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -10,7 +10,7 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
 
 LIBSRC = $(srctree)/lib/bootconfig.c $(srctree)/include/linux/bootconfig.h
-CFLAGS = -Wall -g -I$(CURDIR)/include
+override CFLAGS += -Wall -g -I$(CURDIR)/include
 
 ALL_TARGETS := bootconfig
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
-- 
2.47.0

