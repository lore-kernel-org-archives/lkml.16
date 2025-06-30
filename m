Received: from mailrelay6-3.pub.mailoutpod3-cph3.one.com (mailrelay6-3.pub.mailoutpod3-cph3.one.com [46.30.212.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF28D12E7F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751321728; cv=none; b=FEVZ0uAlJ/XJHfpAwOUYA6YEa4bgGb05EVXkRU//ILNl174Uk2pa+LMKYx3aSmyr6wtu6bdl4Ne4hPwYPYPIKy0jCYIA6Aiq03ldutWm+bdAYSSnthl/2zDavKM2EqAvtOLjsXz/ucs+8/dETXg3wU5IfoJzFVIBnHnBIuh1FSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751321728; c=relaxed/simple;
	bh=2KHUeuh3+P7jlkW42FnZUGVL1RaxAWhw8QiHv4fOf3E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gcxYr2WNjlJwkKNKLTXA62X/bliuLXtKtWVNIC69sWYrm45LZKC/UEKS0N8yLTWu9QWCw/2bzGR6wcxQe9uHGYNp3ZBsvOOWC1Uoc1KRUl8V8yp6noxRg2HVWq9+NbYVnp0SPaurm6ThNBfAnvYHYUG0T5qyF2Hjp3umnRN1Jis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=fNw3uMrM; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=9I/W4EO7; arc=none smtp.client-ip=46.30.212.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="fNw3uMrM";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="9I/W4EO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751321717; x=1751926517;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=jTXC2i6AwJGQK65UMS5EdlYSzYZBuaDXRcDMwe2Am78=;
	b=fNw3uMrMTJZS7pFKNV9bK/mSNCO8/tr+tgsPldG9JbHNayXanBBYEhWIkJeGoegMjeec9J2erWp/T
	 a6cnmzhXlxhqYUlsdU6o+3ANNzXrXBZs4P9YSyIiQu0xFmJwzyox8F9Vu5x4ZBLVR4a6Ul9KyK+RsV
	 WqjNGuCF+rNYAIlp0PoWeFyuAjhPfyTJaDmX6Jj2xSL9Z+M59UMN531uSCfxBr0nMstFR3oftxz3g7
	 HiLBJBenx9dQdS7zoCuFqo2g8SL3vlt2vcwNPfp0FWZx3fAMwOqFOJXzwz3h3rt13DvllFRSMXUJOc
	 ZDO9O9ZGDxRyqNzWes1hl6yxzq/YSyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751321717; x=1751926517;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=jTXC2i6AwJGQK65UMS5EdlYSzYZBuaDXRcDMwe2Am78=;
	b=9I/W4EO7xixjL1/332i648yA7N5XH1h3cOu3MYfeRBJPEk98AeTf1qyIV3M8do2KI9zo7k4Bjy9II
	 0X5AimxDg==
X-HalOne-ID: b33a3f07-55ff-11f0-a298-417246ffdc90
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id b33a3f07-55ff-11f0-a298-417246ffdc90;
	Mon, 30 Jun 2025 22:15:16 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v9 0/4] support large align and nid in Rust allocators
Date: Tue,  1 Jul 2025 00:15:11 +0200
Message-Id: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
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

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
