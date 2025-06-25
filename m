Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF61E5B6F;
	Wed, 25 Jun 2025 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838840; cv=none; b=FT0FuTkTWnEd9MofIfwmgef1k/XHTxQILbDx8ppqM1kSDW4T2cw3ZawYBI3M9W5DS+7KXsgnS8h7g1dkKiAWSErhp9Wu9JNvp6tYdoobB7a/oZfVe2SrTo3z/WJHdp7IKiZ+RRG4RYX7CiirsQ0YaXaffQRFttRKRrTb5LZ53w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838840; c=relaxed/simple;
	bh=TCuSxifzX9CBgsGlRjDPkKP/DAen5me5qQ/q/qMAIZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fLgovD1CFeRdgQbQNKV40xKHz5tV4SLyoQUk3dfo6TbPqJdWXnzP1YySJ3ofpI0s8SOPZ3GjlsPsxKJQ9heoiieQNmOAGvldO+us8wTvS7S8DeCY52euYDRZ9H+yqcDG1AXRpBrAvz/4UJJHD9vrB7Itp6Zk+0bVZYNedY7w63Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bz9kPgx6; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bz9kPgx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0W
	mHz61pOuc8mNMwx/wFxfFDW8jE3ZKqr9gWGALrOII=; b=bz9kPgx6hlqwRLxJ70
	RzYkc5Q+fZiT8L1NCmM2anxpqBObpkir3DHfzVWvcCWX0+vPMQBVidKqRGrzMZN8
	pYA2NR72yEsJq+K3z6N5hEyltSnuO/stcrra+Mc6Tr3sjiDlq82HgtamnoJxTDPU
	tHPeBgwtUV5vDvV2Su/QTtlLM=
Received: from mps-HP-EliteBook-840-G3.monolithicpower.com (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHvw6erVtoD2t5AQ--.20252S2;
	Wed, 25 Jun 2025 16:04:49 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: Jonathan.Cameron@huawei.com,
	michal.simek@amd.com,
	naresh.solanki@9elements.com,
	festevam@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	grantpeltier93@gmail.com,
	laurent.pinchart@ideasonboard.com,
	cedricjustine.encarnacion@analog.com,
	nuno.sa@analog.com,
	ninad@linux.ibm.com,
	jbrunet@baylibre.com,
	kimseer.paller@analog.com,
	xzeol@yahoo.com,
	leo.yang.sy0@gmail.com,
	Mariel.Tinaco@analog.com,
	johnerasmusmari.geronimo@analog.com,
	linux@weissschuh.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH 3/4] dt-bindings: hwmon: Add MPS mp29502
Date: Wed, 25 Jun 2025 16:04:25 +0800
Message-Id: <20250625080425.966014-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250625065956.964759-1-wenswang@yeah.net>
References: <20250625065956.964759-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBHvw6erVtoD2t5AQ--.20252S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryrXrWxGr4rZr48JrW8JFb_yoWftrb_uw
	4xZa1DCrWkJF1fK3Zakr4kAr15Jw17Kr409wn7tF1kXF9agay3KF93t34a9ryxGay7ur15
	Cwn2grZ3XrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0C387UUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiEgp3pGhbdHLEzQAAs3

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

