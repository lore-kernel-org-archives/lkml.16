Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B836B26157E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295951; cv=none; b=B+4SAI2xcZmXaQBzEZVxdxBQBRV6i3ejUDLdC64C2v6w36FWywjFvxe+quE2Xp1gOuieD73NzTxEXUMzNHuiCT79ryzCEqfB/RuJxoRFsmeYUCmYLs8kLXMaiXMr/OgQt66+CX8K04njI2BfWmOuvhD/Ir2uaesmB57nmCk77aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295951; c=relaxed/simple;
	bh=dTvy6fyffzRxcgF5lIWtfRUlZwl2If8HDMDUsHDXjdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1m3x1EnU3hE1Q3mP0oojuQgheF0gnbjtuq3m1yHrbTyeprGwYFTR9wchNMal2Aekj/WEt0UeBh3tab7CFJzH0bpDv/hwjq0RWlRU1fIOCbSia1Wfm6qYqhXTGbPtdmCiWhd+QyML6leUFEegx/WDzkjdLbaw/rkVUF4Bp3aWEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Aldn1XbG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=n5B9lcZt; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Aldn1XbG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="n5B9lcZt"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D0DAD2540127;
	Tue, 11 Feb 2025 12:45:48 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 11 Feb 2025 12:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1739295948; x=
	1739382348; bh=GIFexkCqrPd7tVDQwCNayNvdGfiWwZdap6JG7M+32EQ=; b=A
	ldn1XbGXUu6jVcjs3gNrDALJgmlqpszVE+hxqPCa1aqIsuunwnUZMaGuXutmKJJz
	ENDPCnJ9ElKxOjYsi916aL7Ovvf+wcOP5uPcf6aQPf8Tg3gG06VJzSbuTxRuxhsf
	PW85v8iy1hUsKccGgqv3SP+1uDZ2sp1dKb/bsZOVTCO4wyss46xTVVJ/V5BeP7Si
	X41v03Q0U3PTmuZcDGcxHT9aqN+9XF0MrcI/jxcdKWuC6d/hgHcsGJpN1lzCh+FM
	Ej/SJr/6DWzLG9n+/c5Z8eTbOh++iPikE+Ay64TKN37tgS+6Nw4c3k+Ld5lGqwNm
	YRrMa4lCsGd89mUcvs6GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739295948; x=1739382348; bh=G
	IFexkCqrPd7tVDQwCNayNvdGfiWwZdap6JG7M+32EQ=; b=n5B9lcZtkAHbC9Rcp
	6uZbzJo5j1KjlgC1mv+26Do1YBujpr4cwUm4oxz7bavWc8WkeOffbxf6NAOdZ7PY
	aw1WJAG9olRykDEL/ox3aOosYLb54/fdOTBMsVK+zyGVitP13OkaKDwT4RN2qYcm
	jrOT9r+1IPF2Xeu5uFG+6TGLRCOpUDFOAxzFslXl7c5zgqB+mWcVnXdm3ApaRSQo
	hexAdsE+3ZvdMaE9sf0M8sv7NVCMeUG2//9/8N3BJbu7zzNkjMyl0uEdd5j1GJGs
	BHg//akq82oT2y79L4lBRuVOhtBVaMKzvzrwpidQ6IFY5ocP91DDEDhp7NJYl71S
	vR2kw==
X-ME-Sender: <xms:zIyrZ2ZcH1Y0wP7RnmPNChzQfQz22UAydSzCZgOiiS4OVBf4fTF4VQ>
    <xme:zIyrZ5YXXMKEK5m7V9GmLGM4mzPPJlcudd3cERxNYbHQTKd4UGO6fi1F2UoNCB0gX
    MH-NZLriA0NRu-alUU>
X-ME-Received: <xmr:zIyrZw8nD0hEvVFg7UcsHqKdIBde5WprW1RYMmk5gi8ZclAtmGAw7UN8lpfZxMl61iak6571qlp1wcyZ0LrE9tOiVdCgMZBcGGHkfzP4zhkHsmHR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecuogetfedtuddqtdduuc
    dludehmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhm
    peforghrkhcurfgvrghrshhonhcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvg
    gssgdrtggrqeenucggtffrrghtthgvrhhnpeegkeegfeegieduuddukefgudeffffgffdv
    ueekheevvefgiefgfffgffffueejheenucffohhmrghinhepohhrrdgtiienucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeefpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggs
    sgdrtggrpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepmhgrrhhkphgvrghrshhonheslhgvnhhovhhordgtohhm
X-ME-Proxy: <xmx:zIyrZ4qHQpRu2zH0Ekc00rD4iEaA26TIvs_JCi01Lg-qIC5JvzrJvw>
    <xmx:zIyrZxp2lcE9v_x6-jfCsUbI30hW4uhaA1_M7WP5pCYHHOAPWcR06A>
    <xmx:zIyrZ2RBnaF4CouOTnHq4f93aKKQT84WdlEB3r08NiCO-GprfelSog>
    <xmx:zIyrZxpBgosNOBxtC-0-8dLoh2wsaklYYEnlHKsZUWdwcbTZFBWlYA>
    <xmx:zIyrZ4Xv_vWf9OHnOS391G-9lXRjdX8IA8HL_UgtbY-vdG6DRSnP6sov>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Feb 2025 12:45:48 -0500 (EST)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: linux-kernel@vger.kernel.org,
	markpearson@lenovo.com
Subject: [PATCH] MAINTAINERS: Update email address for think-lmi maintainer
Date: Tue, 11 Feb 2025 12:44:58 -0500
Message-ID: <20250211174521.17542-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I no longer use my markpearson@lenovo.com email address as the Lenovo
email servers are garbage.
Switching to my personal account that is more open-source friendly.
I am still a Lenovo employee (if that makes any difference)

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 25c86f47353d..5a819b2a333b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23588,7 +23588,7 @@ T:	git git://repo.or.cz/linux-2.6/linux-acpi-2.6/ibm-acpi-2.6.git
 F:	drivers/platform/x86/thinkpad_acpi.c
 
 THINKPAD LMI DRIVER
-M:	Mark Pearson <markpearson@lenovo.com>
+M:	Mark Pearson <mpearson-lenovo@squebb.ca>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
-- 
2.48.1

