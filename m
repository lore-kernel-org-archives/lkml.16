Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E220328
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743955; cv=none; b=eUjzmcaJnzg3HCN98x12TtYYcydxcxefGA9z212Ry09AqKRJFlzLQk9pY3yo4WGWFdiT0zq/pNICfrhLLxEjxHRQ2sIYuPVxWJskfbZqXNgld2RBPXdPpG3C9NKdcfu6b2HDnE9TOQcvyJJ2Glbd4tnmZgOFZNKbOe9nVF2TD0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743955; c=relaxed/simple;
	bh=10VOOs9OpZbgOc/7CEG+2dPlzikjuwLA+ThlPNmj5HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUd/A7Rq4Z0Yfxz15mh1LELZFXx/Uf5AN/WsncXCwX8HMUuXwwIvY00kLYBqs6pUhT1mNxa35n8djkxVJfvXrItiZKekCQkRmeEhCmoXPK1ZjWrTeJ9YmI0iwpZtkB2b4VAgxFJf+2QI/atAug/D06ydVJQPIThydWBH9aIPp0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fa2znJKV; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fa2znJKV"
Date: Tue, 20 May 2025 08:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747743940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3tTe7AZhcsLl1SFjFBWYt00FQokJCv6k4IfTZPHi9Gk=;
	b=fa2znJKViX8E2/nzL1p8DdYezYUsoHEk15n4AO9kEi+ClPGyobWI1DoqF7IwPkVmCQJLIc
	4A9gBcw3ziEUJlji3q1jSY1U+VDsqhfgiaKS7QVbp/cNLkqUI3iTdckj3aYF2K7v1P3199
	Y2nRlVc5VbJF4GRUtjzfmsmOxhj3aT0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Amir Goldstein <amir73il@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 0/6] overlayfs + casefolding
Message-ID: <osbsqlzkc4zttz4gxa25exm5bhqog3tpyirsezcbcdesaucd7g@4sltqny4ybnz>
References: <20250520051600.1903319-1-kent.overstreet@linux.dev>
 <CAOQ4uxg8p2Kg0BKrU4NSUzLVVLWcW=vLaw4kJkVR1Q-LyRbRXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxg8p2Kg0BKrU4NSUzLVVLWcW=vLaw4kJkVR1Q-LyRbRXA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, May 20, 2025 at 10:05:14AM +0200, Amir Goldstein wrote:
> On Tue, May 20, 2025 at 7:16 AM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> >
> > This series allows overlayfs and casefolding to safely be used on the
> > same filesystem by providing exclusion to ensure that overlayfs never
> > has to deal with casefolded directories.
> >
> > Currently, overlayfs can't be used _at all_ if a filesystem even
> > supports casefolding, which is really nasty for users.
> >
> > Components:
> >
> > - filesystem has to track, for each directory, "does any _descendent_
> >   have casefolding enabled"
> >
> > - new inode flag to pass this to VFS layer
> >
> > - new dcache methods for providing refs for overlayfs, and filesystem
> >   methods for safely clearing this flag
> >
> > - new superblock flag for indicating to overlayfs & dcache "filesystem
> >   supports casefolding, it's safe to use provided new dcache methods are
> >   used"
> >
> 
> I don't think that this is really needed.
> 
> Too bad you did not ask before going through the trouble of this implementation.
> 
> I think it is enough for overlayfs to know the THIS directory has no
> casefolding.

overlayfs works on trees, not directories...
