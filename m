Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4126629D0D
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234258; cv=none; b=OMXCfhCVqBwgEZ7qnxjYhBjFUCXy660vAs54isTr386PQoFbABMUE/2zIppoXo8oCXki4QmCBbZVN5H/nSYDbnLPgHXAlthOkMGiIcwkjsirHlXsY4kaSyGnCoJfHiiHCMCQM3gR7IKckox0cAlaNrwiqgfPw3zvSA549Dw8U+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234258; c=relaxed/simple;
	bh=ZYD92l+XYZ4CB3e7+iC6Z5+Zvap/uYMgrrh+yCjGskI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=b969KeDSd4lYq9WExx56YLhSaVI7BzD7ow3tbf275B0n+ggCLBUmK93DEPX8dpvn/iSZ/yHYESBTuMprGEDP5nQZx9MY9znaQCkaGg0K0EvfgKcCbjjJhy+eN9aF1oNxsCi0uFL38FmW7hrnvPmz26Z9+Z/pQaqwZLvsk298tnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=yucglhG/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yucglhG/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C64C4CED1;
	Tue, 11 Feb 2025 00:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1739234257;
	bh=ZYD92l+XYZ4CB3e7+iC6Z5+Zvap/uYMgrrh+yCjGskI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yucglhG/B+tEILfXSdnWmXc24hM+m/18OwIRur9GzKzd7pEcaizD82qJ912H99kDi
	 nnmhtVGaxtDTVhj5XYsRKaAjwDka0usF7ODK3K5dUmfRe/SwkQqWTsPywFVOwgoAVv
	 3P94LGYiBop2eA7pBrUzgsOUrcjLHjeySkJpvos0=
Date: Mon, 10 Feb 2025 16:37:36 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: zhengqi.arch@bytedance.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH] mm: pgtable: Unlock pml without branches when
 !start_pte
Message-Id: <20250210163736.ed1c93a44a47e39820fb8d85@linux-foundation.org>
In-Reply-To: <20250210100948.312130-1-richard120310@gmail.com>
References: <20250210100948.312130-1-richard120310@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Feb 2025 18:09:48 +0800 I Hsin Cheng <richard120310@gmail.com> wrote:

> When !start_pte is true, the branch for "start_pte" in "out_ptl" label
> section is surely false, and "ptl != pml" must be true since "ptl" is
> NULL in this case.
> 
> It means both branches in "out_ptl" are redundant, only one thing to be
> done is to unlock "pml", make it directly unlock "pml" and return in
> this case.

Hopefully the compiler will skip the `if (start_pte)' test.

Generally, we try to avoid multiple function return points.  We could do

--- a/mm/pt_reclaim.c~mm-pgtable-unlock-pml-without-branches-when-start_pte
+++ a/mm/pt_reclaim.c
@@ -43,7 +43,7 @@ void try_to_free_pte(struct mm_struct *m
 	pml = pmd_lock(mm, pmd);
 	start_pte = pte_offset_map_rw_nolock(mm, pmd, addr, &pmdval, &ptl);
 	if (!start_pte)
-		goto out_ptl;
+		goto out_unlock;
 	if (ptl != pml)
 		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
@@ -67,5 +67,6 @@ out_ptl:
 	if (start_pte)
 		pte_unmap_unlock(start_pte, ptl);
 	if (ptl != pml)
+out_unlock:
 		spin_unlock(pml);
 }
_

but that's really ugly.
