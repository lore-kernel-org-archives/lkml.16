Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5202C23DE;
	Wed,  7 May 2025 00:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746576036; cv=none; b=ctQwoKtwp7ITnMM3ihXoVCMWw01l0QM6L8j3rT9cKFetC6g3WPvbIEwEcjgj8RWEmASlaG5J4+zOBpjzVfByq6f7PNEN9GggO64Sidpgg/xsTX1/1dW2R/EEVFRJGNgFsxLn+iB44w+Eb2jjoC/MT3qtKb0rrPPCOREwlU5IUtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746576036; c=relaxed/simple;
	bh=ALYrDOrB4kuaNVu4GIvtF0UwXvPLkIaw599sx0ttPQs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IK/pPDKM4DHNw+X1RP/KvdjI5PO+xOlW4e8G4ND0LZWNHU0of257rKRppiw2ZtwGDhbxzGX5aPNkmR+YDwPmh33gvOqJALX3r9YOjoFmm4TXfPBFwBENBv8fwmgBX1Q+AOIgZfLB4VvNd67pDXhOeqDSTospvlv5WsuMufhbwNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vNhGJci5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vNhGJci5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5559AC4CEE4;
	Wed,  7 May 2025 00:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746576035;
	bh=ALYrDOrB4kuaNVu4GIvtF0UwXvPLkIaw599sx0ttPQs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vNhGJci5KF4sUfhQi/F5mgwAbmaQ5IOzu2ZVaggQMEqNVwDKaM4IK0FGeaOxy5Cut
	 PImhvyH+KCjOKzMut9/ehotAytzyVlC6rAfPsqapaHfEZpVO8+lVhOJ3OkCeluw6cS
	 xIH4KsWeRSYlGXQjuCoPFLcdduXIVkXJgR/e1cU4=
Date: Tue, 6 May 2025 17:00:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: vbabka@suse.cz, surenb@google.com, mhocko@suse.com, jackmanb@google.com,
 hannes@cmpxchg.org, bp@alien8.de, tglx@linutronix.de, david@redhat.com,
 ast@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
Message-Id: <20250506170034.2c6cb08808e60772c207233f@linux-foundation.org>
In-Reply-To: <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
	<20250506112509.905147-2-kirill.shutemov@linux.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  6 May 2025 14:25:08 +0300 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:

> try_alloc_pages() will not attempt to allocate memory if the system has
> *any* unaccepted memory. Memory is accepted as needed and can remain in
> the system indefinitely, causing the interface to always fail.
> 
> Rather than immediately giving up, attempt to use already accepted
> memory on free lists.
> 
> Pass 'alloc_flags' to cond_accept_memory() and do not accept new memory
> for ALLOC_TRYLOCK requests.

What are the userspace-visible effects, please?

Was the omission of cc:stable intentional?  I cannot locally determine
this without the above info.

If the cc:stable omission was indeed intentional then it would be better
if this series was presented as two standalone patches.
