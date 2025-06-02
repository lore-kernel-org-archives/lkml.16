Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CD4149C4A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 17:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748885729; cv=none; b=OicSLnUEMFfONuH81uWZSCgp+/QPuwJ5+vsXc4Vys0b6guEdVoKZox10de/Pd6mojYgfGQ8vQ9h4z6nHBLP2rwr3xG/uhFLciEklECovK1jJokLAgkGZj7tpsqnc2tboPsCHgFUHVqgGljbakEieRnLfKTQMC81ZAgnXGmysAKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748885729; c=relaxed/simple;
	bh=3qNdLWtW2T/xyAcKJWtubOFBpBEB/Hd6bXD6++CDdp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WlxyAlj2yMt/H14eQ7MzOpvSM19/SEOwCZRmEbyxA8X90TUW8TfpTcspnSjSZfQkF1JSZUYmQbFx3kQxNKU+G5OBkpbC4Glq6zWtXpG/MUQCzDWz/wq67jdB8CbRrFz8GkOn5jCfMzJBo2CJXJVHIRapu040F+DSsEZBjEVWTVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuqOEwb/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuqOEwb/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B96C4CEEB;
	Mon,  2 Jun 2025 17:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748885728;
	bh=3qNdLWtW2T/xyAcKJWtubOFBpBEB/Hd6bXD6++CDdp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nuqOEwb/MQgfBBUo3RghyWX52e5ddoF/O07yXPgMUkY86/Z+PLR1kdfHY05rV82jA
	 lTpHhd/abkoawUPd0kvhbX+YaUWthudn0zVnYlZth01h/IqmgKJnQmjtieGt09Zex0
	 lSf9B/OV+yZf5cYtyrCCtIDa8BWjIMt3b0rEo5o/02CQFnt9xcFzVc/KXltIWiuHuR
	 uEMIez23DqI5LbSgDoNU/0j6ZeH9ZOXWSMbmoM5fry5emARc+X88E7zmGaZw+Nfd6y
	 7WmQGbxbCWW4JySVjUW22f5M0RXe8NOTDUV6+7QHFTMOcCx0FWkQxGE97W09aoi+Lk
	 1O2xG4H9aGmtQ==
From: SeongJae Park <sj@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Jann Horn <jannh@google.com>,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Date: Mon,  2 Jun 2025 10:35:19 -0700
Message-Id: <20250602173519.37005-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAGsJ_4xJXXO0G+4BizhohSZ4yDteziPw43_uF8nPXPWxUVChzw@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 31 May 2025 04:17:51 +0800 Barry Song <21cnbao@gmail.com> wrote:
[...]
> BTW, I found vector_madvise doesn't check the ret value of madvise_lock(),
> it seems also a bug?
> 
> static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> {
>                         /* Drop and reacquire lock to unwind race. */
>                         madvise_finish_tlb(&madv_behavior);
>                        madvise_unlock(mm, behavior);
>                        madvise_lock(mm, behavior);  /* missing the ret check */
>                         madvise_init_tlb(&madv_behavior, mm)
> }

Thank you for finding this, I will post a fix soon.


Thanks,
SJ

[...]
