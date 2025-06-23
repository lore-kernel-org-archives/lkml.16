Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C406BD529
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667654; cv=none; b=IBvDYvdIxf+hn1NLuCezt5jaKIR3YSXXqqs/yhPgKMA+GQJS37LdvQQtv0qJDPJwV6dO73tYfDCzGM85k9Asv2JAe2qx7RnUD0M7KTRWNeGI2mwGJMzy68Y+aIR6gNF2AelgOIRT5K3MNVB642KO2nvZjrUegHhNngW5FxqNd08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667654; c=relaxed/simple;
	bh=+CWYj9rOngZ8kMCq4xGmqCZqj/u/4luo5fH8UxehMCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZhDQdD7IN33i7ir7ju32TaVq9lb4Oj3//VYeGwdrbGiCjBcNBA+1lSrZKrZSS6njSJbWdSthwotLicJqFYTmhzovEHKHkdD/YbmgGTTHkang4MwWt5HRv7lK/gPd1TpZYRFpwCey4x8cveTL2Bv9vmfWxQnqQI9pHWeJrarawR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bmYSAHiF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xRpkxeCI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bmYSAHiF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xRpkxeCI"
Date: Mon, 23 Jun 2025 10:34:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750667649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=0e1z9Iqg8n6vL6jd506voSfhyFaeIh6KIonNIUBr/UE=;
	b=bmYSAHiFY+RfyibdfLBXDEepaTGabaBxGD4I2lnXvNc3aa/8uFgHdQxL6J8lj9mgNU1K2o
	a7UBVtL8aL2nHnY9KmkgW9I3rPtoFcwynL3YhTZ1//3WzNtLHhc7LBhFlti3C8DSZXSMqU
	4QDfVU2am0apL8bbzsm6rfHEjHByk8NX7PzF9JqLtOn6DFrKAAP8KbynAGipEoxfmOV+AY
	NFMBJtB2mrRX7n41Ihn0YaX7kdkJsD6F8UhDnwdTzQyKFkh2XCCPlpsLBWnTU3YdVcNjfb
	8Xg6YUxA0eCkbYxn8aWEhv3j6xDqr5vvyongDkfLY4hRipV6+9hX8j2/PLB2DA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750667649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=0e1z9Iqg8n6vL6jd506voSfhyFaeIh6KIonNIUBr/UE=;
	b=xRpkxeCISZ09VnDAMDkCJu9W2vxSvHyIQnDPiHOph6m7aAST79KNP9zq9f36RmgBpVL6u0
	5dGlknno+8kkSkAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Calvin Owens <calvin@wbinvd.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] futex: Initialize futex_phash_new during fork().
Message-ID: <20250623083408.jTiJiC6_@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

During a hash resize operation the new private hash is stored in
mm_struct::futex_phash_new if the current hash can not be immediately
replaced.

The new hash must not be copied during fork() into the new task. Doing
so will lead to a double-free of the memory by the two tasks.

Initialize the mm_struct::futex_phash_new during fork().

Reported-by: Calvin Owens <calvin@wbinvd.org>
Closes: https://lore.kernel.org/all/aFBQ8CBKmRzEqIfS@mozart.vkv.me/
Tested-by: Calvin Owens <calvin@wbinvd.org>
Fixes: bd54df5ea7cad ("futex: Allow to resize the private local hash")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/futex.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index 005b040c4791b..b37193653e6b5 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -89,6 +89,7 @@ void futex_hash_free(struct mm_struct *mm);
 static inline void futex_mm_init(struct mm_struct *mm)
 {
 	RCU_INIT_POINTER(mm->futex_phash, NULL);
+	mm->futex_phash_new = NULL;
 	mutex_init(&mm->futex_hash_lock);
 }
 
-- 
2.50.0
