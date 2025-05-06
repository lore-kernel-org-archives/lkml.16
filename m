Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661CE27BF9A;
	Tue,  6 May 2025 05:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746509948; cv=none; b=IajYhBsBAYeFRXRvam01W4eVPjy5ev2de9fVNSsEHuFQm0ShERMC767PNdcnZ3sXFIXIX2lBTQQyjqN5eEJtf10AeFAIJREoZDkz/EU3eqC765t/pwJrGaiGk+K2iNnhWMMwagwfnNNPvlk+v+hjepnFAlCoZpI7kvMlnEKSdbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746509948; c=relaxed/simple;
	bh=jS6WcRUZ5LMlqt/v3lxpcWGgtkNFOwJfvXYwfqfFbi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=abdFgEBTpdt6u9n9fNkiUWgrCkEX0RF/ZazA7fCtLHpNmgRyxRYeiTDKPVJC2MO6oundOMxFJZP6vol4NRJvp+EeUAR0tDTx7xo/Yh4JyAu7gPT/kLG1ZO/YIO6GTUx0TjTgj7/4vcP06t+g5IHRNtJX0nzmGRHoZSNfSFWr5Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fIRgVAd3; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fIRgVAd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=SEKm99PurVmtrNTupP
	5Lg3cHjShnygrGqkE6bVv/E7I=; b=fIRgVAd3fMVfzNtZrUHMKm4X5GSFt8lgWi
	9njtbfBxHMQhvRTM4ntJlB65BvfuWlTqWy8Ys+YmtCU90kEmfBKhadOclNKvdA8a
	fQGUsQvJVLZCBWOVCnU2xkf61BfP7bcQdkIpdaBhmJb0GfKbfztdrjwQtoXTCEyU
	WkyuG1TeM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBHxSpEoBloZ2M1Ew--.50689S6;
	Tue, 06 May 2025 13:38:28 +0800 (CST)
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
	christophe.jaillet@wanadoo.fr,
	derek.lin@silergycorp.com,
	miguel.lee@silergycorp.com,
	chris.ho@silergycorp.com,
	eason.liao@silergycorp.com
Subject: [PATCH v7 4/4] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Date: Tue,  6 May 2025 01:37:41 -0400
Message-Id: <20250506053741.4837-5-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250506053741.4837-1-wenliang202407@163.com>
References: <20250506053741.4837-1-wenliang202407@163.com>
X-CM-TRANSID:_____wBHxSpEoBloZ2M1Ew--.50689S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF18Kr4fWF45uF4UWF43Awb_yoW8XF17p3
	9xCF1jqryFqF13u3y7t3Z5G34Uu3Wv9F48KF1DJr1a93WkZa4Fq39xKr18Kr17Cr1fZFWf
	uFn2grW8X340yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRVnmiUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiMAZF02gZnOxMHwAAsy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add the sq52206 compatible to the ina2xx.yaml

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

Add the meaning of 'shunt-gain' in SQ52206.

v6->v7: Change 'silergy,sy24655' to 'silergy,sq52206' so that
the make dt_binding_check' command can be successfully passed

v5->v6:add content to meet the update requirements of the ina2xx.yaml

 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index bc03781342c0..d1fb7b9abda0 100644
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
+              - silergy,sq52206
               - silergy,sy24655
               - ti,ina209
               - ti,ina219
-- 
2.17.1

