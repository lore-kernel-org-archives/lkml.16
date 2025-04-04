Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55E8DF49
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743775593; cv=none; b=eDRupQSARZiZmpqU4laP64eyL0GRsNB0dvd35wiuy6ghHOhCw1VqfCPSeX6gb9fF3KLGzrFOvQIOble+GQBE0YjVdTgdBAAHAqEa2McCI2nRC/kcZikH9vpPuq9b4iLUWknTXeJLYqx4I43zK4VSd28vXKqWEWsIRbDb3cEZO+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743775593; c=relaxed/simple;
	bh=JyDnJY+N68sge+TbE3UTVYvPbabXDdfT/oQQfOV6Reo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PMm3j74Aw2lOYAghXKVSNL2DqaSOmibipqU3rUXV+xzE3FGZvlWyGkmxnXpDYQp8FTyqjpres2fEAeyk4iKILzMq6nivit9lxCq/tR2r4qVIBIlMx1jJRdaNaVcYqKC9zmpr+bkqDCiBI/G7TBB3oAW/+31PfVS4phL2Zua7ye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBwVz0lB; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBwVz0lB"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f74b78df93so26757527b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743775591; x=1744380391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVPeT41m1KuMRdsIoLoOHCLOtV0jlGQpXGJq8x0yjEE=;
        b=DBwVz0lBDYL3vEf+18KshpeyD/hm0scQJDs+/DISeelagpZZIegWKLPCd1072GYfz9
         3gwZOiF8Cw9SP0I4ZMXlfJG/kJ20JKY4+Nq9KG2gS1zRBOZvY7x2CXF2emzkXYexDYtI
         7/ZszcLqa0lrHYMw0Haje9Z3Lk2YMD4fUPTTE3uJxFg76buP8xUDVSazKTN9caKGxV2s
         yPUi4HEAtYEx5taXB5bP6argODxS2cIJuJiRLB2z63Li3XUG56pr59tnJZsBOcORw+pV
         rVlBge/yGTeuEdBJFF7Fc7MFLVCbPtc3iJQRaMlCMHLk0R8D8A+QuMSeoEtlkEy7e5Af
         5LZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743775591; x=1744380391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVPeT41m1KuMRdsIoLoOHCLOtV0jlGQpXGJq8x0yjEE=;
        b=WAQEYGanfkMtaNGfJE94rzFCmLJuB9x/WVmrVEg4/OQdEPUZ5OzYIYaFU9xglTOux3
         dOA0bIoLJdRETSYCUlbatrjWKqXM195ktEkQSOBRMm8W53WLvXimS6o5KkcO1T07y4Zr
         k14q+UdO0Xcmn4zj5TG0vlQgzjjYlh/8aR+Imjm6SF5API+cAuhUvx5ebZ59F3nIZz/R
         kLti8nVIMiZrvVZfQ7J56aSgXKjsV+6SILm3HPesdJUWhzS7VscRI6+TSJPH1NLkC4HK
         TdGIbDOboUFtYyyFDWwL380m2ej7mLpoWlB6uWJtOqrYB8kLttuVvkKecCRH50TvqW31
         bOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5pDmTloUYrS8GXU+rTvvxLp4aum8OLwBqRdMZ4aoBBdueDn5DVoCzPc3XJQ/uZBDKhzyKzMK//OUV84w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF8YAZGybSvL5bMrnjtio7IlBABK86rSCOx47TclEormsebziP
	GWd0OOb4s0faejx/+iU1+gXreBDXWfvpawNxvuMnU0+DW6r2+Lwx
X-Gm-Gg: ASbGncv2PHv+/3VkVaeRxBs2gcs/n04mEGTB5BEXgE5JGzXVlBKBmoSLszSykeTDPga
	dzU2kp8Xn9EGY9oMwnFUakAcYNB7QLoOnR6ocwpiKaNZ+wFP8hyZA2klViZ5hpPbcXV4hFLKdmj
	lBjVteub8nMVw/4w12PaRYfrPgUtYPWUzYFPjQ8o9yVu8pboJgbsxn/O62ewU8Wy5/sWkfG5U20
	YF+hwd32moJwTlsMZtNg7PVuJCpFZrdlHFL6afHN+/Sp8cZ0ytzl+ja5wypFr1v/3EmAPtHP5uy
	f2Z6UyOHjBROXmXylfADksjKfj6mQzDjNASTvHi4z7w=
X-Google-Smtp-Source: AGHT+IFTPK6rSJQPLB/U5XR9Q42/3BNUrnaUbEW+Xhyn205mNhyBTj0MML9/4VQC2BCXkVKGjmoR4g==
X-Received: by 2002:a05:690c:6a02:b0:6fe:c040:8eda with SMTP id 00721157ae682-703e3108a3cmr44544107b3.4.1743775590442;
        Fri, 04 Apr 2025 07:06:30 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:8::])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e6e0c8b7c95sm819927276.12.2025.04.04.07.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:06:29 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	cerasuolodomenico@gmail.com,
	sjenning@redhat.com,
	ddstreet@ieee.org,
	vitaly.wool@konsulko.com,
	hughd@google.com,
	corbet@lwn.net,
	konrad.wilk@oracle.com,
	rppt@kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	david@ixit.cz,
	Minchan Kim <minchan@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH 0/2] minimize swapping on zswap store failure
Date: Fri,  4 Apr 2025 07:06:27 -0700
Message-ID: <20250404140628.2049848-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <fqj732chhrffec5hrvg5f7i5hqidgpdetldolyubj25jczq7ec@wj4bwu7psbwh>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 4 Apr 2025 10:46:22 +0900 Sergey Senozhatsky <senozhatsky@chromium.org> wrote:

> On (25/04/03 13:38), Nhat Pham wrote:
> > > Ultimately the goal is to prevent an incompressible page from hoarding the
> > > compression algorithm on multiple reclaim attempts, but if we are spending
> > > more time by allocating new pages... maybe this isn't the correct approach :(
> > 
> > Hmmm, IIUC this problem also exists with zram, since zram allocates a
> > PAGE_SIZE sized buffer to hold the original page's content. I will
> > note though that zram seems to favor these kinds of pages for
> > writeback :) Maybe this is why...?
> 
> zram is a generic block device, it must store whatever comes in,
> compressible or incompressible.  E.g. when we have, say, ext4
> running atop of the zram device we cannot reject page stores.
> 
> And you are right, when we use zram for swap, there is some benefit
> in storing incompressible pages.  First, those pages are candidates
> for zram writeback, which achieves the goal of removing the page from
> RAM after all, we give up on the incompressible page reclamation with
> "return it back to LRU" approach.  Second, on some zram setups we do
> re-compression (with a slower and more efficient algorithm) and in
> certain number of cases what is incompressible with the primary (fast)
> algorithm is compressible with the secondary algorithm.

Hello Sergey,

Thank you for your insight, I did not know this is how zram handled
incompressible pages. In the case of this prototype, I expected to see the most
gains from storing incompressible pages in the zswap LRU when writeback was
disabled (if writeback is enabled, then we expect to see less differences with
just writing the page back).

On the note of trying a second compression algorithm -- do you know how much
of the initially incompressible pages get compressed later? I can certainly
imagine that trying different compression algorithms makes a difference, I am
wondering if zswap should attempt this as well, or if it is not worth spending
even more CPU trying to re-comprses the page.

Thank you again for your response! Have a great day : -)
Joshua

Sent using hkml (https://github.com/sjp38/hackermail)

