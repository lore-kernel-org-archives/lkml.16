Received: from 10.mo581.mail-out.ovh.net (10.mo581.mail-out.ovh.net [178.33.250.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60561211C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 01:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.250.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746061909; cv=none; b=HDR1DcwyZ8uB638Q+5RJs4F6ryA6mOwifSZsFESAJ90iw5T7pXpTfIwbHLULrCuMmjONVChFW3HIMxCN+9VWBzhgXqex6/neQMCP7sAzsU9KnUhlkMUDKdozU9l03D5yBPKWZyzrpe5oE5/q4Eyuk1Ype4bi34F5NU9BCT7xxyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746061909; c=relaxed/simple;
	bh=KVl87mxGkMT3rFt2okoJ89BYbEAONsppjlmmv96ipo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MCjrK8r0gZs6/Gc8e2qtNvAU9y/JwV0ElxMAUr/pVmtJN1kobcx+QklMk0kkNzOFRs7eCkDzktu32YO6WgZTBx6adzfSNsC4EniOmi+lqaeRsqzZgRUJQKpQXsnG3VPMN/3KoVzjeikiv4NMbZ1+TvIdBwDY1lr083jGqDDA6jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=Vf9Yo0s1; arc=none smtp.client-ip=178.33.250.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="Vf9Yo0s1"
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.17.147])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4Znshh0Xw6z1MGP
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:45:24 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-bggcb (unknown [10.111.182.166])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9C97E1FE1E;
	Wed, 30 Apr 2025 22:45:23 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-5b5ff79f4f-bggcb with ESMTPSA
	id yhGnFgOoEmix+wgAhAnCLA
	(envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 30 Apr 2025 22:45:23 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S004d3d77194-a22f-47ee-abc9-6b3f4bb4fce5,
                    7FFE21389DDF989CCD6FB7268846A7FDE11993D7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: linux-kernel@vger.kernel.org
Cc: trenchboot-devel@googlegroups.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [RFC PATCH v2 8/9] x86: AMD changes for EFI stub DRTM launch support
Date: Thu,  1 May 2025 01:44:50 +0300
Message-ID: <5c4d5adaa40fc5d5d1bcfef813713040e4df13a4.1746037489.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
References: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12106801701031425260
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefheduieelieekfffgfffgfedutdevleevvdfhfffgledvgfdtuddtheefieenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=AxO8+pqA5ngI1PtQlcwGIyLcYBmP10KryNrbaqciCQI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1746053124; v=1;
 b=Vf9Yo0s1C2KgoG9AQQiXV+B9NTnATlsGzRTi6WZWPrqeZoMcGQD0Fu2Xlq+d5W/RmV90Llkf
 jtzaUah7zMT9LJQSU2/RqQY977e2hoBILMcpGOZD3Ey4Q+znbwSbUSspfx2Qanni7gzdTkFkfCg
 3RgR7Vo/2wBdVLl22m8DLQI3wILOQxY99Sc+/6NfAR/EfHE7FeoSiJODKzN9jz9WgBCo4eEuCE5
 dAu2Xf8FkjVBddfWGqA/DfM9ohy66REskpY6Q7QLI0Y3ngpeI2GktcQudQWnYLKv39tLpcuDFQ6
 5U9KqaxSKj12G6LvoC7K7dlqB5RvN3ykry4in9qFfbRqw==

From: Ross Philipson <ross.philipson@oracle.com>

* Only do the TXT setup steps if this is a TXT launch not an SKINIT one.
* Initialize boot params address for SKINIT.

Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 drivers/firmware/efi/libstub/x86-stub.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index bfa36466a79c..0453be1ba58d 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -798,15 +798,21 @@ static bool efi_secure_launch_update_boot_params(struct slr_table *slrt,
 						 struct boot_params *boot_params)
 {
 	struct slr_entry_intel_info *txt_info;
+	struct slr_entry_amd_info *skinit_info;
 	struct slr_entry_policy *policy;
 	bool updated = false;
 	int i;
 
 	txt_info = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
-	if (!txt_info)
-		return false;
+	if (txt_info)
+		txt_info->boot_params_addr = (u64)boot_params;
+
+	skinit_info = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_AMD_INFO);
+	if (skinit_info)
+		skinit_info->boot_params_addr = (u64)boot_params;
 
-	txt_info->boot_params_addr = (u64)boot_params;
+	if (!txt_info && !skinit_info)
+		return false;
 
 	policy = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_ENTRY_POLICY);
 	if (!policy)
-- 
2.49.0

