Received: from ombertech.com (ombertech.com [74.48.158.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE6333E1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.48.158.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744064379; cv=none; b=lJfYIT7loLcnIdebsK5QOR0vnLBwpDTng+P1RKGQ4PESCP+7FBTPnm37bLHaGGCzyq6gsM5UZTSxyrLuvLnPgf3zBeGeqku7fL2gXDd110uL2itKKWp8tC2kXNmKls1F2Bz6IiH7V01hMiNcRcaoSf7gysqpMPZDJXRe/CNMlCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744064379; c=relaxed/simple;
	bh=9RYcwfi9OWFIA4tTmXrTgshenclo4cCNO7OnCXuKIvU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rzYaQsfPVkiS3cgwfmfIi0zjP7j7WO/bnJyjkzf1Qf9F3eC2ExjmWBpGIR0ZsW0zl+569RwZMxnYidtCVMrJMVsOeDl0t/erzT3xi4Dry8gV68nVbWRnar57tZ2kLIoe4rq9FCg85GIFZXdA9Y7rmXkNcsF1veNqB2OYj4VzLfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com; spf=pass smtp.mailfrom=ombertech.com; dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b=FzFmP1jn; arc=none smtp.client-ip=74.48.158.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ombertech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b="FzFmP1jn"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ombertech.com; s=2022;
	t=1744064082; bh=9RYcwfi9OWFIA4tTmXrTgshenclo4cCNO7OnCXuKIvU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FzFmP1jn1nudEZu0+LYTYzg3lwRbj4fFqoi13uDrIRAfL2MjztjZymkfGvCvj21Kl
	 ay/FceA35SN0XlZY4Wvixpb+HgPkaWb4Rie4BgdidCJf7A64EXShQr4IDXP80DcBh8
	 gAPvG2xJdLjxhVQeNGagoJ7YdcLo4SKEp34vg5LbKSWJyu75P2JcT510wRzCcJebF4
	 A11dgxft1h1fqTO1TzUAnnxjYD9QAfYRmEcoB4OecwsGRHlOOIZplT5RenmwJkiZm8
	 x3T/xNb47IB3AfcICP1s+jJEOtI4Teo4Qp6EBevCUtlTg7WnjX6lsE1LWejryWz5T4
	 yMhB2Yd5z4qkg==
Received: from 192.168.1.100 (unknown [1.145.134.47])
	by ombertech.com (Postfix) with ESMTPSA id 0D3B1603CC;
	Mon,  7 Apr 2025 22:14:39 +0000 (UTC)
Date: Tue, 8 Apr 2025 09:20:16 +1000
From: Kevin Koster <lkml@ombertech.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-Id: <20250408092016.27c8ec942a82459e1a9b9997@ombertech.com>
In-Reply-To: <A08760B5-0E1A-4D21-8621-73516D1D67F0@zytor.com>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
	<20250405130306.ca9822c1f27db119cc973603@ombertech.com>
	<20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
	<20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
	<20250406174633.2c581923c145687476191753@ombertech.com>
	<20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
	<20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
	<20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
	<20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
	<A08760B5-0E1A-4D21-8621-73516D1D67F0@zytor.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 07 Apr 2025 07:38:59 -0700
"H. Peter Anvin" <hpa@zytor.com> wrote:
> Can you please not post stack traces without any symbol information
> either internal or external? It is just random hex digits in the
> absence of a System.map or vmlinux file.

OK, I'll replace them with "[snip stack trace]" in future unless asked
for the System.map file too.
