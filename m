Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3921626A09F;
	Tue,  1 Jul 2025 12:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371632; cv=none; b=HVqjaj4iFNCi+mVJ2+HtO5trgyfhYWXe95mUSB8XL8LNBrmo91vU8NrvBlLzmmLyHUhba8G9JNVQTvirbf3awyrc4BJIrfJVB52Nf4yEjZaSLNcP/qKlxa1GFnQt3/j6OJKUwuh6liABLGc2Wlr+YEOPH/cj/wVshMUMSz5ZqKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371632; c=relaxed/simple;
	bh=7wkwOin07890ZbxLrRieTI3uNp6G9UwDzxti8zfSBxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbepEddAxXspYcfR2yynb/3JaeYh7zAIPAvnDsNJMGGtxjL8Od4l4UYKpZA6yQayr9dulX4EX6ozqQhzGsZ3TFZQCzSXcSFPd+PDPYPUqFvODzFkLvBtNuyr5eSdvHfYNHB0xRKO61kxY4ykEjYLiCaGi3fxdIKhAHe359x5vaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYJdMCC9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYJdMCC9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9EF9C4CEEB;
	Tue,  1 Jul 2025 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751371631;
	bh=7wkwOin07890ZbxLrRieTI3uNp6G9UwDzxti8zfSBxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PYJdMCC9vxJDqqQdJbV/ma3ZMnUcfi1nEgmOaSke0FddQNvQSXrrzA6VAhyeZY9Bj
	 nXp6zRC+aI10ZUrYE7iAUJ63lGz2hP2P/oYsrjzc7o1EzgJHGofamCpEIzvA5QtvFe
	 7tA+jBphFtRzkuKYOfu05jd6f1Y2EVDkUlUxnMBXnXY0Sn2sZhn+BlyifPy1XxDNSO
	 GKJTeU5v6EcRveIUnY2Qoi4rQXDZwgf2W0ji+hcjIVQiUP8tTXOejuxWVMSENsNYJb
	 GMBFxBzxNKdBVeV6fc4fiU5e+dtcI7Fc7UmS9+BOo0YraTXY3mA/Ls0vT6grFCJcKc
	 2UQuWcIVNRIOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8705C7EE30;
	Tue,  1 Jul 2025 12:07:11 +0000 (UTC)
From: Jack Cheng via B4 Relay <devnull+Cheng.JackHY.inventec.com@kernel.org>
Date: Tue, 01 Jul 2025 12:03:45 +0000
Subject: [PATCH 1/2] dt-bindings: trivial: Add q50sn12072 and q54sj108a1
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-1-c387baf928cb@inventec.com>
References: <20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-0-c387baf928cb@inventec.com>
In-Reply-To: <20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-0-c387baf928cb@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751371491; l=1103;
 i=Cheng.JackHY@inventec.com; s=20250701; h=from:subject:message-id;
 bh=iMAIxaFU1vJJldUQGTtol5eSWpPkR5/YqPptwSKn8kY=;
 b=+nLfOUtuC/vAC7V1DydaU6IRZa01xhp3nYid+nup9vz3j5XIxoeil/eamWmynC+WKvwxfX4g/
 3hTCxrTpXX4B7/LhG3NlV/7uDxCjM7MMXn26cUhKGhf/+/E9n6yMtlL
X-Developer-Key: i=Cheng.JackHY@inventec.com; a=ed25519;
 pk=L+GNI15NJXj7JAu9YqFXp9hL3rwZWbBbjlEeDjPvm68=
X-Endpoint-Received: by B4 Relay for Cheng.JackHY@inventec.com/20250701
 with auth_id=449
X-Original-From: Jack Cheng <Cheng.JackHY@inventec.com>
Reply-To: Cheng.JackHY@inventec.com

From: Jack Cheng <cheng.jackhy@inventec.com>

Add support for the Delta Electronics q50sn12072 and q54sj108a1
1/4 Brick DC/DC Regulated Power Modules.

Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 27930708ccd5..dfcdf0c4aca3 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -78,7 +78,11 @@ properties:
             # Delta Electronics DPS920AB 920W 54V Power Supply
           - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
+          - delta,q50sn12072
+            # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
+            # 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sn120a1
             # Devantech SRF02 ultrasonic ranger in I2C mode
           - devantech,srf02
             # Devantech SRF08 ultrasonic ranger

-- 
2.43.0


