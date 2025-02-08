Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A7179CF
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739046097; cv=none; b=A6KE2XVmht99AybOftH0D7wCd3FAGeP51XkV4T1vI6XvLSOdhn1vbWJoT86kZ/K5aRyVYYHwvrgAwFyaeiZuZrXa5BKRg9mM0V6DbD8/ls0MqCOt7PT+8YcTqNFnGshRh/QpJ1expOzB1aVS23nWAHeuUICA2v2bfkAmFXEjP8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739046097; c=relaxed/simple;
	bh=x1OIqM2FU3HqxaNcdd87MOtNvlcSZVhKbB9f+9f4H9I=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=fGGM4XJdQvU/PhQUloFL9QgZLfSSCrIe7mairSf4IiaH8Y0FEay03Mkb2dEw4SeiILJLBBEwgw0s/EmBvQeLx/Zdj5bpXKj0lEAAtINZP6jdLEUeEv+bNC3Rm1JO5V2vTxVBncgdUOq6x2M0dVVGXXR01CeWoSw6sOHdzHmESR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M4BsADJY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M4BsADJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739046095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=rDfuiscGWjU0HzVClM0mdvNpLypV4eXXeeagWgAcPN4=;
	b=M4BsADJYYjaYCG+K5FWmFqeWHCPUR8cAnJuC/5sQ0gnrcLYn2kdZ5KFOasoBFksjbHe355
	q+Rf/lINCO1SfK6iTRvVDlJru6TKc4muwL2eTLRCgRX6ZFl52VmQTDw8N99sp6fbVDE5fA
	JRHZweq+6apl5JEHKOwzZ99XnjdwDec=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-sV3q8yFhPIC_pe3mlhzWMA-1; Sat,
 08 Feb 2025 15:21:31 -0500
X-MC-Unique: sV3q8yFhPIC_pe3mlhzWMA-1
X-Mimecast-MFC-AGG-ID: sV3q8yFhPIC_pe3mlhzWMA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1117A1955DD0;
	Sat,  8 Feb 2025 20:21:28 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.88.57])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0A89E1956094;
	Sat,  8 Feb 2025 20:21:26 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 518KLOcp3191142;
	Sat, 8 Feb 2025 15:21:24 -0500
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: miguel.ojeda.sandonis@gmail.com, eblake@redhat.com, will.newton@linaro.org,
        eggert@cs.ucla.edu, linux-man@vger.kernel.org, dakr@kernel.org,
        tamird@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
        boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
        benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
        tmgross@umich.edu, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
In-Reply-To: <kfkku4rjsktgkufkuehliojv3izxdutc55inmv3yvenu33zr7e@lluedzjnqnki>
 (message from Alejandro Colomar on Sat, 8 Feb 2025 20:19:22 +0100)
Date: Sat, 08 Feb 2025 15:21:24 -0500
Message-ID: <xn4j14nq63.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Alejandro Colomar <alx@kernel.org> writes:
> -  aligned_alloc()
>	It makes sure that the input is a power of two, or it fails.
>
> -  posix_memalign()
>
> 	. . . It requires that the input is power of
> 	two,
>
> I wonder why glibc silently overaligns aligned_alloc() without reporting
> an error for an alignment of 2, while it reports an error for an
> alignment of 3.  It doesn't make much sense at first glance.  No
> standard seems to require that, so it looks like an arbitrary choice.

Because 2 is a power of two, but 3 isn't.  No power of two is a multiple
of 3.

GNU malloc only supports alignments that are powers of two.  The
resulting addresses might *happen* to be multiples of other numbers, but
you cannot request that.

As for why, ask Posix:

"If the value of alignment is not a valid alignment supported by the
 implementation, a null pointer shall be returned."
 [EINVAL]
    The value of alignment is not a valid alignment supported by the
    implementation."

