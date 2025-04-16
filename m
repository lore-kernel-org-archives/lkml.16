Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B13E1AA1E0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795482; cv=none; b=GdmUSfPmWGqoMKOGsxvtrlsSxFRuDDvnFx2+3AgPJM/YXMvjmk6pyHmxsU5m46yDvpYArBjvd6y8hYtTi9MBsJTebwaKca62sncS2zWTPab/W4dif4UiCAo1RWLEynkdlTnnr5MjFv3M4/Cg1GvZ9QWHecbECj0H8VsJyJxrrpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795482; c=relaxed/simple;
	bh=hHnar/R1bLTQG5T8505mOWlUcoq1efFUMRUpBQOrn8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hn14aMpT73cXUX0IGYlnkfT3az8uzxWy3qZPYOntuS7ON2NLwA5Y0iby44x7KGJ4A39xQsD94EXp1oW+EMpraIXXja6YB9GHSwod4oJCLY3lPrczVljSczH042iNvwPDVqgPRAPgCX4WhPWHW8068EZzFpte9dIEodPim8fsqzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loZpzcsf; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loZpzcsf"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d377306ddso2524026241.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744795479; x=1745400279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHnar/R1bLTQG5T8505mOWlUcoq1efFUMRUpBQOrn8M=;
        b=loZpzcsfqCUVEFR2ul0wCPy+cDNuIjY/0sPuFLa6NvA9KLRwnuu7zlpqHzKyktfUlD
         J4LPBKM02UcyLWK1mLIEsJKeiOAgBOkmvqLOGAyCFxhOsDiBB7iyRaMdqGt604+VDuKf
         kjp7S2XsRuj186jtsUWP5uMd/yR7q4uSJ0yjbw3gmoeNNy0LpMJOCtqP7k0Sy0i6zK5p
         0v8dU9X5vEpT3d0tAL/5l0IJixPspFcoabmnHma2rWw55fwKgqoQIxlwf5xLDw3x0uqZ
         mb41GQIqrF9VYBV/tcCj/qqPrXgQfH2+ps44GGvmrUN8K3Ct6WTsmb81u4jk/3l4xBoB
         Z71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795479; x=1745400279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHnar/R1bLTQG5T8505mOWlUcoq1efFUMRUpBQOrn8M=;
        b=LV229xkPFHnwz5UNQVPjgATEhPAo5dP/JCPGX3EypIF96OXzLtK5je1FSHaUrDVf4f
         HcFQMxkieCqxLHqyhp6CytwTBj+pRCTtMeOxBtaHs89oi5sSxksMX41XL9I6t03OxkqQ
         NbYe+P85+JgE9m/ZaUoajrIUhIFmi3OFXyu8vgsEaNisU+MydiqA9JgJiLTveYxbCbTp
         iNxyQ632C/r6qLEhKGrenrguWOPDj2PLEsg47x+A6alDmnLtG31SMnrnRuEOkH4myWCW
         fS3DQYd6XUKuGCCg0YGHcUksMpqLwJgwfxLyi2NEGbZ2EcOveDINxO0Z61159mV+cMdZ
         DY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6h/ZCC07dEVS3t1QdS98vWRHzTQYEieSfugkh6aL0zFtdcCRlWbg21AFCmB2Ahvmsr0eDjC349baTakQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGJpHshaC2KuhrLHTQlGh5yKp4ojErSlvC4hv0Oac3XJZ2YK4
	L4Xec7stH6pvxlnfrK4cZ9DtpT4uIeO98cC/WqNCcWffbGboG0tzWSQtX+h8gZXfxk03fM8uKMg
	bwKe+hBEcUvOhjGa8jBmGMbO9DuQ=
X-Gm-Gg: ASbGncvviUU0jouBVzAq79A66VpFZFYLp243dltsEMd7CZYs5Q39YMTBZllsAvQqNDu
	LO+q+jj8hsAEBVvrW63/jlTMVnYxo+NMYz4XYisq2nsfJbZAId61cTujHFRsIBVNDpQl64CgKBK
	1+gNAWKg9ABnhN824aJYqnjji+FfoestMI
X-Google-Smtp-Source: AGHT+IFc6hLhG1BRBDAs3AcWYprpi1NvCFZHy+Fzt2jeq3AQ5eYFlyQTAvoJlabM+Ckb6agoT9lQ6MyxKq8NIJ0oiAQ=
X-Received: by 2002:a05:6102:3115:b0:4c5:78ae:1e3a with SMTP id
 ada2fe7eead31-4cb5930cef1mr272529137.23.1744795479179; Wed, 16 Apr 2025
 02:24:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412085852.48524-1-21cnbao@gmail.com> <34c54df6-9a7c-475d-9b91-0f8acb118231@redhat.com>
In-Reply-To: <34c54df6-9a7c-475d-9b91-0f8acb118231@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 16 Apr 2025 17:24:28 +0800
X-Gm-Features: ATxdqUHPpVHDcE4njgv8l7WvP6FJzZ4Hqu_QY8qPLeoJbLDDIVYAzTmNulKWw4Y
Message-ID: <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying processes
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Matthew Wilcox <willy@infradead.org>, Oscar Salvador <osalvador@suse.de>, 
	Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:32=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 12.04.25 10:58, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > Promoting exclusive file folios of a dying process is unnecessary and
> > harmful. For example, while Firefox is killed and LibreOffice is
> > launched, activating Firefox's young file-backed folios makes it
> > harder to reclaim memory that LibreOffice doesn't use at all.
>
> Do we know when it is reasonable to promote any folios of a dying process=
?
>

I don't know. It seems not reasonable at all. if one service crashes due to
SW bug, systemd will restart it immediately. this might be the case promoti=
ng
folios might be good. but it is really a bug of the service, not a normal c=
ase.

> Assume you restart Firefox, would it really matter to promote them when
> unmapping? New Firefox would fault-in / touch the ones it really needs
> immediately afterwards?

Usually users kill firefox to start other applications (users intend
to free memory
for new applications). For Android, an app might be killed because it has b=
een
staying in the background inactively for a while.

On the other hand, even if users restart firefox immediately, their folios =
are
probably still in LRU to hit.

>
> --
> Cheers,
>
> David / dhildenb
>
Thanks
Barry
