Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F1F53E23
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063285; cv=none; b=VKmTDdXLV7qTx4mN0fNLA7RiKqh+x21H1q3tXiKR2PhOJqvjJ5go64RcxNiMddFvAcJR2Bp4PfZWUo9EUQz88Mdqh5QkFo1Pz5cRsxWtCSp83fZQjs+KlL9LofjRxm4r5JLnsZ+yztkcsYXFD4Zv5KzDQFDRgcD0U1sgi00Dv5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063285; c=relaxed/simple;
	bh=dqDAKLbnS5sjnD7NkwvXo/kZFn7+fO2d0R6Ff+ZBKJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3DqnPLzHe+L786wPjfluYOsnLAK1EV5KVTbwrQJzJci61Ha0PQ6lm7AQfdGWSAS3e76DYKm/8cfmHxYsTTsDs0sG/8lfB4FXQnLl6NLXneIIcPfd8AXAzUgIV4bID3ZQeasoVpjaUfOX79bUqwk94Uhbi9YEmekk3NghWBCo9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h1qX1ibi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h1qX1ibi"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2263428c8baso115185ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743063283; x=1743668083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9a5QRkmmOyJeIvB5Cn9PmXfV97y4kQAOBXvf9QzfDM=;
        b=h1qX1ibi9fM1XUcL6NrpzaPOn028Ine3Rf2tl6ZF1NVV0eQRqIEx6VhdC3oSKoGpgg
         THur3ZekWWo/5f0FUBO/ij9ah4vMBpjJ1Btliaj9X06+TGfUeMIwjyTDjHC1/UY4jrBX
         6RPBF1oQS/fSpDzJa7T5j3gWDMFFVIySuDELVGmot50uzj0nlNq7zNBZN9vdyUjxFPcD
         iI939mdFfF2h7k8wcYuulfLD50UH03ekSjFLpkxb7AJpANJzymGs3xzYPC8qdvAJu0QS
         OOwgR+2ZGy1uemrZ3ioc2Mv5QH+PBJI0WbqWoDwlnjxnPObh1OuyKZ2qBvuiytfIcSQk
         5ufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743063283; x=1743668083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9a5QRkmmOyJeIvB5Cn9PmXfV97y4kQAOBXvf9QzfDM=;
        b=GUiAAOk0xWeReu64FqUgtXsvMSiLPXSnQ8qArra6aaqzifmD9FXI2sfZbLffJqVd7R
         OtF+TbpbXeZAqp2SmePR1y8rBH4Yfv8uhTHYMNierLdJWTB2OSidMr1XMG5FXWvPO3Dc
         qh/yYs10RQkk4NRxtu3sStL1x708+CcQ42ec6IyXx3ehkPIXv/AbA/PDm7/AA1tAoENj
         QIT86UL9TRHk6QBIjPZieUOEKo3X2To2flgNmZqHHumnBRTMaiQz9B4FJQQMOoBUVUt+
         6xaXnYnqVTUBBHq+FVRBF1FOBKnZQCK9Y6IxDqw0+lfVRBZwCasbfZwc5y6DpqbPKeij
         bH1g==
X-Forwarded-Encrypted: i=1; AJvYcCXmBm3HSB0fnYKYse3Bte1Zcv7lXlcpL8xkU6AnYHQkxCU7EZU8UY0o48rDO7ipAajkNIQ+05UiTvn/oag=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI0QiCBq5WcaIWUavSTpBIfOBux49FztMWUjQ6ytrUJU+NLgyk
	sVji2pa7kVyOFagtlt7iwIBk/E/TD/H0N379zddOFucaioqOK71M1a/Kden7dSbOqMv9dYhJ+9p
	zJHU2vojZx/hlXjV90bkW7UfpDYOwEc31eoBq
X-Gm-Gg: ASbGncscSHYZY/m6JygDmPfglLTAiCXFluuEYDa7xnN1Sfg/yVqt54RQVkswfhb0asl
	R3vj9nPpfQ8K1s4Sie1h11zr70QKOiNoQGFx+Ckeah8YEldbhNfND96eaDuYkRkuckcVlk28+T6
	LSZUj6kUVU2FMNFlWFzePgDYl3wZahepzKsQNNgS/bdkD3nLQSvgs2+dn+zZnzEHJQkUlzAg==
X-Google-Smtp-Source: AGHT+IHgfzrQlEamv4gYgjx/fwFVnfQvhKeODD0LFSb3f0rLf6g/j0CVYOoteVLkG0M+nr3xqexqfLuYGBQj9X7EB6c=
X-Received: by 2002:a17:903:1a0b:b0:215:8723:42d1 with SMTP id
 d9443c01a7336-22806bc133bmr1942515ad.10.1743063282486; Thu, 27 Mar 2025
 01:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313181629.17764-1-adrian.hunter@intel.com>
In-Reply-To: <20250313181629.17764-1-adrian.hunter@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 27 Mar 2025 01:14:29 -0700
X-Gm-Features: AQ5f1JpB0AViQmQuFfLvDkCuf5x_Lo9CiwkMjG3MaJ-5wwbn2bayOkBOcIzzqck
Message-ID: <CAGtprH_o_Vbvk=jONSep64wRhAJ+Y51uZfX7-DDS28vh=ALQOA@mail.gmail.com>
Subject: Re: [PATCH RFC] KVM: TDX: Defer guest memory removal to decrease
 shutdown time
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, kirill.shutemov@linux.intel.com, 
	kai.huang@intel.com, reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, 
	chao.gao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 11:17=E2=80=AFAM Adrian Hunter <adrian.hunter@intel=
.com> wrote:
> ...
> =3D=3D Problem =3D=3D
>
> Currently, Dynamic Page Removal is being used when the TD is being
> shutdown for the sake of having simpler initial code.
>
> This happens when guest_memfds are closed, refer kvm_gmem_release().
> guest_memfds hold a reference to struct kvm, so that VM destruction canno=
t
> happen until after they are released, refer kvm_gmem_release().
>
> Reclaiming TD Pages in TD_TEARDOWN State was seen to decrease the total
> reclaim time.  For example:
>
>         VCPUs   Size (GB)       Before (secs)   After (secs)
>          4       18              72              24
>         32      107             517             134

If the time for reclaim grows linearly with memory size, then this is
a significantly high value for TD cleanup (~21 minutes for a 1TB VM).

>
> Note, the V19 patch set:
>
>         https://lore.kernel.org/all/cover.1708933498.git.isaku.yamahata@i=
ntel.com/
>
> did not have this issue because the HKID was released early, something th=
at
> Sean effectively NAK'ed:
>
>         "No, the right answer is to not release the HKID until the VM is
>         destroyed."
>
>         https://lore.kernel.org/all/ZN+1QHGa6ltpQxZn@google.com/

IIUC, Sean is suggesting to treat S-EPT page removal and page reclaim
separately. Through his proposal:
1) If userspace drops last reference on gmem inode before/after
dropping the VM reference
    -> slow S-EPT removal and slow page reclaim
2) If memslots are removed before closing the gmem and dropping the VM refe=
rence
    -> slow S-EPT page removal and no page reclaim until the gmem is around=
.

Reclaim should ideally happen when the host wants to use that memory
i.e. for following scenarios:
1) Truncation of private guest_memfd ranges
2) Conversion of private guest_memfd ranges to shared when supporting
in-place conversion (Could be deferred to the faulting in as shared as
well).

Would it be possible for you to provide the split of the time spent in
slow S-EPT page removal vs page reclaim?

It might be worth exploring the possibility of parallelizing or giving
userspace the flexibility to parallelize both these operations to
bring the cleanup time down (to be comparable with non-confidential VM
cleanup time for example).
