Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C451A192D80;
	Sat,  8 Feb 2025 08:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739004108; cv=none; b=ijUsJ5t9j41HGmcyJbGN/A3v5YdCu+gsPLdXONAG8drkF4a3yBmKpuiUGBFkzZkaL3QE79svucyi1zIIXeJhzMW92Q4ox9Gr3D8oZJRAOxwG66+BTV+G7IoYT+2cB0cvN8Jr/NKKr9eTPmQdPCWmPE9PMyWUhuyB9xhGSMoBydI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739004108; c=relaxed/simple;
	bh=E5gL8dRYvMRUB4RhOkfU03fhf9gt76TJAgi4Xl3jmPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdtBZMJQNLmGNzivulNG1Gc2NGFbV2OIMObI9YM8HDxjJhD88xmyXkZZBJL7imZHp9K4fzd2Txc/6apelzwbhKBrLvl0uyXIO/7LSYR6lewP8R3Uyt1SgyT4AttcJAjIaTbhv9mdkVHhz/YsvyIaBlUjqmzcj+WsXC0Rz0zCjxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kREtqi2f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kREtqi2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F32C4CED6;
	Sat,  8 Feb 2025 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739004108;
	bh=E5gL8dRYvMRUB4RhOkfU03fhf9gt76TJAgi4Xl3jmPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kREtqi2fggdaHb5LdxuUlbR8DBCUpVZQneZJk5djPdcuD+zlfrwy3Afe7zNEJkUwF
	 ye9iA/JXQY7uM39/BkEOyuNNl7kCmFofLB6/wn6/edGIcq1WdQ288cMsymsQxm7kb+
	 93CgoBcP7Hc2cGSaJm0AtBwEdpM0WeYSJrDhd/f7fz3J8WZJHeUn08YMbyOCVrTbSH
	 LcisQvIvzKkLvkq+PrRq1rJdfYPnyfJ20e74GmlHoSlat/YjuOlllltnOzHb/Dyjlk
	 fm3BQpq17SSse+gB8/aFVhCbARUcCRdCOequOBW1EwRZ8L2VCtatJigrLrZnp23Ks+
	 NNu8GFJ88NvUw==
Date: Sat, 8 Feb 2025 10:41:27 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
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
Message-ID: <Z6cYt8QryoUfI0wc@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>
 <CA+CK2bD6204AKWGOgzLMiMsnVZ=tk+DGc+VWgi3RVt2byaLJJA@mail.gmail.com>
 <Z6a1kxR2GlQoepgI@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6a1kxR2GlQoepgI@MiWiFi-R3L-srv>

Hi Baoquan,

On Sat, Feb 08, 2025 at 09:38:27AM +0800, Baoquan He wrote:
> On 02/06/25 at 08:28pm, Pasha Tatashin wrote:
> > On Thu, Feb 6, 2025 at 7:29 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > > On Thu,  6 Feb 2025 15:27:40 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> > >
> > > > This a next version of Alex's "kexec: Allow preservation of ftrace buffers"
> > > > series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.com),
> > > > just to make things simpler instead of ftrace we decided to preserve
> > > > "reserve_mem" regions.
> > > >
> > > > The patches are also available in git:
> > > > https://git.kernel.org/rppt/h/kho/v4
> > > >
> > > >
> > > > Kexec today considers itself purely a boot loader: When we enter the new
> > > > kernel, any state the previous kernel left behind is irrelevant and the
> > > > new kernel reinitializes the system.
> > >
> > > I tossed this into mm.git for some testing and exposure.
> > >
> > > What merge path are you anticipating?
> > >
> > > Review activity seems pretty thin thus far?
> > 
> > KHO is going to be discussed at the upcoming lsfmm, we are also
> > planning to send v5 of this patch series (discussed with Mike
> > Rapoport) in a couple of weeks. It will include enhancements needed
> > for the hypervisor live update scenario:
> 
> So is this V4 still a RFC if v5 will be sent by plan? Should we hold the
> reviewing until v5? Or this series is a infrustructure building, v5 will
> add more details as you listed as below. I am a little confused.

v4 adds the very basic support for kexec handover in the simplest form we
could think of. There were discussions on Linux MM Alignment and Hypervisor
live update meetings and there people agreed about MVP for KHO that v4
essentially implements.

v5 will add more details on top of v4 and I'm not sure there's a consensus
about some of them among the people involved in KHO.
 
> > 1. Allow nodes to be added to the KHO tree at any time
> > 2. Remove "activate" (I will also send a live update framework that
> > provides the activate functionality).
> > 3. Allow serialization during shutdown.
> > 4. Decouple KHO from kexec_file_load(), as kexec_file_load() should
> > not be used during live update blackout time.
> > 5. Enable multithreaded serialization by using hash-table as an
> > intermediate step before conversion to FDT.
> 

-- 
Sincerely yours,
Mike.
