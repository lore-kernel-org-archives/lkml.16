Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FAB482EF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748863697; cv=none; b=S2KZuWKGJ9ioPBNirZmChVz1Codv1TJqceU23P+6DmzQpu+wsCa7VeKoXtqODipG4Hn3+QEeDm62f0vge/a3TYVzS71R2dH3Od6Q9GL5neBXnh48Vr/tqNwywDm5w8jOi5V48huqcPVAJcJvAlL4jSsEKuxTA6xYKoYzmsqB88o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748863697; c=relaxed/simple;
	bh=VmXDOPNS8/S6TCwAzvLV43piHsMOAAZNLSlKbNUhKb0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bgzRr8gB1wV59EgnbS+/dKfA8fkGjjfCT6BwQjjwGazJ48KjlSppQaHI6BRL01vCNPN9SK4808/2K0jEOd7TY1JzFxhgJBgHzdrt+HCw+j5oYYyR4VkopvQ84hErazTzaopalrKp7CYTBKBteLMxFW/6uDJH5PshiZ8d+G9KkgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ry/2PQ3o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ry/2PQ3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365D0C4CEEB;
	Mon,  2 Jun 2025 11:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748863694;
	bh=VmXDOPNS8/S6TCwAzvLV43piHsMOAAZNLSlKbNUhKb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ry/2PQ3obPGxGRr4fOPfhplXyQHvWO+zARHGGd3it7hjrz5lClSZzhRZfnV8F9ll3
	 tQ4UzIvX3Ac9fEUeidWDRExcRJcZH4rMv8yROHc8FJqc4RdoPvbvOgB1Gv1N7YtVrB
	 47fMI9tOZERbgsrOPWHpuASvbqqFkuXm4RwHtLuS+NIjXDpJcEOOzO3OQllZyZ7o84
	 ooZpAoHUtlBxZGld3AAOPc9KL5DxtSNy4b1bzuQh9PspXGg2ukQ+yNJ2ZbfGdCT9co
	 VcoYkHL6ZrBTnQZbAuAlkt6LIBmcEt1CX7Zlz4btbaHcYmtA8cKy9VJLFhtCJeUfo9
	 y9REGJHxInNqA==
Date: Mon, 2 Jun 2025 13:28:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 12/20] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250602132436.1e0e83aa@foz.lan>
In-Reply-To: <20250602122244.081a1960@imammedo.users.ipa.redhat.com>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
	<aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
	<20250528174212.2823d3de@imammedo.users.ipa.redhat.com>
	<20250530080120-mutt-send-email-mst@kernel.org>
	<20250530164903.0f9f8444@imammedo.users.ipa.redhat.com>
	<20250530221810.694ce02e@foz.lan>
	<20250602122244.081a1960@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 2 Jun 2025 12:22:44 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Fri, 30 May 2025 22:18:10 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Fri, 30 May 2025 16:49:03 +0200
> > Igor Mammedov <imammedo@redhat.com> escreveu:
> >   
> > > On Fri, 30 May 2025 08:01:28 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >     
> > > > On Wed, May 28, 2025 at 05:42:12PM +0200, Igor Mammedov wrote:      
> > > > > On Tue, 20 May 2025 08:41:31 +0200
> > > > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > > >         
> > > > > > Create a new property (x-has-hest-addr) and use it to detect if
> > > > > > the GHES table offsets can be calculated from the HEST address
> > > > > > (qemu 10.0 and upper) or via the legacy way via an offset obtained
> > > > > > from the hardware_errors firmware file.        
> > > > > 
> > > > > 
> > > > > it doesn't apply to current master anymore        
> > > > 
> > > > indeed. Mauro?      
> > > 
> > > Michael,
> > > it's trivial conflict in machine compat,
> > > could you fix it up while applying?    
> > 
> > IMHO, that's the best. The thing is, as code gets merged upstream with
> > backports, conflicts happen.
> > 
> > I can re-send the series, if you prefer, as I'm keeping it rebasing it
> > from time to time at:
> > 	https://gitlab.com/mchehab_kernel/qemu/-/tree/qemu_submitted?ref_type=heads
> > 
> > (it is on the top of upstream/master)
> > 
> > But even that might have conflicts on your test tree if you pick
> > other patches touching this backport table:
> >   
> > > -GlobalProperty hw_compat_10_0[] = {};
> > > +GlobalProperty hw_compat_10_0[] = {
> > > +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
> > > +};    
> > 
> > (this was the code when I sent the PR. When applying upstream,
> > such hunk is now(*):
> > 
> >  GlobalProperty hw_compat_10_0[] = {
> >      { "scsi-hd", "dpofua", "off" },
> > +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
> >  };
> > 
> > 
> > (*) https://gitlab.com/mchehab_kernel/qemu/-/commit/08c4859f8c6f36d7dccf2b773be88847e5d1fe0c
> > 
> > If you still prefer that I resubmit the entire PR, let me know.  
> 
> If it's the only patch that needs rebase and doesn't affect the rest,
> I'd say there is no need to spam the list with whole series respin, 
> just post rebased v10 12/20 as reply here
> 
> If it's more than that, respin series.

This is the only patch with conflicts. I'll send a v10 of it.

> 
> > 
> > Regards,
> > Mauro
> >   
> 



Thanks,
Mauro
