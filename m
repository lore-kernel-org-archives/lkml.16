Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6299423372C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390019; cv=none; b=tQoZL7KqjQW3PtOh0QaVv1QmCwextA5+OoxVaK1ggZm7CALAaqvJDaI093EJaliEHXI8T/Pr4fhdyRkgc8tZVCwZmyn6gAas+rteFw/IRNv9mAyALOP/SW2RaTvtv/PDbyOm2qkt/uXWKxrKvooBD4LkN4TyEBAmUEmMKaTPuKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390019; c=relaxed/simple;
	bh=PZ1hzhVLhPa3dLDbMLplQU4Z4StkFXuYbw7/HI9oWu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkoxq+HasRX32V/G1m8kPL5xo5sigfhaFeX3qWLHyHQ4lOWAs8C9jpzK2Jtm+ohDfi9N910mNdz0fJ1c30ycXklGvkD8JKisHwtiAdryPKw9UnTJjFMDLS/tQmAo0t2w0L8obruckI3hzeoQ5OxKX4nP3pAvNhMtQOGBvkXS81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Q2yObfd3; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Q2yObfd3"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-48d71b77cc0so25859141cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747390016; x=1747994816; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sYr4H36z0vOGSYanC1w0/PBFKEWt1tWAZvghYgV0VXg=;
        b=Q2yObfd32ppE92QCNh3FmQzpGJVQIMNxEUm6x5bXLgiqgoo46K5nyHKNOjGcAqbemp
         XCzovOtqA5NEaBLxS0I6sqJRDmdqHGQJ34ko+evlxLbg9MjtbqSGRDdCtThEDw2qLt3/
         bnigLsB8NS4D6wnRo4FM3E1HTAe1FzaZ5BZC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747390016; x=1747994816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYr4H36z0vOGSYanC1w0/PBFKEWt1tWAZvghYgV0VXg=;
        b=vqF/72fdqRj7wPjmseqrlMsSeIR6nAK3Se+R6Kt6odmXp9Vwut7gc1xip4DWB5+oU/
         gag1xM7gQtb3qpd2RwFcAoWRCAIwJAzJ/ni3KPQUbZZxBlbSMvX13nZzImJ2NcdPRqBg
         CAzxwd/esLwsQ9ak728wWGaibYeNyNNUXQ9vjqDGpbEuAUzLnNwACInFmZ6Zlf9WDfDx
         vXmRUCmXrLtg6pr4mjwmKY1gjYkS72O3fbZlZzMeugugb8qryzc6xsEBZuzba3uV+NQz
         3TKv8VCKkNHmyqxrzVW+hVGScnm7zWzDWghC6ay0F4Y0BJE5SRXfu1WjBvXBfqoIDgYl
         ZoDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4XpujdWrMWPo3ZtDIlsuAHcSOLXF7XH6rs+kwdiflnC23/Ilc7nsF6LrfVEZKN3krgWHVC8v1mnJylSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7SKHD8r5M/TbNLj640vGUcuuGJKwWjoqgfq4vuYYLnTHoJBA
	L+MfXzSz0TTgn15EbXh/525m0Jh7KGRx8Wj2l9ADjZtT4DUJaSt4efwVYZ9qC+08CbEsiciX6+R
	f/bP+9+x6VEKdea5YRwRCnb8aYG52BL36+HZk4xYeGA==
X-Gm-Gg: ASbGncuI58Q+LCCJ4uciunGEe0ODvWIzcGVQEaNUqxvoVVyYFN96A/DVTPCoh/gRGwk
	N8G98GNTdDkSd0a4CuzAfiK9Cd7N06PD32W6mRQ2jk/A6EgfrpHiuRBW2TkfFRVfGp9yxr98T43
	I+HQkRDoTjLxc/D6xoFW+BvKGdiCVr0PU=
X-Google-Smtp-Source: AGHT+IFq1iLsujGv3MRAp/42wUNDp8Fjtx0tUWAIAmM1RivLIsnYNC1bAGTr6piq4vefDLhpVhUdj5QcvATegQP1E2k=
X-Received: by 2002:a05:622a:1f9b:b0:477:13b7:8336 with SMTP id
 d75a77b69052e-494ae391ca0mr49345951cf.17.1747390016120; Fri, 16 May 2025
 03:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421013346.32530-1-john@groves.net> <20250421013346.32530-14-john@groves.net>
 <nedxmpb7fnovsgbp2nu6y3cpvduop775jw6leywmmervdrenbn@kp6xy2sm4gxr>
 <20250424143848.GN25700@frogsfrogsfrogs> <5rwwzsya6f7dkf4de2uje2b3f6fxewrcl4nv5ba6jh6chk36f3@ushxiwxojisf>
 <20250428190010.GB1035866@frogsfrogsfrogs> <CAJfpegtR28rH1VA-442kS_ZCjbHf-WDD+w_FgrAkWDBxvzmN_g@mail.gmail.com>
 <20250508155644.GM1035866@frogsfrogsfrogs> <CAJfpegt4drCVNomOLqcU8JHM+qLrO1JwaQbp69xnGdjLn5O6wA@mail.gmail.com>
 <20250515020624.GP1035866@frogsfrogsfrogs>
In-Reply-To: <20250515020624.GP1035866@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 May 2025 12:06:44 +0200
X-Gm-Features: AX0GCFvDzLpmkF12kGaynggeZWP00Cr6BBFBchrM1Bqzro0NRWRGfjqCVUyzE8E
Message-ID: <CAJfpegsKf8Zog3Q6Vd1kBmD6anLSdyYyxy4BjD-dvcyWOyr4QQ@mail.gmail.com>
Subject: Re: [RFC PATCH 13/19] famfs_fuse: Create files with famfs fmaps
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <John@groves.net>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Luis Henriques <luis@igalia.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Petr Vorel <pvorel@suse.cz>, Brian Foster <bfoster@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Aravind Ramesh <arramesh@micron.com>, 
	Ajay Joshi <ajayjoshi@micron.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 04:06, Darrick J. Wong <djwong@kernel.org> wrote:

> Yeah, it's confusing.  The design doc tries to clarify this, but this is
> roughly what we need for fuse:
>
> FUSE_IOMAP_OP_WRITE being set means we're writing to the file.
> FUSE_IOMAP_OP_ZERO being set means we're zeroing the file.
> Neither of those being set means we're reading the file.
>
> (3 different operations)

Okay, I get why these need to be distinct cases.

Am I right that the only read is sanely cacheable?

> FUSE_IOMAP_OP_DIRECT being set means directio, and it not being set
> means pagecache.
>
> (and one flag, for 6 different types of IO)

Why does this make a difference?

Okay, maybe I can imagine difference allocation strategies.  Which
means that it only matters for the write case?

> FUSE_IOMAP_OP_REPORT is set all by itself for things like FIEMAP and
> SEEK_DATA/HOLE.

Which should again always be the same as the read case, no?

Thanks,
Miklos
