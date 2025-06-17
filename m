Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986EB1FFC41
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171214; cv=none; b=kJLJPDnBa7/5vwCMCJ1Mikc+EkuMjW6tKudvuPchK7AbTtRQvS185bDUwK5jJSJXYSsZE3PlPC40h1XKjxoZo+zupmeB6ek6jHFYFmEPdnf2SlmaaKtzvbe6nUTR3y0ViiIrORRI3kvk52m2e6+OjKlP9SdGcTPHV/OLtL6mqi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171214; c=relaxed/simple;
	bh=JhIMKMLXebhviSb7VZh6YK2Nz/Pox61Nbu0VpHuO6hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmbwPFGcS1fCIo4rAJnOZlI1UK7yLLCe+/rZo7yJTDjEuEE+FZ65J6rQ1vlvjfolJ7SRuhzkdb/BlhBxseCm8T+Fd72NmQq2k7LpFOwi4dl8+W6Hc/F7t6uuAP7KP6f7vrEIstDm7ZBrW9UV5A/Khv0XOEXC7YxRqtLCAdlvTFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IR+eIqbB; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IR+eIqbB"
X-Forwarded-Encrypted: i=1; AJvYcCUVxlClhKJuqUJb009S29Loa5K9LLVXSrZp96eZqpBLJgY/0fQEmhzKwG8ZNNFmcH4zMCmzSUFNGvEy5dQ=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750171208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhIMKMLXebhviSb7VZh6YK2Nz/Pox61Nbu0VpHuO6hs=;
	b=IR+eIqbBeuiILaqPpPVYHe0uS1REDvPD9PrZu3ssj30+ACoPrJ+OIiam+KhNujfYgGczoo
	Up2sVHHcWDnj+djrc3ebrusvpML/MN41fMe4ZJDUIvwCupGj3OV+47O9eyw/URgWNgAMRK
	NXW83RUrE6dW1ASPV3xt8ImKnYeu7Vc=
X-Gm-Message-State: AOJu0YxiYuEB5yd7oWYM7/1fTyFSAdo/k5+bJlXRrwnzRrmYGc9VbXVY
	P76WmHpvHHJ42ZfdGdc3FMmjG11fdn85Y3LI44EPc7n20ne/OOMwhYE+6w5rb+dWjuH5ALhznbN
	K5HLRWOpmYrIFjxtemYqTaMtOgE9aX90=
X-Google-Smtp-Source: AGHT+IEM8gnyUk8x9GGETvy6e9nW9ahwqvvawDi1sXVvfIa7rdlOmZSXTj7NqTTspQWSlRjvK9jvBFQRZKmZcWsJT0c=
X-Received: by 2002:a05:6102:cd0:b0:4e5:93f5:e834 with SMTP id
 ada2fe7eead31-4e7f62149eemr9194439137.24.1750171205298; Tue, 17 Jun 2025
 07:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617085819.355838-1-mhocko@kernel.org>
In-Reply-To: <20250617085819.355838-1-mhocko@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
Date: Tue, 17 Jun 2025 07:39:52 -0700
X-Gmail-Original-Message-ID: <CAGj-7pXN5hRt2XkWBCq6w0mx2qCLmyd_VnPTPCGn2hXqL83RVQ@mail.gmail.com>
X-Gm-Features: Ac12FXxTAkFHyvmqw04peE4jsGu0VpEepXsW6XSs1Bt9UoGOPB_xVLM5bjLLam4
Message-ID: <CAGj-7pXN5hRt2XkWBCq6w0mx2qCLmyd_VnPTPCGn2hXqL83RVQ@mail.gmail.com>
Subject: Re: [PATCH] mm: add OOM killer maintainer structure
To: Michal Hocko <mhocko@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, linux-mm@kvack.org, 
	LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 17, 2025 at 1:58=E2=80=AFAM Michal Hocko <mhocko@kernel.org> wr=
ote:
>
> From: Michal Hocko <mhocko@suse.com>
>
> Acked-by: David Rientjes <rientjes@google.com>
> Signed-off-by: Michal Hocko <mhocko@suse.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
