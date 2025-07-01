Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDC727991C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 22:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751409629; cv=none; b=tv9mIZ3F9EdfaDERG9tDfD4lub8NjPLRZv3gVN5SQAI0gEIbk8PsGhm/78DUQ1+k+uJlmtIuT1EKZKGqvZfdWZ/nsC/eG5fFFfVZS4RyeMp9f913p+GxhI3EUg+YkZ+TpezsYPkaSBfNGL47BvuKoqRqFPAjGNmJ44q2J+G+rmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751409629; c=relaxed/simple;
	bh=Jt42u0vTC8jOj2Y3FlPEZCAhDhKdqZfpl7n/CCGzjhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oK4+F9UxBItvGp9Xv+KKJQtLpSIQKp3xnhWlgXThSZOeUVnv5RyfHFsCJAfA7tut4RN8fEZhOLdhzVSXFLEU70n0u9l9PG3KbLKKMueznj3xCQHTD07jzMrY0IaM9dW4HZKm334dD5emuc+GZcXnmN2ZukGQ8/a5XINg8fVLCpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2CdEtFs; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2CdEtFs"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e819ebc3144so5371386276.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 15:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751409626; x=1752014426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ppPEYZhg4B0ycuUdBcvBC5LZYOf/2HD/LRvna5W+34=;
        b=J2CdEtFsHfMw3WpICdaTo69z9ERkGNvU4MIRVd6N53WTrvwkhDTyyWhq2wmKkfHYhc
         t7I34wSc78/Q2UqB9bHgI6oQ8o/8BNv1OyDrxAL22ZiPy5AY5pKpLJ1IrsFTxbm25Jic
         O9S4uUg15pmWeJem139cbRepzeJN87AdbAOIbfpGQvnC9Ux6OPZ+ZIxUzSiH3uyCvbQU
         1YaZvkHqOK+rSCpBkIXafSVVHcssPppUIG+tyZY18+J6hX/mdxJKGavrX0Rim/wBgNUO
         xgPKPBvxvmadBY8p59XYtQshZu92sSp7Mu9PPhF75cq60fpwIqc3bNOhSv2wy4puMkmI
         sbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751409626; x=1752014426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ppPEYZhg4B0ycuUdBcvBC5LZYOf/2HD/LRvna5W+34=;
        b=Np/sK5A1P3WqcJZ6O6vAy3qUknZ4Dvxo8ftYde6LQfTrmJAXlBxaLAFjrVMwjNpz+2
         XkpdNc7XLZP67pDU7ECac2yNOSjqEksn0bLESGNavrgoz13Wyhga/pCwb5oe/Tg4ArJp
         cUp6amS77bIdKWIOrl+BeH3BBpWnOuX0qx5Y8JYuOsIsKgodVO2l9VqphU060X+pZuvm
         cufVT2BU8XS4GY1Xj+6C0vbfg1QzZjka/OLQHR3WWwAebhkqD/o87PSfSktmnMZh9l8n
         sPtLukD1kfwdUKNe/Qwu5fhr6u2eryhVJC1MESwyiTimK7hB+bEqripsk/maPGwE7qt5
         TnQA==
X-Forwarded-Encrypted: i=1; AJvYcCWrVP+xe8Nl/QHLzIYV17smM5+/gvL0Ou89hxnDhn99Q889dXyZwwazuHPtNKC3YGraRPf/uEgbaydjg/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+eB9doxmDKfy96eOnJEIL+yTvdnCOvmapj/JryFKwYv28rlYU
	XT3T7lLFwTI9HmtEPI3ObrMi1N/kfI8JUNRt/xFkCU9WQ5R9FoIb6igy
X-Gm-Gg: ASbGncsgB+FPyh9xou/JIRg1vB7t2bANGsfsoZQnV4IMXUtcIaluZ4cxv2jF/ffW/76
	hwk3RUspaSqm7isp9JMjVUoGwyd4hrM1gWAa3qdojF2fl/OjlBNRKlTkGmAIJG9THH4+yz54Mtp
	KCp9UfgGwxgdqQ3BnD1Ykga3HxLVTfDMW9n1NXgRW1khxIf7RxcDMwJ2SWy0hajU97IXIZaHnrU
	HBGhdFP3g+v0hFf/pByoWRMZh/uQeRM35jdmJ525VLaQtbdyZzdbpDIj5Ei5WNTi8FsHIuwdbzD
	xYizm4I0Q0BC0ZQwyIseW6lnn/3y7IesRl5Klwae5uWx/Y5he/t7r4qO0AayF/bJEl05NAHLdPJ
	VOMg95mU=
X-Google-Smtp-Source: AGHT+IEfSExKlYBLEF5iYY85elbMldfM05dmX2YVT1MmFhly9PsAe+w+JK2QOyqbX2jckL9O0qwTbg==
X-Received: by 2002:a05:6902:f85:b0:e81:28d6:ed5 with SMTP id 3f1490d57ef6-e897e1a1c3fmr915143276.8.1751409625609;
        Tue, 01 Jul 2025 15:40:25 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:bdbc:6e11:c9be:13a3])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e87a6bf2290sm3249392276.53.2025.07.01.15.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:40:25 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: bijan311@gmail.com,
	SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Bijan Tabatabai <bijantabatab@micron.com>,
	damon@lists.linux.dev,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH 0/4] mm/damon: add DAMOS_MIGRATE_{HOT,COLD} destination nodes and weights
Date: Tue,  1 Jul 2025 17:39:37 -0500
Message-ID: <20250701224014.9008-1-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250621173131.23917-1-sj@kernel.org>
References: <20250621173131.23917-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 21 Jun 2025 10:31:27 -0700 SeongJae Park <sj@kernel.org> wrote:

> DAMOS_MIGRATE_{HOT,COLD} action can migrate pages to only single node.
> It could be useful to allow it migrates pages to multiple nodes with
> different weights.  A work for dynamic interleaving[1] is in progress.
> We also discussed this could be useful for memory tiering, e.g., when we
> want to move pages to multiple noes of same tier.
> 
> Extend the API and ABI interface for specifying the multiple destination
> nodes and their weights.
> 
> Note that this RFC is a prototype of the interface change for Bijan's
> interleaving work[1].  Hence this patch series is only implementing the
> interface part, not the real implementation of the migration behavior.
> 
> [1] https://lore.kernel.org/20250620180458.5041-1-bijan311@gmail.com
> [2] https://lore.kernel.org/20240408175228.91414-1-sj@kernel.org
> 
> SeongJae Park (4):
>   mm/damon: add struct damos_migrate_dest
>   mm/damon/core: add damos->migrate_dest field
>   mm/damon/sysfs-schemes: implement DAMOS action destinations directory
>   mm/damon/sysfs-schemes: set damos->migrate_dest
> 
>  include/linux/damon.h    |  29 ++++-
>  mm/damon/core.c          |   4 +
>  mm/damon/sysfs-schemes.c | 253 ++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 282 insertions(+), 4 deletions(-)
> 
> 
> base-commit: 78745efafbb93197e476717385616ed57ea2df22
> -- 
> 2.39.5

Hi SeongJae,

Thanks for putting this patch together. Sorry for taking a while to
respond to it.

I am finishing up V3 of the interleave patchset using these patches. It
has mostly worked great, but I noticed that damos->migrate_dest was not
being updated in damos_commit(), so new weights would not be applied. This
meant that you could not update the interleave weights by committing the
damon state. I also saw that damos->target_nid was also not being updated
here. I will will have a patch fixing this with the V3 of the interleave
patchset that I will hopefully send out tomorrow.

Thanks,
Bijan
