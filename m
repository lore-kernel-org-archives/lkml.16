Received: from ombertech.com (ombertech.com [74.48.158.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C999259C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.48.158.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185093; cv=none; b=p1nOukj2yB/Eslvqb3h1Nr3rx1N5CammWqT0iLf10p2KnV4iWrYFw7zRmnwjYMEXCiInioRldayvVDDXZgpa5/R36bNH9wJO+hGMnv+6DWR8veEETtNajBWH2uGcfaa2HNowfeJN3RFAzUyqMpTlGvWwcr5WawYWKPUugtdeKeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185093; c=relaxed/simple;
	bh=x10FCqq6FdHm66tWp0o1nT4aMz6Ln7EyKNbhujAdyv0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TfiqvxXz6/wVeqpExbJy6UIOXupummKMvXrPoNVDkaRjUzcnHgcBif4+VCY+zTOVkdnnkRVk4jeShubXGy+DxHRJUNvhQ9APrQKrAzH3w5oPf2q8htn7kFMYc4VJzqUV2Pp3A7ulDwKu55uPkRtSIgrdKzlFHT4a0K+S2J0MRRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com; spf=pass smtp.mailfrom=ombertech.com; dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b=oFlC4M4g; arc=none smtp.client-ip=74.48.158.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ombertech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b="oFlC4M4g"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ombertech.com; s=2022;
	t=1744184786; bh=x10FCqq6FdHm66tWp0o1nT4aMz6Ln7EyKNbhujAdyv0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oFlC4M4gkREtD/yD9svs3zQ/12SB960XQbEVCogVXECcCM3HyIZ2nzzYL6CLTl0s1
	 Wg1CMeR75RQF8COsHOGpGWlqBlA1lssvwH/3eKtZBTluxrG44UPTJz2rFtl9muTZs/
	 GoSONbDZ7pR3dWm63wer1XJl8gU42JAIok0Sn9wPd/OhaEVHoC9jzVIRw/PV/6Eiuw
	 OwZeOJi+sYBzQFje1TcFMaNKNzgfutPM6cY+iEvU2F+fe1YgRBBhM2EB08KqwvTRy1
	 pUgnCgNvE65ljllOaj593ZlH7d5T6on56UWy2QsRDvjeedSdcxCrnb9Nt85i5Goj4H
	 4kr+nT2jYfIvg==
Received: from 192.168.1.100 (unknown [1.145.198.63])
	by ombertech.com (Postfix) with ESMTPSA id 7E1355EBC9;
	Wed,  9 Apr 2025 07:46:24 +0000 (UTC)
Date: Wed, 9 Apr 2025 17:51:15 +1000
From: Kevin Koster <lkml@ombertech.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Oerg866 <oerg866@googlemail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Consolidate the loader enablement
Message-Id: <20250409175115.9b8050d4a23f328a14c174ad@ombertech.com>
In-Reply-To: <20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
	<20250405130306.ca9822c1f27db119cc973603@ombertech.com>
	<20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
	<20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
	<20250406174633.2c581923c145687476191753@ombertech.com>
	<20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
	<20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
	<20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
	<20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
	<20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
	<20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Apr 2025 19:22:50 +0200
Borislav Petkov <bp@alien8.de> wrote:

> Fixes: 4c585af7180c1 ("x86/boot/32: Temporarily map initrd for
> microcode loading")

Boots fine on my AM486DX2-66 and Cx486DX4-100 PCs.

Thank you!
