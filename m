Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6607DA6D
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747799136; cv=none; b=Uf4D0CMVgtM9Xfdy83z7mMEem5p4O2u3OgabT2GRDZAehk9KEhzDQRI5GpbMxF0G1RBPFlNz/i4r6cPELdFdsoYAr5gMqbXkyxuuJQ1f4mK2qjxFza3V60iCKBN5+t7m7SJM2eTpZWGcADKkA1Y2IahgQdY0yP4Yq8hoZ8ZHGC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747799136; c=relaxed/simple;
	bh=O1nUeuyf60caQs4YipXkwwtXoVtAAWz1hiZeNTf7u8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSX9d9TuBQ3cIJr1NI/SYmDOC+vGDr4/snyOekWvjceRNknO5+Sk/QETMgggyQ4Up/AFTLSs7YaazuCnnWNbgif8y8wtwo4Xgn/+hfNDztPPBBlGDM1urClNpfg3uqpR5QjjQA03z0tDdxhKajA/9p/kakUwBDNXAPBcA+S/3ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=esXC/s7o; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="esXC/s7o"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742b614581dso4896747b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747799134; x=1748403934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7hEoH+zcw9qfhoA2RR7ZUMoaHFS8IYXKKvYv1G1J4U=;
        b=esXC/s7oDNaC4Lb9sctnmNwZ/lp43kX5EFSj4WTJkS1yCHDIH9vUR3NHBgord6BcC2
         tm7ul5//vRCrevpgSPI7PANY5GGCNaVGYuOjkWz8h9NrIhUlaRiJvSuPr4h6Qol3tWjr
         5dAuAaNJeYrtCMdc6EIRng1eh4RUs+j3ktTnsVCayZDIxokWXCF+O9j8u50rFMRmVo1I
         OpcauIaBoLhFbWyH/QTC0V7Xub5zx85qs1DVLwHoxhIW72nlFwW5n5+pkcHXWxR7xPxg
         yAP3FUuDtsF4MFuU4zkR+i8Ss2RtTk34XaHU1iwgo3gb1SS2yFO+VBnurmCy67SqGCUD
         XPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747799134; x=1748403934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7hEoH+zcw9qfhoA2RR7ZUMoaHFS8IYXKKvYv1G1J4U=;
        b=nwGM3w69VMSj0i4QQcQEU7wYAcjPtEZKR//hfy45R+/arCDKGz/EBJFqI1YQeH/t34
         zkoRHywjOq+KKcZwFN1vwa+NJjeCTftu0AU6iYJvPnfcrSliermazP5NScPoeFZp299t
         159cERwMciwLdGqKQGqauuoqjK7oY9hGN3O2XriqUuaeY+QkSAQQGmXl+D5ouX5ArkLm
         qjopzD8LymsCihHq7WGy640zKa1eyaiFjhGGIfEdgEdm9LOvBBUko10uUv/CMG/2KQSd
         Cf+VlxFhvXjCmgFOw/dY5CWH+5wUNYORexA5gWNSaFO0UsnRqBa8MP9RrVxWpeGiJoIP
         lL/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsygfySiUTZK+2dt1Cb9+p5M9ZwTROBXBVK2NLFepWEWqTxYc6gYgeIKEQFtw+jbEBO+r726XfiiPtAqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxerLHNzRuY8WdaP9BTeNffFcKHBUHZ1wbDd0ed/hhIRxmBPZwF
	BSsdv7nUMot+4r3SEd37eDBZP2lwxt4Dqf1/YLrocqpEP4u5JG1sZQDOfWU7CGeB/GA=
X-Gm-Gg: ASbGncu0kkgyrqXJD8KDMp6wnrjrNGMEWqsopLWkd1+MPKLKupgUIMHYyEBzM80aVSr
	S4latyME/TJcOrfXoc55bv2aKT5QHnkaWki/On0DIt4qWpWNz4rPVnrgjANan/d53rYVPBHFuSE
	EwDZOOBJk8T64I9kc3aitRE6/YALPJQSP5LqnSMVmY2zT9Jpl8VDeF5ygFYgpSDMFwV/396R7al
	L9hNfdrKjpMDgy2GaRTF0oKlnTpRDdtuvirRwGZ0vqHCJcX9l8pR/zd4ENiLdarVqRlSgzjv0Hu
	OppXw/8TkYPDlQVneLTNecdkOXl8bGXmKQ6Xmlrv4gwRn7LLO4Uq91GJ2eqD0uABa6b34I/S6ip
	+jw==
X-Google-Smtp-Source: AGHT+IHVAeIGc5tGCopyE1Gs/q/I9hs3854vPW79q21Hs67M9n3WZLDyg+LCqQHMBAq0cvQEEuAojw==
X-Received: by 2002:a05:6a21:6f83:b0:215:de13:e212 with SMTP id adf61e73a8af0-2170cb325a4mr29600337637.15.1747799133868;
        Tue, 20 May 2025 20:45:33 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0843d1sm8845883a12.49.2025.05.20.20.45.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 May 2025 20:45:33 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: alex.williamson@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for huge folio
Date: Wed, 21 May 2025 11:45:27 +0800
Message-ID: <20250521034527.74170-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
References: <3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 20 May 2025 19:38:45 +0200, david@redhat.com wrote:

>Subject: "huge folio" -> "large folios"
>
>> 
>> When vfio_pin_pages_remote() is called with a range of addresses that
>> includes huge folios, the function currently performs individual
>
>Similar, we call it a "large" f

Thank you for the reminder. I will correct this error in the
next version.

Thanks,
Zhe
