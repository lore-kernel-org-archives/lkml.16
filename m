Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D57080E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 19:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745089437; cv=none; b=e/dKe0qmzTlG7oHCz8D7x/ogCECN6phtI7CybAtfApT1qvQoKAGq+CKzWCvwJPwDGwdIXxSTpr5quke34AFSn7W4SG2gUWhyCUsv39r9cXwGi3KAi2NOupKV2u8NzPjKoL+YN7+107HaLHXHXo39UfY62xTM+9JWS3vpCWAe1ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745089437; c=relaxed/simple;
	bh=gQfoRlMU+Df3jZULZuiryeWimEQgD4okILMNicR4sDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8DBHtL+eUc4/Zon4Bq5WI7AEuoft//DdHGu3kvz5GGPRysatjPjLNadNCnIiIEWGVkcMbPBAJFW8vufL702Fe686og1qRtZokEiK4tl4bNJktiRK6tkK1qRpT5nxKTdkTQN770/OK8ShyZMYhx4h+RRU72gIHJCaYAPoqq4ed8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BJgSr2wy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BJgSr2wy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745089434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQfoRlMU+Df3jZULZuiryeWimEQgD4okILMNicR4sDo=;
	b=BJgSr2wyutBk/zlqSSHgKFkxE/JoWZvBa+pJ8vO5enI42n970/GEHSODuhiAK4ydpDTlvd
	Rq95uQJki2pXhhACqsGZqTBCQE1e9DXeRfQbV1JBBHy4ZiQ51gWn+xOYWLDm+oHDkD0mbq
	Xm9oRQVyEcu0fRjdYJjR7OqCX2yn01s=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-x5bFQdAcNuOwmbsRidU96g-1; Sat, 19 Apr 2025 15:03:53 -0400
X-MC-Unique: x5bFQdAcNuOwmbsRidU96g-1
X-Mimecast-MFC-AGG-ID: x5bFQdAcNuOwmbsRidU96g_1745089432
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22c31b55ac6so43884405ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 12:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745089431; x=1745694231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQfoRlMU+Df3jZULZuiryeWimEQgD4okILMNicR4sDo=;
        b=Nv8diR4nyKtB6UiojLOmN3dvASq/aL7Jl5K09rM0L8ukZ0o4yX5Odi3vrM7GeO4XRo
         e8y7wcmX8c69+nTbPAh+OfGQNGXvYE2EdZ9n+gmliejdAC/Q2jOa9Olfa7It6t9Mta23
         LhlbwERHTNjFnH5Dpx2XwGE96b/Mtbi662/ZZDCvhpHMw3Ja1MeiNlq6mzy2rPtsaoqw
         QGIjOr8gwaa0h9YBx7LCu+cqBuLxR7N58wYqlUZCDlxLMHthtZGmAg+jeeP9dBFfa5vM
         lxY8NGFijHozxwCLjjGjRRiMuTd8wNHZ2tJ/SntbM3WCBPtaFem8odzspPUUfla7192k
         JfqA==
X-Forwarded-Encrypted: i=1; AJvYcCX8aJbBfwPaKycY1IfA/DdFekLFyvkouPZ2XmIUBl4360eEsBUKkB8eBanCokTHc977YD1GFyYuFdKwiK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXlhFZmiv5V1q2FNTgW2IsNAq+EIGU9z3gat1MQhZCskWFEtDb
	U5kBvlvceCpcTLXMkaqolzlcmIG7HjLP0g6Qarmo7KxjOACVIjSbvnyWXfJHu6bZU5AQDESKkoD
	8v4PxB5AM664KXXeZV0l3K3Vz2cBxVqMFmBML+JB6+XGnajL+6lHJDgZs1R5P0npGpbZ8ro6E6V
	gJfZ3+7vbbPxbTosqIhnQj8Uh7mht07OubLQneKtYTdaLt+xw=
X-Gm-Gg: ASbGncuAwb+YCs7RZjzw6slJbJSETfCp1YUDTThTYYSGcRfDOBVAw9Dd6JQ5rHOIOFF
	itvRGQSFzZ8sFNbeHwe2l16kZmUpZuQ3YPMDZPKGHgK9bRbCs57X5DMZm34AX9nPycC0=
X-Received: by 2002:a17:903:3c6f:b0:216:644f:bc0e with SMTP id d9443c01a7336-22c535c9db1mr112462315ad.24.1745089430903;
        Sat, 19 Apr 2025 12:03:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYOHQmSctOr6jM5nXIex6dgUr+moXOSuS6DqPsFpZks3IilYZAEc/WBGmExfdeTa+VSuYroYS2cg5fqrON8jU=
X-Received: by 2002:a17:903:3c6f:b0:216:644f:bc0e with SMTP id
 d9443c01a7336-22c535c9db1mr112462155ad.24.1745089430635; Sat, 19 Apr 2025
 12:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250419065335.211252-1-wdhh6@aliyun.com>
In-Reply-To: <20250419065335.211252-1-wdhh6@aliyun.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sat, 19 Apr 2025 21:03:38 +0200
X-Gm-Features: ATxdqUEp6lJ3UULIBfICLsR5UZTdJGKnBXk0F-b-9tVbspGGjg1dKQofqV0Nl9c
Message-ID: <CAHc6FU7rJ4uh5mL-LGNUT1EtTK8BKmrh+S+Gq-dqwVjoviQWxA@mail.gmail.com>
Subject: Re: [PATCH] fs:gfs:glock: Delete the invalid pointer insert_pt in add_to_queue()
To: Chaohai Chen <wdhh6@aliyun.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Apr 19, 2025 at 8:54=E2=80=AFAM Chaohai Chen <wdhh6@aliyun.com> wro=
te:
> The point insert_pt is always NULL, no one will change it, delete the cod=
e
> and useless logic about it.

the code in question has already been removed in commit 0360faca5d4d
("gfs2: Remove more dead code in add_to_queue").

Please always check the for-next branch of
git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
before sending patches. In this case though, the fix has even been
merged into mainline already.

Thanks,
Andreas

