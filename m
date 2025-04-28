Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F5370831
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883921; cv=none; b=IvQEKzcn+vLWslKEMfYJPOIm1bM/iBsDed1xOeCcU8ZgXnrmkZu4e7N0TIEUfcA+9uLfBYRihQN5EkklgP7Zh2ZcY3PsF49O1HeWGnkaBVRQZozz7Xl/bMgUOio60p3s2GvSwkkEdgey4J0bFh6fEmCpk+Ua5PqQkrxk+KyJ59Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883921; c=relaxed/simple;
	bh=IN41MdVUBjlLlMwvoDgwbwFjqaZdapPOSR6HsNZcojE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=skI2n2Czs7OYNP4EpFOv0S6qE0GH++XUt3mMLiu7gbKWiD/GDFyRZ5X90N+JsAfboMMC4Mg88bwwriFKHT5mQUK82X9rsCBlgjKvkDoSi1m73qaNXAzNy/bY0IadSb875gOKTT/6oCExibvZxba0N5HpGpPVKkXMCRSv+ibSVaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tImX1hhb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tImX1hhb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C3BC4CEE4;
	Mon, 28 Apr 2025 23:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745883921;
	bh=IN41MdVUBjlLlMwvoDgwbwFjqaZdapPOSR6HsNZcojE=;
	h=From:To:Cc:Subject:Date:From;
	b=tImX1hhbPhVcJAAYIfQI9yKKmjWKOUwFWqkOZXTy/fU8rYn0DD5s4zoQcTIG+SFVA
	 usI/s7HQxevT7FN2JQ/Fc2oNydmd7ZmIwVM1jR2+qRFFTVHIg0QZzrKuRwgC+RZ1Xa
	 tihjkFzKVunwR7uh6K6fH6S++SaoA8G0Xy+TDjLsXW1twQx79aHfDZktEJMy9j7RSL
	 eYo6vQZl7/BkCAPZ9EqCOdJpSB3PiSfF9n95uCSb6H/XlmRyowgB+btWlIgrjXIcNr
	 GFlOybHaOENph/edqMLaE7HPnHL+WIO30VnVBV4YJpe/sIR2KVAQW88xhyUBlymwWD
	 GEvsbyXcOQi5A==
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
Subject: [PATCH v2 0/2] panic: Reduce CPU consumption after panic
Date: Mon, 28 Apr 2025 16:59:50 -0500
Message-ID: <20250428215952.1332985-1-carlos.bilbao@kernel.org>
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

In v1 [1], I illustrated the potential to reduce unnecessary CPU usage
with an experiment with VMs. The main delta is that, instead of a weak
function that archs can overwrite, we provide a flexible priority-based
mechanism (following suggestions by Sean Christopherson),
panic_set_handling().

[1] https://lore.kernel.org/all/20250326151204.67898-1-carlos.bilbao@kernel.org/

Carlos:
  panic: Allow for dynamic custom behavior after panic
  x86/panic: Add x86_panic_handler as default post-panic behavior

---
 arch/x86/kernel/setup.c | 12 ++++++++++++
 include/linux/panic.h   |  2 ++
 kernel/panic.c          | 27 +++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

