Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5060C1AA795
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235427; cv=none; b=DLthaxzo3EbcignTEbvx0Mx2MAKsJa93yoXO0fqNNZEFrZ6RPFpGGxY86TDPaYNQnpYRo/8U6+8Q+ZuObhUuQS8a9RkW3e7imm6ujH5mlOiE8Y443+rkwRNqHpy2XjvWaPiP5yBPseJiVlbTdh+8E6l1pDfh1zjNcd0I99FeQ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235427; c=relaxed/simple;
	bh=MJZT5XJsfkjw4c600KTtXWNPb4/asO9nAxWkLpVxmSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpPRapBVRvbAVmTO2F8ih9Onh26AZN83LgBwQfJDIlw01kSlvgCyLn+m4Ev9rR9u7Y2JvFc1rsZRjsOvFTyY7KXYXnCUfjho61ARDhIJtQmlzWtTya+ayMwiEx9oA/CzWHcQa9+aWxvIyB2xyY5s+/OFS46ugneOulfgO695208=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLpQeOx2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLpQeOx2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5FFC4CEE3;
	Wed, 14 May 2025 15:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235426;
	bh=MJZT5XJsfkjw4c600KTtXWNPb4/asO9nAxWkLpVxmSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLpQeOx2DeIMxdq+dR4uz/SYrUK/JJZxiLtpSGImXRlgmqkKtTENS1bCP2PqoQn1g
	 BbxJPuXNLlp6uLIfxEiYHeyl/vl3ugi9x5UAEPCdH1NQpJu5jFs7RUOs/mdEvlfrsz
	 aiDIBNW909y3qTmVR3IXAzLSAeg40Fev+BeweLWuEynPx/PolIzgN4+zL8yJycI+4J
	 3hoFgmoMRLj6xcveFglVbna78AtWByxW/F1lnMzEnhanGsVpepypjDzKvYlkNrs9XZ
	 xxYclMEzDltPpSLoPopEP1gfstlCOYwBLAxTXmsOwNu1CQhKEP0NO1mLoGz7TMqy8m
	 jfS6leSvCi/WQ==
Date: Wed, 14 May 2025 11:10:25 -0400
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH sched_ext/for-6.16] sched_ext: Explain the temporary
 situation around scx_root dereferences
Message-ID: <aCSyYU6EZzm4fJUa@mtj.duckdns.org>
References: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
 <aCRjUQJ_97-B0Rpo@gpd3>
 <aCSlvpiraPTKUqOf@mtj.duckdns.org>
 <aCSoKBu0l-vTlScT@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCSoKBu0l-vTlScT@gpd3>

Naked scx_root dereferences are being used as temporary markers to indicate
that they need to be updated to point to the right scheduler instance.
Explain the situation.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c |    8 ++++++++
 1 file changed, 8 insertions(+)

--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1016,6 +1016,14 @@ enum scx_ops_state {
 #define SCX_OPSS_STATE_MASK	((1LU << SCX_OPSS_QSEQ_SHIFT) - 1)
 #define SCX_OPSS_QSEQ_MASK	(~SCX_OPSS_STATE_MASK)
 
+/*
+ * NOTE: sched_ext is in the process of growing multiple scheduler support and
+ * scx_root usage is in a transitional state. Naked dereferences are safe if the
+ * caller is one of the tasks attached to SCX and explicit RCU dereference is
+ * necessary otherwise. Naked scx_root dereferences trigger sparse warnings but
+ * are used as temporary markers to indicate that the dereferences need to be
+ * updated to point to the associated scheduler instances rather than scx_root.
+ */
 static struct scx_sched __rcu *scx_root;
 
 /*
