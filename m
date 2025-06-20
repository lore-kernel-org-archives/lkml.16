Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08867283FD1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413884; cv=none; b=Gs03I7OhBj/i5jVcouOiST8injBVnmiekoqfB4YNgy0OrsjAJoi6evjURyBYCy8g4mwKQtIrsTW8mC0OTrvm9OYeB2uGHEreY4rkzkznfg4SjIZHvkTrtY/KCG505Dr6SJhYEhS4/28sQGYoqA5azeUKPpAJ423iKwrqc2ES9cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413884; c=relaxed/simple;
	bh=c6LONFfZ0yM++gULrwbPfTOzdtWv9AB/e46wpXvuVyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uTp+tkXjKmnNputE2hSQnbkoFEO+ZOTHkgH6DOFUW4kbGbzLwcsxRCyN1Hoo+BbEv3ISZU78mRYQ6o+bArHOu8qFoB+NfPA0gZ/qOT25Nyuz6At4IBeu6ckwUg6xTdvpWNep0lauX3kpMAgSGDMxLlV9nxqEhCSRrjFShGC7gDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CgLswvgZ; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CgLswvgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=60
	9TVC0hOBK6dMhgn8tSTcczNdyVWJ/RBOSw15FKE+Y=; b=CgLswvgZJ9CPhVq7O1
	ElIxKBwU3TuS9durqa2XM5A6FByXdn/DWNUajWRb5sn2DWChXTzzJ5OsqrrDIlVX
	kLU6MUwW2vViF3rut3GRnP0vl+HIvnMYbAHXRD77VxYsXKESGAXMuFqHQ4mmaLMK
	TEIGzxq1ZAinf0DWWklxfhZr8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCXf77TMVVoqyBpAQ--.37413S4;
	Fri, 20 Jun 2025 18:03:14 +0800 (CST)
From: David Wang <00107082@163.com>
To: oliver.sang@intel.com,
	urezki@gmail.com
Cc: ahuang12@lenovo.com,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	hch@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lkp@intel.com,
	mjguzik@gmail.com,
	oe-lkp@lists.linux.dev,
	harry.yoo@oracle.com,
	kent.overstreet@linux.dev,
	surenb@google.com
Subject: CONFIG_TEST_VMALLOC=y conflict/race with alloc_tag_init
Date: Fri, 20 Jun 2025 18:02:58 +0800
Message-Id: <20250620100258.595495-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202506181351.bba867dd-lkp@intel.com>
References: <202506181351.bba867dd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgCXf77TMVVoqyBpAQ--.37413S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrWUWFWUZw47uF17Zr43KFg_yoW5KFWUpa
	yfXry7Ca95J3yxCrW7K34v9ryFqw4DGw1UJF42vayF9rnIkr4UCr1DKryIqFyUXFWYya9Y
	qFs7tF4vkr1UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6HqxUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBpyqmhVMBM2swAAsJ

On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> 
> Hello,
> 
> for this change, we reported
> "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> in
> https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> 
> at that time, we made some tests with x86_64 config which runs well.
> 
> now we noticed the commit is in mainline now.

> the config still has expected diff with parent:
> 
> --- /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/7a73348e5d4715b5565a53f21c01ea7b54e46cbd/.config   2025-06-17 14:40:29.481052101 +0800
> +++ /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/2d76e79315e403aab595d4c8830b7a46c19f0f3b/.config   2025-06-17 14:41:18.448543738 +0800
> @@ -7551,7 +7551,7 @@ CONFIG_TEST_IDA=m
>  CONFIG_TEST_MISC_MINOR=m
>  # CONFIG_TEST_LKM is not set
>  CONFIG_TEST_BITOPS=m
> -CONFIG_TEST_VMALLOC=m
> +CONFIG_TEST_VMALLOC=y
>  # CONFIG_TEST_BPF is not set
>  CONFIG_FIND_BIT_BENCHMARK=m
>  # CONFIG_TEST_FIRMWARE is not set
> 
> 
> then we noticed similar random issue with x86_64 randconfig this time.
> 
> 7a73348e5d4715b5 2d76e79315e403aab595d4c8830
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :199         34%          67:200   dmesg.KASAN:null-ptr-deref_in_range[#-#]
>            :199         34%          67:200   dmesg.Kernel_panic-not_syncing:Fatal_exception
>            :199         34%          67:200   dmesg.Mem-Info
>            :199         34%          67:200   dmesg.Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
>            :199         34%          67:200   dmesg.RIP:down_read_trylock
> 
> we don't have enough knowledge to understand the relationship between code
> change and the random issues. just report what we obsverved in our tests FYI.
> 

I think this is caused by a race between vmalloc_test_init and alloc_tag_init.

vmalloc_test actually depends on alloc_tag via alloc_tag_top_users, because when
memory allocation fails show_mem() would invoke alloc_tag_top_users.

With following configuration:

CONFIG_TEST_VMALLOC=y
CONFIG_MEM_ALLOC_PROFILING=y
CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=y
CONFIG_MEM_ALLOC_PROFILING_DEBUG=y

If vmalloc_test_init starts before alloc_tag_init, show_mem() would cause
a NULL deference because alloc_tag_cttype was not init yet.

I add some debug to confirm this theory
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index d48b80f3f007..9b8e7501010f 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -133,6 +133,8 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
        struct codetag *ct;
        struct codetag_bytes n;
        unsigned int i, nr = 0;
+       pr_info("memory profiling alloc top %d: %llx\n", mem_profiling_support, (long long)alloc_tag_cttype);
+       return 0;
 
        if (can_sleep)
                codetag_lock_module_list(alloc_tag_cttype, true);
@@ -831,6 +833,7 @@ static int __init alloc_tag_init(void)
                shutdown_mem_profiling(true);
                return PTR_ERR(alloc_tag_cttype);
        }
+       pr_info("memory profiling ready %d: %llx\n", mem_profiling_support, (long long)alloc_tag_cttype);
 
        return 0;
 }

When bootup the kernel, the log shows:

$ sudo dmesg -T | grep profiling
[Fri Jun 20 17:29:35 2025] memory profiling alloc top 1: 0  <--- alloc_tag_cttype == NULL
[Fri Jun 20 17:30:24 2025] memory profiling ready 1: ffff9b1641aa06c0


vmalloc_test_init should happened after alloc_tag_init if CONFIG_TEST_VMALLOC=y,
or mem_show() should check whether alloc_tag is done initialized when calling
alloc_tag_top_users



David

