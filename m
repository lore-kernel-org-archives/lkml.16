Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB49136124
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 02:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749004285; cv=none; b=UUz46JggZUMkl8UsnnWgqQocc7wSkSyE8WN+mcIhuKtkrfcu6vxot+Lz42FPl3dQRDYft+Z2wvA4i8kiPZAfn9fh4/J3gqlC/OHR9W+ScUsB5fL9Piq5ZhOjTAp4wcFfIbP1/YGHmft3rgbKpyhd7wjw6JvEVTVfJh1OXQ95UgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749004285; c=relaxed/simple;
	bh=jW0BB3cinE6IAbLWfjdG0dhsOZS2FBUM95QJu8mydeg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QV6weAsmaPIk6/L9cSnFyXeirvfX/sj1QuiQLd+aed9pYiFa1mMvbiM62AhAVY2C3e0nIjFZyCEhw/HGA2K5U16cDAqd//9STYtZMEOlbyuFvyaNozPkgv91iTnxRruRRLx7AMW+ioaLOreE1X1LAelBoc4W1LX0ilbAKX7+xY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=L+koj556; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L+koj556"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B418BC4CEED;
	Wed,  4 Jun 2025 02:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749004285;
	bh=jW0BB3cinE6IAbLWfjdG0dhsOZS2FBUM95QJu8mydeg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L+koj556a3Hdo3NxRJNxXR3wCvNhvnxpXaUUzD04FzN3C5+e77h69NgMuLxkms1WX
	 Df/Gozu/l+1MC0Jm5MMvMt8kcqS0eFqQe7VH0QZMmxxtmQ11oKP8Kk8fCNnVNV2m5M
	 TTD6T9J8C9RZvdcKKW6X8mNs64YGluqUSbaWgTDM=
Date: Tue, 3 Jun 2025 19:31:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Xavier <xavier_qy@163.com>
Cc: will@kernel.org, ryan.roberts@arm.com, 21cnbao@gmail.com,
 dev.jain@arm.com, ioworker0@gmail.com, catalin.marinas@arm.com,
 david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, ziy@nvidia.com,
 "Barry Song" <baohua@kernel.org>
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant
 operations of contpte_ptep_get
Message-Id: <20250603193124.347804cb5a19c9941a354ff4@linux-foundation.org>
In-Reply-To: <6f9842a2.7c3c.19734ce1860.Coremail.xavier_qy@163.com>
References: <20250510125948.2383778-1-xavier_qy@163.com>
	<6f9842a2.7c3c.19734ce1860.Coremail.xavier_qy@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Jun 2025 16:00:11 +0800 (CST) Xavier  <xavier_qy@163.com> wrote:

> It has been three weeks since the submission of Patch v6. I take the liberty of
> asking whether you still have any comments or suggestions on this version,
> and whether the test data indicates that it is ready for merging. I sincerely
> look forward to your valuable feedback and guidance.

It was late in the 6.15-rcX cycle and I was hoping that arm people
would handle this.

It would be better if the patches had cc:linux-mm@kvack.org.

I'll grab it and shall include it in -next after -rc1.  If ARM people
want to grab it, please do so and I'll autodrop the mm.git copy.

