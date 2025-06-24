Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08A622A4EF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755399; cv=pass; b=aceOYIznMntnRddHgzEumfV9wW0hDZsrFe9JyReXPehX5PATS6NYmo/4+yCl3pfdnnh03/wyF9rYOa8UKuHQU9TMDnl9zLSe/CDPusKg0Abyo0BXWFTevmfzKflg/E1pK/dnx/4uBwrspEpN50IhZJQeyWGy5qOumOsfWEpnVf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755399; c=relaxed/simple;
	bh=kSCl7QeK1L2a8fJ5ZoKel+uIBj2aj/3Sf/bf0yuRH4U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R2iLxBjyBhZiEqfRx9L1P8PClLFQx8+leM68QE435UdUS0b2/tf+wS05SKFP9vi8SmfdIrgvNCtiem2WIfrRbZ0qo4bRRGF0Cggm1rbRJhBwdYo5fiKXQPmQSD7HEZjDaDH348lwcypLbvMr88uwdgsuHuMYyiEhKRcBGw5esRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=f4oZIdoX; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="f4oZIdoX"
ARC-Seal: i=1; a=rsa-sha256; t=1750755367; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ax53ODDqWCSGSKMhheTPhHwsO41aJ57aJ0FB2Aj03sdDooC83FGU+7gqnZ2Go3XaEBycfs6MYewORffq5TUW8aFtH3aOgIQU1Owig4sCwUwL38No+y2oq0Gdg7W+eG1W0OTFq0TBw8tmqdzc6oaJCRZWp+ku3d4V9KVnYrHsqHs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750755367; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=p5TzAafxISH7+WaqSel0lg4ho/xYSl99LzUIXwwdNy4=; 
	b=ZmFr9osQkv9HTJREGLVyuvR0zyp1QO+l4n/Hf3mgf6YGb+3mKWs5xBL9qTaAL+1Lc7qVD8mxN9fh+VGrM1A3A2RM/SsRXVrQJ+R5/6goq7uHMy11kSGgrMq6sh6aGbF3EKznGTn5EAIMl1iEpkOw0U9Z6JEmdJxZQ9vPNPkF27E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750755367;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=p5TzAafxISH7+WaqSel0lg4ho/xYSl99LzUIXwwdNy4=;
	b=f4oZIdoXnVHT6CfTUXaRh/vgpnUiVCvJ5w3E/tAnrQiVXdV8bpnNjhR8DFpAhs41
	bU8+uHpkbjv+PqajaQatyNYBgqAcnEbAWW8B5JuiulFlwezfKxhkqysRfm1cEEZVRSC
	ZXXBjVHNWb0zsYGhfWi3q/xdfnJHwx7mMXoKfrLA=
Received: by mx.zohomail.com with SMTPS id 1750755364524206.0145847636844;
	Tue, 24 Jun 2025 01:56:04 -0700 (PDT)
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
Subject: [PATCH V2 0/2] x86/smpboot: tidy sched-topology and drop useless SMT level
Date: Tue, 24 Jun 2025 16:55:55 +0800
Message-ID: <20250624085559.69436-1-me@linux.beauty>
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
eliminates hundreds of pointless attach/destroy cycles when SMT is
not available.

Patch 1  (from Thomas, unchanged) gets rid of the #ifdef maze in
build_sched_topology() by statically initialising the topology array.

Patch 2  (mine) is a follow-up that simply memmoves the array when
cpu_smt_num_threads <= 1, so the SMT level never gets created and
immediately torn down again.

Tested on Qemu.

changelog:
v2: fix wording issue as suggested by Thomas [1]

[1]: https://www.spinics.net/lists/kernel/msg5732082.html

Li Chen (1):
  x86/smpboot: avoid SMT domain attach/destroy if SMT is not enabled

Thomas Gleixner (1):
  x86/smpboot: Decrapify build_sched_topology()

 arch/x86/kernel/smpboot.c | 59 +++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 27 deletions(-)

-- 
2.49.0

