Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB328B4FD
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594357; cv=none; b=OHUtK+WB0jKkgv5y7Q2c2vGQTUB8ZeLQyzfFuX8gjmsw/n/LY6f9er/awICp5oqxmH14llA0Twdz86175/din2/BGLObjEDvtcMcQS4698nyXak55NzL806V7zAGrLwULKXEHOOlW697GuAprJhJlXzyZmx/CavoeUtLRP151sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594357; c=relaxed/simple;
	bh=uYJQKmJTyzVi2r0a2NAfYx9rHlYgz3eWvS+kZCor0Iw=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=VNSjer1LECSFTcQvpj7Iua1nA0dUKBM99xuEAx2Ap8T9F73UkUwUZEUPyDySm5CXllEmb/CoumUcWE6tVIEZG5V3PiboA828VWOVl1A20DmlUPhUU12OeFTT+gPWGAOHcuAbacu3HhPZGSuyj6I99FFCK2j8cSV+xKBw1Rk/HNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=ffnUG15z; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="ffnUG15z"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2c49373c15so4199448a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749594354; x=1750199154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFz6mun+uYpuugiJ+s3Ifj5c4f1eeTX2hZ/twyLOLMw=;
        b=ffnUG15zj2PQ7xISI95BhqKjRPmngjp74E7W3n8RRq6em0k8yH18yFUB2hHVFXaPjU
         +JE5ye+ugz+gZkyBFLJTTarafE7nD9/UvqQUdxp671mBqc1UsRg1WXFjSbn/JJ7Iddrd
         j0TYy2OIzqWM+YEBv9dotkbGaXjmB3dvThxiSXn6S/JIWkTZPfIiLimHY9/oqYTMfLY8
         zBwGKZu/PY5N3WhoGDUIuSa+5EwPjGvcAeoiMA7Ll3OuQX3nLGD1ikMj3VbCN21em88B
         4PDjCV8Tqnicj3qV54uPy3MI0rDwYDaZ/qFuC/uNeB0L1ps/qntikEWjvsllbJGchnd9
         wwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594354; x=1750199154;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFz6mun+uYpuugiJ+s3Ifj5c4f1eeTX2hZ/twyLOLMw=;
        b=o+SB0G2HTPHiPpKJEgH+kWg9ORlOX9+TGfi+j4r2Cg0BwbnpBjQnjdyD+5IqAvTmuS
         SvZ/3UB/zIYUlDTn9IfyZpDgSyoXf5c1iePIMUhglh47buBlgsBdaMD5QBZP2a6kVa8E
         BXBnONIu49AzYP++iG/BuGC/HB0fsXhOR2V6Behb5KFwJnZkKX11SwxbfdI23g2o6yBP
         xzJu/o2PY7Oe+o3D96I24hi+QNCG3UvlMqHdCy1MYqVtBaDkkjGCPPAHr8Tidfq1EfJg
         foss/z0f/dIMpPX3PgC3mqm9QU9PKL891nd/IPdVBfVUU+rGlct6BwP41wcdhjv3f2t2
         C2+w==
X-Gm-Message-State: AOJu0Yx5S/Mv3p76uJTb7UJYmxapdojg9Da/TuPQXb5mzgE1tjeAR0eg
	oH3ggfVE8IGCUhlkow3N6geGdXl1RwFpPMpcUYKfEnXEnSZQSVeTSkRtykfGzVwqlqzFx63jAj/
	0Z6mj
X-Gm-Gg: ASbGncuZZZLXYl8utuIrtGD8ZQVhg55Iq+WFNT+rakOebfKdAMO31oI15Gmtt6lbce+
	Xy2Uspl3DsDhxeXBGd3V5FIVIqHy1BMZvdyABFYtOpFOEzVPF4xlTS42mWrK7kwJHcW490GKHB8
	2MVtxI/QIg9N/HTA/d+gp7mRBBxOGw1exFdKJNza8gYvF5kADtsLDvtvek9XRUB+q8QGrCMdpHz
	BhCzKZPcka+PFlowATo9Y8ET0gutknzI2D68kdq/EbBd2moQOn2R+pzwaLktgFmU2jO21nGKAcb
	AFOZiECESgo7BpscWKoGWaxUX4IrtmgI4rFjnCwveNwjfzOtF2MRTCMU6i79
X-Google-Smtp-Source: AGHT+IHynsKdRvBN3oI9T3paL+PT9XlTomdzjUiaZnqBTmpFwlwV5yQgC4iGq19Rvnfsn48Yz8BXZQ==
X-Received: by 2002:a17:90b:540c:b0:311:df4b:4b93 with SMTP id 98e67ed59e1d1-313b1ea41c8mr550768a91.7.1749594353931;
        Tue, 10 Jun 2025 15:25:53 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-236034059b3sm75234975ad.175.2025.06.10.15.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:25:53 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:25:53 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 15:18:32 PDT (-0700)
Subject:     Re: [PATCH v1 1/1] riscv: fix runtime constant support for nommu kernels
In-Reply-To: <20250530211422.784415-2-cmirabil@redhat.com>
CC: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>,
  linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE), cmirabil@redhat.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cmirabil@redhat.com
Message-ID: <mhng-25801815-A406-4521-8A19-2F2B5E7AB30D@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 30 May 2025 14:14:22 PDT (-0700), cmirabil@redhat.com wrote:
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
>  		/* replace upper 12 bits of addi with lower 12 bits of val */
>  		addi_insn &= addi_insn_mask;
>  		addi_insn |= (lower_immediate & 0x00000fff) << 20;

Thanks.  This looks reasonable to me, so I've stuck it on fixes -- I'm 
still sorting out some post-merge-window cruft, so it might take a bit 
to show up for real.
