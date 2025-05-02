Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D9F1A83FB
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178309; cv=none; b=peCHf2iDWOCHFTyhfMDma8llXg4cI+YSB8SrEJKwmllbpW/08l2AKyqkWLBM2mHgf8776TE/vNA+Cjj2GcxSXAujVXDzTPEgHy7Iw0Xk5geKOxYIPIsnx4q84FDO4yAZiudFO1klERCfioYjiepNyTQlCNZ68c4Ka4LadRrVeEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178309; c=relaxed/simple;
	bh=8O4zIZ9Qzp6mbnHE5QCiNJEo51Ocv0R4T+lUPDYjNlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=twBUVDEhXh9PH/njAVv7E3Zd7WNKuEinCafmWEut3FclWd+LdVSMZhwCZI16aGdKUSvEWXWOGqOefqjhinhv3H1HkSVPcTfhjdY1g4P9LM/nYo1nnW9c1JnLovyZT4hrALqch+KFRTTtonj8kQXAn95E1psaAaKtZNBzBzIzbDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOOyUR9q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOOyUR9q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D633C4CEE4;
	Fri,  2 May 2025 09:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746178309;
	bh=8O4zIZ9Qzp6mbnHE5QCiNJEo51Ocv0R4T+lUPDYjNlk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sOOyUR9qy9yXnUUrUaJet7pvQ0Ydqwe/srOrURjzBfnMVBo9fjn7bi39tuI7sWNbs
	 0ePzM/UEm1Fc4xsSEp7RbJQfx5Z7FCDIlodvYEXgXpHoWo3ZT73TEvd1Efki36wzaG
	 5XNP/uKHhK3peXA5N7NN5TkyGwR5EPoJxrVCGkNwOI5vC1E6MOyhcLu/hpog64yV7A
	 fwRCt8YP6S1YrD/c00JorF/P8PLNzjd1eCb2BNmnqwt7pTNJ5/mrM6Ac+TCDUW/F3e
	 zcftQWJyOxTpDsxR8mEdmqfOhgdNviIJS0PX0+yPfb7ZW0N2x7+qKX+RlEQAmvBkRq
	 9YIAfSQC/aVIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3526EC3ABA3;
	Fri,  2 May 2025 09:31:49 +0000 (UTC)
From: Ignacio Moreno Gonzalez via B4 Relay <devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org>
Date: Fri, 02 May 2025 11:31:41 +0200
Subject: [PATCH] mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
 enabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>
X-B4-Tracking: v=1; b=H4sIAPyQFGgC/x2NQQqDMBBFryKz7kAMCm2vUopMk9EM1SQkqSji3
 Zt28RYPHv8fkDkJZ7g3ByReJUvwVdpLA8aRnxjFVgetdK86fcWF4o8hFzJvLAHXZfDBfSaOVOv
 g5x1lxOIiSkb29JrZouFOUWtZ3XoLdTsmHmX7/z6e5/kF78HTM4cAAAA=
X-Change-ID: 20250428-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-ce40a1de095d
To: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746178308; l=1800;
 i=Ignacio.MorenoGonzalez@kuka.com; s=20220915; h=from:subject:message-id;
 bh=fqHEYzRVTDCWtppau7rpnlBqweJIa/e1V5D0pJG1Pm8=;
 b=sORPxW2hJtjJRkgQLgAA4J9V8d632Q5Nhca5+LarntPGbh2i3oJLgDVba4c3Dnq3bRs7F2MT6
 n8GBzNgtAK9Dz0klHvfVo09O3Pi8Ku2/OtzI2vIl3lJerwPHelJQUJg
X-Developer-Key: i=Ignacio.MorenoGonzalez@kuka.com; a=ed25519;
 pk=j7nClQnc5Q1IDuT4eS/rYkcLHXzxszu2jziMcJaFdBQ=
X-Endpoint-Received: by B4 Relay for
 Ignacio.MorenoGonzalez@kuka.com/20220915 with auth_id=391
X-Original-From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
Reply-To: Ignacio.MorenoGonzalez@kuka.com

From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>

commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE") maps
the mmap option MAP_STACK to VM_NOHUGEPAGE. This is also done if
CONFIG_TRANSPARENT_HUGETABLES is not defined. But in that case, the
VM_NOHUGEPAGE does not make sense. For instance, when calling madvise()
with MADV_NOHUGEPAGE, an error is always returned.

Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
---
I discovered this issue when trying to use the tool CRIU to checkpoint
and restore a container. Our running kernel is compiled without
CONFIG_TRANSPARENT_HUGETABLES. CRIU parses the output of
/proc/<pid>/smaps and saves the "nh" flag. When trying to restore the
container, CRIU fails to restore the "nh" mappings, since madvise()
MADV_NOHUGEPAGE always returns an error because
CONFIG_TRANSPARENT_HUGETABLES is not defined.
---
 include/linux/mman.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mman.h b/include/linux/mman.h
index bce214fece16b9af3791a2baaecd6063d0481938..1e83bc0e3db670b04743f5208826e87455a05325 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -155,7 +155,9 @@ calc_vm_flag_bits(struct file *file, unsigned long flags)
 	return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
 	       _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
 	       _calc_vm_trans(flags, MAP_SYNC,	     VM_SYNC      ) |
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE)
 	       _calc_vm_trans(flags, MAP_STACK,	     VM_NOHUGEPAGE) |
+#endif
 	       arch_calc_vm_flag_bits(file, flags);
 }
 

---
base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
change-id: 20250428-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-ce40a1de095d

Best regards,
-- 
Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>


