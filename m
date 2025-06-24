Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D2923A58B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768678; cv=none; b=brFQ0kfiWMyCSzF44MuiMvdoDZDPZNOOkPwBu+Bx3g5HBsEqPm/bJHEa+TGLvFoOhNPVA/2gz3B0dZZZFdP802fD+iPY16+reJQFrmYNDoPt7Nl0b1tJIIAuNv4BT5Gxx1yzb5m5vz+upcaGjUl/r5OHJD1hAObM6IqXrddUANI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768678; c=relaxed/simple;
	bh=0ln2qRw2E85Akbxj+nRVBp4e2dfEcTdQKZXNwW8uH6g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z9lI8pKXXiGZa9fHeGwgyqoETuNuiFW1ymoJJzjlxL1+/WC59046g75AQV8WxxsEHCKoMEq79IdsVd4a/0NIuXUtYM9JIRxe/JcWWF6nnSvmKpB3DeV+E2mFntMyGvbrLSbpaLHspyFcLTzve60DkbovYeNtZHJoWFh5mPlfFvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=YzjynL5s; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=6u1vt6JN; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="YzjynL5s";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="6u1vt6JN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750768675; x=1751373475;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=0ln2qRw2E85Akbxj+nRVBp4e2dfEcTdQKZXNwW8uH6g=;
	b=YzjynL5s3fw7FhJO32ooLBfK+8aA/XfsiFcqfU0sYZfDiU3kLtBPeH2mlCEMsSq0MrZ+vg2nuJbmI
	 jO5lZ2vnBM3RK8jhT34zVDfXDSeqN4VVmfYnJRLj+SNPDu6Rmxh5bAu5QqRM38FMPVT6+etrL9KgQ+
	 hkkss1xW1hs6SNQd/z6WVpnb7TDv9yGykfljWQxKjpkN/cpEFgMrxE+B10VKpHy05wqvsoTe4ljflb
	 1zmAN+Ud7HHOuLF4qc5NMgpx5yZErDt8h31LtnXFLv9ZN5fpi3xaHXewO4Eu0kMG0wNuRY7wFDkV9x
	 axHTkn80QSpnyXSIiFnTfzR7PaTfUdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750768675; x=1751373475;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=0ln2qRw2E85Akbxj+nRVBp4e2dfEcTdQKZXNwW8uH6g=;
	b=6u1vt6JNOKEBzg8QN4MvcCk/00P4kj9XK5ExoW30aOhri4cxkzIME988afeZtJiIn7bXSKhgIbQAn
	 JXIA8XWDw==
X-HalOne-ID: 0bf24faf-50f8-11f0-80e9-4f541c8bf1cc
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 0bf24faf-50f8-11f0-80e9-4f541c8bf1cc;
	Tue, 24 Jun 2025 12:37:55 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v2 0/2] support large align and nid in Rust allocators 
Date: Tue, 24 Jun 2025 14:37:43 +0200
Message-Id: <20250624123743.3258032-1-vitaly.wool@konsulko.se>
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

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
