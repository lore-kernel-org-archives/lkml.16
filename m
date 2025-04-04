Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F82C221F0D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797084; cv=none; b=VvEMno2dnYq/uJdditI6laEJwD1yisVk4RvQv0EDCQRPr0uRUATKvbPGFtBq1xDLDXTkkO3LRXFC6ZJD3zRGB1tvzJgg2n4MKHcAlspVrM9SqHvy8x42HXO4Q2TTf3sKXVq2SJTThW4o9BF/LiozXQw6XrLNmWlUuPT1CFCmlCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797084; c=relaxed/simple;
	bh=IvhhTUIiW/q5zcRrtTNnMYdCLxAmDvUAWeXeyHuVrZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuuJsW9vZWsXCi3P8UrIRiJUrBkvfB6okTkwX3Qs1wsvSHwSxB0xfuAaZgg0ajQWFcvauTK5NAGQ7Ae4LyG/aw3tcipl4e1z8F00MHfl68qg4aZp0GzbWMaSmi7uUUvZIYGsDXQ8QFbl89nPX5taeXQhfx/irnNnf6GK28eU6w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cj39JenA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cj39JenA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743797081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvhhTUIiW/q5zcRrtTNnMYdCLxAmDvUAWeXeyHuVrZk=;
	b=cj39JenAg4I1wJc7BdWfy9y4Z9BPMKeEFo4NHfrV64OWMRSOBTqxse5gKLQDSQTG4CEhu2
	WGuOYkAUuPUPSqpF4WeZSlLJuTBqOM5Szb9lfmuEwGF0+UF6GIUJnyXYD7XjfhmaqQjGDS
	LtUJdsr1OjzQZZoFfvMPnwWSOhUNh80=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-_AB5LUwCNciRrLpL4MbUMw-1; Fri,
 04 Apr 2025 16:04:34 -0400
X-MC-Unique: _AB5LUwCNciRrLpL4MbUMw-1
X-Mimecast-MFC-AGG-ID: _AB5LUwCNciRrLpL4MbUMw_1743797072
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 504C819560B8;
	Fri,  4 Apr 2025 20:04:32 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.144])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1B9D71809B74;
	Fri,  4 Apr 2025 20:04:27 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  4 Apr 2025 22:03:57 +0200 (CEST)
Date: Fri, 4 Apr 2025 22:03:52 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org, peterz@infradead.org,
	mingo@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, rostedt@goodmis.org, mhiramat@kernel.org,
	bigeasy@linutronix.de, ast@kernel.org
Subject: Re: [PATCH v2 tip/perf] uprobes: avoid false lockdep splat in uprobe
 timer callback
Message-ID: <20250404200351.GI3720@redhat.com>
References: <20250404194848.2109539-1-andrii@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404194848.2109539-1-andrii@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 04/04, Andrii Nakryiko wrote:
>
> Also, point out in the comments more explicitly why we use seqcount
> despite our reader side being rather simple and never retrying. We favor
> well-maintained kernel primitive in favor of open-coding our own memory
> barriers.
>
> Link: https://lore.kernel.org/bpf/CAADnVQLLOHZmPO4X_dQ+cTaSDvzdWHzA0qUqQDhLFYL3D6xPxg@mail.gmail.com/
> Reported-by: Alexei Starovoitov <ast@kernel.org>
> Suggested-by: Sebastian Siewior <bigeasy@linutronix.de>
> Fixes: 8622e45b5da1 ("uprobes: Reuse return_instances between multiple uretprobes within task")
> Signed-off-by: Andrii Nakryiko <andrii@kernel.org>

LGTM. FWIW,

Acked-by: Oleg Nesterov <oleg@redhat.com>

