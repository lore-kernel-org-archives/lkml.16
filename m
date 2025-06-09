Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1121ADBA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 23:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749513135; cv=none; b=OTOR/PEwOpTJnveh/e4YYJeWt9gNs9S3JObqC1R+Zgvub/sRsExIuSRxQgAVPSfngq6UnrS+s2jeKOWPBS4RltLzaFZAA+r5y/W2HKwkEA5Sdctn992Os2ffbZkdClk/QqvjmEeq8adA0R3LyU5QpkPAe/hFcuuggpUcC6Nc1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749513135; c=relaxed/simple;
	bh=mEQDo6j5H8oPDQlg77ExKhoywTKS+C3u5qkNoQL4GOw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=H353c7Y92Vbfpok3JbiDk4p5YSFUgC0s5xg0/9kCK1/EtxSBwmlHz6GPi3i0aY8IykX3WxTGvZamxKFive2cJWYOCPhjiwqjdn7iaT1mEA49YyOO+fWU4xcP87ASIAKCobVQYLRedC3RRXAYq5jZE1ZU2GXCE90oAVVBiQHLpHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Vm0YQP52; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Vm0YQP52"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE900C4CEEB;
	Mon,  9 Jun 2025 23:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749513135;
	bh=mEQDo6j5H8oPDQlg77ExKhoywTKS+C3u5qkNoQL4GOw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Vm0YQP52BaTmcI7ScfKdnqnVriGiQ0Tuq2wIsqkE1WHaVP9BS8jzZJ1hwlqptBDxA
	 ElAnZJT4po+DqwkuZLvzwe+QP6oV+GQ9fHMrFA1Sdagsa6yxXmUWdaCYaA9wyC9FSL
	 aJZGme5/MVAa14X4MQ8BeBM3N5EdavQzOJLRJCqs=
Date: Mon, 9 Jun 2025 16:52:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexander Graf <graf@amazon.com>
Cc: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, <nh-open-source@amazon.com>, Baoquan
 He <bhe@redhat.com>, Zhongkun He <hezhongkun.hzk@bytedance.com>
Subject: Re: [PATCH v4] kexec: Enable CMA based contiguous allocation
Message-Id: <20250609165214.784b399237d37b3e6fd97f4c@linux-foundation.org>
In-Reply-To: <f609d5a0-99d5-4328-8a18-00f6a9e1a48c@amazon.com>
References: <20250521152934.48841-1-graf@amazon.com>
	<f609d5a0-99d5-4328-8a18-00f6a9e1a48c@amazon.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Jun 2025 09:03:10 +0200 Alexander Graf <graf@amazon.com> wrote:

> > Signed-off-by: Alexander Graf <graf@amazon.com>
> 
> 
> Ping? Not seeing this patch in Linus' master tree :)
> 

Sorry, I parked this because of messy cross-tree dependencies and by
the time I could bring it back, it was too late to get decent -next
testing.

And now arch/riscv/kernel/elf_kexec.c has disappeared.  So can you
please redo and resend?
