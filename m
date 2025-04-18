Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232B886328
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996325; cv=none; b=Wqnbn3K75czmcQ7z4NpIjmmmVon3WlBaBgks5VFfDRGFTBoRE/g482SguZYrX3K1is7Ixxm0a7WKGfa5jlwFDVKqeeDF2W0F7sWfcihHygBZNIaepL3YFwfbh+fV/2nvDF/cqClEClOqTp89xPZixvntvT5t1Hg68byMifHyfTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996325; c=relaxed/simple;
	bh=Je40Jxt/K3+Rdd49VsOjYfKZKXbD8VrWEtBBXIFF9p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kd53d/c9Iuy5MATd8SkhIBXpdhYHznGDdGxN720iAXpxJruVUtXM2TBSOFF/OmvWB9daq3OFxB0SQZwWdHj3FM2YCOU9ysg/jDQea3r9YPm/sWKlghePgNgdvpoIaFgpnkS2im0kHgC16YDUa5KJByOgbQmdSy1HrumF9xyyMAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jipJKEXC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jipJKEXC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-223f4c06e9fso19899295ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744996323; x=1745601123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nNA/SBMGz5nzByA9wBccTGH5/3WLOHOzBct3Skuv3xA=;
        b=jipJKEXCdPyPGoyM89z0XqRhByU/K8bUZ7u2HQQJMN+/iykYCCdrnw203TMTobzrNA
         zx0JuM8cIHo1X8+d/FLdzHyn82z3aynFnlcKv911A9EmJdr8Te9R53Bk7XpOybrwPEvw
         ZOKT+BD/Gsk8UPQ5/1qfbAan2ow06Qgj+x57X9WMv7OKLCBthel6TnxFQpKSNkCJNNZ+
         EtUQCJ6ZIxKFH4HgNrQLRnUoLv7Bp6OlY26PgBeCLiapn14ae4jDccnponzRpRBhpE9X
         iWPN5hY+sUv3aPJtW5hApQ1NpCvs4Ho65K77lXjQWVj7Qrle4Y3R7nIVaTwzr6SYqWtS
         cfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996323; x=1745601123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNA/SBMGz5nzByA9wBccTGH5/3WLOHOzBct3Skuv3xA=;
        b=bi+f7VYiWzWgicJeWUw1iwBgmTrUUKxYHSAmCDKkEPIZC2KiGgUvSA/gSRMuqDq9zO
         gPGnAq2Abz0sK4IovtB78jPYw/Wo1hHYWIDEfi8X96STsXRkbqdD6TxCaiDpxxz2OZb3
         hY9hUYE+3z/ekk2J/bc2WsCzlmjEpS8bF1lhqajvX4BoVL1h2JnfRjm8hMg8wmbroZhg
         cDWmMb9/cEK0XlCcmdcPTodsvHgqxhzUAUsSnIG3WANIcdXluxTXztpEIcyvrac1B1iQ
         tOZAbGubA2RqSWRTJszpweasYnmESRUp2rEzCYWx346IWO4VGQvukUSM0K88e+TODruv
         8Y7g==
X-Forwarded-Encrypted: i=1; AJvYcCURW6JhqTwReDDOLY34IUJmELCY4BF6MonTtGZF4+D45NuRD11bBIuAdp1Z9SG7b+nFdtgueZuzu5FDZik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXCP3EnNModZWtVHf0cDmznykfVJS1N6fIhrcRlG156qvyy6Nf
	IqiZJgf7Mbia2GJi35thU6l7UlMp3wzJJpjBo4LaMcBFtLzShyb9
X-Gm-Gg: ASbGnct2ojb9gMrs5XiVQOIrRW4H6MuvgR1ZHcZuV8UhYxMbTmP71t56bu4mgjb7pqy
	VIMftZGbkM7kZVHhCAtyOOoX13aFi3iRVLeN8C1W8oML7BwtqbaU7eBtn2qFMIvEmyyYJbgOtLp
	Mvd3Mz5avYEuKogzV5TLsA+yoN56RlWyMN5L0CDzi7DYy9A7HCzLt/ZQQWCpAMUAkwds8hg9DTX
	pHtInkED4CEkdBFD4MZ4c1cqt4obL0rb7eBZzLBGzrlscRWLByNe8VWl5qOT4cpx3vBKVZQzYmv
	JdYbMIKIo9Pwf+R+v/grQAhjdWn07gX+1cdJv52ABlZWGjXW5Jc=
X-Google-Smtp-Source: AGHT+IHds0YrApaxned7HLyI6jwzPBZIRFd/Zv4gqZcmfhjoAsoH/dxR0Rpg18h6eruL1zhjn94uCQ==
X-Received: by 2002:a17:902:f648:b0:223:5187:a886 with SMTP id d9443c01a7336-22c53f1056amr52473725ad.22.1744996323197;
        Fri, 18 Apr 2025 10:12:03 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4925sm19191665ad.117.2025.04.18.10.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:12:02 -0700 (PDT)
Date: Fri, 18 Apr 2025 13:11:59 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, andrew@lunn.ch, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 1/6] bitfield: Add FIELD_MODIFY() helper
Message-ID: <aAKH37xa1brIAXfs@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <20250417-field_modify-v3-1-6f7992aafcb7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-field_modify-v3-1-6f7992aafcb7@quicinc.com>

On Thu, Apr 17, 2025 at 06:47:08PM +0800, Luo Jie wrote:
> Add a helper for replacing the contents of bitfield in memory
> with the specified value.
> 
> Even though a helper xxx_replace_bits() is available, it is not
> well documented, and only reports errors at the run time, which
> will not be helpful to catch possible overflow errors due to
> incorrect parameter types used.
> 
> Add the helper FIELD_MODIFY() to the FIELD_XXX family of bitfield
> macros. It is functionally similar as xxx_replace_bits(), and in
> addition adds the compile time type checking.

This paragraph duplicates the above. I'll drop it and take this
patch to bitmap-for-next. Regarding the rest of the series - it's up
to ARM64 and Cocci maintainers if they want them or not.

Thanks for the work!

Thanks,
Yury
 
> FIELD_MODIFY(REG_FIELD_C, &reg, c) is the wrapper of the code below.
> reg &= ~REG_FIELD_C;
> reg |= FIELD_PREP(REG_FIELD_C, c);
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  include/linux/bitfield.h | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f173223..2eaefa76f759 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -8,6 +8,7 @@
>  #define _LINUX_BITFIELD_H
>  
>  #include <linux/build_bug.h>
> +#include <linux/typecheck.h>
>  #include <asm/byteorder.h>
>  
>  /*
> @@ -38,8 +39,7 @@
>   *	  FIELD_PREP(REG_FIELD_D, 0x40);
>   *
>   * Modify:
> - *  reg &= ~REG_FIELD_C;
> - *  reg |= FIELD_PREP(REG_FIELD_C, c);
> + *  FIELD_MODIFY(REG_FIELD_C, &reg, c);
>   */
>  
>  #define __bf_shf(x) (__builtin_ffsll(x) - 1)
> @@ -156,6 +156,23 @@
>  		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
>  	})
>  
> +/**
> + * FIELD_MODIFY() - modify a bitfield element
> + * @_mask: shifted mask defining the field's length and position
> + * @_reg_p: pointer to the memory that should be updated
> + * @_val: value to store in the bitfield
> + *
> + * FIELD_MODIFY() modifies the set of bits in @_reg_p specified by @_mask,
> + * by replacing them with the bitfield value passed in as @_val.
> + */
> +#define FIELD_MODIFY(_mask, _reg_p, _val)				\
> +	({								\
> +		typecheck_pointer(_reg_p);				\
> +		__BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: ");		\
> +		*(_reg_p) &= ~(_mask);							\
> +		*(_reg_p) |= (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask));	\
> +	})
> +
>  extern void __compiletime_error("value doesn't fit into mask")
>  __field_overflow(void);
>  extern void __compiletime_error("bad bitfield mask")
> 
> -- 
> 2.34.1
