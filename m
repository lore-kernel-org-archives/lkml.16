Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DBE1C1F07
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256350; cv=none; b=UpwU/Av031CrLThL4jlzB9pZSMO3dRIPm9QV0jqysgIDYZIgOmx5SlNrmKMP7oYjcVj2aPn9Jl0AAoWaDvQbGf3rYsNeiQJNfT2gp/65A2qcZaJlT5y6ie2v9zmGG2FBizOnrnQsV1Z5VvxB4AKc4dLVFu5ZOBm/djm6XZGS8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256350; c=relaxed/simple;
	bh=dfL4nlbMLdAP59I+6QCGgFdazcwRm6epfOWNUj4NUKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7krpKJrpsPZjzhwG1DD26/HJyCGmNkaT7YIWk+H4H3cn+Lh+b7Ze8dNiSMXoLe+bd/6QUJ42oeeNrJmK66pGoR/6hMTJCworG31G7P6Xy/vdXSXz1yTnzSQri62cZLSs36RayEsiKdLOtjUNvNlMz1O4VbwRHQM1mf6bhNCqTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvASmW9J; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvASmW9J"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso8003424a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739256348; x=1739861148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iCVXdjUT/Nagf6N8WJWobsnGJpE6AKjG5V8TU6Lvk30=;
        b=AvASmW9JmfXt/ATawNlJCg88zCurki+0+1+daaKH6mqqmfUTl+PVWn9nMmew7658xJ
         6aaSS6C0yoz1plTYd3987BAFqicTM3jBenH3jRB+9WuuSN3W+gBywYytx6z377B/lBad
         LgFv/hXVGjg92PtNBCEXJ+Q9ihJ6xlwpl92kNVRGbX0ve/YFUcfwIkVPY2WQRQsjhuIp
         jRsNuKxnZNw0uSS8kRgS+TuESIc22nHAWOzgT4o3krGFuUR2up5I0CIQ5MSkJq1Li8iR
         BLtMISR2jcRFImJDZ0TAAX6O0bWNhnR9jvdkj1RiET00X0Au5bl1BLzxK8GWqdvSV+GJ
         n8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739256348; x=1739861148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCVXdjUT/Nagf6N8WJWobsnGJpE6AKjG5V8TU6Lvk30=;
        b=TFqd7xp4i4h7meBkcUw6FstHCSGCZ82iOeQZvqEmdvqKUBSsk2QhQaXXBl8MWe4e8j
         piwWjAzoPm4ljeKJFIulKBcoEicasQ7+nUTE02CjUPblS23c3YbbB6YoY2kzmUYvISyr
         8YqIsnvKex+ht2zmiG3+EMDUyglHcTXPGZSwhQfKKyKFQN2tI99ZshGJEQdYBGCJDq5h
         oON/fPGd6itqj+n3u6e1OeouXYQGFsvQDf0imqM9tKAW29rxZtODvz7PzoqjeoPHoNVG
         qIj8W/r0J6HHm8DaNITYqSASPHyLT1n/vzo4gk2+n0ylMYeYz8BHxNONZwVXfl6pTMpS
         qw3w==
X-Forwarded-Encrypted: i=1; AJvYcCU6YcnzvnQF55INBOHkJGbOqqr7FK0KVb8K4mqfNgKEWTCAVvje7Bfxrb9i5gztKcG8ELCzaZTxBIsDIEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFbeKBW+ufjphQDQJw6sxv45Bqbgz3z3ia7KWgMMVBlgp6h5J+
	CMwHo3DqSxgKk3QPlrrJknBsFn04+BZx0CeCBQGg9tnuJ2r7jExXPuWbVXF2
X-Gm-Gg: ASbGncvIFTh9mSdir7FnDFmMJXIiHiypjfaFk7nRaS+Up0A7LxQkexTtp73Dy7JzY68
	Fj0QCB+TkByo9lbMPlONa75tl8pKKQmgaMHe4YvmRxNTh9MbpGuOakwYOzHjKCT3GbH55XLW0Wo
	0rYD7xkDZJxQSu8mj9a4G1wOAxTbtJti/nXNGM42UtDqwl9EOU9gmGO6kCUkVbo9zbUqfdyazt4
	rqDfXBd0VIxRpf13uT8rz5OeuZPrKkB9f6HFNjsQHA5hDis5b+iKQyLDmoqdOSk5SP/XO9aAx/v
	BF5jOwJ35dVxr3LLPoCllGZsTifO/uLE
X-Google-Smtp-Source: AGHT+IGlOTa9EnjtQSV8dCkcWgXNikv0NjTSbu/EVIRJkA/Mo9cYXJynKQdXVOg66+Rhz4iZLpTBjw==
X-Received: by 2002:a17:90b:510e:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-2fa242e5c6amr23132070a91.27.1739256347892;
        Mon, 10 Feb 2025 22:45:47 -0800 (PST)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:fb40:c00e:5259:b412])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa21d230f0sm8192363a91.39.2025.02.10.22.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:45:47 -0800 (PST)
Date: Tue, 11 Feb 2025 14:45:43 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	jserv@ccns.ncku.edu.tw, skhan@linuxfoundation.org
Subject: Re: [PATCH] maple_tree: Remove redundant mte_to_node() in
 mte_dead_node()
Message-ID: <Z6ryF5ZvL8mxXt8F@vaxr-BM6660-BM6360>
References: <20250210083526.252955-1-richard120310@gmail.com>
 <j7vbmbqwapzfs4vnkb6jfbprmdwzzq6fu7jjpvcb3q5szdvh7s@p7p5ur2ivlts>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j7vbmbqwapzfs4vnkb6jfbprmdwzzq6fu7jjpvcb3q5szdvh7s@p7p5ur2ivlts>

On Mon, Feb 10, 2025 at 09:51:42AM -0500, Liam R. Howlett wrote:
> * I Hsin Cheng <richard120310@gmail.com> [250210 03:35]:
> 
> > In mte_dead_node(), it already assign "node" as "mte_to_node(enode)" in
> > the first place, calling "mte_parent(enode)" will result in the same
> > "mte_to_node(enode)" again which is redundant.
> 
> This is a very confusing way of saying "avoid calling mte_to_node() in
> the mte_parent() call by using the ma_dead_node() instead."
> 
> In fact, the subject is wrong as well, since the mte_to_node() was
> removed from the call path of mte_dead_node(), and not the function
> itself.
> 
> > 
> > Refactor mte_dead_node() and utilize ma_dead_node() to perform the
> > parent check without the redundant "mte_to_node()".
> > 
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> 
> The code looks right, but the subject and change log are not.  Please
> respin the patch, something like this:
> 
> maple_tree: Use ma_dead_node() in mte_dead_node()
> 
> Using ma_dead_node() in mte_dead_node() avoids decoding the maple enode
> for a second time to find the parent.
> 
> Feel free to change it as you'd like, but I couldn't follow what you
> meant.
> 
> > ---
> >  lib/maple_tree.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> > index f7153ade1be5..362f85c62678 100644
> > --- a/lib/maple_tree.c
> > +++ b/lib/maple_tree.c
> > @@ -584,13 +584,10 @@ static __always_inline bool ma_dead_node(const struct maple_node *node)
> >   */
> >  static __always_inline bool mte_dead_node(const struct maple_enode *enode)
> >  {
> > -	struct maple_node *parent, *node;
> > +	struct maple_node *node;
> >  
> >  	node = mte_to_node(enode);
> > -	/* Do not reorder reads from the node prior to the parent check */
> > -	smp_rmb();
> > -	parent = mte_parent(enode);
> > -	return (parent == node);
> > +	return ma_dead_node(node);
> >  }
> >  
> >  /*
> > -- 
> > 2.43.0
> >

Hello Liam,

Thanks for your kindly review!

> In fact, the subject is wrong as well, since the mte_to_node() was
> removed from the call path of mte_dead_node(), and not the function
> itself.

I see, I'll rephrase the whole commit and send a new patch later, what I
wrote is indeed too confusing. Thank you.

Best regards,
I Hsin Cheng


