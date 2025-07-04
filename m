Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA22D3233
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645375; cv=none; b=e9/4kmotcvXlo+gkhXwtYta7vnBGNEftnYVfYmAJjxig8bIfj0EAc8NjQ6N2VwRvmH/nrJNjwsd4gf3XhGcnaY861A/d37Q2pqBmzIOjWcIzM//uwtogpbWbapjqdjAliOfTcwKb2Y/oCHzhDLhzgU1hlql77Pu+NwqsjKYUFe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645375; c=relaxed/simple;
	bh=/kbQI7CxsD7ltTxJB8ZyTsSywieJytjLPWWubSMgMjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GC1KMn731k2WsMQBNlUjOAI3Rk2TrkbDkm14VO97RPOsYCbxkpLgfZkBs9NaK8T97cIO3TQPjQ7sRkfSuVmQk7cquXIk2hXi7t+PwF9ngeFjgk0vhIfqK/r67YCj0M1q4v6b47Tx5wDhJM3M+VjxTz5eW9eRmNbjCscVbSKxjlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K7xftaJc; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K7xftaJc"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so4853639a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751645372; x=1752250172; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JwC/PsMsPvkr1FvfC5+mUeduwsZnw9lCgcct8Dcz/jo=;
        b=K7xftaJcY6PYeQ+0vueP36VqEHnM3iNV2FoLRqtUd3Kty6BWk+2mEjrJJ1XZpzj1Tx
         pntWvpQIz+ESFUxM501X6XkJ73thf8ScBmBY0dA69zJsEW1bk3YzmyAanNdCzI79a2zf
         F5zS8q8bE1P5Do75uW/ZajiA05SBOXjv8SxE2f9ux/4pG33dL5aD4B1V3aCMUw+RgK4B
         RGI7EeGUktJ0wv9P9UCS0270qPlF64zacxQrUsR69+VfLa54K6ev1+L1gJmWFyO/2xux
         bfbe7Do3uYWAoTEVPz398+gkR0L84rUo0dY1yOMMkamg2F1s3g8UcYVggc7b4oX1M68p
         jZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645372; x=1752250172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwC/PsMsPvkr1FvfC5+mUeduwsZnw9lCgcct8Dcz/jo=;
        b=eVe1jDfRdcTT6v15wzXp6PLo7sF1CCFM9A79aQLri/9kqWqY5BoEUYCvyKoX3SOqOw
         VBTujZuc4vXoW1gWcCZPXwdIoY2FtkmzKOw7e+q+7evwJll7uWQzCh6udBprQe3xnzzp
         Mr43Jgy4SWwwz0E/G8sXuBJvjiS7QSjOjfdU/10RYjOXPV1cYyKT4CpQi3N5ZVOtaGQ5
         YvPzwmtmn0Ll4mlem61sqP6Ro4WGKmhAOMqKd7gKOC1K0R0F5yV88dx7ivtEbNOL7gQk
         MYzg60hbxA2OvOiBdMNNeeV7+gqwF6htLBYpaYoyanJ3dvXLCnS0sebn0CpLyTU7jjse
         n9YA==
X-Forwarded-Encrypted: i=1; AJvYcCVXHrn+iC+l3kx81a64YWta0wxc3e78yUDhL+8/S7pLHyP9XfTAJDD1Qf7CRf2YJ7UAqx3cNVTKIAzRvos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Ngil7CPhgTBRN14eL0heXz2ApcnJCglXqMO89Fdz4RP7p+wq
	8YWEDySThe3i67aLB7j3jh4HJwb1oBBMAp2K6V6q1nfh+n0ynP5FIC9IbKrJBGpLKlFyTLA3op+
	MAbDmiHZDmnm9lOgkDAHHE7MMxI7k+t+R/Ia8gkpRmQ==
X-Gm-Gg: ASbGncuLTvXjMfB/zKrdWymtJQ/s+pvKFBeInZLSMUB19/kpuQ1BwpXKUqKK18wbPuq
	hubLXFk+fM9ykb7Ust8vcFtAkrnFoaNOgH8BtFmi7q2MpasAJTuLgAxY3QsIpXWxhSX6sjQlOCa
	KJ+rvo4d3xdqA1C1uboqgVHphgNhETHzr2Pmle0QL1PA==
X-Google-Smtp-Source: AGHT+IH26Fdq1EV052hy56kf5SbDp8DODCPwSoLb0rUituoTYz3RDsUWhga3MiG1QimeN/Q+MK3iDJ4u5Y6tPLe7K1M=
X-Received: by 2002:a17:907:d28:b0:ae0:c092:ee12 with SMTP id
 a640c23a62f3a-ae3f9cecafdmr333695266b.22.1751645371644; Fri, 04 Jul 2025
 09:09:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612084724.3149616-1-neelx@suse.com> <20250620125744.GT4037@twin.jikos.cz>
 <CAPjX3FdgS4xJBvvsx9zRxiuRm9=5VcTynmtnidga4gcqewLrUw@mail.gmail.com> <20250623142501.GA28944@suse.cz>
In-Reply-To: <20250623142501.GA28944@suse.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Fri, 4 Jul 2025 18:09:20 +0200
X-Gm-Features: Ac12FXz2Qdr7AeD_OcRBgWFFliMk5Wac2WemQ8eqHN90dpTkOQfUuaYZWUxVkJ4
Message-ID: <CAPjX3FcLkgk4CbtwfFqNN+J=c5kTC0S=LYyeyryVKuSk_KF6Gw@mail.gmail.com>
Subject: Re: [PATCH v2] btrfs: index buffer_tree using node size
To: dsterba@suse.cz
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	Qu Wenruo <wqu@suse.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Jun 2025 at 16:25, David Sterba <dsterba@suse.cz> wrote:
>
> On Mon, Jun 23, 2025 at 04:04:39PM +0200, Daniel Vacek wrote:
> > On Fri, 20 Jun 2025 at 14:57, David Sterba <dsterba@suse.cz> wrote:
> > >
> > > On Thu, Jun 12, 2025 at 10:47:23AM +0200, Daniel Vacek wrote:
> > > > So far we are deriving the buffer tree index using the sector size. But each
> > > > extent buffer covers multiple sectors. This makes the buffer tree rather sparse.
> > > >
> > > > For example the typical and quite common configuration uses sector size of 4KiB
> > > > and node size of 16KiB. In this case it means the buffer tree is using up to
> > > > the maximum of 25% of it's slots. Or in other words at least 75% of the tree
> > > > slots are wasted as never used.
> > > >
> > > > We can score significant memory savings on the required tree nodes by indexing
> > > > the tree using the node size instead. As a result far less slots are wasted
> > > > and the tree can now use up to all 100% of it's slots this way.
> > > >
> > > > Note: This works even with unaligned tree blocks as we can still get unique
> > > >       index by doing eb->start >> nodesize_shift.
> > >
> > > Can we have at least some numbers? As we've talked about it and you
> > > showed me the number of radix nodes or other internal xarray structures
> > > before/after.
> >
> > The numbers are in this email thread. Do you mean to put them directly
> > into the commit message?
>
> Yes, it's relevant information and part of why the patch is done. Mails
> are for discussion, for permanent stoarge we want it in changelog in a
> presentable form.

I've posted the v3 just now.

https://lore.kernel.org/linux-btrfs/20250704160704.3353446-1-neelx@suse.com/
