Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32624231850;
	Fri, 23 May 2025 14:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748009410; cv=none; b=Ud6T1hBc4JLvVeZIZWMW1wo7531X49X3olF0IzIcDZz0E+R2AAu2C9l9zzr04IuxTwnSDdloTstHBWin29H4hicUz5BfVP1rKBYCvBbdIKNW/k/MIxcyzNfs1WIByHU313TspeDtLqzowK6E+qqTU+Xhzui1ihMllTYjbfFK4FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748009410; c=relaxed/simple;
	bh=MeiVl2gTxYr8oTKmRvrmJYk1wQP+ajVGU9qZFBGygSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=tOcz1I4G0phnRFD31VUAp4zpHJU+79UrjYIeBoc2HozdXYslGUvTkqsxqNpCVCAnR7ArM7xfB2ZTAVkEkDyEeWRGE+6YpR6JIn7McREMZlbbH64yaamLoUArJlS28kHhelGCnF6tjdICl9N/jE26DlfNFWzs8F37f8h8KhAJYnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=0+ycL8O5; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="0+ycL8O5"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N9ruTV011507;
	Fri, 23 May 2025 16:09:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=ZzEoNsmIlQ0YGTHR1JsAjo
	rfZVm9CGqWBwlMW+xUb6w=; b=0+ycL8O5hIzl4gb17UMKi2TQuiWWp1F1Z17JjO
	ORZKXnhuT/2j/Q3ifDPEgeW4jgmSAex5JjnBmg0eoxxdVkD73cJcZ0nG4c0edEuO
	DAftPTpT8bBmZ8KCgLnpE8/q9Dr1m7J7Je3DlXMLoQzgqqggg108aUIx04de2mIx
	9HtDfUj6D1LtdZzev2IMZ0MasL32qIVABOK64rjIShuqQJKxutl7fw/MbcIqRlsz
	EXcZx/QQgrBu+Lu/6xX/L4JkCqv9Mg+NygYr+s10s4pmYxhDD9JDml8kqMb/02Or
	QBLLTWIpfLMNzWXgql6YcmNsmXG5f12Tzr3cghRs7qdeExjg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf4ekmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 16:09:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 196D440048;
	Fri, 23 May 2025 16:09:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0ECBAA87B40;
	Fri, 23 May 2025 16:08:33 +0200 (CEST)
Received: from localhost (10.252.5.226) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 16:08:32 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 May 2025 16:08:10 +0200
Subject: [PATCH v3] dt-bindings: access-controllers: add controller
 configuration property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250523-access-controllers-conf-v3-1-4382e69819cf@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAEmBMGgC/x2MMQqAMAwAvyKZLdSWDPoVcdCaaqC0kogI4t8tb
 nfD3QNKwqQwNA8IXaxcchXfNhD2OW9keK0Ozjq06LyZQyBVE0o+paRE8nM0MWKH2C09+gVqfQh
 Fvv/zOL3vB+x4uTdpAAAA
X-Change-ID: 20250523-access-controllers-conf-ff51551b953b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Oleksii Moisieiev
	<oleksii_moisieiev@epam.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alvinga@andestech.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3717;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=MeiVl2gTxYr8oTKmRvrmJYk1wQP+ajVGU9qZFBGygSE=;
 b=owEB7QES/pANAwAKAar3Rq6G8cMoAcsmYgBoMIFfcdATk3QfY60fASajKMloiuwUpJ38+m38O
 /6OAfLVKSaJAbMEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaDCBXwAKCRCq90auhvHD
 KN7SC/9YeslukldLV7ytaCWRumMPcaRqZ80GxvlcYwqaJ5LbLuWfy5j8vs3hJQpgTECsc/295MN
 BdOb73BdArmueJgLzjImdIJQVk+NaLSF64LfIPDlrUvs9YM4H2aRuyykNDsFf4bTx1OO83Kpngs
 r58Wx5Eat0vDa+uv4771ARN8NeZHpqDPCqjvh1ilkI4jt6SnT4irOSrxwY5wgZ70PruXOwD+1wk
 htGffTLuBxImrKtktktVl+PTv+s/4sVQ0ITQmd86EwYw8ze39YBoWF7yi6MxnB7BSsqqsS+2x+v
 ybzzo6kaopfR1VueFCX05o65JXdJt28wkMUTMOUlEv5SYNbfMlrbIrKZvx4teOe4zNVOlj49uWI
 HglxcFcB2OrEb6pl+gwaMm0I9AVcDsW9Gi3zq7h3GN14F6D/lTvGsK3EJNW5iNM9/kCanwLwqYN
 66NXEkBclJVvcxTz9rZKKCnkDT6J51hqCjw4zYSKKK1roTq+MBibqc9CA7iL9XcG1fFT0=
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01

Add a pattern property to allow a device to request an alternate
access rights configuration to one or more access controllers.
It allows run-time controller reconfiguration of access rights
to an authorized entity as used in OP-TEE OS [1].

Link: https://github.com/OP-TEE/optee_os/pull/6946 [1]
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
v2->v3:
	-Precise that it the pattern property targets an access
	 rights configuration update
---
 .../access-controllers/access-controllers.yaml     | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml b/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
index 99e2865f0e46a0600ebbba3bc5771dc63d578c8b..fe9d28d418cdef14a8ffa988ff6edc7a169b5361 100644
--- a/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
+++ b/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
@@ -45,6 +45,12 @@ properties:
       Can be any value as specified by device tree binding documentation
       of a particular provider. The node is an access controller.
 
+  "#access-conf-cells":
+    description:
+      Number of cells in an *(?<=)-access-conf$ specifier;
+      Can be any value as specified by device tree binding documentation
+      of a particular provider. The node is an access controller.
+
   access-controller-names:
     $ref: /schemas/types.yaml#/definitions/string-array
     description:
@@ -58,6 +64,16 @@ properties:
       A list of access controller specifiers, as defined by the
       bindings of the access-controllers provider.
 
+patternProperties:
+  ".*(?<=)-access-conf$":
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      An access controller configuration contains a list of inseparable entries.
+      A configuration may reference multiple access controllers. Therefore, each
+      entry content may vary accordingly to the access controller
+      "#access-conf-cells" value. A consumer will use this property to be able
+      to dynamically query for an access rights configuration update.
+
 additionalProperties: true
 
 examples:
@@ -65,6 +81,7 @@ examples:
     clock_controller: access-controllers@50000 {
         reg = <0x50000 0x400>;
         #access-controller-cells = <2>;
+        #access-conf-cells = <2>;
     };
 
     bus_controller: bus@60000 {
@@ -73,6 +90,7 @@ examples:
         #size-cells = <1>;
         ranges;
         #access-controller-cells = <3>;
+        #access-conf-cells = <2>;
 
         uart4: serial@60100 {
             reg = <0x60100 0x400>;
@@ -81,4 +99,17 @@ examples:
                                  <&bus_controller 1 3 5>;
             access-controller-names = "clock", "bus";
         };
+
+        uart5: serial@60200 {
+          reg = <0x60200 0x400>;
+          clocks = <&clk_serial2>;
+          access-controllers = <&bus_controller 0 0 0>, <&bus_controller 1 0 0>,
+                               <&clock_controller 2 3>;
+          default-access-conf = <&bus_controller 0 10>,
+                                <&bus_controller 1 10>,
+                                <&clock_controller 0 0>;
+          shared-access-conf = <&bus_controller 0 256>,
+                               <&bus_controller 1 256>,
+                               <&clock_controller 0 256>;
+        };
     };

---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250523-access-controllers-conf-ff51551b953b

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>

