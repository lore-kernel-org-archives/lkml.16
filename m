Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A7A214209
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127709; cv=none; b=PHP95ruaYssrSOJru7nryqq21bj8skBBOkbxkbFFgmjvDozOA/Ij0rGhutYdyItMe9Ta5zRQkgm6tMlJwzxgOZUcD2zN39Jm2uWUxcBGOLMvs7jXX2/d8VO094ve3pERjsseTB+fDXzRcZiBdcpJHrguKh/fuLqWEmYH415ixZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127709; c=relaxed/simple;
	bh=dCEwNwEt7AuPcFjOYYqXUKN9++me11ouKXeEDU4JZv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6wvF2pMe0M5zBViT8ttRLjv1JJsSnsG3JTWaMVG2H9LamnX7W0wUDluTKWVBgXAoA4tXIlPnFzUMc3EZP8DxFt2jW7QQcZK832U3E8wp0r+t36xgSHCMCZLIHwAsGJYOGDw+QyvBVCOkO+Dlefl0YSjXLRsm3pJhInqxrntNIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Jdl0YN6z; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Jdl0YN6z"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4775ccf3e56so77790991cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747127707; x=1747732507; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ihrFZxGWgoMburH5YAF+Sr/kylX3rOORHrh4dczbaY=;
        b=Jdl0YN6znOpsaNcr/4Y+IU+mukRJybWqwj9SA9se6mTBMEacbqPEIrp4xJOb7w4DZW
         tF9u+FRecvrs2dwHP7vobbMcXp2vAGOxIh8+tPgNQ1bJPK9v42+J/b1D75lBzq3VTBAo
         FkW/Vv5JpRL5FeQ2qILC9yAb4ZwluKicFPyp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127707; x=1747732507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ihrFZxGWgoMburH5YAF+Sr/kylX3rOORHrh4dczbaY=;
        b=h/YPtQexri02V/JEhYJvbi3a/LzzXH7bp3mUXIbyFpmPC1J/LZ1ZavfFf8Yjwrxrvi
         YCmut9GkrQwtKLufPhIoFFnY3fQuFyviqrzGvTNf9ejsD08pbORgklAmsStb0Yz1RTC+
         EEfsmC6EX2R2amfOcpkHxDKG7W3ga6FVoc62gvs2BE8rfoyo51WNGLhbcAlME9XetHk3
         4mQnxZ6ok1H0ZYFw1skuprQi/rmUOrd/fhAzvETrSC5xJc4A0lHGm0wkmegxcBNdBdL2
         thBIzEKWH6s1boW55kBVQ29BVvi8xFlPgecWmr0CBNEaaNmOHhHl3CiHo+2y8Je903Pt
         WIog==
X-Forwarded-Encrypted: i=1; AJvYcCX/2S3aAXk7vwkJnrSXNeJs0WEGmP/q5n4oNCDgjz4VNdsVa3D9H6eHILPjRIsIKL578DuwnEic2BPExM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1asXmOu4gAkm1OfXFeW9GlLjakXrfFT1TUUFVRZ3Jj4DFSrJ/
	zOeD+NcIUCaQGOzZKYNTCFgk4axq29n4sjbFKF+ePwDCiSlK2YQPNjpo/mwkYdgAgDrgOlYH3Cj
	Mzet+zQ/U14hv7Viqq1VtVTwpg3yK2MvzfQ2zeQ==
X-Gm-Gg: ASbGncvwh8C11OnpsoxOuu1mF68k1BexEUmcTGsQPu6w+x+nH787Gm4stY8gEgWNguP
	ylV/hSVEzzCF2yFA0EvEQX8CF+oV8LWcUPLndapOAbiKSdxTPEiU0eqNjOvXTxMIQ/3wU+wQynX
	DySk5fh1vIUt4H8K1hTbfvBTIKLmKLNz8=
X-Google-Smtp-Source: AGHT+IE6dZiqGjVqQyApS4pbcBalFyHHbwwvSoEvnbF7u5bEK2A/GpSwhcwNVYs+CDOmzCE0rRDdqSfuQIhXOHmw+f0=
X-Received: by 2002:a05:622a:1a93:b0:494:6eed:37b1 with SMTP id
 d75a77b69052e-4948732d7bdmr32223981cf.7.1747127706802; Tue, 13 May 2025
 02:15:06 -0700 (PDT)
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
 <20250508155644.GM1035866@frogsfrogsfrogs>
In-Reply-To: <20250508155644.GM1035866@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 13 May 2025 11:14:55 +0200
X-Gm-Features: AX0GCFsg_IXaIo9w2jh-HmI1-M2cVqc9zT7I6qGhspawMoCH4j3pG6URFnq5ts0
Message-ID: <CAJfpegt4drCVNomOLqcU8JHM+qLrO1JwaQbp69xnGdjLn5O6wA@mail.gmail.com>
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

On Thu, 8 May 2025 at 17:56, Darrick J. Wong <djwong@kernel.org> wrote:

> Well right now my barely functional prototype exposes this interface
> for communicating mappings to the kernel.  I've only gotten as far as
> exposing the ->iomap_{begin,end} and ->iomap_ioend calls to the fuse
> server with no caching, because the only functions I've implemented so
> far are FIEMAP, SEEK_{DATA,HOLE}, and directio.
>
> So basically the kernel sends a FUSE_IOMAP_BEGIN command with the
> desired (pos, count) file range to the fuse server, which responds with
> a struct fuse_iomap_begin_out object that is translated into a struct
> iomap.
>
> The fuse server then responds with a read mapping and a write mapping,
> which tell the kernel from where to read data, and where to write data.

So far so good.

The iomap layer is non-caching, right?   This means that e.g. a
direct_io request spanning two extents will result in two separate
requests, since one FUSE_IOMAP_BEGIN can only return one extent.

And the next direct_io request may need to repeat the query for the
same extent as the previous one if the I/O boundary wasn't on the
extent boundary (which is likely).

So some sort of caching would make sense, but seeing the multitude of
FUSE_IOMAP_OP_ types I'm not clearly seeing how that would look.

> I'm a little confused, are you talking about FUSE_NOTIFY_INVAL_INODE?
> If so, then I think that's the wrong layer -- INVAL_INODE invalidates
> the page cache, whereas I'm talking about caching the file space
> mappings that iomap uses to construct bios for disk IO, and possibly
> wanting to invalidate parts of that cache to force the kernel to upcall
> the fuse server for a new mapping.

Maybe I'm confused, as the layering is not very clear in my head yet.

But in your example you did say that invalidation of data as well as
mapping needs to be invalidated, so I thought that the simplest thing
to do is to just invalidate the cached mapping from
FUSE_NOTIFY_INVAL_INODE as well.

Thanks,
Miklos
