Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D01ADC7D
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 18:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738433979; cv=none; b=TwBF+sPVyosA1pv75br3Cu9XxX7h8a7vonkWpXHXeWvcZf3vSioAlQf/RDmcjbtMtEUBT+oqm8FomK4iSZyA6hChQYUEVrCfu6grm06H8QpxImGN8cZF41z7y3Zt//EsEbhfzalr7cYqraBrj63IQ2tfg3U6zoED/xgt9RiEMAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738433979; c=relaxed/simple;
	bh=c4zQCo6RGtqnJCpf7ugjtSUqvmgfuFV18WaiB1+qGew=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GXkqEN4s8VxYKgLk14vu1xhNoqUjClwS3HauYowlXXi/12xxQKExuiWQpU5kgoXE4I6XZmvmgeNmIdYHGQLUcthl0uATLdUuRaF4tE5D7m2EqRvpwjVt5SK88TkqT+SWDDlBaRQehZC7G5uCyAihtHhhdhAKNF6fCb19BD4PfjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijm2OYZI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijm2OYZI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436a03197b2so20935075e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 10:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738433976; x=1739038776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxnKuQKrMFisnjQoJYcahdpfPfugvdcfaFsvhS5tvMY=;
        b=ijm2OYZINmlqa0ickZGuOwOCxfnuaNYDVoKWK/VWKNQqgw3PQyd77+iLBmBPtogeML
         WmumM8wItMMvZ4GYBZxtgtZw3DXhqgW/FGPFVtjFbhQYKyZUanwXegd6geeG/6kcloF6
         R39wcW8NV4ISShIeahSdCtZ7uNsm8XHifTtYQYZD/Sq7+Yaebo4/lInIPyJjzpEOrqYY
         /1WNul6S9K5XGgqzqxBY+VX14ob8XmSB7cbdzwZs3FAW5U581buW6GJTjMR9Dr/GFH+Z
         SmKd9PiztzcTHospz7J2AUtqGi4z26robI5OVxqv/KIN2CAZD45XQw+T0hOo/OAyaraM
         TCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738433976; x=1739038776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxnKuQKrMFisnjQoJYcahdpfPfugvdcfaFsvhS5tvMY=;
        b=dsDv2em/J9Ube6y+GQutcU68PvKK318ylxCE8W9OYlC0ugmkMRRV5zizMgq2ztN1p1
         Z+Mb2+t02cLAX9Cay7QaeQgV5Jhc2sL9cAXBBYjaVxqQ1v/jNnbJkuGzSAJtMbrPWXNs
         HMkWuE8szqQbF2tiHA6Mi7ut84zaFiFPaef6G5/vTN5iaQnJRrnJUEFt6hyIcMG9SGH+
         mbvtH1F8JkT/Ka/l4yZeQOu9bEz/vVuX9jbRZxoQvN8cWFnE1ntgj3FAYjlPENqu7JfN
         ece24xB03HXUh+VG/KkeGHJi15UXSz9xSdIYiAIwsVTIqiS8/1sawu43QJzQ0LNmxMrD
         W3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWo0++bXqFMtmtSsgOFB725B5bAvlgd3ydMUREKTPknIvYnye3xzzAsU3Ar1ClyItonxfyvIFsisdDuV0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsK9j05V3YE4lc798D3+x0uxeX/iCIk8K78sHogeBMumXcAJWI
	kn3y7vWs+Y4LX2ilNiZfy/gkw4HKeGWHGdqeWRMxgvVFS0i04fup
X-Gm-Gg: ASbGnct7ssS7ZnQhJEEVFSxnFCcx0k7DRB+Xn/T3QIK3XnVoYMxjzAtGGiLdMlH9k55
	YrJzywfLSmMX/q6yEi+mpu2IgGNbai71CJYKNkFjvtI2A99VY8N9DzPEyRnRbr7kViOmp1Sx0wJ
	l4bBkSO0KFGO5thPh6C8xDB6YMJjPL86lNFMaEqlZ306NHi9RJHKOaPs3WqVUxuBNA1mgdgqHQB
	jpfHwLmgaJHrkBqrRyvErVQ3JxittdBA1GDoBv2UvvvXlVbDqkMSioLRuD8Mbh9HdSrWV38+B/w
	Nq+d9QXsT77GUKb6Up0+LwsO42F7Nug60WQJqM/iWGHYdDfxNye68w==
X-Google-Smtp-Source: AGHT+IFF67KlYecUL0WmxKFTDoupCkyQsPEKSCULBGUTcLaEj+DN0Nn3mH6LnycLqR9SDA9Hwk/z8g==
X-Received: by 2002:a05:600c:524a:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-438dc410c08mr125944455e9.21.1738433975969;
        Sat, 01 Feb 2025 10:19:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de016sm95980555e9.9.2025.02.01.10.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 10:19:35 -0800 (PST)
Date: Sat, 1 Feb 2025 18:19:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] pid: drop irq disablement around pidmap_lock
Message-ID: <20250201181933.07a3e7e2@pumpkin>
In-Reply-To: <20250201163106.28912-7-mjguzik@gmail.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
	<20250201163106.28912-7-mjguzik@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  1 Feb 2025 17:31:06 +0100
Mateusz Guzik <mjguzik@gmail.com> wrote:

> It no longer serves any purpose now that the tasklist_lock ->
> pidmap_lock ordering got eliminated.

Not disabling interrupts may make thing worse.
It is a trade off between 'interrupt latency' and 'lock hold time'.

If interrupts are disabled then (clearly) they can get delayed because
the lock is held.
Provided the lock is only held for a short time it probably doesn't matter.
Indeed, unless it is the worst one, it probably doesn't matter at all.
After all spin locks shouldn't really be held for significant periods.

OTOH if the lock doesn't disable interrupts then an interrupt will
increase the length of time a lock is held for.
This can be significant - and I mean upwards of 1ms.
Network interrupts can tale a while - and then the work that is deferred
to 'softint' context happens as well (I don't think a spinlock stops
the softint code).

I've a feeling that unless a spin lock is held for 'far longer than one
should ever be held for' then you really want to disable interrupts.

In this case if you get a network interrupt + softint while the pidmap_lock
is held then all other cpu won't be able to acquire the lock until the
network code finishes.

The same issue makes futex pretty much useless in anything trying to do
audio processing.

	David
 
