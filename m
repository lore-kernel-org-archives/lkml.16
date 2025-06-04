Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2231827713;
	Wed,  4 Jun 2025 02:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749004603; cv=none; b=uNIvUW9gujAb86ESLjjUI75NkMY0KgQDV/sAErAorPGRjql9XJ26hZjkTFdrKN4xvWDuRNGnaspLuULSev62e4gIYBY1yczOPyCcmsNirvwIBJKlXDX29MHdvdmPHW1qNcSchvsXFlp2JLEcg+a84BIx/jSxZaS/ez3ECa5LDX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749004603; c=relaxed/simple;
	bh=IGuNb1E0mXd8jgBnyXrO0bwJQS/mqrkSYujfMnWNrNM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=K4Yej6VeQ49B3jJQEC1fJPXHdb+aG4h3QE82brfNrSnDqoIvwgfC5hkUCfHuNlhH++tNH4Tk7RMhCinSeUtqghbopLUMRg1avZdYHmpA3XkODH7aLKI133/4kPSw9p2pufsLEZOy8/asGe7ZPtmQIHH+GqSf8NLoUDp5qdM5MBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=a7jqy7Wr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a7jqy7Wr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E32AC4CEED;
	Wed,  4 Jun 2025 02:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749004602;
	bh=IGuNb1E0mXd8jgBnyXrO0bwJQS/mqrkSYujfMnWNrNM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a7jqy7Wr7DpKsld7VzW16igjr/MD5vDgfNYkJBWO6MSWHiGJEMTS8M6l8hDoFzBJm
	 kwGVrWkmB8EFcaScnDRaEwfEVlhQqWqcp3Pux3uxvibB2nxuLjsxXfct7elaXwZY/P
	 wi1cYrfbjCA+WzA5zVX/M1yRPGjP32Dt/NT0InmM=
Date: Tue, 3 Jun 2025 19:36:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, mhiramat@kernel.org,
 oleg@redhat.com, peterz@infradead.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, pulehui@huawei.com
Subject: Re: [PATCH v1 3/4] selftests/mm: Extract read_sysfs and write_sysfs
 into vm_util
Message-Id: <20250603193641.f24bf13623565d2b02ae86ce@linux-foundation.org>
In-Reply-To: <8ea3ec70-dbe7-424f-b07f-add7c1cb1852@huaweicloud.com>
References: <20250529155650.4017699-1-pulehui@huaweicloud.com>
	<20250529155650.4017699-4-pulehui@huaweicloud.com>
	<f1dfdffa-23b3-4d4a-8912-3a35e65963e4@lucifer.local>
	<8ea3ec70-dbe7-424f-b07f-add7c1cb1852@huaweicloud.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Jun 2025 15:17:49 +0800 Pu Lehui <pulehui@huaweicloud.com> wrote:

> 
> 
> > Not a big deal though, perhaps a bit out of scope here, more of a nice-to-have.
> 
> ...
>
> Yep, we can do it more. But, actually, I am not sure about the merge 
> process of mm module. Do I need to resend the whole series or just the 
> diff below?
> 

A little diff like this is great, although this one didn't apply for me.

But if we're to get this series into 6.16-rc1, now is not the time to
be changing it.  Please send out a formal patch after -rc1?
