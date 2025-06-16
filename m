Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFB02CA6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109524; cv=none; b=TQX1Kv2IyOCALhvlxY9NkoI07VR3FzgRfSay/B5P/KZabzTU7v62xSEUdQBdTp8p1qIVjZiFDuTjcRpANYjNBMqf7EStuKJQ/aWyWai3bHAuuLFRCqmk9aasTlTgon0F0c3q7AkuxK7Riilj6DHQdma4aHdYQuenK0nyCIXdjms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109524; c=relaxed/simple;
	bh=iRkFuMxTZ0h0x2pZI1jYUc7gSmQrpxuVxvVwRlks80U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXZTpqvUKQ1jb/deNlA4BZ96srTRu/+Y5RB1Fv2eqpa/pFadUrpfBoLa16nx26gJ4/+hZS9ySI+wfdoxxxcbZj1rjTA+aQc7q2gMjiAsVYFzCFI2VoVpU3R+HEjqefg9Z0U1WvHbuTiVoJeTyWBN0ANxF0dxdjFDIPxxMtR8FLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8mCjxmZ; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8mCjxmZ"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7dc89108bfso4026780276.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750109521; x=1750714321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFlrTdSbiYtSZxGPXOVLI+cEBoyC+FpjHzAjZc+xdGM=;
        b=I8mCjxmZPniE/LWvCJ7QgWYDiCUwV/X1ac6La1yqFxDZEYSOPVO7vl5JGZnwEQjssi
         FEotytQqfe5GNnXc59+/BQdmWwifrIqpcYHzxyPYiTb1NpXCHSCJFXiJiA3/WddyEnbH
         Hf9r9oGHgK4C1BESUgYiMojlfYxz5wSk9mssDfRoHHqcO7wwmZ04yrbrP7DUFBSNwCUt
         vHjGb0GVh7hhq2PPOtDZWWg91h83kqvL+9WbcaAdCtjs9d9Rs/Msy1GFnXtg0Jc2Y8sv
         gVIw+G10V7jpXuz0ajp0Yw1zqo3L9G6a9Fc2qyWNLa4LP0N9bYpiLqnjDjx0zB3C4lec
         Lpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109521; x=1750714321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFlrTdSbiYtSZxGPXOVLI+cEBoyC+FpjHzAjZc+xdGM=;
        b=M0hkZeHS2UET984vU/JKwzgIEuNVvXN/r877mOcl+/yCoemJqovwolvBzQ1I41cAQO
         +yK2IvF6a+03sQQWJ8xrbQcfkB8qOBCLKLCS32vmUQ0xhMuvNYJnTKaI3ontIrbgDGg8
         brdzAoBmoG5Cx8Xh3IkHtkyd+czkaWETjpMnBPAR7AyIdapFZ47gfYpmdKMBWEfB2IFx
         bvhSwxigGHQ/fXKz8CzUxLJmbDNn0wzykWpRcbvE/exz0bYso07P69dXe23bw/JiBD2H
         SQqPkYjN4K0YoONgP526gs5MCF7gzadNHPyR205wVGR7uz5KKFW/IEfBPXldzGMSQAP7
         m7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvRSi7TdCE34hfR7CA61rNZAkDtS2v+uQ9zUvAN73b5jpSeB7ZcnvZuBasaJbgeLoYjlG+6AgOWFdGixs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjKvCT3NYIFBCz5Rn7jLTA06SPnxH5CI6RWvEpzNWxfubE6y4M
	ThNLLTDJGmi4y9aLZ+d2VdFMdONI5MQLVUifAT2CemqfnuVBkDGSsT76EiUefQ==
X-Gm-Gg: ASbGncvv1ChmSPzNW8KkcHZjP0NUrBvcEIxdINBRTFffLZQHbhhcEQIB09TQxlyYJtw
	hKyzdyGBzL9natd18kNFVYaB7WdkHkbBh8pk+OL5JcIzN0SBwUfcuKxPXjyHGHz2NgZ8RlLRYfr
	Mi/oOQ2jQ9NERyyn2Sk6xemp1g9QraVOUgqEvEto3MfkYsYgaQke4XeeIo5PpGgBXQnxTm9R6Z+
	I/kkZpr7rAa5fxLVhpxCgwKhUWwugBOme4bH84O1BPg5V3aZ3iyXePcAxd5nd0eVPgR1lUGSbaz
	ujJU+JLKYq9GlwgcKxuSgexqfTZNTM/ep/yuFlVBJz5ktMtwUDyRm3vLwMA7zQ==
X-Google-Smtp-Source: AGHT+IFTVBWlw9cflhlERZQFd/71VwgIhWWdB/OgezLH02B6Q4VgQCV4eFMJ0bcb9Z0GUl/V8MHJJw==
X-Received: by 2002:a05:6902:2410:b0:e7b:607b:54b7 with SMTP id 3f1490d57ef6-e822acd0934mr14652384276.24.1750109521470;
        Mon, 16 Jun 2025 14:32:01 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:13::])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e820e09fa44sm3183192276.24.2025.06.16.14.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:32:01 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	damon@lists.linux.dev,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/3] mm/damon: use alloc_migrate_target() for DAMOS_MIGRATE_{HOT,COLD}
Date: Mon, 16 Jun 2025 14:31:58 -0700
Message-ID: <20250616213159.2839382-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250616172346.67659-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 16 Jun 2025 10:23:43 -0700 SeongJae Park <sj@kernel.org> wrote:

> DAMOS_MIGRATE_{HOT,COLD} implementation resembles that for demotion, and
> hence the behavior is also similar to that.  But, since those are not
> only for demotion but general migrations, it would be better to match
> with that for move_pages() system call.  Make the implementation and the
> behavior more similar to move_pages() by not setting migration fallback
> nodes, and using alloc_migration_target() instead of
> alloc_migrate_folio().
> 
> alloc_migrate_folio() was renamed from alloc_demote_folio() and been
> non-static function, to let DAMOS_MIGRATE_{HOT,COLD} call it.  As
> alloc_migration_target() is called instead, the renaming and de-static
> changes are no more required but could only make future code readers be
> confused.  Revert the changes, too.

Hi SJ,
I hope you are doing well!

These changes all look good to me. And I agree that changing the behavior
to mimic migration as opposed to demotion might be helpful in making
opportunities for others to use DAMOS as a means to perform other related
works (like [1]), without having to use a "demotion" mechanism for simply
moving pages around.

I do have one question: I'm curious what kinds of changes callers can expect.
Would I be correct in understanding that this is mostly a semantic change
(aside from no longer having a fallback nodemask)? Just want to make sure I
have a correct understanding of your intent was.

In the meantime, feel free to add the following to the series:
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Have a great day!
Joshua

[1] https://lore.kernel.org/all/20250612181330.31236-1-bijan311@gmail.com/

Sent using hkml (https://github.com/sjp38/hackermail)
