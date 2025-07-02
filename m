Received: from mail186-10.suw21.mandrillapp.com (mail186-10.suw21.mandrillapp.com [198.2.186.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B6B24679A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.2.186.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447684; cv=none; b=ezdiyPIo7yN6R/mSEEUwetmyj2jftccto67Z8bGpFamZfbxhnRLVwgRDCv1uCdId5TFht58gzGdXBLT9HGcXAVeolHJ4yTE4spSVaFPd0WOPO9bSDqTmJzOTM6DFgK/ST6L+M75C4N9GcB4R1/U0up9WriX0IPzNQwM5+rS27uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447684; c=relaxed/simple;
	bh=Si1a2Et2LYNNn6CB/OAkXf+8gYYVG6lXWvn6v9/6LJo=;
	h=From:Subject:To:Cc:Message-Id:Date:MIME-Version:Content-Type; b=ZHD+XD1Ezy0e6oMYGWV+MX6zYgvKr6h2gQ/fDgxF6EDdCR8GJQEF0HYjTSqfZ9o5HvA+WdpJPVxtKXMO9Lv//Ldff0Tv0BO3FZoMnzJEH21YTIJZ4ne1AHopvt45r9oa18Pdb/Qo3mMmO3qcxhpe7LVqoxdke14Iuy6GOLRaxSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vates.tech; spf=pass smtp.mailfrom=bounce.vates.tech; dkim=pass (2048-bit key) header.d=mandrillapp.com header.i=@mandrillapp.com header.b=rkzWfgka; dkim=pass (2048-bit key) header.d=vates.tech header.i=teddy.astie@vates.tech header.b=HmBlHp+2; arc=none smtp.client-ip=198.2.186.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vates.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.vates.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandrillapp.com header.i=@mandrillapp.com header.b="rkzWfgka";
	dkim=pass (2048-bit key) header.d=vates.tech header.i=teddy.astie@vates.tech header.b="HmBlHp+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1751447680; x=1751717680;
	bh=CRG6VfCN4cKBDNecRFO7k0i/n5pBPOpFaCLwPgkXqR4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=rkzWfgkaoU7appoEULNdDDqxjzuYPTL/tE8Y8nDNnloGtVFVw2tCHaU+psRPVHS0g
	 vV6o2CvcWreSMR9njvKYYBZ2azxOSIgE4y4BRsxKnZn1HdldabsEqxxglgN7B4hN/4
	 2SoOPv3UUXkdW7iLDMtHNDPSht1xpckx1Yy8r1/9JKB8nwfIn4PnaKFHkZpIxnAnQT
	 LMTVQBEJEZL/Q6KcqxNgjg3OVVJyef/Ey6oFJYh1Sqq++B+aOLNsAZxwHhic2UNRIR
	 oSh4AiwFUimtl0FKY2ftwQtV83x9bEHWvBiqqQdiGgGWMsLLoMpy/DzxAvAKJTgF5N
	 n39Nf5OOdq/VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1751447680; x=1751708180; i=teddy.astie@vates.tech;
	bh=CRG6VfCN4cKBDNecRFO7k0i/n5pBPOpFaCLwPgkXqR4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=HmBlHp+2s2uAfAWmGSGMiHgL93TPEJ2EhBFw6bxRmSohJmIQz5n7vm76dXLMn3DoY
	 a7jG4iTr5Lpw+oux/ESEUj/LH6XpLIkWWcCPjZABrnZWhOgXHsPlvufCAKqawJaWp4
	 KTUdB5sDy2EC7LBqW/xvb8Nvhirla7pVhTeH9vDyKYVEq+IBUpLVbkI/Dlp2CeaWvW
	 zyxgldNjWWJdDdYR1GqFdFVMFK4NHXfC5ewYvSkfguv2GtCro30n5oke1xR/lwiyO/
	 wmXPp27VtNAxiLVWEF2j7O/iGDOimUlZOeZ3aTBPoMXk3ZavIGZdqWDYNkxEU4kjOi
	 4mY8PO+W3Hlug==
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
	by mail186-10.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4bXDk80CQTz5QkPWp
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:14:40 +0000 (GMT)
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=205.15.y]=20xen:=20replace=20xen=5Fremap()=20with=20memremap()?=
Received: from [37.26.189.201] by mandrillapp.com id 10407a86fadc4c878743f9ec76bff4bb; Wed, 02 Jul 2025 09:14:39 +0000
X-Mailer: git-send-email 2.50.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1751447677873
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Boris Ostrovsky" <boris.ostrovsky@oracle.com>, "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Sasha Levin" <sashal@kernel.org>, "Jason Andryuk" <jason.andryuk@amd.com>, stable@vger.kernel.org, "kernel test robot" <lkp@intel.com>
Message-Id: <2398723b73ddd9923a9bb994364c2c7d3b89d21d.1751446695.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.10407a86fadc4c878743f9ec76bff4bb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250702:md
Date: Wed, 02 Jul 2025 09:14:39 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Juergen Gross <jgross@suse.com>

[ upstream commit 41925b105e345ebc84cedb64f59d20cb14a62613 ]

xen_remap() is used to establish mappings for frames not under direct
control of the kernel: for Xenstore and console ring pages, and for
grant pages of non-PV guests.

Today xen_remap() is defined to use ioremap() on x86 (doing uncached
mappings), and ioremap_cache() on Arm (doing cached mappings).

Uncached mappings for those use cases are bad for performance, so they
should be avoided if possible. As all use cases of xen_remap() don't
require uncached mappings (the mapped area is always physical RAM),
a mapping using the standard WB cache mode is fine.

As sparse is flagging some of the xen_remap() use cases to be not
appropriate for iomem(), as the result is not annotated with the
__iomem modifier, eliminate xen_remap() completely and replace all
use cases with memremap() specifying the MEMREMAP_WB caching mode.

xen_unmap() can be replaced with memunmap().

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Link: https://lore.kernel.org/r/20220530082634.6339-1-jgross@suse.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech> [backport to 5.15.y]
---
 arch/x86/include/asm/xen/page.h   | 3 ---
 drivers/xen/grant-table.c         | 6 +++---
 drivers/xen/xenbus/xenbus_probe.c | 3 +--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index 1a162e559753..c183b7f9efef 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -355,9 +355,6 @@ unsigned long arbitrary_virt_to_mfn(void *vaddr);
 void make_lowmem_page_readonly(void *vaddr);
 void make_lowmem_page_readwrite(void *vaddr);
 
-#define xen_remap(cookie, size) ioremap((cookie), (size))
-#define xen_unmap(cookie) iounmap((cookie))
-
 static inline bool xen_arch_need_swiotlb(struct device *dev,
 					 phys_addr_t phys,
 					 dma_addr_t dev_addr)
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 0a2d24d6ac6f..a10e0741bec5 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -743,7 +743,7 @@ int gnttab_setup_auto_xlat_frames(phys_addr_t addr)
 	if (xen_auto_xlat_grant_frames.count)
 		return -EINVAL;
 
-	vaddr = xen_remap(addr, XEN_PAGE_SIZE * max_nr_gframes);
+	vaddr = memremap(addr, XEN_PAGE_SIZE * max_nr_gframes, MEMREMAP_WB);
 	if (vaddr == NULL) {
 		pr_warn("Failed to ioremap gnttab share frames (addr=%pa)!\n",
 			&addr);
@@ -751,7 +751,7 @@ int gnttab_setup_auto_xlat_frames(phys_addr_t addr)
 	}
 	pfn = kcalloc(max_nr_gframes, sizeof(pfn[0]), GFP_KERNEL);
 	if (!pfn) {
-		xen_unmap(vaddr);
+		memunmap(vaddr);
 		return -ENOMEM;
 	}
 	for (i = 0; i < max_nr_gframes; i++)
@@ -770,7 +770,7 @@ void gnttab_free_auto_xlat_frames(void)
 	if (!xen_auto_xlat_grant_frames.count)
 		return;
 	kfree(xen_auto_xlat_grant_frames.pfn);
-	xen_unmap(xen_auto_xlat_grant_frames.vaddr);
+	memunmap(xen_auto_xlat_grant_frames.vaddr);
 
 	xen_auto_xlat_grant_frames.pfn = NULL;
 	xen_auto_xlat_grant_frames.count = 0;
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 2068f83556b7..77ca24611293 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -982,8 +982,7 @@ static int __init xenbus_init(void)
 #endif
 		xen_store_gfn = (unsigned long)v;
 		xen_store_interface =
-			xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
-				  XEN_PAGE_SIZE);
+			memremap(xen_store_gfn << XEN_PAGE_SHIFT, XEN_PAGE_SIZE, MEMREMAP_WB);
 		break;
 	default:
 		pr_warn("Xenstore state unknown\n");
-- 
2.50.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

