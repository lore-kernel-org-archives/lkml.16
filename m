Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149B71990C1;
	Fri,  7 Feb 2025 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915622; cv=none; b=fjB4VXQoGsmHrDR8BQtl1wckquzD2dorKMTZFsb9Uh1nn2KyZy4P3salp91uxszGQjOrx7V4c+OFYxzNIzTNYwmXxlHV9a63sZhplFzh0xkn79NSExnRchlDz91XJT4IaAZlRCJHtw74RN/9MpRER51fSkKzFh/6zA3p5aK57UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915622; c=relaxed/simple;
	bh=gmvjh4dkLXQWB/aNPOCFxhvy4MCVdZfnnTa23d2Vqx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyLsPPhqh1o+pvU8FdizsdHFQOnZBmL6rM3k2LjqjsPFDqu7fP5b7ib+l6QKln3WzKFQg4JCnnlOo9tuM/ruE1Ia1LebrVoFDjtSWsQAEZLZMSQxrWpSO0OqQjKu5KJhwgftE1NPYRYtyvzMDGwvQ/A/LSkjhoEIbJv7k8rLIJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9hGFt1M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9hGFt1M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3BEC4CED1;
	Fri,  7 Feb 2025 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738915621;
	bh=gmvjh4dkLXQWB/aNPOCFxhvy4MCVdZfnnTa23d2Vqx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9hGFt1MT9MudOB8G3xhPsgVkPL13CsGiEUsLxyCU38gOEui2kZK2TRDIJuOwNn9d
	 3LIB+f8dOdcZerYT7pIiLFGBBv3bhQdSSBnOKrJ3b1XwzaZvoXfU1qYQIWj0ngmh69
	 p//fwX1B1vzkSXX3A5dH7nIbzFPmXcKnMSPSs5YWDWVpC1BuLcz0KBpWZZXW+CkvwE
	 UObo9g70YkW+RiyeycGMCSps8itwC4ifzY34sO99kkNeTyp5bijklQEj0VbqEndkq5
	 ZKExFJOSeC4i1Y+VcMCFjWcQ06zZUJ33AFWJ1Q88KJo74WN355g5NTlF4Nz5ZJaFaH
	 CKchBYGyDprFw==
Date: Fri, 7 Feb 2025 10:06:41 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>,
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
	Pasha Tatashin <pasha.tatashin@soleen.com>,
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
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
Message-ID: <Z6W_EcyPO5lBbCKZ@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>

On Thu, Feb 06, 2025 at 04:29:39PM -0800, Andrew Morton wrote:
> On Thu,  6 Feb 2025 15:27:40 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > This a next version of Alex's "kexec: Allow preservation of ftrace buffers"
> > series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.com),
> > just to make things simpler instead of ftrace we decided to preserve
> > "reserve_mem" regions.
> > 
> > The patches are also available in git:
> > https://git.kernel.org/rppt/h/kho/v4
> > 
> > 
> > Kexec today considers itself purely a boot loader: When we enter the new
> > kernel, any state the previous kernel left behind is irrelevant and the
> > new kernel reinitializes the system.
> 
> I tossed this into mm.git for some testing and exposure.
> 
> What merge path are you anticipating?

I think your tree is the most appropriate, but let's wait for Acks from x86
and arm64 people ;-)

> Review activity seems pretty thin thus far?

Yeah :(
Maybe with Pasha's version on top of that we'll have more people reviewing.

And here is another fixup for a sparse error kbuild reported:


From e1e34b96b96b89a01ee31be223c8dfc2ce1c4cbe Mon Sep 17 00:00:00 2001
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Fri, 7 Feb 2025 09:55:03 +0200
Subject: [PATCH] kho: make bin_attr_dt_kern static

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 kernel/kexec_handover.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index c26753d613cb..c21ea2a09d47 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -258,7 +258,7 @@ static ssize_t dt_read(struct file *file, struct kobject *kobj,
 	return count;
 }
 
-struct bin_attribute bin_attr_dt_kern = __BIN_ATTR(dt, 0400, dt_read, NULL, 0);
+static struct bin_attribute bin_attr_dt_kern = __BIN_ATTR(dt, 0400, dt_read, NULL, 0);
 
 static int kho_expose_dt(void *fdt)
 {
-- 
2.47.2


-- 
Sincerely yours,
Mike.
