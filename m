Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C799C148
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 02:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748658931; cv=none; b=gUnYoKna5294JD4Yr2h1ciqPZZfhgQHdXdr3/YlnaFUIHWWQlpRF4mZRHb0R9uShPTvhnqp8s9aNQAoXvdY20+qFHbp/QHq/AirkvUNJpVgJe5w9nYEn+Nn1mo+oVbh1w3kObVqTFFGaS6d0KpeA711ImRGFV6FjxqGunATo4nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748658931; c=relaxed/simple;
	bh=fEFh6qMs3PDPwgQuBcPKSPmvXa44/VszgzP11i1a5uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7FzppVyDdS1Nzp2LQYALkxEh6Jk7qzGdIpyVdfjq3NZayaZ0vqYtxuRwNwNujuVwwqLWXU7uem6delF2E5bdHjra81LHWUWEFbSH4qFROt01c5fOoIdVm7P0fGa+nGAwOen+i18+c/kdc6HoIMzxpXzlztYzI+7VjCd3AlmeGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1VGOrbMt; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1VGOrbMt"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2351ffb669cso19486015ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748658928; x=1749263728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eE5K0L5UOR+5JNlQQlydEE5dD8CmoS7RK8fJs2wf7f4=;
        b=1VGOrbMtJwPbbgVUHtQyzHBnh2kpPLWEBu2EidXFwVqvL5vkYqd1yNXqQvYkxVr2FJ
         D3jK7dkyqiRYDNV9wvFG9+Gxol+Wbt48fio36+AZgo6Uw4amAjrK2jmP/tNGk71JAjZ2
         uLo40Es7I7NXZ5yrCvJtKMCeq1dvMqG8MP7i3E8id74B5zCR1GcxcgAjw/oel+iwn04C
         vqIl9fQeV+aa4gl0Gn/z+YZWhH/0y+ylOsMp9cgPnoewW2r9/LjvegBy1kJ4TE9nxnrZ
         9pMlRlQgJKsznlCoC+aHD/RN2FPBrPN8DwRwHKh939q7Vlqa+vRorSq/w5WHjOAe2Jy8
         7Kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748658928; x=1749263728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eE5K0L5UOR+5JNlQQlydEE5dD8CmoS7RK8fJs2wf7f4=;
        b=qNjM9UutksXK0MuAtBo+bGZKg/hgiLQpREYwS2ApP5YVWKIvOxiOebP4NjcljwN83t
         +UstnzzjBaASFBvxrjDm8D0Wtc7InO0VjoQ7QQwqLS5Gx98SIfIAhPi5xsxNmT5EudGR
         B8plb10ojUXIOQzAsTxYDyIxaSCFjCScJ3tWLmfvdawlRveinJZ+FgJE6psKd7QGPpvR
         LllP2FcD9A3na56gOLipXMtxRjxlz4dIfnAvXmH3RUFBvOulDgBtsOIs8Qad8lNpT13W
         WF0Dhgxfg0F3M8VCCA0m0vnRvkaKRC7HV9TUI8rGDnJzOHoz4GRAiomuweuV6bBVn9kH
         Opow==
X-Gm-Message-State: AOJu0YxomNVkeIZxq/pP2f9zpjt+EgAAEwXE2d7EA8fm71RjHEfdi+Y0
	O+oI4h5RWqVucF/UOFUr8CwC3aJ50TRyHHOZbjTOJQ7Hug5nuTYV55jQCs0rZpGuVF8=
X-Gm-Gg: ASbGncsJ41ZjzF7F7P4GP2WHeNtxlqkZmboK1Mwne6xW4K6VR93CFwY7JU9ADm0i365
	nzshmcu01++SVJ4mzeCIMeixMxEe+2aYaMTpaZAR0IAH7Cvy7+cB3Ldfb+DRT68ndsNTiQbRxU0
	/AVyY7S5rt3Osuy3c+60LC4nPKbuPUHK/92MfkIBpvsMJ/3E1rUh2cxmmU1sx7k4LE+kBpPJ2F5
	T54hax/5fCs3e37nM2v7KlJ4CGnF22QR6NC0o655rFqVCt6MVrYFV997WfUhWPXBR1+lRCSqUOs
	RMWlb05f5YY1L2OAMsw51Ie48C0DmUEdojpcLa/NBbUcuXzUglPISr2+9cDfzUM=
X-Google-Smtp-Source: AGHT+IGW8UsS10oKPpjE1xfc7ciibqabZN7gXwU4acZF+4/I7AVDG1ffygZZnG/vME8UIUnKm+s1oQ==
X-Received: by 2002:a17:903:41d0:b0:234:f182:a734 with SMTP id d9443c01a7336-2355f74fdeamr6962905ad.31.1748658928518;
        Fri, 30 May 2025 19:35:28 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb049e4sm2146976a12.6.2025.05.30.19.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 19:35:28 -0700 (PDT)
Date: Fri, 30 May 2025 19:35:26 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 1/1] riscv: fix runtime constant support for nommu
 kernels
Message-ID: <aDpq7kqJUyAjad9F@ghost>
References: <20250530211422.784415-1-cmirabil@redhat.com>
 <20250530211422.784415-2-cmirabil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530211422.784415-2-cmirabil@redhat.com>

On Fri, May 30, 2025 at 05:14:22PM -0400, Charles Mirabile wrote:
> the `__runtime_fixup_32` function does not handle the case where `val` is
> zero correctly (as might occur when patching a nommu kernel and referring
> to a physical address below the 4GiB boundary whose upper 32 bits are all
> zero) because nothing in the existing logic prevents the code from taking
> the `else` branch of both nop-checks and emitting two `nop` instructions.
> 
> This leaves random garbage in the register that is supposed to receive the
> upper 32 bits of the pointer instead of zero that when combined with the
> value for the lower 32 bits yields an invalid pointer and causes a kernel
> panic when that pointer is eventually accessed.
> 
> The author clearly considered the fact that if the `lui` is converted into
> a `nop` that the second instruction needs to be adjusted to become an `li`
> instead of an `addi`, hence introducing the `addi_insn_mask` variable, but
> didn't follow that logic through fully to the case where the `else` branch
> executes. To fix it just adjust the logic to ensure that the second `else`
> branch is not taken if the first instruction will be patched to a `nop`.

You have an accurate assesment here, I missed the zero case :/.
Thank you for fixing the issue!

> 
> Fixes: a44fb5722199 ("riscv: Add runtime constant support")
> 
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> ---
>  arch/riscv/include/asm/runtime-const.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index 451fd76b8811..d766e2b9e6df 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -206,7 +206,7 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
>  		addi_insn_mask &= 0x07fff;
>  	}
>  
> -	if (lower_immediate & 0x00000fff) {
> +	if (lower_immediate & 0x00000fff || lui_insn == RISCV_INSN_NOP4) {

This comment is borderline too nitpicky so feel free to dismiss it :).
It's slightly wasteful to have this check right after the if-statement
that sets it. I am not sure what the most readable way of doing this is
though. What would you think about a patch like the following instead?

From 1c56536c1e338735140c9090f06da49a3d245a61 Mon Sep 17 00:00:00 2001
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 30 May 2025 19:25:13 -0700
Subject: [PATCH] alternate fix

---
 arch/riscv/include/asm/runtime-const.h | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index 451fd76b8811..085a0bb26fbb 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -179,12 +179,9 @@ static inline void __runtime_fixup_caches(void *where, unsigned int insns)
 static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, unsigned int val)
 {
 	unsigned int lower_immediate, upper_immediate;
-	u32 lui_insn, addi_insn, addi_insn_mask;
+	u32 lui_insn, addi_insn;
 	__le32 lui_res, addi_res;
 
-	/* Mask out upper 12 bit of addi */
-	addi_insn_mask = 0x000fffff;
-
 	lui_insn = (u32)le16_to_cpu(lui_parcel[0]) | (u32)le16_to_cpu(lui_parcel[1]) << 16;
 	addi_insn = (u32)le16_to_cpu(addi_parcel[0]) | (u32)le16_to_cpu(addi_parcel[1]) << 16;
 
@@ -195,6 +192,15 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
 		/* replace upper 20 bits of lui with upper immediate */
 		lui_insn &= 0x00000fff;
 		lui_insn |= upper_immediate & 0xfffff000;
+
+		if (lower_immediate & 0x00000fff) {
+			/* replace upper 12 bits of addi with lower 12 bits of val */
+			addi_insn &= 0x000fffff;
+			addi_insn |= (lower_immediate & 0x00000fff) << 20;
+		} else {
+			/* replace addi with nop if lower_immediate is empty */
+			addi_insn = RISCV_INSN_NOP4;
+		}
 	} else {
 		/* replace lui with nop if immediate is small enough to fit in addi */
 		lui_insn = RISCV_INSN_NOP4;
@@ -203,16 +209,9 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
 		 * is performed by adding with the x0 register. Setting rs to
 		 * zero with the following mask will accomplish this goal.
 		 */
-		addi_insn_mask &= 0x07fff;
-	}
-
-	if (lower_immediate & 0x00000fff) {
+		addi_insn &= 0x07fff;
 		/* replace upper 12 bits of addi with lower 12 bits of val */
-		addi_insn &= addi_insn_mask;
 		addi_insn |= (lower_immediate & 0x00000fff) << 20;
-	} else {
-		/* replace addi with nop if lower_immediate is empty */
-		addi_insn = RISCV_INSN_NOP4;
 	}
 
 	addi_res = cpu_to_le32(addi_insn);
-- 
2.43.0

Let me know what you think!

- Charlie

