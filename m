Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F1C222594;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745004548; cv=none; b=umbSyZPZa9pjhMhr9LwvA3Zq4sgNL4sb3+mC4LR25hKGICHK+LVn/MGUKI+LUaLJJGqBXcGEsDoodeId1AolAniArfVubupOW5twaKK3BNUqPga+qlHinK5jo8kqLf1Xb2biHMaAmMBPGKx9TVy7tJs1YjWt8khrMf6EUs7FXmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745004548; c=relaxed/simple;
	bh=ZnZAZwfeohX4vsPn2M4XWG7XINcO5hBYR5CoxMYmo5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhNqA0RKy7LoZMIY5GK1Pcl2rLdqn9hBrQ5/snoLLQyODEH2+szJXnMFyNKl/STqIZJLJIHrI+Pzca6Rvgzk5fxyUpE2dMZTR2ZUzdOxnER0sE77jRxPHhVJt2COGDxsNNEc9k/ixtEKPk1AeGBhX7OuA2NazkWulqOITryEdsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ih1k5E6z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ih1k5E6z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 926DEC4CEED;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745004548;
	bh=ZnZAZwfeohX4vsPn2M4XWG7XINcO5hBYR5CoxMYmo5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ih1k5E6zp2leJG5YJG44SjF+l8nAQuQNuHVh7L+bQtJPApJa16OAN97KGqmC9R458
	 QSUQg3wfM9IweIE2fzHMjE3qEnfJQGj+SW+l8mP+KD70uJP9cAhKkRPsfpoVk4DWBa
	 KKVSmDhbhnTl/LY1wYqwBRNhl5BbfaZrCbr92OtGHlf0aEqSDkzIUZLMk6aVvIX5L8
	 DDnf5lvCyW/rRIu57qZFrp84DBUSGbVC2jufsIsJQSYKTWBwSJRiG2NdpxlhwEupQ3
	 7M4E7Id+zq/OzaHCrVTtUwxpS5vRvE4qzVKQ9jMGW+Q+BtP8KzXeUF/X3es2p9SIPE
	 AlfPpS0Yymauw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81962C369D1;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 21:28:52 +0200
Subject: [PATCH 2/4] powerpc: 83xx: Rename wdt@ nodes to watchdog@
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250418-watchdog-v1-2-987ff2046272@posteo.net>
References: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
In-Reply-To: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745004545; l=6414;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Yw+PaYsdSJcOkNk7dfmQFHMcmT5+YjBUrfIw+nshi9Y=;
 b=NxbUQG3EdBM7Z3W+Ww69xe2/rI7AysK8WNTRo6T8XV/4FfzOJ0S5Mm5IMFGrfdxV82CUgpCvn
 7umJsOM9UAZDDOfxreMe8mU26tAsEU0+EYt6yeVYRMlZ9Y1N/a8TnzJ
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The watchdog.yaml schema prescribes a node name of "timer" or "watchdog"
rather than the abbreviation "wdt".

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/asp834x-redboot.dts | 2 +-
 arch/powerpc/boot/dts/mpc8313erdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8315erdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc832x_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8349emitx.dts    | 2 +-
 arch/powerpc/boot/dts/mpc8349emitxgp.dts  | 2 +-
 arch/powerpc/boot/dts/mpc836x_rdk.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8377_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8377_wlan.dts    | 2 +-
 arch/powerpc/boot/dts/mpc8378_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8379_rdb.dts     | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/boot/dts/asp834x-redboot.dts b/arch/powerpc/boot/dts/asp834x-redboot.dts
index 52a84561c4f076ac0c4fc7af3db12f2fda06521c..33ddb17d18760df24ac8f068dce38ac60c353f32 100644
--- a/arch/powerpc/boot/dts/asp834x-redboot.dts
+++ b/arch/powerpc/boot/dts/asp834x-redboot.dts
@@ -72,7 +72,7 @@ soc8349@ff000000 {
 		reg = <0xff000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8313erdb.dts b/arch/powerpc/boot/dts/mpc8313erdb.dts
index a8315795b2c951c5914953be0b4a5162dd471505..09508b4c8c73095bf4699e383e7841100d6d7c8f 100644
--- a/arch/powerpc/boot/dts/mpc8313erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8313erdb.dts
@@ -99,7 +99,7 @@ soc8313@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index e09b37d7489d01bfd16a26e9786868f630fa0262..56cf6d12c730de52d85623dc34c5987bee635f0f 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -99,7 +99,7 @@ immr@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc832x_rdb.dts b/arch/powerpc/boot/dts/mpc832x_rdb.dts
index ecebc27a289871a896121fbaf6bc878422d25101..ba7caaf98fd58f9a2b56c0aa566673c70eff2013 100644
--- a/arch/powerpc/boot/dts/mpc832x_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc832x_rdb.dts
@@ -52,7 +52,7 @@ soc8323@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8349emitx.dts b/arch/powerpc/boot/dts/mpc8349emitx.dts
index d4ebbb93de0b325a3bb0f5d17464f516a0e12133..13f17232ba83d50498f19e6758063cf905fbc326 100644
--- a/arch/powerpc/boot/dts/mpc8349emitx.dts
+++ b/arch/powerpc/boot/dts/mpc8349emitx.dts
@@ -53,7 +53,7 @@ soc8349@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;                    // from bootloader
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8349emitxgp.dts b/arch/powerpc/boot/dts/mpc8349emitxgp.dts
index bcf68a0a7b557e49b48563f586b1fe8441ab3c6d..eae0afd5abbc39852b8e34b2247223168ab863ca 100644
--- a/arch/powerpc/boot/dts/mpc8349emitxgp.dts
+++ b/arch/powerpc/boot/dts/mpc8349emitxgp.dts
@@ -51,7 +51,7 @@ soc8349@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;                    // from bootloader
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc836x_rdk.dts b/arch/powerpc/boot/dts/mpc836x_rdk.dts
index a0cc1953484d70410f9592bdb84ffaf779ee08b4..4ff38e1a2185f85618b603e703e54c973cb97cc0 100644
--- a/arch/powerpc/boot/dts/mpc836x_rdk.dts
+++ b/arch/powerpc/boot/dts/mpc836x_rdk.dts
@@ -62,7 +62,7 @@ soc@e0000000 {
 		/* filled by u-boot */
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
 		};
diff --git a/arch/powerpc/boot/dts/mpc8377_rdb.dts b/arch/powerpc/boot/dts/mpc8377_rdb.dts
index 7df452efa9579a649195d2266d42bbc4b6b8de1c..f137ccb8cfdedfed98a3cf6899f5508f069834dc 100644
--- a/arch/powerpc/boot/dts/mpc8377_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8377_rdb.dts
@@ -99,7 +99,7 @@ immr@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8377_wlan.dts b/arch/powerpc/boot/dts/mpc8377_wlan.dts
index d8e7d40aeae449e33ea1640a53ee4dfec7d746a4..ce254dd74dd06b19bc8e15e13f2fa9e959dd25f2 100644
--- a/arch/powerpc/boot/dts/mpc8377_wlan.dts
+++ b/arch/powerpc/boot/dts/mpc8377_wlan.dts
@@ -89,7 +89,7 @@ immr@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8378_rdb.dts b/arch/powerpc/boot/dts/mpc8378_rdb.dts
index bdcfe83a561e121ed82972406e0302d84d8d0ef6..19e5473d4161b5d6be6ab84ae0ba78875fc377f8 100644
--- a/arch/powerpc/boot/dts/mpc8378_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8378_rdb.dts
@@ -99,7 +99,7 @@ immr@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8379_rdb.dts b/arch/powerpc/boot/dts/mpc8379_rdb.dts
index a5f702304a353c61d6ab804765b817ec34a9582e..61519acca2280427d7237d8d9bbb8485f0c65369 100644
--- a/arch/powerpc/boot/dts/mpc8379_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8379_rdb.dts
@@ -97,7 +97,7 @@ immr@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;

-- 
2.48.0.rc1.219.gb6b6757d772


