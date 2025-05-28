Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1B5202962
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474237; cv=none; b=rJbORFjBrEsGSGFDW9HrSBLt9yXpkMQJhKV7nNIfNMRBbbh1U7FVRvrYWGU74J7MC0iUmwBpJQlw3R31nGuCjfHeCbimE6le7NxSWAYnYHE3UHJooWgIg6PzQ+ye5FovBv8trDdlxEiUM875pPfEAfCJu+gxo+ufzrSjwIRsFOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474237; c=relaxed/simple;
	bh=ccvc0hhbSgWY4GmJLHg7B4WAjq9gbICcuSkXsBTsGy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYBWBlk0pfeUwkLMczRfHNdveZGZfVfazb0diMJnsHqVIjUjrK1oXSnfoXxiR7L25QvTphWih5zI8Qv6LtLbCosNnTb3mW5oqWqviSZBE4N2aVdWrGaMnPV8yPAsa1TubsNXNWjSwA091AdjvkOYUfmzinDv7jhnFX3Vbk/opjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ha5FQH7o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ha5FQH7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PY+mAfokPX43RyMwVm9mydaLHH0tgHSo3DseyvVhR0o=;
	b=ha5FQH7oSsN7p1IwUDld8i76SfZ68r0W6z3xEirsx/Kzhj0QOGu7Chjco6r6Qyum97UL59
	7fSleVMq5JKB3BR/xirmRNsggloHVjXegN1pTjXMwYAxEw083QYxiSbxIAfPH84eVqRAdm
	qbvJC+h7OM+Wk0viq5nioqj3ZcfbSlU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-k7f2y7LtML6svDXYZTRuaA-1; Wed, 28 May 2025 19:17:12 -0400
X-MC-Unique: k7f2y7LtML6svDXYZTRuaA-1
X-Mimecast-MFC-AGG-ID: k7f2y7LtML6svDXYZTRuaA_1748474232
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47693206f16so6697561cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474231; x=1749079031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PY+mAfokPX43RyMwVm9mydaLHH0tgHSo3DseyvVhR0o=;
        b=trgWSOsjXv4KrJrO4/m9/rfHz0EhuJJpnNuKveGzXGtBB3DXaaio4Xf0toLEQX+6hc
         lcXQAZOhklopXGqYjjibIr7ivcDPsFMteumBe9Du4mpOEfCzf9tuLjbmq5Pzps3bTwhF
         JEctecaHO45YJW2Gkv7v6Z4zmy6+VIhEnS8dhEm7Pe3p3ku2g8R8aUxjfMOnV+Da/oOt
         zMrO+SPHc+MLu7mggn8kHVppzf1nzVE+cy2fwaE2CNLjJzB0FQ44JscI2mis4DXDdCA9
         AucSknKh30xhbjSET/yjAfoT+V7sRAOUXMXMjer+cEb0BOeOdP4gG76A1FlrIpSz6mf3
         pdrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuMoDkTQY8rkCWtrLikyha9K12TPUPn/NYByKVvQ/fU0S7a/A5rxQZbz5jH4B2E9XkJ+v1SeF0j7xMi8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYQRZXqtod2G+kk7PQH/CsbGGzhC0itCCFW950TUVatAFrzO8
	qOWp2P4juGVYsY1V8Rw61sRlrkScdmbrjDcgLCpQEQ+W6dOnLxZ0NDYdHaHTLDhDqHlg9fRsKrw
	voUO5cvyVqyocm+HDthCkaSmIxO+662k6HhjqP4dykTmU/7YDroKg0IgdfdA2NivohbdySK4PxZ
	G4LgNMsVZTxioKcI/vOKv2oZxvv+q/FlPXkXe3k6pHrwdx8WSEBno=
X-Gm-Gg: ASbGncuwiZTEVxKaM7DUWMoFZkh1eZyqsfocuTFo2nriDeD6xfQcA0/jmwhBvtJc5FX
	r3prRM5qMjfDYpHMD7x+ffDW6+YmJr2ps1J/rMhuhAPztH8xTigD6+tEYex5bb6ydKtdMfOnGKV
	ZD0uPZ0ohULWt1u7pY8F8RdpjIJ87XuXS1r08u2g1/ju9dmU+30J3wAShLRtsLsLb/KJQj9ibpX
	8Ss6h/HK/DjSFPLuOEYHdSTXqg7EbFlHbjx4dVoKmAM69gf2vo4Q0psc5YQhRE5LtoxPI7naszS
	RuYw7WPPxbV7rD48l+I1IzB1toIswTBOXWwkYwQablhNrCy/qw==
X-Received: by 2002:ac8:6f0f:0:b0:4a4:2c92:27e3 with SMTP id d75a77b69052e-4a42c922ab7mr60396201cf.34.1748474231292;
        Wed, 28 May 2025 16:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCeNM3Bj9nbqayT5oae0cCP00gch/AY0ajbgyiXPfwaajpbP5YKsDrcNpWKfpD5pJu2gx9Jg==
X-Received: by 2002:ac8:6f0f:0:b0:4a4:2c92:27e3 with SMTP id d75a77b69052e-4a42c922ab7mr60395771cf.34.1748474230876;
        Wed, 28 May 2025 16:17:10 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:47 -0400
Subject: [PATCH v2 01/10] clk: add kernel docs for struct clk_core
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-1-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=3224;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ccvc0hhbSgWY4GmJLHg7B4WAjq9gbICcuSkXsBTsGy4=;
 b=4HFuNr0KN0TtNnsFn27cZXoLo5n0gd64dH6POJAJfBz7XiuZ12lSLLq1YQ6SyLrA+ClPNKZx8
 bhTJNhT2gFHDcGi6pn/jMhdHIoyxPccAjyxy1iaYYwFoOuJu/KoBi6X
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Document all of the members of struct clk_core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0565c87656cf5c557d8259c71b5d2971a7ac87e8..a130eac9072dc7e71f840a0edf51c368650f8386 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -57,6 +57,48 @@ struct clk_parent_map {
 	int			index;
 };
 
+/**
+ * struct clk_core - This structure represents the internal state of a clk
+ * within the kernel's clock tree. Drivers do not interact with this structure
+ * directly. The clk_core is manipulated by the framework to manage clock
+ * operations, parent/child relationships, rate, and other properties.
+ *
+ * @name:              Unique name of the clk for identification.
+ * @ops:               Pointer to hardware-specific operations for this clk.
+ * @hw:                Pointer for traversing from a struct clk to its
+ *                     corresponding hardware-specific structure.
+ * @owner:             Kernel module owning this clk (for reference counting).
+ * @dev:               Device associated with this clk (optional)
+ * @rpm_node:          Node for runtime power management list management.
+ * @of_node:           Device tree node associated with this clk (if applicable)
+ * @parent:            Pointer to the current parent in the clock tree.
+ * @parents:           Array of possible parents (for muxes/selectable parents).
+ * @num_parents:       Number of possible parents
+ * @new_parent_index:  Index of the new parent during parent change.
+ * @rate:              Current clock rate (Hz).
+ * @req_rate:          Requested clock rate (Hz).
+ * @new_rate:          New rate to be set during a rate change operation.
+ * @new_parent:        Pointer to new parent during parent change.
+ * @new_child:         Pointer to new child during reparenting.
+ * @flags:             Clock property and capability flags.
+ * @orphan:            True if this clk is currently orphaned.
+ * @rpm_enabled:       True if runtime power management is enabled for this clk.
+ * @enable_count:      Reference count of enables.
+ * @prepare_count:     Reference count of prepares.
+ * @protect_count:     Protection reference count against disable.
+ * @min_rate:          Minimum supported clock rate (Hz).
+ * @max_rate:          Maximum supported clock rate (Hz).
+ * @accuracy:          Accuracy of the clock rate (Hz).
+ * @phase:             Current phase (degrees or hardware-specific units).
+ * @duty:              Current duty cycle configuration.
+ * @children:          All of the children of this clk.
+ * @child_node:        Node for linking as a child in the parent's list.
+ * @clks:              All of the clk consumers registered.
+ * @notifier_count:    Number of notifiers registered for this clk.
+ * @dentry:            DebugFS entry for this clk.
+ * @debug_node:        DebugFS node for this clk.
+ * @ref:               Reference count for structure lifetime management.
+ */
 struct clk_core {
 	const char		*name;
 	const struct clk_ops	*ops;

-- 
2.49.0

