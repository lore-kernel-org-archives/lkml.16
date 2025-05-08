Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB028640E;
	Thu,  8 May 2025 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726557; cv=none; b=SSSlq2sh21FBQFPxb3vhaRS0v59UWTQJbR+eIeJQv/W3LQb3seli7T1diZF8zVuebOSTGtvxkCWp15E6j3IgItH9mYmQ1DlX9TaUuSQ17+onxKtZjpLRu3K3pNZxA8EGUr+0ouBnfT9FcBA8bqb13TDD32llLyk6iGNROAbcswM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726557; c=relaxed/simple;
	bh=NcPJopNj4QkFL7RS7LVqktzn6/GCRQbuGX0pRkX8TIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SjZFi1SRs51j/+4aR+yoP4ZRN/4kpIslV7cnW5oXeqRmc1fKtjvpmIylxLFZhREQ/daoF4Y2aI9GpjdVOiP1maM3iYW+Baw6Bqj4uw+g1Go7lHB52Z9m4mJoQnPSHh3AK+FE1wwOpe8GoeQg0nSDcRAP4SGYHr8aS/U0AcSgQMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XTuAt1Sg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XTuAt1Sg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746726547;
	bh=NcPJopNj4QkFL7RS7LVqktzn6/GCRQbuGX0pRkX8TIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XTuAt1SgdJEza/9SbifnqLSJSgjB972/wjCBQ4zB3U7U6nospO3+6eIcYL+rtNfjE
	 sxb3lfhHTGD3oGVRFz79G6Nnb84SAPtqpnRnUd9GQmE8mXINfUkx1idUAysy9c5MQM
	 zoGf09oSbA94/cdhAJymXsALo+SPNw6ewMMYDquq4VBAG8Zsv88Ejj/21PlLvUo1Pm
	 zIYvpsafdbcHvmv+AvWryvuYpcNKbQzdhMcrV1u7/WG3kxj2JnYkfJgTa55lOuXO5X
	 m/p274Pdc+GayWx9HrLuWhoRSBH+pgQCIIWoENfxJocIBvxysx7rUJyzuc6N66EFIz
	 ENXzUZgprlMmw==
Received: from jupiter.universe (dyndsl-091-248-213-080.ewe-ip-backbone.de [91.248.213.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C808C17E07E6;
	Thu,  8 May 2025 19:49:07 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7069E480033; Thu, 08 May 2025 19:49:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 08 May 2025 19:48:50 +0200
Subject: [PATCH v2 1/5] arm64: dts: rockchip: move rock 5b to include file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-rock5bp-for-upstream-v2-1-677033cc1ac2@kernel.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
In-Reply-To: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=sre@kernel.org;
 h=from:subject:message-id; bh=NcPJopNj4QkFL7RS7LVqktzn6/GCRQbuGX0pRkX8TIA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGgc7pO+niDJzvLdND9x09wwRxmWRhstVzAud
 5dt2ER8DWsTUYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoHO6TAAoJENju1/PI
 O/qabLYP/1D279busEQJkEEWFCEGNrbv01oemTLzeZyBXScZgGgvwi7BO4SfPVoOd1CifrkQF5o
 DCYZLZvmeQP8HgLat/TqO7nlLi4jsIrq2ZWKwfMTUcOd+ENyDgblj0hMusHe6z2rIUaZKIo9DW4
 /42RooyfPkzZyclnkZvDSLqXgkAsxff5GslPfx3okLTn2ipP+JYmofhhhmb5+JHKeYI0JJ95IRn
 2GbwLltBcd4ztiqaNdtA9dt2OykAF9+sve2903Rw2GIukeT18KbjquCoB+MhFEeTDYXAABQZXD1
 I9G35Ehu1fhyfuB0mYfH0MUgUht+2jcj3Ma0f9G8gxZ9onsOlOBo0mtXL2FKj581mvylvFRML5/
 ePF2qlM8AH3bDu//gW5Ty/BCuj+PegTQ/dxFvC2rDSeHXvtNWTpfiKYKdyleLvyWQBHl4jHkRpa
 niU7iIkP+vF2UNfzA9yj21u+BPRDodLJxawG6daTEXuUfZzbMOyMAzLQz3EmiP3qdoKVGoFVrS2
 DHOb6WtCIKKCzCT9Fl+FP3L3u/U4SrZ0CEJeQa7/qupMx4k69DEp7+mkporOAJz7ESRV41vGxJo
 upJFs5awz+Rux9s4PF2y2jj099DJmJFBd3uV9gTCNxweK+dakgiATKHRBJ44IvYVE+JhQw2ADsa
 DgQ1NasBMWT8GcjUiUSotWA==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Radxa released some more boards, which are based on the original
Rock 5B. Move its board description into an include file to avoid
unnecessary duplication.

NOTE: this should be merged with the following commit to ensure
bisectability. The rename happens in a separete commit during
development because git does not properly detect the rename when
the original filename is reused in the same commit. This means

1. it's a lot harder to review the changes
2. it's a lot harder to rebase the patch series

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/{rk3588-rock-5b.dts => rk3588-rock-5b.dtsi} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
rename to arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi

-- 
2.47.2

