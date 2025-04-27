Received: from out28-114.mail.aliyun.com (out28-114.mail.aliyun.com [115.124.28.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907338BE7;
	Sun, 27 Apr 2025 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745738503; cv=none; b=iTATmkxDDYALRJTXc/TjrT7PeiZq99nWLRyNgjgm5lpaV5aMkkhm/VeuVAx/wO+B1krWkfLOMG1b6k8QGw85VuFj0MVfsB3OOQlv5m1Pd91BfkkWCjYThZemkk3epTXz0vbRGJgi1WCS2Nx4OAdUcWotmbFr5scdL7zpFF2eZ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745738503; c=relaxed/simple;
	bh=U1GZt0j74cjZz+4xaSGSJUjZ7iEQo5EUR7q2Tuw3IYI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iS2BV7KzRz1vOr3BYNnPuvxNSnTRvYpRv1nDvHhGa9aRKSJxRxPCc4ifLluIJC+GT9/AGeXGX9rUzci5pK4M/gw+CFCb4S5YL0MI23obow+cIHdJWBAZ40li+dY6qRh1GgdWv4SzunJgZHMfmw7gUVqU5rHPby6XpKluLDEpFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn; spf=pass smtp.mailfrom=coolkit.cn; dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b=cXTtIgb7; arc=none smtp.client-ip=115.124.28.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b="cXTtIgb7"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=coolkit.cn; s=default;
	t=1745738495; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=U1GZt0j74cjZz+4xaSGSJUjZ7iEQo5EUR7q2Tuw3IYI=;
	b=cXTtIgb7fLAAUsLoDWs8UTaNo4DjxwCU7wFBmnLN3Ztox2U4wiTDk14oY8/2dvAhhakAsz1cQZ0zn1xeB1lOdEvgx3eh5wi996BAi1jKZwZZK/HpdS/zAdEjPNBrOlFq4Lj4WhUBu9wJQOTWk/a1v7jqjxMQ1hzml+ofc7jbsN0=
Received: from ubuntu-z.lan(mailfrom:hao.zhang@coolkit.cn fp:SMTPD_---.cY70L4K_1745736637 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sun, 27 Apr 2025 14:50:38 +0800
From: Hao Zhang <hao.zhang@coolkit.cn>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: ARM: dts: rockchip: Wifi improvements for Sonoff iHost
Date: Sun, 27 Apr 2025 14:50:12 +0800
Message-Id: <20250427065013.99871-1-hao.zhang@coolkit.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello maintainers,

This is my first patch submission for the Rockchip DTS files.
The patch improves WiFi stability for Sonoff iHost.

Please let me know if any modifications are needed.

Best regards,
Hao Zhang

