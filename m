Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3032652A6
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059510; cv=none; b=BCtNCGF7DA3ba1a923w7z0BZGOVScXkd0PEKw+xpV9dIE5gyifK6w2PeNE9T/FfuOTT7aFVSIj/3jASzskDEW8PDtDY/Y5twOccjb8BY3ba8Tr6KPyfXHHxFRyEuryyS2e9yO5ZZBv5XTSSTqHtaxl0EronsHZJz63MTgAk9u2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059510; c=relaxed/simple;
	bh=Cl/F68/WK5XrJ6XvRUuGsOqyQMCE+IfVmht+m+da248=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pb8MeyxLnjS+jFU0ax0r6NWETggJWozyAhsqIRByHc7JkQuMnj7DGS4ATcSMROsvEWVhO6QilsKpUeOwX5Dblj4qopnN+PLqPY4XQujjvgNYHL5frx57q5ewNzgmK1n7Yq+bDAOSDQYhf7jkU+qIjwJBbgGG6S+0M5P/vHM/CWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=rIQ2pMpv; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=4enDKfXj; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="rIQ2pMpv";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="4enDKfXj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751059505; x=1751664305;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=U4CnvzeAUDkTiiObQEooy+CGcM4uqIv1lPLEWTjEViE=;
	b=rIQ2pMpv8Cqb5ViJp6UfhcpX5O1CGU2hvsPXNenyva3o9jHbCRgwt6tgUInUgmrSkQ1OVgc6DXFfU
	 9wgkCIT2Jtkj/CCzz0g2gi+KIh3Kuh2OTGrkDArGpQH1gmyNvkhvnyZTh2nymZuAlYQejrpgc7vMrg
	 ElEbgH9ts/cH9Z9aAhBNVIa3U+LPfpHUm1KIaC27tOeAJn5Mn3oNc0E2kG+FzivWaHsXzWyilF9mNS
	 quEadn48MM/hd+ObmKYn4LUvBykvLEA7IiGTWZPWOr8kIftHrTknB4xxG1IDzWy8/CjqEafkr6qfC9
	 waDr4mPkXWJXshy9XYlGRYGRmnFLuUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751059505; x=1751664305;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=U4CnvzeAUDkTiiObQEooy+CGcM4uqIv1lPLEWTjEViE=;
	b=4enDKfXjyD5XtC+t6O9KGhgnQsaIqyG+AaFElTfgX7vDawXeK8v89uobXRBshe+B8IGKPVFywDJDp
	 /RK1d+ZCA==
X-HalOne-ID: 3015eec2-539d-11f0-8e72-e90f2b8e16ca
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 3015eec2-539d-11f0-8e72-e90f2b8e16ca;
	Fri, 27 Jun 2025 21:25:04 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v7 0/4] support large align and nid in Rust allocators
Date: Fri, 27 Jun 2025 23:24:51 +0200
Message-Id: <20250627212451.2181627-1-vitaly.wool@konsulko.se>
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

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
