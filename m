Received: from mailrelay1-3.pub.mailoutpod3-cph3.one.com (mailrelay1-3.pub.mailoutpod3-cph3.one.com [46.30.212.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88D295DB4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016617; cv=none; b=UOUkBYPrgOrN9OZaG5pavKo4awhHyzSvpeBz3rUiZhgNsGYsp8uqUUuF8byEFS3IpOwsxqNXZfmzsQMxneCtPfdJsfCNARxdmfErCwctoQEK5t+a3eTxhpVKoRss8gjetjp71wpXpB3OWbx32JJF5okTfzGGCotKKhP4HlQOlN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016617; c=relaxed/simple;
	bh=hEOJrVMGDzKkOP2R+1Ohzn8Ie+hvnAxSW+0XgxMjiWc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fvm1I1wD5ci/es86hTI2mEC5beyAy2kPE2OzIzQFuS7NL9Qo6zmGIOlgdJ/+1Vu1PzLv/D4UJV1E4VFiC8BXTtWoX7rCp24K4HDxG/1wmWaasKC1hs9fuK5ZQuc5PWGXgHbED3sKxtfkLEVsSfSmSyRzaFeL0jitJlF6kfpVPZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=CAQMo3G4; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=OTCogenG; arc=none smtp.client-ip=46.30.212.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="CAQMo3G4";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="OTCogenG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751016545; x=1751621345;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=4ldWEIgjhHcv8pLoOguZ60cI9NblcazUnA8m9dt7vcc=;
	b=CAQMo3G4jnsz/FHF5g3IqkiO13sJrszTQFG5ErmCNU3JutOVaaYGdeqNuWhdRx83qEUCRy/VCOh3D
	 ZwMAQluEuFCTE9x53wj/r+Djprab49ulSA3+Zmm5cdk+TFva1NQ5v6tnYI8R0oJyz+SE2trq/Aq46R
	 Ylt0oB2hLeYuWhzGf5GCqpFYqStETNF3Oxc1NtRyNMGvYLU35k3h4+vzVFVp7otvDo0wEQDYKFBTOi
	 fDW35BeEvCPezwLb7Jn3U+sDYv9BRMgS0D0hN1FLKN2qc6rVNOa0IqbytsZmcwRSjohkwNQ/dofq4q
	 p8abRfYeLW0EJ33+3UrIPJ4vHJGaA9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751016545; x=1751621345;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=4ldWEIgjhHcv8pLoOguZ60cI9NblcazUnA8m9dt7vcc=;
	b=OTCogenGbBDBq+1HCOantkqK9ARCR4C1l6ZTay7EufFwABKuvSDO9EDL0EUtTlNghM5MH5tnyfJ66
	 QC7BIt6BA==
X-HalOne-ID: 2a14a1c1-5339-11f0-b4b2-152d8afab6bc
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 2a14a1c1-5339-11f0-b4b2-152d8afab6bc;
	Fri, 27 Jun 2025 09:29:04 +0000 (UTC)
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
Date: Fri, 27 Jun 2025 11:29:01 +0200
Message-Id: <20250627092901.356909-1-vitaly.wool@konsulko.se>
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

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
