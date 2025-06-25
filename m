Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1C345945;
	Wed, 25 Jun 2025 13:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859208; cv=none; b=o7gayX3gYhUWUwOY8oPR7vObd7iOHuIhhaZuWoJI52Eq346q7k4N7xe0O3VJEGic5+BcEr2TpACDhdCiXHQuEcaBfpHGUqYocF0IBWQqKX6ACOSgM4E++ABu0MTSCLzX+uQIzLbpSwx6B5WepXnshKEgH3WK+19KJSMTNveZEdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859208; c=relaxed/simple;
	bh=WoZyBxIx6KUGYNeE7NLxFY9awdIAVYhF6Zshu7fnZzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R75RrE5Em0z4saqz6Vv6W7mMO44ctmIRXfvz8HIZ55QvIgtJCIL1TJdrf45AUllrgWmwdY+ROk51I8PLRxut1A9d5Pz9wuxw9U1OFgSQal/wKRZ9YrSsi5Dl8O+M8Tnt2EP07oyc8kP87qq5CBjBrLL9dlKxhbAnFfgL6VcgSQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHaN0ytp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHaN0ytp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84245C4CEEA;
	Wed, 25 Jun 2025 13:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750859208;
	bh=WoZyBxIx6KUGYNeE7NLxFY9awdIAVYhF6Zshu7fnZzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHaN0ytpeX0jyMaxVJevvy8hUaw+jT5yJK5YTr/g20bSePuOkgfGORPvLhg3yP/Cn
	 vI11yEBN/pZ/Qm7l7yomKc8MtCnWZOa6Li+EyS8oM0Xm9RqMEzXGFo1WKzH/OA2Wgt
	 c42xFApvJJUn2DZjNziRZxwwVROzRjT43MOkRsi3OHfe1O000dL7e6+lAZG0LjNkfg
	 hikrC4xJKHHC5RW0WfqBS+fM65Eb7WdYJ7mYdem9/mr7R9p07d2snQZXpAJySL005B
	 ZQdJ6AQhzJIQP0WRXAxZxAhH0QJWJO06HPU67Zz4QvZ7J2HfpG8feIVKYecU2uXegt
	 Hk77+2WPVspSQ==
Date: Wed, 25 Jun 2025 16:46:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	jasonmiu@google.com, graf@amazon.com, changyuanl@google.com,
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net,
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com,
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org,
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev,
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com,
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
Message-ID: <aFv9sZj6e8RJldjZ@kernel.org>
References: <mafs0sek3n0x8.fsf@kernel.org>
 <20250617152357.GB1376515@ziepe.ca>
 <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
 <mafs05xgtw5wn.fsf@kernel.org>
 <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
 <aFLr7RDKraQk8Gvt@kernel.org>
 <CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
 <CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com>
 <aFkDBNpzcCNdqjm8@kernel.org>
 <CA+CK2bCWqiQ1375oCZ9DCkjAHccWfhYxx4zHHBkY4tgh8G3arw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bCWqiQ1375oCZ9DCkjAHccWfhYxx4zHHBkY4tgh8G3arw@mail.gmail.com>

On Mon, Jun 23, 2025 at 07:29:09AM -0400, Pasha Tatashin wrote:
> On Mon, Jun 23, 2025 at 3:32 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Wed, Jun 18, 2025 at 01:43:18PM -0400, Pasha Tatashin wrote:
> > > On Wed, Jun 18, 2025 at 1:00 PM Pasha Tatashin
> > >
> > > So currently, KHO provides the following two types of  internal API:
> > >
> > > Preserve memory and metadata
> > > =========================
> > > kho_preserve_folio() / kho_preserve_phys()
> > > kho_unpreserve_folio() / kho_unpreserve_phys()
> > > kho_restore_folio()
> > >
> > > kho_add_subtree() kho_retrieve_subtree()
> > >
> > > State machine
> > > ===========
> > > register_kho_notifier() / unregister_kho_notifier()
> > >
> > > kho_finalize() / kho_abort()
> > >
> > > We should remove the "State machine", and only keep the "Preserve
> > > Memory" API functions. At the time these functions are called, KHO
> > > should do the magic of making sure that the memory gets preserved
> > > across the reboot.
> > >
> > > This way, reserve_mem_init() would call: kho_preserve_folio() and
> > > kho_add_subtree() during boot, and be done with it.
> 
> For completeness, we also need `void kho_remove_substree(const char
> *name);`, currently, all trees are removed during kho_abort(). Let's
> rebase and include this patch on top of the next version of LUO, that
> we are exchanging off list, and send it together later this week.

Oh, here's what I've got:
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/tree/?h=luo/v1.1

It complies, passes basic KHO test and LUO selftest.
 
> Thanks,
> Pasha

-- 
Sincerely yours,
Mike.
