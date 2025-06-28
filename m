Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F8D8635D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 08:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751098757; cv=none; b=mNmbOzroKQrJPdw+EWmS7aQkdJFnO6KnP+GwaFl9Jw+UKkiWOCjC2tzVT9O5MiY61VnX87w+2f26YwjzyXYWX0eLXbbKLC6/wg7ZjvGQBJ7bPnOA+GRrqWBvltrLsbUfchR2wV6SgZvgrGsxWdL7PyEsoE4m2Ni3kgGmQehH1qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751098757; c=relaxed/simple;
	bh=kWeQEBkGz4f2k7+bgpN5NBO5qLlK9Xf3YPzocVL7GKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZL46t0IDzYWZ74CnS336rjLgzFfyxFmcl6DlxleXHOaqcVyWfn9K8WlMxHBdkwK8UHWAASilFDM0dfgCU88YOaVCvqKBsUVooM8/6bLZvWPCOS6xlPL9+4hUajI7UMYa810zJO8t8ODdlkA0sc6lJAF0wNspw655SLIAJqi32s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=LTCDH8q0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="LTCDH8q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751098748;
	bh=kWeQEBkGz4f2k7+bgpN5NBO5qLlK9Xf3YPzocVL7GKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTCDH8q0oEtiSdXSZpTV0lq16MHxuoZOBdZ57gyrQgWDUvJs5oEQMXiX/Lcczii1y
	 IOrNHK+dWVAaVCvT+a1cV42TL2oMPBYVgjeaVs/opbKHLgUn10QmkYLTv0i0QtiE/X
	 GkmGbPW/4uRjG5s6otFSZC9nkVYzBppFpmqueH+w=
Date: Sat, 28 Jun 2025 10:19:07 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 1/6] sysfs: attribute_group: allow registration of const
 attribute
Message-ID: <3d4c063e-e56d-466c-a3a7-58566bf1da3c@t-8ch.de>
References: <20250116-sysfs-const-attr-prep-v1-0-15e72dba4205@weissschuh.net>
 <20250116-sysfs-const-attr-prep-v1-1-15e72dba4205@weissschuh.net>
 <2025011714-skeleton-bring-3e77@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025011714-skeleton-bring-3e77@gregkh>

Hi Greg,

On 2025-01-17 08:01:00+0100, Greg Kroah-Hartman wrote:
> On Thu, Jan 16, 2025 at 06:32:27PM +0100, Thomas Weißschuh wrote:
> > To be able to constify instances of struct attribute it has to be
> > possible to add them to struct attribute_group.
> > The current type of the attrs member however is not compatible with that.
> > Introduce a union that allows registration of both const and non-const
> > attributes to enable a piecewise transition.
> > As both union member types are compatible no logic needs to be adapted.
> > 
> > Technically it is now possible register a const struct
> > attribute and receive it as mutable pointer in the callbacks.
> > This is a soundness issue.
> > But this same soundness issue already exists today in
> > sysfs_create_file().
> > Also the struct definition and callback implementation are always
> > closely linked and are meant to be moved to const in lockstep.
> > 
> > Similar to commit 906c508afdca ("sysfs: attribute_group: allow registration of const bin_attribute")
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >  include/linux/sysfs.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> > index 0f2fcd244523f050c5286f19d4fe1846506f9214..f5e25bed777a6a6e717f10973f1abcd12111f5c5 100644
> > --- a/include/linux/sysfs.h
> > +++ b/include/linux/sysfs.h
> > @@ -105,7 +105,10 @@ struct attribute_group {
> >  	size_t			(*bin_size)(struct kobject *,
> >  					    const struct bin_attribute *,
> >  					    int);
> > -	struct attribute	**attrs;
> > +	union {
> > +		struct attribute	**attrs;
> > +		const struct attribute	*const *attrs_new;
> > +	};
> 
> I'm all for the idea, BUT, let's finish up doing this one:
> 
> >  	union {
> >  		struct bin_attribute		**bin_attrs;
> >  		const struct bin_attribute	*const *bin_attrs_new;
> 
> first please.
> 
> That way we can see just how "easy" the switch from _new to not-new goes :)

I'd like to resend these preparatory patches so they go into v6.17-rc1
and I can work on the follow-up changes.
In my opinion the switch from _new will work nicely. There have been no
new users of _new in -next at all.

Any objections?


Thomas
