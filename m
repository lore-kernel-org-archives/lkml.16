Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A36022D4E5;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745004549; cv=none; b=ELWxvjxgr+64tg5sPDbK9DAgzhmOGyaBaSDjI1/5UPq3HMH4fj17Wpe21LL1cCLqL4rqA3dpAVG0shZonuyYXOsP4dxBxVX1TY4tg2WhQCNpElG1sGc7XgvdrBc55C0UJa5nGcVhacVyP1KxHO57IL4Uo4dYvrNiSb4XXN5WSVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745004549; c=relaxed/simple;
	bh=HKi4/pkN8/8Z6aYIPs2g1TUo9vd+kfLsVo0FqhGriIg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O5fL2CTAj9cIeCtbrCsuhcCwNd5PtqrF68QIzLM69A4wza5qQD1VGK5HWlVj9Wy7JOjjLvGDYPumiJNavsr+Mab8YJelcEMacH6ZwT3Xa/E52SyxPB+RQaVP2KDhG5Cs9LIFqMWdIox/2Oyv2AXpOze5vXIpJkS5hN1N+Foz0Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9VN5oZm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9VN5oZm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 767C0C4CEE2;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745004548;
	bh=HKi4/pkN8/8Z6aYIPs2g1TUo9vd+kfLsVo0FqhGriIg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=p9VN5oZmCcrvD+gNpQJxfGDDYGI6k7h02QBJ3JCYzqftx5tzVGVhWEpT/kpvWOFNX
	 +fzx7aZnQk8yFUTAjI4xKQEgpOMTqFmYJ4sIzuX3rET8a8LEtdPiJjqI5UmfcuSemu
	 VMhO7FWfsjPE5P+zekBdg81Uu14o25pHJy6EFbthrWxCZ+JgEILw6qgcMsGQMXJuDS
	 NDPVUlJNH5pXzpFG6gLPYw0OwyWVnrvKJ9RwC9chuYGsmVVA5sxerCZS4HAaRyMaTT
	 szCt55SCfrUXVeofoDw5rgHGu0GHS6r9f+K7q2evqT6ep+YNg1wYiMBuIW/EF2cwZv
	 1huyIH0NC9b9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F47C369AB;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 0/4] powerpc: Rename wdt@ notes to watchdog@
Date: Fri, 18 Apr 2025 21:28:50 +0200
Message-Id: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPKnAmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ML3fLEkuSMlPx03ZRkY1MDw6Q0S8OUFCWg8oKi1LTMCrBR0bG1tQA
 7nU6yWgAAAA==
X-Change-ID: 20250418-watchdog-dc3501bf91dd
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745004545; l=1502;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=HKi4/pkN8/8Z6aYIPs2g1TUo9vd+kfLsVo0FqhGriIg=;
 b=NDbbrgw8AjbiooyxPiw4H0nG7A6qJKUbMqvcm1w/C9ntxHUrx41SqIjUsaFelMOBtmYb/HuVY
 W8vmyo8ZfS8B6VwXTkaz7HltxUvh2B3spCh1SMMkvA7YJrbwKDqRg8u
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

The watchdog.yaml schema prescribes a node name of "timer" or "watchdog"
rather than the abbreviation "wdt". This series fixes the node name
across arch/powerpc/boot/dts.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
J. Neuschäfer (4):
      powerpc: 512x: Rename wdt@ node to watchdog@
      powerpc: 83xx: Rename wdt@ nodes to watchdog@
      powerpc: 86xx: Rename wdt@ nodes to watchdog@
      powerpc: p2020: Rename wdt@ nodes to watchdog@

 arch/powerpc/boot/dts/asp834x-redboot.dts | 2 +-
 arch/powerpc/boot/dts/fsl/ge_imp3a.dts    | 4 ++--
 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts   | 4 ++--
 arch/powerpc/boot/dts/fsl/gef_sbc310.dts  | 4 ++--
 arch/powerpc/boot/dts/fsl/gef_sbc610.dts  | 4 ++--
 arch/powerpc/boot/dts/mpc5121.dtsi        | 2 +-
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
 16 files changed, 20 insertions(+), 20 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-watchdog-dc3501bf91dd

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>


