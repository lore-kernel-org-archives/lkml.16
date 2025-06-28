Received: from mailrelay3-3.pub.mailoutpod3-cph3.one.com (mailrelay3-3.pub.mailoutpod3-cph3.one.com [46.30.212.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CA8222593
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751106207; cv=none; b=mCH77CsFBhMQyPe/gWJ3JiGVLzO9xBmuVCkUtykrjOVWQvt0ymJWN4HVo3zYY2n//OrZ6mU7C9mr9s2s6emZBM4gYRe3CBv0ZYT5uDnAlv6zaU5SU+5EzA+ihvFTVxvWm/6vq6/uUXsUf9Vm4nP0llST5ZtDX88ZhHd1PL4cjhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751106207; c=relaxed/simple;
	bh=ZC3YvRWK8eKwI0mSEg2vmY1bglHZT4c18XfkWdCm/VQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bI0TB+jS5lfM2OVH43YtOKiBa1fw1S6prCSV96fgn4RKhiFShF0kpJEkapWy4oGXPqKx2BzMjiAvcOrQsqR5U1V1dpUekKBbKpR28YycUnoug3SI3GXOtm1dZ6W5za7h6pJiRnpqZggHPvKN6wOFYfMXFgJhv4m9NXOfu18wol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=uUlABG8z; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=5ogo2rpF; arc=none smtp.client-ip=46.30.212.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="uUlABG8z";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="5ogo2rpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751106201; x=1751711001;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=zZ3lWvoCYkoDfv5FGP/87e3wTYP9JjUflTXQlLe9Lcc=;
	b=uUlABG8zGhy7NuA9rlWV/OZ9zrXwYG8dzNTo5dNOJFxVWU5TxFLWf1YEUA7UPw3NiKPES4VY2+6sJ
	 D+R7SC3j7+r91bfs3Q9ELLHrurTMsJZYH04jMnWTmgXw6atdWsSsnRFpZiaCUyxPBno06JM6fieQht
	 tbgXiQ8w2jwg1j9eWmJm+cyMCMDolvZ0wGEGTB44ZvWWRUzEqdF3tDZucj+I0qssJ9o7tzmjnqG3CV
	 0k1nqAzvtmUBAdALJ4Sb7CD1s8QNGoJe5yabpUTf/i08UurW9481xIwfMoUM2D5LxXRxq9qNQyFafT
	 wSLSadW9WAhuHb2NLvztkTxsDdn7s7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751106201; x=1751711001;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=zZ3lWvoCYkoDfv5FGP/87e3wTYP9JjUflTXQlLe9Lcc=;
	b=5ogo2rpFeUriKg7dTaX8rtIZ2u8aT5J65qZa5dNfUtcIRLhm2Z/dhZK7Q9CWgitYJV7JkHIXfTYzT
	 MCcX5+pCA==
X-HalOne-ID: e8aba921-5409-11f0-af50-2b8368a4d5c5
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id e8aba921-5409-11f0-af50-2b8368a4d5c5;
	Sat, 28 Jun 2025 10:23:20 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v8 0/4] support large align and nid in Rust allocators
Date: Sat, 28 Jun 2025 12:23:15 +0200
Message-Id: <20250628102315.2542656-1-vitaly.wool@konsulko.se>
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

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
