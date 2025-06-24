Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBE22D5C60
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775745; cv=none; b=A8YXPyjDE4W+9czkHL+UwNp714+/Z8lXCWSYqbpdfi4obUqnM6k+QsbRDTWBXJ1lz/xttPS9DjULFtlM+SvlLZXpumCwk0MNQiMIDORdcB1mqeL+D7wrM7jNt/PcduMEhegQGzxcuPFksmHXeAnGAd2iXcnGcdnldTKoz/ij5yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775745; c=relaxed/simple;
	bh=f8Ttbth1lSRYVk3cS849KWdm0sE/OLPquEEzCqknLrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVGFEKBvUE1A+E7+ze/GoAqtr3Rw8Txg0Mex5/L9GfZTi6i/8fdAU3c7NMkNEiVnvcl5lhpcU8xAr3KGxLufUi/nRh2oY4aWLE88Zh2ov11cihKbKWj6mNVVSzSSXucsd0UkI3q7dNFsiDkbnR0qh+W2FOvq83kZb+u9YFBqo98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=01ub9wTb; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="01ub9wTb"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a58ef58a38so170531cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750775741; x=1751380541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8Ttbth1lSRYVk3cS849KWdm0sE/OLPquEEzCqknLrE=;
        b=01ub9wTbh7IuTKWtOT88YxNBAOS4ETujN45Wi7eX+ECtWzD69ZlAQbCHrR29bJ/Of4
         u2dc5M4HdmSTIJBtxhH8obs4WlzCmafRQ6FOT2sqpjvOxmrBA2OwCjW89Z7/k9F5tqch
         3CT7I1Pn8ZaaDDhNuPvOZAC4hyeRDc0HLbiHSc0WvhoscfGYtrn1+Dgqw9u+dwFs5Hsc
         IBi+2iNR52LvCmKRO55xybTKoOFpDu6QI6F4oMMVuazYQIv2ZQJ4WBvZu7Tb74D99Y5L
         zTVhh37CDDQQShRaAGbE/jTqOZxcOA+djMG0AoeZcnKFrawDwATnhIaDdLCmkg0LSQVB
         RVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775741; x=1751380541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8Ttbth1lSRYVk3cS849KWdm0sE/OLPquEEzCqknLrE=;
        b=EsT2qWtzbFPLl43S1mpJDLycMbqk284neLz6aTq29dN9KTbGYzU5gFGmG6KW4CiDlx
         LFiRmTUZp1AXbNFbdr6cr3O1hBZvbeZPrTgYaitEuRXX3czRGat65oZnew270ILuyoY9
         QR/kDqPDl3aQQ3evfrMOhGFsRyRW9/gF6a8IRGKLY2WXSdJC2Unl9IcLsOAk8vz0lCx3
         UyvCYmiZYMdxjXC/NDg/bZ0UgmeaVr03ig5rNMGwIEHEWMxYiTr3qm9T2r+XjRrcWK1l
         pTQZAkQxpaaGuzIoFzPU9q61PKIjcYTQvOYMkTBG8SwJuV3qOMTu6C0/lAm87UaePN+z
         ++sw==
X-Forwarded-Encrypted: i=1; AJvYcCVUafY0hfVyv/cVwXHVpQ9gpVGA00Uy0CwOdjNUlUtbS/ZXGRxMwAKX9I+tbPiT/hzhfa5ciMDfpBc+JrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWjHy57FdGgtmhPuMK5ofzLzzri7O7t9a/goVy59gxrNu30Ix8
	eNqm7ivD+B4riEqOkdHhfYZCN8LaE7ORzYdl2vtcM3LGrl/fqiPX1ONGU+bbEuSagw9vtHB5F/H
	k44tE6Fa3i3A+1EnD3mq/VfuYfZcFEohgkBJkvApo
X-Gm-Gg: ASbGncta19N9/YeEBKkxbQW8a+Jlf0xoPFfYU50nIwt/mPp3Q69QJwvAf0M4smRjNXx
	j1Zc5VIhF9ifN2bn9mFoUlZSGym+o6ikPV4FSyB0tctlfxM3m+l3ZZQSgzAxX2sUap+KWuH4pHq
	LL/eQjDTXAmBBH5YtbXCz1lUao+lw3+T6pA8I3kM5Z86SEG8vFZnBe2mKkNzUEMy6S1uJlE1fag
	w==
X-Google-Smtp-Source: AGHT+IGbOLiPnX+SI3NX8t68TwtbOo+6EbrT73IrWaYyPOLlCVLXFVqD60N/63lknLZQNwp34KEetvwdECwuYczVKR4=
X-Received: by 2002:ac8:5f8a:0:b0:476:f1a6:d8e8 with SMTP id
 d75a77b69052e-4a7b16ecdfemr3417201cf.11.1750775740423; Tue, 24 Jun 2025
 07:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-4-600075462a11@suse.cz> <50eb8b8b-cea3-45f8-96d0-45ab88e10909@redhat.com>
In-Reply-To: <50eb8b8b-cea3-45f8-96d0-45ab88e10909@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Jun 2025 07:35:27 -0700
X-Gm-Features: Ac12FXxBF1N0o_kUn37BSxDHGqpaUKTMuV-y5KNe5HB1rThBZBc_dSO4sDsZPxo
Message-ID: <CAJuCfpGjkkpWnb_BB2gKZpitop_VmsasS6dgGGeXpPaDzuNmXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mm, madvise: use standard madvise locking in madvise_set_anon_name()
To: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Colin Cross <ccross@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 7:06=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 24.06.25 15:03, Vlastimil Babka wrote:
> > Use madvise_lock()/madvise_unlock() in madvise_set_anon_name() in the
> > same way as in do_madvise(). This narrows the lock scope a bit and
> > reuses existing functionality. get_lock_mode() already picks the correc=
t
> > MADVISE_MMAP_WRITE_LOCK mode for __MADV_SET_ANON_VMA_NAME so we can jus=
t
> > remove the explicit assignment.
> >
> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> > ---
>
> Acked-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> --
> Cheers,
>
> David / dhildenb
>
