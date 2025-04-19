Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906091B4244;
	Sat, 19 Apr 2025 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745063534; cv=none; b=ol8rVmCKxDECn3dld3pDYomjOucsWeUUDK/MNnt/xyUCDfJWDP8/K8IaQVaXMHlqscebn/dArsa1OLzoOggV/60kejpQovaooGpz0ocIQNCqRspwzfRq+CnrU01c6w0Al22arePKKmjRr8Tl1Yz/sCylFVfrqm8cLTfrlMQJbGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745063534; c=relaxed/simple;
	bh=WH0MiRM5Q8jwbcF+nC/VRwuK8zf16f/nGUjSJNj/Hv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YKgaVw6JGUXwjWqiecYkhvLN9Bdw0jpnhyFRJufanfLuu4mBzYXHecUS34yS5uO4EmvcROCee3F9biBCKfRWg69a6JuvP/Gzf7Ge+xJIc0mqeH2R+VJmfS7ch/t3pu/nPmFtGWanmoSVFrB8J1ukEUBlr2R1/zsAbIHM3F6sF7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYF3WWb5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYF3WWb5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57567C4CEE7;
	Sat, 19 Apr 2025 11:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745063534;
	bh=WH0MiRM5Q8jwbcF+nC/VRwuK8zf16f/nGUjSJNj/Hv0=;
	h=From:To:Cc:Subject:Date:From;
	b=QYF3WWb5C6wyHekRykFdpKFNov8P+IYi4dtbptV5OWFTyRUmJ3TUegH+zQ0JhiVDD
	 xPsE/fCA5SYNbRhwqPpSRZFR2osZI8sCgzjlDXnfbM2EC4laMvVK7yTD6zt3AeaLTQ
	 +gKKxREF6xXRfv4R5eYfIxJOhMw5wiydsYJ+O/47fd21oHVxsdWpzrJs1Q1HDdv2sn
	 BpygpqTsBxEofoMlm7i0lKu8X7KqT9R9Zr9Wk3gWVB1ChjaJZ8nNCn7gCg36Ic1GE5
	 cOsadK+NCB6LrS++SoWynsFBwgyTfygDLPJyn8kIibWtei3NJ0TAH4nO17pMpAXHvT
	 /Ntc5EzHqFYfA==
From: cem@kernel.org
To: linux-kernel@vger.kernel.org
Cc: Hans.Holmberg@wdc.com,
	oe-kbuild-all@lists.linux.dev,
	hch@lst.de,
	lukas@wunner.de,
	angelogioacchino.delregno@collabora.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC PATCH] math.h: Account for 64-bit division on i386
Date: Sat, 19 Apr 2025 13:51:46 +0200
Message-ID: <20250419115157.567249-1-cem@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Carlos Maiolino <cem@kernel.org>

Building linux on i386 might fail if a 64bit type is passed to
mult_fract(). To prevent the failure, use do_div() for the division
calculation instead of hardcoding a / b.

Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504181233.F7D9Atra-lkp@intel.com/
---

I'm sending it as a RFC because I didn't to extensive testing on this
patch, also I'm not sure if mult_frac() was intended to work on 32-bit
only types. If that's the case, perhaps, a new mult_frac64() might be a
better idea?!

 include/linux/math.h | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/linux/math.h b/include/linux/math.h
index 0198c92cbe3e..05ea853b75b4 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -133,15 +133,16 @@ __STRUCT_FRACT(u32)
 #undef __STRUCT_FRACT
 
 /* Calculate "x * n / d" without unnecessary overflow or loss of precision. */
-#define mult_frac(x, n, d)	\
-({				\
-	typeof(x) x_ = (x);	\
-	typeof(n) n_ = (n);	\
-	typeof(d) d_ = (d);	\
-				\
-	typeof(x_) q = x_ / d_;	\
-	typeof(x_) r = x_ % d_;	\
-	q * n_ + r * n_ / d_;	\
+#define mult_frac(x, n, d)		\
+({					\
+	typeof(x) x_ = (x);		\
+	typeof(n) n_ = (n);		\
+	typeof(d) d_ = (d);		\
+					\
+	typeof(x_) r = do_div(x_, d_);	\
+	r *= n_;			\
+	do_div(r, d_);			\
+	x_ * n_ + r;			\
 })
 
 #define sector_div(a, b) do_div(a, b)
-- 
2.49.0

