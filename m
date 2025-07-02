Received: from mailrelay1-3.pub.mailoutpod3-cph3.one.com (mailrelay1-3.pub.mailoutpod3-cph3.one.com [46.30.212.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EBE1E0DD8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472495; cv=none; b=hH3TqKS5wRgBZ7F9LVAzo7cw2oL8g1Mfe/hurwoqLIR51b15IKFFpynMUBkfXSzSYn38Mlon8nRhTYL/3cpFuXhInX8smDTb3rudhhdnbIMumBbE4bKwoeITHO2k1GPYfm1InJepj7bFrp8E3YOt7he65lJvTGAnJ45ZAiIxDiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472495; c=relaxed/simple;
	bh=7ju5f5QQv4Ss1Sfs/AisS8mYw0FUZAUiblaLEeJC/bg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Otvd3KAouDCTQU0WV+OAI2dY2ev6GV9NzfW5D/UXfIDCdXKfXlxpxQVjl2KSek44TIE4YdcGGOvNiuvxXbrG4n7bPqW8GRFe/auvGrotDezKodtsYesJlyNkJzbjWbGzHuN9J4pTTH4rROF5BtUidaVvz2PomYGMdZQKirneuK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=TEHyX9EJ; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=o9wVhxWH; arc=none smtp.client-ip=46.30.212.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="TEHyX9EJ";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="o9wVhxWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751472483; x=1752077283;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=UMBEZuVHLa1xcNzYUfGpph4y51+09sTsebcehzU27+k=;
	b=TEHyX9EJ9RxKc06IJU12JHt+sKNP7R1ybONjhhdJkpdPUPxM5ZFDXKFMosynsX/2kOIdT9Wo/ChCI
	 ZCcDNO0PQ29W77jmdZbgkl7QQMp22pqikcGGCCAjzk15LBua/y2t86pBH+cA2L75C5IPbqFc6SP1yD
	 pZ04UnzIqgOzuQNlFVYpAkMQAgBkvGt4LjlQmDd8yr6tFfLkA0PSxdQze2uQmMsNkmSI8LzkNTHzPs
	 8foY2+WElvUMZw5k63lVbq59mj1LYF2V8BQBcs6kzJ/7k0r7P3jNWTPLdzTB84EVf0GmeEu3ZhEtsF
	 XCWH8yLOL60ToxJ7V+AZcSoGr6xi1GA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751472483; x=1752077283;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=UMBEZuVHLa1xcNzYUfGpph4y51+09sTsebcehzU27+k=;
	b=o9wVhxWHulFoS0B6io9RBZvwBbzmcRW8jq/tQGxLNXxOt/eda5RTtFYtZWMlBSQAjXpeX9xFNb0Eg
	 YrMyQbJAQ==
X-HalOne-ID: ba3eee65-575e-11f0-918a-152d8afab6bc
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id ba3eee65-575e-11f0-918a-152d8afab6bc;
	Wed, 02 Jul 2025 16:08:03 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v10 0/4] support large align and nid in Rust allocators
Date: Wed,  2 Jul 2025 18:07:58 +0200
Message-Id: <20250702160758.3609992-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The coming patches provide the ability for Rust allocators to set
NUMA node and large alignment.

Changelog:
v2 -> v3:
* fixed the build breakage for non-MMU configs
v3 -> v4:
* added NUMA node support for k[v]realloc (patch #2)
* removed extra logic in Rust helpers
* patch for Rust allocators split into 2 (align: patch #3 and
  NUMA ids: patch #4)
v4 -> v5:
* reworked NUMA node support for k[v]realloc for all 3 <alloc>_node
  functions to have the same signature
* all 3 <alloc>_node slab/vmalloc functions now support alignment
  specification
* Rust helpers are extended with new functions, the old ones are left
  intact
* Rust support for NUMA nodes comes first now (as patch #3)
v5 -> v6:
* added <alloc>_node_align functions to keep the existing interfaces
  intact
* clearer separation for Rust support of MUNA ids and large alignments
v6 -> v7:
* NUMA identifier as a new Rust type (NumaNode)
* better documentation for changed and new functions and constants
v7 -> v8:
* removed NumaError
* small cleanups per reviewers' comments
v8 -> v9:
* realloc functions can now reallocate memory for a different NUMA
  node
* better comments/explanations in the Rust part
v9 -> v10:
* refined behavior when memory is being reallocated for a different
  NUMA node, comments added
* cleanups in the Rust part, rustfmt ran
* typos corrected

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
