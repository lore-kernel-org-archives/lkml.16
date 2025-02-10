Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A4684D0F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739160048; cv=none; b=k3tnWD0w03A28q6Plt1/KcZSgJVlauwFCOOgGDn/wGyBpQ70+d0661Tsja7ZbxbI7o4+K/cXt7j/Naalw+rHxcu61OQpWiP1+6wIbJQffQxQUntHuXcRjuaYXPI3LfpfSCsu4Ro2uU6XrikHWvpDwJsSntm0y7lbyIWa+K44GaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739160048; c=relaxed/simple;
	bh=ntsmlY0jpVX4Lm1eK1BI7ZOaVIn3coY8rcFBvAwAGOE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=q8+4c8U/oBTJqp+P3WxzwnbQhZ5xDd8y4Vb2v0+pdlbvuYNaZLIek5vYbK618FaPHT938qddhgrQ/zzL3GvpsHvgkqNuy/SktaC7P8hth7UuHMZhIPM9CeaLbqMCGuMq1AnQJwq4ejnBQd+ccK4tO3o/ryElYi+LCYGMYCNsADc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PzfRm6G1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PzfRm6G1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739160045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=SS5Smp61Ec5KdkvJmSkB2J4L12nhkco2Uk0Cj2ggrLk=;
	b=PzfRm6G1x2fBDBk/wieKsEfxX9K4n4eyFDpxpTmdallI0p6i1od96YwIG80M/FNNTl8meb
	V9wtldNU7Y5zcoiqlYU43Xvt44NSPKrmup4LuqMC4ITMxxcvYkWWWJh8LuYvqvWVWkw5s1
	3hoIw8/RxPQINiojz+bk844NzRqSzlg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-138-PmXzrWh8PWW2aWFr-3IgjA-1; Sun,
 09 Feb 2025 23:00:43 -0500
X-MC-Unique: PmXzrWh8PWW2aWFr-3IgjA-1
X-Mimecast-MFC-AGG-ID: PmXzrWh8PWW2aWFr-3IgjA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC8421800268
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:00:42 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.88.86])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D96991800873
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:00:41 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 51A31oe03267208;
	Sun, 9 Feb 2025 22:01:50 -0500
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
In-Reply-To: <iocqkifz6dsywt2ueqppsdw53bgcp6i7ju7vadxxxu7pow6w5c@n2wqgypsiq2d>
 (message from Alejandro Colomar on Sun, 9 Feb 2025 00:35:55 +0100)
Date: Sun, 09 Feb 2025 22:01:50 -0500
Message-ID: <xn1pw6o63l.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Alejandro Colomar <alx@kernel.org> writes:
> On retrospective, we should have added some more details to that commit
> message.  DJ, has the requirement of the size been lifted?  Was it never
> present?

The current code checks alignment but not size.

It looks like that was always the case.

And no, I don't remember where I got the size requirement from ;-)
(but at least it says "should" instead of "must")

