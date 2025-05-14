Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB524167F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266203; cv=none; b=RMvkGXdEag8S9j4PNBQrOM2Cx9FsTGtLdq9n0z8wclscGNwCVcQyGeq310dVDhDAh/3hG2hDD+Vxh0Gjmq2BeiU1+PIe4o4QeXEUMFlMzv7Y0quEcg73CJRBb9jO1NhlIwtQnaC6bDv9ndIsDKZVHnhVKQ0awB5e3eIFfpfrDkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266203; c=relaxed/simple;
	bh=01nWvfWOqpjLSNin0f5MozA8ay58nO5pCUzg1VWRoWA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iKzgZc2OFRz6ijZ3KCup97RS3gm3Bz7iTKLay21/1v/K+CTqr9RnewB8szFnUBjWEUfT6niNL6njU6BD7ddZlHh1R+Oz6qHkvNy1MLugP0dtyr4REAXLqKynH532FbK8M49RZiIEPtUNuyAFnmdbQcA+ab/miBr1FHsrkMc62a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lp/9Cau2; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lp/9Cau2"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b1442e039eeso156669a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747266200; x=1747871000; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ANgzEKnFmEYy3Z3vGn+Lctns6AT0DlxBzYIgk/HcKs=;
        b=Lp/9Cau2UCYtt5sD9cyrTUv+qQ2HXUCcQ/tl9au/S5dARwBut9YAVf2HKDU04WWHwn
         V1xoIOMDZomvNGBWMG1lYm7JLyBBBqGejceLXPAcjXPjd0VPqKZR/TNYlOr4Kodu9BKM
         hU096IaHUllkFn6CJUDWJpUxwOffxyQTeKujyweR2cFgEl5cjWQGc37erHihJUVPrrEx
         CTzl04OJsNrKFnhLB8xFrY57dsVvAeUviViB91Q3dZ+R+MMbIr7da2y/ApdFB0S8Lisq
         XE8KvAnxgG9bWm2mmelwd/SOybtVzrRiH35vBXTD87oCzEb7NSwXFNz0+CMUbNGoKd2n
         zhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266200; x=1747871000;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ANgzEKnFmEYy3Z3vGn+Lctns6AT0DlxBzYIgk/HcKs=;
        b=aVx0nmF2VqiToP6raO6S79/hzge1nOWjiBBz9AxC+8qeaqcD7iNi/PZ4CO7bLDL/Oz
         +mNUGpfERBHswLm49g4SgAeqOFJb+TcJeLEoH3h0eg2s/sIKUK0XbWsSDmG2vXoJDtuj
         j/akualrRP/SJi8BH7ojS46SGru1tcyrObz1SGIJhBJkM/pvq/CxjkrkV7mSxxlMDACP
         Dw6tk8yRVqc7x5LCH4g4C0RaCTcO0hfJDAI5cUNh1dXT6zFtdiLA+OkxOcfVFJHF0FfT
         gfR8+eYUlkeRSzPLq8PFhdWUUCQtEVY1jNFEoPADZFw4wh8jMCVPLdM7Mq7PVVDdZrZC
         PqOg==
X-Forwarded-Encrypted: i=1; AJvYcCXp2m5J+MOkuxLy+Ys6Yi8iUnIq6LBAZfBkOYRDNJ01cpRzOtZrKqDZyUaxoBvLBFtBTKEQRMx6MbrQtKo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2YhKB9B8sB9cAl3rFWHtmv7KUhFJ9fYtAvW1nXpbPtzIHFEXA
	TSXCmeafy6aqWkmol5QeZwklYI2LY86Lt4yt4RpJVzvrw7CNqldlEsi9IM+Ud0t/CeNg8mIystR
	0zFmAE6atNsGQAY79YZru+A==
X-Google-Smtp-Source: AGHT+IG3FjeJkDgm9Ms4EWnoaOoEWXfsjihW73xVKgzCGlB7gjrFDeuIA+VwVYTWTC4W+fpiL6H7gEsE4mtNiKz5/Q==
X-Received: from plblq11.prod.google.com ([2002:a17:903:144b:b0:231:9c86:58a1])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5cb:b0:224:1943:c5c with SMTP id d9443c01a7336-231980dae09mr76459405ad.15.1747266200421;
 Wed, 14 May 2025 16:43:20 -0700 (PDT)
Date: Wed, 14 May 2025 16:41:54 -0700
In-Reply-To: <cover.1747264138.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747264138.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <80cbdc463d3ee89b98e471e1f96f6739c903bc01.1747264138.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 15/51] KVM: selftests: Update script to map shared
 memory from guest_memfd
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
	thomas.lendacky@amd.com, usama.arif@bytedance.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

Update the private_mem_conversions_test.sh script to use the -g flag
to also test conversions when both private and shared memory are
mapped from guest_memfd.

Change-Id: I16f8f6e4e5c361bbc4daeb66f15e8165db3d98f7
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../testing/selftests/kvm/x86/private_mem_conversions_test.sh  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.sh b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.sh
index 76efa81114d2..5dda6916e071 100755
--- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.sh
+++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.sh
@@ -71,6 +71,9 @@ TEST_EXECUTABLE="$(dirname "$0")/private_mem_conversions_test"
                 $TEST_EXECUTABLE -s "$src_type" -n $num_vcpus_to_test
 		$TEST_EXECUTABLE -s "$src_type" -n $num_vcpus_to_test -m $num_memslots_to_test
 
+                $TEST_EXECUTABLE -s "$src_type" -n $num_vcpus_to_test -g
+		$TEST_EXECUTABLE -s "$src_type" -n $num_vcpus_to_test -m $num_memslots_to_test -g
+
 		{ set +x; } 2>/dev/null
 
 		echo
-- 
2.49.0.1045.g170613ef41-goog

