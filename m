Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E19F256D;
	Sat, 26 Apr 2025 17:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745689935; cv=none; b=NxPNzAT0mlpsUie5k2QeFD5R7UA57EZy8Xu2T1UsMi5Y7xBRsWKrtmGNwfeZuaS7l6wsYg0XlZ6aaMAlSYbVTEgeeJgePoGiqZMKqlCEGwMGZ5CQemjwncApWxZQiPkh/DPHt5/xUu2hJkIJCytrp0FJoykf454PhlvQCmI6er8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745689935; c=relaxed/simple;
	bh=ULgUy+84PdzlNouu/b4o6VwFQvCCPNF3QEE3tQ80ndA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P2Bw9M+xVX65YXBTPntgrGkQVfGO66CAUN8DThCvlaxk2+v2krGWzLPZ3gm6BgBFzEQUsh8QuG6c7C6ZwUXTEf+nfSzisRH4mqiCCnEaBlV6/QZ/vsqoPFvU4zw+r7SEjHMiESDW7rXplk5AOb6gWakSIU8XMVGpu6AL12fDGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Rtn7JkuT; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Rtn7JkuT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=CJwfMPxGBkT4SWbHDauU10bOvAieP5paykHbzoQYZE0=; b=Rtn7JkuTNQXYNsCk
	uOUTDVrOGYhZY3gJ7UJfrEN1wCAs2O42N3gjTb3JBkFKlr5dlUpbHuX+kMFhHkiJSzzsCHkUIgAEa
	JWK9yVF76TDLPKsB45u845J5HC2QsfnfZjNGH4HkgA07Xcnd9SFKV8tO53gP7k3F9j5BJH0YxxLwk
	tdTrvknwK+woZZ4lJjo7DGOvCTjjTI+vNUOrQcp2KK+aPgqGOyF65Zd3mUwEe3dwg9QjVs8RnZ4Gw
	pNz5HX7Oc6MvTXwL2a8tvbD+G0k2hZpxQnoS0+XanCd3TZa3AXNAJiXlsckGHuaaU4ToikhJ06o31
	Npq1MtRSOCGnBRhF0w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u8jh7-00E44n-12;
	Sat, 26 Apr 2025 17:52:05 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/5] Regulator deadcode cleanups
Date: Sat, 26 Apr 2025 18:51:38 +0100
Message-ID: <20250426175143.128086-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  This is a bunch of deadcode cleanups for functions
that are unused (for quite some time).
  The first patch was originally sent in October last
year but didn't get any traction; the rest are new.

Dave
Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (5):
  regulator: devres: Remove unused
    devm_regulator_bulk_register_supply_alias
  regulator: core: Remove unused regulator_bulk_force_disable
  regulator: core: Remove unused regulator_*drvdata functions
  regulator: core: Remove unused regulator_suspend_(disable|enable)
  regulator: core: Remove unused regulator_set_suspend_voltage

 .../driver-api/driver-model/devres.rst        |   1 -
 drivers/regulator/core.c                      | 141 ------------------
 drivers/regulator/devres.c                    |  74 ---------
 include/linux/regulator/consumer.h            |  47 ------
 include/linux/regulator/driver.h              |   1 -
 5 files changed, 264 deletions(-)

-- 
2.49.0

