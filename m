Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0642819
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748915827; cv=none; b=O8pqAW5Lm1aJ6zXJI3mjG+gExkFwjVtDDVi072zGFnrsDszzmSwZqXpjMS+sL/zOmqfcOiyNuI7+z46m5fmVvpGgkeaUniVJcWaOGknTM+4U4WbNWLkryHhubAx/eWLI6okO0mcNGostPFvYeotf77ILHZjmUJMkDJNKuu67M+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748915827; c=relaxed/simple;
	bh=X0OH4N+PDNWeogyjqpl/sQkI/2fArmjfKrsPUevgl8s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=p4SuU/AuowOIk7I5r2cRj6VLN4rVl33/pNXnC9eThWiZwCkGnpjfR/IuQfphRoFkPbV6wCOGDQrF1N6OnvHTX+8vVpRSR0aNSIvd3xmbJDuditwoXEn7KnKd4J8zqNLrSewM7AAr2E8IVqYpLlDPtTTn+w6DhrH1ajik8ghdHOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TSwxFihx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TSwxFihx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D9CC4CEEB;
	Tue,  3 Jun 2025 01:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1748915827;
	bh=X0OH4N+PDNWeogyjqpl/sQkI/2fArmjfKrsPUevgl8s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TSwxFihx6tJh0oXzjnf+CUWxAaAxsozGLtLN5eCfQ1ZlEL70T2o+eJOUIl6KmhRzG
	 zhB+3oJmgeAbyG9KwPcxgzNIHgna1YUKGJttgTubf9Uw7Hyoa86jnT95m4zIKRxMJL
	 EYra9UT+JkJu2pcNsEGjk9D/MhDkiZW6ym7HYSaA=
Date: Mon, 2 Jun 2025 18:57:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Yu Zhao
 <yuzhao@google.com>, Kairui Song <kasong@tencent.com>, Nhat Pham
 <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song
 <baohua@kernel.org>, Chris Li <chrisl@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hugh Dickins <hughd@google.com>
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
Message-Id: <20250602185706.fc305626e7885f6b63f3955c@linux-foundation.org>
In-Reply-To: <0599e483-fe41-f8b4-ace4-d570ba10c9d5@huaweicloud.com>
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
	<0599e483-fe41-f8b4-ace4-d570ba10c9d5@huaweicloud.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Jun 2025 09:17:50 +0800 Kemeng Shi <shikemeng@huaweicloud.com> wrote:

> > +MEMORY MANAGEMENT - SWAP
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +R:	Yu Zhao <yuzhao@google.com>
> > +R:	Kemeng Shi <shikemeng@huaweicloud.com>
> > +R:	Kairui Song <kasong@tencent.com>
> > +R:	Nhat Pham <nphamcs@gmail.com>
> > +R:	Baoquan He <bhe@redhat.com>
> > +R:	Barry Song <baohua@kernel.org>
> > +R:	Chris Li <chrisl@kernel.org>

Whoa.  Hugh doesn't escape that easily.
