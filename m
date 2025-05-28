Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB8B1F463F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748472739; cv=none; b=ky087hLRFMSikVTRIJ0SEYiRcpqbXjltNzKsEhgoknJucKehPuxVSZnNgBlWbhiZJepqZ42RWnIKkGzVGg0jBmVG3Mg0MSQv/jimCwMVeKiKbP9Smyr5ZTtxtoHjZn0FI4HntL/vpc7jvr4WHgQxGKZpe4xLKG6JB4LMO+WUr7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748472739; c=relaxed/simple;
	bh=2IoOHI2xO3MVBr6bPNdHZD6BmmLkb+UZ0OkJxJKjhDs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jQ7pKYcUklAF2j7R0LkPN4sm3gxtmCSs9OcK+/AqrDHYcpBd8YfNuvgzmI19EtFX6p0+m7fVgJKs/aUxhhxEdriGUSacjGj5AEEIdlLFVNyhIMPPMBRuAk1G+74srld/mCARAZA6zEqF5FZX2JeQrCW9E87f212U6HYJZ186WX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rhH8kLT8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rhH8kLT8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B46C4CEE3;
	Wed, 28 May 2025 22:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1748472738;
	bh=2IoOHI2xO3MVBr6bPNdHZD6BmmLkb+UZ0OkJxJKjhDs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rhH8kLT8wPRClBVdF/6l6jjzMi/xf1D6eXsZJ58EE1hmU3Yn8quY+G+I0EH122e9j
	 Bagm6I3vH1bZAo87FLxMbc9s7PB/TNlHb0V3pUKapx70nEWSN/JCSI2xa9jaOk3rTM
	 NvCg6VPIVaEAyOHNVSQilhaxsW+KGOx0IrK+7t4o=
Date: Wed, 28 May 2025 15:52:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: lorenzo.stoakes@oracle.com
Cc: Lorenzo Stoakes via B4 Relay
 <devnull+lorenzo.stoakes.oracle.com@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/testing/vma: add missing function stub
Message-Id: <20250528155218.a8b755912d1eed25148c59b4@linux-foundation.org>
In-Reply-To: <20250528-fix-vma-test-v1-1-c8a5f533b38f@oracle.com>
References: <20250528-fix-vma-test-v1-1-c8a5f533b38f@oracle.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 May 2025 15:15:39 +0100 Lorenzo Stoakes via B4 Relay <devnull+lorenzo.stoakes.oracle.com@kernel.org> wrote:

> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> The hugetlb fix introduced in commit ee40c9920ac2 ("mm: fix copy_vma()
> error handling for hugetlb mappings") mistakenly did not provide a stub for
> the VMA userland testing, which results in a compile error when trying to
> build this.

Thanks, I'll add the Fixes: and the cc:stable (because ee40c9920ac2 had
cc:stable).

> Provide this stub to resolve the issue.
> 
> ---
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

SOB goes above the "^---$", please ;)

> --- a/tools/testing/vma/vma_internal.h
> +++ b/tools/testing/vma/vma_internal.h
> @@ -1461,4 +1461,9 @@ static inline int __call_mmap_prepare(struct file *file,
>  	return file->f_op->mmap_prepare(desc);
>  }
>  
> +static inline void fixup_hugetlb_reservations(struct vm_area_struct *vma)
> +{
> +	(void)vma;

<Curiousity> Was this statement found to be needed?  Normally we just
use an empty function body in such cases.

> +}
> +
>  #endif	/* __MM_VMA_INTERNAL_H */

