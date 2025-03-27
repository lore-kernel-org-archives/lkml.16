Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1991D215766
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080755; cv=none; b=UZvRsn+bV6Oaq/tCvIxisS6IA3AgHh13Xh+mriP4oNbnjjbTO37N85ddf5NNIEkc0prycxGQWhuCo64GdHTZzclPuLU37rpGELFzxAIGhYVrPps8zuhKB2SVeu5ru3J2vMqHv/YPQQY5FPQQs0CoNve8QEC37PXxq/gbkLzTCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080755; c=relaxed/simple;
	bh=xo9Tf/CEwwwbTcuWbyTRI9VadGtGeNSr7dGgmKL5/oA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R63fi4V4j6zvejRijNlPRbNQzVhxc/flAlK9QaOCL3RigzUoDQNIo6UlYkvuGDRPdaOyUdDP5Eoblf0AWsZB51sjeXlSu0cM89nIG2kWZ+4Ea4nQAJK+Bm8nvqZQNs28b8MVk5dO9S1qRsq8GklxI84B0jEfPcBnKUspuNh2tO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k33++B0Y; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k33++B0Y"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499bd3084aso889334e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743080752; x=1743685552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JGH+RDQqvizTR7M2TT7xmX5Ot4Go2YXyV6Szdxe1HRI=;
        b=k33++B0Y5TbAMg+r6qdg4hlLDVjC2S1aY7uXBZHvZtOgHjHSHKbrzfflo/2vTjY+g1
         SoBcZRb5pPmzMbfp85Tso0EXAqk0l5U0KpVHR0Dlh5olxWq8V8zaGeT1ZG+MripbpqLc
         IuwsRu/WfDdym25g+lE2X6KBXk8HSHUvdS+hhWz9uh/J2o3V2zM3Fko7hWj2N4CQdG70
         dHHcr0ylBhcD87Zsl9m4lLevE+Nfx3HbjKdh1kYcbvIbWSIL1gnB61wh4xIwTNokjFPs
         aotnw1Rz5m2OrUpoYS4Gjz0Jd9a3bzK4GRwhPEZ7LMTU/YuSwofZkYyfHy0c9PDlncAn
         KKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080752; x=1743685552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGH+RDQqvizTR7M2TT7xmX5Ot4Go2YXyV6Szdxe1HRI=;
        b=Ol1/xg1BYO+ilsUemcxGPKweyqrO9aC3G7iqS98UoNUDaMFercBCN7Z4gK1ASlJi+5
         PMqKJzYB1JStTUo0pK5ewxDYUP8P17ZXh47Jev2l0Q3gJJ0QHEY2o30syq9zkgyxJJil
         hFIC1nTFcBxs6dVvujoM3QOOGFhA9IrScnjTPXZA+pbQKolmOV+NfZdCwcfVrUEFsJBf
         +W3s4QKghYG/6gUR6gTaetM/xDpJvCEiQ4Os/tRyfQblq6UlP5OROdOB2FnRuaQTjD3q
         487d2FiPMyVZ4iJs/mEipq7SfwHCz0j+Pp52RTDyCOrfcaThFmpP2OCy3LATeKR8Fplk
         RHrg==
X-Forwarded-Encrypted: i=1; AJvYcCW2pOXI6UNkluqBdGMlpbc4fo6Opjk2ruCkBUxd/hS0qIx6FL8A/fMRuJg87qCP4E5ndZfibATzE/pMsuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMQPK4m2TStR0lKvdVRckcCmG5PGV6OFR2o15HEe21g3lx1Jte
	YKP11swtYcDC3FCaktHohpJjiEVzKJrUn1f8bldFX8Ooe1kVaC59
X-Gm-Gg: ASbGncv8CVcVY8BVcLN97l9HXIqXIex6B4k1ELsXLBQQOX6Okhj9VVzv0r2YMrwyXSe
	TsM27b7XlGR+/VKJ9rb2g6YxCPawbZlQaM36/+KUdB5heu8XahCDLFQ8NBX+ivlHOPQq7CdfX2A
	gifm1cmbICn95njkk0xOGNIPiRSTxwhUCXchWkwLRF25FHwN4CeLZJCFBa/9DuEriOSV8AWufx3
	GJwxThkPT6Q6YU5+uKd1l442Nk3Wslxj/LwmdNSUXujCWA9hh7H0Vj8/8yXI170E4ijWYsn6eoI
	EKkoDjK5LvzOxhom1MXLKH6pJiQVHH3DTZGYUjXNP5JOjU5xjA2JnKXiQEmy6pcb+MeXaCD1a5/
	f7iYltv/tew==
X-Google-Smtp-Source: AGHT+IF1ll9cFaCAoJWAxGR51kEPmHYKRptVRMXGOLv6BMKpLV+455ArQUeHscuizCmY6sFulZkafQ==
X-Received: by 2002:a05:6512:3512:b0:545:2d80:a47d with SMTP id 2adb3069b0e04-54b01263b2amr1059877e87.44.1743080751766;
        Thu, 27 Mar 2025 06:05:51 -0700 (PDT)
Received: from pc636 (host-90-233-221-122.mobileonline.telia.com. [90.233.221.122])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64689eesm2075567e87.24.2025.03.27.06.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:05:51 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 27 Mar 2025 14:05:48 +0100
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/11] mm/vmalloc: Warn on improper use of
 vunmap_range()
Message-ID: <Z-VNLBWc_LThvu9k@pc636>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-8-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-8-ryan.roberts@arm.com>

On Tue, Mar 04, 2025 at 03:04:37PM +0000, Ryan Roberts wrote:
> A call to vmalloc_huge() may cause memory blocks to be mapped at pmd or
> pud level. But it is possible to subsequently call vunmap_range() on a
> sub-range of the mapped memory, which partially overlaps a pmd or pud.
> In this case, vmalloc unmaps the entire pmd or pud so that the
> no-overlapping portion is also unmapped. Clearly that would have a bad
> outcome, but it's not something that any callers do today as far as I
> can tell. So I guess it's just expected that callers will not do this.
> 
> However, it would be useful to know if this happened in future; let's
> add a warning to cover the eventuality.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/vmalloc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a6e7acebe9ad..fcdf67d5177a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -374,8 +374,10 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  		if (cleared || pmd_bad(*pmd))
>  			*mask |= PGTBL_PMD_MODIFIED;
>  
> -		if (cleared)
> +		if (cleared) {
> +			WARN_ON(next - addr < PMD_SIZE);
>  			continue;
> +		}
>  		if (pmd_none_or_clear_bad(pmd))
>  			continue;
>  		vunmap_pte_range(pmd, addr, next, mask);
> @@ -399,8 +401,10 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>  		if (cleared || pud_bad(*pud))
>  			*mask |= PGTBL_PUD_MODIFIED;
>  
> -		if (cleared)
> +		if (cleared) {
> +			WARN_ON(next - addr < PUD_SIZE);
>  			continue;
> +		}
>  		if (pud_none_or_clear_bad(pud))
>  			continue;
>  		vunmap_pmd_range(pud, addr, next, mask);
> -- 
> 2.43.0
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
