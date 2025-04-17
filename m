Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE0915A8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744898803; cv=none; b=k0PZIXjQumkHXPnHVsPbwMa6O+flz2e3zuu9pud/6HItE4z+aqkOCpamwR71i9q7O/c89pWF5yJRGR2otLvh7xz+Bn+GbeS9kioVDClTYEGIH+u7zJUI0aOfqUDPI+oBDum5jG7gbsJixMhefZEmFFN7A8Vrg7An2Y+616fxZro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744898803; c=relaxed/simple;
	bh=8OFpMRgE/GOLJYWHzWMu2oFpPG6VE+EsoOydCsWR+Ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSR3i1TN+pX3YkzmlKp7JEyuQ2Koaa/wy+49bqVmZHH2JvQrOZzE3K+57GFDwepIxfKf4eUzZJhHHVK/NZNLAS5iLueQUhT6u5X9x7QZ29NnOvntBjcJ1dJ35pPxztT18Pte0Sadc1B6MVZRkhflN8IFFOcYF9BLoCZLhPex1Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AioVo4SY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AioVo4SY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1348674f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744898800; x=1745503600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OFpMRgE/GOLJYWHzWMu2oFpPG6VE+EsoOydCsWR+Ng=;
        b=AioVo4SY9WBk6FUU1nHw729jKLV5fHoSFDdMzLw9TGJBscRHT5QsocZxUsmNpLkAXs
         fJdXmO/lITSgMjq875FIH6gVi63Nm7PJWN7MYyvv1ZaqVPzYBw/2LBydrpULazTE6cOE
         J73QgpiOSbeNnCfGSYLDSVVIX2vwdxGrILD91u3WXz18rtHJMlxdDixtVRciEF7j5SH+
         wyAjpMRio/y3pjxJXKTtDURKsTn2Rk9xgIo8P51R7I0XIg1alyvzYuSMqhQbqFHKThgo
         OekYob0aBjb74ln9yMF44YNZ2vJ86l91Cv4fy1ju0qh9SldWMf/g5MubMRK5JYzJD0+5
         WmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744898800; x=1745503600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OFpMRgE/GOLJYWHzWMu2oFpPG6VE+EsoOydCsWR+Ng=;
        b=qEJGiM7EbpKLlLgebSg4qIvtQ6acE0pQlZrnONBPXVtFzeFlp4MGIJNrN6A6eYqwm6
         zffsHiQizhdNVSEvI8s5T58ft4G1Yqe6+1ONJy4GrWy/7u5yW+xKzsE+CM5+tCNI37PK
         4Fe7LXy8GNJ+mZUd+VfycJwwmK3eeIax9jnrLcNddd/tc5AMnNmK/cCiRMe8c5i+NuGe
         NNsjZwEx8q3yuJr+AGUdKd9v0vjR3m8Y3YjwLT2MbWcWjHsz0CvnmvMY3HcNuiOs0THE
         D9CTC7wEOrwgVYra68UDBgnXeExSEmhBE7Dj3a9MwiafOSz1bL3Iaqv4j+LdOnhOYDGb
         2kGg==
X-Gm-Message-State: AOJu0YxwrLyZHXfSeeql1bFBjgVGBfrAOCwM9AlHNxTTBCmiqKzozwFt
	lkZl+p6UlAMHOkfhnjQa0sEnVDWqBRS4HCHHru+/oi9cBoRvA0PD7w859pN3XGlzQT47TpqYTE1
	t2JwhNXGSbdZ8imtu8FB/880fgobB9VXhsnc=
X-Gm-Gg: ASbGncuDSo4gWepSutgJJQgzspUg7hH+WCon55qZtVbitqslX+akipS9YvE/R/HVC8f
	Pctjr0RQoCkxDNdkCwJmxi0zEj2p7RavjOG1zcxXaIMh/m1NBb8QKbbFrsBbcu1qK5BXWwdH1Zn
	9eVeiOdmfzNq3oIXxiytjtsw==
X-Google-Smtp-Source: AGHT+IGsUHLegHbwuh6ly1Ke7B85R6Sq5HbaxgR7uzAALocC7Ub2/KubeJ+CVjVlTU0WeaZLQ3vptmxm0veo/pAIxH8=
X-Received: by 2002:a05:6402:4416:b0:5ec:8aeb:812a with SMTP id
 4fb4d7f45d1cf-5f4d1892b88mr2913661a12.14.1744898780950; Thu, 17 Apr 2025
 07:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-5-ankur.a.arora@oracle.com> <mp6sg35nbmjzahnlkstw7y7n2cbcz3waqcthz27ciyc7fmki3s@jws4rtvqyds4>
 <87tt6pw11t.fsf@oracle.com> <CAGudoHEuRgDEHQOAsK=SmFu29a3NUyLDL1r5PVuahxbdOR6jZg@mail.gmail.com>
 <87y0w0vhlq.fsf@oracle.com>
In-Reply-To: <87y0w0vhlq.fsf@oracle.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 17 Apr 2025 16:06:09 +0200
X-Gm-Features: ATxdqUGuMfLuHIG1RvclBhN96o3tjnFY5_NXY1N6cxDNZLe3EM1dEJcGhBhGGks
Message-ID: <CAGudoHGgTc98cOz1wUHuC-37SRy64iQyK=+d+Qm0oBfoNHSNow@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com, luto@kernel.org, 
	peterz@infradead.org, paulmck@kernel.org, rostedt@goodmis.org, 
	tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com, bharata@amd.com, 
	raghavendra.kt@amd.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 6:46=E2=80=AFAM Ankur Arora <ankur.a.arora@oracle.c=
om> wrote:
> Mateusz Guzik <mjguzik@gmail.com> writes:
>
> > On Tue, Apr 15, 2025 at 11:46=E2=80=AFPM Ankur Arora <ankur.a.arora@ora=
cle.com> wrote:
> >> Now, you could argue that the situation is less clear for 2MB pages.
> >>
> >
> > Well I was talking about 2MB. ;) I thought it is a foregone conclusion
> > that 1GB pages will be handled with non-temporal stores, but maybe I'm
> > crossing my wires.
>
> Or I am. I agree the situation is less clear for 2MB. I think for the
> immediate neighbourhood we clearly do want temporal.
>
> For the rest, L2 sizes are typically ~2MB or less. While there might be
> latency benefits for caching the rest of the page, there are clear
> negatives to blowing away state that was definitely useful in the
> near past.
>
> Would be good idea to quantify. Not sure what's a good benchmark to
> do that though.
>

L3 are not that great on many CPUs either, so you could argue you are
blown away the real stuff by zeroing a 2MB page.

I slept on it and I think proper evaluation is rather consuming and
tied to faulting more than one page at a time:
https://lore.kernel.org/linux-mm/CAGudoHGY012mwJqtGPUQ9mfQEVF1_otr9NSbbTYi_=
vazS09-CQ@mail.gmail.com/#t

I don't believe putting that effort in is a hard requirement at this
stage, albeit it would have been most welcome.

I think your patchset is a step in the right direction, even if the
specific policy is to change later.

All that is to say, I think this bit can be disregarded for now. I
definitely don't want to try to hold up the patchset.

cheers


--
Mateusz Guzik <mjguzik gmail.com>
