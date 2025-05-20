Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC5A254B17
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723664; cv=none; b=b/x+kmYd/1/SzEObStVHeZUBLdwKZnQ+F/EId9dhHhvfQWS69PqjCQoL1WHZiVe8fT8gKJOy6kr/uxLbdtLVhDmwUfCf2HKCPVRQ99Hxa0Y8H4XKqA4h7gzvvk2lsYkGN5q17xYUtnumjkqi0XkwnJA4uwBYhzFpfb7EqrD8ssY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723664; c=relaxed/simple;
	bh=n9eHYTR2G0ZOX2X+WcAxPwfwrHUt6xhEfBxV5W3ZGaU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gk9J5KM6ZZjqwd9snPUoQDpOwtw/GkhFMd8920rZ+7A8yIAlc67XXrYHgPuHWPZqff1g40t88JJENsw7quwRZlPJWWOhl1KKy7ZrO2mYA8kZldcw2NZFrersm9JiVe8wS9fiRoCgAitc1o4CUKnlL+iR4mPrndNT56OH1KqbDX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjeJfcbo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjeJfcbo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E6EC4CEE9;
	Tue, 20 May 2025 06:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723664;
	bh=n9eHYTR2G0ZOX2X+WcAxPwfwrHUt6xhEfBxV5W3ZGaU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AjeJfcboWc3Cvf46j/fHBWI9ENPs+NBSfbR6HNmDS5dFYzUnT2ZnHVGJVr5yrCiRr
	 lQD+RsXw/oYji5pHQynUafr2DOa1N8jMJrrYYKWfLBOu39KHgAS3OUZz6cdLFOtcLA
	 0vYAXJSGWIRZky7beBCJIYtSOzpOt2jXYS9EO8VwP/ajKlbpHQhH5Abm/CmwBwft+W
	 /UOYWwYY+XCSWzdhAlQITCCNqWptjyVClfhqkzkWwL/y+CgDuD0cUJRL6Mh7L9EuSa
	 /vclnZFd++vgbY3E9dsydVrqU5kFg9cMN2l0SlVoQC10Nfzue53p7+ggLAD/rjL0dB
	 de1OqFMDKAjuQ==
Date: Tue, 20 May 2025 08:47:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Gavin Shan <gshan@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 09/20] acpi/ghes: don't hard-code the number of
 sources for HEST table
Message-ID: <20250520084738.4dcf9cef@foz.lan>
In-Reply-To: <20250512154053-mutt-send-email-mst@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
	<1c024a700815fa4a100fc3bada477481fd266a83.1741374594.git.mchehab+huawei@kernel.org>
	<20250512154053-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 12 May 2025 15:42:27 -0400
"Michael S. Tsirkin" <mst@redhat.com> escreveu:

> On Fri, Mar 07, 2025 at 08:14:38PM +0100, Mauro Carvalho Chehab wrote:
> > The current code is actually dependent on having just one error
> > structure with a single source, as any change there would cause
> > migration issues.
> > 
> > As the number of sources should be arch-dependent, as it will depend on
> > what kind of notifications will exist, and how many errors can be
> > reported at the same time, change the logic to be more flexible,
> > allowing the number of sources to be defined when building the
> > HEST table by the caller.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Breaks CI:
> 
> https://gitlab.com/mstredhat/qemu/-/jobs/10007863974
> 
> I dropped the patchset for now, pls rebase and repost.

Compilation was happening fine for me. I suspect that some rebase
dropped a change here:

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index a256f9d817cd..a1492bcaeb8d 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2360,7 +2360,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SEA,
+                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
                                              paddr)) {
                     kvm_inject_arm_sea(c);
                 } else {

but somehow, ninja didn't detect and was keep using an already
compiled kvm.o object. Anyway, fixed at the new series:

	https://lore.kernel.org/qemu-devel/9404b305e0fefdb14dce4839c3d96ccedf0533e0.1747722973.git.mchehab+huawei@kernel.org/T/#u

And, just in case, I removed ./build directory and recompiled it
again.

Thanks,
Mauro
