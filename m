Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E94825A65C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605122; cv=none; b=BHe897JePCcnf2bZ+jKp47XQnx/0ycAdwaiUUGozKg8H0HAjInAG/VWfXwXCTa8BVNWzW3MJiWI+2uYZuSZrKSe7YTg2GUASYTkkvRotV26cewBRgdWdC/dDDEXHTOcgNP52ATjjFkj3dTVlA8uUDoGAppUbgc/0rl4n0F1KYA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605122; c=relaxed/simple;
	bh=gDgNi23cRABqWZgzxAjYRzOcVrgy5Qd+tJpK03cjUCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrE9B+JPvGzUAVAiYs9Zh8K4uvoPzTzWfAJmf36c4KSICvPYjAbTtuoJYlOn+QIlBJWbwlxDB7oQLjFIpU2bfODQQdpWjGj2+1n33l8yNqiCPYEOTO4aN1i5vvyzhmkpX2Q97XnDu13+Ul+6wUxC+iIdVpMbKNULw8pGu+Wavic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fQkvGqLp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fQkvGqLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738605119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=970kTp5gWYS91tMEVbu8ABs0xJMnmrm1jfXZ4raiIRA=;
	b=fQkvGqLppKKvOML6pBDpGoisXjVb+vijrxIsEaTs0pqsIxNvplrUGzf6zcXKvkfILVgi3t
	0bN/q4OI+YZYu0YzQpw+rpWbUTHKi41+L+KURixAwCXkvtCX15Vx95YWuH6P+3f/0XZsAa
	Nn61nEo9hZwtSDnSJrPi9qUhiKHPIXg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-130-qc8B5v7ZMne1SKqt3Hg-9A-1; Mon,
 03 Feb 2025 12:51:55 -0500
X-MC-Unique: qc8B5v7ZMne1SKqt3Hg-9A-1
X-Mimecast-MFC-AGG-ID: qc8B5v7ZMne1SKqt3Hg-9A
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A57C18002A5;
	Mon,  3 Feb 2025 17:51:54 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.72])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 985741800268;
	Mon,  3 Feb 2025 17:51:51 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon,  3 Feb 2025 18:51:28 +0100 (CET)
Date: Mon, 3 Feb 2025 18:51:24 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] exit: perform add_device_randomness() without
 tasklist_lock
Message-ID: <20250203175123.GB1003@redhat.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
 <20250201163106.28912-2-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201163106.28912-2-mjguzik@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 02/01, Mateusz Guzik wrote:
>
> +	add_device_randomness((const void*) &p->se.sum_exec_runtime,
> +			      sizeof(unsigned long long));

I won't insist, but do we really need to keep this ugly "(const void*)"
typecast? and perhaps sizeof(p->se.sum_exec_runtime) will look a bit
better?

Oleg.

