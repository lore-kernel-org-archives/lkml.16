Received: from flow-a1-smtp.messagingengine.com (flow-a1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C571922D790;
	Thu, 29 May 2025 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748536172; cv=none; b=CuLsMJaQg5LdyHaZUObD/Si8q7ILbHOgSe7BIPPjrzMUmnSHhzApm0Nou4j7WEUSGhmMfTAxIY0gspZgVMsA7WU49gTOqB/MAtPk5qr/23qU4sKVaCl+ReiB2lJmZwyTZoOmAq9XulDUGDYz1pko5QsIhKl99xne4YJnB3sbgEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748536172; c=relaxed/simple;
	bh=UNgUDAXkHlIBbA5EJiM/pkXEgC1TySQwzXSh1pwRw/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UgEesDSI7qGwnuKv0SrroPE/eZxPDVy64x0TZJCnU8fRvakSsUq+ngCBbOU176hm7TZ5z+Gq2zCRHKyzOAI+j1pcj60Ah4bl9YpIkuJMrFPW6o3IUzDC1G73Yeuaugdl9w075WWSzqKcTRdmfSz5hv/AeewZK/S33ULVy88d4Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sylvansmit.com; spf=pass smtp.mailfrom=sylvansmit.com; dkim=pass (2048-bit key) header.d=sylvansmit.com header.i=@sylvansmit.com header.b=gmH6JyrP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WpQCovO3; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sylvansmit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sylvansmit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sylvansmit.com header.i=@sylvansmit.com header.b="gmH6JyrP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WpQCovO3"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id A84DF20030D;
	Thu, 29 May 2025 12:29:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 29 May 2025 12:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylvansmit.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1748536169; x=1748539769; bh=U6y1NYN6Lp
	Cz1rhOU2PerukLGQDMLajakN4EzrAtJno=; b=gmH6JyrPPCti74LixDR4E7To80
	tqgsQTc7RUS9JAu+GGOaGgLyGNSa4RYrfzBiOGfOE1EaYlF/A3gWEoEI43MZ5Xrd
	nm45gU8wC+G0XULpt2XXajFNazdIEkxL5M4UP1d2WGm8+qEVfXSqH/WEFSva0LaD
	qCAfhhqggTDHcVOLDnIpndjOnftSgjS/pkBvvyTFUSYwF4duaVnteBG/aGSJQbu5
	IF2/QnMcf/Hnnerrtwk3N0ZeoWrSymUxwsuvsKr0Ikl6QS/6c7u5WQqFF9J15Jk9
	TNvdJB+s20D0S5rmN5RBmvnwd+NwrvY6th5oaYnpvLBKbf6LjvR+8SU0/u7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748536169; x=1748539769; bh=U6y1NYN6LpCz1rhOU2PerukLGQDMLajakN4
	EzrAtJno=; b=WpQCovO3v1MO7vQPu3bTPCGbnjCuNx06rgYbOIubqedmicQ7oKh
	ajbdR9k6Xv0AC5OSKdimfuWtYSy5tetv4fmbA8YVgstCWKk30HRNXx6Swcf/04Jq
	j93Zm+PlSdl8lbx1zDtE5l7kfNaSd1TObYRnA9hUIahiemgMhLVKdoOj4g0SJunE
	JdKjW6s+UQNWK5gKYpWIthSyimaF14j1SDM6B6/i5zTyx7wOhHc2+SVwFF/+z24A
	9JY6uV+iL0RPCo+Dh7B+gllYFgPvrvr4148uoHdGQUCVApYs2mAe66I3rZiJdyDQ
	8q3zzPS863kLd06216ReSRvwrpkscxbIBMA==
X-ME-Sender: <xms:aIs4aOKX6QL2R2qvaKijLlSDkn4tNzsc0xQcjy7-ULGoweRRxHL5mw>
    <xme:aIs4aGLTOGTDeKoJkOFpknLKKEpBLkdUPIDOqLuSu-DzUAfEFwJ0hwNXamGX5k_ZR
    xN7IaxTI37W-H_b-lc>
X-ME-Received: <xmr:aIs4aOtk1IvyvqH8JIuJwUlYAdll4YvX8tAQx9hcJSjlRQAt8ET2bieehuzG4yzA590azhqzc7XjZr3CzBRToAv9RHRi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvieeivdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
    ggfgsedtkeertdertddtnecuhfhrohhmpefuhihlvhgrnhcuufhmihhtuceoshihlhhvrg
    hnsehshihlvhgrnhhsmhhithdrtghomheqnecuggftrfgrthhtvghrnheptdeiieehteei
    ueelueeujeevjefhvedtffeviedtuefhveeiuddtgfetudeliedtnecuffhomhgrihhnpe
    hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehshihlvhgrnhesshihlhhvrghnshhmihhtrdgtohhmpdhnsggprhgtph
    htthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdq
    lhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehshihlvhgr
    nhesshihlhhvrghnshhmihhtrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:aYs4aDaGoXOinc9q9uLx2Diz5YcjE70xoHBkEk8I721P9GIy4nKDIQ>
    <xmx:aYs4aFZtZiT6hFoTfFr2idU6F1rfhwOMTJGBmhvBZ9wmdc9w_ogqlw>
    <xmx:aYs4aPBtBmYaEjExsYNxnog2KtmeTf2rDIhBtWktrOj3rGSgOd7x0g>
    <xmx:aYs4aLYAYCPiV2im_8JowRkWWeawCGXJ6qO03i5qf1SMOWV7Gk8FXw>
    <xmx:aYs4aBa-eIO8XtG2p4irHJ4eOLCbANrtyBNkERjCf593CEC0lR37Fg3l>
Feedback-ID: i446648cc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 May 2025 12:29:27 -0400 (EDT)
From: Sylvan Smit <sylvan@sylvansmit.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sylvan Smit <sylvan@sylvansmit.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] rust: list: Fix typo `much` in arc.rs
Date: Thu, 29 May 2025 18:29:23 +0200
Message-ID: <20250529162923.434978-1-sylvan@sylvansmit.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the typo (s/much/must) in the ListArc documentation.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Fixes: a48026315cd7 ("rust: list: add tracking for ListArc")
Closes: https://github.com/Rust-for-Linux/linux/issues/1166
Signed-off-by: Sylvan Smit <sylvan@sylvansmit.com>
---
 rust/kernel/list/arc.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index 8401ddcd178a..d92bcf665c89 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -74,7 +74,7 @@ pub unsafe trait TryNewListArc<const ID: u64 = 0>: ListArcSafe<ID> {
 ///
 /// * The `untracked` strategy does not actually keep track of whether a [`ListArc`] exists. When
 ///   using this strategy, the only way to create a [`ListArc`] is using a [`UniqueArc`].
-/// * The `tracked_by` strategy defers the tracking to a field of the struct. The user much specify
+/// * The `tracked_by` strategy defers the tracking to a field of the struct. The user must specify
 ///   which field to defer the tracking to. The field must implement [`ListArcSafe`]. If the field
 ///   implements [`TryNewListArc`], then the type will also implement [`TryNewListArc`].
 ///
-- 
2.49.0

