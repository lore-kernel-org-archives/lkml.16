Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00BF238C19
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686355; cv=none; b=OArWQ2AOXwlUhBzNj0pY2RibV99up0KmS4Dva4s9CDngn0GU/PIlb/ePRUQmmfvzEE8R3aENH9ZkuvARgtl1B9uRzJvR93q6MVHliVPK2T+tqi6YIOtXRGAmZHKKWDOjXDZwzJ0jx5PAK1Z4y+4NDzoo5C47vJLUcWfAycIvi44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686355; c=relaxed/simple;
	bh=GbjuxIKt7GEonaHrp5LL1AmZ9clyp72RW5FyRoGRkbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjtIgx3hqr9H1H4uGFaWimdjryxTOAWTpsUSIatK3u9VWhUTd3Huvs0sK/IXVavYXqo7eenuduTqX0iWZphzjVgXuGI11o37rkBe/nWMEKgR1MZfDgFmwkxhXVxC+3L6ipNZcqxV57g8a7wnLisNNeLQqmVPwz8rHLhvCUJZu5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxPuYPGj; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxPuYPGj"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so3636773276.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750686353; x=1751291153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSfF7un8LIQsGUb2HSbfU97hICuhPSaYsldpijdfOsQ=;
        b=lxPuYPGjICgagS2Ib8Ze3JrIcB+2PNizafNcfA2Rhab8Ohj562ovBzNux4KmlOmFMP
         zqJZpSVB4APgRyqVwgVOk9OGYcFvTMfeS7/X7kiJenWAWHi4CNiMDeAsAvbfBulA9a8p
         GP7lb/d6FOA5aWBA4UlflwSh3ix0rt+3USF9waCOrnppSa4GY5V7rgODsLqUu/RgP7HV
         ld65Dn17fnsuVtzG7QqZEbMjsFbUqLCapklnvAxquwocEMh5ZbP6oYQwrADX0OS1JIZr
         0eU7eWIwFP8dV7EtHIQGFymAu+kQS25A1I3XyuDsBPcxLu306mCfdzVvQVRO9gCj5rYR
         ioEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686353; x=1751291153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSfF7un8LIQsGUb2HSbfU97hICuhPSaYsldpijdfOsQ=;
        b=UgPdEpz5noc27fLuRvJRgJExdahRFJz7EmE4ajdLdRO8pr2Bf+2/ZZ94ojEyosoXnf
         I5YZeHPwhqi9yYz6IHQ29XhBFuRQhUkIF5bTskj3HpJWIk/ORbJy2rXlkj3MOVZcTERE
         OhjFWijmyqNFlRa2kNgveJlo+7hgJy+kWAEhA/3FP5yd+xamVJanI0aqJsTtUG/M68rk
         aazH1FtdIkchiXcySC85X+AUVUvic7lwxQlIV7KOjoP0etIreTTcYZahS1105wyacx/F
         bimRFMlLjw1XmPN65h1XUJk9tb/kOCGZPydjOQgoBeQqX3Vgr2505In6htaAeRKHyLAs
         pQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8O8AGdKopJlWvtijFLHQsgjJ0zEF/IEU2r/PqdAVsw4PZpGN6TSdqEeJRr57I0vyxg4kVaBiypJLfTEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysZD4n2Tx8GAZYpGXqnb1fRZl8tJoVDMwKkSdUSHSybcQsyONt
	TOcbZrNCFNRgWohbCnAnL5/i8vqZGNCf0ClUCo8xZ3ggjQvp6NjslkintM2D2A==
X-Gm-Gg: ASbGncvDnZU9cjIKackLZdpBDqSOsr+VAzz+DtwQ3KeKo1/Y+cUK8qTrJhsttm8vuJz
	EQP0WERwuYtQv1zWhGc0iSSNj4fMz5uLe9RgGTFfdfO0KIirIGLA1kTqH+9CxUUuhQLmYvvtdrV
	zHfOC6um1kX8ZBO4RbtXd2MafrgbRCUtcPNYmTPEllLkxEXYlen0CF239hfkVPxGlU2LGc9U8aw
	Bcqr2PyzblltaPBq6yAIPj5lrn3ayx8E57SkOGHLq2sOxbyK+eRgeRvSSxCiktQiZ3xR7OPt+Ez
	tVA8Zky3z5aw7Hen37IPGOVZmrUXIduBio3gpexGqQ8+KK8yeJxIWmpWsVkrKQ==
X-Google-Smtp-Source: AGHT+IG38eDF3uDJCo+9jSrUa+GIdCMuLehbCwzqrSlA2tsKSYXh5jQni+GVNFRrtzz7ofvR3E00YA==
X-Received: by 2002:a05:690c:7345:b0:70c:a5c2:ceed with SMTP id 00721157ae682-712c65128a7mr173679777b3.25.1750686352703;
        Mon, 23 Jun 2025 06:45:52 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:50::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4b96502sm15855337b3.79.2025.06.23.06.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:45:52 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Bijan Tabatabai <bijan311@gmail.com>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	sj@kernel.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: Re: [RFC PATCH v2 0/2] mm/damon/paddr: Allow interleaving in migrate_{hot,cold} actions
Date: Mon, 23 Jun 2025 06:45:49 -0700
Message-ID: <20250623134550.2367733-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250620180458.5041-1-bijan311@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 20 Jun 2025 13:04:56 -0500 Bijan Tabatabai <bijan311@gmail.com> wrote:

Hi Bijan,

I hope you are doing well! Sorry for the late response. It seems like SJ
already gave some great feedback already though, so I will just chime in
with my 2c.

[...snip...]

> However, currently the interleave weights only are applied when data is
> allocated. Migrating already allocated pages according to the dynamically
> changing weights will better help balance the bandwidth utilization across
> nodes.
> 
> As a toy example, imagine some application that uses 75% of the local
> bandwidth. Assuming sufficient capacity, when running alone, we want to
> keep that application's data in local memory. However, if a second
> instance of that application begins, using the same amount of bandwidth,
> it would be best to interleave the data of both processes to alleviate the
> bandwidth pressure from the local node. Likewise, when one of the processes
> ends, the data should be moves back to local memory.

I think the addition of this example helps illustrate the neccesity for
interleaving, thank you for adding it in!

> We imagine there would be a userspace application that would monitor system
> performance characteristics, such as bandwidth utilization or memory access
> latency, and uses that information to tune the interleave weights. Others
> seem to have come to a similar conclusion in previous discussions [3].
>
> Functionality Test
> ==================

[...snip...]

> Performance Test
> ================
> Below is a simple example showing that interleaving application data using
> these patches can improve application performance.
> To do this, we run a bandwidth intensive embedding reduction application
> [5]. This workload is useful for this test because it reports the time it
> takes each iteration to run and reuses its buffers between allocation,
> allowing us to clearly see the benefits of the migration.
> 
> We evaluate this a 128 core/256 thread AMD CPU, with 72 GB/s of local DDR
> bandwidth and 26 GB/s of CXL memory.
> 
> Before we start the workload, the system bandwidth utilization is low, so
> we start with interleave weights biased as much as possible to the local
> node. When the workload begins, it saturates the local bandwidth, making
> the page placement suboptimal. To alleviate this, we modify the interleave
> weights, triggering DAMON to migrate the workload's data.
> 
>   $ cd /sys/kernel/mm/damon/admin/kdamonds/0/
>   $ sudo cat ./contexts/0/schemes/0/action
>   migrate_hot
>   $ sudo cat ./contexts/0/schemes/0/target_nid
>   0-1
>   $ echo 255 | sudo tee /sys/kernel/mm/mempolicy/weighted_interleave/node0
>   $ echo 1 | sudo tee /sys/kernel/mm/mempolicy/weighted_interleave/node1
>   $ <path>/eval_baseline -d amazon_All -c 255 -r 100
>   <clip startup output>
>   Eval Phase 3: Running Baseline...
> 
>   REPEAT # 0 Baseline Total time : 9043.24 ms
>   REPEAT # 1 Baseline Total time : 7307.71 ms
>   REPEAT # 2 Baseline Total time : 7301.4 ms
>   REPEAT # 3 Baseline Total time : 7312.44 ms
>   REPEAT # 4 Baseline Total time : 7282.43 ms
>   # Interleave weights changed to 3:1
>   REPEAT # 5 Baseline Total time : 6754.78 ms
>   REPEAT # 6 Baseline Total time : 5322.38 ms
>   REPEAT # 7 Baseline Total time : 5359.89 ms
>   REPEAT # 8 Baseline Total time : 5346.14 ms
>   REPEAT # 9 Baseline Total time : 5321.98 ms
> 
> Updating the interleave weights, and having DAMON migrate the workload
> data according to the weights resulted in an approximately 25% speedup.

Thank you for sharing these very impressive results! So if I can understand
correctly, this workload allocates once (mostly), and each iteration just
re-uses the same allocation, meaning the effects of the weighted interleave
change are isolated mostly to the migration portion.

Based on that understanding, I'm wondering if a longer benchmark would help
demonstrate the effects of this patch a bit better. That is, IIRC short-lived
workloads should see most of its benefits come from correct allocation,
while longer-lived workloads should see most of its benefits come from
correct migration policies. I don't have a good idea of what the threshold
is for characterizing short vs. long workloads, but I think this could be
another prospective test you can use to demonstrate the gains of your patch.

One last thing that I wanted to note is that it seems like iteration 5, where
I imagine there is some additional work needed to balance the page placement
from 255:0 to 3:1 *still* outperforms the normal case in the original
benchmark. Really awesome!!!
 
> Questions for Reviewers
> =======================
> 1. Are you happy with the changes to the DAMON sysfs interface?
> 2. Setting an interleave weight to 0 is currently not allowed. This makes
>    sense when the weights are only used for allocation. Does it make sense
>    to allow 0 weights now?

If the goal of 0 weights is to prevent migration to that node, I think that
we should try to re-use existing mechanisms. There was actually quite a bit
of discussion on whether 0 weights should be allowed (the entire converstaion
was split across multiple versions, but I think this is the first instance [1]).

How about using nodemasks instead? I think that they serve a more explicit
purpose of preventing certain nodes from being used. Please let me know if
I'm missing something as to why we cannot use nodemasks here : -) 

[...snip...]

One last thing that I wanted to note -- given that these weights now serve
a dual purpose of setting allocation & migration weights, does it make sense
to update the weighted interleave documentation with this information as well?
Or, since it really only affects DAMON users, should we be ok with leaving it
out?

My preference is that we include it in weighted interleave documentation
(Documentation/ABI/testing/sysfs-kernel-mm-mempolikcy-weighted-interleave)
so that anyone who edits weighted interleave code in the future will at least
be aware that the changes they make will have effects in other subsystems.

Thank you for sharing these results! I hope you have a great day :):)
Joshua

[1] https://lore.kernel.org/all/87msfkh1ls.fsf@DESKTOP-5N7EMDA/

Sent using hkml (https://github.com/sjp38/hackermail)
