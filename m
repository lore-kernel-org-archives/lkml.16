Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9038A2135B1;
	Thu, 27 Mar 2025 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081636; cv=none; b=tOPx8l6XhbPFJN84w0UGqGfajsfdL/lwBsL+I+I1Q56pSr7RxsgFIQT6gvRc7y9ghz7DzoUTPn9HZRGJ72su3DSDWCma3zeMLl123ZZnA1yQJrcUEz4j6uHicN0TQCgViqX9+BsxhtGby922iSbdgvPLcfsC7QyImTMVj15soak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081636; c=relaxed/simple;
	bh=6MGs1yQBSPS4LA4tu+8JjiTOcI1H9cGA3IwjG1Snr5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=EEhpQXBIC699B3fFnnehdFZvAAlIald0ycIZ3n1YKils1Wb1utJH9Zb2JSIxGyE5itsvOhVhWVBu3rAEm6V8/Dtl4uMtBrnYLa4xQ45mmLUsbEoRiO/sQX21V7t57pKRD8Y4waoVSvXlQt5O4LwcV4wngHHRWcxy4wO8jylulYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LEw1n6Wb; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LEw1n6Wb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=MF0CCH1EBw+S02V1IG
	fRTMbUhkYsgkt9URZu0EGveoU=; b=LEw1n6WbhapyZmogvjV+Nfx8AMMeK69g1Q
	cRmoVx91DdJ1pFAFN7D7UIU5vjoiRv+5FSM/3+yh88FSgAqbqKH/HuGu8won+4w0
	MQaAJVlNconbxSnuLPVgGf9qg41cZiC0XnOW/xjU8Jk2/Ci048Q3Ha5FfkZHLy5M
	VjGlEIYjo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3f7xtUOVn1ekMCQ--.39600S6;
	Thu, 27 Mar 2025 21:19:50 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	christophe.jaillet@wanadoo.fr
Subject: [PATCH v6 4/4] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Date: Thu, 27 Mar 2025 09:18:41 -0400
Message-Id: <20250327131841.15013-5-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250327131841.15013-1-wenliang202407@163.com>
References: <20250327131841.15013-1-wenliang202407@163.com>
X-CM-TRANSID:_____wD3f7xtUOVn1ekMCQ--.39600S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFy7tF4rZrykGr4xWr4UJwb_yoW8GrWxpr
	WfCF18tryFqF13W3y7t3Z5Gr15u3Wv9F48KF1DJr1a93WkZa4Fq39xKr1v9F1UCr1fZFWf
	uFn2gr48Xw18AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRsXowUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbibg0d02flSlJ+aQAAsg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add the sq52206 compatible to the ina2xx.yaml

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

Add the meaning of 'shunt-gain' in SQ52206.

v5->v6:add content to meet the update requirements of the ina2xx.yaml

 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index bc03781342c0..8cd672e6bf62 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -19,6 +19,7 @@ description: |
 properties:
   compatible:
     enum:
+      - silergy,sq52206
       - silergy,sy24655
       - ti,ina209
       - ti,ina219
@@ -58,6 +59,9 @@ properties:
       shunt voltage, and a value of 4 maps to ADCRANGE=0 such that a wider
       voltage range is used.
 
+      For SQ52206,the shunt-gain value 1 mapps to ADCRANGE=10/11, the value 2
+      mapps to ADCRANGE=01, and the value 4 mapps to ADCRANGE=00.
+
       The default value is device dependent, and is defined by the reset value
       of PGA/ADCRANGE in the respective configuration registers.
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -97,6 +101,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - silergy,sy24655
               - silergy,sy24655
               - ti,ina209
               - ti,ina219
-- 
2.17.1

