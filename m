Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B786273812;
	Tue,  1 Jul 2025 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364096; cv=none; b=J1NpxzDuA4+4f0DsbgfpyiPsZvqETZYgqDplmSHdolrADUqrByQzt88hVWK5UZWNLffUNB5yW6o5Yey0jj/P+v4gZnUSNeVWVj1pGOgirQbQXG+F75P5n9i1M87l1y9MTZIj8Mk4eXR0WZyEyLrzNWoSXAzOfDr6vZNiH6JFbjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364096; c=relaxed/simple;
	bh=TMAXeG9Ax4zwoWvP0WGuB15LrX5qREtY31rJ/K8imd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qVW06mizVulqSN9GSr9JKT4DbTuIW//LVTSbPU6CQ2JksbT5JfBs/qosEvZjz9+LWkvtLuCs9OTjUUYPn/0nZCyZri7ZEeiXQm5gDom0NfLXOVPRzNoVviwUGCcHNMwhIeXSY4hTZgFdcIGmgD+THa3aCcGGczK5AqmuyL43mUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cdyhgIpp; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cdyhgIpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rQ
	DgbozZs0wCnVTQUwk8rjb8iJ2wpvBzg/YdEDreAPA=; b=cdyhgIppjytp2U79bK
	btCeDDPRrMkkM61+7IuJSFAYN8TL9rmTbA/EdeIiUtiQCu91rqs6atcSGmGJS2gM
	jz7vGkp+iuzWHCNJN8Iu2tLqfb/91QIUQR/4GEfPCAJA06f94KNpmRAeInVMzEuT
	VcRuczSVfyNH229Tl3mGFwxhM=
Received: from mps-HP-EliteBook-840-G3.monolithicpower.com (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX_zqLsWNoZKLkAQ--.58034S2;
	Tue, 01 Jul 2025 17:59:40 +0800 (CST)
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
Subject: [PATCH v2 1/4] dt-bindings: hwmon: Add MPS mp2869 series
Date: Tue,  1 Jul 2025 17:59:27 +0800
Message-Id: <20250701095930.1050234-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250701095625.1049917-1-wenswang@yeah.net>
References: <20250701095625.1049917-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgDX_zqLsWNoZKLkAQ--.58034S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF4kXry7GrW5Kr4kCr1Utrb_yoW8Gw4fpF
	WkCF4IyF4FgF17Ca12gF1kGF45WrWDAw4kJayqyrnrKr1a9rZ7Ww4a9wn5Xan8Crs3JF4U
	JrnFy34F9Fyjv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8jjkUUUUU=
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiIQyCJ2hjsYwevAAA3c

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mp2869 series controller

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
V1 -> V2:
    add Rob's Acked-by

 Documentation/devicetree/bindings/trivial-devices.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 27930708ccd5..493e7232f09f 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -285,10 +285,18 @@ properties:
           - mps,mp2856
             # Monolithic Power Systems Inc. multi-phase controller mp2857
           - mps,mp2857
+            # Monolithic Power Systems Inc. multi-phase controller mp2869
+          - mps,mp2869
             # Monolithic Power Systems Inc. multi-phase controller mp2888
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2891
           - mps,mp2891
+            # Monolithic Power Systems Inc. multi-phase controller mp29608
+          - mps,mp29608
+            # Monolithic Power Systems Inc. multi-phase controller mp29612
+          - mps,mp29612
+            # Monolithic Power Systems Inc. multi-phase controller mp29816
+          - mps,mp29816
             # Monolithic Power Systems Inc. multi-phase controller mp2993
           - mps,mp2993
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5920
-- 
2.25.1

