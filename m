Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C5B22E40A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026026; cv=none; b=PFiL1HosOZcYv/FF5LxL3Yex9PGd6peinZ5VY8J1pIArW7mx98VnryAKSD0NjC/e1j+YwzKXLEuu0ZbpPpEQAJ7/xqCIYjdmzB2qPAJ9wuAHgBVBg4gUFsuEG+KAfSYqmRF1OINwpfOGhHvuxFACGLUbglKUhGFr/Rxr2/Gw/kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026026; c=relaxed/simple;
	bh=XndVDOO7lIn8/A94yXyhdJAIhkY5WjCTTAdVJ8dOLA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHqAVMTsbLtLMo8RoucmKN2akZ8139IZSusIDT2IIpOwSK7k5W2m7XUEIgbkPg+dpScATkh2Rs2uWE+9iDJpLHB6ETBn+hkVJ4s0pObFHEOfWmOJf6LpJQ72MGsP3isZUG/mM9CAPUA/VeNQ1UMgc9hL+rJuIVkNAa8Q/4iNJdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZAhycO7q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZAhycO7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744026023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHbPi1JEW/89my5vo0fU+kVo3zInspEejiOOz7JNSc8=;
	b=ZAhycO7qku7LWgAxYwbupTDVXLUxOk53WwF/izZtH2VP9WGjf9BGw0hel2Lq8wF8GS/z1b
	KcgMyMFtL6oluKgkWpXro204UptZWwcR9qTHqxstDpRaNffYtiGV8cg9Cc1Eh2tUloo312
	SW7tFV8tB6EHIXyx+AlUOJTAt4RN6WQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-34-tzx01GQ1OQWyu-mSribLXw-1; Mon,
 07 Apr 2025 07:40:18 -0400
X-MC-Unique: tzx01GQ1OQWyu-mSribLXw-1
X-Mimecast-MFC-AGG-ID: tzx01GQ1OQWyu-mSribLXw_1744026016
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2BEF91956080;
	Mon,  7 Apr 2025 11:40:16 +0000 (UTC)
Received: from ws.net.home (unknown [10.45.224.198])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 324F31955BC0;
	Mon,  7 Apr 2025 11:40:11 +0000 (UTC)
Date: Mon, 7 Apr 2025 13:40:08 +0200
From: Karel Zak <kzak@redhat.com>
To: Sheng Yong <shengyong2021@gmail.com>
Cc: xiang@kernel.org, hsiangkao@linux.alibaba.com, chao@kernel.org, 
	zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com, 
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sheng Yong <shengyong1@xiaomi.com>, 
	Wang Shuai <wangshuai12@xiaomi.com>
Subject: Re: [PATCH v3 2/2] erofs: add 'offset' mount option for file-backed
 & bdev-based mounts
Message-ID: <7nupludayogog6jylmwnxwel4zlvfxeozzcg5qkf5g5a5fpt7g@3bgvpbqfuxxa>
References: <20250407110551.1538457-1-shengyong1@xiaomi.com>
 <20250407110551.1538457-2-shengyong1@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407110551.1538457-2-shengyong1@xiaomi.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On Mon, Apr 07, 2025 at 07:05:51PM +0800, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> When attempting to use an archive file, such as APEX on android,
> as a file-backed mount source, it fails because EROFS image within
> the archive file does not start at offset 0. As a result, a loop
> device is still needed to attach the image file at an appropriate
> offset first. Similarly, if an EROFS image within a block device
> does not start at offset 0, it cannot be mounted directly either.

Does it work with mount(8)? The mount option offset= has been defined
for decades as userspace-only and is used for loop devices. If I
remember correctly, libmount does not send the option to the kernel at
all. The option also triggers loop device usage by mount(8).

In recent years, we use the "X-" prefix for userspace options.
Unfortunately, loop=, offset=, and sizelimit= are older than any
currently used convention (I see the option in mount code from year
1998).

We can improve it in libmount and add any if-erofs hack there, but my
suggestion is to select a better name for the mount option. For
example, erofsoff=, erostart=, fsoffset=, start=, or similar.

    Karel


-- 
 Karel Zak  <kzak@redhat.com>
 http://karelzak.blogspot.com

