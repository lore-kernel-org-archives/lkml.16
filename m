Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13796FBF
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739089329; cv=none; b=BvJxsRyS2TRJxUXTJtXBCL2ebW5GjOvucxstyknrHyjazVMq/Uiohg4wfE5sVX+adnRerK6gu2T00w6jc5twK8ufhUGcuGZwreszS9UikMg/q8krwHtl6NQ6k/PQhOLEBkFsNjzM+ArPEG0inPnO8PLSbCpyPVb3CzBIEU87q48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739089329; c=relaxed/simple;
	bh=HhBeHSpcY9SDTVrWRR6LSrmoXixbX3z6jq6oypQY9sg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivha+wJB5GB7E9Y75gt3/F2SFeLoptlXfvXLELEtbOWjvvIFSpAc8jOVWvk8khj3Kc1b2UnW9J4PrHwgx4+qt1SaZOmugKFy0fekZbjkdssjBkJgoylvtM9+hvgww4byC+49dk4wHU3BZtmGgRxWlDVcwrjU62Y0gQOracg1QYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VdP0/Opv; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VdP0/Opv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739089320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ogcucGj4+xLz0iuPEObfFGOPyaKNQT2B81j0/zmlzco=;
	b=VdP0/OpvSoMQcqoxFxlCvMZcKA+0vb64sl5KUtvrLE9J9xkd4aUz1Ih1X3rGlvceBKd+3I
	43EUaSkQhjK97UHxoBzCyAKlxrOZC4v9zoD23OV1Wauc+dM09tU2va47n3ldeF2tFxd/BJ
	Lg9h30ncJeMSZ/RbTAUOx2k5uhIFYnQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Russell King <linux@armlinux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ARM: vfp: Improve data types in vfp_estimate_div128to64()
Date: Sun,  9 Feb 2025 09:21:01 +0100
Message-ID: <20250209082101.3255-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The divisors mh and ml can both be u32 instead of u64.

Since do_div() implicitly casts the divisors from u64 to u32, changing
their data types to u32 also removes the following Coccinelle warnings
reported by do_div.cocci:

  arch/arm/vfp/vfp.h:121:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
  arch/arm/vfp/vfp.h:135:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Use upper_32_bits() to compare 32-bit numbers instead of 64-bit numbers
and to prevent the warning:

  left shift count >= width of type [-Wshift-count-overflow]

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm/vfp/vfp.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/vfp/vfp.h b/arch/arm/vfp/vfp.h
index e43a630f8a16..29073d89ef00 100644
--- a/arch/arm/vfp/vfp.h
+++ b/arch/arm/vfp/vfp.h
@@ -109,12 +109,13 @@ static inline u64 vfp_hi64multiply64(u64 n, u64 m)
 
 static inline u64 vfp_estimate_div128to64(u64 nh, u64 nl, u64 m)
 {
-	u64 mh, ml, remh, reml, termh, terml, z;
+	u64 remh, reml, termh, terml, z;
+	u32 mh, ml;
 
 	if (nh >= m)
 		return ~0ULL;
 	mh = m >> 32;
-	if (mh << 32 <= nh) {
+	if (mh <= upper_32_bits(nh)) {
 		z = 0xffffffff00000000ULL;
 	} else {
 		z = nh;
@@ -129,7 +130,7 @@ static inline u64 vfp_estimate_div128to64(u64 nh, u64 nl, u64 m)
 		add128(&remh, &reml, remh, reml, mh, ml);
 	}
 	remh = (remh << 32) | (reml >> 32);
-	if (mh << 32 <= remh) {
+	if (mh <= upper_32_bits(remh)) {
 		z |= 0xffffffff;
 	} else {
 		do_div(remh, mh);
-- 
2.48.1

