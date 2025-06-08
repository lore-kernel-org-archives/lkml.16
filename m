Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2631B7F4;
	Sun,  8 Jun 2025 01:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749345942; cv=none; b=pnXKcXwbbCQGzGYD9mcCBSnem0Y2plBSBLXvXAXbjTpSLGpgVhyEk8w6xPD9dpag7fjV9xQoWwKKa5/Psa15IjC28EZjfdaxykBGoSZ9Z1ixv0zOz5NiV4EV+ic/FcgLRHZNcLCJjPFjt5h3MCJzbkOoM5Xsr2hmGOnmVNnXrM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749345942; c=relaxed/simple;
	bh=wiLoNr62lhql6KkB7rFFjIF+gL/V91maXzW+648yZVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aiw2+ZKa936Z/9rKX+PpFFwYpu2oNJOAFiDnPSi6vGUNYC5mOxV58B7fUox0biCdIrV5j9hyzfzYnaETHa44cD4ZVCUAwlMpS0uVlttVFljIw/rVsW7NshPCqxeOULx99uqfO5iKw+vVEnciaGOLHI5/ut1iK6H4qBqEgFILn9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=pCK5EJVZ; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="pCK5EJVZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=+6qOvWF6Mpa8klvQfXLJySHSpyDAqvql3J1sc1qy8UE=; b=pCK5EJVZ2lzj8sj/
	cQiXmnDfPDtcAYQ61YSnULBCPEMKXA7MO48atJwW692BZTymH9z8/MQ/BhCZDu51z6ZstmMjXfroh
	hsgnc/U80I2qLPK2wvh2XkmzOK+s5LZieW3qQ+ciwW63f6h2ZpbRB8U24cBUwm6wbPRxQpF7VpeHJ
	UzttknRDoJS0i6GgdV5RlsvYrIwWnpIFfy5McqofIpH6a59J9RdMWMyoX+jUeb7cSVzR/gj1C4z8A
	6exXcEreWN0EDTFGXn+MnERezumMIRvRaXb9nRqauImNBR05wGsHI0Rfu1BHp4a7Cpcq6WmW5f2T6
	/gUTKKxYal9bdRS5Hw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uO4mf-008Dyl-0m;
	Sun, 08 Jun 2025 01:25:13 +0000
From: linux@treblig.org
To: irenic.rajneesh@gmail.com,
	david.e.box@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	platform-driver-x86@vger.kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] platform/x86: intel_telemetry: Remove deadcode
Date: Sun,  8 Jun 2025 02:25:09 +0100
Message-ID: <20250608012512.377134-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Many of the entries in the Telemetry core driver are not called
anywhere, and haven't been since they were originally added in 2016.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Dr. David Alan Gilbert (3):
  platform/x86: intel_telemetry: Remove unused telemetry_*_events
  platform/x86: intel_telemetry: Remove unused [gs]et_sampling_period
  platform/x86: intel_telemetry: Remove unused telemetry_raw_read_events

 arch/x86/include/asm/intel_telemetry.h        |  37 ---
 drivers/platform/x86/intel/telemetry/core.c   | 177 --------------
 drivers/platform/x86/intel/telemetry/pltdrv.c | 231 ------------------
 3 files changed, 445 deletions(-)

-- 
2.49.0

