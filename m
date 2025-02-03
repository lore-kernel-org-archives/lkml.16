Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857B31D88A6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738564497; cv=none; b=B0YQOLqlvkV8rHsNM9g5SHgc8f+6e+DEYNFisKFxxrypxcCsVE9zQa1yLtIkbEO2W1WGKqE1tMtu1XFbDpfd0L+BEyci3dVJzxEDvc/TbZy05XpmONb/4nLacEhE2Uh6Nq9W3ljkXVVFrUtWLRWpN7H7LCHdbxmz59OcKIoofJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738564497; c=relaxed/simple;
	bh=xGMuxjiG3J1KY0tpr4BD/2R/zK2QTssBPpcx8ig7gas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rI0T7PNs1tSlYsc9kHHrMPsBTKIXuovMkmxR35mur4reFAMZGcXqXDML4Qe6y51fOOthfqg15uYjh4BYA+0ZG7auqqIu51xc1MtX3x63jueCQCksdnMpFPU9uThx3fjt290u+74ITEFdmayICWuYnE2Z8aVuUYVr28AKFIjTLlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=QcBht3c+; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="QcBht3c+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738564482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rxn7KNy58nycOR58GR1ZstIpveHU6RnMKXkVaNeuEy0=;
	b=QcBht3c+OufRO3iFS6wrhVpjylMePpMaqwaomd/7X7hA8XBPKaNDGk9iC3dWPZ9NzKoy/g
	UYw9TC40q+nyqQqgLo1Ij+y2kpsccgqveHqHIfjc6h9MfZ6pzShLgYgU3nL6s3pjXuyPg7
	fPN1jxxJGazM4Uy5ja9rIjqCURIGWIsirdPTRhDkIxyBmydOZa+ZLN1+Xj385iUc2Kc2JY
	bl78FjPa3bZ1s46bnHrJwkg3mhQYAwKuYi718li0Auz8IpFG43O7yYnKfKnwUd301qMYGS
	o6z4hltl0OkyfGtVNBxcbbHGJ6hGAwP1O1th1T08VnCk0BWclX7Sb5e/h2Cxbw==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH v3 0/3] Add missing SDCC resets for SDM630/660
Date: Mon,  3 Feb 2025 09:34:23 +0300
Message-ID: <20250203063427.358327-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

These resets are part of GCC space and were missed during initial
porting of the platform.

Changelog:

v3:
 * dropped fixes tags, picked r-b

v2:
 * split into 3 patches

Alexey Minnekhanov (3):
  dt-bindings: clock: gcc-sdm660: Add missing SDCC resets
  clk: qcom: gcc-sdm660: Add missing SDCC block resets
  arm64: dts: qcom: sdm630: Add missing resets to mmc blocks

 arch/arm64/boot/dts/qcom/sdm630.dtsi        | 3 +++
 drivers/clk/qcom/gcc-sdm660.c               | 2 ++
 include/dt-bindings/clock/qcom,gcc-sdm660.h | 2 ++
 3 files changed, 7 insertions(+)

-- 
2.45.3

