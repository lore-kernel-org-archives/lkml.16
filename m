Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3386E16F0FE
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748891889; cv=none; b=K+w/Rz9hT3VUYLe3w5vsJ/lOEDPC5DO/h2YXEaqc3COdlEmKqAjeLFe90E2obgu1f3VLhav8Ldb3fxg5KuCj1phqVUKjhRGSQ7OF8FvKVybmSmxgCK+HZ0ZSfTuA852W4FP73vG0qdYKnCfzrfNfgYia8brnh6r8MaNYaIVHokQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748891889; c=relaxed/simple;
	bh=12/Gd93aaTA83c1HNtC1zFmn672vDmey9gAStWrKOoY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XGRQXKIX2tWec7g//CGEVCwwvuNqBHfxor5ghSUn4TIUMX+YldZSFotOdOPJqrTAOHXVu3eSVXxipCmISJtfwqG85Ug3cRbuGRpRrI4iiHaeRKuuiZAVxV5riki1bvg4SgMsbn30LFH1RDzFZHWa1mAqdD7eBUK1BJZbLNMHMWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dboiU4Qd; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dboiU4Qd"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso2976720a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748891887; x=1749496687; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FJKFQqx9UM1AGUF2AcszFEpAtqC30YGJfsyhTo68y9A=;
        b=dboiU4QdT7Zfzlh8PXvH7/LOFhtHaGgj59D1tUUd5UyTZwJVPxp3d47REtNal67oAB
         weAk6XYREaAr7ecGKSy+rU/zAdQj2m9Z673GABEtcGYS+ROw1CRkoiE0b6FTkSybY+cL
         qiLU3rg7cXQU9UoG5zic2QuZulY+xYUEuUcGLeLK5RDc6vLatodNX0uYvadmumFVp0cM
         VIjmY6HpcvkFooFQ/Pzx683IAS/XqRIRQfk0PeqqjlTKFqpjIGwX1IrZxqxfrRCcQ8SQ
         lHCf2mTfTElyh9cWXoGI6dz+t8zSCKLsIqd3X6FShIJig2YB/5f8HxkW5oj3bdk1XXBi
         HZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748891887; x=1749496687;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJKFQqx9UM1AGUF2AcszFEpAtqC30YGJfsyhTo68y9A=;
        b=LoibNSY1iQ49pSFcnipqdYnfsLmOvndTpp//K7nosJOS4rHznNSI1Cr2cnx6F4kacL
         1YiAxhKcohtr6bhZovs7VB3uPpF4jQ401MbnYV4gM6GyVQeSPQyZjoQL3ANykaXhPhDs
         4qJjTrYFrdZNT0Bp+Ipb7KIqkw3z+f7upu4KMH8xm+xvhoVijSoEUGs62eM3MRf8Cz3j
         n/vRP/rJcHl28ATSeQYT80G+ejcMccqbOUnH4kXbwEzdp5npCTmiJLSH7mDkYfpbiBG0
         yP4/jODYpUKssdLRuV7yxPYD4OCj7dcWVbL2YENcLF6CpqSVYF8Ix3bjuzK69oKcsl6m
         G8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo0f0WjOmCHQN14VjF32HkhtDTn+0SGx0V5/JJkYVcs50ZkNSsW45bO+RsTBjeT7Xdm1GNnrtJja+lRJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHyKLbqAugIsWlqxl6KtunwCrhUEhwf6y187PfuX6WH+Z2bRkJ
	s8EtuHqIRS7kJbHh2yrI9lxMcUxE1ObyikgS1Dto4kThVfp5I4gGLb+GGTsw7h251Xpkem/flr6
	DOpikxF0i8q0zNyik2aC5jP8ZcA==
X-Google-Smtp-Source: AGHT+IGq+MKdUzduCIrTwDf5QIgX09YLMJA7ZELTYRvBBkbWv4Z283ky9bfc20mR5vbgJYZFPZLaDF55ZVFFrEdiWw==
X-Received: from pgbfe22.prod.google.com ([2002:a05:6a02:2896:b0:b2e:c47e:345a])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7484:b0:218:5954:1293 with SMTP id adf61e73a8af0-21ad97f95b5mr27557841637.34.1748891887220;
 Mon, 02 Jun 2025 12:18:07 -0700 (PDT)
Date: Mon,  2 Jun 2025 12:17:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <cover.1748890962.git.ackerleytng@google.com>
Subject: [PATCH 0/2] Use guest mem inodes instead of anonymous inodes
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, linux-fsdevel@vger.kernel.org
Cc: ackerleytng@google.com, aik@amd.com, ajones@ventanamicro.com, 
	akpm@linux-foundation.org, amoorthy@google.com, anthony.yznaga@oracle.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, bfoster@redhat.com, 
	binbin.wu@linux.intel.com, brauner@kernel.org, catalin.marinas@arm.com, 
	chao.p.peng@intel.com, chenhuacai@kernel.org, dave.hansen@intel.com, 
	david@redhat.com, dmatlack@google.com, dwmw@amazon.co.uk, 
	erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, graf@amazon.com, 
	haibo1.xu@intel.com, hch@infradead.org, hughd@google.com, ira.weiny@intel.com, 
	isaku.yamahata@intel.com, jack@suse.cz, james.morse@arm.com, 
	jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, jhubbard@nvidia.com, 
	jroedel@suse.de, jthoughton@google.com, jun.miao@intel.com, 
	kai.huang@intel.com, keirf@google.com, kent.overstreet@linux.dev, 
	kirill.shutemov@intel.com, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, maz@kernel.org, 
	mic@digikod.net, michael.roth@amd.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, pdurrant@amazon.co.uk, 
	peterx@redhat.com, pgonda@google.com, pvorel@suse.cz, qperret@google.com, 
	quic_cvanscha@quicinc.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_tsoni@quicinc.com, richard.weiyang@gmail.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, roypat@amazon.co.uk, 
	rppt@kernel.org, seanjc@google.com, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	thomas.lendacky@amd.com, vannapurve@google.com, vbabka@suse.cz, 
	viro@zeniv.linux.org.uk, vkuznets@redhat.com, wei.w.wang@intel.com, 
	will@kernel.org, willy@infradead.org, xiaoyao.li@intel.com, 
	yan.y.zhao@intel.com, yilun.xu@intel.com, yuzenghui@huawei.com, 
	zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi,

This small patch series makes guest_memfd use guest mem inodes instead
of anonymous inodes and also includes some refactoring to expose a new
function that allocates an inode and runs security checks.

This patch series will serve as a common base for some in-flight series:

* Add NUMA mempolicy support for KVM guest-memfd [1]
* New KVM ioctl to link a gmem inode to a new gmem file [2]
* Restricted mapping of guest_memfd at the host and arm64 support [3]
  aka shared/private conversion support for guest_memfd

[1] https://lore.kernel.org/all/20250408112402.181574-1-shivankg@amd.com/
[2] https://lore.kernel.org/lkml/cover.1747368092.git.afranji@google.com/
[3] https://lore.kernel.org/all/20250328153133.3504118-1-tabba@google.com/

Ackerley Tng (2):
  fs: Provide function that allocates a secure anonymous inode
  KVM: guest_memfd: Use guest mem inodes instead of anonymous inodes

 fs/anon_inodes.c           |  22 ++++--
 include/linux/fs.h         |   1 +
 include/uapi/linux/magic.h |   1 +
 mm/secretmem.c             |   9 +--
 virt/kvm/guest_memfd.c     | 134 +++++++++++++++++++++++++++++++------
 virt/kvm/kvm_main.c        |   7 +-
 virt/kvm/kvm_mm.h          |   9 ++-
 7 files changed, 143 insertions(+), 40 deletions(-)


base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
--
2.49.0.1204.g71687c7c1d-goog
