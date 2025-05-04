Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA7B81E
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 05:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746334932; cv=none; b=QmC19bFj5OYifao59ubcYQv9UXJ2fqC8OPYMmrwFqqzgQySFI1bIHk23Br5Dwj6JfswRk4HlSm8AAntm03mqaYfg8tGGBqgtlX0ijYnKW9GEsU6b0OfOOu/3l4osXdeCb0S01dqlZhL8kAaGrcMEBbdhS8dbc8yXUakgb+Fv0J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746334932; c=relaxed/simple;
	bh=SjQbC+tJ1b9wyJhrfoqKFfLSq+4LmNwZoWUE4aFgnZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCghhdNOLya8k6gcMEQDcdBbvsW4rEQQ2r65p53ss2u++Jng2NijV1ftVzJSn4I3V2N5KCLEl4ceWNSO0lyNTf2bc2a7Oj4f3Cy9x/TgntNftjJlieVP3ZXKPP2nl7mqYNkHa0QnE5w0roOgf0BIBZlnAeTzea6cQi7FZiwdU28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gfJGzLE5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gfJGzLE5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224191d92e4so36113135ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 22:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746334929; x=1746939729; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M718Xskm0sWVI0pUnIsDLY4d+0edpdIXnzfYdblyOV8=;
        b=gfJGzLE5GzsWbhcsbqUDaDigqlKfr436rJZfCjPxLzl8zmCuRNS/7DpO4jI1QXPC0x
         4Li0SWeheU+V+Upft0oyNjuii672aglDb2KgHU3aGQBdh+BoRZGIHPtEOUomSkDZ3oLv
         34iOsX5/s6E9pcpXuSSS+3PUhJBBsTh6N1exQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746334929; x=1746939729;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M718Xskm0sWVI0pUnIsDLY4d+0edpdIXnzfYdblyOV8=;
        b=nSY5IG5gdaneFLgl1bTNAYwLhwz9QF4z/Ee1hpfSyvbXRoxWhzTSN95ZM8IQdmtoB5
         ieWCLS622seMaapODgM+P5AMyVwI6HOjoq0yAq4L0ZLFXK4H/DC4sVpwkxkPSFvwZhE/
         fQl5z05aU3ArQC9HgqEPw0RvVQvFQSf/6PX6LeJlkvgK53Q6FtiQoBIBwXOgnlwLTJaY
         JYZ6kjwJOICLXPTht1wRlPBj3+5ZuUWrjh2jYPMgRu6CcA6R6Jjar+nWX0c0gHC3g5BH
         yjpybC3svWhk2YPvPBgnQAgMchKJPr/mk9Q24lcFe/1GuD+q8u3d7IZD1kU+IiZYInKx
         je3w==
X-Forwarded-Encrypted: i=1; AJvYcCUUWHB1BTP7BnglEQ3sIKJ7e2X2iem1L1cVl2LZcYC0S6qP5AduLxeL8HL1vqjjivry9Z+kYRxVIN84458=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyJf6R3Zygp/nnDbR/Y1PUuSLRhabEHJ47VRQYl1tRSTODqbgY
	oCS3ESIR2Hwc6qHlCoJ/5ARsFxWeL7YZr1GrL3bmqHIACLHJywpNk4R1oP3sIQ==
X-Gm-Gg: ASbGnct9+PWWjGxmOzlNUpi0iXi4XOH7zPff5XwqN/GXic5ve15LGHxMjjL/FBAqQWj
	yMHV17VI/rVQqzff5B9U/gGA13yqmrVxkwg96kRynGqqfMm9wNAosddBrCGeskgwqcvgCkjH7uv
	oKjxNvMERECV5lOV5XEBBAwuD8LqMwDnek9FGZlTjgB0YST/IC1VQ8+arVo9fJ7981FtLFgv+ED
	QrrWcOJbC6uBCg7xNecPWK6zXiq/ZZ/IWlGVo/EmCoryQXLInI/PI1sWyaFclwKoY4k5fn5MPmk
	weQne/w19aL9k3UkHEJGatLD345J2eWu9itNEbTOBstkLsz0L28e+/M=
X-Google-Smtp-Source: AGHT+IGlqN8rfwAt2/VAZkilZiOqbWeaE7VY4bQ9a2I2nd6xYSlC+8NMlo7AW9lAOmT7IRK18gg5Ug==
X-Received: by 2002:a17:902:d2c5:b0:223:4e54:d2c8 with SMTP id d9443c01a7336-22e1e8e638dmr50826985ad.21.1746334928990;
        Sat, 03 May 2025 22:02:08 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c979:b45c:9e0c:bf77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e079fsm32131525ad.4.2025.05.03.22.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:02:08 -0700 (PDT)
Date: Sun, 4 May 2025 14:02:04 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Igor Belousov <igor.b@beldev.am>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <myejh7ow3qwbcptyn2d2nz6td67x2noztu4bxihs5jtqw7s4pk@j2wff5ztuu6a>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <fddf0457275576c890d16921465cf473@beldev.am>
 <83CB359A-955E-48B6-B0D9-DD4F2E1146D4@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83CB359A-955E-48B6-B0D9-DD4F2E1146D4@konsulko.se>

On (25/05/03 20:46), Vitaly Wool wrote:
> > Right, and it looks like this:
> > 
> > [  762.499278]  bug_handler+0x0/0xa8
> > [  762.499433]  die_kernel_fault+0x1c4/0x36c
> > [  762.499616]  fault_from_pkey+0x0/0x98
> > [  762.499784]  do_translation_fault+0x3c/0x94
> > [  762.499969]  do_mem_abort+0x44/0x94
> > [  762.500140]  el1_abort+0x40/0x64
> > [  762.500306]  el1h_64_sync_handler+0xa4/0x120
> > [  762.500502]  el1h_64_sync+0x6c/0x70
> > [  762.500718]  __pi_memcpy_generic+0x1e4/0x22c (P)
> > [  762.500931]  zs_zpool_obj_write+0x10/0x1c
> > [  762.501117]  zpool_obj_write+0x18/0x24
> > [  762.501305]  zswap_store+0x490/0x7c4
> > [  762.501474]  swap_writepage+0x260/0x448
> > [  762.501654]  pageout+0x148/0x340
> > [  762.501816]  shrink_folio_list+0xa7c/0xf34
> > [  762.502008]  shrink_lruvec+0x6fc/0xbd0
> > [  762.502189]  shrink_node+0x52c/0x960
> > [  762.502359]  balance_pgdat+0x344/0x738
> > [  762.502537]  kswapd+0x210/0x37c
> > [  762.502691]  kthread+0x12c/0x204
> > [  762.502920]  ret_from_fork+0x10/0x20
> 
> In fact we don’t know if zsmalloc is actually supposed to work with
> 16K pages.

Hmm I think it is supposed to work, can't think of a reason why it
shouldn't.
