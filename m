Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572587260F
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748222088; cv=none; b=NsXqsG+iN7LOv4TUvWBZbJi0dQKdPx/4zt0KyjAdNbOirS8Rxa8+vKDl08+0NBm/iHMG52yU93QXbzPAKi4dc5DMACGF22GLeaB64hlXLiH6X9slRc7ENr73no6uPnsbfkXAEMF8L+S4erTXuDALnwHxkDumSAIPXLdmQk7WSW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748222088; c=relaxed/simple;
	bh=FH+XuZiqedmmbcdx7+ns4Iwr/ePiNYP4RtSE8O61uKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYUA7PVw2ZGFP0Ghnndo79VCjG4dqGAAktS+422VN3Yws1ABY+rI1QARukKC6/e8vbLrkmaMaz0x8EmLojVH79lAgddQDUTcxoRdATwvpgMlmbPVSUGVmrQ9Ph1V8B45lm3XGnjl2NIZTtzJkvy5Wpwbz4DEI/KTdKtD/504Vxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com; spf=pass smtp.mailfrom=gvernon.com; dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b=an9F9EQH; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gvernon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b="an9F9EQH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gvernon.com; s=key1;
	t=1748222084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQmxapCCbfWgqmAUgREJ3k7qr9htA9/0TELdt2lF078=;
	b=an9F9EQHsWusvm9GlT7yjL9cR0zq5emUqT9OpVbWFFzpBZxMYavkUf5X7SZ9G8Nc46AeGd
	dWrMELmFliSvgE/RKhWwQCx14nKWwA6i5x1Yxs13WagJfs7NeysVtzH7ePaEl4WEvV0DgZ
	1evDZGgT+qNYAjOyIutoqM4EV2ZdiAP8veFi0al1F8qCwPZDWBjBirrxM0860qx5ob+ujp
	5Hcj2LjTtQfYHT+ileTaPpwBam6E16UhgFFGo9Gxy+2lzI80k4k0z6WCRjJt523cJSXvNh
	n+DtNmETWH1kkfh/g7jzHeK6YBJ7U+gZQNmYzoiwDRk/HFckqP8Po3ngeIS7gQ==
From: George Anthony Vernon <contact@gvernon.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	skhan@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH 2/3] input: docs: Correct Amiga 4-jstick adapter pinout
Date: Mon, 26 May 2025 02:14:42 +0100
Message-ID: <20250526011443.136804-3-contact@gvernon.com>
In-Reply-To: <20250526011443.136804-1-contact@gvernon.com>
References: <20250526011443.136804-1-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Pinout incorrectly duplicated pin 18, correct this.

Signed-off-by: George Anthony Vernon <contact@gvernon.com>
---
 Documentation/input/devices/amijoy.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/input/devices/amijoy.rst b/Documentation/input/devices/amijoy.rst
index f854ee975247..ea4de1ac0360 100644
--- a/Documentation/input/devices/amijoy.rst
+++ b/Documentation/input/devices/amijoy.rst
@@ -17,7 +17,7 @@ Pin    Meaning  Pin    Meaning
  4     Left1	 8     Left2
  5     Right1	 9     Right2
 13     Fire1	11     Fire2
-18     Gnd1	18     Gnd2
+19     Gnd1	18     Gnd2
 =====  ======== ====   ==========
 
 Amiga digital joystick pinout
-- 
2.49.0

