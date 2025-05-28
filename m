Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18127221F05
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474238; cv=none; b=P6erVbeOxrR9Xf7PpIeKImJqlKmj98FKD7DjKd2FvGhNgiDVVvD4y48QQxMdwpNFq5lmkZ++UshWiLNeuVmE1BOv5gyL8RD+dfbwCyxJRojE/i7Rid7lD+qEGsUugEsgc9CtMUmDEzkChepiUTz0gMt4UOB49x1DGU0dQvfGTzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474238; c=relaxed/simple;
	bh=qHWMuJJeiaFRL42fA+VeDuXKnBkY09NzfffNrn6wjts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QSqyf1pmE/9kk9X1fg33Z8bt9ObGG5ONYTfeFUd60VkTMKrlOFRC6VyiyvOkKa28id6I5UpsedPW8EZK/X/lDQO44p8nJcFbRnEE6JdWRRy06xT/1aN7V78I+teXwaYkG6Rsr5Cuo+nZE01esu4az1rf1M8bBSNhxLZ4ad8vpS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fdsht0Oi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fdsht0Oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsO0o+0Q+nOaUfiqEKDHar0HrNWiuKhDLoPUZEKfrSM=;
	b=Fdsht0Oi03kvecyaOmBHhDHXnZa0r/uY6fBuHXaYgZ/ZOClQZJ16WqA0o9rXinzVW3rIkN
	M4e8qyQyOEx6iMPr5TKKln4W81cHOczBcqZaB7RSoyTLvjSuXQhFUoZAWz5hbq8TsE7jax
	v4961CL67qRfs8Xw4szG+5VzK0Zws20=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-n7_tQUfSPeKk5lyTawBNQA-1; Wed, 28 May 2025 19:17:15 -0400
X-MC-Unique: n7_tQUfSPeKk5lyTawBNQA-1
X-Mimecast-MFC-AGG-ID: n7_tQUfSPeKk5lyTawBNQA_1748474234
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c9255d5e8cso57698085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474234; x=1749079034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsO0o+0Q+nOaUfiqEKDHar0HrNWiuKhDLoPUZEKfrSM=;
        b=pd7Tf/iVJAcYNysr0YxlAnRjKfjBpE4zkq05JYiuhG1ir3adr2qj8xvqUweLQSTgH5
         xLzyW/N9sCpFeF/A+nY3ame0ztHWOmPGbDM8FJ4G1MkTJbxcOGF8ijLAPu2whbg2YvDW
         vKJq3tt58aDdK95cTy0tn3veD+aDDUouOsyLUYC0YFtXLS05xSWwyH/VgJccmsGlY003
         XG0t5qBki8y4waz/MPfKqd8ifvV9sH4QYWwYoSN1KTX+wXxClu1rfIei81/PQayRjxvr
         oWjXrINRW/0ypn/EIT6kUG57ZEaSTa6A1JLjmoRhWucjPEDScYivOIZfkA0Kv+oR3utg
         DOpw==
X-Forwarded-Encrypted: i=1; AJvYcCWkwGT3iItJuNWfIS/2EVkcaxbCf94KWXH76K8MMmWqRAKlKddhelniIyarUEPn4CbDOU/mb6jYpn5TaCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPKZO6ymctNgLwJ9Nsx5/J1rze1EIq333nIbht27Pe8fItO0s5
	72qrSXSwbbhK8CwF27dbgxOCcRxtQ8Tuy/xc0QSYX1uVSt2d8dn/h1Aq7vkEt86uZCV21DzPFIP
	732+zgTraaGAzV1wqW/WLcL89wQyjzjMLLQywXuZw8aH3OSPE+T4IX6cGTA4AdYRnE4GvgwvHqQ
	Xqpe5KttDcejz0IOhAFLnbSZfzrNix9rQ5Gr2Ev8A08PaSWTCoZIU=
X-Gm-Gg: ASbGnctxKgIJ9+t7EdyN+NB5BhVji4wt/fbJh1ZRCBRk8gNWuQTSq4ptJu2Yi8GRKKb
	3+w4Xyk1luCSXx5ySfpiLb3SSvTCEwQqJZfc+6MSQhuJlcLN9+jN6feywhPpoMQaiT9SXtZ/ozb
	YNU+vPZOu+O4iLWXfHxqtgevWGNjOT1q+NX+APy9X1cHCMbNxMPvTqDBqdu2aMaNGwms1ouF8ul
	ISJPwHUnTgOIjn8YgDuEpz+f3dCc9w4p3DHibOPxihzdj1LCKzRoPmbr9X9L84IANH0KJsW6qiS
	hNPpJC4siD4Lfp1syk+9D6uMKC3V4ZNEx/EUHLVQUSKqOgAx8w==
X-Received: by 2002:a05:620a:198c:b0:7ca:e9a4:1daf with SMTP id af79cd13be357-7ceecc1477dmr2520584085a.17.1748474233645;
        Wed, 28 May 2025 16:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeRy1L6jgz1ljwYUl6+2mH0y0bpS10ePGj/2A9iFDC60nrQsO2Mg9oLWVTaaF2+NVH9joC7Q==
X-Received: by 2002:a05:620a:198c:b0:7ca:e9a4:1daf with SMTP id af79cd13be357-7ceecc1477dmr2520580185a.17.1748474233201;
        Wed, 28 May 2025 16:17:13 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:48 -0400
Subject: [PATCH v2 02/10] clk: preserve original rate when a sibling clk
 changes it's rate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-2-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=5847;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=qHWMuJJeiaFRL42fA+VeDuXKnBkY09NzfffNrn6wjts=;
 b=daDGbjkH/b8bKqTXSFLxxEbRD/FCqFx5/x05oK7AinkKtA4WnzIRIsMAbCX5yyHOyPJZ3sqBo
 MK+gGq2PoMpB1u41iY8wDiJa78wIH7T5+p2tZC3f7D2cPC6g4/W+Kye
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

There are times when the requested rate on a clk cannot be fulfilled
due to the current rate of the parent clk. If CLK_SET_RATE_PARENT is
set, then the parent rate will be adjusted so that the child can
obtain the requested rate.

When the parent rate is adjusted, there's currently an issue where
the rates of the other children are unnecessarily changed. Let's take
the following simplified clk tree as an example:

                     parent
                     24 MHz
                    /      \
              child1        child2
              24 MHz        24 MHz

The child1 and child2 clks are simple divider clocks in this example,
and it doesn't really matter what kind of clk parent is; for simplicity
we can say that the parent can obtain any rate necessary. Now, let's
update the value of child2 with the existing clk code:

- child2 requests 48 MHz. This is incompatible the current parent rate
  of 24 MHz.
- parent is updated to 48 MHz so that child2 can obtain the requested
  rate of 48 MHz by using a divider of 0.
- child1 should stay at 24 MHz, and the divider should be automatically
  changed from 0 to 1.

The current bug in the code sets the rate of child1 to 48 MHz by calling
the clk_op's recalc_rate() with only the new parent rate, which keeps
the clk's divider at 0. Specifically this example occurs in this part of
the call tree:

clk_core_set_rate_nolock(child2, 48_MHZ)
-> clk_calc_new_rates(child2, 48_MHZ)
  # clk has CLK_SET_RATE_PARENT set, so clk_calc_new_rates() is invoked
  # via the following block:
  # if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
  #     best_parent_rate != parent->rate)
  #      top = clk_calc_new_rates(parent, best_parent_rate);
  -> clk_calc_new_rates(parent, 48_MHZ)
    -> clk_calc_subtree(parent, 48_MHZ, ...)
      -> clk_recalc(child1, 48_MHZ)
         # BOOM! This is where the bug occurs. This invokes the
         # clk_op's recalc_rate() with the new parent rate of 48 MHz,
         # and the original divider of 0 is kept intact, so child1's
         # rate is changed from 24 MHz to 48 MHz by the clk core.

When the clk core requests rate changes, the struct clk_core contains
a new_rate field that contains the rate that the clk is changed to by
clk_change_rate().

When a parent changes it's rate, only ensure that the section of the
clk tree where the rate change request propagated up is changed. All
other sibling nodes should try to keep the same rate (or close to it)
that was previously set. We avoid this by not initially calling the
clk_op's recalc_rate() for parts of the subtree that haven't been
modified.

Once the new_rate fields are populated with the correct values,
eventually clk_change_rate() is called on the parent, and the parent
will invoke clk_change_rate() for all of the children with the expected
rates stored in the new_rate fields. This will invoke the clk_op's
set_rate() on each of the children.

This doesn't fix all of the issues where a clk can unknowingly change
the rate of it's siblings, or put them in an invalid state, however
this is a relatively small change that can fix some issues. A correct
change that includes coordination with the other children in the
subtree, and works across the various types of clks will involve a
much more elaborate patch set.

This change was tested with kunit tests, and also boot tested on a
Lenovo Thinkpad x13s laptop.

Fixes: b2476490ef11 ("clk: introduce the common clock framework")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a130eac9072dc7e71f840a0edf51c368650f8386..65408899a4ae8674e78494d77ff07fa658f7d3b0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -78,6 +78,10 @@ struct clk_parent_map {
  * @rate:              Current clock rate (Hz).
  * @req_rate:          Requested clock rate (Hz).
  * @new_rate:          New rate to be set during a rate change operation.
+ * @rate_directly_changed: Clocks have the ability to change the rate of it's
+ *                     parent in order to satisfy a rate change request. This
+ *                     flag indicates that the rate change request initiated
+ *                     with this particular node.
  * @new_parent:        Pointer to new parent during parent change.
  * @new_child:         Pointer to new child during reparenting.
  * @flags:             Clock property and capability flags.
@@ -114,6 +118,7 @@ struct clk_core {
 	unsigned long		rate;
 	unsigned long		req_rate;
 	unsigned long		new_rate;
+	bool			rate_directly_changed;
 	struct clk_core		*new_parent;
 	struct clk_core		*new_child;
 	unsigned long		flags;
@@ -2306,7 +2311,11 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 		new_parent->new_child = core;
 
 	hlist_for_each_entry(child, &core->children, child_node) {
-		child->new_rate = clk_recalc(child, new_rate);
+		if (child->rate_directly_changed)
+			child->new_rate = clk_recalc(child, new_rate);
+		else
+			child->new_rate = child->rate;
+
 		clk_calc_subtree(child, child->new_rate, NULL, 0);
 	}
 }
@@ -2579,6 +2588,8 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	if (clk_core_rate_is_protected(core))
 		return -EBUSY;
 
+	core->rate_directly_changed = true;
+
 	/* calculate new rates and get the topmost changed clock */
 	top = clk_calc_new_rates(core, req_rate);
 	if (!top)
@@ -2601,6 +2612,8 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	/* change the rates */
 	clk_change_rate(top);
 
+	core->rate_directly_changed = false;
+
 	core->req_rate = req_rate;
 err:
 	clk_pm_runtime_put(core);

-- 
2.49.0

