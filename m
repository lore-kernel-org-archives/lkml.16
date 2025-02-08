Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178E218A6A6
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739013226; cv=none; b=slH9pAtstWoCYNG8GTmduc5LM3J0f1ZFfeL4mjnsSDMlSwumtVan2/zBfZ2EAgsSpQ9VZHoIvYhNzAzJ4c0MqYwFjxqyVMc3Orap8M+4EJZJX12bhpit/yAmF13dtmqeMS/PKTNVK5Ie+cky75o5cnJnIsphtOP5XtO4ws1VEFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739013226; c=relaxed/simple;
	bh=zNTqRPImJ92nz+c0YeK4LqJ1stJKDQ9br/TFYbHj1Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHu2RS4+tt/0Hl2pigrYN7gLjpZO8C9apaa7cDJCUmUeYXZu9bT43/7PT1XE+upWXTWRyTId84W1/0+G8rJzkBcTct/dUKm05h1wmRjeVPkHdoMzBy/UZCl0DEd5NEEM3r1XjuUnAdb2OqSNCSKBP084Ka+wW2LrTyBaczGgBXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QYxeq4YK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QYxeq4YK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739013224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yd9C+xXA2LYK4yay23tEJLHcwK0FQNJYR+yHMEQ6ia4=;
	b=QYxeq4YKdWwP+Sl22+Fa2owq8vOWjDfVl61AY8Ygpafg5kW7bU3QcG27Anae8Ma8oqmO2Q
	wHlDJ7+dCrp2Gu53yqs9+WfL5iTtaQQlv/XhCJsKfp6D5dHZ/qShY6QDY/l0jd4F5TLBX1
	EubpWZNS9C8RyeL0RtVd3jGdWt1ypYw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-548-9tRamBlGP6-FTEK_1JuOMQ-1; Sat,
 08 Feb 2025 06:13:40 -0500
X-MC-Unique: 9tRamBlGP6-FTEK_1JuOMQ-1
X-Mimecast-MFC-AGG-ID: 9tRamBlGP6-FTEK_1JuOMQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EAF631955DD0;
	Sat,  8 Feb 2025 11:13:34 +0000 (UTC)
Received: from localhost (unknown [10.72.112.25])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A2B1619560A3;
	Sat,  8 Feb 2025 11:13:29 +0000 (UTC)
Date: Sat, 8 Feb 2025 19:13:25 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	changyuanl@google.com
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
Message-ID: <Z6c8VeXqV1s+aPXY@fedora>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>
 <CA+CK2bD6204AKWGOgzLMiMsnVZ=tk+DGc+VWgi3RVt2byaLJJA@mail.gmail.com>
 <Z6a1kxR2GlQoepgI@MiWiFi-R3L-srv>
 <Z6cYt8QryoUfI0wc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6cYt8QryoUfI0wc@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 02/08/25 at 10:41am, Mike Rapoport wrote:
> Hi Baoquan,
> 
> On Sat, Feb 08, 2025 at 09:38:27AM +0800, Baoquan He wrote:
> > On 02/06/25 at 08:28pm, Pasha Tatashin wrote:
> > > On Thu, Feb 6, 2025 at 7:29 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > > >
> > > > On Thu,  6 Feb 2025 15:27:40 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> > > >
> > > > > This a next version of Alex's "kexec: Allow preservation of ftrace buffers"
> > > > > series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.com),
> > > > > just to make things simpler instead of ftrace we decided to preserve
> > > > > "reserve_mem" regions.
> > > > >
> > > > > The patches are also available in git:
> > > > > https://git.kernel.org/rppt/h/kho/v4
> > > > >
> > > > >
> > > > > Kexec today considers itself purely a boot loader: When we enter the new
> > > > > kernel, any state the previous kernel left behind is irrelevant and the
> > > > > new kernel reinitializes the system.
> > > >
> > > > I tossed this into mm.git for some testing and exposure.
> > > >
> > > > What merge path are you anticipating?
> > > >
> > > > Review activity seems pretty thin thus far?
> > > 
> > > KHO is going to be discussed at the upcoming lsfmm, we are also
> > > planning to send v5 of this patch series (discussed with Mike
> > > Rapoport) in a couple of weeks. It will include enhancements needed
> > > for the hypervisor live update scenario:
> > 
> > So is this V4 still a RFC if v5 will be sent by plan? Should we hold the
> > reviewing until v5? Or this series is a infrustructure building, v5 will
> > add more details as you listed as below. I am a little confused.
> 
> v4 adds the very basic support for kexec handover in the simplest form we
> could think of. There were discussions on Linux MM Alignment and Hypervisor
> live update meetings and there people agreed about MVP for KHO that v4
> essentially implements.
> 
> v5 will add more details on top of v4 and I'm not sure there's a consensus
> about some of them among the people involved in KHO.

Thanks for the information.

Then I will apply v4 and learn the infrastructure and mechanism firstly.

While what sounds more meaningful to me is v4 can be reviewed, then updated
and merged. Then another patchset can be posted to add details, if you have
reached the consensus on the infrastructure part. With that, posting and
reviewing will be much easier. Unless you guys are still discussing the
infrastructure part.

>  
> > > 1. Allow nodes to be added to the KHO tree at any time
> > > 2. Remove "activate" (I will also send a live update framework that
> > > provides the activate functionality).
> > > 3. Allow serialization during shutdown.
> > > 4. Decouple KHO from kexec_file_load(), as kexec_file_load() should
> > > not be used during live update blackout time.
> > > 5. Enable multithreaded serialization by using hash-table as an
> > > intermediate step before conversion to FDT.
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

