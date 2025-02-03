Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEB7211461;
	Mon,  3 Feb 2025 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618247; cv=none; b=Wk8rej14fVeffTkjluKodD5Ky+6SFKqJ/YY7qvkJiOdXubQvhncVvRgS73PK0jMn3CSddwzFtMUoYHrvSzspdf0TrE5NgZztuq0JWzSmDuIFaiZFbsPNkfINP5wE04Ls+eQfpE8s4IDaDivLoU6/ZU0DS80Uppl/Htt/Z7TrtTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618247; c=relaxed/simple;
	bh=w/B2PvR+rOYxS9BmE/d4TKVImkrqlQOtKXqLwF4auMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TU+/uYSZ0AqbaOmCuT8I3PVNuaP9XdxycgauiiDM/iGZd1u2Hj/rapRx5XFR40dgw2QOg9wnItj7BKTdEAuahY742lP3neR+reGUmqzrLJ/hxlkv60fuGRbaiW120/Fne19a4vYQOMqEDQUVrvJL+Ma/cfdedRbrkgZyZQzJ5yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+Nw3wLH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+Nw3wLH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A9CC4CED2;
	Mon,  3 Feb 2025 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618247;
	bh=w/B2PvR+rOYxS9BmE/d4TKVImkrqlQOtKXqLwF4auMk=;
	h=From:To:Cc:Subject:Date:From;
	b=B+Nw3wLH4wcKtwW9y2gBt16zd3vDkmxLaqkk5Sz9rEhwOqqOC2oSFyzjjnsiF1znM
	 UwpAtxL0jCIKY3CSVgd/IyRrD4CX6douZyyuWUHdneVm8ru5SPAk0vvopmdG/VrNBb
	 UrT8xs2V6vEz2i0A8ZKqa3vWVPEKCSQq9cibY91jynn1mZtu5z3eQlZ0cvK8KoU8OE
	 dFINc9H4O4d+VVDofJUl6QZuM47ia+aEnfWBi2wVHHrh9eDPRRoiIbsvCoLkvg4yzm
	 0wMRFyLi7ChParoDW9YeUbQqkmjhDSeSlCsi8VcqAG1SB3XYnoir3gWzkFiZYf01kC
	 9/ys9u12xY5/A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: arasan,nand-controller: Ensure all properties are defined
Date: Mon,  3 Feb 2025 15:30:41 -0600
Message-ID: <20250203213042.12657-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device specific schemas should not allow undefined properties which is
what 'unevaluatedProperties: true' allows. Fix this constraint.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mtd/arasan,nand-controller.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
index 15b63bbb82a2..b90d3b48c2f2 100644
--- a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
@@ -42,7 +42,7 @@ required:
   - clock-names
   - interrupts
 
-unevaluatedProperties: true
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.47.2

