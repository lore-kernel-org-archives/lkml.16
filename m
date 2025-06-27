Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766FC1DB356
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000553; cv=none; b=FowPFq6F7aUg2L2rU68ekbj8wzSquiVDmUwjaVg9kLyHjByTsXkw0KpJtnfggezmMFuj6mi+SubHb0S2mMpXZ/fuh66MUN3wcnQFZwv8n20QFX1r76BK49j2fdr1AvZScVvFVFztOZfCNOW89WsdrXFMvQmw0atmTr0ONfnrZ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000553; c=relaxed/simple;
	bh=yEyVocKnMCps8xWL9t4dI9N+dVYbiLKomAWOYOvHcuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vAdEeIXwpVIf6iv+Yvm6zf4lGPCz83ZNSthd4xQcPIVRHko1BTVbm5FJL6KoN4CwEV4h55MmGzwwpKaH1aiAI3pnnvUAT9OxHURgo4oDNzYDTL9Q/urA927rrWVMUwNFdrZTopqpYioGQhZuTT59rZUU+tVfPcGZ0vnzpcJST1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg8Es8Bf; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg8Es8Bf"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e7fc3309f2so375910137.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751000551; x=1751605351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEyVocKnMCps8xWL9t4dI9N+dVYbiLKomAWOYOvHcuE=;
        b=Vg8Es8Bfhr55E2WZc+J/6c9X898i+8Yi/qcLD7bUnx4lRvxtHGPWJOmBqONTyLNWL+
         9HkRx2sOMM2y/sVM2grsgZ1K87tvh4O/AVPEJR/i0ZXbbB9DOlFRqI45Zpkm/109SQXo
         9DfUjrR0RW2xQPQ4kPb8ZI8gRiGsc1k9KfsJCqfLwqqVlmGXqxsbv6tcTDNAZCIovgHI
         r9v2OZVgEcg0UNVWTkWpIfkxx3JglpNrsEZHyPNHfp/ChzDXGr0fLs2wNmL6Ob31mNLO
         Swa7HqkFf7MZZSdLjdqM0af1mtNi5yd6x182RLV8scmWfzAkMnbgBj9HyAB1ojREw5gA
         Y/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000551; x=1751605351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEyVocKnMCps8xWL9t4dI9N+dVYbiLKomAWOYOvHcuE=;
        b=HfjvKmQtiMMUeL9IB0l0/PTqazu7u5b4o4nS8p2YQM3bwzegTTIFClvhoX/+uqi8cJ
         UcY9Hj2cuqSX9n4SC3wuv/e2jITElE+okWXEBkQ51a+zAFgHLvilrhOw/KQJCNuNDUxa
         ugbSugyuEu3BOSiWWUTv+JYgmbbZRRYcoe4c4asOuqe4r2jRrKWDy8iZooP31em9xICa
         RTKVBuqnXc8hBahrRTKF0/VrAV7Ga+hfH8q58V+ZKusiOW+25I3pZNMIxYFKpGagoALH
         MkOOQ0DAWiPkcltqzqxuyYyVhmaB9xR1e7x1y/wOncIDhZgAsvFvaB9bV2G7D+Mq7qc0
         8nOw==
X-Forwarded-Encrypted: i=1; AJvYcCUMuQROa8uh1XvGYQb1Fx+/sUfr4T1dtnYM78kW75MFp91lOAmGyVaKvpShgFOfSBuqX+uu2NxCxC6nTgk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+TD908lTzjqesfwG4PlvcYLgQ5AsuviRdGUZpDi6H7ncW2Wmz
	oxyMaX7Brx7/i9c90AZ6YcFjjLkNK0yQBNEkEhIyVmkc/YoiDdgqu95DFvPMtf7jmdjcTm/Qy7l
	+UvGwrpkK7Vt/NT+QFephg4IVtZLUZkU=
X-Gm-Gg: ASbGncvDME7R8+ia9YtZgsXzDHjMeQX+ooLX59jNiGnC+xzg2Tc71yN4f4mitBen16n
	ra9lC4f+k9/YAmaFf/nsxlDSU/geYiGK2hPnDH4HMuKK4WZAHXr6TDigc4OHtCjZ/xZG+jN7LRP
	2S6k1rtsxabQBxBfa/KOiUZWwCYaZD5Av2rcZ38Z6VtF4=
X-Google-Smtp-Source: AGHT+IEvQnJ4QRqSGP2qB52UDJLc95vE2WmXbirVa0pHP16TPMhIb8u9XNfVSz15xZVnzrhavxHSi3E8vgSvANL5nrA=
X-Received: by 2002:a05:6102:149e:b0:4ec:c50c:399f with SMTP id
 ada2fe7eead31-4ee4f692664mr1810518137.11.1751000551372; Thu, 26 Jun 2025
 22:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627025214.30887-1-lance.yang@linux.dev>
In-Reply-To: <20250627025214.30887-1-lance.yang@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 27 Jun 2025 17:02:20 +1200
X-Gm-Features: Ac12FXywX0xekxUXC52Wn56ratHki1z8cUWVFBJGFLSfqAnwCvDX9QWChaOYL38
Message-ID: <CAGsJ_4yjvHzeUTDoALafLddTCTOSzYiFQNvAmSQORLJV1HPhPQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/rmap: make folio unmap batching safe and support
 partial batches
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com, 
	mingzhe.yang@ly.com, Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 2:53=E2=80=AFPM Lance Yang <ioworker0@gmail.com> wr=
ote:
>
> From: Lance Yang <lance.yang@linux.dev>
>
> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> can read past the end of a PTE table if a large folio is mapped starting =
at
> the last entry of that table.
>
> So let's fix the out-of-bounds read by refactoring the logic into a new
> helper, folio_unmap_pte_batch().
>
> The new helper now correctly calculates the safe number of pages to scan =
by
> limiting the operation to the boundaries of the current VMA and the PTE
> table.
>
> In addition, the "all-or-nothing" batching restriction is removed to
> support partial batches. The reference counting is also cleaned up to use
> folio_put_refs().
>
> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe=
@redhat.com
>
> Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios=
 during reclamation")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>

I'd prefer changing the subject to something like
"Fix potential out-of-bounds page table access during batched unmap"

Supporting partial batching is a cleanup-related benefit of this fix.
It's worth mentioning that the affected cases are quite rare,
since MADV_FREE typically performs split_folio().

Also, we need to Cc stable.

Thanks
Barry
