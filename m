Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F181392
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 03:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739070498; cv=none; b=sAlhe2rV3iPEdDQ7V/Juw18eGBA4rn+6+p28NS9G/PRsO9RI4k82Rf1VtGXyik869fT1mV55i426ttU1O7xDfxzHFkuKKXlEaSGClTtBhFeFfR6TkN/Y49yexV8QXlJ8cvQFDWCVQ/F08fdMmFDFB4PWALH8f4a2W54GIVbdBA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739070498; c=relaxed/simple;
	bh=RkMp4uO6m0ygwDbBIBNp9CIWLeDzbb31N8KH0fOsshk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAC5Dyy0cVKeK/5UKOoJ+eqlFYKaHn+z6z6CEGEh0eIV94ufd/fHAbMO011ffhIQMU5xqUfUbTdgerhFIEEPqX3bLJLMkXWv0XqsWlpDOV9m3bc23Uxh+I8OkRloBMbmVKSp0J74r3HMytLexVyUvYyMXRmqrvhvXSBCY/YXlb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AYv6noQO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AYv6noQO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739070494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j31g1VoN7O4XuCmDiX3R+x/Ync3MiakZ5YN14frwoaw=;
	b=AYv6noQO8jAZ4JAxcYIjX9TbwGDzUHg4SLFhgZx1wCzjktDLoxe+GIFRQ1K4n0Ql39o4fd
	TMWy+C9+ssZPanATfaM4XoawgeGV/3++l1ybaZ1DN11pHhnSKKEdkx7xWw7hrD4ro63o/b
	F/jOFWt1iwYMhuX4dxVYJiUEmnidv3M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-527--0UWXAPWP4aY9sz5uQfGng-1; Sat,
 08 Feb 2025 22:08:10 -0500
X-MC-Unique: -0UWXAPWP4aY9sz5uQfGng-1
X-Mimecast-MFC-AGG-ID: -0UWXAPWP4aY9sz5uQfGng
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC58C1800360;
	Sun,  9 Feb 2025 03:08:03 +0000 (UTC)
Received: from localhost (unknown [10.72.112.28])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 48D321800265;
	Sun,  9 Feb 2025 03:08:00 +0000 (UTC)
Date: Sun, 9 Feb 2025 11:07:53 +0800
From: Baoquan He <bhe@redhat.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Alexander Graf <graf@amazon.com>, Andy Lutomirski <luto@kernel.org>,
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
Message-ID: <Z6gcCTBTceixz7yq@MiWiFi-R3L-srv>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>
 <CA+CK2bD6204AKWGOgzLMiMsnVZ=tk+DGc+VWgi3RVt2byaLJJA@mail.gmail.com>
 <Z6a1kxR2GlQoepgI@MiWiFi-R3L-srv>
 <CA+CK2bDgP2DfsfVAhQhFhBiNJFUS1n17oX9KgC1JFXAk76j01Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bDgP2DfsfVAhQhFhBiNJFUS1n17oX9KgC1JFXAk76j01Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 02/08/25 at 07:23pm, Pasha Tatashin wrote:
> On Fri, Feb 7, 2025 at 8:38 PM Baoquan He <bhe@redhat.com> wrote:
> >
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
> We will modify the existing patches and send as v5 because some
> interfaces are going to be changed*.
> 
> Otherwise, v5 will make KHO a lot more flexible as it will allow to
> use the tree all the time while the system is running instead of only
> once during the activation phase.
> 
> * Changing interfaces  is optional, but decision whether to change
> will be discussed at Hypervisor Live Update on Feb 10th:
> https://lore.kernel.org/all/26a4b7ca-93a6-30e2-923b-f551ced03d62@google.com/


Ah, this is what I would like to know about the difference between v4
and v5. Thanks for the information, and looking forward to seeing the v5
update.

> 
> >
> > >
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

