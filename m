Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468C628DB7B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142705; cv=none; b=unnwbaZR3+jDqMVwk84G6FGJqaX08LEoHA0nloshROuW0Wm0ZcYRVWJohC8pS21vAYoGJvXduL6HCN7AH2KDF7TiNe8LzdGsJtylPZc3tWBYcwv9q1aLl8eQA6ASV6gsPuvYWjhm6uwAGZAXmJpdslmrQyEdmZbVNbjInkr9irM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142705; c=relaxed/simple;
	bh=m5uno+yxRRDHdSCLAJYC1ZT684UV9Hvs+LIKYsGOu3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcWvu/wYam5wwRNggzLb5qxAk18hAFIPVwylLDhl+TCLXNVpRs8O4VF8UbjtfHRXVGf3wVt2jXhueT3Rx7/W96IZH2V8KfudUlesGs521/jx6kPrysDlMfJse4UdXHnJaKLpM1acBBeL1M9VLEQV1XSdZwhv6X27WK42dW2MEHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K9WJ1sbj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K9WJ1sbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747142703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PTe0m87d/2KukxI6xkyBh21UpdqYlxgWz+zdwIYaRG4=;
	b=K9WJ1sbj9Wv/EVL9kvDFlfTjyMoR0uthckIh4Ty3K9MeWfib73cWNFr11bx4pFO/FD6KGS
	bti3Gw9zwghAgpZaHO2TEZgR7DuqZkDkFh+uXkKRl9yJkdJj3JggIm76sXNNZjr/2UtWLP
	aMnCo9Rj+nkax+DjYVO4iHSFz2bPfV4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-P2fSh1arPwGiOHxQiF9laA-1; Tue, 13 May 2025 09:25:02 -0400
X-MC-Unique: P2fSh1arPwGiOHxQiF9laA-1
X-Mimecast-MFC-AGG-ID: P2fSh1arPwGiOHxQiF9laA_1747142701
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f5c9e18c32so136163666d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142701; x=1747747501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTe0m87d/2KukxI6xkyBh21UpdqYlxgWz+zdwIYaRG4=;
        b=Yv6wEUvznGJM3Z2/HeeFShuDcu2IMwyOkA+hpKNQefg+jAYvX6w0NmY2ZFCLmFNNDj
         wRQKYKocGbdRi024bl79yrFWOmFPoY90g4rpNpbXaT8rbDalikaGjHLXmp8lR4Ql7x5J
         cBcCGw4Qa9CCSAeKqOsF9XpC5Nx1+7l5s60M7Q/LTF+5o4Lcwpt9aivCZejbZkyiYEx3
         +zHVfhm4stdM7BJdEjuBz4B7H0Qb/h8OFv1y9kC7AQfXjJ/bVBy4ckuTeNHXWmNHJHQi
         svaCavqVlc8J9WrqQZehZ1T8uRT/8OmCqW7qgEQZ4cFWuRR5nx/tzjKfe6ZaZEhwZ9C5
         llgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmgLjk3tHuDrwXrK0l09y8pEmiopuvonZ0zyutkNhuK3UNIKy0FBimrKuHINLmtCLv3ch7iBnPDAvpJvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfBxpl2FWuCeAcyxzs2bESVuRt01FfLd7NkuFfcqzwqHBEuI1W
	//XJ8Jg0Y/kSzMzLv+Rb71sZbxMqJvNpVHVUMrFutOk8xEFQPYJzaZHldDmaiUWnlij58jKTGfW
	F0/Z7DttrCGw2HgHk6rcMZYV/TTO5UwMEC+vl56Q60sLKQduzrFfGdbh4A+ubPg==
X-Gm-Gg: ASbGncsS/tJLcgvOBfQ7AX1KFVTdYDGZDoVHXto6VuUJzNwju+Zq0Iqu/vw1JeGL9gu
	j/U/ZwBRLR5Wqiy1pgyqYDEjATUuCKZCufnOx21BAAbbvyHMUPNkcfB+BlW2une1E7PaxcdsUJl
	cPJI0pHPs0e8XBz+59QMGw+3S2+OyNkQ9GMz1XRXGHHfI24b4z7dkFYgKbnR8EcW1RRMtqIURz3
	kjZv4wK//k3w6+oQfcqCAd5LZXz/2FZn4WGflF//R4c9qBK4s0PxoXNmWaRbOT7jZ+wbKGYlnRY
	exk=
X-Received: by 2002:a05:6214:5197:b0:6e4:4331:aae0 with SMTP id 6a1803df08f44-6f6e47bc67amr236648286d6.1.1747142701455;
        Tue, 13 May 2025 06:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWSwUOUh7vlm/ltHVRqMb5l8+jKcoxi+lnHiIKQ34OJ3QJBNItngQ2T8pL8akuEcm6Y1CpyQ==
X-Received: by 2002:a05:6214:5197:b0:6e4:4331:aae0 with SMTP id 6a1803df08f44-6f6e47bc67amr236648066d6.1.1747142701124;
        Tue, 13 May 2025 06:25:01 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a0c668sm67122246d6.68.2025.05.13.06.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:25:00 -0700 (PDT)
Date: Tue, 13 May 2025 09:24:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Kyle Huey <me@kylehuey.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	open list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
	criu@lists.linux.dev, Robert O'Callahan <robert@ocallahan.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: Suppress pte soft-dirty bit with UFFDIO_COPY?
Message-ID: <aCNIKm5OJ2h12z2j@x1.local>
References: <CAP045Ap3e6x52TvB8WyBHBjJ8HYtAmnKnGgj_fog3P+F5igP-A@mail.gmail.com>
 <aBkaDN7N_6qDGdIz@x1.local>
 <CAP045ArAVtR6_Y-WWcqpB54Z+fwNYSWSyrTZKjctocwA0sK5eg@mail.gmail.com>
 <CAP045AoWZQZvLR8B0h09XL=cS2aD3yDwtthdeZ64JWEOPkZ_=w@mail.gmail.com>
 <aCIZqV6mEQZftFvA@x1.local>
 <CAP045Ao-onmzcVSic+4D+aDc_M9HTF7UK3NAdC5BcZvDmN370g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAP045Ao-onmzcVSic+4D+aDc_M9HTF7UK3NAdC5BcZvDmN370g@mail.gmail.com>

On Mon, May 12, 2025 at 10:16:12AM -0700, Kyle Huey wrote:
> Personally I don't think it's a real issue to have to create a
> sacrificial fd once at process initialization to see what features are
> available. I wouldn't have even said anything if the man page hadn't
> explicitly told me there was another way.

Yes, that's indeed the part that could be confusing and needs fixing.  Just
to keep a record (I have you copied), I sent the man-pages changes here:

https://lore.kernel.org/r/20250512171922.356408-1-peterx@redhat.com

We can stick with the sacrificial fd until there's a solid clue showing
that we should introduce a new way to probe.

Thanks,

-- 
Peter Xu

