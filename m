Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8871B253B53
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031602; cv=none; b=B52irJJRTyENpZNb2b1QWdDMEKCYWpzpMIIhmkVJxlkSIysF90pMGC7wuGvr1DVCucQO+Sqgsg7KEVRHS3HIlAC+fRlHzekjaPKtsem/aJYU9TKkT093FgQbJsPzErquZS50GPX1mQ4O7z+qz4v2swvfYfqHwmQV7selo9rGDag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031602; c=relaxed/simple;
	bh=Ga2K09VmKsNU+0mnEVhgO1+H24/PI+fT+YcdrRb2qEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=e14YVu3ZU4SME6EqKMQ4NaCHR1AA5jAv9M5rSJGdbY98NmHK4aYWe6epMfLQ+X3xSuQdrWpfzuMBRNWFnTfPFqCxgLWBY05q+i3D2Eh5QQa4dv5TJnA597KSYqN4DYe2XI02Caeabj5ccOoQygQy/R7XHRBjZ36MKPNT45mlLZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HQVezAXu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HQVezAXu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vCiYE/HbpALtWNARoJxya1tjWc8KeYYpYFoVh2t216c=;
	b=HQVezAXu7l8vht59hAPVuqMlXnVdWkbwjWL+OLjO66gHkY7hwGWj5vRADk/5krn7o1TFRs
	2JaFDTAXHgcRmLPBtabIVqjc9zBlrZCpUIpVNpazCflnxeuol2G5dILk1/mQQYFYa0K9hM
	ejUqVKWuqH5De5yHCh9a6ghLiTIFF6s=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-qfcsyhZAM0ed2Hn7nCr1MQ-1; Mon, 07 Apr 2025 09:13:18 -0400
X-MC-Unique: qfcsyhZAM0ed2Hn7nCr1MQ-1
X-Mimecast-MFC-AGG-ID: qfcsyhZAM0ed2Hn7nCr1MQ_1744031598
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54a6b0c70so382247785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031598; x=1744636398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCiYE/HbpALtWNARoJxya1tjWc8KeYYpYFoVh2t216c=;
        b=Xgnrm0SMRqt6kfeLBz3gmcU/NfpgJoupHueF5p5CLmC5DEdDlHlRHwSq1W2UTykm7E
         zlQ35ij++BG2Hr+dJOF5gNHytr5c4vQ8jGwp+y+2DuyVUiiYheE6HYr5znkrdl2uiIs5
         nuQ02Rm4RZRDgLnszyl+Qh5e6Wh7OXSKtbC4vJLPKUfY9bsw2pqEAp0q7g+JaC4t/Z18
         IFXfRB3kfTR9zwlInVeCGR1mECgeiyXzSuOGGZhdzgYBqM+j2E4zDfZrE8CcRZMNPIyx
         y6bnTYhZ7b4hLHozdbCGHpvhHzNchROFC0LvsLfaZTn2FhJKg78ARed4EBYui56+X0D+
         y62w==
X-Forwarded-Encrypted: i=1; AJvYcCXhlfpb6Ix7MZU3dhVV1iufSIKdrgr+NeDsfkVKZnnIIU83hma/HuIHCdBSEVTlbhR0cikDCnE4vG5fCgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBbiU2FtB3ANY1yYu+VpOxJdRgmK73SbmKYzz32o71zmeII2L8
	qYYcFMI/mbblKC4+SRBJUIIeMYVIXNZvOOSf10Ym6UcQ3rk0MLGnZuswzmwJQfMg6FRmEAMTqAk
	8PA/7dlTIWunZuEjEYh/9KOst77dBfD+h9vjm95+vBOJoKSzO58iDtWMR/Jwy4g==
X-Gm-Gg: ASbGncuqssJHZ3+vaSDyRy7aCrNo23dlOeLjs1oY6J6k86MV+IZGYVjnxuXmFqkL5IH
	F64Rciw6vBC1aDvz48YsKafWKuC6pKKCxrbds+yz/H2fBUG9BY1LNVbKKEqLRzd8VFsk5SXG0Ls
	vq5dTOy0r/aJ4lntco7qKh7UygcDDqV5Mx3zTg2HEfkOtj5apWFbimA3aDyG3pn6ZsxfTDzl4IC
	rZw5jicO3djx+Z0MX/LIP0vDXcfFY7OHsf/mWusWrHncWMGECEOh1yGLyVW8lbK4TrMYuhqg0kx
	d763KuY/QPxQpc1rTioYUm+xKcYmXNw/cuzTEPC1WQ==
X-Received: by 2002:a05:6214:2a8c:b0:6e8:f568:22e8 with SMTP id 6a1803df08f44-6f0584e7218mr192571066d6.15.1744031597940;
        Mon, 07 Apr 2025 06:13:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFockwKyOARh1pqCe+ax8s85aAbuAeIui04lL9zrBZU1ZDa7xBuA5q5m9Vib49h98pfLr3qNw==
X-Received: by 2002:a05:6214:2a8c:b0:6e8:f568:22e8 with SMTP id 6a1803df08f44-6f0584e7218mr192570576d6.15.1744031597548;
        Mon, 07 Apr 2025 06:13:17 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:15 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 4/8] clk: test: introduce clk_dummy_gate for a mock gate
Date: Mon,  7 Apr 2025 09:12:54 -0400
Message-ID: <20250407131258.70638-5-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407131258.70638-1-bmasney@redhat.com>
References: <20250407131258.70638-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

This is used to mock up a gate in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 7d4dd1a559db..14ae88df5389 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -181,6 +181,40 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+struct clk_dummy_gate {
+	struct clk_hw hw;
+	bool enabled;
+};
+
+static int clk_dummy_gate_enable(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	gate->enabled = true;
+
+	return 0;
+}
+
+static void clk_dummy_gate_disable(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	gate->enabled = false;
+}
+
+static int clk_dummy_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	return gate->enabled;
+}
+
+static const struct clk_ops clk_dummy_gate_ops = {
+	.enable = clk_dummy_gate_enable,
+	.disable = clk_dummy_gate_disable,
+	.is_enabled = clk_dummy_gate_is_enabled,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;
-- 
2.49.0

