Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4566233E4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750823205; cv=pass; b=cRT9EdoJY1mHACUoQD+qnHx50TcmVR82k70spZ6Zf3/DEHu5DHSoKbe6Lv2LiQ7cDdejdfLdpXAyb5pM1Sn1JvToUiKfJ+bfI8QamOmy8AIX98CuPMQW5zX+AHVArRbdyvd75W3E3U9nKRL8lA6Hdoh1mrTs/kGD50d7Rnlt7wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750823205; c=relaxed/simple;
	bh=ffWWrrBJqmH9XQhG6Tx6W+JW9AuLEUThhzojHNNev8g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pWjucI3GQWpHx8ZJ+xnpddQWIUCs22mmkFddyuZT0AJgCyc6kxzXUbwzveSW35kXZQeo2i11VIg+JGZY0iy9KYy5jjoJG7UYSPptgFgBAjFdAfVIbh1JqpO0JBmf2hTIqrCOqwlVOgoJK3MxoMvrVgwhXnZwvdv5FoaKphv9dpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=qDcBEDW1; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="qDcBEDW1"
ARC-Seal: i=1; a=rsa-sha256; t=1750823160; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SxgIk3rNesF+VT3ANrKOYQVcHB6GdzuvMJm8LKkAqWEG+kysVzYb2uX+Bns2v7pKQkT7h6bAtIIW1Gv1LlEylxVymStKXEgHvr3CeMleGXNZhBAvodHkPKt1jlkg4BvDQWz4c3XYVvl3m27O/cYht8GfFBy3YS1PKsUg297pa3E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750823160; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=ii6MZGaxwb6IrMVVKimbpmLTzLiEx/wxtaVIu22b0vY=; 
	b=AiMbbnvfpeoZxck9CF5lEhBydYg7qOEItPKc4k95xwkBclZHPejfjAXKg24r3NWLt00YjEvYPbhL1pBlQFsorr7qoVQzuhyudbuLkWZIWegmW8Guhd4zTn4u1pAVYfzT3O8PwnIjhJBMtn3B50WFJUL73yYhgd8tiNZCUO1Krgo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750823160;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=ii6MZGaxwb6IrMVVKimbpmLTzLiEx/wxtaVIu22b0vY=;
	b=qDcBEDW1j4MZj2qr7bPmpOvzQsfls0mfqIQpsI5vSpYaHa11ImPF+83hGK56MhYq
	sD1t75k59O40LF6KPbFkNiGbnB3xdSoYulyf9EbtbCWDdojChtP3IwMGU122hfm9n4m
	NwLFuq3AN4jgfGZB0U7jp3DGSPRnkKsLsL+ERQac=
Received: by mx.zohomail.com with SMTPS id 1750823157820711.4896522018595;
	Tue, 24 Jun 2025 20:45:57 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] x86/smpboot: tidy sched-topology and drop useless SMT level
Date: Wed, 25 Jun 2025 11:45:48 +0800
Message-ID: <20250625034552.42365-1-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

This two–patch series cleans up sched-domain topology handling and
eliminates hundreds of pointless attach/destroy cycles for large
machines when SMT is not available.

Patch 1 (from Thomas, unchanged) gets rid of the #ifdef maze in
build_sched_topology() by statically initialising the topology array.

Patch 2 (mine) is a follow-up that simply memmoves the array when
cpu_smt_num_threads <= 1, so the SMT level never gets created and
immediately torn down again.

Tested on Qemu.

changelog:
v2: fix wording issue as suggested by Thomas [1]
v3: remove pointless memset and adjust PKG index accordingly, as
    suggested by Thomas [2], and refine some other wording issues.

[1]: https://lore.kernel.org/all/87msa2r018.ffs@tglx/
[2]: https://lore.kernel.org/all/875xglntx1.ffs@tglx/

Li Chen (1):
  x86/smpboot: avoid SMT domain attach/destroy if SMT is not enabled

Thomas Gleixner (1):
  x86/smpboot: Decrapify build_sched_topology()

 arch/x86/kernel/smpboot.c | 59 +++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 27 deletions(-)

-- 
2.49.0

