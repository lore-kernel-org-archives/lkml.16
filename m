Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51226214801
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750974410; cv=none; b=MYvlZ7pdq0/5bKt03/2JlC+5ZWYXnY6atHiVX7XZjeuSsvxoSFWQRMPmhxx7f9rzVjlSklQm026MYjZSi2Heol1SqbWRq3CmZure2v5Lw98TZEjuBnfn/RaiiYb3Zs1eAhpnynmZbAWVRvvVKzX6XN8Nv7xZac5lUIJpr6gDkfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750974410; c=relaxed/simple;
	bh=AeKgSHt0/Rc1BVfNvh48KrCinF/TknsHxx9I4NQj8aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K14wqQGysrVCd9XMvHQwtGw3Oq/VQwFHuwCGMZHfJSBid3e2ptO/QVIbK5kNnTjMbvFsP1PnkbkZR1+oE8z+6eiefXAGFGpyUHz2YX2kBMfl438N4a/St7pWXT+s/OONedcGvysd2F1wxKGEcWpTLSpUSnPTnOhV/SlS7Tfyc90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFz+aFVs; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFz+aFVs"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-528ce9730cfso352754e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750974408; x=1751579208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWuNAXCk1fWueV9/KkSjE2Q70mMkCujHcS2z91+7Wzo=;
        b=YFz+aFVs75XSSQ873w3bwV6xWNg+t3eJoj3SlwfwuhtFRYqV7cg6xhfgp9kKVA4UK0
         CrvsRCxXZmIcPeNq7ysv+ogMI/j7MyBR7v4CMlGkjlBTs0L+p0zjy+ZKRfP8CWqbDHlR
         Ocq8Xb4DcVxQlyk6UziasScc3b3mQgY3jIhqSkNfHtkJU0p3MTae26wfrTo2XnbcIpi2
         FqfDxMbcaaapwWBrUYoVMepkR1Tsac5m8I3xs8tsdpqt35zupLqHbFfmhga9sIAwE4FP
         mF788Cnat+FUpmdooE2uowxco+Op8i6vXONlqSKCYHnFs/J0E2/PaKB7exdJ0tJmvQzi
         /Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750974408; x=1751579208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWuNAXCk1fWueV9/KkSjE2Q70mMkCujHcS2z91+7Wzo=;
        b=lsv9z2XWrm+cCa8M7Lt+8OpDuEGrGQp/ekfE62sJ2lIlu6o5k4XFhcUS4tn9Em4M1u
         lgxoBdEuOQUPz327pvS2YK2/sZsiZqORL40LWhXrrQcdrjapw4Q8h4ktmBcES2fs/oh5
         gwOTCChX1OEU78ZnGkwnqQxm2fmVPxcPPUFPal1X4q/gL97946vxfg0wGw4C3/OCoF1t
         d+muJn5mXyBqeG0rhpC5v75pU/cEjOGsL47J1ZTAIuHquhbsubJRrQ2RwKBAk+Ph3UTM
         iw3WZGxCbQ7OAOEUhuYiHrNITWl/I2cAyzc2RfhbapnGpxjxHUwPkdQ8iZMVmOK8SzNT
         LKtg==
X-Forwarded-Encrypted: i=1; AJvYcCWzmQ3aDQ8mEoma20qY+VQHe7zeX9B2Neni+a8pw/g8LDG77AdH3T6iXtiparZ3vzNSsXHRNslCSnGmGxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLVb+jOonCOwJaPZRZmEfBE9E1rj9uxMLPEO8Z8On7s6DmyDXJ
	/XXvuvT77HRMTIEXFQQG1bNrBjwfFUAwe6l2vO9X6DrzUrBdeP1nO2tSc5W4UzzTJtRpiO69F2s
	zHBGj08pcwtoj/k5eu/MaV9KbsX7kL4g=
X-Gm-Gg: ASbGncu1gyHfkNPe/+hFxrts7W8wa4OjoHZW5RKmHOfdDrgJvLEHZF2t5LAw5xRTN2l
	jWsAxPQgd1pAy2nTVc/Ruvl5zD+mVm3ciRFYKzm4Mvm9f2KYEWDmwLHWLgCO7lUCGQuDuWBn20W
	/k5ZRbCbDNDh4Wn7Sjy92bEz3MwplfI97BtIdOR88dXQI=
X-Google-Smtp-Source: AGHT+IFqD6MeHf2dv8GNgWuXZnCWkBT5zbKZdT0Fqn22cE5696tU3bF1FiIJc/HEpUJx4mMUyCJENSCCX6BXL3RgS4w=
X-Received: by 2002:a05:6122:501b:20b0:531:4708:3d45 with SMTP id
 71dfb90a1353d-5330c0bf774mr582169e0c.10.1750974408037; Thu, 26 Jun 2025
 14:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a5b5b0aa-21c4-4abf-b323-63af96aabcd5@redhat.com> <20250626092905.31305-1-ioworker0@gmail.com>
In-Reply-To: <20250626092905.31305-1-ioworker0@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 27 Jun 2025 09:46:37 +1200
X-Gm-Features: Ac12FXylRE3hZva5QKBERz9CcinWRMXOAb6qrHlm_KOUdTJ8v1xSbRPfHA-4N7M
Message-ID: <CAGsJ_4w5Obx9=P0wkrbLaDzKpG0e-7xs7jgHRa91KO7e92MO8g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <ioworker0@gmail.com>
Cc: david@redhat.com, akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, lance.yang@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 9:29=E2=80=AFPM Lance Yang <ioworker0@gmail.com> wr=
ote:
>
[...]
> +
> +               /*
> +                * If we are sure that we batched the entire folio and cl=
eared
> +                * all PTEs, we can just optimize and stop right here.
> +                */
> +               if (nr_pages =3D=3D folio_nr_pages(folio))

David also mentioned if (nr_pages > 1 && nr_pages =3D=3D folio_nr_pages(fol=
io)).
I assume it=E2=80=99s still fine when nr_pages =3D=3D 1 for small folios? N=
o?

>                         goto walk_done;
>                 continue;
>  walk_abort:
> --
>

Thanks,
Lance
