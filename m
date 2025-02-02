Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C871D5154
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.133.245.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738482623; cv=none; b=qaHLeZCNKohyBvKSSDk3khfNCRyReAVceIa3ykbwlz6ix03Q7PttEHmBOgsba/R2vPEj7X0V9miPgZIuy+SCu+gkeMZVVN6VQGIoTcWKa4j/M7TvsHr2bhSAGnCpWDYxFYSEBnwg8iGvG36T7zNKQYqRnkjSsr7RqGWoKC2PfaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738482623; c=relaxed/simple;
	bh=5M/L95fBHGQGVcRd0UCbPHJl6k6pg+piEV6LwaXnlTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbbE03zJy6xIDTS0bbsNYPEN5tmpeLxZIcb8LXG7icewR7b6TIcTCXQfssjbSibNCMXbiFA+i4AfC5DgAsyF2ONI/sY18Ab0gwW01QkBJDpMRaLmz2XHaD1Su3O3NSpGKinO7bGPKQ5zMB+Znq4adZ87oQ136ghhVQssihqmY1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru; spf=pass smtp.mailfrom=nppct.ru; dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b=cHy5yMkD; arc=none smtp.client-ip=195.133.245.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nppct.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b="cHy5yMkD"
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 06AA81C242E
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 10:50:20 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:to:from:from; s=
	dkim; t=1738482619; x=1739346620; bh=5M/L95fBHGQGVcRd0UCbPHJl6k6
	pg+piEV6LwaXnlTI=; b=cHy5yMkDNolWOJ0QcwiXTFu6LE6mt+ylCZPGyG9XCqr
	tjeyEeLAAdo8JMi+JAniG4X22WIqfKajyzzg96982g8ZECdL4H4NIcOtfIui+mna
	pcK6OTB8B+E54olbOCaFo5R2+vq77jpcfMAP6sDJ5dCajU9dqQj+I/ntytiU6MnQ
	=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MmHnvWzMSRRP for <linux-kernel@vger.kernel.org>;
	Sun,  2 Feb 2025 10:50:19 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id 278EA1C2434;
	Sun,  2 Feb 2025 10:50:15 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Hou Tao <houtao1@huawei.com>
Subject: [PATCH 6.1 04/16] bpf: Let free_all() return the number of freed elements.
Date: Sun,  2 Feb 2025 07:46:41 +0000
Message-ID: <20250202074709.932174-5-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250202074709.932174-1-sdl@nppct.ru>
References: <20250202074709.932174-1-sdl@nppct.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

commit 9de3e81521b4d943c9ec27ae2c871292c12f1409 upstream.

Let free_all() helper return the number of freed elements.
It's not used in this patch, but helps in debug/development of bpf_mem_alloc.

For example this diff for __free_rcu():
-       free_all(llist_del_all(&c->waiting_for_gp_ttrace), !!c->percpu_size);
+       printk("cpu %d freed %d objs after tasks trace\n", raw_smp_processor_id(),
+       	free_all(llist_del_all(&c->waiting_for_gp_ttrace), !!c->percpu_size));

would show how busy RCU tasks trace is.
In artificial benchmark where one cpu is allocating and different cpu is freeing
the RCU tasks trace won't be able to keep up and the list of objects
would keep growing from thousands to millions and eventually OOMing.

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Acked-by: Hou Tao <houtao1@huawei.com>
Link: https://lore.kernel.org/bpf/20230706033447.54696-4-alexei.starovoitov@gmail.com
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 kernel/bpf/memalloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/memalloc.c b/kernel/bpf/memalloc.c
index 63b787128de8..0cd863839557 100644
--- a/kernel/bpf/memalloc.c
+++ b/kernel/bpf/memalloc.c
@@ -223,12 +223,16 @@ static void free_one(void *obj, bool percpu)
 	kfree(obj);
 }
 
-static void free_all(struct llist_node *llnode, bool percpu)
+static int free_all(struct llist_node *llnode, bool percpu)
 {
 	struct llist_node *pos, *t;
+	int cnt = 0;
 
-	llist_for_each_safe(pos, t, llnode)
+	llist_for_each_safe(pos, t, llnode) {
 		free_one(pos, percpu);
+		cnt++;
+	}
+	return cnt;
 }
 
 static void __free_rcu(struct rcu_head *head)
-- 
2.43.0

