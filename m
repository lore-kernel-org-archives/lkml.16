Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76343267725
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213161; cv=none; b=iIYw6c5bgln5gfGX6mt2apczOgBuf3+a40xrOAA5HxDr6w2yNo+Q/F7FszaI0xewDBbS4bp+Cthd4RjZcA7lu9shUOWcMCHa8cpf1OxTNGNgESJWr5XNUaA13OJ1FG+yj7hwTW90i9kVLlwP8L4BBbtsNwFBQmnbLRNWzBW8Bn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213161; c=relaxed/simple;
	bh=lxBQ9cwd5DCQ5HQfHv+bRT4vwSSfuOjJAZtJVntcOLU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RRurl/90fQctcFnFLUU4ZH6CNjk0sRFfibnqzJHiHqWvU+vhjx9lmXBDFD+o+EYnnoSUwscHSJgigfV+yngMYxNUVtpFtEKXZ7pjxIOdHdtfemd8zgKewPwveawVDY+li1QaYNg8LqCIVVgtcjPu7llFqOKlIwheC9KI03EkqGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=s+sgG9JZ; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="s+sgG9JZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9OZUpIaocGRTLad1iJGiWrNp/X3/o2DOCVb6eOe0H4A=;
  b=s+sgG9JZVLdf2dbtl9ofnAFyiNPz9MozpUX3ORWGDoiDOgJBfKmBiYsO
   wOKADbNnp34qMbfgJQxchmbCuKuSUkHQiZVY7lVe4HtoVNh31RtbxqrOt
   29PdoWiGJenH3w0YmnGWzALGrPOyxjltOdUU1T6vJed7lMVG+ZHoHQMit
   k=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,200,1739833200"; 
   d="scan'208";a="217159805"
Received: from 74-95-99-105-richmond.hfc.comcastbusiness.net (HELO hadrien) ([74.95.99.105])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 17:39:15 +0200
Date: Wed, 9 Apr 2025 11:39:13 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Erick Karanja <karanja99erick@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: Improve code readability
In-Reply-To: <4cf642ebb8d0859676230bae06a4914a57428ec3.camel@gmail.com>
Message-ID: <a97e7851-31f7-e493-fe1a-749f27c879f0@inria.fr>
References: <cover.1744192642.git.karanja99erick@gmail.com>  <97a2637f3ccefb3de0e15fd04f29f5f209f2a506.1744192642.git.karanja99erick@gmail.com>  <3dda7f97-4ed8-cf6d-9310-60ed6259a386@inria.fr> <4cf642ebb8d0859676230bae06a4914a57428ec3.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-420250004-1744213155=:3226"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-420250004-1744213155=:3226
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

> > > @@ -729,10 +721,9 @@ static void hal_ReadEFuse_WiFi(
> > >  		}
> > >
> > >  		if (offset < EFUSE_MAX_SECTION_8723B) {
> > > -			u16 addr;
> > > +			u16 addr = offset * PGPKT_DATA_SIZE;
> > >  			/*  Get word enable value from PG header
> > > */
> > >
> > > -			addr = offset * PGPKT_DATA_SIZE;
> >
> > I'm not sure about this one, due to the comment.
> Hello Julia, I have observed in some scenarios where the semantic patch
> deletes the comments that exist between the declaration and
> initialization which I think it's not okay and in this scenario where
> the comments are left dangling such as this. How do I go about this
> instances.
> Thank you.

Making the right choice depends on the semantics of the comment, which is
out of the scope of Coccinelle.  Generally, if a complete block of code is
dropped, any comments within it are dropped as well.  Here the comment is
kept, which seems reasonable.  The issue is that you may have moved code
that is relevant to the comment up above the comment.  Ultimately, you have
to decide what to do and what not to do.  If you let Coccinelle make a
patch, and then apply the patch, in the meantime you can just remove the
parts of the patch you don't like.  If you make the changes in place, you
can use git add -p to add the changes you like, and not add the others, and
then use git checkout to remove the changes you don't want to do.  I would
take the former approach, but some people may take the latter.

julia
--8323329-420250004-1744213155=:3226--
