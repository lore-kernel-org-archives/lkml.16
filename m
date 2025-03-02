Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80BE1EB1AC
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898740; cv=none; b=WYtSVjpFsHrfQVkWTX3knglZ09ce9jweyexzo772rNgClB6162tjuqvk80NAZX33Ltu+cy6clk8rBhRyQT2Pku5YSOTHl1gEBduLH4Fy1UEaCagLM+8BWsq/stm5JpZczgWX4DYaui5MlLCh/sjObJv9gase3hTTenJj1jV+WSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898740; c=relaxed/simple;
	bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=gWgCsb5A+HpbjPKbyFWTFzOrsNiu0nE3vgrW+nD7pGxed3q9m1c346yQ1KSji4KeNbSRTlAaO0/qS8XA11j6MsgSMoalnIWaRg0Yb48tiNFVNzlyMR9scECPt5i9hhmXWwPRoVEZCn8vbtQ6z5DKqrw5qfaAJpUxQPiKaM2wKsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Vq6+2z9C; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Vq6+2z9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=; b=Vq6+2z9
	CVVHe6oxlbL38Ng7xrXtFJ2ZPRr1sZ3ZbaXxTjoWDdZZ6uZVDhHsJskH7xfedkNB
	PgLEGszgpPEVR/Vn1rZRJQgeNeSbcxEJI5JXKNdO/5l6mS2JAe94gfWiL79tTbDF
	h5CyCQ/y7FY5BuUSJ0r9jGUPkblz/dJ670iE=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3V1wh_sNn3PaxBg--.18184S2;
	Sun, 02 Mar 2025 14:43:45 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than C++
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3V1wh_sNn3PaxBg--.18184S2
Message-Id:<67C3FE21.071816.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUD9XoDUUUU
Date: Sun, 2 Mar 2025 14:58:55 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOhQEumfD7Anx4AABsB

Hello! Rust is better than C++

