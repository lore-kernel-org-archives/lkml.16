Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DAB8C1E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746577475; cv=none; b=tlRJbJN5Rzlx/YEa1ULPtzXAoD37gOUf75BzVjAe0RfpmoDEFX50n79U7Mik/zNYLr/IdFY9YhzvSUVYmBTun3GD6nqPAbOh5h3I6FaiRSlY6VVDabtGiVtsaziJqPlRKwVY+JxcPA3ne1MEQLlnp8YfmsuGvwz2mfjCic2jp3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746577475; c=relaxed/simple;
	bh=ItTn6ZUW7IH3rzHIL1nvf1Ic5CHn7dYvyllDewHVc14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bp7/jkFqdrwktZZEWqBkKB/DpxfkqKgZZ8yHocfyjFmEc567XZXc3+d33UFDoMbOnX1EfqHrbQul1xw1pmBgyLbd+jATYj+7+8TDHen8gVQkg0cfbBonaQZWMvvP6DEojWkhs0DOQW6QONJxlCLZdHTRbPnbE3wrYTXIWeF25ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=GA5hGdzJ; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="GA5hGdzJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=Vt4x2NR9rZy0McKBk09pp7yXo99XRz0SlCyk5eqZpBI=; b=GA5hGdzJ6Oe6wu2y
	6GLarlrWVoLlNdhVlOT7/uWxOdVD0cUcX5YsCyD6ImRdYiAPgiXKwj/FIz6aQB2nFHubh4NnpLrAm
	t5f68xtgKIYW4JKyE8Hbnuzq2J8gUwRAg5f1SNCW24koqGt1hgUdYFJDPcvP/B0MN3rBSKvlZsBjU
	J49I9bP81lG6KttgJFaRfcXOT7ZU59O6nOmZaGg8dGQUU9v8F52GSb5i1jd0AOAqvt1nznnkQ9vnN
	ARoX1u4mdevxOiANkraKgtqmdu1NGd7bNwrUp+6V8E6AdMDbF3XTJu4TvO9xmgiiGtM6nS2r6ct9k
	/TwjAF3T9LPEPn910w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uCSaI-0021Kc-0h;
	Wed, 07 May 2025 00:24:26 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	kenneth.feng@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/3] drm/amd/pm/smu7: Remove unused smu7_copy_bytes_from_smc
Date: Wed,  7 May 2025 01:24:23 +0100
Message-ID: <20250507002425.93421-2-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507002425.93421-1-linux@treblig.org>
References: <20250507002425.93421-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

smu7_copy_bytes_from_smc() was added in 2016 by
commit 1ff55f465103 ("drm/amd/powerplay: implement smu7_smumgr for asics
with smu ip version 7.")

but never used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../drm/amd/pm/powerplay/smumgr/smu7_smumgr.c | 36 -------------------
 .../drm/amd/pm/powerplay/smumgr/smu7_smumgr.h |  2 --
 2 files changed, 38 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
index 5a010cd38303..baf51cd82a35 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
@@ -46,42 +46,6 @@ static int smu7_set_smc_sram_address(struct pp_hwmgr *hwmgr, uint32_t smc_addr,
 }
 
 
-int smu7_copy_bytes_from_smc(struct pp_hwmgr *hwmgr, uint32_t smc_start_address, uint32_t *dest, uint32_t byte_count, uint32_t limit)
-{
-	uint32_t data;
-	uint32_t addr;
-	uint8_t *dest_byte;
-	uint8_t i, data_byte[4] = {0};
-	uint32_t *pdata = (uint32_t *)&data_byte;
-
-	PP_ASSERT_WITH_CODE((0 == (3 & smc_start_address)), "SMC address must be 4 byte aligned.", return -EINVAL);
-	PP_ASSERT_WITH_CODE((limit > (smc_start_address + byte_count)), "SMC address is beyond the SMC RAM area.", return -EINVAL);
-
-	addr = smc_start_address;
-
-	while (byte_count >= 4) {
-		smu7_read_smc_sram_dword(hwmgr, addr, &data, limit);
-
-		*dest = PP_SMC_TO_HOST_UL(data);
-
-		dest += 1;
-		byte_count -= 4;
-		addr += 4;
-	}
-
-	if (byte_count) {
-		smu7_read_smc_sram_dword(hwmgr, addr, &data, limit);
-		*pdata = PP_SMC_TO_HOST_UL(data);
-	/* Cast dest into byte type in dest_byte.  This way, we don't overflow if the allocated memory is not 4-byte aligned. */
-		dest_byte = (uint8_t *)dest;
-		for (i = 0; i < byte_count; i++)
-			dest_byte[i] = data_byte[i];
-	}
-
-	return 0;
-}
-
-
 int smu7_copy_bytes_to_smc(struct pp_hwmgr *hwmgr, uint32_t smc_start_address,
 				const uint8_t *src, uint32_t byte_count, uint32_t limit)
 {
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.h b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.h
index e7303dc8c260..63e428ceaee4 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.h
@@ -53,8 +53,6 @@ struct smu7_smumgr {
 };
 
 
-int smu7_copy_bytes_from_smc(struct pp_hwmgr *hwmgr, uint32_t smc_start_address,
-				uint32_t *dest, uint32_t byte_count, uint32_t limit);
 int smu7_copy_bytes_to_smc(struct pp_hwmgr *hwmgr, uint32_t smc_start_address,
 			const uint8_t *src, uint32_t byte_count, uint32_t limit);
 int smu7_program_jump_on_start(struct pp_hwmgr *hwmgr);
-- 
2.49.0

