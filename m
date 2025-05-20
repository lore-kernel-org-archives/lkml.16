Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941B28002C;
	Tue, 20 May 2025 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747767047; cv=pass; b=Y6DiXL/cL2/T7wh7U8U7TQGNC5dWMdKRo6bEjzaKHLUxiy+1MXOlJXpvPwfCFAIkdnU5F7hFXkquTzqYwsvR93MaG5CDNaRMg0xO47nQzAWDJkx916UBS+IvJRFEZcWUHF3U+9sMw0Sk3AA4GN5sH5UpYjD3EtabdZLo5FH/0PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747767047; c=relaxed/simple;
	bh=PZMiV+U1W1yKKtbfPXOJLgQjheAw3g1sRcSkEFqK2qY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnnkGOZqQdH059LaQVeKUUrjOdkIYR5FWFwJuGeQw8p0M02a7Y03TVe/3MVfe3cjbRz+LwV5ufpsJfYOmyuZ7gKJZD7xu02Z7rP1N4hfwxvArlQ36Tx+SJ1CxPr+OikpG/u2D65McvbMMPNNgtWsTa18bWbYbnvrfIupvb2wmkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=AO49ZgSH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="AO49ZgSH"
ARC-Seal: i=1; a=rsa-sha256; t=1747767032; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VyKadxrfXi/ubHzTvkn+of7PjALh1aKqGB2wzwENbgCo1EeIE5NBx6nvaBnuGjlcn9hMNRVPy32p1tSboynxeRU4TmhdTD78a86pBmCnaeNtYMB2xM1FmatBtY3wL/yVs0Vf/g+MDH6yecpyxqYCEMQ4TdDT+sDA8DGd0wFCpCY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747767032; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X1cTOGezMVy8e36fHXgJjqmofKfSDXaKR85GQ8Az0i8=; 
	b=W0ANAhkL0IflDX7V1mYOYNorxZ/VgJjM40BCSP+kmdAt1EsBu8BqPeTQIUHych/iHTWp2EKM4/XPI2ldFaHf/Olru8xZaFa954sieFw2mDmRzMZXTLy/siYEQK5lJPovYopg9BCS02VCtdZNE9A83crkyfRUH8oIp5oAvc73FcU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747767032;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=X1cTOGezMVy8e36fHXgJjqmofKfSDXaKR85GQ8Az0i8=;
	b=AO49ZgSHRmwPKFXhg5NxaXVorNl1MklH4wjJSL4/TFcRAKw1wC2IbTqT/fUowT7G
	2THV9NWbUD4oJlIQQi0GRs8NIEt89KIYwul+QYyZpedpkjIzQnzeLy4hLUFFxEKxqM0
	qQgeJtrPCp0VLoxUdbwddIsvfNEy9ToF65OVGLfQ=
Received: by mx.zohomail.com with SMTPS id 1747767031901555.249516539212;
	Tue, 20 May 2025 11:50:31 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 20 May 2025 20:50:09 +0200
Subject: [PATCH v2 2/4] arm64: dts: rockchip: rename rk3588-rock-5b.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-add-rock5t-v2-2-1f1971850a20@collabora.com>
References: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
In-Reply-To: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

As subsequent patches will add ROCK 5T support, rename the .dtsi file to
reflect that it's shared between ROCK 5B, ROCK 5B+ and ROCK 5T.

This is done separately from moving the 5B and 5B+ only nodes to a
common tree so that the history stays bisectable and the diff easily
reviewable.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../dts/rockchip/{rk3588-rock-5b.dtsi => rk3588-rock-5b-5bp-5t.dtsi}    | 0
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts                    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts                         | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
rename to arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
index 74c7b6502e4dda4b774f43c704ebaee350703c0d..22c0745eae4eeafdbe4ac5654dd1def15a0cad74 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "rk3588-rock-5b.dtsi"
+#include "rk3588-rock-5b-5bp-5t.dtsi"
 
 / {
 	model = "Radxa ROCK 5B+";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index 9407a7c9910ada1f6c803d2e15785a9cbd9bd655..206198c22aa6c388c5321a4503fb0ae7bf376af8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "rk3588-rock-5b.dtsi"
+#include "rk3588-rock-5b-5bp-5t.dtsi"
 
 / {
 	model = "Radxa ROCK 5B";

-- 
2.49.0

