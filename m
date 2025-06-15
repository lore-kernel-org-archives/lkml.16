Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166D01802B
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 03:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749959897; cv=none; b=o2Bk4VoGB9GF1Gexf0E2fp+qEJcg/PPAK4darxfrznkvegN2rCeYxc9T4T3TYpO/wKevmT8j/DMN6kCvF7vWrP56c2wm4HkTBKrHAeAMGEfP7At/SqPv3WWRkWMGCgVFzbCvYqow+dzeVoDPBR8LYkv5hyQaFQJwS3Ld/qKaC4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749959897; c=relaxed/simple;
	bh=C2z3sqg8+n2/VQCn6CuiJg9N5e0d7BKeBTB0Lp2TQnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doFF8JuEFM1WWgd/Z4P49PEOzbJ7bxcjzcU0L5LjfSew6X/kiz5431ZUBSWqRmb/M97CP/Sx0rcGYlSlIFwQHff5ngJa3qz1qiEJ9l6GokbHA/0qMLikLrCrqEQ549WJWHtFSackx0dCmCbG8yvF4R6rNp6tzn0sWEmnr/ud7Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hU9Xt3Ef; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hU9Xt3Ef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749959893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C2z3sqg8+n2/VQCn6CuiJg9N5e0d7BKeBTB0Lp2TQnI=;
	b=hU9Xt3EfDFleMnPhGl8RRbTVdgu0dqVoq5iwXd4Xgnd3NlLPxXZIek/KY501RbENvqyVKA
	tROtEeEW/fscnTIqqCf9jzei8JL2il3hDO1BIhDu7eyjdxqsRsrodOS7NfwvE1eR0BTev8
	IUr5jzeCx5kyI4akNCGM/DeyYE8rWT8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-cWT_MB6OMHuN6mvo5be_AQ-1; Sat,
 14 Jun 2025 23:58:10 -0400
X-MC-Unique: cWT_MB6OMHuN6mvo5be_AQ-1
X-Mimecast-MFC-AGG-ID: cWT_MB6OMHuN6mvo5be_AQ_1749959889
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B9AA81956086;
	Sun, 15 Jun 2025 03:58:08 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.26])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 7E15F1956094;
	Sun, 15 Jun 2025 03:58:05 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 15 Jun 2025 05:57:24 +0200 (CEST)
Date: Sun, 15 Jun 2025 05:57:20 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Fushuai Wang <wangfushuai@baidu.com>
Cc: brauner@kernel.org, akpm@linux-foundation.org, mjguzik@gmail.com,
	mhocko@suse.com, andrii@kernel.org, pasha.tatashin@soleen.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] exit: fix misleading comment in forget_original_parent()
Message-ID: <20250615035719.GA30030@redhat.com>
References: <20250615030930.58051-1-wangfushuai@baidu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615030930.58051-1-wangfushuai@baidu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 06/15, Fushuai Wang wrote:
>
> The commit 482a3767e508 ("exit: reparent: call forget_original_parent()
> under tasklist_lock") moved the comment from exit_notify() to
> forget_original_parent(). However, the forget_original_parent() only
> handles (A), while (B) is handled in kill_orphaned_pgrp(). So remove
> the unrelated part.
>
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>

Acked-by: Oleg Nesterov <oleg@redhat.com>

