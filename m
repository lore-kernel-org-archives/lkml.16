Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649772EBDEF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048110; cv=none; b=KYveaxlxFwSnblZL8RxQLlcptyWs2Q/J7A5fxxgYvOa/eyktq7jR5XVxpZCTfMqtBJCJNp/SLKJ3nAt0hFvvYOOliAs/Qa8cB2O4V/x9QyfE3iGrFfBEpUvNyj45uYsQ8gq1UE90kb0577WeidShjUxCen8VBsNpk590/o3i6M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048110; c=relaxed/simple;
	bh=6nR2UhKOaLGeqh7JUUKcha4QaZ4FkHRFQSFIHXbaDCw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V2CChWh0RqXS/FFQQ5l59GJVLTfRmzlCOsZgvttM6hvX1Qore3yTdJgMEQ7lR0xsRZvzXIHp/Sa6jr+dJQBMBDeRb5jJ8NO8c70C4a+J+DoLSjxy1SSC/2gXhMrU+yY4HegvxnIbN5MrOcvZNntnejFsK5nja9BP/E6yXvFgTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=rV4dhOxp; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Jd2bBJTR; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="rV4dhOxp";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Jd2bBJTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751048107; x=1751652907;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=eRKmsh+J/B5TleawgGITzaJDuW8tt6H3lpKlxEAt4f0=;
	b=rV4dhOxpl6Twdn5LETqig7Viug4meM9cIph0XIFrrTPx4o8rR1xltl8B51R4DhpDDcTcaWRE2/aOv
	 8ChmzdDyKqE4QnbaT6rpzhu5lgtEV5SxL7l/iA9WBaC8AKomynCnUhr5hk9N97u2/ruHglowHiPJHL
	 5YwH0AZlbGLZcJ1K/uP+/2BkE5v/BZgrk/fVMoPWOeubaQni85GsYpSVdlKQ5FfJ3DGx1XpzL3ke0f
	 pS+Ijd0okWZIZoeHkozeUUxNzRMnJmA0L7oDbcXZvT8HtQs0YcCggSMq+d67iKt3YBeQDGe3VCeAI4
	 4YXPFk0ha0Rm8BqcWV0Acv8U0G4G9PQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751048107; x=1751652907;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=eRKmsh+J/B5TleawgGITzaJDuW8tt6H3lpKlxEAt4f0=;
	b=Jd2bBJTR2h4zkT+YESk2pq8P8xXDWKR0iGA8XmOZIRuKzfiFayTsiwU9RsWz1TMjd+erVFXGibfe4
	 B61/xZ1Aw==
X-HalOne-ID: a6e04409-5382-11f0-be06-f3c0f7fef5ee
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id a6e04409-5382-11f0-be06-f3c0f7fef5ee;
	Fri, 27 Jun 2025 18:15:07 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v5 0/4] support large align and nid in Rust allocators
Date: Fri, 27 Jun 2025 20:15:05 +0200
Message-Id: <20250627181505.2080916-1-vitaly.wool@konsulko.se>
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

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
