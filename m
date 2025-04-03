Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293CB255239;
	Thu,  3 Apr 2025 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743706955; cv=none; b=UZKWiorT+AJ1Yy755pjVYLSZowuQtTXPZA2a0beDJP6Id/VGdmm4+Za//eXWL/pBXrHSyIpUeCry9n00QWJZv/j/2VPy5HrnNkCMXu9jYc6bcN10Srx/hgKHHvA9EBawyq6f9B+HqV7I/g8Qw8I44kWh8WjM+/0P8+2zj+Z7BQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743706955; c=relaxed/simple;
	bh=eFB6fsPsXp9xhVhM7YxjbxdKgahOf8vjLvHyf7iWNiI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G0coQSL2BQqjTH3Q6mDhCn6K21guTc2D9MJIp/GnmEBOATqa7ACeQXPDoDK/OsqeYy7tFPpjLdJKbYgnLYhVEYhDXBQFp6ylUhN2HEec5mJc8zMGzE8Hmlo46BJjb5haCh8rqZcPJlTKgzroFsXQb10Fc0gb6YIZBD3Ly9ayAy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rmeyidhu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rmeyidhu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A220AC4CEE9;
	Thu,  3 Apr 2025 19:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743706955;
	bh=eFB6fsPsXp9xhVhM7YxjbxdKgahOf8vjLvHyf7iWNiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RmeyidhuLggPczKP9EiTy32keH9BeUJVSleCBbfiumnVOyMPsJWPp+Mc6lr45rzLF
	 j2Or53yvc7Pcn6ka+0U33Bsp9/2iRayzSrGHzLRRGw6RQ/olLawvmAjI8PZwp1BPWy
	 896U52SCykZ8Q/znmZEXshLIF32yvXCz7n77FuJ4kdxELKEJ04Rqqf0DQVamdou6fs
	 CC8G6Xgy3pmY/ddCKS3b+sg+j+LMh1+sDcWr0kUECTsgU+sbkUqFBslt8XtnJ+zMeW
	 U0EJwFlTiIW4ukgGESRMcvUW3KISrnxT0rgWtc1pFI4cboZBE/fvTKi7B2Cs5VvYXm
	 UL5/K24y0LPGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	David Wei <dw@davidwei.uk>,
	Sasha Levin <sashal@kernel.org>,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	toke@redhat.com,
	sjordhani@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 10/54] net: page_pool: don't cast mp param to devmem
Date: Thu,  3 Apr 2025 15:01:25 -0400
Message-Id: <20250403190209.2675485-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190209.2675485-1-sashal@kernel.org>
References: <20250403190209.2675485-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit

From: Pavel Begunkov <asml.silence@gmail.com>

[ Upstream commit 8d522566ae9cb3f0609ddb2a6ce3f4f39988043c ]

page_pool_check_memory_provider() is a generic path and shouldn't assume
anything about the actual type of the memory provider argument. It's
fine while devmem is the only provider, but cast away the devmem
specific binding types to avoid confusion.

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
Signed-off-by: David Wei <dw@davidwei.uk>
Link: https://patch.msgid.link/20250204215622.695511-2-dw@davidwei.uk
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/core/page_pool_user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/page_pool_user.c b/net/core/page_pool_user.c
index 6677e0c2e2565..d5e214c30c310 100644
--- a/net/core/page_pool_user.c
+++ b/net/core/page_pool_user.c
@@ -356,7 +356,7 @@ void page_pool_unlist(struct page_pool *pool)
 int page_pool_check_memory_provider(struct net_device *dev,
 				    struct netdev_rx_queue *rxq)
 {
-	struct net_devmem_dmabuf_binding *binding = rxq->mp_params.mp_priv;
+	void *binding = rxq->mp_params.mp_priv;
 	struct page_pool *pool;
 	struct hlist_node *n;
 
-- 
2.39.5

