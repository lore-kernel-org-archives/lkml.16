Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254E4242934
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945120; cv=none; b=UcjaIuYj2+dvk6jWn/78cWKNE2MhnDRntSJVFHCqq91GbYQbcWVZRJ+f1arWNd+OEau1hWFSmjrM7aPiTK4falMDWWFS6Ueo/jPey46QiWGuJBVn1mzKQKlK7efK8IhXQUIir04mpAXum5CG+1pvWtHzkq4P1eB0AqmczDDz8Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945120; c=relaxed/simple;
	bh=YH+JNQupXkup+rP/ftgX4CC1j9JkxhY7NQTuyNOODQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KSkMwBl/bqUdJSAXPShHTlv+yLmiM3R8YjN65RIy11pYMScJPziusEsAY3j502WscVC87OmPkb//cvhtqFDRiDWOSR03B2f7rzQQUDxuL3PsVfW82cKmKzZay1aFRM6ddz1BsXM02GG4X/REI6kkgZvyfCYZWICAWIzdvIL+B1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRi8x6i3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRi8x6i3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9404C4CEE3;
	Tue, 29 Apr 2025 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745945116;
	bh=YH+JNQupXkup+rP/ftgX4CC1j9JkxhY7NQTuyNOODQY=;
	h=From:To:Cc:Subject:Date:From;
	b=FRi8x6i3x05Zv2dipWwcVCrqX6YA7oIkTfXSi2ZuWANJ5F8+SA/Zq3BeeiYRb/6ZH
	 aNZlmbfdA4QMKquI3ajWQuaqFeNQ/z2MAiFTyMreI+QDX3edk/iH2/09LitscGr/PH
	 MU3KQF9hFvUJgGGSA4+LE7kLEOTmIUuTDyQlnV6qRSOq3A30itbLDgAznvAIcq5JZA
	 px2IYFTdGOgbsjI/oi8zilmF9b0vnbH3BIUo00GV4MPS/fYwX5VCX2W3xwKmwAwXLN
	 ImOUZZb0Hw5R8VrBW+J2CfZ87Ul061nJOS2ScsXt/HIobYfFEEg54tNN3Hkey/fxlk
	 0B9XNQXRkyCUA==
From: carlos.bilbao@kernel.org
To: tglx@linutronix.de,
	seanjc@google.com,
	jan.glauber@gmail.com
Cc: bilbao@vt.edu,
	pmladek@suse.com,
	akpm@linux-foundation.org,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	takakura@valinux.co.jp,
	john.ogness@linutronix.de,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH v3 0/2] Reduce CPU consumption after panic
Date: Tue, 29 Apr 2025 10:06:36 -0500
Message-ID: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Carlos Bilbao <carlos.bilbao@kernel.org>

Provide a priority-based mechanism to set the behavior of the kernel at
the post-panic stage -- the current default is a waste of CPU except for
cases with console that generate insightful output.

In v1 cover letter [1], I illustrated the potential to reduce unnecessary
CPU resources with an experiment with VMs, reducing more than 70% of CPU
usage. The main delta of v2 [2] was that, instead of a weak function that
archs can overwrite, we provided a flexible priority-based mechanism
(following suggestions by Sean Christopherson), panic_set_handling().

Compared to v2 [2], the main changes in this third version are that (1) we
don't set a default function for panic_halt() and (2) we provide a comment
for the x86 implementation describing the check for console.

[1] https://lore.kernel.org/all/20250326151204.67898-1-carlos.bilbao@kernel.org/
[2] https://lore.kernel.org/all/20250428215952.1332985-1-carlos.bilbao@kernel.org/

Carlos:
  panic: Allow for dynamic custom behavior after panic
  x86/panic: Add x86_panic_handler as default post-panic behavior

---
 arch/x86/kernel/setup.c | 17 +++++++++++++++++
 include/linux/panic.h   |  2 ++
 kernel/panic.c          | 22 ++++++++++++++++++++++
 3 files changed, 41 insertions(+)

