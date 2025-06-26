Received: from mailrelay6-3.pub.mailoutpod3-cph3.one.com (mailrelay6-3.pub.mailoutpod3-cph3.one.com [46.30.212.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA42949F2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926935; cv=none; b=Vx78RNmdNexdJ5236k1aOER/PRYqE792377j/luQolLCIaH6YJ0yBT4GaL3TBaSRy3vEZg97EGx15iD7vAWqSw3rCwgCAYX9z00QrH6wXFFmPrA0URV1VTXfLkWV9upZCblWnDleaR7OV5wFBwJADiNKNeu664NroAsmRczHZDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926935; c=relaxed/simple;
	bh=hWad7m+mN6xvSBGGrANo23QZoNDddNrfioEbtnuw3vI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GK0c6h1nznhb478QXTwQfKrOjM3A2el7j4PJxRGhTOrQ4P3l7vl8OMPQpPvSNOTMTOYZN+s6uOP0529OmcnybHn04IuebThBLKJ4lPKqimSTtna/8+jR+n2i9DpLb34SGZdIVOgZN+1n221sYr/WkDTd48wxp2zuwy/xmfr1yRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=L1Fq5dtp; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=FVorVDCn; arc=none smtp.client-ip=46.30.212.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="L1Fq5dtp";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="FVorVDCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750926928; x=1751531728;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=+6By1IKtoPYuryucxa7aH+A3H3nlKufzo8Dei9sMDPk=;
	b=L1Fq5dtp0O+8Z171iT7Ygw+pIc/xNuTqkb+SMdp6OsOowFcj09aIdFfLu37UhtQuFyJv/l7ikl1So
	 L+0O3iZTUPqihO7ZHPKiXq6mrekFU+cBmWu1ZCbfTyes/JP6YdTJP35TgJ0fhkGUMYhiY5s8YJbkzr
	 Sw7c/1vYHQDX7sszAAowK3051AJMsPgclO5tHpsvm2ZuHZvwsQSaqIRDrIVhSQnuNbAjMAHIYnDed3
	 cD09Golz0CAnvhSlut3CgsQNL7PzJb8IYpNNKbeI4+fM0RFPOvWDdvXtw1sUFPJY+xt+6Ck2h8YwF+
	 Y1l3qMM9Z34Cf2quw9Numt19gPR6NmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750926928; x=1751531728;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=+6By1IKtoPYuryucxa7aH+A3H3nlKufzo8Dei9sMDPk=;
	b=FVorVDCntNtN9zk1+9lBSMAAJQPg4o/h6JGYUGLGSE2g1wBSYFI84QLInSBmmDqVgc/Z0B6iw/wST
	 eI13rfuAA==
X-HalOne-ID: 8207160c-5268-11f0-8c4d-417246ffdc90
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 8207160c-5268-11f0-8c4d-417246ffdc90;
	Thu, 26 Jun 2025 08:35:27 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v4 0/4] support large align and nid in Rust allocators 
Date: Thu, 26 Jun 2025 10:35:16 +0200
Message-Id: <20250626083516.3596197-1-vitaly.wool@konsulko.se>
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

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
