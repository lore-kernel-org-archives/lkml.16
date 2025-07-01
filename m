Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF412727F9;
	Tue,  1 Jul 2025 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364054; cv=none; b=eMJNqjladKkTyWwa1VykT6OtQjvOGCgFYx2x8VUdryJtoGmkCR1eaK1Ik3J8i6XDi8jo727758hbaRi2z9h2vG8PezHsqfJzM5iy9RYNQzDGvcPqT8Rxqm3ajsNUCb6EOeZvvpdX50W987C1V6zVXN8oaRDLef/ZLJnXC6y3ZPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364054; c=relaxed/simple;
	bh=TCuSxifzX9CBgsGlRjDPkKP/DAen5me5qQ/q/qMAIZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BJEvDUmms1Xpum1z0I/drCVGmZbyRhu+GctFsjCFupWrAaHdzZE4zA8eEPbuGvlSyBzKyeQo8XhYtLFRhapNRgD78AHFse85NB86h+rcdBnWeBDH4ClQY+E/MlPXR3+uG+WU1TUhBRd07D5+lZ2RL3EkzjTM/aq+QHAZwAF4YAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=daiLm8kH; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="daiLm8kH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0W
	mHz61pOuc8mNMwx/wFxfFDW8jE3ZKqr9gWGALrOII=; b=daiLm8kHBqVq3F2quJ
	eY8Gc6SkvgW7HWN6xZri8SO7B7vrf83/JyDQeWKFK2yYTENYIl+9WjmgULhLIDbW
	FZPbg3l+4Td9NMf2ePUPJFo98OQjFFKf6ZsSTHx6g9EHUe58qpHi4i0jxqbydWNV
	7vMDioBLa+h8Bh9Km/XVb6mCQ=
Received: from mps-HP-EliteBook-840-G3.monolithicpower.com (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX_zqLsWNoZKLkAQ--.58034S4;
	Tue, 01 Jul 2025 17:59:55 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH v2 3/4] dt-bindings: hwmon: Add MPS mp29502
Date: Tue,  1 Jul 2025 17:59:29 +0800
Message-Id: <20250701095930.1050234-3-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250701095930.1050234-1-wenswang@yeah.net>
References: <20250701095625.1049917-1-wenswang@yeah.net>
 <20250701095930.1050234-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgDX_zqLsWNoZKLkAQ--.58034S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryrXrWxGr4rZr48JrW8JFb_yoWftrb_uw
	4xZa1DCrWkJF1fK3Zakr4kAr15Jw17Kr409wn7tF1kXF9agay3KF93t34a9ryxGay7ur15
	Cwn2grZ3XrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU89a9DUUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiIhuFKmhjsZsfNgAA3e

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mp29502 controller

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 493e7232f09f..2066696ecff4 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -291,6 +291,8 @@ properties:
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2891
           - mps,mp2891
+            # Monolithic Power Systems Inc. multi-phase controller mp29502
+          - mps,mp29502
             # Monolithic Power Systems Inc. multi-phase controller mp29608
           - mps,mp29608
             # Monolithic Power Systems Inc. multi-phase controller mp29612
-- 
2.25.1

