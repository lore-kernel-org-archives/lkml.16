Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE982798EA
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636297; cv=none; b=max2dsMV+c0MglLn8LnXg88K3g5OJkWaoZo0QBtsLxZwCFU6qvci/BrsnxBLak2fasi5ODptgGmvR1CWvg2CgPyxVdpd4whWX5UM/dkbZ7iVecrHDHsiotNaEkr00igsqvYFm/uSXHHWtGIGkHKS/fqaNRPXHcxTj//LL9S4vk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636297; c=relaxed/simple;
	bh=gD4OE8mGUgFikae1GLGN4X9YkI2G5QLIpQiO20Ua8Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJ9AXqa1du8DHflky4wFcZL9dgsPclEpAonP/VHYBqhG7zDwOALawPzsHFe5Ox5arENKx5hjz/yKJcJHsryIhB9C3Eni2Pw/fpezkHoCOBrMonorPUeIYuvZVVl0C4ygyAmqVL0LYnl0yPLXlMl9UvhZ12aIqoaLeBJptVyFihc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItY80usA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItY80usA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077D6C4CEE9;
	Fri, 30 May 2025 20:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748636297;
	bh=gD4OE8mGUgFikae1GLGN4X9YkI2G5QLIpQiO20Ua8Eo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ItY80usAQwQa/V4EOFuzUL2OBmBnHjgkUrDNB181AvSdwC8INWh823XFJjMlNL5nS
	 XkIviVDRfnwSF5BkbT3VoDQJlGSg0QdGJYU0mJniMkxJxzkOI0/II2pzYh3XBZpCAN
	 Noogt39otuzayagT1RqWAnwBRdF/uZA7hNtUfiD7wE5x66QL/h4+y4KHYwJPsfHObw
	 OKKgjqXX5dzAFLcs7xWOaoTGLUslmED6EzwsFDyR5hPiy3N7ct51hBuNUSuZLEiBVP
	 BpXV1LCUpAvD95BwGjT+9sRZaiGSIoH3Nk9EqJ9q6VFmqsLBunBbkdog7XlDck+33f
	 E45JMJZ1WTHQg==
Date: Fri, 30 May 2025 22:18:10 +0200
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
Message-ID: <20250530221810.694ce02e@foz.lan>
In-Reply-To: <20250530164903.0f9f8444@imammedo.users.ipa.redhat.com>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
	<aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
	<20250528174212.2823d3de@imammedo.users.ipa.redhat.com>
	<20250530080120-mutt-send-email-mst@kernel.org>
	<20250530164903.0f9f8444@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 30 May 2025 16:49:03 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Fri, 30 May 2025 08:01:28 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, May 28, 2025 at 05:42:12PM +0200, Igor Mammedov wrote:  
> > > On Tue, 20 May 2025 08:41:31 +0200
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >     
> > > > Create a new property (x-has-hest-addr) and use it to detect if
> > > > the GHES table offsets can be calculated from the HEST address
> > > > (qemu 10.0 and upper) or via the legacy way via an offset obtained
> > > > from the hardware_errors firmware file.    
> > > 
> > > 
> > > it doesn't apply to current master anymore    
> > 
> > indeed. Mauro?  
> 
> Michael,
> it's trivial conflict in machine compat,
> could you fix it up while applying?

IMHO, that's the best. The thing is, as code gets merged upstream with
backports, conflicts happen.

I can re-send the series, if you prefer, as I'm keeping it rebasing it
from time to time at:
	https://gitlab.com/mchehab_kernel/qemu/-/tree/qemu_submitted?ref_type=heads

(it is on the top of upstream/master)

But even that might have conflicts on your test tree if you pick
other patches touching this backport table:

> -GlobalProperty hw_compat_10_0[] = {};
> +GlobalProperty hw_compat_10_0[] = {
> +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
> +};

(this was the code when I sent the PR. When applying upstream,
such hunk is now(*):

 GlobalProperty hw_compat_10_0[] = {
     { "scsi-hd", "dpofua", "off" },
+    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
 };


(*) https://gitlab.com/mchehab_kernel/qemu/-/commit/08c4859f8c6f36d7dccf2b773be88847e5d1fe0c

If you still prefer that I resubmit the entire PR, let me know.

Regards,
Mauro
